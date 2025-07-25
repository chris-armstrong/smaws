open Smaws_Lib
open Types
let make_put_request ~item:(item_ : put_item_input_attribute_map) () =
  ({ item = item_ } : put_request)
let make_delete_request ~key:(key_ : key) () =
  ({ key = key_ } : delete_request)
let make_write_request
  ?delete_request:(delete_request_ : delete_request option)
  ?put_request:(put_request_ : put_request option) () =
  ({ delete_request = delete_request_; put_request = put_request_ } : 
  write_request)
let make_time_to_live_specification
  ~attribute_name:(attribute_name_ : string) ~enabled:(enabled_ : bool) () =
  ({ attribute_name = attribute_name_; enabled = enabled_ } : time_to_live_specification)
let make_update_time_to_live_output
  ?time_to_live_specification:(time_to_live_specification_ :
                                time_to_live_specification option)
  () =
  ({ time_to_live_specification = time_to_live_specification_ } : update_time_to_live_output)
let make_update_time_to_live_input
  ~time_to_live_specification:(time_to_live_specification_ :
                                time_to_live_specification)
  ~table_name:(table_name_ : string) () =
  ({
     time_to_live_specification = time_to_live_specification_;
     table_name = table_name_
   } : update_time_to_live_input)
let make_auto_scaling_target_tracking_scaling_policy_configuration_description
  ?scale_out_cooldown:(scale_out_cooldown_ : int option)
  ?scale_in_cooldown:(scale_in_cooldown_ : int option)
  ?disable_scale_in:(disable_scale_in_ : bool option)
  ~target_value:(target_value_ : float) () =
  ({
     target_value = target_value_;
     scale_out_cooldown = scale_out_cooldown_;
     scale_in_cooldown = scale_in_cooldown_;
     disable_scale_in = disable_scale_in_
   } : auto_scaling_target_tracking_scaling_policy_configuration_description)
let make_auto_scaling_policy_description
  ?target_tracking_scaling_policy_configuration:(target_tracking_scaling_policy_configuration_
                                                  :
                                                  auto_scaling_target_tracking_scaling_policy_configuration_description
                                                    option)
  ?policy_name:(policy_name_ : string option) () =
  ({
     target_tracking_scaling_policy_configuration =
       target_tracking_scaling_policy_configuration_;
     policy_name = policy_name_
   } : auto_scaling_policy_description)
let make_auto_scaling_settings_description
  ?scaling_policies:(scaling_policies_ :
                      auto_scaling_policy_description list option)
  ?auto_scaling_role_arn:(auto_scaling_role_arn_ : string option)
  ?auto_scaling_disabled:(auto_scaling_disabled_ : bool option)
  ?maximum_units:(maximum_units_ : int option)
  ?minimum_units:(minimum_units_ : int option) () =
  ({
     scaling_policies = scaling_policies_;
     auto_scaling_role_arn = auto_scaling_role_arn_;
     auto_scaling_disabled = auto_scaling_disabled_;
     maximum_units = maximum_units_;
     minimum_units = minimum_units_
   } : auto_scaling_settings_description)
let make_replica_global_secondary_index_auto_scaling_description
  ?provisioned_write_capacity_auto_scaling_settings:(provisioned_write_capacity_auto_scaling_settings_
                                                      :
                                                      auto_scaling_settings_description
                                                        option)
  ?provisioned_read_capacity_auto_scaling_settings:(provisioned_read_capacity_auto_scaling_settings_
                                                     :
                                                     auto_scaling_settings_description
                                                       option)
  ?index_status:(index_status_ : index_status option)
  ?index_name:(index_name_ : string option) () =
  ({
     provisioned_write_capacity_auto_scaling_settings =
       provisioned_write_capacity_auto_scaling_settings_;
     provisioned_read_capacity_auto_scaling_settings =
       provisioned_read_capacity_auto_scaling_settings_;
     index_status = index_status_;
     index_name = index_name_
   } : replica_global_secondary_index_auto_scaling_description)
let make_replica_auto_scaling_description
  ?replica_status:(replica_status_ : replica_status option)
  ?replica_provisioned_write_capacity_auto_scaling_settings:(replica_provisioned_write_capacity_auto_scaling_settings_
                                                              :
                                                              auto_scaling_settings_description
                                                                option)
  ?replica_provisioned_read_capacity_auto_scaling_settings:(replica_provisioned_read_capacity_auto_scaling_settings_
                                                             :
                                                             auto_scaling_settings_description
                                                               option)
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              replica_global_secondary_index_auto_scaling_description
                                list option)
  ?region_name:(region_name_ : string option) () =
  ({
     replica_status = replica_status_;
     replica_provisioned_write_capacity_auto_scaling_settings =
       replica_provisioned_write_capacity_auto_scaling_settings_;
     replica_provisioned_read_capacity_auto_scaling_settings =
       replica_provisioned_read_capacity_auto_scaling_settings_;
     global_secondary_indexes = global_secondary_indexes_;
     region_name = region_name_
   } : replica_auto_scaling_description)
let make_table_auto_scaling_description
  ?replicas:(replicas_ : replica_auto_scaling_description list option)
  ?table_status:(table_status_ : table_status option)
  ?table_name:(table_name_ : string option) () =
  ({
     replicas = replicas_;
     table_status = table_status_;
     table_name = table_name_
   } : table_auto_scaling_description)
let make_update_table_replica_auto_scaling_output
  ?table_auto_scaling_description:(table_auto_scaling_description_ :
                                    table_auto_scaling_description option)
  () =
  ({ table_auto_scaling_description = table_auto_scaling_description_ } : 
  update_table_replica_auto_scaling_output)
let make_auto_scaling_target_tracking_scaling_policy_configuration_update
  ?scale_out_cooldown:(scale_out_cooldown_ : int option)
  ?scale_in_cooldown:(scale_in_cooldown_ : int option)
  ?disable_scale_in:(disable_scale_in_ : bool option)
  ~target_value:(target_value_ : float) () =
  ({
     target_value = target_value_;
     scale_out_cooldown = scale_out_cooldown_;
     scale_in_cooldown = scale_in_cooldown_;
     disable_scale_in = disable_scale_in_
   } : auto_scaling_target_tracking_scaling_policy_configuration_update)
let make_auto_scaling_policy_update
  ?policy_name:(policy_name_ : string option)
  ~target_tracking_scaling_policy_configuration:(target_tracking_scaling_policy_configuration_
                                                  :
                                                  auto_scaling_target_tracking_scaling_policy_configuration_update)
  () =
  ({
     target_tracking_scaling_policy_configuration =
       target_tracking_scaling_policy_configuration_;
     policy_name = policy_name_
   } : auto_scaling_policy_update)
let make_auto_scaling_settings_update
  ?scaling_policy_update:(scaling_policy_update_ :
                           auto_scaling_policy_update option)
  ?auto_scaling_role_arn:(auto_scaling_role_arn_ : string option)
  ?auto_scaling_disabled:(auto_scaling_disabled_ : bool option)
  ?maximum_units:(maximum_units_ : int option)
  ?minimum_units:(minimum_units_ : int option) () =
  ({
     scaling_policy_update = scaling_policy_update_;
     auto_scaling_role_arn = auto_scaling_role_arn_;
     auto_scaling_disabled = auto_scaling_disabled_;
     maximum_units = maximum_units_;
     minimum_units = minimum_units_
   } : auto_scaling_settings_update)
let make_global_secondary_index_auto_scaling_update
  ?provisioned_write_capacity_auto_scaling_update:(provisioned_write_capacity_auto_scaling_update_
                                                    :
                                                    auto_scaling_settings_update
                                                      option)
  ?index_name:(index_name_ : string option) () =
  ({
     provisioned_write_capacity_auto_scaling_update =
       provisioned_write_capacity_auto_scaling_update_;
     index_name = index_name_
   } : global_secondary_index_auto_scaling_update)
let make_replica_global_secondary_index_auto_scaling_update
  ?provisioned_read_capacity_auto_scaling_update:(provisioned_read_capacity_auto_scaling_update_
                                                   :
                                                   auto_scaling_settings_update
                                                     option)
  ?index_name:(index_name_ : string option) () =
  ({
     provisioned_read_capacity_auto_scaling_update =
       provisioned_read_capacity_auto_scaling_update_;
     index_name = index_name_
   } : replica_global_secondary_index_auto_scaling_update)
let make_replica_auto_scaling_update
  ?replica_provisioned_read_capacity_auto_scaling_update:(replica_provisioned_read_capacity_auto_scaling_update_
                                                           :
                                                           auto_scaling_settings_update
                                                             option)
  ?replica_global_secondary_index_updates:(replica_global_secondary_index_updates_
                                            :
                                            replica_global_secondary_index_auto_scaling_update
                                              list option)
  ~region_name:(region_name_ : string) () =
  ({
     replica_provisioned_read_capacity_auto_scaling_update =
       replica_provisioned_read_capacity_auto_scaling_update_;
     replica_global_secondary_index_updates =
       replica_global_secondary_index_updates_;
     region_name = region_name_
   } : replica_auto_scaling_update)
let make_update_table_replica_auto_scaling_input
  ?replica_updates:(replica_updates_ :
                     replica_auto_scaling_update list option)
  ?provisioned_write_capacity_auto_scaling_update:(provisioned_write_capacity_auto_scaling_update_
                                                    :
                                                    auto_scaling_settings_update
                                                      option)
  ?global_secondary_index_updates:(global_secondary_index_updates_ :
                                    global_secondary_index_auto_scaling_update
                                      list option)
  ~table_name:(table_name_ : string) () =
  ({
     replica_updates = replica_updates_;
     provisioned_write_capacity_auto_scaling_update =
       provisioned_write_capacity_auto_scaling_update_;
     table_name = table_name_;
     global_secondary_index_updates = global_secondary_index_updates_
   } : update_table_replica_auto_scaling_input)
let make_attribute_definition
  ~attribute_type:(attribute_type_ : scalar_attribute_type)
  ~attribute_name:(attribute_name_ : string) () =
  ({ attribute_type = attribute_type_; attribute_name = attribute_name_ } : 
  attribute_definition)
let make_key_schema_element ~key_type:(key_type_ : key_type)
  ~attribute_name:(attribute_name_ : string) () =
  ({ key_type = key_type_; attribute_name = attribute_name_ } : key_schema_element)
let make_provisioned_throughput_description
  ?write_capacity_units:(write_capacity_units_ : int option)
  ?read_capacity_units:(read_capacity_units_ : int option)
  ?number_of_decreases_today:(number_of_decreases_today_ : int option)
  ?last_decrease_date_time:(last_decrease_date_time_ :
                             CoreTypes.Timestamp.t option)
  ?last_increase_date_time:(last_increase_date_time_ :
                             CoreTypes.Timestamp.t option)
  () =
  ({
     write_capacity_units = write_capacity_units_;
     read_capacity_units = read_capacity_units_;
     number_of_decreases_today = number_of_decreases_today_;
     last_decrease_date_time = last_decrease_date_time_;
     last_increase_date_time = last_increase_date_time_
   } : provisioned_throughput_description)
let make_billing_mode_summary
  ?last_update_to_pay_per_request_date_time:(last_update_to_pay_per_request_date_time_
                                              : CoreTypes.Timestamp.t option)
  ?billing_mode:(billing_mode_ : billing_mode option) () =
  ({
     last_update_to_pay_per_request_date_time =
       last_update_to_pay_per_request_date_time_;
     billing_mode = billing_mode_
   } : billing_mode_summary)
let make_projection
  ?non_key_attributes:(non_key_attributes_ : string list option)
  ?projection_type:(projection_type_ : projection_type option) () =
  ({
     non_key_attributes = non_key_attributes_;
     projection_type = projection_type_
   } : projection)
let make_local_secondary_index_description
  ?index_arn:(index_arn_ : string option)
  ?item_count:(item_count_ : int option)
  ?index_size_bytes:(index_size_bytes_ : int option)
  ?projection:(projection_ : projection option)
  ?key_schema:(key_schema_ : key_schema_element list option)
  ?index_name:(index_name_ : string option) () =
  ({
     index_arn = index_arn_;
     item_count = item_count_;
     index_size_bytes = index_size_bytes_;
     projection = projection_;
     key_schema = key_schema_;
     index_name = index_name_
   } : local_secondary_index_description)
let make_on_demand_throughput
  ?max_write_request_units:(max_write_request_units_ : int option)
  ?max_read_request_units:(max_read_request_units_ : int option) () =
  ({
     max_write_request_units = max_write_request_units_;
     max_read_request_units = max_read_request_units_
   } : on_demand_throughput)
let make_global_secondary_index_description
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?index_arn:(index_arn_ : string option)
  ?item_count:(item_count_ : int option)
  ?index_size_bytes:(index_size_bytes_ : int option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput_description option)
  ?backfilling:(backfilling_ : bool option)
  ?index_status:(index_status_ : index_status option)
  ?projection:(projection_ : projection option)
  ?key_schema:(key_schema_ : key_schema_element list option)
  ?index_name:(index_name_ : string option) () =
  ({
     on_demand_throughput = on_demand_throughput_;
     index_arn = index_arn_;
     item_count = item_count_;
     index_size_bytes = index_size_bytes_;
     provisioned_throughput = provisioned_throughput_;
     backfilling = backfilling_;
     index_status = index_status_;
     projection = projection_;
     key_schema = key_schema_;
     index_name = index_name_
   } : global_secondary_index_description)
let make_stream_specification
  ?stream_view_type:(stream_view_type_ : stream_view_type option)
  ~stream_enabled:(stream_enabled_ : bool) () =
  ({ stream_view_type = stream_view_type_; stream_enabled = stream_enabled_ } : 
  stream_specification)
let make_provisioned_throughput_override
  ?read_capacity_units:(read_capacity_units_ : int option) () =
  ({ read_capacity_units = read_capacity_units_ } : provisioned_throughput_override)
let make_on_demand_throughput_override
  ?max_read_request_units:(max_read_request_units_ : int option) () =
  ({ max_read_request_units = max_read_request_units_ } : on_demand_throughput_override)
let make_replica_global_secondary_index_description
  ?on_demand_throughput_override:(on_demand_throughput_override_ :
                                   on_demand_throughput_override option)
  ?provisioned_throughput_override:(provisioned_throughput_override_ :
                                     provisioned_throughput_override option)
  ?index_name:(index_name_ : string option) () =
  ({
     on_demand_throughput_override = on_demand_throughput_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     index_name = index_name_
   } : replica_global_secondary_index_description)
let make_table_class_summary
  ?last_update_date_time:(last_update_date_time_ :
                           CoreTypes.Timestamp.t option)
  ?table_class:(table_class_ : table_class option) () =
  ({
     last_update_date_time = last_update_date_time_;
     table_class = table_class_
   } : table_class_summary)
let make_replica_description
  ?replica_table_class_summary:(replica_table_class_summary_ :
                                 table_class_summary option)
  ?replica_inaccessible_date_time:(replica_inaccessible_date_time_ :
                                    CoreTypes.Timestamp.t option)
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              replica_global_secondary_index_description list
                                option)
  ?on_demand_throughput_override:(on_demand_throughput_override_ :
                                   on_demand_throughput_override option)
  ?provisioned_throughput_override:(provisioned_throughput_override_ :
                                     provisioned_throughput_override option)
  ?kms_master_key_id:(kms_master_key_id_ : string option)
  ?replica_status_percent_progress:(replica_status_percent_progress_ :
                                     string option)
  ?replica_status_description:(replica_status_description_ : string option)
  ?replica_status:(replica_status_ : replica_status option)
  ?region_name:(region_name_ : string option) () =
  ({
     replica_table_class_summary = replica_table_class_summary_;
     replica_inaccessible_date_time = replica_inaccessible_date_time_;
     global_secondary_indexes = global_secondary_indexes_;
     on_demand_throughput_override = on_demand_throughput_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     kms_master_key_id = kms_master_key_id_;
     replica_status_percent_progress = replica_status_percent_progress_;
     replica_status_description = replica_status_description_;
     replica_status = replica_status_;
     region_name = region_name_
   } : replica_description)
let make_restore_summary
  ?source_table_arn:(source_table_arn_ : string option)
  ?source_backup_arn:(source_backup_arn_ : string option)
  ~restore_in_progress:(restore_in_progress_ : bool)
  ~restore_date_time:(restore_date_time_ : CoreTypes.Timestamp.t) () =
  ({
     restore_in_progress = restore_in_progress_;
     restore_date_time = restore_date_time_;
     source_table_arn = source_table_arn_;
     source_backup_arn = source_backup_arn_
   } : restore_summary)
let make_sse_description
  ?inaccessible_encryption_date_time:(inaccessible_encryption_date_time_ :
                                       CoreTypes.Timestamp.t option)
  ?kms_master_key_arn:(kms_master_key_arn_ : string option)
  ?sse_type:(sse_type_ : sse_type option)
  ?status:(status_ : sse_status option) () =
  ({
     inaccessible_encryption_date_time = inaccessible_encryption_date_time_;
     kms_master_key_arn = kms_master_key_arn_;
     sse_type = sse_type_;
     status = status_
   } : sse_description)
let make_archival_summary
  ?archival_backup_arn:(archival_backup_arn_ : string option)
  ?archival_reason:(archival_reason_ : string option)
  ?archival_date_time:(archival_date_time_ : CoreTypes.Timestamp.t option) ()
  =
  ({
     archival_backup_arn = archival_backup_arn_;
     archival_reason = archival_reason_;
     archival_date_time = archival_date_time_
   } : archival_summary)
let make_table_description
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?deletion_protection_enabled:(deletion_protection_enabled_ : bool option)
  ?table_class_summary:(table_class_summary_ : table_class_summary option)
  ?archival_summary:(archival_summary_ : archival_summary option)
  ?sse_description:(sse_description_ : sse_description option)
  ?restore_summary:(restore_summary_ : restore_summary option)
  ?replicas:(replicas_ : replica_description list option)
  ?global_table_version:(global_table_version_ : string option)
  ?latest_stream_arn:(latest_stream_arn_ : string option)
  ?latest_stream_label:(latest_stream_label_ : string option)
  ?stream_specification:(stream_specification_ : stream_specification option)
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              global_secondary_index_description list option)
  ?local_secondary_indexes:(local_secondary_indexes_ :
                             local_secondary_index_description list option)
  ?billing_mode_summary:(billing_mode_summary_ : billing_mode_summary option)
  ?table_id:(table_id_ : string option)
  ?table_arn:(table_arn_ : string option)
  ?item_count:(item_count_ : int option)
  ?table_size_bytes:(table_size_bytes_ : int option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput_description option)
  ?creation_date_time:(creation_date_time_ : CoreTypes.Timestamp.t option)
  ?table_status:(table_status_ : table_status option)
  ?key_schema:(key_schema_ : key_schema_element list option)
  ?table_name:(table_name_ : string option)
  ?attribute_definitions:(attribute_definitions_ :
                           attribute_definition list option)
  () =
  ({
     on_demand_throughput = on_demand_throughput_;
     deletion_protection_enabled = deletion_protection_enabled_;
     table_class_summary = table_class_summary_;
     archival_summary = archival_summary_;
     sse_description = sse_description_;
     restore_summary = restore_summary_;
     replicas = replicas_;
     global_table_version = global_table_version_;
     latest_stream_arn = latest_stream_arn_;
     latest_stream_label = latest_stream_label_;
     stream_specification = stream_specification_;
     global_secondary_indexes = global_secondary_indexes_;
     local_secondary_indexes = local_secondary_indexes_;
     billing_mode_summary = billing_mode_summary_;
     table_id = table_id_;
     table_arn = table_arn_;
     item_count = item_count_;
     table_size_bytes = table_size_bytes_;
     provisioned_throughput = provisioned_throughput_;
     creation_date_time = creation_date_time_;
     table_status = table_status_;
     key_schema = key_schema_;
     table_name = table_name_;
     attribute_definitions = attribute_definitions_
   } : table_description)
let make_update_table_output
  ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : update_table_output)
let make_provisioned_throughput
  ~write_capacity_units:(write_capacity_units_ : int)
  ~read_capacity_units:(read_capacity_units_ : int) () =
  ({
     write_capacity_units = write_capacity_units_;
     read_capacity_units = read_capacity_units_
   } : provisioned_throughput)
let make_update_global_secondary_index_action
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput option)
  ~index_name:(index_name_ : string) () =
  ({
     on_demand_throughput = on_demand_throughput_;
     provisioned_throughput = provisioned_throughput_;
     index_name = index_name_
   } : update_global_secondary_index_action)
let make_create_global_secondary_index_action
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput option)
  ~projection:(projection_ : projection)
  ~key_schema:(key_schema_ : key_schema_element list)
  ~index_name:(index_name_ : string) () =
  ({
     on_demand_throughput = on_demand_throughput_;
     provisioned_throughput = provisioned_throughput_;
     projection = projection_;
     key_schema = key_schema_;
     index_name = index_name_
   } : create_global_secondary_index_action)
let make_delete_global_secondary_index_action
  ~index_name:(index_name_ : string) () =
  ({ index_name = index_name_ } : delete_global_secondary_index_action)
let make_global_secondary_index_update
  ?delete:(delete_ : delete_global_secondary_index_action option)
  ?create:(create_ : create_global_secondary_index_action option)
  ?update:(update_ : update_global_secondary_index_action option) () =
  ({ delete = delete_; create = create_; update = update_ } : global_secondary_index_update)
let make_sse_specification
  ?kms_master_key_id:(kms_master_key_id_ : string option)
  ?sse_type:(sse_type_ : sse_type option) ?enabled:(enabled_ : bool option)
  () =
  ({
     kms_master_key_id = kms_master_key_id_;
     sse_type = sse_type_;
     enabled = enabled_
   } : sse_specification)
let make_replica_global_secondary_index
  ?on_demand_throughput_override:(on_demand_throughput_override_ :
                                   on_demand_throughput_override option)
  ?provisioned_throughput_override:(provisioned_throughput_override_ :
                                     provisioned_throughput_override option)
  ~index_name:(index_name_ : string) () =
  ({
     on_demand_throughput_override = on_demand_throughput_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     index_name = index_name_
   } : replica_global_secondary_index)
let make_create_replication_group_member_action
  ?table_class_override:(table_class_override_ : table_class option)
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              replica_global_secondary_index list option)
  ?on_demand_throughput_override:(on_demand_throughput_override_ :
                                   on_demand_throughput_override option)
  ?provisioned_throughput_override:(provisioned_throughput_override_ :
                                     provisioned_throughput_override option)
  ?kms_master_key_id:(kms_master_key_id_ : string option)
  ~region_name:(region_name_ : string) () =
  ({
     table_class_override = table_class_override_;
     global_secondary_indexes = global_secondary_indexes_;
     on_demand_throughput_override = on_demand_throughput_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     kms_master_key_id = kms_master_key_id_;
     region_name = region_name_
   } : create_replication_group_member_action)
let make_update_replication_group_member_action
  ?table_class_override:(table_class_override_ : table_class option)
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              replica_global_secondary_index list option)
  ?on_demand_throughput_override:(on_demand_throughput_override_ :
                                   on_demand_throughput_override option)
  ?provisioned_throughput_override:(provisioned_throughput_override_ :
                                     provisioned_throughput_override option)
  ?kms_master_key_id:(kms_master_key_id_ : string option)
  ~region_name:(region_name_ : string) () =
  ({
     table_class_override = table_class_override_;
     global_secondary_indexes = global_secondary_indexes_;
     on_demand_throughput_override = on_demand_throughput_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     kms_master_key_id = kms_master_key_id_;
     region_name = region_name_
   } : update_replication_group_member_action)
let make_delete_replication_group_member_action
  ~region_name:(region_name_ : string) () =
  ({ region_name = region_name_ } : delete_replication_group_member_action)
let make_replication_group_update
  ?delete:(delete_ : delete_replication_group_member_action option)
  ?update:(update_ : update_replication_group_member_action option)
  ?create:(create_ : create_replication_group_member_action option) () =
  ({ delete = delete_; update = update_; create = create_ } : replication_group_update)
let make_update_table_input
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?deletion_protection_enabled:(deletion_protection_enabled_ : bool option)
  ?table_class:(table_class_ : table_class option)
  ?replica_updates:(replica_updates_ : replication_group_update list option)
  ?sse_specification:(sse_specification_ : sse_specification option)
  ?stream_specification:(stream_specification_ : stream_specification option)
  ?global_secondary_index_updates:(global_secondary_index_updates_ :
                                    global_secondary_index_update list option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput option)
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?attribute_definitions:(attribute_definitions_ :
                           attribute_definition list option)
  ~table_name:(table_name_ : string) () =
  ({
     on_demand_throughput = on_demand_throughput_;
     deletion_protection_enabled = deletion_protection_enabled_;
     table_class = table_class_;
     replica_updates = replica_updates_;
     sse_specification = sse_specification_;
     stream_specification = stream_specification_;
     global_secondary_index_updates = global_secondary_index_updates_;
     provisioned_throughput = provisioned_throughput_;
     billing_mode = billing_mode_;
     table_name = table_name_;
     attribute_definitions = attribute_definitions_
   } : update_table_input)
let make_update_kinesis_streaming_configuration
  ?approximate_creation_date_time_precision:(approximate_creation_date_time_precision_
                                              :
                                              approximate_creation_date_time_precision
                                                option)
  () =
  ({
     approximate_creation_date_time_precision =
       approximate_creation_date_time_precision_
   } : update_kinesis_streaming_configuration)
let make_update_kinesis_streaming_destination_output
  ?update_kinesis_streaming_configuration:(update_kinesis_streaming_configuration_
                                            :
                                            update_kinesis_streaming_configuration
                                              option)
  ?destination_status:(destination_status_ : destination_status option)
  ?stream_arn:(stream_arn_ : string option)
  ?table_name:(table_name_ : string option) () =
  ({
     update_kinesis_streaming_configuration =
       update_kinesis_streaming_configuration_;
     destination_status = destination_status_;
     stream_arn = stream_arn_;
     table_name = table_name_
   } : update_kinesis_streaming_destination_output)
let make_update_kinesis_streaming_destination_input
  ?update_kinesis_streaming_configuration:(update_kinesis_streaming_configuration_
                                            :
                                            update_kinesis_streaming_configuration
                                              option)
  ~stream_arn:(stream_arn_ : string) ~table_name:(table_name_ : string) () =
  ({
     update_kinesis_streaming_configuration =
       update_kinesis_streaming_configuration_;
     stream_arn = stream_arn_;
     table_name = table_name_
   } : update_kinesis_streaming_destination_input)
let make_capacity ?capacity_units:(capacity_units_ : float option)
  ?write_capacity_units:(write_capacity_units_ : float option)
  ?read_capacity_units:(read_capacity_units_ : float option) () =
  ({
     capacity_units = capacity_units_;
     write_capacity_units = write_capacity_units_;
     read_capacity_units = read_capacity_units_
   } : capacity)
let make_consumed_capacity
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              secondary_indexes_capacity_map option)
  ?local_secondary_indexes:(local_secondary_indexes_ :
                             secondary_indexes_capacity_map option)
  ?table:(table_ : capacity option)
  ?write_capacity_units:(write_capacity_units_ : float option)
  ?read_capacity_units:(read_capacity_units_ : float option)
  ?capacity_units:(capacity_units_ : float option)
  ?table_name:(table_name_ : string option) () =
  ({
     global_secondary_indexes = global_secondary_indexes_;
     local_secondary_indexes = local_secondary_indexes_;
     table = table_;
     write_capacity_units = write_capacity_units_;
     read_capacity_units = read_capacity_units_;
     capacity_units = capacity_units_;
     table_name = table_name_
   } : consumed_capacity)
let make_item_collection_metrics
  ?size_estimate_range_g_b:(size_estimate_range_g_b_ : float list option)
  ?item_collection_key:(item_collection_key_ :
                         item_collection_key_attribute_map option)
  () =
  ({
     size_estimate_range_g_b = size_estimate_range_g_b_;
     item_collection_key = item_collection_key_
   } : item_collection_metrics)
let make_update_item_output
  ?item_collection_metrics:(item_collection_metrics_ :
                             item_collection_metrics option)
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
  ?attributes:(attributes_ : attribute_map option) () =
  ({
     item_collection_metrics = item_collection_metrics_;
     consumed_capacity = consumed_capacity_;
     attributes = attributes_
   } : update_item_output)
let make_attribute_value_update ?action:(action_ : attribute_action option)
  ?value:(value_ : attribute_value option) () =
  ({ action = action_; value = value_ } : attribute_value_update)
let make_expected_attribute_value
  ?attribute_value_list:(attribute_value_list_ : attribute_value list option)
  ?comparison_operator:(comparison_operator_ : comparison_operator option)
  ?exists:(exists_ : bool option) ?value:(value_ : attribute_value option) ()
  =
  ({
     attribute_value_list = attribute_value_list_;
     comparison_operator = comparison_operator_;
     exists = exists_;
     value = value_
   } : expected_attribute_value)
let make_update_item_input
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?condition_expression:(condition_expression_ : string option)
  ?update_expression:(update_expression_ : string option)
  ?return_item_collection_metrics:(return_item_collection_metrics_ :
                                    return_item_collection_metrics option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?return_values:(return_values_ : return_value option)
  ?conditional_operator:(conditional_operator_ : conditional_operator option)
  ?expected:(expected_ : expected_attribute_map option)
  ?attribute_updates:(attribute_updates_ : attribute_updates option)
  ~key:(key_ : key) ~table_name:(table_name_ : string) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     condition_expression = condition_expression_;
     update_expression = update_expression_;
     return_item_collection_metrics = return_item_collection_metrics_;
     return_consumed_capacity = return_consumed_capacity_;
     return_values = return_values_;
     conditional_operator = conditional_operator_;
     expected = expected_;
     attribute_updates = attribute_updates_;
     key = key_;
     table_name = table_name_
   } : update_item_input)
let make_replica_global_secondary_index_settings_description
  ?provisioned_write_capacity_auto_scaling_settings:(provisioned_write_capacity_auto_scaling_settings_
                                                      :
                                                      auto_scaling_settings_description
                                                        option)
  ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ :
                                      int option)
  ?provisioned_read_capacity_auto_scaling_settings:(provisioned_read_capacity_auto_scaling_settings_
                                                     :
                                                     auto_scaling_settings_description
                                                       option)
  ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ :
                                     int option)
  ?index_status:(index_status_ : index_status option)
  ~index_name:(index_name_ : string) () =
  ({
     provisioned_write_capacity_auto_scaling_settings =
       provisioned_write_capacity_auto_scaling_settings_;
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
     provisioned_read_capacity_auto_scaling_settings =
       provisioned_read_capacity_auto_scaling_settings_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     index_status = index_status_;
     index_name = index_name_
   } : replica_global_secondary_index_settings_description)
let make_replica_settings_description
  ?replica_table_class_summary:(replica_table_class_summary_ :
                                 table_class_summary option)
  ?replica_global_secondary_index_settings:(replica_global_secondary_index_settings_
                                             :
                                             replica_global_secondary_index_settings_description
                                               list option)
  ?replica_provisioned_write_capacity_auto_scaling_settings:(replica_provisioned_write_capacity_auto_scaling_settings_
                                                              :
                                                              auto_scaling_settings_description
                                                                option)
  ?replica_provisioned_write_capacity_units:(replica_provisioned_write_capacity_units_
                                              : int option)
  ?replica_provisioned_read_capacity_auto_scaling_settings:(replica_provisioned_read_capacity_auto_scaling_settings_
                                                             :
                                                             auto_scaling_settings_description
                                                               option)
  ?replica_provisioned_read_capacity_units:(replica_provisioned_read_capacity_units_
                                             : int option)
  ?replica_billing_mode_summary:(replica_billing_mode_summary_ :
                                  billing_mode_summary option)
  ?replica_status:(replica_status_ : replica_status option)
  ~region_name:(region_name_ : string) () =
  ({
     replica_table_class_summary = replica_table_class_summary_;
     replica_global_secondary_index_settings =
       replica_global_secondary_index_settings_;
     replica_provisioned_write_capacity_auto_scaling_settings =
       replica_provisioned_write_capacity_auto_scaling_settings_;
     replica_provisioned_write_capacity_units =
       replica_provisioned_write_capacity_units_;
     replica_provisioned_read_capacity_auto_scaling_settings =
       replica_provisioned_read_capacity_auto_scaling_settings_;
     replica_provisioned_read_capacity_units =
       replica_provisioned_read_capacity_units_;
     replica_billing_mode_summary = replica_billing_mode_summary_;
     replica_status = replica_status_;
     region_name = region_name_
   } : replica_settings_description)
let make_update_global_table_settings_output
  ?replica_settings:(replica_settings_ :
                      replica_settings_description list option)
  ?global_table_name:(global_table_name_ : string option) () =
  ({
     replica_settings = replica_settings_;
     global_table_name = global_table_name_
   } : update_global_table_settings_output)
let make_global_table_global_secondary_index_settings_update
  ?provisioned_write_capacity_auto_scaling_settings_update:(provisioned_write_capacity_auto_scaling_settings_update_
                                                             :
                                                             auto_scaling_settings_update
                                                               option)
  ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ :
                                      int option)
  ~index_name:(index_name_ : string) () =
  ({
     provisioned_write_capacity_auto_scaling_settings_update =
       provisioned_write_capacity_auto_scaling_settings_update_;
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
     index_name = index_name_
   } : global_table_global_secondary_index_settings_update)
let make_replica_global_secondary_index_settings_update
  ?provisioned_read_capacity_auto_scaling_settings_update:(provisioned_read_capacity_auto_scaling_settings_update_
                                                            :
                                                            auto_scaling_settings_update
                                                              option)
  ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ :
                                     int option)
  ~index_name:(index_name_ : string) () =
  ({
     provisioned_read_capacity_auto_scaling_settings_update =
       provisioned_read_capacity_auto_scaling_settings_update_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     index_name = index_name_
   } : replica_global_secondary_index_settings_update)
let make_replica_settings_update
  ?replica_table_class:(replica_table_class_ : table_class option)
  ?replica_global_secondary_index_settings_update:(replica_global_secondary_index_settings_update_
                                                    :
                                                    replica_global_secondary_index_settings_update
                                                      list option)
  ?replica_provisioned_read_capacity_auto_scaling_settings_update:(replica_provisioned_read_capacity_auto_scaling_settings_update_
                                                                    :
                                                                    auto_scaling_settings_update
                                                                    option)
  ?replica_provisioned_read_capacity_units:(replica_provisioned_read_capacity_units_
                                             : int option)
  ~region_name:(region_name_ : string) () =
  ({
     replica_table_class = replica_table_class_;
     replica_global_secondary_index_settings_update =
       replica_global_secondary_index_settings_update_;
     replica_provisioned_read_capacity_auto_scaling_settings_update =
       replica_provisioned_read_capacity_auto_scaling_settings_update_;
     replica_provisioned_read_capacity_units =
       replica_provisioned_read_capacity_units_;
     region_name = region_name_
   } : replica_settings_update)
let make_update_global_table_settings_input
  ?replica_settings_update:(replica_settings_update_ :
                             replica_settings_update list option)
  ?global_table_global_secondary_index_settings_update:(global_table_global_secondary_index_settings_update_
                                                         :
                                                         global_table_global_secondary_index_settings_update
                                                           list option)
  ?global_table_provisioned_write_capacity_auto_scaling_settings_update:
  (global_table_provisioned_write_capacity_auto_scaling_settings_update_ :
    auto_scaling_settings_update option)
  ?global_table_provisioned_write_capacity_units:(global_table_provisioned_write_capacity_units_
                                                   : int option)
  ?global_table_billing_mode:(global_table_billing_mode_ :
                               billing_mode option)
  ~global_table_name:(global_table_name_ : string) () =
  ({
     replica_settings_update = replica_settings_update_;
     global_table_global_secondary_index_settings_update =
       global_table_global_secondary_index_settings_update_;
     global_table_provisioned_write_capacity_auto_scaling_settings_update =
       global_table_provisioned_write_capacity_auto_scaling_settings_update_;
     global_table_provisioned_write_capacity_units =
       global_table_provisioned_write_capacity_units_;
     global_table_billing_mode = global_table_billing_mode_;
     global_table_name = global_table_name_
   } : update_global_table_settings_input)
let make_global_table_description
  ?global_table_name:(global_table_name_ : string option)
  ?global_table_status:(global_table_status_ : global_table_status option)
  ?creation_date_time:(creation_date_time_ : CoreTypes.Timestamp.t option)
  ?global_table_arn:(global_table_arn_ : string option)
  ?replication_group:(replication_group_ : replica_description list option)
  () =
  ({
     global_table_name = global_table_name_;
     global_table_status = global_table_status_;
     creation_date_time = creation_date_time_;
     global_table_arn = global_table_arn_;
     replication_group = replication_group_
   } : global_table_description)
let make_update_global_table_output
  ?global_table_description:(global_table_description_ :
                              global_table_description option)
  () =
  ({ global_table_description = global_table_description_ } : update_global_table_output)
let make_create_replica_action ~region_name:(region_name_ : string) () =
  ({ region_name = region_name_ } : create_replica_action)
let make_delete_replica_action ~region_name:(region_name_ : string) () =
  ({ region_name = region_name_ } : delete_replica_action)
let make_replica_update ?delete:(delete_ : delete_replica_action option)
  ?create:(create_ : create_replica_action option) () =
  ({ delete = delete_; create = create_ } : replica_update)
let make_update_global_table_input
  ~replica_updates:(replica_updates_ : replica_update list)
  ~global_table_name:(global_table_name_ : string) () =
  ({
     replica_updates = replica_updates_;
     global_table_name = global_table_name_
   } : update_global_table_input)
let make_update_contributor_insights_output
  ?contributor_insights_status:(contributor_insights_status_ :
                                 contributor_insights_status option)
  ?index_name:(index_name_ : string option)
  ?table_name:(table_name_ : string option) () =
  ({
     contributor_insights_status = contributor_insights_status_;
     index_name = index_name_;
     table_name = table_name_
   } : update_contributor_insights_output)
let make_update_contributor_insights_input
  ?index_name:(index_name_ : string option)
  ~contributor_insights_action:(contributor_insights_action_ :
                                 contributor_insights_action)
  ~table_name:(table_name_ : string) () =
  ({
     contributor_insights_action = contributor_insights_action_;
     index_name = index_name_;
     table_name = table_name_
   } : update_contributor_insights_input)
let make_point_in_time_recovery_description
  ?latest_restorable_date_time:(latest_restorable_date_time_ :
                                 CoreTypes.Timestamp.t option)
  ?earliest_restorable_date_time:(earliest_restorable_date_time_ :
                                   CoreTypes.Timestamp.t option)
  ?point_in_time_recovery_status:(point_in_time_recovery_status_ :
                                   point_in_time_recovery_status option)
  () =
  ({
     latest_restorable_date_time = latest_restorable_date_time_;
     earliest_restorable_date_time = earliest_restorable_date_time_;
     point_in_time_recovery_status = point_in_time_recovery_status_
   } : point_in_time_recovery_description)
let make_continuous_backups_description
  ?point_in_time_recovery_description:(point_in_time_recovery_description_ :
                                        point_in_time_recovery_description
                                          option)
  ~continuous_backups_status:(continuous_backups_status_ :
                               continuous_backups_status)
  () =
  ({
     point_in_time_recovery_description = point_in_time_recovery_description_;
     continuous_backups_status = continuous_backups_status_
   } : continuous_backups_description)
let make_update_continuous_backups_output
  ?continuous_backups_description:(continuous_backups_description_ :
                                    continuous_backups_description option)
  () =
  ({ continuous_backups_description = continuous_backups_description_ } : 
  update_continuous_backups_output)
let make_point_in_time_recovery_specification
  ~point_in_time_recovery_enabled:(point_in_time_recovery_enabled_ : bool) ()
  =
  ({ point_in_time_recovery_enabled = point_in_time_recovery_enabled_ } : 
  point_in_time_recovery_specification)
let make_update_continuous_backups_input
  ~point_in_time_recovery_specification:(point_in_time_recovery_specification_
                                          :
                                          point_in_time_recovery_specification)
  ~table_name:(table_name_ : string) () =
  ({
     point_in_time_recovery_specification =
       point_in_time_recovery_specification_;
     table_name = table_name_
   } : update_continuous_backups_input)
let make_update
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?condition_expression:(condition_expression_ : string option)
  ~table_name:(table_name_ : string)
  ~update_expression:(update_expression_ : string) ~key:(key_ : key) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     condition_expression = condition_expression_;
     table_name = table_name_;
     update_expression = update_expression_;
     key = key_
   } : update)
let make_untag_resource_input ~tag_keys:(tag_keys_ : string list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_cancellation_reason ?message:(message_ : string option)
  ?code:(code_ : string option) ?item:(item_ : attribute_map option) () =
  ({ message = message_; code = code_; item = item_ } : cancellation_reason)
let make_transact_write_items_output
  ?item_collection_metrics:(item_collection_metrics_ :
                             item_collection_metrics_per_table option)
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity list option) ()
  =
  ({
     item_collection_metrics = item_collection_metrics_;
     consumed_capacity = consumed_capacity_
   } : transact_write_items_output)
let make_condition_check
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ~condition_expression:(condition_expression_ : string)
  ~table_name:(table_name_ : string) ~key:(key_ : key) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     condition_expression = condition_expression_;
     table_name = table_name_;
     key = key_
   } : condition_check)
let make_put
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?condition_expression:(condition_expression_ : string option)
  ~table_name:(table_name_ : string)
  ~item:(item_ : put_item_input_attribute_map) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     condition_expression = condition_expression_;
     table_name = table_name_;
     item = item_
   } : put)
let make_delete
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?condition_expression:(condition_expression_ : string option)
  ~table_name:(table_name_ : string) ~key:(key_ : key) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     condition_expression = condition_expression_;
     table_name = table_name_;
     key = key_
   } : delete)
let make_transact_write_item ?update:(update_ : update option)
  ?delete:(delete_ : delete option) ?put:(put_ : put option)
  ?condition_check:(condition_check_ : condition_check option) () =
  ({
     update = update_;
     delete = delete_;
     put = put_;
     condition_check = condition_check_
   } : transact_write_item)
let make_transact_write_items_input
  ?client_request_token:(client_request_token_ : string option)
  ?return_item_collection_metrics:(return_item_collection_metrics_ :
                                    return_item_collection_metrics option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ~transact_items:(transact_items_ : transact_write_item list) () =
  ({
     client_request_token = client_request_token_;
     return_item_collection_metrics = return_item_collection_metrics_;
     return_consumed_capacity = return_consumed_capacity_;
     transact_items = transact_items_
   } : transact_write_items_input)
let make_item_response ?item:(item_ : attribute_map option) () =
  ({ item = item_ } : item_response)
let make_transact_get_items_output
  ?responses:(responses_ : item_response list option)
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity list option) ()
  =
  ({ responses = responses_; consumed_capacity = consumed_capacity_ } : 
  transact_get_items_output)
let make_get
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?projection_expression:(projection_expression_ : string option)
  ~table_name:(table_name_ : string) ~key:(key_ : key) () =
  ({
     expression_attribute_names = expression_attribute_names_;
     projection_expression = projection_expression_;
     table_name = table_name_;
     key = key_
   } : get)
let make_transact_get_item ~get:(get_ : get) () =
  ({ get = get_ } : transact_get_item)
let make_transact_get_items_input
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ~transact_items:(transact_items_ : transact_get_item list) () =
  ({
     return_consumed_capacity = return_consumed_capacity_;
     transact_items = transact_items_
   } : transact_get_items_input)
let make_time_to_live_description
  ?attribute_name:(attribute_name_ : string option)
  ?time_to_live_status:(time_to_live_status_ : time_to_live_status option) ()
  =
  ({
     attribute_name = attribute_name_;
     time_to_live_status = time_to_live_status_
   } : time_to_live_description)
let make_tag ~value:(value_ : string) ~key:(key_ : string) () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_input ~tags:(tags_ : tag list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_global_secondary_index
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput option)
  ~projection:(projection_ : projection)
  ~key_schema:(key_schema_ : key_schema_element list)
  ~index_name:(index_name_ : string) () =
  ({
     on_demand_throughput = on_demand_throughput_;
     provisioned_throughput = provisioned_throughput_;
     projection = projection_;
     key_schema = key_schema_;
     index_name = index_name_
   } : global_secondary_index)
let make_table_creation_parameters
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              global_secondary_index list option)
  ?sse_specification:(sse_specification_ : sse_specification option)
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput option)
  ?billing_mode:(billing_mode_ : billing_mode option)
  ~key_schema:(key_schema_ : key_schema_element list)
  ~attribute_definitions:(attribute_definitions_ : attribute_definition list)
  ~table_name:(table_name_ : string) () =
  ({
     global_secondary_indexes = global_secondary_indexes_;
     sse_specification = sse_specification_;
     on_demand_throughput = on_demand_throughput_;
     provisioned_throughput = provisioned_throughput_;
     billing_mode = billing_mode_;
     key_schema = key_schema_;
     attribute_definitions = attribute_definitions_;
     table_name = table_name_
   } : table_creation_parameters)
let make_local_secondary_index_info
  ?projection:(projection_ : projection option)
  ?key_schema:(key_schema_ : key_schema_element list option)
  ?index_name:(index_name_ : string option) () =
  ({
     projection = projection_;
     key_schema = key_schema_;
     index_name = index_name_
   } : local_secondary_index_info)
let make_global_secondary_index_info
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput option)
  ?projection:(projection_ : projection option)
  ?key_schema:(key_schema_ : key_schema_element list option)
  ?index_name:(index_name_ : string option) () =
  ({
     on_demand_throughput = on_demand_throughput_;
     provisioned_throughput = provisioned_throughput_;
     projection = projection_;
     key_schema = key_schema_;
     index_name = index_name_
   } : global_secondary_index_info)
let make_source_table_feature_details
  ?sse_description:(sse_description_ : sse_description option)
  ?time_to_live_description:(time_to_live_description_ :
                              time_to_live_description option)
  ?stream_description:(stream_description_ : stream_specification option)
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              global_secondary_index_info list option)
  ?local_secondary_indexes:(local_secondary_indexes_ :
                             local_secondary_index_info list option)
  () =
  ({
     sse_description = sse_description_;
     time_to_live_description = time_to_live_description_;
     stream_description = stream_description_;
     global_secondary_indexes = global_secondary_indexes_;
     local_secondary_indexes = local_secondary_indexes_
   } : source_table_feature_details)
let make_source_table_details
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?item_count:(item_count_ : int option)
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?table_size_bytes:(table_size_bytes_ : int option)
  ?table_arn:(table_arn_ : string option)
  ~provisioned_throughput:(provisioned_throughput_ : provisioned_throughput)
  ~table_creation_date_time:(table_creation_date_time_ :
                              CoreTypes.Timestamp.t)
  ~key_schema:(key_schema_ : key_schema_element list)
  ~table_id:(table_id_ : string) ~table_name:(table_name_ : string) () =
  ({
     billing_mode = billing_mode_;
     item_count = item_count_;
     on_demand_throughput = on_demand_throughput_;
     provisioned_throughput = provisioned_throughput_;
     table_creation_date_time = table_creation_date_time_;
     key_schema = key_schema_;
     table_size_bytes = table_size_bytes_;
     table_arn = table_arn_;
     table_id = table_id_;
     table_name = table_name_
   } : source_table_details)
let make_scan_output
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
  ?last_evaluated_key:(last_evaluated_key_ : key option)
  ?scanned_count:(scanned_count_ : int option) ?count:(count_ : int option)
  ?items:(items_ : attribute_map list option) () =
  ({
     consumed_capacity = consumed_capacity_;
     last_evaluated_key = last_evaluated_key_;
     scanned_count = scanned_count_;
     count = count_;
     items = items_
   } : scan_output)
let make_condition
  ?attribute_value_list:(attribute_value_list_ : attribute_value list option)
  ~comparison_operator:(comparison_operator_ : comparison_operator) () =
  ({
     comparison_operator = comparison_operator_;
     attribute_value_list = attribute_value_list_
   } : condition)
let make_scan_input ?consistent_read:(consistent_read_ : bool option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?filter_expression:(filter_expression_ : string option)
  ?projection_expression:(projection_expression_ : string option)
  ?segment:(segment_ : int option)
  ?total_segments:(total_segments_ : int option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?exclusive_start_key:(exclusive_start_key_ : key option)
  ?conditional_operator:(conditional_operator_ : conditional_operator option)
  ?scan_filter:(scan_filter_ : filter_condition_map option)
  ?select:(select_ : select option) ?limit:(limit_ : int option)
  ?attributes_to_get:(attributes_to_get_ : string list option)
  ?index_name:(index_name_ : string option)
  ~table_name:(table_name_ : string) () =
  ({
     consistent_read = consistent_read_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     filter_expression = filter_expression_;
     projection_expression = projection_expression_;
     segment = segment_;
     total_segments = total_segments_;
     return_consumed_capacity = return_consumed_capacity_;
     exclusive_start_key = exclusive_start_key_;
     conditional_operator = conditional_operator_;
     scan_filter = scan_filter_;
     select = select_;
     limit = limit_;
     attributes_to_get = attributes_to_get_;
     index_name = index_name_;
     table_name = table_name_
   } : scan_input)
let make_s3_bucket_source ?s3_key_prefix:(s3_key_prefix_ : string option)
  ?s3_bucket_owner:(s3_bucket_owner_ : string option)
  ~s3_bucket:(s3_bucket_ : string) () =
  ({
     s3_key_prefix = s3_key_prefix_;
     s3_bucket = s3_bucket_;
     s3_bucket_owner = s3_bucket_owner_
   } : s3_bucket_source)
let make_restore_table_to_point_in_time_output
  ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : restore_table_to_point_in_time_output)
let make_local_secondary_index ~projection:(projection_ : projection)
  ~key_schema:(key_schema_ : key_schema_element list)
  ~index_name:(index_name_ : string) () =
  ({
     projection = projection_;
     key_schema = key_schema_;
     index_name = index_name_
   } : local_secondary_index)
let make_restore_table_to_point_in_time_input
  ?sse_specification_override:(sse_specification_override_ :
                                sse_specification option)
  ?on_demand_throughput_override:(on_demand_throughput_override_ :
                                   on_demand_throughput option)
  ?provisioned_throughput_override:(provisioned_throughput_override_ :
                                     provisioned_throughput option)
  ?local_secondary_index_override:(local_secondary_index_override_ :
                                    local_secondary_index list option)
  ?global_secondary_index_override:(global_secondary_index_override_ :
                                     global_secondary_index list option)
  ?billing_mode_override:(billing_mode_override_ : billing_mode option)
  ?restore_date_time:(restore_date_time_ : CoreTypes.Timestamp.t option)
  ?use_latest_restorable_time:(use_latest_restorable_time_ : bool option)
  ?source_table_name:(source_table_name_ : string option)
  ?source_table_arn:(source_table_arn_ : string option)
  ~target_table_name:(target_table_name_ : string) () =
  ({
     sse_specification_override = sse_specification_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     local_secondary_index_override = local_secondary_index_override_;
     global_secondary_index_override = global_secondary_index_override_;
     billing_mode_override = billing_mode_override_;
     restore_date_time = restore_date_time_;
     use_latest_restorable_time = use_latest_restorable_time_;
     target_table_name = target_table_name_;
     source_table_name = source_table_name_;
     source_table_arn = source_table_arn_
   } : restore_table_to_point_in_time_input)
let make_restore_table_from_backup_output
  ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : restore_table_from_backup_output)
let make_restore_table_from_backup_input
  ?sse_specification_override:(sse_specification_override_ :
                                sse_specification option)
  ?on_demand_throughput_override:(on_demand_throughput_override_ :
                                   on_demand_throughput option)
  ?provisioned_throughput_override:(provisioned_throughput_override_ :
                                     provisioned_throughput option)
  ?local_secondary_index_override:(local_secondary_index_override_ :
                                    local_secondary_index list option)
  ?global_secondary_index_override:(global_secondary_index_override_ :
                                     global_secondary_index list option)
  ?billing_mode_override:(billing_mode_override_ : billing_mode option)
  ~backup_arn:(backup_arn_ : string)
  ~target_table_name:(target_table_name_ : string) () =
  ({
     sse_specification_override = sse_specification_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     local_secondary_index_override = local_secondary_index_override_;
     global_secondary_index_override = global_secondary_index_override_;
     billing_mode_override = billing_mode_override_;
     backup_arn = backup_arn_;
     target_table_name = target_table_name_
   } : restore_table_from_backup_input)
let make_replica ?region_name:(region_name_ : string option) () =
  ({ region_name = region_name_ } : replica)
let make_query_output
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
  ?last_evaluated_key:(last_evaluated_key_ : key option)
  ?scanned_count:(scanned_count_ : int option) ?count:(count_ : int option)
  ?items:(items_ : attribute_map list option) () =
  ({
     consumed_capacity = consumed_capacity_;
     last_evaluated_key = last_evaluated_key_;
     scanned_count = scanned_count_;
     count = count_;
     items = items_
   } : query_output)
let make_query_input
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?key_condition_expression:(key_condition_expression_ : string option)
  ?filter_expression:(filter_expression_ : string option)
  ?projection_expression:(projection_expression_ : string option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?exclusive_start_key:(exclusive_start_key_ : key option)
  ?scan_index_forward:(scan_index_forward_ : bool option)
  ?conditional_operator:(conditional_operator_ : conditional_operator option)
  ?query_filter:(query_filter_ : filter_condition_map option)
  ?key_conditions:(key_conditions_ : key_conditions option)
  ?consistent_read:(consistent_read_ : bool option)
  ?limit:(limit_ : int option)
  ?attributes_to_get:(attributes_to_get_ : string list option)
  ?select:(select_ : select option) ?index_name:(index_name_ : string option)
  ~table_name:(table_name_ : string) () =
  ({
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     key_condition_expression = key_condition_expression_;
     filter_expression = filter_expression_;
     projection_expression = projection_expression_;
     return_consumed_capacity = return_consumed_capacity_;
     exclusive_start_key = exclusive_start_key_;
     scan_index_forward = scan_index_forward_;
     conditional_operator = conditional_operator_;
     query_filter = query_filter_;
     key_conditions = key_conditions_;
     consistent_read = consistent_read_;
     limit = limit_;
     attributes_to_get = attributes_to_get_;
     select = select_;
     index_name = index_name_;
     table_name = table_name_
   } : query_input)
let make_put_resource_policy_output
  ?revision_id:(revision_id_ : string option) () =
  ({ revision_id = revision_id_ } : put_resource_policy_output)
let make_put_resource_policy_input
  ?confirm_remove_self_resource_access:(confirm_remove_self_resource_access_
                                         : bool option)
  ?expected_revision_id:(expected_revision_id_ : string option)
  ~policy:(policy_ : string) ~resource_arn:(resource_arn_ : string) () =
  ({
     confirm_remove_self_resource_access =
       confirm_remove_self_resource_access_;
     expected_revision_id = expected_revision_id_;
     policy = policy_;
     resource_arn = resource_arn_
   } : put_resource_policy_input)
let make_put_item_output
  ?item_collection_metrics:(item_collection_metrics_ :
                             item_collection_metrics option)
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
  ?attributes:(attributes_ : attribute_map option) () =
  ({
     item_collection_metrics = item_collection_metrics_;
     consumed_capacity = consumed_capacity_;
     attributes = attributes_
   } : put_item_output)
let make_put_item_input
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?condition_expression:(condition_expression_ : string option)
  ?conditional_operator:(conditional_operator_ : conditional_operator option)
  ?return_item_collection_metrics:(return_item_collection_metrics_ :
                                    return_item_collection_metrics option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?return_values:(return_values_ : return_value option)
  ?expected:(expected_ : expected_attribute_map option)
  ~item:(item_ : put_item_input_attribute_map)
  ~table_name:(table_name_ : string) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     condition_expression = condition_expression_;
     conditional_operator = conditional_operator_;
     return_item_collection_metrics = return_item_collection_metrics_;
     return_consumed_capacity = return_consumed_capacity_;
     return_values = return_values_;
     expected = expected_;
     item = item_;
     table_name = table_name_
   } : put_item_input)
let make_batch_statement_error ?item:(item_ : attribute_map option)
  ?message:(message_ : string option)
  ?code:(code_ : batch_statement_error_code_enum option) () =
  ({ item = item_; message = message_; code = code_ } : batch_statement_error)
let make_batch_statement_response ?item:(item_ : attribute_map option)
  ?table_name:(table_name_ : string option)
  ?error:(error_ : batch_statement_error option) () =
  ({ item = item_; table_name = table_name_; error = error_ } : batch_statement_response)
let make_batch_statement_request
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?consistent_read:(consistent_read_ : bool option)
  ?parameters:(parameters_ : attribute_value list option)
  ~statement:(statement_ : string) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     consistent_read = consistent_read_;
     parameters = parameters_;
     statement = statement_
   } : batch_statement_request)
let make_parameterized_statement
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?parameters:(parameters_ : attribute_value list option)
  ~statement:(statement_ : string) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     parameters = parameters_;
     statement = statement_
   } : parameterized_statement)
let make_list_tags_of_resource_output
  ?next_token:(next_token_ : string option) ?tags:(tags_ : tag list option)
  () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_of_resource_output)
let make_list_tags_of_resource_input
  ?next_token:(next_token_ : string option)
  ~resource_arn:(resource_arn_ : string) () =
  ({ next_token = next_token_; resource_arn = resource_arn_ } : list_tags_of_resource_input)
let make_list_tables_output
  ?last_evaluated_table_name:(last_evaluated_table_name_ : string option)
  ?table_names:(table_names_ : string list option) () =
  ({
     last_evaluated_table_name = last_evaluated_table_name_;
     table_names = table_names_
   } : list_tables_output)
let make_list_tables_input ?limit:(limit_ : int option)
  ?exclusive_start_table_name:(exclusive_start_table_name_ : string option)
  () =
  ({ limit = limit_; exclusive_start_table_name = exclusive_start_table_name_
   } : list_tables_input)
let make_import_summary ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?input_format:(input_format_ : input_format option)
  ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : string option)
  ?s3_bucket_source:(s3_bucket_source_ : s3_bucket_source option)
  ?table_arn:(table_arn_ : string option)
  ?import_status:(import_status_ : import_status option)
  ?import_arn:(import_arn_ : string option) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     input_format = input_format_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     s3_bucket_source = s3_bucket_source_;
     table_arn = table_arn_;
     import_status = import_status_;
     import_arn = import_arn_
   } : import_summary)
let make_list_imports_output ?next_token:(next_token_ : string option)
  ?import_summary_list:(import_summary_list_ : import_summary list option) ()
  =
  ({ next_token = next_token_; import_summary_list = import_summary_list_ } : 
  list_imports_output)
let make_list_imports_input ?next_token:(next_token_ : string option)
  ?page_size:(page_size_ : int option)
  ?table_arn:(table_arn_ : string option) () =
  ({ next_token = next_token_; page_size = page_size_; table_arn = table_arn_
   } : list_imports_input)
let make_global_table
  ?replication_group:(replication_group_ : replica list option)
  ?global_table_name:(global_table_name_ : string option) () =
  ({
     replication_group = replication_group_;
     global_table_name = global_table_name_
   } : global_table)
let make_list_global_tables_output
  ?last_evaluated_global_table_name:(last_evaluated_global_table_name_ :
                                      string option)
  ?global_tables:(global_tables_ : global_table list option) () =
  ({
     last_evaluated_global_table_name = last_evaluated_global_table_name_;
     global_tables = global_tables_
   } : list_global_tables_output)
let make_list_global_tables_input ?region_name:(region_name_ : string option)
  ?limit:(limit_ : int option)
  ?exclusive_start_global_table_name:(exclusive_start_global_table_name_ :
                                       string option)
  () =
  ({
     region_name = region_name_;
     limit = limit_;
     exclusive_start_global_table_name = exclusive_start_global_table_name_
   } : list_global_tables_input)
let make_export_summary ?export_type:(export_type_ : export_type option)
  ?export_status:(export_status_ : export_status option)
  ?export_arn:(export_arn_ : string option) () =
  ({
     export_type = export_type_;
     export_status = export_status_;
     export_arn = export_arn_
   } : export_summary)
let make_list_exports_output ?next_token:(next_token_ : string option)
  ?export_summaries:(export_summaries_ : export_summary list option) () =
  ({ next_token = next_token_; export_summaries = export_summaries_ } : 
  list_exports_output)
let make_list_exports_input ?next_token:(next_token_ : string option)
  ?max_results:(max_results_ : int option)
  ?table_arn:(table_arn_ : string option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     table_arn = table_arn_
   } : list_exports_input)
let make_contributor_insights_summary
  ?contributor_insights_status:(contributor_insights_status_ :
                                 contributor_insights_status option)
  ?index_name:(index_name_ : string option)
  ?table_name:(table_name_ : string option) () =
  ({
     contributor_insights_status = contributor_insights_status_;
     index_name = index_name_;
     table_name = table_name_
   } : contributor_insights_summary)
let make_list_contributor_insights_output
  ?next_token:(next_token_ : string option)
  ?contributor_insights_summaries:(contributor_insights_summaries_ :
                                    contributor_insights_summary list option)
  () =
  ({
     next_token = next_token_;
     contributor_insights_summaries = contributor_insights_summaries_
   } : list_contributor_insights_output)
let make_list_contributor_insights_input
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?table_name:(table_name_ : string option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     table_name = table_name_
   } : list_contributor_insights_input)
let make_backup_summary ?backup_size_bytes:(backup_size_bytes_ : int option)
  ?backup_type:(backup_type_ : backup_type option)
  ?backup_status:(backup_status_ : backup_status option)
  ?backup_expiry_date_time:(backup_expiry_date_time_ :
                             CoreTypes.Timestamp.t option)
  ?backup_creation_date_time:(backup_creation_date_time_ :
                               CoreTypes.Timestamp.t option)
  ?backup_name:(backup_name_ : string option)
  ?backup_arn:(backup_arn_ : string option)
  ?table_arn:(table_arn_ : string option)
  ?table_id:(table_id_ : string option)
  ?table_name:(table_name_ : string option) () =
  ({
     backup_size_bytes = backup_size_bytes_;
     backup_type = backup_type_;
     backup_status = backup_status_;
     backup_expiry_date_time = backup_expiry_date_time_;
     backup_creation_date_time = backup_creation_date_time_;
     backup_name = backup_name_;
     backup_arn = backup_arn_;
     table_arn = table_arn_;
     table_id = table_id_;
     table_name = table_name_
   } : backup_summary)
let make_list_backups_output
  ?last_evaluated_backup_arn:(last_evaluated_backup_arn_ : string option)
  ?backup_summaries:(backup_summaries_ : backup_summary list option) () =
  ({
     last_evaluated_backup_arn = last_evaluated_backup_arn_;
     backup_summaries = backup_summaries_
   } : list_backups_output)
let make_list_backups_input
  ?backup_type:(backup_type_ : backup_type_filter option)
  ?exclusive_start_backup_arn:(exclusive_start_backup_arn_ : string option)
  ?time_range_upper_bound:(time_range_upper_bound_ :
                            CoreTypes.Timestamp.t option)
  ?time_range_lower_bound:(time_range_lower_bound_ :
                            CoreTypes.Timestamp.t option)
  ?limit:(limit_ : int option) ?table_name:(table_name_ : string option) () =
  ({
     backup_type = backup_type_;
     exclusive_start_backup_arn = exclusive_start_backup_arn_;
     time_range_upper_bound = time_range_upper_bound_;
     time_range_lower_bound = time_range_lower_bound_;
     limit = limit_;
     table_name = table_name_
   } : list_backups_input)
let make_enable_kinesis_streaming_configuration
  ?approximate_creation_date_time_precision:(approximate_creation_date_time_precision_
                                              :
                                              approximate_creation_date_time_precision
                                                option)
  () =
  ({
     approximate_creation_date_time_precision =
       approximate_creation_date_time_precision_
   } : enable_kinesis_streaming_configuration)
let make_kinesis_streaming_destination_output
  ?enable_kinesis_streaming_configuration:(enable_kinesis_streaming_configuration_
                                            :
                                            enable_kinesis_streaming_configuration
                                              option)
  ?destination_status:(destination_status_ : destination_status option)
  ?stream_arn:(stream_arn_ : string option)
  ?table_name:(table_name_ : string option) () =
  ({
     enable_kinesis_streaming_configuration =
       enable_kinesis_streaming_configuration_;
     destination_status = destination_status_;
     stream_arn = stream_arn_;
     table_name = table_name_
   } : kinesis_streaming_destination_output)
let make_kinesis_streaming_destination_input
  ?enable_kinesis_streaming_configuration:(enable_kinesis_streaming_configuration_
                                            :
                                            enable_kinesis_streaming_configuration
                                              option)
  ~stream_arn:(stream_arn_ : string) ~table_name:(table_name_ : string) () =
  ({
     enable_kinesis_streaming_configuration =
       enable_kinesis_streaming_configuration_;
     stream_arn = stream_arn_;
     table_name = table_name_
   } : kinesis_streaming_destination_input)
let make_kinesis_data_stream_destination
  ?approximate_creation_date_time_precision:(approximate_creation_date_time_precision_
                                              :
                                              approximate_creation_date_time_precision
                                                option)
  ?destination_status_description:(destination_status_description_ :
                                    string option)
  ?destination_status:(destination_status_ : destination_status option)
  ?stream_arn:(stream_arn_ : string option) () =
  ({
     approximate_creation_date_time_precision =
       approximate_creation_date_time_precision_;
     destination_status_description = destination_status_description_;
     destination_status = destination_status_;
     stream_arn = stream_arn_
   } : kinesis_data_stream_destination)
let make_keys_and_attributes
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?projection_expression:(projection_expression_ : string option)
  ?consistent_read:(consistent_read_ : bool option)
  ?attributes_to_get:(attributes_to_get_ : string list option)
  ~keys:(keys_ : key list) () =
  ({
     expression_attribute_names = expression_attribute_names_;
     projection_expression = projection_expression_;
     consistent_read = consistent_read_;
     attributes_to_get = attributes_to_get_;
     keys = keys_
   } : keys_and_attributes)
let make_csv_options ?header_list:(header_list_ : string list option)
  ?delimiter:(delimiter_ : string option) () =
  ({ header_list = header_list_; delimiter = delimiter_ } : csv_options)
let make_input_format_options ?csv:(csv_ : csv_options option) () =
  ({ csv = csv_ } : input_format_options)
let make_incremental_export_specification
  ?export_view_type:(export_view_type_ : export_view_type option)
  ?export_to_time:(export_to_time_ : CoreTypes.Timestamp.t option)
  ?export_from_time:(export_from_time_ : CoreTypes.Timestamp.t option) () =
  ({
     export_view_type = export_view_type_;
     export_to_time = export_to_time_;
     export_from_time = export_from_time_
   } : incremental_export_specification)
let make_import_table_description
  ?failure_message:(failure_message_ : string option)
  ?failure_code:(failure_code_ : string option)
  ?imported_item_count:(imported_item_count_ : int option)
  ?processed_item_count:(processed_item_count_ : int option)
  ?processed_size_bytes:(processed_size_bytes_ : int option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?table_creation_parameters:(table_creation_parameters_ :
                               table_creation_parameters option)
  ?input_compression_type:(input_compression_type_ :
                            input_compression_type option)
  ?input_format_options:(input_format_options_ : input_format_options option)
  ?input_format:(input_format_ : input_format option)
  ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : string option)
  ?error_count:(error_count_ : int option)
  ?s3_bucket_source:(s3_bucket_source_ : s3_bucket_source option)
  ?client_token:(client_token_ : string option)
  ?table_id:(table_id_ : string option)
  ?table_arn:(table_arn_ : string option)
  ?import_status:(import_status_ : import_status option)
  ?import_arn:(import_arn_ : string option) () =
  ({
     failure_message = failure_message_;
     failure_code = failure_code_;
     imported_item_count = imported_item_count_;
     processed_item_count = processed_item_count_;
     processed_size_bytes = processed_size_bytes_;
     end_time = end_time_;
     start_time = start_time_;
     table_creation_parameters = table_creation_parameters_;
     input_compression_type = input_compression_type_;
     input_format_options = input_format_options_;
     input_format = input_format_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     error_count = error_count_;
     s3_bucket_source = s3_bucket_source_;
     client_token = client_token_;
     table_id = table_id_;
     table_arn = table_arn_;
     import_status = import_status_;
     import_arn = import_arn_
   } : import_table_description)
let make_import_table_output
  ~import_table_description:(import_table_description_ :
                              import_table_description)
  () =
  ({ import_table_description = import_table_description_ } : import_table_output)
let make_import_table_input
  ?input_compression_type:(input_compression_type_ :
                            input_compression_type option)
  ?input_format_options:(input_format_options_ : input_format_options option)
  ?client_token:(client_token_ : string option)
  ~table_creation_parameters:(table_creation_parameters_ :
                               table_creation_parameters)
  ~input_format:(input_format_ : input_format)
  ~s3_bucket_source:(s3_bucket_source_ : s3_bucket_source) () =
  ({
     table_creation_parameters = table_creation_parameters_;
     input_compression_type = input_compression_type_;
     input_format_options = input_format_options_;
     input_format = input_format_;
     s3_bucket_source = s3_bucket_source_;
     client_token = client_token_
   } : import_table_input)
let make_get_resource_policy_output
  ?revision_id:(revision_id_ : string option)
  ?policy:(policy_ : string option) () =
  ({ revision_id = revision_id_; policy = policy_ } : get_resource_policy_output)
let make_get_resource_policy_input ~resource_arn:(resource_arn_ : string) ()
  = ({ resource_arn = resource_arn_ } : get_resource_policy_input)
let make_get_item_output
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
  ?item:(item_ : attribute_map option) () =
  ({ consumed_capacity = consumed_capacity_; item = item_ } : get_item_output)
let make_get_item_input
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?projection_expression:(projection_expression_ : string option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?consistent_read:(consistent_read_ : bool option)
  ?attributes_to_get:(attributes_to_get_ : string list option)
  ~key:(key_ : key) ~table_name:(table_name_ : string) () =
  ({
     expression_attribute_names = expression_attribute_names_;
     projection_expression = projection_expression_;
     return_consumed_capacity = return_consumed_capacity_;
     consistent_read = consistent_read_;
     attributes_to_get = attributes_to_get_;
     key = key_;
     table_name = table_name_
   } : get_item_input)
let make_failure_exception
  ?exception_description:(exception_description_ : string option)
  ?exception_name:(exception_name_ : string option) () =
  ({
     exception_description = exception_description_;
     exception_name = exception_name_
   } : failure_exception)
let make_export_description
  ?incremental_export_specification:(incremental_export_specification_ :
                                      incremental_export_specification option)
  ?export_type:(export_type_ : export_type option)
  ?item_count:(item_count_ : int option)
  ?billed_size_bytes:(billed_size_bytes_ : int option)
  ?export_format:(export_format_ : export_format option)
  ?failure_message:(failure_message_ : string option)
  ?failure_code:(failure_code_ : string option)
  ?s3_sse_kms_key_id:(s3_sse_kms_key_id_ : string option)
  ?s3_sse_algorithm:(s3_sse_algorithm_ : s3_sse_algorithm option)
  ?s3_prefix:(s3_prefix_ : string option)
  ?s3_bucket_owner:(s3_bucket_owner_ : string option)
  ?s3_bucket:(s3_bucket_ : string option)
  ?client_token:(client_token_ : string option)
  ?export_time:(export_time_ : CoreTypes.Timestamp.t option)
  ?table_id:(table_id_ : string option)
  ?table_arn:(table_arn_ : string option)
  ?export_manifest:(export_manifest_ : string option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?export_status:(export_status_ : export_status option)
  ?export_arn:(export_arn_ : string option) () =
  ({
     incremental_export_specification = incremental_export_specification_;
     export_type = export_type_;
     item_count = item_count_;
     billed_size_bytes = billed_size_bytes_;
     export_format = export_format_;
     failure_message = failure_message_;
     failure_code = failure_code_;
     s3_sse_kms_key_id = s3_sse_kms_key_id_;
     s3_sse_algorithm = s3_sse_algorithm_;
     s3_prefix = s3_prefix_;
     s3_bucket_owner = s3_bucket_owner_;
     s3_bucket = s3_bucket_;
     client_token = client_token_;
     export_time = export_time_;
     table_id = table_id_;
     table_arn = table_arn_;
     export_manifest = export_manifest_;
     end_time = end_time_;
     start_time = start_time_;
     export_status = export_status_;
     export_arn = export_arn_
   } : export_description)
let make_export_table_to_point_in_time_output
  ?export_description:(export_description_ : export_description option) () =
  ({ export_description = export_description_ } : export_table_to_point_in_time_output)
let make_export_table_to_point_in_time_input
  ?incremental_export_specification:(incremental_export_specification_ :
                                      incremental_export_specification option)
  ?export_type:(export_type_ : export_type option)
  ?export_format:(export_format_ : export_format option)
  ?s3_sse_kms_key_id:(s3_sse_kms_key_id_ : string option)
  ?s3_sse_algorithm:(s3_sse_algorithm_ : s3_sse_algorithm option)
  ?s3_prefix:(s3_prefix_ : string option)
  ?s3_bucket_owner:(s3_bucket_owner_ : string option)
  ?client_token:(client_token_ : string option)
  ?export_time:(export_time_ : CoreTypes.Timestamp.t option)
  ~s3_bucket:(s3_bucket_ : string) ~table_arn:(table_arn_ : string) () =
  ({
     incremental_export_specification = incremental_export_specification_;
     export_type = export_type_;
     export_format = export_format_;
     s3_sse_kms_key_id = s3_sse_kms_key_id_;
     s3_sse_algorithm = s3_sse_algorithm_;
     s3_prefix = s3_prefix_;
     s3_bucket_owner = s3_bucket_owner_;
     s3_bucket = s3_bucket_;
     client_token = client_token_;
     export_time = export_time_;
     table_arn = table_arn_
   } : export_table_to_point_in_time_input)
let make_execute_transaction_output
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity list option)
  ?responses:(responses_ : item_response list option) () =
  ({ consumed_capacity = consumed_capacity_; responses = responses_ } : 
  execute_transaction_output)
let make_execute_transaction_input
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?client_request_token:(client_request_token_ : string option)
  ~transact_statements:(transact_statements_ : parameterized_statement list)
  () =
  ({
     return_consumed_capacity = return_consumed_capacity_;
     client_request_token = client_request_token_;
     transact_statements = transact_statements_
   } : execute_transaction_input)
let make_execute_statement_output
  ?last_evaluated_key:(last_evaluated_key_ : key option)
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
  ?next_token:(next_token_ : string option)
  ?items:(items_ : attribute_map list option) () =
  ({
     last_evaluated_key = last_evaluated_key_;
     consumed_capacity = consumed_capacity_;
     next_token = next_token_;
     items = items_
   } : execute_statement_output)
let make_execute_statement_input
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?limit:(limit_ : int option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?next_token:(next_token_ : string option)
  ?consistent_read:(consistent_read_ : bool option)
  ?parameters:(parameters_ : attribute_value list option)
  ~statement:(statement_ : string) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     limit = limit_;
     return_consumed_capacity = return_consumed_capacity_;
     next_token = next_token_;
     consistent_read = consistent_read_;
     parameters = parameters_;
     statement = statement_
   } : execute_statement_input)
let make_endpoint ~cache_period_in_minutes:(cache_period_in_minutes_ : int)
  ~address:(address_ : string) () =
  ({ cache_period_in_minutes = cache_period_in_minutes_; address = address_ } : 
  endpoint)
let make_describe_time_to_live_output
  ?time_to_live_description:(time_to_live_description_ :
                              time_to_live_description option)
  () =
  ({ time_to_live_description = time_to_live_description_ } : describe_time_to_live_output)
let make_describe_time_to_live_input ~table_name:(table_name_ : string) () =
  ({ table_name = table_name_ } : describe_time_to_live_input)
let make_describe_table_replica_auto_scaling_output
  ?table_auto_scaling_description:(table_auto_scaling_description_ :
                                    table_auto_scaling_description option)
  () =
  ({ table_auto_scaling_description = table_auto_scaling_description_ } : 
  describe_table_replica_auto_scaling_output)
let make_describe_table_replica_auto_scaling_input
  ~table_name:(table_name_ : string) () =
  ({ table_name = table_name_ } : describe_table_replica_auto_scaling_input)
let make_describe_table_output ?table:(table_ : table_description option) ()
  = ({ table = table_ } : describe_table_output)
let make_describe_table_input ~table_name:(table_name_ : string) () =
  ({ table_name = table_name_ } : describe_table_input)
let make_describe_limits_output
  ?table_max_write_capacity_units:(table_max_write_capacity_units_ :
                                    int option)
  ?table_max_read_capacity_units:(table_max_read_capacity_units_ :
                                   int option)
  ?account_max_write_capacity_units:(account_max_write_capacity_units_ :
                                      int option)
  ?account_max_read_capacity_units:(account_max_read_capacity_units_ :
                                     int option)
  () =
  ({
     table_max_write_capacity_units = table_max_write_capacity_units_;
     table_max_read_capacity_units = table_max_read_capacity_units_;
     account_max_write_capacity_units = account_max_write_capacity_units_;
     account_max_read_capacity_units = account_max_read_capacity_units_
   } : describe_limits_output)
let make_describe_limits_input () = (() : unit)
let make_describe_kinesis_streaming_destination_output
  ?kinesis_data_stream_destinations:(kinesis_data_stream_destinations_ :
                                      kinesis_data_stream_destination list
                                        option)
  ?table_name:(table_name_ : string option) () =
  ({
     kinesis_data_stream_destinations = kinesis_data_stream_destinations_;
     table_name = table_name_
   } : describe_kinesis_streaming_destination_output)
let make_describe_kinesis_streaming_destination_input
  ~table_name:(table_name_ : string) () =
  ({ table_name = table_name_ } : describe_kinesis_streaming_destination_input)
let make_describe_import_output
  ~import_table_description:(import_table_description_ :
                              import_table_description)
  () =
  ({ import_table_description = import_table_description_ } : describe_import_output)
let make_describe_import_input ~import_arn:(import_arn_ : string) () =
  ({ import_arn = import_arn_ } : describe_import_input)
let make_describe_global_table_settings_output
  ?replica_settings:(replica_settings_ :
                      replica_settings_description list option)
  ?global_table_name:(global_table_name_ : string option) () =
  ({
     replica_settings = replica_settings_;
     global_table_name = global_table_name_
   } : describe_global_table_settings_output)
let make_describe_global_table_settings_input
  ~global_table_name:(global_table_name_ : string) () =
  ({ global_table_name = global_table_name_ } : describe_global_table_settings_input)
let make_describe_global_table_output
  ?global_table_description:(global_table_description_ :
                              global_table_description option)
  () =
  ({ global_table_description = global_table_description_ } : describe_global_table_output)
let make_describe_global_table_input
  ~global_table_name:(global_table_name_ : string) () =
  ({ global_table_name = global_table_name_ } : describe_global_table_input)
let make_describe_export_output
  ?export_description:(export_description_ : export_description option) () =
  ({ export_description = export_description_ } : describe_export_output)
let make_describe_export_input ~export_arn:(export_arn_ : string) () =
  ({ export_arn = export_arn_ } : describe_export_input)
let make_describe_endpoints_response ~endpoints:(endpoints_ : endpoint list)
  () = ({ endpoints = endpoints_ } : describe_endpoints_response)
let make_describe_endpoints_request () = (() : unit)
let make_describe_contributor_insights_output
  ?failure_exception:(failure_exception_ : failure_exception option)
  ?last_update_date_time:(last_update_date_time_ :
                           CoreTypes.Timestamp.t option)
  ?contributor_insights_status:(contributor_insights_status_ :
                                 contributor_insights_status option)
  ?contributor_insights_rule_list:(contributor_insights_rule_list_ :
                                    string list option)
  ?index_name:(index_name_ : string option)
  ?table_name:(table_name_ : string option) () =
  ({
     failure_exception = failure_exception_;
     last_update_date_time = last_update_date_time_;
     contributor_insights_status = contributor_insights_status_;
     contributor_insights_rule_list = contributor_insights_rule_list_;
     index_name = index_name_;
     table_name = table_name_
   } : describe_contributor_insights_output)
let make_describe_contributor_insights_input
  ?index_name:(index_name_ : string option)
  ~table_name:(table_name_ : string) () =
  ({ index_name = index_name_; table_name = table_name_ } : describe_contributor_insights_input)
let make_describe_continuous_backups_output
  ?continuous_backups_description:(continuous_backups_description_ :
                                    continuous_backups_description option)
  () =
  ({ continuous_backups_description = continuous_backups_description_ } : 
  describe_continuous_backups_output)
let make_describe_continuous_backups_input ~table_name:(table_name_ : string)
  () = ({ table_name = table_name_ } : describe_continuous_backups_input)
let make_backup_details
  ?backup_expiry_date_time:(backup_expiry_date_time_ :
                             CoreTypes.Timestamp.t option)
  ?backup_size_bytes:(backup_size_bytes_ : int option)
  ~backup_creation_date_time:(backup_creation_date_time_ :
                               CoreTypes.Timestamp.t)
  ~backup_type:(backup_type_ : backup_type)
  ~backup_status:(backup_status_ : backup_status)
  ~backup_name:(backup_name_ : string) ~backup_arn:(backup_arn_ : string) ()
  =
  ({
     backup_expiry_date_time = backup_expiry_date_time_;
     backup_creation_date_time = backup_creation_date_time_;
     backup_type = backup_type_;
     backup_status = backup_status_;
     backup_size_bytes = backup_size_bytes_;
     backup_name = backup_name_;
     backup_arn = backup_arn_
   } : backup_details)
let make_backup_description
  ?source_table_feature_details:(source_table_feature_details_ :
                                  source_table_feature_details option)
  ?source_table_details:(source_table_details_ : source_table_details option)
  ?backup_details:(backup_details_ : backup_details option) () =
  ({
     source_table_feature_details = source_table_feature_details_;
     source_table_details = source_table_details_;
     backup_details = backup_details_
   } : backup_description)
let make_describe_backup_output
  ?backup_description:(backup_description_ : backup_description option) () =
  ({ backup_description = backup_description_ } : describe_backup_output)
let make_describe_backup_input ~backup_arn:(backup_arn_ : string) () =
  ({ backup_arn = backup_arn_ } : describe_backup_input)
let make_delete_table_output
  ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : delete_table_output)
let make_delete_table_input ~table_name:(table_name_ : string) () =
  ({ table_name = table_name_ } : delete_table_input)
let make_delete_resource_policy_output
  ?revision_id:(revision_id_ : string option) () =
  ({ revision_id = revision_id_ } : delete_resource_policy_output)
let make_delete_resource_policy_input
  ?expected_revision_id:(expected_revision_id_ : string option)
  ~resource_arn:(resource_arn_ : string) () =
  ({
     expected_revision_id = expected_revision_id_;
     resource_arn = resource_arn_
   } : delete_resource_policy_input)
let make_delete_item_output
  ?item_collection_metrics:(item_collection_metrics_ :
                             item_collection_metrics option)
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
  ?attributes:(attributes_ : attribute_map option) () =
  ({
     item_collection_metrics = item_collection_metrics_;
     consumed_capacity = consumed_capacity_;
     attributes = attributes_
   } : delete_item_output)
let make_delete_item_input
  ?return_values_on_condition_check_failure:(return_values_on_condition_check_failure_
                                              :
                                              return_values_on_condition_check_failure
                                                option)
  ?expression_attribute_values:(expression_attribute_values_ :
                                 expression_attribute_value_map option)
  ?expression_attribute_names:(expression_attribute_names_ :
                                expression_attribute_name_map option)
  ?condition_expression:(condition_expression_ : string option)
  ?return_item_collection_metrics:(return_item_collection_metrics_ :
                                    return_item_collection_metrics option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ?return_values:(return_values_ : return_value option)
  ?conditional_operator:(conditional_operator_ : conditional_operator option)
  ?expected:(expected_ : expected_attribute_map option) ~key:(key_ : key)
  ~table_name:(table_name_ : string) () =
  ({
     return_values_on_condition_check_failure =
       return_values_on_condition_check_failure_;
     expression_attribute_values = expression_attribute_values_;
     expression_attribute_names = expression_attribute_names_;
     condition_expression = condition_expression_;
     return_item_collection_metrics = return_item_collection_metrics_;
     return_consumed_capacity = return_consumed_capacity_;
     return_values = return_values_;
     conditional_operator = conditional_operator_;
     expected = expected_;
     key = key_;
     table_name = table_name_
   } : delete_item_input)
let make_delete_backup_output
  ?backup_description:(backup_description_ : backup_description option) () =
  ({ backup_description = backup_description_ } : delete_backup_output)
let make_delete_backup_input ~backup_arn:(backup_arn_ : string) () =
  ({ backup_arn = backup_arn_ } : delete_backup_input)
let make_create_table_output
  ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : create_table_output)
let make_create_table_input
  ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
  ?resource_policy:(resource_policy_ : string option)
  ?deletion_protection_enabled:(deletion_protection_enabled_ : bool option)
  ?table_class:(table_class_ : table_class option)
  ?tags:(tags_ : tag list option)
  ?sse_specification:(sse_specification_ : sse_specification option)
  ?stream_specification:(stream_specification_ : stream_specification option)
  ?provisioned_throughput:(provisioned_throughput_ :
                            provisioned_throughput option)
  ?billing_mode:(billing_mode_ : billing_mode option)
  ?global_secondary_indexes:(global_secondary_indexes_ :
                              global_secondary_index list option)
  ?local_secondary_indexes:(local_secondary_indexes_ :
                             local_secondary_index list option)
  ~key_schema:(key_schema_ : key_schema_element list)
  ~table_name:(table_name_ : string)
  ~attribute_definitions:(attribute_definitions_ : attribute_definition list)
  () =
  ({
     on_demand_throughput = on_demand_throughput_;
     resource_policy = resource_policy_;
     deletion_protection_enabled = deletion_protection_enabled_;
     table_class = table_class_;
     tags = tags_;
     sse_specification = sse_specification_;
     stream_specification = stream_specification_;
     provisioned_throughput = provisioned_throughput_;
     billing_mode = billing_mode_;
     global_secondary_indexes = global_secondary_indexes_;
     local_secondary_indexes = local_secondary_indexes_;
     key_schema = key_schema_;
     table_name = table_name_;
     attribute_definitions = attribute_definitions_
   } : create_table_input)
let make_create_global_table_output
  ?global_table_description:(global_table_description_ :
                              global_table_description option)
  () =
  ({ global_table_description = global_table_description_ } : create_global_table_output)
let make_create_global_table_input
  ~replication_group:(replication_group_ : replica list)
  ~global_table_name:(global_table_name_ : string) () =
  ({
     replication_group = replication_group_;
     global_table_name = global_table_name_
   } : create_global_table_input)
let make_create_backup_output
  ?backup_details:(backup_details_ : backup_details option) () =
  ({ backup_details = backup_details_ } : create_backup_output)
let make_create_backup_input ~backup_name:(backup_name_ : string)
  ~table_name:(table_name_ : string) () =
  ({ backup_name = backup_name_; table_name = table_name_ } : create_backup_input)
let make_batch_write_item_output
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity list option)
  ?item_collection_metrics:(item_collection_metrics_ :
                             item_collection_metrics_per_table option)
  ?unprocessed_items:(unprocessed_items_ :
                       batch_write_item_request_map option)
  () =
  ({
     consumed_capacity = consumed_capacity_;
     item_collection_metrics = item_collection_metrics_;
     unprocessed_items = unprocessed_items_
   } : batch_write_item_output)
let make_batch_write_item_input
  ?return_item_collection_metrics:(return_item_collection_metrics_ :
                                    return_item_collection_metrics option)
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ~request_items:(request_items_ : batch_write_item_request_map) () =
  ({
     return_item_collection_metrics = return_item_collection_metrics_;
     return_consumed_capacity = return_consumed_capacity_;
     request_items = request_items_
   } : batch_write_item_input)
let make_batch_get_item_output
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity list option)
  ?unprocessed_keys:(unprocessed_keys_ : batch_get_request_map option)
  ?responses:(responses_ : batch_get_response_map option) () =
  ({
     consumed_capacity = consumed_capacity_;
     unprocessed_keys = unprocessed_keys_;
     responses = responses_
   } : batch_get_item_output)
let make_batch_get_item_input
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ~request_items:(request_items_ : batch_get_request_map) () =
  ({
     return_consumed_capacity = return_consumed_capacity_;
     request_items = request_items_
   } : batch_get_item_input)
let make_batch_execute_statement_output
  ?consumed_capacity:(consumed_capacity_ : consumed_capacity list option)
  ?responses:(responses_ : batch_statement_response list option) () =
  ({ consumed_capacity = consumed_capacity_; responses = responses_ } : 
  batch_execute_statement_output)
let make_batch_execute_statement_input
  ?return_consumed_capacity:(return_consumed_capacity_ :
                              return_consumed_capacity option)
  ~statements:(statements_ : batch_statement_request list) () =
  ({
     return_consumed_capacity = return_consumed_capacity_;
     statements = statements_
   } : batch_execute_statement_input)