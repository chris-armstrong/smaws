open Types

let make_archival_summary ?archival_date_time:(archival_date_time_ : date option)
    ?archival_reason:(archival_reason_ : archival_reason option)
    ?archival_backup_arn:(archival_backup_arn_ : backup_arn option) () =
  ({
     archival_date_time = archival_date_time_;
     archival_reason = archival_reason_;
     archival_backup_arn = archival_backup_arn_;
   }
    : archival_summary)

let make_attribute_definition ~attribute_name:(attribute_name_ : key_schema_attribute_name)
    ~attribute_type:(attribute_type_ : scalar_attribute_type) () =
  ({ attribute_name = attribute_name_; attribute_type = attribute_type_ } : attribute_definition)

let make_attribute_value_update ?value:(value_ : attribute_value option)
    ?action:(action_ : attribute_action option) () =
  ({ value = value_; action = action_ } : attribute_value_update)

let make_auto_scaling_target_tracking_scaling_policy_configuration_description
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
    : auto_scaling_target_tracking_scaling_policy_configuration_description)

let make_auto_scaling_policy_description
    ?policy_name:(policy_name_ : auto_scaling_policy_name option)
    ?target_tracking_scaling_policy_configuration:
      (target_tracking_scaling_policy_configuration_ :
         auto_scaling_target_tracking_scaling_policy_configuration_description option) () =
  ({
     policy_name = policy_name_;
     target_tracking_scaling_policy_configuration = target_tracking_scaling_policy_configuration_;
   }
    : auto_scaling_policy_description)

let make_auto_scaling_target_tracking_scaling_policy_configuration_update
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
    : auto_scaling_target_tracking_scaling_policy_configuration_update)

let make_auto_scaling_policy_update ?policy_name:(policy_name_ : auto_scaling_policy_name option)
    ~target_tracking_scaling_policy_configuration:
      (target_tracking_scaling_policy_configuration_ :
        auto_scaling_target_tracking_scaling_policy_configuration_update) () =
  ({
     policy_name = policy_name_;
     target_tracking_scaling_policy_configuration = target_tracking_scaling_policy_configuration_;
   }
    : auto_scaling_policy_update)

let make_auto_scaling_settings_description
    ?minimum_units:(minimum_units_ : positive_long_object option)
    ?maximum_units:(maximum_units_ : positive_long_object option)
    ?auto_scaling_disabled:(auto_scaling_disabled_ : boolean_object option)
    ?auto_scaling_role_arn:(auto_scaling_role_arn_ : string_ option)
    ?scaling_policies:(scaling_policies_ : auto_scaling_policy_description_list option) () =
  ({
     minimum_units = minimum_units_;
     maximum_units = maximum_units_;
     auto_scaling_disabled = auto_scaling_disabled_;
     auto_scaling_role_arn = auto_scaling_role_arn_;
     scaling_policies = scaling_policies_;
   }
    : auto_scaling_settings_description)

let make_auto_scaling_settings_update ?minimum_units:(minimum_units_ : positive_long_object option)
    ?maximum_units:(maximum_units_ : positive_long_object option)
    ?auto_scaling_disabled:(auto_scaling_disabled_ : boolean_object option)
    ?auto_scaling_role_arn:(auto_scaling_role_arn_ : auto_scaling_role_arn option)
    ?scaling_policy_update:(scaling_policy_update_ : auto_scaling_policy_update option) () =
  ({
     minimum_units = minimum_units_;
     maximum_units = maximum_units_;
     auto_scaling_disabled = auto_scaling_disabled_;
     auto_scaling_role_arn = auto_scaling_role_arn_;
     scaling_policy_update = scaling_policy_update_;
   }
    : auto_scaling_settings_update)

let make_sse_description ?status:(status_ : sse_status option)
    ?sse_type:(sse_type_ : sse_type option)
    ?kms_master_key_arn:(kms_master_key_arn_ : kms_master_key_arn option)
    ?inaccessible_encryption_date_time:(inaccessible_encryption_date_time_ : date option) () =
  ({
     status = status_;
     sse_type = sse_type_;
     kms_master_key_arn = kms_master_key_arn_;
     inaccessible_encryption_date_time = inaccessible_encryption_date_time_;
   }
    : sse_description)

let make_time_to_live_description
    ?time_to_live_status:(time_to_live_status_ : time_to_live_status option)
    ?attribute_name:(attribute_name_ : time_to_live_attribute_name option) () =
  ({ time_to_live_status = time_to_live_status_; attribute_name = attribute_name_ }
    : time_to_live_description)

let make_stream_specification ?stream_view_type:(stream_view_type_ : stream_view_type option)
    ~stream_enabled:(stream_enabled_ : stream_enabled) () =
  ({ stream_enabled = stream_enabled_; stream_view_type = stream_view_type_ }
    : stream_specification)

let make_on_demand_throughput ?max_read_request_units:(max_read_request_units_ : long_object option)
    ?max_write_request_units:(max_write_request_units_ : long_object option) () =
  ({
     max_read_request_units = max_read_request_units_;
     max_write_request_units = max_write_request_units_;
   }
    : on_demand_throughput)

let make_provisioned_throughput ~read_capacity_units:(read_capacity_units_ : positive_long_object)
    ~write_capacity_units:(write_capacity_units_ : positive_long_object) () =
  ({ read_capacity_units = read_capacity_units_; write_capacity_units = write_capacity_units_ }
    : provisioned_throughput)

let make_projection ?projection_type:(projection_type_ : projection_type option)
    ?non_key_attributes:(non_key_attributes_ : non_key_attribute_name_list option) () =
  ({ projection_type = projection_type_; non_key_attributes = non_key_attributes_ } : projection)

let make_key_schema_element ~attribute_name:(attribute_name_ : key_schema_attribute_name)
    ~key_type:(key_type_ : key_type) () =
  ({ attribute_name = attribute_name_; key_type = key_type_ } : key_schema_element)

let make_global_secondary_index_info ?index_name:(index_name_ : index_name option)
    ?key_schema:(key_schema_ : key_schema option) ?projection:(projection_ : projection option)
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option) () =
  ({
     index_name = index_name_;
     key_schema = key_schema_;
     projection = projection_;
     provisioned_throughput = provisioned_throughput_;
     on_demand_throughput = on_demand_throughput_;
   }
    : global_secondary_index_info)

let make_local_secondary_index_info ?index_name:(index_name_ : index_name option)
    ?key_schema:(key_schema_ : key_schema option) ?projection:(projection_ : projection option) () =
  ({ index_name = index_name_; key_schema = key_schema_; projection = projection_ }
    : local_secondary_index_info)

let make_source_table_feature_details
    ?local_secondary_indexes:(local_secondary_indexes_ : local_secondary_indexes option)
    ?global_secondary_indexes:(global_secondary_indexes_ : global_secondary_indexes option)
    ?stream_description:(stream_description_ : stream_specification option)
    ?time_to_live_description:(time_to_live_description_ : time_to_live_description option)
    ?sse_description:(sse_description_ : sse_description option) () =
  ({
     local_secondary_indexes = local_secondary_indexes_;
     global_secondary_indexes = global_secondary_indexes_;
     stream_description = stream_description_;
     time_to_live_description = time_to_live_description_;
     sse_description = sse_description_;
   }
    : source_table_feature_details)

let make_source_table_details ?table_arn:(table_arn_ : table_arn option)
    ?table_size_bytes:(table_size_bytes_ : long_object option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?item_count:(item_count_ : item_count option)
    ?billing_mode:(billing_mode_ : billing_mode option) ~table_name:(table_name_ : table_name)
    ~table_id:(table_id_ : table_id) ~key_schema:(key_schema_ : key_schema)
    ~table_creation_date_time:(table_creation_date_time_ : table_creation_date_time)
    ~provisioned_throughput:(provisioned_throughput_ : provisioned_throughput) () =
  ({
     table_name = table_name_;
     table_id = table_id_;
     table_arn = table_arn_;
     table_size_bytes = table_size_bytes_;
     key_schema = key_schema_;
     table_creation_date_time = table_creation_date_time_;
     provisioned_throughput = provisioned_throughput_;
     on_demand_throughput = on_demand_throughput_;
     item_count = item_count_;
     billing_mode = billing_mode_;
   }
    : source_table_details)

let make_backup_details ?backup_size_bytes:(backup_size_bytes_ : backup_size_bytes option)
    ?backup_expiry_date_time:(backup_expiry_date_time_ : date option)
    ~backup_arn:(backup_arn_ : backup_arn) ~backup_name:(backup_name_ : backup_name)
    ~backup_status:(backup_status_ : backup_status) ~backup_type:(backup_type_ : backup_type)
    ~backup_creation_date_time:(backup_creation_date_time_ : backup_creation_date_time) () =
  ({
     backup_arn = backup_arn_;
     backup_name = backup_name_;
     backup_size_bytes = backup_size_bytes_;
     backup_status = backup_status_;
     backup_type = backup_type_;
     backup_creation_date_time = backup_creation_date_time_;
     backup_expiry_date_time = backup_expiry_date_time_;
   }
    : backup_details)

let make_backup_description ?backup_details:(backup_details_ : backup_details option)
    ?source_table_details:(source_table_details_ : source_table_details option)
    ?source_table_feature_details:
      (source_table_feature_details_ : source_table_feature_details option) () =
  ({
     backup_details = backup_details_;
     source_table_details = source_table_details_;
     source_table_feature_details = source_table_feature_details_;
   }
    : backup_description)

let make_backup_summary ?table_name:(table_name_ : table_name option)
    ?table_id:(table_id_ : table_id option) ?table_arn:(table_arn_ : table_arn option)
    ?backup_arn:(backup_arn_ : backup_arn option) ?backup_name:(backup_name_ : backup_name option)
    ?backup_creation_date_time:(backup_creation_date_time_ : backup_creation_date_time option)
    ?backup_expiry_date_time:(backup_expiry_date_time_ : date option)
    ?backup_status:(backup_status_ : backup_status option)
    ?backup_type:(backup_type_ : backup_type option)
    ?backup_size_bytes:(backup_size_bytes_ : backup_size_bytes option) () =
  ({
     table_name = table_name_;
     table_id = table_id_;
     table_arn = table_arn_;
     backup_arn = backup_arn_;
     backup_name = backup_name_;
     backup_creation_date_time = backup_creation_date_time_;
     backup_expiry_date_time = backup_expiry_date_time_;
     backup_status = backup_status_;
     backup_type = backup_type_;
     backup_size_bytes = backup_size_bytes_;
   }
    : backup_summary)

let make_throttling_reason ?reason:(reason_ : reason option) ?resource:(resource_ : resource option)
    () =
  ({ reason = reason_; resource = resource_ } : throttling_reason)

let make_capacity ?read_capacity_units:(read_capacity_units_ : consumed_capacity_units option)
    ?write_capacity_units:(write_capacity_units_ : consumed_capacity_units option)
    ?capacity_units:(capacity_units_ : consumed_capacity_units option) () =
  ({
     read_capacity_units = read_capacity_units_;
     write_capacity_units = write_capacity_units_;
     capacity_units = capacity_units_;
   }
    : capacity)

let make_consumed_capacity ?table_name:(table_name_ : table_arn option)
    ?capacity_units:(capacity_units_ : consumed_capacity_units option)
    ?read_capacity_units:(read_capacity_units_ : consumed_capacity_units option)
    ?write_capacity_units:(write_capacity_units_ : consumed_capacity_units option)
    ?table:(table_ : capacity option)
    ?local_secondary_indexes:(local_secondary_indexes_ : secondary_indexes_capacity_map option)
    ?global_secondary_indexes:(global_secondary_indexes_ : secondary_indexes_capacity_map option) ()
    =
  ({
     table_name = table_name_;
     capacity_units = capacity_units_;
     read_capacity_units = read_capacity_units_;
     write_capacity_units = write_capacity_units_;
     table = table_;
     local_secondary_indexes = local_secondary_indexes_;
     global_secondary_indexes = global_secondary_indexes_;
   }
    : consumed_capacity)

let make_batch_statement_error ?code:(code_ : batch_statement_error_code_enum option)
    ?message:(message_ : string_ option) ?item:(item_ : attribute_map option) () =
  ({ code = code_; message = message_; item = item_ } : batch_statement_error)

let make_batch_statement_response ?error:(error_ : batch_statement_error option)
    ?table_name:(table_name_ : table_name option) ?item:(item_ : attribute_map option) () =
  ({ error = error_; table_name = table_name_; item = item_ } : batch_statement_response)

let make_batch_execute_statement_output ?responses:(responses_ : parti_ql_batch_response option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity_multiple option) () =
  ({ responses = responses_; consumed_capacity = consumed_capacity_ }
    : batch_execute_statement_output)

let make_batch_statement_request ?parameters:(parameters_ : prepared_statement_parameters option)
    ?consistent_read:(consistent_read_ : consistent_read option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~statement:(statement_ : parti_ql_statement) () =
  ({
     statement = statement_;
     parameters = parameters_;
     consistent_read = consistent_read_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : batch_statement_request)

let make_batch_execute_statement_input
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ~statements:(statements_ : parti_ql_batch_request) () =
  ({ statements = statements_; return_consumed_capacity = return_consumed_capacity_ }
    : batch_execute_statement_input)

let make_keys_and_attributes ?attributes_to_get:(attributes_to_get_ : attribute_name_list option)
    ?consistent_read:(consistent_read_ : consistent_read option)
    ?projection_expression:(projection_expression_ : projection_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ~keys:(keys_ : key_list) () =
  ({
     keys = keys_;
     attributes_to_get = attributes_to_get_;
     consistent_read = consistent_read_;
     projection_expression = projection_expression_;
     expression_attribute_names = expression_attribute_names_;
   }
    : keys_and_attributes)

let make_batch_get_item_output ?responses:(responses_ : batch_get_response_map option)
    ?unprocessed_keys:(unprocessed_keys_ : batch_get_request_map option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity_multiple option) () =
  ({
     responses = responses_;
     unprocessed_keys = unprocessed_keys_;
     consumed_capacity = consumed_capacity_;
   }
    : batch_get_item_output)

let make_batch_get_item_input
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ~request_items:(request_items_ : batch_get_request_map) () =
  ({ request_items = request_items_; return_consumed_capacity = return_consumed_capacity_ }
    : batch_get_item_input)

let make_item_collection_metrics
    ?item_collection_key:(item_collection_key_ : item_collection_key_attribute_map option)
    ?size_estimate_range_g_b:(size_estimate_range_g_b_ : item_collection_size_estimate_range option)
    () =
  ({
     item_collection_key = item_collection_key_;
     size_estimate_range_g_b = size_estimate_range_g_b_;
   }
    : item_collection_metrics)

let make_delete_request ~key:(key_ : key) () = ({ key = key_ } : delete_request)

let make_put_request ~item:(item_ : put_item_input_attribute_map) () =
  ({ item = item_ } : put_request)

let make_write_request ?put_request:(put_request_ : put_request option)
    ?delete_request:(delete_request_ : delete_request option) () =
  ({ put_request = put_request_; delete_request = delete_request_ } : write_request)

let make_batch_write_item_output
    ?unprocessed_items:(unprocessed_items_ : batch_write_item_request_map option)
    ?item_collection_metrics:(item_collection_metrics_ : item_collection_metrics_per_table option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity_multiple option) () =
  ({
     unprocessed_items = unprocessed_items_;
     item_collection_metrics = item_collection_metrics_;
     consumed_capacity = consumed_capacity_;
   }
    : batch_write_item_output)

let make_batch_write_item_input
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?return_item_collection_metrics:
      (return_item_collection_metrics_ : return_item_collection_metrics option)
    ~request_items:(request_items_ : batch_write_item_request_map) () =
  ({
     request_items = request_items_;
     return_consumed_capacity = return_consumed_capacity_;
     return_item_collection_metrics = return_item_collection_metrics_;
   }
    : batch_write_item_input)

let make_billing_mode_summary ?billing_mode:(billing_mode_ : billing_mode option)
    ?last_update_to_pay_per_request_date_time:
      (last_update_to_pay_per_request_date_time_ : date option) () =
  ({
     billing_mode = billing_mode_;
     last_update_to_pay_per_request_date_time = last_update_to_pay_per_request_date_time_;
   }
    : billing_mode_summary)

let make_cancellation_reason ?item:(item_ : attribute_map option) ?code:(code_ : code option)
    ?message:(message_ : error_message option) () =
  ({ item = item_; code = code_; message = message_ } : cancellation_reason)

let make_condition ?attribute_value_list:(attribute_value_list_ : attribute_value_list option)
    ~comparison_operator:(comparison_operator_ : comparison_operator) () =
  ({ attribute_value_list = attribute_value_list_; comparison_operator = comparison_operator_ }
    : condition)

let make_condition_check
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~key:(key_ : key) ~table_name:(table_name_ : table_arn)
    ~condition_expression:(condition_expression_ : condition_expression) () =
  ({
     key = key_;
     table_name = table_name_;
     condition_expression = condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : condition_check)

let make_point_in_time_recovery_description
    ?point_in_time_recovery_status:
      (point_in_time_recovery_status_ : point_in_time_recovery_status option)
    ?recovery_period_in_days:(recovery_period_in_days_ : recovery_period_in_days option)
    ?earliest_restorable_date_time:(earliest_restorable_date_time_ : date option)
    ?latest_restorable_date_time:(latest_restorable_date_time_ : date option) () =
  ({
     point_in_time_recovery_status = point_in_time_recovery_status_;
     recovery_period_in_days = recovery_period_in_days_;
     earliest_restorable_date_time = earliest_restorable_date_time_;
     latest_restorable_date_time = latest_restorable_date_time_;
   }
    : point_in_time_recovery_description)

let make_continuous_backups_description
    ?point_in_time_recovery_description:
      (point_in_time_recovery_description_ : point_in_time_recovery_description option)
    ~continuous_backups_status:(continuous_backups_status_ : continuous_backups_status) () =
  ({
     continuous_backups_status = continuous_backups_status_;
     point_in_time_recovery_description = point_in_time_recovery_description_;
   }
    : continuous_backups_description)

let make_contributor_insights_summary ?table_name:(table_name_ : table_name option)
    ?index_name:(index_name_ : index_name option)
    ?contributor_insights_status:(contributor_insights_status_ : contributor_insights_status option)
    ?contributor_insights_mode:(contributor_insights_mode_ : contributor_insights_mode option) () =
  ({
     table_name = table_name_;
     index_name = index_name_;
     contributor_insights_status = contributor_insights_status_;
     contributor_insights_mode = contributor_insights_mode_;
   }
    : contributor_insights_summary)

let make_create_backup_output ?backup_details:(backup_details_ : backup_details option) () =
  ({ backup_details = backup_details_ } : create_backup_output)

let make_create_backup_input ~table_name:(table_name_ : table_arn)
    ~backup_name:(backup_name_ : backup_name) () =
  ({ table_name = table_name_; backup_name = backup_name_ } : create_backup_input)

let make_warm_throughput ?read_units_per_second:(read_units_per_second_ : long_object option)
    ?write_units_per_second:(write_units_per_second_ : long_object option) () =
  ({
     read_units_per_second = read_units_per_second_;
     write_units_per_second = write_units_per_second_;
   }
    : warm_throughput)

let make_create_global_secondary_index_action
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?warm_throughput:(warm_throughput_ : warm_throughput option)
    ~index_name:(index_name_ : index_name) ~key_schema:(key_schema_ : key_schema)
    ~projection:(projection_ : projection) () =
  ({
     index_name = index_name_;
     key_schema = key_schema_;
     projection = projection_;
     provisioned_throughput = provisioned_throughput_;
     on_demand_throughput = on_demand_throughput_;
     warm_throughput = warm_throughput_;
   }
    : create_global_secondary_index_action)

let make_table_class_summary ?table_class:(table_class_ : table_class option)
    ?last_update_date_time:(last_update_date_time_ : date option) () =
  ({ table_class = table_class_; last_update_date_time = last_update_date_time_ }
    : table_class_summary)

let make_global_secondary_index_warm_throughput_description
    ?read_units_per_second:(read_units_per_second_ : positive_long_object option)
    ?write_units_per_second:(write_units_per_second_ : positive_long_object option)
    ?status:(status_ : index_status option) () =
  ({
     read_units_per_second = read_units_per_second_;
     write_units_per_second = write_units_per_second_;
     status = status_;
   }
    : global_secondary_index_warm_throughput_description)

let make_on_demand_throughput_override
    ?max_read_request_units:(max_read_request_units_ : long_object option) () =
  ({ max_read_request_units = max_read_request_units_ } : on_demand_throughput_override)

let make_provisioned_throughput_override
    ?read_capacity_units:(read_capacity_units_ : positive_long_object option) () =
  ({ read_capacity_units = read_capacity_units_ } : provisioned_throughput_override)

let make_replica_global_secondary_index_description ?index_name:(index_name_ : index_name option)
    ?provisioned_throughput_override:
      (provisioned_throughput_override_ : provisioned_throughput_override option)
    ?on_demand_throughput_override:
      (on_demand_throughput_override_ : on_demand_throughput_override option)
    ?warm_throughput:(warm_throughput_ : global_secondary_index_warm_throughput_description option)
    () =
  ({
     index_name = index_name_;
     provisioned_throughput_override = provisioned_throughput_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     warm_throughput = warm_throughput_;
   }
    : replica_global_secondary_index_description)

let make_table_warm_throughput_description
    ?read_units_per_second:(read_units_per_second_ : positive_long_object option)
    ?write_units_per_second:(write_units_per_second_ : positive_long_object option)
    ?status:(status_ : table_status option) () =
  ({
     read_units_per_second = read_units_per_second_;
     write_units_per_second = write_units_per_second_;
     status = status_;
   }
    : table_warm_throughput_description)

let make_replica_description ?region_name:(region_name_ : region_name option)
    ?replica_status:(replica_status_ : replica_status option)
    ?replica_arn:(replica_arn_ : string_ option)
    ?replica_status_description:(replica_status_description_ : replica_status_description option)
    ?replica_status_percent_progress:
      (replica_status_percent_progress_ : replica_status_percent_progress option)
    ?kms_master_key_id:(kms_master_key_id_ : kms_master_key_id option)
    ?provisioned_throughput_override:
      (provisioned_throughput_override_ : provisioned_throughput_override option)
    ?on_demand_throughput_override:
      (on_demand_throughput_override_ : on_demand_throughput_override option)
    ?warm_throughput:(warm_throughput_ : table_warm_throughput_description option)
    ?global_secondary_indexes:
      (global_secondary_indexes_ : replica_global_secondary_index_description_list option)
    ?replica_inaccessible_date_time:(replica_inaccessible_date_time_ : date option)
    ?replica_table_class_summary:(replica_table_class_summary_ : table_class_summary option)
    ?global_table_settings_replication_mode:
      (global_table_settings_replication_mode_ : global_table_settings_replication_mode option) () =
  ({
     region_name = region_name_;
     replica_status = replica_status_;
     replica_arn = replica_arn_;
     replica_status_description = replica_status_description_;
     replica_status_percent_progress = replica_status_percent_progress_;
     kms_master_key_id = kms_master_key_id_;
     provisioned_throughput_override = provisioned_throughput_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     warm_throughput = warm_throughput_;
     global_secondary_indexes = global_secondary_indexes_;
     replica_inaccessible_date_time = replica_inaccessible_date_time_;
     replica_table_class_summary = replica_table_class_summary_;
     global_table_settings_replication_mode = global_table_settings_replication_mode_;
   }
    : replica_description)

let make_global_table_description
    ?replication_group:(replication_group_ : replica_description_list option)
    ?global_table_arn:(global_table_arn_ : global_table_arn_string option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?global_table_status:(global_table_status_ : global_table_status option)
    ?global_table_name:(global_table_name_ : table_name option) () =
  ({
     replication_group = replication_group_;
     global_table_arn = global_table_arn_;
     creation_date_time = creation_date_time_;
     global_table_status = global_table_status_;
     global_table_name = global_table_name_;
   }
    : global_table_description)

let make_create_global_table_output
    ?global_table_description:(global_table_description_ : global_table_description option) () =
  ({ global_table_description = global_table_description_ } : create_global_table_output)

let make_replica ?region_name:(region_name_ : region_name option) () =
  ({ region_name = region_name_ } : replica)

let make_create_global_table_input ~global_table_name:(global_table_name_ : table_name)
    ~replication_group:(replication_group_ : replica_list) () =
  ({ global_table_name = global_table_name_; replication_group = replication_group_ }
    : create_global_table_input)

let make_create_global_table_witness_group_member_action ~region_name:(region_name_ : region_name)
    () =
  ({ region_name = region_name_ } : create_global_table_witness_group_member_action)

let make_create_replica_action ~region_name:(region_name_ : region_name) () =
  ({ region_name = region_name_ } : create_replica_action)

let make_replica_global_secondary_index
    ?provisioned_throughput_override:
      (provisioned_throughput_override_ : provisioned_throughput_override option)
    ?on_demand_throughput_override:
      (on_demand_throughput_override_ : on_demand_throughput_override option)
    ~index_name:(index_name_ : index_name) () =
  ({
     index_name = index_name_;
     provisioned_throughput_override = provisioned_throughput_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
   }
    : replica_global_secondary_index)

let make_create_replication_group_member_action
    ?kms_master_key_id:(kms_master_key_id_ : kms_master_key_id option)
    ?provisioned_throughput_override:
      (provisioned_throughput_override_ : provisioned_throughput_override option)
    ?on_demand_throughput_override:
      (on_demand_throughput_override_ : on_demand_throughput_override option)
    ?global_secondary_indexes:
      (global_secondary_indexes_ : replica_global_secondary_index_list option)
    ?table_class_override:(table_class_override_ : table_class option)
    ~region_name:(region_name_ : region_name) () =
  ({
     region_name = region_name_;
     kms_master_key_id = kms_master_key_id_;
     provisioned_throughput_override = provisioned_throughput_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     global_secondary_indexes = global_secondary_indexes_;
     table_class_override = table_class_override_;
   }
    : create_replication_group_member_action)

let make_restore_summary ?source_backup_arn:(source_backup_arn_ : backup_arn option)
    ?source_table_arn:(source_table_arn_ : table_arn option)
    ~restore_date_time:(restore_date_time_ : date)
    ~restore_in_progress:(restore_in_progress_ : restore_in_progress) () =
  ({
     source_backup_arn = source_backup_arn_;
     source_table_arn = source_table_arn_;
     restore_date_time = restore_date_time_;
     restore_in_progress = restore_in_progress_;
   }
    : restore_summary)

let make_global_table_witness_description ?region_name:(region_name_ : region_name option)
    ?witness_status:(witness_status_ : witness_status option) () =
  ({ region_name = region_name_; witness_status = witness_status_ }
    : global_table_witness_description)

let make_provisioned_throughput_description
    ?last_increase_date_time:(last_increase_date_time_ : date option)
    ?last_decrease_date_time:(last_decrease_date_time_ : date option)
    ?number_of_decreases_today:(number_of_decreases_today_ : positive_long_object option)
    ?read_capacity_units:(read_capacity_units_ : non_negative_long_object option)
    ?write_capacity_units:(write_capacity_units_ : non_negative_long_object option) () =
  ({
     last_increase_date_time = last_increase_date_time_;
     last_decrease_date_time = last_decrease_date_time_;
     number_of_decreases_today = number_of_decreases_today_;
     read_capacity_units = read_capacity_units_;
     write_capacity_units = write_capacity_units_;
   }
    : provisioned_throughput_description)

let make_global_secondary_index_description ?index_name:(index_name_ : index_name option)
    ?key_schema:(key_schema_ : key_schema option) ?projection:(projection_ : projection option)
    ?index_status:(index_status_ : index_status option)
    ?backfilling:(backfilling_ : backfilling option)
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput_description option)
    ?index_size_bytes:(index_size_bytes_ : long_object option)
    ?item_count:(item_count_ : long_object option) ?index_arn:(index_arn_ : string_ option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?warm_throughput:(warm_throughput_ : global_secondary_index_warm_throughput_description option)
    () =
  ({
     index_name = index_name_;
     key_schema = key_schema_;
     projection = projection_;
     index_status = index_status_;
     backfilling = backfilling_;
     provisioned_throughput = provisioned_throughput_;
     index_size_bytes = index_size_bytes_;
     item_count = item_count_;
     index_arn = index_arn_;
     on_demand_throughput = on_demand_throughput_;
     warm_throughput = warm_throughput_;
   }
    : global_secondary_index_description)

let make_local_secondary_index_description ?index_name:(index_name_ : index_name option)
    ?key_schema:(key_schema_ : key_schema option) ?projection:(projection_ : projection option)
    ?index_size_bytes:(index_size_bytes_ : long_object option)
    ?item_count:(item_count_ : long_object option) ?index_arn:(index_arn_ : string_ option) () =
  ({
     index_name = index_name_;
     key_schema = key_schema_;
     projection = projection_;
     index_size_bytes = index_size_bytes_;
     item_count = item_count_;
     index_arn = index_arn_;
   }
    : local_secondary_index_description)

let make_table_description
    ?attribute_definitions:(attribute_definitions_ : attribute_definitions option)
    ?table_name:(table_name_ : table_name option) ?key_schema:(key_schema_ : key_schema option)
    ?table_status:(table_status_ : table_status option)
    ?creation_date_time:(creation_date_time_ : date option)
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput_description option)
    ?table_size_bytes:(table_size_bytes_ : long_object option)
    ?item_count:(item_count_ : long_object option) ?table_arn:(table_arn_ : string_ option)
    ?table_id:(table_id_ : table_id option)
    ?billing_mode_summary:(billing_mode_summary_ : billing_mode_summary option)
    ?local_secondary_indexes:
      (local_secondary_indexes_ : local_secondary_index_description_list option)
    ?global_secondary_indexes:
      (global_secondary_indexes_ : global_secondary_index_description_list option)
    ?stream_specification:(stream_specification_ : stream_specification option)
    ?latest_stream_label:(latest_stream_label_ : string_ option)
    ?latest_stream_arn:(latest_stream_arn_ : stream_arn option)
    ?global_table_version:(global_table_version_ : string_ option)
    ?replicas:(replicas_ : replica_description_list option)
    ?global_table_witnesses:(global_table_witnesses_ : global_table_witness_description_list option)
    ?global_table_settings_replication_mode:
      (global_table_settings_replication_mode_ : global_table_settings_replication_mode option)
    ?restore_summary:(restore_summary_ : restore_summary option)
    ?sse_description:(sse_description_ : sse_description option)
    ?archival_summary:(archival_summary_ : archival_summary option)
    ?table_class_summary:(table_class_summary_ : table_class_summary option)
    ?deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?warm_throughput:(warm_throughput_ : table_warm_throughput_description option)
    ?multi_region_consistency:(multi_region_consistency_ : multi_region_consistency option) () =
  ({
     attribute_definitions = attribute_definitions_;
     table_name = table_name_;
     key_schema = key_schema_;
     table_status = table_status_;
     creation_date_time = creation_date_time_;
     provisioned_throughput = provisioned_throughput_;
     table_size_bytes = table_size_bytes_;
     item_count = item_count_;
     table_arn = table_arn_;
     table_id = table_id_;
     billing_mode_summary = billing_mode_summary_;
     local_secondary_indexes = local_secondary_indexes_;
     global_secondary_indexes = global_secondary_indexes_;
     stream_specification = stream_specification_;
     latest_stream_label = latest_stream_label_;
     latest_stream_arn = latest_stream_arn_;
     global_table_version = global_table_version_;
     replicas = replicas_;
     global_table_witnesses = global_table_witnesses_;
     global_table_settings_replication_mode = global_table_settings_replication_mode_;
     restore_summary = restore_summary_;
     sse_description = sse_description_;
     archival_summary = archival_summary_;
     table_class_summary = table_class_summary_;
     deletion_protection_enabled = deletion_protection_enabled_;
     on_demand_throughput = on_demand_throughput_;
     warm_throughput = warm_throughput_;
     multi_region_consistency = multi_region_consistency_;
   }
    : table_description)

let make_create_table_output ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : create_table_output)

let make_tag ~key:(key_ : tag_key_string) ~value:(value_ : tag_value_string) () =
  ({ key = key_; value = value_ } : tag)

let make_sse_specification ?enabled:(enabled_ : sse_enabled option)
    ?sse_type:(sse_type_ : sse_type option)
    ?kms_master_key_id:(kms_master_key_id_ : kms_master_key_id option) () =
  ({ enabled = enabled_; sse_type = sse_type_; kms_master_key_id = kms_master_key_id_ }
    : sse_specification)

let make_global_secondary_index
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?warm_throughput:(warm_throughput_ : warm_throughput option)
    ~index_name:(index_name_ : index_name) ~key_schema:(key_schema_ : key_schema)
    ~projection:(projection_ : projection) () =
  ({
     index_name = index_name_;
     key_schema = key_schema_;
     projection = projection_;
     provisioned_throughput = provisioned_throughput_;
     on_demand_throughput = on_demand_throughput_;
     warm_throughput = warm_throughput_;
   }
    : global_secondary_index)

let make_local_secondary_index ~index_name:(index_name_ : index_name)
    ~key_schema:(key_schema_ : key_schema) ~projection:(projection_ : projection) () =
  ({ index_name = index_name_; key_schema = key_schema_; projection = projection_ }
    : local_secondary_index)

let make_create_table_input
    ?attribute_definitions:(attribute_definitions_ : attribute_definitions option)
    ?key_schema:(key_schema_ : key_schema option)
    ?local_secondary_indexes:(local_secondary_indexes_ : local_secondary_index_list option)
    ?global_secondary_indexes:(global_secondary_indexes_ : global_secondary_index_list option)
    ?billing_mode:(billing_mode_ : billing_mode option)
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput option)
    ?stream_specification:(stream_specification_ : stream_specification option)
    ?sse_specification:(sse_specification_ : sse_specification option)
    ?tags:(tags_ : tag_list option) ?table_class:(table_class_ : table_class option)
    ?deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled option)
    ?warm_throughput:(warm_throughput_ : warm_throughput option)
    ?resource_policy:(resource_policy_ : resource_policy option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?global_table_source_arn:(global_table_source_arn_ : table_arn option)
    ?global_table_settings_replication_mode:
      (global_table_settings_replication_mode_ : global_table_settings_replication_mode option)
    ~table_name:(table_name_ : table_arn) () =
  ({
     attribute_definitions = attribute_definitions_;
     table_name = table_name_;
     key_schema = key_schema_;
     local_secondary_indexes = local_secondary_indexes_;
     global_secondary_indexes = global_secondary_indexes_;
     billing_mode = billing_mode_;
     provisioned_throughput = provisioned_throughput_;
     stream_specification = stream_specification_;
     sse_specification = sse_specification_;
     tags = tags_;
     table_class = table_class_;
     deletion_protection_enabled = deletion_protection_enabled_;
     warm_throughput = warm_throughput_;
     resource_policy = resource_policy_;
     on_demand_throughput = on_demand_throughput_;
     global_table_source_arn = global_table_source_arn_;
     global_table_settings_replication_mode = global_table_settings_replication_mode_;
   }
    : create_table_input)

let make_csv_options ?delimiter:(delimiter_ : csv_delimiter option)
    ?header_list:(header_list_ : csv_header_list option) () =
  ({ delimiter = delimiter_; header_list = header_list_ } : csv_options)

let make_delete ?condition_expression:(condition_expression_ : condition_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~key:(key_ : key) ~table_name:(table_name_ : table_arn) () =
  ({
     key = key_;
     table_name = table_name_;
     condition_expression = condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : delete)

let make_delete_backup_output ?backup_description:(backup_description_ : backup_description option)
    () =
  ({ backup_description = backup_description_ } : delete_backup_output)

let make_delete_backup_input ~backup_arn:(backup_arn_ : backup_arn) () =
  ({ backup_arn = backup_arn_ } : delete_backup_input)

let make_delete_global_secondary_index_action ~index_name:(index_name_ : index_name) () =
  ({ index_name = index_name_ } : delete_global_secondary_index_action)

let make_delete_global_table_witness_group_member_action ~region_name:(region_name_ : region_name)
    () =
  ({ region_name = region_name_ } : delete_global_table_witness_group_member_action)

let make_delete_item_output ?attributes:(attributes_ : attribute_map option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
    ?item_collection_metrics:(item_collection_metrics_ : item_collection_metrics option) () =
  ({
     attributes = attributes_;
     consumed_capacity = consumed_capacity_;
     item_collection_metrics = item_collection_metrics_;
   }
    : delete_item_output)

let make_expected_attribute_value ?value:(value_ : attribute_value option)
    ?exists:(exists_ : boolean_object option)
    ?comparison_operator:(comparison_operator_ : comparison_operator option)
    ?attribute_value_list:(attribute_value_list_ : attribute_value_list option) () =
  ({
     value = value_;
     exists = exists_;
     comparison_operator = comparison_operator_;
     attribute_value_list = attribute_value_list_;
   }
    : expected_attribute_value)

let make_delete_item_input ?expected:(expected_ : expected_attribute_map option)
    ?conditional_operator:(conditional_operator_ : conditional_operator option)
    ?return_values:(return_values_ : return_value option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?return_item_collection_metrics:
      (return_item_collection_metrics_ : return_item_collection_metrics option)
    ?condition_expression:(condition_expression_ : condition_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~table_name:(table_name_ : table_arn) ~key:(key_ : key) () =
  ({
     table_name = table_name_;
     key = key_;
     expected = expected_;
     conditional_operator = conditional_operator_;
     return_values = return_values_;
     return_consumed_capacity = return_consumed_capacity_;
     return_item_collection_metrics = return_item_collection_metrics_;
     condition_expression = condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : delete_item_input)

let make_delete_replica_action ~region_name:(region_name_ : region_name) () =
  ({ region_name = region_name_ } : delete_replica_action)

let make_delete_replication_group_member_action ~region_name:(region_name_ : region_name) () =
  ({ region_name = region_name_ } : delete_replication_group_member_action)

let make_delete_resource_policy_output ?revision_id:(revision_id_ : policy_revision_id option) () =
  ({ revision_id = revision_id_ } : delete_resource_policy_output)

let make_delete_resource_policy_input
    ?expected_revision_id:(expected_revision_id_ : policy_revision_id option)
    ~resource_arn:(resource_arn_ : resource_arn_string) () =
  ({ resource_arn = resource_arn_; expected_revision_id = expected_revision_id_ }
    : delete_resource_policy_input)

let make_delete_table_output ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : delete_table_output)

let make_delete_table_input ~table_name:(table_name_ : table_arn) () =
  ({ table_name = table_name_ } : delete_table_input)

let make_describe_backup_output
    ?backup_description:(backup_description_ : backup_description option) () =
  ({ backup_description = backup_description_ } : describe_backup_output)

let make_describe_backup_input ~backup_arn:(backup_arn_ : backup_arn) () =
  ({ backup_arn = backup_arn_ } : describe_backup_input)

let make_describe_continuous_backups_output
    ?continuous_backups_description:
      (continuous_backups_description_ : continuous_backups_description option) () =
  ({ continuous_backups_description = continuous_backups_description_ }
    : describe_continuous_backups_output)

let make_describe_continuous_backups_input ~table_name:(table_name_ : table_arn) () =
  ({ table_name = table_name_ } : describe_continuous_backups_input)

let make_failure_exception ?exception_name:(exception_name_ : exception_name option)
    ?exception_description:(exception_description_ : exception_description option) () =
  ({ exception_name = exception_name_; exception_description = exception_description_ }
    : failure_exception)

let make_describe_contributor_insights_output ?table_name:(table_name_ : table_name option)
    ?index_name:(index_name_ : index_name option)
    ?contributor_insights_rule_list:
      (contributor_insights_rule_list_ : contributor_insights_rule_list option)
    ?contributor_insights_status:(contributor_insights_status_ : contributor_insights_status option)
    ?last_update_date_time:(last_update_date_time_ : last_update_date_time option)
    ?failure_exception:(failure_exception_ : failure_exception option)
    ?contributor_insights_mode:(contributor_insights_mode_ : contributor_insights_mode option) () =
  ({
     table_name = table_name_;
     index_name = index_name_;
     contributor_insights_rule_list = contributor_insights_rule_list_;
     contributor_insights_status = contributor_insights_status_;
     last_update_date_time = last_update_date_time_;
     failure_exception = failure_exception_;
     contributor_insights_mode = contributor_insights_mode_;
   }
    : describe_contributor_insights_output)

let make_describe_contributor_insights_input ?index_name:(index_name_ : index_name option)
    ~table_name:(table_name_ : table_arn) () =
  ({ table_name = table_name_; index_name = index_name_ } : describe_contributor_insights_input)

let make_endpoint ~address:(address_ : string_)
    ~cache_period_in_minutes:(cache_period_in_minutes_ : long) () =
  ({ address = address_; cache_period_in_minutes = cache_period_in_minutes_ } : endpoint)

let make_describe_endpoints_response ~endpoints:(endpoints_ : endpoints) () =
  ({ endpoints = endpoints_ } : describe_endpoints_response)

let make_describe_endpoints_request () = (() : unit)

let make_incremental_export_specification
    ?export_from_time:(export_from_time_ : export_from_time option)
    ?export_to_time:(export_to_time_ : export_to_time option)
    ?export_view_type:(export_view_type_ : export_view_type option) () =
  ({
     export_from_time = export_from_time_;
     export_to_time = export_to_time_;
     export_view_type = export_view_type_;
   }
    : incremental_export_specification)

let make_export_description ?export_arn:(export_arn_ : export_arn option)
    ?export_status:(export_status_ : export_status option)
    ?start_time:(start_time_ : export_start_time option)
    ?end_time:(end_time_ : export_end_time option)
    ?export_manifest:(export_manifest_ : export_manifest option)
    ?table_arn:(table_arn_ : table_arn option) ?table_id:(table_id_ : table_id option)
    ?export_time:(export_time_ : export_time option)
    ?client_token:(client_token_ : client_token option) ?s3_bucket:(s3_bucket_ : s3_bucket option)
    ?s3_bucket_owner:(s3_bucket_owner_ : s3_bucket_owner option)
    ?s3_prefix:(s3_prefix_ : s3_prefix option)
    ?s3_sse_algorithm:(s3_sse_algorithm_ : s3_sse_algorithm option)
    ?s3_sse_kms_key_id:(s3_sse_kms_key_id_ : s3_sse_kms_key_id option)
    ?failure_code:(failure_code_ : failure_code option)
    ?failure_message:(failure_message_ : failure_message option)
    ?export_format:(export_format_ : export_format option)
    ?billed_size_bytes:(billed_size_bytes_ : billed_size_bytes option)
    ?item_count:(item_count_ : item_count option) ?export_type:(export_type_ : export_type option)
    ?incremental_export_specification:
      (incremental_export_specification_ : incremental_export_specification option) () =
  ({
     export_arn = export_arn_;
     export_status = export_status_;
     start_time = start_time_;
     end_time = end_time_;
     export_manifest = export_manifest_;
     table_arn = table_arn_;
     table_id = table_id_;
     export_time = export_time_;
     client_token = client_token_;
     s3_bucket = s3_bucket_;
     s3_bucket_owner = s3_bucket_owner_;
     s3_prefix = s3_prefix_;
     s3_sse_algorithm = s3_sse_algorithm_;
     s3_sse_kms_key_id = s3_sse_kms_key_id_;
     failure_code = failure_code_;
     failure_message = failure_message_;
     export_format = export_format_;
     billed_size_bytes = billed_size_bytes_;
     item_count = item_count_;
     export_type = export_type_;
     incremental_export_specification = incremental_export_specification_;
   }
    : export_description)

let make_describe_export_output
    ?export_description:(export_description_ : export_description option) () =
  ({ export_description = export_description_ } : describe_export_output)

let make_describe_export_input ~export_arn:(export_arn_ : export_arn) () =
  ({ export_arn = export_arn_ } : describe_export_input)

let make_describe_global_table_output
    ?global_table_description:(global_table_description_ : global_table_description option) () =
  ({ global_table_description = global_table_description_ } : describe_global_table_output)

let make_describe_global_table_input ~global_table_name:(global_table_name_ : table_name) () =
  ({ global_table_name = global_table_name_ } : describe_global_table_input)

let make_replica_global_secondary_index_settings_description
    ?index_status:(index_status_ : index_status option)
    ?provisioned_read_capacity_units:
      (provisioned_read_capacity_units_ : positive_long_object option)
    ?provisioned_read_capacity_auto_scaling_settings:
      (provisioned_read_capacity_auto_scaling_settings_ : auto_scaling_settings_description option)
    ?provisioned_write_capacity_units:
      (provisioned_write_capacity_units_ : positive_long_object option)
    ?provisioned_write_capacity_auto_scaling_settings:
      (provisioned_write_capacity_auto_scaling_settings_ : auto_scaling_settings_description option)
    ~index_name:(index_name_ : index_name) () =
  ({
     index_name = index_name_;
     index_status = index_status_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     provisioned_read_capacity_auto_scaling_settings =
       provisioned_read_capacity_auto_scaling_settings_;
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
     provisioned_write_capacity_auto_scaling_settings =
       provisioned_write_capacity_auto_scaling_settings_;
   }
    : replica_global_secondary_index_settings_description)

let make_replica_settings_description ?replica_status:(replica_status_ : replica_status option)
    ?replica_billing_mode_summary:(replica_billing_mode_summary_ : billing_mode_summary option)
    ?replica_provisioned_read_capacity_units:
      (replica_provisioned_read_capacity_units_ : non_negative_long_object option)
    ?replica_provisioned_read_capacity_auto_scaling_settings:
      (replica_provisioned_read_capacity_auto_scaling_settings_ :
         auto_scaling_settings_description option)
    ?replica_provisioned_write_capacity_units:
      (replica_provisioned_write_capacity_units_ : non_negative_long_object option)
    ?replica_provisioned_write_capacity_auto_scaling_settings:
      (replica_provisioned_write_capacity_auto_scaling_settings_ :
         auto_scaling_settings_description option)
    ?replica_global_secondary_index_settings:
      (replica_global_secondary_index_settings_ :
         replica_global_secondary_index_settings_description_list option)
    ?replica_table_class_summary:(replica_table_class_summary_ : table_class_summary option)
    ~region_name:(region_name_ : region_name) () =
  ({
     region_name = region_name_;
     replica_status = replica_status_;
     replica_billing_mode_summary = replica_billing_mode_summary_;
     replica_provisioned_read_capacity_units = replica_provisioned_read_capacity_units_;
     replica_provisioned_read_capacity_auto_scaling_settings =
       replica_provisioned_read_capacity_auto_scaling_settings_;
     replica_provisioned_write_capacity_units = replica_provisioned_write_capacity_units_;
     replica_provisioned_write_capacity_auto_scaling_settings =
       replica_provisioned_write_capacity_auto_scaling_settings_;
     replica_global_secondary_index_settings = replica_global_secondary_index_settings_;
     replica_table_class_summary = replica_table_class_summary_;
   }
    : replica_settings_description)

let make_describe_global_table_settings_output
    ?global_table_name:(global_table_name_ : table_name option)
    ?replica_settings:(replica_settings_ : replica_settings_description_list option) () =
  ({ global_table_name = global_table_name_; replica_settings = replica_settings_ }
    : describe_global_table_settings_output)

let make_describe_global_table_settings_input ~global_table_name:(global_table_name_ : table_name)
    () =
  ({ global_table_name = global_table_name_ } : describe_global_table_settings_input)

let make_table_creation_parameters ?billing_mode:(billing_mode_ : billing_mode option)
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?sse_specification:(sse_specification_ : sse_specification option)
    ?global_secondary_indexes:(global_secondary_indexes_ : global_secondary_index_list option)
    ~table_name:(table_name_ : table_name)
    ~attribute_definitions:(attribute_definitions_ : attribute_definitions)
    ~key_schema:(key_schema_ : key_schema) () =
  ({
     table_name = table_name_;
     attribute_definitions = attribute_definitions_;
     key_schema = key_schema_;
     billing_mode = billing_mode_;
     provisioned_throughput = provisioned_throughput_;
     on_demand_throughput = on_demand_throughput_;
     sse_specification = sse_specification_;
     global_secondary_indexes = global_secondary_indexes_;
   }
    : table_creation_parameters)

let make_input_format_options ?csv:(csv_ : csv_options option) () =
  ({ csv = csv_ } : input_format_options)

let make_s3_bucket_source ?s3_bucket_owner:(s3_bucket_owner_ : s3_bucket_owner option)
    ?s3_key_prefix:(s3_key_prefix_ : s3_prefix option) ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_bucket_owner = s3_bucket_owner_; s3_bucket = s3_bucket_; s3_key_prefix = s3_key_prefix_ }
    : s3_bucket_source)

let make_import_table_description ?import_arn:(import_arn_ : import_arn option)
    ?import_status:(import_status_ : import_status option)
    ?table_arn:(table_arn_ : table_arn option) ?table_id:(table_id_ : table_id option)
    ?client_token:(client_token_ : client_token option)
    ?s3_bucket_source:(s3_bucket_source_ : s3_bucket_source option)
    ?error_count:(error_count_ : error_count option)
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : cloud_watch_log_group_arn option)
    ?input_format:(input_format_ : input_format option)
    ?input_format_options:(input_format_options_ : input_format_options option)
    ?input_compression_type:(input_compression_type_ : input_compression_type option)
    ?table_creation_parameters:(table_creation_parameters_ : table_creation_parameters option)
    ?start_time:(start_time_ : import_start_time option)
    ?end_time:(end_time_ : import_end_time option)
    ?processed_size_bytes:(processed_size_bytes_ : long_object option)
    ?processed_item_count:(processed_item_count_ : processed_item_count option)
    ?imported_item_count:(imported_item_count_ : imported_item_count option)
    ?failure_code:(failure_code_ : failure_code option)
    ?failure_message:(failure_message_ : failure_message option) () =
  ({
     import_arn = import_arn_;
     import_status = import_status_;
     table_arn = table_arn_;
     table_id = table_id_;
     client_token = client_token_;
     s3_bucket_source = s3_bucket_source_;
     error_count = error_count_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     input_format = input_format_;
     input_format_options = input_format_options_;
     input_compression_type = input_compression_type_;
     table_creation_parameters = table_creation_parameters_;
     start_time = start_time_;
     end_time = end_time_;
     processed_size_bytes = processed_size_bytes_;
     processed_item_count = processed_item_count_;
     imported_item_count = imported_item_count_;
     failure_code = failure_code_;
     failure_message = failure_message_;
   }
    : import_table_description)

let make_describe_import_output
    ~import_table_description:(import_table_description_ : import_table_description) () =
  ({ import_table_description = import_table_description_ } : describe_import_output)

let make_describe_import_input ~import_arn:(import_arn_ : import_arn) () =
  ({ import_arn = import_arn_ } : describe_import_input)

let make_kinesis_data_stream_destination ?stream_arn:(stream_arn_ : stream_arn option)
    ?destination_status:(destination_status_ : destination_status option)
    ?destination_status_description:(destination_status_description_ : string_ option)
    ?approximate_creation_date_time_precision:
      (approximate_creation_date_time_precision_ : approximate_creation_date_time_precision option)
    () =
  ({
     stream_arn = stream_arn_;
     destination_status = destination_status_;
     destination_status_description = destination_status_description_;
     approximate_creation_date_time_precision = approximate_creation_date_time_precision_;
   }
    : kinesis_data_stream_destination)

let make_describe_kinesis_streaming_destination_output ?table_name:(table_name_ : table_name option)
    ?kinesis_data_stream_destinations:
      (kinesis_data_stream_destinations_ : kinesis_data_stream_destinations option) () =
  ({
     table_name = table_name_;
     kinesis_data_stream_destinations = kinesis_data_stream_destinations_;
   }
    : describe_kinesis_streaming_destination_output)

let make_describe_kinesis_streaming_destination_input ~table_name:(table_name_ : table_arn) () =
  ({ table_name = table_name_ } : describe_kinesis_streaming_destination_input)

let make_describe_limits_output
    ?account_max_read_capacity_units:
      (account_max_read_capacity_units_ : positive_long_object option)
    ?account_max_write_capacity_units:
      (account_max_write_capacity_units_ : positive_long_object option)
    ?table_max_read_capacity_units:(table_max_read_capacity_units_ : positive_long_object option)
    ?table_max_write_capacity_units:(table_max_write_capacity_units_ : positive_long_object option)
    () =
  ({
     account_max_read_capacity_units = account_max_read_capacity_units_;
     account_max_write_capacity_units = account_max_write_capacity_units_;
     table_max_read_capacity_units = table_max_read_capacity_units_;
     table_max_write_capacity_units = table_max_write_capacity_units_;
   }
    : describe_limits_output)

let make_describe_limits_input () = (() : unit)

let make_describe_table_output ?table:(table_ : table_description option) () =
  ({ table = table_ } : describe_table_output)

let make_describe_table_input ~table_name:(table_name_ : table_arn) () =
  ({ table_name = table_name_ } : describe_table_input)

let make_replica_global_secondary_index_auto_scaling_description
    ?index_name:(index_name_ : index_name option)
    ?index_status:(index_status_ : index_status option)
    ?provisioned_read_capacity_auto_scaling_settings:
      (provisioned_read_capacity_auto_scaling_settings_ : auto_scaling_settings_description option)
    ?provisioned_write_capacity_auto_scaling_settings:
      (provisioned_write_capacity_auto_scaling_settings_ : auto_scaling_settings_description option)
    () =
  ({
     index_name = index_name_;
     index_status = index_status_;
     provisioned_read_capacity_auto_scaling_settings =
       provisioned_read_capacity_auto_scaling_settings_;
     provisioned_write_capacity_auto_scaling_settings =
       provisioned_write_capacity_auto_scaling_settings_;
   }
    : replica_global_secondary_index_auto_scaling_description)

let make_replica_auto_scaling_description ?region_name:(region_name_ : region_name option)
    ?global_secondary_indexes:
      (global_secondary_indexes_ :
         replica_global_secondary_index_auto_scaling_description_list option)
    ?replica_provisioned_read_capacity_auto_scaling_settings:
      (replica_provisioned_read_capacity_auto_scaling_settings_ :
         auto_scaling_settings_description option)
    ?replica_provisioned_write_capacity_auto_scaling_settings:
      (replica_provisioned_write_capacity_auto_scaling_settings_ :
         auto_scaling_settings_description option)
    ?replica_status:(replica_status_ : replica_status option) () =
  ({
     region_name = region_name_;
     global_secondary_indexes = global_secondary_indexes_;
     replica_provisioned_read_capacity_auto_scaling_settings =
       replica_provisioned_read_capacity_auto_scaling_settings_;
     replica_provisioned_write_capacity_auto_scaling_settings =
       replica_provisioned_write_capacity_auto_scaling_settings_;
     replica_status = replica_status_;
   }
    : replica_auto_scaling_description)

let make_table_auto_scaling_description ?table_name:(table_name_ : table_name option)
    ?table_status:(table_status_ : table_status option)
    ?replicas:(replicas_ : replica_auto_scaling_description_list option) () =
  ({ table_name = table_name_; table_status = table_status_; replicas = replicas_ }
    : table_auto_scaling_description)

let make_describe_table_replica_auto_scaling_output
    ?table_auto_scaling_description:
      (table_auto_scaling_description_ : table_auto_scaling_description option) () =
  ({ table_auto_scaling_description = table_auto_scaling_description_ }
    : describe_table_replica_auto_scaling_output)

let make_describe_table_replica_auto_scaling_input ~table_name:(table_name_ : table_arn) () =
  ({ table_name = table_name_ } : describe_table_replica_auto_scaling_input)

let make_describe_time_to_live_output
    ?time_to_live_description:(time_to_live_description_ : time_to_live_description option) () =
  ({ time_to_live_description = time_to_live_description_ } : describe_time_to_live_output)

let make_describe_time_to_live_input ~table_name:(table_name_ : table_arn) () =
  ({ table_name = table_name_ } : describe_time_to_live_input)

let make_enable_kinesis_streaming_configuration
    ?approximate_creation_date_time_precision:
      (approximate_creation_date_time_precision_ : approximate_creation_date_time_precision option)
    () =
  ({ approximate_creation_date_time_precision = approximate_creation_date_time_precision_ }
    : enable_kinesis_streaming_configuration)

let make_kinesis_streaming_destination_output ?table_name:(table_name_ : table_name option)
    ?stream_arn:(stream_arn_ : stream_arn option)
    ?destination_status:(destination_status_ : destination_status option)
    ?enable_kinesis_streaming_configuration:
      (enable_kinesis_streaming_configuration_ : enable_kinesis_streaming_configuration option) () =
  ({
     table_name = table_name_;
     stream_arn = stream_arn_;
     destination_status = destination_status_;
     enable_kinesis_streaming_configuration = enable_kinesis_streaming_configuration_;
   }
    : kinesis_streaming_destination_output)

let make_kinesis_streaming_destination_input
    ?enable_kinesis_streaming_configuration:
      (enable_kinesis_streaming_configuration_ : enable_kinesis_streaming_configuration option)
    ~table_name:(table_name_ : table_arn) ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     table_name = table_name_;
     stream_arn = stream_arn_;
     enable_kinesis_streaming_configuration = enable_kinesis_streaming_configuration_;
   }
    : kinesis_streaming_destination_input)

let make_time_to_live_specification ~enabled:(enabled_ : time_to_live_enabled)
    ~attribute_name:(attribute_name_ : time_to_live_attribute_name) () =
  ({ enabled = enabled_; attribute_name = attribute_name_ } : time_to_live_specification)

let make_update_time_to_live_output
    ?time_to_live_specification:(time_to_live_specification_ : time_to_live_specification option) ()
    =
  ({ time_to_live_specification = time_to_live_specification_ } : update_time_to_live_output)

let make_update_time_to_live_input ~table_name:(table_name_ : table_arn)
    ~time_to_live_specification:(time_to_live_specification_ : time_to_live_specification) () =
  ({ table_name = table_name_; time_to_live_specification = time_to_live_specification_ }
    : update_time_to_live_input)

let make_update_table_replica_auto_scaling_output
    ?table_auto_scaling_description:
      (table_auto_scaling_description_ : table_auto_scaling_description option) () =
  ({ table_auto_scaling_description = table_auto_scaling_description_ }
    : update_table_replica_auto_scaling_output)

let make_replica_global_secondary_index_auto_scaling_update
    ?index_name:(index_name_ : index_name option)
    ?provisioned_read_capacity_auto_scaling_update:
      (provisioned_read_capacity_auto_scaling_update_ : auto_scaling_settings_update option) () =
  ({
     index_name = index_name_;
     provisioned_read_capacity_auto_scaling_update = provisioned_read_capacity_auto_scaling_update_;
   }
    : replica_global_secondary_index_auto_scaling_update)

let make_replica_auto_scaling_update
    ?replica_global_secondary_index_updates:
      (replica_global_secondary_index_updates_ :
         replica_global_secondary_index_auto_scaling_update_list option)
    ?replica_provisioned_read_capacity_auto_scaling_update:
      (replica_provisioned_read_capacity_auto_scaling_update_ : auto_scaling_settings_update option)
    ~region_name:(region_name_ : region_name) () =
  ({
     region_name = region_name_;
     replica_global_secondary_index_updates = replica_global_secondary_index_updates_;
     replica_provisioned_read_capacity_auto_scaling_update =
       replica_provisioned_read_capacity_auto_scaling_update_;
   }
    : replica_auto_scaling_update)

let make_global_secondary_index_auto_scaling_update ?index_name:(index_name_ : index_name option)
    ?provisioned_write_capacity_auto_scaling_update:
      (provisioned_write_capacity_auto_scaling_update_ : auto_scaling_settings_update option) () =
  ({
     index_name = index_name_;
     provisioned_write_capacity_auto_scaling_update =
       provisioned_write_capacity_auto_scaling_update_;
   }
    : global_secondary_index_auto_scaling_update)

let make_update_table_replica_auto_scaling_input
    ?global_secondary_index_updates:
      (global_secondary_index_updates_ : global_secondary_index_auto_scaling_update_list option)
    ?provisioned_write_capacity_auto_scaling_update:
      (provisioned_write_capacity_auto_scaling_update_ : auto_scaling_settings_update option)
    ?replica_updates:(replica_updates_ : replica_auto_scaling_update_list option)
    ~table_name:(table_name_ : table_arn) () =
  ({
     global_secondary_index_updates = global_secondary_index_updates_;
     table_name = table_name_;
     provisioned_write_capacity_auto_scaling_update =
       provisioned_write_capacity_auto_scaling_update_;
     replica_updates = replica_updates_;
   }
    : update_table_replica_auto_scaling_input)

let make_update_table_output ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : update_table_output)

let make_global_table_witness_group_update
    ?create:(create_ : create_global_table_witness_group_member_action option)
    ?delete:(delete_ : delete_global_table_witness_group_member_action option) () =
  ({ create = create_; delete = delete_ } : global_table_witness_group_update)

let make_update_replication_group_member_action
    ?kms_master_key_id:(kms_master_key_id_ : kms_master_key_id option)
    ?provisioned_throughput_override:
      (provisioned_throughput_override_ : provisioned_throughput_override option)
    ?on_demand_throughput_override:
      (on_demand_throughput_override_ : on_demand_throughput_override option)
    ?global_secondary_indexes:
      (global_secondary_indexes_ : replica_global_secondary_index_list option)
    ?table_class_override:(table_class_override_ : table_class option)
    ~region_name:(region_name_ : region_name) () =
  ({
     region_name = region_name_;
     kms_master_key_id = kms_master_key_id_;
     provisioned_throughput_override = provisioned_throughput_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     global_secondary_indexes = global_secondary_indexes_;
     table_class_override = table_class_override_;
   }
    : update_replication_group_member_action)

let make_replication_group_update ?create:(create_ : create_replication_group_member_action option)
    ?update:(update_ : update_replication_group_member_action option)
    ?delete:(delete_ : delete_replication_group_member_action option) () =
  ({ create = create_; update = update_; delete = delete_ } : replication_group_update)

let make_update_global_secondary_index_action
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?warm_throughput:(warm_throughput_ : warm_throughput option)
    ~index_name:(index_name_ : index_name) () =
  ({
     index_name = index_name_;
     provisioned_throughput = provisioned_throughput_;
     on_demand_throughput = on_demand_throughput_;
     warm_throughput = warm_throughput_;
   }
    : update_global_secondary_index_action)

let make_global_secondary_index_update
    ?update:(update_ : update_global_secondary_index_action option)
    ?create:(create_ : create_global_secondary_index_action option)
    ?delete:(delete_ : delete_global_secondary_index_action option) () =
  ({ update = update_; create = create_; delete = delete_ } : global_secondary_index_update)

let make_update_table_input
    ?attribute_definitions:(attribute_definitions_ : attribute_definitions option)
    ?billing_mode:(billing_mode_ : billing_mode option)
    ?provisioned_throughput:(provisioned_throughput_ : provisioned_throughput option)
    ?global_secondary_index_updates:
      (global_secondary_index_updates_ : global_secondary_index_update_list option)
    ?stream_specification:(stream_specification_ : stream_specification option)
    ?sse_specification:(sse_specification_ : sse_specification option)
    ?replica_updates:(replica_updates_ : replication_group_update_list option)
    ?table_class:(table_class_ : table_class option)
    ?deletion_protection_enabled:(deletion_protection_enabled_ : deletion_protection_enabled option)
    ?multi_region_consistency:(multi_region_consistency_ : multi_region_consistency option)
    ?global_table_witness_updates:
      (global_table_witness_updates_ : global_table_witness_group_update_list option)
    ?on_demand_throughput:(on_demand_throughput_ : on_demand_throughput option)
    ?warm_throughput:(warm_throughput_ : warm_throughput option)
    ?global_table_settings_replication_mode:
      (global_table_settings_replication_mode_ : global_table_settings_replication_mode option)
    ~table_name:(table_name_ : table_arn) () =
  ({
     attribute_definitions = attribute_definitions_;
     table_name = table_name_;
     billing_mode = billing_mode_;
     provisioned_throughput = provisioned_throughput_;
     global_secondary_index_updates = global_secondary_index_updates_;
     stream_specification = stream_specification_;
     sse_specification = sse_specification_;
     replica_updates = replica_updates_;
     table_class = table_class_;
     deletion_protection_enabled = deletion_protection_enabled_;
     multi_region_consistency = multi_region_consistency_;
     global_table_witness_updates = global_table_witness_updates_;
     on_demand_throughput = on_demand_throughput_;
     warm_throughput = warm_throughput_;
     global_table_settings_replication_mode = global_table_settings_replication_mode_;
   }
    : update_table_input)

let make_update_kinesis_streaming_configuration
    ?approximate_creation_date_time_precision:
      (approximate_creation_date_time_precision_ : approximate_creation_date_time_precision option)
    () =
  ({ approximate_creation_date_time_precision = approximate_creation_date_time_precision_ }
    : update_kinesis_streaming_configuration)

let make_update_kinesis_streaming_destination_output ?table_name:(table_name_ : table_name option)
    ?stream_arn:(stream_arn_ : stream_arn option)
    ?destination_status:(destination_status_ : destination_status option)
    ?update_kinesis_streaming_configuration:
      (update_kinesis_streaming_configuration_ : update_kinesis_streaming_configuration option) () =
  ({
     table_name = table_name_;
     stream_arn = stream_arn_;
     destination_status = destination_status_;
     update_kinesis_streaming_configuration = update_kinesis_streaming_configuration_;
   }
    : update_kinesis_streaming_destination_output)

let make_update_kinesis_streaming_destination_input
    ?update_kinesis_streaming_configuration:
      (update_kinesis_streaming_configuration_ : update_kinesis_streaming_configuration option)
    ~table_name:(table_name_ : table_arn) ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     table_name = table_name_;
     stream_arn = stream_arn_;
     update_kinesis_streaming_configuration = update_kinesis_streaming_configuration_;
   }
    : update_kinesis_streaming_destination_input)

let make_update_item_output ?attributes:(attributes_ : attribute_map option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
    ?item_collection_metrics:(item_collection_metrics_ : item_collection_metrics option) () =
  ({
     attributes = attributes_;
     consumed_capacity = consumed_capacity_;
     item_collection_metrics = item_collection_metrics_;
   }
    : update_item_output)

let make_update_item_input ?attribute_updates:(attribute_updates_ : attribute_updates option)
    ?expected:(expected_ : expected_attribute_map option)
    ?conditional_operator:(conditional_operator_ : conditional_operator option)
    ?return_values:(return_values_ : return_value option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?return_item_collection_metrics:
      (return_item_collection_metrics_ : return_item_collection_metrics option)
    ?update_expression:(update_expression_ : update_expression option)
    ?condition_expression:(condition_expression_ : condition_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~table_name:(table_name_ : table_arn) ~key:(key_ : key) () =
  ({
     table_name = table_name_;
     key = key_;
     attribute_updates = attribute_updates_;
     expected = expected_;
     conditional_operator = conditional_operator_;
     return_values = return_values_;
     return_consumed_capacity = return_consumed_capacity_;
     return_item_collection_metrics = return_item_collection_metrics_;
     update_expression = update_expression_;
     condition_expression = condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : update_item_input)

let make_update_global_table_settings_output
    ?global_table_name:(global_table_name_ : table_name option)
    ?replica_settings:(replica_settings_ : replica_settings_description_list option) () =
  ({ global_table_name = global_table_name_; replica_settings = replica_settings_ }
    : update_global_table_settings_output)

let make_replica_global_secondary_index_settings_update
    ?provisioned_read_capacity_units:
      (provisioned_read_capacity_units_ : positive_long_object option)
    ?provisioned_read_capacity_auto_scaling_settings_update:
      (provisioned_read_capacity_auto_scaling_settings_update_ : auto_scaling_settings_update option)
    ~index_name:(index_name_ : index_name) () =
  ({
     index_name = index_name_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     provisioned_read_capacity_auto_scaling_settings_update =
       provisioned_read_capacity_auto_scaling_settings_update_;
   }
    : replica_global_secondary_index_settings_update)

let make_replica_settings_update
    ?replica_provisioned_read_capacity_units:
      (replica_provisioned_read_capacity_units_ : positive_long_object option)
    ?replica_provisioned_read_capacity_auto_scaling_settings_update:
      (replica_provisioned_read_capacity_auto_scaling_settings_update_ :
         auto_scaling_settings_update option)
    ?replica_global_secondary_index_settings_update:
      (replica_global_secondary_index_settings_update_ :
         replica_global_secondary_index_settings_update_list option)
    ?replica_table_class:(replica_table_class_ : table_class option)
    ~region_name:(region_name_ : region_name) () =
  ({
     region_name = region_name_;
     replica_provisioned_read_capacity_units = replica_provisioned_read_capacity_units_;
     replica_provisioned_read_capacity_auto_scaling_settings_update =
       replica_provisioned_read_capacity_auto_scaling_settings_update_;
     replica_global_secondary_index_settings_update =
       replica_global_secondary_index_settings_update_;
     replica_table_class = replica_table_class_;
   }
    : replica_settings_update)

let make_global_table_global_secondary_index_settings_update
    ?provisioned_write_capacity_units:
      (provisioned_write_capacity_units_ : positive_long_object option)
    ?provisioned_write_capacity_auto_scaling_settings_update:
      (provisioned_write_capacity_auto_scaling_settings_update_ :
         auto_scaling_settings_update option) ~index_name:(index_name_ : index_name) () =
  ({
     index_name = index_name_;
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
     provisioned_write_capacity_auto_scaling_settings_update =
       provisioned_write_capacity_auto_scaling_settings_update_;
   }
    : global_table_global_secondary_index_settings_update)

let make_update_global_table_settings_input
    ?global_table_billing_mode:(global_table_billing_mode_ : billing_mode option)
    ?global_table_provisioned_write_capacity_units:
      (global_table_provisioned_write_capacity_units_ : positive_long_object option)
    ?global_table_provisioned_write_capacity_auto_scaling_settings_update:
      (global_table_provisioned_write_capacity_auto_scaling_settings_update_ :
         auto_scaling_settings_update option)
    ?global_table_global_secondary_index_settings_update:
      (global_table_global_secondary_index_settings_update_ :
         global_table_global_secondary_index_settings_update_list option)
    ?replica_settings_update:(replica_settings_update_ : replica_settings_update_list option)
    ~global_table_name:(global_table_name_ : table_name) () =
  ({
     global_table_name = global_table_name_;
     global_table_billing_mode = global_table_billing_mode_;
     global_table_provisioned_write_capacity_units = global_table_provisioned_write_capacity_units_;
     global_table_provisioned_write_capacity_auto_scaling_settings_update =
       global_table_provisioned_write_capacity_auto_scaling_settings_update_;
     global_table_global_secondary_index_settings_update =
       global_table_global_secondary_index_settings_update_;
     replica_settings_update = replica_settings_update_;
   }
    : update_global_table_settings_input)

let make_update_global_table_output
    ?global_table_description:(global_table_description_ : global_table_description option) () =
  ({ global_table_description = global_table_description_ } : update_global_table_output)

let make_replica_update ?create:(create_ : create_replica_action option)
    ?delete:(delete_ : delete_replica_action option) () =
  ({ create = create_; delete = delete_ } : replica_update)

let make_update_global_table_input ~global_table_name:(global_table_name_ : table_name)
    ~replica_updates:(replica_updates_ : replica_update_list) () =
  ({ global_table_name = global_table_name_; replica_updates = replica_updates_ }
    : update_global_table_input)

let make_update_contributor_insights_output ?table_name:(table_name_ : table_name option)
    ?index_name:(index_name_ : index_name option)
    ?contributor_insights_status:(contributor_insights_status_ : contributor_insights_status option)
    ?contributor_insights_mode:(contributor_insights_mode_ : contributor_insights_mode option) () =
  ({
     table_name = table_name_;
     index_name = index_name_;
     contributor_insights_status = contributor_insights_status_;
     contributor_insights_mode = contributor_insights_mode_;
   }
    : update_contributor_insights_output)

let make_update_contributor_insights_input ?index_name:(index_name_ : index_name option)
    ?contributor_insights_mode:(contributor_insights_mode_ : contributor_insights_mode option)
    ~table_name:(table_name_ : table_arn)
    ~contributor_insights_action:(contributor_insights_action_ : contributor_insights_action) () =
  ({
     table_name = table_name_;
     index_name = index_name_;
     contributor_insights_action = contributor_insights_action_;
     contributor_insights_mode = contributor_insights_mode_;
   }
    : update_contributor_insights_input)

let make_update_continuous_backups_output
    ?continuous_backups_description:
      (continuous_backups_description_ : continuous_backups_description option) () =
  ({ continuous_backups_description = continuous_backups_description_ }
    : update_continuous_backups_output)

let make_point_in_time_recovery_specification
    ?recovery_period_in_days:(recovery_period_in_days_ : recovery_period_in_days option)
    ~point_in_time_recovery_enabled:(point_in_time_recovery_enabled_ : boolean_object) () =
  ({
     point_in_time_recovery_enabled = point_in_time_recovery_enabled_;
     recovery_period_in_days = recovery_period_in_days_;
   }
    : point_in_time_recovery_specification)

let make_update_continuous_backups_input ~table_name:(table_name_ : table_arn)
    ~point_in_time_recovery_specification:
      (point_in_time_recovery_specification_ : point_in_time_recovery_specification) () =
  ({
     table_name = table_name_;
     point_in_time_recovery_specification = point_in_time_recovery_specification_;
   }
    : update_continuous_backups_input)

let make_untag_resource_input ~resource_arn:(resource_arn_ : resource_arn_string)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_transact_write_items_output
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity_multiple option)
    ?item_collection_metrics:(item_collection_metrics_ : item_collection_metrics_per_table option)
    () =
  ({ consumed_capacity = consumed_capacity_; item_collection_metrics = item_collection_metrics_ }
    : transact_write_items_output)

let make_update ?condition_expression:(condition_expression_ : condition_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~key:(key_ : key) ~update_expression:(update_expression_ : update_expression)
    ~table_name:(table_name_ : table_arn) () =
  ({
     key = key_;
     update_expression = update_expression_;
     table_name = table_name_;
     condition_expression = condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : update)

let make_put ?condition_expression:(condition_expression_ : condition_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~item:(item_ : put_item_input_attribute_map) ~table_name:(table_name_ : table_arn) () =
  ({
     item = item_;
     table_name = table_name_;
     condition_expression = condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : put)

let make_transact_write_item ?condition_check:(condition_check_ : condition_check option)
    ?put:(put_ : put option) ?delete:(delete_ : delete option) ?update:(update_ : update option) ()
    =
  ({ condition_check = condition_check_; put = put_; delete = delete_; update = update_ }
    : transact_write_item)

let make_transact_write_items_input
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?return_item_collection_metrics:
      (return_item_collection_metrics_ : return_item_collection_metrics option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~transact_items:(transact_items_ : transact_write_item_list) () =
  ({
     transact_items = transact_items_;
     return_consumed_capacity = return_consumed_capacity_;
     return_item_collection_metrics = return_item_collection_metrics_;
     client_request_token = client_request_token_;
   }
    : transact_write_items_input)

let make_item_response ?item:(item_ : attribute_map option) () = ({ item = item_ } : item_response)

let make_transact_get_items_output
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity_multiple option)
    ?responses:(responses_ : item_response_list option) () =
  ({ consumed_capacity = consumed_capacity_; responses = responses_ } : transact_get_items_output)

let make_get ?projection_expression:(projection_expression_ : projection_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ~key:(key_ : key) ~table_name:(table_name_ : table_arn) () =
  ({
     key = key_;
     table_name = table_name_;
     projection_expression = projection_expression_;
     expression_attribute_names = expression_attribute_names_;
   }
    : get)

let make_transact_get_item ~get:(get_ : get) () = ({ get = get_ } : transact_get_item)

let make_transact_get_items_input
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ~transact_items:(transact_items_ : transact_get_item_list) () =
  ({ transact_items = transact_items_; return_consumed_capacity = return_consumed_capacity_ }
    : transact_get_items_input)

let make_tag_resource_input ~resource_arn:(resource_arn_ : resource_arn_string)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_scan_output ?items:(items_ : item_list option) ?count:(count_ : integer option)
    ?scanned_count:(scanned_count_ : integer option)
    ?last_evaluated_key:(last_evaluated_key_ : key option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity option) () =
  ({
     items = items_;
     count = count_;
     scanned_count = scanned_count_;
     last_evaluated_key = last_evaluated_key_;
     consumed_capacity = consumed_capacity_;
   }
    : scan_output)

let make_scan_input ?index_name:(index_name_ : index_name option)
    ?attributes_to_get:(attributes_to_get_ : attribute_name_list option)
    ?limit:(limit_ : positive_integer_object option) ?select:(select_ : select option)
    ?scan_filter:(scan_filter_ : filter_condition_map option)
    ?conditional_operator:(conditional_operator_ : conditional_operator option)
    ?exclusive_start_key:(exclusive_start_key_ : key option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?total_segments:(total_segments_ : scan_total_segments option)
    ?segment:(segment_ : scan_segment option)
    ?projection_expression:(projection_expression_ : projection_expression option)
    ?filter_expression:(filter_expression_ : condition_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?consistent_read:(consistent_read_ : consistent_read option)
    ~table_name:(table_name_ : table_arn) () =
  ({
     table_name = table_name_;
     index_name = index_name_;
     attributes_to_get = attributes_to_get_;
     limit = limit_;
     select = select_;
     scan_filter = scan_filter_;
     conditional_operator = conditional_operator_;
     exclusive_start_key = exclusive_start_key_;
     return_consumed_capacity = return_consumed_capacity_;
     total_segments = total_segments_;
     segment = segment_;
     projection_expression = projection_expression_;
     filter_expression = filter_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     consistent_read = consistent_read_;
   }
    : scan_input)

let make_restore_table_to_point_in_time_output
    ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : restore_table_to_point_in_time_output)

let make_restore_table_to_point_in_time_input
    ?source_table_arn:(source_table_arn_ : table_arn option)
    ?source_table_name:(source_table_name_ : table_name option)
    ?use_latest_restorable_time:(use_latest_restorable_time_ : boolean_object option)
    ?restore_date_time:(restore_date_time_ : date option)
    ?billing_mode_override:(billing_mode_override_ : billing_mode option)
    ?global_secondary_index_override:
      (global_secondary_index_override_ : global_secondary_index_list option)
    ?local_secondary_index_override:
      (local_secondary_index_override_ : local_secondary_index_list option)
    ?provisioned_throughput_override:
      (provisioned_throughput_override_ : provisioned_throughput option)
    ?on_demand_throughput_override:(on_demand_throughput_override_ : on_demand_throughput option)
    ?sse_specification_override:(sse_specification_override_ : sse_specification option)
    ~target_table_name:(target_table_name_ : table_name) () =
  ({
     source_table_arn = source_table_arn_;
     source_table_name = source_table_name_;
     target_table_name = target_table_name_;
     use_latest_restorable_time = use_latest_restorable_time_;
     restore_date_time = restore_date_time_;
     billing_mode_override = billing_mode_override_;
     global_secondary_index_override = global_secondary_index_override_;
     local_secondary_index_override = local_secondary_index_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     sse_specification_override = sse_specification_override_;
   }
    : restore_table_to_point_in_time_input)

let make_restore_table_from_backup_output
    ?table_description:(table_description_ : table_description option) () =
  ({ table_description = table_description_ } : restore_table_from_backup_output)

let make_restore_table_from_backup_input
    ?billing_mode_override:(billing_mode_override_ : billing_mode option)
    ?global_secondary_index_override:
      (global_secondary_index_override_ : global_secondary_index_list option)
    ?local_secondary_index_override:
      (local_secondary_index_override_ : local_secondary_index_list option)
    ?provisioned_throughput_override:
      (provisioned_throughput_override_ : provisioned_throughput option)
    ?on_demand_throughput_override:(on_demand_throughput_override_ : on_demand_throughput option)
    ?sse_specification_override:(sse_specification_override_ : sse_specification option)
    ~target_table_name:(target_table_name_ : table_name) ~backup_arn:(backup_arn_ : backup_arn) () =
  ({
     target_table_name = target_table_name_;
     backup_arn = backup_arn_;
     billing_mode_override = billing_mode_override_;
     global_secondary_index_override = global_secondary_index_override_;
     local_secondary_index_override = local_secondary_index_override_;
     provisioned_throughput_override = provisioned_throughput_override_;
     on_demand_throughput_override = on_demand_throughput_override_;
     sse_specification_override = sse_specification_override_;
   }
    : restore_table_from_backup_input)

let make_query_output ?items:(items_ : item_list option) ?count:(count_ : integer option)
    ?scanned_count:(scanned_count_ : integer option)
    ?last_evaluated_key:(last_evaluated_key_ : key option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity option) () =
  ({
     items = items_;
     count = count_;
     scanned_count = scanned_count_;
     last_evaluated_key = last_evaluated_key_;
     consumed_capacity = consumed_capacity_;
   }
    : query_output)

let make_query_input ?index_name:(index_name_ : index_name option) ?select:(select_ : select option)
    ?attributes_to_get:(attributes_to_get_ : attribute_name_list option)
    ?limit:(limit_ : positive_integer_object option)
    ?consistent_read:(consistent_read_ : consistent_read option)
    ?key_conditions:(key_conditions_ : key_conditions option)
    ?query_filter:(query_filter_ : filter_condition_map option)
    ?conditional_operator:(conditional_operator_ : conditional_operator option)
    ?scan_index_forward:(scan_index_forward_ : boolean_object option)
    ?exclusive_start_key:(exclusive_start_key_ : key option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?projection_expression:(projection_expression_ : projection_expression option)
    ?filter_expression:(filter_expression_ : condition_expression option)
    ?key_condition_expression:(key_condition_expression_ : key_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ~table_name:(table_name_ : table_arn) () =
  ({
     table_name = table_name_;
     index_name = index_name_;
     select = select_;
     attributes_to_get = attributes_to_get_;
     limit = limit_;
     consistent_read = consistent_read_;
     key_conditions = key_conditions_;
     query_filter = query_filter_;
     conditional_operator = conditional_operator_;
     scan_index_forward = scan_index_forward_;
     exclusive_start_key = exclusive_start_key_;
     return_consumed_capacity = return_consumed_capacity_;
     projection_expression = projection_expression_;
     filter_expression = filter_expression_;
     key_condition_expression = key_condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
   }
    : query_input)

let make_put_resource_policy_output ?revision_id:(revision_id_ : policy_revision_id option) () =
  ({ revision_id = revision_id_ } : put_resource_policy_output)

let make_put_resource_policy_input
    ?expected_revision_id:(expected_revision_id_ : policy_revision_id option)
    ?confirm_remove_self_resource_access:
      (confirm_remove_self_resource_access_ : confirm_remove_self_resource_access option)
    ~resource_arn:(resource_arn_ : resource_arn_string) ~policy:(policy_ : resource_policy) () =
  ({
     resource_arn = resource_arn_;
     policy = policy_;
     expected_revision_id = expected_revision_id_;
     confirm_remove_self_resource_access = confirm_remove_self_resource_access_;
   }
    : put_resource_policy_input)

let make_put_item_output ?attributes:(attributes_ : attribute_map option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
    ?item_collection_metrics:(item_collection_metrics_ : item_collection_metrics option) () =
  ({
     attributes = attributes_;
     consumed_capacity = consumed_capacity_;
     item_collection_metrics = item_collection_metrics_;
   }
    : put_item_output)

let make_put_item_input ?expected:(expected_ : expected_attribute_map option)
    ?return_values:(return_values_ : return_value option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?return_item_collection_metrics:
      (return_item_collection_metrics_ : return_item_collection_metrics option)
    ?conditional_operator:(conditional_operator_ : conditional_operator option)
    ?condition_expression:(condition_expression_ : condition_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ?expression_attribute_values:
      (expression_attribute_values_ : expression_attribute_value_map option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~table_name:(table_name_ : table_arn) ~item:(item_ : put_item_input_attribute_map) () =
  ({
     table_name = table_name_;
     item = item_;
     expected = expected_;
     return_values = return_values_;
     return_consumed_capacity = return_consumed_capacity_;
     return_item_collection_metrics = return_item_collection_metrics_;
     conditional_operator = conditional_operator_;
     condition_expression = condition_expression_;
     expression_attribute_names = expression_attribute_names_;
     expression_attribute_values = expression_attribute_values_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : put_item_input)

let make_list_tags_of_resource_output ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token_string option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_of_resource_output)

let make_list_tags_of_resource_input ?next_token:(next_token_ : next_token_string option)
    ~resource_arn:(resource_arn_ : resource_arn_string) () =
  ({ resource_arn = resource_arn_; next_token = next_token_ } : list_tags_of_resource_input)

let make_list_tables_output ?table_names:(table_names_ : table_name_list option)
    ?last_evaluated_table_name:(last_evaluated_table_name_ : table_name option) () =
  ({ table_names = table_names_; last_evaluated_table_name = last_evaluated_table_name_ }
    : list_tables_output)

let make_list_tables_input
    ?exclusive_start_table_name:(exclusive_start_table_name_ : table_name option)
    ?limit:(limit_ : list_tables_input_limit option) () =
  ({ exclusive_start_table_name = exclusive_start_table_name_; limit = limit_ } : list_tables_input)

let make_import_summary ?import_arn:(import_arn_ : import_arn option)
    ?import_status:(import_status_ : import_status option)
    ?table_arn:(table_arn_ : table_arn option)
    ?s3_bucket_source:(s3_bucket_source_ : s3_bucket_source option)
    ?cloud_watch_log_group_arn:(cloud_watch_log_group_arn_ : cloud_watch_log_group_arn option)
    ?input_format:(input_format_ : input_format option)
    ?start_time:(start_time_ : import_start_time option)
    ?end_time:(end_time_ : import_end_time option) () =
  ({
     import_arn = import_arn_;
     import_status = import_status_;
     table_arn = table_arn_;
     s3_bucket_source = s3_bucket_source_;
     cloud_watch_log_group_arn = cloud_watch_log_group_arn_;
     input_format = input_format_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : import_summary)

let make_list_imports_output
    ?import_summary_list:(import_summary_list_ : import_summary_list option)
    ?next_token:(next_token_ : import_next_token option) () =
  ({ import_summary_list = import_summary_list_; next_token = next_token_ } : list_imports_output)

let make_list_imports_input ?table_arn:(table_arn_ : table_arn option)
    ?page_size:(page_size_ : list_imports_max_limit option)
    ?next_token:(next_token_ : import_next_token option) () =
  ({ table_arn = table_arn_; page_size = page_size_; next_token = next_token_ }
    : list_imports_input)

let make_global_table ?global_table_name:(global_table_name_ : table_name option)
    ?replication_group:(replication_group_ : replica_list option) () =
  ({ global_table_name = global_table_name_; replication_group = replication_group_ }
    : global_table)

let make_list_global_tables_output ?global_tables:(global_tables_ : global_table_list option)
    ?last_evaluated_global_table_name:(last_evaluated_global_table_name_ : table_name option) () =
  ({
     global_tables = global_tables_;
     last_evaluated_global_table_name = last_evaluated_global_table_name_;
   }
    : list_global_tables_output)

let make_list_global_tables_input
    ?exclusive_start_global_table_name:(exclusive_start_global_table_name_ : table_name option)
    ?limit:(limit_ : positive_integer_object option)
    ?region_name:(region_name_ : region_name option) () =
  ({
     exclusive_start_global_table_name = exclusive_start_global_table_name_;
     limit = limit_;
     region_name = region_name_;
   }
    : list_global_tables_input)

let make_export_summary ?export_arn:(export_arn_ : export_arn option)
    ?export_status:(export_status_ : export_status option)
    ?export_type:(export_type_ : export_type option) () =
  ({ export_arn = export_arn_; export_status = export_status_; export_type = export_type_ }
    : export_summary)

let make_list_exports_output ?export_summaries:(export_summaries_ : export_summaries option)
    ?next_token:(next_token_ : export_next_token option) () =
  ({ export_summaries = export_summaries_; next_token = next_token_ } : list_exports_output)

let make_list_exports_input ?table_arn:(table_arn_ : table_arn option)
    ?max_results:(max_results_ : list_exports_max_limit option)
    ?next_token:(next_token_ : export_next_token option) () =
  ({ table_arn = table_arn_; max_results = max_results_; next_token = next_token_ }
    : list_exports_input)

let make_list_contributor_insights_output
    ?contributor_insights_summaries:
      (contributor_insights_summaries_ : contributor_insights_summaries option)
    ?next_token:(next_token_ : next_token_string option) () =
  ({ contributor_insights_summaries = contributor_insights_summaries_; next_token = next_token_ }
    : list_contributor_insights_output)

let make_list_contributor_insights_input ?table_name:(table_name_ : table_arn option)
    ?next_token:(next_token_ : next_token_string option)
    ?max_results:(max_results_ : list_contributor_insights_limit option) () =
  ({ table_name = table_name_; next_token = next_token_; max_results = max_results_ }
    : list_contributor_insights_input)

let make_list_backups_output ?backup_summaries:(backup_summaries_ : backup_summaries option)
    ?last_evaluated_backup_arn:(last_evaluated_backup_arn_ : backup_arn option) () =
  ({ backup_summaries = backup_summaries_; last_evaluated_backup_arn = last_evaluated_backup_arn_ }
    : list_backups_output)

let make_list_backups_input ?table_name:(table_name_ : table_arn option)
    ?limit:(limit_ : backups_input_limit option)
    ?time_range_lower_bound:(time_range_lower_bound_ : time_range_lower_bound option)
    ?time_range_upper_bound:(time_range_upper_bound_ : time_range_upper_bound option)
    ?exclusive_start_backup_arn:(exclusive_start_backup_arn_ : backup_arn option)
    ?backup_type:(backup_type_ : backup_type_filter option) () =
  ({
     table_name = table_name_;
     limit = limit_;
     time_range_lower_bound = time_range_lower_bound_;
     time_range_upper_bound = time_range_upper_bound_;
     exclusive_start_backup_arn = exclusive_start_backup_arn_;
     backup_type = backup_type_;
   }
    : list_backups_input)

let make_import_table_output
    ~import_table_description:(import_table_description_ : import_table_description) () =
  ({ import_table_description = import_table_description_ } : import_table_output)

let make_import_table_input ?client_token:(client_token_ : client_token option)
    ?input_format_options:(input_format_options_ : input_format_options option)
    ?input_compression_type:(input_compression_type_ : input_compression_type option)
    ~s3_bucket_source:(s3_bucket_source_ : s3_bucket_source)
    ~input_format:(input_format_ : input_format)
    ~table_creation_parameters:(table_creation_parameters_ : table_creation_parameters) () =
  ({
     client_token = client_token_;
     s3_bucket_source = s3_bucket_source_;
     input_format = input_format_;
     input_format_options = input_format_options_;
     input_compression_type = input_compression_type_;
     table_creation_parameters = table_creation_parameters_;
   }
    : import_table_input)

let make_get_resource_policy_output ?policy:(policy_ : resource_policy option)
    ?revision_id:(revision_id_ : policy_revision_id option) () =
  ({ policy = policy_; revision_id = revision_id_ } : get_resource_policy_output)

let make_get_resource_policy_input ~resource_arn:(resource_arn_ : resource_arn_string) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_input)

let make_get_item_output ?item:(item_ : attribute_map option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity option) () =
  ({ item = item_; consumed_capacity = consumed_capacity_ } : get_item_output)

let make_get_item_input ?attributes_to_get:(attributes_to_get_ : attribute_name_list option)
    ?consistent_read:(consistent_read_ : consistent_read option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?projection_expression:(projection_expression_ : projection_expression option)
    ?expression_attribute_names:(expression_attribute_names_ : expression_attribute_name_map option)
    ~table_name:(table_name_ : table_arn) ~key:(key_ : key) () =
  ({
     table_name = table_name_;
     key = key_;
     attributes_to_get = attributes_to_get_;
     consistent_read = consistent_read_;
     return_consumed_capacity = return_consumed_capacity_;
     projection_expression = projection_expression_;
     expression_attribute_names = expression_attribute_names_;
   }
    : get_item_input)

let make_export_table_to_point_in_time_output
    ?export_description:(export_description_ : export_description option) () =
  ({ export_description = export_description_ } : export_table_to_point_in_time_output)

let make_export_table_to_point_in_time_input ?export_time:(export_time_ : export_time option)
    ?client_token:(client_token_ : client_token option)
    ?s3_bucket_owner:(s3_bucket_owner_ : s3_bucket_owner option)
    ?s3_prefix:(s3_prefix_ : s3_prefix option)
    ?s3_sse_algorithm:(s3_sse_algorithm_ : s3_sse_algorithm option)
    ?s3_sse_kms_key_id:(s3_sse_kms_key_id_ : s3_sse_kms_key_id option)
    ?export_format:(export_format_ : export_format option)
    ?export_type:(export_type_ : export_type option)
    ?incremental_export_specification:
      (incremental_export_specification_ : incremental_export_specification option)
    ~table_arn:(table_arn_ : table_arn) ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({
     table_arn = table_arn_;
     export_time = export_time_;
     client_token = client_token_;
     s3_bucket = s3_bucket_;
     s3_bucket_owner = s3_bucket_owner_;
     s3_prefix = s3_prefix_;
     s3_sse_algorithm = s3_sse_algorithm_;
     s3_sse_kms_key_id = s3_sse_kms_key_id_;
     export_format = export_format_;
     export_type = export_type_;
     incremental_export_specification = incremental_export_specification_;
   }
    : export_table_to_point_in_time_input)

let make_execute_transaction_output ?responses:(responses_ : item_response_list option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity_multiple option) () =
  ({ responses = responses_; consumed_capacity = consumed_capacity_ } : execute_transaction_output)

let make_parameterized_statement ?parameters:(parameters_ : prepared_statement_parameters option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~statement:(statement_ : parti_ql_statement) () =
  ({
     statement = statement_;
     parameters = parameters_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : parameterized_statement)

let make_execute_transaction_input
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ~transact_statements:(transact_statements_ : parameterized_statements) () =
  ({
     transact_statements = transact_statements_;
     client_request_token = client_request_token_;
     return_consumed_capacity = return_consumed_capacity_;
   }
    : execute_transaction_input)

let make_execute_statement_output ?items:(items_ : item_list option)
    ?next_token:(next_token_ : parti_ql_next_token option)
    ?consumed_capacity:(consumed_capacity_ : consumed_capacity option)
    ?last_evaluated_key:(last_evaluated_key_ : key option) () =
  ({
     items = items_;
     next_token = next_token_;
     consumed_capacity = consumed_capacity_;
     last_evaluated_key = last_evaluated_key_;
   }
    : execute_statement_output)

let make_execute_statement_input ?parameters:(parameters_ : prepared_statement_parameters option)
    ?consistent_read:(consistent_read_ : consistent_read option)
    ?next_token:(next_token_ : parti_ql_next_token option)
    ?return_consumed_capacity:(return_consumed_capacity_ : return_consumed_capacity option)
    ?limit:(limit_ : positive_integer_object option)
    ?return_values_on_condition_check_failure:
      (return_values_on_condition_check_failure_ : return_values_on_condition_check_failure option)
    ~statement:(statement_ : parti_ql_statement) () =
  ({
     statement = statement_;
     parameters = parameters_;
     consistent_read = consistent_read_;
     next_token = next_token_;
     return_consumed_capacity = return_consumed_capacity_;
     limit = limit_;
     return_values_on_condition_check_failure = return_values_on_condition_check_failure_;
   }
    : execute_statement_input)
