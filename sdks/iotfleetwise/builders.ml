open Types

let make_vehicle_summary ?attributes:(attributes_ : attributes_map option)
    ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~decoder_manifest_arn:(decoder_manifest_arn_ : arn)
    ~model_manifest_arn:(model_manifest_arn_ : arn) ~arn:(arn_ : arn)
    ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({
     attributes = attributes_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     decoder_manifest_arn = decoder_manifest_arn_;
     model_manifest_arn = model_manifest_arn_;
     arn = arn_;
     vehicle_name = vehicle_name_;
   }
    : vehicle_summary)

let make_update_vehicle_response_item ?arn:(arn_ : arn option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) () =
  ({ arn = arn_; vehicle_name = vehicle_name_ } : update_vehicle_response_item)

let make_time_period ~value:(value_ : positive_integer) ~unit_:(unit__ : time_unit) () =
  ({ value = value_; unit_ = unit__ } : time_period)

let make_periodic_state_template_update_strategy
    ~state_template_update_rate:(state_template_update_rate_ : time_period) () =
  ({ state_template_update_rate = state_template_update_rate_ }
    : periodic_state_template_update_strategy)

let make_on_change_state_template_update_strategy () = (() : unit)

let make_state_template_association
    ~state_template_update_strategy:
      (state_template_update_strategy_ : state_template_update_strategy)
    ~identifier:(identifier_ : resource_identifier) () =
  ({ state_template_update_strategy = state_template_update_strategy_; identifier = identifier_ }
    : state_template_association)

let make_update_vehicle_request_item
    ?state_templates_to_update:(state_templates_to_update_ : state_template_associations option)
    ?state_templates_to_remove:
      (state_templates_to_remove_ : state_template_association_identifiers option)
    ?state_templates_to_add:(state_templates_to_add_ : state_template_associations option)
    ?attribute_update_mode:(attribute_update_mode_ : update_mode option)
    ?attributes:(attributes_ : attributes_map option)
    ?decoder_manifest_arn:(decoder_manifest_arn_ : arn option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({
     state_templates_to_update = state_templates_to_update_;
     state_templates_to_remove = state_templates_to_remove_;
     state_templates_to_add = state_templates_to_add_;
     attribute_update_mode = attribute_update_mode_;
     attributes = attributes_;
     decoder_manifest_arn = decoder_manifest_arn_;
     model_manifest_arn = model_manifest_arn_;
     vehicle_name = vehicle_name_;
   }
    : update_vehicle_request_item)

let make_update_vehicle_error ?message:(message_ : string_ option) ?code:(code_ : number option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) () =
  ({ message = message_; code = code_; vehicle_name = vehicle_name_ } : update_vehicle_error)

let make_signal_catalog_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?arn:(arn_ : arn option)
    ?name:(name_ : string_ option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     arn = arn_;
     name = name_;
   }
    : signal_catalog_summary)

let make_model_manifest_summary ?status:(status_ : manifest_status option)
    ?description:(description_ : description option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option) ?arn:(arn_ : arn option)
    ?name:(name_ : string_ option) ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     arn = arn_;
     name = name_;
   }
    : model_manifest_summary)

let make_fleet_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?description:(description_ : description option) ~creation_time:(creation_time_ : timestamp)
    ~signal_catalog_arn:(signal_catalog_arn_ : arn) ~arn:(arn_ : arn) ~id:(id_ : fleet_id) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     arn = arn_;
     id = id_;
   }
    : fleet_summary)

let make_decoder_manifest_summary ?message:(message_ : message option)
    ?status:(status_ : manifest_status option) ?description:(description_ : description option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option) ?arn:(arn_ : arn option)
    ?name:(name_ : string_ option) ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     message = message_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     description = description_;
     model_manifest_arn = model_manifest_arn_;
     arn = arn_;
     name = name_;
   }
    : decoder_manifest_summary)

let make_create_vehicle_response_item ?thing_arn:(thing_arn_ : arn option) ?arn:(arn_ : arn option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) () =
  ({ thing_arn = thing_arn_; arn = arn_; vehicle_name = vehicle_name_ }
    : create_vehicle_response_item)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_create_vehicle_request_item
    ?state_templates:(state_templates_ : state_template_associations option)
    ?tags:(tags_ : tag_list option)
    ?association_behavior:(association_behavior_ : vehicle_association_behavior option)
    ?attributes:(attributes_ : attributes_map option)
    ~decoder_manifest_arn:(decoder_manifest_arn_ : arn)
    ~model_manifest_arn:(model_manifest_arn_ : arn) ~vehicle_name:(vehicle_name_ : vehicle_name) ()
    =
  ({
     state_templates = state_templates_;
     tags = tags_;
     association_behavior = association_behavior_;
     attributes = attributes_;
     decoder_manifest_arn = decoder_manifest_arn_;
     model_manifest_arn = model_manifest_arn_;
     vehicle_name = vehicle_name_;
   }
    : create_vehicle_request_item)

let make_create_vehicle_error ?message:(message_ : string_ option) ?code:(code_ : string_ option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) () =
  ({ message = message_; code = code_; vehicle_name = vehicle_name_ } : create_vehicle_error)

let make_campaign_summary ?status:(status_ : campaign_status option)
    ?target_arn:(target_arn_ : arn option) ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?description:(description_ : description option) ?name:(name_ : campaign_name option)
    ?arn:(arn_ : campaign_arn option) ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     target_arn = target_arn_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : campaign_summary)

let make_vehicle_status ?status:(status_ : vehicle_state option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option)
    ?campaign_name:(campaign_name_ : campaign_name option) () =
  ({ status = status_; vehicle_name = vehicle_name_; campaign_name = campaign_name_ }
    : vehicle_status)

let make_vehicle_middleware ~protocol_name:(protocol_name_ : vehicle_middleware_protocol)
    ~name:(name_ : vehicle_middleware_name) () =
  ({ protocol_name = protocol_name_; name = name_ } : vehicle_middleware)

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_update_vehicle_response ?arn:(arn_ : arn option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) () =
  ({ arn = arn_; vehicle_name = vehicle_name_ } : update_vehicle_response)

let make_update_vehicle_request
    ?state_templates_to_update:(state_templates_to_update_ : state_template_associations option)
    ?state_templates_to_remove:
      (state_templates_to_remove_ : state_template_association_identifiers option)
    ?state_templates_to_add:(state_templates_to_add_ : state_template_associations option)
    ?attribute_update_mode:(attribute_update_mode_ : update_mode option)
    ?attributes:(attributes_ : attributes_map option)
    ?decoder_manifest_arn:(decoder_manifest_arn_ : arn option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({
     state_templates_to_update = state_templates_to_update_;
     state_templates_to_remove = state_templates_to_remove_;
     state_templates_to_add = state_templates_to_add_;
     attribute_update_mode = attribute_update_mode_;
     attributes = attributes_;
     decoder_manifest_arn = decoder_manifest_arn_;
     model_manifest_arn = model_manifest_arn_;
     vehicle_name = vehicle_name_;
   }
    : update_vehicle_request)

let make_update_state_template_response ?id:(id_ : resource_unique_id option)
    ?arn:(arn_ : arn option) ?name:(name_ : resource_name option) () =
  ({ id = id_; arn = arn_; name = name_ } : update_state_template_response)

let make_update_state_template_request
    ?metadata_extra_dimensions:
      (metadata_extra_dimensions_ : state_template_metadata_extra_dimension_node_path_list option)
    ?data_extra_dimensions:
      (data_extra_dimensions_ : state_template_data_extra_dimension_node_path_list option)
    ?state_template_properties_to_remove:
      (state_template_properties_to_remove_ : state_template_properties option)
    ?state_template_properties_to_add:
      (state_template_properties_to_add_ : state_template_properties option)
    ?description:(description_ : description option) ~identifier:(identifier_ : resource_identifier)
    () =
  ({
     metadata_extra_dimensions = metadata_extra_dimensions_;
     data_extra_dimensions = data_extra_dimensions_;
     state_template_properties_to_remove = state_template_properties_to_remove_;
     state_template_properties_to_add = state_template_properties_to_add_;
     description = description_;
     identifier = identifier_;
   }
    : update_state_template_request)

let make_invalid_signal ?reason:(reason_ : string_ option)
    ?name:(name_ : fully_qualified_name option) () =
  ({ reason = reason_; name = name_ } : invalid_signal)

let make_update_signal_catalog_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : update_signal_catalog_response)

let make_branch ?comment:(comment_ : message option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?description:(description_ : description option)
    ~fully_qualified_name:(fully_qualified_name_ : string_) () =
  ({
     comment = comment_;
     deprecation_message = deprecation_message_;
     description = description_;
     fully_qualified_name = fully_qualified_name_;
   }
    : branch)

let make_sensor ?struct_fully_qualified_name:(struct_fully_qualified_name_ : node_path option)
    ?comment:(comment_ : message option)
    ?deprecation_message:(deprecation_message_ : message option) ?max:(max_ : double option)
    ?min:(min_ : double option) ?allowed_values:(allowed_values_ : list_of_strings option)
    ?unit_:(unit__ : string_ option) ?description:(description_ : description option)
    ~data_type:(data_type_ : node_data_type) ~fully_qualified_name:(fully_qualified_name_ : string_)
    () =
  ({
     struct_fully_qualified_name = struct_fully_qualified_name_;
     comment = comment_;
     deprecation_message = deprecation_message_;
     max = max_;
     min = min_;
     allowed_values = allowed_values_;
     unit_ = unit__;
     description = description_;
     data_type = data_type_;
     fully_qualified_name = fully_qualified_name_;
   }
    : sensor)

let make_actuator ?struct_fully_qualified_name:(struct_fully_qualified_name_ : node_path option)
    ?comment:(comment_ : message option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?assigned_value:(assigned_value_ : string_ option) ?max:(max_ : double option)
    ?min:(min_ : double option) ?allowed_values:(allowed_values_ : list_of_strings option)
    ?unit_:(unit__ : string_ option) ?description:(description_ : description option)
    ~data_type:(data_type_ : node_data_type) ~fully_qualified_name:(fully_qualified_name_ : string_)
    () =
  ({
     struct_fully_qualified_name = struct_fully_qualified_name_;
     comment = comment_;
     deprecation_message = deprecation_message_;
     assigned_value = assigned_value_;
     max = max_;
     min = min_;
     allowed_values = allowed_values_;
     unit_ = unit__;
     description = description_;
     data_type = data_type_;
     fully_qualified_name = fully_qualified_name_;
   }
    : actuator)

let make_attribute ?comment:(comment_ : message option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?default_value:(default_value_ : string_ option)
    ?assigned_value:(assigned_value_ : string_ option) ?max:(max_ : double option)
    ?min:(min_ : double option) ?allowed_values:(allowed_values_ : list_of_strings option)
    ?unit_:(unit__ : string_ option) ?description:(description_ : description option)
    ~data_type:(data_type_ : node_data_type) ~fully_qualified_name:(fully_qualified_name_ : string_)
    () =
  ({
     comment = comment_;
     deprecation_message = deprecation_message_;
     default_value = default_value_;
     assigned_value = assigned_value_;
     max = max_;
     min = min_;
     allowed_values = allowed_values_;
     unit_ = unit__;
     description = description_;
     data_type = data_type_;
     fully_qualified_name = fully_qualified_name_;
   }
    : attribute)

let make_custom_struct ?comment:(comment_ : message option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?description:(description_ : description option)
    ~fully_qualified_name:(fully_qualified_name_ : string_) () =
  ({
     comment = comment_;
     deprecation_message = deprecation_message_;
     description = description_;
     fully_qualified_name = fully_qualified_name_;
   }
    : custom_struct)

let make_custom_property
    ?struct_fully_qualified_name:(struct_fully_qualified_name_ : node_path option)
    ?comment:(comment_ : message option)
    ?deprecation_message:(deprecation_message_ : message option)
    ?description:(description_ : description option)
    ?data_encoding:(data_encoding_ : node_data_encoding option)
    ~data_type:(data_type_ : node_data_type) ~fully_qualified_name:(fully_qualified_name_ : string_)
    () =
  ({
     struct_fully_qualified_name = struct_fully_qualified_name_;
     comment = comment_;
     deprecation_message = deprecation_message_;
     description = description_;
     data_encoding = data_encoding_;
     data_type = data_type_;
     fully_qualified_name = fully_qualified_name_;
   }
    : custom_property)

let make_update_signal_catalog_request ?nodes_to_remove:(nodes_to_remove_ : node_paths option)
    ?nodes_to_update:(nodes_to_update_ : nodes option) ?nodes_to_add:(nodes_to_add_ : nodes option)
    ?description:(description_ : description option) ~name:(name_ : resource_name) () =
  ({
     nodes_to_remove = nodes_to_remove_;
     nodes_to_update = nodes_to_update_;
     nodes_to_add = nodes_to_add_;
     description = description_;
     name = name_;
   }
    : update_signal_catalog_request)

let make_update_model_manifest_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : update_model_manifest_response)

let make_update_model_manifest_request ?status:(status_ : manifest_status option)
    ?nodes_to_remove:(nodes_to_remove_ : node_paths option)
    ?nodes_to_add:(nodes_to_add_ : node_paths option)
    ?description:(description_ : description option) ~name:(name_ : resource_name) () =
  ({
     status = status_;
     nodes_to_remove = nodes_to_remove_;
     nodes_to_add = nodes_to_add_;
     description = description_;
     name = name_;
   }
    : update_model_manifest_request)

let make_update_fleet_response ?arn:(arn_ : arn option) ?id:(id_ : fleet_id option) () =
  ({ arn = arn_; id = id_ } : update_fleet_response)

let make_update_fleet_request ?description:(description_ : description option)
    ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ description = description_; fleet_id = fleet_id_ } : update_fleet_request)

let make_update_decoder_manifest_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : update_decoder_manifest_response)

let make_can_signal ?signal_value_type:(signal_value_type_ : signal_value_type option)
    ?name:(name_ : can_signal_name option) ~length:(length_ : non_negative_integer)
    ~factor:(factor_ : double) ~offset:(offset_ : double)
    ~start_bit:(start_bit_ : non_negative_integer)
    ~is_signed:(is_signed_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~is_big_endian:(is_big_endian_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~message_id:(message_id_ : non_negative_integer) () =
  ({
     signal_value_type = signal_value_type_;
     name = name_;
     length = length_;
     factor = factor_;
     offset = offset_;
     start_bit = start_bit_;
     is_signed = is_signed_;
     is_big_endian = is_big_endian_;
     message_id = message_id_;
   }
    : can_signal)

let make_obd_signal ?signal_value_type:(signal_value_type_ : signal_value_type option)
    ?is_signed:(is_signed_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?bit_mask_length:(bit_mask_length_ : obd_bitmask_length option)
    ?bit_right_shift:(bit_right_shift_ : non_negative_integer option)
    ~byte_length:(byte_length_ : obd_byte_length) ~start_byte:(start_byte_ : non_negative_integer)
    ~offset:(offset_ : double) ~scaling:(scaling_ : double) ~pid:(pid_ : non_negative_integer)
    ~service_mode:(service_mode_ : non_negative_integer)
    ~pid_response_length:(pid_response_length_ : positive_integer) () =
  ({
     signal_value_type = signal_value_type_;
     is_signed = is_signed_;
     bit_mask_length = bit_mask_length_;
     bit_right_shift = bit_right_shift_;
     byte_length = byte_length_;
     start_byte = start_byte_;
     offset = offset_;
     scaling = scaling_;
     pid = pid_;
     service_mode = service_mode_;
     pid_response_length = pid_response_length_;
   }
    : obd_signal)

let make_ros2_primitive_message_definition ?upper_bound:(upper_bound_ : max_string_size option)
    ?scaling:(scaling_ : double option) ?offset:(offset_ : double option)
    ~primitive_type:(primitive_type_ : ros2_primitive_type) () =
  ({
     upper_bound = upper_bound_;
     scaling = scaling_;
     offset = offset_;
     primitive_type = primitive_type_;
   }
    : ros2_primitive_message_definition)

let make_structured_message_field_name_and_data_type_pair
    ~data_type:(data_type_ : structured_message) ~field_name:(field_name_ : structure_message_name)
    () =
  ({ data_type = data_type_; field_name = field_name_ }
    : structured_message_field_name_and_data_type_pair)

let make_structured_message_list_definition ?capacity:(capacity_ : non_negative_integer option)
    ~list_type:(list_type_ : structured_message_list_type)
    ~member_type:(member_type_ : structured_message) ~name:(name_ : structure_message_name) () =
  ({ capacity = capacity_; list_type = list_type_; member_type = member_type_; name = name_ }
    : structured_message_list_definition)

let make_message_signal ~structured_message:(structured_message_ : structured_message)
    ~topic_name:(topic_name_ : topic_name) () =
  ({ structured_message = structured_message_; topic_name = topic_name_ } : message_signal)

let make_custom_decoding_signal ~id:(id_ : custom_decoding_id) () =
  ({ id = id_ } : custom_decoding_signal)

let make_signal_decoder
    ?custom_decoding_signal:(custom_decoding_signal_ : custom_decoding_signal option)
    ?message_signal:(message_signal_ : message_signal option)
    ?obd_signal:(obd_signal_ : obd_signal option) ?can_signal:(can_signal_ : can_signal option)
    ~interface_id:(interface_id_ : interface_id) ~type_:(type__ : signal_decoder_type)
    ~fully_qualified_name:(fully_qualified_name_ : fully_qualified_name) () =
  ({
     custom_decoding_signal = custom_decoding_signal_;
     message_signal = message_signal_;
     obd_signal = obd_signal_;
     can_signal = can_signal_;
     interface_id = interface_id_;
     type_ = type__;
     fully_qualified_name = fully_qualified_name_;
   }
    : signal_decoder)

let make_can_interface ?protocol_version:(protocol_version_ : protocol_version option)
    ?protocol_name:(protocol_name_ : protocol_name option) ~name:(name_ : can_interface_name) () =
  ({ protocol_version = protocol_version_; protocol_name = protocol_name_; name = name_ }
    : can_interface)

let make_obd_interface
    ?has_transmission_ecu:
      (has_transmission_ecu_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?use_extended_ids:(use_extended_ids_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?dtc_request_interval_seconds:(dtc_request_interval_seconds_ : non_negative_integer option)
    ?pid_request_interval_seconds:(pid_request_interval_seconds_ : non_negative_integer option)
    ?obd_standard:(obd_standard_ : obd_standard option)
    ~request_message_id:(request_message_id_ : non_negative_integer)
    ~name:(name_ : obd_interface_name) () =
  ({
     has_transmission_ecu = has_transmission_ecu_;
     use_extended_ids = use_extended_ids_;
     dtc_request_interval_seconds = dtc_request_interval_seconds_;
     pid_request_interval_seconds = pid_request_interval_seconds_;
     obd_standard = obd_standard_;
     request_message_id = request_message_id_;
     name = name_;
   }
    : obd_interface)

let make_custom_decoding_interface ~name:(name_ : custom_decoding_signal_interface_name) () =
  ({ name = name_ } : custom_decoding_interface)

let make_network_interface
    ?custom_decoding_interface:(custom_decoding_interface_ : custom_decoding_interface option)
    ?vehicle_middleware:(vehicle_middleware_ : vehicle_middleware option)
    ?obd_interface:(obd_interface_ : obd_interface option)
    ?can_interface:(can_interface_ : can_interface option) ~type_:(type__ : network_interface_type)
    ~interface_id:(interface_id_ : interface_id) () =
  ({
     custom_decoding_interface = custom_decoding_interface_;
     vehicle_middleware = vehicle_middleware_;
     obd_interface = obd_interface_;
     can_interface = can_interface_;
     type_ = type__;
     interface_id = interface_id_;
   }
    : network_interface)

let make_update_decoder_manifest_request
    ?default_for_unmapped_signals:
      (default_for_unmapped_signals_ : default_for_unmapped_signals_type option)
    ?status:(status_ : manifest_status option)
    ?network_interfaces_to_remove:(network_interfaces_to_remove_ : interface_ids option)
    ?network_interfaces_to_update:(network_interfaces_to_update_ : network_interfaces option)
    ?network_interfaces_to_add:(network_interfaces_to_add_ : network_interfaces option)
    ?signal_decoders_to_remove:(signal_decoders_to_remove_ : fqns option)
    ?signal_decoders_to_update:(signal_decoders_to_update_ : signal_decoders option)
    ?signal_decoders_to_add:(signal_decoders_to_add_ : signal_decoders option)
    ?description:(description_ : description option) ~name:(name_ : resource_name) () =
  ({
     default_for_unmapped_signals = default_for_unmapped_signals_;
     status = status_;
     network_interfaces_to_remove = network_interfaces_to_remove_;
     network_interfaces_to_update = network_interfaces_to_update_;
     network_interfaces_to_add = network_interfaces_to_add_;
     signal_decoders_to_remove = signal_decoders_to_remove_;
     signal_decoders_to_update = signal_decoders_to_update_;
     signal_decoders_to_add = signal_decoders_to_add_;
     description = description_;
     name = name_;
   }
    : update_decoder_manifest_request)

let make_invalid_signal_decoder ?hint:(hint_ : message option)
    ?reason:(reason_ : signal_decoder_failure_reason option)
    ?name:(name_ : fully_qualified_name option) () =
  ({ hint = hint_; reason = reason_; name = name_ } : invalid_signal_decoder)

let make_invalid_network_interface ?reason:(reason_ : network_interface_failure_reason option)
    ?interface_id:(interface_id_ : interface_id option) () =
  ({ reason = reason_; interface_id = interface_id_ } : invalid_network_interface)

let make_update_campaign_response ?status:(status_ : campaign_status option)
    ?name:(name_ : campaign_name option) ?arn:(arn_ : campaign_arn option) () =
  ({ status = status_; name = name_; arn = arn_ } : update_campaign_response)

let make_update_campaign_request
    ?data_extra_dimensions:(data_extra_dimensions_ : data_extra_dimension_node_path_list option)
    ?description:(description_ : description option) ~action:(action_ : update_campaign_action)
    ~name:(name_ : campaign_name) () =
  ({
     action = action_;
     data_extra_dimensions = data_extra_dimensions_;
     description = description_;
     name = name_;
   }
    : update_campaign_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_timestream_resources
    ~timestream_table_name:(timestream_table_name_ : timestream_table_name)
    ~timestream_database_name:(timestream_database_name_ : timestream_database_name) () =
  ({
     timestream_table_name = timestream_table_name_;
     timestream_database_name = timestream_database_name_;
   }
    : timestream_resources)

let make_timestream_registration_response ?error_message:(error_message_ : error_message option)
    ?timestream_table_arn:(timestream_table_arn_ : arn option)
    ?timestream_database_arn:(timestream_database_arn_ : arn option)
    ~registration_status:(registration_status_ : registration_status)
    ~timestream_table_name:(timestream_table_name_ : timestream_table_name)
    ~timestream_database_name:(timestream_database_name_ : timestream_database_name) () =
  ({
     error_message = error_message_;
     registration_status = registration_status_;
     timestream_table_arn = timestream_table_arn_;
     timestream_database_arn = timestream_database_arn_;
     timestream_table_name = timestream_table_name_;
     timestream_database_name = timestream_database_name_;
   }
    : timestream_registration_response)

let make_timestream_config ~execution_role_arn:(execution_role_arn_ : iam_role_arn)
    ~timestream_table_arn:(timestream_table_arn_ : timestream_table_arn) () =
  ({ execution_role_arn = execution_role_arn_; timestream_table_arn = timestream_table_arn_ }
    : timestream_config)

let make_time_based_signal_fetch_config
    ~execution_frequency_ms:(execution_frequency_ms_ : positive_long) () =
  ({ execution_frequency_ms = execution_frequency_ms_ } : time_based_signal_fetch_config)

let make_time_based_collection_scheme ~period_ms:(period_ms_ : collection_period_ms) () =
  ({ period_ms = period_ms_ } : time_based_collection_scheme)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_storage_minimum_time_to_live ~value:(value_ : storage_minimum_time_to_live_value)
    ~unit_:(unit__ : storage_minimum_time_to_live_unit) () =
  ({ value = value_; unit_ = unit__ } : storage_minimum_time_to_live)

let make_storage_maximum_size ~value:(value_ : storage_maximum_size_value)
    ~unit_:(unit__ : storage_maximum_size_unit) () =
  ({ value = value_; unit_ = unit__ } : storage_maximum_size)

let make_state_template_summary ?id:(id_ : resource_unique_id option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?description:(description_ : description option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option) ?arn:(arn_ : arn option)
    ?name:(name_ : resource_name option) () =
  ({
     id = id_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     description = description_;
     signal_catalog_arn = signal_catalog_arn_;
     arn = arn_;
     name = name_;
   }
    : state_template_summary)

let make_signal_information ?data_partition_id:(data_partition_id_ : data_partition_id option)
    ?minimum_sampling_interval_ms:(minimum_sampling_interval_ms_ : uint32 option)
    ?max_sample_count:(max_sample_count_ : max_sample_count option)
    ~name:(name_ : wildcard_signal_name) () =
  ({
     data_partition_id = data_partition_id_;
     minimum_sampling_interval_ms = minimum_sampling_interval_ms_;
     max_sample_count = max_sample_count_;
     name = name_;
   }
    : signal_information)

let make_condition_based_signal_fetch_config ~trigger_mode:(trigger_mode_ : trigger_mode)
    ~condition_expression:(condition_expression_ : fetch_config_event_expression) () =
  ({ trigger_mode = trigger_mode_; condition_expression = condition_expression_ }
    : condition_based_signal_fetch_config)

let make_signal_fetch_information
    ?condition_language_version:(condition_language_version_ : language_version option)
    ~actions:(actions_ : event_expression_list)
    ~signal_fetch_config:(signal_fetch_config_ : signal_fetch_config)
    ~fully_qualified_name:(fully_qualified_name_ : node_path) () =
  ({
     actions = actions_;
     condition_language_version = condition_language_version_;
     signal_fetch_config = signal_fetch_config_;
     fully_qualified_name = fully_qualified_name_;
   }
    : signal_fetch_information)

let make_s3_config ?prefix:(prefix_ : prefix option)
    ?storage_compression_format:(storage_compression_format_ : storage_compression_format option)
    ?data_format:(data_format_ : data_format option) ~bucket_arn:(bucket_arn_ : s3_bucket_arn) () =
  ({
     prefix = prefix_;
     storage_compression_format = storage_compression_format_;
     data_format = data_format_;
     bucket_arn = bucket_arn_;
   }
    : s3_config)

let make_iam_resources ~role_arn:(role_arn_ : iam_role_arn) () =
  ({ role_arn = role_arn_ } : iam_resources)

let make_register_account_response
    ?timestream_resources:(timestream_resources_ : timestream_resources option)
    ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~iam_resources:(iam_resources_ : iam_resources)
    ~register_account_status:(register_account_status_ : registration_status) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     iam_resources = iam_resources_;
     timestream_resources = timestream_resources_;
     register_account_status = register_account_status_;
   }
    : register_account_response)

let make_register_account_request ?iam_resources:(iam_resources_ : iam_resources option)
    ?timestream_resources:(timestream_resources_ : timestream_resources option) () =
  ({ iam_resources = iam_resources_; timestream_resources = timestream_resources_ }
    : register_account_request)

let make_put_logging_options_response () = (() : unit)

let make_cloud_watch_log_delivery_options
    ?log_group_name:(log_group_name_ : cloud_watch_log_group_name option)
    ~log_type:(log_type_ : log_type) () =
  ({ log_group_name = log_group_name_; log_type = log_type_ } : cloud_watch_log_delivery_options)

let make_put_logging_options_request
    ~cloud_watch_log_delivery:(cloud_watch_log_delivery_ : cloud_watch_log_delivery_options) () =
  ({ cloud_watch_log_delivery = cloud_watch_log_delivery_ } : put_logging_options_request)

let make_put_encryption_configuration_response
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~encryption_type:(encryption_type_ : encryption_type)
    ~encryption_status:(encryption_status_ : encryption_status) () =
  ({
     encryption_type = encryption_type_;
     encryption_status = encryption_status_;
     kms_key_id = kms_key_id_;
   }
    : put_encryption_configuration_response)

let make_put_encryption_configuration_request
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~encryption_type:(encryption_type_ : encryption_type) () =
  ({ encryption_type = encryption_type_; kms_key_id = kms_key_id_ }
    : put_encryption_configuration_request)

let make_node_counts ?total_properties:(total_properties_ : number option)
    ?total_structs:(total_structs_ : number option)
    ?total_actuators:(total_actuators_ : number option)
    ?total_attributes:(total_attributes_ : number option)
    ?total_sensors:(total_sensors_ : number option)
    ?total_branches:(total_branches_ : number option) ?total_nodes:(total_nodes_ : number option) ()
    =
  ({
     total_properties = total_properties_;
     total_structs = total_structs_;
     total_actuators = total_actuators_;
     total_attributes = total_attributes_;
     total_sensors = total_sensors_;
     total_branches = total_branches_;
     total_nodes = total_nodes_;
   }
    : node_counts)

let make_can_dbc_definition ?signals_map:(signals_map_ : model_signals_map option)
    ~can_dbc_files:(can_dbc_files_ : network_files_list)
    ~network_interface:(network_interface_ : interface_id) () =
  ({
     signals_map = signals_map_;
     can_dbc_files = can_dbc_files_;
     network_interface = network_interface_;
   }
    : can_dbc_definition)

let make_mqtt_topic_config ~execution_role_arn:(execution_role_arn_ : iam_role_arn)
    ~mqtt_topic_arn:(mqtt_topic_arn_ : mqtt_topic_arn) () =
  ({ execution_role_arn = execution_role_arn_; mqtt_topic_arn = mqtt_topic_arn_ }
    : mqtt_topic_config)

let make_list_vehicles_response ?next_token:(next_token_ : next_token option)
    ?vehicle_summaries:(vehicle_summaries_ : vehicle_summaries option) () =
  ({ next_token = next_token_; vehicle_summaries = vehicle_summaries_ } : list_vehicles_response)

let make_list_vehicles_request
    ?list_response_scope:(list_response_scope_ : list_response_scope option)
    ?max_results:(max_results_ : list_vehicles_max_results option)
    ?next_token:(next_token_ : next_token option)
    ?attribute_values:(attribute_values_ : attribute_values_list option)
    ?attribute_names:(attribute_names_ : attribute_names_list option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option) () =
  ({
     list_response_scope = list_response_scope_;
     max_results = max_results_;
     next_token = next_token_;
     attribute_values = attribute_values_;
     attribute_names = attribute_names_;
     model_manifest_arn = model_manifest_arn_;
   }
    : list_vehicles_request)

let make_list_vehicles_in_fleet_response ?next_token:(next_token_ : next_token option)
    ?vehicles:(vehicles_ : vehicles option) () =
  ({ next_token = next_token_; vehicles = vehicles_ } : list_vehicles_in_fleet_response)

let make_list_vehicles_in_fleet_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ max_results = max_results_; next_token = next_token_; fleet_id = fleet_id_ }
    : list_vehicles_in_fleet_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_state_templates_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : state_template_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_state_templates_response)

let make_list_state_templates_request
    ?list_response_scope:(list_response_scope_ : list_response_scope option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     list_response_scope = list_response_scope_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_state_templates_request)

let make_list_signal_catalogs_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : signal_catalog_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_signal_catalogs_response)

let make_list_signal_catalogs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_signal_catalogs_request)

let make_list_signal_catalog_nodes_response ?next_token:(next_token_ : next_token option)
    ?nodes:(nodes_ : nodes option) () =
  ({ next_token = next_token_; nodes = nodes_ } : list_signal_catalog_nodes_response)

let make_list_signal_catalog_nodes_request
    ?signal_node_type:(signal_node_type_ : signal_node_type option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~name:(name_ : resource_name) () =
  ({
     signal_node_type = signal_node_type_;
     max_results = max_results_;
     next_token = next_token_;
     name = name_;
   }
    : list_signal_catalog_nodes_request)

let make_list_model_manifests_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : model_manifest_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_model_manifests_response)

let make_list_model_manifests_request
    ?list_response_scope:(list_response_scope_ : list_response_scope option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option) () =
  ({
     list_response_scope = list_response_scope_;
     max_results = max_results_;
     next_token = next_token_;
     signal_catalog_arn = signal_catalog_arn_;
   }
    : list_model_manifests_request)

let make_list_model_manifest_nodes_response ?next_token:(next_token_ : next_token option)
    ?nodes:(nodes_ : nodes option) () =
  ({ next_token = next_token_; nodes = nodes_ } : list_model_manifest_nodes_response)

let make_list_model_manifest_nodes_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~name:(name_ : resource_name) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ }
    : list_model_manifest_nodes_request)

let make_list_fleets_response ?next_token:(next_token_ : next_token option)
    ?fleet_summaries:(fleet_summaries_ : fleet_summaries option) () =
  ({ next_token = next_token_; fleet_summaries = fleet_summaries_ } : list_fleets_response)

let make_list_fleets_request
    ?list_response_scope:(list_response_scope_ : list_response_scope option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     list_response_scope = list_response_scope_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_fleets_request)

let make_list_fleets_for_vehicle_response ?next_token:(next_token_ : next_token option)
    ?fleets:(fleets_ : fleets option) () =
  ({ next_token = next_token_; fleets = fleets_ } : list_fleets_for_vehicle_response)

let make_list_fleets_for_vehicle_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ max_results = max_results_; next_token = next_token_; vehicle_name = vehicle_name_ }
    : list_fleets_for_vehicle_request)

let make_list_decoder_manifests_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : decoder_manifest_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : list_decoder_manifests_response)

let make_list_decoder_manifests_request
    ?list_response_scope:(list_response_scope_ : list_response_scope option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option) () =
  ({
     list_response_scope = list_response_scope_;
     max_results = max_results_;
     next_token = next_token_;
     model_manifest_arn = model_manifest_arn_;
   }
    : list_decoder_manifests_request)

let make_list_decoder_manifest_signals_response ?next_token:(next_token_ : next_token option)
    ?signal_decoders:(signal_decoders_ : signal_decoders option) () =
  ({ next_token = next_token_; signal_decoders = signal_decoders_ }
    : list_decoder_manifest_signals_response)

let make_list_decoder_manifest_signals_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~name:(name_ : resource_name) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ }
    : list_decoder_manifest_signals_request)

let make_list_decoder_manifest_network_interfaces_response
    ?next_token:(next_token_ : next_token option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option) () =
  ({ next_token = next_token_; network_interfaces = network_interfaces_ }
    : list_decoder_manifest_network_interfaces_response)

let make_list_decoder_manifest_network_interfaces_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~name:(name_ : resource_name) () =
  ({ max_results = max_results_; next_token = next_token_; name = name_ }
    : list_decoder_manifest_network_interfaces_request)

let make_list_campaigns_response ?next_token:(next_token_ : next_token option)
    ?campaign_summaries:(campaign_summaries_ : campaign_summaries option) () =
  ({ next_token = next_token_; campaign_summaries = campaign_summaries_ } : list_campaigns_response)

let make_list_campaigns_request
    ?list_response_scope:(list_response_scope_ : list_response_scope option)
    ?status:(status_ : status_str option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     list_response_scope = list_response_scope_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_campaigns_request)

let make_get_vehicle_status_response ?next_token:(next_token_ : next_token option)
    ?campaigns:(campaigns_ : vehicle_status_list option) () =
  ({ next_token = next_token_; campaigns = campaigns_ } : get_vehicle_status_response)

let make_get_vehicle_status_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ vehicle_name = vehicle_name_; max_results = max_results_; next_token = next_token_ }
    : get_vehicle_status_request)

let make_iam_registration_response ?error_message:(error_message_ : error_message option)
    ~registration_status:(registration_status_ : registration_status) ~role_arn:(role_arn_ : arn) ()
    =
  ({
     error_message = error_message_;
     registration_status = registration_status_;
     role_arn = role_arn_;
   }
    : iam_registration_response)

let make_get_register_account_status_response
    ?timestream_registration_response:
      (timestream_registration_response_ : timestream_registration_response option)
    ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp)
    ~iam_registration_response:(iam_registration_response_ : iam_registration_response)
    ~account_status:(account_status_ : registration_status)
    ~customer_account_id:(customer_account_id_ : customer_account_id) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     iam_registration_response = iam_registration_response_;
     timestream_registration_response = timestream_registration_response_;
     account_status = account_status_;
     customer_account_id = customer_account_id_;
   }
    : get_register_account_status_response)

let make_get_register_account_status_request () = (() : unit)

let make_get_logging_options_response
    ~cloud_watch_log_delivery:(cloud_watch_log_delivery_ : cloud_watch_log_delivery_options) () =
  ({ cloud_watch_log_delivery = cloud_watch_log_delivery_ } : get_logging_options_response)

let make_get_logging_options_request () = (() : unit)

let make_get_encryption_configuration_response
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?error_message:(error_message_ : error_message option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~encryption_type:(encryption_type_ : encryption_type)
    ~encryption_status:(encryption_status_ : encryption_status) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     error_message = error_message_;
     encryption_type = encryption_type_;
     encryption_status = encryption_status_;
     kms_key_id = kms_key_id_;
   }
    : get_encryption_configuration_response)

let make_get_encryption_configuration_request () = (() : unit)

let make_batch_update_vehicle_response ?errors:(errors_ : update_vehicle_errors option)
    ?vehicles:(vehicles_ : update_vehicle_response_items option) () =
  ({ errors = errors_; vehicles = vehicles_ } : batch_update_vehicle_response)

let make_batch_update_vehicle_request ~vehicles:(vehicles_ : update_vehicle_request_items) () =
  ({ vehicles = vehicles_ } : batch_update_vehicle_request)

let make_batch_create_vehicle_response ?errors:(errors_ : create_vehicle_errors option)
    ?vehicles:(vehicles_ : create_vehicle_responses option) () =
  ({ errors = errors_; vehicles = vehicles_ } : batch_create_vehicle_response)

let make_batch_create_vehicle_request ~vehicles:(vehicles_ : create_vehicle_request_items) () =
  ({ vehicles = vehicles_ } : batch_create_vehicle_request)

let make_import_signal_catalog_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : import_signal_catalog_response)

let make_import_signal_catalog_request ?tags:(tags_ : tag_list option)
    ?vss:(vss_ : formatted_vss option) ?description:(description_ : description option)
    ~name:(name_ : resource_name) () =
  ({ tags = tags_; vss = vss_; description = description_; name = name_ }
    : import_signal_catalog_request)

let make_import_decoder_manifest_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : import_decoder_manifest_response)

let make_import_decoder_manifest_request
    ~network_file_definitions:(network_file_definitions_ : network_file_definitions)
    ~name:(name_ : resource_name) () =
  ({ network_file_definitions = network_file_definitions_; name = name_ }
    : import_decoder_manifest_request)

let make_get_vehicle_response ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?state_templates:(state_templates_ : state_template_associations option)
    ?attributes:(attributes_ : attributes_map option)
    ?decoder_manifest_arn:(decoder_manifest_arn_ : arn option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option) ?arn:(arn_ : arn option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     state_templates = state_templates_;
     attributes = attributes_;
     decoder_manifest_arn = decoder_manifest_arn_;
     model_manifest_arn = model_manifest_arn_;
     arn = arn_;
     vehicle_name = vehicle_name_;
   }
    : get_vehicle_response)

let make_get_vehicle_request ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ vehicle_name = vehicle_name_ } : get_vehicle_request)

let make_get_state_template_response ?id:(id_ : resource_unique_id option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?metadata_extra_dimensions:
      (metadata_extra_dimensions_ : state_template_metadata_extra_dimension_node_path_list option)
    ?data_extra_dimensions:
      (data_extra_dimensions_ : state_template_data_extra_dimension_node_path_list option)
    ?state_template_properties:(state_template_properties_ : state_template_properties option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?description:(description_ : description option) ?arn:(arn_ : arn option)
    ?name:(name_ : resource_name option) () =
  ({
     id = id_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     metadata_extra_dimensions = metadata_extra_dimensions_;
     data_extra_dimensions = data_extra_dimensions_;
     state_template_properties = state_template_properties_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : get_state_template_response)

let make_get_state_template_request ~identifier:(identifier_ : resource_identifier) () =
  ({ identifier = identifier_ } : get_state_template_request)

let make_get_signal_catalog_response ?node_counts:(node_counts_ : node_counts option)
    ?description:(description_ : description option)
    ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     node_counts = node_counts_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : get_signal_catalog_response)

let make_get_signal_catalog_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_signal_catalog_request)

let make_get_model_manifest_response ?status:(status_ : manifest_status option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?description:(description_ : description option)
    ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : get_model_manifest_response)

let make_get_model_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_model_manifest_request)

let make_get_fleet_response ?description:(description_ : description option)
    ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~signal_catalog_arn:(signal_catalog_arn_ : arn)
    ~arn:(arn_ : arn) ~id:(id_ : fleet_id) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     arn = arn_;
     id = id_;
   }
    : get_fleet_response)

let make_get_fleet_request ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ fleet_id = fleet_id_ } : get_fleet_request)

let make_get_decoder_manifest_response ?message:(message_ : message option)
    ?status:(status_ : manifest_status option)
    ?model_manifest_arn:(model_manifest_arn_ : arn option)
    ?description:(description_ : description option)
    ~last_modification_time:(last_modification_time_ : timestamp)
    ~creation_time:(creation_time_ : timestamp) ~arn:(arn_ : arn) ~name:(name_ : string_) () =
  ({
     message = message_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     model_manifest_arn = model_manifest_arn_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : get_decoder_manifest_response)

let make_get_decoder_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_decoder_manifest_request)

let make_condition_based_collection_scheme
    ?condition_language_version:(condition_language_version_ : language_version option)
    ?trigger_mode:(trigger_mode_ : trigger_mode option)
    ?minimum_trigger_interval_ms:(minimum_trigger_interval_ms_ : uint32 option)
    ~expression:(expression_ : event_expression) () =
  ({
     condition_language_version = condition_language_version_;
     trigger_mode = trigger_mode_;
     minimum_trigger_interval_ms = minimum_trigger_interval_ms_;
     expression = expression_;
   }
    : condition_based_collection_scheme)

let make_data_partition_storage_options
    ~minimum_time_to_live:(minimum_time_to_live_ : storage_minimum_time_to_live)
    ~storage_location:(storage_location_ : storage_location)
    ~maximum_size:(maximum_size_ : storage_maximum_size) () =
  ({
     minimum_time_to_live = minimum_time_to_live_;
     storage_location = storage_location_;
     maximum_size = maximum_size_;
   }
    : data_partition_storage_options)

let make_data_partition_upload_options
    ?condition_language_version:(condition_language_version_ : language_version option)
    ~expression:(expression_ : event_expression) () =
  ({ condition_language_version = condition_language_version_; expression = expression_ }
    : data_partition_upload_options)

let make_data_partition ?upload_options:(upload_options_ : data_partition_upload_options option)
    ~storage_options:(storage_options_ : data_partition_storage_options)
    ~id:(id_ : data_partition_id) () =
  ({ upload_options = upload_options_; storage_options = storage_options_; id = id_ }
    : data_partition)

let make_get_campaign_response
    ?signals_to_fetch:(signals_to_fetch_ : signal_fetch_information_list option)
    ?data_partitions:(data_partitions_ : data_partitions option)
    ?data_destination_configs:(data_destination_configs_ : data_destination_configs option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?data_extra_dimensions:(data_extra_dimensions_ : data_extra_dimension_node_path_list option)
    ?collection_scheme:(collection_scheme_ : collection_scheme option)
    ?signals_to_collect:(signals_to_collect_ : signal_information_list option)
    ?priority:(priority_ : priority option) ?compression:(compression_ : compression option)
    ?spooling_mode:(spooling_mode_ : spooling_mode option)
    ?diagnostics_mode:(diagnostics_mode_ : diagnostics_mode option)
    ?post_trigger_collection_duration:(post_trigger_collection_duration_ : uint32 option)
    ?expiry_time:(expiry_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?status:(status_ : campaign_status option) ?target_arn:(target_arn_ : arn option)
    ?signal_catalog_arn:(signal_catalog_arn_ : arn option)
    ?description:(description_ : description option) ?arn:(arn_ : campaign_arn option)
    ?name:(name_ : campaign_name option) () =
  ({
     signals_to_fetch = signals_to_fetch_;
     data_partitions = data_partitions_;
     data_destination_configs = data_destination_configs_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     data_extra_dimensions = data_extra_dimensions_;
     collection_scheme = collection_scheme_;
     signals_to_collect = signals_to_collect_;
     priority = priority_;
     compression = compression_;
     spooling_mode = spooling_mode_;
     diagnostics_mode = diagnostics_mode_;
     post_trigger_collection_duration = post_trigger_collection_duration_;
     expiry_time = expiry_time_;
     start_time = start_time_;
     status = status_;
     target_arn = target_arn_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : get_campaign_response)

let make_get_campaign_request ~name:(name_ : campaign_name) () =
  ({ name = name_ } : get_campaign_request)

let make_disassociate_vehicle_fleet_response () = (() : unit)

let make_disassociate_vehicle_fleet_request ~fleet_id:(fleet_id_ : fleet_id)
    ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ fleet_id = fleet_id_; vehicle_name = vehicle_name_ } : disassociate_vehicle_fleet_request)

let make_delete_vehicle_response ~arn:(arn_ : arn) ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ arn = arn_; vehicle_name = vehicle_name_ } : delete_vehicle_response)

let make_delete_vehicle_request ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ vehicle_name = vehicle_name_ } : delete_vehicle_request)

let make_delete_state_template_response ?id:(id_ : resource_unique_id option)
    ?arn:(arn_ : arn option) ?name:(name_ : resource_name option) () =
  ({ id = id_; arn = arn_; name = name_ } : delete_state_template_response)

let make_delete_state_template_request ~identifier:(identifier_ : resource_identifier) () =
  ({ identifier = identifier_ } : delete_state_template_request)

let make_delete_signal_catalog_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : delete_signal_catalog_response)

let make_delete_signal_catalog_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_signal_catalog_request)

let make_delete_model_manifest_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : delete_model_manifest_response)

let make_delete_model_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_model_manifest_request)

let make_delete_fleet_response ?arn:(arn_ : arn option) ?id:(id_ : fleet_id option) () =
  ({ arn = arn_; id = id_ } : delete_fleet_response)

let make_delete_fleet_request ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ fleet_id = fleet_id_ } : delete_fleet_request)

let make_delete_decoder_manifest_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : delete_decoder_manifest_response)

let make_delete_decoder_manifest_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_decoder_manifest_request)

let make_delete_campaign_response ?arn:(arn_ : campaign_arn option)
    ?name:(name_ : campaign_name option) () =
  ({ arn = arn_; name = name_ } : delete_campaign_response)

let make_delete_campaign_request ~name:(name_ : campaign_name) () =
  ({ name = name_ } : delete_campaign_request)

let make_create_vehicle_response ?thing_arn:(thing_arn_ : arn option) ?arn:(arn_ : arn option)
    ?vehicle_name:(vehicle_name_ : vehicle_name option) () =
  ({ thing_arn = thing_arn_; arn = arn_; vehicle_name = vehicle_name_ } : create_vehicle_response)

let make_create_vehicle_request
    ?state_templates:(state_templates_ : state_template_associations option)
    ?tags:(tags_ : tag_list option)
    ?association_behavior:(association_behavior_ : vehicle_association_behavior option)
    ?attributes:(attributes_ : attributes_map option)
    ~decoder_manifest_arn:(decoder_manifest_arn_ : arn)
    ~model_manifest_arn:(model_manifest_arn_ : arn) ~vehicle_name:(vehicle_name_ : vehicle_name) ()
    =
  ({
     state_templates = state_templates_;
     tags = tags_;
     association_behavior = association_behavior_;
     attributes = attributes_;
     decoder_manifest_arn = decoder_manifest_arn_;
     model_manifest_arn = model_manifest_arn_;
     vehicle_name = vehicle_name_;
   }
    : create_vehicle_request)

let make_create_state_template_response ?id:(id_ : resource_unique_id option)
    ?arn:(arn_ : arn option) ?name:(name_ : resource_name option) () =
  ({ id = id_; arn = arn_; name = name_ } : create_state_template_response)

let make_create_state_template_request ?tags:(tags_ : tag_list option)
    ?metadata_extra_dimensions:
      (metadata_extra_dimensions_ : state_template_metadata_extra_dimension_node_path_list option)
    ?data_extra_dimensions:
      (data_extra_dimensions_ : state_template_data_extra_dimension_node_path_list option)
    ?description:(description_ : description option)
    ~state_template_properties:(state_template_properties_ : state_template_properties)
    ~signal_catalog_arn:(signal_catalog_arn_ : arn) ~name:(name_ : resource_name) () =
  ({
     tags = tags_;
     metadata_extra_dimensions = metadata_extra_dimensions_;
     data_extra_dimensions = data_extra_dimensions_;
     state_template_properties = state_template_properties_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     name = name_;
   }
    : create_state_template_request)

let make_create_signal_catalog_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : create_signal_catalog_response)

let make_create_signal_catalog_request ?tags:(tags_ : tag_list option)
    ?nodes:(nodes_ : nodes option) ?description:(description_ : description option)
    ~name:(name_ : resource_name) () =
  ({ tags = tags_; nodes = nodes_; description = description_; name = name_ }
    : create_signal_catalog_request)

let make_create_model_manifest_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : create_model_manifest_response)

let make_create_model_manifest_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ~signal_catalog_arn:(signal_catalog_arn_ : arn)
    ~nodes:(nodes_ : list_of_strings) ~name:(name_ : resource_name) () =
  ({
     tags = tags_;
     signal_catalog_arn = signal_catalog_arn_;
     nodes = nodes_;
     description = description_;
     name = name_;
   }
    : create_model_manifest_request)

let make_create_fleet_response ~arn:(arn_ : arn) ~id:(id_ : fleet_id) () =
  ({ arn = arn_; id = id_ } : create_fleet_response)

let make_create_fleet_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : description option) ~signal_catalog_arn:(signal_catalog_arn_ : arn)
    ~fleet_id:(fleet_id_ : fleet_id) () =
  ({
     tags = tags_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     fleet_id = fleet_id_;
   }
    : create_fleet_request)

let make_create_decoder_manifest_response ~arn:(arn_ : arn) ~name:(name_ : resource_name) () =
  ({ arn = arn_; name = name_ } : create_decoder_manifest_response)

let make_create_decoder_manifest_request ?tags:(tags_ : tag_list option)
    ?default_for_unmapped_signals:
      (default_for_unmapped_signals_ : default_for_unmapped_signals_type option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?signal_decoders:(signal_decoders_ : signal_decoders option)
    ?description:(description_ : description option) ~model_manifest_arn:(model_manifest_arn_ : arn)
    ~name:(name_ : resource_name) () =
  ({
     tags = tags_;
     default_for_unmapped_signals = default_for_unmapped_signals_;
     network_interfaces = network_interfaces_;
     signal_decoders = signal_decoders_;
     model_manifest_arn = model_manifest_arn_;
     description = description_;
     name = name_;
   }
    : create_decoder_manifest_request)

let make_create_campaign_response ?arn:(arn_ : campaign_arn option)
    ?name:(name_ : campaign_name option) () =
  ({ arn = arn_; name = name_ } : create_campaign_response)

let make_create_campaign_request
    ?signals_to_fetch:(signals_to_fetch_ : signal_fetch_information_list option)
    ?data_partitions:(data_partitions_ : data_partitions option)
    ?data_destination_configs:(data_destination_configs_ : data_destination_configs option)
    ?tags:(tags_ : tag_list option)
    ?data_extra_dimensions:(data_extra_dimensions_ : data_extra_dimension_node_path_list option)
    ?signals_to_collect:(signals_to_collect_ : signal_information_list option)
    ?priority:(priority_ : priority option) ?compression:(compression_ : compression option)
    ?spooling_mode:(spooling_mode_ : spooling_mode option)
    ?diagnostics_mode:(diagnostics_mode_ : diagnostics_mode option)
    ?post_trigger_collection_duration:(post_trigger_collection_duration_ : uint32 option)
    ?expiry_time:(expiry_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?description:(description_ : description option)
    ~collection_scheme:(collection_scheme_ : collection_scheme) ~target_arn:(target_arn_ : arn)
    ~signal_catalog_arn:(signal_catalog_arn_ : arn) ~name:(name_ : campaign_name) () =
  ({
     signals_to_fetch = signals_to_fetch_;
     data_partitions = data_partitions_;
     data_destination_configs = data_destination_configs_;
     tags = tags_;
     data_extra_dimensions = data_extra_dimensions_;
     collection_scheme = collection_scheme_;
     signals_to_collect = signals_to_collect_;
     priority = priority_;
     compression = compression_;
     spooling_mode = spooling_mode_;
     diagnostics_mode = diagnostics_mode_;
     post_trigger_collection_duration = post_trigger_collection_duration_;
     expiry_time = expiry_time_;
     start_time = start_time_;
     target_arn = target_arn_;
     signal_catalog_arn = signal_catalog_arn_;
     description = description_;
     name = name_;
   }
    : create_campaign_request)

let make_associate_vehicle_fleet_response () = (() : unit)

let make_associate_vehicle_fleet_request ~fleet_id:(fleet_id_ : fleet_id)
    ~vehicle_name:(vehicle_name_ : vehicle_name) () =
  ({ fleet_id = fleet_id_; vehicle_name = vehicle_name_ } : associate_vehicle_fleet_request)
