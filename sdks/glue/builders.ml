open Types

let make_xml_classifier ?row_tag:(row_tag_ : row_tag option) ?version:(version_ : version_id option)
    ?last_updated:(last_updated_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ~classification:(classification_ : classification) ~name:(name_ : name_string) () =
  ({
     row_tag = row_tag_;
     version = version_;
     last_updated = last_updated_;
     creation_time = creation_time_;
     classification = classification_;
     name = name_;
   }
    : xml_classifier)

let make_workflow_run_statistics ?waiting_actions:(waiting_actions_ : integer_value option)
    ?errored_actions:(errored_actions_ : integer_value option)
    ?running_actions:(running_actions_ : integer_value option)
    ?succeeded_actions:(succeeded_actions_ : integer_value option)
    ?stopped_actions:(stopped_actions_ : integer_value option)
    ?failed_actions:(failed_actions_ : integer_value option)
    ?timeout_actions:(timeout_actions_ : integer_value option)
    ?total_actions:(total_actions_ : integer_value option) () =
  ({
     waiting_actions = waiting_actions_;
     errored_actions = errored_actions_;
     running_actions = running_actions_;
     succeeded_actions = succeeded_actions_;
     stopped_actions = stopped_actions_;
     failed_actions = failed_actions_;
     timeout_actions = timeout_actions_;
     total_actions = total_actions_;
   }
    : workflow_run_statistics)

let make_notification_property ?notify_delay_after:(notify_delay_after_ : notify_delay_after option)
    () =
  ({ notify_delay_after = notify_delay_after_ } : notification_property)

let make_action ?crawler_name:(crawler_name_ : name_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?timeout:(timeout_ : timeout option) ?arguments:(arguments_ : generic_map option)
    ?job_name:(job_name_ : name_string option) () =
  ({
     crawler_name = crawler_name_;
     notification_property = notification_property_;
     security_configuration = security_configuration_;
     timeout = timeout_;
     arguments = arguments_;
     job_name = job_name_;
   }
    : action)

let make_condition ?crawl_state:(crawl_state_ : crawl_state option)
    ?crawler_name:(crawler_name_ : name_string option) ?state:(state_ : job_run_state option)
    ?job_name:(job_name_ : name_string option)
    ?logical_operator:(logical_operator_ : logical_operator option) () =
  ({
     crawl_state = crawl_state_;
     crawler_name = crawler_name_;
     state = state_;
     job_name = job_name_;
     logical_operator = logical_operator_;
   }
    : condition)

let make_predicate ?conditions:(conditions_ : condition_list option)
    ?logical:(logical_ : logical option) () =
  ({ conditions = conditions_; logical = logical_ } : predicate)

let make_event_batching_condition ?batch_window:(batch_window_ : batch_window option)
    ~batch_size:(batch_size_ : batch_size) () =
  ({ batch_window = batch_window_; batch_size = batch_size_ } : event_batching_condition)

let make_trigger
    ?event_batching_condition:(event_batching_condition_ : event_batching_condition option)
    ?predicate:(predicate_ : predicate option) ?actions:(actions_ : action_list option)
    ?schedule:(schedule_ : generic_string option)
    ?description:(description_ : description_string option) ?state:(state_ : trigger_state option)
    ?type_:(type__ : trigger_type option) ?id:(id_ : id_string option)
    ?workflow_name:(workflow_name_ : name_string option) ?name:(name_ : name_string option) () =
  ({
     event_batching_condition = event_batching_condition_;
     predicate = predicate_;
     actions = actions_;
     schedule = schedule_;
     description = description_;
     state = state_;
     type_ = type__;
     id = id_;
     workflow_name = workflow_name_;
     name = name_;
   }
    : trigger)

let make_trigger_node_details ?trigger:(trigger_ : trigger option) () =
  ({ trigger = trigger_ } : trigger_node_details)

let make_predecessor ?run_id:(run_id_ : id_string option) ?job_name:(job_name_ : name_string option)
    () =
  ({ run_id = run_id_; job_name = job_name_ } : predecessor)

let make_job_run
    ?execution_role_session_policy:
      (execution_role_session_policy_ : orchestration_policy_json_string option)
    ?state_detail:(state_detail_ : orchestration_message_string option)
    ?profile_name:(profile_name_ : name_string option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?execution_class:(execution_class_ : execution_class option)
    ?dpu_seconds:(dpu_seconds_ : nullable_double option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?log_group_name:(log_group_name_ : generic_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?max_capacity:(max_capacity_ : nullable_double option) ?timeout:(timeout_ : timeout option)
    ?execution_time:(execution_time_ : execution_time option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?predecessor_runs:(predecessor_runs_ : predecessor_list option)
    ?error_message:(error_message_ : error_string option)
    ?arguments:(arguments_ : generic_map option)
    ?job_run_state:(job_run_state_ : job_run_state option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?started_on:(started_on_ : timestamp_value option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?job_mode:(job_mode_ : job_mode option) ?job_name:(job_name_ : name_string option)
    ?trigger_name:(trigger_name_ : name_string option)
    ?previous_run_id:(previous_run_id_ : id_string option)
    ?attempt:(attempt_ : attempt_count option) ?id:(id_ : id_string option) () =
  ({
     execution_role_session_policy = execution_role_session_policy_;
     state_detail = state_detail_;
     profile_name = profile_name_;
     maintenance_window = maintenance_window_;
     execution_class = execution_class_;
     dpu_seconds = dpu_seconds_;
     glue_version = glue_version_;
     notification_property = notification_property_;
     log_group_name = log_group_name_;
     security_configuration = security_configuration_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     max_capacity = max_capacity_;
     timeout = timeout_;
     execution_time = execution_time_;
     allocated_capacity = allocated_capacity_;
     predecessor_runs = predecessor_runs_;
     error_message = error_message_;
     arguments = arguments_;
     job_run_state = job_run_state_;
     completed_on = completed_on_;
     last_modified_on = last_modified_on_;
     started_on = started_on_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     job_mode = job_mode_;
     job_name = job_name_;
     trigger_name = trigger_name_;
     previous_run_id = previous_run_id_;
     attempt = attempt_;
     id = id_;
   }
    : job_run)

let make_job_node_details ?job_runs:(job_runs_ : job_run_list option) () =
  ({ job_runs = job_runs_ } : job_node_details)

let make_crawl ?log_stream:(log_stream_ : log_stream option)
    ?log_group:(log_group_ : log_group option)
    ?error_message:(error_message_ : description_string option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?started_on:(started_on_ : timestamp_value option) ?state:(state_ : crawl_state option) () =
  ({
     log_stream = log_stream_;
     log_group = log_group_;
     error_message = error_message_;
     completed_on = completed_on_;
     started_on = started_on_;
     state = state_;
   }
    : crawl)

let make_crawler_node_details ?crawls:(crawls_ : crawl_list option) () =
  ({ crawls = crawls_ } : crawler_node_details)

let make_node ?crawler_details:(crawler_details_ : crawler_node_details option)
    ?job_details:(job_details_ : job_node_details option)
    ?trigger_details:(trigger_details_ : trigger_node_details option)
    ?unique_id:(unique_id_ : name_string option) ?name:(name_ : name_string option)
    ?type_:(type__ : node_type option) () =
  ({
     crawler_details = crawler_details_;
     job_details = job_details_;
     trigger_details = trigger_details_;
     unique_id = unique_id_;
     name = name_;
     type_ = type__;
   }
    : node)

let make_edge ?destination_id:(destination_id_ : name_string option)
    ?source_id:(source_id_ : name_string option) () =
  ({ destination_id = destination_id_; source_id = source_id_ } : edge)

let make_workflow_graph ?edges:(edges_ : edge_list option) ?nodes:(nodes_ : node_list option) () =
  ({ edges = edges_; nodes = nodes_ } : workflow_graph)

let make_starting_event_batch_condition ?batch_window:(batch_window_ : nullable_integer option)
    ?batch_size:(batch_size_ : nullable_integer option) () =
  ({ batch_window = batch_window_; batch_size = batch_size_ } : starting_event_batch_condition)

let make_workflow_run
    ?starting_event_batch_condition:
      (starting_event_batch_condition_ : starting_event_batch_condition option)
    ?graph:(graph_ : workflow_graph option)
    ?statistics:(statistics_ : workflow_run_statistics option)
    ?error_message:(error_message_ : error_string option)
    ?status:(status_ : workflow_run_status option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?started_on:(started_on_ : timestamp_value option)
    ?workflow_run_properties:(workflow_run_properties_ : workflow_run_properties option)
    ?previous_run_id:(previous_run_id_ : id_string option)
    ?workflow_run_id:(workflow_run_id_ : id_string option) ?name:(name_ : name_string option) () =
  ({
     starting_event_batch_condition = starting_event_batch_condition_;
     graph = graph_;
     statistics = statistics_;
     error_message = error_message_;
     status = status_;
     completed_on = completed_on_;
     started_on = started_on_;
     workflow_run_properties = workflow_run_properties_;
     previous_run_id = previous_run_id_;
     workflow_run_id = workflow_run_id_;
     name = name_;
   }
    : workflow_run)

let make_blueprint_details ?run_id:(run_id_ : id_string option)
    ?blueprint_name:(blueprint_name_ : orchestration_name_string option) () =
  ({ run_id = run_id_; blueprint_name = blueprint_name_ } : blueprint_details)

let make_workflow ?blueprint_details:(blueprint_details_ : blueprint_details option)
    ?max_concurrent_runs:(max_concurrent_runs_ : nullable_integer option)
    ?graph:(graph_ : workflow_graph option) ?last_run:(last_run_ : workflow_run option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?created_on:(created_on_ : timestamp_value option)
    ?default_run_properties:(default_run_properties_ : workflow_run_properties option)
    ?description:(description_ : generic_string option) ?name:(name_ : name_string option) () =
  ({
     blueprint_details = blueprint_details_;
     max_concurrent_runs = max_concurrent_runs_;
     graph = graph_;
     last_run = last_run_;
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     default_run_properties = default_run_properties_;
     description = description_;
     name = name_;
   }
    : workflow)

let make_error_detail ?error_message:(error_message_ : description_string option)
    ?error_code:(error_code_ : name_string option) () =
  ({ error_message = error_message_; error_code = error_code_ } : error_detail)

let make_view_validation ?error:(error_ : error_detail option)
    ?state:(state_ : resource_state option) ?update_time:(update_time_ : timestamp option)
    ?view_validation_text:(view_validation_text_ : view_text_string option)
    ?dialect_version:(dialect_version_ : view_dialect_version_string option)
    ?dialect:(dialect_ : view_dialect option) () =
  ({
     error = error_;
     state = state_;
     update_time = update_time_;
     view_validation_text = view_validation_text_;
     dialect_version = dialect_version_;
     dialect = dialect_;
   }
    : view_validation)

let make_view_representation ?is_stale:(is_stale_ : nullable_boolean option)
    ?validation_connection:(validation_connection_ : name_string option)
    ?view_expanded_text:(view_expanded_text_ : view_text_string option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?dialect_version:(dialect_version_ : view_dialect_version_string option)
    ?dialect:(dialect_ : view_dialect option) () =
  ({
     is_stale = is_stale_;
     validation_connection = validation_connection_;
     view_expanded_text = view_expanded_text_;
     view_original_text = view_original_text_;
     dialect_version = dialect_version_;
     dialect = dialect_;
   }
    : view_representation)

let make_view_representation_input
    ?view_expanded_text:(view_expanded_text_ : view_text_string option)
    ?validation_connection:(validation_connection_ : name_string option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?dialect_version:(dialect_version_ : view_dialect_version_string option)
    ?dialect:(dialect_ : view_dialect option) () =
  ({
     view_expanded_text = view_expanded_text_;
     validation_connection = validation_connection_;
     view_original_text = view_original_text_;
     dialect_version = dialect_version_;
     dialect = dialect_;
   }
    : view_representation_input)

let make_view_definition_input
    ?sub_object_version_ids:(sub_object_version_ids_ : view_sub_object_version_ids_list option)
    ?sub_objects:(sub_objects_ : view_sub_objects_list option)
    ?last_refresh_type:(last_refresh_type_ : last_refresh_type option)
    ?refresh_seconds:(refresh_seconds_ : refresh_seconds option)
    ?view_version_token:(view_version_token_ : version_string option)
    ?view_version_id:(view_version_id_ : table_version_id option)
    ?representations:(representations_ : view_representation_input_list option)
    ?definer:(definer_ : arn_string option) ?is_protected:(is_protected_ : nullable_boolean option)
    () =
  ({
     sub_object_version_ids = sub_object_version_ids_;
     sub_objects = sub_objects_;
     last_refresh_type = last_refresh_type_;
     refresh_seconds = refresh_seconds_;
     view_version_token = view_version_token_;
     view_version_id = view_version_id_;
     representations = representations_;
     definer = definer_;
     is_protected = is_protected_;
   }
    : view_definition_input)

let make_view_definition ?representations:(representations_ : view_representation_list option)
    ?sub_object_version_ids:(sub_object_version_ids_ : view_sub_object_version_ids_list option)
    ?sub_objects:(sub_objects_ : view_sub_objects_list option)
    ?last_refresh_type:(last_refresh_type_ : last_refresh_type option)
    ?refresh_seconds:(refresh_seconds_ : refresh_seconds option)
    ?view_version_token:(view_version_token_ : hash_string option)
    ?view_version_id:(view_version_id_ : table_version_id option)
    ?definer:(definer_ : arn_string option) ?is_protected:(is_protected_ : nullable_boolean option)
    () =
  ({
     representations = representations_;
     sub_object_version_ids = sub_object_version_ids_;
     sub_objects = sub_objects_;
     last_refresh_type = last_refresh_type_;
     refresh_seconds = refresh_seconds_;
     view_version_token = view_version_token_;
     view_version_id = view_version_id_;
     definer = definer_;
     is_protected = is_protected_;
   }
    : view_definition)

let make_resource_uri ?uri:(uri_ : ur_i option)
    ?resource_type:(resource_type_ : resource_type option) () =
  ({ uri = uri_; resource_type = resource_type_ } : resource_uri)

let make_user_defined_function ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?resource_uris:(resource_uris_ : resource_uri_list option)
    ?create_time:(create_time_ : timestamp option) ?owner_type:(owner_type_ : principal_type option)
    ?function_type:(function_type_ : function_type option)
    ?owner_name:(owner_name_ : name_string option) ?class_name:(class_name_ : name_string option)
    ?database_name:(database_name_ : name_string option)
    ?function_name:(function_name_ : name_string option) () =
  ({
     catalog_id = catalog_id_;
     resource_uris = resource_uris_;
     create_time = create_time_;
     owner_type = owner_type_;
     function_type = function_type_;
     owner_name = owner_name_;
     class_name = class_name_;
     database_name = database_name_;
     function_name = function_name_;
   }
    : user_defined_function)

let make_user_defined_function_input ?resource_uris:(resource_uris_ : resource_uri_list option)
    ?owner_type:(owner_type_ : principal_type option)
    ?function_type:(function_type_ : function_type option)
    ?owner_name:(owner_name_ : name_string option) ?class_name:(class_name_ : name_string option)
    ?function_name:(function_name_ : name_string option) () =
  ({
     resource_uris = resource_uris_;
     owner_type = owner_type_;
     function_type = function_type_;
     owner_name = owner_name_;
     class_name = class_name_;
     function_name = function_name_;
   }
    : user_defined_function_input)

let make_usage_profile_definition ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?created_on:(created_on_ : timestamp_value option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     description = description_;
     name = name_;
   }
    : usage_profile_definition)

let make_upsert_redshift_target_options
    ?upsert_keys:(upsert_keys_ : enclosed_in_string_properties_min_one option)
    ?connection_name:(connection_name_ : enclosed_in_string_property option)
    ?table_location:(table_location_ : enclosed_in_string_property option) () =
  ({
     upsert_keys = upsert_keys_;
     connection_name = connection_name_;
     table_location = table_location_;
   }
    : upsert_redshift_target_options)

let make_update_xml_classifier_request ?row_tag:(row_tag_ : row_tag option)
    ?classification:(classification_ : classification option) ~name:(name_ : name_string) () =
  ({ row_tag = row_tag_; classification = classification_; name = name_ }
    : update_xml_classifier_request)

let make_update_workflow_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : update_workflow_response)

let make_update_workflow_request
    ?max_concurrent_runs:(max_concurrent_runs_ : nullable_integer option)
    ?default_run_properties:(default_run_properties_ : workflow_run_properties option)
    ?description:(description_ : workflow_description_string option) ~name:(name_ : name_string) ()
    =
  ({
     max_concurrent_runs = max_concurrent_runs_;
     default_run_properties = default_run_properties_;
     description = description_;
     name = name_;
   }
    : update_workflow_request)

let make_update_user_defined_function_response () = (() : unit)

let make_update_user_defined_function_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~function_input:(function_input_ : user_defined_function_input)
    ~function_name:(function_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     function_input = function_input_;
     function_name = function_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : update_user_defined_function_request)

let make_update_usage_profile_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : update_usage_profile_response)

let make_configuration_object ?max_value:(max_value_ : config_value_string option)
    ?min_value:(min_value_ : config_value_string option)
    ?allowed_values:(allowed_values_ : allowed_values_string_list option)
    ?default_value:(default_value_ : config_value_string option) () =
  ({
     max_value = max_value_;
     min_value = min_value_;
     allowed_values = allowed_values_;
     default_value = default_value_;
   }
    : configuration_object)

let make_profile_configuration ?job_configuration:(job_configuration_ : configuration_map option)
    ?session_configuration:(session_configuration_ : configuration_map option) () =
  ({ job_configuration = job_configuration_; session_configuration = session_configuration_ }
    : profile_configuration)

let make_update_usage_profile_request ?description:(description_ : description_string option)
    ~configuration:(configuration_ : profile_configuration) ~name:(name_ : name_string) () =
  ({ configuration = configuration_; description = description_; name = name_ }
    : update_usage_profile_request)

let make_update_trigger_response ?trigger:(trigger_ : trigger option) () =
  ({ trigger = trigger_ } : update_trigger_response)

let make_trigger_update
    ?event_batching_condition:(event_batching_condition_ : event_batching_condition option)
    ?predicate:(predicate_ : predicate option) ?actions:(actions_ : action_list option)
    ?schedule:(schedule_ : generic_string option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({
     event_batching_condition = event_batching_condition_;
     predicate = predicate_;
     actions = actions_;
     schedule = schedule_;
     description = description_;
     name = name_;
   }
    : trigger_update)

let make_update_trigger_request ~trigger_update:(trigger_update_ : trigger_update)
    ~name:(name_ : name_string) () =
  ({ trigger_update = trigger_update_; name = name_ } : update_trigger_request)

let make_update_table_response () = (() : unit)

let make_column ?parameters:(parameters_ : parameters_map option)
    ?comment:(comment_ : comment_string option) ?type_:(type__ : column_type_string option)
    ~name:(name_ : name_string) () =
  ({ parameters = parameters_; comment = comment_; type_ = type__; name = name_ } : column)

let make_ser_de_info ?parameters:(parameters_ : parameters_map option)
    ?serialization_library:(serialization_library_ : name_string option)
    ?name:(name_ : name_string option) () =
  ({ parameters = parameters_; serialization_library = serialization_library_; name = name_ }
    : ser_de_info)

let make_order ~sort_order:(sort_order_ : integer_flag) ~column:(column_ : name_string) () =
  ({ sort_order = sort_order_; column = column_ } : order)

let make_skewed_info
    ?skewed_column_value_location_maps:(skewed_column_value_location_maps_ : location_map option)
    ?skewed_column_values:(skewed_column_values_ : column_value_string_list option)
    ?skewed_column_names:(skewed_column_names_ : name_string_list option) () =
  ({
     skewed_column_value_location_maps = skewed_column_value_location_maps_;
     skewed_column_values = skewed_column_values_;
     skewed_column_names = skewed_column_names_;
   }
    : skewed_info)

let make_schema_id ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option) () =
  ({ registry_name = registry_name_; schema_name = schema_name_; schema_arn = schema_arn_ }
    : schema_id)

let make_schema_reference
    ?schema_version_number:(schema_version_number_ : version_long_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_id:(schema_id_ : schema_id option) () =
  ({
     schema_version_number = schema_version_number_;
     schema_version_id = schema_version_id_;
     schema_id = schema_id_;
   }
    : schema_reference)

let make_storage_descriptor ?schema_reference:(schema_reference_ : schema_reference option)
    ?stored_as_sub_directories:(stored_as_sub_directories_ : boolean_ option)
    ?skewed_info:(skewed_info_ : skewed_info option)
    ?parameters:(parameters_ : parameters_map option)
    ?sort_columns:(sort_columns_ : order_list option)
    ?bucket_columns:(bucket_columns_ : name_string_list option)
    ?serde_info:(serde_info_ : ser_de_info option)
    ?number_of_buckets:(number_of_buckets_ : integer option)
    ?compressed:(compressed_ : boolean_ option)
    ?output_format:(output_format_ : format_string option)
    ?input_format:(input_format_ : format_string option)
    ?additional_locations:(additional_locations_ : location_string_list option)
    ?location:(location_ : location_string option) ?columns:(columns_ : column_list option) () =
  ({
     schema_reference = schema_reference_;
     stored_as_sub_directories = stored_as_sub_directories_;
     skewed_info = skewed_info_;
     parameters = parameters_;
     sort_columns = sort_columns_;
     bucket_columns = bucket_columns_;
     serde_info = serde_info_;
     number_of_buckets = number_of_buckets_;
     compressed = compressed_;
     output_format = output_format_;
     input_format = input_format_;
     additional_locations = additional_locations_;
     location = location_;
     columns = columns_;
   }
    : storage_descriptor)

let make_table_identifier ?region:(region_ : name_string option) ?name:(name_ : name_string option)
    ?database_name:(database_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ region = region_; name = name_; database_name = database_name_; catalog_id = catalog_id_ }
    : table_identifier)

let make_table_input ?view_definition:(view_definition_ : view_definition_input option)
    ?target_table:(target_table_ : table_identifier option)
    ?parameters:(parameters_ : parameters_map option)
    ?table_type:(table_type_ : table_type_string option)
    ?view_expanded_text:(view_expanded_text_ : view_text_string option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?partition_keys:(partition_keys_ : column_list option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?retention:(retention_ : non_negative_integer option)
    ?last_analyzed_time:(last_analyzed_time_ : timestamp option)
    ?last_access_time:(last_access_time_ : timestamp option) ?owner:(owner_ : name_string option)
    ?description:(description_ : description_string option) ~name:(name_ : name_string) () =
  ({
     view_definition = view_definition_;
     target_table = target_table_;
     parameters = parameters_;
     table_type = table_type_;
     view_expanded_text = view_expanded_text_;
     view_original_text = view_original_text_;
     partition_keys = partition_keys_;
     storage_descriptor = storage_descriptor_;
     retention = retention_;
     last_analyzed_time = last_analyzed_time_;
     last_access_time = last_access_time_;
     owner = owner_;
     description = description_;
     name = name_;
   }
    : table_input)

let make_iceberg_struct_field ?write_default:(write_default_ : iceberg_document option)
    ?initial_default:(initial_default_ : iceberg_document option)
    ?doc:(doc_ : comment_string option) ~required:(required_ : boolean_)
    ~type_:(type__ : iceberg_document) ~name:(name_ : column_name_string) ~id:(id_ : integer) () =
  ({
     write_default = write_default_;
     initial_default = initial_default_;
     doc = doc_;
     required = required_;
     type_ = type__;
     name = name_;
     id = id_;
   }
    : iceberg_struct_field)

let make_iceberg_schema ?type_:(type__ : iceberg_struct_type_enum option)
    ?identifier_field_ids:(identifier_field_ids_ : integer_list option)
    ?schema_id:(schema_id_ : integer option) ~fields:(fields_ : iceberg_struct_field_list) () =
  ({
     fields = fields_;
     type_ = type__;
     identifier_field_ids = identifier_field_ids_;
     schema_id = schema_id_;
   }
    : iceberg_schema)

let make_iceberg_partition_field ?field_id:(field_id_ : integer option)
    ~name:(name_ : column_name_string) ~transform:(transform_ : iceberg_transform_string)
    ~source_id:(source_id_ : integer) () =
  ({ field_id = field_id_; name = name_; transform = transform_; source_id = source_id_ }
    : iceberg_partition_field)

let make_iceberg_partition_spec ?spec_id:(spec_id_ : integer option)
    ~fields:(fields_ : iceberg_partition_spec_field_list) () =
  ({ spec_id = spec_id_; fields = fields_ } : iceberg_partition_spec)

let make_iceberg_sort_field ~null_order:(null_order_ : iceberg_null_order)
    ~direction:(direction_ : iceberg_sort_direction)
    ~transform:(transform_ : iceberg_transform_string) ~source_id:(source_id_ : integer) () =
  ({
     null_order = null_order_;
     direction = direction_;
     transform = transform_;
     source_id = source_id_;
   }
    : iceberg_sort_field)

let make_iceberg_sort_order ~fields:(fields_ : iceberg_sort_order_field_list)
    ~order_id:(order_id_ : integer) () =
  ({ fields = fields_; order_id = order_id_ } : iceberg_sort_order)

let make_iceberg_encrypted_key ?properties:(properties_ : string_to_string_map option)
    ?encrypted_by_id:(encrypted_by_id_ : encryption_key_id_string option)
    ~encrypted_key_metadata:(encrypted_key_metadata_ : encrypted_key_metadata_string)
    ~key_id:(key_id_ : encryption_key_id_string) () =
  ({
     properties = properties_;
     encrypted_by_id = encrypted_by_id_;
     encrypted_key_metadata = encrypted_key_metadata_;
     key_id = key_id_;
   }
    : iceberg_encrypted_key)

let make_iceberg_table_update ?key_id:(key_id_ : encryption_key_id_string option)
    ?encryption_key:(encryption_key_ : iceberg_encrypted_key option)
    ?action:(action_ : iceberg_update_action option)
    ?properties:(properties_ : string_to_string_map option)
    ?sort_order:(sort_order_ : iceberg_sort_order option)
    ?partition_spec:(partition_spec_ : iceberg_partition_spec option)
    ~location:(location_ : location_string) ~schema:(schema_ : iceberg_schema) () =
  ({
     key_id = key_id_;
     encryption_key = encryption_key_;
     action = action_;
     properties = properties_;
     location = location_;
     sort_order = sort_order_;
     partition_spec = partition_spec_;
     schema = schema_;
   }
    : iceberg_table_update)

let make_update_iceberg_table_input ~updates:(updates_ : iceberg_table_update_list) () =
  ({ updates = updates_ } : update_iceberg_table_input)

let make_update_iceberg_input
    ~update_iceberg_table_input:(update_iceberg_table_input_ : update_iceberg_table_input) () =
  ({ update_iceberg_table_input = update_iceberg_table_input_ } : update_iceberg_input)

let make_update_open_table_format_input
    ?update_iceberg_input:(update_iceberg_input_ : update_iceberg_input option) () =
  ({ update_iceberg_input = update_iceberg_input_ } : update_open_table_format_input)

let make_update_table_request
    ?update_open_table_format_input:
      (update_open_table_format_input_ : update_open_table_format_input option)
    ?force:(force_ : boolean_ option)
    ?view_update_action:(view_update_action_ : view_update_action option)
    ?version_id:(version_id_ : version_string option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?skip_archive:(skip_archive_ : boolean_nullable option)
    ?table_input:(table_input_ : table_input option) ?name:(name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) () =
  ({
     update_open_table_format_input = update_open_table_format_input_;
     force = force_;
     view_update_action = view_update_action_;
     version_id = version_id_;
     transaction_id = transaction_id_;
     skip_archive = skip_archive_;
     table_input = table_input_;
     name = name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : update_table_request)

let make_update_table_optimizer_response () = (() : unit)

let make_iceberg_compaction_configuration
    ?delete_file_threshold:(delete_file_threshold_ : nullable_integer option)
    ?min_input_files:(min_input_files_ : nullable_integer option)
    ?strategy:(strategy_ : compaction_strategy option) () =
  ({
     delete_file_threshold = delete_file_threshold_;
     min_input_files = min_input_files_;
     strategy = strategy_;
   }
    : iceberg_compaction_configuration)

let make_compaction_configuration
    ?iceberg_configuration:(iceberg_configuration_ : iceberg_compaction_configuration option) () =
  ({ iceberg_configuration = iceberg_configuration_ } : compaction_configuration)

let make_iceberg_retention_configuration
    ?run_rate_in_hours:(run_rate_in_hours_ : nullable_integer option)
    ?clean_expired_files:(clean_expired_files_ : nullable_boolean option)
    ?number_of_snapshots_to_retain:(number_of_snapshots_to_retain_ : nullable_integer option)
    ?snapshot_retention_period_in_days:
      (snapshot_retention_period_in_days_ : nullable_integer option) () =
  ({
     run_rate_in_hours = run_rate_in_hours_;
     clean_expired_files = clean_expired_files_;
     number_of_snapshots_to_retain = number_of_snapshots_to_retain_;
     snapshot_retention_period_in_days = snapshot_retention_period_in_days_;
   }
    : iceberg_retention_configuration)

let make_retention_configuration
    ?iceberg_configuration:(iceberg_configuration_ : iceberg_retention_configuration option) () =
  ({ iceberg_configuration = iceberg_configuration_ } : retention_configuration)

let make_iceberg_orphan_file_deletion_configuration
    ?run_rate_in_hours:(run_rate_in_hours_ : nullable_integer option)
    ?location:(location_ : message_string option)
    ?orphan_file_retention_period_in_days:
      (orphan_file_retention_period_in_days_ : nullable_integer option) () =
  ({
     run_rate_in_hours = run_rate_in_hours_;
     location = location_;
     orphan_file_retention_period_in_days = orphan_file_retention_period_in_days_;
   }
    : iceberg_orphan_file_deletion_configuration)

let make_orphan_file_deletion_configuration
    ?iceberg_configuration:
      (iceberg_configuration_ : iceberg_orphan_file_deletion_configuration option) () =
  ({ iceberg_configuration = iceberg_configuration_ } : orphan_file_deletion_configuration)

let make_table_optimizer_configuration
    ?orphan_file_deletion_configuration:
      (orphan_file_deletion_configuration_ : orphan_file_deletion_configuration option)
    ?retention_configuration:(retention_configuration_ : retention_configuration option)
    ?compaction_configuration:(compaction_configuration_ : compaction_configuration option)
    ?vpc_configuration:(vpc_configuration_ : table_optimizer_vpc_configuration option)
    ?enabled:(enabled_ : nullable_boolean option) ?role_arn:(role_arn_ : arn_string option) () =
  ({
     orphan_file_deletion_configuration = orphan_file_deletion_configuration_;
     retention_configuration = retention_configuration_;
     compaction_configuration = compaction_configuration_;
     vpc_configuration = vpc_configuration_;
     enabled = enabled_;
     role_arn = role_arn_;
   }
    : table_optimizer_configuration)

let make_update_table_optimizer_request
    ~table_optimizer_configuration:(table_optimizer_configuration_ : table_optimizer_configuration)
    ~type_:(type__ : table_optimizer_type) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     table_optimizer_configuration = table_optimizer_configuration_;
     type_ = type__;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : update_table_optimizer_request)

let make_update_source_control_from_job_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : update_source_control_from_job_response)

let make_update_source_control_from_job_request ?auth_token:(auth_token_ : auth_token_string option)
    ?auth_strategy:(auth_strategy_ : source_control_auth_strategy option)
    ?commit_id:(commit_id_ : commit_id_string option) ?folder:(folder_ : name_string option)
    ?branch_name:(branch_name_ : name_string option)
    ?repository_owner:(repository_owner_ : name_string option)
    ?repository_name:(repository_name_ : name_string option)
    ?provider:(provider_ : source_control_provider option)
    ?job_name:(job_name_ : name_string option) () =
  ({
     auth_token = auth_token_;
     auth_strategy = auth_strategy_;
     commit_id = commit_id_;
     folder = folder_;
     branch_name = branch_name_;
     repository_owner = repository_owner_;
     repository_name = repository_name_;
     provider = provider_;
     job_name = job_name_;
   }
    : update_source_control_from_job_request)

let make_update_schema_response ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option) () =
  ({ registry_name = registry_name_; schema_name = schema_name_; schema_arn = schema_arn_ }
    : update_schema_response)

let make_schema_version_number ?version_number:(version_number_ : version_long_number option)
    ?latest_version:(latest_version_ : latest_schema_version_boolean option) () =
  ({ version_number = version_number_; latest_version = latest_version_ } : schema_version_number)

let make_update_schema_input ?description:(description_ : description_string option)
    ?compatibility:(compatibility_ : compatibility option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ~schema_id:(schema_id_ : schema_id) () =
  ({
     description = description_;
     compatibility = compatibility_;
     schema_version_number = schema_version_number_;
     schema_id = schema_id_;
   }
    : update_schema_input)

let make_update_registry_response ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({ registry_arn = registry_arn_; registry_name = registry_name_ } : update_registry_response)

let make_registry_id ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({ registry_arn = registry_arn_; registry_name = registry_name_ } : registry_id)

let make_update_registry_input ~description:(description_ : description_string)
    ~registry_id:(registry_id_ : registry_id) () =
  ({ description = description_; registry_id = registry_id_ } : update_registry_input)

let make_update_partition_response () = (() : unit)

let make_partition_input ?last_analyzed_time:(last_analyzed_time_ : timestamp option)
    ?parameters:(parameters_ : parameters_map option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?values:(values_ : value_string_list option) () =
  ({
     last_analyzed_time = last_analyzed_time_;
     parameters = parameters_;
     storage_descriptor = storage_descriptor_;
     last_access_time = last_access_time_;
     values = values_;
   }
    : partition_input)

let make_update_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partition_input:(partition_input_ : partition_input)
    ~partition_value_list:(partition_value_list_ : bounded_partition_value_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     partition_input = partition_input_;
     partition_value_list = partition_value_list_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : update_partition_request)

let make_update_ml_transform_response ?transform_id:(transform_id_ : hash_string option) () =
  ({ transform_id = transform_id_ } : update_ml_transform_response)

let make_find_matches_parameters
    ?enforce_provided_labels:(enforce_provided_labels_ : nullable_boolean option)
    ?accuracy_cost_tradeoff:(accuracy_cost_tradeoff_ : generic_bounded_double option)
    ?precision_recall_tradeoff:(precision_recall_tradeoff_ : generic_bounded_double option)
    ?primary_key_column_name:(primary_key_column_name_ : column_name_string option) () =
  ({
     enforce_provided_labels = enforce_provided_labels_;
     accuracy_cost_tradeoff = accuracy_cost_tradeoff_;
     precision_recall_tradeoff = precision_recall_tradeoff_;
     primary_key_column_name = primary_key_column_name_;
   }
    : find_matches_parameters)

let make_transform_parameters
    ?find_matches_parameters:(find_matches_parameters_ : find_matches_parameters option)
    ~transform_type:(transform_type_ : transform_type) () =
  ({ find_matches_parameters = find_matches_parameters_; transform_type = transform_type_ }
    : transform_parameters)

let make_update_ml_transform_request ?max_retries:(max_retries_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?glue_version:(glue_version_ : glue_version_string option) ?role:(role_ : role_string option)
    ?parameters:(parameters_ : transform_parameters option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option)
    ~transform_id:(transform_id_ : hash_string) () =
  ({
     max_retries = max_retries_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     max_capacity = max_capacity_;
     glue_version = glue_version_;
     role = role_;
     parameters = parameters_;
     description = description_;
     name = name_;
     transform_id = transform_id_;
   }
    : update_ml_transform_request)

let make_update_json_classifier_request ?json_path:(json_path_ : json_path option)
    ~name:(name_ : name_string) () =
  ({ json_path = json_path_; name = name_ } : update_json_classifier_request)

let make_update_job_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : update_job_response)

let make_execution_property ?max_concurrent_runs:(max_concurrent_runs_ : max_concurrent_runs option)
    () =
  ({ max_concurrent_runs = max_concurrent_runs_ } : execution_property)

let make_job_command ?runtime:(runtime_ : runtime_name_string option)
    ?python_version:(python_version_ : python_version_string option)
    ?script_location:(script_location_ : script_location_string option)
    ?name:(name_ : generic_string option) () =
  ({
     runtime = runtime_;
     python_version = python_version_;
     script_location = script_location_;
     name = name_;
   }
    : job_command)

let make_connections_list ?connections:(connections_ : connection_string_list option) () =
  ({ connections = connections_ } : connections_list)

let make_glue_studio_schema_column ?glue_studio_type:(glue_studio_type_ : column_type_string option)
    ?type_:(type__ : column_type_string option) ~name:(name_ : glue_studio_column_name_string) () =
  ({ glue_studio_type = glue_studio_type_; type_ = type__; name = name_ }
    : glue_studio_schema_column)

let make_glue_schema ?columns:(columns_ : glue_studio_schema_column_list option) () =
  ({ columns = columns_ } : glue_schema)

let make_athena_connector_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?connection_table:(connection_table_ : enclosed_in_string_property_with_quote option)
    ~schema_name:(schema_name_ : enclosed_in_string_property)
    ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_name:(connection_name_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     schema_name = schema_name_;
     connection_table = connection_table_;
     connection_type = connection_type_;
     connector_name = connector_name_;
     connection_name = connection_name_;
     name = name_;
   }
    : athena_connector_source)

let make_jdbc_connector_options
    ?data_type_mapping:(data_type_mapping_ : jdbc_data_type_mapping option)
    ?job_bookmark_keys_sort_order:
      (job_bookmark_keys_sort_order_ : enclosed_in_string_property option)
    ?job_bookmark_keys:(job_bookmark_keys_ : enclosed_in_string_properties option)
    ?num_partitions:(num_partitions_ : boxed_non_negative_long option)
    ?upper_bound:(upper_bound_ : boxed_non_negative_long option)
    ?lower_bound:(lower_bound_ : boxed_non_negative_long option)
    ?partition_column:(partition_column_ : enclosed_in_string_property option)
    ?filter_predicate:(filter_predicate_ : enclosed_in_string_property option) () =
  ({
     data_type_mapping = data_type_mapping_;
     job_bookmark_keys_sort_order = job_bookmark_keys_sort_order_;
     job_bookmark_keys = job_bookmark_keys_;
     num_partitions = num_partitions_;
     upper_bound = upper_bound_;
     lower_bound = lower_bound_;
     partition_column = partition_column_;
     filter_predicate = filter_predicate_;
   }
    : jdbc_connector_options)

let make_jdbc_connector_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?query:(query_ : sql_query option)
    ?connection_table:(connection_table_ : enclosed_in_string_property_with_quote option)
    ?additional_options:(additional_options_ : jdbc_connector_options option)
    ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_name:(connection_name_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     query = query_;
     connection_table = connection_table_;
     additional_options = additional_options_;
     connection_type = connection_type_;
     connector_name = connector_name_;
     connection_name = connection_name_;
     name = name_;
   }
    : jdbc_connector_source)

let make_spark_connector_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_options:(additional_options_ : additional_options option)
    ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_name:(connection_name_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_options = additional_options_;
     connection_type = connection_type_;
     connector_name = connector_name_;
     connection_name = connection_name_;
     name = name_;
   }
    : spark_connector_source)

let make_catalog_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?partition_predicate:(partition_predicate_ : enclosed_in_string_property option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     partition_predicate = partition_predicate_;
     table = table_;
     database = database_;
     name = name_;
   }
    : catalog_source)

let make_redshift_source ?tmp_dir_iam_role:(tmp_dir_iam_role_ : enclosed_in_string_property option)
    ?redshift_tmp_dir:(redshift_tmp_dir_ : enclosed_in_string_property option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     tmp_dir_iam_role = tmp_dir_iam_role_;
     redshift_tmp_dir = redshift_tmp_dir_;
     table = table_;
     database = database_;
     name = name_;
   }
    : redshift_source)

let make_s3_source_additional_options ?bounded_files:(bounded_files_ : boxed_long option)
    ?bounded_size:(bounded_size_ : boxed_long option) () =
  ({ bounded_files = bounded_files_; bounded_size = bounded_size_ } : s3_source_additional_options)

let make_s3_catalog_source
    ?additional_options:(additional_options_ : s3_source_additional_options option)
    ?partition_predicate:(partition_predicate_ : enclosed_in_string_property option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     additional_options = additional_options_;
     partition_predicate = partition_predicate_;
     table = table_;
     database = database_;
     name = name_;
   }
    : s3_catalog_source)

let make_s3_direct_source_additional_options
    ?sample_path:(sample_path_ : enclosed_in_string_property option)
    ?enable_sample_path:(enable_sample_path_ : boxed_boolean option)
    ?bounded_files:(bounded_files_ : boxed_long option)
    ?bounded_size:(bounded_size_ : boxed_long option) () =
  ({
     sample_path = sample_path_;
     enable_sample_path = enable_sample_path_;
     bounded_files = bounded_files_;
     bounded_size = bounded_size_;
   }
    : s3_direct_source_additional_options)

let make_s3_csv_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?optimize_performance:(optimize_performance_ : boolean_value option)
    ?skip_first:(skip_first_ : boxed_boolean option)
    ?write_header:(write_header_ : boxed_boolean option)
    ?with_header:(with_header_ : boxed_boolean option)
    ?multiline:(multiline_ : boxed_boolean option)
    ?escaper:(escaper_ : enclosed_in_string_property_with_quote option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?max_band:(max_band_ : boxed_non_negative_int option) ?recurse:(recurse_ : boxed_boolean option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?compression_type:(compression_type_ : compression_type option)
    ~quote_char:(quote_char_ : quote_char) ~separator:(separator_ : separator)
    ~paths:(paths_ : enclosed_in_string_properties) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     optimize_performance = optimize_performance_;
     skip_first = skip_first_;
     write_header = write_header_;
     with_header = with_header_;
     multiline = multiline_;
     quote_char = quote_char_;
     escaper = escaper_;
     separator = separator_;
     additional_options = additional_options_;
     max_files_in_band = max_files_in_band_;
     max_band = max_band_;
     recurse = recurse_;
     group_files = group_files_;
     group_size = group_size_;
     exclusions = exclusions_;
     compression_type = compression_type_;
     paths = paths_;
     name = name_;
   }
    : s3_csv_source)

let make_s3_json_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?multiline:(multiline_ : boxed_boolean option)
    ?json_path:(json_path_ : enclosed_in_string_property option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?max_band:(max_band_ : boxed_non_negative_int option) ?recurse:(recurse_ : boxed_boolean option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?compression_type:(compression_type_ : compression_type option)
    ~paths:(paths_ : enclosed_in_string_properties) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     multiline = multiline_;
     json_path = json_path_;
     additional_options = additional_options_;
     max_files_in_band = max_files_in_band_;
     max_band = max_band_;
     recurse = recurse_;
     group_files = group_files_;
     group_size = group_size_;
     exclusions = exclusions_;
     compression_type = compression_type_;
     paths = paths_;
     name = name_;
   }
    : s3_json_source)

let make_s3_parquet_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?max_band:(max_band_ : boxed_non_negative_int option) ?recurse:(recurse_ : boxed_boolean option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?compression_type:(compression_type_ : parquet_compression_type option)
    ~paths:(paths_ : enclosed_in_string_properties) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_options = additional_options_;
     max_files_in_band = max_files_in_band_;
     max_band = max_band_;
     recurse = recurse_;
     group_files = group_files_;
     group_size = group_size_;
     exclusions = exclusions_;
     compression_type = compression_type_;
     paths = paths_;
     name = name_;
   }
    : s3_parquet_source)

let make_relational_catalog_source ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; name = name_ } : relational_catalog_source)

let make_ddbelt_catalog_additional_options
    ?dynamodb_unnest_ddb_json:(dynamodb_unnest_ddb_json_ : boolean_value option)
    ?dynamodb_export:(dynamodb_export_ : enclosed_in_string_property option) () =
  ({ dynamodb_unnest_ddb_json = dynamodb_unnest_ddb_json_; dynamodb_export = dynamodb_export_ }
    : ddbelt_catalog_additional_options)

let make_dynamo_db_catalog_source
    ?additional_options:(additional_options_ : ddbelt_catalog_additional_options option)
    ?pitr_enabled:(pitr_enabled_ : boxed_boolean option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     additional_options = additional_options_;
     pitr_enabled = pitr_enabled_;
     table = table_;
     database = database_;
     name = name_;
   }
    : dynamo_db_catalog_source)

let make_jdbc_connector_target ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_options:(additional_options_ : additional_options option)
    ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_table:(connection_table_ : enclosed_in_string_property_with_quote)
    ~connection_name:(connection_name_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_options = additional_options_;
     connection_type = connection_type_;
     connector_name = connector_name_;
     connection_table = connection_table_;
     connection_name = connection_name_;
     inputs = inputs_;
     name = name_;
   }
    : jdbc_connector_target)

let make_spark_connector_target ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_options:(additional_options_ : additional_options option)
    ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_name:(connection_name_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_options = additional_options_;
     connection_type = connection_type_;
     connector_name = connector_name_;
     connection_name = connection_name_;
     inputs = inputs_;
     name = name_;
   }
    : spark_connector_target)

let make_basic_catalog_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     table = table_;
     database = database_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : basic_catalog_target)

let make_redshift_target
    ?upsert_redshift_options:(upsert_redshift_options_ : upsert_redshift_target_options option)
    ?tmp_dir_iam_role:(tmp_dir_iam_role_ : enclosed_in_string_property option)
    ?redshift_tmp_dir:(redshift_tmp_dir_ : enclosed_in_string_property option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     upsert_redshift_options = upsert_redshift_options_;
     tmp_dir_iam_role = tmp_dir_iam_role_;
     redshift_tmp_dir = redshift_tmp_dir_;
     table = table_;
     database = database_;
     inputs = inputs_;
     name = name_;
   }
    : redshift_target)

let make_catalog_schema_change_policy
    ?update_behavior:(update_behavior_ : update_catalog_behavior option)
    ?enable_update_catalog:(enable_update_catalog_ : boxed_boolean option) () =
  ({ update_behavior = update_behavior_; enable_update_catalog = enable_update_catalog_ }
    : catalog_schema_change_policy)

let make_auto_data_quality
    ?evaluation_context:(evaluation_context_ : enclosed_in_string_property option)
    ?is_enabled:(is_enabled_ : boolean_value option) () =
  ({ evaluation_context = evaluation_context_; is_enabled = is_enabled_ } : auto_data_quality)

let make_s3_catalog_target ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     database = database_;
     table = table_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_catalog_target)

let make_direct_schema_change_policy ?database:(database_ : enclosed_in_string_property option)
    ?table:(table_ : enclosed_in_string_property option)
    ?update_behavior:(update_behavior_ : update_catalog_behavior option)
    ?enable_update_catalog:(enable_update_catalog_ : boxed_boolean option) () =
  ({
     database = database_;
     table = table_;
     update_behavior = update_behavior_;
     enable_update_catalog = enable_update_catalog_;
   }
    : direct_schema_change_policy)

let make_s3_glue_parquet_target ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?compression:(compression_ : parquet_compression_type option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~path:(path_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     number_target_partitions = number_target_partitions_;
     compression = compression_;
     path = path_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_glue_parquet_target)

let make_s3_direct_target ?output_schemas:(output_schemas_ : glue_schemas option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?compression:(compression_ : enclosed_in_string_property option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~format:(format_ : target_format) ~path:(path_ : enclosed_in_string_property)
    ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     format = format_;
     number_target_partitions = number_target_partitions_;
     compression = compression_;
     path = path_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_direct_target)

let make_mapping ?children:(children_ : mappings option) ?dropped:(dropped_ : boxed_boolean option)
    ?to_type:(to_type_ : enclosed_in_string_property option)
    ?from_type:(from_type_ : enclosed_in_string_property option)
    ?from_path:(from_path_ : enclosed_in_string_properties option)
    ?to_key:(to_key_ : enclosed_in_string_property option) () =
  ({
     children = children_;
     dropped = dropped_;
     to_type = to_type_;
     from_type = from_type_;
     from_path = from_path_;
     to_key = to_key_;
   }
    : mapping)

let make_apply_mapping ~mapping:(mapping_ : mappings) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ mapping = mapping_; inputs = inputs_; name = name_ } : apply_mapping)

let make_select_fields ~paths:(paths_ : glue_studio_path_list) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ paths = paths_; inputs = inputs_; name = name_ } : select_fields)

let make_drop_fields ~paths:(paths_ : glue_studio_path_list) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ paths = paths_; inputs = inputs_; name = name_ } : drop_fields)

let make_rename_field ~target_path:(target_path_ : enclosed_in_string_properties)
    ~source_path:(source_path_ : enclosed_in_string_properties) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ target_path = target_path_; source_path = source_path_; inputs = inputs_; name = name_ }
    : rename_field)

let make_spigot ?prob:(prob_ : prob option) ?topk:(topk_ : topk option)
    ~path:(path_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ prob = prob_; topk = topk_; path = path_; inputs = inputs_; name = name_ } : spigot)

let make_join_column ~keys:(keys_ : glue_studio_path_list)
    ~from_:(from__ : enclosed_in_string_property) () =
  ({ keys = keys_; from_ = from__ } : join_column)

let make_join ~columns:(columns_ : join_columns) ~join_type:(join_type_ : join_type)
    ~inputs:(inputs_ : two_inputs) ~name:(name_ : node_name) () =
  ({ columns = columns_; join_type = join_type_; inputs = inputs_; name = name_ } : join)

let make_split_fields ~paths:(paths_ : glue_studio_path_list) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ paths = paths_; inputs = inputs_; name = name_ } : split_fields)

let make_select_from_collection ~index:(index_ : non_negative_int) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ index = index_; inputs = inputs_; name = name_ } : select_from_collection)

let make_fill_missing_values ?filled_path:(filled_path_ : enclosed_in_string_property option)
    ~imputed_path:(imputed_path_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ filled_path = filled_path_; imputed_path = imputed_path_; inputs = inputs_; name = name_ }
    : fill_missing_values)

let make_filter_value ~value:(value_ : enclosed_in_string_properties)
    ~type_:(type__ : filter_value_type) () =
  ({ value = value_; type_ = type__ } : filter_value)

let make_filter_expression ?negated:(negated_ : boxed_boolean option)
    ~values:(values_ : filter_values) ~operation:(operation_ : filter_operation) () =
  ({ values = values_; negated = negated_; operation = operation_ } : filter_expression)

let make_filter ~filters:(filters_ : filter_expressions)
    ~logical_operator:(logical_operator_ : filter_logical_operator) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ filters = filters_; logical_operator = logical_operator_; inputs = inputs_; name = name_ }
    : filter)

let make_custom_code ?output_schemas:(output_schemas_ : glue_schemas option)
    ~class_name:(class_name_ : enclosed_in_string_property) ~code:(code_ : extended_string)
    ~inputs:(inputs_ : many_inputs) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     class_name = class_name_;
     code = code_;
     inputs = inputs_;
     name = name_;
   }
    : custom_code)

let make_sql_alias ~alias:(alias_ : enclosed_in_string_property_with_quote)
    ~from_:(from__ : node_id) () =
  ({ alias = alias_; from_ = from__ } : sql_alias)

let make_spark_sq_l ?output_schemas:(output_schemas_ : glue_schemas option)
    ~sql_aliases:(sql_aliases_ : sql_aliases) ~sql_query:(sql_query_ : sql_query)
    ~inputs:(inputs_ : many_inputs) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     sql_aliases = sql_aliases_;
     sql_query = sql_query_;
     inputs = inputs_;
     name = name_;
   }
    : spark_sq_l)

let make_kinesis_streaming_source_options
    ?fanout_consumer_ar_n:(fanout_consumer_ar_n_ : enclosed_in_string_property option)
    ?starting_timestamp:(starting_timestamp_ : iso8601_date_time option)
    ?emit_consumer_lag_metrics:(emit_consumer_lag_metrics_ : enclosed_in_string_property option)
    ?add_record_timestamp:(add_record_timestamp_ : enclosed_in_string_property option)
    ?role_session_name:(role_session_name_ : enclosed_in_string_property option)
    ?role_arn:(role_arn_ : enclosed_in_string_property option)
    ?stream_arn:(stream_arn_ : enclosed_in_string_property option)
    ?avoid_empty_batches:(avoid_empty_batches_ : boxed_boolean option)
    ?max_retry_interval_ms:(max_retry_interval_ms_ : boxed_non_negative_long option)
    ?retry_interval_ms:(retry_interval_ms_ : boxed_non_negative_long option)
    ?num_retries:(num_retries_ : boxed_non_negative_int option)
    ?describe_shard_interval:(describe_shard_interval_ : boxed_non_negative_long option)
    ?idle_time_between_reads_in_ms:(idle_time_between_reads_in_ms_ : boxed_non_negative_long option)
    ?add_idle_time_between_reads:(add_idle_time_between_reads_ : boxed_boolean option)
    ?max_record_per_read:(max_record_per_read_ : boxed_non_negative_long option)
    ?max_fetch_records_per_shard:(max_fetch_records_per_shard_ : boxed_non_negative_long option)
    ?max_fetch_time_in_ms:(max_fetch_time_in_ms_ : boxed_non_negative_long option)
    ?starting_position:(starting_position_ : starting_position option)
    ?delimiter:(delimiter_ : enclosed_in_string_property option)
    ?classification:(classification_ : enclosed_in_string_property option)
    ?stream_name:(stream_name_ : enclosed_in_string_property option)
    ?endpoint_url:(endpoint_url_ : enclosed_in_string_property option) () =
  ({
     fanout_consumer_ar_n = fanout_consumer_ar_n_;
     starting_timestamp = starting_timestamp_;
     emit_consumer_lag_metrics = emit_consumer_lag_metrics_;
     add_record_timestamp = add_record_timestamp_;
     role_session_name = role_session_name_;
     role_arn = role_arn_;
     stream_arn = stream_arn_;
     avoid_empty_batches = avoid_empty_batches_;
     max_retry_interval_ms = max_retry_interval_ms_;
     retry_interval_ms = retry_interval_ms_;
     num_retries = num_retries_;
     describe_shard_interval = describe_shard_interval_;
     idle_time_between_reads_in_ms = idle_time_between_reads_in_ms_;
     add_idle_time_between_reads = add_idle_time_between_reads_;
     max_record_per_read = max_record_per_read_;
     max_fetch_records_per_shard = max_fetch_records_per_shard_;
     max_fetch_time_in_ms = max_fetch_time_in_ms_;
     starting_position = starting_position_;
     delimiter = delimiter_;
     classification = classification_;
     stream_name = stream_name_;
     endpoint_url = endpoint_url_;
   }
    : kinesis_streaming_source_options)

let make_streaming_data_preview_options
    ?record_polling_limit:(record_polling_limit_ : positive_long option)
    ?polling_time:(polling_time_ : polling_time option) () =
  ({ record_polling_limit = record_polling_limit_; polling_time = polling_time_ }
    : streaming_data_preview_options)

let make_direct_kinesis_source
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ?streaming_options:(streaming_options_ : kinesis_streaming_source_options option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?window_size:(window_size_ : boxed_positive_int option) ~name:(name_ : node_name) () =
  ({
     data_preview_options = data_preview_options_;
     streaming_options = streaming_options_;
     detect_schema = detect_schema_;
     window_size = window_size_;
     name = name_;
   }
    : direct_kinesis_source)

let make_kafka_streaming_source_options
    ?starting_timestamp:(starting_timestamp_ : iso8601_date_time option)
    ?emit_consumer_lag_metrics:(emit_consumer_lag_metrics_ : enclosed_in_string_property option)
    ?add_record_timestamp:(add_record_timestamp_ : enclosed_in_string_property option)
    ?include_headers:(include_headers_ : boxed_boolean option)
    ?min_partitions:(min_partitions_ : boxed_non_negative_int option)
    ?max_offsets_per_trigger:(max_offsets_per_trigger_ : boxed_non_negative_long option)
    ?retry_interval_ms:(retry_interval_ms_ : boxed_non_negative_long option)
    ?num_retries:(num_retries_ : boxed_non_negative_int option)
    ?poll_timeout_ms:(poll_timeout_ms_ : boxed_non_negative_long option)
    ?ending_offsets:(ending_offsets_ : enclosed_in_string_property option)
    ?starting_offsets:(starting_offsets_ : enclosed_in_string_property option)
    ?delimiter:(delimiter_ : enclosed_in_string_property option)
    ?classification:(classification_ : enclosed_in_string_property option)
    ?subscribe_pattern:(subscribe_pattern_ : enclosed_in_string_property option)
    ?assign:(assign_ : enclosed_in_string_property option)
    ?topic_name:(topic_name_ : enclosed_in_string_property option)
    ?connection_name:(connection_name_ : enclosed_in_string_property option)
    ?security_protocol:(security_protocol_ : enclosed_in_string_property option)
    ?bootstrap_servers:(bootstrap_servers_ : enclosed_in_string_property option) () =
  ({
     starting_timestamp = starting_timestamp_;
     emit_consumer_lag_metrics = emit_consumer_lag_metrics_;
     add_record_timestamp = add_record_timestamp_;
     include_headers = include_headers_;
     min_partitions = min_partitions_;
     max_offsets_per_trigger = max_offsets_per_trigger_;
     retry_interval_ms = retry_interval_ms_;
     num_retries = num_retries_;
     poll_timeout_ms = poll_timeout_ms_;
     ending_offsets = ending_offsets_;
     starting_offsets = starting_offsets_;
     delimiter = delimiter_;
     classification = classification_;
     subscribe_pattern = subscribe_pattern_;
     assign = assign_;
     topic_name = topic_name_;
     connection_name = connection_name_;
     security_protocol = security_protocol_;
     bootstrap_servers = bootstrap_servers_;
   }
    : kafka_streaming_source_options)

let make_direct_kafka_source
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?window_size:(window_size_ : boxed_positive_int option)
    ?streaming_options:(streaming_options_ : kafka_streaming_source_options option)
    ~name:(name_ : node_name) () =
  ({
     data_preview_options = data_preview_options_;
     detect_schema = detect_schema_;
     window_size = window_size_;
     streaming_options = streaming_options_;
     name = name_;
   }
    : direct_kafka_source)

let make_catalog_kinesis_source
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ?streaming_options:(streaming_options_ : kinesis_streaming_source_options option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?window_size:(window_size_ : boxed_positive_int option)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     data_preview_options = data_preview_options_;
     streaming_options = streaming_options_;
     database = database_;
     table = table_;
     detect_schema = detect_schema_;
     window_size = window_size_;
     name = name_;
   }
    : catalog_kinesis_source)

let make_catalog_kafka_source
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ?streaming_options:(streaming_options_ : kafka_streaming_source_options option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?window_size:(window_size_ : boxed_positive_int option)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     data_preview_options = data_preview_options_;
     streaming_options = streaming_options_;
     database = database_;
     table = table_;
     detect_schema = detect_schema_;
     window_size = window_size_;
     name = name_;
   }
    : catalog_kafka_source)

let make_null_check_box_list ?is_neg_one:(is_neg_one_ : boxed_boolean option)
    ?is_null_string:(is_null_string_ : boxed_boolean option)
    ?is_empty:(is_empty_ : boxed_boolean option) () =
  ({ is_neg_one = is_neg_one_; is_null_string = is_null_string_; is_empty = is_empty_ }
    : null_check_box_list)

let make_datatype ~label:(label_ : generic_limited_string) ~id:(id_ : generic_limited_string) () =
  ({ label = label_; id = id_ } : datatype)

let make_null_value_field ~datatype:(datatype_ : datatype)
    ~value:(value_ : enclosed_in_string_property) () =
  ({ datatype = datatype_; value = value_ } : null_value_field)

let make_drop_null_fields ?null_text_list:(null_text_list_ : null_value_fields option)
    ?null_check_box_list:(null_check_box_list_ : null_check_box_list option)
    ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({
     null_text_list = null_text_list_;
     null_check_box_list = null_check_box_list_;
     inputs = inputs_;
     name = name_;
   }
    : drop_null_fields)

let make_merge ~primary_keys:(primary_keys_ : glue_studio_path_list) ~source:(source_ : node_id)
    ~inputs:(inputs_ : two_inputs) ~name:(name_ : node_name) () =
  ({ primary_keys = primary_keys_; source = source_; inputs = inputs_; name = name_ } : merge)

let make_union ~union_type:(union_type_ : union_type) ~inputs:(inputs_ : two_inputs)
    ~name:(name_ : node_name) () =
  ({ union_type = union_type_; inputs = inputs_; name = name_ } : union)

let make_pii_detection
    ?detection_sensitivity:(detection_sensitivity_ : enclosed_in_string_property option)
    ?detection_parameters:(detection_parameters_ : enclosed_in_string_property option)
    ?num_right_chars_to_exclude:(num_right_chars_to_exclude_ : boxed_positive_int option)
    ?num_left_chars_to_exclude:(num_left_chars_to_exclude_ : boxed_positive_int option)
    ?match_pattern:(match_pattern_ : enclosed_in_string_property option)
    ?redact_char:(redact_char_ : enclosed_in_string_property option)
    ?redact_text:(redact_text_ : enclosed_in_string_property option)
    ?mask_value:(mask_value_ : mask_value option)
    ?threshold_fraction:(threshold_fraction_ : boxed_double_fraction option)
    ?sample_fraction:(sample_fraction_ : boxed_double_fraction option)
    ?output_column_name:(output_column_name_ : enclosed_in_string_property option)
    ~entity_types_to_detect:(entity_types_to_detect_ : enclosed_in_string_properties)
    ~pii_type:(pii_type_ : pii_type) ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({
     detection_sensitivity = detection_sensitivity_;
     detection_parameters = detection_parameters_;
     num_right_chars_to_exclude = num_right_chars_to_exclude_;
     num_left_chars_to_exclude = num_left_chars_to_exclude_;
     match_pattern = match_pattern_;
     redact_char = redact_char_;
     redact_text = redact_text_;
     mask_value = mask_value_;
     threshold_fraction = threshold_fraction_;
     sample_fraction = sample_fraction_;
     output_column_name = output_column_name_;
     entity_types_to_detect = entity_types_to_detect_;
     pii_type = pii_type_;
     inputs = inputs_;
     name = name_;
   }
    : pii_detection)

let make_aggregate_operation ~agg_func:(agg_func_ : agg_function)
    ~column:(column_ : enclosed_in_string_properties) () =
  ({ agg_func = agg_func_; column = column_ } : aggregate_operation)

let make_aggregate ~aggs:(aggs_ : aggregate_operations) ~groups:(groups_ : glue_studio_path_list)
    ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({ aggs = aggs_; groups = groups_; inputs = inputs_; name = name_ } : aggregate)

let make_drop_duplicates ?columns:(columns_ : limited_path_list option)
    ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({ columns = columns_; inputs = inputs_; name = name_ } : drop_duplicates)

let make_governed_catalog_target
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     schema_change_policy = schema_change_policy_;
     database = database_;
     table = table_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : governed_catalog_target)

let make_governed_catalog_source
    ?additional_options:(additional_options_ : s3_source_additional_options option)
    ?partition_predicate:(partition_predicate_ : enclosed_in_string_property option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     additional_options = additional_options_;
     partition_predicate = partition_predicate_;
     table = table_;
     database = database_;
     name = name_;
   }
    : governed_catalog_source)

let make_microsoft_sql_server_catalog_source ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; name = name_ } : microsoft_sql_server_catalog_source)

let make_my_sql_catalog_source ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; name = name_ } : my_sql_catalog_source)

let make_oracle_sql_catalog_source ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; name = name_ } : oracle_sql_catalog_source)

let make_postgre_sql_catalog_source ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; name = name_ } : postgre_sql_catalog_source)

let make_microsoft_sql_server_catalog_target ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; inputs = inputs_; name = name_ }
    : microsoft_sql_server_catalog_target)

let make_my_sql_catalog_target ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; inputs = inputs_; name = name_ } : my_sql_catalog_target)

let make_oracle_sql_catalog_target ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; inputs = inputs_; name = name_ }
    : oracle_sql_catalog_target)

let make_postgre_sql_catalog_target ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({ table = table_; database = database_; inputs = inputs_; name = name_ }
    : postgre_sql_catalog_target)

let make_group_filters ~logical_operator:(logical_operator_ : filter_logical_operator)
    ~filters:(filters_ : filter_expressions) ~group_name:(group_name_ : generic_limited_string) () =
  ({ logical_operator = logical_operator_; filters = filters_; group_name = group_name_ }
    : group_filters)

let make_route ~group_filters_list:(group_filters_list_ : group_filters_list)
    ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({ group_filters_list = group_filters_list_; inputs = inputs_; name = name_ } : route)

let make_transform_config_parameter ?is_optional:(is_optional_ : boxed_boolean option)
    ?list_type:(list_type_ : param_type option)
    ?value:(value_ : enclosed_in_string_properties option)
    ?validation_message:(validation_message_ : enclosed_in_string_property option)
    ?validation_rule:(validation_rule_ : enclosed_in_string_property option)
    ~type_:(type__ : param_type) ~name:(name_ : enclosed_in_string_property) () =
  ({
     is_optional = is_optional_;
     list_type = list_type_;
     value = value_;
     validation_message = validation_message_;
     validation_rule = validation_rule_;
     type_ = type__;
     name = name_;
   }
    : transform_config_parameter)

let make_dynamic_transform ?output_schemas:(output_schemas_ : glue_schemas option)
    ?version:(version_ : enclosed_in_string_property option)
    ?parameters:(parameters_ : transform_config_parameter_list option)
    ~path:(path_ : enclosed_in_string_property)
    ~function_name:(function_name_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~transform_name:(transform_name_ : enclosed_in_string_property)
    ~name:(name_ : enclosed_in_string_property) () =
  ({
     output_schemas = output_schemas_;
     version = version_;
     path = path_;
     function_name = function_name_;
     parameters = parameters_;
     inputs = inputs_;
     transform_name = transform_name_;
     name = name_;
   }
    : dynamic_transform)

let make_dq_results_publishing_options
    ?results_publishing_enabled:(results_publishing_enabled_ : boxed_boolean option)
    ?cloud_watch_metrics_enabled:(cloud_watch_metrics_enabled_ : boxed_boolean option)
    ?results_s3_prefix:(results_s3_prefix_ : enclosed_in_string_property option)
    ?evaluation_context:(evaluation_context_ : generic_limited_string option) () =
  ({
     results_publishing_enabled = results_publishing_enabled_;
     cloud_watch_metrics_enabled = cloud_watch_metrics_enabled_;
     results_s3_prefix = results_s3_prefix_;
     evaluation_context = evaluation_context_;
   }
    : dq_results_publishing_options)

let make_dq_stop_job_on_failure_options
    ?stop_job_on_failure_timing:(stop_job_on_failure_timing_ : dq_stop_job_on_failure_timing option)
    () =
  ({ stop_job_on_failure_timing = stop_job_on_failure_timing_ } : dq_stop_job_on_failure_options)

let make_evaluate_data_quality
    ?stop_job_on_failure_options:
      (stop_job_on_failure_options_ : dq_stop_job_on_failure_options option)
    ?publishing_options:(publishing_options_ : dq_results_publishing_options option)
    ?output:(output_ : dq_transform_output option) ~ruleset:(ruleset_ : dqdl_string)
    ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({
     stop_job_on_failure_options = stop_job_on_failure_options_;
     publishing_options = publishing_options_;
     output = output_;
     ruleset = ruleset_;
     inputs = inputs_;
     name = name_;
   }
    : evaluate_data_quality)

let make_s3_catalog_hudi_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_hudi_options:(additional_hudi_options_ : additional_options option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_hudi_options = additional_hudi_options_;
     table = table_;
     database = database_;
     name = name_;
   }
    : s3_catalog_hudi_source)

let make_catalog_hudi_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_hudi_options:(additional_hudi_options_ : additional_options option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_hudi_options = additional_hudi_options_;
     table = table_;
     database = database_;
     name = name_;
   }
    : catalog_hudi_source)

let make_s3_hudi_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?additional_hudi_options:(additional_hudi_options_ : additional_options option)
    ~paths:(paths_ : enclosed_in_string_properties) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_options = additional_options_;
     additional_hudi_options = additional_hudi_options_;
     paths = paths_;
     name = name_;
   }
    : s3_hudi_source)

let make_s3_hudi_catalog_target ?output_schemas:(output_schemas_ : glue_schemas option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~additional_options:(additional_options_ : additional_options)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     additional_options = additional_options_;
     database = database_;
     table = table_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_hudi_catalog_target)

let make_s3_hudi_direct_target ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ~additional_options:(additional_options_ : additional_options) ~format:(format_ : target_format)
    ~compression:(compression_ : hudi_target_compression_type)
    ~path:(path_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     additional_options = additional_options_;
     format = format_;
     partition_keys = partition_keys_;
     number_target_partitions = number_target_partitions_;
     compression = compression_;
     path = path_;
     inputs = inputs_;
     name = name_;
   }
    : s3_hudi_direct_target)

let make_direct_jdbc_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?redshift_tmp_dir:(redshift_tmp_dir_ : enclosed_in_string_property option)
    ~connection_type:(connection_type_ : jdbc_connection_type)
    ~connection_name:(connection_name_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     redshift_tmp_dir = redshift_tmp_dir_;
     connection_type = connection_type_;
     connection_name = connection_name_;
     table = table_;
     database = database_;
     name = name_;
   }
    : direct_jdbc_source)

let make_s3_catalog_delta_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_delta_options:(additional_delta_options_ : additional_options option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_delta_options = additional_delta_options_;
     table = table_;
     database = database_;
     name = name_;
   }
    : s3_catalog_delta_source)

let make_catalog_delta_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_delta_options:(additional_delta_options_ : additional_options option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_delta_options = additional_delta_options_;
     table = table_;
     database = database_;
     name = name_;
   }
    : catalog_delta_source)

let make_s3_delta_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?additional_delta_options:(additional_delta_options_ : additional_options option)
    ~paths:(paths_ : enclosed_in_string_properties) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_options = additional_options_;
     additional_delta_options = additional_delta_options_;
     paths = paths_;
     name = name_;
   }
    : s3_delta_source)

let make_s3_delta_catalog_target ?output_schemas:(output_schemas_ : glue_schemas option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?additional_options:(additional_options_ : additional_options option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     additional_options = additional_options_;
     database = database_;
     table = table_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_delta_catalog_target)

let make_s3_delta_direct_target ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?additional_options:(additional_options_ : additional_options option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~format:(format_ : target_format) ~compression:(compression_ : delta_target_compression_type)
    ~path:(path_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     additional_options = additional_options_;
     format = format_;
     number_target_partitions = number_target_partitions_;
     compression = compression_;
     path = path_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_delta_direct_target)

let make_option_ ?description:(description_ : enclosed_in_string_property option)
    ?label:(label_ : enclosed_in_string_property option)
    ?value:(value_ : enclosed_in_string_property option) () =
  ({ description = description_; label = label_; value = value_ } : option_)

let make_amazon_redshift_advanced_option ?value:(value_ : generic_string option)
    ?key:(key_ : generic_string option) () =
  ({ value = value_; key = key_ } : amazon_redshift_advanced_option)

let make_amazon_redshift_node_data ?selected_columns:(selected_columns_ : option_list option)
    ?staging_table:(staging_table_ : generic_string option)
    ?table_schema:(table_schema_ : option_list option)
    ?crawler_connection:(crawler_connection_ : generic_string option)
    ?merge_clause:(merge_clause_ : generic_string option)
    ?merge_when_not_matched:(merge_when_not_matched_ : generic_limited_string option)
    ?merge_when_matched:(merge_when_matched_ : generic_limited_string option)
    ?merge_action:(merge_action_ : generic_limited_string option)
    ?upsert:(upsert_ : boolean_value option)
    ?table_prefix:(table_prefix_ : generic_limited_string option)
    ?action:(action_ : generic_string option) ?post_action:(post_action_ : generic_string option)
    ?pre_action:(pre_action_ : generic_string option)
    ?sample_query:(sample_query_ : generic_string option)
    ?advanced_options:(advanced_options_ : amazon_redshift_advanced_options option)
    ?iam_role:(iam_role_ : option_ option)
    ?temp_dir:(temp_dir_ : enclosed_in_string_property option)
    ?catalog_redshift_table:(catalog_redshift_table_ : generic_string option)
    ?catalog_redshift_schema:(catalog_redshift_schema_ : generic_string option)
    ?catalog_table:(catalog_table_ : option_ option)
    ?catalog_database:(catalog_database_ : option_ option) ?table:(table_ : option_ option)
    ?schema:(schema_ : option_ option) ?connection:(connection_ : option_ option)
    ?source_type:(source_type_ : generic_limited_string option)
    ?access_type:(access_type_ : generic_limited_string option) () =
  ({
     selected_columns = selected_columns_;
     staging_table = staging_table_;
     table_schema = table_schema_;
     crawler_connection = crawler_connection_;
     merge_clause = merge_clause_;
     merge_when_not_matched = merge_when_not_matched_;
     merge_when_matched = merge_when_matched_;
     merge_action = merge_action_;
     upsert = upsert_;
     table_prefix = table_prefix_;
     action = action_;
     post_action = post_action_;
     pre_action = pre_action_;
     sample_query = sample_query_;
     advanced_options = advanced_options_;
     iam_role = iam_role_;
     temp_dir = temp_dir_;
     catalog_redshift_table = catalog_redshift_table_;
     catalog_redshift_schema = catalog_redshift_schema_;
     catalog_table = catalog_table_;
     catalog_database = catalog_database_;
     table = table_;
     schema = schema_;
     connection = connection_;
     source_type = source_type_;
     access_type = access_type_;
   }
    : amazon_redshift_node_data)

let make_amazon_redshift_source ?data:(data_ : amazon_redshift_node_data option)
    ?name:(name_ : node_name option) () =
  ({ data = data_; name = name_ } : amazon_redshift_source)

let make_amazon_redshift_target ?inputs:(inputs_ : one_input option)
    ?data:(data_ : amazon_redshift_node_data option) ?name:(name_ : node_name option) () =
  ({ inputs = inputs_; data = data_; name = name_ } : amazon_redshift_target)

let make_evaluate_data_quality_multi_frame
    ?stop_job_on_failure_options:
      (stop_job_on_failure_options_ : dq_stop_job_on_failure_options option)
    ?additional_options:(additional_options_ : dq_additional_options option)
    ?publishing_options:(publishing_options_ : dq_results_publishing_options option)
    ?additional_data_sources:(additional_data_sources_ : dqdl_aliases option)
    ~ruleset:(ruleset_ : dqdl_string) ~inputs:(inputs_ : many_inputs) ~name:(name_ : node_name) () =
  ({
     stop_job_on_failure_options = stop_job_on_failure_options_;
     additional_options = additional_options_;
     publishing_options = publishing_options_;
     ruleset = ruleset_;
     additional_data_sources = additional_data_sources_;
     inputs = inputs_;
     name = name_;
   }
    : evaluate_data_quality_multi_frame)

let make_recipe_reference ~recipe_version:(recipe_version_ : recipe_version)
    ~recipe_arn:(recipe_arn_ : enclosed_in_string_property) () =
  ({ recipe_version = recipe_version_; recipe_arn = recipe_arn_ } : recipe_reference)

let make_recipe_action ?parameters:(parameters_ : parameter_map option)
    ~operation:(operation_ : operation) () =
  ({ parameters = parameters_; operation = operation_ } : recipe_action)

let make_condition_expression ?value:(value_ : databrew_condition_value option)
    ~target_column:(target_column_ : target_column) ~condition:(condition_ : databrew_condition) ()
    =
  ({ target_column = target_column_; value = value_; condition = condition_ }
    : condition_expression)

let make_recipe_step
    ?condition_expressions:(condition_expressions_ : condition_expression_list option)
    ~action:(action_ : recipe_action) () =
  ({ condition_expressions = condition_expressions_; action = action_ } : recipe_step)

let make_recipe ?recipe_steps:(recipe_steps_ : recipe_steps option)
    ?recipe_reference:(recipe_reference_ : recipe_reference option) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     recipe_steps = recipe_steps_;
     recipe_reference = recipe_reference_;
     inputs = inputs_;
     name = name_;
   }
    : recipe)

let make_snowflake_node_data ?table_schema:(table_schema_ : option_list option)
    ?auto_pushdown:(auto_pushdown_ : boolean_value option)
    ?selected_columns:(selected_columns_ : option_list option)
    ?staging_table:(staging_table_ : generic_string option)
    ?merge_clause:(merge_clause_ : generic_string option)
    ?merge_when_not_matched:(merge_when_not_matched_ : generic_limited_string option)
    ?merge_when_matched:(merge_when_matched_ : generic_limited_string option)
    ?merge_action:(merge_action_ : generic_limited_string option)
    ?upsert:(upsert_ : boolean_value option) ?action:(action_ : generic_string option)
    ?post_action:(post_action_ : generic_string option)
    ?pre_action:(pre_action_ : generic_string option)
    ?sample_query:(sample_query_ : generic_string option)
    ?additional_options:(additional_options_ : additional_options option)
    ?iam_role:(iam_role_ : option_ option)
    ?temp_dir:(temp_dir_ : enclosed_in_string_property option)
    ?database:(database_ : generic_string option) ?table:(table_ : generic_string option)
    ?schema:(schema_ : generic_string option) ?connection:(connection_ : option_ option)
    ?source_type:(source_type_ : generic_limited_string option) () =
  ({
     table_schema = table_schema_;
     auto_pushdown = auto_pushdown_;
     selected_columns = selected_columns_;
     staging_table = staging_table_;
     merge_clause = merge_clause_;
     merge_when_not_matched = merge_when_not_matched_;
     merge_when_matched = merge_when_matched_;
     merge_action = merge_action_;
     upsert = upsert_;
     action = action_;
     post_action = post_action_;
     pre_action = pre_action_;
     sample_query = sample_query_;
     additional_options = additional_options_;
     iam_role = iam_role_;
     temp_dir = temp_dir_;
     database = database_;
     table = table_;
     schema = schema_;
     connection = connection_;
     source_type = source_type_;
   }
    : snowflake_node_data)

let make_snowflake_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ~data:(data_ : snowflake_node_data) ~name:(name_ : node_name) () =
  ({ output_schemas = output_schemas_; data = data_; name = name_ } : snowflake_source)

let make_snowflake_target ?inputs:(inputs_ : one_input option) ~data:(data_ : snowflake_node_data)
    ~name:(name_ : node_name) () =
  ({ inputs = inputs_; data = data_; name = name_ } : snowflake_target)

let make_connector_data_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ~data:(data_ : connector_options)
    ~connection_type:(connection_type_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     data = data_;
     connection_type = connection_type_;
     name = name_;
   }
    : connector_data_source)

let make_connector_data_target ?inputs:(inputs_ : one_input option)
    ~data:(data_ : connector_options)
    ~connection_type:(connection_type_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({ inputs = inputs_; data = data_; connection_type = connection_type_; name = name_ }
    : connector_data_target)

let make_s3_catalog_iceberg_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_iceberg_options:(additional_iceberg_options_ : additional_options option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_iceberg_options = additional_iceberg_options_;
     table = table_;
     database = database_;
     name = name_;
   }
    : s3_catalog_iceberg_source)

let make_catalog_iceberg_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?additional_iceberg_options:(additional_iceberg_options_ : additional_options option)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     additional_iceberg_options = additional_iceberg_options_;
     table = table_;
     database = database_;
     name = name_;
   }
    : catalog_iceberg_source)

let make_s3_iceberg_catalog_target
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?additional_options:(additional_options_ : additional_options option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     additional_options = additional_options_;
     database = database_;
     table = table_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_iceberg_catalog_target)

let make_s3_iceberg_direct_target ?output_schemas:(output_schemas_ : glue_schemas option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?additional_options:(additional_options_ : additional_options option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~compression:(compression_ : iceberg_target_compression_type) ~format:(format_ : target_format)
    ~path:(path_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     number_target_partitions = number_target_partitions_;
     compression = compression_;
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     additional_options = additional_options_;
     format = format_;
     path = path_;
     partition_keys = partition_keys_;
     inputs = inputs_;
     name = name_;
   }
    : s3_iceberg_direct_target)

let make_s3_excel_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?skip_footer:(skip_footer_ : boxed_non_negative_int option)
    ?number_rows:(number_rows_ : boxed_long option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?max_band:(max_band_ : boxed_non_negative_int option) ?recurse:(recurse_ : boxed_boolean option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?compression_type:(compression_type_ : parquet_compression_type option)
    ~paths:(paths_ : enclosed_in_string_properties) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     skip_footer = skip_footer_;
     number_rows = number_rows_;
     additional_options = additional_options_;
     max_files_in_band = max_files_in_band_;
     max_band = max_band_;
     recurse = recurse_;
     group_files = group_files_;
     group_size = group_size_;
     exclusions = exclusions_;
     compression_type = compression_type_;
     paths = paths_;
     name = name_;
   }
    : s3_excel_source)

let make_s3_hyper_direct_target ?output_schemas:(output_schemas_ : glue_schemas option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?compression:(compression_ : hyper_target_compression_type option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?format:(format_ : target_format option) ~path:(path_ : enclosed_in_string_property)
    ~inputs:(inputs_ : one_input) ~name:(name_ : node_name) () =
  ({
     output_schemas = output_schemas_;
     auto_data_quality = auto_data_quality_;
     schema_change_policy = schema_change_policy_;
     compression = compression_;
     path = path_;
     partition_keys = partition_keys_;
     format = format_;
     inputs = inputs_;
     name = name_;
   }
    : s3_hyper_direct_target)

let make_ddbelt_connection_options
    ?dynamodb_sts_role_arn:(dynamodb_sts_role_arn_ : enclosed_in_string_property option)
    ?dynamodb_s3_bucket_owner:(dynamodb_s3_bucket_owner_ : enclosed_in_string_property option)
    ?dynamodb_s3_prefix:(dynamodb_s3_prefix_ : enclosed_in_string_property option)
    ?dynamodb_s3_bucket:(dynamodb_s3_bucket_ : enclosed_in_string_property option)
    ?dynamodb_unnest_ddb_json:(dynamodb_unnest_ddb_json_ : boolean_value option)
    ?dynamodb_export:(dynamodb_export_ : ddb_export_type option)
    ~dynamodb_table_arn:(dynamodb_table_arn_ : enclosed_in_string_property) () =
  ({
     dynamodb_sts_role_arn = dynamodb_sts_role_arn_;
     dynamodb_s3_bucket_owner = dynamodb_s3_bucket_owner_;
     dynamodb_s3_prefix = dynamodb_s3_prefix_;
     dynamodb_s3_bucket = dynamodb_s3_bucket_;
     dynamodb_table_arn = dynamodb_table_arn_;
     dynamodb_unnest_ddb_json = dynamodb_unnest_ddb_json_;
     dynamodb_export = dynamodb_export_;
   }
    : ddbelt_connection_options)

let make_dynamo_dbelt_connector_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ?connection_options:(connection_options_ : ddbelt_connection_options option)
    ~name:(name_ : node_name) () =
  ({ output_schemas = output_schemas_; connection_options = connection_options_; name = name_ }
    : dynamo_dbelt_connector_source)

let make_code_gen_configuration_node
    ?dynamo_dbelt_connector_source:
      (dynamo_dbelt_connector_source_ : dynamo_dbelt_connector_source option)
    ?s3_hyper_direct_target:(s3_hyper_direct_target_ : s3_hyper_direct_target option)
    ?s3_excel_source:(s3_excel_source_ : s3_excel_source option)
    ?s3_iceberg_direct_target:(s3_iceberg_direct_target_ : s3_iceberg_direct_target option)
    ?s3_iceberg_catalog_target:(s3_iceberg_catalog_target_ : s3_iceberg_catalog_target option)
    ?catalog_iceberg_source:(catalog_iceberg_source_ : catalog_iceberg_source option)
    ?s3_catalog_iceberg_source:(s3_catalog_iceberg_source_ : s3_catalog_iceberg_source option)
    ?connector_data_target:(connector_data_target_ : connector_data_target option)
    ?connector_data_source:(connector_data_source_ : connector_data_source option)
    ?snowflake_target:(snowflake_target_ : snowflake_target option)
    ?snowflake_source:(snowflake_source_ : snowflake_source option)
    ?recipe:(recipe_ : recipe option)
    ?evaluate_data_quality_multi_frame:
      (evaluate_data_quality_multi_frame_ : evaluate_data_quality_multi_frame option)
    ?amazon_redshift_target:(amazon_redshift_target_ : amazon_redshift_target option)
    ?amazon_redshift_source:(amazon_redshift_source_ : amazon_redshift_source option)
    ?s3_delta_direct_target:(s3_delta_direct_target_ : s3_delta_direct_target option)
    ?s3_delta_catalog_target:(s3_delta_catalog_target_ : s3_delta_catalog_target option)
    ?s3_delta_source:(s3_delta_source_ : s3_delta_source option)
    ?catalog_delta_source:(catalog_delta_source_ : catalog_delta_source option)
    ?s3_catalog_delta_source:(s3_catalog_delta_source_ : s3_catalog_delta_source option)
    ?direct_jdbc_source:(direct_jdbc_source_ : direct_jdbc_source option)
    ?s3_hudi_direct_target:(s3_hudi_direct_target_ : s3_hudi_direct_target option)
    ?s3_hudi_catalog_target:(s3_hudi_catalog_target_ : s3_hudi_catalog_target option)
    ?s3_hudi_source:(s3_hudi_source_ : s3_hudi_source option)
    ?catalog_hudi_source:(catalog_hudi_source_ : catalog_hudi_source option)
    ?s3_catalog_hudi_source:(s3_catalog_hudi_source_ : s3_catalog_hudi_source option)
    ?evaluate_data_quality:(evaluate_data_quality_ : evaluate_data_quality option)
    ?dynamic_transform:(dynamic_transform_ : dynamic_transform option)
    ?route:(route_ : route option)
    ?postgre_sql_catalog_target:(postgre_sql_catalog_target_ : postgre_sql_catalog_target option)
    ?oracle_sql_catalog_target:(oracle_sql_catalog_target_ : oracle_sql_catalog_target option)
    ?my_sql_catalog_target:(my_sql_catalog_target_ : my_sql_catalog_target option)
    ?microsoft_sql_server_catalog_target:
      (microsoft_sql_server_catalog_target_ : microsoft_sql_server_catalog_target option)
    ?postgre_sql_catalog_source:(postgre_sql_catalog_source_ : postgre_sql_catalog_source option)
    ?oracle_sql_catalog_source:(oracle_sql_catalog_source_ : oracle_sql_catalog_source option)
    ?my_sql_catalog_source:(my_sql_catalog_source_ : my_sql_catalog_source option)
    ?microsoft_sql_server_catalog_source:
      (microsoft_sql_server_catalog_source_ : microsoft_sql_server_catalog_source option)
    ?governed_catalog_source:(governed_catalog_source_ : governed_catalog_source option)
    ?governed_catalog_target:(governed_catalog_target_ : governed_catalog_target option)
    ?drop_duplicates:(drop_duplicates_ : drop_duplicates option)
    ?aggregate:(aggregate_ : aggregate option)
    ?pii_detection:(pii_detection_ : pii_detection option) ?union:(union_ : union option)
    ?merge:(merge_ : merge option) ?drop_null_fields:(drop_null_fields_ : drop_null_fields option)
    ?catalog_kafka_source:(catalog_kafka_source_ : catalog_kafka_source option)
    ?catalog_kinesis_source:(catalog_kinesis_source_ : catalog_kinesis_source option)
    ?direct_kafka_source:(direct_kafka_source_ : direct_kafka_source option)
    ?direct_kinesis_source:(direct_kinesis_source_ : direct_kinesis_source option)
    ?spark_sq_l:(spark_sq_l_ : spark_sq_l option) ?custom_code:(custom_code_ : custom_code option)
    ?filter:(filter_ : filter option)
    ?fill_missing_values:(fill_missing_values_ : fill_missing_values option)
    ?select_from_collection:(select_from_collection_ : select_from_collection option)
    ?split_fields:(split_fields_ : split_fields option) ?join:(join_ : join option)
    ?spigot:(spigot_ : spigot option) ?rename_field:(rename_field_ : rename_field option)
    ?drop_fields:(drop_fields_ : drop_fields option)
    ?select_fields:(select_fields_ : select_fields option)
    ?apply_mapping:(apply_mapping_ : apply_mapping option)
    ?s3_direct_target:(s3_direct_target_ : s3_direct_target option)
    ?s3_glue_parquet_target:(s3_glue_parquet_target_ : s3_glue_parquet_target option)
    ?s3_catalog_target:(s3_catalog_target_ : s3_catalog_target option)
    ?redshift_target:(redshift_target_ : redshift_target option)
    ?catalog_target:(catalog_target_ : basic_catalog_target option)
    ?spark_connector_target:(spark_connector_target_ : spark_connector_target option)
    ?jdbc_connector_target:(jdbc_connector_target_ : jdbc_connector_target option)
    ?dynamo_db_catalog_source:(dynamo_db_catalog_source_ : dynamo_db_catalog_source option)
    ?relational_catalog_source:(relational_catalog_source_ : relational_catalog_source option)
    ?s3_parquet_source:(s3_parquet_source_ : s3_parquet_source option)
    ?s3_json_source:(s3_json_source_ : s3_json_source option)
    ?s3_csv_source:(s3_csv_source_ : s3_csv_source option)
    ?s3_catalog_source:(s3_catalog_source_ : s3_catalog_source option)
    ?redshift_source:(redshift_source_ : redshift_source option)
    ?catalog_source:(catalog_source_ : catalog_source option)
    ?spark_connector_source:(spark_connector_source_ : spark_connector_source option)
    ?jdbc_connector_source:(jdbc_connector_source_ : jdbc_connector_source option)
    ?athena_connector_source:(athena_connector_source_ : athena_connector_source option) () =
  ({
     dynamo_dbelt_connector_source = dynamo_dbelt_connector_source_;
     s3_hyper_direct_target = s3_hyper_direct_target_;
     s3_excel_source = s3_excel_source_;
     s3_iceberg_direct_target = s3_iceberg_direct_target_;
     s3_iceberg_catalog_target = s3_iceberg_catalog_target_;
     catalog_iceberg_source = catalog_iceberg_source_;
     s3_catalog_iceberg_source = s3_catalog_iceberg_source_;
     connector_data_target = connector_data_target_;
     connector_data_source = connector_data_source_;
     snowflake_target = snowflake_target_;
     snowflake_source = snowflake_source_;
     recipe = recipe_;
     evaluate_data_quality_multi_frame = evaluate_data_quality_multi_frame_;
     amazon_redshift_target = amazon_redshift_target_;
     amazon_redshift_source = amazon_redshift_source_;
     s3_delta_direct_target = s3_delta_direct_target_;
     s3_delta_catalog_target = s3_delta_catalog_target_;
     s3_delta_source = s3_delta_source_;
     catalog_delta_source = catalog_delta_source_;
     s3_catalog_delta_source = s3_catalog_delta_source_;
     direct_jdbc_source = direct_jdbc_source_;
     s3_hudi_direct_target = s3_hudi_direct_target_;
     s3_hudi_catalog_target = s3_hudi_catalog_target_;
     s3_hudi_source = s3_hudi_source_;
     catalog_hudi_source = catalog_hudi_source_;
     s3_catalog_hudi_source = s3_catalog_hudi_source_;
     evaluate_data_quality = evaluate_data_quality_;
     dynamic_transform = dynamic_transform_;
     route = route_;
     postgre_sql_catalog_target = postgre_sql_catalog_target_;
     oracle_sql_catalog_target = oracle_sql_catalog_target_;
     my_sql_catalog_target = my_sql_catalog_target_;
     microsoft_sql_server_catalog_target = microsoft_sql_server_catalog_target_;
     postgre_sql_catalog_source = postgre_sql_catalog_source_;
     oracle_sql_catalog_source = oracle_sql_catalog_source_;
     my_sql_catalog_source = my_sql_catalog_source_;
     microsoft_sql_server_catalog_source = microsoft_sql_server_catalog_source_;
     governed_catalog_source = governed_catalog_source_;
     governed_catalog_target = governed_catalog_target_;
     drop_duplicates = drop_duplicates_;
     aggregate = aggregate_;
     pii_detection = pii_detection_;
     union = union_;
     merge = merge_;
     drop_null_fields = drop_null_fields_;
     catalog_kafka_source = catalog_kafka_source_;
     catalog_kinesis_source = catalog_kinesis_source_;
     direct_kafka_source = direct_kafka_source_;
     direct_kinesis_source = direct_kinesis_source_;
     spark_sq_l = spark_sq_l_;
     custom_code = custom_code_;
     filter = filter_;
     fill_missing_values = fill_missing_values_;
     select_from_collection = select_from_collection_;
     split_fields = split_fields_;
     join = join_;
     spigot = spigot_;
     rename_field = rename_field_;
     drop_fields = drop_fields_;
     select_fields = select_fields_;
     apply_mapping = apply_mapping_;
     s3_direct_target = s3_direct_target_;
     s3_glue_parquet_target = s3_glue_parquet_target_;
     s3_catalog_target = s3_catalog_target_;
     redshift_target = redshift_target_;
     catalog_target = catalog_target_;
     spark_connector_target = spark_connector_target_;
     jdbc_connector_target = jdbc_connector_target_;
     dynamo_db_catalog_source = dynamo_db_catalog_source_;
     relational_catalog_source = relational_catalog_source_;
     s3_parquet_source = s3_parquet_source_;
     s3_json_source = s3_json_source_;
     s3_csv_source = s3_csv_source_;
     s3_catalog_source = s3_catalog_source_;
     redshift_source = redshift_source_;
     catalog_source = catalog_source_;
     spark_connector_source = spark_connector_source_;
     jdbc_connector_source = jdbc_connector_source_;
     athena_connector_source = athena_connector_source_;
   }
    : code_gen_configuration_node)

let make_source_control_details ?auth_token:(auth_token_ : generic512_char_string option)
    ?auth_strategy:(auth_strategy_ : source_control_auth_strategy option)
    ?last_commit_id:(last_commit_id_ : generic512_char_string option)
    ?folder:(folder_ : generic512_char_string option)
    ?branch:(branch_ : generic512_char_string option)
    ?owner:(owner_ : generic512_char_string option)
    ?repository:(repository_ : generic512_char_string option)
    ?provider:(provider_ : source_control_provider option) () =
  ({
     auth_token = auth_token_;
     auth_strategy = auth_strategy_;
     last_commit_id = last_commit_id_;
     folder = folder_;
     branch = branch_;
     owner = owner_;
     repository = repository_;
     provider = provider_;
   }
    : source_control_details)

let make_job_update ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?source_control_details:(source_control_details_ : source_control_details option)
    ?execution_class:(execution_class_ : execution_class option)
    ?code_gen_configuration_nodes:
      (code_gen_configuration_nodes_ : code_gen_configuration_nodes option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?max_capacity:(max_capacity_ : nullable_double option) ?timeout:(timeout_ : timeout option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?max_retries:(max_retries_ : max_retries option)
    ?connections:(connections_ : connections_list option)
    ?non_overridable_arguments:(non_overridable_arguments_ : generic_map option)
    ?default_arguments:(default_arguments_ : generic_map option)
    ?command:(command_ : job_command option)
    ?execution_property:(execution_property_ : execution_property option)
    ?role:(role_ : role_string option) ?log_uri:(log_uri_ : uri_string option)
    ?description:(description_ : description_string option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?job_mode:(job_mode_ : job_mode option) () =
  ({
     maintenance_window = maintenance_window_;
     source_control_details = source_control_details_;
     execution_class = execution_class_;
     code_gen_configuration_nodes = code_gen_configuration_nodes_;
     glue_version = glue_version_;
     notification_property = notification_property_;
     security_configuration = security_configuration_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     max_capacity = max_capacity_;
     timeout = timeout_;
     allocated_capacity = allocated_capacity_;
     max_retries = max_retries_;
     connections = connections_;
     non_overridable_arguments = non_overridable_arguments_;
     default_arguments = default_arguments_;
     command = command_;
     execution_property = execution_property_;
     role = role_;
     log_uri = log_uri_;
     description = description_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     job_mode = job_mode_;
   }
    : job_update)

let make_update_job_request ~job_update:(job_update_ : job_update)
    ~job_name:(job_name_ : name_string) () =
  ({ job_update = job_update_; job_name = job_name_ } : update_job_request)

let make_update_job_from_source_control_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : update_job_from_source_control_response)

let make_update_job_from_source_control_request ?auth_token:(auth_token_ : auth_token_string option)
    ?auth_strategy:(auth_strategy_ : source_control_auth_strategy option)
    ?commit_id:(commit_id_ : commit_id_string option) ?folder:(folder_ : name_string option)
    ?branch_name:(branch_name_ : name_string option)
    ?repository_owner:(repository_owner_ : name_string option)
    ?repository_name:(repository_name_ : name_string option)
    ?provider:(provider_ : source_control_provider option)
    ?job_name:(job_name_ : name_string option) () =
  ({
     auth_token = auth_token_;
     auth_strategy = auth_strategy_;
     commit_id = commit_id_;
     folder = folder_;
     branch_name = branch_name_;
     repository_owner = repository_owner_;
     repository_name = repository_name_;
     provider = provider_;
     job_name = job_name_;
   }
    : update_job_from_source_control_request)

let make_update_integration_table_properties_response () = (() : unit)

let make_source_table_config ?record_update_field:(record_update_field_ : string128 option)
    ?primary_key:(primary_key_ : primary_key_list option)
    ?filter_predicate:(filter_predicate_ : string128 option)
    ?fields:(fields_ : source_table_fields_list option) () =
  ({
     record_update_field = record_update_field_;
     primary_key = primary_key_;
     filter_predicate = filter_predicate_;
     fields = fields_;
   }
    : source_table_config)

let make_integration_partition ?conversion_spec:(conversion_spec_ : string128 option)
    ?function_spec:(function_spec_ : string128 option) ?field_name:(field_name_ : string128 option)
    () =
  ({ conversion_spec = conversion_spec_; function_spec = function_spec_; field_name = field_name_ }
    : integration_partition)

let make_target_table_config ?target_table_name:(target_table_name_ : string128 option)
    ?partition_spec:(partition_spec_ : integration_partition_spec_list option)
    ?unnest_spec:(unnest_spec_ : unnest_spec option) () =
  ({
     target_table_name = target_table_name_;
     partition_spec = partition_spec_;
     unnest_spec = unnest_spec_;
   }
    : target_table_config)

let make_update_integration_table_properties_request
    ?target_table_config:(target_table_config_ : target_table_config option)
    ?source_table_config:(source_table_config_ : source_table_config option)
    ~table_name:(table_name_ : string128) ~resource_arn:(resource_arn_ : string512) () =
  ({
     target_table_config = target_table_config_;
     source_table_config = source_table_config_;
     table_name = table_name_;
     resource_arn = resource_arn_;
   }
    : update_integration_table_properties_request)

let make_source_processing_properties ?role_arn:(role_arn_ : string128 option) () =
  ({ role_arn = role_arn_ } : source_processing_properties)

let make_target_processing_properties ?event_bus_arn:(event_bus_arn_ : string2048 option)
    ?connection_name:(connection_name_ : string128 option) ?kms_arn:(kms_arn_ : string2048 option)
    ?role_arn:(role_arn_ : string128 option) () =
  ({
     event_bus_arn = event_bus_arn_;
     connection_name = connection_name_;
     kms_arn = kms_arn_;
     role_arn = role_arn_;
   }
    : target_processing_properties)

let make_update_integration_resource_property_response
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ?resource_arn:(resource_arn_ : string512 option) () =
  ({
     target_processing_properties = target_processing_properties_;
     source_processing_properties = source_processing_properties_;
     resource_property_arn = resource_property_arn_;
     resource_arn = resource_arn_;
   }
    : update_integration_resource_property_response)

let make_update_integration_resource_property_request
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ~resource_arn:(resource_arn_ : string512) () =
  ({
     target_processing_properties = target_processing_properties_;
     source_processing_properties = source_processing_properties_;
     resource_arn = resource_arn_;
   }
    : update_integration_resource_property_request)

let make_update_grok_classifier_request ?custom_patterns:(custom_patterns_ : custom_patterns option)
    ?grok_pattern:(grok_pattern_ : grok_pattern option)
    ?classification:(classification_ : classification option) ~name:(name_ : name_string) () =
  ({
     custom_patterns = custom_patterns_;
     grok_pattern = grok_pattern_;
     classification = classification_;
     name = name_;
   }
    : update_grok_classifier_request)

let make_update_glue_identity_center_configuration_response () = (() : unit)

let make_update_glue_identity_center_configuration_request
    ?user_background_sessions_enabled:(user_background_sessions_enabled_ : nullable_boolean option)
    ?scopes:(scopes_ : identity_center_scopes_list option) () =
  ({ user_background_sessions_enabled = user_background_sessions_enabled_; scopes = scopes_ }
    : update_glue_identity_center_configuration_request)

let make_update_glossary_term_response
    ?long_description:(long_description_ : glossary_long_description option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?name:(name_ : glossary_term_name option) ?glossary_id:(glossary_id_ : glossary_id option)
    ?id:(id_ : glossary_term_id option) () =
  ({
     long_description = long_description_;
     short_description = short_description_;
     name = name_;
     glossary_id = glossary_id_;
     id = id_;
   }
    : update_glossary_term_response)

let make_update_glossary_term_request ?client_token:(client_token_ : hash_string option)
    ?long_description:(long_description_ : glossary_long_description option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?name:(name_ : glossary_term_name option) ~identifier:(identifier_ : glossary_term_id) () =
  ({
     client_token = client_token_;
     long_description = long_description_;
     short_description = short_description_;
     name = name_;
     identifier = identifier_;
   }
    : update_glossary_term_request)

let make_update_glossary_response ?description:(description_ : metadata_description option)
    ?name:(name_ : glossary_name option) ?id:(id_ : glossary_id option) () =
  ({ description = description_; name = name_; id = id_ } : update_glossary_response)

let make_update_glossary_request ?client_token:(client_token_ : hash_string option)
    ?description:(description_ : metadata_description option) ?name:(name_ : glossary_name option)
    ~identifier:(identifier_ : glossary_id) () =
  ({
     client_token = client_token_;
     description = description_;
     name = name_;
     identifier = identifier_;
   }
    : update_glossary_request)

let make_update_dev_endpoint_response () = (() : unit)

let make_dev_endpoint_custom_libraries
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option)
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option) () =
  ({
     extra_jars_s3_path = extra_jars_s3_path_;
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
   }
    : dev_endpoint_custom_libraries)

let make_update_dev_endpoint_request ?add_arguments:(add_arguments_ : map_value option)
    ?delete_arguments:(delete_arguments_ : string_list option)
    ?update_etl_libraries:(update_etl_libraries_ : boolean_value option)
    ?custom_libraries:(custom_libraries_ : dev_endpoint_custom_libraries option)
    ?delete_public_keys:(delete_public_keys_ : public_keys_list option)
    ?add_public_keys:(add_public_keys_ : public_keys_list option)
    ?public_key:(public_key_ : generic_string option)
    ~endpoint_name:(endpoint_name_ : generic_string) () =
  ({
     add_arguments = add_arguments_;
     delete_arguments = delete_arguments_;
     update_etl_libraries = update_etl_libraries_;
     custom_libraries = custom_libraries_;
     delete_public_keys = delete_public_keys_;
     add_public_keys = add_public_keys_;
     public_key = public_key_;
     endpoint_name = endpoint_name_;
   }
    : update_dev_endpoint_request)

let make_update_database_response () = (() : unit)

let make_data_lake_principal
    ?data_lake_principal_identifier:
      (data_lake_principal_identifier_ : data_lake_principal_string option) () =
  ({ data_lake_principal_identifier = data_lake_principal_identifier_ } : data_lake_principal)

let make_principal_permissions ?permissions:(permissions_ : permission_list option)
    ?principal:(principal_ : data_lake_principal option) () =
  ({ permissions = permissions_; principal = principal_ } : principal_permissions)

let make_database_identifier ?region:(region_ : name_string option)
    ?database_name:(database_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ region = region_; database_name = database_name_; catalog_id = catalog_id_ }
    : database_identifier)

let make_federated_database ?connection_type:(connection_type_ : name_string option)
    ?connection_name:(connection_name_ : name_string option)
    ?identifier:(identifier_ : federation_identifier option) () =
  ({
     connection_type = connection_type_;
     connection_name = connection_name_;
     identifier = identifier_;
   }
    : federated_database)

let make_database_input ?federated_database:(federated_database_ : federated_database option)
    ?target_database:(target_database_ : database_identifier option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?parameters:(parameters_ : parameters_map option) ?location_uri:(location_uri_ : ur_i option)
    ?description:(description_ : description_string option) ~name:(name_ : name_string) () =
  ({
     federated_database = federated_database_;
     target_database = target_database_;
     create_table_default_permissions = create_table_default_permissions_;
     parameters = parameters_;
     location_uri = location_uri_;
     description = description_;
     name = name_;
   }
    : database_input)

let make_update_database_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_input:(database_input_ : database_input) ~name:(name_ : name_string) () =
  ({ database_input = database_input_; name = name_; catalog_id = catalog_id_ }
    : update_database_request)

let make_update_data_quality_ruleset_response
    ?ruleset:(ruleset_ : data_quality_ruleset_string option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({ ruleset = ruleset_; description = description_; name = name_ }
    : update_data_quality_ruleset_response)

let make_update_data_quality_ruleset_request
    ?ruleset:(ruleset_ : data_quality_ruleset_string option)
    ?description:(description_ : description_string option) ~name:(name_ : name_string) () =
  ({ ruleset = ruleset_; description = description_; name = name_ }
    : update_data_quality_ruleset_request)

let make_update_csv_classifier_request ?serde:(serde_ : csv_serde_option option)
    ?custom_datatypes:(custom_datatypes_ : custom_datatypes option)
    ?custom_datatype_configured:(custom_datatype_configured_ : nullable_boolean option)
    ?allow_single_column:(allow_single_column_ : nullable_boolean option)
    ?disable_value_trimming:(disable_value_trimming_ : nullable_boolean option)
    ?header:(header_ : csv_header option)
    ?contains_header:(contains_header_ : csv_header_option option)
    ?quote_symbol:(quote_symbol_ : csv_quote_symbol option)
    ?delimiter:(delimiter_ : csv_column_delimiter option) ~name:(name_ : name_string) () =
  ({
     serde = serde_;
     custom_datatypes = custom_datatypes_;
     custom_datatype_configured = custom_datatype_configured_;
     allow_single_column = allow_single_column_;
     disable_value_trimming = disable_value_trimming_;
     header = header_;
     contains_header = contains_header_;
     quote_symbol = quote_symbol_;
     delimiter = delimiter_;
     name = name_;
   }
    : update_csv_classifier_request)

let make_update_crawler_schedule_response () = (() : unit)

let make_update_crawler_schedule_request ?schedule:(schedule_ : cron_expression option)
    ~crawler_name:(crawler_name_ : name_string) () =
  ({ schedule = schedule_; crawler_name = crawler_name_ } : update_crawler_schedule_request)

let make_update_crawler_response () = (() : unit)

let make_s3_target ?dlq_event_queue_arn:(dlq_event_queue_arn_ : event_queue_arn option)
    ?event_queue_arn:(event_queue_arn_ : event_queue_arn option)
    ?sample_size:(sample_size_ : nullable_integer option)
    ?connection_name:(connection_name_ : connection_name option)
    ?exclusions:(exclusions_ : path_list option) ?path:(path_ : path option) () =
  ({
     dlq_event_queue_arn = dlq_event_queue_arn_;
     event_queue_arn = event_queue_arn_;
     sample_size = sample_size_;
     connection_name = connection_name_;
     exclusions = exclusions_;
     path = path_;
   }
    : s3_target)

let make_jdbc_target
    ?enable_additional_metadata:(enable_additional_metadata_ : enable_additional_metadata option)
    ?exclusions:(exclusions_ : path_list option) ?path:(path_ : path option)
    ?connection_name:(connection_name_ : connection_name option) () =
  ({
     enable_additional_metadata = enable_additional_metadata_;
     exclusions = exclusions_;
     path = path_;
     connection_name = connection_name_;
   }
    : jdbc_target)

let make_mongo_db_target ?scan_all:(scan_all_ : nullable_boolean option) ?path:(path_ : path option)
    ?connection_name:(connection_name_ : connection_name option) () =
  ({ scan_all = scan_all_; path = path_; connection_name = connection_name_ } : mongo_db_target)

let make_dynamo_db_target ?scan_rate:(scan_rate_ : nullable_double option)
    ?scan_all:(scan_all_ : nullable_boolean option) ?path:(path_ : path option) () =
  ({ scan_rate = scan_rate_; scan_all = scan_all_; path = path_ } : dynamo_db_target)

let make_catalog_target ?dlq_event_queue_arn:(dlq_event_queue_arn_ : event_queue_arn option)
    ?event_queue_arn:(event_queue_arn_ : event_queue_arn option)
    ?connection_name:(connection_name_ : connection_name option)
    ~tables:(tables_ : catalog_tables_list) ~database_name:(database_name_ : name_string) () =
  ({
     dlq_event_queue_arn = dlq_event_queue_arn_;
     event_queue_arn = event_queue_arn_;
     connection_name = connection_name_;
     tables = tables_;
     database_name = database_name_;
   }
    : catalog_target)

let make_delta_target
    ?create_native_delta_table:(create_native_delta_table_ : nullable_boolean option)
    ?write_manifest:(write_manifest_ : nullable_boolean option)
    ?connection_name:(connection_name_ : connection_name option)
    ?delta_tables:(delta_tables_ : path_list option) () =
  ({
     create_native_delta_table = create_native_delta_table_;
     write_manifest = write_manifest_;
     connection_name = connection_name_;
     delta_tables = delta_tables_;
   }
    : delta_target)

let make_iceberg_target
    ?maximum_traversal_depth:(maximum_traversal_depth_ : nullable_integer option)
    ?exclusions:(exclusions_ : path_list option)
    ?connection_name:(connection_name_ : connection_name option) ?paths:(paths_ : path_list option)
    () =
  ({
     maximum_traversal_depth = maximum_traversal_depth_;
     exclusions = exclusions_;
     connection_name = connection_name_;
     paths = paths_;
   }
    : iceberg_target)

let make_hudi_target ?maximum_traversal_depth:(maximum_traversal_depth_ : nullable_integer option)
    ?exclusions:(exclusions_ : path_list option)
    ?connection_name:(connection_name_ : connection_name option) ?paths:(paths_ : path_list option)
    () =
  ({
     maximum_traversal_depth = maximum_traversal_depth_;
     exclusions = exclusions_;
     connection_name = connection_name_;
     paths = paths_;
   }
    : hudi_target)

let make_crawler_targets ?hudi_targets:(hudi_targets_ : hudi_target_list option)
    ?iceberg_targets:(iceberg_targets_ : iceberg_target_list option)
    ?delta_targets:(delta_targets_ : delta_target_list option)
    ?catalog_targets:(catalog_targets_ : catalog_target_list option)
    ?dynamo_db_targets:(dynamo_db_targets_ : dynamo_db_target_list option)
    ?mongo_db_targets:(mongo_db_targets_ : mongo_db_target_list option)
    ?jdbc_targets:(jdbc_targets_ : jdbc_target_list option)
    ?s3_targets:(s3_targets_ : s3_target_list option) () =
  ({
     hudi_targets = hudi_targets_;
     iceberg_targets = iceberg_targets_;
     delta_targets = delta_targets_;
     catalog_targets = catalog_targets_;
     dynamo_db_targets = dynamo_db_targets_;
     mongo_db_targets = mongo_db_targets_;
     jdbc_targets = jdbc_targets_;
     s3_targets = s3_targets_;
   }
    : crawler_targets)

let make_schema_change_policy ?delete_behavior:(delete_behavior_ : delete_behavior option)
    ?update_behavior:(update_behavior_ : update_behavior option) () =
  ({ delete_behavior = delete_behavior_; update_behavior = update_behavior_ }
    : schema_change_policy)

let make_recrawl_policy ?recrawl_behavior:(recrawl_behavior_ : recrawl_behavior option) () =
  ({ recrawl_behavior = recrawl_behavior_ } : recrawl_policy)

let make_lineage_configuration
    ?crawler_lineage_settings:(crawler_lineage_settings_ : crawler_lineage_settings option) () =
  ({ crawler_lineage_settings = crawler_lineage_settings_ } : lineage_configuration)

let make_lake_formation_configuration ?account_id:(account_id_ : account_id option)
    ?use_lake_formation_credentials:(use_lake_formation_credentials_ : nullable_boolean option) () =
  ({ account_id = account_id_; use_lake_formation_credentials = use_lake_formation_credentials_ }
    : lake_formation_configuration)

let make_update_crawler_request
    ?crawler_security_configuration:
      (crawler_security_configuration_ : crawler_security_configuration option)
    ?configuration:(configuration_ : crawler_configuration option)
    ?lake_formation_configuration:
      (lake_formation_configuration_ : lake_formation_configuration option)
    ?lineage_configuration:(lineage_configuration_ : lineage_configuration option)
    ?recrawl_policy:(recrawl_policy_ : recrawl_policy option)
    ?schema_change_policy:(schema_change_policy_ : schema_change_policy option)
    ?table_prefix:(table_prefix_ : table_prefix option)
    ?classifiers:(classifiers_ : classifier_name_list option)
    ?schedule:(schedule_ : cron_expression option) ?targets:(targets_ : crawler_targets option)
    ?description:(description_ : description_string_removable option)
    ?database_name:(database_name_ : database_name option) ?role:(role_ : role option)
    ~name:(name_ : name_string) () =
  ({
     crawler_security_configuration = crawler_security_configuration_;
     configuration = configuration_;
     lake_formation_configuration = lake_formation_configuration_;
     lineage_configuration = lineage_configuration_;
     recrawl_policy = recrawl_policy_;
     schema_change_policy = schema_change_policy_;
     table_prefix = table_prefix_;
     classifiers = classifiers_;
     schedule = schedule_;
     targets = targets_;
     description = description_;
     database_name = database_name_;
     role = role_;
     name = name_;
   }
    : update_crawler_request)

let make_update_connection_response () = (() : unit)

let make_physical_connection_requirements
    ?availability_zone:(availability_zone_ : name_string option)
    ?security_group_id_list:(security_group_id_list_ : security_group_id_list option)
    ?subnet_id:(subnet_id_ : name_string option) () =
  ({
     availability_zone = availability_zone_;
     security_group_id_list = security_group_id_list_;
     subnet_id = subnet_id_;
   }
    : physical_connection_requirements)

let make_o_auth2_client_application
    ?aws_managed_client_application_reference:
      (aws_managed_client_application_reference_ : aws_managed_client_application_reference option)
    ?user_managed_client_application_client_id:
      (user_managed_client_application_client_id_ : user_managed_client_application_client_id option)
    () =
  ({
     aws_managed_client_application_reference = aws_managed_client_application_reference_;
     user_managed_client_application_client_id = user_managed_client_application_client_id_;
   }
    : o_auth2_client_application)

let make_authorization_code_properties ?redirect_uri:(redirect_uri_ : redirect_uri option)
    ?authorization_code:(authorization_code_ : authorization_code option) () =
  ({ redirect_uri = redirect_uri_; authorization_code = authorization_code_ }
    : authorization_code_properties)

let make_o_auth2_credentials ?jwt_token:(jwt_token_ : jwt_token option)
    ?refresh_token:(refresh_token_ : refresh_token option)
    ?access_token:(access_token_ : access_token option)
    ?user_managed_client_application_client_secret:
      (user_managed_client_application_client_secret_ :
         user_managed_client_application_client_secret option) () =
  ({
     jwt_token = jwt_token_;
     refresh_token = refresh_token_;
     access_token = access_token_;
     user_managed_client_application_client_secret = user_managed_client_application_client_secret_;
   }
    : o_auth2_credentials)

let make_o_auth2_properties_input
    ?o_auth2_credentials:(o_auth2_credentials_ : o_auth2_credentials option)
    ?authorization_code_properties:
      (authorization_code_properties_ : authorization_code_properties option)
    ?token_url_parameters_map:(token_url_parameters_map_ : token_url_parameters_map option)
    ?token_url:(token_url_ : token_url option)
    ?o_auth2_client_application:(o_auth2_client_application_ : o_auth2_client_application option)
    ?o_auth2_grant_type:(o_auth2_grant_type_ : o_auth2_grant_type option) () =
  ({
     o_auth2_credentials = o_auth2_credentials_;
     authorization_code_properties = authorization_code_properties_;
     token_url_parameters_map = token_url_parameters_map_;
     token_url = token_url_;
     o_auth2_client_application = o_auth2_client_application_;
     o_auth2_grant_type = o_auth2_grant_type_;
   }
    : o_auth2_properties_input)

let make_basic_authentication_credentials ?password:(password_ : password option)
    ?username:(username_ : username option) () =
  ({ password = password_; username = username_ } : basic_authentication_credentials)

let make_authentication_configuration_input
    ?custom_authentication_credentials:(custom_authentication_credentials_ : credential_map option)
    ?basic_authentication_credentials:
      (basic_authentication_credentials_ : basic_authentication_credentials option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?secret_arn:(secret_arn_ : secret_arn option)
    ?o_auth2_properties:(o_auth2_properties_ : o_auth2_properties_input option)
    ?authentication_type:(authentication_type_ : authentication_type option) () =
  ({
     custom_authentication_credentials = custom_authentication_credentials_;
     basic_authentication_credentials = basic_authentication_credentials_;
     kms_key_arn = kms_key_arn_;
     secret_arn = secret_arn_;
     o_auth2_properties = o_auth2_properties_;
     authentication_type = authentication_type_;
   }
    : authentication_configuration_input)

let make_connection_input
    ?validate_for_compute_environments:
      (validate_for_compute_environments_ : compute_environment_list option)
    ?validate_credentials:(validate_credentials_ : boolean_ option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration_input option)
    ?physical_connection_requirements:
      (physical_connection_requirements_ : physical_connection_requirements option)
    ?python_properties:(python_properties_ : property_map option)
    ?athena_properties:(athena_properties_ : property_map option)
    ?spark_properties:(spark_properties_ : property_map option)
    ?match_criteria:(match_criteria_ : match_criteria option)
    ?description:(description_ : description_string option)
    ~connection_properties:(connection_properties_ : connection_properties)
    ~connection_type:(connection_type_ : connection_type) ~name:(name_ : name_string) () =
  ({
     validate_for_compute_environments = validate_for_compute_environments_;
     validate_credentials = validate_credentials_;
     authentication_configuration = authentication_configuration_;
     physical_connection_requirements = physical_connection_requirements_;
     python_properties = python_properties_;
     athena_properties = athena_properties_;
     spark_properties = spark_properties_;
     connection_properties = connection_properties_;
     match_criteria = match_criteria_;
     connection_type = connection_type_;
     description = description_;
     name = name_;
   }
    : connection_input)

let make_update_connection_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~connection_input:(connection_input_ : connection_input) ~name:(name_ : name_string) () =
  ({ connection_input = connection_input_; name = name_; catalog_id = catalog_id_ }
    : update_connection_request)

let make_update_column_statistics_task_settings_response () = (() : unit)

let make_update_column_statistics_task_settings_request
    ?security_configuration:(security_configuration_ : name_string option)
    ?catalog_i_d:(catalog_i_d_ : name_string option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?schedule:(schedule_ : cron_expression option) ?role:(role_ : name_string option)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     security_configuration = security_configuration_;
     catalog_i_d = catalog_i_d_;
     sample_size = sample_size_;
     column_name_list = column_name_list_;
     schedule = schedule_;
     role = role_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : update_column_statistics_task_settings_request)

let make_boolean_column_statistics_data ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~number_of_falses:(number_of_falses_ : non_negative_long)
    ~number_of_trues:(number_of_trues_ : non_negative_long) () =
  ({
     number_of_nulls = number_of_nulls_;
     number_of_falses = number_of_falses_;
     number_of_trues = number_of_trues_;
   }
    : boolean_column_statistics_data)

let make_date_column_statistics_data ?maximum_value:(maximum_value_ : timestamp option)
    ?minimum_value:(minimum_value_ : timestamp option)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long) () =
  ({
     number_of_distinct_values = number_of_distinct_values_;
     number_of_nulls = number_of_nulls_;
     maximum_value = maximum_value_;
     minimum_value = minimum_value_;
   }
    : date_column_statistics_data)

let make_decimal_number ~scale:(scale_ : integer) ~unscaled_value:(unscaled_value_ : blob) () =
  ({ scale = scale_; unscaled_value = unscaled_value_ } : decimal_number)

let make_decimal_column_statistics_data ?maximum_value:(maximum_value_ : decimal_number option)
    ?minimum_value:(minimum_value_ : decimal_number option)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long) () =
  ({
     number_of_distinct_values = number_of_distinct_values_;
     number_of_nulls = number_of_nulls_;
     maximum_value = maximum_value_;
     minimum_value = minimum_value_;
   }
    : decimal_column_statistics_data)

let make_double_column_statistics_data ?maximum_value:(maximum_value_ : double option)
    ?minimum_value:(minimum_value_ : double option)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long) () =
  ({
     number_of_distinct_values = number_of_distinct_values_;
     number_of_nulls = number_of_nulls_;
     maximum_value = maximum_value_;
     minimum_value = minimum_value_;
   }
    : double_column_statistics_data)

let make_long_column_statistics_data ?maximum_value:(maximum_value_ : long option)
    ?minimum_value:(minimum_value_ : long option)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long) () =
  ({
     number_of_distinct_values = number_of_distinct_values_;
     number_of_nulls = number_of_nulls_;
     maximum_value = maximum_value_;
     minimum_value = minimum_value_;
   }
    : long_column_statistics_data)

let make_string_column_statistics_data
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~average_length:(average_length_ : non_negative_double)
    ~maximum_length:(maximum_length_ : non_negative_long) () =
  ({
     number_of_distinct_values = number_of_distinct_values_;
     number_of_nulls = number_of_nulls_;
     average_length = average_length_;
     maximum_length = maximum_length_;
   }
    : string_column_statistics_data)

let make_binary_column_statistics_data ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~average_length:(average_length_ : non_negative_double)
    ~maximum_length:(maximum_length_ : non_negative_long) () =
  ({
     number_of_nulls = number_of_nulls_;
     average_length = average_length_;
     maximum_length = maximum_length_;
   }
    : binary_column_statistics_data)

let make_column_statistics_data
    ?binary_column_statistics_data:
      (binary_column_statistics_data_ : binary_column_statistics_data option)
    ?string_column_statistics_data:
      (string_column_statistics_data_ : string_column_statistics_data option)
    ?long_column_statistics_data:(long_column_statistics_data_ : long_column_statistics_data option)
    ?double_column_statistics_data:
      (double_column_statistics_data_ : double_column_statistics_data option)
    ?decimal_column_statistics_data:
      (decimal_column_statistics_data_ : decimal_column_statistics_data option)
    ?date_column_statistics_data:(date_column_statistics_data_ : date_column_statistics_data option)
    ?boolean_column_statistics_data:
      (boolean_column_statistics_data_ : boolean_column_statistics_data option)
    ~type_:(type__ : column_statistics_type) () =
  ({
     binary_column_statistics_data = binary_column_statistics_data_;
     string_column_statistics_data = string_column_statistics_data_;
     long_column_statistics_data = long_column_statistics_data_;
     double_column_statistics_data = double_column_statistics_data_;
     decimal_column_statistics_data = decimal_column_statistics_data_;
     date_column_statistics_data = date_column_statistics_data_;
     boolean_column_statistics_data = boolean_column_statistics_data_;
     type_ = type__;
   }
    : column_statistics_data)

let make_column_statistics ~statistics_data:(statistics_data_ : column_statistics_data)
    ~analyzed_time:(analyzed_time_ : timestamp) ~column_type:(column_type_ : type_string)
    ~column_name:(column_name_ : name_string) () =
  ({
     statistics_data = statistics_data_;
     analyzed_time = analyzed_time_;
     column_type = column_type_;
     column_name = column_name_;
   }
    : column_statistics)

let make_column_statistics_error ?error:(error_ : error_detail option)
    ?column_statistics:(column_statistics_ : column_statistics option) () =
  ({ error = error_; column_statistics = column_statistics_ } : column_statistics_error)

let make_update_column_statistics_for_table_response
    ?errors:(errors_ : column_statistics_errors option) () =
  ({ errors = errors_ } : update_column_statistics_for_table_response)

let make_update_column_statistics_for_table_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~column_statistics_list:(column_statistics_list_ : update_column_statistics_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     column_statistics_list = column_statistics_list_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : update_column_statistics_for_table_request)

let make_update_column_statistics_for_partition_response
    ?errors:(errors_ : column_statistics_errors option) () =
  ({ errors = errors_ } : update_column_statistics_for_partition_response)

let make_update_column_statistics_for_partition_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~column_statistics_list:(column_statistics_list_ : update_column_statistics_list)
    ~partition_values:(partition_values_ : value_string_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     column_statistics_list = column_statistics_list_;
     partition_values = partition_values_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : update_column_statistics_for_partition_request)

let make_update_classifier_response () = (() : unit)

let make_update_classifier_request
    ?csv_classifier:(csv_classifier_ : update_csv_classifier_request option)
    ?json_classifier:(json_classifier_ : update_json_classifier_request option)
    ?xml_classifier:(xml_classifier_ : update_xml_classifier_request option)
    ?grok_classifier:(grok_classifier_ : update_grok_classifier_request option) () =
  ({
     csv_classifier = csv_classifier_;
     json_classifier = json_classifier_;
     xml_classifier = xml_classifier_;
     grok_classifier = grok_classifier_;
   }
    : update_classifier_request)

let make_update_catalog_response () = (() : unit)

let make_federated_catalog ?connection_type:(connection_type_ : name_string option)
    ?connection_name:(connection_name_ : name_string option)
    ?identifier:(identifier_ : federation_identifier option) () =
  ({
     connection_type = connection_type_;
     connection_name = connection_name_;
     identifier = identifier_;
   }
    : federated_catalog)

let make_target_redshift_catalog ~catalog_arn:(catalog_arn_ : resource_arn_string) () =
  ({ catalog_arn = catalog_arn_ } : target_redshift_catalog)

let make_data_lake_access_properties ?catalog_type:(catalog_type_ : name_string option)
    ?kms_key:(kms_key_ : resource_arn_string option)
    ?data_transfer_role:(data_transfer_role_ : iam_role_arn option)
    ?data_lake_access:(data_lake_access_ : boolean_ option) () =
  ({
     catalog_type = catalog_type_;
     kms_key = kms_key_;
     data_transfer_role = data_transfer_role_;
     data_lake_access = data_lake_access_;
   }
    : data_lake_access_properties)

let make_iceberg_optimization_properties
    ?orphan_file_deletion:(orphan_file_deletion_ : parameters_map option)
    ?retention:(retention_ : parameters_map option)
    ?compaction:(compaction_ : parameters_map option) ?role_arn:(role_arn_ : iam_role_arn option) ()
    =
  ({
     orphan_file_deletion = orphan_file_deletion_;
     retention = retention_;
     compaction = compaction_;
     role_arn = role_arn_;
   }
    : iceberg_optimization_properties)

let make_catalog_properties ?custom_properties:(custom_properties_ : parameters_map option)
    ?iceberg_optimization_properties:
      (iceberg_optimization_properties_ : iceberg_optimization_properties option)
    ?data_lake_access_properties:(data_lake_access_properties_ : data_lake_access_properties option)
    () =
  ({
     custom_properties = custom_properties_;
     iceberg_optimization_properties = iceberg_optimization_properties_;
     data_lake_access_properties = data_lake_access_properties_;
   }
    : catalog_properties)

let make_catalog_input
    ?overwrite_child_resource_permissions_with_default:
      (overwrite_child_resource_permissions_with_default_ :
         overwrite_child_resource_permissions_with_default_enum option)
    ?allow_full_table_external_data_access:
      (allow_full_table_external_data_access_ : allow_full_table_external_data_access_enum option)
    ?create_database_default_permissions:
      (create_database_default_permissions_ : principal_permissions_list option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?catalog_properties:(catalog_properties_ : catalog_properties option)
    ?target_redshift_catalog:(target_redshift_catalog_ : target_redshift_catalog option)
    ?parameters:(parameters_ : parameters_map option)
    ?federated_catalog:(federated_catalog_ : federated_catalog option)
    ?description:(description_ : description_string option) () =
  ({
     overwrite_child_resource_permissions_with_default =
       overwrite_child_resource_permissions_with_default_;
     allow_full_table_external_data_access = allow_full_table_external_data_access_;
     create_database_default_permissions = create_database_default_permissions_;
     create_table_default_permissions = create_table_default_permissions_;
     catalog_properties = catalog_properties_;
     target_redshift_catalog = target_redshift_catalog_;
     parameters = parameters_;
     federated_catalog = federated_catalog_;
     description = description_;
   }
    : catalog_input)

let make_update_catalog_request ~catalog_input:(catalog_input_ : catalog_input)
    ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({ catalog_input = catalog_input_; catalog_id = catalog_id_ } : update_catalog_request)

let make_update_blueprint_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : update_blueprint_response)

let make_update_blueprint_request ?description:(description_ : generic512_char_string option)
    ~blueprint_location:(blueprint_location_ : orchestration_s3_location)
    ~name:(name_ : orchestration_name_string) () =
  ({ blueprint_location = blueprint_location_; description = description_; name = name_ }
    : update_blueprint_request)

let make_update_asset_response ?updated_at:(updated_at_ : updated_at option)
    ?description:(description_ : asset_description option) ?name:(name_ : asset_name option)
    ~id:(id_ : asset_id) () =
  ({ updated_at = updated_at_; description = description_; name = name_; id = id_ }
    : update_asset_response)

let make_update_asset_request ?client_token:(client_token_ : hash_string option)
    ?description:(description_ : asset_description option) ?name:(name_ : asset_name option)
    ~identifier:(identifier_ : asset_id) () =
  ({
     client_token = client_token_;
     description = description_;
     name = name_;
     identifier = identifier_;
   }
    : update_asset_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tags_to_remove:(tags_to_remove_ : tag_keys_list)
    ~resource_arn:(resource_arn_ : glue_resource_arn) () =
  ({ tags_to_remove = tags_to_remove_; resource_arn = resource_arn_ } : untag_resource_request)

let make_partition ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?last_analyzed_time:(last_analyzed_time_ : timestamp option)
    ?parameters:(parameters_ : parameters_map option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?table_name:(table_name_ : name_string option)
    ?database_name:(database_name_ : name_string option)
    ?values:(values_ : value_string_list option) () =
  ({
     catalog_id = catalog_id_;
     last_analyzed_time = last_analyzed_time_;
     parameters = parameters_;
     storage_descriptor = storage_descriptor_;
     last_access_time = last_access_time_;
     creation_time = creation_time_;
     table_name = table_name_;
     database_name = database_name_;
     values = values_;
   }
    : partition)

let make_unfiltered_partition
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option)
    ?authorized_columns:(authorized_columns_ : name_string_list option)
    ?partition:(partition_ : partition option) () =
  ({
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
     authorized_columns = authorized_columns_;
     partition = partition_;
   }
    : unfiltered_partition)

let make_transform_sort_criteria ~sort_direction:(sort_direction_ : sort_direction_type)
    ~column:(column_ : transform_sort_column_type) () =
  ({ sort_direction = sort_direction_; column = column_ } : transform_sort_criteria)

let make_schema_column ?data_type:(data_type_ : column_type_string option)
    ?name:(name_ : column_name_string option) () =
  ({ data_type = data_type_; name = name_ } : schema_column)

let make_glue_table ?additional_options:(additional_options_ : glue_table_additional_options option)
    ?connection_name:(connection_name_ : name_string option)
    ?catalog_id:(catalog_id_ : name_string option) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     additional_options = additional_options_;
     connection_name = connection_name_;
     catalog_id = catalog_id_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : glue_table)

let make_confusion_matrix ?num_false_negatives:(num_false_negatives_ : records_count option)
    ?num_true_negatives:(num_true_negatives_ : records_count option)
    ?num_false_positives:(num_false_positives_ : records_count option)
    ?num_true_positives:(num_true_positives_ : records_count option) () =
  ({
     num_false_negatives = num_false_negatives_;
     num_true_negatives = num_true_negatives_;
     num_false_positives = num_false_positives_;
     num_true_positives = num_true_positives_;
   }
    : confusion_matrix)

let make_column_importance ?importance:(importance_ : generic_bounded_double option)
    ?column_name:(column_name_ : name_string option) () =
  ({ importance = importance_; column_name = column_name_ } : column_importance)

let make_find_matches_metrics
    ?column_importances:(column_importances_ : column_importance_list option)
    ?confusion_matrix:(confusion_matrix_ : confusion_matrix option)
    ?f1:(f1_ : generic_bounded_double option) ?recall:(recall_ : generic_bounded_double option)
    ?precision:(precision_ : generic_bounded_double option)
    ?area_under_pr_curve:(area_under_pr_curve_ : generic_bounded_double option) () =
  ({
     column_importances = column_importances_;
     confusion_matrix = confusion_matrix_;
     f1 = f1_;
     recall = recall_;
     precision = precision_;
     area_under_pr_curve = area_under_pr_curve_;
   }
    : find_matches_metrics)

let make_evaluation_metrics
    ?find_matches_metrics:(find_matches_metrics_ : find_matches_metrics option)
    ~transform_type:(transform_type_ : transform_type) () =
  ({ find_matches_metrics = find_matches_metrics_; transform_type = transform_type_ }
    : evaluation_metrics)

let make_ml_user_data_encryption ?kms_key_id:(kms_key_id_ : name_string option)
    ~ml_user_data_encryption_mode:
      (ml_user_data_encryption_mode_ : ml_user_data_encryption_mode_string) () =
  ({ kms_key_id = kms_key_id_; ml_user_data_encryption_mode = ml_user_data_encryption_mode_ }
    : ml_user_data_encryption)

let make_transform_encryption
    ?task_run_security_configuration_name:
      (task_run_security_configuration_name_ : name_string option)
    ?ml_user_data_encryption:(ml_user_data_encryption_ : ml_user_data_encryption option) () =
  ({
     task_run_security_configuration_name = task_run_security_configuration_name_;
     ml_user_data_encryption = ml_user_data_encryption_;
   }
    : transform_encryption)

let make_ml_transform ?transform_encryption:(transform_encryption_ : transform_encryption option)
    ?max_retries:(max_retries_ : nullable_integer option) ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?glue_version:(glue_version_ : glue_version_string option) ?role:(role_ : role_string option)
    ?schema:(schema_ : transform_schema option) ?label_count:(label_count_ : label_count option)
    ?evaluation_metrics:(evaluation_metrics_ : evaluation_metrics option)
    ?parameters:(parameters_ : transform_parameters option)
    ?input_record_tables:(input_record_tables_ : glue_tables option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?created_on:(created_on_ : timestamp option) ?status:(status_ : transform_status_type option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option)
    ?transform_id:(transform_id_ : hash_string option) () =
  ({
     transform_encryption = transform_encryption_;
     max_retries = max_retries_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     max_capacity = max_capacity_;
     glue_version = glue_version_;
     role = role_;
     schema = schema_;
     label_count = label_count_;
     evaluation_metrics = evaluation_metrics_;
     parameters = parameters_;
     input_record_tables = input_record_tables_;
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     status = status_;
     description = description_;
     name = name_;
     transform_id = transform_id_;
   }
    : ml_transform)

let make_transform_filter_criteria ?schema:(schema_ : transform_schema option)
    ?last_modified_after:(last_modified_after_ : timestamp option)
    ?last_modified_before:(last_modified_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?status:(status_ : transform_status_type option)
    ?transform_type:(transform_type_ : transform_type option) ?name:(name_ : name_string option) ()
    =
  ({
     schema = schema_;
     last_modified_after = last_modified_after_;
     last_modified_before = last_modified_before_;
     created_after = created_after_;
     created_before = created_before_;
     glue_version = glue_version_;
     status = status_;
     transform_type = transform_type_;
     name = name_;
   }
    : transform_filter_criteria)

let make_timestamped_inclusion_annotation ?last_modified_on:(last_modified_on_ : timestamp option)
    ?value:(value_ : inclusion_annotation_value option) () =
  ({ last_modified_on = last_modified_on_; value = value_ } : timestamped_inclusion_annotation)

let make_timestamp_filter ?recorded_after:(recorded_after_ : timestamp option)
    ?recorded_before:(recorded_before_ : timestamp option) () =
  ({ recorded_after = recorded_after_; recorded_before = recorded_before_ } : timestamp_filter)

let make_test_connection_response () = (() : unit)

let make_test_connection_input
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration_input option)
    ~connection_properties:(connection_properties_ : connection_properties)
    ~connection_type:(connection_type_ : connection_type) () =
  ({
     authentication_configuration = authentication_configuration_;
     connection_properties = connection_properties_;
     connection_type = connection_type_;
   }
    : test_connection_input)

let make_test_connection_request
    ?test_connection_input:(test_connection_input_ : test_connection_input option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?connection_name:(connection_name_ : name_string option) () =
  ({
     test_connection_input = test_connection_input_;
     catalog_id = catalog_id_;
     connection_name = connection_name_;
   }
    : test_connection_request)

let make_task_run_sort_criteria ~sort_direction:(sort_direction_ : sort_direction_type)
    ~column:(column_ : task_run_sort_column_type) () =
  ({ sort_direction = sort_direction_; column = column_ } : task_run_sort_criteria)

let make_import_labels_task_run_properties ?replace:(replace_ : replace_boolean option)
    ?input_s3_path:(input_s3_path_ : uri_string option) () =
  ({ replace = replace_; input_s3_path = input_s3_path_ } : import_labels_task_run_properties)

let make_export_labels_task_run_properties ?output_s3_path:(output_s3_path_ : uri_string option) ()
    =
  ({ output_s3_path = output_s3_path_ } : export_labels_task_run_properties)

let make_labeling_set_generation_task_run_properties
    ?output_s3_path:(output_s3_path_ : uri_string option) () =
  ({ output_s3_path = output_s3_path_ } : labeling_set_generation_task_run_properties)

let make_find_matches_task_run_properties ?job_run_id:(job_run_id_ : hash_string option)
    ?job_name:(job_name_ : name_string option) ?job_id:(job_id_ : hash_string option) () =
  ({ job_run_id = job_run_id_; job_name = job_name_; job_id = job_id_ }
    : find_matches_task_run_properties)

let make_task_run_properties
    ?find_matches_task_run_properties:
      (find_matches_task_run_properties_ : find_matches_task_run_properties option)
    ?labeling_set_generation_task_run_properties:
      (labeling_set_generation_task_run_properties_ :
         labeling_set_generation_task_run_properties option)
    ?export_labels_task_run_properties:
      (export_labels_task_run_properties_ : export_labels_task_run_properties option)
    ?import_labels_task_run_properties:
      (import_labels_task_run_properties_ : import_labels_task_run_properties option)
    ?task_type:(task_type_ : task_type option) () =
  ({
     find_matches_task_run_properties = find_matches_task_run_properties_;
     labeling_set_generation_task_run_properties = labeling_set_generation_task_run_properties_;
     export_labels_task_run_properties = export_labels_task_run_properties_;
     import_labels_task_run_properties = import_labels_task_run_properties_;
     task_type = task_type_;
   }
    : task_run_properties)

let make_task_run ?execution_time:(execution_time_ : execution_time option)
    ?completed_on:(completed_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?started_on:(started_on_ : timestamp option)
    ?error_string:(error_string_ : generic_string option)
    ?properties:(properties_ : task_run_properties option)
    ?log_group_name:(log_group_name_ : generic_string option)
    ?status:(status_ : task_status_type option) ?task_run_id:(task_run_id_ : hash_string option)
    ?transform_id:(transform_id_ : hash_string option) () =
  ({
     execution_time = execution_time_;
     completed_on = completed_on_;
     last_modified_on = last_modified_on_;
     started_on = started_on_;
     error_string = error_string_;
     properties = properties_;
     log_group_name = log_group_name_;
     status = status_;
     task_run_id = task_run_id_;
     transform_id = transform_id_;
   }
    : task_run)

let make_task_run_filter_criteria ?started_after:(started_after_ : timestamp option)
    ?started_before:(started_before_ : timestamp option) ?status:(status_ : task_status_type option)
    ?task_run_type:(task_run_type_ : task_type option) () =
  ({
     started_after = started_after_;
     started_before = started_before_;
     status = status_;
     task_run_type = task_run_type_;
   }
    : task_run_filter_criteria)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags_to_add:(tags_to_add_ : tags_map)
    ~resource_arn:(resource_arn_ : glue_resource_arn) () =
  ({ tags_to_add = tags_to_add_; resource_arn = resource_arn_ } : tag_resource_request)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_table_version_error ?error_detail:(error_detail_ : error_detail option)
    ?version_id:(version_id_ : version_string option) ?table_name:(table_name_ : name_string option)
    () =
  ({ error_detail = error_detail_; version_id = version_id_; table_name = table_name_ }
    : table_version_error)

let make_federated_table ?connection_type:(connection_type_ : name_string option)
    ?connection_name:(connection_name_ : name_string option)
    ?database_identifier:(database_identifier_ : federation_identifier option)
    ?identifier:(identifier_ : federation_identifier option) () =
  ({
     connection_type = connection_type_;
     connection_name = connection_name_;
     database_identifier = database_identifier_;
     identifier = identifier_;
   }
    : federated_table)

let make_iceberg_table_metadata ?default_sort_order_id:(default_sort_order_id_ : integer option)
    ?sort_orders:(sort_orders_ : iceberg_sort_order_list option)
    ?last_partition_id:(last_partition_id_ : integer option)
    ?default_spec_id:(default_spec_id_ : integer option)
    ?partition_specs:(partition_specs_ : iceberg_partition_spec_list option)
    ?last_column_id:(last_column_id_ : integer option)
    ?current_schema_id:(current_schema_id_ : integer option)
    ?schemas:(schemas_ : iceberg_schema_list option)
    ?properties:(properties_ : string_to_string_map option)
    ?location:(location_ : location_string option)
    ?table_uuid:(table_uuid_ : table_id_string option)
    ?format_version:(format_version_ : version_string option) () =
  ({
     default_sort_order_id = default_sort_order_id_;
     sort_orders = sort_orders_;
     last_partition_id = last_partition_id_;
     default_spec_id = default_spec_id_;
     partition_specs = partition_specs_;
     last_column_id = last_column_id_;
     current_schema_id = current_schema_id_;
     schemas = schemas_;
     properties = properties_;
     location = location_;
     table_uuid = table_uuid_;
     format_version = format_version_;
   }
    : iceberg_table_metadata)

let make_status_details ?view_validations:(view_validations_ : view_validation_list option)
    ?requested_change:(requested_change_ : table option) () =
  ({ view_validations = view_validations_; requested_change = requested_change_ } : status_details)

let make_table ?status:(status_ : table_status option)
    ?iceberg_table_metadata:(iceberg_table_metadata_ : iceberg_table_metadata option)
    ?is_materialized_view:(is_materialized_view_ : nullable_boolean option)
    ?is_multi_dialect_view:(is_multi_dialect_view_ : nullable_boolean option)
    ?view_definition:(view_definition_ : view_definition option)
    ?federated_table:(federated_table_ : federated_table option)
    ?version_id:(version_id_ : version_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?target_table:(target_table_ : table_identifier option)
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option)
    ?created_by:(created_by_ : name_string option) ?parameters:(parameters_ : parameters_map option)
    ?table_type:(table_type_ : table_type_string option)
    ?view_expanded_text:(view_expanded_text_ : view_text_string option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?partition_keys:(partition_keys_ : column_list option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?retention:(retention_ : non_negative_integer option)
    ?last_analyzed_time:(last_analyzed_time_ : timestamp option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?update_time:(update_time_ : timestamp option) ?create_time:(create_time_ : timestamp option)
    ?owner:(owner_ : name_string option) ?description:(description_ : description_string option)
    ?database_name:(database_name_ : name_string option) ~name:(name_ : name_string) () =
  ({
     status = status_;
     iceberg_table_metadata = iceberg_table_metadata_;
     is_materialized_view = is_materialized_view_;
     is_multi_dialect_view = is_multi_dialect_view_;
     view_definition = view_definition_;
     federated_table = federated_table_;
     version_id = version_id_;
     catalog_id = catalog_id_;
     target_table = target_table_;
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
     created_by = created_by_;
     parameters = parameters_;
     table_type = table_type_;
     view_expanded_text = view_expanded_text_;
     view_original_text = view_original_text_;
     partition_keys = partition_keys_;
     storage_descriptor = storage_descriptor_;
     retention = retention_;
     last_analyzed_time = last_analyzed_time_;
     last_access_time = last_access_time_;
     update_time = update_time_;
     create_time = create_time_;
     owner = owner_;
     description = description_;
     database_name = database_name_;
     name = name_;
   }
    : table)

let make_table_status ?details:(details_ : status_details option)
    ?error:(error_ : error_detail option) ?state:(state_ : resource_state option)
    ?action:(action_ : resource_action option) ?update_time:(update_time_ : timestamp option)
    ?request_time:(request_time_ : timestamp option) ?updated_by:(updated_by_ : name_string option)
    ?requested_by:(requested_by_ : name_string option) () =
  ({
     details = details_;
     error = error_;
     state = state_;
     action = action_;
     update_time = update_time_;
     request_time = request_time_;
     updated_by = updated_by_;
     requested_by = requested_by_;
   }
    : table_status)

let make_table_version ?version_id:(version_id_ : version_string option)
    ?table:(table_ : table option) () =
  ({ version_id = version_id_; table = table_ } : table_version)

let make_run_metrics ?job_duration_in_hour:(job_duration_in_hour_ : message_string option)
    ?number_of_dpus:(number_of_dpus_ : message_string option)
    ?number_of_files_compacted:(number_of_files_compacted_ : message_string option)
    ?number_of_bytes_compacted:(number_of_bytes_compacted_ : message_string option) () =
  ({
     job_duration_in_hour = job_duration_in_hour_;
     number_of_dpus = number_of_dpus_;
     number_of_files_compacted = number_of_files_compacted_;
     number_of_bytes_compacted = number_of_bytes_compacted_;
   }
    : run_metrics)

let make_iceberg_compaction_metrics
    ?job_duration_in_hour:(job_duration_in_hour_ : dpu_duration_in_hour option)
    ?number_of_dpus:(number_of_dpus_ : dpu_counts option) ?dpu_hours:(dpu_hours_ : dpu_hours option)
    ?number_of_files_compacted:(number_of_files_compacted_ : metric_counts option)
    ?number_of_bytes_compacted:(number_of_bytes_compacted_ : metric_counts option) () =
  ({
     job_duration_in_hour = job_duration_in_hour_;
     number_of_dpus = number_of_dpus_;
     dpu_hours = dpu_hours_;
     number_of_files_compacted = number_of_files_compacted_;
     number_of_bytes_compacted = number_of_bytes_compacted_;
   }
    : iceberg_compaction_metrics)

let make_compaction_metrics ?iceberg_metrics:(iceberg_metrics_ : iceberg_compaction_metrics option)
    () =
  ({ iceberg_metrics = iceberg_metrics_ } : compaction_metrics)

let make_iceberg_retention_metrics
    ?job_duration_in_hour:(job_duration_in_hour_ : dpu_duration_in_hour option)
    ?number_of_dpus:(number_of_dpus_ : dpu_counts option) ?dpu_hours:(dpu_hours_ : dpu_hours option)
    ?number_of_manifest_lists_deleted:(number_of_manifest_lists_deleted_ : metric_counts option)
    ?number_of_manifest_files_deleted:(number_of_manifest_files_deleted_ : metric_counts option)
    ?number_of_data_files_deleted:(number_of_data_files_deleted_ : metric_counts option) () =
  ({
     job_duration_in_hour = job_duration_in_hour_;
     number_of_dpus = number_of_dpus_;
     dpu_hours = dpu_hours_;
     number_of_manifest_lists_deleted = number_of_manifest_lists_deleted_;
     number_of_manifest_files_deleted = number_of_manifest_files_deleted_;
     number_of_data_files_deleted = number_of_data_files_deleted_;
   }
    : iceberg_retention_metrics)

let make_retention_metrics ?iceberg_metrics:(iceberg_metrics_ : iceberg_retention_metrics option) ()
    =
  ({ iceberg_metrics = iceberg_metrics_ } : retention_metrics)

let make_iceberg_orphan_file_deletion_metrics
    ?job_duration_in_hour:(job_duration_in_hour_ : dpu_duration_in_hour option)
    ?number_of_dpus:(number_of_dpus_ : dpu_counts option) ?dpu_hours:(dpu_hours_ : dpu_hours option)
    ?number_of_orphan_files_deleted:(number_of_orphan_files_deleted_ : metric_counts option) () =
  ({
     job_duration_in_hour = job_duration_in_hour_;
     number_of_dpus = number_of_dpus_;
     dpu_hours = dpu_hours_;
     number_of_orphan_files_deleted = number_of_orphan_files_deleted_;
   }
    : iceberg_orphan_file_deletion_metrics)

let make_orphan_file_deletion_metrics
    ?iceberg_metrics:(iceberg_metrics_ : iceberg_orphan_file_deletion_metrics option) () =
  ({ iceberg_metrics = iceberg_metrics_ } : orphan_file_deletion_metrics)

let make_table_optimizer_run
    ?orphan_file_deletion_metrics:
      (orphan_file_deletion_metrics_ : orphan_file_deletion_metrics option)
    ?retention_metrics:(retention_metrics_ : retention_metrics option)
    ?compaction_strategy:(compaction_strategy_ : compaction_strategy option)
    ?compaction_metrics:(compaction_metrics_ : compaction_metrics option)
    ?error:(error_ : message_string option) ?metrics:(metrics_ : run_metrics option)
    ?end_timestamp:(end_timestamp_ : table_optimizer_run_timestamp option)
    ?start_timestamp:(start_timestamp_ : table_optimizer_run_timestamp option)
    ?event_type:(event_type_ : table_optimizer_event_type option) () =
  ({
     orphan_file_deletion_metrics = orphan_file_deletion_metrics_;
     retention_metrics = retention_metrics_;
     compaction_strategy = compaction_strategy_;
     compaction_metrics = compaction_metrics_;
     error = error_;
     metrics = metrics_;
     end_timestamp = end_timestamp_;
     start_timestamp = start_timestamp_;
     event_type = event_type_;
   }
    : table_optimizer_run)

let make_table_optimizer ?configuration_source:(configuration_source_ : configuration_source option)
    ?last_run:(last_run_ : table_optimizer_run option)
    ?configuration:(configuration_ : table_optimizer_configuration option)
    ?type_:(type__ : table_optimizer_type option) () =
  ({
     configuration_source = configuration_source_;
     last_run = last_run_;
     configuration = configuration_;
     type_ = type__;
   }
    : table_optimizer)

let make_table_error ?error_detail:(error_detail_ : error_detail option)
    ?table_name:(table_name_ : name_string option) () =
  ({ error_detail = error_detail_; table_name = table_name_ } : table_error)

let make_supported_dialect ?dialect_version:(dialect_version_ : view_dialect_version_string option)
    ?dialect:(dialect_ : view_dialect option) () =
  ({ dialect_version = dialect_version_; dialect = dialect_ } : supported_dialect)

let make_stop_workflow_run_response () = (() : unit)

let make_stop_workflow_run_request ~run_id:(run_id_ : id_string) ~name:(name_ : name_string) () =
  ({ run_id = run_id_; name = name_ } : stop_workflow_run_request)

let make_stop_trigger_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : stop_trigger_response)

let make_stop_trigger_request ~name:(name_ : name_string) () =
  ({ name = name_ } : stop_trigger_request)

let make_stop_session_response ?id:(id_ : name_string option) () =
  ({ id = id_ } : stop_session_response)

let make_stop_session_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~id:(id_ : name_string) () =
  ({ request_origin = request_origin_; id = id_ } : stop_session_request)

let make_stop_materialized_view_refresh_task_run_response () = (() : unit)

let make_stop_materialized_view_refresh_task_run_request ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) ~catalog_id:(catalog_id_ : name_string) () =
  ({ table_name = table_name_; database_name = database_name_; catalog_id = catalog_id_ }
    : stop_materialized_view_refresh_task_run_request)

let make_stop_crawler_schedule_response () = (() : unit)

let make_stop_crawler_schedule_request ~crawler_name:(crawler_name_ : name_string) () =
  ({ crawler_name = crawler_name_ } : stop_crawler_schedule_request)

let make_stop_crawler_response () = (() : unit)

let make_stop_crawler_request ~name:(name_ : name_string) () =
  ({ name = name_ } : stop_crawler_request)

let make_stop_column_statistics_task_run_schedule_response () = (() : unit)

let make_stop_column_statistics_task_run_schedule_request ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({ table_name = table_name_; database_name = database_name_ }
    : stop_column_statistics_task_run_schedule_request)

let make_stop_column_statistics_task_run_response () = (() : unit)

let make_stop_column_statistics_task_run_request ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : database_name) () =
  ({ table_name = table_name_; database_name = database_name_ }
    : stop_column_statistics_task_run_request)

let make_run_identifier ?job_run_id:(job_run_id_ : hash_string option)
    ?run_id:(run_id_ : hash_string option) () =
  ({ job_run_id = job_run_id_; run_id = run_id_ } : run_identifier)

let make_statistic_summary
    ?inclusion_annotation:(inclusion_annotation_ : timestamped_inclusion_annotation option)
    ?recorded_on:(recorded_on_ : timestamp option)
    ?statistic_properties:(statistic_properties_ : statistic_properties_map option)
    ?referenced_datasets:(referenced_datasets_ : reference_datasets_list option)
    ?columns_referenced:(columns_referenced_ : column_name_list option)
    ?evaluation_level:(evaluation_level_ : statistic_evaluation_level option)
    ?double_value:(double_value_ : double option)
    ?statistic_name:(statistic_name_ : statistic_name_string option)
    ?run_identifier:(run_identifier_ : run_identifier option)
    ?profile_id:(profile_id_ : hash_string option)
    ?statistic_id:(statistic_id_ : hash_string option) () =
  ({
     inclusion_annotation = inclusion_annotation_;
     recorded_on = recorded_on_;
     statistic_properties = statistic_properties_;
     referenced_datasets = referenced_datasets_;
     columns_referenced = columns_referenced_;
     evaluation_level = evaluation_level_;
     double_value = double_value_;
     statistic_name = statistic_name_;
     run_identifier = run_identifier_;
     profile_id = profile_id_;
     statistic_id = statistic_id_;
   }
    : statistic_summary)

let make_statistic_annotation
    ?inclusion_annotation:(inclusion_annotation_ : timestamped_inclusion_annotation option)
    ?statistic_recorded_on:(statistic_recorded_on_ : timestamp option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?profile_id:(profile_id_ : hash_string option) () =
  ({
     inclusion_annotation = inclusion_annotation_;
     statistic_recorded_on = statistic_recorded_on_;
     statistic_id = statistic_id_;
     profile_id = profile_id_;
   }
    : statistic_annotation)

let make_statement_output_data ?text_plain:(text_plain_ : generic_string option) () =
  ({ text_plain = text_plain_ } : statement_output_data)

let make_statement_output ?traceback:(traceback_ : orchestration_string_list option)
    ?error_value:(error_value_ : generic_string option)
    ?error_name:(error_name_ : generic_string option) ?status:(status_ : statement_state option)
    ?execution_count:(execution_count_ : integer_value option)
    ?data:(data_ : statement_output_data option) () =
  ({
     traceback = traceback_;
     error_value = error_value_;
     error_name = error_name_;
     status = status_;
     execution_count = execution_count_;
     data = data_;
   }
    : statement_output)

let make_statement ?completed_on:(completed_on_ : long_value option)
    ?started_on:(started_on_ : long_value option) ?progress:(progress_ : double_value option)
    ?output:(output_ : statement_output option) ?state:(state_ : statement_state option)
    ?code:(code_ : generic_string option) ?id:(id_ : integer_value option) () =
  ({
     completed_on = completed_on_;
     started_on = started_on_;
     progress = progress_;
     output = output_;
     state = state_;
     code = code_;
     id = id_;
   }
    : statement)

let make_start_workflow_run_response ?run_id:(run_id_ : id_string option) () =
  ({ run_id = run_id_ } : start_workflow_run_response)

let make_start_workflow_run_request
    ?run_properties:(run_properties_ : workflow_run_properties option) ~name:(name_ : name_string)
    () =
  ({ run_properties = run_properties_; name = name_ } : start_workflow_run_request)

let make_start_trigger_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : start_trigger_response)

let make_start_trigger_request ~name:(name_ : name_string) () =
  ({ name = name_ } : start_trigger_request)

let make_start_materialized_view_refresh_task_run_response
    ?materialized_view_refresh_task_run_id:(materialized_view_refresh_task_run_id_ : uui_dv4 option)
    () =
  ({ materialized_view_refresh_task_run_id = materialized_view_refresh_task_run_id_ }
    : start_materialized_view_refresh_task_run_response)

let make_start_materialized_view_refresh_task_run_request
    ?full_refresh:(full_refresh_ : nullable_boolean option) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) ~catalog_id:(catalog_id_ : name_string) () =
  ({
     full_refresh = full_refresh_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : start_materialized_view_refresh_task_run_request)

let make_start_ml_labeling_set_generation_task_run_response
    ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_ml_labeling_set_generation_task_run_response)

let make_start_ml_labeling_set_generation_task_run_request
    ~output_s3_path:(output_s3_path_ : uri_string) ~transform_id:(transform_id_ : hash_string) () =
  ({ output_s3_path = output_s3_path_; transform_id = transform_id_ }
    : start_ml_labeling_set_generation_task_run_request)

let make_start_ml_evaluation_task_run_response ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_ml_evaluation_task_run_response)

let make_start_ml_evaluation_task_run_request ~transform_id:(transform_id_ : hash_string) () =
  ({ transform_id = transform_id_ } : start_ml_evaluation_task_run_request)

let make_start_job_run_response ?job_run_id:(job_run_id_ : id_string option) () =
  ({ job_run_id = job_run_id_ } : start_job_run_response)

let make_start_job_run_request
    ?execution_role_session_policy:
      (execution_role_session_policy_ : orchestration_policy_json_string option)
    ?execution_class:(execution_class_ : execution_class option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?notification_property:(notification_property_ : notification_property option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?max_capacity:(max_capacity_ : nullable_double option) ?timeout:(timeout_ : timeout option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?arguments:(arguments_ : generic_map option) ?job_run_id:(job_run_id_ : id_string option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ~job_name:(job_name_ : name_string) () =
  ({
     execution_role_session_policy = execution_role_session_policy_;
     execution_class = execution_class_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     notification_property = notification_property_;
     security_configuration = security_configuration_;
     max_capacity = max_capacity_;
     timeout = timeout_;
     allocated_capacity = allocated_capacity_;
     arguments = arguments_;
     job_run_id = job_run_id_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     job_name = job_name_;
   }
    : start_job_run_request)

let make_start_import_labels_task_run_response ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_import_labels_task_run_response)

let make_start_import_labels_task_run_request
    ?replace_all_labels:(replace_all_labels_ : replace_boolean option)
    ~input_s3_path:(input_s3_path_ : uri_string) ~transform_id:(transform_id_ : hash_string) () =
  ({
     replace_all_labels = replace_all_labels_;
     input_s3_path = input_s3_path_;
     transform_id = transform_id_;
   }
    : start_import_labels_task_run_request)

let make_start_export_labels_task_run_response ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_export_labels_task_run_response)

let make_start_export_labels_task_run_request ~output_s3_path:(output_s3_path_ : uri_string)
    ~transform_id:(transform_id_ : hash_string) () =
  ({ output_s3_path = output_s3_path_; transform_id = transform_id_ }
    : start_export_labels_task_run_request)

let make_start_data_quality_ruleset_evaluation_run_response ?run_id:(run_id_ : hash_string option)
    () =
  ({ run_id = run_id_ } : start_data_quality_ruleset_evaluation_run_response)

let make_data_quality_glue_table
    ?pre_processing_query:(pre_processing_query_ : pre_processing_query_string option)
    ?additional_options:(additional_options_ : glue_table_additional_options option)
    ?connection_name:(connection_name_ : name_string option)
    ?catalog_id:(catalog_id_ : name_string option) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     pre_processing_query = pre_processing_query_;
     additional_options = additional_options_;
     connection_name = connection_name_;
     catalog_id = catalog_id_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : data_quality_glue_table)

let make_data_source
    ?data_quality_glue_table:(data_quality_glue_table_ : data_quality_glue_table option)
    ?glue_table:(glue_table_ : glue_table option) () =
  ({ data_quality_glue_table = data_quality_glue_table_; glue_table = glue_table_ } : data_source)

let make_data_quality_evaluation_run_additional_run_options
    ?custom_log_group_prefix:(custom_log_group_prefix_ : generic_string option)
    ?composite_rule_evaluation_method:
      (composite_rule_evaluation_method_ : dq_composite_rule_evaluation_method option)
    ?results_s3_prefix:(results_s3_prefix_ : uri_string option)
    ?cloud_watch_metrics_enabled:(cloud_watch_metrics_enabled_ : nullable_boolean option) () =
  ({
     custom_log_group_prefix = custom_log_group_prefix_;
     composite_rule_evaluation_method = composite_rule_evaluation_method_;
     results_s3_prefix = results_s3_prefix_;
     cloud_watch_metrics_enabled = cloud_watch_metrics_enabled_;
   }
    : data_quality_evaluation_run_additional_run_options)

let make_start_data_quality_ruleset_evaluation_run_request
    ?additional_data_sources:(additional_data_sources_ : data_source_map option)
    ?additional_run_options:
      (additional_run_options_ : data_quality_evaluation_run_additional_run_options option)
    ?client_token:(client_token_ : hash_string option) ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ~ruleset_names:(ruleset_names_ : ruleset_names) ~role:(role_ : role_string)
    ~data_source:(data_source_ : data_source) () =
  ({
     additional_data_sources = additional_data_sources_;
     ruleset_names = ruleset_names_;
     additional_run_options = additional_run_options_;
     client_token = client_token_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     role = role_;
     data_source = data_source_;
   }
    : start_data_quality_ruleset_evaluation_run_request)

let make_start_data_quality_rule_recommendation_run_response ?run_id:(run_id_ : hash_string option)
    () =
  ({ run_id = run_id_ } : start_data_quality_rule_recommendation_run_response)

let make_start_data_quality_rule_recommendation_run_request
    ?client_token:(client_token_ : hash_string option)
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    ?created_ruleset_name:(created_ruleset_name_ : name_string option)
    ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option) ~role:(role_ : role_string)
    ~data_source:(data_source_ : data_source) () =
  ({
     client_token = client_token_;
     data_quality_security_configuration = data_quality_security_configuration_;
     created_ruleset_name = created_ruleset_name_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     role = role_;
     data_source = data_source_;
   }
    : start_data_quality_rule_recommendation_run_request)

let make_start_crawler_schedule_response () = (() : unit)

let make_start_crawler_schedule_request ~crawler_name:(crawler_name_ : name_string) () =
  ({ crawler_name = crawler_name_ } : start_crawler_schedule_request)

let make_start_crawler_response () = (() : unit)

let make_start_crawler_request ~name:(name_ : name_string) () =
  ({ name = name_ } : start_crawler_request)

let make_start_column_statistics_task_run_schedule_response () = (() : unit)

let make_start_column_statistics_task_run_schedule_request ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({ table_name = table_name_; database_name = database_name_ }
    : start_column_statistics_task_run_schedule_request)

let make_start_column_statistics_task_run_response
    ?column_statistics_task_run_id:(column_statistics_task_run_id_ : hash_string option) () =
  ({ column_statistics_task_run_id = column_statistics_task_run_id_ }
    : start_column_statistics_task_run_response)

let make_start_column_statistics_task_run_request
    ?security_configuration:(security_configuration_ : name_string option)
    ?catalog_i_d:(catalog_i_d_ : name_string option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?column_name_list:(column_name_list_ : column_name_list option) ~role:(role_ : name_string)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     security_configuration = security_configuration_;
     catalog_i_d = catalog_i_d_;
     sample_size = sample_size_;
     role = role_;
     column_name_list = column_name_list_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : start_column_statistics_task_run_request)

let make_start_blueprint_run_response ?run_id:(run_id_ : id_string option) () =
  ({ run_id = run_id_ } : start_blueprint_run_response)

let make_start_blueprint_run_request ?parameters:(parameters_ : blueprint_parameters option)
    ~role_arn:(role_arn_ : orchestration_iam_role_arn)
    ~blueprint_name:(blueprint_name_ : orchestration_name_string) () =
  ({ role_arn = role_arn_; parameters = parameters_; blueprint_name = blueprint_name_ }
    : start_blueprint_run_request)

let make_connector_property ?property_location:(property_location_ : property_location option)
    ?allowed_values:(allowed_values_ : list_of_string option)
    ?default_value:(default_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?key_override:(key_override_ : connector_property_key option)
    ~property_type:(property_type_ : property_type) ~required:(required_ : bool_)
    ~name:(name_ : property_name) () =
  ({
     property_type = property_type_;
     property_location = property_location_;
     allowed_values = allowed_values_;
     default_value = default_value_;
     required = required_;
     key_override = key_override_;
     name = name_;
   }
    : connector_property)

let make_response_configuration ?error_path:(error_path_ : json_path_string option)
    ~result_path:(result_path_ : json_path_string) () =
  ({ error_path = error_path_; result_path = result_path_ } : response_configuration)

let make_response_extraction_mapping ?header_key:(header_key_ : connector_property_key option)
    ?content_path:(content_path_ : json_path_string option) () =
  ({ header_key = header_key_; content_path = content_path_ } : response_extraction_mapping)

let make_extracted_parameter ?value:(value_ : response_extraction_mapping option)
    ?property_location:(property_location_ : property_location option)
    ?default_value:(default_value_ : default_value option)
    ?key:(key_ : connector_property_key option) () =
  ({
     value = value_;
     property_location = property_location_;
     default_value = default_value_;
     key = key_;
   }
    : extracted_parameter)

let make_cursor_configuration ?limit_parameter:(limit_parameter_ : extracted_parameter option)
    ~next_page:(next_page_ : extracted_parameter) () =
  ({ limit_parameter = limit_parameter_; next_page = next_page_ } : cursor_configuration)

let make_offset_configuration ~limit_parameter:(limit_parameter_ : extracted_parameter)
    ~offset_parameter:(offset_parameter_ : extracted_parameter) () =
  ({ limit_parameter = limit_parameter_; offset_parameter = offset_parameter_ }
    : offset_configuration)

let make_pagination_configuration
    ?offset_configuration:(offset_configuration_ : offset_configuration option)
    ?cursor_configuration:(cursor_configuration_ : cursor_configuration option) () =
  ({ offset_configuration = offset_configuration_; cursor_configuration = cursor_configuration_ }
    : pagination_configuration)

let make_source_configuration
    ?pagination_configuration:(pagination_configuration_ : pagination_configuration option)
    ?response_configuration:(response_configuration_ : response_configuration option)
    ?request_parameters:(request_parameters_ : connector_property_list option)
    ?request_path:(request_path_ : path_string option)
    ?request_method:(request_method_ : http_method option) () =
  ({
     pagination_configuration = pagination_configuration_;
     response_configuration = response_configuration_;
     request_parameters = request_parameters_;
     request_path = request_path_;
     request_method = request_method_;
   }
    : source_configuration)

let make_sort_criterion ?sort:(sort_ : sort option) ?field_name:(field_name_ : value_string option)
    () =
  ({ sort = sort_; field_name = field_name_ } : sort_criterion)

let make_session_command ?python_version:(python_version_ : python_version_string option)
    ?name:(name_ : name_string option) () =
  ({ python_version = python_version_; name = name_ } : session_command)

let make_session ?session_type:(session_type_ : session_type option)
    ?profile_name:(profile_name_ : name_string option)
    ?idle_timeout:(idle_timeout_ : idle_timeout option)
    ?dpu_seconds:(dpu_seconds_ : nullable_double option)
    ?execution_time:(execution_time_ : nullable_double option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?progress:(progress_ : double_value option)
    ?connections:(connections_ : connections_list option)
    ?default_arguments:(default_arguments_ : orchestration_arguments_map option)
    ?command:(command_ : session_command option) ?role:(role_ : orchestration_role_arn option)
    ?description:(description_ : description_string option)
    ?error_message:(error_message_ : description_string option)
    ?status:(status_ : session_status option) ?created_on:(created_on_ : timestamp_value option)
    ?id:(id_ : name_string option) () =
  ({
     session_type = session_type_;
     profile_name = profile_name_;
     idle_timeout = idle_timeout_;
     dpu_seconds = dpu_seconds_;
     execution_time = execution_time_;
     completed_on = completed_on_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     glue_version = glue_version_;
     security_configuration = security_configuration_;
     max_capacity = max_capacity_;
     progress = progress_;
     connections = connections_;
     default_arguments = default_arguments_;
     command = command_;
     role = role_;
     description = description_;
     error_message = error_message_;
     status = status_;
     created_on = created_on_;
     id = id_;
   }
    : session)

let make_session_endpoint
    ~auth_token_expiration_time:(auth_token_expiration_time_ : timestamp_value)
    ~auth_token:(auth_token_ : sensitive_string) ~url:(url_ : spark_connect_endpoint_url) () =
  ({
     auth_token_expiration_time = auth_token_expiration_time_;
     auth_token = auth_token_;
     url = url_;
   }
    : session_endpoint)

let make_segment ~total_segments:(total_segments_ : total_segments_integer)
    ~segment_number:(segment_number_ : non_negative_integer) () =
  ({ total_segments = total_segments_; segment_number = segment_number_ } : segment)

let make_s3_encryption ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?s3_encryption_mode:(s3_encryption_mode_ : s3_encryption_mode option) () =
  ({ kms_key_arn = kms_key_arn_; s3_encryption_mode = s3_encryption_mode_ } : s3_encryption)

let make_cloud_watch_encryption ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?cloud_watch_encryption_mode:(cloud_watch_encryption_mode_ : cloud_watch_encryption_mode option)
    () =
  ({ kms_key_arn = kms_key_arn_; cloud_watch_encryption_mode = cloud_watch_encryption_mode_ }
    : cloud_watch_encryption)

let make_job_bookmarks_encryption ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?job_bookmarks_encryption_mode:
      (job_bookmarks_encryption_mode_ : job_bookmarks_encryption_mode option) () =
  ({ kms_key_arn = kms_key_arn_; job_bookmarks_encryption_mode = job_bookmarks_encryption_mode_ }
    : job_bookmarks_encryption)

let make_data_quality_encryption ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?data_quality_encryption_mode:
      (data_quality_encryption_mode_ : data_quality_encryption_mode option) () =
  ({ kms_key_arn = kms_key_arn_; data_quality_encryption_mode = data_quality_encryption_mode_ }
    : data_quality_encryption)

let make_encryption_configuration
    ?data_quality_encryption:(data_quality_encryption_ : data_quality_encryption option)
    ?job_bookmarks_encryption:(job_bookmarks_encryption_ : job_bookmarks_encryption option)
    ?cloud_watch_encryption:(cloud_watch_encryption_ : cloud_watch_encryption option)
    ?s3_encryption:(s3_encryption_ : s3_encryption_list option) () =
  ({
     data_quality_encryption = data_quality_encryption_;
     job_bookmarks_encryption = job_bookmarks_encryption_;
     cloud_watch_encryption = cloud_watch_encryption_;
     s3_encryption = s3_encryption_;
   }
    : encryption_configuration)

let make_security_configuration
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?created_time_stamp:(created_time_stamp_ : timestamp_value option)
    ?name:(name_ : name_string option) () =
  ({
     encryption_configuration = encryption_configuration_;
     created_time_stamp = created_time_stamp_;
     name = name_;
   }
    : security_configuration)

let make_search_tables_response ?table_list:(table_list_ : table_list option)
    ?next_token:(next_token_ : token option) () =
  ({ table_list = table_list_; next_token = next_token_ } : search_tables_response)

let make_property_predicate ?comparator:(comparator_ : comparator option)
    ?value:(value_ : value_string option) ?key:(key_ : value_string option) () =
  ({ comparator = comparator_; value = value_; key = key_ } : property_predicate)

let make_search_tables_request
    ?include_status_details:(include_status_details_ : boolean_nullable option)
    ?resource_share_type:(resource_share_type_ : resource_share_type option)
    ?max_results:(max_results_ : page_size option)
    ?sort_criteria:(sort_criteria_ : sort_criteria option)
    ?search_text:(search_text_ : value_string option)
    ?filters:(filters_ : search_property_predicates option) ?next_token:(next_token_ : token option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     include_status_details = include_status_details_;
     resource_share_type = resource_share_type_;
     max_results = max_results_;
     sort_criteria = sort_criteria_;
     search_text = search_text_;
     filters = filters_;
     next_token = next_token_;
     catalog_id = catalog_id_;
   }
    : search_tables_request)

let make_search_sort ?order:(order_ : search_sort_order option)
    ~attribute:(attribute_ : search_attribute) () =
  ({ order = order_; attribute = attribute_ } : search_sort)

let make_search_result_item ?asset_type_id:(asset_type_id_ : asset_type_id option)
    ?updated_at:(updated_at_ : updated_at option)
    ?asset_description:(asset_description_ : asset_description option)
    ?asset_name:(asset_name_ : search_result_name option) ?id:(id_ : asset_id option) () =
  ({
     asset_type_id = asset_type_id_;
     updated_at = updated_at_;
     asset_description = asset_description_;
     asset_name = asset_name_;
     id = id_;
   }
    : search_result_item)

let make_search_map_filter ~value:(value_ : search_map_filter_value) ~key:(key_ : search_map_key)
    ~attribute:(attribute_ : search_attribute) () =
  ({ value = value_; key = key_; attribute = attribute_ } : search_map_filter)

let make_search_attribute_filter ?value:(value_ : search_filter_value option)
    ~operator:(operator_ : search_filter_operator) ~attribute:(attribute_ : search_attribute) () =
  ({ value = value_; operator = operator_; attribute = attribute_ } : search_attribute_filter)

let make_search_assets_output ?next_token:(next_token_ : search_next_token option)
    ?items:(items_ : search_result_item_list option) () =
  ({ next_token = next_token_; items = items_ } : search_assets_output)

let make_search_assets_input ?filter_clause:(filter_clause_ : search_filter_clause option)
    ?sort:(sort_ : search_sort option) ?next_token:(next_token_ : search_next_token option)
    ?max_results:(max_results_ : search_max_results option)
    ?search_text:(search_text_ : search_text option) () =
  ({
     filter_clause = filter_clause_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
     search_text = search_text_;
   }
    : search_assets_input)

let make_schema_version_list_item ?created_time:(created_time_ : created_timestamp option)
    ?status:(status_ : schema_version_status option)
    ?version_number:(version_number_ : version_long_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option) () =
  ({
     created_time = created_time_;
     status = status_;
     version_number = version_number_;
     schema_version_id = schema_version_id_;
     schema_arn = schema_arn_;
   }
    : schema_version_list_item)

let make_error_details ?error_message:(error_message_ : error_message_string option)
    ?error_code:(error_code_ : error_code_string option) () =
  ({ error_message = error_message_; error_code = error_code_ } : error_details)

let make_schema_version_error_item ?error_details:(error_details_ : error_details option)
    ?version_number:(version_number_ : version_long_number option) () =
  ({ error_details = error_details_; version_number = version_number_ } : schema_version_error_item)

let make_schema_list_item ?updated_time:(updated_time_ : updated_timestamp option)
    ?created_time:(created_time_ : created_timestamp option)
    ?schema_status:(schema_status_ : schema_status option)
    ?description:(description_ : description_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({
     updated_time = updated_time_;
     created_time = created_time_;
     schema_status = schema_status_;
     description = description_;
     schema_arn = schema_arn_;
     schema_name = schema_name_;
     registry_name = registry_name_;
   }
    : schema_list_item)

let make_schedule ?state:(state_ : schedule_state option)
    ?schedule_expression:(schedule_expression_ : cron_expression option) () =
  ({ state = state_; schedule_expression = schedule_expression_ } : schedule)

let make_run_statement_response ?id:(id_ : integer_value option) () =
  ({ id = id_ } : run_statement_response)

let make_run_statement_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~code:(code_ : orchestration_statement_code_string) ~session_id:(session_id_ : name_string) () =
  ({ request_origin = request_origin_; code = code_; session_id = session_id_ }
    : run_statement_request)

let make_resume_workflow_run_response ?node_ids:(node_ids_ : node_id_list option)
    ?run_id:(run_id_ : id_string option) () =
  ({ node_ids = node_ids_; run_id = run_id_ } : resume_workflow_run_response)

let make_resume_workflow_run_request ~node_ids:(node_ids_ : node_id_list)
    ~run_id:(run_id_ : id_string) ~name:(name_ : name_string) () =
  ({ node_ids = node_ids_; run_id = run_id_; name = name_ } : resume_workflow_run_request)

let make_field_definition ~field_data_type:(field_data_type_ : field_data_type)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ field_data_type = field_data_type_; name = name_ } : field_definition)

let make_entity_configuration ?schema:(schema_ : field_definition_map option)
    ?source_configuration:(source_configuration_ : source_configuration option) () =
  ({ schema = schema_; source_configuration = source_configuration_ } : entity_configuration)

let make_rest_configuration
    ?entity_configurations:(entity_configurations_ : entity_configuration_map option)
    ?validation_endpoint_configuration:
      (validation_endpoint_configuration_ : source_configuration option)
    ?global_source_configuration:(global_source_configuration_ : source_configuration option) () =
  ({
     entity_configurations = entity_configurations_;
     validation_endpoint_configuration = validation_endpoint_configuration_;
     global_source_configuration = global_source_configuration_;
   }
    : rest_configuration)

let make_job_bookmark_entry ?job_bookmark:(job_bookmark_ : json_value option)
    ?run_id:(run_id_ : run_id option) ?previous_run_id:(previous_run_id_ : run_id option)
    ?attempt:(attempt_ : integer_value option) ?run:(run_ : integer_value option)
    ?version:(version_ : integer_value option) ?job_name:(job_name_ : job_name option) () =
  ({
     job_bookmark = job_bookmark_;
     run_id = run_id_;
     previous_run_id = previous_run_id_;
     attempt = attempt_;
     run = run_;
     version = version_;
     job_name = job_name_;
   }
    : job_bookmark_entry)

let make_reset_job_bookmark_response
    ?job_bookmark_entry:(job_bookmark_entry_ : job_bookmark_entry option) () =
  ({ job_bookmark_entry = job_bookmark_entry_ } : reset_job_bookmark_response)

let make_reset_job_bookmark_request ?run_id:(run_id_ : run_id option)
    ~job_name:(job_name_ : job_name) () =
  ({ run_id = run_id_; job_name = job_name_ } : reset_job_bookmark_request)

let make_remove_schema_version_metadata_response
    ?metadata_value:(metadata_value_ : metadata_value_string option)
    ?metadata_key:(metadata_key_ : metadata_key_string option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?version_number:(version_number_ : version_long_number option)
    ?latest_version:(latest_version_ : latest_schema_version_boolean option)
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option) () =
  ({
     metadata_value = metadata_value_;
     metadata_key = metadata_key_;
     schema_version_id = schema_version_id_;
     version_number = version_number_;
     latest_version = latest_version_;
     registry_name = registry_name_;
     schema_name = schema_name_;
     schema_arn = schema_arn_;
   }
    : remove_schema_version_metadata_response)

let make_metadata_key_value_pair ?metadata_value:(metadata_value_ : metadata_value_string option)
    ?metadata_key:(metadata_key_ : metadata_key_string option) () =
  ({ metadata_value = metadata_value_; metadata_key = metadata_key_ } : metadata_key_value_pair)

let make_remove_schema_version_metadata_input
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?schema_id:(schema_id_ : schema_id option)
    ~metadata_key_value:(metadata_key_value_ : metadata_key_value_pair) () =
  ({
     metadata_key_value = metadata_key_value_;
     schema_version_id = schema_version_id_;
     schema_version_number = schema_version_number_;
     schema_id = schema_id_;
   }
    : remove_schema_version_metadata_input)

let make_registry_list_item ?updated_time:(updated_time_ : updated_timestamp option)
    ?created_time:(created_time_ : created_timestamp option)
    ?status:(status_ : registry_status option)
    ?description:(description_ : description_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({
     updated_time = updated_time_;
     created_time = created_time_;
     status = status_;
     description = description_;
     registry_arn = registry_arn_;
     registry_name = registry_name_;
   }
    : registry_list_item)

let make_register_schema_version_response ?status:(status_ : schema_version_status option)
    ?version_number:(version_number_ : version_long_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option) () =
  ({ status = status_; version_number = version_number_; schema_version_id = schema_version_id_ }
    : register_schema_version_response)

let make_register_schema_version_input
    ~schema_definition:(schema_definition_ : schema_definition_string)
    ~schema_id:(schema_id_ : schema_id) () =
  ({ schema_definition = schema_definition_; schema_id = schema_id_ }
    : register_schema_version_input)

let make_register_connection_type_response
    ?connection_type_arn:(connection_type_arn_ : glue_resource_arn option) () =
  ({ connection_type_arn = connection_type_arn_ } : register_connection_type_response)

let make_connection_properties_configuration
    ?additional_request_parameters:(additional_request_parameters_ : connector_property_list option)
    ?url:(url_ : connector_property option) () =
  ({ additional_request_parameters = additional_request_parameters_; url = url_ }
    : connection_properties_configuration)

let make_client_credentials_properties
    ?token_url_parameters:(token_url_parameters_ : connector_property_list option)
    ?scope:(scope_ : connector_property option)
    ?client_secret:(client_secret_ : connector_property option)
    ?client_id:(client_id_ : connector_property option)
    ?content_type:(content_type_ : content_type option)
    ?request_method:(request_method_ : http_method option)
    ?token_url:(token_url_ : connector_property option) () =
  ({
     token_url_parameters = token_url_parameters_;
     scope = scope_;
     client_secret = client_secret_;
     client_id = client_id_;
     content_type = content_type_;
     request_method = request_method_;
     token_url = token_url_;
   }
    : client_credentials_properties)

let make_jwt_bearer_properties
    ?token_url_parameters:(token_url_parameters_ : connector_property_list option)
    ?jwt_token:(jwt_token_ : connector_property option)
    ?content_type:(content_type_ : content_type option)
    ?request_method:(request_method_ : http_method option)
    ?token_url:(token_url_ : connector_property option) () =
  ({
     token_url_parameters = token_url_parameters_;
     jwt_token = jwt_token_;
     content_type = content_type_;
     request_method = request_method_;
     token_url = token_url_;
   }
    : jwt_bearer_properties)

let make_connector_authorization_code_properties
    ?token_url_parameters:(token_url_parameters_ : connector_property_list option)
    ?prompt:(prompt_ : connector_property option) ?scope:(scope_ : connector_property option)
    ?client_secret:(client_secret_ : connector_property option)
    ?client_id:(client_id_ : connector_property option)
    ?content_type:(content_type_ : content_type option)
    ?request_method:(request_method_ : http_method option)
    ?token_url:(token_url_ : connector_property option)
    ?redirect_uri:(redirect_uri_ : connector_property option)
    ?authorization_code:(authorization_code_ : connector_property option)
    ?authorization_code_url:(authorization_code_url_ : connector_property option) () =
  ({
     token_url_parameters = token_url_parameters_;
     prompt = prompt_;
     scope = scope_;
     client_secret = client_secret_;
     client_id = client_id_;
     content_type = content_type_;
     request_method = request_method_;
     token_url = token_url_;
     redirect_uri = redirect_uri_;
     authorization_code = authorization_code_;
     authorization_code_url = authorization_code_url_;
   }
    : connector_authorization_code_properties)

let make_connector_o_auth2_properties
    ?authorization_code_properties:
      (authorization_code_properties_ : connector_authorization_code_properties option)
    ?jwt_bearer_properties:(jwt_bearer_properties_ : jwt_bearer_properties option)
    ?client_credentials_properties:
      (client_credentials_properties_ : client_credentials_properties option)
    ~o_auth2_grant_type:(o_auth2_grant_type_ : connector_o_auth2_grant_type) () =
  ({
     authorization_code_properties = authorization_code_properties_;
     jwt_bearer_properties = jwt_bearer_properties_;
     client_credentials_properties = client_credentials_properties_;
     o_auth2_grant_type = o_auth2_grant_type_;
   }
    : connector_o_auth2_properties)

let make_basic_authentication_properties ?password:(password_ : connector_property option)
    ?username:(username_ : connector_property option) () =
  ({ password = password_; username = username_ } : basic_authentication_properties)

let make_custom_authentication_properties
    ~authentication_parameters:(authentication_parameters_ : connector_property_list) () =
  ({ authentication_parameters = authentication_parameters_ } : custom_authentication_properties)

let make_connector_authentication_configuration
    ?custom_authentication_properties:
      (custom_authentication_properties_ : custom_authentication_properties option)
    ?basic_authentication_properties:
      (basic_authentication_properties_ : basic_authentication_properties option)
    ?o_auth2_properties:(o_auth2_properties_ : connector_o_auth2_properties option)
    ~authentication_types:(authentication_types_ : authentication_types) () =
  ({
     custom_authentication_properties = custom_authentication_properties_;
     basic_authentication_properties = basic_authentication_properties_;
     o_auth2_properties = o_auth2_properties_;
     authentication_types = authentication_types_;
   }
    : connector_authentication_configuration)

let make_register_connection_type_request ?tags:(tags_ : tags_map option)
    ?description:(description_ : description option)
    ~rest_configuration:(rest_configuration_ : rest_configuration)
    ~connector_authentication_configuration:
      (connector_authentication_configuration_ : connector_authentication_configuration)
    ~connection_properties:(connection_properties_ : connection_properties_configuration)
    ~integration_type:(integration_type_ : integration_type)
    ~connection_type:(connection_type_ : name_string) () =
  ({
     tags = tags_;
     rest_configuration = rest_configuration_;
     connector_authentication_configuration = connector_authentication_configuration_;
     connection_properties = connection_properties_;
     description = description_;
     integration_type = integration_type_;
     connection_type = connection_type_;
   }
    : register_connection_type_request)

let make_query_session_context
    ?additional_context:(additional_context_ : additional_context_map option)
    ?query_authorization_id:(query_authorization_id_ : hash_string option)
    ?cluster_id:(cluster_id_ : nullable_string option)
    ?query_start_time:(query_start_time_ : timestamp option)
    ?query_id:(query_id_ : hash_string option) () =
  ({
     additional_context = additional_context_;
     query_authorization_id = query_authorization_id_;
     cluster_id = cluster_id_;
     query_start_time = query_start_time_;
     query_id = query_id_;
   }
    : query_session_context)

let make_other_metadata_value_list_item ?created_time:(created_time_ : created_timestamp option)
    ?metadata_value:(metadata_value_ : metadata_value_string option) () =
  ({ created_time = created_time_; metadata_value = metadata_value_ }
    : other_metadata_value_list_item)

let make_metadata_info
    ?other_metadata_value_list:(other_metadata_value_list_ : other_metadata_value_list option)
    ?created_time:(created_time_ : created_timestamp option)
    ?metadata_value:(metadata_value_ : metadata_value_string option) () =
  ({
     other_metadata_value_list = other_metadata_value_list_;
     created_time = created_time_;
     metadata_value = metadata_value_;
   }
    : metadata_info)

let make_query_schema_version_metadata_response
    ?next_token:(next_token_ : schema_registry_token_string option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?metadata_info_map:(metadata_info_map_ : metadata_info_map option) () =
  ({
     next_token = next_token_;
     schema_version_id = schema_version_id_;
     metadata_info_map = metadata_info_map_;
   }
    : query_schema_version_metadata_response)

let make_query_schema_version_metadata_input
    ?next_token:(next_token_ : schema_registry_token_string option)
    ?max_results:(max_results_ : query_schema_version_metadata_max_results option)
    ?metadata_list:(metadata_list_ : metadata_list option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?schema_id:(schema_id_ : schema_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     metadata_list = metadata_list_;
     schema_version_id = schema_version_id_;
     schema_version_number = schema_version_number_;
     schema_id = schema_id_;
   }
    : query_schema_version_metadata_input)

let make_put_workflow_run_properties_response () = (() : unit)

let make_put_workflow_run_properties_request
    ~run_properties:(run_properties_ : workflow_run_properties) ~run_id:(run_id_ : id_string)
    ~name:(name_ : name_string) () =
  ({ run_properties = run_properties_; run_id = run_id_; name = name_ }
    : put_workflow_run_properties_request)

let make_put_schema_version_metadata_response
    ?metadata_value:(metadata_value_ : metadata_value_string option)
    ?metadata_key:(metadata_key_ : metadata_key_string option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?version_number:(version_number_ : version_long_number option)
    ?latest_version:(latest_version_ : latest_schema_version_boolean option)
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option) () =
  ({
     metadata_value = metadata_value_;
     metadata_key = metadata_key_;
     schema_version_id = schema_version_id_;
     version_number = version_number_;
     latest_version = latest_version_;
     registry_name = registry_name_;
     schema_name = schema_name_;
     schema_arn = schema_arn_;
   }
    : put_schema_version_metadata_response)

let make_put_schema_version_metadata_input
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?schema_id:(schema_id_ : schema_id option)
    ~metadata_key_value:(metadata_key_value_ : metadata_key_value_pair) () =
  ({
     metadata_key_value = metadata_key_value_;
     schema_version_id = schema_version_id_;
     schema_version_number = schema_version_number_;
     schema_id = schema_id_;
   }
    : put_schema_version_metadata_input)

let make_put_resource_policy_response ?policy_hash:(policy_hash_ : hash_string option) () =
  ({ policy_hash = policy_hash_ } : put_resource_policy_response)

let make_put_resource_policy_request ?enable_hybrid:(enable_hybrid_ : enable_hybrid_values option)
    ?policy_exists_condition:(policy_exists_condition_ : exist_condition option)
    ?policy_hash_condition:(policy_hash_condition_ : hash_string option)
    ?resource_arn:(resource_arn_ : glue_resource_arn option)
    ~policy_in_json:(policy_in_json_ : policy_json_string) () =
  ({
     enable_hybrid = enable_hybrid_;
     policy_exists_condition = policy_exists_condition_;
     policy_hash_condition = policy_hash_condition_;
     resource_arn = resource_arn_;
     policy_in_json = policy_in_json_;
   }
    : put_resource_policy_request)

let make_put_form_type_response ?schema:(schema_ : form_type_schema option)
    ?name:(name_ : form_type_name option) ?id:(id_ : form_type_id option) () =
  ({ schema = schema_; name = name_; id = id_ } : put_form_type_response)

let make_put_form_type_request ?client_token:(client_token_ : hash_string option)
    ~schema:(schema_ : form_type_schema) ~name:(name_ : form_type_name) () =
  ({ client_token = client_token_; schema = schema_; name = name_ } : put_form_type_request)

let make_put_data_quality_profile_annotation_response () = (() : unit)

let make_put_data_quality_profile_annotation_request
    ~inclusion_annotation:(inclusion_annotation_ : inclusion_annotation_value)
    ~profile_id:(profile_id_ : hash_string) () =
  ({ inclusion_annotation = inclusion_annotation_; profile_id = profile_id_ }
    : put_data_quality_profile_annotation_request)

let make_put_data_catalog_encryption_settings_response () = (() : unit)

let make_encryption_at_rest
    ?catalog_encryption_service_role:(catalog_encryption_service_role_ : iam_role_arn option)
    ?sse_aws_kms_key_id:(sse_aws_kms_key_id_ : name_string option)
    ~catalog_encryption_mode:(catalog_encryption_mode_ : catalog_encryption_mode) () =
  ({
     catalog_encryption_service_role = catalog_encryption_service_role_;
     sse_aws_kms_key_id = sse_aws_kms_key_id_;
     catalog_encryption_mode = catalog_encryption_mode_;
   }
    : encryption_at_rest)

let make_connection_password_encryption ?aws_kms_key_id:(aws_kms_key_id_ : name_string option)
    ~return_connection_password_encrypted:(return_connection_password_encrypted_ : boolean_) () =
  ({
     aws_kms_key_id = aws_kms_key_id_;
     return_connection_password_encrypted = return_connection_password_encrypted_;
   }
    : connection_password_encryption)

let make_data_catalog_encryption_settings
    ?connection_password_encryption:
      (connection_password_encryption_ : connection_password_encryption option)
    ?encryption_at_rest:(encryption_at_rest_ : encryption_at_rest option) () =
  ({
     connection_password_encryption = connection_password_encryption_;
     encryption_at_rest = encryption_at_rest_;
   }
    : data_catalog_encryption_settings)

let make_put_data_catalog_encryption_settings_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~data_catalog_encryption_settings:
      (data_catalog_encryption_settings_ : data_catalog_encryption_settings) () =
  ({
     data_catalog_encryption_settings = data_catalog_encryption_settings_;
     catalog_id = catalog_id_;
   }
    : put_data_catalog_encryption_settings_request)

let make_put_attachment_response ?form_type_id:(form_type_id_ : form_type_id option)
    ?attachment_name:(attachment_name_ : attachment_name option)
    ?item_identifier:(item_identifier_ : item_identifier option)
    ?iterable_form_name:(iterable_form_name_ : iterable_form_name option)
    ?asset_identifier:(asset_identifier_ : asset_id option) () =
  ({
     form_type_id = form_type_id_;
     attachment_name = attachment_name_;
     item_identifier = item_identifier_;
     iterable_form_name = iterable_form_name_;
     asset_identifier = asset_identifier_;
   }
    : put_attachment_response)

let make_put_attachment_request ?client_token:(client_token_ : hash_string option)
    ?item_identifier:(item_identifier_ : item_identifier option)
    ?iterable_form_name:(iterable_form_name_ : iterable_form_name option)
    ~form_type_id:(form_type_id_ : form_type_id) ~content:(content_ : form_content)
    ~attachment_name:(attachment_name_ : attachment_name)
    ~asset_identifier:(asset_identifier_ : asset_id) () =
  ({
     client_token = client_token_;
     form_type_id = form_type_id_;
     content = content_;
     attachment_name = attachment_name_;
     item_identifier = item_identifier_;
     iterable_form_name = iterable_form_name_;
     asset_identifier = asset_identifier_;
   }
    : put_attachment_request)

let make_asset_type_form_reference ~form_type_identifier:(form_type_identifier_ : form_type_id) () =
  ({ form_type_identifier = form_type_identifier_ } : asset_type_form_reference)

let make_put_asset_type_response ?forms:(forms_ : asset_type_forms_map option)
    ?name:(name_ : asset_type_name option) ?id:(id_ : asset_type_id option) () =
  ({ forms = forms_; name = name_; id = id_ } : put_asset_type_response)

let make_put_asset_type_request ?client_token:(client_token_ : hash_string option)
    ~forms:(forms_ : asset_type_forms_map) ~name:(name_ : asset_type_name) () =
  ({ client_token = client_token_; forms = forms_; name = name_ } : put_asset_type_request)

let make_asset_form_entry ?content:(content_ : form_content option)
    ?form_type_id:(form_type_id_ : form_type_id option) () =
  ({ content = content_; form_type_id = form_type_id_ } : asset_form_entry)

let make_put_asset_response ?forms:(forms_ : asset_form_map option)
    ?created_at:(created_at_ : created_at option)
    ?description:(description_ : asset_description option) ~name:(name_ : asset_name)
    ~id:(id_ : asset_id) () =
  ({ forms = forms_; created_at = created_at_; description = description_; name = name_; id = id_ }
    : put_asset_response)

let make_put_asset_request ?client_token:(client_token_ : hash_string option)
    ?description:(description_ : asset_description option) ~forms:(forms_ : asset_form_map)
    ~name:(name_ : asset_name) ~identifier:(identifier_ : asset_id)
    ~asset_type_id:(asset_type_id_ : asset_type_id) () =
  ({
     client_token = client_token_;
     forms = forms_;
     description = description_;
     name = name_;
     identifier = identifier_;
     asset_type_id = asset_type_id_;
   }
    : put_asset_request)

let make_allowed_value ?description:(description_ : allowed_value_description_string option)
    ~value:(value_ : allowed_value_value_string) () =
  ({ value = value_; description = description_ } : allowed_value)

let make_property ?property_location:(property_location_ : property_location option)
    ?key_override:(key_override_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?data_operation_scopes:(data_operation_scopes_ : data_operations option)
    ?allowed_values:(allowed_values_ : allowed_values option)
    ?default_value:(default_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~property_types:(property_types_ : property_types) ~required:(required_ : bool_)
    ~description:(description_ : property_description_string) ~name:(name_ : property_name) () =
  ({
     property_location = property_location_;
     key_override = key_override_;
     data_operation_scopes = data_operation_scopes_;
     allowed_values = allowed_values_;
     property_types = property_types_;
     default_value = default_value_;
     required = required_;
     description = description_;
     name = name_;
   }
    : property)

let make_partition_value_list ~values:(values_ : value_string_list) () =
  ({ values = values_ } : partition_value_list)

let make_partition_index ~index_name:(index_name_ : name_string) ~keys:(keys_ : key_list) () =
  ({ index_name = index_name_; keys = keys_ } : partition_index)

let make_key_schema_element ~type_:(type__ : column_type_string) ~name:(name_ : name_string) () =
  ({ type_ = type__; name = name_ } : key_schema_element)

let make_backfill_error ?partitions:(partitions_ : backfill_errored_partitions_list option)
    ?code:(code_ : backfill_error_code option) () =
  ({ partitions = partitions_; code = code_ } : backfill_error)

let make_partition_index_descriptor ?backfill_errors:(backfill_errors_ : backfill_errors option)
    ~index_status:(index_status_ : partition_index_status) ~keys:(keys_ : key_schema_element_list)
    ~index_name:(index_name_ : name_string) () =
  ({
     backfill_errors = backfill_errors_;
     index_status = index_status_;
     keys = keys_;
     index_name = index_name_;
   }
    : partition_index_descriptor)

let make_partition_error ?error_detail:(error_detail_ : error_detail option)
    ?partition_values:(partition_values_ : value_string_list option) () =
  ({ error_detail = error_detail_; partition_values = partition_values_ } : partition_error)

let make_create_iceberg_table_input ?properties:(properties_ : string_to_string_map option)
    ?write_order:(write_order_ : iceberg_sort_order option)
    ?partition_spec:(partition_spec_ : iceberg_partition_spec option)
    ~schema:(schema_ : iceberg_schema) ~location:(location_ : location_string) () =
  ({
     properties = properties_;
     write_order = write_order_;
     partition_spec = partition_spec_;
     schema = schema_;
     location = location_;
   }
    : create_iceberg_table_input)

let make_iceberg_input
    ?create_iceberg_table_input:(create_iceberg_table_input_ : create_iceberg_table_input option)
    ?version:(version_ : version_string option)
    ~metadata_operation:(metadata_operation_ : metadata_operation) () =
  ({
     create_iceberg_table_input = create_iceberg_table_input_;
     version = version_;
     metadata_operation = metadata_operation_;
   }
    : iceberg_input)

let make_open_table_format_input ?iceberg_input:(iceberg_input_ : iceberg_input option) () =
  ({ iceberg_input = iceberg_input_ } : open_table_format_input)

let make_o_auth2_properties
    ?token_url_parameters_map:(token_url_parameters_map_ : token_url_parameters_map option)
    ?token_url:(token_url_ : token_url option)
    ?o_auth2_client_application:(o_auth2_client_application_ : o_auth2_client_application option)
    ?o_auth2_grant_type:(o_auth2_grant_type_ : o_auth2_grant_type option) () =
  ({
     token_url_parameters_map = token_url_parameters_map_;
     token_url = token_url_;
     o_auth2_client_application = o_auth2_client_application_;
     o_auth2_grant_type = o_auth2_grant_type_;
   }
    : o_auth2_properties)

let make_integration_error ?error_message:(error_message_ : string2048 option)
    ?error_code:(error_code_ : string128 option) () =
  ({ error_message = error_message_; error_code = error_code_ } : integration_error)

let make_integration_config ?continuous_sync:(continuous_sync_ : continuous_sync option)
    ?source_properties:(source_properties_ : integration_source_properties_map option)
    ?refresh_interval:(refresh_interval_ : string128 option) () =
  ({
     continuous_sync = continuous_sync_;
     source_properties = source_properties_;
     refresh_interval = refresh_interval_;
   }
    : integration_config)

let make_modify_integration_response
    ?integration_config:(integration_config_ : integration_config option)
    ?data_filter:(data_filter_ : string2048 option)
    ?errors:(errors_ : integration_error_list option) ?tags:(tags_ : integration_tags_list option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?description:(description_ : integration_description option)
    ~create_time:(create_time_ : integration_timestamp) ~status:(status_ : integration_status)
    ~integration_arn:(integration_arn_ : string128)
    ~integration_name:(integration_name_ : string128) ~target_arn:(target_arn_ : string512)
    ~source_arn:(source_arn_ : string512) () =
  ({
     integration_config = integration_config_;
     data_filter = data_filter_;
     errors = errors_;
     create_time = create_time_;
     status = status_;
     tags = tags_;
     additional_encryption_context = additional_encryption_context_;
     kms_key_id = kms_key_id_;
     integration_arn = integration_arn_;
     description = description_;
     integration_name = integration_name_;
     target_arn = target_arn_;
     source_arn = source_arn_;
   }
    : modify_integration_response)

let make_modify_integration_request ?integration_name:(integration_name_ : string128 option)
    ?integration_config:(integration_config_ : integration_config option)
    ?data_filter:(data_filter_ : string2048 option)
    ?description:(description_ : integration_description option)
    ~integration_identifier:(integration_identifier_ : string128) () =
  ({
     integration_name = integration_name_;
     integration_config = integration_config_;
     data_filter = data_filter_;
     description = description_;
     integration_identifier = integration_identifier_;
   }
    : modify_integration_request)

let make_data_quality_metric_values ?upper_limit:(upper_limit_ : nullable_double option)
    ?lower_limit:(lower_limit_ : nullable_double option)
    ?expected_value:(expected_value_ : nullable_double option)
    ?actual_value:(actual_value_ : nullable_double option) () =
  ({
     upper_limit = upper_limit_;
     lower_limit = lower_limit_;
     expected_value = expected_value_;
     actual_value = actual_value_;
   }
    : data_quality_metric_values)

let make_metric_based_observation ?new_rules:(new_rules_ : new_rules option)
    ?metric_values:(metric_values_ : data_quality_metric_values option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?metric_name:(metric_name_ : name_string option) () =
  ({
     new_rules = new_rules_;
     metric_values = metric_values_;
     statistic_id = statistic_id_;
     metric_name = metric_name_;
   }
    : metric_based_observation)

let make_materialized_view_refresh_task_run ?processed_bytes:(processed_bytes_ : byte_count option)
    ?refresh_type:(refresh_type_ : materialized_view_refresh_type option)
    ?dpu_seconds:(dpu_seconds_ : non_negative_double option)
    ?error_message:(error_message_ : description_string option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?status:(status_ : materialized_view_refresh_state option) ?role:(role_ : role option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?table_name:(table_name_ : table_name option)
    ?database_name:(database_name_ : database_name option)
    ?materialized_view_refresh_task_run_id:(materialized_view_refresh_task_run_id_ : uui_dv4 option)
    ?customer_id:(customer_id_ : account_id option) () =
  ({
     processed_bytes = processed_bytes_;
     refresh_type = refresh_type_;
     dpu_seconds = dpu_seconds_;
     error_message = error_message_;
     end_time = end_time_;
     start_time = start_time_;
     last_updated = last_updated_;
     creation_time = creation_time_;
     status = status_;
     role = role_;
     catalog_id = catalog_id_;
     table_name = table_name_;
     database_name = database_name_;
     materialized_view_refresh_task_run_id = materialized_view_refresh_task_run_id_;
     customer_id = customer_id_;
   }
    : materialized_view_refresh_task_run)

let make_mapping_entry ?target_type:(target_type_ : field_type option)
    ?target_path:(target_path_ : schema_path_string option)
    ?target_table:(target_table_ : table_name option)
    ?source_type:(source_type_ : field_type option)
    ?source_path:(source_path_ : schema_path_string option)
    ?source_table:(source_table_ : table_name option) () =
  ({
     target_type = target_type_;
     target_path = target_path_;
     target_table = target_table_;
     source_type = source_type_;
     source_path = source_path_;
     source_table = source_table_;
   }
    : mapping_entry)

let make_code_gen_node_arg ?param:(param_ : boolean_ option) ~value:(value_ : code_gen_arg_value)
    ~name:(name_ : code_gen_arg_name) () =
  ({ param = param_; value = value_; name = name_ } : code_gen_node_arg)

let make_location ?dynamo_d_b:(dynamo_d_b_ : code_gen_node_args option)
    ?s3:(s3_ : code_gen_node_args option) ?jdbc:(jdbc_ : code_gen_node_args option) () =
  ({ dynamo_d_b = dynamo_d_b_; s3 = s3_; jdbc = jdbc_ } : location)

let make_list_workflows_response ?next_token:(next_token_ : generic_string option)
    ?workflows:(workflows_ : workflow_names option) () =
  ({ next_token = next_token_; workflows = workflows_ } : list_workflows_response)

let make_list_workflows_request ?max_results:(max_results_ : orchestration_page_size25 option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_workflows_request)

let make_list_usage_profiles_response ?next_token:(next_token_ : orchestration_token option)
    ?profiles:(profiles_ : usage_profile_definition_list option) () =
  ({ next_token = next_token_; profiles = profiles_ } : list_usage_profiles_response)

let make_list_usage_profiles_request ?max_results:(max_results_ : orchestration_page_size200 option)
    ?next_token:(next_token_ : orchestration_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_usage_profiles_request)

let make_list_triggers_response ?next_token:(next_token_ : generic_string option)
    ?trigger_names:(trigger_names_ : trigger_name_list option) () =
  ({ next_token = next_token_; trigger_names = trigger_names_ } : list_triggers_response)

let make_list_triggers_request ?tags:(tags_ : tags_map option)
    ?max_results:(max_results_ : orchestration_page_size200 option)
    ?dependent_job_name:(dependent_job_name_ : name_string option)
    ?next_token:(next_token_ : generic_string option) () =
  ({
     tags = tags_;
     max_results = max_results_;
     dependent_job_name = dependent_job_name_;
     next_token = next_token_;
   }
    : list_triggers_request)

let make_list_table_optimizer_runs_response
    ?table_optimizer_runs:(table_optimizer_runs_ : table_optimizer_runs option)
    ?next_token:(next_token_ : list_table_optimizer_runs_token option)
    ?table_name:(table_name_ : name_string option)
    ?database_name:(database_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     table_optimizer_runs = table_optimizer_runs_;
     next_token = next_token_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : list_table_optimizer_runs_response)

let make_list_table_optimizer_runs_request
    ?next_token:(next_token_ : list_table_optimizer_runs_token option)
    ?max_results:(max_results_ : max_list_table_optimizer_runs_token_results option)
    ~type_:(type__ : table_optimizer_type) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     type_ = type__;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : list_table_optimizer_runs_request)

let make_list_statements_response ?next_token:(next_token_ : orchestration_token option)
    ?statements:(statements_ : statement_list option) () =
  ({ next_token = next_token_; statements = statements_ } : list_statements_response)

let make_list_statements_request ?next_token:(next_token_ : orchestration_token option)
    ?request_origin:(request_origin_ : orchestration_name_string option)
    ~session_id:(session_id_ : name_string) () =
  ({ next_token = next_token_; request_origin = request_origin_; session_id = session_id_ }
    : list_statements_request)

let make_list_sessions_response ?next_token:(next_token_ : orchestration_token option)
    ?sessions:(sessions_ : session_list option) ?ids:(ids_ : session_id_list option) () =
  ({ next_token = next_token_; sessions = sessions_; ids = ids_ } : list_sessions_response)

let make_list_sessions_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ?tags:(tags_ : tags_map option) ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : orchestration_token option) () =
  ({
     request_origin = request_origin_;
     tags = tags_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_sessions_request)

let make_list_schemas_response ?next_token:(next_token_ : schema_registry_token_string option)
    ?schemas:(schemas_ : schema_list_definition option) () =
  ({ next_token = next_token_; schemas = schemas_ } : list_schemas_response)

let make_list_schemas_input ?next_token:(next_token_ : schema_registry_token_string option)
    ?max_results:(max_results_ : max_results_number option)
    ?registry_id:(registry_id_ : registry_id option) () =
  ({ next_token = next_token_; max_results = max_results_; registry_id = registry_id_ }
    : list_schemas_input)

let make_list_schema_versions_response
    ?next_token:(next_token_ : schema_registry_token_string option)
    ?schemas:(schemas_ : schema_version_list option) () =
  ({ next_token = next_token_; schemas = schemas_ } : list_schema_versions_response)

let make_list_schema_versions_input ?next_token:(next_token_ : schema_registry_token_string option)
    ?max_results:(max_results_ : max_results_number option) ~schema_id:(schema_id_ : schema_id) () =
  ({ next_token = next_token_; max_results = max_results_; schema_id = schema_id_ }
    : list_schema_versions_input)

let make_list_registries_response ?next_token:(next_token_ : schema_registry_token_string option)
    ?registries:(registries_ : registry_list_definition option) () =
  ({ next_token = next_token_; registries = registries_ } : list_registries_response)

let make_list_registries_input ?next_token:(next_token_ : schema_registry_token_string option)
    ?max_results:(max_results_ : max_results_number option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_registries_input)

let make_list_materialized_view_refresh_task_runs_response ?next_token:(next_token_ : token option)
    ?materialized_view_refresh_task_runs:
      (materialized_view_refresh_task_runs_ : materialized_view_refresh_task_runs_list option) () =
  ({
     next_token = next_token_;
     materialized_view_refresh_task_runs = materialized_view_refresh_task_runs_;
   }
    : list_materialized_view_refresh_task_runs_response)

let make_list_materialized_view_refresh_task_runs_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) ?table_name:(table_name_ : name_string option)
    ?database_name:(database_name_ : name_string option) ~catalog_id:(catalog_id_ : name_string) ()
    =
  ({
     next_token = next_token_;
     max_results = max_results_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : list_materialized_view_refresh_task_runs_request)

let make_list_ml_transforms_response ?next_token:(next_token_ : pagination_token option)
    ~transform_ids:(transform_ids_ : transform_id_list) () =
  ({ next_token = next_token_; transform_ids = transform_ids_ } : list_ml_transforms_response)

let make_list_ml_transforms_request ?tags:(tags_ : tags_map option)
    ?sort:(sort_ : transform_sort_criteria option)
    ?filter:(filter_ : transform_filter_criteria option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     tags = tags_;
     sort = sort_;
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_ml_transforms_request)

let make_list_jobs_response ?next_token:(next_token_ : generic_string option)
    ?job_names:(job_names_ : job_name_list option) () =
  ({ next_token = next_token_; job_names = job_names_ } : list_jobs_response)

let make_list_jobs_request ?tags:(tags_ : tags_map option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : generic_string option)
    () =
  ({ tags = tags_; max_results = max_results_; next_token = next_token_ } : list_jobs_request)

let make_iterable_form_list_item ?glossary_terms:(glossary_terms_ : glossary_term_id_list option)
    ?description:(description_ : item_description option) ?item_name:(item_name_ : item_name option)
    ?item_id:(item_id_ : item_id option) () =
  ({
     glossary_terms = glossary_terms_;
     description = description_;
     item_name = item_name_;
     item_id = item_id_;
   }
    : iterable_form_list_item)

let make_list_iterable_forms_response ?next_token:(next_token_ : token option)
    ?items:(items_ : iterable_form_list_item_list option) () =
  ({ next_token = next_token_; items = items_ } : list_iterable_forms_response)

let make_list_iterable_forms_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option)
    ~iterable_form_name:(iterable_form_name_ : iterable_form_name)
    ~asset_identifier:(asset_identifier_ : asset_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     iterable_form_name = iterable_form_name_;
     asset_identifier = asset_identifier_;
   }
    : list_iterable_forms_request)

let make_integration_resource_property
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ~resource_arn:(resource_arn_ : string512) () =
  ({
     target_processing_properties = target_processing_properties_;
     source_processing_properties = source_processing_properties_;
     resource_property_arn = resource_property_arn_;
     resource_arn = resource_arn_;
   }
    : integration_resource_property)

let make_list_integration_resource_properties_response ?marker:(marker_ : string1024 option)
    ?integration_resource_property_list:
      (integration_resource_property_list_ : integration_resource_property_list option) () =
  ({ marker = marker_; integration_resource_property_list = integration_resource_property_list_ }
    : list_integration_resource_properties_response)

let make_integration_resource_property_filter
    ?values:(values_ : integration_resource_property_filter_values option)
    ?name:(name_ : string128 option) () =
  ({ values = values_; name = name_ } : integration_resource_property_filter)

let make_list_integration_resource_properties_request
    ?max_records:(max_records_ : integration_integer option)
    ?filters:(filters_ : integration_resource_property_filter_list option)
    ?marker:(marker_ : string1024 option) () =
  ({ max_records = max_records_; filters = filters_; marker = marker_ }
    : list_integration_resource_properties_request)

let make_glossary_term_item
    ?short_description:(short_description_ : glossary_short_description option)
    ?name:(name_ : glossary_term_name option) ?id:(id_ : glossary_term_id option) () =
  ({ short_description = short_description_; name = name_; id = id_ } : glossary_term_item)

let make_list_glossary_terms_response ?next_token:(next_token_ : token option)
    ?items:(items_ : glossary_term_item_list option) () =
  ({ next_token = next_token_; items = items_ } : list_glossary_terms_response)

let make_list_glossary_terms_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option)
    ~glossary_identifier:(glossary_identifier_ : glossary_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     glossary_identifier = glossary_identifier_;
   }
    : list_glossary_terms_request)

let make_glossary_item ?description:(description_ : metadata_description option)
    ?name:(name_ : glossary_name option) ?id:(id_ : glossary_id option) () =
  ({ description = description_; name = name_; id = id_ } : glossary_item)

let make_list_glossaries_response ?next_token:(next_token_ : token option)
    ?items:(items_ : glossary_item_list option) () =
  ({ next_token = next_token_; items = items_ } : list_glossaries_response)

let make_list_glossaries_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_glossaries_request)

let make_form_type_item ?name:(name_ : form_type_name option) ?id:(id_ : form_type_id option) () =
  ({ name = name_; id = id_ } : form_type_item)

let make_list_form_types_response ?next_token:(next_token_ : token option)
    ~items:(items_ : form_type_item_list) () =
  ({ next_token = next_token_; items = items_ } : list_form_types_response)

let make_list_form_types_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_form_types_request)

let make_entity ?custom_properties:(custom_properties_ : custom_properties option)
    ?category:(category_ : category option) ?description:(description_ : entity_description option)
    ?is_parent_entity:(is_parent_entity_ : is_parent_entity option)
    ?label:(label_ : entity_label option) ?entity_name:(entity_name_ : entity_name option) () =
  ({
     custom_properties = custom_properties_;
     category = category_;
     description = description_;
     is_parent_entity = is_parent_entity_;
     label = label_;
     entity_name = entity_name_;
   }
    : entity)

let make_list_entities_response ?next_token:(next_token_ : next_token option)
    ?entities:(entities_ : entity_list option) () =
  ({ next_token = next_token_; entities = entities_ } : list_entities_response)

let make_list_entities_request
    ?data_store_api_version:(data_store_api_version_ : api_version option)
    ?next_token:(next_token_ : next_token option)
    ?parent_entity_name:(parent_entity_name_ : entity_name option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?connection_name:(connection_name_ : name_string option) () =
  ({
     data_store_api_version = data_store_api_version_;
     next_token = next_token_;
     parent_entity_name = parent_entity_name_;
     catalog_id = catalog_id_;
     connection_name = connection_name_;
   }
    : list_entities_request)

let make_list_dev_endpoints_response ?next_token:(next_token_ : generic_string option)
    ?dev_endpoint_names:(dev_endpoint_names_ : dev_endpoint_name_list option) () =
  ({ next_token = next_token_; dev_endpoint_names = dev_endpoint_names_ }
    : list_dev_endpoints_response)

let make_list_dev_endpoints_request ?tags:(tags_ : tags_map option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : generic_string option)
    () =
  ({ tags = tags_; max_results = max_results_; next_token = next_token_ }
    : list_dev_endpoints_request)

let make_list_data_quality_statistics_response ?next_token:(next_token_ : pagination_token option)
    ?statistics:(statistics_ : statistic_summary_list option) () =
  ({ next_token = next_token_; statistics = statistics_ } : list_data_quality_statistics_response)

let make_list_data_quality_statistics_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option)
    ?timestamp_filter:(timestamp_filter_ : timestamp_filter option)
    ?profile_id:(profile_id_ : hash_string option)
    ?statistic_id:(statistic_id_ : hash_string option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     timestamp_filter = timestamp_filter_;
     profile_id = profile_id_;
     statistic_id = statistic_id_;
   }
    : list_data_quality_statistics_request)

let make_list_data_quality_statistic_annotations_response
    ?next_token:(next_token_ : pagination_token option)
    ?annotations:(annotations_ : annotation_list option) () =
  ({ next_token = next_token_; annotations = annotations_ }
    : list_data_quality_statistic_annotations_response)

let make_list_data_quality_statistic_annotations_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option)
    ?timestamp_filter:(timestamp_filter_ : timestamp_filter option)
    ?profile_id:(profile_id_ : hash_string option)
    ?statistic_id:(statistic_id_ : hash_string option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     timestamp_filter = timestamp_filter_;
     profile_id = profile_id_;
     statistic_id = statistic_id_;
   }
    : list_data_quality_statistic_annotations_request)

let make_data_quality_target_table ?catalog_id:(catalog_id_ : name_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({ catalog_id = catalog_id_; database_name = database_name_; table_name = table_name_ }
    : data_quality_target_table)

let make_data_quality_ruleset_list_details ?rule_count:(rule_count_ : nullable_integer option)
    ?recommendation_run_id:(recommendation_run_id_ : hash_string option)
    ?target_table:(target_table_ : data_quality_target_table option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?created_on:(created_on_ : timestamp option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({
     rule_count = rule_count_;
     recommendation_run_id = recommendation_run_id_;
     target_table = target_table_;
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     description = description_;
     name = name_;
   }
    : data_quality_ruleset_list_details)

let make_list_data_quality_rulesets_response ?next_token:(next_token_ : pagination_token option)
    ?rulesets:(rulesets_ : data_quality_ruleset_list option) () =
  ({ next_token = next_token_; rulesets = rulesets_ } : list_data_quality_rulesets_response)

let make_data_quality_ruleset_filter_criteria
    ?target_table:(target_table_ : data_quality_target_table option)
    ?last_modified_after:(last_modified_after_ : timestamp option)
    ?last_modified_before:(last_modified_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({
     target_table = target_table_;
     last_modified_after = last_modified_after_;
     last_modified_before = last_modified_before_;
     created_after = created_after_;
     created_before = created_before_;
     description = description_;
     name = name_;
   }
    : data_quality_ruleset_filter_criteria)

let make_list_data_quality_rulesets_request ?tags:(tags_ : tags_map option)
    ?filter:(filter_ : data_quality_ruleset_filter_criteria option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ tags = tags_; filter = filter_; max_results = max_results_; next_token = next_token_ }
    : list_data_quality_rulesets_request)

let make_data_quality_ruleset_evaluation_run_description
    ?data_source:(data_source_ : data_source option) ?started_on:(started_on_ : timestamp option)
    ?status:(status_ : task_status_type option) ?run_id:(run_id_ : hash_string option) () =
  ({ data_source = data_source_; started_on = started_on_; status = status_; run_id = run_id_ }
    : data_quality_ruleset_evaluation_run_description)

let make_list_data_quality_ruleset_evaluation_runs_response
    ?next_token:(next_token_ : pagination_token option)
    ?runs:(runs_ : data_quality_ruleset_evaluation_run_list option) () =
  ({ next_token = next_token_; runs = runs_ } : list_data_quality_ruleset_evaluation_runs_response)

let make_data_quality_ruleset_evaluation_run_filter
    ?ruleset_name:(ruleset_name_ : name_string option)
    ?started_after:(started_after_ : timestamp option)
    ?started_before:(started_before_ : timestamp option) ~data_source:(data_source_ : data_source)
    () =
  ({
     ruleset_name = ruleset_name_;
     started_after = started_after_;
     started_before = started_before_;
     data_source = data_source_;
   }
    : data_quality_ruleset_evaluation_run_filter)

let make_list_data_quality_ruleset_evaluation_runs_request
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?filter:(filter_ : data_quality_ruleset_evaluation_run_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_data_quality_ruleset_evaluation_runs_request)

let make_data_quality_rule_recommendation_run_description
    ?data_source:(data_source_ : data_source option) ?started_on:(started_on_ : timestamp option)
    ?status:(status_ : task_status_type option) ?run_id:(run_id_ : hash_string option) () =
  ({ data_source = data_source_; started_on = started_on_; status = status_; run_id = run_id_ }
    : data_quality_rule_recommendation_run_description)

let make_list_data_quality_rule_recommendation_runs_response
    ?next_token:(next_token_ : pagination_token option)
    ?runs:(runs_ : data_quality_rule_recommendation_run_list option) () =
  ({ next_token = next_token_; runs = runs_ } : list_data_quality_rule_recommendation_runs_response)

let make_data_quality_rule_recommendation_run_filter
    ?started_after:(started_after_ : timestamp option)
    ?started_before:(started_before_ : timestamp option) ~data_source:(data_source_ : data_source)
    () =
  ({ started_after = started_after_; started_before = started_before_; data_source = data_source_ }
    : data_quality_rule_recommendation_run_filter)

let make_list_data_quality_rule_recommendation_runs_request
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?filter:(filter_ : data_quality_rule_recommendation_run_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_data_quality_rule_recommendation_runs_request)

let make_data_quality_result_description ?started_on:(started_on_ : timestamp option)
    ?job_run_id:(job_run_id_ : hash_string option) ?job_name:(job_name_ : name_string option)
    ?data_source:(data_source_ : data_source option) ?result_id:(result_id_ : hash_string option) ()
    =
  ({
     started_on = started_on_;
     job_run_id = job_run_id_;
     job_name = job_name_;
     data_source = data_source_;
     result_id = result_id_;
   }
    : data_quality_result_description)

let make_list_data_quality_results_response ?next_token:(next_token_ : pagination_token option)
    ~results:(results_ : data_quality_result_description_list) () =
  ({ next_token = next_token_; results = results_ } : list_data_quality_results_response)

let make_data_quality_result_filter_criteria ?started_before:(started_before_ : timestamp option)
    ?started_after:(started_after_ : timestamp option)
    ?job_run_id:(job_run_id_ : hash_string option) ?job_name:(job_name_ : name_string option)
    ?data_source:(data_source_ : data_source option) () =
  ({
     started_before = started_before_;
     started_after = started_after_;
     job_run_id = job_run_id_;
     job_name = job_name_;
     data_source = data_source_;
   }
    : data_quality_result_filter_criteria)

let make_list_data_quality_results_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option)
    ?filter:(filter_ : data_quality_result_filter_criteria option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_data_quality_results_request)

let make_custom_entity_type ?context_words:(context_words_ : context_words option)
    ~regex_string:(regex_string_ : name_string) ~name:(name_ : name_string) () =
  ({ context_words = context_words_; regex_string = regex_string_; name = name_ }
    : custom_entity_type)

let make_list_custom_entity_types_response ?next_token:(next_token_ : pagination_token option)
    ?custom_entity_types:(custom_entity_types_ : custom_entity_types option) () =
  ({ next_token = next_token_; custom_entity_types = custom_entity_types_ }
    : list_custom_entity_types_response)

let make_list_custom_entity_types_request ?tags:(tags_ : tags_map option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ tags = tags_; max_results = max_results_; next_token = next_token_ }
    : list_custom_entity_types_request)

let make_crawler_history ?dpu_hour:(dpu_hour_ : non_negative_double option)
    ?message_prefix:(message_prefix_ : message_prefix option)
    ?log_stream:(log_stream_ : log_stream option) ?log_group:(log_group_ : log_group option)
    ?error_message:(error_message_ : description_string option)
    ?summary:(summary_ : name_string option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?state:(state_ : crawler_history_state option)
    ?crawl_id:(crawl_id_ : crawl_id option) () =
  ({
     dpu_hour = dpu_hour_;
     message_prefix = message_prefix_;
     log_stream = log_stream_;
     log_group = log_group_;
     error_message = error_message_;
     summary = summary_;
     end_time = end_time_;
     start_time = start_time_;
     state = state_;
     crawl_id = crawl_id_;
   }
    : crawler_history)

let make_list_crawls_response ?next_token:(next_token_ : token option)
    ?crawls:(crawls_ : crawler_history_list option) () =
  ({ next_token = next_token_; crawls = crawls_ } : list_crawls_response)

let make_crawls_filter ?field_value:(field_value_ : generic_string option)
    ?filter_operator:(filter_operator_ : filter_operator option)
    ?field_name:(field_name_ : field_name option) () =
  ({ field_value = field_value_; filter_operator = filter_operator_; field_name = field_name_ }
    : crawls_filter)

let make_list_crawls_request ?next_token:(next_token_ : token option)
    ?filters:(filters_ : crawls_filter_list option) ?max_results:(max_results_ : page_size option)
    ~crawler_name:(crawler_name_ : name_string) () =
  ({
     next_token = next_token_;
     filters = filters_;
     max_results = max_results_;
     crawler_name = crawler_name_;
   }
    : list_crawls_request)

let make_list_crawlers_response ?next_token:(next_token_ : token option)
    ?crawler_names:(crawler_names_ : crawler_name_list option) () =
  ({ next_token = next_token_; crawler_names = crawler_names_ } : list_crawlers_response)

let make_list_crawlers_request ?tags:(tags_ : tags_map option)
    ?next_token:(next_token_ : token option) ?max_results:(max_results_ : page_size option) () =
  ({ tags = tags_; next_token = next_token_; max_results = max_results_ } : list_crawlers_request)

let make_capabilities
    ~supported_compute_environments:(supported_compute_environments_ : compute_environments)
    ~supported_data_operations:(supported_data_operations_ : data_operations)
    ~supported_authentication_types:(supported_authentication_types_ : authentication_types) () =
  ({
     supported_compute_environments = supported_compute_environments_;
     supported_data_operations = supported_data_operations_;
     supported_authentication_types = supported_authentication_types_;
   }
    : capabilities)

let make_connection_type_variant ?logo_url:(logo_url_ : url_string option)
    ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option)
    ?connection_type_variant_name:(connection_type_variant_name_ : display_name option) () =
  ({
     logo_url = logo_url_;
     description = description_;
     display_name = display_name_;
     connection_type_variant_name = connection_type_variant_name_;
   }
    : connection_type_variant)

let make_connection_type_brief
    ?connection_type_variants:(connection_type_variants_ : connection_type_variant_list option)
    ?logo_url:(logo_url_ : url_string option) ?capabilities:(capabilities_ : capabilities option)
    ?categories:(categories_ : list_of_string option)
    ?description:(description_ : description option) ?vendor:(vendor_ : vendor option)
    ?display_name:(display_name_ : display_name option)
    ?connection_type:(connection_type_ : connection_type option) () =
  ({
     connection_type_variants = connection_type_variants_;
     logo_url = logo_url_;
     capabilities = capabilities_;
     categories = categories_;
     description = description_;
     vendor = vendor_;
     display_name = display_name_;
     connection_type = connection_type_;
   }
    : connection_type_brief)

let make_list_connection_types_response ?next_token:(next_token_ : next_token option)
    ?connection_types:(connection_types_ : connection_type_list option) () =
  ({ next_token = next_token_; connection_types = connection_types_ }
    : list_connection_types_response)

let make_list_connection_types_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_connection_types_request)

let make_list_column_statistics_task_runs_response ?next_token:(next_token_ : token option)
    ?column_statistics_task_run_ids:
      (column_statistics_task_run_ids_ : column_statistics_task_run_id_list option) () =
  ({ next_token = next_token_; column_statistics_task_run_ids = column_statistics_task_run_ids_ }
    : list_column_statistics_task_runs_response)

let make_list_column_statistics_task_runs_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_column_statistics_task_runs_request)

let make_list_blueprints_response ?next_token:(next_token_ : generic_string option)
    ?blueprints:(blueprints_ : blueprint_names option) () =
  ({ next_token = next_token_; blueprints = blueprints_ } : list_blueprints_response)

let make_list_blueprints_request ?tags:(tags_ : tags_map option)
    ?max_results:(max_results_ : orchestration_page_size25 option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ tags = tags_; max_results = max_results_; next_token = next_token_ } : list_blueprints_request)

let make_asset_type_item ?name:(name_ : asset_type_name option) ?id:(id_ : asset_type_id option) ()
    =
  ({ name = name_; id = id_ } : asset_type_item)

let make_list_asset_types_response ?next_token:(next_token_ : token option)
    ?items:(items_ : asset_type_item_list option) () =
  ({ next_token = next_token_; items = items_ } : list_asset_types_response)

let make_list_asset_types_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_asset_types_request)

let make_last_crawl_info ?start_time:(start_time_ : timestamp option)
    ?message_prefix:(message_prefix_ : message_prefix option)
    ?log_stream:(log_stream_ : log_stream option) ?log_group:(log_group_ : log_group option)
    ?error_message:(error_message_ : description_string option)
    ?status:(status_ : last_crawl_status option) () =
  ({
     start_time = start_time_;
     message_prefix = message_prefix_;
     log_stream = log_stream_;
     log_group = log_group_;
     error_message = error_message_;
     status = status_;
   }
    : last_crawl_info)

let make_last_active_definition
    ?blueprint_service_location:(blueprint_service_location_ : generic_string option)
    ?blueprint_location:(blueprint_location_ : generic_string option)
    ?parameter_spec:(parameter_spec_ : blueprint_parameter_spec option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?description:(description_ : generic512_char_string option) () =
  ({
     blueprint_service_location = blueprint_service_location_;
     blueprint_location = blueprint_location_;
     parameter_spec = parameter_spec_;
     last_modified_on = last_modified_on_;
     description = description_;
   }
    : last_active_definition)

let make_json_classifier ?version:(version_ : version_id option)
    ?last_updated:(last_updated_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ~json_path:(json_path_ : json_path)
    ~name:(name_ : name_string) () =
  ({
     json_path = json_path_;
     version = version_;
     last_updated = last_updated_;
     creation_time = creation_time_;
     name = name_;
   }
    : json_classifier)

let make_job ?profile_name:(profile_name_ : name_string option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?source_control_details:(source_control_details_ : source_control_details option)
    ?execution_class:(execution_class_ : execution_class option)
    ?code_gen_configuration_nodes:
      (code_gen_configuration_nodes_ : code_gen_configuration_nodes option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?max_capacity:(max_capacity_ : nullable_double option) ?timeout:(timeout_ : timeout option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?max_retries:(max_retries_ : max_retries option)
    ?connections:(connections_ : connections_list option)
    ?non_overridable_arguments:(non_overridable_arguments_ : generic_map option)
    ?default_arguments:(default_arguments_ : generic_map option)
    ?command:(command_ : job_command option)
    ?execution_property:(execution_property_ : execution_property option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?created_on:(created_on_ : timestamp_value option) ?role:(role_ : role_string option)
    ?log_uri:(log_uri_ : uri_string option) ?description:(description_ : description_string option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?job_mode:(job_mode_ : job_mode option) ?name:(name_ : name_string option) () =
  ({
     profile_name = profile_name_;
     maintenance_window = maintenance_window_;
     source_control_details = source_control_details_;
     execution_class = execution_class_;
     code_gen_configuration_nodes = code_gen_configuration_nodes_;
     glue_version = glue_version_;
     notification_property = notification_property_;
     security_configuration = security_configuration_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     max_capacity = max_capacity_;
     timeout = timeout_;
     allocated_capacity = allocated_capacity_;
     max_retries = max_retries_;
     connections = connections_;
     non_overridable_arguments = non_overridable_arguments_;
     default_arguments = default_arguments_;
     command = command_;
     execution_property = execution_property_;
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     role = role_;
     log_uri = log_uri_;
     description = description_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     job_mode = job_mode_;
     name = name_;
   }
    : job)

let make_iterable_form_entry ?form_type_id:(form_type_id_ : form_type_id option) () =
  ({ form_type_id = form_type_id_ } : iterable_form_entry)

let make_iterable_form_item ?attachments:(attachments_ : asset_form_map option)
    ?forms:(forms_ : asset_form_map option)
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option)
    ?item_name:(item_name_ : item_name option) ?item_id:(item_id_ : item_id option) () =
  ({
     attachments = attachments_;
     forms = forms_;
     glossary_terms = glossary_terms_;
     item_name = item_name_;
     item_id = item_id_;
   }
    : iterable_form_item)

let make_item_error ?message:(message_ : item_error_message option)
    ?code:(code_ : item_error_code option)
    ?item_identifier:(item_identifier_ : item_identifier option) () =
  ({ message = message_; code = code_; item_identifier = item_identifier_ } : item_error)

let make_integration ?data_filter:(data_filter_ : string2048 option)
    ?errors:(errors_ : integration_error_list option)
    ?integration_config:(integration_config_ : integration_config option)
    ?tags:(tags_ : integration_tags_list option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?description:(description_ : integration_description option)
    ~create_time:(create_time_ : integration_timestamp) ~status:(status_ : integration_status)
    ~integration_arn:(integration_arn_ : string128)
    ~integration_name:(integration_name_ : string128) ~target_arn:(target_arn_ : string512)
    ~source_arn:(source_arn_ : string512) () =
  ({
     data_filter = data_filter_;
     errors = errors_;
     integration_config = integration_config_;
     create_time = create_time_;
     status = status_;
     tags = tags_;
     additional_encryption_context = additional_encryption_context_;
     kms_key_id = kms_key_id_;
     integration_arn = integration_arn_;
     integration_name = integration_name_;
     description = description_;
     target_arn = target_arn_;
     source_arn = source_arn_;
   }
    : integration)

let make_integration_filter ?values:(values_ : integration_filter_values option)
    ?name:(name_ : string128 option) () =
  ({ values = values_; name = name_ } : integration_filter)

let make_datapoint_inclusion_annotation
    ?inclusion_annotation:(inclusion_annotation_ : inclusion_annotation_value option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?profile_id:(profile_id_ : hash_string option) () =
  ({
     inclusion_annotation = inclusion_annotation_;
     statistic_id = statistic_id_;
     profile_id = profile_id_;
   }
    : datapoint_inclusion_annotation)

let make_inbound_integration ?errors:(errors_ : integration_error_list option)
    ?integration_config:(integration_config_ : integration_config option)
    ~create_time:(create_time_ : integration_timestamp) ~status:(status_ : integration_status)
    ~integration_arn:(integration_arn_ : string128) ~target_arn:(target_arn_ : string512)
    ~source_arn:(source_arn_ : string512) () =
  ({
     errors = errors_;
     integration_config = integration_config_;
     create_time = create_time_;
     status = status_;
     integration_arn = integration_arn_;
     target_arn = target_arn_;
     source_arn = source_arn_;
   }
    : inbound_integration)

let make_import_catalog_to_glue_response () = (() : unit)

let make_import_catalog_to_glue_request ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ catalog_id = catalog_id_ } : import_catalog_to_glue_request)

let make_iceberg_optimization_properties_output
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?orphan_file_deletion:(orphan_file_deletion_ : parameters_map option)
    ?retention:(retention_ : parameters_map option)
    ?compaction:(compaction_ : parameters_map option) ?role_arn:(role_arn_ : iam_role_arn option) ()
    =
  ({
     last_updated_time = last_updated_time_;
     orphan_file_deletion = orphan_file_deletion_;
     retention = retention_;
     compaction = compaction_;
     role_arn = role_arn_;
   }
    : iceberg_optimization_properties_output)

let make_grok_classifier ?custom_patterns:(custom_patterns_ : custom_patterns option)
    ?version:(version_ : version_id option) ?last_updated:(last_updated_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ~grok_pattern:(grok_pattern_ : grok_pattern)
    ~classification:(classification_ : classification) ~name:(name_ : name_string) () =
  ({
     custom_patterns = custom_patterns_;
     grok_pattern = grok_pattern_;
     version = version_;
     last_updated = last_updated_;
     creation_time = creation_time_;
     classification = classification_;
     name = name_;
   }
    : grok_classifier)

let make_glue_policy ?update_time:(update_time_ : timestamp option)
    ?create_time:(create_time_ : timestamp option) ?policy_hash:(policy_hash_ : hash_string option)
    ?policy_in_json:(policy_in_json_ : policy_json_string option) () =
  ({
     update_time = update_time_;
     create_time = create_time_;
     policy_hash = policy_hash_;
     policy_in_json = policy_in_json_;
   }
    : glue_policy)

let make_get_workflow_runs_response ?next_token:(next_token_ : generic_string option)
    ?runs:(runs_ : workflow_runs option) () =
  ({ next_token = next_token_; runs = runs_ } : get_workflow_runs_response)

let make_get_workflow_runs_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : generic_string option)
    ?include_graph:(include_graph_ : nullable_boolean option) ~name:(name_ : name_string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     include_graph = include_graph_;
     name = name_;
   }
    : get_workflow_runs_request)

let make_get_workflow_run_response ?run:(run_ : workflow_run option) () =
  ({ run = run_ } : get_workflow_run_response)

let make_get_workflow_run_request ?include_graph:(include_graph_ : nullable_boolean option)
    ~run_id:(run_id_ : id_string) ~name:(name_ : name_string) () =
  ({ include_graph = include_graph_; run_id = run_id_; name = name_ } : get_workflow_run_request)

let make_get_workflow_run_properties_response
    ?run_properties:(run_properties_ : workflow_run_properties option) () =
  ({ run_properties = run_properties_ } : get_workflow_run_properties_response)

let make_get_workflow_run_properties_request ~run_id:(run_id_ : id_string)
    ~name:(name_ : name_string) () =
  ({ run_id = run_id_; name = name_ } : get_workflow_run_properties_request)

let make_get_workflow_response ?workflow:(workflow_ : workflow option) () =
  ({ workflow = workflow_ } : get_workflow_response)

let make_get_workflow_request ?include_graph:(include_graph_ : nullable_boolean option)
    ~name:(name_ : name_string) () =
  ({ include_graph = include_graph_; name = name_ } : get_workflow_request)

let make_get_user_defined_functions_response ?next_token:(next_token_ : token option)
    ?user_defined_functions:(user_defined_functions_ : user_defined_function_list option) () =
  ({ next_token = next_token_; user_defined_functions = user_defined_functions_ }
    : get_user_defined_functions_response)

let make_get_user_defined_functions_request
    ?max_results:(max_results_ : catalog_getter_page_size option)
    ?next_token:(next_token_ : token option) ?function_type:(function_type_ : function_type option)
    ?database_name:(database_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~pattern:(pattern_ : name_string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     function_type = function_type_;
     pattern = pattern_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_user_defined_functions_request)

let make_get_user_defined_function_response
    ?user_defined_function:(user_defined_function_ : user_defined_function option) () =
  ({ user_defined_function = user_defined_function_ } : get_user_defined_function_response)

let make_get_user_defined_function_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~function_name:(function_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({ function_name = function_name_; database_name = database_name_; catalog_id = catalog_id_ }
    : get_user_defined_function_request)

let make_get_usage_profile_response ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?created_on:(created_on_ : timestamp_value option)
    ?configuration:(configuration_ : profile_configuration option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     configuration = configuration_;
     description = description_;
     name = name_;
   }
    : get_usage_profile_response)

let make_get_usage_profile_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_usage_profile_request)

let make_column_row_filter ?row_filter_expression:(row_filter_expression_ : predicate_string option)
    ?column_name:(column_name_ : name_string option) () =
  ({ row_filter_expression = row_filter_expression_; column_name = column_name_ }
    : column_row_filter)

let make_get_unfiltered_table_metadata_response ?row_filter:(row_filter_ : predicate_string option)
    ?permissions:(permissions_ : permission_list option)
    ?is_protected:(is_protected_ : boolean_ option)
    ?resource_arn:(resource_arn_ : arn_string option)
    ?is_materialized_view:(is_materialized_view_ : boolean_ option)
    ?is_multi_dialect_view:(is_multi_dialect_view_ : boolean_ option)
    ?query_authorization_id:(query_authorization_id_ : hash_string option)
    ?cell_filters:(cell_filters_ : column_row_filter_list option)
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option)
    ?authorized_columns:(authorized_columns_ : name_string_list option)
    ?table:(table_ : table option) () =
  ({
     row_filter = row_filter_;
     permissions = permissions_;
     is_protected = is_protected_;
     resource_arn = resource_arn_;
     is_materialized_view = is_materialized_view_;
     is_multi_dialect_view = is_multi_dialect_view_;
     query_authorization_id = query_authorization_id_;
     cell_filters = cell_filters_;
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
     authorized_columns = authorized_columns_;
     table = table_;
   }
    : get_unfiltered_table_metadata_response)

let make_audit_context ?all_columns_requested:(all_columns_requested_ : nullable_boolean option)
    ?requested_columns:(requested_columns_ : audit_column_names_list option)
    ?additional_audit_context:(additional_audit_context_ : audit_context_string option) () =
  ({
     all_columns_requested = all_columns_requested_;
     requested_columns = requested_columns_;
     additional_audit_context = additional_audit_context_;
   }
    : audit_context)

let make_get_unfiltered_table_metadata_request
    ?query_session_context:(query_session_context_ : query_session_context option)
    ?permissions:(permissions_ : permission_list option)
    ?supported_dialect:(supported_dialect_ : supported_dialect option)
    ?root_resource_arn:(root_resource_arn_ : arn_string option)
    ?parent_resource_arn:(parent_resource_arn_ : arn_string option)
    ?audit_context:(audit_context_ : audit_context option) ?region:(region_ : value_string option)
    ~supported_permission_types:(supported_permission_types_ : permission_type_list)
    ~name:(name_ : name_string) ~database_name:(database_name_ : name_string)
    ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     query_session_context = query_session_context_;
     permissions = permissions_;
     supported_dialect = supported_dialect_;
     root_resource_arn = root_resource_arn_;
     parent_resource_arn = parent_resource_arn_;
     supported_permission_types = supported_permission_types_;
     audit_context = audit_context_;
     name = name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
     region = region_;
   }
    : get_unfiltered_table_metadata_request)

let make_get_unfiltered_partitions_metadata_response ?next_token:(next_token_ : token option)
    ?unfiltered_partitions:(unfiltered_partitions_ : unfiltered_partition_list option) () =
  ({ next_token = next_token_; unfiltered_partitions = unfiltered_partitions_ }
    : get_unfiltered_partitions_metadata_response)

let make_get_unfiltered_partitions_metadata_request
    ?query_session_context:(query_session_context_ : query_session_context option)
    ?max_results:(max_results_ : page_size option) ?segment:(segment_ : segment option)
    ?next_token:(next_token_ : token option) ?audit_context:(audit_context_ : audit_context option)
    ?expression:(expression_ : predicate_string option) ?region:(region_ : value_string option)
    ~supported_permission_types:(supported_permission_types_ : permission_type_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string)
    ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     query_session_context = query_session_context_;
     max_results = max_results_;
     segment = segment_;
     next_token = next_token_;
     supported_permission_types = supported_permission_types_;
     audit_context = audit_context_;
     expression = expression_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
     region = region_;
   }
    : get_unfiltered_partitions_metadata_request)

let make_get_unfiltered_partition_metadata_response
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option)
    ?authorized_columns:(authorized_columns_ : name_string_list option)
    ?partition:(partition_ : partition option) () =
  ({
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
     authorized_columns = authorized_columns_;
     partition = partition_;
   }
    : get_unfiltered_partition_metadata_response)

let make_get_unfiltered_partition_metadata_request
    ?query_session_context:(query_session_context_ : query_session_context option)
    ?audit_context:(audit_context_ : audit_context option) ?region:(region_ : value_string option)
    ~supported_permission_types:(supported_permission_types_ : permission_type_list)
    ~partition_values:(partition_values_ : value_string_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string)
    ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     query_session_context = query_session_context_;
     supported_permission_types = supported_permission_types_;
     audit_context = audit_context_;
     partition_values = partition_values_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
     region = region_;
   }
    : get_unfiltered_partition_metadata_request)

let make_get_triggers_response ?next_token:(next_token_ : generic_string option)
    ?triggers:(triggers_ : trigger_list option) () =
  ({ next_token = next_token_; triggers = triggers_ } : get_triggers_response)

let make_get_triggers_request ?max_results:(max_results_ : orchestration_page_size200 option)
    ?dependent_job_name:(dependent_job_name_ : name_string option)
    ?next_token:(next_token_ : generic_string option) () =
  ({
     max_results = max_results_;
     dependent_job_name = dependent_job_name_;
     next_token = next_token_;
   }
    : get_triggers_request)

let make_get_trigger_response ?trigger:(trigger_ : trigger option) () =
  ({ trigger = trigger_ } : get_trigger_response)

let make_get_trigger_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_trigger_request)

let make_get_tags_response ?tags:(tags_ : tags_map option) () =
  ({ tags = tags_ } : get_tags_response)

let make_get_tags_request ~resource_arn:(resource_arn_ : glue_resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_tags_request)

let make_get_tables_response ?next_token:(next_token_ : token option)
    ?table_list:(table_list_ : table_list option) () =
  ({ next_token = next_token_; table_list = table_list_ } : get_tables_response)

let make_get_tables_request ?attributes_to_get:(attributes_to_get_ : table_attributes_list option)
    ?include_status_details:(include_status_details_ : boolean_nullable option)
    ?audit_context:(audit_context_ : audit_context option)
    ?query_as_of_time:(query_as_of_time_ : timestamp option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?max_results:(max_results_ : catalog_getter_page_size option)
    ?next_token:(next_token_ : token option) ?expression:(expression_ : filter_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) () =
  ({
     attributes_to_get = attributes_to_get_;
     include_status_details = include_status_details_;
     audit_context = audit_context_;
     query_as_of_time = query_as_of_time_;
     transaction_id = transaction_id_;
     max_results = max_results_;
     next_token = next_token_;
     expression = expression_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_tables_request)

let make_get_table_versions_response ?next_token:(next_token_ : token option)
    ?table_versions:(table_versions_ : get_table_versions_list option) () =
  ({ next_token = next_token_; table_versions = table_versions_ } : get_table_versions_response)

let make_get_table_versions_request ?audit_context:(audit_context_ : audit_context option)
    ?max_results:(max_results_ : catalog_getter_page_size option)
    ?next_token:(next_token_ : token option) ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     audit_context = audit_context_;
     max_results = max_results_;
     next_token = next_token_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_table_versions_request)

let make_get_table_version_response ?table_version:(table_version_ : table_version option) () =
  ({ table_version = table_version_ } : get_table_version_response)

let make_get_table_version_request ?audit_context:(audit_context_ : audit_context option)
    ?version_id:(version_id_ : version_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     audit_context = audit_context_;
     version_id = version_id_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_table_version_request)

let make_get_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : get_table_response)

let make_get_table_request ?attributes_to_get:(attributes_to_get_ : table_attributes_list option)
    ?include_status_details:(include_status_details_ : boolean_nullable option)
    ?audit_context:(audit_context_ : audit_context option)
    ?query_as_of_time:(query_as_of_time_ : timestamp option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~name:(name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     attributes_to_get = attributes_to_get_;
     include_status_details = include_status_details_;
     audit_context = audit_context_;
     query_as_of_time = query_as_of_time_;
     transaction_id = transaction_id_;
     name = name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_table_request)

let make_get_table_optimizer_response ?table_optimizer:(table_optimizer_ : table_optimizer option)
    ?table_name:(table_name_ : name_string option)
    ?database_name:(database_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     table_optimizer = table_optimizer_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_table_optimizer_response)

let make_get_table_optimizer_request ~type_:(type__ : table_optimizer_type)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string)
    ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     type_ = type__;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_table_optimizer_request)

let make_get_statement_response ?statement:(statement_ : statement option) () =
  ({ statement = statement_ } : get_statement_response)

let make_get_statement_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~id:(id_ : integer_value) ~session_id:(session_id_ : name_string) () =
  ({ request_origin = request_origin_; id = id_; session_id = session_id_ } : get_statement_request)

let make_get_session_response ?session:(session_ : session option) () =
  ({ session = session_ } : get_session_response)

let make_get_session_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~id:(id_ : name_string) () =
  ({ request_origin = request_origin_; id = id_ } : get_session_request)

let make_get_session_endpoint_response ~spark_connect:(spark_connect_ : session_endpoint) () =
  ({ spark_connect = spark_connect_ } : get_session_endpoint_response)

let make_get_session_endpoint_request ~session_id:(session_id_ : name_string) () =
  ({ session_id = session_id_ } : get_session_endpoint_request)

let make_get_security_configurations_response ?next_token:(next_token_ : generic_string option)
    ?security_configurations:(security_configurations_ : security_configuration_list option) () =
  ({ next_token = next_token_; security_configurations = security_configurations_ }
    : get_security_configurations_response)

let make_get_security_configurations_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : get_security_configurations_request)

let make_get_security_configuration_response
    ?security_configuration:(security_configuration_ : security_configuration option) () =
  ({ security_configuration = security_configuration_ } : get_security_configuration_response)

let make_get_security_configuration_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_security_configuration_request)

let make_get_schema_versions_diff_response ?diff:(diff_ : schema_definition_diff option) () =
  ({ diff = diff_ } : get_schema_versions_diff_response)

let make_get_schema_versions_diff_input ~schema_diff_type:(schema_diff_type_ : schema_diff_type)
    ~second_schema_version_number:(second_schema_version_number_ : schema_version_number)
    ~first_schema_version_number:(first_schema_version_number_ : schema_version_number)
    ~schema_id:(schema_id_ : schema_id) () =
  ({
     schema_diff_type = schema_diff_type_;
     second_schema_version_number = second_schema_version_number_;
     first_schema_version_number = first_schema_version_number_;
     schema_id = schema_id_;
   }
    : get_schema_versions_diff_input)

let make_get_schema_version_response ?created_time:(created_time_ : created_timestamp option)
    ?status:(status_ : schema_version_status option)
    ?version_number:(version_number_ : version_long_number option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?data_format:(data_format_ : data_format option)
    ?schema_definition:(schema_definition_ : schema_definition_string option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option) () =
  ({
     created_time = created_time_;
     status = status_;
     version_number = version_number_;
     schema_arn = schema_arn_;
     data_format = data_format_;
     schema_definition = schema_definition_;
     schema_version_id = schema_version_id_;
   }
    : get_schema_version_response)

let make_get_schema_version_input
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_id:(schema_id_ : schema_id option) () =
  ({
     schema_version_number = schema_version_number_;
     schema_version_id = schema_version_id_;
     schema_id = schema_id_;
   }
    : get_schema_version_input)

let make_get_schema_response ?updated_time:(updated_time_ : updated_timestamp option)
    ?created_time:(created_time_ : created_timestamp option)
    ?schema_status:(schema_status_ : schema_status option)
    ?next_schema_version:(next_schema_version_ : version_long_number option)
    ?latest_schema_version:(latest_schema_version_ : version_long_number option)
    ?schema_checkpoint:(schema_checkpoint_ : schema_checkpoint_number option)
    ?compatibility:(compatibility_ : compatibility option)
    ?data_format:(data_format_ : data_format option)
    ?description:(description_ : description_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({
     updated_time = updated_time_;
     created_time = created_time_;
     schema_status = schema_status_;
     next_schema_version = next_schema_version_;
     latest_schema_version = latest_schema_version_;
     schema_checkpoint = schema_checkpoint_;
     compatibility = compatibility_;
     data_format = data_format_;
     description = description_;
     schema_arn = schema_arn_;
     schema_name = schema_name_;
     registry_arn = registry_arn_;
     registry_name = registry_name_;
   }
    : get_schema_response)

let make_get_schema_input ~schema_id:(schema_id_ : schema_id) () =
  ({ schema_id = schema_id_ } : get_schema_input)

let make_get_schema_by_definition_response ?created_time:(created_time_ : created_timestamp option)
    ?status:(status_ : schema_version_status option)
    ?data_format:(data_format_ : data_format option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option) () =
  ({
     created_time = created_time_;
     status = status_;
     data_format = data_format_;
     schema_arn = schema_arn_;
     schema_version_id = schema_version_id_;
   }
    : get_schema_by_definition_response)

let make_get_schema_by_definition_input
    ~schema_definition:(schema_definition_ : schema_definition_string)
    ~schema_id:(schema_id_ : schema_id) () =
  ({ schema_definition = schema_definition_; schema_id = schema_id_ }
    : get_schema_by_definition_input)

let make_get_resource_policy_response ?update_time:(update_time_ : timestamp option)
    ?create_time:(create_time_ : timestamp option) ?policy_hash:(policy_hash_ : hash_string option)
    ?policy_in_json:(policy_in_json_ : policy_json_string option) () =
  ({
     update_time = update_time_;
     create_time = create_time_;
     policy_hash = policy_hash_;
     policy_in_json = policy_in_json_;
   }
    : get_resource_policy_response)

let make_get_resource_policy_request ?resource_arn:(resource_arn_ : glue_resource_arn option) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_get_resource_policies_response ?next_token:(next_token_ : token option)
    ?get_resource_policies_response_list:
      (get_resource_policies_response_list_ : get_resource_policies_response_list option) () =
  ({
     next_token = next_token_;
     get_resource_policies_response_list = get_resource_policies_response_list_;
   }
    : get_resource_policies_response)

let make_get_resource_policies_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : get_resource_policies_request)

let make_get_registry_response ?updated_time:(updated_time_ : updated_timestamp option)
    ?created_time:(created_time_ : created_timestamp option)
    ?status:(status_ : registry_status option)
    ?description:(description_ : description_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({
     updated_time = updated_time_;
     created_time = created_time_;
     status = status_;
     description = description_;
     registry_arn = registry_arn_;
     registry_name = registry_name_;
   }
    : get_registry_response)

let make_get_registry_input ~registry_id:(registry_id_ : registry_id) () =
  ({ registry_id = registry_id_ } : get_registry_input)

let make_get_plan_response ?scala_code:(scala_code_ : scala_code option)
    ?python_script:(python_script_ : python_script option) () =
  ({ scala_code = scala_code_; python_script = python_script_ } : get_plan_response)

let make_catalog_entry ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({ table_name = table_name_; database_name = database_name_ } : catalog_entry)

let make_get_plan_request
    ?additional_plan_options_map:(additional_plan_options_map_ : additional_plan_options_map option)
    ?language:(language_ : language option) ?location:(location_ : location option)
    ?sinks:(sinks_ : catalog_entries option) ~source:(source_ : catalog_entry)
    ~mapping:(mapping_ : mapping_list) () =
  ({
     additional_plan_options_map = additional_plan_options_map_;
     language = language_;
     location = location_;
     sinks = sinks_;
     source = source_;
     mapping = mapping_;
   }
    : get_plan_request)

let make_get_partitions_response ?next_token:(next_token_ : token option)
    ?partitions:(partitions_ : partition_list option) () =
  ({ next_token = next_token_; partitions = partitions_ } : get_partitions_response)

let make_get_partitions_request ?audit_context:(audit_context_ : audit_context option)
    ?query_as_of_time:(query_as_of_time_ : timestamp option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?exclude_column_schema:(exclude_column_schema_ : boolean_nullable option)
    ?max_results:(max_results_ : page_size option) ?segment:(segment_ : segment option)
    ?next_token:(next_token_ : token option) ?expression:(expression_ : predicate_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     audit_context = audit_context_;
     query_as_of_time = query_as_of_time_;
     transaction_id = transaction_id_;
     exclude_column_schema = exclude_column_schema_;
     max_results = max_results_;
     segment = segment_;
     next_token = next_token_;
     expression = expression_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_partitions_request)

let make_get_partition_response ?partition:(partition_ : partition option) () =
  ({ partition = partition_ } : get_partition_response)

let make_get_partition_request ?audit_context:(audit_context_ : audit_context option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partition_values:(partition_values_ : value_string_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     audit_context = audit_context_;
     partition_values = partition_values_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_partition_request)

let make_get_partition_indexes_response ?next_token:(next_token_ : token option)
    ?partition_index_descriptor_list:
      (partition_index_descriptor_list_ : partition_index_descriptor_list option) () =
  ({ next_token = next_token_; partition_index_descriptor_list = partition_index_descriptor_list_ }
    : get_partition_indexes_response)

let make_get_partition_indexes_request ?next_token:(next_token_ : token option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     next_token = next_token_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_partition_indexes_request)

let make_get_materialized_view_refresh_task_run_response
    ?materialized_view_refresh_task_run:
      (materialized_view_refresh_task_run_ : materialized_view_refresh_task_run option) () =
  ({ materialized_view_refresh_task_run = materialized_view_refresh_task_run_ }
    : get_materialized_view_refresh_task_run_response)

let make_get_materialized_view_refresh_task_run_request
    ~materialized_view_refresh_task_run_id:(materialized_view_refresh_task_run_id_ : uui_dv4)
    ~catalog_id:(catalog_id_ : name_string) () =
  ({
     materialized_view_refresh_task_run_id = materialized_view_refresh_task_run_id_;
     catalog_id = catalog_id_;
   }
    : get_materialized_view_refresh_task_run_request)

let make_get_mapping_response ~mapping:(mapping_ : mapping_list) () =
  ({ mapping = mapping_ } : get_mapping_response)

let make_get_mapping_request ?location:(location_ : location option)
    ?sinks:(sinks_ : catalog_entries option) ~source:(source_ : catalog_entry) () =
  ({ location = location_; sinks = sinks_; source = source_ } : get_mapping_request)

let make_get_ml_transforms_response ?next_token:(next_token_ : pagination_token option)
    ~transforms:(transforms_ : transform_list) () =
  ({ next_token = next_token_; transforms = transforms_ } : get_ml_transforms_response)

let make_get_ml_transforms_request ?sort:(sort_ : transform_sort_criteria option)
    ?filter:(filter_ : transform_filter_criteria option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ sort = sort_; filter = filter_; max_results = max_results_; next_token = next_token_ }
    : get_ml_transforms_request)

let make_get_ml_transform_response
    ?transform_encryption:(transform_encryption_ : transform_encryption option)
    ?max_retries:(max_retries_ : nullable_integer option) ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?glue_version:(glue_version_ : glue_version_string option) ?role:(role_ : role_string option)
    ?schema:(schema_ : transform_schema option) ?label_count:(label_count_ : label_count option)
    ?evaluation_metrics:(evaluation_metrics_ : evaluation_metrics option)
    ?parameters:(parameters_ : transform_parameters option)
    ?input_record_tables:(input_record_tables_ : glue_tables option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?created_on:(created_on_ : timestamp option) ?status:(status_ : transform_status_type option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option)
    ?transform_id:(transform_id_ : hash_string option) () =
  ({
     transform_encryption = transform_encryption_;
     max_retries = max_retries_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     max_capacity = max_capacity_;
     glue_version = glue_version_;
     role = role_;
     schema = schema_;
     label_count = label_count_;
     evaluation_metrics = evaluation_metrics_;
     parameters = parameters_;
     input_record_tables = input_record_tables_;
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     status = status_;
     description = description_;
     name = name_;
     transform_id = transform_id_;
   }
    : get_ml_transform_response)

let make_get_ml_transform_request ~transform_id:(transform_id_ : hash_string) () =
  ({ transform_id = transform_id_ } : get_ml_transform_request)

let make_get_ml_task_runs_response ?next_token:(next_token_ : pagination_token option)
    ?task_runs:(task_runs_ : task_run_list option) () =
  ({ next_token = next_token_; task_runs = task_runs_ } : get_ml_task_runs_response)

let make_get_ml_task_runs_request ?sort:(sort_ : task_run_sort_criteria option)
    ?filter:(filter_ : task_run_filter_criteria option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) ~transform_id:(transform_id_ : hash_string)
    () =
  ({
     sort = sort_;
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
     transform_id = transform_id_;
   }
    : get_ml_task_runs_request)

let make_get_ml_task_run_response ?execution_time:(execution_time_ : execution_time option)
    ?completed_on:(completed_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?started_on:(started_on_ : timestamp option)
    ?error_string:(error_string_ : generic_string option)
    ?properties:(properties_ : task_run_properties option)
    ?log_group_name:(log_group_name_ : generic_string option)
    ?status:(status_ : task_status_type option) ?task_run_id:(task_run_id_ : hash_string option)
    ?transform_id:(transform_id_ : hash_string option) () =
  ({
     execution_time = execution_time_;
     completed_on = completed_on_;
     last_modified_on = last_modified_on_;
     started_on = started_on_;
     error_string = error_string_;
     properties = properties_;
     log_group_name = log_group_name_;
     status = status_;
     task_run_id = task_run_id_;
     transform_id = transform_id_;
   }
    : get_ml_task_run_response)

let make_get_ml_task_run_request ~task_run_id:(task_run_id_ : hash_string)
    ~transform_id:(transform_id_ : hash_string) () =
  ({ task_run_id = task_run_id_; transform_id = transform_id_ } : get_ml_task_run_request)

let make_get_jobs_response ?next_token:(next_token_ : generic_string option)
    ?jobs:(jobs_ : job_list option) () =
  ({ next_token = next_token_; jobs = jobs_ } : get_jobs_response)

let make_get_jobs_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : get_jobs_request)

let make_get_job_runs_response ?next_token:(next_token_ : generic_string option)
    ?job_runs:(job_runs_ : job_run_list option) () =
  ({ next_token = next_token_; job_runs = job_runs_ } : get_job_runs_response)

let make_get_job_runs_request ?max_results:(max_results_ : orchestration_page_size200 option)
    ?next_token:(next_token_ : generic_string option) ~job_name:(job_name_ : name_string) () =
  ({ max_results = max_results_; next_token = next_token_; job_name = job_name_ }
    : get_job_runs_request)

let make_get_job_run_response ?job_run:(job_run_ : job_run option) () =
  ({ job_run = job_run_ } : get_job_run_response)

let make_get_job_run_request ?predecessors_included:(predecessors_included_ : boolean_value option)
    ~run_id:(run_id_ : id_string) ~job_name:(job_name_ : name_string) () =
  ({ predecessors_included = predecessors_included_; run_id = run_id_; job_name = job_name_ }
    : get_job_run_request)

let make_get_job_response ?job:(job_ : job option) () = ({ job = job_ } : get_job_response)

let make_get_job_request ~job_name:(job_name_ : name_string) () =
  ({ job_name = job_name_ } : get_job_request)

let make_get_job_bookmark_response
    ?job_bookmark_entry:(job_bookmark_entry_ : job_bookmark_entry option) () =
  ({ job_bookmark_entry = job_bookmark_entry_ } : get_job_bookmark_response)

let make_get_job_bookmark_request ?run_id:(run_id_ : run_id option) ~job_name:(job_name_ : job_name)
    () =
  ({ run_id = run_id_; job_name = job_name_ } : get_job_bookmark_request)

let make_get_integration_table_properties_response
    ?target_table_config:(target_table_config_ : target_table_config option)
    ?source_table_config:(source_table_config_ : source_table_config option)
    ?table_name:(table_name_ : string128 option) ?resource_arn:(resource_arn_ : string512 option) ()
    =
  ({
     target_table_config = target_table_config_;
     source_table_config = source_table_config_;
     table_name = table_name_;
     resource_arn = resource_arn_;
   }
    : get_integration_table_properties_response)

let make_get_integration_table_properties_request ~table_name:(table_name_ : string128)
    ~resource_arn:(resource_arn_ : string512) () =
  ({ table_name = table_name_; resource_arn = resource_arn_ }
    : get_integration_table_properties_request)

let make_get_integration_resource_property_response
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ?resource_arn:(resource_arn_ : string512 option) () =
  ({
     target_processing_properties = target_processing_properties_;
     source_processing_properties = source_processing_properties_;
     resource_property_arn = resource_property_arn_;
     resource_arn = resource_arn_;
   }
    : get_integration_resource_property_response)

let make_get_integration_resource_property_request ~resource_arn:(resource_arn_ : string512) () =
  ({ resource_arn = resource_arn_ } : get_integration_resource_property_request)

let make_get_glue_identity_center_configuration_response
    ?user_background_sessions_enabled:(user_background_sessions_enabled_ : nullable_boolean option)
    ?scopes:(scopes_ : orchestration_string_list option)
    ?instance_arn:(instance_arn_ : identity_center_instance_arn option)
    ?application_arn:(application_arn_ : application_arn option) () =
  ({
     user_background_sessions_enabled = user_background_sessions_enabled_;
     scopes = scopes_;
     instance_arn = instance_arn_;
     application_arn = application_arn_;
   }
    : get_glue_identity_center_configuration_response)

let make_get_glue_identity_center_configuration_request () = (() : unit)

let make_get_glossary_term_response
    ?long_description:(long_description_ : glossary_long_description option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?name:(name_ : glossary_term_name option) ?glossary_id:(glossary_id_ : glossary_id option)
    ?id:(id_ : glossary_term_id option) () =
  ({
     long_description = long_description_;
     short_description = short_description_;
     name = name_;
     glossary_id = glossary_id_;
     id = id_;
   }
    : get_glossary_term_response)

let make_get_glossary_term_request ~identifier:(identifier_ : glossary_term_id) () =
  ({ identifier = identifier_ } : get_glossary_term_request)

let make_get_glossary_response ?description:(description_ : metadata_description option)
    ?name:(name_ : glossary_name option) ?id:(id_ : glossary_id option) () =
  ({ description = description_; name = name_; id = id_ } : get_glossary_response)

let make_get_glossary_request ~identifier:(identifier_ : glossary_id) () =
  ({ identifier = identifier_ } : get_glossary_request)

let make_get_form_type_response ?schema:(schema_ : form_type_schema option)
    ?name:(name_ : form_type_name option) ?id:(id_ : form_type_id option) () =
  ({ schema = schema_; name = name_; id = id_ } : get_form_type_response)

let make_get_form_type_request ~identifier:(identifier_ : form_type_id) () =
  ({ identifier = identifier_ } : get_form_type_request)

let make_get_entity_records_response ?next_token:(next_token_ : next_token option)
    ?records:(records_ : records option) () =
  ({ next_token = next_token_; records = records_ } : get_entity_records_response)

let make_get_entity_records_request ?selected_fields:(selected_fields_ : selected_fields option)
    ?order_by:(order_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?filter_predicate:(filter_predicate_ : filter_predicate option)
    ?connection_options:(connection_options_ : connection_options option)
    ?data_store_api_version:(data_store_api_version_ : api_version option)
    ?next_token:(next_token_ : next_token option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?connection_name:(connection_name_ : name_string option) ~limit:(limit_ : limit)
    ~entity_name:(entity_name_ : entity_name) () =
  ({
     selected_fields = selected_fields_;
     order_by = order_by_;
     limit = limit_;
     filter_predicate = filter_predicate_;
     connection_options = connection_options_;
     data_store_api_version = data_store_api_version_;
     next_token = next_token_;
     entity_name = entity_name_;
     catalog_id = catalog_id_;
     connection_name = connection_name_;
   }
    : get_entity_records_request)

let make_dev_endpoint ?arguments:(arguments_ : map_value option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?public_keys:(public_keys_ : public_keys_list option)
    ?public_key:(public_key_ : generic_string option)
    ?last_modified_timestamp:(last_modified_timestamp_ : timestamp_value option)
    ?created_timestamp:(created_timestamp_ : timestamp_value option)
    ?last_update_status:(last_update_status_ : generic_string option)
    ?failure_reason:(failure_reason_ : generic_string option)
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option)
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option)
    ?vpc_id:(vpc_id_ : generic_string option)
    ?availability_zone:(availability_zone_ : generic_string option)
    ?number_of_nodes:(number_of_nodes_ : integer_value option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?worker_type:(worker_type_ : worker_type option) ?status:(status_ : generic_string option)
    ?public_address:(public_address_ : generic_string option)
    ?zeppelin_remote_spark_interpreter_port:
      (zeppelin_remote_spark_interpreter_port_ : integer_value option)
    ?private_address:(private_address_ : generic_string option)
    ?yarn_endpoint_address:(yarn_endpoint_address_ : generic_string option)
    ?subnet_id:(subnet_id_ : generic_string option)
    ?security_group_ids:(security_group_ids_ : string_list option)
    ?role_arn:(role_arn_ : role_arn option) ?endpoint_name:(endpoint_name_ : generic_string option)
    () =
  ({
     arguments = arguments_;
     security_configuration = security_configuration_;
     public_keys = public_keys_;
     public_key = public_key_;
     last_modified_timestamp = last_modified_timestamp_;
     created_timestamp = created_timestamp_;
     last_update_status = last_update_status_;
     failure_reason = failure_reason_;
     extra_jars_s3_path = extra_jars_s3_path_;
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
     vpc_id = vpc_id_;
     availability_zone = availability_zone_;
     number_of_nodes = number_of_nodes_;
     number_of_workers = number_of_workers_;
     glue_version = glue_version_;
     worker_type = worker_type_;
     status = status_;
     public_address = public_address_;
     zeppelin_remote_spark_interpreter_port = zeppelin_remote_spark_interpreter_port_;
     private_address = private_address_;
     yarn_endpoint_address = yarn_endpoint_address_;
     subnet_id = subnet_id_;
     security_group_ids = security_group_ids_;
     role_arn = role_arn_;
     endpoint_name = endpoint_name_;
   }
    : dev_endpoint)

let make_get_dev_endpoints_response ?next_token:(next_token_ : generic_string option)
    ?dev_endpoints:(dev_endpoints_ : dev_endpoint_list option) () =
  ({ next_token = next_token_; dev_endpoints = dev_endpoints_ } : get_dev_endpoints_response)

let make_get_dev_endpoints_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : get_dev_endpoints_request)

let make_get_dev_endpoint_response ?dev_endpoint:(dev_endpoint_ : dev_endpoint option) () =
  ({ dev_endpoint = dev_endpoint_ } : get_dev_endpoint_response)

let make_get_dev_endpoint_request ~endpoint_name:(endpoint_name_ : generic_string) () =
  ({ endpoint_name = endpoint_name_ } : get_dev_endpoint_request)

let make_code_gen_node ?line_number:(line_number_ : integer option)
    ~args:(args_ : code_gen_node_args) ~node_type:(node_type_ : code_gen_node_type)
    ~id:(id_ : code_gen_identifier) () =
  ({ line_number = line_number_; args = args_; node_type = node_type_; id = id_ } : code_gen_node)

let make_code_gen_edge ?target_parameter:(target_parameter_ : code_gen_arg_name option)
    ~target:(target_ : code_gen_identifier) ~source:(source_ : code_gen_identifier) () =
  ({ target_parameter = target_parameter_; target = target_; source = source_ } : code_gen_edge)

let make_get_dataflow_graph_response ?dag_edges:(dag_edges_ : dag_edges option)
    ?dag_nodes:(dag_nodes_ : dag_nodes option) () =
  ({ dag_edges = dag_edges_; dag_nodes = dag_nodes_ } : get_dataflow_graph_response)

let make_get_dataflow_graph_request ?python_script:(python_script_ : python_script option) () =
  ({ python_script = python_script_ } : get_dataflow_graph_request)

let make_database ?federated_database:(federated_database_ : federated_database option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?target_database:(target_database_ : database_identifier option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?create_time:(create_time_ : timestamp option) ?parameters:(parameters_ : parameters_map option)
    ?location_uri:(location_uri_ : ur_i option)
    ?description:(description_ : description_string option) ~name:(name_ : name_string) () =
  ({
     federated_database = federated_database_;
     catalog_id = catalog_id_;
     target_database = target_database_;
     create_table_default_permissions = create_table_default_permissions_;
     create_time = create_time_;
     parameters = parameters_;
     location_uri = location_uri_;
     description = description_;
     name = name_;
   }
    : database)

let make_get_databases_response ?next_token:(next_token_ : token option)
    ~database_list:(database_list_ : database_list) () =
  ({ next_token = next_token_; database_list = database_list_ } : get_databases_response)

let make_get_databases_request
    ?attributes_to_get:(attributes_to_get_ : database_attributes_list option)
    ?resource_share_type:(resource_share_type_ : resource_share_type option)
    ?max_results:(max_results_ : catalog_getter_page_size option)
    ?next_token:(next_token_ : token option) ?catalog_id:(catalog_id_ : catalog_id_string option) ()
    =
  ({
     attributes_to_get = attributes_to_get_;
     resource_share_type = resource_share_type_;
     max_results = max_results_;
     next_token = next_token_;
     catalog_id = catalog_id_;
   }
    : get_databases_request)

let make_get_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : get_database_response)

let make_get_database_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~name:(name_ : name_string) () =
  ({ name = name_; catalog_id = catalog_id_ } : get_database_request)

let make_get_data_quality_ruleset_response
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    ?recommendation_run_id:(recommendation_run_id_ : hash_string option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?created_on:(created_on_ : timestamp option)
    ?target_table:(target_table_ : data_quality_target_table option)
    ?ruleset:(ruleset_ : data_quality_ruleset_string option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({
     data_quality_security_configuration = data_quality_security_configuration_;
     recommendation_run_id = recommendation_run_id_;
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     target_table = target_table_;
     ruleset = ruleset_;
     description = description_;
     name = name_;
   }
    : get_data_quality_ruleset_response)

let make_get_data_quality_ruleset_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_data_quality_ruleset_request)

let make_get_data_quality_ruleset_evaluation_run_response
    ?additional_data_sources:(additional_data_sources_ : data_source_map option)
    ?result_ids:(result_ids_ : data_quality_result_id_list option)
    ?ruleset_names:(ruleset_names_ : ruleset_names option)
    ?execution_time:(execution_time_ : execution_time option)
    ?completed_on:(completed_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?started_on:(started_on_ : timestamp option)
    ?error_string:(error_string_ : generic_string option)
    ?status:(status_ : task_status_type option)
    ?additional_run_options:
      (additional_run_options_ : data_quality_evaluation_run_additional_run_options option)
    ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?role:(role_ : role_string option) ?data_source:(data_source_ : data_source option)
    ?run_id:(run_id_ : hash_string option) () =
  ({
     additional_data_sources = additional_data_sources_;
     result_ids = result_ids_;
     ruleset_names = ruleset_names_;
     execution_time = execution_time_;
     completed_on = completed_on_;
     last_modified_on = last_modified_on_;
     started_on = started_on_;
     error_string = error_string_;
     status = status_;
     additional_run_options = additional_run_options_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     role = role_;
     data_source = data_source_;
     run_id = run_id_;
   }
    : get_data_quality_ruleset_evaluation_run_response)

let make_get_data_quality_ruleset_evaluation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : get_data_quality_ruleset_evaluation_run_request)

let make_get_data_quality_rule_recommendation_run_response
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    ?created_ruleset_name:(created_ruleset_name_ : name_string option)
    ?recommended_ruleset:(recommended_ruleset_ : data_quality_ruleset_string option)
    ?execution_time:(execution_time_ : execution_time option)
    ?completed_on:(completed_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?started_on:(started_on_ : timestamp option)
    ?error_string:(error_string_ : generic_string option)
    ?status:(status_ : task_status_type option) ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?role:(role_ : role_string option) ?data_source:(data_source_ : data_source option)
    ?run_id:(run_id_ : hash_string option) () =
  ({
     data_quality_security_configuration = data_quality_security_configuration_;
     created_ruleset_name = created_ruleset_name_;
     recommended_ruleset = recommended_ruleset_;
     execution_time = execution_time_;
     completed_on = completed_on_;
     last_modified_on = last_modified_on_;
     started_on = started_on_;
     error_string = error_string_;
     status = status_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     role = role_;
     data_source = data_source_;
     run_id = run_id_;
   }
    : get_data_quality_rule_recommendation_run_response)

let make_get_data_quality_rule_recommendation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : get_data_quality_rule_recommendation_run_request)

let make_data_quality_observation
    ?metric_based_observation:(metric_based_observation_ : metric_based_observation option)
    ?description:(description_ : data_quality_observation_description option) () =
  ({ metric_based_observation = metric_based_observation_; description = description_ }
    : data_quality_observation)

let make_data_quality_aggregated_metrics
    ?total_rules_failed:(total_rules_failed_ : nullable_double option)
    ?total_rules_passed:(total_rules_passed_ : nullable_double option)
    ?total_rules_processed:(total_rules_processed_ : nullable_double option)
    ?total_rows_failed:(total_rows_failed_ : nullable_double option)
    ?total_rows_passed:(total_rows_passed_ : nullable_double option)
    ?total_rows_processed:(total_rows_processed_ : nullable_double option) () =
  ({
     total_rules_failed = total_rules_failed_;
     total_rules_passed = total_rules_passed_;
     total_rules_processed = total_rules_processed_;
     total_rows_failed = total_rows_failed_;
     total_rows_passed = total_rows_passed_;
     total_rows_processed = total_rows_processed_;
   }
    : data_quality_aggregated_metrics)

let make_get_data_quality_result_response
    ?aggregated_metrics:(aggregated_metrics_ : data_quality_aggregated_metrics option)
    ?observations:(observations_ : data_quality_observations option)
    ?analyzer_results:(analyzer_results_ : data_quality_analyzer_results option)
    ?rule_results:(rule_results_ : data_quality_rule_results option)
    ?ruleset_evaluation_run_id:(ruleset_evaluation_run_id_ : hash_string option)
    ?job_run_id:(job_run_id_ : hash_string option) ?job_name:(job_name_ : name_string option)
    ?completed_on:(completed_on_ : timestamp option) ?started_on:(started_on_ : timestamp option)
    ?evaluation_context:(evaluation_context_ : generic_string option)
    ?ruleset_name:(ruleset_name_ : name_string option)
    ?data_source:(data_source_ : data_source option) ?score:(score_ : generic_bounded_double option)
    ?profile_id:(profile_id_ : hash_string option) ?result_id:(result_id_ : hash_string option) () =
  ({
     aggregated_metrics = aggregated_metrics_;
     observations = observations_;
     analyzer_results = analyzer_results_;
     rule_results = rule_results_;
     ruleset_evaluation_run_id = ruleset_evaluation_run_id_;
     job_run_id = job_run_id_;
     job_name = job_name_;
     completed_on = completed_on_;
     started_on = started_on_;
     evaluation_context = evaluation_context_;
     ruleset_name = ruleset_name_;
     data_source = data_source_;
     score = score_;
     profile_id = profile_id_;
     result_id = result_id_;
   }
    : get_data_quality_result_response)

let make_get_data_quality_result_request ~result_id:(result_id_ : hash_string) () =
  ({ result_id = result_id_ } : get_data_quality_result_request)

let make_get_data_quality_model_result_response ?model:(model_ : statistic_model_results option)
    ?completed_on:(completed_on_ : timestamp option) () =
  ({ model = model_; completed_on = completed_on_ } : get_data_quality_model_result_response)

let make_get_data_quality_model_result_request ~profile_id:(profile_id_ : hash_string)
    ~statistic_id:(statistic_id_ : hash_string) () =
  ({ profile_id = profile_id_; statistic_id = statistic_id_ }
    : get_data_quality_model_result_request)

let make_get_data_quality_model_response ?failure_reason:(failure_reason_ : hash_string option)
    ?completed_on:(completed_on_ : timestamp option) ?started_on:(started_on_ : timestamp option)
    ?status:(status_ : data_quality_model_status option) () =
  ({
     failure_reason = failure_reason_;
     completed_on = completed_on_;
     started_on = started_on_;
     status = status_;
   }
    : get_data_quality_model_response)

let make_get_data_quality_model_request ?statistic_id:(statistic_id_ : hash_string option)
    ~profile_id:(profile_id_ : hash_string) () =
  ({ profile_id = profile_id_; statistic_id = statistic_id_ } : get_data_quality_model_request)

let make_get_data_catalog_encryption_settings_response
    ?data_catalog_encryption_settings:
      (data_catalog_encryption_settings_ : data_catalog_encryption_settings option) () =
  ({ data_catalog_encryption_settings = data_catalog_encryption_settings_ }
    : get_data_catalog_encryption_settings_response)

let make_get_data_catalog_encryption_settings_request
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ catalog_id = catalog_id_ } : get_data_catalog_encryption_settings_request)

let make_get_dashboard_url_response ~url:(url_ : sensitive_url) () =
  ({ url = url_ } : get_dashboard_url_response)

let make_get_dashboard_url_request
    ?request_origin:(request_origin_ : orchestration_name_string option)
    ~resource_type:(resource_type_ : glue_resource_type) ~resource_id:(resource_id_ : name_string)
    () =
  ({ request_origin = request_origin_; resource_type = resource_type_; resource_id = resource_id_ }
    : get_dashboard_url_request)

let make_get_custom_entity_type_response ?context_words:(context_words_ : context_words option)
    ?regex_string:(regex_string_ : name_string option) ?name:(name_ : name_string option) () =
  ({ context_words = context_words_; regex_string = regex_string_; name = name_ }
    : get_custom_entity_type_response)

let make_get_custom_entity_type_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_custom_entity_type_request)

let make_crawler
    ?lake_formation_configuration:
      (lake_formation_configuration_ : lake_formation_configuration option)
    ?crawler_security_configuration:
      (crawler_security_configuration_ : crawler_security_configuration option)
    ?configuration:(configuration_ : crawler_configuration option)
    ?version:(version_ : version_id option) ?last_crawl:(last_crawl_ : last_crawl_info option)
    ?last_updated:(last_updated_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?crawl_elapsed_time:(crawl_elapsed_time_ : milliseconds_count option)
    ?schedule:(schedule_ : schedule option) ?table_prefix:(table_prefix_ : table_prefix option)
    ?state:(state_ : crawler_state option)
    ?lineage_configuration:(lineage_configuration_ : lineage_configuration option)
    ?schema_change_policy:(schema_change_policy_ : schema_change_policy option)
    ?recrawl_policy:(recrawl_policy_ : recrawl_policy option)
    ?classifiers:(classifiers_ : classifier_name_list option)
    ?description:(description_ : description_string option)
    ?database_name:(database_name_ : database_name option)
    ?targets:(targets_ : crawler_targets option) ?role:(role_ : role option)
    ?name:(name_ : name_string option) () =
  ({
     lake_formation_configuration = lake_formation_configuration_;
     crawler_security_configuration = crawler_security_configuration_;
     configuration = configuration_;
     version = version_;
     last_crawl = last_crawl_;
     last_updated = last_updated_;
     creation_time = creation_time_;
     crawl_elapsed_time = crawl_elapsed_time_;
     schedule = schedule_;
     table_prefix = table_prefix_;
     state = state_;
     lineage_configuration = lineage_configuration_;
     schema_change_policy = schema_change_policy_;
     recrawl_policy = recrawl_policy_;
     classifiers = classifiers_;
     description = description_;
     database_name = database_name_;
     targets = targets_;
     role = role_;
     name = name_;
   }
    : crawler)

let make_get_crawlers_response ?next_token:(next_token_ : token option)
    ?crawlers:(crawlers_ : crawler_list option) () =
  ({ next_token = next_token_; crawlers = crawlers_ } : get_crawlers_response)

let make_get_crawlers_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : get_crawlers_request)

let make_get_crawler_response ?crawler:(crawler_ : crawler option) () =
  ({ crawler = crawler_ } : get_crawler_response)

let make_get_crawler_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_crawler_request)

let make_crawler_metrics ?tables_deleted:(tables_deleted_ : non_negative_integer option)
    ?tables_updated:(tables_updated_ : non_negative_integer option)
    ?tables_created:(tables_created_ : non_negative_integer option)
    ?median_runtime_seconds:(median_runtime_seconds_ : non_negative_double option)
    ?last_runtime_seconds:(last_runtime_seconds_ : non_negative_double option)
    ?still_estimating:(still_estimating_ : boolean_ option)
    ?time_left_seconds:(time_left_seconds_ : non_negative_double option)
    ?crawler_name:(crawler_name_ : name_string option) () =
  ({
     tables_deleted = tables_deleted_;
     tables_updated = tables_updated_;
     tables_created = tables_created_;
     median_runtime_seconds = median_runtime_seconds_;
     last_runtime_seconds = last_runtime_seconds_;
     still_estimating = still_estimating_;
     time_left_seconds = time_left_seconds_;
     crawler_name = crawler_name_;
   }
    : crawler_metrics)

let make_get_crawler_metrics_response ?next_token:(next_token_ : token option)
    ?crawler_metrics_list:(crawler_metrics_list_ : crawler_metrics_list option) () =
  ({ next_token = next_token_; crawler_metrics_list = crawler_metrics_list_ }
    : get_crawler_metrics_response)

let make_get_crawler_metrics_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option)
    ?crawler_name_list:(crawler_name_list_ : crawler_name_list option) () =
  ({ next_token = next_token_; max_results = max_results_; crawler_name_list = crawler_name_list_ }
    : get_crawler_metrics_request)

let make_authentication_configuration
    ?o_auth2_properties:(o_auth2_properties_ : o_auth2_properties option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?secret_arn:(secret_arn_ : secret_arn option)
    ?authentication_type:(authentication_type_ : authentication_type option) () =
  ({
     o_auth2_properties = o_auth2_properties_;
     kms_key_arn = kms_key_arn_;
     secret_arn = secret_arn_;
     authentication_type = authentication_type_;
   }
    : authentication_configuration)

let make_connection
    ?compatible_compute_environments:
      (compatible_compute_environments_ : compute_environment_list option)
    ?connection_schema_version:(connection_schema_version_ : connection_schema_version option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration option)
    ?last_connection_validation_time:(last_connection_validation_time_ : timestamp option)
    ?status_reason:(status_reason_ : long_value_string option)
    ?status:(status_ : connection_status option)
    ?last_updated_by:(last_updated_by_ : name_string option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?physical_connection_requirements:
      (physical_connection_requirements_ : physical_connection_requirements option)
    ?python_properties:(python_properties_ : property_map option)
    ?athena_properties:(athena_properties_ : property_map option)
    ?spark_properties:(spark_properties_ : property_map option)
    ?connection_properties:(connection_properties_ : connection_properties option)
    ?match_criteria:(match_criteria_ : match_criteria option)
    ?connection_type:(connection_type_ : connection_type option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option) () =
  ({
     compatible_compute_environments = compatible_compute_environments_;
     connection_schema_version = connection_schema_version_;
     authentication_configuration = authentication_configuration_;
     last_connection_validation_time = last_connection_validation_time_;
     status_reason = status_reason_;
     status = status_;
     last_updated_by = last_updated_by_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     physical_connection_requirements = physical_connection_requirements_;
     python_properties = python_properties_;
     athena_properties = athena_properties_;
     spark_properties = spark_properties_;
     connection_properties = connection_properties_;
     match_criteria = match_criteria_;
     connection_type = connection_type_;
     description = description_;
     name = name_;
   }
    : connection)

let make_get_connections_response ?next_token:(next_token_ : token option)
    ?connection_list:(connection_list_ : connection_list option) () =
  ({ next_token = next_token_; connection_list = connection_list_ } : get_connections_response)

let make_get_connections_filter
    ?connection_schema_version:(connection_schema_version_ : connection_schema_version option)
    ?connection_type:(connection_type_ : connection_type option)
    ?match_criteria:(match_criteria_ : match_criteria option) () =
  ({
     connection_schema_version = connection_schema_version_;
     connection_type = connection_type_;
     match_criteria = match_criteria_;
   }
    : get_connections_filter)

let make_get_connections_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) ?hide_password:(hide_password_ : boolean_ option)
    ?filter:(filter_ : get_connections_filter option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     hide_password = hide_password_;
     filter = filter_;
     catalog_id = catalog_id_;
   }
    : get_connections_request)

let make_get_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : get_connection_response)

let make_get_connection_request
    ?apply_override_for_compute_environment:
      (apply_override_for_compute_environment_ : compute_environment option)
    ?hide_password:(hide_password_ : boolean_ option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~name:(name_ : name_string) () =
  ({
     apply_override_for_compute_environment = apply_override_for_compute_environment_;
     hide_password = hide_password_;
     name = name_;
     catalog_id = catalog_id_;
   }
    : get_connection_request)

let make_execution_attempt ?error_message:(error_message_ : description_string option)
    ?execution_timestamp:(execution_timestamp_ : timestamp option)
    ?column_statistics_task_run_id:(column_statistics_task_run_id_ : hash_string option)
    ?status:(status_ : execution_status option) () =
  ({
     error_message = error_message_;
     execution_timestamp = execution_timestamp_;
     column_statistics_task_run_id = column_statistics_task_run_id_;
     status = status_;
   }
    : execution_attempt)

let make_column_statistics_task_settings
    ?last_execution_attempt:(last_execution_attempt_ : execution_attempt option)
    ?setting_source:(setting_source_ : setting_source option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?security_configuration:(security_configuration_ : crawler_security_configuration option)
    ?sample_size:(sample_size_ : sample_size_percentage option) ?role:(role_ : role option)
    ?catalog_i_d:(catalog_i_d_ : catalog_id_string option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?schedule:(schedule_ : schedule option) ?table_name:(table_name_ : table_name option)
    ?database_name:(database_name_ : database_name option) () =
  ({
     last_execution_attempt = last_execution_attempt_;
     setting_source = setting_source_;
     schedule_type = schedule_type_;
     security_configuration = security_configuration_;
     sample_size = sample_size_;
     role = role_;
     catalog_i_d = catalog_i_d_;
     column_name_list = column_name_list_;
     schedule = schedule_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : column_statistics_task_settings)

let make_get_column_statistics_task_settings_response
    ?column_statistics_task_settings:
      (column_statistics_task_settings_ : column_statistics_task_settings option) () =
  ({ column_statistics_task_settings = column_statistics_task_settings_ }
    : get_column_statistics_task_settings_response)

let make_get_column_statistics_task_settings_request ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({ table_name = table_name_; database_name = database_name_ }
    : get_column_statistics_task_settings_request)

let make_column_statistics_task_run ?dpu_seconds:(dpu_seconds_ : non_negative_double option)
    ?error_message:(error_message_ : description_string option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?status:(status_ : column_statistics_state option)
    ?computation_type:(computation_type_ : computation_type option)
    ?worker_type:(worker_type_ : name_string option)
    ?number_of_workers:(number_of_workers_ : positive_integer option)
    ?security_configuration:(security_configuration_ : crawler_security_configuration option)
    ?sample_size:(sample_size_ : sample_size_percentage option) ?role:(role_ : role option)
    ?catalog_i_d:(catalog_i_d_ : catalog_id_string option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?table_name:(table_name_ : table_name option)
    ?database_name:(database_name_ : database_name option)
    ?column_statistics_task_run_id:(column_statistics_task_run_id_ : hash_string option)
    ?customer_id:(customer_id_ : account_id option) () =
  ({
     dpu_seconds = dpu_seconds_;
     error_message = error_message_;
     end_time = end_time_;
     start_time = start_time_;
     last_updated = last_updated_;
     creation_time = creation_time_;
     status = status_;
     computation_type = computation_type_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     security_configuration = security_configuration_;
     sample_size = sample_size_;
     role = role_;
     catalog_i_d = catalog_i_d_;
     column_name_list = column_name_list_;
     table_name = table_name_;
     database_name = database_name_;
     column_statistics_task_run_id = column_statistics_task_run_id_;
     customer_id = customer_id_;
   }
    : column_statistics_task_run)

let make_get_column_statistics_task_runs_response ?next_token:(next_token_ : token option)
    ?column_statistics_task_runs:
      (column_statistics_task_runs_ : column_statistics_task_runs_list option) () =
  ({ next_token = next_token_; column_statistics_task_runs = column_statistics_task_runs_ }
    : get_column_statistics_task_runs_response)

let make_get_column_statistics_task_runs_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : database_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : get_column_statistics_task_runs_request)

let make_get_column_statistics_task_run_response
    ?column_statistics_task_run:(column_statistics_task_run_ : column_statistics_task_run option) ()
    =
  ({ column_statistics_task_run = column_statistics_task_run_ }
    : get_column_statistics_task_run_response)

let make_get_column_statistics_task_run_request
    ~column_statistics_task_run_id:(column_statistics_task_run_id_ : hash_string) () =
  ({ column_statistics_task_run_id = column_statistics_task_run_id_ }
    : get_column_statistics_task_run_request)

let make_column_error ?error:(error_ : error_detail option)
    ?column_name:(column_name_ : name_string option) () =
  ({ error = error_; column_name = column_name_ } : column_error)

let make_get_column_statistics_for_table_response ?errors:(errors_ : column_errors option)
    ?column_statistics_list:(column_statistics_list_ : column_statistics_list option) () =
  ({ errors = errors_; column_statistics_list = column_statistics_list_ }
    : get_column_statistics_for_table_response)

let make_get_column_statistics_for_table_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~column_names:(column_names_ : get_column_names_list) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     column_names = column_names_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_column_statistics_for_table_request)

let make_get_column_statistics_for_partition_response ?errors:(errors_ : column_errors option)
    ?column_statistics_list:(column_statistics_list_ : column_statistics_list option) () =
  ({ errors = errors_; column_statistics_list = column_statistics_list_ }
    : get_column_statistics_for_partition_response)

let make_get_column_statistics_for_partition_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~column_names:(column_names_ : get_column_names_list)
    ~partition_values:(partition_values_ : value_string_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     column_names = column_names_;
     partition_values = partition_values_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : get_column_statistics_for_partition_request)

let make_csv_classifier ?serde:(serde_ : csv_serde_option option)
    ?custom_datatypes:(custom_datatypes_ : custom_datatypes option)
    ?custom_datatype_configured:(custom_datatype_configured_ : nullable_boolean option)
    ?allow_single_column:(allow_single_column_ : nullable_boolean option)
    ?disable_value_trimming:(disable_value_trimming_ : nullable_boolean option)
    ?header:(header_ : csv_header option)
    ?contains_header:(contains_header_ : csv_header_option option)
    ?quote_symbol:(quote_symbol_ : csv_quote_symbol option)
    ?delimiter:(delimiter_ : csv_column_delimiter option) ?version:(version_ : version_id option)
    ?last_updated:(last_updated_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ~name:(name_ : name_string) () =
  ({
     serde = serde_;
     custom_datatypes = custom_datatypes_;
     custom_datatype_configured = custom_datatype_configured_;
     allow_single_column = allow_single_column_;
     disable_value_trimming = disable_value_trimming_;
     header = header_;
     contains_header = contains_header_;
     quote_symbol = quote_symbol_;
     delimiter = delimiter_;
     version = version_;
     last_updated = last_updated_;
     creation_time = creation_time_;
     name = name_;
   }
    : csv_classifier)

let make_classifier ?csv_classifier:(csv_classifier_ : csv_classifier option)
    ?json_classifier:(json_classifier_ : json_classifier option)
    ?xml_classifier:(xml_classifier_ : xml_classifier option)
    ?grok_classifier:(grok_classifier_ : grok_classifier option) () =
  ({
     csv_classifier = csv_classifier_;
     json_classifier = json_classifier_;
     xml_classifier = xml_classifier_;
     grok_classifier = grok_classifier_;
   }
    : classifier)

let make_get_classifiers_response ?next_token:(next_token_ : token option)
    ?classifiers:(classifiers_ : classifier_list option) () =
  ({ next_token = next_token_; classifiers = classifiers_ } : get_classifiers_response)

let make_get_classifiers_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : get_classifiers_request)

let make_get_classifier_response ?classifier:(classifier_ : classifier option) () =
  ({ classifier = classifier_ } : get_classifier_response)

let make_get_classifier_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_classifier_request)

let make_data_lake_access_properties_output ?catalog_type:(catalog_type_ : name_string option)
    ?status_message:(status_message_ : name_string option)
    ?redshift_database_name:(redshift_database_name_ : name_string option)
    ?managed_workgroup_status:(managed_workgroup_status_ : name_string option)
    ?managed_workgroup_name:(managed_workgroup_name_ : name_string option)
    ?kms_key:(kms_key_ : resource_arn_string option)
    ?data_transfer_role:(data_transfer_role_ : iam_role_arn option)
    ?data_lake_access:(data_lake_access_ : boolean_ option) () =
  ({
     catalog_type = catalog_type_;
     status_message = status_message_;
     redshift_database_name = redshift_database_name_;
     managed_workgroup_status = managed_workgroup_status_;
     managed_workgroup_name = managed_workgroup_name_;
     kms_key = kms_key_;
     data_transfer_role = data_transfer_role_;
     data_lake_access = data_lake_access_;
   }
    : data_lake_access_properties_output)

let make_catalog_properties_output ?custom_properties:(custom_properties_ : parameters_map option)
    ?iceberg_optimization_properties:
      (iceberg_optimization_properties_ : iceberg_optimization_properties_output option)
    ?data_lake_access_properties:
      (data_lake_access_properties_ : data_lake_access_properties_output option) () =
  ({
     custom_properties = custom_properties_;
     iceberg_optimization_properties = iceberg_optimization_properties_;
     data_lake_access_properties = data_lake_access_properties_;
   }
    : catalog_properties_output)

let make_catalog
    ?allow_full_table_external_data_access:
      (allow_full_table_external_data_access_ : allow_full_table_external_data_access_enum option)
    ?create_database_default_permissions:
      (create_database_default_permissions_ : principal_permissions_list option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?catalog_properties:(catalog_properties_ : catalog_properties_output option)
    ?federated_catalog:(federated_catalog_ : federated_catalog option)
    ?target_redshift_catalog:(target_redshift_catalog_ : target_redshift_catalog option)
    ?update_time:(update_time_ : timestamp option) ?create_time:(create_time_ : timestamp option)
    ?parameters:(parameters_ : parameters_map option)
    ?description:(description_ : description_string option)
    ?resource_arn:(resource_arn_ : resource_arn_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~name:(name_ : catalog_name_string) () =
  ({
     allow_full_table_external_data_access = allow_full_table_external_data_access_;
     create_database_default_permissions = create_database_default_permissions_;
     create_table_default_permissions = create_table_default_permissions_;
     catalog_properties = catalog_properties_;
     federated_catalog = federated_catalog_;
     target_redshift_catalog = target_redshift_catalog_;
     update_time = update_time_;
     create_time = create_time_;
     parameters = parameters_;
     description = description_;
     resource_arn = resource_arn_;
     name = name_;
     catalog_id = catalog_id_;
   }
    : catalog)

let make_get_catalogs_response ?next_token:(next_token_ : token option)
    ~catalog_list:(catalog_list_ : catalog_list) () =
  ({ next_token = next_token_; catalog_list = catalog_list_ } : get_catalogs_response)

let make_get_catalogs_request ?has_databases:(has_databases_ : nullable_boolean option)
    ?include_root:(include_root_ : nullable_boolean option)
    ?recursive:(recursive_ : boolean_ option) ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option)
    ?parent_catalog_id:(parent_catalog_id_ : catalog_id_string option) () =
  ({
     has_databases = has_databases_;
     include_root = include_root_;
     recursive = recursive_;
     max_results = max_results_;
     next_token = next_token_;
     parent_catalog_id = parent_catalog_id_;
   }
    : get_catalogs_request)

let make_get_catalog_response ?catalog:(catalog_ : catalog option) () =
  ({ catalog = catalog_ } : get_catalog_response)

let make_get_catalog_request ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({ catalog_id = catalog_id_ } : get_catalog_request)

let make_catalog_import_status ?imported_by:(imported_by_ : name_string option)
    ?import_time:(import_time_ : timestamp option)
    ?import_completed:(import_completed_ : boolean_ option) () =
  ({ imported_by = imported_by_; import_time = import_time_; import_completed = import_completed_ }
    : catalog_import_status)

let make_get_catalog_import_status_response
    ?import_status:(import_status_ : catalog_import_status option) () =
  ({ import_status = import_status_ } : get_catalog_import_status_response)

let make_get_catalog_import_status_request ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ catalog_id = catalog_id_ } : get_catalog_import_status_request)

let make_blueprint_run ?role_arn:(role_arn_ : orchestration_iam_role_arn option)
    ?parameters:(parameters_ : blueprint_parameters option)
    ?rollback_error_message:(rollback_error_message_ : message_string option)
    ?error_message:(error_message_ : message_string option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?started_on:(started_on_ : timestamp_value option) ?state:(state_ : blueprint_run_state option)
    ?workflow_name:(workflow_name_ : name_string option) ?run_id:(run_id_ : id_string option)
    ?blueprint_name:(blueprint_name_ : orchestration_name_string option) () =
  ({
     role_arn = role_arn_;
     parameters = parameters_;
     rollback_error_message = rollback_error_message_;
     error_message = error_message_;
     completed_on = completed_on_;
     started_on = started_on_;
     state = state_;
     workflow_name = workflow_name_;
     run_id = run_id_;
     blueprint_name = blueprint_name_;
   }
    : blueprint_run)

let make_get_blueprint_runs_response ?next_token:(next_token_ : generic_string option)
    ?blueprint_runs:(blueprint_runs_ : blueprint_runs option) () =
  ({ next_token = next_token_; blueprint_runs = blueprint_runs_ } : get_blueprint_runs_response)

let make_get_blueprint_runs_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : generic_string option)
    ~blueprint_name:(blueprint_name_ : name_string) () =
  ({ max_results = max_results_; next_token = next_token_; blueprint_name = blueprint_name_ }
    : get_blueprint_runs_request)

let make_get_blueprint_run_response ?blueprint_run:(blueprint_run_ : blueprint_run option) () =
  ({ blueprint_run = blueprint_run_ } : get_blueprint_run_response)

let make_get_blueprint_run_request ~run_id:(run_id_ : id_string)
    ~blueprint_name:(blueprint_name_ : orchestration_name_string) () =
  ({ run_id = run_id_; blueprint_name = blueprint_name_ } : get_blueprint_run_request)

let make_blueprint ?last_active_definition:(last_active_definition_ : last_active_definition option)
    ?error_message:(error_message_ : error_string option)
    ?status:(status_ : blueprint_status option)
    ?blueprint_service_location:(blueprint_service_location_ : generic_string option)
    ?blueprint_location:(blueprint_location_ : generic_string option)
    ?parameter_spec:(parameter_spec_ : blueprint_parameter_spec option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?created_on:(created_on_ : timestamp_value option)
    ?description:(description_ : generic512_char_string option)
    ?name:(name_ : orchestration_name_string option) () =
  ({
     last_active_definition = last_active_definition_;
     error_message = error_message_;
     status = status_;
     blueprint_service_location = blueprint_service_location_;
     blueprint_location = blueprint_location_;
     parameter_spec = parameter_spec_;
     last_modified_on = last_modified_on_;
     created_on = created_on_;
     description = description_;
     name = name_;
   }
    : blueprint)

let make_get_blueprint_response ?blueprint:(blueprint_ : blueprint option) () =
  ({ blueprint = blueprint_ } : get_blueprint_response)

let make_get_blueprint_request
    ?include_parameter_spec:(include_parameter_spec_ : nullable_boolean option)
    ?include_blueprint:(include_blueprint_ : nullable_boolean option) ~name:(name_ : name_string) ()
    =
  ({
     include_parameter_spec = include_parameter_spec_;
     include_blueprint = include_blueprint_;
     name = name_;
   }
    : get_blueprint_request)

let make_get_asset_type_response ?forms:(forms_ : asset_type_forms_map option)
    ?name:(name_ : asset_type_name option) ?id:(id_ : asset_type_id option) () =
  ({ forms = forms_; name = name_; id = id_ } : get_asset_type_response)

let make_get_asset_type_request ~identifier:(identifier_ : asset_type_id) () =
  ({ identifier = identifier_ } : get_asset_type_request)

let make_get_asset_output ?iterable_forms:(iterable_forms_ : iterable_form_map option)
    ?attachments:(attachments_ : asset_form_map option) ?forms:(forms_ : asset_form_map option)
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option)
    ?updated_at:(updated_at_ : updated_at option) ?created_at:(created_at_ : created_at option)
    ?description:(description_ : asset_description option) ?name:(name_ : asset_name option)
    ~asset_type_id:(asset_type_id_ : asset_type_id) ~id:(id_ : asset_id) () =
  ({
     iterable_forms = iterable_forms_;
     attachments = attachments_;
     forms = forms_;
     glossary_terms = glossary_terms_;
     asset_type_id = asset_type_id_;
     updated_at = updated_at_;
     created_at = created_at_;
     description = description_;
     name = name_;
     id = id_;
   }
    : get_asset_output)

let make_get_asset_input ~identifier:(identifier_ : asset_id) () =
  ({ identifier = identifier_ } : get_asset_input)

let make_field ?custom_properties:(custom_properties_ : custom_properties option)
    ?native_data_type:(native_data_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?parent_field:(parent_field_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?supported_filter_operators:(supported_filter_operators_ : field_filter_operators_list option)
    ?supported_values:(supported_values_ : list_of_string option)
    ?is_default_on_create:(is_default_on_create_ : bool_ option)
    ?is_upsertable:(is_upsertable_ : bool_ option) ?is_updateable:(is_updateable_ : bool_ option)
    ?is_createable:(is_createable_ : bool_ option)
    ?is_partitionable:(is_partitionable_ : bool_ option)
    ?is_filterable:(is_filterable_ : bool_ option) ?is_retrievable:(is_retrievable_ : bool_ option)
    ?is_nullable:(is_nullable_ : bool_ option) ?is_primary_key:(is_primary_key_ : bool_ option)
    ?field_type:(field_type_ : field_data_type option)
    ?description:(description_ : field_description option) ?label:(label_ : field_label option)
    ?field_name:(field_name_ : entity_field_name option) () =
  ({
     custom_properties = custom_properties_;
     native_data_type = native_data_type_;
     parent_field = parent_field_;
     supported_filter_operators = supported_filter_operators_;
     supported_values = supported_values_;
     is_default_on_create = is_default_on_create_;
     is_upsertable = is_upsertable_;
     is_updateable = is_updateable_;
     is_createable = is_createable_;
     is_partitionable = is_partitionable_;
     is_filterable = is_filterable_;
     is_retrievable = is_retrievable_;
     is_nullable = is_nullable_;
     is_primary_key = is_primary_key_;
     field_type = field_type_;
     description = description_;
     label = label_;
     field_name = field_name_;
   }
    : field)

let make_disassociate_glossary_terms_response
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option)
    ?asset_identifier:(asset_identifier_ : asset_id option) () =
  ({ glossary_terms = glossary_terms_; asset_identifier = asset_identifier_ }
    : disassociate_glossary_terms_response)

let make_disassociate_glossary_terms_request ?client_token:(client_token_ : hash_string option)
    ~glossary_term_identifiers:(glossary_term_identifiers_ : glossary_term_id_list)
    ~asset_identifier:(asset_identifier_ : asset_id) () =
  ({
     client_token = client_token_;
     glossary_term_identifiers = glossary_term_identifiers_;
     asset_identifier = asset_identifier_;
   }
    : disassociate_glossary_terms_request)

let make_describe_integrations_response ?marker:(marker_ : string128 option)
    ?integrations:(integrations_ : integrations_list option) () =
  ({ marker = marker_; integrations = integrations_ } : describe_integrations_response)

let make_describe_integrations_request ?filters:(filters_ : integration_filter_list option)
    ?max_records:(max_records_ : integration_integer option) ?marker:(marker_ : string128 option)
    ?integration_identifier:(integration_identifier_ : string128 option) () =
  ({
     filters = filters_;
     max_records = max_records_;
     marker = marker_;
     integration_identifier = integration_identifier_;
   }
    : describe_integrations_request)

let make_describe_inbound_integrations_response ?marker:(marker_ : string128 option)
    ?inbound_integrations:(inbound_integrations_ : inbound_integrations_list option) () =
  ({ marker = marker_; inbound_integrations = inbound_integrations_ }
    : describe_inbound_integrations_response)

let make_describe_inbound_integrations_request ?target_arn:(target_arn_ : string512 option)
    ?max_records:(max_records_ : integration_integer option) ?marker:(marker_ : string128 option)
    ?integration_arn:(integration_arn_ : string128 option) () =
  ({
     target_arn = target_arn_;
     max_records = max_records_;
     marker = marker_;
     integration_arn = integration_arn_;
   }
    : describe_inbound_integrations_request)

let make_describe_entity_response ?next_token:(next_token_ : next_token option)
    ?fields:(fields_ : fields_list option) () =
  ({ next_token = next_token_; fields = fields_ } : describe_entity_response)

let make_describe_entity_request
    ?data_store_api_version:(data_store_api_version_ : api_version option)
    ?next_token:(next_token_ : next_token option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~entity_name:(entity_name_ : entity_name)
    ~connection_name:(connection_name_ : name_string) () =
  ({
     data_store_api_version = data_store_api_version_;
     next_token = next_token_;
     entity_name = entity_name_;
     catalog_id = catalog_id_;
     connection_name = connection_name_;
   }
    : describe_entity_request)

let make_auth_configuration
    ?custom_authentication_properties:(custom_authentication_properties_ : properties_map option)
    ?basic_authentication_properties:(basic_authentication_properties_ : properties_map option)
    ?o_auth2_properties:(o_auth2_properties_ : properties_map option)
    ?secret_arn:(secret_arn_ : property option)
    ~authentication_type:(authentication_type_ : property) () =
  ({
     custom_authentication_properties = custom_authentication_properties_;
     basic_authentication_properties = basic_authentication_properties_;
     o_auth2_properties = o_auth2_properties_;
     secret_arn = secret_arn_;
     authentication_type = authentication_type_;
   }
    : auth_configuration)

let make_compute_environment_configuration
    ?physical_connection_properties_required:
      (physical_connection_properties_required_ : bool_ option)
    ~connection_properties_required_overrides:
      (connection_properties_required_overrides_ : list_of_string)
    ~connection_option_name_overrides:(connection_option_name_overrides_ : property_name_overrides)
    ~connection_property_name_overrides:
      (connection_property_name_overrides_ : property_name_overrides)
    ~connection_options:(connection_options_ : properties_map)
    ~supported_authentication_types:(supported_authentication_types_ : authentication_types)
    ~compute_environment:(compute_environment_ : compute_environment)
    ~description:(description_ : compute_environment_configuration_description_string)
    ~name:(name_ : compute_environment_name) () =
  ({
     physical_connection_properties_required = physical_connection_properties_required_;
     connection_properties_required_overrides = connection_properties_required_overrides_;
     connection_option_name_overrides = connection_option_name_overrides_;
     connection_property_name_overrides = connection_property_name_overrides_;
     connection_options = connection_options_;
     supported_authentication_types = supported_authentication_types_;
     compute_environment = compute_environment_;
     description = description_;
     name = name_;
   }
    : compute_environment_configuration)

let make_describe_connection_type_response
    ?rest_configuration:(rest_configuration_ : rest_configuration option)
    ?spark_connection_properties:(spark_connection_properties_ : properties_map option)
    ?python_connection_properties:(python_connection_properties_ : properties_map option)
    ?athena_connection_properties:(athena_connection_properties_ : properties_map option)
    ?physical_connection_requirements:(physical_connection_requirements_ : properties_map option)
    ?compute_environment_configurations:
      (compute_environment_configurations_ : compute_environment_configuration_map option)
    ?authentication_configuration:(authentication_configuration_ : auth_configuration option)
    ?connection_options:(connection_options_ : properties_map option)
    ?connection_properties:(connection_properties_ : properties_map option)
    ?capabilities:(capabilities_ : capabilities option)
    ?description:(description_ : description option)
    ?connection_type:(connection_type_ : name_string option) () =
  ({
     rest_configuration = rest_configuration_;
     spark_connection_properties = spark_connection_properties_;
     python_connection_properties = python_connection_properties_;
     athena_connection_properties = athena_connection_properties_;
     physical_connection_requirements = physical_connection_requirements_;
     compute_environment_configurations = compute_environment_configurations_;
     authentication_configuration = authentication_configuration_;
     connection_options = connection_options_;
     connection_properties = connection_properties_;
     capabilities = capabilities_;
     description = description_;
     connection_type = connection_type_;
   }
    : describe_connection_type_response)

let make_describe_connection_type_request ~connection_type:(connection_type_ : name_string) () =
  ({ connection_type = connection_type_ } : describe_connection_type_request)

let make_delete_workflow_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : delete_workflow_response)

let make_delete_workflow_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_workflow_request)

let make_delete_user_defined_function_response () = (() : unit)

let make_delete_user_defined_function_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~function_name:(function_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({ function_name = function_name_; database_name = database_name_; catalog_id = catalog_id_ }
    : delete_user_defined_function_request)

let make_delete_usage_profile_response () = (() : unit)

let make_delete_usage_profile_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_usage_profile_request)

let make_delete_trigger_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : delete_trigger_response)

let make_delete_trigger_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_trigger_request)

let make_delete_table_version_response () = (() : unit)

let make_delete_table_version_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~version_id:(version_id_ : version_string) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     version_id = version_id_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : delete_table_version_request)

let make_delete_table_response () = (() : unit)

let make_delete_table_request ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~name:(name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     transaction_id = transaction_id_;
     name = name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : delete_table_request)

let make_delete_table_optimizer_response () = (() : unit)

let make_delete_table_optimizer_request ~type_:(type__ : table_optimizer_type)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string)
    ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     type_ = type__;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : delete_table_optimizer_request)

let make_delete_session_response ?id:(id_ : name_string option) () =
  ({ id = id_ } : delete_session_response)

let make_delete_session_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~id:(id_ : name_string) () =
  ({ request_origin = request_origin_; id = id_ } : delete_session_request)

let make_delete_security_configuration_response () = (() : unit)

let make_delete_security_configuration_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_security_configuration_request)

let make_delete_schema_versions_response
    ?schema_version_errors:(schema_version_errors_ : schema_version_error_list option) () =
  ({ schema_version_errors = schema_version_errors_ } : delete_schema_versions_response)

let make_delete_schema_versions_input ~versions:(versions_ : versions_string)
    ~schema_id:(schema_id_ : schema_id) () =
  ({ versions = versions_; schema_id = schema_id_ } : delete_schema_versions_input)

let make_delete_schema_response ?status:(status_ : schema_status option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option) () =
  ({ status = status_; schema_name = schema_name_; schema_arn = schema_arn_ }
    : delete_schema_response)

let make_delete_schema_input ~schema_id:(schema_id_ : schema_id) () =
  ({ schema_id = schema_id_ } : delete_schema_input)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request ?resource_arn:(resource_arn_ : glue_resource_arn option)
    ?policy_hash_condition:(policy_hash_condition_ : hash_string option) () =
  ({ resource_arn = resource_arn_; policy_hash_condition = policy_hash_condition_ }
    : delete_resource_policy_request)

let make_delete_registry_response ?status:(status_ : registry_status option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({ status = status_; registry_arn = registry_arn_; registry_name = registry_name_ }
    : delete_registry_response)

let make_delete_registry_input ~registry_id:(registry_id_ : registry_id) () =
  ({ registry_id = registry_id_ } : delete_registry_input)

let make_delete_partition_response () = (() : unit)

let make_delete_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partition_values:(partition_values_ : value_string_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     partition_values = partition_values_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : delete_partition_request)

let make_delete_partition_index_response () = (() : unit)

let make_delete_partition_index_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~index_name:(index_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     index_name = index_name_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : delete_partition_index_request)

let make_delete_ml_transform_response ?transform_id:(transform_id_ : hash_string option) () =
  ({ transform_id = transform_id_ } : delete_ml_transform_response)

let make_delete_ml_transform_request ~transform_id:(transform_id_ : hash_string) () =
  ({ transform_id = transform_id_ } : delete_ml_transform_request)

let make_delete_job_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : delete_job_response)

let make_delete_job_request ~job_name:(job_name_ : name_string) () =
  ({ job_name = job_name_ } : delete_job_request)

let make_delete_integration_table_properties_response () = (() : unit)

let make_delete_integration_table_properties_request ~table_name:(table_name_ : string128)
    ~resource_arn:(resource_arn_ : string512) () =
  ({ table_name = table_name_; resource_arn = resource_arn_ }
    : delete_integration_table_properties_request)

let make_delete_integration_response ?data_filter:(data_filter_ : string2048 option)
    ?errors:(errors_ : integration_error_list option) ?tags:(tags_ : integration_tags_list option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?description:(description_ : integration_description option)
    ~create_time:(create_time_ : integration_timestamp) ~status:(status_ : integration_status)
    ~integration_arn:(integration_arn_ : string128)
    ~integration_name:(integration_name_ : string128) ~target_arn:(target_arn_ : string512)
    ~source_arn:(source_arn_ : string512) () =
  ({
     data_filter = data_filter_;
     errors = errors_;
     create_time = create_time_;
     status = status_;
     tags = tags_;
     additional_encryption_context = additional_encryption_context_;
     kms_key_id = kms_key_id_;
     integration_arn = integration_arn_;
     description = description_;
     integration_name = integration_name_;
     target_arn = target_arn_;
     source_arn = source_arn_;
   }
    : delete_integration_response)

let make_delete_integration_resource_property_response () = (() : unit)

let make_delete_integration_resource_property_request ~resource_arn:(resource_arn_ : string512) () =
  ({ resource_arn = resource_arn_ } : delete_integration_resource_property_request)

let make_delete_integration_request ~integration_identifier:(integration_identifier_ : string128) ()
    =
  ({ integration_identifier = integration_identifier_ } : delete_integration_request)

let make_delete_glue_identity_center_configuration_response () = (() : unit)
let make_delete_glue_identity_center_configuration_request () = (() : unit)
let make_delete_glossary_term_response () = (() : unit)

let make_delete_glossary_term_request ~identifier:(identifier_ : glossary_term_id) () =
  ({ identifier = identifier_ } : delete_glossary_term_request)

let make_delete_glossary_response () = (() : unit)

let make_delete_glossary_request ~identifier:(identifier_ : glossary_id) () =
  ({ identifier = identifier_ } : delete_glossary_request)

let make_delete_form_type_response () = (() : unit)

let make_delete_form_type_request ~identifier:(identifier_ : form_type_id) () =
  ({ identifier = identifier_ } : delete_form_type_request)

let make_delete_dev_endpoint_response () = (() : unit)

let make_delete_dev_endpoint_request ~endpoint_name:(endpoint_name_ : generic_string) () =
  ({ endpoint_name = endpoint_name_ } : delete_dev_endpoint_request)

let make_delete_database_response () = (() : unit)

let make_delete_database_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~name:(name_ : name_string) () =
  ({ name = name_; catalog_id = catalog_id_ } : delete_database_request)

let make_delete_data_quality_ruleset_response () = (() : unit)

let make_delete_data_quality_ruleset_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_data_quality_ruleset_request)

let make_delete_custom_entity_type_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : delete_custom_entity_type_response)

let make_delete_custom_entity_type_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_custom_entity_type_request)

let make_delete_crawler_response () = (() : unit)

let make_delete_crawler_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_crawler_request)

let make_delete_connection_type_response () = (() : unit)

let make_delete_connection_type_request ~connection_type:(connection_type_ : name_string) () =
  ({ connection_type = connection_type_ } : delete_connection_type_request)

let make_delete_connection_response () = (() : unit)

let make_delete_connection_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~connection_name:(connection_name_ : name_string) () =
  ({ connection_name = connection_name_; catalog_id = catalog_id_ } : delete_connection_request)

let make_delete_column_statistics_task_settings_response () = (() : unit)

let make_delete_column_statistics_task_settings_request ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({ table_name = table_name_; database_name = database_name_ }
    : delete_column_statistics_task_settings_request)

let make_delete_column_statistics_for_table_response () = (() : unit)

let make_delete_column_statistics_for_table_request
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~column_name:(column_name_ : name_string)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     column_name = column_name_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : delete_column_statistics_for_table_request)

let make_delete_column_statistics_for_partition_response () = (() : unit)

let make_delete_column_statistics_for_partition_request
    ?catalog_id:(catalog_id_ : catalog_id_string option) ~column_name:(column_name_ : name_string)
    ~partition_values:(partition_values_ : value_string_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     column_name = column_name_;
     partition_values = partition_values_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : delete_column_statistics_for_partition_request)

let make_delete_classifier_response () = (() : unit)

let make_delete_classifier_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_classifier_request)

let make_delete_catalog_response () = (() : unit)

let make_delete_catalog_request ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({ catalog_id = catalog_id_ } : delete_catalog_request)

let make_delete_blueprint_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : delete_blueprint_response)

let make_delete_blueprint_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_blueprint_request)

let make_delete_attachment_response ?asset_identifier:(asset_identifier_ : asset_id option) () =
  ({ asset_identifier = asset_identifier_ } : delete_attachment_response)

let make_delete_attachment_request ?item_identifier:(item_identifier_ : item_identifier option)
    ?iterable_form_name:(iterable_form_name_ : iterable_form_name option)
    ~attachment_name:(attachment_name_ : attachment_name)
    ~asset_identifier:(asset_identifier_ : asset_id) () =
  ({
     attachment_name = attachment_name_;
     item_identifier = item_identifier_;
     iterable_form_name = iterable_form_name_;
     asset_identifier = asset_identifier_;
   }
    : delete_attachment_request)

let make_delete_asset_type_response () = (() : unit)

let make_delete_asset_type_request ~identifier:(identifier_ : asset_type_id) () =
  ({ identifier = identifier_ } : delete_asset_type_request)

let make_delete_asset_response () = (() : unit)

let make_delete_asset_request ~identifier:(identifier_ : asset_id) () =
  ({ identifier = identifier_ } : delete_asset_request)

let make_create_xml_classifier_request ?row_tag:(row_tag_ : row_tag option)
    ~name:(name_ : name_string) ~classification:(classification_ : classification) () =
  ({ row_tag = row_tag_; name = name_; classification = classification_ }
    : create_xml_classifier_request)

let make_create_workflow_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_workflow_response)

let make_create_workflow_request
    ?max_concurrent_runs:(max_concurrent_runs_ : nullable_integer option)
    ?tags:(tags_ : tags_map option)
    ?default_run_properties:(default_run_properties_ : workflow_run_properties option)
    ?description:(description_ : workflow_description_string option) ~name:(name_ : name_string) ()
    =
  ({
     max_concurrent_runs = max_concurrent_runs_;
     tags = tags_;
     default_run_properties = default_run_properties_;
     description = description_;
     name = name_;
   }
    : create_workflow_request)

let make_create_user_defined_function_response () = (() : unit)

let make_create_user_defined_function_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~function_input:(function_input_ : user_defined_function_input)
    ~database_name:(database_name_ : name_string) () =
  ({ function_input = function_input_; database_name = database_name_; catalog_id = catalog_id_ }
    : create_user_defined_function_request)

let make_create_usage_profile_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_usage_profile_response)

let make_create_usage_profile_request ?tags:(tags_ : tags_map option)
    ?description:(description_ : description_string option)
    ~configuration:(configuration_ : profile_configuration) ~name:(name_ : name_string) () =
  ({ tags = tags_; configuration = configuration_; description = description_; name = name_ }
    : create_usage_profile_request)

let make_create_trigger_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_trigger_response)

let make_create_trigger_request
    ?event_batching_condition:(event_batching_condition_ : event_batching_condition option)
    ?tags:(tags_ : tags_map option) ?start_on_creation:(start_on_creation_ : boolean_value option)
    ?description:(description_ : description_string option)
    ?predicate:(predicate_ : predicate option) ?schedule:(schedule_ : generic_string option)
    ?workflow_name:(workflow_name_ : name_string option) ~actions:(actions_ : action_list)
    ~type_:(type__ : trigger_type) ~name:(name_ : name_string) () =
  ({
     event_batching_condition = event_batching_condition_;
     tags = tags_;
     start_on_creation = start_on_creation_;
     description = description_;
     actions = actions_;
     predicate = predicate_;
     schedule = schedule_;
     type_ = type__;
     workflow_name = workflow_name_;
     name = name_;
   }
    : create_trigger_request)

let make_create_table_response () = (() : unit)

let make_create_table_request
    ?open_table_format_input:(open_table_format_input_ : open_table_format_input option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?partition_indexes:(partition_indexes_ : partition_index_list option)
    ?table_input:(table_input_ : table_input option) ?name:(name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) () =
  ({
     open_table_format_input = open_table_format_input_;
     transaction_id = transaction_id_;
     partition_indexes = partition_indexes_;
     table_input = table_input_;
     name = name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : create_table_request)

let make_create_table_optimizer_response () = (() : unit)

let make_create_table_optimizer_request
    ~table_optimizer_configuration:(table_optimizer_configuration_ : table_optimizer_configuration)
    ~type_:(type__ : table_optimizer_type) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({
     table_optimizer_configuration = table_optimizer_configuration_;
     type_ = type__;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : create_table_optimizer_request)

let make_create_session_response ?session:(session_ : session option) () =
  ({ session = session_ } : create_session_response)

let make_create_session_request ?session_type:(session_type_ : session_type option)
    ?request_origin:(request_origin_ : orchestration_name_string option)
    ?tags:(tags_ : tags_map option) ?glue_version:(glue_version_ : glue_version_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?connections:(connections_ : connections_list option)
    ?default_arguments:(default_arguments_ : orchestration_arguments_map option)
    ?idle_timeout:(idle_timeout_ : timeout option) ?timeout:(timeout_ : timeout option)
    ?description:(description_ : description_string option) ~command:(command_ : session_command)
    ~role:(role_ : orchestration_role_arn) ~id:(id_ : name_string) () =
  ({
     session_type = session_type_;
     request_origin = request_origin_;
     tags = tags_;
     glue_version = glue_version_;
     security_configuration = security_configuration_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     max_capacity = max_capacity_;
     connections = connections_;
     default_arguments = default_arguments_;
     idle_timeout = idle_timeout_;
     timeout = timeout_;
     command = command_;
     role = role_;
     description = description_;
     id = id_;
   }
    : create_session_request)

let make_create_security_configuration_response
    ?created_timestamp:(created_timestamp_ : timestamp_value option)
    ?name:(name_ : name_string option) () =
  ({ created_timestamp = created_timestamp_; name = name_ }
    : create_security_configuration_response)

let make_create_security_configuration_request
    ~encryption_configuration:(encryption_configuration_ : encryption_configuration)
    ~name:(name_ : name_string) () =
  ({ encryption_configuration = encryption_configuration_; name = name_ }
    : create_security_configuration_request)

let make_create_script_response ?scala_code:(scala_code_ : scala_code option)
    ?python_script:(python_script_ : python_script option) () =
  ({ scala_code = scala_code_; python_script = python_script_ } : create_script_response)

let make_create_script_request ?language:(language_ : language option)
    ?dag_edges:(dag_edges_ : dag_edges option) ?dag_nodes:(dag_nodes_ : dag_nodes option) () =
  ({ language = language_; dag_edges = dag_edges_; dag_nodes = dag_nodes_ } : create_script_request)

let make_create_schema_response
    ?schema_version_status:(schema_version_status_ : schema_version_status option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?tags:(tags_ : tags_map option) ?schema_status:(schema_status_ : schema_status option)
    ?next_schema_version:(next_schema_version_ : version_long_number option)
    ?latest_schema_version:(latest_schema_version_ : version_long_number option)
    ?schema_checkpoint:(schema_checkpoint_ : schema_checkpoint_number option)
    ?compatibility:(compatibility_ : compatibility option)
    ?data_format:(data_format_ : data_format option)
    ?description:(description_ : description_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({
     schema_version_status = schema_version_status_;
     schema_version_id = schema_version_id_;
     tags = tags_;
     schema_status = schema_status_;
     next_schema_version = next_schema_version_;
     latest_schema_version = latest_schema_version_;
     schema_checkpoint = schema_checkpoint_;
     compatibility = compatibility_;
     data_format = data_format_;
     description = description_;
     schema_arn = schema_arn_;
     schema_name = schema_name_;
     registry_arn = registry_arn_;
     registry_name = registry_name_;
   }
    : create_schema_response)

let make_create_schema_input
    ?schema_definition:(schema_definition_ : schema_definition_string option)
    ?tags:(tags_ : tags_map option) ?description:(description_ : description_string option)
    ?compatibility:(compatibility_ : compatibility option)
    ?registry_id:(registry_id_ : registry_id option) ~data_format:(data_format_ : data_format)
    ~schema_name:(schema_name_ : schema_registry_name_string) () =
  ({
     schema_definition = schema_definition_;
     tags = tags_;
     description = description_;
     compatibility = compatibility_;
     data_format = data_format_;
     schema_name = schema_name_;
     registry_id = registry_id_;
   }
    : create_schema_input)

let make_create_registry_response ?tags:(tags_ : tags_map option)
    ?description:(description_ : description_string option)
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option) () =
  ({
     tags = tags_;
     description = description_;
     registry_name = registry_name_;
     registry_arn = registry_arn_;
   }
    : create_registry_response)

let make_create_registry_input ?tags:(tags_ : tags_map option)
    ?description:(description_ : description_string option)
    ~registry_name:(registry_name_ : schema_registry_name_string) () =
  ({ tags = tags_; description = description_; registry_name = registry_name_ }
    : create_registry_input)

let make_create_partition_response () = (() : unit)

let make_create_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partition_input:(partition_input_ : partition_input) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     partition_input = partition_input_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : create_partition_request)

let make_create_partition_index_response () = (() : unit)

let make_create_partition_index_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partition_index:(partition_index_ : partition_index) ~table_name:(table_name_ : name_string)
    ~database_name:(database_name_ : name_string) () =
  ({
     partition_index = partition_index_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : create_partition_index_request)

let make_create_ml_transform_response ?transform_id:(transform_id_ : hash_string option) () =
  ({ transform_id = transform_id_ } : create_ml_transform_response)

let make_create_ml_transform_request
    ?transform_encryption:(transform_encryption_ : transform_encryption option)
    ?tags:(tags_ : tags_map option) ?max_retries:(max_retries_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?description:(description_ : description_string option) ~role:(role_ : role_string)
    ~parameters:(parameters_ : transform_parameters)
    ~input_record_tables:(input_record_tables_ : glue_tables) ~name:(name_ : name_string) () =
  ({
     transform_encryption = transform_encryption_;
     tags = tags_;
     max_retries = max_retries_;
     timeout = timeout_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     max_capacity = max_capacity_;
     glue_version = glue_version_;
     role = role_;
     parameters = parameters_;
     input_record_tables = input_record_tables_;
     description = description_;
     name = name_;
   }
    : create_ml_transform_request)

let make_create_json_classifier_request ~json_path:(json_path_ : json_path)
    ~name:(name_ : name_string) () =
  ({ json_path = json_path_; name = name_ } : create_json_classifier_request)

let make_create_job_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_job_response)

let make_create_job_request ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?source_control_details:(source_control_details_ : source_control_details option)
    ?execution_class:(execution_class_ : execution_class option)
    ?code_gen_configuration_nodes:
      (code_gen_configuration_nodes_ : code_gen_configuration_nodes option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?tags:(tags_ : tags_map option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?max_capacity:(max_capacity_ : nullable_double option) ?timeout:(timeout_ : timeout option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?max_retries:(max_retries_ : max_retries option)
    ?connections:(connections_ : connections_list option)
    ?non_overridable_arguments:(non_overridable_arguments_ : generic_map option)
    ?default_arguments:(default_arguments_ : generic_map option)
    ?execution_property:(execution_property_ : execution_property option)
    ?log_uri:(log_uri_ : uri_string option) ?description:(description_ : description_string option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?job_mode:(job_mode_ : job_mode option) ~command:(command_ : job_command)
    ~role:(role_ : role_string) ~name:(name_ : name_string) () =
  ({
     maintenance_window = maintenance_window_;
     source_control_details = source_control_details_;
     execution_class = execution_class_;
     code_gen_configuration_nodes = code_gen_configuration_nodes_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     glue_version = glue_version_;
     notification_property = notification_property_;
     tags = tags_;
     security_configuration = security_configuration_;
     max_capacity = max_capacity_;
     timeout = timeout_;
     allocated_capacity = allocated_capacity_;
     max_retries = max_retries_;
     connections = connections_;
     non_overridable_arguments = non_overridable_arguments_;
     default_arguments = default_arguments_;
     command = command_;
     execution_property = execution_property_;
     role = role_;
     log_uri = log_uri_;
     description = description_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     job_mode = job_mode_;
     name = name_;
   }
    : create_job_request)

let make_create_integration_table_properties_response () = (() : unit)

let make_create_integration_table_properties_request
    ?target_table_config:(target_table_config_ : target_table_config option)
    ?source_table_config:(source_table_config_ : source_table_config option)
    ~table_name:(table_name_ : string128) ~resource_arn:(resource_arn_ : string512) () =
  ({
     target_table_config = target_table_config_;
     source_table_config = source_table_config_;
     table_name = table_name_;
     resource_arn = resource_arn_;
   }
    : create_integration_table_properties_request)

let make_create_integration_response
    ?integration_config:(integration_config_ : integration_config option)
    ?data_filter:(data_filter_ : string2048 option)
    ?errors:(errors_ : integration_error_list option) ?tags:(tags_ : integration_tags_list option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?description:(description_ : integration_description option)
    ~create_time:(create_time_ : integration_timestamp) ~status:(status_ : integration_status)
    ~integration_arn:(integration_arn_ : string128)
    ~integration_name:(integration_name_ : string128) ~target_arn:(target_arn_ : string512)
    ~source_arn:(source_arn_ : string512) () =
  ({
     integration_config = integration_config_;
     data_filter = data_filter_;
     errors = errors_;
     create_time = create_time_;
     status = status_;
     tags = tags_;
     additional_encryption_context = additional_encryption_context_;
     kms_key_id = kms_key_id_;
     integration_arn = integration_arn_;
     description = description_;
     integration_name = integration_name_;
     target_arn = target_arn_;
     source_arn = source_arn_;
   }
    : create_integration_response)

let make_create_integration_resource_property_response
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ~resource_arn:(resource_arn_ : string512) () =
  ({
     target_processing_properties = target_processing_properties_;
     source_processing_properties = source_processing_properties_;
     resource_property_arn = resource_property_arn_;
     resource_arn = resource_arn_;
   }
    : create_integration_resource_property_response)

let make_create_integration_resource_property_request ?tags:(tags_ : integration_tags_list option)
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ~resource_arn:(resource_arn_ : string512) () =
  ({
     tags = tags_;
     target_processing_properties = target_processing_properties_;
     source_processing_properties = source_processing_properties_;
     resource_arn = resource_arn_;
   }
    : create_integration_resource_property_request)

let make_create_integration_request
    ?integration_config:(integration_config_ : integration_config option)
    ?tags:(tags_ : integration_tags_list option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?kms_key_id:(kms_key_id_ : string2048 option) ?data_filter:(data_filter_ : string2048 option)
    ?description:(description_ : integration_description option)
    ~target_arn:(target_arn_ : string512) ~source_arn:(source_arn_ : string512)
    ~integration_name:(integration_name_ : string128) () =
  ({
     integration_config = integration_config_;
     tags = tags_;
     additional_encryption_context = additional_encryption_context_;
     kms_key_id = kms_key_id_;
     data_filter = data_filter_;
     description = description_;
     target_arn = target_arn_;
     source_arn = source_arn_;
     integration_name = integration_name_;
   }
    : create_integration_request)

let make_create_grok_classifier_request ?custom_patterns:(custom_patterns_ : custom_patterns option)
    ~grok_pattern:(grok_pattern_ : grok_pattern) ~name:(name_ : name_string)
    ~classification:(classification_ : classification) () =
  ({
     custom_patterns = custom_patterns_;
     grok_pattern = grok_pattern_;
     name = name_;
     classification = classification_;
   }
    : create_grok_classifier_request)

let make_create_glue_identity_center_configuration_response
    ?application_arn:(application_arn_ : application_arn option) () =
  ({ application_arn = application_arn_ } : create_glue_identity_center_configuration_response)

let make_create_glue_identity_center_configuration_request
    ?user_background_sessions_enabled:(user_background_sessions_enabled_ : nullable_boolean option)
    ?scopes:(scopes_ : identity_center_scopes_list option)
    ~instance_arn:(instance_arn_ : identity_center_instance_arn) () =
  ({
     user_background_sessions_enabled = user_background_sessions_enabled_;
     scopes = scopes_;
     instance_arn = instance_arn_;
   }
    : create_glue_identity_center_configuration_request)

let make_create_glossary_term_response
    ?long_description:(long_description_ : glossary_long_description option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?name:(name_ : glossary_term_name option) ?glossary_id:(glossary_id_ : glossary_id option)
    ?id:(id_ : glossary_term_id option) () =
  ({
     long_description = long_description_;
     short_description = short_description_;
     name = name_;
     glossary_id = glossary_id_;
     id = id_;
   }
    : create_glossary_term_response)

let make_create_glossary_term_request ?client_token:(client_token_ : hash_string option)
    ?long_description:(long_description_ : glossary_long_description option)
    ?short_description:(short_description_ : glossary_short_description option)
    ~name:(name_ : glossary_term_name) ~glossary_identifier:(glossary_identifier_ : glossary_id) ()
    =
  ({
     client_token = client_token_;
     long_description = long_description_;
     short_description = short_description_;
     name = name_;
     glossary_identifier = glossary_identifier_;
   }
    : create_glossary_term_request)

let make_create_glossary_response ?description:(description_ : metadata_description option)
    ?name:(name_ : glossary_name option) ?id:(id_ : glossary_id option) () =
  ({ description = description_; name = name_; id = id_ } : create_glossary_response)

let make_create_glossary_request ?client_token:(client_token_ : hash_string option)
    ?description:(description_ : metadata_description option) ~name:(name_ : glossary_name) () =
  ({ client_token = client_token_; description = description_; name = name_ }
    : create_glossary_request)

let make_create_dev_endpoint_response ?arguments:(arguments_ : map_value option)
    ?created_timestamp:(created_timestamp_ : timestamp_value option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?failure_reason:(failure_reason_ : generic_string option)
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option)
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option)
    ?vpc_id:(vpc_id_ : generic_string option)
    ?availability_zone:(availability_zone_ : generic_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_nodes:(number_of_nodes_ : integer_value option)
    ?zeppelin_remote_spark_interpreter_port:
      (zeppelin_remote_spark_interpreter_port_ : integer_value option)
    ?yarn_endpoint_address:(yarn_endpoint_address_ : generic_string option)
    ?role_arn:(role_arn_ : role_arn option) ?subnet_id:(subnet_id_ : generic_string option)
    ?security_group_ids:(security_group_ids_ : string_list option)
    ?status:(status_ : generic_string option)
    ?endpoint_name:(endpoint_name_ : generic_string option) () =
  ({
     arguments = arguments_;
     created_timestamp = created_timestamp_;
     security_configuration = security_configuration_;
     failure_reason = failure_reason_;
     extra_jars_s3_path = extra_jars_s3_path_;
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
     vpc_id = vpc_id_;
     availability_zone = availability_zone_;
     number_of_workers = number_of_workers_;
     glue_version = glue_version_;
     worker_type = worker_type_;
     number_of_nodes = number_of_nodes_;
     zeppelin_remote_spark_interpreter_port = zeppelin_remote_spark_interpreter_port_;
     yarn_endpoint_address = yarn_endpoint_address_;
     role_arn = role_arn_;
     subnet_id = subnet_id_;
     security_group_ids = security_group_ids_;
     status = status_;
     endpoint_name = endpoint_name_;
   }
    : create_dev_endpoint_response)

let make_create_dev_endpoint_request ?arguments:(arguments_ : map_value option)
    ?tags:(tags_ : tags_map option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option)
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_nodes:(number_of_nodes_ : integer_value option)
    ?public_keys:(public_keys_ : public_keys_list option)
    ?public_key:(public_key_ : generic_string option)
    ?subnet_id:(subnet_id_ : generic_string option)
    ?security_group_ids:(security_group_ids_ : string_list option) ~role_arn:(role_arn_ : role_arn)
    ~endpoint_name:(endpoint_name_ : generic_string) () =
  ({
     arguments = arguments_;
     tags = tags_;
     security_configuration = security_configuration_;
     extra_jars_s3_path = extra_jars_s3_path_;
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
     number_of_workers = number_of_workers_;
     glue_version = glue_version_;
     worker_type = worker_type_;
     number_of_nodes = number_of_nodes_;
     public_keys = public_keys_;
     public_key = public_key_;
     subnet_id = subnet_id_;
     security_group_ids = security_group_ids_;
     role_arn = role_arn_;
     endpoint_name = endpoint_name_;
   }
    : create_dev_endpoint_request)

let make_create_database_response () = (() : unit)

let make_create_database_request ?tags:(tags_ : tags_map option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_input:(database_input_ : database_input) () =
  ({ tags = tags_; database_input = database_input_; catalog_id = catalog_id_ }
    : create_database_request)

let make_create_data_quality_ruleset_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_data_quality_ruleset_response)

let make_create_data_quality_ruleset_request ?client_token:(client_token_ : hash_string option)
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    ?target_table:(target_table_ : data_quality_target_table option) ?tags:(tags_ : tags_map option)
    ?description:(description_ : description_string option)
    ~ruleset:(ruleset_ : data_quality_ruleset_string) ~name:(name_ : name_string) () =
  ({
     client_token = client_token_;
     data_quality_security_configuration = data_quality_security_configuration_;
     target_table = target_table_;
     tags = tags_;
     ruleset = ruleset_;
     description = description_;
     name = name_;
   }
    : create_data_quality_ruleset_request)

let make_create_custom_entity_type_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_custom_entity_type_response)

let make_create_custom_entity_type_request ?tags:(tags_ : tags_map option)
    ?context_words:(context_words_ : context_words option)
    ~regex_string:(regex_string_ : name_string) ~name:(name_ : name_string) () =
  ({ tags = tags_; context_words = context_words_; regex_string = regex_string_; name = name_ }
    : create_custom_entity_type_request)

let make_create_csv_classifier_request ?serde:(serde_ : csv_serde_option option)
    ?custom_datatypes:(custom_datatypes_ : custom_datatypes option)
    ?custom_datatype_configured:(custom_datatype_configured_ : nullable_boolean option)
    ?allow_single_column:(allow_single_column_ : nullable_boolean option)
    ?disable_value_trimming:(disable_value_trimming_ : nullable_boolean option)
    ?header:(header_ : csv_header option)
    ?contains_header:(contains_header_ : csv_header_option option)
    ?quote_symbol:(quote_symbol_ : csv_quote_symbol option)
    ?delimiter:(delimiter_ : csv_column_delimiter option) ~name:(name_ : name_string) () =
  ({
     serde = serde_;
     custom_datatypes = custom_datatypes_;
     custom_datatype_configured = custom_datatype_configured_;
     allow_single_column = allow_single_column_;
     disable_value_trimming = disable_value_trimming_;
     header = header_;
     contains_header = contains_header_;
     quote_symbol = quote_symbol_;
     delimiter = delimiter_;
     name = name_;
   }
    : create_csv_classifier_request)

let make_create_crawler_response () = (() : unit)

let make_create_crawler_request ?tags:(tags_ : tags_map option)
    ?crawler_security_configuration:
      (crawler_security_configuration_ : crawler_security_configuration option)
    ?configuration:(configuration_ : crawler_configuration option)
    ?lake_formation_configuration:
      (lake_formation_configuration_ : lake_formation_configuration option)
    ?lineage_configuration:(lineage_configuration_ : lineage_configuration option)
    ?recrawl_policy:(recrawl_policy_ : recrawl_policy option)
    ?schema_change_policy:(schema_change_policy_ : schema_change_policy option)
    ?table_prefix:(table_prefix_ : table_prefix option)
    ?classifiers:(classifiers_ : classifier_name_list option)
    ?schedule:(schedule_ : cron_expression option)
    ?description:(description_ : description_string option)
    ?database_name:(database_name_ : database_name option) ~targets:(targets_ : crawler_targets)
    ~role:(role_ : role) ~name:(name_ : name_string) () =
  ({
     tags = tags_;
     crawler_security_configuration = crawler_security_configuration_;
     configuration = configuration_;
     lake_formation_configuration = lake_formation_configuration_;
     lineage_configuration = lineage_configuration_;
     recrawl_policy = recrawl_policy_;
     schema_change_policy = schema_change_policy_;
     table_prefix = table_prefix_;
     classifiers = classifiers_;
     schedule = schedule_;
     targets = targets_;
     description = description_;
     database_name = database_name_;
     role = role_;
     name = name_;
   }
    : create_crawler_request)

let make_create_connection_response
    ?create_connection_status:(create_connection_status_ : connection_status option) () =
  ({ create_connection_status = create_connection_status_ } : create_connection_response)

let make_create_connection_request ?tags:(tags_ : tags_map option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~connection_input:(connection_input_ : connection_input) () =
  ({ tags = tags_; connection_input = connection_input_; catalog_id = catalog_id_ }
    : create_connection_request)

let make_create_column_statistics_task_settings_response () = (() : unit)

let make_create_column_statistics_task_settings_request ?tags:(tags_ : tags_map option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?catalog_i_d:(catalog_i_d_ : name_string option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?schedule:(schedule_ : cron_expression option) ~role:(role_ : name_string)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     tags = tags_;
     security_configuration = security_configuration_;
     catalog_i_d = catalog_i_d_;
     sample_size = sample_size_;
     column_name_list = column_name_list_;
     schedule = schedule_;
     role = role_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : create_column_statistics_task_settings_request)

let make_create_classifier_response () = (() : unit)

let make_create_classifier_request
    ?csv_classifier:(csv_classifier_ : create_csv_classifier_request option)
    ?json_classifier:(json_classifier_ : create_json_classifier_request option)
    ?xml_classifier:(xml_classifier_ : create_xml_classifier_request option)
    ?grok_classifier:(grok_classifier_ : create_grok_classifier_request option) () =
  ({
     csv_classifier = csv_classifier_;
     json_classifier = json_classifier_;
     xml_classifier = xml_classifier_;
     grok_classifier = grok_classifier_;
   }
    : create_classifier_request)

let make_create_catalog_response () = (() : unit)

let make_create_catalog_request ?tags:(tags_ : tags_map option)
    ~catalog_input:(catalog_input_ : catalog_input) ~name:(name_ : catalog_name_string) () =
  ({ tags = tags_; catalog_input = catalog_input_; name = name_ } : create_catalog_request)

let make_create_blueprint_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_blueprint_response)

let make_create_blueprint_request ?tags:(tags_ : tags_map option)
    ?description:(description_ : generic512_char_string option)
    ~blueprint_location:(blueprint_location_ : orchestration_s3_location)
    ~name:(name_ : orchestration_name_string) () =
  ({
     tags = tags_;
     blueprint_location = blueprint_location_;
     description = description_;
     name = name_;
   }
    : create_blueprint_request)

let make_check_schema_version_validity_response ?error:(error_ : schema_validation_error option)
    ?valid:(valid_ : is_version_valid option) () =
  ({ error = error_; valid = valid_ } : check_schema_version_validity_response)

let make_check_schema_version_validity_input
    ~schema_definition:(schema_definition_ : schema_definition_string)
    ~data_format:(data_format_ : data_format) () =
  ({ schema_definition = schema_definition_; data_format = data_format_ }
    : check_schema_version_validity_input)

let make_cancel_statement_response () = (() : unit)

let make_cancel_statement_request
    ?request_origin:(request_origin_ : orchestration_name_string option) ~id:(id_ : integer_value)
    ~session_id:(session_id_ : name_string) () =
  ({ request_origin = request_origin_; id = id_; session_id = session_id_ }
    : cancel_statement_request)

let make_cancel_ml_task_run_response ?status:(status_ : task_status_type option)
    ?task_run_id:(task_run_id_ : hash_string option)
    ?transform_id:(transform_id_ : hash_string option) () =
  ({ status = status_; task_run_id = task_run_id_; transform_id = transform_id_ }
    : cancel_ml_task_run_response)

let make_cancel_ml_task_run_request ~task_run_id:(task_run_id_ : hash_string)
    ~transform_id:(transform_id_ : hash_string) () =
  ({ task_run_id = task_run_id_; transform_id = transform_id_ } : cancel_ml_task_run_request)

let make_cancel_data_quality_ruleset_evaluation_run_response () = (() : unit)

let make_cancel_data_quality_ruleset_evaluation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : cancel_data_quality_ruleset_evaluation_run_request)

let make_cancel_data_quality_rule_recommendation_run_response () = (() : unit)

let make_cancel_data_quality_rule_recommendation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : cancel_data_quality_rule_recommendation_run_request)

let make_batch_update_partition_failure_entry ?error_detail:(error_detail_ : error_detail option)
    ?partition_value_list:(partition_value_list_ : bounded_partition_value_list option) () =
  ({ error_detail = error_detail_; partition_value_list = partition_value_list_ }
    : batch_update_partition_failure_entry)

let make_batch_update_partition_response
    ?errors:(errors_ : batch_update_partition_failure_list option) () =
  ({ errors = errors_ } : batch_update_partition_response)

let make_batch_update_partition_request_entry ~partition_input:(partition_input_ : partition_input)
    ~partition_value_list:(partition_value_list_ : bounded_partition_value_list) () =
  ({ partition_input = partition_input_; partition_value_list = partition_value_list_ }
    : batch_update_partition_request_entry)

let make_batch_update_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~entries:(entries_ : batch_update_partition_request_entry_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     entries = entries_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_update_partition_request)

let make_batch_table_optimizer ?table_optimizer:(table_optimizer_ : table_optimizer option)
    ?table_name:(table_name_ : table_name_string option)
    ?database_name:(database_name_ : database_name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     table_optimizer = table_optimizer_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_table_optimizer)

let make_batch_stop_job_run_successful_submission ?job_run_id:(job_run_id_ : id_string option)
    ?job_name:(job_name_ : name_string option) () =
  ({ job_run_id = job_run_id_; job_name = job_name_ } : batch_stop_job_run_successful_submission)

let make_batch_stop_job_run_error ?error_detail:(error_detail_ : error_detail option)
    ?job_run_id:(job_run_id_ : id_string option) ?job_name:(job_name_ : name_string option) () =
  ({ error_detail = error_detail_; job_run_id = job_run_id_; job_name = job_name_ }
    : batch_stop_job_run_error)

let make_batch_stop_job_run_response ?errors:(errors_ : batch_stop_job_run_error_list option)
    ?successful_submissions:
      (successful_submissions_ : batch_stop_job_run_successful_submission_list option) () =
  ({ errors = errors_; successful_submissions = successful_submissions_ }
    : batch_stop_job_run_response)

let make_batch_stop_job_run_request ~job_run_ids:(job_run_ids_ : batch_stop_job_run_job_run_id_list)
    ~job_name:(job_name_ : name_string) () =
  ({ job_run_ids = job_run_ids_; job_name = job_name_ } : batch_stop_job_run_request)

let make_annotation_error ?failure_reason:(failure_reason_ : description_string option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?profile_id:(profile_id_ : hash_string option) () =
  ({ failure_reason = failure_reason_; statistic_id = statistic_id_; profile_id = profile_id_ }
    : annotation_error)

let make_batch_put_data_quality_statistic_annotation_response
    ?failed_inclusion_annotations:(failed_inclusion_annotations_ : annotation_error_list option) ()
    =
  ({ failed_inclusion_annotations = failed_inclusion_annotations_ }
    : batch_put_data_quality_statistic_annotation_response)

let make_batch_put_data_quality_statistic_annotation_request
    ?client_token:(client_token_ : hash_string option)
    ~inclusion_annotations:(inclusion_annotations_ : inclusion_annotation_list) () =
  ({ client_token = client_token_; inclusion_annotations = inclusion_annotations_ }
    : batch_put_data_quality_statistic_annotation_request)

let make_batch_get_workflows_response
    ?missing_workflows:(missing_workflows_ : workflow_names option)
    ?workflows:(workflows_ : workflows option) () =
  ({ missing_workflows = missing_workflows_; workflows = workflows_ }
    : batch_get_workflows_response)

let make_batch_get_workflows_request ?include_graph:(include_graph_ : nullable_boolean option)
    ~names:(names_ : workflow_names) () =
  ({ include_graph = include_graph_; names = names_ } : batch_get_workflows_request)

let make_batch_get_triggers_response
    ?triggers_not_found:(triggers_not_found_ : trigger_name_list option)
    ?triggers:(triggers_ : trigger_list option) () =
  ({ triggers_not_found = triggers_not_found_; triggers = triggers_ } : batch_get_triggers_response)

let make_batch_get_triggers_request ~trigger_names:(trigger_names_ : trigger_name_list) () =
  ({ trigger_names = trigger_names_ } : batch_get_triggers_request)

let make_batch_get_table_optimizer_error ?type_:(type__ : table_optimizer_type option)
    ?table_name:(table_name_ : table_name_string option)
    ?database_name:(database_name_ : database_name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ?error:(error_ : error_detail option) () =
  ({
     type_ = type__;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
     error = error_;
   }
    : batch_get_table_optimizer_error)

let make_batch_get_table_optimizer_response
    ?failures:(failures_ : batch_get_table_optimizer_errors option)
    ?table_optimizers:(table_optimizers_ : batch_table_optimizers option) () =
  ({ failures = failures_; table_optimizers = table_optimizers_ }
    : batch_get_table_optimizer_response)

let make_batch_get_table_optimizer_entry ?type_:(type__ : table_optimizer_type option)
    ?table_name:(table_name_ : table_name_string option)
    ?database_name:(database_name_ : database_name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     type_ = type__;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_get_table_optimizer_entry)

let make_batch_get_table_optimizer_request ~entries:(entries_ : batch_get_table_optimizer_entries)
    () =
  ({ entries = entries_ } : batch_get_table_optimizer_request)

let make_batch_get_partition_response
    ?unprocessed_keys:(unprocessed_keys_ : batch_get_partition_value_list option)
    ?partitions:(partitions_ : partition_list option) () =
  ({ unprocessed_keys = unprocessed_keys_; partitions = partitions_ }
    : batch_get_partition_response)

let make_batch_get_partition_request
    ?query_session_context:(query_session_context_ : query_session_context option)
    ?audit_context:(audit_context_ : audit_context option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partitions_to_get:(partitions_to_get_ : batch_get_partition_value_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     query_session_context = query_session_context_;
     audit_context = audit_context_;
     partitions_to_get = partitions_to_get_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_get_partition_request)

let make_batch_get_jobs_response ?jobs_not_found:(jobs_not_found_ : job_name_list option)
    ?jobs:(jobs_ : job_list option) () =
  ({ jobs_not_found = jobs_not_found_; jobs = jobs_ } : batch_get_jobs_response)

let make_batch_get_jobs_request ~job_names:(job_names_ : job_name_list) () =
  ({ job_names = job_names_ } : batch_get_jobs_request)

let make_batch_get_iterable_forms_response ?errors:(errors_ : item_error_list option)
    ?items:(items_ : iterable_form_item_list option) () =
  ({ errors = errors_; items = items_ } : batch_get_iterable_forms_response)

let make_batch_get_iterable_forms_request
    ~item_identifiers:(item_identifiers_ : item_identifier_list)
    ~iterable_form_name:(iterable_form_name_ : iterable_form_name)
    ~asset_identifier:(asset_identifier_ : asset_id) () =
  ({
     item_identifiers = item_identifiers_;
     iterable_form_name = iterable_form_name_;
     asset_identifier = asset_identifier_;
   }
    : batch_get_iterable_forms_request)

let make_batch_get_dev_endpoints_response
    ?dev_endpoints_not_found:(dev_endpoints_not_found_ : dev_endpoint_names option)
    ?dev_endpoints:(dev_endpoints_ : dev_endpoint_list option) () =
  ({ dev_endpoints_not_found = dev_endpoints_not_found_; dev_endpoints = dev_endpoints_ }
    : batch_get_dev_endpoints_response)

let make_batch_get_dev_endpoints_request
    ~dev_endpoint_names:(dev_endpoint_names_ : dev_endpoint_names) () =
  ({ dev_endpoint_names = dev_endpoint_names_ } : batch_get_dev_endpoints_request)

let make_batch_get_data_quality_result_response
    ?results_not_found:(results_not_found_ : data_quality_result_ids option)
    ~results:(results_ : data_quality_results_list) () =
  ({ results_not_found = results_not_found_; results = results_ }
    : batch_get_data_quality_result_response)

let make_batch_get_data_quality_result_request ~result_ids:(result_ids_ : data_quality_result_ids)
    () =
  ({ result_ids = result_ids_ } : batch_get_data_quality_result_request)

let make_batch_get_custom_entity_types_response
    ?custom_entity_types_not_found:
      (custom_entity_types_not_found_ : custom_entity_type_names option)
    ?custom_entity_types:(custom_entity_types_ : custom_entity_types option) () =
  ({
     custom_entity_types_not_found = custom_entity_types_not_found_;
     custom_entity_types = custom_entity_types_;
   }
    : batch_get_custom_entity_types_response)

let make_batch_get_custom_entity_types_request ~names:(names_ : custom_entity_type_names) () =
  ({ names = names_ } : batch_get_custom_entity_types_request)

let make_batch_get_crawlers_response
    ?crawlers_not_found:(crawlers_not_found_ : crawler_name_list option)
    ?crawlers:(crawlers_ : crawler_list option) () =
  ({ crawlers_not_found = crawlers_not_found_; crawlers = crawlers_ } : batch_get_crawlers_response)

let make_batch_get_crawlers_request ~crawler_names:(crawler_names_ : crawler_name_list) () =
  ({ crawler_names = crawler_names_ } : batch_get_crawlers_request)

let make_batch_get_blueprints_response
    ?missing_blueprints:(missing_blueprints_ : blueprint_names option)
    ?blueprints:(blueprints_ : blueprints option) () =
  ({ missing_blueprints = missing_blueprints_; blueprints = blueprints_ }
    : batch_get_blueprints_response)

let make_batch_get_blueprints_request
    ?include_parameter_spec:(include_parameter_spec_ : nullable_boolean option)
    ?include_blueprint:(include_blueprint_ : nullable_boolean option)
    ~names:(names_ : batch_get_blueprint_names) () =
  ({
     include_parameter_spec = include_parameter_spec_;
     include_blueprint = include_blueprint_;
     names = names_;
   }
    : batch_get_blueprints_request)

let make_batch_delete_table_version_response ?errors:(errors_ : table_version_errors option) () =
  ({ errors = errors_ } : batch_delete_table_version_response)

let make_batch_delete_table_version_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~version_ids:(version_ids_ : batch_delete_table_version_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     version_ids = version_ids_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_delete_table_version_request)

let make_batch_delete_table_response ?errors:(errors_ : table_errors option) () =
  ({ errors = errors_ } : batch_delete_table_response)

let make_batch_delete_table_request ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~tables_to_delete:(tables_to_delete_ : batch_delete_table_name_list)
    ~database_name:(database_name_ : name_string) () =
  ({
     transaction_id = transaction_id_;
     tables_to_delete = tables_to_delete_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_delete_table_request)

let make_batch_delete_partition_response ?errors:(errors_ : partition_errors option) () =
  ({ errors = errors_ } : batch_delete_partition_response)

let make_batch_delete_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partitions_to_delete:(partitions_to_delete_ : batch_delete_partition_value_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     partitions_to_delete = partitions_to_delete_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_delete_partition_request)

let make_batch_delete_connection_response ?errors:(errors_ : error_by_name option)
    ?succeeded:(succeeded_ : name_string_list option) () =
  ({ errors = errors_; succeeded = succeeded_ } : batch_delete_connection_response)

let make_batch_delete_connection_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~connection_name_list:(connection_name_list_ : delete_connection_name_list) () =
  ({ connection_name_list = connection_name_list_; catalog_id = catalog_id_ }
    : batch_delete_connection_request)

let make_batch_create_partition_response ?errors:(errors_ : partition_errors option) () =
  ({ errors = errors_ } : batch_create_partition_response)

let make_batch_create_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~partition_input_list:(partition_input_list_ : partition_input_list)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({
     partition_input_list = partition_input_list_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
   }
    : batch_create_partition_request)

let make_associate_glossary_terms_response
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option)
    ?asset_identifier:(asset_identifier_ : asset_id option) () =
  ({ glossary_terms = glossary_terms_; asset_identifier = asset_identifier_ }
    : associate_glossary_terms_response)

let make_associate_glossary_terms_request ?client_token:(client_token_ : hash_string option)
    ~glossary_term_identifiers:(glossary_term_identifiers_ : glossary_term_id_list)
    ~asset_identifier:(asset_identifier_ : asset_id) () =
  ({
     client_token = client_token_;
     glossary_term_identifiers = glossary_term_identifiers_;
     asset_identifier = asset_identifier_;
   }
    : associate_glossary_terms_request)
