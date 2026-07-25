type nonrec string_ = string [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "You don't have sufficient permission to perform this action.\n"]

type nonrec node_path = string [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec list_of_strings = string_ list [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec node_data_type =
  | INT8 [@ocaml.doc ""]
  | UINT8 [@ocaml.doc ""]
  | INT16 [@ocaml.doc ""]
  | UINT16 [@ocaml.doc ""]
  | INT32 [@ocaml.doc ""]
  | UINT32 [@ocaml.doc ""]
  | INT64 [@ocaml.doc ""]
  | UINT64 [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | FLOAT [@ocaml.doc ""]
  | DOUBLE [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
  | UNIX_TIMESTAMP [@ocaml.doc ""]
  | INT8_ARRAY [@ocaml.doc ""]
  | UINT8_ARRAY [@ocaml.doc ""]
  | INT16_ARRAY [@ocaml.doc ""]
  | UINT16_ARRAY [@ocaml.doc ""]
  | INT32_ARRAY [@ocaml.doc ""]
  | UINT32_ARRAY [@ocaml.doc ""]
  | INT64_ARRAY [@ocaml.doc ""]
  | UINT64_ARRAY [@ocaml.doc ""]
  | BOOLEAN_ARRAY [@ocaml.doc ""]
  | FLOAT_ARRAY [@ocaml.doc ""]
  | DOUBLE_ARRAY [@ocaml.doc ""]
  | STRING_ARRAY [@ocaml.doc ""]
  | UNIX_TIMESTAMP_ARRAY [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | STRUCT [@ocaml.doc ""]
  | STRUCT_ARRAY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec actuator = {
  fully_qualified_name : string_;
      [@ocaml.doc
        "The fully qualified name of the actuator. For example, the fully qualified name of an \
         actuator might be [Vehicle.Front.Left.Door.Lock].\n"]
  data_type : node_data_type; [@ocaml.doc "The specified data type of the actuator. \n"]
  description : description option; [@ocaml.doc "A brief description of the actuator.\n"]
  unit_ : string_ option; [@ocaml.doc "The scientific unit for the actuator.\n"]
  allowed_values : list_of_strings option;
      [@ocaml.doc "A list of possible values an actuator can take.\n"]
  min : double option; [@ocaml.doc "The specified possible minimum value of an actuator.\n"]
  max : double option; [@ocaml.doc "The specified possible maximum value of an actuator.\n"]
  assigned_value : string_ option; [@ocaml.doc "A specified value for the actuator.\n"]
  deprecation_message : message option;
      [@ocaml.doc "The deprecation message for the node or the branch that was moved or deleted.\n"]
  comment : message option; [@ocaml.doc "A comment in addition to the description.\n"]
  struct_fully_qualified_name : node_path option;
      [@ocaml.doc
        "The fully qualified name of the struct node for the actuator if the data type of the \
         actuator is [Struct] or [StructArray]. For example, the struct fully qualified name of an \
         actuator might be [Vehicle.Door.LockStruct].\n"]
}
[@@ocaml.doc
  "A signal that represents a vehicle device such as the engine, heater, and door locks. Data from \
   an actuator reports the state of a certain vehicle device.\n\n\
  \   Updating actuator data can change the state of a device. For example, you can turn on or off \
   the heater by updating its actuator data.\n\
  \  \n\
  \   "]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the parameter field with the validation error.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message about the validation error.\n"]
}
[@@ocaml.doc
  "A validation error due to mismatch between the expected data type, length, or pattern of the \
   parameter and the input.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | UNKNOWN_OPERATION [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : string_; [@ocaml.doc ""]
  reason : validation_exception_reason option;
      [@ocaml.doc
        "The reason the input failed to satisfy the constraints specified by an Amazon Web \
         Services service.\n"]
  field_list : validation_exception_field_list option;
      [@ocaml.doc
        "The list of fields that fail to satisfy the constraints specified by an Amazon Web \
         Services service.\n"]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec retry_after_seconds = int [@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : string_; [@ocaml.doc ""]
  quota_code : string_ option;
      [@ocaml.doc "The quota identifier of the applied throttling rules for this request.\n"]
  service_code : string_ option;
      [@ocaml.doc "The code for the service that couldn't be completed due to throttling.\n"]
  retry_after_seconds : retry_after_seconds option;
      [@ocaml.doc "The number of seconds to wait before retrying the command.\n"]
}
[@@ocaml.doc "The request couldn't be completed due to throttling.\n"]

type nonrec resource_not_found_exception = {
  message : string_; [@ocaml.doc ""]
  resource_id : string_; [@ocaml.doc "The identifier of the resource that wasn't found.\n"]
  resource_type : string_; [@ocaml.doc "The type of resource that wasn't found.\n"]
}
[@@ocaml.doc "The resource wasn't found.\n"]

type nonrec limit_exceeded_exception = {
  message : string_; [@ocaml.doc ""]
  resource_id : string_; [@ocaml.doc "The identifier of the resource that was exceeded.\n"]
  resource_type : string_; [@ocaml.doc "The type of resource that was exceeded.\n"]
}
[@@ocaml.doc "A service quota was exceeded. \n"]

type nonrec internal_server_exception = {
  message : string_; [@ocaml.doc ""]
  retry_after_seconds : retry_after_seconds option;
      [@ocaml.doc "The number of seconds to wait before retrying the command.\n"]
}
[@@ocaml.doc "The request couldn't be completed because the server temporarily failed.\n"]

type nonrec associate_vehicle_fleet_response = unit [@@ocaml.doc ""]

type nonrec fleet_id = string [@@ocaml.doc ""]

type nonrec vehicle_name = string [@@ocaml.doc ""]

type nonrec associate_vehicle_fleet_request = {
  vehicle_name : vehicle_name;
      [@ocaml.doc " The unique ID of the vehicle to associate with the fleet. \n"]
  fleet_id : fleet_id; [@ocaml.doc " The ID of a fleet. \n"]
}
[@@ocaml.doc ""]

type nonrec attribute = {
  fully_qualified_name : string_;
      [@ocaml.doc
        "The fully qualified name of the attribute. For example, the fully qualified name of an \
         attribute might be [Vehicle.Body.Engine.Type].\n"]
  data_type : node_data_type; [@ocaml.doc "The specified data type of the attribute. \n"]
  description : description option; [@ocaml.doc "A brief description of the attribute.\n"]
  unit_ : string_ option; [@ocaml.doc "The scientific unit for the attribute.\n"]
  allowed_values : list_of_strings option;
      [@ocaml.doc "A list of possible values an attribute can be assigned.\n"]
  min : double option; [@ocaml.doc "The specified possible minimum value of the attribute.\n"]
  max : double option; [@ocaml.doc "The specified possible maximum value of the attribute.\n"]
  assigned_value : string_ option; [@ocaml.doc "A specified value for the attribute.\n"]
  default_value : string_ option; [@ocaml.doc "The default value of the attribute.\n"]
  deprecation_message : message option;
      [@ocaml.doc "The deprecation message for the node or the branch that was moved or deleted.\n"]
  comment : message option; [@ocaml.doc "A comment in addition to the description.\n"]
}
[@@ocaml.doc
  "A signal that represents static information about the vehicle, such as engine type or \
   manufacturing date.\n"]

type nonrec create_vehicle_error = {
  vehicle_name : vehicle_name option; [@ocaml.doc "The ID of the vehicle with the error.\n"]
  code : string_ option; [@ocaml.doc "An HTTP error code.\n"]
  message : string_ option; [@ocaml.doc "A description of the HTTP error.\n"]
}
[@@ocaml.doc "An HTTP error resulting from creating a vehicle.\n"]

type nonrec create_vehicle_errors = create_vehicle_error list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec create_vehicle_response_item = {
  vehicle_name : vehicle_name option; [@ocaml.doc "The unique ID of the vehicle to create.\n"]
  arn : arn option; [@ocaml.doc "The ARN of the created vehicle.\n"]
  thing_arn : arn option;
      [@ocaml.doc "The ARN of a created or validated Amazon Web Services IoT thing.\n"]
}
[@@ocaml.doc "Information about a created vehicle.\n"]

type nonrec create_vehicle_responses = create_vehicle_response_item list [@@ocaml.doc ""]

type nonrec batch_create_vehicle_response = {
  vehicles : create_vehicle_responses option;
      [@ocaml.doc
        " A list of information about a batch of created vehicles. For more information, see the \
         API data type.\n"]
  errors : create_vehicle_errors option;
      [@ocaml.doc
        "A list of information about creation errors, or an empty list if there aren't any errors. \n"]
}
[@@ocaml.doc ""]

type nonrec on_change_state_template_update_strategy = unit [@@ocaml.doc ""]

type nonrec positive_integer = int [@@ocaml.doc ""]

type nonrec time_unit =
  | MILLISECOND [@ocaml.doc ""]
  | SECOND [@ocaml.doc ""]
  | MINUTE [@ocaml.doc ""]
  | HOUR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec time_period = {
  unit_ : time_unit; [@ocaml.doc "A unit of time.\n"]
  value : positive_integer; [@ocaml.doc "A number of time units.\n"]
}
[@@ocaml.doc "The length of time between state template updates.\n"]

type nonrec periodic_state_template_update_strategy = {
  state_template_update_rate : time_period; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Vehicles associated with the state template will stream telemetry data during a specified time \
   period.\n"]

type nonrec state_template_update_strategy =
  | Periodic of periodic_state_template_update_strategy [@ocaml.doc ""]
  | OnChange of on_change_state_template_update_strategy [@ocaml.doc ""]
[@@ocaml.doc
  "The update strategy for the state template. Vehicles associated with the state template can \
   stream telemetry data with either an [onChange] or [periodic] update strategy. \n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec resource_identifier = string [@@ocaml.doc ""]

type nonrec state_template_association = {
  identifier : resource_identifier; [@ocaml.doc "The unique ID of the state template.\n"]
  state_template_update_strategy : state_template_update_strategy; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The state template associated with a vehicle. State templates contain state properties, which \
   are signals that belong to a signal catalog that is synchronized between the Amazon Web \
   Services IoT FleetWise Edge and the Amazon Web Services Cloud.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec state_template_associations = state_template_association list [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The tag's key.\n"]
  value : tag_value; [@ocaml.doc "The tag's value.\n"]
}
[@@ocaml.doc "A set of key/value pairs that are used to manage the resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec vehicle_association_behavior =
  | CREATE_IOT_THING [@ocaml.doc ""]
  | VALIDATE_IOT_THING_EXISTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute_name = string [@@ocaml.doc ""]

type nonrec attributes_map = (attribute_name * attribute_value) list [@@ocaml.doc ""]

type nonrec create_vehicle_request_item = {
  vehicle_name : vehicle_name; [@ocaml.doc "The unique ID of the vehicle to create.\n"]
  model_manifest_arn : arn;
      [@ocaml.doc "The ARN of the vehicle model (model manifest) to create the vehicle from.\n"]
  decoder_manifest_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a decoder manifest associated with the vehicle to \
         create. \n"]
  attributes : attributes_map option;
      [@ocaml.doc
        "Static information about a vehicle in a key-value pair. For example: [\"engine\n\
        \                Type\"] : [\"v6\"] \n"]
  association_behavior : vehicle_association_behavior option;
      [@ocaml.doc
        "An option to create a new Amazon Web Services IoT thing when creating a vehicle, or to \
         validate an existing thing as a vehicle.\n"]
  tags : tag_list option; [@ocaml.doc "Metadata which can be used to manage the vehicle.\n"]
  state_templates : state_template_associations option;
      [@ocaml.doc
        "Associate state templates to track the state of the vehicle. State templates determine \
         which signal updates the vehicle sends to the cloud.\n"]
}
[@@ocaml.doc "Information about the vehicle to create.\n"]

type nonrec create_vehicle_request_items = create_vehicle_request_item list [@@ocaml.doc ""]

type nonrec batch_create_vehicle_request = {
  vehicles : create_vehicle_request_items;
      [@ocaml.doc
        " A list of information about each vehicle to create. For more information, see the API \
         data type.\n"]
}
[@@ocaml.doc ""]

type nonrec number = int [@@ocaml.doc ""]

type nonrec update_vehicle_error = {
  vehicle_name : vehicle_name option; [@ocaml.doc "The ID of the vehicle with the error.\n"]
  code : number option; [@ocaml.doc "The relevant HTTP error code (400+).\n"]
  message : string_ option; [@ocaml.doc "A message associated with the error.\n"]
}
[@@ocaml.doc "An HTTP error resulting from updating the description for a vehicle.\n"]

type nonrec update_vehicle_errors = update_vehicle_error list [@@ocaml.doc ""]

type nonrec update_vehicle_response_item = {
  vehicle_name : vehicle_name option; [@ocaml.doc "The unique ID of the updated vehicle.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the updated vehicle.\n"]
}
[@@ocaml.doc "Information about the updated vehicle.\n"]

type nonrec update_vehicle_response_items = update_vehicle_response_item list [@@ocaml.doc ""]

type nonrec batch_update_vehicle_response = {
  vehicles : update_vehicle_response_items option;
      [@ocaml.doc
        " A list of information about the batch of updated vehicles. \n\n\
        \  This list contains only unique IDs for the vehicles that were updated.\n\
        \  \n\
        \   "]
  errors : update_vehicle_errors option;
      [@ocaml.doc
        "A list of information about errors returned while updating a batch of vehicles, or, if \
         there aren't any errors, an empty list.\n"]
}
[@@ocaml.doc ""]

type nonrec state_template_association_identifiers = resource_identifier list [@@ocaml.doc ""]

type nonrec update_mode = OVERWRITE [@ocaml.doc ""] | MERGE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_vehicle_request_item = {
  vehicle_name : vehicle_name; [@ocaml.doc "The unique ID of the vehicle to update.\n"]
  model_manifest_arn : arn option;
      [@ocaml.doc
        "The ARN of the vehicle model (model manifest) associated with the vehicle to update.\n"]
  decoder_manifest_arn : arn option;
      [@ocaml.doc "The ARN of the signal decoder manifest associated with the vehicle to update.\n"]
  attributes : attributes_map option;
      [@ocaml.doc
        "Static information about a vehicle in a key-value pair. For example:\n\n\
        \  [\"engineType\"] : [\"1.3 L R2\"] \n\
        \ "]
  attribute_update_mode : update_mode option;
      [@ocaml.doc
        "The method the specified attributes will update the existing attributes on the vehicle. \
         Use[Overwite] to replace the vehicle attributes with the specified attributes. Or use \
         [Merge] to combine all attributes.\n\n\
        \ This is required if attributes are present in the input.\n\
        \ "]
  state_templates_to_add : state_template_associations option;
      [@ocaml.doc
        "Associate additional state templates to track the state of the vehicle. State templates \
         determine which signal updates the vehicle sends to the cloud.\n"]
  state_templates_to_remove : state_template_association_identifiers option;
      [@ocaml.doc "Remove existing state template associations from the vehicle.\n"]
  state_templates_to_update : state_template_associations option;
      [@ocaml.doc
        "Change the [stateTemplateUpdateStrategy] of state templates already associated with the \
         vehicle.\n"]
}
[@@ocaml.doc
  "Information about the vehicle to update.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec update_vehicle_request_items = update_vehicle_request_item list [@@ocaml.doc ""]

type nonrec batch_update_vehicle_request = {
  vehicles : update_vehicle_request_items;
      [@ocaml.doc
        " A list of information about the vehicles to update. For more information, see the API \
         data type.\n"]
}
[@@ocaml.doc ""]

type nonrec branch = {
  fully_qualified_name : string_;
      [@ocaml.doc
        "The fully qualified name of the branch. For example, the fully qualified name of a branch \
         might be [Vehicle.Body.Engine].\n"]
  description : description option; [@ocaml.doc "A brief description of the branch.\n"]
  deprecation_message : message option;
      [@ocaml.doc "The deprecation message for the node or the branch that was moved or deleted.\n"]
  comment : message option; [@ocaml.doc "A comment in addition to the description.\n"]
}
[@@ocaml.doc "A group of signals that are defined in a hierarchical structure.\n"]

type nonrec campaign_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec campaign_status =
  | CREATING [@ocaml.doc ""]
  | WAITING_FOR_APPROVAL [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec campaign_name = string [@@ocaml.doc ""]

type nonrec campaign_arn = string [@@ocaml.doc ""]

type nonrec campaign_summary = {
  arn : campaign_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a campaign.\n"]
  name : campaign_name option; [@ocaml.doc "The name of a campaign.\n"]
  description : description option; [@ocaml.doc "The description of the campaign.\n"]
  signal_catalog_arn : arn option;
      [@ocaml.doc "The ARN of the signal catalog associated with the campaign.\n"]
  target_arn : arn option;
      [@ocaml.doc "The ARN of a vehicle or fleet to which the campaign is deployed.\n"]
  status : campaign_status option;
      [@ocaml.doc
        "The state of a campaign. The status can be one of the following:\n\n\
        \ {ul\n\
        \       {-   [CREATING] - Amazon Web Services IoT FleetWise is processing your request to \
         create the campaign.\n\
        \           \n\
        \            }\n\
        \       {-   [WAITING_FOR_APPROVAL] - After a campaign is created, it enters the \
         [WAITING_FOR_APPROVAL] state. To allow Amazon Web Services IoT FleetWise to deploy the \
         campaign to the target vehicle or fleet, use the API operation to approve the campaign. \n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING] - The campaign is active. \n\
        \           \n\
        \            }\n\
        \       {-   [SUSPENDED] - The campaign is suspended. To resume the campaign, use the API \
         operation. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  creation_time : timestamp; [@ocaml.doc "The time the campaign was created.\n"]
  last_modification_time : timestamp; [@ocaml.doc "The last time the campaign was modified.\n"]
}
[@@ocaml.doc
  "Information about a campaign. \n\n\
  \ You can use the API operation to return this information about multiple created campaigns.\n\
  \ "]

type nonrec model_signals_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec network_file_blob = bytes [@@ocaml.doc ""]

type nonrec network_files_list = network_file_blob list [@@ocaml.doc ""]

type nonrec interface_id = string [@@ocaml.doc ""]

type nonrec can_dbc_definition = {
  network_interface : interface_id; [@ocaml.doc "Contains information about a network interface.\n"]
  can_dbc_files : network_files_list;
      [@ocaml.doc
        "A list of DBC files. You can upload only one DBC file for each network interface and \
         specify up to five (inclusive) files in the list. The DBC file can be a maximum size of \
         200 MB.\n"]
  signals_map : model_signals_map option;
      [@ocaml.doc "Pairs every signal specified in your vehicle model with a signal decoder.\n"]
}
[@@ocaml.doc "Configurations used to create a decoder manifest.\n"]

type nonrec protocol_version = string [@@ocaml.doc ""]

type nonrec protocol_name = string [@@ocaml.doc ""]

type nonrec can_interface_name = string [@@ocaml.doc ""]

type nonrec can_interface = {
  name : can_interface_name; [@ocaml.doc "The unique name of the interface.\n"]
  protocol_name : protocol_name option;
      [@ocaml.doc "The name of the communication protocol for the interface.\n"]
  protocol_version : protocol_version option;
      [@ocaml.doc "The version of the communication protocol for the interface.\n"]
}
[@@ocaml.doc "A single controller area network (CAN) device interface.\n"]

type nonrec signal_value_type = INTEGER [@ocaml.doc ""] | FLOATING_POINT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec can_signal_name = string [@@ocaml.doc ""]

type nonrec non_negative_integer = int [@@ocaml.doc ""]

type nonrec can_signal = {
  message_id : non_negative_integer; [@ocaml.doc "The ID of the message.\n"]
  is_big_endian : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc "Whether the byte ordering of a CAN message is big-endian.\n"]
  is_signed : Smaws_Lib.Smithy_api.Types.primitive_boolean;
      [@ocaml.doc
        "Determines whether the message is signed ([true]) or not ([false]). If it's signed, the \
         message can represent both positive and negative numbers. The [isSigned] parameter only \
         applies to the [INTEGER] raw signal type, and it doesn't affect the [FLOATING_POINT] raw \
         signal type.\n"]
  start_bit : non_negative_integer;
      [@ocaml.doc
        "Indicates the beginning of the CAN signal. This should always be the least significant \
         bit (LSB).\n\n\
        \ This value might be different from the value in a DBC file. For little endian signals, \
         [startBit] is the same value as in the DBC file. For big endian signals in a DBC file, \
         the start bit is the most significant bit (MSB). You will have to calculate the LSB \
         instead and pass it as the [startBit].\n\
        \ "]
  offset : double;
      [@ocaml.doc
        "The offset used to calculate the signal value. Combined with factor, the calculation is \
         [value = raw_value * factor + offset].\n"]
  factor : double; [@ocaml.doc "A multiplier used to decode the CAN message.\n"]
  length : non_negative_integer; [@ocaml.doc "How many bytes of data are in the message.\n"]
  name : can_signal_name option; [@ocaml.doc "The name of the signal.\n"]
  signal_value_type : signal_value_type option;
      [@ocaml.doc "The value type of the signal. The default value is [INTEGER].\n"]
}
[@@ocaml.doc
  "Information about a single controller area network (CAN) signal and the messages it receives \
   and transmits.\n"]

type nonrec cloud_watch_log_group_name = string [@@ocaml.doc ""]

type nonrec log_type = OFF [@ocaml.doc ""] | ERROR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec cloud_watch_log_delivery_options = {
  log_type : log_type; [@ocaml.doc "The type of log to send data to Amazon CloudWatch Logs.\n"]
  log_group_name : cloud_watch_log_group_name option;
      [@ocaml.doc "The Amazon CloudWatch Logs group the operation sends data to.\n"]
}
[@@ocaml.doc "The log delivery option to send data to Amazon CloudWatch Logs.\n"]

type nonrec language_version = int [@@ocaml.doc ""]

type nonrec trigger_mode = ALWAYS [@ocaml.doc ""] | RISING_EDGE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec uint32 = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec event_expression = string [@@ocaml.doc ""]

type nonrec condition_based_collection_scheme = {
  expression : event_expression;
      [@ocaml.doc
        "The logical expression used to recognize what data to collect. For example, \
         [$variable.`Vehicle.OutsideAirTemperature` >= 105.0].\n"]
  minimum_trigger_interval_ms : uint32 option;
      [@ocaml.doc
        "The minimum duration of time between two triggering events to collect data, in \
         milliseconds.\n\n\
        \  If a signal changes often, you might want to collect data at a slower rate.\n\
        \  \n\
        \   "]
  trigger_mode : trigger_mode option;
      [@ocaml.doc
        "Whether to collect data for all triggering events ([ALWAYS]). Specify ([RISING_EDGE]), or \
         specify only when the condition first evaluates to false. For example, triggering on \
         \"AirbagDeployed\"; Users aren't interested on triggering when the airbag is already \
         exploded; they only care about the change from not deployed => deployed.\n"]
  condition_language_version : language_version option;
      [@ocaml.doc "Specifies the version of the conditional expression language.\n"]
}
[@@ocaml.doc
  "Information about a collection scheme that uses a simple logical expression to recognize what \
   data to collect.\n"]

type nonrec collection_period_ms = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec time_based_collection_scheme = {
  period_ms : collection_period_ms;
      [@ocaml.doc
        "The time period (in milliseconds) to decide how often to collect data. For example, if \
         the time period is [60000], the Edge Agent software collects data once every minute.\n"]
}
[@@ocaml.doc
  "Information about a collection scheme that uses a time period to decide how often to collect \
   data.\n"]

type nonrec collection_scheme =
  | TimeBasedCollectionScheme of time_based_collection_scheme
      [@ocaml.doc
        "Information about a collection scheme that uses a time period to decide how often to \
         collect data.\n"]
  | ConditionBasedCollectionScheme of condition_based_collection_scheme
      [@ocaml.doc
        "Information about a collection scheme that uses a simple logical expression to recognize \
         what data to collect.\n"]
[@@ocaml.doc "Specifies what data to collect and how often or when to collect it.\n"]

type nonrec compression = OFF [@ocaml.doc ""] | SNAPPY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec fetch_config_event_expression = string [@@ocaml.doc ""]

type nonrec condition_based_signal_fetch_config = {
  condition_expression : fetch_config_event_expression;
      [@ocaml.doc "The condition that must be satisfied to trigger a signal fetch.\n"]
  trigger_mode : trigger_mode;
      [@ocaml.doc "Indicates the mode in which the signal fetch is triggered.\n"]
}
[@@ocaml.doc "Specifies the condition under which a signal fetch occurs.\n"]

type nonrec conflict_exception = {
  message : string_; [@ocaml.doc ""]
  resource : string_; [@ocaml.doc "The resource on which there are conflicting operations.\n"]
  resource_type : string_;
      [@ocaml.doc "The type of resource on which there are conflicting operations..\n"]
}
[@@ocaml.doc
  "The request has conflicting operations. This can occur if you're trying to perform more than \
   one operation on the same resource at the same time.\n"]

type nonrec create_campaign_response = {
  name : campaign_name option; [@ocaml.doc "The name of the created campaign.\n"]
  arn : campaign_arn option; [@ocaml.doc " The ARN of the created campaign. \n"]
}
[@@ocaml.doc ""]

type nonrec action_event_expression = string [@@ocaml.doc ""]

type nonrec event_expression_list = action_event_expression list [@@ocaml.doc ""]

type nonrec positive_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec time_based_signal_fetch_config = {
  execution_frequency_ms : positive_long;
      [@ocaml.doc "The frequency with which the signal fetch will be executed.\n"]
}
[@@ocaml.doc "Used to configure a frequency-based vehicle signal fetch.\n"]

type nonrec signal_fetch_config =
  | TimeBased of time_based_signal_fetch_config
      [@ocaml.doc "The configuration of a time-based signal fetch operation.\n"]
  | ConditionBased of condition_based_signal_fetch_config
      [@ocaml.doc "The configuration of a condition-based signal fetch operation.\n"]
[@@ocaml.doc
  "The configuration of the signal fetch operation.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec signal_fetch_information = {
  fully_qualified_name : node_path;
      [@ocaml.doc "The fully qualified name of the signal to be fetched.\n"]
  signal_fetch_config : signal_fetch_config;
      [@ocaml.doc "The configuration of the signal fetch operation.\n"]
  condition_language_version : language_version option;
      [@ocaml.doc "The version of the condition language used.\n"]
  actions : event_expression_list; [@ocaml.doc "The actions to be performed by the signal fetch.\n"]
}
[@@ocaml.doc
  "Information about the signal to be fetched.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec signal_fetch_information_list = signal_fetch_information list [@@ocaml.doc ""]

type nonrec data_partition_upload_options = {
  expression : event_expression;
      [@ocaml.doc
        "The logical expression used to recognize what data to collect. For example, \
         [$variable.`Vehicle.OutsideAirTemperature` >= 105.0].\n"]
  condition_language_version : language_version option;
      [@ocaml.doc
        "The version of the condition language. Defaults to the most recent condition language \
         version.\n"]
}
[@@ocaml.doc
  "The upload options for the data partition. If upload options are specified, you must also \
   specify storage options. See \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/APIReference/API_DataPartitionStorageOptions.html}DataPartitionStorageOptions}.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec storage_minimum_time_to_live_value = int [@@ocaml.doc ""]

type nonrec storage_minimum_time_to_live_unit =
  | HOURS [@ocaml.doc ""]
  | DAYS [@ocaml.doc ""]
  | WEEKS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec storage_minimum_time_to_live = {
  unit_ : storage_minimum_time_to_live_unit; [@ocaml.doc "The time increment type.\n"]
  value : storage_minimum_time_to_live_value;
      [@ocaml.doc "The minimum amount of time to store the data.\n"]
}
[@@ocaml.doc
  "Information about the minimum amount of time that data will be kept.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec storage_location = string [@@ocaml.doc ""]

type nonrec storage_maximum_size_value = int [@@ocaml.doc ""]

type nonrec storage_maximum_size_unit =
  | MB [@ocaml.doc ""]
  | GB [@ocaml.doc ""]
  | TB [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec storage_maximum_size = {
  unit_ : storage_maximum_size_unit; [@ocaml.doc "The data type of the data to store.\n"]
  value : storage_maximum_size_value; [@ocaml.doc "The maximum amount of time to store data.\n"]
}
[@@ocaml.doc
  "The maximum storage size for the data partition.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec data_partition_storage_options = {
  maximum_size : storage_maximum_size;
      [@ocaml.doc
        "The maximum storage size of the data stored in the data partition.\n\n\
        \  Newer data overwrites older data when the partition reaches the maximum size.\n\
        \  \n\
        \   "]
  storage_location : storage_location;
      [@ocaml.doc "The folder name for the data partition under the campaign storage folder.\n"]
  minimum_time_to_live : storage_minimum_time_to_live;
      [@ocaml.doc
        "The amount of time that data in this partition will be kept on disk.\n\n\
        \ {ul\n\
        \       {-  After the designated amount of time passes, the data can be removed, but it's \
         not guaranteed to be removed.\n\
        \           \n\
        \            }\n\
        \       {-  Before the time expires, data in this partition can still be deleted if the \
         partition reaches its configured maximum size.\n\
        \           \n\
        \            }\n\
        \       {-  Newer data will overwrite older data when the partition reaches the maximum \
         size.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Size, time, and location options for the data partition.\n"]

type nonrec data_partition_id = string [@@ocaml.doc ""]

type nonrec data_partition = {
  id : data_partition_id;
      [@ocaml.doc
        "The ID of the data partition. The data partition ID must be unique within a campaign. You \
         can establish a data partition as the default partition for a campaign by using [default] \
         as the ID.\n"]
  storage_options : data_partition_storage_options;
      [@ocaml.doc "The storage options for a data partition.\n"]
  upload_options : data_partition_upload_options option;
      [@ocaml.doc "The upload options for the data partition.\n"]
}
[@@ocaml.doc
  "The configuration for signal data storage and upload options. You can only specify these \
   options when the campaign's spooling mode is [TO_DISK].\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec data_partitions = data_partition list [@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec mqtt_topic_arn = string [@@ocaml.doc ""]

type nonrec mqtt_topic_config = {
  mqtt_topic_arn : mqtt_topic_arn; [@ocaml.doc "The ARN of the MQTT topic.\n"]
  execution_role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the role that grants Amazon Web Services IoT FleetWise permission to access \
         and act on messages sent to the MQTT topic.\n"]
}
[@@ocaml.doc
  "The MQTT topic to which the Amazon Web Services IoT FleetWise campaign routes data. For more \
   information, see {{:https://docs.aws.amazon.com/iot/latest/developerguide/protocols.html}Device \
   communication protocols} in the {i Amazon Web Services IoT Core Developer Guide}.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec timestream_table_arn = string [@@ocaml.doc ""]

type nonrec timestream_config = {
  timestream_table_arn : timestream_table_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon Timestream table.\n"]
  execution_role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the task execution role that grants Amazon Web Services \
         IoT FleetWise permission to deliver data to the Amazon Timestream table.\n"]
}
[@@ocaml.doc
  "The Amazon Timestream table where the Amazon Web Services IoT FleetWise campaign sends data. \
   Timestream stores and organizes data to optimize query processing time and to reduce storage \
   costs. For more information, see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/data-modeling.html}Data \
   modeling} in the {i Amazon Timestream Developer Guide}.\n"]

type nonrec prefix = string [@@ocaml.doc ""]

type nonrec storage_compression_format = NONE [@ocaml.doc ""] | GZIP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_format = JSON [@ocaml.doc ""] | PARQUET [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec s3_bucket_arn = string [@@ocaml.doc ""]

type nonrec s3_config = {
  bucket_arn : s3_bucket_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon S3 bucket.\n"]
  data_format : data_format option;
      [@ocaml.doc
        "Specify the format that files are saved in the Amazon S3 bucket. You can save files in an \
         Apache Parquet or JSON format.\n\n\
        \ {ul\n\
        \       {-  Parquet - Store data in a columnar storage file format. Parquet is optimal for \
         fast data retrieval and can reduce costs. This option is selected by default.\n\
        \           \n\
        \            }\n\
        \       {-  JSON - Store data in a standard text-based JSON file format.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  storage_compression_format : storage_compression_format option;
      [@ocaml.doc
        "By default, stored data is compressed as a .gzip file. Compressed files have a reduced \
         file size, which can optimize the cost of data storage.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "Enter an S3 bucket prefix. The prefix is the string of characters after the bucket name \
         and before the object name. You can use the prefix to organize data stored in Amazon S3 \
         buckets. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html}Organizing \
         objects using prefixes} in the {i Amazon Simple Storage Service User Guide}.\n\n\
        \ By default, Amazon Web Services IoT FleetWise sets the prefix \
         [processed-data/year=YY/month=MM/date=DD/hour=HH/] (in UTC) to data it delivers to Amazon \
         S3. You can enter a prefix to append it to this default prefix. For example, if you enter \
         the prefix [vehicles], the prefix will be \
         [vehicles/processed-data/year=YY/month=MM/date=DD/hour=HH/].\n\
        \ "]
}
[@@ocaml.doc
  "The Amazon S3 bucket where the Amazon Web Services IoT FleetWise campaign sends data. Amazon S3 \
   is an object storage service that stores data as objects within buckets. For more information, \
   see {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-buckets-s3.html}Creating, \
   configuring, and working with Amazon S3 buckets} in the {i Amazon Simple Storage Service User \
   Guide}.\n"]

type nonrec data_destination_config =
  | S3Config of s3_config
      [@ocaml.doc
        "The Amazon S3 bucket where the Amazon Web Services IoT FleetWise campaign sends data.\n"]
  | TimestreamConfig of timestream_config
      [@ocaml.doc "The Amazon Timestream table where the campaign sends data.\n"]
  | MqttTopicConfig of mqtt_topic_config
      [@ocaml.doc
        "The MQTT topic to which the Amazon Web Services IoT FleetWise campaign routes data.\n\n\
        \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For \
         more information, see \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
         Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
         Developer Guide}.\n\
        \  \n\
        \   "]
[@@ocaml.doc
  "The destination where the campaign sends data. You can send data to an MQTT topic, or store it \
   in Amazon S3 or Amazon Timestream.\n"]

type nonrec data_destination_configs = data_destination_config list [@@ocaml.doc ""]

type nonrec data_extra_dimension_node_path_list = node_path list [@@ocaml.doc ""]

type nonrec max_sample_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec wildcard_signal_name = string [@@ocaml.doc ""]

type nonrec signal_information = {
  name : wildcard_signal_name; [@ocaml.doc "The name of the signal.\n"]
  max_sample_count : max_sample_count option;
      [@ocaml.doc "The maximum number of samples to collect.\n"]
  minimum_sampling_interval_ms : uint32 option;
      [@ocaml.doc
        "The minimum duration of time (in milliseconds) between two triggering events to collect \
         data.\n\n\
        \  If a signal changes often, you might want to collect data at a slower rate.\n\
        \  \n\
        \   "]
  data_partition_id : data_partition_id option;
      [@ocaml.doc
        "The ID of the data partition this signal is associated with.\n\n\
        \ The ID must match one of the IDs provided in [dataPartitions]. This is accomplished \
         either by specifying a particular data partition ID or by using [default] for an \
         established default partition. You can establish a default partition in the \
         [DataPartition] data type.\n\
        \ \n\
        \   If you upload a signal as a condition for a campaign's data partition, the same signal \
         must be included in [signalsToCollect].\n\
        \   \n\
        \      Access to certain Amazon Web Services IoT FleetWise features is currently gated. \
         For more information, see \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
         Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
         Developer Guide}.\n\
        \      \n\
        \       "]
}
[@@ocaml.doc "Information about a signal.\n"]

type nonrec signal_information_list = signal_information list [@@ocaml.doc ""]

type nonrec priority = int [@@ocaml.doc ""]

type nonrec spooling_mode = OFF [@ocaml.doc ""] | TO_DISK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec diagnostics_mode = OFF [@ocaml.doc ""] | SEND_ACTIVE_DTCS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_campaign_request = {
  name : campaign_name; [@ocaml.doc " The name of the campaign to create. \n"]
  description : description option;
      [@ocaml.doc "An optional description of the campaign to help identify its purpose.\n"]
  signal_catalog_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the signal catalog to associate with the campaign. \n"]
  target_arn : arn; [@ocaml.doc " The ARN of the vehicle or fleet to deploy a campaign to. \n"]
  start_time : timestamp option;
      [@ocaml.doc
        "The time, in milliseconds, to deliver a campaign after it was approved. If it's not \
         specified, [0] is used.\n\n\
        \ Default: [0] \n\
        \ "]
  expiry_time : timestamp option;
      [@ocaml.doc
        "The time the campaign expires, in seconds since epoch (January 1, 1970 at midnight UTC \
         time). Vehicle data isn't collected after the campaign expires. \n\n\
        \ Default: 253402214400 (December 31, 9999, 00:00:00 UTC)\n\
        \ "]
  post_trigger_collection_duration : uint32 option;
      [@ocaml.doc
        "How long (in milliseconds) to collect raw data after a triggering event initiates the \
         collection. If it's not specified, [0] is used.\n\n\
        \ Default: [0] \n\
        \ "]
  diagnostics_mode : diagnostics_mode option;
      [@ocaml.doc
        "Option for a vehicle to send diagnostic trouble codes to Amazon Web Services IoT \
         FleetWise. If you want to send diagnostic trouble codes, use [SEND_ACTIVE_DTCS]. If it's \
         not specified, [OFF] is used.\n\n\
        \ Default: [OFF] \n\
        \ "]
  spooling_mode : spooling_mode option;
      [@ocaml.doc
        "Determines whether to store collected data after a vehicle lost a connection with the \
         cloud. After a connection is re-established, the data is automatically forwarded to \
         Amazon Web Services IoT FleetWise. If you want to store collected data when a vehicle \
         loses connection with the cloud, use [TO_DISK]. If it's not specified, [OFF] is used.\n\n\
        \ Default: [OFF] \n\
        \ "]
  compression : compression option;
      [@ocaml.doc
        "Determines whether to compress signals before transmitting data to Amazon Web Services \
         IoT FleetWise. If you don't want to compress the signals, use [OFF]. If it's not \
         specified, [SNAPPY] is used. \n\n\
        \ Default: [SNAPPY] \n\
        \ "]
  priority : priority option;
      [@ocaml.doc
        "A number indicating the priority of one campaign over another campaign for a certain \
         vehicle or fleet. A campaign with the lowest value is deployed to vehicles before any \
         other campaigns. If it's not specified, [0] is used. \n\n\
        \ Default: [0] \n\
        \ "]
  signals_to_collect : signal_information_list option;
      [@ocaml.doc
        "A list of information about signals to collect. \n\n\
        \  If you upload a signal as a condition in a data partition for a campaign, then those \
         same signals must be included in [signalsToCollect].\n\
        \  \n\
        \   "]
  collection_scheme : collection_scheme;
      [@ocaml.doc
        " The data collection scheme associated with the campaign. You can specify a scheme that \
         collects data based on time or an event.\n"]
  data_extra_dimensions : data_extra_dimension_node_path_list option;
      [@ocaml.doc
        "A list of vehicle attributes to associate with a campaign. \n\n\
        \ Enrich the data with specified vehicle attributes. For example, add [make] and [model] \
         to the campaign, and Amazon Web Services IoT FleetWise will associate the data with those \
         attributes as dimensions in Amazon Timestream. You can then query the data against [make] \
         and [model].\n\
        \ \n\
        \  Default: An empty array\n\
        \  "]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the campaign.\n"]
  data_destination_configs : data_destination_configs option;
      [@ocaml.doc
        "The destination where the campaign sends data. You can send data to an MQTT topic, or \
         store it in Amazon S3 or Amazon Timestream.\n\n\
        \ MQTT is the publish/subscribe messaging protocol used by Amazon Web Services IoT to \
         communicate with your devices.\n\
        \ \n\
        \  Amazon S3 optimizes the cost of data storage and provides additional mechanisms to use \
         vehicle data, such as data lakes, centralized data storage, data processing pipelines, \
         and analytics. Amazon Web Services IoT FleetWise supports at-least-once file delivery to \
         S3. Your vehicle data is stored on multiple Amazon Web Services IoT FleetWise servers for \
         redundancy and high availability.\n\
        \  \n\
        \   You can use Amazon Timestream to access and analyze time series data, and Timestream \
         to query vehicle data so that you can identify trends and patterns.\n\
        \   "]
  data_partitions : data_partitions option;
      [@ocaml.doc "The data partitions associated with the signals collected from the vehicle.\n"]
  signals_to_fetch : signal_fetch_information_list option;
      [@ocaml.doc "A list of information about signals to fetch.\n"]
}
[@@ocaml.doc ""]

type nonrec network_interface_failure_reason =
  | DUPLICATE_INTERFACE [@ocaml.doc ""]
  | CONFLICTING_NETWORK_INTERFACE [@ocaml.doc ""]
  | NETWORK_INTERFACE_TO_ADD_ALREADY_EXISTS [@ocaml.doc ""]
  | CAN_NETWORK_INTERFACE_INFO_IS_NULL [@ocaml.doc ""]
  | OBD_NETWORK_INTERFACE_INFO_IS_NULL [@ocaml.doc ""]
  | NETWORK_INTERFACE_TO_REMOVE_ASSOCIATED_WITH_SIGNALS [@ocaml.doc ""]
  | VEHICLE_MIDDLEWARE_NETWORK_INTERFACE_INFO_IS_NULL [@ocaml.doc ""]
  | CUSTOM_DECODING_SIGNAL_NETWORK_INTERFACE_INFO_IS_NULL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invalid_network_interface = {
  interface_id : interface_id option; [@ocaml.doc "The ID of the interface that isn't valid.\n"]
  reason : network_interface_failure_reason option;
      [@ocaml.doc "A message about why the interface isn't valid. \n"]
}
[@@ocaml.doc "A reason a vehicle network interface isn't valid.\n"]

type nonrec invalid_network_interfaces = invalid_network_interface list [@@ocaml.doc ""]

type nonrec signal_decoder_failure_reason =
  | DUPLICATE_SIGNAL [@ocaml.doc ""]
  | CONFLICTING_SIGNAL [@ocaml.doc ""]
  | SIGNAL_TO_ADD_ALREADY_EXISTS [@ocaml.doc ""]
  | SIGNAL_NOT_ASSOCIATED_WITH_NETWORK_INTERFACE [@ocaml.doc ""]
  | NETWORK_INTERFACE_TYPE_INCOMPATIBLE_WITH_SIGNAL_DECODER_TYPE [@ocaml.doc ""]
  | SIGNAL_NOT_IN_MODEL [@ocaml.doc ""]
  | CAN_SIGNAL_INFO_IS_NULL [@ocaml.doc ""]
  | OBD_SIGNAL_INFO_IS_NULL [@ocaml.doc ""]
  | NO_DECODER_INFO_FOR_SIGNAL_IN_MODEL [@ocaml.doc ""]
  | MESSAGE_SIGNAL_INFO_IS_NULL [@ocaml.doc ""]
  | SIGNAL_DECODER_TYPE_INCOMPATIBLE_WITH_MESSAGE_SIGNAL_TYPE [@ocaml.doc ""]
  | STRUCT_SIZE_MISMATCH [@ocaml.doc ""]
  | NO_SIGNAL_IN_CATALOG_FOR_DECODER_SIGNAL [@ocaml.doc ""]
  | SIGNAL_DECODER_INCOMPATIBLE_WITH_SIGNAL_CATALOG [@ocaml.doc ""]
  | EMPTY_MESSAGE_SIGNAL [@ocaml.doc ""]
  | CUSTOM_DECODING_SIGNAL_INFO_IS_NULL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fully_qualified_name = string [@@ocaml.doc ""]

type nonrec invalid_signal_decoder = {
  name : fully_qualified_name option;
      [@ocaml.doc "The name of a signal decoder that isn't valid.\n"]
  reason : signal_decoder_failure_reason option;
      [@ocaml.doc "A message about why the signal decoder isn't valid.\n"]
  hint : message option; [@ocaml.doc "The possible cause for the invalid signal decoder.\n"]
}
[@@ocaml.doc "A reason that a signal decoder isn't valid.\n"]

type nonrec invalid_signal_decoders = invalid_signal_decoder list [@@ocaml.doc ""]

type nonrec decoder_manifest_validation_exception = {
  invalid_signals : invalid_signal_decoders option;
      [@ocaml.doc "The request couldn't be completed because of invalid signals in the request.\n"]
  invalid_network_interfaces : invalid_network_interfaces option;
      [@ocaml.doc
        "The request couldn't be completed because of invalid network interfaces in the request.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request couldn't be completed because it contains signal decoders with one or more \
   validation errors.\n"]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec create_decoder_manifest_response = {
  name : resource_name; [@ocaml.doc " The name of the created decoder manifest. \n"]
  arn : arn; [@ocaml.doc " The ARN of the created decoder manifest. \n"]
}
[@@ocaml.doc ""]

type nonrec default_for_unmapped_signals_type = CUSTOM_DECODING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec custom_decoding_signal_interface_name = string [@@ocaml.doc ""]

type nonrec custom_decoding_interface = {
  name : custom_decoding_signal_interface_name; [@ocaml.doc "The name of the interface.\n"]
}
[@@ocaml.doc
  "Represents a custom network interface as defined by the customer.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec vehicle_middleware_protocol = ROS_2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec vehicle_middleware_name = string [@@ocaml.doc ""]

type nonrec vehicle_middleware = {
  name : vehicle_middleware_name; [@ocaml.doc "The name of the vehicle middleware. \n"]
  protocol_name : vehicle_middleware_protocol;
      [@ocaml.doc "The protocol name of the vehicle middleware. \n"]
}
[@@ocaml.doc
  "The vehicle middleware defined as a type of network interface. Examples of vehicle middleware \
   include [ROS2] and [SOME/IP].\n"]

type nonrec obd_standard = string [@@ocaml.doc ""]

type nonrec obd_interface_name = string [@@ocaml.doc ""]

type nonrec obd_interface = {
  name : obd_interface_name; [@ocaml.doc "The name of the interface.\n"]
  request_message_id : non_negative_integer;
      [@ocaml.doc "The ID of the message requesting vehicle data.\n"]
  obd_standard : obd_standard option; [@ocaml.doc "The standard OBD II PID.\n"]
  pid_request_interval_seconds : non_negative_integer option;
      [@ocaml.doc "The maximum number message requests per second.\n"]
  dtc_request_interval_seconds : non_negative_integer option;
      [@ocaml.doc "The maximum number message requests per diagnostic trouble code per second.\n"]
  use_extended_ids : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "Whether to use extended IDs in the message.\n"]
  has_transmission_ecu : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "Whether the vehicle has a transmission control module (TCM).\n"]
}
[@@ocaml.doc
  "A network interface that specifies the on-board diagnostic (OBD) II network protocol.\n"]

type nonrec network_interface_type =
  | CAN_INTERFACE [@ocaml.doc ""]
  | OBD_INTERFACE [@ocaml.doc ""]
  | VEHICLE_MIDDLEWARE [@ocaml.doc ""]
  | CUSTOM_DECODING_INTERFACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec network_interface = {
  interface_id : interface_id; [@ocaml.doc "The ID of the network interface.\n"]
  type_ : network_interface_type;
      [@ocaml.doc
        "The network protocol for the vehicle. For example, [CAN_SIGNAL] specifies a protocol that \
         defines how data is communicated between electronic control units (ECUs). [OBD_SIGNAL] \
         specifies a protocol that defines how self-diagnostic data is communicated between ECUs.\n"]
  can_interface : can_interface option;
      [@ocaml.doc
        "Information about a network interface specified by the Controller Area Network (CAN) \
         protocol.\n"]
  obd_interface : obd_interface option;
      [@ocaml.doc
        "Information about a network interface specified by the on-board diagnostic (OBD) II \
         protocol.\n"]
  vehicle_middleware : vehicle_middleware option;
      [@ocaml.doc
        "The vehicle middleware defined as a type of network interface. Examples of vehicle \
         middleware include [ROS2] and [SOME/IP].\n"]
  custom_decoding_interface : custom_decoding_interface option;
      [@ocaml.doc
        "Information about a \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/APIReference/API_CustomDecodingInterface.html}custom \
         network interface}.\n"]
}
[@@ocaml.doc
  "Represents a node and its specifications in an in-vehicle communication network. All signal \
   decoders must be associated with a network node. \n\n\
  \  To return this information about all the network interfaces specified in a decoder manifest, \
   use the API operation.\n\
  \ "]

type nonrec network_interfaces = network_interface list [@@ocaml.doc ""]

type nonrec custom_decoding_id = string [@@ocaml.doc ""]

type nonrec custom_decoding_signal = {
  id : custom_decoding_id; [@ocaml.doc "The ID of the signal.\n"]
}
[@@ocaml.doc
  "Information about signals using a custom decoding protocol as defined by the customer.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec structure_message_name = string [@@ocaml.doc ""]

type nonrec structured_message_list_type =
  | FIXED_CAPACITY [@ocaml.doc ""]
  | DYNAMIC_UNBOUNDED_CAPACITY [@ocaml.doc ""]
  | DYNAMIC_BOUNDED_CAPACITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec max_string_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec ros2_primitive_type =
  | BOOL [@ocaml.doc ""]
  | BYTE [@ocaml.doc ""]
  | CHAR [@ocaml.doc ""]
  | FLOAT32 [@ocaml.doc ""]
  | FLOAT64 [@ocaml.doc ""]
  | INT8 [@ocaml.doc ""]
  | UINT8 [@ocaml.doc ""]
  | INT16 [@ocaml.doc ""]
  | UINT16 [@ocaml.doc ""]
  | INT32 [@ocaml.doc ""]
  | UINT32 [@ocaml.doc ""]
  | INT64 [@ocaml.doc ""]
  | UINT64 [@ocaml.doc ""]
  | STRING [@ocaml.doc ""]
  | WSTRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ros2_primitive_message_definition = {
  primitive_type : ros2_primitive_type;
      [@ocaml.doc
        "The primitive type (integer, floating point, boolean, etc.) for the ROS 2 primitive \
         message definition.\n"]
  offset : double option;
      [@ocaml.doc
        "The offset used to calculate the signal value. Combined with scaling, the calculation is \
         [value = raw_value * scaling + offset].\n"]
  scaling : double option; [@ocaml.doc "A multiplier used to decode the message.\n"]
  upper_bound : max_string_size option;
      [@ocaml.doc "An optional attribute specifying the upper bound for [STRING] and [WSTRING].\n"]
}
[@@ocaml.doc "Represents a ROS 2 compliant primitive type message of the complex data structure.\n"]

type nonrec primitive_message_definition =
  | Ros2PrimitiveMessageDefinition of ros2_primitive_message_definition
      [@ocaml.doc
        "Information about a [PrimitiveMessage] using a ROS 2 compliant primitive type message of \
         the complex data structure.\n"]
[@@ocaml.doc "Represents a primitive type node of the complex data structure.\n"]

type structured_message_list_definition = {
  name : structure_message_name;
      [@ocaml.doc "The name of the structured message list definition. \n"]
  member_type : structured_message;
      [@ocaml.doc "The member type of the structured message list definition.\n"]
  list_type : structured_message_list_type;
      [@ocaml.doc "The type of list of the structured message list definition.\n"]
  capacity : non_negative_integer option;
      [@ocaml.doc
        "The capacity of the structured message list definition when the list type is \
         [FIXED_CAPACITY] or [DYNAMIC_BOUNDED_CAPACITY].\n"]
}
[@@ocaml.doc "Represents a list type node of the complex data structure.\n"]

and structured_message_field_name_and_data_type_pair = {
  field_name : structure_message_name;
      [@ocaml.doc
        "The field name of the structured message. It determines how a data value is referenced in \
         the target language. \n"]
  data_type : structured_message; [@ocaml.doc "The data type. \n"]
}
[@@ocaml.doc "Represents a [StructureMessageName] to [DataType] map element.\n"]

and structured_message_definition = structured_message_field_name_and_data_type_pair list
[@@ocaml.doc ""]

and structured_message =
  | PrimitiveMessageDefinition of primitive_message_definition
      [@ocaml.doc "Represents a primitive type node of the complex data structure.\n"]
  | StructuredMessageListDefinition of structured_message_list_definition
      [@ocaml.doc "Represents a list type node of the complex data structure.\n"]
  | StructuredMessageDefinition of structured_message_definition
      [@ocaml.doc "Represents a struct type node of the complex data structure.\n"]
[@@ocaml.doc
  "The structured message for the message signal. It can be defined with either a \
   [primitiveMessageDefinition], [structuredMessageListDefinition], or \
   [structuredMessageDefinition] recursively.\n"]

type nonrec topic_name = string [@@ocaml.doc ""]

type nonrec message_signal = {
  topic_name : topic_name;
      [@ocaml.doc "The topic name for the message signal. It corresponds to topics in ROS 2. \n"]
  structured_message : structured_message;
      [@ocaml.doc
        "The structured message for the message signal. It can be defined with either a \
         [primitiveMessageDefinition], [structuredMessageListDefinition], or \
         [structuredMessageDefinition] recursively.\n"]
}
[@@ocaml.doc
  "The decoding information for a specific message which support higher order data types. \n"]

type nonrec obd_bitmask_length = int [@@ocaml.doc ""]

type nonrec obd_byte_length = int [@@ocaml.doc ""]

type nonrec obd_signal = {
  pid_response_length : positive_integer; [@ocaml.doc "The length of the requested data.\n"]
  service_mode : non_negative_integer;
      [@ocaml.doc "The mode of operation (diagnostic service) in a message.\n"]
  pid : non_negative_integer;
      [@ocaml.doc "The diagnostic code used to request data from a vehicle for this signal.\n"]
  scaling : double; [@ocaml.doc "A multiplier used to decode the message.\n"]
  offset : double;
      [@ocaml.doc
        "The offset used to calculate the signal value. Combined with scaling, the calculation is \
         [value = raw_value * scaling + offset].\n"]
  start_byte : non_negative_integer; [@ocaml.doc "Indicates the beginning of the message.\n"]
  byte_length : obd_byte_length; [@ocaml.doc "The length of a message.\n"]
  bit_right_shift : non_negative_integer option;
      [@ocaml.doc "The number of positions to shift bits in the message.\n"]
  bit_mask_length : obd_bitmask_length option;
      [@ocaml.doc "The number of bits to mask in a message.\n"]
  is_signed : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "Determines whether the message is signed ([true]) or not ([false]). If it's signed, the \
         message can represent both positive and negative numbers. The [isSigned] parameter only \
         applies to the [INTEGER] raw signal type, and it doesn't affect the [FLOATING_POINT] raw \
         signal type. The default value is [false].\n"]
  signal_value_type : signal_value_type option;
      [@ocaml.doc "The value type of the signal. The default value is [INTEGER].\n"]
}
[@@ocaml.doc
  "Information about signal messages using the on-board diagnostics (OBD) II protocol in a vehicle.\n"]

type nonrec signal_decoder_type =
  | CAN_SIGNAL [@ocaml.doc ""]
  | OBD_SIGNAL [@ocaml.doc ""]
  | MESSAGE_SIGNAL [@ocaml.doc ""]
  | CUSTOM_DECODING_SIGNAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec signal_decoder = {
  fully_qualified_name : fully_qualified_name;
      [@ocaml.doc "The fully qualified name of a signal decoder as defined in a vehicle model.\n"]
  type_ : signal_decoder_type;
      [@ocaml.doc
        "The network protocol for the vehicle. For example, [CAN_SIGNAL] specifies a protocol that \
         defines how data is communicated between electronic control units (ECUs). [OBD_SIGNAL] \
         specifies a protocol that defines how self-diagnostic data is communicated between ECUs.\n"]
  interface_id : interface_id;
      [@ocaml.doc
        "The ID of a network interface that specifies what network protocol a vehicle follows.\n"]
  can_signal : can_signal option;
      [@ocaml.doc
        "Information about signal decoder using the Controller Area Network (CAN) protocol.\n"]
  obd_signal : obd_signal option;
      [@ocaml.doc
        "Information about signal decoder using the on-board diagnostic (OBD) II protocol.\n"]
  message_signal : message_signal option;
      [@ocaml.doc
        "The decoding information for a specific message which supports higher order data types. \n"]
  custom_decoding_signal : custom_decoding_signal option;
      [@ocaml.doc
        "Information about a \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/APIReference/API_CustomDecodingSignal.html}custom \
         signal decoder}.\n\n\
        \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For \
         more information, see \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
         Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
         Developer Guide}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Information about a signal decoder.\n"]

type nonrec signal_decoders = signal_decoder list [@@ocaml.doc ""]

type nonrec create_decoder_manifest_request = {
  name : resource_name; [@ocaml.doc " The unique name of the decoder manifest to create.\n"]
  description : description option; [@ocaml.doc "A brief description of the decoder manifest. \n"]
  model_manifest_arn : arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the vehicle model (model manifest). \n"]
  signal_decoders : signal_decoders option;
      [@ocaml.doc " A list of information about signal decoders. \n"]
  network_interfaces : network_interfaces option;
      [@ocaml.doc " A list of information about available network interfaces. \n"]
  default_for_unmapped_signals : default_for_unmapped_signals_type option;
      [@ocaml.doc
        "Use default decoders for all unmapped signals in the model. You don't need to provide any \
         detailed decoding information.\n\n\
        \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For \
         more information, see \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
         Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
         Developer Guide}.\n\
        \  \n\
        \   "]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the decoder manifest.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_response = {
  id : fleet_id; [@ocaml.doc " The ID of the created fleet. \n"]
  arn : arn; [@ocaml.doc " The ARN of the created fleet. \n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_request = {
  fleet_id : fleet_id; [@ocaml.doc " The unique ID of the fleet to create. \n"]
  description : description option; [@ocaml.doc " A brief description of the fleet to create. \n"]
  signal_catalog_arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of a signal catalog. \n"]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_signal = {
  name : fully_qualified_name option; [@ocaml.doc "The name of the signal that isn't valid.\n"]
  reason : string_ option; [@ocaml.doc "A message about why the signal isn't valid.\n"]
}
[@@ocaml.doc "A reason that a signal isn't valid.\n"]

type nonrec invalid_signals = invalid_signal list [@@ocaml.doc ""]

type nonrec invalid_signals_exception = {
  message : string_ option; [@ocaml.doc ""]
  invalid_signals : invalid_signals option; [@ocaml.doc "The signals which caused the exception.\n"]
}
[@@ocaml.doc "The request couldn't be completed because it contains signals that aren't valid.\n"]

type nonrec create_model_manifest_response = {
  name : resource_name; [@ocaml.doc " The name of the created vehicle model.\n"]
  arn : arn; [@ocaml.doc " The ARN of the created vehicle model.\n"]
}
[@@ocaml.doc ""]

type nonrec create_model_manifest_request = {
  name : resource_name; [@ocaml.doc " The name of the vehicle model to create.\n"]
  description : description option; [@ocaml.doc " A brief description of the vehicle model. \n"]
  nodes : list_of_strings;
      [@ocaml.doc " A list of nodes, which are a general abstraction of signals. \n"]
  signal_catalog_arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of a signal catalog. \n"]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the vehicle model.\n"]
}
[@@ocaml.doc ""]

type nonrec node_data_encoding = BINARY [@ocaml.doc ""] | TYPED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec custom_property = {
  fully_qualified_name : string_;
      [@ocaml.doc
        "The fully qualified name of the custom property. For example, the fully qualified name of \
         a custom property might be [ComplexDataTypes.VehicleDataTypes.SVMCamera.FPS].\n"]
  data_type : node_data_type; [@ocaml.doc "The data type for the custom property. \n"]
  data_encoding : node_data_encoding option;
      [@ocaml.doc "Indicates whether the property is binary data.\n"]
  description : description option; [@ocaml.doc "A brief description of the custom property.\n"]
  deprecation_message : message option;
      [@ocaml.doc "The deprecation message for the node or the branch that was moved or deleted.\n"]
  comment : message option; [@ocaml.doc "A comment in addition to the description.\n"]
  struct_fully_qualified_name : node_path option;
      [@ocaml.doc
        "The fully qualified name of the struct node for the custom property if the data type of \
         the custom property is [Struct] or [StructArray]. \n"]
}
[@@ocaml.doc
  "Represents a member of the complex data structure. The data type of the property can be either \
   primitive or another [struct].\n"]

type nonrec custom_struct = {
  fully_qualified_name : string_;
      [@ocaml.doc
        "The fully qualified name of the custom structure. For example, the fully qualified name \
         of a custom structure might be [ComplexDataTypes.VehicleDataTypes.SVMCamera].\n"]
  description : description option; [@ocaml.doc "A brief description of the custom structure.\n"]
  deprecation_message : message option;
      [@ocaml.doc "The deprecation message for the node or the branch that was moved or deleted.\n"]
  comment : message option; [@ocaml.doc "A comment in addition to the description.\n"]
}
[@@ocaml.doc "The custom structure represents a complex or higher-order data structure.\n"]

type nonrec sensor = {
  fully_qualified_name : string_;
      [@ocaml.doc
        "The fully qualified name of the sensor. For example, the fully qualified name of a sensor \
         might be [Vehicle.Body.Engine.Battery].\n"]
  data_type : node_data_type; [@ocaml.doc "The specified data type of the sensor. \n"]
  description : description option; [@ocaml.doc "A brief description of a sensor.\n"]
  unit_ : string_ option;
      [@ocaml.doc "The scientific unit of measurement for data collected by the sensor.\n"]
  allowed_values : list_of_strings option;
      [@ocaml.doc "A list of possible values a sensor can take.\n"]
  min : double option; [@ocaml.doc "The specified possible minimum value of the sensor.\n"]
  max : double option; [@ocaml.doc "The specified possible maximum value of the sensor.\n"]
  deprecation_message : message option;
      [@ocaml.doc "The deprecation message for the node or the branch that was moved or deleted.\n"]
  comment : message option; [@ocaml.doc "A comment in addition to the description.\n"]
  struct_fully_qualified_name : node_path option;
      [@ocaml.doc
        "The fully qualified name of the struct node for a sensor if the data type of the actuator \
         is [Struct] or [StructArray]. For example, the struct fully qualified name of a sensor \
         might be [Vehicle.ADAS.CameraStruct].\n"]
}
[@@ocaml.doc
  "An input component that reports the environmental condition of a vehicle.\n\n\
  \  You can collect data about fluid levels, temperatures, vibrations, or battery voltage from \
   sensors.\n\
  \  \n\
  \   "]

type nonrec node =
  | Branch of branch
      [@ocaml.doc
        "Information about a node specified as a branch.\n\n\
        \  A group of signals that are defined in a hierarchical structure.\n\
        \  \n\
        \   "]
  | Sensor of sensor [@ocaml.doc ""]
  | Actuator of actuator
      [@ocaml.doc
        "Information about a node specified as an actuator.\n\n\
        \  An actuator is a digital representation of a vehicle device.\n\
        \  \n\
        \   "]
  | Attribute of attribute
      [@ocaml.doc
        "Information about a node specified as an attribute.\n\n\
        \  An attribute represents static information about a vehicle.\n\
        \  \n\
        \   "]
  | Struct of custom_struct [@ocaml.doc "Represents a complex or higher-order data structure.\n"]
  | Property of custom_property
      [@ocaml.doc
        "Represents a member of the complex data structure. The [datatype] of the property can be \
         either primitive or another [struct].\n"]
[@@ocaml.doc
  "A general abstraction of a signal. A node can be specified as an actuator, attribute, branch, \
   or sensor.\n"]

type nonrec nodes = node list [@@ocaml.doc ""]

type nonrec invalid_node_exception = {
  invalid_nodes : nodes option; [@ocaml.doc "The specified node type isn't valid.\n"]
  reason : string_ option; [@ocaml.doc "The reason the node validation failed.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified node type doesn't match the expected node type for a node. You can specify the \
   node type as branch, sensor, actuator, or attribute.\n"]

type nonrec create_signal_catalog_response = {
  name : resource_name; [@ocaml.doc " The name of the created signal catalog. \n"]
  arn : arn; [@ocaml.doc " The ARN of the created signal catalog. \n"]
}
[@@ocaml.doc ""]

type nonrec create_signal_catalog_request = {
  name : resource_name; [@ocaml.doc " The name of the signal catalog to create. \n"]
  description : description option; [@ocaml.doc "A brief description of the signal catalog.\n"]
  nodes : nodes option;
      [@ocaml.doc
        " A list of information about nodes, which are a general abstraction of signals. For more \
         information, see the API data type.\n"]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the signal catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_unique_id = string [@@ocaml.doc ""]

type nonrec create_state_template_response = {
  name : resource_name option; [@ocaml.doc "The name of the state template.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the state template.\n"]
  id : resource_unique_id option; [@ocaml.doc "The unique ID of the state template.\n"]
}
[@@ocaml.doc ""]

type nonrec state_template_metadata_extra_dimension_node_path_list = node_path list [@@ocaml.doc ""]

type nonrec state_template_data_extra_dimension_node_path_list = node_path list [@@ocaml.doc ""]

type nonrec state_template_properties = node_path list [@@ocaml.doc ""]

type nonrec create_state_template_request = {
  name : resource_name; [@ocaml.doc "The name of the state template.\n"]
  description : description option; [@ocaml.doc "A brief description of the state template.\n"]
  signal_catalog_arn : arn;
      [@ocaml.doc "The ARN of the signal catalog associated with the state template.\n"]
  state_template_properties : state_template_properties;
      [@ocaml.doc
        "A list of signals from which data is collected. The state template properties contain the \
         fully qualified names of the signals.\n"]
  data_extra_dimensions : state_template_data_extra_dimension_node_path_list option;
      [@ocaml.doc
        "A list of vehicle attributes to associate with the payload published on the state \
         template's MQTT topic. (See \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/process-visualize-data.html#process-last-known-state-vehicle-data} \
         Processing last known state vehicle data using MQTT messaging}). For example, if you add \
         [Vehicle.Attributes.Make] and [Vehicle.Attributes.Model] attributes, Amazon Web Services \
         IoT FleetWise will enrich the protobuf encoded payload with those attributes in the \
         [extraDimensions] field.\n"]
  metadata_extra_dimensions : state_template_metadata_extra_dimension_node_path_list option;
      [@ocaml.doc
        "A list of vehicle attributes to associate with user properties of the messages published \
         on the state template's MQTT topic. (See \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/process-visualize-data.html#process-last-known-state-vehicle-data} \
         Processing last known state vehicle data using MQTT messaging}). For example, if you add \
         [Vehicle.Attributes.Make] and [Vehicle.Attributes.Model] attributes, Amazon Web Services \
         IoT FleetWise will include these attributes as User Properties with the MQTT message.\n\n\
        \ Default: An empty array\n\
        \ "]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the state template.\n"]
}
[@@ocaml.doc ""]

type nonrec create_vehicle_response = {
  vehicle_name : vehicle_name option; [@ocaml.doc "The unique ID of the created vehicle.\n"]
  arn : arn option; [@ocaml.doc " The ARN of the created vehicle. \n"]
  thing_arn : arn option;
      [@ocaml.doc " The ARN of a created or validated Amazon Web Services IoT thing. \n"]
}
[@@ocaml.doc ""]

type nonrec create_vehicle_request = {
  vehicle_name : vehicle_name; [@ocaml.doc " The unique ID of the vehicle to create. \n"]
  model_manifest_arn : arn; [@ocaml.doc " The Amazon Resource Name ARN of a vehicle model. \n"]
  decoder_manifest_arn : arn; [@ocaml.doc " The ARN of a decoder manifest. \n"]
  attributes : attributes_map option;
      [@ocaml.doc
        "Static information about a vehicle in a key-value pair. For example: [\"engineType\"] : \
         [\"1.3 L R2\"] \n\n\
        \ To use attributes with Campaigns or State Templates, you must include them using the \
         request parameters [dataExtraDimensions] and/or [metadataExtraDimensions] (for state \
         templates only) when creating your campaign/state template. \n\
        \ "]
  association_behavior : vehicle_association_behavior option;
      [@ocaml.doc
        " An option to create a new Amazon Web Services IoT thing when creating a vehicle, or to \
         validate an existing Amazon Web Services IoT thing as a vehicle. \n\n\
        \ Default: [\n\
        \         ]\n\
        \ "]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the vehicle.\n"]
  state_templates : state_template_associations option;
      [@ocaml.doc
        "Associate state templates with the vehicle. You can monitor the last known state of the \
         vehicle in near real time.\n"]
}
[@@ocaml.doc ""]

type nonrec decoder_manifest_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec manifest_status =
  | ACTIVE [@ocaml.doc ""]
  | DRAFT [@ocaml.doc ""]
  | INVALID [@ocaml.doc ""]
  | VALIDATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec decoder_manifest_summary = {
  name : string_ option; [@ocaml.doc "The name of the decoder manifest.\n"]
  arn : arn option;
      [@ocaml.doc
        "The ARN of a vehicle model (model manifest) associated with the decoder manifest. \n"]
  model_manifest_arn : arn option;
      [@ocaml.doc
        "The ARN of a vehicle model (model manifest) associated with the decoder manifest.\n"]
  description : description option; [@ocaml.doc "A brief description of the decoder manifest.\n"]
  status : manifest_status option;
      [@ocaml.doc
        "The state of the decoder manifest. If the status is [ACTIVE], the decoder manifest can't \
         be edited. If the status is marked [DRAFT], you can edit the decoder manifest.\n"]
  creation_time : timestamp;
      [@ocaml.doc
        "The time the decoder manifest was created in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  last_modification_time : timestamp;
      [@ocaml.doc
        "The time the decoder manifest was last updated in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  message : message option;
      [@ocaml.doc
        "The detailed message for the decoder manifest. When a decoder manifest is in an [INVALID] \
         status, the message contains detailed reason and help information.\n"]
}
[@@ocaml.doc
  "Information about a created decoder manifest. You can use the API operation to return this \
   information about multiple decoder manifests.\n"]

type nonrec delete_campaign_response = {
  name : campaign_name option; [@ocaml.doc "The name of the deleted campaign.\n"]
  arn : campaign_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the deleted campaign.\n\n\
        \  The ARN isn\226\128\153t returned if a campaign doesn\226\128\153t exist.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_campaign_request = {
  name : campaign_name; [@ocaml.doc " The name of the campaign to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_decoder_manifest_response = {
  name : resource_name; [@ocaml.doc "The name of the deleted decoder manifest.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted decoder manifest.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_decoder_manifest_request = {
  name : resource_name; [@ocaml.doc " The name of the decoder manifest to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_response = {
  id : fleet_id option; [@ocaml.doc "The ID of the deleted fleet.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_request = {
  fleet_id : fleet_id; [@ocaml.doc " The ID of the fleet to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_model_manifest_response = {
  name : resource_name; [@ocaml.doc "The name of the deleted model manifest.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted model manifest.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_model_manifest_request = {
  name : resource_name; [@ocaml.doc " The name of the model manifest to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_signal_catalog_response = {
  name : resource_name; [@ocaml.doc "The name of the deleted signal catalog.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted signal catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_signal_catalog_request = {
  name : resource_name; [@ocaml.doc " The name of the signal catalog to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_state_template_response = {
  name : resource_name option; [@ocaml.doc "The name of the state template.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the state template.\n"]
  id : resource_unique_id option; [@ocaml.doc "The unique ID of the state template.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_state_template_request = {
  identifier : resource_identifier; [@ocaml.doc "The unique ID of the state template.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_vehicle_response = {
  vehicle_name : vehicle_name; [@ocaml.doc "The ID of the deleted vehicle.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted vehicle.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_vehicle_request = {
  vehicle_name : vehicle_name; [@ocaml.doc "The ID of the vehicle to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_vehicle_fleet_response = unit [@@ocaml.doc ""]

type nonrec disassociate_vehicle_fleet_request = {
  vehicle_name : vehicle_name;
      [@ocaml.doc " The unique ID of the vehicle to disassociate from the fleet.\n"]
  fleet_id : fleet_id; [@ocaml.doc " The unique ID of a fleet. \n"]
}
[@@ocaml.doc ""]

type nonrec encryption_status =
  | PENDING [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_type =
  | KMS_BASED_ENCRYPTION [@ocaml.doc ""]
  | FLEETWISE_DEFAULT_ENCRYPTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleet_association_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec fleet_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec fleet_summary = {
  id : fleet_id; [@ocaml.doc "The unique ID of the fleet.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the fleet.\n"]
  description : description option; [@ocaml.doc "A brief description of the fleet.\n"]
  signal_catalog_arn : arn;
      [@ocaml.doc "The ARN of the signal catalog associated with the fleet.\n"]
  creation_time : timestamp;
      [@ocaml.doc
        "The time the fleet was created, in seconds since epoch (January 1, 1970 at midnight UTC \
         time).\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The time the fleet was last updated in seconds since epoch (January 1, 1970 at midnight \
         UTC time).\n"]
}
[@@ocaml.doc
  "Information about a fleet.\n\n\
  \ You can use the API operation to return this information about multiple fleets.\n\
  \ "]

type nonrec formatted_vss =
  | VssJson of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc "Provides the VSS in JSON format.\n"]
[@@ocaml.doc
  " \
   {{:https://www.w3.org/auto/wg/wiki/Vehicle_Signal_Specification_(VSS)/Vehicle_Data_Spec}Vehicle \
   Signal Specification (VSS)} is a precise language used to describe and model signals in vehicle \
   networks. The JSON file collects signal specificiations in a VSS format.\n"]

type nonrec fqns = fully_qualified_name list [@@ocaml.doc ""]

type nonrec get_campaign_response = {
  name : campaign_name option; [@ocaml.doc "The name of the campaign.\n"]
  arn : campaign_arn option; [@ocaml.doc " The Amazon Resource Name (ARN) of the campaign. \n"]
  description : description option; [@ocaml.doc "The description of the campaign.\n"]
  signal_catalog_arn : arn option; [@ocaml.doc " The ARN of a signal catalog. \n"]
  target_arn : arn option;
      [@ocaml.doc " The ARN of the vehicle or the fleet targeted by the campaign. \n"]
  status : campaign_status option;
      [@ocaml.doc
        "The state of the campaign. The status can be one of: [CREATING], [WAITING_FOR_APPROVAL], \
         [RUNNING], and [SUSPENDED]. \n"]
  start_time : timestamp option;
      [@ocaml.doc " The time, in milliseconds, to deliver a campaign after it was approved.\n"]
  expiry_time : timestamp option;
      [@ocaml.doc
        " The time the campaign expires, in seconds since epoch (January 1, 1970 at midnight UTC \
         time). Vehicle data won't be collected after the campaign expires.\n"]
  post_trigger_collection_duration : uint32 option;
      [@ocaml.doc
        " How long (in seconds) to collect raw data after a triggering event initiates the \
         collection. \n"]
  diagnostics_mode : diagnostics_mode option;
      [@ocaml.doc
        " Option for a vehicle to send diagnostic trouble codes to Amazon Web Services IoT \
         FleetWise. \n"]
  spooling_mode : spooling_mode option;
      [@ocaml.doc
        " Whether to store collected data after a vehicle lost a connection with the cloud. After \
         a connection is re-established, the data is automatically forwarded to Amazon Web \
         Services IoT FleetWise. \n"]
  compression : compression option;
      [@ocaml.doc
        " Whether to compress signals before transmitting data to Amazon Web Services IoT \
         FleetWise. If [OFF] is specified, the signals aren't compressed. If it's not specified, \
         [SNAPPY] is used. \n"]
  priority : priority option;
      [@ocaml.doc
        " A number indicating the priority of one campaign over another campaign for a certain \
         vehicle or fleet. A campaign with the lowest value is deployed to vehicles before any \
         other campaigns.\n"]
  signals_to_collect : signal_information_list option;
      [@ocaml.doc " Information about a list of signals to collect data on. \n"]
  collection_scheme : collection_scheme option;
      [@ocaml.doc " Information about the data collection scheme associated with the campaign. \n"]
  data_extra_dimensions : data_extra_dimension_node_path_list option;
      [@ocaml.doc " A list of vehicle attributes associated with the campaign. \n"]
  creation_time : timestamp option;
      [@ocaml.doc
        " The time the campaign was created in seconds since epoch (January 1, 1970 at midnight \
         UTC time). \n"]
  last_modification_time : timestamp option;
      [@ocaml.doc "The last time the campaign was modified.\n"]
  data_destination_configs : data_destination_configs option;
      [@ocaml.doc
        "The destination where the campaign sends data. You can send data to an MQTT topic, or \
         store it in Amazon S3 or Amazon Timestream.\n\n\
        \ MQTT is the publish/subscribe messaging protocol used by Amazon Web Services IoT to \
         communicate with your devices.\n\
        \ \n\
        \  Amazon S3 optimizes the cost of data storage and provides additional mechanisms to use \
         vehicle data, such as data lakes, centralized data storage, data processing pipelines, \
         and analytics. \n\
        \  \n\
        \   You can use Amazon Timestream to access and analyze time series data, and Timestream \
         to query vehicle data so that you can identify trends and patterns.\n\
        \   "]
  data_partitions : data_partitions option;
      [@ocaml.doc "The data partitions associated with the signals collected from the vehicle.\n"]
  signals_to_fetch : signal_fetch_information_list option;
      [@ocaml.doc "Information about a list of signals to fetch data from.\n"]
}
[@@ocaml.doc ""]

type nonrec get_campaign_request = {
  name : campaign_name; [@ocaml.doc " The name of the campaign to retrieve information about. \n"]
}
[@@ocaml.doc ""]

type nonrec get_decoder_manifest_response = {
  name : string_; [@ocaml.doc " The name of the decoder manifest. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the decoder manifest. \n"]
  description : description option; [@ocaml.doc " A brief description of the decoder manifest.\n"]
  model_manifest_arn : arn option;
      [@ocaml.doc
        " The ARN of a vehicle model (model manifest) associated with the decoder manifest.\n"]
  status : manifest_status option;
      [@ocaml.doc
        " The state of the decoder manifest. If the status is [ACTIVE], the decoder manifest can't \
         be edited. If the status is marked [DRAFT], you can edit the decoder manifest.\n"]
  creation_time : timestamp;
      [@ocaml.doc
        " The time the decoder manifest was created in seconds since epoch (January 1, 1970 at \
         midnight UTC time). \n"]
  last_modification_time : timestamp;
      [@ocaml.doc
        " The time the decoder manifest was last updated in seconds since epoch (January 1, 1970 \
         at midnight UTC time). \n"]
  message : message option;
      [@ocaml.doc
        "The detailed message for the decoder manifest. When a decoder manifest is in an [INVALID] \
         status, the message contains detailed reason and help information.\n"]
}
[@@ocaml.doc ""]

type nonrec get_decoder_manifest_request = {
  name : resource_name;
      [@ocaml.doc " The name of the decoder manifest to retrieve information about. \n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec get_encryption_configuration_response = {
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the KMS key that is used for encryption.\n"]
  encryption_status : encryption_status; [@ocaml.doc "The encryption status.\n"]
  encryption_type : encryption_type;
      [@ocaml.doc
        "The type of encryption. Set to [KMS_BASED_ENCRYPTION] to use a KMS key that you own and \
         manage. Set to [FLEETWISE_DEFAULT_ENCRYPTION] to use an Amazon Web Services managed key \
         that is owned by the Amazon Web Services IoT FleetWise service account.\n"]
  error_message : error_message option;
      [@ocaml.doc
        "The error message that describes why encryption settings couldn't be configured, if \
         applicable.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The time when encryption was configured in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The time when encryption was last updated in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
}
[@@ocaml.doc ""]

type nonrec get_encryption_configuration_request = unit [@@ocaml.doc ""]

type nonrec get_fleet_response = {
  id : fleet_id; [@ocaml.doc " The ID of the fleet.\n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the fleet. \n"]
  description : description option; [@ocaml.doc " A brief description of the fleet. \n"]
  signal_catalog_arn : arn;
      [@ocaml.doc " The ARN of a signal catalog associated with the fleet. \n"]
  creation_time : timestamp;
      [@ocaml.doc
        " The time the fleet was created in seconds since epoch (January 1, 1970 at midnight UTC \
         time). \n"]
  last_modification_time : timestamp;
      [@ocaml.doc
        " The time the fleet was last updated, in seconds since epoch (January 1, 1970 at midnight \
         UTC time). \n"]
}
[@@ocaml.doc ""]

type nonrec get_fleet_request = {
  fleet_id : fleet_id; [@ocaml.doc " The ID of the fleet to retrieve information about. \n"]
}
[@@ocaml.doc ""]

type nonrec get_logging_options_response = {
  cloud_watch_log_delivery : cloud_watch_log_delivery_options;
      [@ocaml.doc "Returns information about log delivery to Amazon CloudWatch Logs.\n"]
}
[@@ocaml.doc ""]

type nonrec get_logging_options_request = unit [@@ocaml.doc ""]

type nonrec get_model_manifest_response = {
  name : resource_name; [@ocaml.doc " The name of the vehicle model. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the vehicle model. \n"]
  description : description option; [@ocaml.doc " A brief description of the vehicle model. \n"]
  signal_catalog_arn : arn option;
      [@ocaml.doc " The ARN of the signal catalog associated with the vehicle model. \n"]
  status : manifest_status option;
      [@ocaml.doc
        " The state of the vehicle model. If the status is [ACTIVE], the vehicle model can't be \
         edited. You can edit the vehicle model if the status is marked [DRAFT].\n"]
  creation_time : timestamp;
      [@ocaml.doc
        "The time the vehicle model was created, in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  last_modification_time : timestamp; [@ocaml.doc "The last time the vehicle model was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec get_model_manifest_request = {
  name : resource_name;
      [@ocaml.doc " The name of the vehicle model to retrieve information about. \n"]
}
[@@ocaml.doc ""]

type nonrec registration_status =
  | REGISTRATION_PENDING [@ocaml.doc ""]
  | REGISTRATION_SUCCESS [@ocaml.doc ""]
  | REGISTRATION_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iam_registration_response = {
  role_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the IAM role to register.\n"]
  registration_status : registration_status;
      [@ocaml.doc
        "The status of registering your IAM resource. The status can be one of \
         [REGISTRATION_SUCCESS], [REGISTRATION_PENDING], [REGISTRATION_FAILURE].\n"]
  error_message : error_message option;
      [@ocaml.doc "A message associated with a registration error.\n"]
}
[@@ocaml.doc
  "Information about registering an Identity and Access Management (IAM) resource so Amazon Web \
   Services IoT FleetWise edge agent software can transfer your vehicle data to Amazon Timestream.\n"]

type nonrec timestream_table_name = string [@@ocaml.doc ""]

type nonrec timestream_database_name = string [@@ocaml.doc ""]

type nonrec timestream_registration_response = {
  timestream_database_name : timestream_database_name;
      [@ocaml.doc "The name of the Timestream database.\n"]
  timestream_table_name : timestream_table_name;
      [@ocaml.doc "The name of the Timestream database table.\n"]
  timestream_database_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Timestream database.\n"]
  timestream_table_arn : arn option; [@ocaml.doc "The ARN of the Timestream database table.\n"]
  registration_status : registration_status;
      [@ocaml.doc
        "The status of registering your Amazon Timestream resources. The status can be one of \
         [REGISTRATION_SUCCESS], [REGISTRATION_PENDING], [REGISTRATION_FAILURE].\n"]
  error_message : error_message option;
      [@ocaml.doc "A message associated with a registration error.\n"]
}
[@@ocaml.doc "Information about the registered Amazon Timestream resources or errors, if any.\n"]

type nonrec customer_account_id = string [@@ocaml.doc ""]

type nonrec get_register_account_status_response = {
  customer_account_id : customer_account_id;
      [@ocaml.doc
        " The unique ID of the Amazon Web Services account, provided at account creation. \n"]
  account_status : registration_status;
      [@ocaml.doc
        " The status of registering your account and resources. The status can be one of:\n\n\
        \ {ul\n\
        \       {-   [REGISTRATION_SUCCESS] - The Amazon Web Services resource is successfully \
         registered.\n\
        \           \n\
        \            }\n\
        \       {-   [REGISTRATION_PENDING] - Amazon Web Services IoT FleetWise is processing the \
         registration request. This process takes approximately five minutes to complete.\n\
        \           \n\
        \            }\n\
        \       {-   [REGISTRATION_FAILURE] - Amazon Web Services IoT FleetWise can't register the \
         AWS resource. Try again later.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  timestream_registration_response : timestream_registration_response option;
      [@ocaml.doc
        " Information about the registered Amazon Timestream resources or errors, if any.\n"]
  iam_registration_response : iam_registration_response;
      [@ocaml.doc " Information about the registered IAM resources or errors, if any. \n"]
  creation_time : timestamp;
      [@ocaml.doc
        " The time the account was registered, in seconds since epoch (January 1, 1970 at midnight \
         UTC time). \n"]
  last_modification_time : timestamp;
      [@ocaml.doc
        " The time this registration was last updated, in seconds since epoch (January 1, 1970 at \
         midnight UTC time). \n"]
}
[@@ocaml.doc ""]

type nonrec get_register_account_status_request = unit [@@ocaml.doc ""]

type nonrec node_counts = {
  total_nodes : number option; [@ocaml.doc "The total number of nodes in a vehicle network.\n"]
  total_branches : number option;
      [@ocaml.doc "The total number of nodes in a vehicle network that represent branches.\n"]
  total_sensors : number option;
      [@ocaml.doc "The total number of nodes in a vehicle network that represent sensors.\n"]
  total_attributes : number option;
      [@ocaml.doc "The total number of nodes in a vehicle network that represent attributes.\n"]
  total_actuators : number option;
      [@ocaml.doc "The total number of nodes in a vehicle network that represent actuators.\n"]
  total_structs : number option; [@ocaml.doc "The total structure for the node.\n"]
  total_properties : number option; [@ocaml.doc "The total properties for the node.\n"]
}
[@@ocaml.doc "Information about the number of nodes and node types in a vehicle network.\n"]

type nonrec get_signal_catalog_response = {
  name : resource_name; [@ocaml.doc " The name of the signal catalog. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the signal catalog. \n"]
  description : description option; [@ocaml.doc " A brief description of the signal catalog. \n"]
  node_counts : node_counts option;
      [@ocaml.doc " The total number of network nodes specified in a signal catalog. \n"]
  creation_time : timestamp;
      [@ocaml.doc
        " The time the signal catalog was created in seconds since epoch (January 1, 1970 at \
         midnight UTC time). \n"]
  last_modification_time : timestamp; [@ocaml.doc "The last time the signal catalog was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec get_signal_catalog_request = {
  name : resource_name;
      [@ocaml.doc " The name of the signal catalog to retrieve information about. \n"]
}
[@@ocaml.doc ""]

type nonrec get_state_template_response = {
  name : resource_name option; [@ocaml.doc "The name of the state template.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the state template.\n"]
  description : description option; [@ocaml.doc "A brief description of the state template.\n"]
  signal_catalog_arn : arn option;
      [@ocaml.doc "The ARN of the signal catalog associated with the state template.\n"]
  state_template_properties : state_template_properties option;
      [@ocaml.doc
        "A list of signals from which data is collected. The state template properties contain the \
         fully qualified names of the signals.\n"]
  data_extra_dimensions : state_template_data_extra_dimension_node_path_list option;
      [@ocaml.doc
        "A list of vehicle attributes associated with the payload published on the state \
         template's MQTT topic. \n\n\
        \ Default: An empty array\n\
        \ "]
  metadata_extra_dimensions : state_template_metadata_extra_dimension_node_path_list option;
      [@ocaml.doc
        "A list of vehicle attributes to associate with user properties of the messages published \
         on the state template's MQTT topic.\n\n\
        \ Default: An empty array\n\
        \ "]
  creation_time : timestamp option;
      [@ocaml.doc
        "The time the state template was created in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The time the state template was last updated in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  id : resource_unique_id option; [@ocaml.doc "The unique ID of the state template.\n"]
}
[@@ocaml.doc ""]

type nonrec get_state_template_request = {
  identifier : resource_identifier; [@ocaml.doc "The unique ID of the state template.\n"]
}
[@@ocaml.doc ""]

type nonrec get_vehicle_response = {
  vehicle_name : vehicle_name option; [@ocaml.doc "The ID of the vehicle.\n"]
  arn : arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the vehicle to retrieve information about. \n"]
  model_manifest_arn : arn option;
      [@ocaml.doc " The ARN of a vehicle model (model manifest) associated with the vehicle. \n"]
  decoder_manifest_arn : arn option;
      [@ocaml.doc " The ARN of a decoder manifest associated with the vehicle. \n"]
  attributes : attributes_map option;
      [@ocaml.doc
        "Static information about a vehicle in a key-value pair. For example:\n\n\
        \  [\"engineType\"] : [\"1.3 L R2\"] \n\
        \ "]
  state_templates : state_template_associations option;
      [@ocaml.doc "State templates associated with the vehicle.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        " The time the vehicle was created in seconds since epoch (January 1, 1970 at midnight UTC \
         time). \n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        " The time the vehicle was last updated in seconds since epoch (January 1, 1970 at \
         midnight UTC time). \n"]
}
[@@ocaml.doc ""]

type nonrec get_vehicle_request = {
  vehicle_name : vehicle_name;
      [@ocaml.doc " The ID of the vehicle to retrieve information about. \n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec vehicle_state =
  | CREATED [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | READY_FOR_CHECKIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec vehicle_status = {
  campaign_name : campaign_name option; [@ocaml.doc "The name of a campaign.\n"]
  vehicle_name : vehicle_name option; [@ocaml.doc "The unique ID of the vehicle.\n"]
  status : vehicle_state option;
      [@ocaml.doc
        "The status of a campaign, which can be one of the following:\n\n\
        \ {ul\n\
        \       {-   [CREATED] - The campaign exists but is not yet approved.\n\
        \           \n\
        \            }\n\
        \       {-   [READY] - The campaign is approved but has not been deployed to the vehicle. \
         Data has not arrived at the vehicle yet.\n\
        \           \n\
        \            }\n\
        \       {-   [HEALTHY] - The campaign is deployed to the vehicle.\n\
        \           \n\
        \            }\n\
        \       {-   [SUSPENDED] - The campaign is suspended and data collection is paused.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - The campaign is being removed from the vehicle.\n\
        \           \n\
        \            }\n\
        \       {-   [READY_FOR_CHECKIN] - The campaign is approved and waiting for vehicle \
         check-in before deployment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about a campaign associated with a vehicle.\n"]

type nonrec vehicle_status_list = vehicle_status list [@@ocaml.doc ""]

type nonrec get_vehicle_status_response = {
  campaigns : vehicle_status_list option;
      [@ocaml.doc " Lists information about the state of the vehicle with deployed campaigns. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec get_vehicle_status_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. This parameter is \
         only supported for resources of type [CAMPAIGN].\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return, between 1 and 100, inclusive. This parameter is \
         only supported for resources of type [CAMPAIGN].\n"]
  vehicle_name : vehicle_name;
      [@ocaml.doc " The ID of the vehicle to retrieve information about. \n"]
}
[@@ocaml.doc ""]

type nonrec iam_resources = {
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM resource that allows Amazon Web Services IoT \
         FleetWise to send data to Amazon Timestream. For example, \
         [arn:aws:iam::123456789012:role/SERVICE-ROLE-ARN]. \n"]
}
[@@ocaml.doc
  "The IAM resource that enables Amazon Web Services IoT FleetWise edge agent software to send \
   data to Amazon Timestream. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html}IAM roles} in the {i Identity \
   and Access Management User Guide}.\n\
  \ "]

type nonrec import_decoder_manifest_response = {
  name : resource_name; [@ocaml.doc " The name of the imported decoder manifest. \n"]
  arn : arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the decoder manifest that was imported. \n"]
}
[@@ocaml.doc ""]

type nonrec network_file_definition =
  | CanDbc of can_dbc_definition
      [@ocaml.doc
        "Information, including CAN DBC files, about the configurations used to create a decoder \
         manifest.\n"]
[@@ocaml.doc "Specifications for defining a vehicle network.\n"]

type nonrec network_file_definitions = network_file_definition list [@@ocaml.doc ""]

type nonrec import_decoder_manifest_request = {
  name : resource_name; [@ocaml.doc " The name of the decoder manifest to import. \n"]
  network_file_definitions : network_file_definitions;
      [@ocaml.doc " The file to load into an Amazon Web Services account. \n"]
}
[@@ocaml.doc ""]

type nonrec import_signal_catalog_response = {
  name : resource_name; [@ocaml.doc " The name of the imported signal catalog. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the imported signal catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec import_signal_catalog_request = {
  name : resource_name; [@ocaml.doc "The name of the signal catalog to import.\n"]
  description : description option; [@ocaml.doc " A brief description of the signal catalog. \n"]
  vss : formatted_vss option;
      [@ocaml.doc
        "The contents of the Vehicle Signal Specification (VSS) configuration. VSS is a precise \
         language used to describe and model signals in vehicle networks.\n"]
  tags : tag_list option; [@ocaml.doc "Metadata that can be used to manage the signal catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec interface_ids = interface_id list [@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The ARN of the resource.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc "A list of the keys of the tags to be removed from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The ARN of the resource.\n"]
  tags : tag_list; [@ocaml.doc "The new or modified tags for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec timestream_resources = {
  timestream_database_name : timestream_database_name;
      [@ocaml.doc "The name of the registered Amazon Timestream database.\n"]
  timestream_table_name : timestream_table_name;
      [@ocaml.doc "The name of the registered Amazon Timestream database table.\n"]
}
[@@ocaml.doc
  "The registered Amazon Timestream resources that Amazon Web Services IoT FleetWise edge agent \
   software can transfer your vehicle data to.\n"]

type nonrec register_account_response = {
  register_account_status : registration_status;
      [@ocaml.doc
        " The status of registering your Amazon Web Services account, IAM role, and Timestream \
         resources. \n"]
  timestream_resources : timestream_resources option; [@ocaml.doc ""]
  iam_resources : iam_resources;
      [@ocaml.doc
        " The registered IAM resource that allows Amazon Web Services IoT FleetWise to send data \
         to Amazon Timestream. \n"]
  creation_time : timestamp;
      [@ocaml.doc
        " The time the account was registered, in seconds since epoch (January 1, 1970 at midnight \
         UTC time). \n"]
  last_modification_time : timestamp;
      [@ocaml.doc
        " The time this registration was last updated, in seconds since epoch (January 1, 1970 at \
         midnight UTC time). \n"]
}
[@@ocaml.doc ""]

type nonrec register_account_request = {
  timestream_resources : timestream_resources option; [@ocaml.doc ""]
  iam_resources : iam_resources option;
      [@ocaml.doc
        "The IAM resource that allows Amazon Web Services IoT FleetWise to send data to Amazon \
         Timestream.\n"]
}
[@@ocaml.doc ""]

type nonrec put_logging_options_response = unit [@@ocaml.doc ""]

type nonrec put_logging_options_request = {
  cloud_watch_log_delivery : cloud_watch_log_delivery_options;
      [@ocaml.doc "Creates or updates the log delivery option to Amazon CloudWatch Logs.\n"]
}
[@@ocaml.doc ""]

type nonrec put_encryption_configuration_response = {
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the KMS key that is used for encryption.\n"]
  encryption_status : encryption_status; [@ocaml.doc "The encryption status.\n"]
  encryption_type : encryption_type;
      [@ocaml.doc
        "The type of encryption. Set to [KMS_BASED_ENCRYPTION] to use an KMS key that you own and \
         manage. Set to [FLEETWISE_DEFAULT_ENCRYPTION] to use an Amazon Web Services managed key \
         that is owned by the Amazon Web Services IoT FleetWise service account.\n"]
}
[@@ocaml.doc ""]

type nonrec put_encryption_configuration_request = {
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the KMS key that is used for encryption.\n"]
  encryption_type : encryption_type;
      [@ocaml.doc
        "The type of encryption. Choose [KMS_BASED_ENCRYPTION] to use a KMS key or \
         [FLEETWISE_DEFAULT_ENCRYPTION] to use an Amazon Web Services managed key.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The list of tags assigned to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The ARN of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec campaign_summaries = campaign_summary list [@@ocaml.doc ""]

type nonrec list_campaigns_response = {
  campaign_summaries : campaign_summaries option;
      [@ocaml.doc " A summary of information about each campaign. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_response_scope = METADATA_ONLY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec status_str = string [@@ocaml.doc ""]

type nonrec list_campaigns_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
  status : status_str option;
      [@ocaml.doc
        "An optional parameter to filter the results by the status of each created campaign in \
         your account. The status can be one of: [CREATING], [WAITING_FOR_APPROVAL], [RUNNING], or \
         [SUSPENDED].\n"]
  list_response_scope : list_response_scope option;
      [@ocaml.doc
        "When you set the [listResponseScope] parameter to [METADATA_ONLY], the list response \
         includes: campaign name, Amazon Resource Name (ARN), creation time, and last modification \
         time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_decoder_manifest_network_interfaces_response = {
  network_interfaces : network_interfaces option;
      [@ocaml.doc " A list of information about network interfaces. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_decoder_manifest_network_interfaces_request = {
  name : resource_name;
      [@ocaml.doc " The name of the decoder manifest to list information about. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]

type nonrec list_decoder_manifest_signals_response = {
  signal_decoders : signal_decoders option;
      [@ocaml.doc " Information about a list of signals to decode. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_decoder_manifest_signals_request = {
  name : resource_name;
      [@ocaml.doc " The name of the decoder manifest to list information about. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]

type nonrec decoder_manifest_summaries = decoder_manifest_summary list [@@ocaml.doc ""]

type nonrec list_decoder_manifests_response = {
  summaries : decoder_manifest_summaries option;
      [@ocaml.doc " A list of information about each decoder manifest. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_decoder_manifests_request = {
  model_manifest_arn : arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of a vehicle model (model manifest) associated with the \
         decoder manifest. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
  list_response_scope : list_response_scope option;
      [@ocaml.doc
        "When you set the [listResponseScope] parameter to [METADATA_ONLY], the list response \
         includes: decoder manifest name, Amazon Resource Name (ARN), creation time, and last \
         modification time.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_summaries = fleet_summary list [@@ocaml.doc ""]

type nonrec list_fleets_response = {
  fleet_summaries : fleet_summaries option; [@ocaml.doc " A list of information for each fleet. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_fleets_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
  list_response_scope : list_response_scope option;
      [@ocaml.doc
        "When you set the [listResponseScope] parameter to [METADATA_ONLY], the list response \
         includes: fleet ID, Amazon Resource Name (ARN), creation time, and last modification time.\n"]
}
[@@ocaml.doc ""]

type nonrec fleets = fleet_id list [@@ocaml.doc ""]

type nonrec list_fleets_for_vehicle_response = {
  fleets : fleets option;
      [@ocaml.doc " A list of fleet IDs that the vehicle is associated with. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_fleets_for_vehicle_request = {
  vehicle_name : vehicle_name;
      [@ocaml.doc " The ID of the vehicle to retrieve information about. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]

type nonrec list_model_manifest_nodes_response = {
  nodes : nodes option; [@ocaml.doc " A list of information about nodes. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_model_manifest_nodes_request = {
  name : resource_name; [@ocaml.doc " The name of the vehicle model to list information about. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]

type nonrec model_manifest_summary = {
  name : string_ option; [@ocaml.doc "The name of the vehicle model.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the vehicle model.\n"]
  signal_catalog_arn : arn option;
      [@ocaml.doc "The ARN of the signal catalog associated with the vehicle model.\n"]
  description : description option; [@ocaml.doc "A brief description of the vehicle model.\n"]
  status : manifest_status option;
      [@ocaml.doc
        "The state of the vehicle model. If the status is [ACTIVE], the vehicle model can't be \
         edited. If the status is [DRAFT], you can edit the vehicle model.\n"]
  creation_time : timestamp;
      [@ocaml.doc
        "The time the vehicle model was created, in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  last_modification_time : timestamp;
      [@ocaml.doc
        "The time the vehicle model was last updated, in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
}
[@@ocaml.doc
  "Information about a vehicle model (model manifest). You can use the API operation to return \
   this information about multiple vehicle models.\n"]

type nonrec model_manifest_summaries = model_manifest_summary list [@@ocaml.doc ""]

type nonrec list_model_manifests_response = {
  summaries : model_manifest_summaries option;
      [@ocaml.doc " A list of information about vehicle models.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_model_manifests_request = {
  signal_catalog_arn : arn option;
      [@ocaml.doc
        " The ARN of a signal catalog. If you specify a signal catalog, only the vehicle models \
         associated with it are returned.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
  list_response_scope : list_response_scope option;
      [@ocaml.doc
        "When you set the [listResponseScope] parameter to [METADATA_ONLY], the list response \
         includes: model manifest name, Amazon Resource Name (ARN), creation time, and last \
         modification time.\n"]
}
[@@ocaml.doc ""]

type nonrec list_signal_catalog_nodes_response = {
  nodes : nodes option; [@ocaml.doc " A list of information about nodes. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec signal_node_type =
  | SENSOR [@ocaml.doc ""]
  | ACTUATOR [@ocaml.doc ""]
  | ATTRIBUTE [@ocaml.doc ""]
  | BRANCH [@ocaml.doc ""]
  | CUSTOM_STRUCT [@ocaml.doc ""]
  | CUSTOM_PROPERTY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_signal_catalog_nodes_request = {
  name : resource_name; [@ocaml.doc " The name of the signal catalog to list information about. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
  signal_node_type : signal_node_type option;
      [@ocaml.doc "The type of node in the signal catalog.\n"]
}
[@@ocaml.doc ""]

type nonrec signal_catalog_summary = {
  name : string_ option; [@ocaml.doc "The name of the signal catalog.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the signal catalog.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The time the signal catalog was created in seconds since epoch (January 1, 1970 at \
         midnight UTC time). \n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The time the signal catalog was last updated in seconds since epoch (January 1, 1970 at \
         midnight UTC time). \n"]
}
[@@ocaml.doc
  "Information about a collection of standardized signals, which can be attributes, branches, \
   sensors, or actuators.\n"]

type nonrec signal_catalog_summaries = signal_catalog_summary list [@@ocaml.doc ""]

type nonrec list_signal_catalogs_response = {
  summaries : signal_catalog_summaries option;
      [@ocaml.doc " A list of information about each signal catalog. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_signal_catalogs_request = {
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]

type nonrec state_template_summary = {
  name : resource_name option; [@ocaml.doc "The name of the state template.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the state template.\n"]
  signal_catalog_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the signal catalog associated with the state template.\n"]
  description : description option; [@ocaml.doc "A brief description of the state template.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "The time the state template was created, in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  last_modification_time : timestamp option;
      [@ocaml.doc
        "The time the state template was last updated, in seconds since epoch (January 1, 1970 at \
         midnight UTC time).\n"]
  id : resource_unique_id option; [@ocaml.doc "The unique ID of the state template.\n"]
}
[@@ocaml.doc
  "Information about a state template.\n\n\
  \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
   Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
   Developer Guide}.\n\
  \  \n\
  \   "]

type nonrec state_template_summaries = state_template_summary list [@@ocaml.doc ""]

type nonrec list_state_templates_response = {
  summaries : state_template_summaries option;
      [@ocaml.doc "A list of information about each state template.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_state_templates_request = {
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
  list_response_scope : list_response_scope option;
      [@ocaml.doc
        "When you set the [listResponseScope] parameter to [METADATA_ONLY], the list response \
         includes: state template ID, Amazon Resource Name (ARN), creation time, and last \
         modification time.\n"]
}
[@@ocaml.doc ""]

type nonrec vehicle_summary = {
  vehicle_name : vehicle_name; [@ocaml.doc "The unique ID of the vehicle.\n"]
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the vehicle.\n"]
  model_manifest_arn : arn;
      [@ocaml.doc "The ARN of a vehicle model (model manifest) associated with the vehicle.\n"]
  decoder_manifest_arn : arn;
      [@ocaml.doc "The ARN of a decoder manifest associated with the vehicle.\n"]
  creation_time : timestamp;
      [@ocaml.doc
        "The time the vehicle was created in seconds since epoch (January 1, 1970 at midnight UTC \
         time).\n"]
  last_modification_time : timestamp;
      [@ocaml.doc
        "The time the vehicle was last updated in seconds since epoch (January 1, 1970 at midnight \
         UTC time). \n"]
  attributes : attributes_map option;
      [@ocaml.doc
        "Static information about a vehicle in a key-value pair. For example:\n\n\
        \  [\"engineType\"] : [\"1.3 L R2\"] \n\
        \ "]
}
[@@ocaml.doc
  "Information about a vehicle.\n\n\
  \ To return this information about vehicles in your account, you can use the API operation.\n\
  \ "]

type nonrec vehicle_summaries = vehicle_summary list [@@ocaml.doc ""]

type nonrec list_vehicles_response = {
  vehicle_summaries : vehicle_summaries option;
      [@ocaml.doc " A list of vehicles and information about them. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_vehicles_max_results = int [@@ocaml.doc ""]

type nonrec attribute_values_list = attribute_value list [@@ocaml.doc ""]

type nonrec attribute_names_list = attribute_name list [@@ocaml.doc ""]

type nonrec list_vehicles_request = {
  model_manifest_arn : arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of a vehicle model (model manifest). You can use this \
         optional parameter to list only the vehicles created from a certain vehicle model. \n"]
  attribute_names : attribute_names_list option;
      [@ocaml.doc
        "The fully qualified names of the attributes. You can use this optional parameter to list \
         the vehicles containing all the attributes in the request. For example, [attributeNames] \
         could be \"[Vehicle.Body.Engine.Type, Vehicle.Color]\" and the corresponding \
         [attributeValues] could be \"[1.3 L R2, Blue]\" . In this case, the API will filter \
         vehicles with an attribute name [Vehicle.Body.Engine.Type] that contains a value of [1.3 \
         L R2] AND an attribute name [Vehicle.Color] that contains a value of \"[Blue]\". A \
         request must contain unique values for the [attributeNames] filter and the matching \
         number of [attributeValues] filters to return the subset of vehicles that match the \
         attributes filter condition.\n"]
  attribute_values : attribute_values_list option;
      [@ocaml.doc
        "Static information about a vehicle attribute value in string format. You can use this \
         optional parameter in conjunction with [attributeNames] to list the vehicles containing \
         all the [attributeValues] corresponding to the [attributeNames] filter. For example, \
         [attributeValues] could be \"[1.3 L R2, Blue]\" and the corresponding [attributeNames] \
         filter could be \"[Vehicle.Body.Engine.Type, Vehicle.Color]\". In this case, the API will \
         filter vehicles with attribute name [Vehicle.Body.Engine.Type] that contains a value of \
         [1.3 L R2] AND an attribute name [Vehicle.Color] that contains a value of \"[Blue]\". A \
         request must contain unique values for the [attributeNames] filter and the matching \
         number of [attributeValues] filter to return the subset of vehicles that match the \
         attributes filter condition.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : list_vehicles_max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
  list_response_scope : list_response_scope option;
      [@ocaml.doc
        "When you set the [listResponseScope] parameter to [METADATA_ONLY], the list response \
         includes: vehicle name, Amazon Resource Name (ARN), creation time, and last modification \
         time.\n"]
}
[@@ocaml.doc ""]

type nonrec vehicles = vehicle_name list [@@ocaml.doc ""]

type nonrec list_vehicles_in_fleet_response = {
  vehicles : vehicles option; [@ocaml.doc " A list of vehicles associated with the fleet. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results, or [null] if there are no more results. \n"]
}
[@@ocaml.doc ""]

type nonrec list_vehicles_in_fleet_request = {
  fleet_id : fleet_id; [@ocaml.doc " The ID of a fleet. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "A pagination token for the next set of results.\n\n\
        \ If the results of a search are large, only a portion of the results are returned, and a \
         [nextToken] pagination token is returned in the response. To retrieve the next set of \
         results, reissue the search request and include the returned token. When all results have \
         been returned, the response does not contain a pagination token value. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of items to return, between 1 and 100, inclusive.\n"]
}
[@@ocaml.doc ""]

type nonrec model_manifest_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec node_paths = node_path list [@@ocaml.doc ""]

type nonrec signal_catalog_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec state_template_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec update_campaign_response = {
  arn : campaign_arn option; [@ocaml.doc " The Amazon Resource Name (ARN) of the campaign. \n"]
  name : campaign_name option; [@ocaml.doc "The name of the updated campaign.\n"]
  status : campaign_status option;
      [@ocaml.doc
        "The state of a campaign. The status can be one of:\n\n\
        \ {ul\n\
        \       {-   [CREATING] - Amazon Web Services IoT FleetWise is processing your request to \
         create the campaign. \n\
        \           \n\
        \            }\n\
        \       {-   [WAITING_FOR_APPROVAL] - After you create a campaign, it enters this state. \
         Use the API operation to approve the campaign for deployment to the target vehicle or \
         fleet. \n\
        \           \n\
        \            }\n\
        \       {-   [RUNNING] - The campaign is active. \n\
        \           \n\
        \            }\n\
        \       {-   [SUSPENDED] - The campaign is suspended. To resume the campaign, use the API \
         operation. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_campaign_action =
  | APPROVE [@ocaml.doc ""]
  | SUSPEND [@ocaml.doc ""]
  | RESUME [@ocaml.doc ""]
  | UPDATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_campaign_request = {
  name : campaign_name; [@ocaml.doc " The name of the campaign to update. \n"]
  description : description option; [@ocaml.doc "The description of the campaign.\n"]
  data_extra_dimensions : data_extra_dimension_node_path_list option;
      [@ocaml.doc
        " A list of vehicle attributes to associate with a signal. \n\n Default: An empty array\n "]
  action : update_campaign_action;
      [@ocaml.doc
        " Specifies how to update a campaign. The action can be one of the following:\n\n\
        \ {ul\n\
        \       {-   [APPROVE] - To approve delivering a data collection scheme to vehicles. \n\
        \           \n\
        \            }\n\
        \       {-   [SUSPEND] - To suspend collecting signal data. The campaign is deleted from \
         vehicles and all vehicles in the suspended campaign will stop sending data.\n\
        \           \n\
        \            }\n\
        \       {-   [RESUME] - To reactivate the [SUSPEND] campaign. The campaign is redeployed \
         to all vehicles and the vehicles will resume sending data.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATE] - To update a campaign. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_decoder_manifest_response = {
  name : resource_name; [@ocaml.doc " The name of the updated decoder manifest. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the updated decoder manifest. \n"]
}
[@@ocaml.doc ""]

type nonrec update_decoder_manifest_request = {
  name : resource_name; [@ocaml.doc " The name of the decoder manifest to update.\n"]
  description : description option;
      [@ocaml.doc " A brief description of the decoder manifest to update. \n"]
  signal_decoders_to_add : signal_decoders option;
      [@ocaml.doc
        " A list of information about decoding additional signals to add to the decoder manifest. \n"]
  signal_decoders_to_update : signal_decoders option;
      [@ocaml.doc
        " A list of updated information about decoding signals to update in the decoder manifest. \n"]
  signal_decoders_to_remove : fqns option;
      [@ocaml.doc " A list of signal decoders to remove from the decoder manifest. \n"]
  network_interfaces_to_add : network_interfaces option;
      [@ocaml.doc
        " A list of information about the network interfaces to add to the decoder manifest. \n"]
  network_interfaces_to_update : network_interfaces option;
      [@ocaml.doc
        " A list of information about the network interfaces to update in the decoder manifest. \n"]
  network_interfaces_to_remove : interface_ids option;
      [@ocaml.doc " A list of network interfaces to remove from the decoder manifest.\n"]
  status : manifest_status option;
      [@ocaml.doc
        " The state of the decoder manifest. If the status is [ACTIVE], the decoder manifest can't \
         be edited. If the status is [DRAFT], you can edit the decoder manifest. \n"]
  default_for_unmapped_signals : default_for_unmapped_signals_type option;
      [@ocaml.doc
        "Use default decoders for all unmapped signals in the model. You don't need to provide any \
         detailed decoding information.\n\n\
        \  Access to certain Amazon Web Services IoT FleetWise features is currently gated. For \
         more information, see \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/fleetwise-regions.html}Amazon \
         Web Services Region and feature availability} in the {i Amazon Web Services IoT FleetWise \
         Developer Guide}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec update_fleet_response = {
  id : fleet_id option; [@ocaml.doc "The ID of the updated fleet.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the updated fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fleet_request = {
  fleet_id : fleet_id; [@ocaml.doc " The ID of the fleet to update. \n"]
  description : description option; [@ocaml.doc " An updated description of the fleet. \n"]
}
[@@ocaml.doc ""]

type nonrec update_model_manifest_response = {
  name : resource_name; [@ocaml.doc " The name of the updated vehicle model. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the updated vehicle model. \n"]
}
[@@ocaml.doc ""]

type nonrec update_model_manifest_request = {
  name : resource_name; [@ocaml.doc " The name of the vehicle model to update. \n"]
  description : description option; [@ocaml.doc " A brief description of the vehicle model. \n"]
  nodes_to_add : node_paths option;
      [@ocaml.doc
        " A list of [fullyQualifiedName] of nodes, which are a general abstraction of signals, to \
         add to the vehicle model. \n"]
  nodes_to_remove : node_paths option;
      [@ocaml.doc
        " A list of [fullyQualifiedName] of nodes, which are a general abstraction of signals, to \
         remove from the vehicle model. \n"]
  status : manifest_status option;
      [@ocaml.doc
        " The state of the vehicle model. If the status is [ACTIVE], the vehicle model can't be \
         edited. If the status is [DRAFT], you can edit the vehicle model. \n"]
}
[@@ocaml.doc ""]

type nonrec update_signal_catalog_response = {
  name : resource_name; [@ocaml.doc " The name of the updated signal catalog. \n"]
  arn : arn; [@ocaml.doc " The ARN of the updated signal catalog. \n"]
}
[@@ocaml.doc ""]

type nonrec update_signal_catalog_request = {
  name : resource_name; [@ocaml.doc " The name of the signal catalog to update. \n"]
  description : description option;
      [@ocaml.doc " A brief description of the signal catalog to update.\n"]
  nodes_to_add : nodes option;
      [@ocaml.doc " A list of information about nodes to add to the signal catalog. \n"]
  nodes_to_update : nodes option;
      [@ocaml.doc " A list of information about nodes to update in the signal catalog. \n"]
  nodes_to_remove : node_paths option;
      [@ocaml.doc " A list of [fullyQualifiedName] of nodes to remove from the signal catalog. \n"]
}
[@@ocaml.doc ""]

type nonrec update_state_template_response = {
  name : resource_name option; [@ocaml.doc "The name of the state template.\n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the state template.\n"]
  id : resource_unique_id option; [@ocaml.doc "The unique ID of the state template.\n"]
}
[@@ocaml.doc ""]

type nonrec update_state_template_request = {
  identifier : resource_identifier; [@ocaml.doc "The unique ID of the state template.\n"]
  description : description option; [@ocaml.doc "A brief description of the state template.\n"]
  state_template_properties_to_add : state_template_properties option;
      [@ocaml.doc "Add signals from which data is collected as part of the state template.\n"]
  state_template_properties_to_remove : state_template_properties option;
      [@ocaml.doc "Remove signals from which data is collected as part of the state template.\n"]
  data_extra_dimensions : state_template_data_extra_dimension_node_path_list option;
      [@ocaml.doc
        "A list of vehicle attributes to associate with the payload published on the state \
         template's MQTT topic. (See \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/process-visualize-data.html#process-last-known-state-vehicle-data} \
         Processing last known state vehicle data using MQTT messaging}). For example, if you add \
         [Vehicle.Attributes.Make] and [Vehicle.Attributes.Model] attributes, Amazon Web Services \
         IoT FleetWise will enrich the protobuf encoded payload with those attributes in the \
         [extraDimensions] field.\n\n\
        \ Default: An empty array\n\
        \ "]
  metadata_extra_dimensions : state_template_metadata_extra_dimension_node_path_list option;
      [@ocaml.doc
        "A list of vehicle attributes to associate with user properties of the messages published \
         on the state template's MQTT topic. (See \
         {{:https://docs.aws.amazon.com/iot-fleetwise/latest/developerguide/process-visualize-data.html#process-last-known-state-vehicle-data} \
         Processing last known state vehicle data using MQTT messaging}). For example, if you add \
         [Vehicle.Attributes.Make] and [Vehicle.Attributes.Model] attributes, Amazon Web Services \
         IoT FleetWise will include these attributes as User Properties with the MQTT message.\n"]
}
[@@ocaml.doc ""]

type nonrec update_vehicle_response = {
  vehicle_name : vehicle_name option; [@ocaml.doc "The ID of the updated vehicle.\n"]
  arn : arn option; [@ocaml.doc "The ARN of the updated vehicle.\n"]
}
[@@ocaml.doc ""]

type nonrec update_vehicle_request = {
  vehicle_name : vehicle_name; [@ocaml.doc "The unique ID of the vehicle to update.\n"]
  model_manifest_arn : arn option;
      [@ocaml.doc "The ARN of a vehicle model (model manifest) associated with the vehicle.\n"]
  decoder_manifest_arn : arn option;
      [@ocaml.doc "The ARN of the decoder manifest associated with this vehicle.\n"]
  attributes : attributes_map option;
      [@ocaml.doc
        "Static information about a vehicle in a key-value pair. For example:\n\n\
        \  [\"engineType\"] : [\"1.3 L R2\"] \n\
        \ "]
  attribute_update_mode : update_mode option;
      [@ocaml.doc
        "The method the specified attributes will update the existing attributes on the vehicle. \
         Use[Overwite] to replace the vehicle attributes with the specified attributes. Or use \
         [Merge] to combine all attributes.\n\n\
        \ This is required if attributes are present in the input.\n\
        \ "]
  state_templates_to_add : state_template_associations option;
      [@ocaml.doc "Associate state templates with the vehicle.\n"]
  state_templates_to_remove : state_template_association_identifiers option;
      [@ocaml.doc "Remove state templates from the vehicle.\n"]
  state_templates_to_update : state_template_associations option;
      [@ocaml.doc
        "Change the [stateTemplateUpdateStrategy] of state templates already associated with the \
         vehicle.\n"]
}
[@@ocaml.doc ""]

type nonrec vehicle_association_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec vehicle_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
