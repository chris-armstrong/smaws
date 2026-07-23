open Types

let make_target_tracking_scaling_policy_configuration
    ?disable_scale_in:(disable_scale_in_ : boolean_object option)
    ?scale_in_cooldown:(scale_in_cooldown_ : integer_object option)
    ?scale_out_cooldown:(scale_out_cooldown_ : integer_object option)
    ~target_value:(target_value_ : double_object) () =
  ({
     disable_scale_in = disable_scale_in_;
     scale_in_cooldown = scale_in_cooldown_;
     scale_out_cooldown = scale_out_cooldown_;
     target_value = target_value_;
   }
    : target_tracking_scaling_policy_configuration)

let make_auto_scaling_policy
    ?target_tracking_scaling_policy_configuration:
      (target_tracking_scaling_policy_configuration_ :
         target_tracking_scaling_policy_configuration option) () =
  ({ target_tracking_scaling_policy_configuration = target_tracking_scaling_policy_configuration_ }
    : auto_scaling_policy)

let make_auto_scaling_settings
    ?auto_scaling_disabled:(auto_scaling_disabled_ : boolean_object option)
    ?minimum_units:(minimum_units_ : capacity_units option)
    ?maximum_units:(maximum_units_ : capacity_units option)
    ?scaling_policy:(scaling_policy_ : auto_scaling_policy option) () =
  ({
     auto_scaling_disabled = auto_scaling_disabled_;
     minimum_units = minimum_units_;
     maximum_units = maximum_units_;
     scaling_policy = scaling_policy_;
   }
    : auto_scaling_settings)

let make_auto_scaling_specification
    ?write_capacity_auto_scaling:(write_capacity_auto_scaling_ : auto_scaling_settings option)
    ?read_capacity_auto_scaling:(read_capacity_auto_scaling_ : auto_scaling_settings option) () =
  ({
     write_capacity_auto_scaling = write_capacity_auto_scaling_;
     read_capacity_auto_scaling = read_capacity_auto_scaling_;
   }
    : auto_scaling_specification)

let make_capacity_specification ?read_capacity_units:(read_capacity_units_ : capacity_units option)
    ?write_capacity_units:(write_capacity_units_ : capacity_units option)
    ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     throughput_mode = throughput_mode_;
     read_capacity_units = read_capacity_units_;
     write_capacity_units = write_capacity_units_;
   }
    : capacity_specification)

let make_capacity_specification_summary
    ?read_capacity_units:(read_capacity_units_ : capacity_units option)
    ?write_capacity_units:(write_capacity_units_ : capacity_units option)
    ?last_update_to_pay_per_request_timestamp:
      (last_update_to_pay_per_request_timestamp_ : timestamp option)
    ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     throughput_mode = throughput_mode_;
     read_capacity_units = read_capacity_units_;
     write_capacity_units = write_capacity_units_;
     last_update_to_pay_per_request_timestamp = last_update_to_pay_per_request_timestamp_;
   }
    : capacity_specification_summary)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_cdc_specification ?view_type:(view_type_ : view_type option)
    ?tags:(tags_ : tag_list option) ?propagate_tags:(propagate_tags_ : cdc_propagate_tags option)
    ~status:(status_ : cdc_status) () =
  ({ status = status_; view_type = view_type_; tags = tags_; propagate_tags = propagate_tags_ }
    : cdc_specification)

let make_cdc_specification_summary ?view_type:(view_type_ : view_type option)
    ~status:(status_ : cdc_status) () =
  ({ status = status_; view_type = view_type_ } : cdc_specification_summary)

let make_client_side_timestamps ~status:(status_ : client_side_timestamps_status) () =
  ({ status = status_ } : client_side_timestamps)

let make_clustering_key ~name:(name_ : generic_string) ~order_by:(order_by_ : sort_order) () =
  ({ name = name_; order_by = order_by_ } : clustering_key)

let make_column_definition ~name:(name_ : generic_string) ~type_:(type__ : generic_string) () =
  ({ name = name_; type_ = type__ } : column_definition)

let make_comment ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_ } : comment)

let make_create_keyspace_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : create_keyspace_response)

let make_replication_specification ?region_list:(region_list_ : region_list option)
    ~replication_strategy:(replication_strategy_ : rs) () =
  ({ replication_strategy = replication_strategy_; region_list = region_list_ }
    : replication_specification)

let make_create_keyspace_request ?tags:(tags_ : tag_list option)
    ?replication_specification:(replication_specification_ : replication_specification option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({
     keyspace_name = keyspace_name_;
     tags = tags_;
     replication_specification = replication_specification_;
   }
    : create_keyspace_request)

let make_create_table_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : create_table_response)

let make_warm_throughput_specification
    ?read_units_per_second:(read_units_per_second_ : Smaws_Lib.Smithy_api.Types.long option)
    ?write_units_per_second:(write_units_per_second_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     read_units_per_second = read_units_per_second_;
     write_units_per_second = write_units_per_second_;
   }
    : warm_throughput_specification)

let make_replica_specification ?read_capacity_units:(read_capacity_units_ : capacity_units option)
    ?read_capacity_auto_scaling:(read_capacity_auto_scaling_ : auto_scaling_settings option)
    ~region:(region_ : region) () =
  ({
     region = region_;
     read_capacity_units = read_capacity_units_;
     read_capacity_auto_scaling = read_capacity_auto_scaling_;
   }
    : replica_specification)

let make_time_to_live ~status:(status_ : time_to_live_status) () =
  ({ status = status_ } : time_to_live)

let make_point_in_time_recovery ~status:(status_ : point_in_time_recovery_status) () =
  ({ status = status_ } : point_in_time_recovery)

let make_encryption_specification ?kms_key_identifier:(kms_key_identifier_ : kms_key_ar_n option)
    ~type_:(type__ : encryption_type) () =
  ({ type_ = type__; kms_key_identifier = kms_key_identifier_ } : encryption_specification)

let make_static_column ~name:(name_ : generic_string) () = ({ name = name_ } : static_column)
let make_partition_key ~name:(name_ : generic_string) () = ({ name = name_ } : partition_key)

let make_schema_definition ?clustering_keys:(clustering_keys_ : clustering_key_list option)
    ?static_columns:(static_columns_ : static_column_list option)
    ~all_columns:(all_columns_ : column_definition_list)
    ~partition_keys:(partition_keys_ : partition_key_list) () =
  ({
     all_columns = all_columns_;
     partition_keys = partition_keys_;
     clustering_keys = clustering_keys_;
     static_columns = static_columns_;
   }
    : schema_definition)

let make_create_table_request ?comment:(comment_ : comment option)
    ?capacity_specification:(capacity_specification_ : capacity_specification option)
    ?encryption_specification:(encryption_specification_ : encryption_specification option)
    ?point_in_time_recovery:(point_in_time_recovery_ : point_in_time_recovery option)
    ?ttl:(ttl_ : time_to_live option)
    ?default_time_to_live:(default_time_to_live_ : default_time_to_live option)
    ?tags:(tags_ : tag_list option)
    ?client_side_timestamps:(client_side_timestamps_ : client_side_timestamps option)
    ?auto_scaling_specification:(auto_scaling_specification_ : auto_scaling_specification option)
    ?replica_specifications:(replica_specifications_ : replica_specification_list option)
    ?cdc_specification:(cdc_specification_ : cdc_specification option)
    ?warm_throughput_specification:
      (warm_throughput_specification_ : warm_throughput_specification option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~table_name:(table_name_ : table_name)
    ~schema_definition:(schema_definition_ : schema_definition) () =
  ({
     keyspace_name = keyspace_name_;
     table_name = table_name_;
     schema_definition = schema_definition_;
     comment = comment_;
     capacity_specification = capacity_specification_;
     encryption_specification = encryption_specification_;
     point_in_time_recovery = point_in_time_recovery_;
     ttl = ttl_;
     default_time_to_live = default_time_to_live_;
     tags = tags_;
     client_side_timestamps = client_side_timestamps_;
     auto_scaling_specification = auto_scaling_specification_;
     replica_specifications = replica_specifications_;
     cdc_specification = cdc_specification_;
     warm_throughput_specification = warm_throughput_specification_;
   }
    : create_table_request)

let make_create_type_response ~keyspace_arn:(keyspace_arn_ : ar_n)
    ~type_name:(type_name_ : type_name) () =
  ({ keyspace_arn = keyspace_arn_; type_name = type_name_ } : create_type_response)

let make_field_definition ~name:(name_ : generic_string) ~type_:(type__ : generic_string) () =
  ({ name = name_; type_ = type__ } : field_definition)

let make_create_type_request ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~type_name:(type_name_ : type_name) ~field_definitions:(field_definitions_ : field_list) () =
  ({
     keyspace_name = keyspace_name_;
     type_name = type_name_;
     field_definitions = field_definitions_;
   }
    : create_type_request)

let make_delete_keyspace_response () = (() : unit)

let make_delete_keyspace_request ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ keyspace_name = keyspace_name_ } : delete_keyspace_request)

let make_delete_table_response () = (() : unit)

let make_delete_table_request ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~table_name:(table_name_ : table_name) () =
  ({ keyspace_name = keyspace_name_; table_name = table_name_ } : delete_table_request)

let make_delete_type_response ~keyspace_arn:(keyspace_arn_ : ar_n)
    ~type_name:(type_name_ : type_name) () =
  ({ keyspace_arn = keyspace_arn_; type_name = type_name_ } : delete_type_response)

let make_delete_type_request ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~type_name:(type_name_ : type_name) () =
  ({ keyspace_name = keyspace_name_; type_name = type_name_ } : delete_type_request)

let make_replication_group_status
    ?tables_replication_progress:(tables_replication_progress_ : tables_replication_progress option)
    ~region:(region_ : region) ~keyspace_status:(keyspace_status_ : keyspace_status) () =
  ({
     region = region_;
     keyspace_status = keyspace_status_;
     tables_replication_progress = tables_replication_progress_;
   }
    : replication_group_status)

let make_get_keyspace_response ?replication_regions:(replication_regions_ : region_list option)
    ?replication_group_statuses:(replication_group_statuses_ : replication_group_status_list option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~resource_arn:(resource_arn_ : ar_n)
    ~replication_strategy:(replication_strategy_ : rs) () =
  ({
     keyspace_name = keyspace_name_;
     resource_arn = resource_arn_;
     replication_strategy = replication_strategy_;
     replication_regions = replication_regions_;
     replication_group_statuses = replication_group_statuses_;
   }
    : get_keyspace_response)

let make_get_keyspace_request ~keyspace_name:(keyspace_name_ : keyspace_name) () =
  ({ keyspace_name = keyspace_name_ } : get_keyspace_request)

let make_warm_throughput_specification_summary
    ~read_units_per_second:(read_units_per_second_ : Smaws_Lib.Smithy_api.Types.long)
    ~write_units_per_second:(write_units_per_second_ : Smaws_Lib.Smithy_api.Types.long)
    ~status:(status_ : warm_throughput_status) () =
  ({
     read_units_per_second = read_units_per_second_;
     write_units_per_second = write_units_per_second_;
     status = status_;
   }
    : warm_throughput_specification_summary)

let make_replica_specification_summary ?region:(region_ : region option)
    ?status:(status_ : table_status option)
    ?capacity_specification:(capacity_specification_ : capacity_specification_summary option)
    ?warm_throughput_specification:
      (warm_throughput_specification_ : warm_throughput_specification_summary option) () =
  ({
     region = region_;
     status = status_;
     capacity_specification = capacity_specification_;
     warm_throughput_specification = warm_throughput_specification_;
   }
    : replica_specification_summary)

let make_point_in_time_recovery_summary
    ?earliest_restorable_timestamp:(earliest_restorable_timestamp_ : timestamp option)
    ~status:(status_ : point_in_time_recovery_status) () =
  ({ status = status_; earliest_restorable_timestamp = earliest_restorable_timestamp_ }
    : point_in_time_recovery_summary)

let make_get_table_response ?creation_timestamp:(creation_timestamp_ : timestamp option)
    ?status:(status_ : table_status option)
    ?schema_definition:(schema_definition_ : schema_definition option)
    ?capacity_specification:(capacity_specification_ : capacity_specification_summary option)
    ?encryption_specification:(encryption_specification_ : encryption_specification option)
    ?point_in_time_recovery:(point_in_time_recovery_ : point_in_time_recovery_summary option)
    ?ttl:(ttl_ : time_to_live option)
    ?default_time_to_live:(default_time_to_live_ : default_time_to_live option)
    ?comment:(comment_ : comment option)
    ?client_side_timestamps:(client_side_timestamps_ : client_side_timestamps option)
    ?replica_specifications:(replica_specifications_ : replica_specification_summary_list option)
    ?latest_stream_arn:(latest_stream_arn_ : stream_arn option)
    ?cdc_specification:(cdc_specification_ : cdc_specification_summary option)
    ?warm_throughput_specification:
      (warm_throughput_specification_ : warm_throughput_specification_summary option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~table_name:(table_name_ : table_name)
    ~resource_arn:(resource_arn_ : ar_n) () =
  ({
     keyspace_name = keyspace_name_;
     table_name = table_name_;
     resource_arn = resource_arn_;
     creation_timestamp = creation_timestamp_;
     status = status_;
     schema_definition = schema_definition_;
     capacity_specification = capacity_specification_;
     encryption_specification = encryption_specification_;
     point_in_time_recovery = point_in_time_recovery_;
     ttl = ttl_;
     default_time_to_live = default_time_to_live_;
     comment = comment_;
     client_side_timestamps = client_side_timestamps_;
     replica_specifications = replica_specifications_;
     latest_stream_arn = latest_stream_arn_;
     cdc_specification = cdc_specification_;
     warm_throughput_specification = warm_throughput_specification_;
   }
    : get_table_response)

let make_get_table_request ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~table_name:(table_name_ : table_name) () =
  ({ keyspace_name = keyspace_name_; table_name = table_name_ } : get_table_request)

let make_replica_auto_scaling_specification ?region:(region_ : region option)
    ?auto_scaling_specification:(auto_scaling_specification_ : auto_scaling_specification option) ()
    =
  ({ region = region_; auto_scaling_specification = auto_scaling_specification_ }
    : replica_auto_scaling_specification)

let make_get_table_auto_scaling_settings_response
    ?auto_scaling_specification:(auto_scaling_specification_ : auto_scaling_specification option)
    ?replica_specifications:
      (replica_specifications_ : replica_auto_scaling_specification_list option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~table_name:(table_name_ : table_name)
    ~resource_arn:(resource_arn_ : ar_n) () =
  ({
     keyspace_name = keyspace_name_;
     table_name = table_name_;
     resource_arn = resource_arn_;
     auto_scaling_specification = auto_scaling_specification_;
     replica_specifications = replica_specifications_;
   }
    : get_table_auto_scaling_settings_response)

let make_get_table_auto_scaling_settings_request ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~table_name:(table_name_ : table_name) () =
  ({ keyspace_name = keyspace_name_; table_name = table_name_ }
    : get_table_auto_scaling_settings_request)

let make_get_type_response ?field_definitions:(field_definitions_ : field_list option)
    ?last_modified_timestamp:(last_modified_timestamp_ : timestamp option)
    ?status:(status_ : type_status option)
    ?direct_referring_tables:(direct_referring_tables_ : table_name_list option)
    ?direct_parent_types:(direct_parent_types_ : type_name_list option)
    ?max_nesting_depth:(max_nesting_depth_ : depth option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~type_name:(type_name_ : type_name)
    ~keyspace_arn:(keyspace_arn_ : ar_n) () =
  ({
     keyspace_name = keyspace_name_;
     type_name = type_name_;
     field_definitions = field_definitions_;
     last_modified_timestamp = last_modified_timestamp_;
     status = status_;
     direct_referring_tables = direct_referring_tables_;
     direct_parent_types = direct_parent_types_;
     max_nesting_depth = max_nesting_depth_;
     keyspace_arn = keyspace_arn_;
   }
    : get_type_response)

let make_get_type_request ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~type_name:(type_name_ : type_name) () =
  ({ keyspace_name = keyspace_name_; type_name = type_name_ } : get_type_request)

let make_keyspace_summary ?replication_regions:(replication_regions_ : region_list option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~resource_arn:(resource_arn_ : ar_n)
    ~replication_strategy:(replication_strategy_ : rs) () =
  ({
     keyspace_name = keyspace_name_;
     resource_arn = resource_arn_;
     replication_strategy = replication_strategy_;
     replication_regions = replication_regions_;
   }
    : keyspace_summary)

let make_update_table_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : update_table_response)

let make_update_table_request ?add_columns:(add_columns_ : column_definition_list option)
    ?capacity_specification:(capacity_specification_ : capacity_specification option)
    ?encryption_specification:(encryption_specification_ : encryption_specification option)
    ?point_in_time_recovery:(point_in_time_recovery_ : point_in_time_recovery option)
    ?ttl:(ttl_ : time_to_live option)
    ?default_time_to_live:(default_time_to_live_ : default_time_to_live option)
    ?client_side_timestamps:(client_side_timestamps_ : client_side_timestamps option)
    ?auto_scaling_specification:(auto_scaling_specification_ : auto_scaling_specification option)
    ?replica_specifications:(replica_specifications_ : replica_specification_list option)
    ?cdc_specification:(cdc_specification_ : cdc_specification option)
    ?warm_throughput_specification:
      (warm_throughput_specification_ : warm_throughput_specification option)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~table_name:(table_name_ : table_name) () =
  ({
     keyspace_name = keyspace_name_;
     table_name = table_name_;
     add_columns = add_columns_;
     capacity_specification = capacity_specification_;
     encryption_specification = encryption_specification_;
     point_in_time_recovery = point_in_time_recovery_;
     ttl = ttl_;
     default_time_to_live = default_time_to_live_;
     client_side_timestamps = client_side_timestamps_;
     auto_scaling_specification = auto_scaling_specification_;
     replica_specifications = replica_specifications_;
     cdc_specification = cdc_specification_;
     warm_throughput_specification = warm_throughput_specification_;
   }
    : update_table_request)

let make_update_keyspace_response ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_ } : update_keyspace_response)

let make_update_keyspace_request
    ?client_side_timestamps:(client_side_timestamps_ : client_side_timestamps option)
    ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~replication_specification:(replication_specification_ : replication_specification) () =
  ({
     keyspace_name = keyspace_name_;
     replication_specification = replication_specification_;
     client_side_timestamps = client_side_timestamps_;
   }
    : update_keyspace_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : ar_n) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : ar_n) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_restore_table_response ~restored_table_ar_n:(restored_table_ar_n_ : ar_n) () =
  ({ restored_table_ar_n = restored_table_ar_n_ } : restore_table_response)

let make_restore_table_request ?restore_timestamp:(restore_timestamp_ : timestamp option)
    ?capacity_specification_override:
      (capacity_specification_override_ : capacity_specification option)
    ?encryption_specification_override:
      (encryption_specification_override_ : encryption_specification option)
    ?point_in_time_recovery_override:
      (point_in_time_recovery_override_ : point_in_time_recovery option)
    ?tags_override:(tags_override_ : tag_list option)
    ?auto_scaling_specification:(auto_scaling_specification_ : auto_scaling_specification option)
    ?replica_specifications:(replica_specifications_ : replica_specification_list option)
    ~source_keyspace_name:(source_keyspace_name_ : keyspace_name)
    ~source_table_name:(source_table_name_ : table_name)
    ~target_keyspace_name:(target_keyspace_name_ : keyspace_name)
    ~target_table_name:(target_table_name_ : table_name) () =
  ({
     source_keyspace_name = source_keyspace_name_;
     source_table_name = source_table_name_;
     target_keyspace_name = target_keyspace_name_;
     target_table_name = target_table_name_;
     restore_timestamp = restore_timestamp_;
     capacity_specification_override = capacity_specification_override_;
     encryption_specification_override = encryption_specification_override_;
     point_in_time_recovery_override = point_in_time_recovery_override_;
     tags_override = tags_override_;
     auto_scaling_specification = auto_scaling_specification_;
     replica_specifications = replica_specifications_;
   }
    : restore_table_request)

let make_list_types_response ?next_token:(next_token_ : next_token option)
    ~types:(types_ : type_name_list) () =
  ({ next_token = next_token_; types = types_ } : list_types_response)

let make_list_types_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~keyspace_name:(keyspace_name_ : keyspace_name)
    () =
  ({ next_token = next_token_; max_results = max_results_; keyspace_name = keyspace_name_ }
    : list_types_request)

let make_list_tags_for_resource_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~resource_arn:(resource_arn_ : ar_n) () =
  ({ resource_arn = resource_arn_; next_token = next_token_; max_results = max_results_ }
    : list_tags_for_resource_request)

let make_table_summary ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~table_name:(table_name_ : table_name) ~resource_arn:(resource_arn_ : ar_n) () =
  ({ keyspace_name = keyspace_name_; table_name = table_name_; resource_arn = resource_arn_ }
    : table_summary)

let make_list_tables_response ?next_token:(next_token_ : next_token option)
    ?tables:(tables_ : table_summary_list option) () =
  ({ next_token = next_token_; tables = tables_ } : list_tables_response)

let make_list_tables_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~keyspace_name:(keyspace_name_ : keyspace_name)
    () =
  ({ next_token = next_token_; max_results = max_results_; keyspace_name = keyspace_name_ }
    : list_tables_request)

let make_list_keyspaces_response ?next_token:(next_token_ : next_token option)
    ~keyspaces:(keyspaces_ : keyspace_summary_list) () =
  ({ next_token = next_token_; keyspaces = keyspaces_ } : list_keyspaces_response)

let make_list_keyspaces_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_keyspaces_request)
