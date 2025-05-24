open Smaws_Lib
open Types
let make_update_table_response ~resource_arn:(resource_arn_ : string) () =
  ({ resource_arn = resource_arn_ } : update_table_response)
let make_column_definition ~type_:(type__ : string) ~name:(name_ : string) ()
  = ({ type_ = type__; name = name_ } : column_definition)
let make_capacity_specification
  ?write_capacity_units:(write_capacity_units_ : int option)
  ?read_capacity_units:(read_capacity_units_ : int option)
  ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     write_capacity_units = write_capacity_units_;
     read_capacity_units = read_capacity_units_;
     throughput_mode = throughput_mode_
   } : capacity_specification)
let make_encryption_specification
  ?kms_key_identifier:(kms_key_identifier_ : string option)
  ~type_:(type__ : encryption_type) () =
  ({ kms_key_identifier = kms_key_identifier_; type_ = type__ } : encryption_specification)
let make_point_in_time_recovery
  ~status:(status_ : point_in_time_recovery_status) () =
  ({ status = status_ } : point_in_time_recovery)
let make_time_to_live ~status:(status_ : time_to_live_status) () =
  ({ status = status_ } : time_to_live)
let make_client_side_timestamps
  ~status:(status_ : client_side_timestamps_status) () =
  ({ status = status_ } : client_side_timestamps)
let make_target_tracking_scaling_policy_configuration
  ?scale_out_cooldown:(scale_out_cooldown_ : int option)
  ?scale_in_cooldown:(scale_in_cooldown_ : int option)
  ?disable_scale_in:(disable_scale_in_ : bool option)
  ~target_value:(target_value_ : float) () =
  ({
     target_value = target_value_;
     scale_out_cooldown = scale_out_cooldown_;
     scale_in_cooldown = scale_in_cooldown_;
     disable_scale_in = disable_scale_in_
   } : target_tracking_scaling_policy_configuration)
let make_auto_scaling_policy
  ?target_tracking_scaling_policy_configuration:(target_tracking_scaling_policy_configuration_
                                                  :
                                                  target_tracking_scaling_policy_configuration
                                                    option)
  () =
  ({
     target_tracking_scaling_policy_configuration =
       target_tracking_scaling_policy_configuration_
   } : auto_scaling_policy)
let make_auto_scaling_settings
  ?scaling_policy:(scaling_policy_ : auto_scaling_policy option)
  ?maximum_units:(maximum_units_ : int option)
  ?minimum_units:(minimum_units_ : int option)
  ?auto_scaling_disabled:(auto_scaling_disabled_ : bool option) () =
  ({
     scaling_policy = scaling_policy_;
     maximum_units = maximum_units_;
     minimum_units = minimum_units_;
     auto_scaling_disabled = auto_scaling_disabled_
   } : auto_scaling_settings)
let make_auto_scaling_specification
  ?read_capacity_auto_scaling:(read_capacity_auto_scaling_ :
                                auto_scaling_settings option)
  ?write_capacity_auto_scaling:(write_capacity_auto_scaling_ :
                                 auto_scaling_settings option)
  () =
  ({
     read_capacity_auto_scaling = read_capacity_auto_scaling_;
     write_capacity_auto_scaling = write_capacity_auto_scaling_
   } : auto_scaling_specification)
let make_replica_specification
  ?read_capacity_auto_scaling:(read_capacity_auto_scaling_ :
                                auto_scaling_settings option)
  ?read_capacity_units:(read_capacity_units_ : int option)
  ~region:(region_ : string) () =
  ({
     read_capacity_auto_scaling = read_capacity_auto_scaling_;
     read_capacity_units = read_capacity_units_;
     region = region_
   } : replica_specification)
let make_update_table_request
  ?replica_specifications:(replica_specifications_ :
                            replica_specification list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?client_side_timestamps:(client_side_timestamps_ :
                            client_side_timestamps option)
  ?default_time_to_live:(default_time_to_live_ : int option)
  ?ttl:(ttl_ : time_to_live option)
  ?point_in_time_recovery:(point_in_time_recovery_ :
                            point_in_time_recovery option)
  ?encryption_specification:(encryption_specification_ :
                              encryption_specification option)
  ?capacity_specification:(capacity_specification_ :
                            capacity_specification option)
  ?add_columns:(add_columns_ : column_definition list option)
  ~table_name:(table_name_ : string) ~keyspace_name:(keyspace_name_ : string)
  () =
  ({
     replica_specifications = replica_specifications_;
     auto_scaling_specification = auto_scaling_specification_;
     client_side_timestamps = client_side_timestamps_;
     default_time_to_live = default_time_to_live_;
     ttl = ttl_;
     point_in_time_recovery = point_in_time_recovery_;
     encryption_specification = encryption_specification_;
     capacity_specification = capacity_specification_;
     add_columns = add_columns_;
     table_name = table_name_;
     keyspace_name = keyspace_name_
   } : update_table_request)
let make_untag_resource_response () = (() : unit)
let make_tag ~value:(value_ : string) ~key:(key_ : string) () =
  ({ value = value_; key = key_ } : tag)
let make_untag_resource_request ~tags:(tags_ : tag list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : untag_resource_request)
let make_tag_resource_response () = (() : unit)
let make_tag_resource_request ~tags:(tags_ : tag list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)
let make_table_summary ~resource_arn:(resource_arn_ : string)
  ~table_name:(table_name_ : string) ~keyspace_name:(keyspace_name_ : string)
  () =
  ({
     resource_arn = resource_arn_;
     table_name = table_name_;
     keyspace_name = keyspace_name_
   } : table_summary)
let make_static_column ~name:(name_ : string) () =
  ({ name = name_ } : static_column)
let make_partition_key ~name:(name_ : string) () =
  ({ name = name_ } : partition_key)
let make_clustering_key ~order_by:(order_by_ : sort_order)
  ~name:(name_ : string) () =
  ({ order_by = order_by_; name = name_ } : clustering_key)
let make_schema_definition
  ?static_columns:(static_columns_ : static_column list option)
  ?clustering_keys:(clustering_keys_ : clustering_key list option)
  ~partition_keys:(partition_keys_ : partition_key list)
  ~all_columns:(all_columns_ : column_definition list) () =
  ({
     static_columns = static_columns_;
     clustering_keys = clustering_keys_;
     partition_keys = partition_keys_;
     all_columns = all_columns_
   } : schema_definition)
let make_restore_table_response
  ~restored_table_ar_n:(restored_table_ar_n_ : string) () =
  ({ restored_table_ar_n = restored_table_ar_n_ } : restore_table_response)
let make_restore_table_request
  ?replica_specifications:(replica_specifications_ :
                            replica_specification list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?tags_override:(tags_override_ : tag list option)
  ?point_in_time_recovery_override:(point_in_time_recovery_override_ :
                                     point_in_time_recovery option)
  ?encryption_specification_override:(encryption_specification_override_ :
                                       encryption_specification option)
  ?capacity_specification_override:(capacity_specification_override_ :
                                     capacity_specification option)
  ?restore_timestamp:(restore_timestamp_ : CoreTypes.Timestamp.t option)
  ~target_table_name:(target_table_name_ : string)
  ~target_keyspace_name:(target_keyspace_name_ : string)
  ~source_table_name:(source_table_name_ : string)
  ~source_keyspace_name:(source_keyspace_name_ : string) () =
  ({
     replica_specifications = replica_specifications_;
     auto_scaling_specification = auto_scaling_specification_;
     tags_override = tags_override_;
     point_in_time_recovery_override = point_in_time_recovery_override_;
     encryption_specification_override = encryption_specification_override_;
     capacity_specification_override = capacity_specification_override_;
     restore_timestamp = restore_timestamp_;
     target_table_name = target_table_name_;
     target_keyspace_name = target_keyspace_name_;
     source_table_name = source_table_name_;
     source_keyspace_name = source_keyspace_name_
   } : restore_table_request)
let make_replication_specification
  ?region_list:(region_list_ : string list option)
  ~replication_strategy:(replication_strategy_ : rs) () =
  ({ region_list = region_list_; replication_strategy = replication_strategy_
   } : replication_specification)
let make_capacity_specification_summary
  ?last_update_to_pay_per_request_timestamp:(last_update_to_pay_per_request_timestamp_
                                              : CoreTypes.Timestamp.t option)
  ?write_capacity_units:(write_capacity_units_ : int option)
  ?read_capacity_units:(read_capacity_units_ : int option)
  ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     last_update_to_pay_per_request_timestamp =
       last_update_to_pay_per_request_timestamp_;
     write_capacity_units = write_capacity_units_;
     read_capacity_units = read_capacity_units_;
     throughput_mode = throughput_mode_
   } : capacity_specification_summary)
let make_replica_specification_summary
  ?capacity_specification:(capacity_specification_ :
                            capacity_specification_summary option)
  ?status:(status_ : table_status option) ?region:(region_ : string option)
  () =
  ({
     capacity_specification = capacity_specification_;
     status = status_;
     region = region_
   } : replica_specification_summary)
let make_replica_auto_scaling_specification
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?region:(region_ : string option) () =
  ({
     auto_scaling_specification = auto_scaling_specification_;
     region = region_
   } : replica_auto_scaling_specification)
let make_point_in_time_recovery_summary
  ?earliest_restorable_timestamp:(earliest_restorable_timestamp_ :
                                   CoreTypes.Timestamp.t option)
  ~status:(status_ : point_in_time_recovery_status) () =
  ({
     earliest_restorable_timestamp = earliest_restorable_timestamp_;
     status = status_
   } : point_in_time_recovery_summary)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option)
  ?next_token:(next_token_ : string option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~resource_arn:(resource_arn_ : string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_arn = resource_arn_
   } : list_tags_for_resource_request)
let make_list_tables_response ?tables:(tables_ : table_summary list option)
  ?next_token:(next_token_ : string option) () =
  ({ tables = tables_; next_token = next_token_ } : list_tables_response)
let make_list_tables_request ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~keyspace_name:(keyspace_name_ : string) () =
  ({
     keyspace_name = keyspace_name_;
     max_results = max_results_;
     next_token = next_token_
   } : list_tables_request)
let make_keyspace_summary
  ?replication_regions:(replication_regions_ : string list option)
  ~replication_strategy:(replication_strategy_ : rs)
  ~resource_arn:(resource_arn_ : string)
  ~keyspace_name:(keyspace_name_ : string) () =
  ({
     replication_regions = replication_regions_;
     replication_strategy = replication_strategy_;
     resource_arn = resource_arn_;
     keyspace_name = keyspace_name_
   } : keyspace_summary)
let make_list_keyspaces_response ?next_token:(next_token_ : string option)
  ~keyspaces:(keyspaces_ : keyspace_summary list) () =
  ({ keyspaces = keyspaces_; next_token = next_token_ } : list_keyspaces_response)
let make_list_keyspaces_request ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_keyspaces_request)
let make_get_table_auto_scaling_settings_response
  ?replica_specifications:(replica_specifications_ :
                            replica_auto_scaling_specification list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ~resource_arn:(resource_arn_ : string) ~table_name:(table_name_ : string)
  ~keyspace_name:(keyspace_name_ : string) () =
  ({
     replica_specifications = replica_specifications_;
     auto_scaling_specification = auto_scaling_specification_;
     resource_arn = resource_arn_;
     table_name = table_name_;
     keyspace_name = keyspace_name_
   } : get_table_auto_scaling_settings_response)
let make_get_table_auto_scaling_settings_request
  ~table_name:(table_name_ : string) ~keyspace_name:(keyspace_name_ : string)
  () =
  ({ table_name = table_name_; keyspace_name = keyspace_name_ } : get_table_auto_scaling_settings_request)
let make_comment ~message:(message_ : string) () =
  ({ message = message_ } : comment)
let make_get_table_response
  ?replica_specifications:(replica_specifications_ :
                            replica_specification_summary list option)
  ?client_side_timestamps:(client_side_timestamps_ :
                            client_side_timestamps option)
  ?comment:(comment_ : comment option)
  ?default_time_to_live:(default_time_to_live_ : int option)
  ?ttl:(ttl_ : time_to_live option)
  ?point_in_time_recovery:(point_in_time_recovery_ :
                            point_in_time_recovery_summary option)
  ?encryption_specification:(encryption_specification_ :
                              encryption_specification option)
  ?capacity_specification:(capacity_specification_ :
                            capacity_specification_summary option)
  ?schema_definition:(schema_definition_ : schema_definition option)
  ?status:(status_ : table_status option)
  ?creation_timestamp:(creation_timestamp_ : CoreTypes.Timestamp.t option)
  ~resource_arn:(resource_arn_ : string) ~table_name:(table_name_ : string)
  ~keyspace_name:(keyspace_name_ : string) () =
  ({
     replica_specifications = replica_specifications_;
     client_side_timestamps = client_side_timestamps_;
     comment = comment_;
     default_time_to_live = default_time_to_live_;
     ttl = ttl_;
     point_in_time_recovery = point_in_time_recovery_;
     encryption_specification = encryption_specification_;
     capacity_specification = capacity_specification_;
     schema_definition = schema_definition_;
     status = status_;
     creation_timestamp = creation_timestamp_;
     resource_arn = resource_arn_;
     table_name = table_name_;
     keyspace_name = keyspace_name_
   } : get_table_response)
let make_get_table_request ~table_name:(table_name_ : string)
  ~keyspace_name:(keyspace_name_ : string) () =
  ({ table_name = table_name_; keyspace_name = keyspace_name_ } : get_table_request)
let make_get_keyspace_response
  ?replication_regions:(replication_regions_ : string list option)
  ~replication_strategy:(replication_strategy_ : rs)
  ~resource_arn:(resource_arn_ : string)
  ~keyspace_name:(keyspace_name_ : string) () =
  ({
     replication_regions = replication_regions_;
     replication_strategy = replication_strategy_;
     resource_arn = resource_arn_;
     keyspace_name = keyspace_name_
   } : get_keyspace_response)
let make_get_keyspace_request ~keyspace_name:(keyspace_name_ : string) () =
  ({ keyspace_name = keyspace_name_ } : get_keyspace_request)
let make_delete_table_response () = (() : unit)
let make_delete_table_request ~table_name:(table_name_ : string)
  ~keyspace_name:(keyspace_name_ : string) () =
  ({ table_name = table_name_; keyspace_name = keyspace_name_ } : delete_table_request)
let make_delete_keyspace_response () = (() : unit)
let make_delete_keyspace_request ~keyspace_name:(keyspace_name_ : string) ()
  = ({ keyspace_name = keyspace_name_ } : delete_keyspace_request)
let make_create_table_response ~resource_arn:(resource_arn_ : string) () =
  ({ resource_arn = resource_arn_ } : create_table_response)
let make_create_table_request
  ?replica_specifications:(replica_specifications_ :
                            replica_specification list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?client_side_timestamps:(client_side_timestamps_ :
                            client_side_timestamps option)
  ?tags:(tags_ : tag list option)
  ?default_time_to_live:(default_time_to_live_ : int option)
  ?ttl:(ttl_ : time_to_live option)
  ?point_in_time_recovery:(point_in_time_recovery_ :
                            point_in_time_recovery option)
  ?encryption_specification:(encryption_specification_ :
                              encryption_specification option)
  ?capacity_specification:(capacity_specification_ :
                            capacity_specification option)
  ?comment:(comment_ : comment option)
  ~schema_definition:(schema_definition_ : schema_definition)
  ~table_name:(table_name_ : string) ~keyspace_name:(keyspace_name_ : string)
  () =
  ({
     replica_specifications = replica_specifications_;
     auto_scaling_specification = auto_scaling_specification_;
     client_side_timestamps = client_side_timestamps_;
     tags = tags_;
     default_time_to_live = default_time_to_live_;
     ttl = ttl_;
     point_in_time_recovery = point_in_time_recovery_;
     encryption_specification = encryption_specification_;
     capacity_specification = capacity_specification_;
     comment = comment_;
     schema_definition = schema_definition_;
     table_name = table_name_;
     keyspace_name = keyspace_name_
   } : create_table_request)
let make_create_keyspace_response ~resource_arn:(resource_arn_ : string) () =
  ({ resource_arn = resource_arn_ } : create_keyspace_response)
let make_create_keyspace_request
  ?replication_specification:(replication_specification_ :
                               replication_specification option)
  ?tags:(tags_ : tag list option) ~keyspace_name:(keyspace_name_ : string) ()
  =
  ({
     replication_specification = replication_specification_;
     tags = tags_;
     keyspace_name = keyspace_name_
   } : create_keyspace_request)