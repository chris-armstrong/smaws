open Types

let make_add_tags_to_stream_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~tags:(tags_ : tag_map) () =
  ({ stream_name = stream_name_; tags = tags_; stream_ar_n = stream_ar_n_; stream_id = stream_id_ }
    : add_tags_to_stream_input)

let make_hash_key_range ~starting_hash_key:(starting_hash_key_ : hash_key)
    ~ending_hash_key:(ending_hash_key_ : hash_key) () =
  ({ starting_hash_key = starting_hash_key_; ending_hash_key = ending_hash_key_ } : hash_key_range)

let make_child_shard ~shard_id:(shard_id_ : shard_id)
    ~parent_shards:(parent_shards_ : shard_id_list)
    ~hash_key_range:(hash_key_range_ : hash_key_range) () =
  ({ shard_id = shard_id_; parent_shards = parent_shards_; hash_key_range = hash_key_range_ }
    : child_shard)

let make_consumer ~consumer_name:(consumer_name_ : consumer_name)
    ~consumer_ar_n:(consumer_ar_n_ : consumer_ar_n)
    ~consumer_status:(consumer_status_ : consumer_status)
    ~consumer_creation_timestamp:(consumer_creation_timestamp_ : timestamp) () =
  ({
     consumer_name = consumer_name_;
     consumer_ar_n = consumer_ar_n_;
     consumer_status = consumer_status_;
     consumer_creation_timestamp = consumer_creation_timestamp_;
   }
    : consumer)

let make_consumer_description ~consumer_name:(consumer_name_ : consumer_name)
    ~consumer_ar_n:(consumer_ar_n_ : consumer_ar_n)
    ~consumer_status:(consumer_status_ : consumer_status)
    ~consumer_creation_timestamp:(consumer_creation_timestamp_ : timestamp)
    ~stream_ar_n:(stream_ar_n_ : stream_ar_n) () =
  ({
     consumer_name = consumer_name_;
     consumer_ar_n = consumer_ar_n_;
     consumer_status = consumer_status_;
     consumer_creation_timestamp = consumer_creation_timestamp_;
     stream_ar_n = stream_ar_n_;
   }
    : consumer_description)

let make_stream_mode_details ~stream_mode:(stream_mode_ : stream_mode) () =
  ({ stream_mode = stream_mode_ } : stream_mode_details)

let make_create_stream_input ?shard_count:(shard_count_ : positive_integer_object option)
    ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ?tags:(tags_ : tag_map option)
    ?warm_throughput_mi_bps:(warm_throughput_mi_bps_ : natural_integer_object option)
    ?max_record_size_in_ki_b:(max_record_size_in_ki_b_ : max_record_size_in_ki_b option)
    ~stream_name:(stream_name_ : stream_name) () =
  ({
     stream_name = stream_name_;
     shard_count = shard_count_;
     stream_mode_details = stream_mode_details_;
     tags = tags_;
     warm_throughput_mi_bps = warm_throughput_mi_bps_;
     max_record_size_in_ki_b = max_record_size_in_ki_b_;
   }
    : create_stream_input)

let make_decrease_stream_retention_period_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours) () =
  ({
     stream_name = stream_name_;
     retention_period_hours = retention_period_hours_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : decrease_stream_retention_period_input)

let make_delete_resource_policy_input ?stream_id:(stream_id_ : stream_id option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; stream_id = stream_id_ } : delete_resource_policy_input)

let make_delete_stream_input ?stream_name:(stream_name_ : stream_name option)
    ?enforce_consumer_deletion:(enforce_consumer_deletion_ : boolean_object option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option) () =
  ({
     stream_name = stream_name_;
     enforce_consumer_deletion = enforce_consumer_deletion_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : delete_stream_input)

let make_deregister_stream_consumer_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?consumer_name:(consumer_name_ : consumer_name option)
    ?consumer_ar_n:(consumer_ar_n_ : consumer_ar_n option)
    ?stream_id:(stream_id_ : stream_id option) () =
  ({
     stream_ar_n = stream_ar_n_;
     consumer_name = consumer_name_;
     consumer_ar_n = consumer_ar_n_;
     stream_id = stream_id_;
   }
    : deregister_stream_consumer_input)

let make_minimum_throughput_billing_commitment_output ?started_at:(started_at_ : timestamp option)
    ?ended_at:(ended_at_ : timestamp option)
    ?earliest_allowed_end_at:(earliest_allowed_end_at_ : timestamp option)
    ~status:(status_ : minimum_throughput_billing_commitment_output_status) () =
  ({
     status = status_;
     started_at = started_at_;
     ended_at = ended_at_;
     earliest_allowed_end_at = earliest_allowed_end_at_;
   }
    : minimum_throughput_billing_commitment_output)

let make_describe_account_settings_output
    ?minimum_throughput_billing_commitment:
      (minimum_throughput_billing_commitment_ : minimum_throughput_billing_commitment_output option)
    () =
  ({ minimum_throughput_billing_commitment = minimum_throughput_billing_commitment_ }
    : describe_account_settings_output)

let make_describe_account_settings_input () = (() : unit)

let make_describe_limits_output ~shard_limit:(shard_limit_ : shard_count_object)
    ~open_shard_count:(open_shard_count_ : shard_count_object)
    ~on_demand_stream_count:(on_demand_stream_count_ : on_demand_stream_count_object)
    ~on_demand_stream_count_limit:
      (on_demand_stream_count_limit_ : on_demand_stream_count_limit_object) () =
  ({
     shard_limit = shard_limit_;
     open_shard_count = open_shard_count_;
     on_demand_stream_count = on_demand_stream_count_;
     on_demand_stream_count_limit = on_demand_stream_count_limit_;
   }
    : describe_limits_output)

let make_describe_limits_input () = (() : unit)

let make_enhanced_metrics ?shard_level_metrics:(shard_level_metrics_ : metrics_name_list option) ()
    =
  ({ shard_level_metrics = shard_level_metrics_ } : enhanced_metrics)

let make_sequence_number_range
    ?ending_sequence_number:(ending_sequence_number_ : sequence_number option)
    ~starting_sequence_number:(starting_sequence_number_ : sequence_number) () =
  ({
     starting_sequence_number = starting_sequence_number_;
     ending_sequence_number = ending_sequence_number_;
   }
    : sequence_number_range)

let make_shard ?parent_shard_id:(parent_shard_id_ : shard_id option)
    ?adjacent_parent_shard_id:(adjacent_parent_shard_id_ : shard_id option)
    ~shard_id:(shard_id_ : shard_id) ~hash_key_range:(hash_key_range_ : hash_key_range)
    ~sequence_number_range:(sequence_number_range_ : sequence_number_range) () =
  ({
     shard_id = shard_id_;
     parent_shard_id = parent_shard_id_;
     adjacent_parent_shard_id = adjacent_parent_shard_id_;
     hash_key_range = hash_key_range_;
     sequence_number_range = sequence_number_range_;
   }
    : shard)

let make_stream_description ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ?encryption_type:(encryption_type_ : encryption_type option) ?key_id:(key_id_ : key_id option)
    ~stream_name:(stream_name_ : stream_name) ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~stream_status:(stream_status_ : stream_status) ~shards:(shards_ : shard_list)
    ~has_more_shards:(has_more_shards_ : boolean_object)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours)
    ~stream_creation_timestamp:(stream_creation_timestamp_ : timestamp)
    ~enhanced_monitoring:(enhanced_monitoring_ : enhanced_monitoring_list) () =
  ({
     stream_name = stream_name_;
     stream_ar_n = stream_ar_n_;
     stream_status = stream_status_;
     stream_mode_details = stream_mode_details_;
     shards = shards_;
     has_more_shards = has_more_shards_;
     retention_period_hours = retention_period_hours_;
     stream_creation_timestamp = stream_creation_timestamp_;
     enhanced_monitoring = enhanced_monitoring_;
     encryption_type = encryption_type_;
     key_id = key_id_;
   }
    : stream_description)

let make_describe_stream_output ~stream_description:(stream_description_ : stream_description) () =
  ({ stream_description = stream_description_ } : describe_stream_output)

let make_describe_stream_input ?stream_name:(stream_name_ : stream_name option)
    ?limit:(limit_ : describe_stream_input_limit option)
    ?exclusive_start_shard_id:(exclusive_start_shard_id_ : shard_id option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option) () =
  ({
     stream_name = stream_name_;
     limit = limit_;
     exclusive_start_shard_id = exclusive_start_shard_id_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : describe_stream_input)

let make_describe_stream_consumer_output
    ~consumer_description:(consumer_description_ : consumer_description) () =
  ({ consumer_description = consumer_description_ } : describe_stream_consumer_output)

let make_describe_stream_consumer_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?consumer_name:(consumer_name_ : consumer_name option)
    ?consumer_ar_n:(consumer_ar_n_ : consumer_ar_n option)
    ?stream_id:(stream_id_ : stream_id option) () =
  ({
     stream_ar_n = stream_ar_n_;
     consumer_name = consumer_name_;
     consumer_ar_n = consumer_ar_n_;
     stream_id = stream_id_;
   }
    : describe_stream_consumer_input)

let make_warm_throughput_object ?target_mi_bps:(target_mi_bps_ : natural_integer_object option)
    ?current_mi_bps:(current_mi_bps_ : natural_integer_object option) () =
  ({ target_mi_bps = target_mi_bps_; current_mi_bps = current_mi_bps_ } : warm_throughput_object)

let make_stream_description_summary ?stream_id:(stream_id_ : stream_id option)
    ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ?encryption_type:(encryption_type_ : encryption_type option) ?key_id:(key_id_ : key_id option)
    ?consumer_count:(consumer_count_ : consumer_count_object option)
    ?warm_throughput:(warm_throughput_ : warm_throughput_object option)
    ?max_record_size_in_ki_b:(max_record_size_in_ki_b_ : max_record_size_in_ki_b option)
    ~stream_name:(stream_name_ : stream_name) ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~stream_status:(stream_status_ : stream_status)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours)
    ~stream_creation_timestamp:(stream_creation_timestamp_ : timestamp)
    ~enhanced_monitoring:(enhanced_monitoring_ : enhanced_monitoring_list)
    ~open_shard_count:(open_shard_count_ : shard_count_object) () =
  ({
     stream_name = stream_name_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
     stream_status = stream_status_;
     stream_mode_details = stream_mode_details_;
     retention_period_hours = retention_period_hours_;
     stream_creation_timestamp = stream_creation_timestamp_;
     enhanced_monitoring = enhanced_monitoring_;
     encryption_type = encryption_type_;
     key_id = key_id_;
     open_shard_count = open_shard_count_;
     consumer_count = consumer_count_;
     warm_throughput = warm_throughput_;
     max_record_size_in_ki_b = max_record_size_in_ki_b_;
   }
    : stream_description_summary)

let make_describe_stream_summary_output
    ~stream_description_summary:(stream_description_summary_ : stream_description_summary) () =
  ({ stream_description_summary = stream_description_summary_ } : describe_stream_summary_output)

let make_describe_stream_summary_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option) () =
  ({ stream_name = stream_name_; stream_ar_n = stream_ar_n_; stream_id = stream_id_ }
    : describe_stream_summary_input)

let make_enhanced_monitoring_output ?stream_name:(stream_name_ : stream_name option)
    ?current_shard_level_metrics:(current_shard_level_metrics_ : metrics_name_list option)
    ?desired_shard_level_metrics:(desired_shard_level_metrics_ : metrics_name_list option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) () =
  ({
     stream_name = stream_name_;
     current_shard_level_metrics = current_shard_level_metrics_;
     desired_shard_level_metrics = desired_shard_level_metrics_;
     stream_ar_n = stream_ar_n_;
   }
    : enhanced_monitoring_output)

let make_disable_enhanced_monitoring_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~shard_level_metrics:(shard_level_metrics_ : metrics_name_list) () =
  ({
     stream_name = stream_name_;
     shard_level_metrics = shard_level_metrics_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : disable_enhanced_monitoring_input)

let make_enable_enhanced_monitoring_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~shard_level_metrics:(shard_level_metrics_ : metrics_name_list) () =
  ({
     stream_name = stream_name_;
     shard_level_metrics = shard_level_metrics_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : enable_enhanced_monitoring_input)

let make_record ?approximate_arrival_timestamp:(approximate_arrival_timestamp_ : timestamp option)
    ?encryption_type:(encryption_type_ : encryption_type option)
    ~sequence_number:(sequence_number_ : sequence_number) ~data:(data_ : data)
    ~partition_key:(partition_key_ : partition_key) () =
  ({
     sequence_number = sequence_number_;
     approximate_arrival_timestamp = approximate_arrival_timestamp_;
     data = data_;
     partition_key = partition_key_;
     encryption_type = encryption_type_;
   }
    : record)

let make_get_records_output ?next_shard_iterator:(next_shard_iterator_ : shard_iterator option)
    ?millis_behind_latest:(millis_behind_latest_ : millis_behind_latest option)
    ?child_shards:(child_shards_ : child_shard_list option) ~records:(records_ : record_list) () =
  ({
     records = records_;
     next_shard_iterator = next_shard_iterator_;
     millis_behind_latest = millis_behind_latest_;
     child_shards = child_shards_;
   }
    : get_records_output)

let make_get_records_input ?limit:(limit_ : get_records_input_limit option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~shard_iterator:(shard_iterator_ : shard_iterator) () =
  ({
     shard_iterator = shard_iterator_;
     limit = limit_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : get_records_input)

let make_get_resource_policy_output ~policy:(policy_ : policy) () =
  ({ policy = policy_ } : get_resource_policy_output)

let make_get_resource_policy_input ?stream_id:(stream_id_ : stream_id option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; stream_id = stream_id_ } : get_resource_policy_input)

let make_get_shard_iterator_output ?shard_iterator:(shard_iterator_ : shard_iterator option) () =
  ({ shard_iterator = shard_iterator_ } : get_shard_iterator_output)

let make_get_shard_iterator_input ?stream_name:(stream_name_ : stream_name option)
    ?starting_sequence_number:(starting_sequence_number_ : sequence_number option)
    ?timestamp:(timestamp_ : timestamp option) ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_id:(stream_id_ : stream_id option) ~shard_id:(shard_id_ : shard_id)
    ~shard_iterator_type:(shard_iterator_type_ : shard_iterator_type) () =
  ({
     stream_name = stream_name_;
     shard_id = shard_id_;
     shard_iterator_type = shard_iterator_type_;
     starting_sequence_number = starting_sequence_number_;
     timestamp = timestamp_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : get_shard_iterator_input)

let make_increase_stream_retention_period_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~retention_period_hours:(retention_period_hours_ : retention_period_hours) () =
  ({
     stream_name = stream_name_;
     retention_period_hours = retention_period_hours_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : increase_stream_retention_period_input)

let make_update_stream_warm_throughput_output ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option)
    ?warm_throughput:(warm_throughput_ : warm_throughput_object option) () =
  ({ stream_ar_n = stream_ar_n_; stream_name = stream_name_; warm_throughput = warm_throughput_ }
    : update_stream_warm_throughput_output)

let make_update_stream_warm_throughput_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_name:(stream_name_ : stream_name option) ?stream_id:(stream_id_ : stream_id option)
    ~warm_throughput_mi_bps:(warm_throughput_mi_bps_ : natural_integer_object) () =
  ({
     stream_ar_n = stream_ar_n_;
     stream_name = stream_name_;
     stream_id = stream_id_;
     warm_throughput_mi_bps = warm_throughput_mi_bps_;
   }
    : update_stream_warm_throughput_input)

let make_update_stream_mode_input ?stream_id:(stream_id_ : stream_id option)
    ?warm_throughput_mi_bps:(warm_throughput_mi_bps_ : natural_integer_object option)
    ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~stream_mode_details:(stream_mode_details_ : stream_mode_details) () =
  ({
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
     stream_mode_details = stream_mode_details_;
     warm_throughput_mi_bps = warm_throughput_mi_bps_;
   }
    : update_stream_mode_input)

let make_update_shard_count_output ?stream_name:(stream_name_ : stream_name option)
    ?current_shard_count:(current_shard_count_ : positive_integer_object option)
    ?target_shard_count:(target_shard_count_ : positive_integer_object option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) () =
  ({
     stream_name = stream_name_;
     current_shard_count = current_shard_count_;
     target_shard_count = target_shard_count_;
     stream_ar_n = stream_ar_n_;
   }
    : update_shard_count_output)

let make_update_shard_count_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~target_shard_count:(target_shard_count_ : positive_integer_object)
    ~scaling_type:(scaling_type_ : scaling_type) () =
  ({
     stream_name = stream_name_;
     target_shard_count = target_shard_count_;
     scaling_type = scaling_type_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : update_shard_count_input)

let make_update_max_record_size_input ?stream_ar_n:(stream_ar_n_ : stream_ar_n option)
    ?stream_id:(stream_id_ : stream_id option)
    ~max_record_size_in_ki_b:(max_record_size_in_ki_b_ : max_record_size_in_ki_b) () =
  ({
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
     max_record_size_in_ki_b = max_record_size_in_ki_b_;
   }
    : update_max_record_size_input)

let make_update_account_settings_output
    ?minimum_throughput_billing_commitment:
      (minimum_throughput_billing_commitment_ : minimum_throughput_billing_commitment_output option)
    () =
  ({ minimum_throughput_billing_commitment = minimum_throughput_billing_commitment_ }
    : update_account_settings_output)

let make_minimum_throughput_billing_commitment_input
    ~status:(status_ : minimum_throughput_billing_commitment_input_status) () =
  ({ status = status_ } : minimum_throughput_billing_commitment_input)

let make_update_account_settings_input
    ~minimum_throughput_billing_commitment:
      (minimum_throughput_billing_commitment_ : minimum_throughput_billing_commitment_input) () =
  ({ minimum_throughput_billing_commitment = minimum_throughput_billing_commitment_ }
    : update_account_settings_input)

let make_untag_resource_input ?stream_id:(stream_id_ : stream_id option)
    ~tag_keys:(tag_keys_ : tag_key_list) ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_; stream_id = stream_id_ }
    : untag_resource_input)

let make_tag_resource_input ?stream_id:(stream_id_ : stream_id option) ~tags:(tags_ : tag_map)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_; stream_id = stream_id_ } : tag_resource_input)

let make_subscribe_to_shard_event ?child_shards:(child_shards_ : child_shard_list option)
    ~records:(records_ : record_list)
    ~continuation_sequence_number:(continuation_sequence_number_ : sequence_number)
    ~millis_behind_latest:(millis_behind_latest_ : millis_behind_latest) () =
  ({
     records = records_;
     continuation_sequence_number = continuation_sequence_number_;
     millis_behind_latest = millis_behind_latest_;
     child_shards = child_shards_;
   }
    : subscribe_to_shard_event)

let make_subscribe_to_shard_output ~event_stream:(event_stream_ : subscribe_to_shard_event_stream)
    () =
  ({ event_stream = event_stream_ } : subscribe_to_shard_output)

let make_starting_position ?sequence_number:(sequence_number_ : sequence_number option)
    ?timestamp:(timestamp_ : timestamp option) ~type_:(type__ : shard_iterator_type) () =
  ({ type_ = type__; sequence_number = sequence_number_; timestamp = timestamp_ }
    : starting_position)

let make_subscribe_to_shard_input ?stream_id:(stream_id_ : stream_id option)
    ~consumer_ar_n:(consumer_ar_n_ : consumer_ar_n) ~shard_id:(shard_id_ : shard_id)
    ~starting_position:(starting_position_ : starting_position) () =
  ({
     consumer_ar_n = consumer_ar_n_;
     stream_id = stream_id_;
     shard_id = shard_id_;
     starting_position = starting_position_;
   }
    : subscribe_to_shard_input)

let make_stop_stream_encryption_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~encryption_type:(encryption_type_ : encryption_type) ~key_id:(key_id_ : key_id) () =
  ({
     stream_name = stream_name_;
     encryption_type = encryption_type_;
     key_id = key_id_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : stop_stream_encryption_input)

let make_start_stream_encryption_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~encryption_type:(encryption_type_ : encryption_type) ~key_id:(key_id_ : key_id) () =
  ({
     stream_name = stream_name_;
     encryption_type = encryption_type_;
     key_id = key_id_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : start_stream_encryption_input)

let make_split_shard_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~shard_to_split:(shard_to_split_ : shard_id)
    ~new_starting_hash_key:(new_starting_hash_key_ : hash_key) () =
  ({
     stream_name = stream_name_;
     shard_to_split = shard_to_split_;
     new_starting_hash_key = new_starting_hash_key_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : split_shard_input)

let make_remove_tags_from_stream_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({
     stream_name = stream_name_;
     tag_keys = tag_keys_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : remove_tags_from_stream_input)

let make_register_stream_consumer_output ~consumer:(consumer_ : consumer) () =
  ({ consumer = consumer_ } : register_stream_consumer_output)

let make_register_stream_consumer_input ?stream_id:(stream_id_ : stream_id option)
    ?tags:(tags_ : tag_map option) ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~consumer_name:(consumer_name_ : consumer_name) () =
  ({
     stream_ar_n = stream_ar_n_;
     consumer_name = consumer_name_;
     stream_id = stream_id_;
     tags = tags_;
   }
    : register_stream_consumer_input)

let make_put_resource_policy_input ?stream_id:(stream_id_ : stream_id option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) ~policy:(policy_ : policy) () =
  ({ resource_ar_n = resource_ar_n_; stream_id = stream_id_; policy = policy_ }
    : put_resource_policy_input)

let make_put_records_result_entry ?sequence_number:(sequence_number_ : sequence_number option)
    ?shard_id:(shard_id_ : shard_id option) ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     sequence_number = sequence_number_;
     shard_id = shard_id_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : put_records_result_entry)

let make_put_records_output
    ?failed_record_count:(failed_record_count_ : positive_integer_object option)
    ?encryption_type:(encryption_type_ : encryption_type option)
    ~records:(records_ : put_records_result_entry_list) () =
  ({
     failed_record_count = failed_record_count_;
     records = records_;
     encryption_type = encryption_type_;
   }
    : put_records_output)

let make_put_records_request_entry ?explicit_hash_key:(explicit_hash_key_ : hash_key option)
    ~data:(data_ : data) ~partition_key:(partition_key_ : partition_key) () =
  ({ data = data_; explicit_hash_key = explicit_hash_key_; partition_key = partition_key_ }
    : put_records_request_entry)

let make_put_records_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~records:(records_ : put_records_request_entry_list) () =
  ({
     records = records_;
     stream_name = stream_name_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : put_records_input)

let make_put_record_output ?encryption_type:(encryption_type_ : encryption_type option)
    ~shard_id:(shard_id_ : shard_id) ~sequence_number:(sequence_number_ : sequence_number) () =
  ({ shard_id = shard_id_; sequence_number = sequence_number_; encryption_type = encryption_type_ }
    : put_record_output)

let make_put_record_input ?stream_name:(stream_name_ : stream_name option)
    ?explicit_hash_key:(explicit_hash_key_ : hash_key option)
    ?sequence_number_for_ordering:(sequence_number_for_ordering_ : sequence_number option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~data:(data_ : data) ~partition_key:(partition_key_ : partition_key) () =
  ({
     stream_name = stream_name_;
     data = data_;
     partition_key = partition_key_;
     explicit_hash_key = explicit_hash_key_;
     sequence_number_for_ordering = sequence_number_for_ordering_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : put_record_input)

let make_merge_shards_input ?stream_name:(stream_name_ : stream_name option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option)
    ~shard_to_merge:(shard_to_merge_ : shard_id)
    ~adjacent_shard_to_merge:(adjacent_shard_to_merge_ : shard_id) () =
  ({
     stream_name = stream_name_;
     shard_to_merge = shard_to_merge_;
     adjacent_shard_to_merge = adjacent_shard_to_merge_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : merge_shards_input)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_list_tags_for_stream_output ~tags:(tags_ : tag_list)
    ~has_more_tags:(has_more_tags_ : boolean_object) () =
  ({ tags = tags_; has_more_tags = has_more_tags_ } : list_tags_for_stream_output)

let make_list_tags_for_stream_input ?stream_name:(stream_name_ : stream_name option)
    ?exclusive_start_tag_key:(exclusive_start_tag_key_ : tag_key option)
    ?limit:(limit_ : list_tags_for_stream_input_limit option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option) () =
  ({
     stream_name = stream_name_;
     exclusive_start_tag_key = exclusive_start_tag_key_;
     limit = limit_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : list_tags_for_stream_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?stream_id:(stream_id_ : stream_id option)
    ~resource_ar_n:(resource_ar_n_ : resource_ar_n) () =
  ({ resource_ar_n = resource_ar_n_; stream_id = stream_id_ } : list_tags_for_resource_input)

let make_stream_summary ?stream_mode_details:(stream_mode_details_ : stream_mode_details option)
    ?stream_creation_timestamp:(stream_creation_timestamp_ : timestamp option)
    ~stream_name:(stream_name_ : stream_name) ~stream_ar_n:(stream_ar_n_ : stream_ar_n)
    ~stream_status:(stream_status_ : stream_status) () =
  ({
     stream_name = stream_name_;
     stream_ar_n = stream_ar_n_;
     stream_status = stream_status_;
     stream_mode_details = stream_mode_details_;
     stream_creation_timestamp = stream_creation_timestamp_;
   }
    : stream_summary)

let make_list_streams_output ?next_token:(next_token_ : next_token option)
    ?stream_summaries:(stream_summaries_ : stream_summary_list option)
    ~stream_names:(stream_names_ : stream_name_list)
    ~has_more_streams:(has_more_streams_ : boolean_object) () =
  ({
     stream_names = stream_names_;
     has_more_streams = has_more_streams_;
     next_token = next_token_;
     stream_summaries = stream_summaries_;
   }
    : list_streams_output)

let make_list_streams_input ?limit:(limit_ : list_streams_input_limit option)
    ?exclusive_start_stream_name:(exclusive_start_stream_name_ : stream_name option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     limit = limit_;
     exclusive_start_stream_name = exclusive_start_stream_name_;
     next_token = next_token_;
   }
    : list_streams_input)

let make_list_stream_consumers_output ?consumers:(consumers_ : consumer_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ consumers = consumers_; next_token = next_token_ } : list_stream_consumers_output)

let make_list_stream_consumers_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_stream_consumers_input_limit option)
    ?stream_creation_timestamp:(stream_creation_timestamp_ : timestamp option)
    ?stream_id:(stream_id_ : stream_id option) ~stream_ar_n:(stream_ar_n_ : stream_ar_n) () =
  ({
     stream_ar_n = stream_ar_n_;
     next_token = next_token_;
     max_results = max_results_;
     stream_creation_timestamp = stream_creation_timestamp_;
     stream_id = stream_id_;
   }
    : list_stream_consumers_input)

let make_list_shards_output ?shards:(shards_ : shard_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ shards = shards_; next_token = next_token_ } : list_shards_output)

let make_shard_filter ?shard_id:(shard_id_ : shard_id option)
    ?timestamp:(timestamp_ : timestamp option) ~type_:(type__ : shard_filter_type) () =
  ({ type_ = type__; shard_id = shard_id_; timestamp = timestamp_ } : shard_filter)

let make_list_shards_input ?stream_name:(stream_name_ : stream_name option)
    ?next_token:(next_token_ : next_token option)
    ?exclusive_start_shard_id:(exclusive_start_shard_id_ : shard_id option)
    ?max_results:(max_results_ : list_shards_input_limit option)
    ?stream_creation_timestamp:(stream_creation_timestamp_ : timestamp option)
    ?shard_filter:(shard_filter_ : shard_filter option)
    ?stream_ar_n:(stream_ar_n_ : stream_ar_n option) ?stream_id:(stream_id_ : stream_id option) () =
  ({
     stream_name = stream_name_;
     next_token = next_token_;
     exclusive_start_shard_id = exclusive_start_shard_id_;
     max_results = max_results_;
     stream_creation_timestamp = stream_creation_timestamp_;
     shard_filter = shard_filter_;
     stream_ar_n = stream_ar_n_;
     stream_id = stream_id_;
   }
    : list_shards_input)
