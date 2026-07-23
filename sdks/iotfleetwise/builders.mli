open Types

val make_actuator :
  ?description:description ->
  ?unit_:string_ ->
  ?allowed_values:list_of_strings ->
  ?min:double ->
  ?max:double ->
  ?assigned_value:string_ ->
  ?deprecation_message:message ->
  ?comment:message ->
  ?struct_fully_qualified_name:node_path ->
  fully_qualified_name:string_ ->
  data_type:node_data_type ->
  unit ->
  actuator

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_associate_vehicle_fleet_response : unit -> unit

val make_associate_vehicle_fleet_request :
  vehicle_name:vehicle_name -> fleet_id:fleet_id -> unit -> associate_vehicle_fleet_request

val make_attribute :
  ?description:description ->
  ?unit_:string_ ->
  ?allowed_values:list_of_strings ->
  ?min:double ->
  ?max:double ->
  ?assigned_value:string_ ->
  ?default_value:string_ ->
  ?deprecation_message:message ->
  ?comment:message ->
  fully_qualified_name:string_ ->
  data_type:node_data_type ->
  unit ->
  attribute

val make_create_vehicle_error :
  ?vehicle_name:vehicle_name -> ?code:string_ -> ?message:string_ -> unit -> create_vehicle_error

val make_create_vehicle_response_item :
  ?vehicle_name:vehicle_name -> ?arn:arn -> ?thing_arn:arn -> unit -> create_vehicle_response_item

val make_batch_create_vehicle_response :
  ?vehicles:create_vehicle_responses ->
  ?errors:create_vehicle_errors ->
  unit ->
  batch_create_vehicle_response

val make_on_change_state_template_update_strategy : unit -> unit
val make_time_period : unit_:time_unit -> value:positive_integer -> unit -> time_period

val make_periodic_state_template_update_strategy :
  state_template_update_rate:time_period -> unit -> periodic_state_template_update_strategy

val make_state_template_association :
  identifier:resource_identifier ->
  state_template_update_strategy:state_template_update_strategy ->
  unit ->
  state_template_association

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_vehicle_request_item :
  ?attributes:attributes_map ->
  ?association_behavior:vehicle_association_behavior ->
  ?tags:tag_list ->
  ?state_templates:state_template_associations ->
  vehicle_name:vehicle_name ->
  model_manifest_arn:arn ->
  decoder_manifest_arn:arn ->
  unit ->
  create_vehicle_request_item

val make_batch_create_vehicle_request :
  vehicles:create_vehicle_request_items -> unit -> batch_create_vehicle_request

val make_update_vehicle_error :
  ?vehicle_name:vehicle_name -> ?code:number -> ?message:string_ -> unit -> update_vehicle_error

val make_update_vehicle_response_item :
  ?vehicle_name:vehicle_name -> ?arn:arn -> unit -> update_vehicle_response_item

val make_batch_update_vehicle_response :
  ?vehicles:update_vehicle_response_items ->
  ?errors:update_vehicle_errors ->
  unit ->
  batch_update_vehicle_response

val make_update_vehicle_request_item :
  ?model_manifest_arn:arn ->
  ?decoder_manifest_arn:arn ->
  ?attributes:attributes_map ->
  ?attribute_update_mode:update_mode ->
  ?state_templates_to_add:state_template_associations ->
  ?state_templates_to_remove:state_template_association_identifiers ->
  ?state_templates_to_update:state_template_associations ->
  vehicle_name:vehicle_name ->
  unit ->
  update_vehicle_request_item

val make_batch_update_vehicle_request :
  vehicles:update_vehicle_request_items -> unit -> batch_update_vehicle_request

val make_branch :
  ?description:description ->
  ?deprecation_message:message ->
  ?comment:message ->
  fully_qualified_name:string_ ->
  unit ->
  branch

val make_campaign_summary :
  ?arn:campaign_arn ->
  ?name:campaign_name ->
  ?description:description ->
  ?signal_catalog_arn:arn ->
  ?target_arn:arn ->
  ?status:campaign_status ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  campaign_summary

val make_can_dbc_definition :
  ?signals_map:model_signals_map ->
  network_interface:interface_id ->
  can_dbc_files:network_files_list ->
  unit ->
  can_dbc_definition

val make_can_interface :
  ?protocol_name:protocol_name ->
  ?protocol_version:protocol_version ->
  name:can_interface_name ->
  unit ->
  can_interface

val make_can_signal :
  ?name:can_signal_name ->
  ?signal_value_type:signal_value_type ->
  message_id:non_negative_integer ->
  is_big_endian:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  is_signed:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  start_bit:non_negative_integer ->
  offset:double ->
  factor:double ->
  length:non_negative_integer ->
  unit ->
  can_signal

val make_cloud_watch_log_delivery_options :
  ?log_group_name:cloud_watch_log_group_name ->
  log_type:log_type ->
  unit ->
  cloud_watch_log_delivery_options

val make_condition_based_collection_scheme :
  ?minimum_trigger_interval_ms:uint32 ->
  ?trigger_mode:trigger_mode ->
  ?condition_language_version:language_version ->
  expression:event_expression ->
  unit ->
  condition_based_collection_scheme

val make_time_based_collection_scheme :
  period_ms:collection_period_ms -> unit -> time_based_collection_scheme

val make_condition_based_signal_fetch_config :
  condition_expression:fetch_config_event_expression ->
  trigger_mode:trigger_mode ->
  unit ->
  condition_based_signal_fetch_config

val make_create_campaign_response :
  ?name:campaign_name -> ?arn:campaign_arn -> unit -> create_campaign_response

val make_time_based_signal_fetch_config :
  execution_frequency_ms:positive_long -> unit -> time_based_signal_fetch_config

val make_signal_fetch_information :
  ?condition_language_version:language_version ->
  fully_qualified_name:node_path ->
  signal_fetch_config:signal_fetch_config ->
  actions:event_expression_list ->
  unit ->
  signal_fetch_information

val make_data_partition_upload_options :
  ?condition_language_version:language_version ->
  expression:event_expression ->
  unit ->
  data_partition_upload_options

val make_storage_minimum_time_to_live :
  unit_:storage_minimum_time_to_live_unit ->
  value:storage_minimum_time_to_live_value ->
  unit ->
  storage_minimum_time_to_live

val make_storage_maximum_size :
  unit_:storage_maximum_size_unit ->
  value:storage_maximum_size_value ->
  unit ->
  storage_maximum_size

val make_data_partition_storage_options :
  maximum_size:storage_maximum_size ->
  storage_location:storage_location ->
  minimum_time_to_live:storage_minimum_time_to_live ->
  unit ->
  data_partition_storage_options

val make_data_partition :
  ?upload_options:data_partition_upload_options ->
  id:data_partition_id ->
  storage_options:data_partition_storage_options ->
  unit ->
  data_partition

val make_mqtt_topic_config :
  mqtt_topic_arn:mqtt_topic_arn -> execution_role_arn:iam_role_arn -> unit -> mqtt_topic_config

val make_timestream_config :
  timestream_table_arn:timestream_table_arn ->
  execution_role_arn:iam_role_arn ->
  unit ->
  timestream_config

val make_s3_config :
  ?data_format:data_format ->
  ?storage_compression_format:storage_compression_format ->
  ?prefix:prefix ->
  bucket_arn:s3_bucket_arn ->
  unit ->
  s3_config

val make_signal_information :
  ?max_sample_count:max_sample_count ->
  ?minimum_sampling_interval_ms:uint32 ->
  ?data_partition_id:data_partition_id ->
  name:wildcard_signal_name ->
  unit ->
  signal_information

val make_create_campaign_request :
  ?description:description ->
  ?start_time:timestamp ->
  ?expiry_time:timestamp ->
  ?post_trigger_collection_duration:uint32 ->
  ?diagnostics_mode:diagnostics_mode ->
  ?spooling_mode:spooling_mode ->
  ?compression:compression ->
  ?priority:priority ->
  ?signals_to_collect:signal_information_list ->
  ?data_extra_dimensions:data_extra_dimension_node_path_list ->
  ?tags:tag_list ->
  ?data_destination_configs:data_destination_configs ->
  ?data_partitions:data_partitions ->
  ?signals_to_fetch:signal_fetch_information_list ->
  name:campaign_name ->
  signal_catalog_arn:arn ->
  target_arn:arn ->
  collection_scheme:collection_scheme ->
  unit ->
  create_campaign_request

val make_invalid_network_interface :
  ?interface_id:interface_id ->
  ?reason:network_interface_failure_reason ->
  unit ->
  invalid_network_interface

val make_invalid_signal_decoder :
  ?name:fully_qualified_name ->
  ?reason:signal_decoder_failure_reason ->
  ?hint:message ->
  unit ->
  invalid_signal_decoder

val make_create_decoder_manifest_response :
  name:resource_name -> arn:arn -> unit -> create_decoder_manifest_response

val make_custom_decoding_interface :
  name:custom_decoding_signal_interface_name -> unit -> custom_decoding_interface

val make_vehicle_middleware :
  name:vehicle_middleware_name ->
  protocol_name:vehicle_middleware_protocol ->
  unit ->
  vehicle_middleware

val make_obd_interface :
  ?obd_standard:obd_standard ->
  ?pid_request_interval_seconds:non_negative_integer ->
  ?dtc_request_interval_seconds:non_negative_integer ->
  ?use_extended_ids:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?has_transmission_ecu:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  name:obd_interface_name ->
  request_message_id:non_negative_integer ->
  unit ->
  obd_interface

val make_network_interface :
  ?can_interface:can_interface ->
  ?obd_interface:obd_interface ->
  ?vehicle_middleware:vehicle_middleware ->
  ?custom_decoding_interface:custom_decoding_interface ->
  interface_id:interface_id ->
  type_:network_interface_type ->
  unit ->
  network_interface

val make_custom_decoding_signal : id:custom_decoding_id -> unit -> custom_decoding_signal

val make_ros2_primitive_message_definition :
  ?offset:double ->
  ?scaling:double ->
  ?upper_bound:max_string_size ->
  primitive_type:ros2_primitive_type ->
  unit ->
  ros2_primitive_message_definition

val make_structured_message_list_definition :
  ?capacity:non_negative_integer ->
  name:structure_message_name ->
  member_type:structured_message ->
  list_type:structured_message_list_type ->
  unit ->
  structured_message_list_definition

val make_structured_message_field_name_and_data_type_pair :
  field_name:structure_message_name ->
  data_type:structured_message ->
  unit ->
  structured_message_field_name_and_data_type_pair

val make_message_signal :
  topic_name:topic_name -> structured_message:structured_message -> unit -> message_signal

val make_obd_signal :
  ?bit_right_shift:non_negative_integer ->
  ?bit_mask_length:obd_bitmask_length ->
  ?is_signed:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?signal_value_type:signal_value_type ->
  pid_response_length:positive_integer ->
  service_mode:non_negative_integer ->
  pid:non_negative_integer ->
  scaling:double ->
  offset:double ->
  start_byte:non_negative_integer ->
  byte_length:obd_byte_length ->
  unit ->
  obd_signal

val make_signal_decoder :
  ?can_signal:can_signal ->
  ?obd_signal:obd_signal ->
  ?message_signal:message_signal ->
  ?custom_decoding_signal:custom_decoding_signal ->
  fully_qualified_name:fully_qualified_name ->
  type_:signal_decoder_type ->
  interface_id:interface_id ->
  unit ->
  signal_decoder

val make_create_decoder_manifest_request :
  ?description:description ->
  ?signal_decoders:signal_decoders ->
  ?network_interfaces:network_interfaces ->
  ?default_for_unmapped_signals:default_for_unmapped_signals_type ->
  ?tags:tag_list ->
  name:resource_name ->
  model_manifest_arn:arn ->
  unit ->
  create_decoder_manifest_request

val make_create_fleet_response : id:fleet_id -> arn:arn -> unit -> create_fleet_response

val make_create_fleet_request :
  ?description:description ->
  ?tags:tag_list ->
  fleet_id:fleet_id ->
  signal_catalog_arn:arn ->
  unit ->
  create_fleet_request

val make_invalid_signal : ?name:fully_qualified_name -> ?reason:string_ -> unit -> invalid_signal

val make_create_model_manifest_response :
  name:resource_name -> arn:arn -> unit -> create_model_manifest_response

val make_create_model_manifest_request :
  ?description:description ->
  ?tags:tag_list ->
  name:resource_name ->
  nodes:list_of_strings ->
  signal_catalog_arn:arn ->
  unit ->
  create_model_manifest_request

val make_custom_property :
  ?data_encoding:node_data_encoding ->
  ?description:description ->
  ?deprecation_message:message ->
  ?comment:message ->
  ?struct_fully_qualified_name:node_path ->
  fully_qualified_name:string_ ->
  data_type:node_data_type ->
  unit ->
  custom_property

val make_custom_struct :
  ?description:description ->
  ?deprecation_message:message ->
  ?comment:message ->
  fully_qualified_name:string_ ->
  unit ->
  custom_struct

val make_sensor :
  ?description:description ->
  ?unit_:string_ ->
  ?allowed_values:list_of_strings ->
  ?min:double ->
  ?max:double ->
  ?deprecation_message:message ->
  ?comment:message ->
  ?struct_fully_qualified_name:node_path ->
  fully_qualified_name:string_ ->
  data_type:node_data_type ->
  unit ->
  sensor

val make_create_signal_catalog_response :
  name:resource_name -> arn:arn -> unit -> create_signal_catalog_response

val make_create_signal_catalog_request :
  ?description:description ->
  ?nodes:nodes ->
  ?tags:tag_list ->
  name:resource_name ->
  unit ->
  create_signal_catalog_request

val make_create_state_template_response :
  ?name:resource_name ->
  ?arn:arn ->
  ?id:resource_unique_id ->
  unit ->
  create_state_template_response

val make_create_state_template_request :
  ?description:description ->
  ?data_extra_dimensions:state_template_data_extra_dimension_node_path_list ->
  ?metadata_extra_dimensions:state_template_metadata_extra_dimension_node_path_list ->
  ?tags:tag_list ->
  name:resource_name ->
  signal_catalog_arn:arn ->
  state_template_properties:state_template_properties ->
  unit ->
  create_state_template_request

val make_create_vehicle_response :
  ?vehicle_name:vehicle_name -> ?arn:arn -> ?thing_arn:arn -> unit -> create_vehicle_response

val make_create_vehicle_request :
  ?attributes:attributes_map ->
  ?association_behavior:vehicle_association_behavior ->
  ?tags:tag_list ->
  ?state_templates:state_template_associations ->
  vehicle_name:vehicle_name ->
  model_manifest_arn:arn ->
  decoder_manifest_arn:arn ->
  unit ->
  create_vehicle_request

val make_decoder_manifest_summary :
  ?name:string_ ->
  ?arn:arn ->
  ?model_manifest_arn:arn ->
  ?description:description ->
  ?status:manifest_status ->
  ?message:message ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  decoder_manifest_summary

val make_delete_campaign_response :
  ?name:campaign_name -> ?arn:campaign_arn -> unit -> delete_campaign_response

val make_delete_campaign_request : name:campaign_name -> unit -> delete_campaign_request

val make_delete_decoder_manifest_response :
  name:resource_name -> arn:arn -> unit -> delete_decoder_manifest_response

val make_delete_decoder_manifest_request :
  name:resource_name -> unit -> delete_decoder_manifest_request

val make_delete_fleet_response : ?id:fleet_id -> ?arn:arn -> unit -> delete_fleet_response
val make_delete_fleet_request : fleet_id:fleet_id -> unit -> delete_fleet_request

val make_delete_model_manifest_response :
  name:resource_name -> arn:arn -> unit -> delete_model_manifest_response

val make_delete_model_manifest_request : name:resource_name -> unit -> delete_model_manifest_request

val make_delete_signal_catalog_response :
  name:resource_name -> arn:arn -> unit -> delete_signal_catalog_response

val make_delete_signal_catalog_request : name:resource_name -> unit -> delete_signal_catalog_request

val make_delete_state_template_response :
  ?name:resource_name ->
  ?arn:arn ->
  ?id:resource_unique_id ->
  unit ->
  delete_state_template_response

val make_delete_state_template_request :
  identifier:resource_identifier -> unit -> delete_state_template_request

val make_delete_vehicle_response :
  vehicle_name:vehicle_name -> arn:arn -> unit -> delete_vehicle_response

val make_delete_vehicle_request : vehicle_name:vehicle_name -> unit -> delete_vehicle_request
val make_disassociate_vehicle_fleet_response : unit -> unit

val make_disassociate_vehicle_fleet_request :
  vehicle_name:vehicle_name -> fleet_id:fleet_id -> unit -> disassociate_vehicle_fleet_request

val make_fleet_summary :
  ?description:description ->
  ?last_modification_time:timestamp ->
  id:fleet_id ->
  arn:arn ->
  signal_catalog_arn:arn ->
  creation_time:timestamp ->
  unit ->
  fleet_summary

val make_get_campaign_response :
  ?name:campaign_name ->
  ?arn:campaign_arn ->
  ?description:description ->
  ?signal_catalog_arn:arn ->
  ?target_arn:arn ->
  ?status:campaign_status ->
  ?start_time:timestamp ->
  ?expiry_time:timestamp ->
  ?post_trigger_collection_duration:uint32 ->
  ?diagnostics_mode:diagnostics_mode ->
  ?spooling_mode:spooling_mode ->
  ?compression:compression ->
  ?priority:priority ->
  ?signals_to_collect:signal_information_list ->
  ?collection_scheme:collection_scheme ->
  ?data_extra_dimensions:data_extra_dimension_node_path_list ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?data_destination_configs:data_destination_configs ->
  ?data_partitions:data_partitions ->
  ?signals_to_fetch:signal_fetch_information_list ->
  unit ->
  get_campaign_response

val make_get_campaign_request : name:campaign_name -> unit -> get_campaign_request

val make_get_decoder_manifest_response :
  ?description:description ->
  ?model_manifest_arn:arn ->
  ?status:manifest_status ->
  ?message:message ->
  name:string_ ->
  arn:arn ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  get_decoder_manifest_response

val make_get_decoder_manifest_request : name:resource_name -> unit -> get_decoder_manifest_request

val make_get_encryption_configuration_response :
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  encryption_status:encryption_status ->
  encryption_type:encryption_type ->
  unit ->
  get_encryption_configuration_response

val make_get_encryption_configuration_request : unit -> unit

val make_get_fleet_response :
  ?description:description ->
  id:fleet_id ->
  arn:arn ->
  signal_catalog_arn:arn ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  get_fleet_response

val make_get_fleet_request : fleet_id:fleet_id -> unit -> get_fleet_request

val make_get_logging_options_response :
  cloud_watch_log_delivery:cloud_watch_log_delivery_options -> unit -> get_logging_options_response

val make_get_logging_options_request : unit -> unit

val make_get_model_manifest_response :
  ?description:description ->
  ?signal_catalog_arn:arn ->
  ?status:manifest_status ->
  name:resource_name ->
  arn:arn ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  get_model_manifest_response

val make_get_model_manifest_request : name:resource_name -> unit -> get_model_manifest_request

val make_iam_registration_response :
  ?error_message:error_message ->
  role_arn:arn ->
  registration_status:registration_status ->
  unit ->
  iam_registration_response

val make_timestream_registration_response :
  ?timestream_database_arn:arn ->
  ?timestream_table_arn:arn ->
  ?error_message:error_message ->
  timestream_database_name:timestream_database_name ->
  timestream_table_name:timestream_table_name ->
  registration_status:registration_status ->
  unit ->
  timestream_registration_response

val make_get_register_account_status_response :
  ?timestream_registration_response:timestream_registration_response ->
  customer_account_id:customer_account_id ->
  account_status:registration_status ->
  iam_registration_response:iam_registration_response ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  get_register_account_status_response

val make_get_register_account_status_request : unit -> unit

val make_node_counts :
  ?total_nodes:number ->
  ?total_branches:number ->
  ?total_sensors:number ->
  ?total_attributes:number ->
  ?total_actuators:number ->
  ?total_structs:number ->
  ?total_properties:number ->
  unit ->
  node_counts

val make_get_signal_catalog_response :
  ?description:description ->
  ?node_counts:node_counts ->
  name:resource_name ->
  arn:arn ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  get_signal_catalog_response

val make_get_signal_catalog_request : name:resource_name -> unit -> get_signal_catalog_request

val make_get_state_template_response :
  ?name:resource_name ->
  ?arn:arn ->
  ?description:description ->
  ?signal_catalog_arn:arn ->
  ?state_template_properties:state_template_properties ->
  ?data_extra_dimensions:state_template_data_extra_dimension_node_path_list ->
  ?metadata_extra_dimensions:state_template_metadata_extra_dimension_node_path_list ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?id:resource_unique_id ->
  unit ->
  get_state_template_response

val make_get_state_template_request :
  identifier:resource_identifier -> unit -> get_state_template_request

val make_get_vehicle_response :
  ?vehicle_name:vehicle_name ->
  ?arn:arn ->
  ?model_manifest_arn:arn ->
  ?decoder_manifest_arn:arn ->
  ?attributes:attributes_map ->
  ?state_templates:state_template_associations ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  get_vehicle_response

val make_get_vehicle_request : vehicle_name:vehicle_name -> unit -> get_vehicle_request

val make_vehicle_status :
  ?campaign_name:campaign_name ->
  ?vehicle_name:vehicle_name ->
  ?status:vehicle_state ->
  unit ->
  vehicle_status

val make_get_vehicle_status_response :
  ?campaigns:vehicle_status_list -> ?next_token:next_token -> unit -> get_vehicle_status_response

val make_get_vehicle_status_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  vehicle_name:vehicle_name ->
  unit ->
  get_vehicle_status_request

val make_iam_resources : role_arn:iam_role_arn -> unit -> iam_resources

val make_import_decoder_manifest_response :
  name:resource_name -> arn:arn -> unit -> import_decoder_manifest_response

val make_import_decoder_manifest_request :
  name:resource_name ->
  network_file_definitions:network_file_definitions ->
  unit ->
  import_decoder_manifest_request

val make_import_signal_catalog_response :
  name:resource_name -> arn:arn -> unit -> import_signal_catalog_response

val make_import_signal_catalog_request :
  ?description:description ->
  ?vss:formatted_vss ->
  ?tags:tag_list ->
  name:resource_name ->
  unit ->
  import_signal_catalog_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_timestream_resources :
  timestream_database_name:timestream_database_name ->
  timestream_table_name:timestream_table_name ->
  unit ->
  timestream_resources

val make_register_account_response :
  ?timestream_resources:timestream_resources ->
  register_account_status:registration_status ->
  iam_resources:iam_resources ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  register_account_response

val make_register_account_request :
  ?timestream_resources:timestream_resources ->
  ?iam_resources:iam_resources ->
  unit ->
  register_account_request

val make_put_logging_options_response : unit -> unit

val make_put_logging_options_request :
  cloud_watch_log_delivery:cloud_watch_log_delivery_options -> unit -> put_logging_options_request

val make_put_encryption_configuration_response :
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  encryption_status:encryption_status ->
  encryption_type:encryption_type ->
  unit ->
  put_encryption_configuration_response

val make_put_encryption_configuration_request :
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  encryption_type:encryption_type ->
  unit ->
  put_encryption_configuration_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_campaigns_response :
  ?campaign_summaries:campaign_summaries ->
  ?next_token:next_token ->
  unit ->
  list_campaigns_response

val make_list_campaigns_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?status:status_str ->
  ?list_response_scope:list_response_scope ->
  unit ->
  list_campaigns_request

val make_list_decoder_manifest_network_interfaces_response :
  ?network_interfaces:network_interfaces ->
  ?next_token:next_token ->
  unit ->
  list_decoder_manifest_network_interfaces_response

val make_list_decoder_manifest_network_interfaces_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  name:resource_name ->
  unit ->
  list_decoder_manifest_network_interfaces_request

val make_list_decoder_manifest_signals_response :
  ?signal_decoders:signal_decoders ->
  ?next_token:next_token ->
  unit ->
  list_decoder_manifest_signals_response

val make_list_decoder_manifest_signals_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  name:resource_name ->
  unit ->
  list_decoder_manifest_signals_request

val make_list_decoder_manifests_response :
  ?summaries:decoder_manifest_summaries ->
  ?next_token:next_token ->
  unit ->
  list_decoder_manifests_response

val make_list_decoder_manifests_request :
  ?model_manifest_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?list_response_scope:list_response_scope ->
  unit ->
  list_decoder_manifests_request

val make_list_fleets_response :
  ?fleet_summaries:fleet_summaries -> ?next_token:next_token -> unit -> list_fleets_response

val make_list_fleets_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?list_response_scope:list_response_scope ->
  unit ->
  list_fleets_request

val make_list_fleets_for_vehicle_response :
  ?fleets:fleets -> ?next_token:next_token -> unit -> list_fleets_for_vehicle_response

val make_list_fleets_for_vehicle_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  vehicle_name:vehicle_name ->
  unit ->
  list_fleets_for_vehicle_request

val make_list_model_manifest_nodes_response :
  ?nodes:nodes -> ?next_token:next_token -> unit -> list_model_manifest_nodes_response

val make_list_model_manifest_nodes_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  name:resource_name ->
  unit ->
  list_model_manifest_nodes_request

val make_model_manifest_summary :
  ?name:string_ ->
  ?arn:arn ->
  ?signal_catalog_arn:arn ->
  ?description:description ->
  ?status:manifest_status ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  model_manifest_summary

val make_list_model_manifests_response :
  ?summaries:model_manifest_summaries ->
  ?next_token:next_token ->
  unit ->
  list_model_manifests_response

val make_list_model_manifests_request :
  ?signal_catalog_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?list_response_scope:list_response_scope ->
  unit ->
  list_model_manifests_request

val make_list_signal_catalog_nodes_response :
  ?nodes:nodes -> ?next_token:next_token -> unit -> list_signal_catalog_nodes_response

val make_list_signal_catalog_nodes_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?signal_node_type:signal_node_type ->
  name:resource_name ->
  unit ->
  list_signal_catalog_nodes_request

val make_signal_catalog_summary :
  ?name:string_ ->
  ?arn:arn ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  signal_catalog_summary

val make_list_signal_catalogs_response :
  ?summaries:signal_catalog_summaries ->
  ?next_token:next_token ->
  unit ->
  list_signal_catalogs_response

val make_list_signal_catalogs_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_signal_catalogs_request

val make_state_template_summary :
  ?name:resource_name ->
  ?arn:arn ->
  ?signal_catalog_arn:arn ->
  ?description:description ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?id:resource_unique_id ->
  unit ->
  state_template_summary

val make_list_state_templates_response :
  ?summaries:state_template_summaries ->
  ?next_token:next_token ->
  unit ->
  list_state_templates_response

val make_list_state_templates_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?list_response_scope:list_response_scope ->
  unit ->
  list_state_templates_request

val make_vehicle_summary :
  ?attributes:attributes_map ->
  vehicle_name:vehicle_name ->
  arn:arn ->
  model_manifest_arn:arn ->
  decoder_manifest_arn:arn ->
  creation_time:timestamp ->
  last_modification_time:timestamp ->
  unit ->
  vehicle_summary

val make_list_vehicles_response :
  ?vehicle_summaries:vehicle_summaries -> ?next_token:next_token -> unit -> list_vehicles_response

val make_list_vehicles_request :
  ?model_manifest_arn:arn ->
  ?attribute_names:attribute_names_list ->
  ?attribute_values:attribute_values_list ->
  ?next_token:next_token ->
  ?max_results:list_vehicles_max_results ->
  ?list_response_scope:list_response_scope ->
  unit ->
  list_vehicles_request

val make_list_vehicles_in_fleet_response :
  ?vehicles:vehicles -> ?next_token:next_token -> unit -> list_vehicles_in_fleet_response

val make_list_vehicles_in_fleet_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  fleet_id:fleet_id ->
  unit ->
  list_vehicles_in_fleet_request

val make_update_campaign_response :
  ?arn:campaign_arn ->
  ?name:campaign_name ->
  ?status:campaign_status ->
  unit ->
  update_campaign_response

val make_update_campaign_request :
  ?description:description ->
  ?data_extra_dimensions:data_extra_dimension_node_path_list ->
  name:campaign_name ->
  action:update_campaign_action ->
  unit ->
  update_campaign_request

val make_update_decoder_manifest_response :
  name:resource_name -> arn:arn -> unit -> update_decoder_manifest_response

val make_update_decoder_manifest_request :
  ?description:description ->
  ?signal_decoders_to_add:signal_decoders ->
  ?signal_decoders_to_update:signal_decoders ->
  ?signal_decoders_to_remove:fqns ->
  ?network_interfaces_to_add:network_interfaces ->
  ?network_interfaces_to_update:network_interfaces ->
  ?network_interfaces_to_remove:interface_ids ->
  ?status:manifest_status ->
  ?default_for_unmapped_signals:default_for_unmapped_signals_type ->
  name:resource_name ->
  unit ->
  update_decoder_manifest_request

val make_update_fleet_response : ?id:fleet_id -> ?arn:arn -> unit -> update_fleet_response

val make_update_fleet_request :
  ?description:description -> fleet_id:fleet_id -> unit -> update_fleet_request

val make_update_model_manifest_response :
  name:resource_name -> arn:arn -> unit -> update_model_manifest_response

val make_update_model_manifest_request :
  ?description:description ->
  ?nodes_to_add:node_paths ->
  ?nodes_to_remove:node_paths ->
  ?status:manifest_status ->
  name:resource_name ->
  unit ->
  update_model_manifest_request

val make_update_signal_catalog_response :
  name:resource_name -> arn:arn -> unit -> update_signal_catalog_response

val make_update_signal_catalog_request :
  ?description:description ->
  ?nodes_to_add:nodes ->
  ?nodes_to_update:nodes ->
  ?nodes_to_remove:node_paths ->
  name:resource_name ->
  unit ->
  update_signal_catalog_request

val make_update_state_template_response :
  ?name:resource_name ->
  ?arn:arn ->
  ?id:resource_unique_id ->
  unit ->
  update_state_template_response

val make_update_state_template_request :
  ?description:description ->
  ?state_template_properties_to_add:state_template_properties ->
  ?state_template_properties_to_remove:state_template_properties ->
  ?data_extra_dimensions:state_template_data_extra_dimension_node_path_list ->
  ?metadata_extra_dimensions:state_template_metadata_extra_dimension_node_path_list ->
  identifier:resource_identifier ->
  unit ->
  update_state_template_request

val make_update_vehicle_response :
  ?vehicle_name:vehicle_name -> ?arn:arn -> unit -> update_vehicle_response

val make_update_vehicle_request :
  ?model_manifest_arn:arn ->
  ?decoder_manifest_arn:arn ->
  ?attributes:attributes_map ->
  ?attribute_update_mode:update_mode ->
  ?state_templates_to_add:state_template_associations ->
  ?state_templates_to_remove:state_template_association_identifiers ->
  ?state_templates_to_update:state_template_associations ->
  vehicle_name:vehicle_name ->
  unit ->
  update_vehicle_request
