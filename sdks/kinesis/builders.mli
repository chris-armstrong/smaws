open Types

val make_add_tags_to_stream_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  tags:tag_map ->
  unit ->
  add_tags_to_stream_input

val make_hash_key_range :
  starting_hash_key:hash_key -> ending_hash_key:hash_key -> unit -> hash_key_range

val make_child_shard :
  shard_id:shard_id ->
  parent_shards:shard_id_list ->
  hash_key_range:hash_key_range ->
  unit ->
  child_shard

val make_consumer :
  consumer_name:consumer_name ->
  consumer_ar_n:consumer_ar_n ->
  consumer_status:consumer_status ->
  consumer_creation_timestamp:timestamp ->
  unit ->
  consumer

val make_consumer_description :
  consumer_name:consumer_name ->
  consumer_ar_n:consumer_ar_n ->
  consumer_status:consumer_status ->
  consumer_creation_timestamp:timestamp ->
  stream_ar_n:stream_ar_n ->
  unit ->
  consumer_description

val make_stream_mode_details : stream_mode:stream_mode -> unit -> stream_mode_details

val make_create_stream_input :
  ?shard_count:positive_integer_object ->
  ?stream_mode_details:stream_mode_details ->
  ?tags:tag_map ->
  ?warm_throughput_mi_bps:natural_integer_object ->
  ?max_record_size_in_ki_b:max_record_size_in_ki_b ->
  stream_name:stream_name ->
  unit ->
  create_stream_input

val make_decrease_stream_retention_period_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  retention_period_hours:retention_period_hours ->
  unit ->
  decrease_stream_retention_period_input

val make_delete_resource_policy_input :
  ?stream_id:stream_id -> resource_ar_n:resource_ar_n -> unit -> delete_resource_policy_input

val make_delete_stream_input :
  ?stream_name:stream_name ->
  ?enforce_consumer_deletion:boolean_object ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  unit ->
  delete_stream_input

val make_deregister_stream_consumer_input :
  ?stream_ar_n:stream_ar_n ->
  ?consumer_name:consumer_name ->
  ?consumer_ar_n:consumer_ar_n ->
  ?stream_id:stream_id ->
  unit ->
  deregister_stream_consumer_input

val make_minimum_throughput_billing_commitment_output :
  ?started_at:timestamp ->
  ?ended_at:timestamp ->
  ?earliest_allowed_end_at:timestamp ->
  status:minimum_throughput_billing_commitment_output_status ->
  unit ->
  minimum_throughput_billing_commitment_output

val make_describe_account_settings_output :
  ?minimum_throughput_billing_commitment:minimum_throughput_billing_commitment_output ->
  unit ->
  describe_account_settings_output

val make_describe_account_settings_input : unit -> unit

val make_describe_limits_output :
  shard_limit:shard_count_object ->
  open_shard_count:shard_count_object ->
  on_demand_stream_count:on_demand_stream_count_object ->
  on_demand_stream_count_limit:on_demand_stream_count_limit_object ->
  unit ->
  describe_limits_output

val make_describe_limits_input : unit -> unit
val make_enhanced_metrics : ?shard_level_metrics:metrics_name_list -> unit -> enhanced_metrics

val make_sequence_number_range :
  ?ending_sequence_number:sequence_number ->
  starting_sequence_number:sequence_number ->
  unit ->
  sequence_number_range

val make_shard :
  ?parent_shard_id:shard_id ->
  ?adjacent_parent_shard_id:shard_id ->
  shard_id:shard_id ->
  hash_key_range:hash_key_range ->
  sequence_number_range:sequence_number_range ->
  unit ->
  shard

val make_stream_description :
  ?stream_mode_details:stream_mode_details ->
  ?encryption_type:encryption_type ->
  ?key_id:key_id ->
  stream_name:stream_name ->
  stream_ar_n:stream_ar_n ->
  stream_status:stream_status ->
  shards:shard_list ->
  has_more_shards:boolean_object ->
  retention_period_hours:retention_period_hours ->
  stream_creation_timestamp:timestamp ->
  enhanced_monitoring:enhanced_monitoring_list ->
  unit ->
  stream_description

val make_describe_stream_output :
  stream_description:stream_description -> unit -> describe_stream_output

val make_describe_stream_input :
  ?stream_name:stream_name ->
  ?limit:describe_stream_input_limit ->
  ?exclusive_start_shard_id:shard_id ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  unit ->
  describe_stream_input

val make_describe_stream_consumer_output :
  consumer_description:consumer_description -> unit -> describe_stream_consumer_output

val make_describe_stream_consumer_input :
  ?stream_ar_n:stream_ar_n ->
  ?consumer_name:consumer_name ->
  ?consumer_ar_n:consumer_ar_n ->
  ?stream_id:stream_id ->
  unit ->
  describe_stream_consumer_input

val make_warm_throughput_object :
  ?target_mi_bps:natural_integer_object ->
  ?current_mi_bps:natural_integer_object ->
  unit ->
  warm_throughput_object

val make_stream_description_summary :
  ?stream_id:stream_id ->
  ?stream_mode_details:stream_mode_details ->
  ?encryption_type:encryption_type ->
  ?key_id:key_id ->
  ?consumer_count:consumer_count_object ->
  ?warm_throughput:warm_throughput_object ->
  ?max_record_size_in_ki_b:max_record_size_in_ki_b ->
  stream_name:stream_name ->
  stream_ar_n:stream_ar_n ->
  stream_status:stream_status ->
  retention_period_hours:retention_period_hours ->
  stream_creation_timestamp:timestamp ->
  enhanced_monitoring:enhanced_monitoring_list ->
  open_shard_count:shard_count_object ->
  unit ->
  stream_description_summary

val make_describe_stream_summary_output :
  stream_description_summary:stream_description_summary -> unit -> describe_stream_summary_output

val make_describe_stream_summary_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  unit ->
  describe_stream_summary_input

val make_enhanced_monitoring_output :
  ?stream_name:stream_name ->
  ?current_shard_level_metrics:metrics_name_list ->
  ?desired_shard_level_metrics:metrics_name_list ->
  ?stream_ar_n:stream_ar_n ->
  unit ->
  enhanced_monitoring_output

val make_disable_enhanced_monitoring_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  shard_level_metrics:metrics_name_list ->
  unit ->
  disable_enhanced_monitoring_input

val make_enable_enhanced_monitoring_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  shard_level_metrics:metrics_name_list ->
  unit ->
  enable_enhanced_monitoring_input

val make_record :
  ?approximate_arrival_timestamp:timestamp ->
  ?encryption_type:encryption_type ->
  sequence_number:sequence_number ->
  data:data ->
  partition_key:partition_key ->
  unit ->
  record

val make_get_records_output :
  ?next_shard_iterator:shard_iterator ->
  ?millis_behind_latest:millis_behind_latest ->
  ?child_shards:child_shard_list ->
  records:record_list ->
  unit ->
  get_records_output

val make_get_records_input :
  ?limit:get_records_input_limit ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  shard_iterator:shard_iterator ->
  unit ->
  get_records_input

val make_get_resource_policy_output : policy:policy -> unit -> get_resource_policy_output

val make_get_resource_policy_input :
  ?stream_id:stream_id -> resource_ar_n:resource_ar_n -> unit -> get_resource_policy_input

val make_get_shard_iterator_output :
  ?shard_iterator:shard_iterator -> unit -> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?stream_name:stream_name ->
  ?starting_sequence_number:sequence_number ->
  ?timestamp:timestamp ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  shard_id:shard_id ->
  shard_iterator_type:shard_iterator_type ->
  unit ->
  get_shard_iterator_input

val make_increase_stream_retention_period_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  retention_period_hours:retention_period_hours ->
  unit ->
  increase_stream_retention_period_input

val make_update_stream_warm_throughput_output :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  ?warm_throughput:warm_throughput_object ->
  unit ->
  update_stream_warm_throughput_output

val make_update_stream_warm_throughput_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  ?stream_id:stream_id ->
  warm_throughput_mi_bps:natural_integer_object ->
  unit ->
  update_stream_warm_throughput_input

val make_update_stream_mode_input :
  ?stream_id:stream_id ->
  ?warm_throughput_mi_bps:natural_integer_object ->
  stream_ar_n:stream_ar_n ->
  stream_mode_details:stream_mode_details ->
  unit ->
  update_stream_mode_input

val make_update_shard_count_output :
  ?stream_name:stream_name ->
  ?current_shard_count:positive_integer_object ->
  ?target_shard_count:positive_integer_object ->
  ?stream_ar_n:stream_ar_n ->
  unit ->
  update_shard_count_output

val make_update_shard_count_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  target_shard_count:positive_integer_object ->
  scaling_type:scaling_type ->
  unit ->
  update_shard_count_input

val make_update_max_record_size_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  max_record_size_in_ki_b:max_record_size_in_ki_b ->
  unit ->
  update_max_record_size_input

val make_update_account_settings_output :
  ?minimum_throughput_billing_commitment:minimum_throughput_billing_commitment_output ->
  unit ->
  update_account_settings_output

val make_minimum_throughput_billing_commitment_input :
  status:minimum_throughput_billing_commitment_input_status ->
  unit ->
  minimum_throughput_billing_commitment_input

val make_update_account_settings_input :
  minimum_throughput_billing_commitment:minimum_throughput_billing_commitment_input ->
  unit ->
  update_account_settings_input

val make_untag_resource_input :
  ?stream_id:stream_id ->
  tag_keys:tag_key_list ->
  resource_ar_n:resource_ar_n ->
  unit ->
  untag_resource_input

val make_tag_resource_input :
  ?stream_id:stream_id -> tags:tag_map -> resource_ar_n:resource_ar_n -> unit -> tag_resource_input

val make_subscribe_to_shard_event :
  ?child_shards:child_shard_list ->
  records:record_list ->
  continuation_sequence_number:sequence_number ->
  millis_behind_latest:millis_behind_latest ->
  unit ->
  subscribe_to_shard_event

val make_subscribe_to_shard_output :
  event_stream:subscribe_to_shard_event_stream -> unit -> subscribe_to_shard_output

val make_starting_position :
  ?sequence_number:sequence_number ->
  ?timestamp:timestamp ->
  type_:shard_iterator_type ->
  unit ->
  starting_position

val make_subscribe_to_shard_input :
  ?stream_id:stream_id ->
  consumer_ar_n:consumer_ar_n ->
  shard_id:shard_id ->
  starting_position:starting_position ->
  unit ->
  subscribe_to_shard_input

val make_stop_stream_encryption_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  encryption_type:encryption_type ->
  key_id:key_id ->
  unit ->
  stop_stream_encryption_input

val make_start_stream_encryption_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  encryption_type:encryption_type ->
  key_id:key_id ->
  unit ->
  start_stream_encryption_input

val make_split_shard_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  shard_to_split:shard_id ->
  new_starting_hash_key:hash_key ->
  unit ->
  split_shard_input

val make_remove_tags_from_stream_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  tag_keys:tag_key_list ->
  unit ->
  remove_tags_from_stream_input

val make_register_stream_consumer_output :
  consumer:consumer -> unit -> register_stream_consumer_output

val make_register_stream_consumer_input :
  ?stream_id:stream_id ->
  ?tags:tag_map ->
  stream_ar_n:stream_ar_n ->
  consumer_name:consumer_name ->
  unit ->
  register_stream_consumer_input

val make_put_resource_policy_input :
  ?stream_id:stream_id ->
  resource_ar_n:resource_ar_n ->
  policy:policy ->
  unit ->
  put_resource_policy_input

val make_put_records_result_entry :
  ?sequence_number:sequence_number ->
  ?shard_id:shard_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  put_records_result_entry

val make_put_records_output :
  ?failed_record_count:positive_integer_object ->
  ?encryption_type:encryption_type ->
  records:put_records_result_entry_list ->
  unit ->
  put_records_output

val make_put_records_request_entry :
  ?explicit_hash_key:hash_key ->
  data:data ->
  partition_key:partition_key ->
  unit ->
  put_records_request_entry

val make_put_records_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  records:put_records_request_entry_list ->
  unit ->
  put_records_input

val make_put_record_output :
  ?encryption_type:encryption_type ->
  shard_id:shard_id ->
  sequence_number:sequence_number ->
  unit ->
  put_record_output

val make_put_record_input :
  ?stream_name:stream_name ->
  ?explicit_hash_key:hash_key ->
  ?sequence_number_for_ordering:sequence_number ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  data:data ->
  partition_key:partition_key ->
  unit ->
  put_record_input

val make_merge_shards_input :
  ?stream_name:stream_name ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  shard_to_merge:shard_id ->
  adjacent_shard_to_merge:shard_id ->
  unit ->
  merge_shards_input

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_list_tags_for_stream_output :
  tags:tag_list -> has_more_tags:boolean_object -> unit -> list_tags_for_stream_output

val make_list_tags_for_stream_input :
  ?stream_name:stream_name ->
  ?exclusive_start_tag_key:tag_key ->
  ?limit:list_tags_for_stream_input_limit ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  unit ->
  list_tags_for_stream_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?stream_id:stream_id -> resource_ar_n:resource_ar_n -> unit -> list_tags_for_resource_input

val make_stream_summary :
  ?stream_mode_details:stream_mode_details ->
  ?stream_creation_timestamp:timestamp ->
  stream_name:stream_name ->
  stream_ar_n:stream_ar_n ->
  stream_status:stream_status ->
  unit ->
  stream_summary

val make_list_streams_output :
  ?next_token:next_token ->
  ?stream_summaries:stream_summary_list ->
  stream_names:stream_name_list ->
  has_more_streams:boolean_object ->
  unit ->
  list_streams_output

val make_list_streams_input :
  ?limit:list_streams_input_limit ->
  ?exclusive_start_stream_name:stream_name ->
  ?next_token:next_token ->
  unit ->
  list_streams_input

val make_list_stream_consumers_output :
  ?consumers:consumer_list -> ?next_token:next_token -> unit -> list_stream_consumers_output

val make_list_stream_consumers_input :
  ?next_token:next_token ->
  ?max_results:list_stream_consumers_input_limit ->
  ?stream_creation_timestamp:timestamp ->
  ?stream_id:stream_id ->
  stream_ar_n:stream_ar_n ->
  unit ->
  list_stream_consumers_input

val make_list_shards_output :
  ?shards:shard_list -> ?next_token:next_token -> unit -> list_shards_output

val make_shard_filter :
  ?shard_id:shard_id -> ?timestamp:timestamp -> type_:shard_filter_type -> unit -> shard_filter

val make_list_shards_input :
  ?stream_name:stream_name ->
  ?next_token:next_token ->
  ?exclusive_start_shard_id:shard_id ->
  ?max_results:list_shards_input_limit ->
  ?stream_creation_timestamp:timestamp ->
  ?shard_filter:shard_filter ->
  ?stream_ar_n:stream_ar_n ->
  ?stream_id:stream_id ->
  unit ->
  list_shards_input
