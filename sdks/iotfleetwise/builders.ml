open Types

let make_actuator ?description:(description_ : description option) ?unit_:(unit__ : string_ option)
    ?allowed_values:(allowed_values_ : list_of_strings option) ?min:(min_ : double option)
    ?max:(max_ : double option) ?assigned_value:(assigned_value_ : string_ option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?comment:(comment_ : message option)
    ?struct_fully_qualified_name:(struct_fully_qualified_name_ : node_path option)
    ~fully_qualified_name:(fully_qualified_name_ : string_) ~data_type:(data_type_ : node_data_type)
    () =
  ({
     fully_qualified_name = fully_qualified_name_;
     data_type = data_type_;
     description = description_;
     unit_ = unit__;
     allowed_values = allowed_values_;
     min = min_;
     max = max_;
     assigned_value = assigned_value_;
     deprecation_message = deprecation_message_;
     comment = comment_;
     struct_fully_qualified_name = struct_fully_qualified_name_;
   }
    : actuator)

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_associate_vehicle_fleet_response () = (() : unit)

let make_associate_vehicle_fleet_request ~vehicle_name:(vehicle_name_ : vehicle_name)
    ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ vehicle_name = vehicle_name_; fleet_id = fleet_id_ } : associate_vehicle_fleet_request)

let make_attribute ?description:(description_ : description option) ?unit_:(unit__ : string_ option)
    ?allowed_values:(allowed_values_ : list_of_strings option) ?min:(min_ : double option)
    ?max:(max_ : double option) ?assigned_value:(assigned_value_ : string_ option)
    ?default_value:(default_value_ : string_ option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?comment:(comment_ : message option) ~fully_qualified_name:(fully_qualified_name_ : string_)
    ~data_type:(data_type_ : node_data_type) () =
  ({
     fully_qualified_name = fully_qualified_name_;
     data_type = data_type_;
     description = description_;
     unit_ = unit__;
     allowed_values = allowed_values_;
     min = min_;
     max = max_;
     assigned_value = assigned_value_;
     default_value = default_value_;
     deprecation_message = deprecation_message_;
     comment = comment_;
   }
    : attribute)

let make_create_vehicle_error ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?code:(code_ : string_ option) ?message:(message_ : string_ option) () =
  ({ vehicle_name = vehicle_name_; code = code_; message = message_ } : create_vehicle_error)

let make_create_vehicle_response_item ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?arn:(arn_ : arn option) ?thing_arn:(thing_arn_ : arn option) () =
  ({ vehicle_name = vehicle_name_; arn = arn_; thing_arn = thing_arn_ }
    : create_vehicle_response_item)

let make_batch_create_vehicle_response ?vehicles:(vehicles_ : create_vehicle_responses option)
    ?errors:(errors_ : create_vehicle_errors option) () =
  ({ vehicles = vehicles_; errors = errors_ } : batch_create_vehicle_response)

let make_on_change_state_template_update_strategy () = (() : unit)

let make_time_period ~unit_:(unit__ : time_unit) ~value:(value_ : positive_integer) () =
  ({ unit_ = unit__; value = value_ } : time_period)

let make_periodic_state_template_update_strategy
    ~state_template_update_rate:(state_template_update_rate_ : time_period) () =
  ({ state_template_update_rate = state_template_update_rate_ }
    : periodic_state_template_update_strategy)

let make_state_template_association ~identifier:(identifier_ : resource_identifier)
    ~state_template_update_strategy:
      (state_template_update_strategy_ : state_template_update_strategy) () =
  ({ identifier = identifier_; state_template_update_strategy = state_template_update_strategy_ }
    : state_template_association)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_vehicle_request_item ?attributes:(attributes_ : attributes_map option)
    ?association_behavior:(association_behavior_ : vehicle_association_behavior option)
    ?tags:(tags_ : tag_list option)
    ?state_templates:(state_templates_ : state_template_associations option)
    ~vehicle_name:(vehicle_name_ : vehicle_name) ~model_manifest_arn:(model_manifest_arn_ : arn)
    ~decoder_manifest_arn:(decoder_manifest_arn_ : arn) () =
  ({
     vehicle_name = vehicle_name_;
     model_manifest_arn = model_manifest_arn_;
     decoder_manifest_arn = decoder_manifest_arn_;
     attributes = attributes_;
     association_behavior = association_behavior_;
     tags = tags_;
     state_templates = state_templates_;
   }
    : create_vehicle_request_item)

let make_batch_create_vehicle_request ~vehicles:(vehicles_ : create_vehicle_request_items) () =
  ({ vehicles = vehicles_ } : batch_create_vehicle_request)

let make_update_vehicle_error ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?code:(code_ : number option) ?message:(message_ : string_ option) () =
  ({ vehicle_name = vehicle_name_; code = code_; message = message_ } : update_vehicle_error)

let make_update_vehicle_response_item ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?arn:(arn_ : arn option) () =
  ({ vehicle_name = vehicle_name_; arn = arn_ } : update_vehicle_response_item)

let make_batch_update_vehicle_response ?vehicles:(vehicles_ : update_vehicle_response_items option)
    ?errors:(errors_ : update_vehicle_errors option) () =
  ({ vehicles = vehicles_; errors = errors_ } : batch_update_vehicle_response)

let make_update_vehicle_request_item ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?decoder_manifest_arn:(decoder_manifest_arn_ : arn option)
    ?attributes:(attributes_ : attributes_map option)
    ?attribute_update_mode:(attribute_update_mode_ : update_mode option)
    ?state_templates_to_add:(state_templates_to_add_ : state_template_associations option)
    ?state_templates_to_remove:
      (state_templates_to_remove_ : state_template_association_identifiers option)
    ?state_templates_to_update:(state_templates_to_update_ : state_template_associations option)
    ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({
     vehicle_name = vehicle_name_;
     model_manifest_arn = model_manifest_arn_;
     decoder_manifest_arn = decoder_manifest_arn_;
     attributes = attributes_;
     attribute_update_mode = attribute_update_mode_;
     state_templates_to_add = state_templates_to_add_;
     state_templates_to_remove = state_templates_to_remove_;
     state_templates_to_update = state_templates_to_update_;
   }
    : update_vehicle_request_item)

let make_batch_update_vehicle_request ~vehicles:(vehicles_ : update_vehicle_request_items) () =
  ({ vehicles = vehicles_ } : batch_update_vehicle_request)

let make_branch ?description:(description_ : description option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?comment:(comment_ : message option) ~fully_qualified_name:(fully_qualified_name_ : string_) ()
    =
  ({
     fully_qualified_name = fully_qualified_name_;
     description = description_;
     deprecation_message = deprecation_message_;
     comment = comment_;
   }
    : branch)

let make_campaign_summary ?arn:(arn_ : campaign_arn option) ?name:(name_ : campaign_name option)
    ?description:(description_ : description option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option) ?target_arn:(target_arn_ : arn option)
    ?status:(status_ : campaign_status option) ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     target_arn = target_arn_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : campaign_summary)

let make_can_dbc_definition ?signals_map:(signals_map_ : model_signals_map option)
    ~network_interface:(network_interface_ : interface_id)
    ~can_dbc_files:(can_dbc_files_ : network_files_list) () =
  ({
     network_interface = network_interface_;
     can_dbc_files = can_dbc_files_;
     signals_map = signals_map_;
   }
    : can_dbc_definition)

let make_can_interface ?protocol_name:(protocol_name_ : protocol_name option)
    ?protocol_version:(protocol_version_ : protocol_version option)
    ~name:(name_ : can_interface_name) () =
  ({ name = name_; protocol_name = protocol_name_; protocol_version = protocol_version_ }
    : can_interface)

let make_can_signal ?name:(name_ : can_signal_name option)
    ?signal_value_type:(signal_value_type_ : signal_value_type option)
    ~message_id:(message_id_ : non_negative_integer)
    ~is_big_endian:(is_big_endian_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~is_signed:(is_signed_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~start_bit:(start_bit_ : non_negative_integer) ~offset:(offset_ : double)
    ~factor:(factor_ : double) ~length:(length_ : non_negative_integer) () =
  ({
     message_id = message_id_;
     is_big_endian = is_big_endian_;
     is_signed = is_signed_;
     start_bit = start_bit_;
     offset = offset_;
     factor = factor_;
     length = length_;
     name = name_;
     signal_value_type = signal_value_type_;
   }
    : can_signal)

let make_cloud_watch_log_delivery_options
    ?log_group_name:(log_group_name_ : cloud_watch_log_group_name option)
    ~log_type:(log_type_ : log_type) () =
  ({ log_type = log_type_; log_group_name = log_group_name_ } : cloud_watch_log_delivery_options)

let make_condition_based_collection_scheme
    ?minimum_trigger_interval_ms:(minimum_trigger_interval_ms_ : uint32 option)
    ?trigger_mode:(trigger_mode_ : trigger_mode option)
    ?condition_language_version:(condition_language_version_ : language_version option)
    ~expression:(expression_ : event_expression) () =
  ({
     expression = expression_;
     minimum_trigger_interval_ms = minimum_trigger_interval_ms_;
     trigger_mode = trigger_mode_;
     condition_language_version = condition_language_version_;
   }
    : condition_based_collection_scheme)

let make_time_based_collection_scheme ~period_ms:(period_ms_ : collection_period_ms) () =
  ({ period_ms = period_ms_ } : time_based_collection_scheme)

let make_condition_based_signal_fetch_config
    ~condition_expression:(condition_expression_ : fetch_config_event_expression)
    ~trigger_mode:(trigger_mode_ : trigger_mode) () =
  ({ condition_expression = condition_expression_; trigger_mode = trigger_mode_ }
    : condition_based_signal_fetch_config)

let make_create_campaign_response ?name:(name_ : campaign_name option)
    ?arn:(arn_ : campaign_arn option) () =
  ({ name = name_; arn = arn_ } : create_campaign_response)

let make_time_based_signal_fetch_config
    ~execution_frequency_ms:(execution_frequency_ms_ : positive_long) () =
  ({ execution_frequency_ms = execution_frequency_ms_ } : time_based_signal_fetch_config)

let make_signal_fetch_information
    ?condition_language_version:(condition_language_version_ : language_version option)
    ~fully_qualified_name:(fully_qualified_name_ : node_path)
    ~signal_fetch_config:(signal_fetch_config_ : signal_fetch_config)
    ~actions:(actions_ : event_expression_list) () =
  ({
     fully_qualified_name = fully_qualified_name_;
     signal_fetch_config = signal_fetch_config_;
     condition_language_version = condition_language_version_;
     actions = actions_;
   }
    : signal_fetch_information)

let make_data_partition_upload_options
    ?condition_language_version:(condition_language_version_ : language_version option)
    ~expression:(expression_ : event_expression) () =
  ({ expression = expression_; condition_language_version = condition_language_version_ }
    : data_partition_upload_options)

let make_storage_minimum_time_to_live ~unit_:(unit__ : storage_minimum_time_to_live_unit)
    ~value:(value_ : storage_minimum_time_to_live_value) () =
  ({ unit_ = unit__; value = value_ } : storage_minimum_time_to_live)

let make_storage_maximum_size ~unit_:(unit__ : storage_maximum_size_unit)
    ~value:(value_ : storage_maximum_size_value) () =
  ({ unit_ = unit__; value = value_ } : storage_maximum_size)

let make_data_partition_storage_options ~maximum_size:(maximum_size_ : storage_maximum_size)
    ~storage_location:(storage_location_ : storage_location)
    ~minimum_time_to_live:(minimum_time_to_live_ : storage_minimum_time_to_live) () =
  ({
     maximum_size = maximum_size_;
     storage_location = storage_location_;
     minimum_time_to_live = minimum_time_to_live_;
   }
    : data_partition_storage_options)

let make_data_partition ?upload_options:(upload_options_ : data_partition_upload_options option)
    ~id:(id_ : data_partition_id)
    ~storage_options:(storage_options_ : data_partition_storage_options) () =
  ({ id = id_; storage_options = storage_options_; upload_options = upload_options_ }
    : data_partition)

let make_mqtt_topic_config ~mqtt_topic_arn:(mqtt_topic_arn_ : mqtt_topic_arn)
    ~execution_role_arn:(execution_role_arn_ : iam_role_arn) () =
  ({ mqtt_topic_arn = mqtt_topic_arn_; execution_role_arn = execution_role_arn_ }
    : mqtt_topic_config)

let make_timestream_config ~timestream_table_arn:(timestream_table_arn_ : timestream_table_arn)
    ~execution_role_arn:(execution_role_arn_ : iam_role_arn) () =
  ({ timestream_table_arn = timestream_table_arn_; execution_role_arn = execution_role_arn_ }
    : timestream_config)

let make_s3_config ?data_format:(data_format_ : data_format option)
    ?storage_compression_format:(storage_compression_format_ : storage_compression_format option)
    ?prefix:(prefix_ : prefix option) ~bucket_arn:(bucket_arn_ : s3_bucket_arn) () =
  ({
     bucket_arn = bucket_arn_;
     data_format = data_format_;
     storage_compression_format = storage_compression_format_;
     prefix = prefix_;
   }
    : s3_config)

let make_signal_information ?max_sample_count:(max_sample_count_ : max_sample_count option)
    ?minimum_sampling_interval_ms:(minimum_sampling_interval_ms_ : uint32 option)
    ?data_partition_id:(data_partition_id_ : data_partition_id option)
    ~name:(name_ : wildcard_signal_name) () =
  ({
     name = name_;
     max_sample_count = max_sample_count_;
     minimum_sampling_interval_ms = minimum_sampling_interval_ms_;
     data_partition_id = data_partition_id_;
   }
    : signal_information)

let make_create_campaign_request ?description:(description_ : description option)
    ?start_time:(start_time_ : timestamp option) ?expiry_time:(expiry_time_ : timestamp option)
    ?post_trigger_collection_duration:(post_trigger_collection_duration_ : uint32 option)
    ?diagnostics_mode:(diagnostics_mode_ : diagnostics_mode option)
    ?spooling_mode:(spooling_mode_ : spooling_mode option)
    ?compression:(compression_ : compression option) ?priority:(priority_ : priority option)
    ?signals_to_collect:(signals_to_collect_ : signal_information_list option)
    ?data_extra_dimensions:(data_extra_dimensions_ : data_extra_dimension_node_path_list option)
    ?tags:(tags_ : tag_list option)
    ?data_destination_configs:(data_destination_configs_ : data_destination_configs option)
    ?data_partitions:(data_partitions_ : data_partitions option)
    ?signals_to_fetch:(signals_to_fetch_ : signal_fetch_information_list option)
    ~name:(name_ : campaign_name) ~signal_catalog_arn:(signal_catalog_arn_ : arn)
    ~target_arn:(target_arn_ : arn) ~collection_scheme:(collection_scheme_ : collection_scheme) () =
  ({
     name = name_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     target_arn = target_arn_;
     start_time = start_time_;
     expiry_time = expiry_time_;
     post_trigger_collection_duration = post_trigger_collection_duration_;
     diagnostics_mode = diagnostics_mode_;
     spooling_mode = spooling_mode_;
     compression = compression_;
     priority = priority_;
     signals_to_collect = signals_to_collect_;
     collection_scheme = collection_scheme_;
     data_extra_dimensions = data_extra_dimensions_;
     tags = tags_;
     data_destination_configs = data_destination_configs_;
     data_partitions = data_partitions_;
     signals_to_fetch = signals_to_fetch_;
   }
    : create_campaign_request)

let make_invalid_network_interface ?interface_id:(interface_id_ : interface_id option)
    ?reason:(reason_ : network_interface_failure_reason option) () =
  ({ interface_id = interface_id_; reason = reason_ } : invalid_network_interface)

let make_invalid_signal_decoder ?name:(name_ : fully_qualified_name option)
    ?reason:(reason_ : signal_decoder_failure_reason option) ?hint:(hint_ : message option) () =
  ({ name = name_; reason = reason_; hint = hint_ } : invalid_signal_decoder)

let make_create_decoder_manifest_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : create_decoder_manifest_response)

let make_custom_decoding_interface ~name:(name_ : custom_decoding_signal_interface_name) () =
  ({ name = name_ } : custom_decoding_interface)

let make_vehicle_middleware ~name:(name_ : vehicle_middleware_name)
    ~protocol_name:(protocol_name_ : vehicle_middleware_protocol) () =
  ({ name = name_; protocol_name = protocol_name_ } : vehicle_middleware)

let make_obd_interface ?obd_standard:(obd_standard_ : obd_standard option)
    ?pid_request_interval_seconds:(pid_request_interval_seconds_ : non_negative_integer option)
    ?dtc_request_interval_seconds:(dtc_request_interval_seconds_ : non_negative_integer option)
    ?use_extended_ids:(use_extended_ids_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?has_transmission_ecu:
      (has_transmission_ecu_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ~name:(name_ : obd_interface_name)
    ~request_message_id:(request_message_id_ : non_negative_integer) () =
  ({
     name = name_;
     request_message_id = request_message_id_;
     obd_standard = obd_standard_;
     pid_request_interval_seconds = pid_request_interval_seconds_;
     dtc_request_interval_seconds = dtc_request_interval_seconds_;
     use_extended_ids = use_extended_ids_;
     has_transmission_ecu = has_transmission_ecu_;
   }
    : obd_interface)

let make_network_interface ?can_interface:(can_interface_ : can_interface option)
    ?obd_interface:(obd_interface_ : obd_interface option)
    ?vehicle_middleware:(vehicle_middleware_ : vehicle_middleware option)
    ?custom_decoding_interface:(custom_decoding_interface_ : custom_decoding_interface option)
    ~interface_id:(interface_id_ : interface_id) ~type_:(type__ : network_interface_type) () =
  ({
     interface_id = interface_id_;
     type_ = type__;
     can_interface = can_interface_;
     obd_interface = obd_interface_;
     vehicle_middleware = vehicle_middleware_;
     custom_decoding_interface = custom_decoding_interface_;
   }
    : network_interface)

let make_custom_decoding_signal ~id:(id_ : custom_decoding_id) () =
  ({ id = id_ } : custom_decoding_signal)

let make_ros2_primitive_message_definition ?offset:(offset_ : double option)
    ?scaling:(scaling_ : double option) ?upper_bound:(upper_bound_ : max_string_size option)
    ~primitive_type:(primitive_type_ : ros2_primitive_type) () =
  ({
     primitive_type = primitive_type_;
     offset = offset_;
     scaling = scaling_;
     upper_bound = upper_bound_;
   }
    : ros2_primitive_message_definition)

let make_structured_message_list_definition ?capacity:(capacity_ : non_negative_integer option)
    ~name:(name_ : structure_message_name) ~member_type:(member_type_ : structured_message)
    ~list_type:(list_type_ : structured_message_list_type) () =
  ({ name = name_; member_type = member_type_; list_type = list_type_; capacity = capacity_ }
    : structured_message_list_definition)

let make_structured_message_field_name_and_data_type_pair
    ~field_name:(field_name_ : structure_message_name) ~data_type:(data_type_ : structured_message)
    () =
  ({ field_name = field_name_; data_type = data_type_ }
    : structured_message_field_name_and_data_type_pair)

let make_message_signal ~topic_name:(topic_name_ : topic_name)
    ~structured_message:(structured_message_ : structured_message) () =
  ({ topic_name = topic_name_; structured_message = structured_message_ } : message_signal)

let make_obd_signal ?bit_right_shift:(bit_right_shift_ : non_negative_integer option)
    ?bit_mask_length:(bit_mask_length_ : obd_bitmask_length option)
    ?is_signed:(is_signed_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?signal_value_type:(signal_value_type_ : signal_value_type option)
    ~pid_response_length:(pid_response_length_ : positive_integer)
    ~service_mode:(service_mode_ : non_negative_integer) ~pid:(pid_ : non_negative_integer)
    ~scaling:(scaling_ : double) ~offset:(offset_ : double)
    ~start_byte:(start_byte_ : non_negative_integer) ~byte_length:(byte_length_ : obd_byte_length)
    () =
  ({
     pid_response_length = pid_response_length_;
     service_mode = service_mode_;
     pid = pid_;
     scaling = scaling_;
     offset = offset_;
     start_byte = start_byte_;
     byte_length = byte_length_;
     bit_right_shift = bit_right_shift_;
     bit_mask_length = bit_mask_length_;
     is_signed = is_signed_;
     signal_value_type = signal_value_type_;
   }
    : obd_signal)

let make_signal_decoder ?can_signal:(can_signal_ : can_signal option)
    ?obd_signal:(obd_signal_ : obd_signal option)
    ?message_signal:(message_signal_ : message_signal option)
    ?custom_decoding_signal:(custom_decoding_signal_ : custom_decoding_signal option)
    ~fully_qualified_name:(fully_qualified_name_ : fully_qualified_name)
    ~type_:(type__ : signal_decoder_type) ~interface_id:(interface_id_ : interface_id) () =
  ({
     fully_qualified_name = fully_qualified_name_;
     type_ = type__;
     interface_id = interface_id_;
     can_signal = can_signal_;
     obd_signal = obd_signal_;
     message_signal = message_signal_;
     custom_decoding_signal = custom_decoding_signal_;
   }
    : signal_decoder)

let make_create_decoder_manifest_request ?description:(description_ : description option)
    ?signal_decoders:(signal_decoders_ : signal_decoders option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?default_for_unmapped_signals:
      (default_for_unmapped_signals_ : default_for_unmapped_signals_type option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name)
    ~model_manifest_arn:(model_manifest_arn_ : arn) () =
  ({
     name = name_;
     description = description_;
     model_manifest_arn = model_manifest_arn_;
     signal_decoders = signal_decoders_;
     network_interfaces = network_interfaces_;
     default_for_unmapped_signals = default_for_unmapped_signals_;
     tags = tags_;
   }
    : create_decoder_manifest_request)

let make_create_fleet_response ~id:(id_ : fleet_id) ~arn:(arn_ : arn) () =
  ({ id = id_; arn = arn_ } : create_fleet_response)

let make_create_fleet_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~fleet_id:(fleet_id_ : fleet_id)
    ~signal_catalog_arn:(signal_catalog_arn_ : arn) () =
  ({
     fleet_id = fleet_id_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     tags = tags_;
   }
    : create_fleet_request)

let make_invalid_signal ?name:(name_ : fully_qualified_name option)
    ?reason:(reason_ : string_ option) () =
  ({ name = name_; reason = reason_ } : invalid_signal)

let make_create_model_manifest_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : create_model_manifest_response)

let make_create_model_manifest_request ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name) ~nodes:(nodes_ : list_of_strings)
    ~signal_catalog_arn:(signal_catalog_arn_ : arn) () =
  ({
     name = name_;
     description = description_;
     nodes = nodes_;
     signal_catalog_arn = signal_catalog_arn_;
     tags = tags_;
   }
    : create_model_manifest_request)

let make_custom_property ?data_encoding:(data_encoding_ : node_data_encoding option)
    ?description:(description_ : description option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?comment:(comment_ : message option)
    ?struct_fully_qualified_name:(struct_fully_qualified_name_ : node_path option)
    ~fully_qualified_name:(fully_qualified_name_ : string_) ~data_type:(data_type_ : node_data_type)
    () =
  ({
     fully_qualified_name = fully_qualified_name_;
     data_type = data_type_;
     data_encoding = data_encoding_;
     description = description_;
     deprecation_message = deprecation_message_;
     comment = comment_;
     struct_fully_qualified_name = struct_fully_qualified_name_;
   }
    : custom_property)

let make_custom_struct ?description:(description_ : description option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?comment:(comment_ : message option) ~fully_qualified_name:(fully_qualified_name_ : string_) ()
    =
  ({
     fully_qualified_name = fully_qualified_name_;
     description = description_;
     deprecation_message = deprecation_message_;
     comment = comment_;
   }
    : custom_struct)

let make_sensor ?description:(description_ : description option) ?unit_:(unit__ : string_ option)
    ?allowed_values:(allowed_values_ : list_of_strings option) ?min:(min_ : double option)
    ?max:(max_ : double option) ?deprecation_message:(deprecation_message_ : message option)
    ?comment:(comment_ : message option)
    ?struct_fully_qualified_name:(struct_fully_qualified_name_ : node_path option)
    ~fully_qualified_name:(fully_qualified_name_ : string_) ~data_type:(data_type_ : node_data_type)
    () =
  ({
     fully_qualified_name = fully_qualified_name_;
     data_type = data_type_;
     description = description_;
     unit_ = unit__;
     allowed_values = allowed_values_;
     min = min_;
     max = max_;
     deprecation_message = deprecation_message_;
     comment = comment_;
     struct_fully_qualified_name = struct_fully_qualified_name_;
   }
    : sensor)

let make_create_signal_catalog_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : create_signal_catalog_response)

let make_create_signal_catalog_request ?description:(description_ : description option)
    ?nodes:(nodes_ : nodes option) ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name) ()
    =
  ({ name = name_; description = description_; nodes = nodes_; tags = tags_ }
    : create_signal_catalog_request)

let make_create_state_template_response ?name:(name_ : resource_name option)
    ?arn:(arn_ : arn option) ?id:(id_ : resource_unique_id option) () =
  ({ name = name_; arn = arn_; id = id_ } : create_state_template_response)

let make_create_state_template_request ?description:(description_ : description option)
    ?data_extra_dimensions:
      (data_extra_dimensions_ : state_template_data_extra_dimension_node_path_list option)
    ?metadata_extra_dimensions:
      (metadata_extra_dimensions_ : state_template_metadata_extra_dimension_node_path_list option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name)
    ~signal_catalog_arn:(signal_catalog_arn_ : arn)
    ~state_template_properties:(state_template_properties_ : state_template_properties) () =
  ({
     name = name_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     state_template_properties = state_template_properties_;
     data_extra_dimensions = data_extra_dimensions_;
     metadata_extra_dimensions = metadata_extra_dimensions_;
     tags = tags_;
   }
    : create_state_template_request)

let make_create_vehicle_response ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?arn:(arn_ : arn option) ?thing_arn:(thing_arn_ : arn option) () =
  ({ vehicle_name = vehicle_name_; arn = arn_; thing_arn = thing_arn_ } : create_vehicle_response)

let make_create_vehicle_request ?attributes:(attributes_ : attributes_map option)
    ?association_behavior:(association_behavior_ : vehicle_association_behavior option)
    ?tags:(tags_ : tag_list option)
    ?state_templates:(state_templates_ : state_template_associations option)
    ~vehicle_name:(vehicle_name_ : vehicle_name) ~model_manifest_arn:(model_manifest_arn_ : arn)
    ~decoder_manifest_arn:(decoder_manifest_arn_ : arn) () =
  ({
     vehicle_name = vehicle_name_;
     model_manifest_arn = model_manifest_arn_;
     decoder_manifest_arn = decoder_manifest_arn_;
     attributes = attributes_;
     association_behavior = association_behavior_;
     tags = tags_;
     state_templates = state_templates_;
   }
    : create_vehicle_request)

let make_decoder_manifest_summary ?name:(name_ : string_ option) ?arn:(arn_ : arn option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?description:(description_ : description option) ?status:(status_ : manifest_status option)
    ?message:(message_ : message option) ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     name = name_;
     arn = arn_;
     model_manifest_arn = model_manifest_arn_;
     description = description_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     message = message_;
   }
    : decoder_manifest_summary)

let make_delete_campaign_response ?name:(name_ : campaign_name option)
    ?arn:(arn_ : campaign_arn option) () =
  ({ name = name_; arn = arn_ } : delete_campaign_response)

let make_delete_campaign_request ~name:(name_ : campaign_name) () =
  ({ name = name_ } : delete_campaign_request)

let make_delete_decoder_manifest_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : delete_decoder_manifest_response)

let make_delete_decoder_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_decoder_manifest_request)

let make_delete_fleet_response ?id:(id_ : fleet_id option) ?arn:(arn_ : arn option) () =
  ({ id = id_; arn = arn_ } : delete_fleet_response)

let make_delete_fleet_request ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ fleet_id = fleet_id_ } : delete_fleet_request)

let make_delete_model_manifest_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : delete_model_manifest_response)

let make_delete_model_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_model_manifest_request)

let make_delete_signal_catalog_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : delete_signal_catalog_response)

let make_delete_signal_catalog_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_signal_catalog_request)

let make_delete_state_template_response ?name:(name_ : resource_name option)
    ?arn:(arn_ : arn option) ?id:(id_ : resource_unique_id option) () =
  ({ name = name_; arn = arn_; id = id_ } : delete_state_template_response)

let make_delete_state_template_request ~identifier:(identifier_ : resource_identifier) () =
  ({ identifier = identifier_ } : delete_state_template_request)

let make_delete_vehicle_response ~vehicle_name:(vehicle_name_ : vehicle_name) ~arn:(arn_ : arn) () =
  ({ vehicle_name = vehicle_name_; arn = arn_ } : delete_vehicle_response)

let make_delete_vehicle_request ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ vehicle_name = vehicle_name_ } : delete_vehicle_request)

let make_disassociate_vehicle_fleet_response () = (() : unit)

let make_disassociate_vehicle_fleet_request ~vehicle_name:(vehicle_name_ : vehicle_name)
    ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ vehicle_name = vehicle_name_; fleet_id = fleet_id_ } : disassociate_vehicle_fleet_request)

let make_fleet_summary ?description:(description_ : description option)
    ?last_modification_time:(last_modification_time_ : timestamp option) ~id:(id_ : fleet_id)
    ~arn:(arn_ : arn) ~signal_catalog_arn:(signal_catalog_arn_ : arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     id = id_;
     arn = arn_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : fleet_summary)

let make_get_campaign_response ?name:(name_ : campaign_name option)
    ?arn:(arn_ : campaign_arn option) ?description:(description_ : description option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option) ?target_arn:(target_arn_ : arn option)
    ?status:(status_ : campaign_status option) ?start_time:(start_time_ : timestamp option)
    ?expiry_time:(expiry_time_ : timestamp option)
    ?post_trigger_collection_duration:(post_trigger_collection_duration_ : uint32 option)
    ?diagnostics_mode:(diagnostics_mode_ : diagnostics_mode option)
    ?spooling_mode:(spooling_mode_ : spooling_mode option)
    ?compression:(compression_ : compression option) ?priority:(priority_ : priority option)
    ?signals_to_collect:(signals_to_collect_ : signal_information_list option)
    ?collection_scheme:(collection_scheme_ : collection_scheme option)
    ?data_extra_dimensions:(data_extra_dimensions_ : data_extra_dimension_node_path_list option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?data_destination_configs:(data_destination_configs_ : data_destination_configs option)
    ?data_partitions:(data_partitions_ : data_partitions option)
    ?signals_to_fetch:(signals_to_fetch_ : signal_fetch_information_list option) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     target_arn = target_arn_;
     status = status_;
     start_time = start_time_;
     expiry_time = expiry_time_;
     post_trigger_collection_duration = post_trigger_collection_duration_;
     diagnostics_mode = diagnostics_mode_;
     spooling_mode = spooling_mode_;
     compression = compression_;
     priority = priority_;
     signals_to_collect = signals_to_collect_;
     collection_scheme = collection_scheme_;
     data_extra_dimensions = data_extra_dimensions_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     data_destination_configs = data_destination_configs_;
     data_partitions = data_partitions_;
     signals_to_fetch = signals_to_fetch_;
   }
    : get_campaign_response)

let make_get_campaign_request ~name:(name_ : campaign_name) () =
  ({ name = name_ } : get_campaign_request)

let make_get_decoder_manifest_response ?description:(description_ : description option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?status:(status_ : manifest_status option) ?message:(message_ : message option)
    ~name:(name_ : string_) ~arn:(arn_ : arn) ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     model_manifest_arn = model_manifest_arn_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     message = message_;
   }
    : get_decoder_manifest_response)

let make_get_decoder_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_decoder_manifest_request)

let make_get_encryption_configuration_response
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_message:(error_message_ : error_message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ~encryption_status:(encryption_status_ : encryption_status)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({
     kms_key_id = kms_key_id_;
     encryption_status = encryption_status_;
     encryption_type = encryption_type_;
     error_message = error_message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : get_encryption_configuration_response)

let make_get_encryption_configuration_request () = (() : unit)

let make_get_fleet_response ?description:(description_ : description option) ~id:(id_ : fleet_id)
    ~arn:(arn_ : arn) ~signal_catalog_arn:(signal_catalog_arn_ : arn)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     id = id_;
     arn = arn_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : get_fleet_response)

let make_get_fleet_request ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ fleet_id = fleet_id_ } : get_fleet_request)

let make_get_logging_options_response
    ~cloud_watch_log_delivery:(cloud_watch_log_delivery_ : cloud_watch_log_delivery_options) () =
  ({ cloud_watch_log_delivery = cloud_watch_log_delivery_ } : get_logging_options_response)

let make_get_logging_options_request () = (() : unit)

let make_get_model_manifest_response ?description:(description_ : description option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?status:(status_ : manifest_status option) ~name:(name_ : resource_name) ~arn:(arn_ : arn)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : get_model_manifest_response)

let make_get_model_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_model_manifest_request)

let make_iam_registration_response ?error_message:(error_message_ : error_message option)
    ~role_arn:(role_arn_ : arn) ~registration_status:(registration_status_ : registration_status) ()
    =
  ({
     role_arn = role_arn_;
     registration_status = registration_status_;
     error_message = error_message_;
   }
    : iam_registration_response)

let make_timestream_registration_response
    ?timestream_database_arn:(timestream_database_arn_ : arn option)
    ?timestream_table_arn:(timestream_table_arn_ : arn option)
    ?error_message:(error_message_ : error_message option)
    ~timestream_database_name:(timestream_database_name_ : timestream_database_name)
    ~timestream_table_name:(timestream_table_name_ : timestream_table_name)
    ~registration_status:(registration_status_ : registration_status) () =
  ({
     timestream_database_name = timestream_database_name_;
     timestream_table_name = timestream_table_name_;
     timestream_database_arn = timestream_database_arn_;
     timestream_table_arn = timestream_table_arn_;
     registration_status = registration_status_;
     error_message = error_message_;
   }
    : timestream_registration_response)

let make_get_register_account_status_response
    ?timestream_registration_response:
      (timestream_registration_response_ : timestream_registration_response option)
    ~customer_account_id:(customer_account_id_ : customer_account_id)
    ~account_status:(account_status_ : registration_status)
    ~iam_registration_response:(iam_registration_response_ : iam_registration_response)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     customer_account_id = customer_account_id_;
     account_status = account_status_;
     timestream_registration_response = timestream_registration_response_;
     iam_registration_response = iam_registration_response_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : get_register_account_status_response)

let make_get_register_account_status_request () = (() : unit)

let make_node_counts ?total_nodes:(total_nodes_ : number option)
    ?total_branches:(total_branches_ : number option)
    ?total_sensors:(total_sensors_ : number option)
    ?total_attributes:(total_attributes_ : number option)
    ?total_actuators:(total_actuators_ : number option)
    ?total_structs:(total_structs_ : number option)
    ?total_properties:(total_properties_ : number option) () =
  ({
     total_nodes = total_nodes_;
     total_branches = total_branches_;
     total_sensors = total_sensors_;
     total_attributes = total_attributes_;
     total_actuators = total_actuators_;
     total_structs = total_structs_;
     total_properties = total_properties_;
   }
    : node_counts)

let make_get_signal_catalog_response ?description:(description_ : description option)
    ?node_counts:(node_counts_ : node_counts option) ~name:(name_ : resource_name) ~arn:(arn_ : arn)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     node_counts = node_counts_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : get_signal_catalog_response)

let make_get_signal_catalog_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_signal_catalog_request)

let make_get_state_template_response ?name:(name_ : resource_name option) ?arn:(arn_ : arn option)
    ?description:(description_ : description option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?state_template_properties:(state_template_properties_ : state_template_properties option)
    ?data_extra_dimensions:
      (data_extra_dimensions_ : state_template_data_extra_dimension_node_path_list option)
    ?metadata_extra_dimensions:
      (metadata_extra_dimensions_ : state_template_metadata_extra_dimension_node_path_list option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?id:(id_ : resource_unique_id option) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     state_template_properties = state_template_properties_;
     data_extra_dimensions = data_extra_dimensions_;
     metadata_extra_dimensions = metadata_extra_dimensions_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     id = id_;
   }
    : get_state_template_response)

let make_get_state_template_request ~identifier:(identifier_ : resource_identifier) () =
  ({ identifier = identifier_ } : get_state_template_request)

let make_get_vehicle_response ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?arn:(arn_ : arn option) ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?decoder_manifest_arn:(decoder_manifest_arn_ : arn option)
    ?attributes:(attributes_ : attributes_map option)
    ?state_templates:(state_templates_ : state_template_associations option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     vehicle_name = vehicle_name_;
     arn = arn_;
     model_manifest_arn = model_manifest_arn_;
     decoder_manifest_arn = decoder_manifest_arn_;
     attributes = attributes_;
     state_templates = state_templates_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : get_vehicle_response)

let make_get_vehicle_request ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ vehicle_name = vehicle_name_ } : get_vehicle_request)

let make_vehicle_status ?campaign_name:(campaign_name_ : campaign_name option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) ?status:(status_ : vehicle_state option) ()
    =
  ({ campaign_name = campaign_name_; vehicle_name = vehicle_name_; status = status_ }
    : vehicle_status)

let make_get_vehicle_status_response ?campaigns:(campaigns_ : vehicle_status_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ campaigns = campaigns_; next_token = next_token_ } : get_vehicle_status_response)

let make_get_vehicle_status_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~vehicle_name:(vehicle_name_ : vehicle_name) ()
    =
  ({ next_token = next_token_; max_results = max_results_; vehicle_name = vehicle_name_ }
    : get_vehicle_status_request)

let make_iam_resources ~role_arn:(role_arn_ : iam_role_arn) () =
  ({ role_arn = role_arn_ } : iam_resources)

let make_import_decoder_manifest_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : import_decoder_manifest_response)

let make_import_decoder_manifest_request ~name:(name_ : resource_name)
    ~network_file_definitions:(network_file_definitions_ : network_file_definitions) () =
  ({ name = name_; network_file_definitions = network_file_definitions_ }
    : import_decoder_manifest_request)

let make_import_signal_catalog_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : import_signal_catalog_response)

let make_import_signal_catalog_request ?description:(description_ : description option)
    ?vss:(vss_ : formatted_vss option) ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name)
    () =
  ({ name = name_; description = description_; vss = vss_; tags = tags_ }
    : import_signal_catalog_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_timestream_resources
    ~timestream_database_name:(timestream_database_name_ : timestream_database_name)
    ~timestream_table_name:(timestream_table_name_ : timestream_table_name) () =
  ({
     timestream_database_name = timestream_database_name_;
     timestream_table_name = timestream_table_name_;
   }
    : timestream_resources)

let make_register_account_response
    ?timestream_resources:(timestream_resources_ : timestream_resources option)
    ~register_account_status:(register_account_status_ : registration_status)
    ~iam_resources:(iam_resources_ : iam_resources) ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     register_account_status = register_account_status_;
     timestream_resources = timestream_resources_;
     iam_resources = iam_resources_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : register_account_response)

let make_register_account_request
    ?timestream_resources:(timestream_resources_ : timestream_resources option)
    ?iam_resources:(iam_resources_ : iam_resources option) () =
  ({ timestream_resources = timestream_resources_; iam_resources = iam_resources_ }
    : register_account_request)

let make_put_logging_options_response () = (() : unit)

let make_put_logging_options_request
    ~cloud_watch_log_delivery:(cloud_watch_log_delivery_ : cloud_watch_log_delivery_options) () =
  ({ cloud_watch_log_delivery = cloud_watch_log_delivery_ } : put_logging_options_request)

let make_put_encryption_configuration_response
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~encryption_status:(encryption_status_ : encryption_status)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({
     kms_key_id = kms_key_id_;
     encryption_status = encryption_status_;
     encryption_type = encryption_type_;
   }
    : put_encryption_configuration_response)

let make_put_encryption_configuration_request
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({ kms_key_id = kms_key_id_; encryption_type = encryption_type_ }
    : put_encryption_configuration_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_campaigns_response
    ?campaign_summaries:(campaign_summaries_ : campaign_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ campaign_summaries = campaign_summaries_; next_token = next_token_ } : list_campaigns_response)

let make_list_campaigns_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?status:(status_ : status_str option)
    ?list_response_scope:(list_response_scope_ : list_response_scope option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     list_response_scope = list_response_scope_;
   }
    : list_campaigns_request)

let make_list_decoder_manifest_network_interfaces_response
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?next_token:(next_token_ : next_token option) () =
  ({ network_interfaces = network_interfaces_; next_token = next_token_ }
    : list_decoder_manifest_network_interfaces_response)

let make_list_decoder_manifest_network_interfaces_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~name:(name_ : resource_name) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ }
    : list_decoder_manifest_network_interfaces_request)

let make_list_decoder_manifest_signals_response
    ?signal_decoders:(signal_decoders_ : signal_decoders option)
    ?next_token:(next_token_ : next_token option) () =
  ({ signal_decoders = signal_decoders_; next_token = next_token_ }
    : list_decoder_manifest_signals_response)

let make_list_decoder_manifest_signals_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~name:(name_ : resource_name) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ }
    : list_decoder_manifest_signals_request)

let make_list_decoder_manifests_response ?summaries:(summaries_ : decoder_manifest_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_decoder_manifests_response)

let make_list_decoder_manifests_request ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?list_response_scope:(list_response_scope_ : list_response_scope option) () =
  ({
     model_manifest_arn = model_manifest_arn_;
     next_token = next_token_;
     max_results = max_results_;
     list_response_scope = list_response_scope_;
   }
    : list_decoder_manifests_request)

let make_list_fleets_response ?fleet_summaries:(fleet_summaries_ : fleet_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ fleet_summaries = fleet_summaries_; next_token = next_token_ } : list_fleets_response)

let make_list_fleets_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?list_response_scope:(list_response_scope_ : list_response_scope option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     list_response_scope = list_response_scope_;
   }
    : list_fleets_request)

let make_list_fleets_for_vehicle_response ?fleets:(fleets_ : fleets option)
    ?next_token:(next_token_ : next_token option) () =
  ({ fleets = fleets_; next_token = next_token_ } : list_fleets_for_vehicle_response)

let make_list_fleets_for_vehicle_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~vehicle_name:(vehicle_name_ : vehicle_name) ()
    =
  ({ vehicle_name = vehicle_name_; next_token = next_token_; max_results = max_results_ }
    : list_fleets_for_vehicle_request)

let make_list_model_manifest_nodes_response ?nodes:(nodes_ : nodes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ nodes = nodes_; next_token = next_token_ } : list_model_manifest_nodes_response)

let make_list_model_manifest_nodes_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~name:(name_ : resource_name) () =
  ({ name = name_; next_token = next_token_; max_results = max_results_ }
    : list_model_manifest_nodes_request)

let make_model_manifest_summary ?name:(name_ : string_ option) ?arn:(arn_ : arn option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?description:(description_ : description option) ?status:(status_ : manifest_status option)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     name = name_;
     arn = arn_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : model_manifest_summary)

let make_list_model_manifests_response ?summaries:(summaries_ : model_manifest_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_model_manifests_response)

let make_list_model_manifests_request ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?list_response_scope:(list_response_scope_ : list_response_scope option) () =
  ({
     signal_catalog_arn = signal_catalog_arn_;
     next_token = next_token_;
     max_results = max_results_;
     list_response_scope = list_response_scope_;
   }
    : list_model_manifests_request)

let make_list_signal_catalog_nodes_response ?nodes:(nodes_ : nodes option)
    ?next_token:(next_token_ : next_token option) () =
  ({ nodes = nodes_; next_token = next_token_ } : list_signal_catalog_nodes_response)

let make_list_signal_catalog_nodes_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?signal_node_type:(signal_node_type_ : signal_node_type option) ~name:(name_ : resource_name) ()
    =
  ({
     name = name_;
     next_token = next_token_;
     max_results = max_results_;
     signal_node_type = signal_node_type_;
   }
    : list_signal_catalog_nodes_request)

let make_signal_catalog_summary ?name:(name_ : string_ option) ?arn:(arn_ : arn option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     name = name_;
     arn = arn_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : signal_catalog_summary)

let make_list_signal_catalogs_response ?summaries:(summaries_ : signal_catalog_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_signal_catalogs_response)

let make_list_signal_catalogs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_signal_catalogs_request)

let make_state_template_summary ?name:(name_ : resource_name option) ?arn:(arn_ : arn option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?description:(description_ : description option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?id:(id_ : resource_unique_id option) () =
  ({
     name = name_;
     arn = arn_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     id = id_;
   }
    : state_template_summary)

let make_list_state_templates_response ?summaries:(summaries_ : state_template_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_state_templates_response)

let make_list_state_templates_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?list_response_scope:(list_response_scope_ : list_response_scope option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     list_response_scope = list_response_scope_;
   }
    : list_state_templates_request)

let make_vehicle_summary ?attributes:(attributes_ : attributes_map option)
    ~vehicle_name:(vehicle_name_ : vehicle_name) ~arn:(arn_ : arn)
    ~model_manifest_arn:(model_manifest_arn_ : arn)
    ~decoder_manifest_arn:(decoder_manifest_arn_ : arn) ~creation_time:(creation_time_ : timestamp)
    ~last_modification_time:(last_modification_time_ : timestamp) () =
  ({
     vehicle_name = vehicle_name_;
     arn = arn_;
     model_manifest_arn = model_manifest_arn_;
     decoder_manifest_arn = decoder_manifest_arn_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     attributes = attributes_;
   }
    : vehicle_summary)

let make_list_vehicles_response ?vehicle_summaries:(vehicle_summaries_ : vehicle_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ vehicle_summaries = vehicle_summaries_; next_token = next_token_ } : list_vehicles_response)

let make_list_vehicles_request ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?attribute_names:(attribute_names_ : attribute_names_list option)
    ?attribute_values:(attribute_values_ : attribute_values_list option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_vehicles_max_results option)
    ?list_response_scope:(list_response_scope_ : list_response_scope option) () =
  ({
     model_manifest_arn = model_manifest_arn_;
     attribute_names = attribute_names_;
     attribute_values = attribute_values_;
     next_token = next_token_;
     max_results = max_results_;
     list_response_scope = list_response_scope_;
   }
    : list_vehicles_request)

let make_list_vehicles_in_fleet_response ?vehicles:(vehicles_ : vehicles option)
    ?next_token:(next_token_ : next_token option) () =
  ({ vehicles = vehicles_; next_token = next_token_ } : list_vehicles_in_fleet_response)

let make_list_vehicles_in_fleet_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ fleet_id = fleet_id_; next_token = next_token_; max_results = max_results_ }
    : list_vehicles_in_fleet_request)

let make_update_campaign_response ?arn:(arn_ : campaign_arn option)
    ?name:(name_ : campaign_name option) ?status:(status_ : campaign_status option) () =
  ({ arn = arn_; name = name_; status = status_ } : update_campaign_response)

let make_update_campaign_request ?description:(description_ : description option)
    ?data_extra_dimensions:(data_extra_dimensions_ : data_extra_dimension_node_path_list option)
    ~name:(name_ : campaign_name) ~action:(action_ : update_campaign_action) () =
  ({
     name = name_;
     description = description_;
     data_extra_dimensions = data_extra_dimensions_;
     action = action_;
   }
    : update_campaign_request)

let make_update_decoder_manifest_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : update_decoder_manifest_response)

let make_update_decoder_manifest_request ?description:(description_ : description option)
    ?signal_decoders_to_add:(signal_decoders_to_add_ : signal_decoders option)
    ?signal_decoders_to_update:(signal_decoders_to_update_ : signal_decoders option)
    ?signal_decoders_to_remove:(signal_decoders_to_remove_ : fqns option)
    ?network_interfaces_to_add:(network_interfaces_to_add_ : network_interfaces option)
    ?network_interfaces_to_update:(network_interfaces_to_update_ : network_interfaces option)
    ?network_interfaces_to_remove:(network_interfaces_to_remove_ : interface_ids option)
    ?status:(status_ : manifest_status option)
    ?default_for_unmapped_signals:
      (default_for_unmapped_signals_ : default_for_unmapped_signals_type option)
    ~name:(name_ : resource_name) () =
  ({
     name = name_;
     description = description_;
     signal_decoders_to_add = signal_decoders_to_add_;
     signal_decoders_to_update = signal_decoders_to_update_;
     signal_decoders_to_remove = signal_decoders_to_remove_;
     network_interfaces_to_add = network_interfaces_to_add_;
     network_interfaces_to_update = network_interfaces_to_update_;
     network_interfaces_to_remove = network_interfaces_to_remove_;
     status = status_;
     default_for_unmapped_signals = default_for_unmapped_signals_;
   }
    : update_decoder_manifest_request)

let make_update_fleet_response ?id:(id_ : fleet_id option) ?arn:(arn_ : arn option) () =
  ({ id = id_; arn = arn_ } : update_fleet_response)

let make_update_fleet_request ?description:(description_ : description option)
    ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ fleet_id = fleet_id_; description = description_ } : update_fleet_request)

let make_update_model_manifest_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : update_model_manifest_response)

let make_update_model_manifest_request ?description:(description_ : description option)
    ?nodes_to_add:(nodes_to_add_ : node_paths option)
    ?nodes_to_remove:(nodes_to_remove_ : node_paths option)
    ?status:(status_ : manifest_status option) ~name:(name_ : resource_name) () =
  ({
     name = name_;
     description = description_;
     nodes_to_add = nodes_to_add_;
     nodes_to_remove = nodes_to_remove_;
     status = status_;
   }
    : update_model_manifest_request)

let make_update_signal_catalog_response ~name:(name_ : resource_name) ~arn:(arn_ : arn) () =
  ({ name = name_; arn = arn_ } : update_signal_catalog_response)

let make_update_signal_catalog_request ?description:(description_ : description option)
    ?nodes_to_add:(nodes_to_add_ : nodes option) ?nodes_to_update:(nodes_to_update_ : nodes option)
    ?nodes_to_remove:(nodes_to_remove_ : node_paths option) ~name:(name_ : resource_name) () =
  ({
     name = name_;
     description = description_;
     nodes_to_add = nodes_to_add_;
     nodes_to_update = nodes_to_update_;
     nodes_to_remove = nodes_to_remove_;
   }
    : update_signal_catalog_request)

let make_update_state_template_response ?name:(name_ : resource_name option)
    ?arn:(arn_ : arn option) ?id:(id_ : resource_unique_id option) () =
  ({ name = name_; arn = arn_; id = id_ } : update_state_template_response)

let make_update_state_template_request ?description:(description_ : description option)
    ?state_template_properties_to_add:
      (state_template_properties_to_add_ : state_template_properties option)
    ?state_template_properties_to_remove:
      (state_template_properties_to_remove_ : state_template_properties option)
    ?data_extra_dimensions:
      (data_extra_dimensions_ : state_template_data_extra_dimension_node_path_list option)
    ?metadata_extra_dimensions:
      (metadata_extra_dimensions_ : state_template_metadata_extra_dimension_node_path_list option)
    ~identifier:(identifier_ : resource_identifier) () =
  ({
     identifier = identifier_;
     description = description_;
     state_template_properties_to_add = state_template_properties_to_add_;
     state_template_properties_to_remove = state_template_properties_to_remove_;
     data_extra_dimensions = data_extra_dimensions_;
     metadata_extra_dimensions = metadata_extra_dimensions_;
   }
    : update_state_template_request)

let make_update_vehicle_response ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?arn:(arn_ : arn option) () =
  ({ vehicle_name = vehicle_name_; arn = arn_ } : update_vehicle_response)

let make_update_vehicle_request ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?decoder_manifest_arn:(decoder_manifest_arn_ : arn option)
    ?attributes:(attributes_ : attributes_map option)
    ?attribute_update_mode:(attribute_update_mode_ : update_mode option)
    ?state_templates_to_add:(state_templates_to_add_ : state_template_associations option)
    ?state_templates_to_remove:
      (state_templates_to_remove_ : state_template_association_identifiers option)
    ?state_templates_to_update:(state_templates_to_update_ : state_template_associations option)
    ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({
     vehicle_name = vehicle_name_;
     model_manifest_arn = model_manifest_arn_;
     decoder_manifest_arn = decoder_manifest_arn_;
     attributes = attributes_;
     attribute_update_mode = attribute_update_mode_;
     state_templates_to_add = state_templates_to_add_;
     state_templates_to_remove = state_templates_to_remove_;
     state_templates_to_update = state_templates_to_update_;
   }
    : update_vehicle_request)
