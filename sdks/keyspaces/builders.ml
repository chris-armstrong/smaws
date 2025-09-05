open Types
let make_update_table_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : update_table_response)
let make_column_definition ~type_:(type__ : generic_string)
  ~name:(name_ : generic_string) () =
  ({ type_ = type__; name = name_ } : column_definition)
let make_capacity_specification
  ?write_capacity_units:(write_capacity_units_ : capacity_units option)
  ?read_capacity_units:(read_capacity_units_ : capacity_units option)
  ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     write_capacity_units = write_capacity_units_;
     read_capacity_units = read_capacity_units_;
     throughput_mode = throughput_mode_
   } : capacity_specification)
let make_encryption_specification
  ?kms_key_identifier:(kms_key_identifier_ : kms_key_ar_n option)
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
  ?scale_out_cooldown:(scale_out_cooldown_ : integer_object option)
  ?scale_in_cooldown:(scale_in_cooldown_ : integer_object option)
  ?disable_scale_in:(disable_scale_in_ : boolean_object option)
  ~target_value:(target_value_ : double_object) () =
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
  ?maximum_units:(maximum_units_ : capacity_units option)
  ?minimum_units:(minimum_units_ : capacity_units option)
  ?auto_scaling_disabled:(auto_scaling_disabled_ : boolean_object option) ()
  =
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
  ?read_capacity_units:(read_capacity_units_ : capacity_units option)
  ~region:(region_ : region) () =
  ({
     read_capacity_auto_scaling = read_capacity_auto_scaling_;
     read_capacity_units = read_capacity_units_;
     region = region_
   } : replica_specification)
let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)
let make_cdc_specification
  ?propagate_tags:(propagate_tags_ : cdc_propagate_tags option)
  ?tags:(tags_ : tag_list option) ?view_type:(view_type_ : view_type option)
  ~status:(status_ : cdc_status) () =
  ({
     propagate_tags = propagate_tags_;
     tags = tags_;
     view_type = view_type_;
     status = status_
   } : cdc_specification)
let make_update_table_request
  ?cdc_specification:(cdc_specification_ : cdc_specification option)
  ?replica_specifications:(replica_specifications_ :
                            replica_specification_list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?client_side_timestamps:(client_side_timestamps_ :
                            client_side_timestamps option)
  ?default_time_to_live:(default_time_to_live_ : default_time_to_live option)
  ?ttl:(ttl_ : time_to_live option)
  ?point_in_time_recovery:(point_in_time_recovery_ :
                            point_in_time_recovery option)
  ?encryption_specification:(encryption_specification_ :
                              encryption_specification option)
  ?capacity_specification:(capacity_specification_ :
                            capacity_specification option)
  ?add_columns:(add_columns_ : column_definition_list option)
  ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     cdc_specification = cdc_specification_;
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
let make_update_keyspace_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : update_keyspace_response)
let make_replication_specification
  ?region_list:(region_list_ : region_list option)
  ~replication_strategy:(replication_strategy_ : rs) () =
  ({ region_list = region_list_; replication_strategy = replication_strategy_
   } : replication_specification)
let make_update_keyspace_request
  ?client_side_timestamps:(client_side_timestamps_ :
                            client_side_timestamps option)
  ~replication_specification:(replication_specification_ :
                               replication_specification)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     client_side_timestamps = client_side_timestamps_;
     replication_specification = replication_specification_;
     keyspace_name = keyspace_name_
   } : update_keyspace_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tags:(tags_ : tag_list)
  ~resource_arn:(resource_arn_ : ar_n) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : untag_resource_request)
let make_tag_resource_response () = (() : unit)
let make_tag_resource_request ~tags:(tags_ : tag_list)
  ~resource_arn:(resource_arn_ : ar_n) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)
let make_table_summary ~resource_arn:(resource_arn_ : ar_n)
  ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     resource_arn = resource_arn_;
     table_name = table_name_;
     keyspace_name = keyspace_name_
   } : table_summary)
let make_static_column ~name:(name_ : generic_string) () =
  ({ name = name_ } : static_column)
let make_partition_key ~name:(name_ : generic_string) () =
  ({ name = name_ } : partition_key)
let make_clustering_key ~order_by:(order_by_ : sort_order)
  ~name:(name_ : generic_string) () =
  ({ order_by = order_by_; name = name_ } : clustering_key)
let make_schema_definition
  ?static_columns:(static_columns_ : static_column_list option)
  ?clustering_keys:(clustering_keys_ : clustering_key_list option)
  ~partition_keys:(partition_keys_ : partition_key_list)
  ~all_columns:(all_columns_ : column_definition_list) () =
  ({
     static_columns = static_columns_;
     clustering_keys = clustering_keys_;
     partition_keys = partition_keys_;
     all_columns = all_columns_
   } : schema_definition)
let make_restore_table_response
  ~restored_table_ar_n:(restored_table_ar_n_ : ar_n) () =
  ({ restored_table_ar_n = restored_table_ar_n_ } : restore_table_response)
let make_restore_table_request
  ?replica_specifications:(replica_specifications_ :
                            replica_specification_list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?tags_override:(tags_override_ : tag_list option)
  ?point_in_time_recovery_override:(point_in_time_recovery_override_ :
                                     point_in_time_recovery option)
  ?encryption_specification_override:(encryption_specification_override_ :
                                       encryption_specification option)
  ?capacity_specification_override:(capacity_specification_override_ :
                                     capacity_specification option)
  ?restore_timestamp:(restore_timestamp_ : timestamp option)
  ~target_table_name:(target_table_name_ : table_name)
  ~target_keyspace_name:(target_keyspace_name_ : keyspace_name)
  ~source_table_name:(source_table_name_ : table_name)
  ~source_keyspace_name:(source_keyspace_name_ : keyspace_name) () =
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
let make_replication_group_status
  ?tables_replication_progress:(tables_replication_progress_ :
                                 tables_replication_progress option)
  ~keyspace_status:(keyspace_status_ : keyspace_status)
  ~region:(region_ : region) () =
  ({
     tables_replication_progress = tables_replication_progress_;
     keyspace_status = keyspace_status_;
     region = region_
   } : replication_group_status)
let make_capacity_specification_summary
  ?last_update_to_pay_per_request_timestamp:(last_update_to_pay_per_request_timestamp_
                                              : timestamp option)
  ?write_capacity_units:(write_capacity_units_ : capacity_units option)
  ?read_capacity_units:(read_capacity_units_ : capacity_units option)
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
  ?status:(status_ : table_status option) ?region:(region_ : region option)
  () =
  ({
     capacity_specification = capacity_specification_;
     status = status_;
     region = region_
   } : replica_specification_summary)
let make_replica_auto_scaling_specification
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?region:(region_ : region option) () =
  ({
     auto_scaling_specification = auto_scaling_specification_;
     region = region_
   } : replica_auto_scaling_specification)
let make_point_in_time_recovery_summary
  ?earliest_restorable_timestamp:(earliest_restorable_timestamp_ :
                                   timestamp option)
  ~status:(status_ : point_in_time_recovery_status) () =
  ({
     earliest_restorable_timestamp = earliest_restorable_timestamp_;
     status = status_
   } : point_in_time_recovery_summary)
let make_list_types_response ?next_token:(next_token_ : next_token option)
  ~types:(types_ : type_name_list) () =
  ({ types = types_; next_token = next_token_ } : list_types_response)
let make_list_types_request ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     keyspace_name = keyspace_name_;
     max_results = max_results_;
     next_token = next_token_
   } : list_types_request)
let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
  ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ~resource_arn:(resource_arn_ : ar_n) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_arn = resource_arn_
   } : list_tags_for_resource_request)
let make_list_tables_response ?tables:(tables_ : table_summary_list option)
  ?next_token:(next_token_ : next_token option) () =
  ({ tables = tables_; next_token = next_token_ } : list_tables_response)
let make_list_tables_request ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     keyspace_name = keyspace_name_;
     max_results = max_results_;
     next_token = next_token_
   } : list_tables_request)
let make_keyspace_summary
  ?replication_regions:(replication_regions_ : region_list option)
  ~replication_strategy:(replication_strategy_ : rs)
  ~resource_arn:(resource_arn_ : ar_n)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     replication_regions = replication_regions_;
     replication_strategy = replication_strategy_;
     resource_arn = resource_arn_;
     keyspace_name = keyspace_name_
   } : keyspace_summary)
let make_list_keyspaces_response
  ?next_token:(next_token_ : next_token option)
  ~keyspaces:(keyspaces_ : keyspace_summary_list) () =
  ({ keyspaces = keyspaces_; next_token = next_token_ } : list_keyspaces_response)
let make_list_keyspaces_request
  ?max_results:(max_results_ : max_results option)
  ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_keyspaces_request)
let make_field_definition ~type_:(type__ : generic_string)
  ~name:(name_ : generic_string) () =
  ({ type_ = type__; name = name_ } : field_definition)
let make_get_type_response
  ?max_nesting_depth:(max_nesting_depth_ : depth option)
  ?direct_parent_types:(direct_parent_types_ : type_name_list option)
  ?direct_referring_tables:(direct_referring_tables_ :
                             table_name_list option)
  ?status:(status_ : type_status option)
  ?last_modified_timestamp:(last_modified_timestamp_ : timestamp option)
  ?field_definitions:(field_definitions_ : field_list option)
  ~keyspace_arn:(keyspace_arn_ : ar_n) ~type_name:(type_name_ : type_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     keyspace_arn = keyspace_arn_;
     max_nesting_depth = max_nesting_depth_;
     direct_parent_types = direct_parent_types_;
     direct_referring_tables = direct_referring_tables_;
     status = status_;
     last_modified_timestamp = last_modified_timestamp_;
     field_definitions = field_definitions_;
     type_name = type_name_;
     keyspace_name = keyspace_name_
   } : get_type_response)
let make_get_type_request ~type_name:(type_name_ : type_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ type_name = type_name_; keyspace_name = keyspace_name_ } : get_type_request)
let make_get_table_auto_scaling_settings_response
  ?replica_specifications:(replica_specifications_ :
                            replica_auto_scaling_specification_list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ~resource_arn:(resource_arn_ : ar_n) ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     replica_specifications = replica_specifications_;
     auto_scaling_specification = auto_scaling_specification_;
     resource_arn = resource_arn_;
     table_name = table_name_;
     keyspace_name = keyspace_name_
   } : get_table_auto_scaling_settings_response)
let make_get_table_auto_scaling_settings_request
  ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ table_name = table_name_; keyspace_name = keyspace_name_ } : get_table_auto_scaling_settings_request)
let make_comment ~message:(message_ : Smaws_Lib.Smithy_api.string_) () =
  ({ message = message_ } : comment)
let make_cdc_specification_summary ?view_type:(view_type_ : view_type option)
  ~status:(status_ : cdc_status) () =
  ({ view_type = view_type_; status = status_ } : cdc_specification_summary)
let make_get_table_response
  ?cdc_specification:(cdc_specification_ : cdc_specification_summary option)
  ?latest_stream_arn:(latest_stream_arn_ : stream_arn option)
  ?replica_specifications:(replica_specifications_ :
                            replica_specification_summary_list option)
  ?client_side_timestamps:(client_side_timestamps_ :
                            client_side_timestamps option)
  ?comment:(comment_ : comment option)
  ?default_time_to_live:(default_time_to_live_ : default_time_to_live option)
  ?ttl:(ttl_ : time_to_live option)
  ?point_in_time_recovery:(point_in_time_recovery_ :
                            point_in_time_recovery_summary option)
  ?encryption_specification:(encryption_specification_ :
                              encryption_specification option)
  ?capacity_specification:(capacity_specification_ :
                            capacity_specification_summary option)
  ?schema_definition:(schema_definition_ : schema_definition option)
  ?status:(status_ : table_status option)
  ?creation_timestamp:(creation_timestamp_ : timestamp option)
  ~resource_arn:(resource_arn_ : ar_n) ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     cdc_specification = cdc_specification_;
     latest_stream_arn = latest_stream_arn_;
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
let make_get_table_request ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ table_name = table_name_; keyspace_name = keyspace_name_ } : get_table_request)
let make_get_keyspace_response
  ?replication_group_statuses:(replication_group_statuses_ :
                                replication_group_status_list option)
  ?replication_regions:(replication_regions_ : region_list option)
  ~replication_strategy:(replication_strategy_ : rs)
  ~resource_arn:(resource_arn_ : ar_n)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     replication_group_statuses = replication_group_statuses_;
     replication_regions = replication_regions_;
     replication_strategy = replication_strategy_;
     resource_arn = resource_arn_;
     keyspace_name = keyspace_name_
   } : get_keyspace_response)
let make_get_keyspace_request ~keyspace_name:(keyspace_name_ : keyspace_name)
  () = ({ keyspace_name = keyspace_name_ } : get_keyspace_request)
let make_delete_type_response ~type_name:(type_name_ : type_name)
  ~keyspace_arn:(keyspace_arn_ : ar_n) () =
  ({ type_name = type_name_; keyspace_arn = keyspace_arn_ } : delete_type_response)
let make_delete_type_request ~type_name:(type_name_ : type_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ type_name = type_name_; keyspace_name = keyspace_name_ } : delete_type_request)
let make_delete_table_response () = (() : unit)
let make_delete_table_request ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ table_name = table_name_; keyspace_name = keyspace_name_ } : delete_table_request)
let make_delete_keyspace_response () = (() : unit)
let make_delete_keyspace_request
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ keyspace_name = keyspace_name_ } : delete_keyspace_request)
let make_create_type_response ~type_name:(type_name_ : type_name)
  ~keyspace_arn:(keyspace_arn_ : ar_n) () =
  ({ type_name = type_name_; keyspace_arn = keyspace_arn_ } : create_type_response)
let make_create_type_request
  ~field_definitions:(field_definitions_ : field_list)
  ~type_name:(type_name_ : type_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     field_definitions = field_definitions_;
     type_name = type_name_;
     keyspace_name = keyspace_name_
   } : create_type_request)
let make_create_table_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : create_table_response)
let make_create_table_request
  ?cdc_specification:(cdc_specification_ : cdc_specification option)
  ?replica_specifications:(replica_specifications_ :
                            replica_specification_list option)
  ?auto_scaling_specification:(auto_scaling_specification_ :
                                auto_scaling_specification option)
  ?client_side_timestamps:(client_side_timestamps_ :
                            client_side_timestamps option)
  ?tags:(tags_ : tag_list option)
  ?default_time_to_live:(default_time_to_live_ : default_time_to_live option)
  ?ttl:(ttl_ : time_to_live option)
  ?point_in_time_recovery:(point_in_time_recovery_ :
                            point_in_time_recovery option)
  ?encryption_specification:(encryption_specification_ :
                              encryption_specification option)
  ?capacity_specification:(capacity_specification_ :
                            capacity_specification option)
  ?comment:(comment_ : comment option)
  ~schema_definition:(schema_definition_ : schema_definition)
  ~table_name:(table_name_ : table_name)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     cdc_specification = cdc_specification_;
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
let make_create_keyspace_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : create_keyspace_response)
let make_create_keyspace_request
  ?replication_specification:(replication_specification_ :
                               replication_specification option)
  ?tags:(tags_ : tag_list option)
  ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     replication_specification = replication_specification_;
     tags = tags_;
     keyspace_name = keyspace_name_
   } : create_keyspace_request)