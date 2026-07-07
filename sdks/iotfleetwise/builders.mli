open Types

val make_vehicle_summary :
  ?attributes:attributes_map ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  decoder_manifest_arn:arn ->
  model_manifest_arn:arn ->
  arn:arn ->
  vehicle_name:vehicle_name ->
  unit ->
  vehicle_summary

val make_update_vehicle_response_item :
  ?arn:arn -> ?vehicle_name:vehicle_name -> unit -> update_vehicle_response_item

val make_time_period : value:positive_integer -> unit_:time_unit -> unit -> time_period

val make_periodic_state_template_update_strategy :
  state_template_update_rate:time_period -> unit -> periodic_state_template_update_strategy

val make_on_change_state_template_update_strategy : unit -> unit

val make_state_template_association :
  state_template_update_strategy:state_template_update_strategy ->
  identifier:resource_identifier ->
  unit ->
  state_template_association

val make_update_vehicle_request_item :
  ?state_templates_to_update:state_template_associations ->
  ?state_templates_to_remove:state_template_association_identifiers ->
  ?state_templates_to_add:state_template_associations ->
  ?attribute_update_mode:update_mode ->
  ?attributes:attributes_map ->
  ?decoder_manifest_arn:arn ->
  ?model_manifest_arn:arn ->
  vehicle_name:vehicle_name ->
  unit ->
  update_vehicle_request_item

val make_update_vehicle_error :
  ?message:string_ -> ?code:number -> ?vehicle_name:vehicle_name -> unit -> update_vehicle_error

val make_signal_catalog_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?arn:arn ->
  ?name:string_ ->
  unit ->
  signal_catalog_summary

val make_model_manifest_summary :
  ?status:manifest_status ->
  ?description:description ->
  ?signal_catalog_arn:arn ->
  ?arn:arn ->
  ?name:string_ ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  unit ->
  model_manifest_summary

val make_fleet_summary :
  ?last_modification_time:timestamp ->
  ?description:description ->
  creation_time:timestamp ->
  signal_catalog_arn:arn ->
  arn:arn ->
  id:fleet_id ->
  unit ->
  fleet_summary

val make_decoder_manifest_summary :
  ?message:message ->
  ?status:manifest_status ->
  ?description:description ->
  ?model_manifest_arn:arn ->
  ?arn:arn ->
  ?name:string_ ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  unit ->
  decoder_manifest_summary

val make_create_vehicle_response_item :
  ?thing_arn:arn -> ?arn:arn -> ?vehicle_name:vehicle_name -> unit -> create_vehicle_response_item

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_create_vehicle_request_item :
  ?state_templates:state_template_associations ->
  ?tags:tag_list ->
  ?association_behavior:vehicle_association_behavior ->
  ?attributes:attributes_map ->
  decoder_manifest_arn:arn ->
  model_manifest_arn:arn ->
  vehicle_name:vehicle_name ->
  unit ->
  create_vehicle_request_item

val make_create_vehicle_error :
  ?message:string_ -> ?code:string_ -> ?vehicle_name:vehicle_name -> unit -> create_vehicle_error

val make_campaign_summary :
  ?status:campaign_status ->
  ?target_arn:arn ->
  ?signal_catalog_arn:arn ->
  ?description:description ->
  ?name:campaign_name ->
  ?arn:campaign_arn ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  unit ->
  campaign_summary

val make_vehicle_status :
  ?status:vehicle_state ->
  ?vehicle_name:vehicle_name ->
  ?campaign_name:campaign_name ->
  unit ->
  vehicle_status

val make_vehicle_middleware :
  protocol_name:vehicle_middleware_protocol ->
  name:vehicle_middleware_name ->
  unit ->
  vehicle_middleware

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_update_vehicle_response :
  ?arn:arn -> ?vehicle_name:vehicle_name -> unit -> update_vehicle_response

val make_update_vehicle_request :
  ?state_templates_to_update:state_template_associations ->
  ?state_templates_to_remove:state_template_association_identifiers ->
  ?state_templates_to_add:state_template_associations ->
  ?attribute_update_mode:update_mode ->
  ?attributes:attributes_map ->
  ?decoder_manifest_arn:arn ->
  ?model_manifest_arn:arn ->
  vehicle_name:vehicle_name ->
  unit ->
  update_vehicle_request

val make_update_state_template_response :
  ?id:resource_unique_id ->
  ?arn:arn ->
  ?name:resource_name ->
  unit ->
  update_state_template_response

val make_update_state_template_request :
  ?metadata_extra_dimensions:state_template_metadata_extra_dimension_node_path_list ->
  ?data_extra_dimensions:state_template_data_extra_dimension_node_path_list ->
  ?state_template_properties_to_remove:state_template_properties ->
  ?state_template_properties_to_add:state_template_properties ->
  ?description:description ->
  identifier:resource_identifier ->
  unit ->
  update_state_template_request

val make_invalid_signal : ?reason:string_ -> ?name:fully_qualified_name -> unit -> invalid_signal

val make_update_signal_catalog_response :
  arn:arn -> name:resource_name -> unit -> update_signal_catalog_response

val make_branch :
  ?comment:message ->
  ?deprecation_message:message ->
  ?description:description ->
  fully_qualified_name:string_ ->
  unit ->
  branch

val make_sensor :
  ?struct_fully_qualified_name:node_path ->
  ?comment:message ->
  ?deprecation_message:message ->
  ?max:double ->
  ?min:double ->
  ?allowed_values:list_of_strings ->
  ?unit_:string_ ->
  ?description:description ->
  data_type:node_data_type ->
  fully_qualified_name:string_ ->
  unit ->
  sensor

val make_actuator :
  ?struct_fully_qualified_name:node_path ->
  ?comment:message ->
  ?deprecation_message:message ->
  ?assigned_value:string_ ->
  ?max:double ->
  ?min:double ->
  ?allowed_values:list_of_strings ->
  ?unit_:string_ ->
  ?description:description ->
  data_type:node_data_type ->
  fully_qualified_name:string_ ->
  unit ->
  actuator

val make_attribute :
  ?comment:message ->
  ?deprecation_message:message ->
  ?default_value:string_ ->
  ?assigned_value:string_ ->
  ?max:double ->
  ?min:double ->
  ?allowed_values:list_of_strings ->
  ?unit_:string_ ->
  ?description:description ->
  data_type:node_data_type ->
  fully_qualified_name:string_ ->
  unit ->
  attribute

val make_custom_struct :
  ?comment:message ->
  ?deprecation_message:message ->
  ?description:description ->
  fully_qualified_name:string_ ->
  unit ->
  custom_struct

val make_custom_property :
  ?struct_fully_qualified_name:node_path ->
  ?comment:message ->
  ?deprecation_message:message ->
  ?description:description ->
  ?data_encoding:node_data_encoding ->
  data_type:node_data_type ->
  fully_qualified_name:string_ ->
  unit ->
  custom_property

val make_update_signal_catalog_request :
  ?nodes_to_remove:node_paths ->
  ?nodes_to_update:nodes ->
  ?nodes_to_add:nodes ->
  ?description:description ->
  name:resource_name ->
  unit ->
  update_signal_catalog_request

val make_update_model_manifest_response :
  arn:arn -> name:resource_name -> unit -> update_model_manifest_response

val make_update_model_manifest_request :
  ?status:manifest_status ->
  ?nodes_to_remove:node_paths ->
  ?nodes_to_add:node_paths ->
  ?description:description ->
  name:resource_name ->
  unit ->
  update_model_manifest_request

val make_update_fleet_response : ?arn:arn -> ?id:fleet_id -> unit -> update_fleet_response

val make_update_fleet_request :
  ?description:description -> fleet_id:fleet_id -> unit -> update_fleet_request

val make_update_decoder_manifest_response :
  arn:arn -> name:resource_name -> unit -> update_decoder_manifest_response

val make_can_signal :
  ?signal_value_type:signal_value_type ->
  ?name:can_signal_name ->
  length:non_negative_integer ->
  factor:double ->
  offset:double ->
  start_bit:non_negative_integer ->
  is_signed:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  is_big_endian:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  message_id:non_negative_integer ->
  unit ->
  can_signal

val make_obd_signal :
  ?signal_value_type:signal_value_type ->
  ?is_signed:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?bit_mask_length:obd_bitmask_length ->
  ?bit_right_shift:non_negative_integer ->
  byte_length:obd_byte_length ->
  start_byte:non_negative_integer ->
  offset:double ->
  scaling:double ->
  pid:non_negative_integer ->
  service_mode:non_negative_integer ->
  pid_response_length:positive_integer ->
  unit ->
  obd_signal

val make_ros2_primitive_message_definition :
  ?upper_bound:max_string_size ->
  ?scaling:double ->
  ?offset:double ->
  primitive_type:ros2_primitive_type ->
  unit ->
  ros2_primitive_message_definition

val make_structured_message_field_name_and_data_type_pair :
  data_type:structured_message ->
  field_name:structure_message_name ->
  unit ->
  structured_message_field_name_and_data_type_pair

val make_structured_message_list_definition :
  ?capacity:non_negative_integer ->
  list_type:structured_message_list_type ->
  member_type:structured_message ->
  name:structure_message_name ->
  unit ->
  structured_message_list_definition

val make_message_signal :
  structured_message:structured_message -> topic_name:topic_name -> unit -> message_signal

val make_custom_decoding_signal : id:custom_decoding_id -> unit -> custom_decoding_signal

val make_signal_decoder :
  ?custom_decoding_signal:custom_decoding_signal ->
  ?message_signal:message_signal ->
  ?obd_signal:obd_signal ->
  ?can_signal:can_signal ->
  interface_id:interface_id ->
  type_:signal_decoder_type ->
  fully_qualified_name:fully_qualified_name ->
  unit ->
  signal_decoder

val make_can_interface :
  ?protocol_version:protocol_version ->
  ?protocol_name:protocol_name ->
  name:can_interface_name ->
  unit ->
  can_interface

val make_obd_interface :
  ?has_transmission_ecu:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?use_extended_ids:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?dtc_request_interval_seconds:non_negative_integer ->
  ?pid_request_interval_seconds:non_negative_integer ->
  ?obd_standard:obd_standard ->
  request_message_id:non_negative_integer ->
  name:obd_interface_name ->
  unit ->
  obd_interface

val make_custom_decoding_interface :
  name:custom_decoding_signal_interface_name -> unit -> custom_decoding_interface

val make_network_interface :
  ?custom_decoding_interface:custom_decoding_interface ->
  ?vehicle_middleware:vehicle_middleware ->
  ?obd_interface:obd_interface ->
  ?can_interface:can_interface ->
  type_:network_interface_type ->
  interface_id:interface_id ->
  unit ->
  network_interface

val make_update_decoder_manifest_request :
  ?default_for_unmapped_signals:default_for_unmapped_signals_type ->
  ?status:manifest_status ->
  ?network_interfaces_to_remove:interface_ids ->
  ?network_interfaces_to_update:network_interfaces ->
  ?network_interfaces_to_add:network_interfaces ->
  ?signal_decoders_to_remove:fqns ->
  ?signal_decoders_to_update:signal_decoders ->
  ?signal_decoders_to_add:signal_decoders ->
  ?description:description ->
  name:resource_name ->
  unit ->
  update_decoder_manifest_request

val make_invalid_signal_decoder :
  ?hint:message ->
  ?reason:signal_decoder_failure_reason ->
  ?name:fully_qualified_name ->
  unit ->
  invalid_signal_decoder

val make_invalid_network_interface :
  ?reason:network_interface_failure_reason ->
  ?interface_id:interface_id ->
  unit ->
  invalid_network_interface

val make_update_campaign_response :
  ?status:campaign_status ->
  ?name:campaign_name ->
  ?arn:campaign_arn ->
  unit ->
  update_campaign_response

val make_update_campaign_request :
  ?data_extra_dimensions:data_extra_dimension_node_path_list ->
  ?description:description ->
  action:update_campaign_action ->
  name:campaign_name ->
  unit ->
  update_campaign_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_timestream_resources :
  timestream_table_name:timestream_table_name ->
  timestream_database_name:timestream_database_name ->
  unit ->
  timestream_resources

val make_timestream_registration_response :
  ?error_message:error_message ->
  ?timestream_table_arn:arn ->
  ?timestream_database_arn:arn ->
  registration_status:registration_status ->
  timestream_table_name:timestream_table_name ->
  timestream_database_name:timestream_database_name ->
  unit ->
  timestream_registration_response

val make_timestream_config :
  execution_role_arn:iam_role_arn ->
  timestream_table_arn:timestream_table_arn ->
  unit ->
  timestream_config

val make_time_based_signal_fetch_config :
  execution_frequency_ms:positive_long -> unit -> time_based_signal_fetch_config

val make_time_based_collection_scheme :
  period_ms:collection_period_ms -> unit -> time_based_collection_scheme

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_storage_minimum_time_to_live :
  value:storage_minimum_time_to_live_value ->
  unit_:storage_minimum_time_to_live_unit ->
  unit ->
  storage_minimum_time_to_live

val make_storage_maximum_size :
  value:storage_maximum_size_value ->
  unit_:storage_maximum_size_unit ->
  unit ->
  storage_maximum_size

val make_state_template_summary :
  ?id:resource_unique_id ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?description:description ->
  ?signal_catalog_arn:arn ->
  ?arn:arn ->
  ?name:resource_name ->
  unit ->
  state_template_summary

val make_signal_information :
  ?data_partition_id:data_partition_id ->
  ?minimum_sampling_interval_ms:uint32 ->
  ?max_sample_count:max_sample_count ->
  name:wildcard_signal_name ->
  unit ->
  signal_information

val make_condition_based_signal_fetch_config :
  trigger_mode:trigger_mode ->
  condition_expression:fetch_config_event_expression ->
  unit ->
  condition_based_signal_fetch_config

val make_signal_fetch_information :
  ?condition_language_version:language_version ->
  actions:event_expression_list ->
  signal_fetch_config:signal_fetch_config ->
  fully_qualified_name:node_path ->
  unit ->
  signal_fetch_information

val make_s3_config :
  ?prefix:prefix ->
  ?storage_compression_format:storage_compression_format ->
  ?data_format:data_format ->
  bucket_arn:s3_bucket_arn ->
  unit ->
  s3_config

val make_iam_resources : role_arn:iam_role_arn -> unit -> iam_resources

val make_register_account_response :
  ?timestream_resources:timestream_resources ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  iam_resources:iam_resources ->
  register_account_status:registration_status ->
  unit ->
  register_account_response

val make_register_account_request :
  ?iam_resources:iam_resources ->
  ?timestream_resources:timestream_resources ->
  unit ->
  register_account_request

val make_put_logging_options_response : unit -> unit

val make_cloud_watch_log_delivery_options :
  ?log_group_name:cloud_watch_log_group_name ->
  log_type:log_type ->
  unit ->
  cloud_watch_log_delivery_options

val make_put_logging_options_request :
  cloud_watch_log_delivery:cloud_watch_log_delivery_options -> unit -> put_logging_options_request

val make_put_encryption_configuration_response :
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  encryption_type:encryption_type ->
  encryption_status:encryption_status ->
  unit ->
  put_encryption_configuration_response

val make_put_encryption_configuration_request :
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  encryption_type:encryption_type ->
  unit ->
  put_encryption_configuration_request

val make_node_counts :
  ?total_properties:number ->
  ?total_structs:number ->
  ?total_actuators:number ->
  ?total_attributes:number ->
  ?total_sensors:number ->
  ?total_branches:number ->
  ?total_nodes:number ->
  unit ->
  node_counts

val make_can_dbc_definition :
  ?signals_map:model_signals_map ->
  can_dbc_files:network_files_list ->
  network_interface:interface_id ->
  unit ->
  can_dbc_definition

val make_mqtt_topic_config :
  execution_role_arn:iam_role_arn -> mqtt_topic_arn:mqtt_topic_arn -> unit -> mqtt_topic_config

val make_list_vehicles_response :
  ?next_token:next_token -> ?vehicle_summaries:vehicle_summaries -> unit -> list_vehicles_response

val make_list_vehicles_request :
  ?list_response_scope:list_response_scope ->
  ?max_results:list_vehicles_max_results ->
  ?next_token:next_token ->
  ?attribute_values:attribute_values_list ->
  ?attribute_names:attribute_names_list ->
  ?model_manifest_arn:arn ->
  unit ->
  list_vehicles_request

val make_list_vehicles_in_fleet_response :
  ?next_token:next_token -> ?vehicles:vehicles -> unit -> list_vehicles_in_fleet_response

val make_list_vehicles_in_fleet_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  fleet_id:fleet_id ->
  unit ->
  list_vehicles_in_fleet_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_state_templates_response :
  ?next_token:next_token ->
  ?summaries:state_template_summaries ->
  unit ->
  list_state_templates_response

val make_list_state_templates_request :
  ?list_response_scope:list_response_scope ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_state_templates_request

val make_list_signal_catalogs_response :
  ?next_token:next_token ->
  ?summaries:signal_catalog_summaries ->
  unit ->
  list_signal_catalogs_response

val make_list_signal_catalogs_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_signal_catalogs_request

val make_list_signal_catalog_nodes_response :
  ?next_token:next_token -> ?nodes:nodes -> unit -> list_signal_catalog_nodes_response

val make_list_signal_catalog_nodes_request :
  ?signal_node_type:signal_node_type ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  name:resource_name ->
  unit ->
  list_signal_catalog_nodes_request

val make_list_model_manifests_response :
  ?next_token:next_token ->
  ?summaries:model_manifest_summaries ->
  unit ->
  list_model_manifests_response

val make_list_model_manifests_request :
  ?list_response_scope:list_response_scope ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?signal_catalog_arn:arn ->
  unit ->
  list_model_manifests_request

val make_list_model_manifest_nodes_response :
  ?next_token:next_token -> ?nodes:nodes -> unit -> list_model_manifest_nodes_response

val make_list_model_manifest_nodes_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  name:resource_name ->
  unit ->
  list_model_manifest_nodes_request

val make_list_fleets_response :
  ?next_token:next_token -> ?fleet_summaries:fleet_summaries -> unit -> list_fleets_response

val make_list_fleets_request :
  ?list_response_scope:list_response_scope ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_fleets_request

val make_list_fleets_for_vehicle_response :
  ?next_token:next_token -> ?fleets:fleets -> unit -> list_fleets_for_vehicle_response

val make_list_fleets_for_vehicle_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  vehicle_name:vehicle_name ->
  unit ->
  list_fleets_for_vehicle_request

val make_list_decoder_manifests_response :
  ?next_token:next_token ->
  ?summaries:decoder_manifest_summaries ->
  unit ->
  list_decoder_manifests_response

val make_list_decoder_manifests_request :
  ?list_response_scope:list_response_scope ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?model_manifest_arn:arn ->
  unit ->
  list_decoder_manifests_request

val make_list_decoder_manifest_signals_response :
  ?next_token:next_token ->
  ?signal_decoders:signal_decoders ->
  unit ->
  list_decoder_manifest_signals_response

val make_list_decoder_manifest_signals_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  name:resource_name ->
  unit ->
  list_decoder_manifest_signals_request

val make_list_decoder_manifest_network_interfaces_response :
  ?next_token:next_token ->
  ?network_interfaces:network_interfaces ->
  unit ->
  list_decoder_manifest_network_interfaces_response

val make_list_decoder_manifest_network_interfaces_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  name:resource_name ->
  unit ->
  list_decoder_manifest_network_interfaces_request

val make_list_campaigns_response :
  ?next_token:next_token ->
  ?campaign_summaries:campaign_summaries ->
  unit ->
  list_campaigns_response

val make_list_campaigns_request :
  ?list_response_scope:list_response_scope ->
  ?status:status_str ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_campaigns_request

val make_get_vehicle_status_response :
  ?next_token:next_token -> ?campaigns:vehicle_status_list -> unit -> get_vehicle_status_response

val make_get_vehicle_status_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  vehicle_name:vehicle_name ->
  unit ->
  get_vehicle_status_request

val make_iam_registration_response :
  ?error_message:error_message ->
  registration_status:registration_status ->
  role_arn:arn ->
  unit ->
  iam_registration_response

val make_get_register_account_status_response :
  ?timestream_registration_response:timestream_registration_response ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  iam_registration_response:iam_registration_response ->
  account_status:registration_status ->
  customer_account_id:customer_account_id ->
  unit ->
  get_register_account_status_response

val make_get_register_account_status_request : unit -> unit

val make_get_logging_options_response :
  cloud_watch_log_delivery:cloud_watch_log_delivery_options -> unit -> get_logging_options_response

val make_get_logging_options_request : unit -> unit

val make_get_encryption_configuration_response :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?error_message:error_message ->
  ?kms_key_id:Smaws_Lib.Smithy_api.Types.string_ ->
  encryption_type:encryption_type ->
  encryption_status:encryption_status ->
  unit ->
  get_encryption_configuration_response

val make_get_encryption_configuration_request : unit -> unit

val make_batch_update_vehicle_response :
  ?errors:update_vehicle_errors ->
  ?vehicles:update_vehicle_response_items ->
  unit ->
  batch_update_vehicle_response

val make_batch_update_vehicle_request :
  vehicles:update_vehicle_request_items -> unit -> batch_update_vehicle_request

val make_batch_create_vehicle_response :
  ?errors:create_vehicle_errors ->
  ?vehicles:create_vehicle_responses ->
  unit ->
  batch_create_vehicle_response

val make_batch_create_vehicle_request :
  vehicles:create_vehicle_request_items -> unit -> batch_create_vehicle_request

val make_import_signal_catalog_response :
  arn:arn -> name:resource_name -> unit -> import_signal_catalog_response

val make_import_signal_catalog_request :
  ?tags:tag_list ->
  ?vss:formatted_vss ->
  ?description:description ->
  name:resource_name ->
  unit ->
  import_signal_catalog_request

val make_import_decoder_manifest_response :
  arn:arn -> name:resource_name -> unit -> import_decoder_manifest_response

val make_import_decoder_manifest_request :
  network_file_definitions:network_file_definitions ->
  name:resource_name ->
  unit ->
  import_decoder_manifest_request

val make_get_vehicle_response :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?state_templates:state_template_associations ->
  ?attributes:attributes_map ->
  ?decoder_manifest_arn:arn ->
  ?model_manifest_arn:arn ->
  ?arn:arn ->
  ?vehicle_name:vehicle_name ->
  unit ->
  get_vehicle_response

val make_get_vehicle_request : vehicle_name:vehicle_name -> unit -> get_vehicle_request

val make_get_state_template_response :
  ?id:resource_unique_id ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?metadata_extra_dimensions:state_template_metadata_extra_dimension_node_path_list ->
  ?data_extra_dimensions:state_template_data_extra_dimension_node_path_list ->
  ?state_template_properties:state_template_properties ->
  ?signal_catalog_arn:arn ->
  ?description:description ->
  ?arn:arn ->
  ?name:resource_name ->
  unit ->
  get_state_template_response

val make_get_state_template_request :
  identifier:resource_identifier -> unit -> get_state_template_request

val make_get_signal_catalog_response :
  ?node_counts:node_counts ->
  ?description:description ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  arn:arn ->
  name:resource_name ->
  unit ->
  get_signal_catalog_response

val make_get_signal_catalog_request : name:resource_name -> unit -> get_signal_catalog_request

val make_get_model_manifest_response :
  ?status:manifest_status ->
  ?signal_catalog_arn:arn ->
  ?description:description ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  arn:arn ->
  name:resource_name ->
  unit ->
  get_model_manifest_response

val make_get_model_manifest_request : name:resource_name -> unit -> get_model_manifest_request

val make_get_fleet_response :
  ?description:description ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  signal_catalog_arn:arn ->
  arn:arn ->
  id:fleet_id ->
  unit ->
  get_fleet_response

val make_get_fleet_request : fleet_id:fleet_id -> unit -> get_fleet_request

val make_get_decoder_manifest_response :
  ?message:message ->
  ?status:manifest_status ->
  ?model_manifest_arn:arn ->
  ?description:description ->
  last_modification_time:timestamp ->
  creation_time:timestamp ->
  arn:arn ->
  name:string_ ->
  unit ->
  get_decoder_manifest_response

val make_get_decoder_manifest_request : name:resource_name -> unit -> get_decoder_manifest_request

val make_condition_based_collection_scheme :
  ?condition_language_version:language_version ->
  ?trigger_mode:trigger_mode ->
  ?minimum_trigger_interval_ms:uint32 ->
  expression:event_expression ->
  unit ->
  condition_based_collection_scheme

val make_data_partition_storage_options :
  minimum_time_to_live:storage_minimum_time_to_live ->
  storage_location:storage_location ->
  maximum_size:storage_maximum_size ->
  unit ->
  data_partition_storage_options

val make_data_partition_upload_options :
  ?condition_language_version:language_version ->
  expression:event_expression ->
  unit ->
  data_partition_upload_options

val make_data_partition :
  ?upload_options:data_partition_upload_options ->
  storage_options:data_partition_storage_options ->
  id:data_partition_id ->
  unit ->
  data_partition

val make_get_campaign_response :
  ?signals_to_fetch:signal_fetch_information_list ->
  ?data_partitions:data_partitions ->
  ?data_destination_configs:data_destination_configs ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?data_extra_dimensions:data_extra_dimension_node_path_list ->
  ?collection_scheme:collection_scheme ->
  ?signals_to_collect:signal_information_list ->
  ?priority:priority ->
  ?compression:compression ->
  ?spooling_mode:spooling_mode ->
  ?diagnostics_mode:diagnostics_mode ->
  ?post_trigger_collection_duration:uint32 ->
  ?expiry_time:timestamp ->
  ?start_time:timestamp ->
  ?status:campaign_status ->
  ?target_arn:arn ->
  ?signal_catalog_arn:arn ->
  ?description:description ->
  ?arn:campaign_arn ->
  ?name:campaign_name ->
  unit ->
  get_campaign_response

val make_get_campaign_request : name:campaign_name -> unit -> get_campaign_request
val make_disassociate_vehicle_fleet_response : unit -> unit

val make_disassociate_vehicle_fleet_request :
  fleet_id:fleet_id -> vehicle_name:vehicle_name -> unit -> disassociate_vehicle_fleet_request

val make_delete_vehicle_response :
  arn:arn -> vehicle_name:vehicle_name -> unit -> delete_vehicle_response

val make_delete_vehicle_request : vehicle_name:vehicle_name -> unit -> delete_vehicle_request

val make_delete_state_template_response :
  ?id:resource_unique_id ->
  ?arn:arn ->
  ?name:resource_name ->
  unit ->
  delete_state_template_response

val make_delete_state_template_request :
  identifier:resource_identifier -> unit -> delete_state_template_request

val make_delete_signal_catalog_response :
  arn:arn -> name:resource_name -> unit -> delete_signal_catalog_response

val make_delete_signal_catalog_request : name:resource_name -> unit -> delete_signal_catalog_request

val make_delete_model_manifest_response :
  arn:arn -> name:resource_name -> unit -> delete_model_manifest_response

val make_delete_model_manifest_request : name:resource_name -> unit -> delete_model_manifest_request
val make_delete_fleet_response : ?arn:arn -> ?id:fleet_id -> unit -> delete_fleet_response
val make_delete_fleet_request : fleet_id:fleet_id -> unit -> delete_fleet_request

val make_delete_decoder_manifest_response :
  arn:arn -> name:resource_name -> unit -> delete_decoder_manifest_response

val make_delete_decoder_manifest_request :
  name:resource_name -> unit -> delete_decoder_manifest_request

val make_delete_campaign_response :
  ?arn:campaign_arn -> ?name:campaign_name -> unit -> delete_campaign_response

val make_delete_campaign_request : name:campaign_name -> unit -> delete_campaign_request

val make_create_vehicle_response :
  ?thing_arn:arn -> ?arn:arn -> ?vehicle_name:vehicle_name -> unit -> create_vehicle_response

val make_create_vehicle_request :
  ?state_templates:state_template_associations ->
  ?tags:tag_list ->
  ?association_behavior:vehicle_association_behavior ->
  ?attributes:attributes_map ->
  decoder_manifest_arn:arn ->
  model_manifest_arn:arn ->
  vehicle_name:vehicle_name ->
  unit ->
  create_vehicle_request

val make_create_state_template_response :
  ?id:resource_unique_id ->
  ?arn:arn ->
  ?name:resource_name ->
  unit ->
  create_state_template_response

val make_create_state_template_request :
  ?tags:tag_list ->
  ?metadata_extra_dimensions:state_template_metadata_extra_dimension_node_path_list ->
  ?data_extra_dimensions:state_template_data_extra_dimension_node_path_list ->
  ?description:description ->
  state_template_properties:state_template_properties ->
  signal_catalog_arn:arn ->
  name:resource_name ->
  unit ->
  create_state_template_request

val make_create_signal_catalog_response :
  arn:arn -> name:resource_name -> unit -> create_signal_catalog_response

val make_create_signal_catalog_request :
  ?tags:tag_list ->
  ?nodes:nodes ->
  ?description:description ->
  name:resource_name ->
  unit ->
  create_signal_catalog_request

val make_create_model_manifest_response :
  arn:arn -> name:resource_name -> unit -> create_model_manifest_response

val make_create_model_manifest_request :
  ?tags:tag_list ->
  ?description:description ->
  signal_catalog_arn:arn ->
  nodes:list_of_strings ->
  name:resource_name ->
  unit ->
  create_model_manifest_request

val make_create_fleet_response : arn:arn -> id:fleet_id -> unit -> create_fleet_response

val make_create_fleet_request :
  ?tags:tag_list ->
  ?description:description ->
  signal_catalog_arn:arn ->
  fleet_id:fleet_id ->
  unit ->
  create_fleet_request

val make_create_decoder_manifest_response :
  arn:arn -> name:resource_name -> unit -> create_decoder_manifest_response

val make_create_decoder_manifest_request :
  ?tags:tag_list ->
  ?default_for_unmapped_signals:default_for_unmapped_signals_type ->
  ?network_interfaces:network_interfaces ->
  ?signal_decoders:signal_decoders ->
  ?description:description ->
  model_manifest_arn:arn ->
  name:resource_name ->
  unit ->
  create_decoder_manifest_request

val make_create_campaign_response :
  ?arn:campaign_arn -> ?name:campaign_name -> unit -> create_campaign_response

val make_create_campaign_request :
  ?signals_to_fetch:signal_fetch_information_list ->
  ?data_partitions:data_partitions ->
  ?data_destination_configs:data_destination_configs ->
  ?tags:tag_list ->
  ?data_extra_dimensions:data_extra_dimension_node_path_list ->
  ?signals_to_collect:signal_information_list ->
  ?priority:priority ->
  ?compression:compression ->
  ?spooling_mode:spooling_mode ->
  ?diagnostics_mode:diagnostics_mode ->
  ?post_trigger_collection_duration:uint32 ->
  ?expiry_time:timestamp ->
  ?start_time:timestamp ->
  ?description:description ->
  collection_scheme:collection_scheme ->
  target_arn:arn ->
  signal_catalog_arn:arn ->
  name:campaign_name ->
  unit ->
  create_campaign_request

val make_associate_vehicle_fleet_response : unit -> unit

val make_associate_vehicle_fleet_request :
  fleet_id:fleet_id -> vehicle_name:vehicle_name -> unit -> associate_vehicle_fleet_request
