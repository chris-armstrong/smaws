open Types

let make_stream_mode_details ~stream_mode:(stream_mode_ : stream_mode) () =
  ({ stream_mode = stream_mode_ } : stream_mode_details)

let make_update_stream_mode_input ~stream_mode_details:(stream_mode_details_ : stream_mode_details)
    ~stream_ar_n:(stream_ar_n_ : stream_ar_n) () =
  ({ stream_mode_details = stream_mode_details_; stream_ar_n = stream_ar_n_ }
    : update_stream_mode_input)

let make_update_shard_count_output ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?target_shard_count:(target_shard_count_ : positive_integer_object option)
    ?current_shard_count:(current_shard_count_ : positive_integer_object option)
    ?stream_name:(stream_name_ : stream_name option) () =
  ({
     stream_ar_n = stream_ar_n_;
     target_shard_count = target_shard_count_;
     current_shard_count = current_shard_count_;
     stream_name = stream_name_;
   }
    : update_shard_count_output)

let make_update_shard_count_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option) ~scaling_type:(scaling_type_ : scaling_type)
    ~target_shard_count:(target_shard_count_ : positive_integer_object) () =
  ({
     stream_ar_n = stream_ar_n_;
     scaling_type = scaling_type_;
     target_shard_count = target_shard_count_;
     stream_name = stream_name_;
   }
    : update_shard_count_input)

let make_untag_resource_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n) ~tags:(tags_ : tag_map)
    () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_input)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_record ?encryption_type:(encryption_type_ : encryption_type option)
    ?approximate_arrival_timestamp:(approximate_arrival_timestamp_ : timestamp option)
    ~partition_key:(partition_key_ : partition_key) ~data:(data_ : data)
    ~sequence_number:(sequence_number_ : sequence_number) () =
  ({
     encryption_type = encryption_type_;
     partition_key = partition_key_;
     data = data_;
     approximate_arrival_timestamp = approximate_arrival_timestamp_;
     sequence_number = sequence_number_;
   }
    : record)

let make_hash_key_range ~ending_hash_key:(ending_hash_key_ : hash_key)
    ~starting_hash_key:(starting_hash_key_ : hash_key) () =
  ({ ending_hash_key = ending_hash_key_; starting_hash_key = starting_hash_key_ } : hash_key_range)

let make_child_shard ~hash_key_range:(hash_key_range_ : hash_key_range)
    ~parent_shards:(parent_shards_ : shard_id_list) ~shard_id:(shard_id_ : shard_id) () =
  ({ hash_key_range = hash_key_range_; parent_shards = parent_shards_; shard_id = shard_id_ }
    : child_shard)

let make_subscribe_to_shard_event ?child_shards:(child_shards_ : child_shard_list option)
    ~millis_behind_latest:(millis_behind_latest_ : millis_behind_latest)
    ~continuation_sequence_number:(continuation_sequence_number_ : sequence_number)
    ~records:(records_ : record_list) () =
  ({
     child_shards = child_shards_;
     millis_behind_latest = millis_behind_latest_;
     continuation_sequence_number = continuation_sequence_number_;
     records = records_;
   }
    : subscribe_to_shard_event)

let make_subscribe_to_shard_output ~event_stream:(event_stream_ : subscribe_to_shard_event_stream)
    () =
  ({ event_stream = event_stream_ } : subscribe_to_shard_output)

let make_starting_position ?timestamp:(timestamp_ : timestamp option)
    ?sequence_number:(sequence_number_ : sequence_number option)
    ~type_:(type__ : shard_iterator_type) () =
  ({ timestamp = timestamp_; sequence_number = sequence_number_; type_ = type__ }
    : starting_position)

let make_subscribe_to_shard_input ~starting_position:(starting_position_ : starting_position)
    ~shard_id:(shard_id_ : shard_id) ~consumer_ar_n:(consumer_ar_n_ : consumer_ar_n) () =
  ({ starting_position = starting_position_; shard_id = shard_id_; consumer_ar_n = consumer_ar_n_ }
    : subscribe_to_shard_input)

let make_stream_summary ?stream_creation_timestamp:(stream_creation_timestamp_ : timestamp option)
    ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ~stream_status:(stream_status_ : stream_status) ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~stream_name:(stream_name_ : stream_name) () =
  ({
     stream_creation_timestamp = stream_creation_timestamp_;
     stream_mode_details = stream_mode_details_;
     stream_status = stream_status_;
     stream_ar_n = stream_ar_n_;
     stream_name = stream_name_;
   }
    : stream_summary)

let make_enhanced_metrics ?shard_level_metrics:(shard_level_metrics_ : metrics_name_list option) ()
    =
  ({ shard_level_metrics = shard_level_metrics_ } : enhanced_metrics)

let make_stream_description_summary ?consumer_count:(consumer_count_ : consumer_count_object option)
    ?key_id:(key_id_ : key_id option) ?encryption_type:(encryption_type_ : encryption_type option)
    ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ~open_shard_count:(open_shard_count_ : shard_count_object)
    ~enhanced_monitoring:(enhanced_monitoring_ : enhanced_monitoring_list)
    ~stream_creation_timestamp:(stream_creation_timestamp_ : timestamp)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours)
    ~stream_status:(stream_status_ : stream_status) ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~stream_name:(stream_name_ : stream_name) () =
  ({
     consumer_count = consumer_count_;
     open_shard_count = open_shard_count_;
     key_id = key_id_;
     encryption_type = encryption_type_;
     enhanced_monitoring = enhanced_monitoring_;
     stream_creation_timestamp = stream_creation_timestamp_;
     retention_period_hours = retention_period_hours_;
     stream_mode_details = stream_mode_details_;
     stream_status = stream_status_;
     stream_ar_n = stream_ar_n_;
     stream_name = stream_name_;
   }
    : stream_description_summary)

let make_sequence_number_range
    ?ending_sequence_number:(ending_sequence_number_ : sequence_number option)
    ~starting_sequence_number:(starting_sequence_number_ : sequence_number) () =
  ({
     ending_sequence_number = ending_sequence_number_;
     starting_sequence_number = starting_sequence_number_;
   }
    : sequence_number_range)

let make_shard ?adjacent_parent_shard_id:(adjacent_parent_shard_id_ : shard_id option)
    ?parent_shard_id:(parent_shard_id_ : shard_id option)
    ~sequence_number_range:(sequence_number_range_ : sequence_number_range)
    ~hash_key_range:(hash_key_range_ : hash_key_range) ~shard_id:(shard_id_ : shard_id) () =
  ({
     sequence_number_range = sequence_number_range_;
     hash_key_range = hash_key_range_;
     adjacent_parent_shard_id = adjacent_parent_shard_id_;
     parent_shard_id = parent_shard_id_;
     shard_id = shard_id_;
   }
    : shard)

let make_stream_description ?key_id:(key_id_ : key_id option)
    ?encryption_type:(encryption_type_ : encryption_type option)
    ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ~enhanced_monitoring:(enhanced_monitoring_ : enhanced_monitoring_list)
    ~stream_creation_timestamp:(stream_creation_timestamp_ : timestamp)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours)
    ~has_more_shards:(has_more_shards_ : boolean_object) ~shards:(shards_ : shard_list)
    ~stream_status:(stream_status_ : stream_status) ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~stream_name:(stream_name_ : stream_name) () =
  ({
     key_id = key_id_;
     encryption_type = encryption_type_;
     enhanced_monitoring = enhanced_monitoring_;
     stream_creation_timestamp = stream_creation_timestamp_;
     retention_period_hours = retention_period_hours_;
     has_more_shards = has_more_shards_;
     shards = shards_;
     stream_mode_details = stream_mode_details_;
     stream_status = stream_status_;
     stream_ar_n = stream_ar_n_;
     stream_name = stream_name_;
   }
    : stream_description)

let make_stop_stream_encryption_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option) ~key_id:(key_id_ : key_id)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({
     stream_ar_n = stream_ar_n_;
     key_id = key_id_;
     encryption_type = encryption_type_;
     stream_name = stream_name_;
   }
    : stop_stream_encryption_input)

let make_start_stream_encryption_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option) ~key_id:(key_id_ : key_id)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({
     stream_ar_n = stream_ar_n_;
     key_id = key_id_;
     encryption_type = encryption_type_;
     stream_name = stream_name_;
   }
    : start_stream_encryption_input)

let make_split_shard_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ~new_starting_hash_key:(new_starting_hash_key_ : hash_key)
    ~shard_to_split:(shard_to_split_ : shard_id) () =
  ({
     stream_ar_n = stream_ar_n_;
     new_starting_hash_key = new_starting_hash_key_;
     shard_to_split = shard_to_split_;
     stream_name = stream_name_;
   }
    : split_shard_input)

let make_shard_filter ?timestamp:(timestamp_ : timestamp option)
    ?shard_id:(shard_id_ : shard_id option) ~type_:(type__ : shard_filter_type) () =
  ({ timestamp = timestamp_; shard_id = shard_id_; type_ = type__ } : shard_filter)

let make_remove_tags_from_stream_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option) ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ stream_ar_n = stream_ar_n_; tag_keys = tag_keys_; stream_name = stream_name_ }
    : remove_tags_from_stream_input)

let make_consumer ~consumer_creation_timestamp:(consumer_creation_timestamp_ : timestamp)
    ~consumer_status:(consumer_status_ : consumer_status)
    ~consumer_ar_n:(consumer_ar_n_ : consumer_ar_n) ~consumer_name:(consumer_name_ : consumer_name)
    () =
  ({
     consumer_creation_timestamp = consumer_creation_timestamp_;
     consumer_status = consumer_status_;
     consumer_ar_n = consumer_ar_n_;
     consumer_name = consumer_name_;
   }
    : consumer)

let make_register_stream_consumer_output ~consumer:(consumer_ : consumer) () =
  ({ consumer = consumer_ } : register_stream_consumer_output)

let make_register_stream_consumer_input ?tags:(tags_ : tag_map option)
    ~consumer_name:(consumer_name_ : consumer_name) ~stream_ar_n:(stream_ar_n_ : stream_ar_n) () =
  ({ tags = tags_; consumer_name = consumer_name_; stream_ar_n = stream_ar_n_ }
    : register_stream_consumer_input)

let make_put_resource_policy_input ~policy:(policy_ : policy)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ policy = policy_; resource_ar_n = resource_ar_n_ } : put_resource_policy_input)

let make_put_records_result_entry ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option) ?shard_id:(shard_id_ : shard_id option)
    ?sequence_number:(sequence_number_ : sequence_number option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     shard_id = shard_id_;
     sequence_number = sequence_number_;
   }
    : put_records_result_entry)

let make_put_records_request_entry ?explicit_hash_key:(explicit_hash_key_ : hash_key option)
    ~partition_key:(partition_key_ : partition_key) ~data:(data_ : data) () =
  ({ partition_key = partition_key_; explicit_hash_key = explicit_hash_key_; data = data_ }
    : put_records_request_entry)

let make_put_records_output ?encryption_type:(encryption_type_ : encryption_type option)
    ?failed_record_count:(failed_record_count_ : positive_integer_object option)
    ~records:(records_ : put_records_result_entry_list) () =
  ({
     encryption_type = encryption_type_;
     records = records_;
     failed_record_count = failed_record_count_;
   }
    : put_records_output)

let make_put_records_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ~records:(records_ : put_records_request_entry_list) () =
  ({ stream_ar_n = stream_ar_n_; stream_name = stream_name_; records = records_ }
    : put_records_input)

let make_put_record_output ?encryption_type:(encryption_type_ : encryption_type option)
    ~sequence_number:(sequence_number_ : sequence_number) ~shard_id:(shard_id_ : shard_id) () =
  ({ encryption_type = encryption_type_; sequence_number = sequence_number_; shard_id = shard_id_ }
    : put_record_output)

let make_put_record_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?sequence_number_for_ordering:(sequence_number_for_ordering_ : sequence_number option)
    ?explicit_hash_key:(explicit_hash_key_ : hash_key option)
    ?stream_name:(stream_name_ : stream_name option) ~partition_key:(partition_key_ : partition_key)
    ~data:(data_ : data) () =
  ({
     stream_ar_n = stream_ar_n_;
     sequence_number_for_ordering = sequence_number_for_ordering_;
     explicit_hash_key = explicit_hash_key_;
     partition_key = partition_key_;
     data = data_;
     stream_name = stream_name_;
   }
    : put_record_input)

let make_merge_shards_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ~adjacent_shard_to_merge:(adjacent_shard_to_merge_ : shard_id)
    ~shard_to_merge:(shard_to_merge_ : shard_id) () =
  ({
     stream_ar_n = stream_ar_n_;
     adjacent_shard_to_merge = adjacent_shard_to_merge_;
     shard_to_merge = shard_to_merge_;
     stream_name = stream_name_;
   }
    : merge_shards_input)

let make_list_tags_for_stream_output ~has_more_tags:(has_more_tags_ : boolean_object)
    ~tags:(tags_ : tag_list) () =
  ({ has_more_tags = has_more_tags_; tags = tags_ } : list_tags_for_stream_output)

let make_list_tags_for_stream_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?limit:(limit_ : list_tags_for_stream_input_limit option)
    ?exclusive_start_tag_key:(exclusive_start_tag_key_ : tag_key option)
    ?stream_name:(stream_name_ : stream_name option) () =
  ({
     stream_ar_n = stream_ar_n_;
     limit = limit_;
     exclusive_start_tag_key = exclusive_start_tag_key_;
     stream_name = stream_name_;
   }
    : list_tags_for_stream_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_input)

let make_list_streams_output ?stream_summaries:(stream_summaries_ : stream_summary_list option)
    ?next_token:(next_token_ : next_token option)
    ~has_more_streams:(has_more_streams_ : boolean_object)
    ~stream_names:(stream_names_ : stream_name_list) () =
  ({
     stream_summaries = stream_summaries_;
     next_token = next_token_;
     has_more_streams = has_more_streams_;
     stream_names = stream_names_;
   }
    : list_streams_output)

let make_list_streams_input ?next_token:(next_token_ : next_token option)
    ?exclusive_start_stream_name:(exclusive_start_stream_name_ : stream_name option)
    ?limit:(limit_ : list_streams_input_limit option) () =
  ({
     next_token = next_token_;
     exclusive_start_stream_name = exclusive_start_stream_name_;
     limit = limit_;
   }
    : list_streams_input)

let make_list_stream_consumers_output ?next_token:(next_token_ : next_token option)
    ?consumers:(consumers_ : consumer_list option) () =
  ({ next_token = next_token_; consumers = consumers_ } : list_stream_consumers_output)

let make_list_stream_consumers_input
    ?stream_creation_timestamp:(stream_creation_timestamp_ : timestamp option)
    ?max_results:(max_results_ : list_stream_consumers_input_limit option)
    ?next_token:(next_token_ : next_token option) ~stream_ar_n:(stream_ar_n_ : stream_ar_n) () =
  ({
     stream_creation_timestamp = stream_creation_timestamp_;
     max_results = max_results_;
     next_token = next_token_;
     stream_ar_n = stream_ar_n_;
   }
    : list_stream_consumers_input)

let make_list_shards_output ?next_token:(next_token_ : next_token option)
    ?shards:(shards_ : shard_list option) () =
  ({ next_token = next_token_; shards = shards_ } : list_shards_output)

let make_list_shards_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?shard_filter:(shard_filter_ : shard_filter option)
    ?stream_creation_timestamp:(stream_creation_timestamp_ : timestamp option)
    ?max_results:(max_results_ : list_shards_input_limit option)
    ?exclusive_start_shard_id:(exclusive_start_shard_id_ : shard_id option)
    ?next_token:(next_token_ : next_token option) ?stream_name:(stream_name_ : stream_name option)
    () =
  ({
     stream_ar_n = stream_ar_n_;
     shard_filter = shard_filter_;
     stream_creation_timestamp = stream_creation_timestamp_;
     max_results = max_results_;
     exclusive_start_shard_id = exclusive_start_shard_id_;
     next_token = next_token_;
     stream_name = stream_name_;
   }
    : list_shards_input)

let make_increase_stream_retention_period_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours) () =
  ({
     stream_ar_n = stream_ar_n_;
     retention_period_hours = retention_period_hours_;
     stream_name = stream_name_;
   }
    : increase_stream_retention_period_input)

let make_get_shard_iterator_output ?shard_iterator:(shard_iterator_ : shard_iterator option) () =
  ({ shard_iterator = shard_iterator_ } : get_shard_iterator_output)

let make_get_shard_iterator_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?timestamp:(timestamp_ : timestamp option)
    ?starting_sequence_number:(starting_sequence_number_ : sequence_number option)
    ?stream_name:(stream_name_ : stream_name option)
    ~shard_iterator_type:(shard_iterator_type_ : shard_iterator_type)
    ~shard_id:(shard_id_ : shard_id) () =
  ({
     stream_ar_n = stream_ar_n_;
     timestamp = timestamp_;
     starting_sequence_number = starting_sequence_number_;
     shard_iterator_type = shard_iterator_type_;
     shard_id = shard_id_;
     stream_name = stream_name_;
   }
    : get_shard_iterator_input)

let make_get_resource_policy_output ~policy:(policy_ : policy) () =
  ({ policy = policy_ } : get_resource_policy_output)

let make_get_resource_policy_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : get_resource_policy_input)

let make_get_records_output ?child_shards:(child_shards_ : child_shard_list option)
    ?millis_behind_latest:(millis_behind_latest_ : millis_behind_latest option)
    ?next_shard_iterator:(next_shard_iterator_ : shard_iterator option)
    ~records:(records_ : record_list) () =
  ({
     child_shards = child_shards_;
     millis_behind_latest = millis_behind_latest_;
     next_shard_iterator = next_shard_iterator_;
     records = records_;
   }
    : get_records_output)

let make_get_records_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?limit:(limit_ : get_records_input_limit option)
    ~shard_iterator:(shard_iterator_ : shard_iterator) () =
  ({ stream_ar_n = stream_ar_n_; limit = limit_; shard_iterator = shard_iterator_ }
    : get_records_input)

let make_enhanced_monitoring_output ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?desired_shard_level_metrics:(desired_shard_level_metrics_ : metrics_name_list option)
    ?current_shard_level_metrics:(current_shard_level_metrics_ : metrics_name_list option)
    ?stream_name:(stream_name_ : stream_name option) () =
  ({
     stream_ar_n = stream_ar_n_;
     desired_shard_level_metrics = desired_shard_level_metrics_;
     current_shard_level_metrics = current_shard_level_metrics_;
     stream_name = stream_name_;
   }
    : enhanced_monitoring_output)

let make_enable_enhanced_monitoring_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ~shard_level_metrics:(shard_level_metrics_ : metrics_name_list) () =
  ({
     stream_ar_n = stream_ar_n_;
     shard_level_metrics = shard_level_metrics_;
     stream_name = stream_name_;
   }
    : enable_enhanced_monitoring_input)

let make_disable_enhanced_monitoring_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ~shard_level_metrics:(shard_level_metrics_ : metrics_name_list) () =
  ({
     stream_ar_n = stream_ar_n_;
     shard_level_metrics = shard_level_metrics_;
     stream_name = stream_name_;
   }
    : disable_enhanced_monitoring_input)

let make_describe_stream_summary_output
    ~stream_description_summary:(stream_description_summary_ : stream_description_summary) () =
  ({ stream_description_summary = stream_description_summary_ } : describe_stream_summary_output)

let make_describe_stream_summary_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option) () =
  ({ stream_ar_n = stream_ar_n_; stream_name = stream_name_ } : describe_stream_summary_input)

let make_consumer_description ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~consumer_creation_timestamp:(consumer_creation_timestamp_ : timestamp)
    ~consumer_status:(consumer_status_ : consumer_status)
    ~consumer_ar_n:(consumer_ar_n_ : consumer_ar_n) ~consumer_name:(consumer_name_ : consumer_name)
    () =
  ({
     stream_ar_n = stream_ar_n_;
     consumer_creation_timestamp = consumer_creation_timestamp_;
     consumer_status = consumer_status_;
     consumer_ar_n = consumer_ar_n_;
     consumer_name = consumer_name_;
   }
    : consumer_description)

let make_describe_stream_consumer_output
    ~consumer_description:(consumer_description_ : consumer_description) () =
  ({ consumer_description = consumer_description_ } : describe_stream_consumer_output)

let make_describe_stream_consumer_input ?consumer_ar_n:(consumer_ar_n_ : consumer_ar_n option)
    ?consumer_name:(consumer_name_ : consumer_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) () =
  ({ consumer_ar_n = consumer_ar_n_; consumer_name = consumer_name_; stream_ar_n = stream_ar_n_ }
    : describe_stream_consumer_input)

let make_describe_stream_output ~stream_description:(stream_description_ : stream_description) () =
  ({ stream_description = stream_description_ } : describe_stream_output)

let make_describe_stream_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?exclusive_start_shard_id:(exclusive_start_shard_id_ : shard_id option)
    ?limit:(limit_ : describe_stream_input_limit option)
    ?stream_name:(stream_name_ : stream_name option) () =
  ({
     stream_ar_n = stream_ar_n_;
     exclusive_start_shard_id = exclusive_start_shard_id_;
     limit = limit_;
     stream_name = stream_name_;
   }
    : describe_stream_input)

let make_describe_limits_output
    ~on_demand_stream_count_limit:
      (on_demand_stream_count_limit_ : on_demand_stream_count_limit_object)
    ~on_demand_stream_count:(on_demand_stream_count_ : on_demand_stream_count_object)
    ~open_shard_count:(open_shard_count_ : shard_count_object)
    ~shard_limit:(shard_limit_ : shard_count_object) () =
  ({
     on_demand_stream_count_limit = on_demand_stream_count_limit_;
     on_demand_stream_count = on_demand_stream_count_;
     open_shard_count = open_shard_count_;
     shard_limit = shard_limit_;
   }
    : describe_limits_output)

let make_describe_limits_input () = (() : unit)

let make_deregister_stream_consumer_input ?consumer_ar_n:(consumer_ar_n_ : consumer_ar_n option)
    ?consumer_name:(consumer_name_ : consumer_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) () =
  ({ consumer_ar_n = consumer_ar_n_; consumer_name = consumer_name_; stream_ar_n = stream_ar_n_ }
    : deregister_stream_consumer_input)

let make_delete_stream_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?enforce_consumer_deletion:(enforce_consumer_deletion_ : boolean_object option)
    ?stream_name:(stream_name_ : stream_name option) () =
  ({
     stream_ar_n = stream_ar_n_;
     enforce_consumer_deletion = enforce_consumer_deletion_;
     stream_name = stream_name_;
   }
    : delete_stream_input)

let make_delete_resource_policy_input ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_ } : delete_resource_policy_input)

let make_decrease_stream_retention_period_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours) () =
  ({
     stream_ar_n = stream_ar_n_;
     retention_period_hours = retention_period_hours_;
     stream_name = stream_name_;
   }
    : decrease_stream_retention_period_input)

let make_create_stream_input ?tags:(tags_ : tag_map option)
    ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ?shard_count:(shard_count_ : positive_integer_object option)
    ~stream_name:(stream_name_ : stream_name) () =
  ({
     tags = tags_;
     stream_mode_details = stream_mode_details_;
     shard_count = shard_count_;
     stream_name = stream_name_;
   }
    : create_stream_input)

let make_add_tags_to_stream_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option) ~tags:(tags_ : tag_map) () =
  ({ stream_ar_n = stream_ar_n_; tags = tags_; stream_name = stream_name_ }
    : add_tags_to_stream_input)
