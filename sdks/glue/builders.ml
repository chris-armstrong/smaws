open Types

let make_update_workflow_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : update_workflow_response)

let make_update_workflow_request ?description:(description_ : workflow_description_string option)
    ?default_run_properties:(default_run_properties_ : workflow_run_properties option)
    ?max_concurrent_runs:(max_concurrent_runs_ : nullable_integer option)
    ~name:(name_ : name_string) () =
  ({
     name = name_;
     description = description_;
     default_run_properties = default_run_properties_;
     max_concurrent_runs = max_concurrent_runs_;
   }
    : update_workflow_request)

let make_update_user_defined_function_response () = (() : unit)

let make_resource_uri ?resource_type:(resource_type_ : resource_type option)
    ?uri:(uri_ : ur_i option) () =
  ({ resource_type = resource_type_; uri = uri_ } : resource_uri)

let make_user_defined_function_input ?function_name:(function_name_ : name_string option)
    ?class_name:(class_name_ : name_string option) ?owner_name:(owner_name_ : name_string option)
    ?function_type:(function_type_ : function_type option)
    ?owner_type:(owner_type_ : principal_type option)
    ?resource_uris:(resource_uris_ : resource_uri_list option) () =
  ({
     function_name = function_name_;
     class_name = class_name_;
     owner_name = owner_name_;
     function_type = function_type_;
     owner_type = owner_type_;
     resource_uris = resource_uris_;
   }
    : user_defined_function_input)

let make_update_user_defined_function_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~function_name:(function_name_ : name_string)
    ~function_input:(function_input_ : user_defined_function_input) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     function_name = function_name_;
     function_input = function_input_;
   }
    : update_user_defined_function_request)

let make_update_usage_profile_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : update_usage_profile_response)

let make_configuration_object ?default_value:(default_value_ : config_value_string option)
    ?allowed_values:(allowed_values_ : allowed_values_string_list option)
    ?min_value:(min_value_ : config_value_string option)
    ?max_value:(max_value_ : config_value_string option) () =
  ({
     default_value = default_value_;
     allowed_values = allowed_values_;
     min_value = min_value_;
     max_value = max_value_;
   }
    : configuration_object)

let make_profile_configuration
    ?session_configuration:(session_configuration_ : configuration_map option)
    ?job_configuration:(job_configuration_ : configuration_map option) () =
  ({ session_configuration = session_configuration_; job_configuration = job_configuration_ }
    : profile_configuration)

let make_update_usage_profile_request ?description:(description_ : description_string option)
    ~name:(name_ : name_string) ~configuration:(configuration_ : profile_configuration) () =
  ({ name = name_; description = description_; configuration = configuration_ }
    : update_usage_profile_request)

let make_event_batching_condition ?batch_window:(batch_window_ : batch_window option)
    ~batch_size:(batch_size_ : batch_size) () =
  ({ batch_size = batch_size_; batch_window = batch_window_ } : event_batching_condition)

let make_condition ?logical_operator:(logical_operator_ : logical_operator option)
    ?job_name:(job_name_ : name_string option) ?state:(state_ : job_run_state option)
    ?crawler_name:(crawler_name_ : name_string option)
    ?crawl_state:(crawl_state_ : crawl_state option) () =
  ({
     logical_operator = logical_operator_;
     job_name = job_name_;
     state = state_;
     crawler_name = crawler_name_;
     crawl_state = crawl_state_;
   }
    : condition)

let make_predicate ?logical:(logical_ : logical option)
    ?conditions:(conditions_ : condition_list option) () =
  ({ logical = logical_; conditions = conditions_ } : predicate)

let make_notification_property ?notify_delay_after:(notify_delay_after_ : notify_delay_after option)
    () =
  ({ notify_delay_after = notify_delay_after_ } : notification_property)

let make_action ?job_name:(job_name_ : name_string option)
    ?arguments:(arguments_ : generic_map option) ?timeout:(timeout_ : timeout option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?crawler_name:(crawler_name_ : name_string option) () =
  ({
     job_name = job_name_;
     arguments = arguments_;
     timeout = timeout_;
     security_configuration = security_configuration_;
     notification_property = notification_property_;
     crawler_name = crawler_name_;
   }
    : action)

let make_trigger ?name:(name_ : name_string option)
    ?workflow_name:(workflow_name_ : name_string option) ?id:(id_ : id_string option)
    ?type_:(type__ : trigger_type option) ?state:(state_ : trigger_state option)
    ?description:(description_ : description_string option)
    ?schedule:(schedule_ : generic_string option) ?actions:(actions_ : action_list option)
    ?predicate:(predicate_ : predicate option)
    ?event_batching_condition:(event_batching_condition_ : event_batching_condition option) () =
  ({
     name = name_;
     workflow_name = workflow_name_;
     id = id_;
     type_ = type__;
     state = state_;
     description = description_;
     schedule = schedule_;
     actions = actions_;
     predicate = predicate_;
     event_batching_condition = event_batching_condition_;
   }
    : trigger)

let make_update_trigger_response ?trigger:(trigger_ : trigger option) () =
  ({ trigger = trigger_ } : update_trigger_response)

let make_trigger_update ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?schedule:(schedule_ : generic_string option) ?actions:(actions_ : action_list option)
    ?predicate:(predicate_ : predicate option)
    ?event_batching_condition:(event_batching_condition_ : event_batching_condition option) () =
  ({
     name = name_;
     description = description_;
     schedule = schedule_;
     actions = actions_;
     predicate = predicate_;
     event_batching_condition = event_batching_condition_;
   }
    : trigger_update)

let make_update_trigger_request ~name:(name_ : name_string)
    ~trigger_update:(trigger_update_ : trigger_update) () =
  ({ name = name_; trigger_update = trigger_update_ } : update_trigger_request)

let make_update_table_optimizer_response () = (() : unit)

let make_iceberg_orphan_file_deletion_configuration
    ?orphan_file_retention_period_in_days:
      (orphan_file_retention_period_in_days_ : nullable_integer option)
    ?location:(location_ : message_string option)
    ?run_rate_in_hours:(run_rate_in_hours_ : nullable_integer option) () =
  ({
     orphan_file_retention_period_in_days = orphan_file_retention_period_in_days_;
     location = location_;
     run_rate_in_hours = run_rate_in_hours_;
   }
    : iceberg_orphan_file_deletion_configuration)

let make_orphan_file_deletion_configuration
    ?iceberg_configuration:
      (iceberg_configuration_ : iceberg_orphan_file_deletion_configuration option) () =
  ({ iceberg_configuration = iceberg_configuration_ } : orphan_file_deletion_configuration)

let make_iceberg_retention_configuration
    ?snapshot_retention_period_in_days:
      (snapshot_retention_period_in_days_ : nullable_integer option)
    ?number_of_snapshots_to_retain:(number_of_snapshots_to_retain_ : nullable_integer option)
    ?clean_expired_files:(clean_expired_files_ : nullable_boolean option)
    ?run_rate_in_hours:(run_rate_in_hours_ : nullable_integer option) () =
  ({
     snapshot_retention_period_in_days = snapshot_retention_period_in_days_;
     number_of_snapshots_to_retain = number_of_snapshots_to_retain_;
     clean_expired_files = clean_expired_files_;
     run_rate_in_hours = run_rate_in_hours_;
   }
    : iceberg_retention_configuration)

let make_retention_configuration
    ?iceberg_configuration:(iceberg_configuration_ : iceberg_retention_configuration option) () =
  ({ iceberg_configuration = iceberg_configuration_ } : retention_configuration)

let make_iceberg_compaction_configuration ?strategy:(strategy_ : compaction_strategy option)
    ?min_input_files:(min_input_files_ : nullable_integer option)
    ?delete_file_threshold:(delete_file_threshold_ : nullable_integer option) () =
  ({
     strategy = strategy_;
     min_input_files = min_input_files_;
     delete_file_threshold = delete_file_threshold_;
   }
    : iceberg_compaction_configuration)

let make_compaction_configuration
    ?iceberg_configuration:(iceberg_configuration_ : iceberg_compaction_configuration option) () =
  ({ iceberg_configuration = iceberg_configuration_ } : compaction_configuration)

let make_table_optimizer_configuration ?role_arn:(role_arn_ : arn_string option)
    ?enabled:(enabled_ : nullable_boolean option)
    ?vpc_configuration:(vpc_configuration_ : table_optimizer_vpc_configuration option)
    ?compaction_configuration:(compaction_configuration_ : compaction_configuration option)
    ?retention_configuration:(retention_configuration_ : retention_configuration option)
    ?orphan_file_deletion_configuration:
      (orphan_file_deletion_configuration_ : orphan_file_deletion_configuration option) () =
  ({
     role_arn = role_arn_;
     enabled = enabled_;
     vpc_configuration = vpc_configuration_;
     compaction_configuration = compaction_configuration_;
     retention_configuration = retention_configuration_;
     orphan_file_deletion_configuration = orphan_file_deletion_configuration_;
   }
    : table_optimizer_configuration)

let make_update_table_optimizer_request ~catalog_id:(catalog_id_ : catalog_id_string)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~type_:(type__ : table_optimizer_type)
    ~table_optimizer_configuration:(table_optimizer_configuration_ : table_optimizer_configuration)
    () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     type_ = type__;
     table_optimizer_configuration = table_optimizer_configuration_;
   }
    : update_table_optimizer_request)

let make_update_table_response () = (() : unit)

let make_iceberg_encrypted_key ?encrypted_by_id:(encrypted_by_id_ : encryption_key_id_string option)
    ?properties:(properties_ : string_to_string_map option)
    ~key_id:(key_id_ : encryption_key_id_string)
    ~encrypted_key_metadata:(encrypted_key_metadata_ : encrypted_key_metadata_string) () =
  ({
     key_id = key_id_;
     encrypted_key_metadata = encrypted_key_metadata_;
     encrypted_by_id = encrypted_by_id_;
     properties = properties_;
   }
    : iceberg_encrypted_key)

let make_iceberg_sort_field ~source_id:(source_id_ : integer)
    ~transform:(transform_ : iceberg_transform_string)
    ~direction:(direction_ : iceberg_sort_direction) ~null_order:(null_order_ : iceberg_null_order)
    () =
  ({
     source_id = source_id_;
     transform = transform_;
     direction = direction_;
     null_order = null_order_;
   }
    : iceberg_sort_field)

let make_iceberg_sort_order ~order_id:(order_id_ : integer)
    ~fields:(fields_ : iceberg_sort_order_field_list) () =
  ({ order_id = order_id_; fields = fields_ } : iceberg_sort_order)

let make_iceberg_partition_field ?field_id:(field_id_ : integer option)
    ~source_id:(source_id_ : integer) ~transform:(transform_ : iceberg_transform_string)
    ~name:(name_ : column_name_string) () =
  ({ source_id = source_id_; transform = transform_; name = name_; field_id = field_id_ }
    : iceberg_partition_field)

let make_iceberg_partition_spec ?spec_id:(spec_id_ : integer option)
    ~fields:(fields_ : iceberg_partition_spec_field_list) () =
  ({ fields = fields_; spec_id = spec_id_ } : iceberg_partition_spec)

let make_iceberg_struct_field ?doc:(doc_ : comment_string option)
    ?initial_default:(initial_default_ : iceberg_document option)
    ?write_default:(write_default_ : iceberg_document option) ~id:(id_ : integer)
    ~name:(name_ : column_name_string) ~type_:(type__ : iceberg_document)
    ~required:(required_ : boolean_) () =
  ({
     id = id_;
     name = name_;
     type_ = type__;
     required = required_;
     doc = doc_;
     initial_default = initial_default_;
     write_default = write_default_;
   }
    : iceberg_struct_field)

let make_iceberg_schema ?schema_id:(schema_id_ : integer option)
    ?identifier_field_ids:(identifier_field_ids_ : integer_list option)
    ?type_:(type__ : iceberg_struct_type_enum option) ~fields:(fields_ : iceberg_struct_field_list)
    () =
  ({
     schema_id = schema_id_;
     identifier_field_ids = identifier_field_ids_;
     type_ = type__;
     fields = fields_;
   }
    : iceberg_schema)

let make_iceberg_table_update ?partition_spec:(partition_spec_ : iceberg_partition_spec option)
    ?sort_order:(sort_order_ : iceberg_sort_order option)
    ?properties:(properties_ : string_to_string_map option)
    ?action:(action_ : iceberg_update_action option)
    ?encryption_key:(encryption_key_ : iceberg_encrypted_key option)
    ?key_id:(key_id_ : encryption_key_id_string option) ~schema:(schema_ : iceberg_schema)
    ~location:(location_ : location_string) () =
  ({
     schema = schema_;
     partition_spec = partition_spec_;
     sort_order = sort_order_;
     location = location_;
     properties = properties_;
     action = action_;
     encryption_key = encryption_key_;
     key_id = key_id_;
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

let make_view_representation_input ?dialect:(dialect_ : view_dialect option)
    ?dialect_version:(dialect_version_ : view_dialect_version_string option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?validation_connection:(validation_connection_ : name_string option)
    ?view_expanded_text:(view_expanded_text_ : view_text_string option) () =
  ({
     dialect = dialect_;
     dialect_version = dialect_version_;
     view_original_text = view_original_text_;
     validation_connection = validation_connection_;
     view_expanded_text = view_expanded_text_;
   }
    : view_representation_input)

let make_view_definition_input ?is_protected:(is_protected_ : nullable_boolean option)
    ?definer:(definer_ : arn_string option)
    ?representations:(representations_ : view_representation_input_list option)
    ?view_version_id:(view_version_id_ : table_version_id option)
    ?view_version_token:(view_version_token_ : version_string option)
    ?refresh_seconds:(refresh_seconds_ : refresh_seconds option)
    ?last_refresh_type:(last_refresh_type_ : last_refresh_type option)
    ?sub_objects:(sub_objects_ : view_sub_objects_list option)
    ?sub_object_version_ids:(sub_object_version_ids_ : view_sub_object_version_ids_list option) () =
  ({
     is_protected = is_protected_;
     definer = definer_;
     representations = representations_;
     view_version_id = view_version_id_;
     view_version_token = view_version_token_;
     refresh_seconds = refresh_seconds_;
     last_refresh_type = last_refresh_type_;
     sub_objects = sub_objects_;
     sub_object_version_ids = sub_object_version_ids_;
   }
    : view_definition_input)

let make_table_identifier ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : name_string option) ?name:(name_ : name_string option)
    ?region:(region_ : name_string option) () =
  ({ catalog_id = catalog_id_; database_name = database_name_; name = name_; region = region_ }
    : table_identifier)

let make_column ?type_:(type__ : column_type_string option)
    ?comment:(comment_ : comment_string option) ?parameters:(parameters_ : parameters_map option)
    ~name:(name_ : name_string) () =
  ({ name = name_; type_ = type__; comment = comment_; parameters = parameters_ } : column)

let make_schema_id ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({ schema_arn = schema_arn_; schema_name = schema_name_; registry_name = registry_name_ }
    : schema_id)

let make_schema_reference ?schema_id:(schema_id_ : schema_id option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_version_number:(schema_version_number_ : version_long_number option) () =
  ({
     schema_id = schema_id_;
     schema_version_id = schema_version_id_;
     schema_version_number = schema_version_number_;
   }
    : schema_reference)

let make_skewed_info ?skewed_column_names:(skewed_column_names_ : name_string_list option)
    ?skewed_column_values:(skewed_column_values_ : column_value_string_list option)
    ?skewed_column_value_location_maps:(skewed_column_value_location_maps_ : location_map option) ()
    =
  ({
     skewed_column_names = skewed_column_names_;
     skewed_column_values = skewed_column_values_;
     skewed_column_value_location_maps = skewed_column_value_location_maps_;
   }
    : skewed_info)

let make_order ~column:(column_ : name_string) ~sort_order:(sort_order_ : integer_flag) () =
  ({ column = column_; sort_order = sort_order_ } : order)

let make_ser_de_info ?name:(name_ : name_string option)
    ?serialization_library:(serialization_library_ : name_string option)
    ?parameters:(parameters_ : parameters_map option) () =
  ({ name = name_; serialization_library = serialization_library_; parameters = parameters_ }
    : ser_de_info)

let make_storage_descriptor ?columns:(columns_ : column_list option)
    ?location:(location_ : location_string option)
    ?additional_locations:(additional_locations_ : location_string_list option)
    ?input_format:(input_format_ : format_string option)
    ?output_format:(output_format_ : format_string option)
    ?compressed:(compressed_ : boolean_ option)
    ?number_of_buckets:(number_of_buckets_ : integer option)
    ?serde_info:(serde_info_ : ser_de_info option)
    ?bucket_columns:(bucket_columns_ : name_string_list option)
    ?sort_columns:(sort_columns_ : order_list option)
    ?parameters:(parameters_ : parameters_map option)
    ?skewed_info:(skewed_info_ : skewed_info option)
    ?stored_as_sub_directories:(stored_as_sub_directories_ : boolean_ option)
    ?schema_reference:(schema_reference_ : schema_reference option) () =
  ({
     columns = columns_;
     location = location_;
     additional_locations = additional_locations_;
     input_format = input_format_;
     output_format = output_format_;
     compressed = compressed_;
     number_of_buckets = number_of_buckets_;
     serde_info = serde_info_;
     bucket_columns = bucket_columns_;
     sort_columns = sort_columns_;
     parameters = parameters_;
     skewed_info = skewed_info_;
     stored_as_sub_directories = stored_as_sub_directories_;
     schema_reference = schema_reference_;
   }
    : storage_descriptor)

let make_table_input ?description:(description_ : description_string option)
    ?owner:(owner_ : name_string option) ?last_access_time:(last_access_time_ : timestamp option)
    ?last_analyzed_time:(last_analyzed_time_ : timestamp option)
    ?retention:(retention_ : non_negative_integer option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?partition_keys:(partition_keys_ : column_list option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?view_expanded_text:(view_expanded_text_ : view_text_string option)
    ?table_type:(table_type_ : table_type_string option)
    ?parameters:(parameters_ : parameters_map option)
    ?target_table:(target_table_ : table_identifier option)
    ?view_definition:(view_definition_ : view_definition_input option) ~name:(name_ : name_string)
    () =
  ({
     name = name_;
     description = description_;
     owner = owner_;
     last_access_time = last_access_time_;
     last_analyzed_time = last_analyzed_time_;
     retention = retention_;
     storage_descriptor = storage_descriptor_;
     partition_keys = partition_keys_;
     view_original_text = view_original_text_;
     view_expanded_text = view_expanded_text_;
     table_type = table_type_;
     parameters = parameters_;
     target_table = target_table_;
     view_definition = view_definition_;
   }
    : table_input)

let make_update_table_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?name:(name_ : name_string option) ?table_input:(table_input_ : table_input option)
    ?skip_archive:(skip_archive_ : boolean_nullable option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?version_id:(version_id_ : version_string option)
    ?view_update_action:(view_update_action_ : view_update_action option)
    ?force:(force_ : boolean_ option)
    ?update_open_table_format_input:
      (update_open_table_format_input_ : update_open_table_format_input option)
    ~database_name:(database_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     name = name_;
     table_input = table_input_;
     skip_archive = skip_archive_;
     transaction_id = transaction_id_;
     version_id = version_id_;
     view_update_action = view_update_action_;
     force = force_;
     update_open_table_format_input = update_open_table_format_input_;
   }
    : update_table_request)

let make_update_source_control_from_job_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : update_source_control_from_job_response)

let make_update_source_control_from_job_request ?job_name:(job_name_ : name_string option)
    ?provider:(provider_ : source_control_provider option)
    ?repository_name:(repository_name_ : name_string option)
    ?repository_owner:(repository_owner_ : name_string option)
    ?branch_name:(branch_name_ : name_string option) ?folder:(folder_ : name_string option)
    ?commit_id:(commit_id_ : commit_id_string option)
    ?auth_strategy:(auth_strategy_ : source_control_auth_strategy option)
    ?auth_token:(auth_token_ : auth_token_string option) () =
  ({
     job_name = job_name_;
     provider = provider_;
     repository_name = repository_name_;
     repository_owner = repository_owner_;
     branch_name = branch_name_;
     folder = folder_;
     commit_id = commit_id_;
     auth_strategy = auth_strategy_;
     auth_token = auth_token_;
   }
    : update_source_control_from_job_request)

let make_update_schema_response ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?registry_name:(registry_name_ : schema_registry_name_string option) () =
  ({ schema_arn = schema_arn_; schema_name = schema_name_; registry_name = registry_name_ }
    : update_schema_response)

let make_schema_version_number
    ?latest_version:(latest_version_ : latest_schema_version_boolean option)
    ?version_number:(version_number_ : version_long_number option) () =
  ({ latest_version = latest_version_; version_number = version_number_ } : schema_version_number)

let make_update_schema_input
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?compatibility:(compatibility_ : compatibility option)
    ?description:(description_ : description_string option) ~schema_id:(schema_id_ : schema_id) () =
  ({
     schema_id = schema_id_;
     schema_version_number = schema_version_number_;
     compatibility = compatibility_;
     description = description_;
   }
    : update_schema_input)

let make_update_registry_response
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option) () =
  ({ registry_name = registry_name_; registry_arn = registry_arn_ } : update_registry_response)

let make_registry_id ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option) () =
  ({ registry_name = registry_name_; registry_arn = registry_arn_ } : registry_id)

let make_update_registry_input ~registry_id:(registry_id_ : registry_id)
    ~description:(description_ : description_string) () =
  ({ registry_id = registry_id_; description = description_ } : update_registry_input)

let make_update_partition_response () = (() : unit)

let make_partition_input ?values:(values_ : value_string_list option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?parameters:(parameters_ : parameters_map option)
    ?last_analyzed_time:(last_analyzed_time_ : timestamp option) () =
  ({
     values = values_;
     last_access_time = last_access_time_;
     storage_descriptor = storage_descriptor_;
     parameters = parameters_;
     last_analyzed_time = last_analyzed_time_;
   }
    : partition_input)

let make_update_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_value_list:(partition_value_list_ : bounded_partition_value_list)
    ~partition_input:(partition_input_ : partition_input) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_value_list = partition_value_list_;
     partition_input = partition_input_;
   }
    : update_partition_request)

let make_update_ml_transform_response ?transform_id:(transform_id_ : hash_string option) () =
  ({ transform_id = transform_id_ } : update_ml_transform_response)

let make_find_matches_parameters
    ?primary_key_column_name:(primary_key_column_name_ : column_name_string option)
    ?precision_recall_tradeoff:(precision_recall_tradeoff_ : generic_bounded_double option)
    ?accuracy_cost_tradeoff:(accuracy_cost_tradeoff_ : generic_bounded_double option)
    ?enforce_provided_labels:(enforce_provided_labels_ : nullable_boolean option) () =
  ({
     primary_key_column_name = primary_key_column_name_;
     precision_recall_tradeoff = precision_recall_tradeoff_;
     accuracy_cost_tradeoff = accuracy_cost_tradeoff_;
     enforce_provided_labels = enforce_provided_labels_;
   }
    : find_matches_parameters)

let make_transform_parameters
    ?find_matches_parameters:(find_matches_parameters_ : find_matches_parameters option)
    ~transform_type:(transform_type_ : transform_type) () =
  ({ transform_type = transform_type_; find_matches_parameters = find_matches_parameters_ }
    : transform_parameters)

let make_update_ml_transform_request ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?parameters:(parameters_ : transform_parameters option) ?role:(role_ : role_string option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option) ?max_retries:(max_retries_ : nullable_integer option)
    ~transform_id:(transform_id_ : hash_string) () =
  ({
     transform_id = transform_id_;
     name = name_;
     description = description_;
     parameters = parameters_;
     role = role_;
     glue_version = glue_version_;
     max_capacity = max_capacity_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     max_retries = max_retries_;
   }
    : update_ml_transform_request)

let make_update_job_from_source_control_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : update_job_from_source_control_response)

let make_update_job_from_source_control_request ?job_name:(job_name_ : name_string option)
    ?provider:(provider_ : source_control_provider option)
    ?repository_name:(repository_name_ : name_string option)
    ?repository_owner:(repository_owner_ : name_string option)
    ?branch_name:(branch_name_ : name_string option) ?folder:(folder_ : name_string option)
    ?commit_id:(commit_id_ : commit_id_string option)
    ?auth_strategy:(auth_strategy_ : source_control_auth_strategy option)
    ?auth_token:(auth_token_ : auth_token_string option) () =
  ({
     job_name = job_name_;
     provider = provider_;
     repository_name = repository_name_;
     repository_owner = repository_owner_;
     branch_name = branch_name_;
     folder = folder_;
     commit_id = commit_id_;
     auth_strategy = auth_strategy_;
     auth_token = auth_token_;
   }
    : update_job_from_source_control_request)

let make_update_job_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : update_job_response)

let make_source_control_details ?provider:(provider_ : source_control_provider option)
    ?repository:(repository_ : generic512_char_string option)
    ?owner:(owner_ : generic512_char_string option)
    ?branch:(branch_ : generic512_char_string option)
    ?folder:(folder_ : generic512_char_string option)
    ?last_commit_id:(last_commit_id_ : generic512_char_string option)
    ?auth_strategy:(auth_strategy_ : source_control_auth_strategy option)
    ?auth_token:(auth_token_ : generic512_char_string option) () =
  ({
     provider = provider_;
     repository = repository_;
     owner = owner_;
     branch = branch_;
     folder = folder_;
     last_commit_id = last_commit_id_;
     auth_strategy = auth_strategy_;
     auth_token = auth_token_;
   }
    : source_control_details)

let make_glue_studio_schema_column ?type_:(type__ : column_type_string option)
    ?glue_studio_type:(glue_studio_type_ : column_type_string option)
    ~name:(name_ : glue_studio_column_name_string) () =
  ({ name = name_; type_ = type__; glue_studio_type = glue_studio_type_ }
    : glue_studio_schema_column)

let make_glue_schema ?columns:(columns_ : glue_studio_schema_column_list option) () =
  ({ columns = columns_ } : glue_schema)

let make_ddbelt_connection_options ?dynamodb_export:(dynamodb_export_ : ddb_export_type option)
    ?dynamodb_unnest_ddb_json:(dynamodb_unnest_ddb_json_ : boolean_value option)
    ?dynamodb_s3_bucket:(dynamodb_s3_bucket_ : enclosed_in_string_property option)
    ?dynamodb_s3_prefix:(dynamodb_s3_prefix_ : enclosed_in_string_property option)
    ?dynamodb_s3_bucket_owner:(dynamodb_s3_bucket_owner_ : enclosed_in_string_property option)
    ?dynamodb_sts_role_arn:(dynamodb_sts_role_arn_ : enclosed_in_string_property option)
    ~dynamodb_table_arn:(dynamodb_table_arn_ : enclosed_in_string_property) () =
  ({
     dynamodb_export = dynamodb_export_;
     dynamodb_unnest_ddb_json = dynamodb_unnest_ddb_json_;
     dynamodb_table_arn = dynamodb_table_arn_;
     dynamodb_s3_bucket = dynamodb_s3_bucket_;
     dynamodb_s3_prefix = dynamodb_s3_prefix_;
     dynamodb_s3_bucket_owner = dynamodb_s3_bucket_owner_;
     dynamodb_sts_role_arn = dynamodb_sts_role_arn_;
   }
    : ddbelt_connection_options)

let make_dynamo_dbelt_connector_source
    ?connection_options:(connection_options_ : ddbelt_connection_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name) () =
  ({ name = name_; connection_options = connection_options_; output_schemas = output_schemas_ }
    : dynamo_dbelt_connector_source)

let make_auto_data_quality ?is_enabled:(is_enabled_ : boolean_value option)
    ?evaluation_context:(evaluation_context_ : enclosed_in_string_property option) () =
  ({ is_enabled = is_enabled_; evaluation_context = evaluation_context_ } : auto_data_quality)

let make_direct_schema_change_policy
    ?enable_update_catalog:(enable_update_catalog_ : boxed_boolean option)
    ?update_behavior:(update_behavior_ : update_catalog_behavior option)
    ?table:(table_ : enclosed_in_string_property option)
    ?database:(database_ : enclosed_in_string_property option) () =
  ({
     enable_update_catalog = enable_update_catalog_;
     update_behavior = update_behavior_;
     table = table_;
     database = database_;
   }
    : direct_schema_change_policy)

let make_s3_hyper_direct_target ?format:(format_ : target_format option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?compression:(compression_ : hyper_target_compression_type option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~path:(path_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     format = format_;
     partition_keys = partition_keys_;
     path = path_;
     compression = compression_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
     output_schemas = output_schemas_;
   }
    : s3_hyper_direct_target)

let make_s3_direct_source_additional_options ?bounded_size:(bounded_size_ : boxed_long option)
    ?bounded_files:(bounded_files_ : boxed_long option)
    ?enable_sample_path:(enable_sample_path_ : boxed_boolean option)
    ?sample_path:(sample_path_ : enclosed_in_string_property option) () =
  ({
     bounded_size = bounded_size_;
     bounded_files = bounded_files_;
     enable_sample_path = enable_sample_path_;
     sample_path = sample_path_;
   }
    : s3_direct_source_additional_options)

let make_s3_excel_source ?compression_type:(compression_type_ : parquet_compression_type option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?recurse:(recurse_ : boxed_boolean option) ?max_band:(max_band_ : boxed_non_negative_int option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?number_rows:(number_rows_ : boxed_long option)
    ?skip_footer:(skip_footer_ : boxed_non_negative_int option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~paths:(paths_ : enclosed_in_string_properties) () =
  ({
     name = name_;
     paths = paths_;
     compression_type = compression_type_;
     exclusions = exclusions_;
     group_size = group_size_;
     group_files = group_files_;
     recurse = recurse_;
     max_band = max_band_;
     max_files_in_band = max_files_in_band_;
     additional_options = additional_options_;
     number_rows = number_rows_;
     skip_footer = skip_footer_;
     output_schemas = output_schemas_;
   }
    : s3_excel_source)

let make_s3_iceberg_direct_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?additional_options:(additional_options_ : additional_options option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~path:(path_ : enclosed_in_string_property)
    ~format:(format_ : target_format) ~compression:(compression_ : iceberg_target_compression_type)
    () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     path = path_;
     format = format_;
     additional_options = additional_options_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
     compression = compression_;
     number_target_partitions = number_target_partitions_;
     output_schemas = output_schemas_;
   }
    : s3_iceberg_direct_target)

let make_catalog_schema_change_policy
    ?enable_update_catalog:(enable_update_catalog_ : boxed_boolean option)
    ?update_behavior:(update_behavior_ : update_catalog_behavior option) () =
  ({ enable_update_catalog = enable_update_catalog_; update_behavior = update_behavior_ }
    : catalog_schema_change_policy)

let make_s3_iceberg_catalog_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?additional_options:(additional_options_ : additional_options option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     table = table_;
     database = database_;
     additional_options = additional_options_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
   }
    : s3_iceberg_catalog_target)

let make_catalog_iceberg_source
    ?additional_iceberg_options:(additional_iceberg_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     additional_iceberg_options = additional_iceberg_options_;
     output_schemas = output_schemas_;
   }
    : catalog_iceberg_source)

let make_s3_catalog_iceberg_source
    ?additional_iceberg_options:(additional_iceberg_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     additional_iceberg_options = additional_iceberg_options_;
     output_schemas = output_schemas_;
   }
    : s3_catalog_iceberg_source)

let make_connector_data_target ?inputs:(inputs_ : one_input option) ~name:(name_ : node_name)
    ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~data:(data_ : connector_options) () =
  ({ name = name_; connection_type = connection_type_; data = data_; inputs = inputs_ }
    : connector_data_target)

let make_connector_data_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ~name:(name_ : node_name) ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~data:(data_ : connector_options) () =
  ({
     name = name_;
     connection_type = connection_type_;
     data = data_;
     output_schemas = output_schemas_;
   }
    : connector_data_source)

let make_option_ ?value:(value_ : enclosed_in_string_property option)
    ?label:(label_ : enclosed_in_string_property option)
    ?description:(description_ : enclosed_in_string_property option) () =
  ({ value = value_; label = label_; description = description_ } : option_)

let make_snowflake_node_data ?source_type:(source_type_ : generic_limited_string option)
    ?connection:(connection_ : option_ option) ?schema:(schema_ : generic_string option)
    ?table:(table_ : generic_string option) ?database:(database_ : generic_string option)
    ?temp_dir:(temp_dir_ : enclosed_in_string_property option)
    ?iam_role:(iam_role_ : option_ option)
    ?additional_options:(additional_options_ : additional_options option)
    ?sample_query:(sample_query_ : generic_string option)
    ?pre_action:(pre_action_ : generic_string option)
    ?post_action:(post_action_ : generic_string option) ?action:(action_ : generic_string option)
    ?upsert:(upsert_ : boolean_value option)
    ?merge_action:(merge_action_ : generic_limited_string option)
    ?merge_when_matched:(merge_when_matched_ : generic_limited_string option)
    ?merge_when_not_matched:(merge_when_not_matched_ : generic_limited_string option)
    ?merge_clause:(merge_clause_ : generic_string option)
    ?staging_table:(staging_table_ : generic_string option)
    ?selected_columns:(selected_columns_ : option_list option)
    ?auto_pushdown:(auto_pushdown_ : boolean_value option)
    ?table_schema:(table_schema_ : option_list option) () =
  ({
     source_type = source_type_;
     connection = connection_;
     schema = schema_;
     table = table_;
     database = database_;
     temp_dir = temp_dir_;
     iam_role = iam_role_;
     additional_options = additional_options_;
     sample_query = sample_query_;
     pre_action = pre_action_;
     post_action = post_action_;
     action = action_;
     upsert = upsert_;
     merge_action = merge_action_;
     merge_when_matched = merge_when_matched_;
     merge_when_not_matched = merge_when_not_matched_;
     merge_clause = merge_clause_;
     staging_table = staging_table_;
     selected_columns = selected_columns_;
     auto_pushdown = auto_pushdown_;
     table_schema = table_schema_;
   }
    : snowflake_node_data)

let make_snowflake_target ?inputs:(inputs_ : one_input option) ~name:(name_ : node_name)
    ~data:(data_ : snowflake_node_data) () =
  ({ name = name_; data = data_; inputs = inputs_ } : snowflake_target)

let make_snowflake_source ?output_schemas:(output_schemas_ : glue_schemas option)
    ~name:(name_ : node_name) ~data:(data_ : snowflake_node_data) () =
  ({ name = name_; data = data_; output_schemas = output_schemas_ } : snowflake_source)

let make_condition_expression ?value:(value_ : databrew_condition_value option)
    ~condition:(condition_ : databrew_condition) ~target_column:(target_column_ : target_column) ()
    =
  ({ condition = condition_; value = value_; target_column = target_column_ }
    : condition_expression)

let make_recipe_action ?parameters:(parameters_ : parameter_map option)
    ~operation:(operation_ : operation) () =
  ({ operation = operation_; parameters = parameters_ } : recipe_action)

let make_recipe_step
    ?condition_expressions:(condition_expressions_ : condition_expression_list option)
    ~action:(action_ : recipe_action) () =
  ({ action = action_; condition_expressions = condition_expressions_ } : recipe_step)

let make_recipe_reference ~recipe_arn:(recipe_arn_ : enclosed_in_string_property)
    ~recipe_version:(recipe_version_ : recipe_version) () =
  ({ recipe_arn = recipe_arn_; recipe_version = recipe_version_ } : recipe_reference)

let make_recipe ?recipe_reference:(recipe_reference_ : recipe_reference option)
    ?recipe_steps:(recipe_steps_ : recipe_steps option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) () =
  ({
     name = name_;
     inputs = inputs_;
     recipe_reference = recipe_reference_;
     recipe_steps = recipe_steps_;
   }
    : recipe)

let make_dq_stop_job_on_failure_options
    ?stop_job_on_failure_timing:(stop_job_on_failure_timing_ : dq_stop_job_on_failure_timing option)
    () =
  ({ stop_job_on_failure_timing = stop_job_on_failure_timing_ } : dq_stop_job_on_failure_options)

let make_dq_results_publishing_options
    ?evaluation_context:(evaluation_context_ : generic_limited_string option)
    ?results_s3_prefix:(results_s3_prefix_ : enclosed_in_string_property option)
    ?cloud_watch_metrics_enabled:(cloud_watch_metrics_enabled_ : boxed_boolean option)
    ?results_publishing_enabled:(results_publishing_enabled_ : boxed_boolean option) () =
  ({
     evaluation_context = evaluation_context_;
     results_s3_prefix = results_s3_prefix_;
     cloud_watch_metrics_enabled = cloud_watch_metrics_enabled_;
     results_publishing_enabled = results_publishing_enabled_;
   }
    : dq_results_publishing_options)

let make_evaluate_data_quality_multi_frame
    ?additional_data_sources:(additional_data_sources_ : dqdl_aliases option)
    ?publishing_options:(publishing_options_ : dq_results_publishing_options option)
    ?additional_options:(additional_options_ : dq_additional_options option)
    ?stop_job_on_failure_options:
      (stop_job_on_failure_options_ : dq_stop_job_on_failure_options option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : many_inputs) ~ruleset:(ruleset_ : dqdl_string) () =
  ({
     name = name_;
     inputs = inputs_;
     additional_data_sources = additional_data_sources_;
     ruleset = ruleset_;
     publishing_options = publishing_options_;
     additional_options = additional_options_;
     stop_job_on_failure_options = stop_job_on_failure_options_;
   }
    : evaluate_data_quality_multi_frame)

let make_amazon_redshift_advanced_option ?key:(key_ : generic_string option)
    ?value:(value_ : generic_string option) () =
  ({ key = key_; value = value_ } : amazon_redshift_advanced_option)

let make_amazon_redshift_node_data ?access_type:(access_type_ : generic_limited_string option)
    ?source_type:(source_type_ : generic_limited_string option)
    ?connection:(connection_ : option_ option) ?schema:(schema_ : option_ option)
    ?table:(table_ : option_ option) ?catalog_database:(catalog_database_ : option_ option)
    ?catalog_table:(catalog_table_ : option_ option)
    ?catalog_redshift_schema:(catalog_redshift_schema_ : generic_string option)
    ?catalog_redshift_table:(catalog_redshift_table_ : generic_string option)
    ?temp_dir:(temp_dir_ : enclosed_in_string_property option)
    ?iam_role:(iam_role_ : option_ option)
    ?advanced_options:(advanced_options_ : amazon_redshift_advanced_options option)
    ?sample_query:(sample_query_ : generic_string option)
    ?pre_action:(pre_action_ : generic_string option)
    ?post_action:(post_action_ : generic_string option) ?action:(action_ : generic_string option)
    ?table_prefix:(table_prefix_ : generic_limited_string option)
    ?upsert:(upsert_ : boolean_value option)
    ?merge_action:(merge_action_ : generic_limited_string option)
    ?merge_when_matched:(merge_when_matched_ : generic_limited_string option)
    ?merge_when_not_matched:(merge_when_not_matched_ : generic_limited_string option)
    ?merge_clause:(merge_clause_ : generic_string option)
    ?crawler_connection:(crawler_connection_ : generic_string option)
    ?table_schema:(table_schema_ : option_list option)
    ?staging_table:(staging_table_ : generic_string option)
    ?selected_columns:(selected_columns_ : option_list option) () =
  ({
     access_type = access_type_;
     source_type = source_type_;
     connection = connection_;
     schema = schema_;
     table = table_;
     catalog_database = catalog_database_;
     catalog_table = catalog_table_;
     catalog_redshift_schema = catalog_redshift_schema_;
     catalog_redshift_table = catalog_redshift_table_;
     temp_dir = temp_dir_;
     iam_role = iam_role_;
     advanced_options = advanced_options_;
     sample_query = sample_query_;
     pre_action = pre_action_;
     post_action = post_action_;
     action = action_;
     table_prefix = table_prefix_;
     upsert = upsert_;
     merge_action = merge_action_;
     merge_when_matched = merge_when_matched_;
     merge_when_not_matched = merge_when_not_matched_;
     merge_clause = merge_clause_;
     crawler_connection = crawler_connection_;
     table_schema = table_schema_;
     staging_table = staging_table_;
     selected_columns = selected_columns_;
   }
    : amazon_redshift_node_data)

let make_amazon_redshift_target ?name:(name_ : node_name option)
    ?data:(data_ : amazon_redshift_node_data option) ?inputs:(inputs_ : one_input option) () =
  ({ name = name_; data = data_; inputs = inputs_ } : amazon_redshift_target)

let make_amazon_redshift_source ?name:(name_ : node_name option)
    ?data:(data_ : amazon_redshift_node_data option) () =
  ({ name = name_; data = data_ } : amazon_redshift_source)

let make_s3_delta_direct_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?additional_options:(additional_options_ : additional_options option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~path:(path_ : enclosed_in_string_property)
    ~compression:(compression_ : delta_target_compression_type) ~format:(format_ : target_format) ()
    =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     path = path_;
     compression = compression_;
     number_target_partitions = number_target_partitions_;
     format = format_;
     additional_options = additional_options_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
   }
    : s3_delta_direct_target)

let make_s3_delta_catalog_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?additional_options:(additional_options_ : additional_options option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     table = table_;
     database = database_;
     additional_options = additional_options_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
     output_schemas = output_schemas_;
   }
    : s3_delta_catalog_target)

let make_s3_delta_source
    ?additional_delta_options:(additional_delta_options_ : additional_options option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~paths:(paths_ : enclosed_in_string_properties) () =
  ({
     name = name_;
     paths = paths_;
     additional_delta_options = additional_delta_options_;
     additional_options = additional_options_;
     output_schemas = output_schemas_;
   }
    : s3_delta_source)

let make_catalog_delta_source
    ?additional_delta_options:(additional_delta_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     additional_delta_options = additional_delta_options_;
     output_schemas = output_schemas_;
   }
    : catalog_delta_source)

let make_s3_catalog_delta_source
    ?additional_delta_options:(additional_delta_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     additional_delta_options = additional_delta_options_;
     output_schemas = output_schemas_;
   }
    : s3_catalog_delta_source)

let make_direct_jdbc_source
    ?redshift_tmp_dir:(redshift_tmp_dir_ : enclosed_in_string_property option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property)
    ~connection_name:(connection_name_ : enclosed_in_string_property)
    ~connection_type:(connection_type_ : jdbc_connection_type) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     connection_name = connection_name_;
     connection_type = connection_type_;
     redshift_tmp_dir = redshift_tmp_dir_;
     output_schemas = output_schemas_;
   }
    : direct_jdbc_source)

let make_s3_hudi_direct_target
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~path:(path_ : enclosed_in_string_property)
    ~compression:(compression_ : hudi_target_compression_type) ~format:(format_ : target_format)
    ~additional_options:(additional_options_ : additional_options) () =
  ({
     name = name_;
     inputs = inputs_;
     path = path_;
     compression = compression_;
     number_target_partitions = number_target_partitions_;
     partition_keys = partition_keys_;
     format = format_;
     additional_options = additional_options_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
   }
    : s3_hudi_direct_target)

let make_s3_hudi_catalog_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property)
    ~additional_options:(additional_options_ : additional_options) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     table = table_;
     database = database_;
     additional_options = additional_options_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
     output_schemas = output_schemas_;
   }
    : s3_hudi_catalog_target)

let make_s3_hudi_source
    ?additional_hudi_options:(additional_hudi_options_ : additional_options option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~paths:(paths_ : enclosed_in_string_properties) () =
  ({
     name = name_;
     paths = paths_;
     additional_hudi_options = additional_hudi_options_;
     additional_options = additional_options_;
     output_schemas = output_schemas_;
   }
    : s3_hudi_source)

let make_catalog_hudi_source
    ?additional_hudi_options:(additional_hudi_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     additional_hudi_options = additional_hudi_options_;
     output_schemas = output_schemas_;
   }
    : catalog_hudi_source)

let make_s3_catalog_hudi_source
    ?additional_hudi_options:(additional_hudi_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     additional_hudi_options = additional_hudi_options_;
     output_schemas = output_schemas_;
   }
    : s3_catalog_hudi_source)

let make_evaluate_data_quality ?output:(output_ : dq_transform_output option)
    ?publishing_options:(publishing_options_ : dq_results_publishing_options option)
    ?stop_job_on_failure_options:
      (stop_job_on_failure_options_ : dq_stop_job_on_failure_options option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : one_input) ~ruleset:(ruleset_ : dqdl_string) () =
  ({
     name = name_;
     inputs = inputs_;
     ruleset = ruleset_;
     output = output_;
     publishing_options = publishing_options_;
     stop_job_on_failure_options = stop_job_on_failure_options_;
   }
    : evaluate_data_quality)

let make_transform_config_parameter
    ?validation_rule:(validation_rule_ : enclosed_in_string_property option)
    ?validation_message:(validation_message_ : enclosed_in_string_property option)
    ?value:(value_ : enclosed_in_string_properties option)
    ?list_type:(list_type_ : param_type option) ?is_optional:(is_optional_ : boxed_boolean option)
    ~name:(name_ : enclosed_in_string_property) ~type_:(type__ : param_type) () =
  ({
     name = name_;
     type_ = type__;
     validation_rule = validation_rule_;
     validation_message = validation_message_;
     value = value_;
     list_type = list_type_;
     is_optional = is_optional_;
   }
    : transform_config_parameter)

let make_dynamic_transform ?parameters:(parameters_ : transform_config_parameter_list option)
    ?version:(version_ : enclosed_in_string_property option)
    ?output_schemas:(output_schemas_ : glue_schemas option)
    ~name:(name_ : enclosed_in_string_property)
    ~transform_name:(transform_name_ : enclosed_in_string_property) ~inputs:(inputs_ : one_input)
    ~function_name:(function_name_ : enclosed_in_string_property)
    ~path:(path_ : enclosed_in_string_property) () =
  ({
     name = name_;
     transform_name = transform_name_;
     inputs = inputs_;
     parameters = parameters_;
     function_name = function_name_;
     path = path_;
     version = version_;
     output_schemas = output_schemas_;
   }
    : dynamic_transform)

let make_filter_value ~type_:(type__ : filter_value_type)
    ~value:(value_ : enclosed_in_string_properties) () =
  ({ type_ = type__; value = value_ } : filter_value)

let make_filter_expression ?negated:(negated_ : boxed_boolean option)
    ~operation:(operation_ : filter_operation) ~values:(values_ : filter_values) () =
  ({ operation = operation_; negated = negated_; values = values_ } : filter_expression)

let make_group_filters ~group_name:(group_name_ : generic_limited_string)
    ~filters:(filters_ : filter_expressions)
    ~logical_operator:(logical_operator_ : filter_logical_operator) () =
  ({ group_name = group_name_; filters = filters_; logical_operator = logical_operator_ }
    : group_filters)

let make_route ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~group_filters_list:(group_filters_list_ : group_filters_list) () =
  ({ name = name_; inputs = inputs_; group_filters_list = group_filters_list_ } : route)

let make_postgre_sql_catalog_target ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; inputs = inputs_; database = database_; table = table_ }
    : postgre_sql_catalog_target)

let make_oracle_sql_catalog_target ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; inputs = inputs_; database = database_; table = table_ }
    : oracle_sql_catalog_target)

let make_my_sql_catalog_target ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; inputs = inputs_; database = database_; table = table_ } : my_sql_catalog_target)

let make_microsoft_sql_server_catalog_target ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; inputs = inputs_; database = database_; table = table_ }
    : microsoft_sql_server_catalog_target)

let make_postgre_sql_catalog_source ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; database = database_; table = table_ } : postgre_sql_catalog_source)

let make_oracle_sql_catalog_source ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; database = database_; table = table_ } : oracle_sql_catalog_source)

let make_my_sql_catalog_source ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; database = database_; table = table_ } : my_sql_catalog_source)

let make_microsoft_sql_server_catalog_source ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; database = database_; table = table_ } : microsoft_sql_server_catalog_source)

let make_s3_source_additional_options ?bounded_size:(bounded_size_ : boxed_long option)
    ?bounded_files:(bounded_files_ : boxed_long option) () =
  ({ bounded_size = bounded_size_; bounded_files = bounded_files_ } : s3_source_additional_options)

let make_governed_catalog_source
    ?partition_predicate:(partition_predicate_ : enclosed_in_string_property option)
    ?additional_options:(additional_options_ : s3_source_additional_options option)
    ~name:(name_ : node_name) ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     partition_predicate = partition_predicate_;
     additional_options = additional_options_;
   }
    : governed_catalog_source)

let make_governed_catalog_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     table = table_;
     database = database_;
     schema_change_policy = schema_change_policy_;
   }
    : governed_catalog_target)

let make_drop_duplicates ?columns:(columns_ : limited_path_list option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) () =
  ({ name = name_; inputs = inputs_; columns = columns_ } : drop_duplicates)

let make_aggregate_operation ~column:(column_ : enclosed_in_string_properties)
    ~agg_func:(agg_func_ : agg_function) () =
  ({ column = column_; agg_func = agg_func_ } : aggregate_operation)

let make_aggregate ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~groups:(groups_ : glue_studio_path_list) ~aggs:(aggs_ : aggregate_operations) () =
  ({ name = name_; inputs = inputs_; groups = groups_; aggs = aggs_ } : aggregate)

let make_pii_detection
    ?output_column_name:(output_column_name_ : enclosed_in_string_property option)
    ?sample_fraction:(sample_fraction_ : boxed_double_fraction option)
    ?threshold_fraction:(threshold_fraction_ : boxed_double_fraction option)
    ?mask_value:(mask_value_ : mask_value option)
    ?redact_text:(redact_text_ : enclosed_in_string_property option)
    ?redact_char:(redact_char_ : enclosed_in_string_property option)
    ?match_pattern:(match_pattern_ : enclosed_in_string_property option)
    ?num_left_chars_to_exclude:(num_left_chars_to_exclude_ : boxed_positive_int option)
    ?num_right_chars_to_exclude:(num_right_chars_to_exclude_ : boxed_positive_int option)
    ?detection_parameters:(detection_parameters_ : enclosed_in_string_property option)
    ?detection_sensitivity:(detection_sensitivity_ : enclosed_in_string_property option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : one_input) ~pii_type:(pii_type_ : pii_type)
    ~entity_types_to_detect:(entity_types_to_detect_ : enclosed_in_string_properties) () =
  ({
     name = name_;
     inputs = inputs_;
     pii_type = pii_type_;
     entity_types_to_detect = entity_types_to_detect_;
     output_column_name = output_column_name_;
     sample_fraction = sample_fraction_;
     threshold_fraction = threshold_fraction_;
     mask_value = mask_value_;
     redact_text = redact_text_;
     redact_char = redact_char_;
     match_pattern = match_pattern_;
     num_left_chars_to_exclude = num_left_chars_to_exclude_;
     num_right_chars_to_exclude = num_right_chars_to_exclude_;
     detection_parameters = detection_parameters_;
     detection_sensitivity = detection_sensitivity_;
   }
    : pii_detection)

let make_union ~name:(name_ : node_name) ~inputs:(inputs_ : two_inputs)
    ~union_type:(union_type_ : union_type) () =
  ({ name = name_; inputs = inputs_; union_type = union_type_ } : union)

let make_merge ~name:(name_ : node_name) ~inputs:(inputs_ : two_inputs) ~source:(source_ : node_id)
    ~primary_keys:(primary_keys_ : glue_studio_path_list) () =
  ({ name = name_; inputs = inputs_; source = source_; primary_keys = primary_keys_ } : merge)

let make_datatype ~id:(id_ : generic_limited_string) ~label:(label_ : generic_limited_string) () =
  ({ id = id_; label = label_ } : datatype)

let make_null_value_field ~value:(value_ : enclosed_in_string_property)
    ~datatype:(datatype_ : datatype) () =
  ({ value = value_; datatype = datatype_ } : null_value_field)

let make_null_check_box_list ?is_empty:(is_empty_ : boxed_boolean option)
    ?is_null_string:(is_null_string_ : boxed_boolean option)
    ?is_neg_one:(is_neg_one_ : boxed_boolean option) () =
  ({ is_empty = is_empty_; is_null_string = is_null_string_; is_neg_one = is_neg_one_ }
    : null_check_box_list)

let make_drop_null_fields ?null_check_box_list:(null_check_box_list_ : null_check_box_list option)
    ?null_text_list:(null_text_list_ : null_value_fields option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) () =
  ({
     name = name_;
     inputs = inputs_;
     null_check_box_list = null_check_box_list_;
     null_text_list = null_text_list_;
   }
    : drop_null_fields)

let make_streaming_data_preview_options ?polling_time:(polling_time_ : polling_time option)
    ?record_polling_limit:(record_polling_limit_ : positive_long option) () =
  ({ polling_time = polling_time_; record_polling_limit = record_polling_limit_ }
    : streaming_data_preview_options)

let make_kafka_streaming_source_options
    ?bootstrap_servers:(bootstrap_servers_ : enclosed_in_string_property option)
    ?security_protocol:(security_protocol_ : enclosed_in_string_property option)
    ?connection_name:(connection_name_ : enclosed_in_string_property option)
    ?topic_name:(topic_name_ : enclosed_in_string_property option)
    ?assign:(assign_ : enclosed_in_string_property option)
    ?subscribe_pattern:(subscribe_pattern_ : enclosed_in_string_property option)
    ?classification:(classification_ : enclosed_in_string_property option)
    ?delimiter:(delimiter_ : enclosed_in_string_property option)
    ?starting_offsets:(starting_offsets_ : enclosed_in_string_property option)
    ?ending_offsets:(ending_offsets_ : enclosed_in_string_property option)
    ?poll_timeout_ms:(poll_timeout_ms_ : boxed_non_negative_long option)
    ?num_retries:(num_retries_ : boxed_non_negative_int option)
    ?retry_interval_ms:(retry_interval_ms_ : boxed_non_negative_long option)
    ?max_offsets_per_trigger:(max_offsets_per_trigger_ : boxed_non_negative_long option)
    ?min_partitions:(min_partitions_ : boxed_non_negative_int option)
    ?include_headers:(include_headers_ : boxed_boolean option)
    ?add_record_timestamp:(add_record_timestamp_ : enclosed_in_string_property option)
    ?emit_consumer_lag_metrics:(emit_consumer_lag_metrics_ : enclosed_in_string_property option)
    ?starting_timestamp:(starting_timestamp_ : iso8601_date_time option) () =
  ({
     bootstrap_servers = bootstrap_servers_;
     security_protocol = security_protocol_;
     connection_name = connection_name_;
     topic_name = topic_name_;
     assign = assign_;
     subscribe_pattern = subscribe_pattern_;
     classification = classification_;
     delimiter = delimiter_;
     starting_offsets = starting_offsets_;
     ending_offsets = ending_offsets_;
     poll_timeout_ms = poll_timeout_ms_;
     num_retries = num_retries_;
     retry_interval_ms = retry_interval_ms_;
     max_offsets_per_trigger = max_offsets_per_trigger_;
     min_partitions = min_partitions_;
     include_headers = include_headers_;
     add_record_timestamp = add_record_timestamp_;
     emit_consumer_lag_metrics = emit_consumer_lag_metrics_;
     starting_timestamp = starting_timestamp_;
   }
    : kafka_streaming_source_options)

let make_catalog_kafka_source ?window_size:(window_size_ : boxed_positive_int option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?streaming_options:(streaming_options_ : kafka_streaming_source_options option)
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ~name:(name_ : node_name) ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) () =
  ({
     name = name_;
     window_size = window_size_;
     detect_schema = detect_schema_;
     table = table_;
     database = database_;
     streaming_options = streaming_options_;
     data_preview_options = data_preview_options_;
   }
    : catalog_kafka_source)

let make_kinesis_streaming_source_options
    ?endpoint_url:(endpoint_url_ : enclosed_in_string_property option)
    ?stream_name:(stream_name_ : enclosed_in_string_property option)
    ?classification:(classification_ : enclosed_in_string_property option)
    ?delimiter:(delimiter_ : enclosed_in_string_property option)
    ?starting_position:(starting_position_ : starting_position option)
    ?max_fetch_time_in_ms:(max_fetch_time_in_ms_ : boxed_non_negative_long option)
    ?max_fetch_records_per_shard:(max_fetch_records_per_shard_ : boxed_non_negative_long option)
    ?max_record_per_read:(max_record_per_read_ : boxed_non_negative_long option)
    ?add_idle_time_between_reads:(add_idle_time_between_reads_ : boxed_boolean option)
    ?idle_time_between_reads_in_ms:(idle_time_between_reads_in_ms_ : boxed_non_negative_long option)
    ?describe_shard_interval:(describe_shard_interval_ : boxed_non_negative_long option)
    ?num_retries:(num_retries_ : boxed_non_negative_int option)
    ?retry_interval_ms:(retry_interval_ms_ : boxed_non_negative_long option)
    ?max_retry_interval_ms:(max_retry_interval_ms_ : boxed_non_negative_long option)
    ?avoid_empty_batches:(avoid_empty_batches_ : boxed_boolean option)
    ?stream_arn:(stream_arn_ : enclosed_in_string_property option)
    ?role_arn:(role_arn_ : enclosed_in_string_property option)
    ?role_session_name:(role_session_name_ : enclosed_in_string_property option)
    ?add_record_timestamp:(add_record_timestamp_ : enclosed_in_string_property option)
    ?emit_consumer_lag_metrics:(emit_consumer_lag_metrics_ : enclosed_in_string_property option)
    ?starting_timestamp:(starting_timestamp_ : iso8601_date_time option)
    ?fanout_consumer_ar_n:(fanout_consumer_ar_n_ : enclosed_in_string_property option) () =
  ({
     endpoint_url = endpoint_url_;
     stream_name = stream_name_;
     classification = classification_;
     delimiter = delimiter_;
     starting_position = starting_position_;
     max_fetch_time_in_ms = max_fetch_time_in_ms_;
     max_fetch_records_per_shard = max_fetch_records_per_shard_;
     max_record_per_read = max_record_per_read_;
     add_idle_time_between_reads = add_idle_time_between_reads_;
     idle_time_between_reads_in_ms = idle_time_between_reads_in_ms_;
     describe_shard_interval = describe_shard_interval_;
     num_retries = num_retries_;
     retry_interval_ms = retry_interval_ms_;
     max_retry_interval_ms = max_retry_interval_ms_;
     avoid_empty_batches = avoid_empty_batches_;
     stream_arn = stream_arn_;
     role_arn = role_arn_;
     role_session_name = role_session_name_;
     add_record_timestamp = add_record_timestamp_;
     emit_consumer_lag_metrics = emit_consumer_lag_metrics_;
     starting_timestamp = starting_timestamp_;
     fanout_consumer_ar_n = fanout_consumer_ar_n_;
   }
    : kinesis_streaming_source_options)

let make_catalog_kinesis_source ?window_size:(window_size_ : boxed_positive_int option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?streaming_options:(streaming_options_ : kinesis_streaming_source_options option)
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ~name:(name_ : node_name) ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) () =
  ({
     name = name_;
     window_size = window_size_;
     detect_schema = detect_schema_;
     table = table_;
     database = database_;
     streaming_options = streaming_options_;
     data_preview_options = data_preview_options_;
   }
    : catalog_kinesis_source)

let make_direct_kafka_source
    ?streaming_options:(streaming_options_ : kafka_streaming_source_options option)
    ?window_size:(window_size_ : boxed_positive_int option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ~name:(name_ : node_name) () =
  ({
     name = name_;
     streaming_options = streaming_options_;
     window_size = window_size_;
     detect_schema = detect_schema_;
     data_preview_options = data_preview_options_;
   }
    : direct_kafka_source)

let make_direct_kinesis_source ?window_size:(window_size_ : boxed_positive_int option)
    ?detect_schema:(detect_schema_ : boxed_boolean option)
    ?streaming_options:(streaming_options_ : kinesis_streaming_source_options option)
    ?data_preview_options:(data_preview_options_ : streaming_data_preview_options option)
    ~name:(name_ : node_name) () =
  ({
     name = name_;
     window_size = window_size_;
     detect_schema = detect_schema_;
     streaming_options = streaming_options_;
     data_preview_options = data_preview_options_;
   }
    : direct_kinesis_source)

let make_sql_alias ~from_:(from__ : node_id)
    ~alias:(alias_ : enclosed_in_string_property_with_quote) () =
  ({ from_ = from__; alias = alias_ } : sql_alias)

let make_spark_sq_l ?output_schemas:(output_schemas_ : glue_schemas option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : many_inputs) ~sql_query:(sql_query_ : sql_query)
    ~sql_aliases:(sql_aliases_ : sql_aliases) () =
  ({
     name = name_;
     inputs = inputs_;
     sql_query = sql_query_;
     sql_aliases = sql_aliases_;
     output_schemas = output_schemas_;
   }
    : spark_sq_l)

let make_custom_code ?output_schemas:(output_schemas_ : glue_schemas option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : many_inputs) ~code:(code_ : extended_string)
    ~class_name:(class_name_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     code = code_;
     class_name = class_name_;
     output_schemas = output_schemas_;
   }
    : custom_code)

let make_filter ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~logical_operator:(logical_operator_ : filter_logical_operator)
    ~filters:(filters_ : filter_expressions) () =
  ({ name = name_; inputs = inputs_; logical_operator = logical_operator_; filters = filters_ }
    : filter)

let make_fill_missing_values ?filled_path:(filled_path_ : enclosed_in_string_property option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~imputed_path:(imputed_path_ : enclosed_in_string_property) () =
  ({ name = name_; inputs = inputs_; imputed_path = imputed_path_; filled_path = filled_path_ }
    : fill_missing_values)

let make_select_from_collection ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~index:(index_ : non_negative_int) () =
  ({ name = name_; inputs = inputs_; index = index_ } : select_from_collection)

let make_split_fields ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~paths:(paths_ : glue_studio_path_list) () =
  ({ name = name_; inputs = inputs_; paths = paths_ } : split_fields)

let make_join_column ~from_:(from__ : enclosed_in_string_property)
    ~keys:(keys_ : glue_studio_path_list) () =
  ({ from_ = from__; keys = keys_ } : join_column)

let make_join ~name:(name_ : node_name) ~inputs:(inputs_ : two_inputs)
    ~join_type:(join_type_ : join_type) ~columns:(columns_ : join_columns) () =
  ({ name = name_; inputs = inputs_; join_type = join_type_; columns = columns_ } : join)

let make_spigot ?topk:(topk_ : topk option) ?prob:(prob_ : prob option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~path:(path_ : enclosed_in_string_property) () =
  ({ name = name_; inputs = inputs_; path = path_; topk = topk_; prob = prob_ } : spigot)

let make_rename_field ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~source_path:(source_path_ : enclosed_in_string_properties)
    ~target_path:(target_path_ : enclosed_in_string_properties) () =
  ({ name = name_; inputs = inputs_; source_path = source_path_; target_path = target_path_ }
    : rename_field)

let make_drop_fields ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~paths:(paths_ : glue_studio_path_list) () =
  ({ name = name_; inputs = inputs_; paths = paths_ } : drop_fields)

let make_select_fields ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~paths:(paths_ : glue_studio_path_list) () =
  ({ name = name_; inputs = inputs_; paths = paths_ } : select_fields)

let make_mapping ?to_key:(to_key_ : enclosed_in_string_property option)
    ?from_path:(from_path_ : enclosed_in_string_properties option)
    ?from_type:(from_type_ : enclosed_in_string_property option)
    ?to_type:(to_type_ : enclosed_in_string_property option)
    ?dropped:(dropped_ : boxed_boolean option) ?children:(children_ : mappings option) () =
  ({
     to_key = to_key_;
     from_path = from_path_;
     from_type = from_type_;
     to_type = to_type_;
     dropped = dropped_;
     children = children_;
   }
    : mapping)

let make_apply_mapping ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~mapping:(mapping_ : mappings) () =
  ({ name = name_; inputs = inputs_; mapping = mapping_ } : apply_mapping)

let make_s3_direct_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?compression:(compression_ : enclosed_in_string_property option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~path:(path_ : enclosed_in_string_property)
    ~format:(format_ : target_format) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     path = path_;
     compression = compression_;
     number_target_partitions = number_target_partitions_;
     format = format_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
     output_schemas = output_schemas_;
   }
    : s3_direct_target)

let make_s3_glue_parquet_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?compression:(compression_ : parquet_compression_type option)
    ?number_target_partitions:(number_target_partitions_ : number_target_partitions_string option)
    ?schema_change_policy:(schema_change_policy_ : direct_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~path:(path_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     path = path_;
     compression = compression_;
     number_target_partitions = number_target_partitions_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
   }
    : s3_glue_parquet_target)

let make_s3_catalog_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ?schema_change_policy:(schema_change_policy_ : catalog_schema_change_policy option)
    ?auto_data_quality:(auto_data_quality_ : auto_data_quality option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~table:(table_ : enclosed_in_string_property)
    ~database:(database_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     table = table_;
     database = database_;
     schema_change_policy = schema_change_policy_;
     auto_data_quality = auto_data_quality_;
   }
    : s3_catalog_target)

let make_upsert_redshift_target_options
    ?table_location:(table_location_ : enclosed_in_string_property option)
    ?connection_name:(connection_name_ : enclosed_in_string_property option)
    ?upsert_keys:(upsert_keys_ : enclosed_in_string_properties_min_one option) () =
  ({
     table_location = table_location_;
     connection_name = connection_name_;
     upsert_keys = upsert_keys_;
   }
    : upsert_redshift_target_options)

let make_redshift_target ?redshift_tmp_dir:(redshift_tmp_dir_ : enclosed_in_string_property option)
    ?tmp_dir_iam_role:(tmp_dir_iam_role_ : enclosed_in_string_property option)
    ?upsert_redshift_options:(upsert_redshift_options_ : upsert_redshift_target_options option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     database = database_;
     table = table_;
     redshift_tmp_dir = redshift_tmp_dir_;
     tmp_dir_iam_role = tmp_dir_iam_role_;
     upsert_redshift_options = upsert_redshift_options_;
   }
    : redshift_target)

let make_basic_catalog_target ?partition_keys:(partition_keys_ : glue_studio_path_list option)
    ~name:(name_ : node_name) ~inputs:(inputs_ : one_input)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     partition_keys = partition_keys_;
     database = database_;
     table = table_;
   }
    : basic_catalog_target)

let make_spark_connector_target
    ?additional_options:(additional_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~connection_name:(connection_name_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_type:(connection_type_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     connection_name = connection_name_;
     connector_name = connector_name_;
     connection_type = connection_type_;
     additional_options = additional_options_;
     output_schemas = output_schemas_;
   }
    : spark_connector_target)

let make_jdbc_connector_target ?additional_options:(additional_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~inputs:(inputs_ : one_input) ~connection_name:(connection_name_ : enclosed_in_string_property)
    ~connection_table:(connection_table_ : enclosed_in_string_property_with_quote)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_type:(connection_type_ : enclosed_in_string_property) () =
  ({
     name = name_;
     inputs = inputs_;
     connection_name = connection_name_;
     connection_table = connection_table_;
     connector_name = connector_name_;
     connection_type = connection_type_;
     additional_options = additional_options_;
     output_schemas = output_schemas_;
   }
    : jdbc_connector_target)

let make_ddbelt_catalog_additional_options
    ?dynamodb_export:(dynamodb_export_ : enclosed_in_string_property option)
    ?dynamodb_unnest_ddb_json:(dynamodb_unnest_ddb_json_ : boolean_value option) () =
  ({ dynamodb_export = dynamodb_export_; dynamodb_unnest_ddb_json = dynamodb_unnest_ddb_json_ }
    : ddbelt_catalog_additional_options)

let make_dynamo_db_catalog_source ?pitr_enabled:(pitr_enabled_ : boxed_boolean option)
    ?additional_options:(additional_options_ : ddbelt_catalog_additional_options option)
    ~name:(name_ : node_name) ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     pitr_enabled = pitr_enabled_;
     additional_options = additional_options_;
   }
    : dynamo_db_catalog_source)

let make_relational_catalog_source ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({ name = name_; database = database_; table = table_ } : relational_catalog_source)

let make_s3_parquet_source ?compression_type:(compression_type_ : parquet_compression_type option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?recurse:(recurse_ : boxed_boolean option) ?max_band:(max_band_ : boxed_non_negative_int option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~paths:(paths_ : enclosed_in_string_properties) () =
  ({
     name = name_;
     paths = paths_;
     compression_type = compression_type_;
     exclusions = exclusions_;
     group_size = group_size_;
     group_files = group_files_;
     recurse = recurse_;
     max_band = max_band_;
     max_files_in_band = max_files_in_band_;
     additional_options = additional_options_;
     output_schemas = output_schemas_;
   }
    : s3_parquet_source)

let make_s3_json_source ?compression_type:(compression_type_ : compression_type option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?recurse:(recurse_ : boxed_boolean option) ?max_band:(max_band_ : boxed_non_negative_int option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?json_path:(json_path_ : enclosed_in_string_property option)
    ?multiline:(multiline_ : boxed_boolean option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~paths:(paths_ : enclosed_in_string_properties) () =
  ({
     name = name_;
     paths = paths_;
     compression_type = compression_type_;
     exclusions = exclusions_;
     group_size = group_size_;
     group_files = group_files_;
     recurse = recurse_;
     max_band = max_band_;
     max_files_in_band = max_files_in_band_;
     additional_options = additional_options_;
     json_path = json_path_;
     multiline = multiline_;
     output_schemas = output_schemas_;
   }
    : s3_json_source)

let make_s3_csv_source ?compression_type:(compression_type_ : compression_type option)
    ?exclusions:(exclusions_ : enclosed_in_string_properties option)
    ?group_size:(group_size_ : enclosed_in_string_property option)
    ?group_files:(group_files_ : enclosed_in_string_property option)
    ?recurse:(recurse_ : boxed_boolean option) ?max_band:(max_band_ : boxed_non_negative_int option)
    ?max_files_in_band:(max_files_in_band_ : boxed_non_negative_int option)
    ?additional_options:(additional_options_ : s3_direct_source_additional_options option)
    ?escaper:(escaper_ : enclosed_in_string_property_with_quote option)
    ?multiline:(multiline_ : boxed_boolean option)
    ?with_header:(with_header_ : boxed_boolean option)
    ?write_header:(write_header_ : boxed_boolean option)
    ?skip_first:(skip_first_ : boxed_boolean option)
    ?optimize_performance:(optimize_performance_ : boolean_value option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~paths:(paths_ : enclosed_in_string_properties) ~separator:(separator_ : separator)
    ~quote_char:(quote_char_ : quote_char) () =
  ({
     name = name_;
     paths = paths_;
     compression_type = compression_type_;
     exclusions = exclusions_;
     group_size = group_size_;
     group_files = group_files_;
     recurse = recurse_;
     max_band = max_band_;
     max_files_in_band = max_files_in_band_;
     additional_options = additional_options_;
     separator = separator_;
     escaper = escaper_;
     quote_char = quote_char_;
     multiline = multiline_;
     with_header = with_header_;
     write_header = write_header_;
     skip_first = skip_first_;
     optimize_performance = optimize_performance_;
     output_schemas = output_schemas_;
   }
    : s3_csv_source)

let make_s3_catalog_source
    ?partition_predicate:(partition_predicate_ : enclosed_in_string_property option)
    ?additional_options:(additional_options_ : s3_source_additional_options option)
    ~name:(name_ : node_name) ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     partition_predicate = partition_predicate_;
     additional_options = additional_options_;
   }
    : s3_catalog_source)

let make_redshift_source ?redshift_tmp_dir:(redshift_tmp_dir_ : enclosed_in_string_property option)
    ?tmp_dir_iam_role:(tmp_dir_iam_role_ : enclosed_in_string_property option)
    ~name:(name_ : node_name) ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     redshift_tmp_dir = redshift_tmp_dir_;
     tmp_dir_iam_role = tmp_dir_iam_role_;
   }
    : redshift_source)

let make_catalog_source
    ?partition_predicate:(partition_predicate_ : enclosed_in_string_property option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~database:(database_ : enclosed_in_string_property)
    ~table:(table_ : enclosed_in_string_property) () =
  ({
     name = name_;
     database = database_;
     table = table_;
     partition_predicate = partition_predicate_;
     output_schemas = output_schemas_;
   }
    : catalog_source)

let make_spark_connector_source
    ?additional_options:(additional_options_ : additional_options option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~connection_name:(connection_name_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_type:(connection_type_ : enclosed_in_string_property) () =
  ({
     name = name_;
     connection_name = connection_name_;
     connector_name = connector_name_;
     connection_type = connection_type_;
     additional_options = additional_options_;
     output_schemas = output_schemas_;
   }
    : spark_connector_source)

let make_jdbc_connector_options
    ?filter_predicate:(filter_predicate_ : enclosed_in_string_property option)
    ?partition_column:(partition_column_ : enclosed_in_string_property option)
    ?lower_bound:(lower_bound_ : boxed_non_negative_long option)
    ?upper_bound:(upper_bound_ : boxed_non_negative_long option)
    ?num_partitions:(num_partitions_ : boxed_non_negative_long option)
    ?job_bookmark_keys:(job_bookmark_keys_ : enclosed_in_string_properties option)
    ?job_bookmark_keys_sort_order:
      (job_bookmark_keys_sort_order_ : enclosed_in_string_property option)
    ?data_type_mapping:(data_type_mapping_ : jdbc_data_type_mapping option) () =
  ({
     filter_predicate = filter_predicate_;
     partition_column = partition_column_;
     lower_bound = lower_bound_;
     upper_bound = upper_bound_;
     num_partitions = num_partitions_;
     job_bookmark_keys = job_bookmark_keys_;
     job_bookmark_keys_sort_order = job_bookmark_keys_sort_order_;
     data_type_mapping = data_type_mapping_;
   }
    : jdbc_connector_options)

let make_jdbc_connector_source
    ?additional_options:(additional_options_ : jdbc_connector_options option)
    ?connection_table:(connection_table_ : enclosed_in_string_property_with_quote option)
    ?query:(query_ : sql_query option) ?output_schemas:(output_schemas_ : glue_schemas option)
    ~name:(name_ : node_name) ~connection_name:(connection_name_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_type:(connection_type_ : enclosed_in_string_property) () =
  ({
     name = name_;
     connection_name = connection_name_;
     connector_name = connector_name_;
     connection_type = connection_type_;
     additional_options = additional_options_;
     connection_table = connection_table_;
     query = query_;
     output_schemas = output_schemas_;
   }
    : jdbc_connector_source)

let make_athena_connector_source
    ?connection_table:(connection_table_ : enclosed_in_string_property_with_quote option)
    ?output_schemas:(output_schemas_ : glue_schemas option) ~name:(name_ : node_name)
    ~connection_name:(connection_name_ : enclosed_in_string_property)
    ~connector_name:(connector_name_ : enclosed_in_string_property)
    ~connection_type:(connection_type_ : enclosed_in_string_property)
    ~schema_name:(schema_name_ : enclosed_in_string_property) () =
  ({
     name = name_;
     connection_name = connection_name_;
     connector_name = connector_name_;
     connection_type = connection_type_;
     connection_table = connection_table_;
     schema_name = schema_name_;
     output_schemas = output_schemas_;
   }
    : athena_connector_source)

let make_code_gen_configuration_node
    ?athena_connector_source:(athena_connector_source_ : athena_connector_source option)
    ?jdbc_connector_source:(jdbc_connector_source_ : jdbc_connector_source option)
    ?spark_connector_source:(spark_connector_source_ : spark_connector_source option)
    ?catalog_source:(catalog_source_ : catalog_source option)
    ?redshift_source:(redshift_source_ : redshift_source option)
    ?s3_catalog_source:(s3_catalog_source_ : s3_catalog_source option)
    ?s3_csv_source:(s3_csv_source_ : s3_csv_source option)
    ?s3_json_source:(s3_json_source_ : s3_json_source option)
    ?s3_parquet_source:(s3_parquet_source_ : s3_parquet_source option)
    ?relational_catalog_source:(relational_catalog_source_ : relational_catalog_source option)
    ?dynamo_db_catalog_source:(dynamo_db_catalog_source_ : dynamo_db_catalog_source option)
    ?jdbc_connector_target:(jdbc_connector_target_ : jdbc_connector_target option)
    ?spark_connector_target:(spark_connector_target_ : spark_connector_target option)
    ?catalog_target:(catalog_target_ : basic_catalog_target option)
    ?redshift_target:(redshift_target_ : redshift_target option)
    ?s3_catalog_target:(s3_catalog_target_ : s3_catalog_target option)
    ?s3_glue_parquet_target:(s3_glue_parquet_target_ : s3_glue_parquet_target option)
    ?s3_direct_target:(s3_direct_target_ : s3_direct_target option)
    ?apply_mapping:(apply_mapping_ : apply_mapping option)
    ?select_fields:(select_fields_ : select_fields option)
    ?drop_fields:(drop_fields_ : drop_fields option)
    ?rename_field:(rename_field_ : rename_field option) ?spigot:(spigot_ : spigot option)
    ?join:(join_ : join option) ?split_fields:(split_fields_ : split_fields option)
    ?select_from_collection:(select_from_collection_ : select_from_collection option)
    ?fill_missing_values:(fill_missing_values_ : fill_missing_values option)
    ?filter:(filter_ : filter option) ?custom_code:(custom_code_ : custom_code option)
    ?spark_sq_l:(spark_sq_l_ : spark_sq_l option)
    ?direct_kinesis_source:(direct_kinesis_source_ : direct_kinesis_source option)
    ?direct_kafka_source:(direct_kafka_source_ : direct_kafka_source option)
    ?catalog_kinesis_source:(catalog_kinesis_source_ : catalog_kinesis_source option)
    ?catalog_kafka_source:(catalog_kafka_source_ : catalog_kafka_source option)
    ?drop_null_fields:(drop_null_fields_ : drop_null_fields option) ?merge:(merge_ : merge option)
    ?union:(union_ : union option) ?pii_detection:(pii_detection_ : pii_detection option)
    ?aggregate:(aggregate_ : aggregate option)
    ?drop_duplicates:(drop_duplicates_ : drop_duplicates option)
    ?governed_catalog_target:(governed_catalog_target_ : governed_catalog_target option)
    ?governed_catalog_source:(governed_catalog_source_ : governed_catalog_source option)
    ?microsoft_sql_server_catalog_source:
      (microsoft_sql_server_catalog_source_ : microsoft_sql_server_catalog_source option)
    ?my_sql_catalog_source:(my_sql_catalog_source_ : my_sql_catalog_source option)
    ?oracle_sql_catalog_source:(oracle_sql_catalog_source_ : oracle_sql_catalog_source option)
    ?postgre_sql_catalog_source:(postgre_sql_catalog_source_ : postgre_sql_catalog_source option)
    ?microsoft_sql_server_catalog_target:
      (microsoft_sql_server_catalog_target_ : microsoft_sql_server_catalog_target option)
    ?my_sql_catalog_target:(my_sql_catalog_target_ : my_sql_catalog_target option)
    ?oracle_sql_catalog_target:(oracle_sql_catalog_target_ : oracle_sql_catalog_target option)
    ?postgre_sql_catalog_target:(postgre_sql_catalog_target_ : postgre_sql_catalog_target option)
    ?route:(route_ : route option)
    ?dynamic_transform:(dynamic_transform_ : dynamic_transform option)
    ?evaluate_data_quality:(evaluate_data_quality_ : evaluate_data_quality option)
    ?s3_catalog_hudi_source:(s3_catalog_hudi_source_ : s3_catalog_hudi_source option)
    ?catalog_hudi_source:(catalog_hudi_source_ : catalog_hudi_source option)
    ?s3_hudi_source:(s3_hudi_source_ : s3_hudi_source option)
    ?s3_hudi_catalog_target:(s3_hudi_catalog_target_ : s3_hudi_catalog_target option)
    ?s3_hudi_direct_target:(s3_hudi_direct_target_ : s3_hudi_direct_target option)
    ?direct_jdbc_source:(direct_jdbc_source_ : direct_jdbc_source option)
    ?s3_catalog_delta_source:(s3_catalog_delta_source_ : s3_catalog_delta_source option)
    ?catalog_delta_source:(catalog_delta_source_ : catalog_delta_source option)
    ?s3_delta_source:(s3_delta_source_ : s3_delta_source option)
    ?s3_delta_catalog_target:(s3_delta_catalog_target_ : s3_delta_catalog_target option)
    ?s3_delta_direct_target:(s3_delta_direct_target_ : s3_delta_direct_target option)
    ?amazon_redshift_source:(amazon_redshift_source_ : amazon_redshift_source option)
    ?amazon_redshift_target:(amazon_redshift_target_ : amazon_redshift_target option)
    ?evaluate_data_quality_multi_frame:
      (evaluate_data_quality_multi_frame_ : evaluate_data_quality_multi_frame option)
    ?recipe:(recipe_ : recipe option)
    ?snowflake_source:(snowflake_source_ : snowflake_source option)
    ?snowflake_target:(snowflake_target_ : snowflake_target option)
    ?connector_data_source:(connector_data_source_ : connector_data_source option)
    ?connector_data_target:(connector_data_target_ : connector_data_target option)
    ?s3_catalog_iceberg_source:(s3_catalog_iceberg_source_ : s3_catalog_iceberg_source option)
    ?catalog_iceberg_source:(catalog_iceberg_source_ : catalog_iceberg_source option)
    ?s3_iceberg_catalog_target:(s3_iceberg_catalog_target_ : s3_iceberg_catalog_target option)
    ?s3_iceberg_direct_target:(s3_iceberg_direct_target_ : s3_iceberg_direct_target option)
    ?s3_excel_source:(s3_excel_source_ : s3_excel_source option)
    ?s3_hyper_direct_target:(s3_hyper_direct_target_ : s3_hyper_direct_target option)
    ?dynamo_dbelt_connector_source:
      (dynamo_dbelt_connector_source_ : dynamo_dbelt_connector_source option) () =
  ({
     athena_connector_source = athena_connector_source_;
     jdbc_connector_source = jdbc_connector_source_;
     spark_connector_source = spark_connector_source_;
     catalog_source = catalog_source_;
     redshift_source = redshift_source_;
     s3_catalog_source = s3_catalog_source_;
     s3_csv_source = s3_csv_source_;
     s3_json_source = s3_json_source_;
     s3_parquet_source = s3_parquet_source_;
     relational_catalog_source = relational_catalog_source_;
     dynamo_db_catalog_source = dynamo_db_catalog_source_;
     jdbc_connector_target = jdbc_connector_target_;
     spark_connector_target = spark_connector_target_;
     catalog_target = catalog_target_;
     redshift_target = redshift_target_;
     s3_catalog_target = s3_catalog_target_;
     s3_glue_parquet_target = s3_glue_parquet_target_;
     s3_direct_target = s3_direct_target_;
     apply_mapping = apply_mapping_;
     select_fields = select_fields_;
     drop_fields = drop_fields_;
     rename_field = rename_field_;
     spigot = spigot_;
     join = join_;
     split_fields = split_fields_;
     select_from_collection = select_from_collection_;
     fill_missing_values = fill_missing_values_;
     filter = filter_;
     custom_code = custom_code_;
     spark_sq_l = spark_sq_l_;
     direct_kinesis_source = direct_kinesis_source_;
     direct_kafka_source = direct_kafka_source_;
     catalog_kinesis_source = catalog_kinesis_source_;
     catalog_kafka_source = catalog_kafka_source_;
     drop_null_fields = drop_null_fields_;
     merge = merge_;
     union = union_;
     pii_detection = pii_detection_;
     aggregate = aggregate_;
     drop_duplicates = drop_duplicates_;
     governed_catalog_target = governed_catalog_target_;
     governed_catalog_source = governed_catalog_source_;
     microsoft_sql_server_catalog_source = microsoft_sql_server_catalog_source_;
     my_sql_catalog_source = my_sql_catalog_source_;
     oracle_sql_catalog_source = oracle_sql_catalog_source_;
     postgre_sql_catalog_source = postgre_sql_catalog_source_;
     microsoft_sql_server_catalog_target = microsoft_sql_server_catalog_target_;
     my_sql_catalog_target = my_sql_catalog_target_;
     oracle_sql_catalog_target = oracle_sql_catalog_target_;
     postgre_sql_catalog_target = postgre_sql_catalog_target_;
     route = route_;
     dynamic_transform = dynamic_transform_;
     evaluate_data_quality = evaluate_data_quality_;
     s3_catalog_hudi_source = s3_catalog_hudi_source_;
     catalog_hudi_source = catalog_hudi_source_;
     s3_hudi_source = s3_hudi_source_;
     s3_hudi_catalog_target = s3_hudi_catalog_target_;
     s3_hudi_direct_target = s3_hudi_direct_target_;
     direct_jdbc_source = direct_jdbc_source_;
     s3_catalog_delta_source = s3_catalog_delta_source_;
     catalog_delta_source = catalog_delta_source_;
     s3_delta_source = s3_delta_source_;
     s3_delta_catalog_target = s3_delta_catalog_target_;
     s3_delta_direct_target = s3_delta_direct_target_;
     amazon_redshift_source = amazon_redshift_source_;
     amazon_redshift_target = amazon_redshift_target_;
     evaluate_data_quality_multi_frame = evaluate_data_quality_multi_frame_;
     recipe = recipe_;
     snowflake_source = snowflake_source_;
     snowflake_target = snowflake_target_;
     connector_data_source = connector_data_source_;
     connector_data_target = connector_data_target_;
     s3_catalog_iceberg_source = s3_catalog_iceberg_source_;
     catalog_iceberg_source = catalog_iceberg_source_;
     s3_iceberg_catalog_target = s3_iceberg_catalog_target_;
     s3_iceberg_direct_target = s3_iceberg_direct_target_;
     s3_excel_source = s3_excel_source_;
     s3_hyper_direct_target = s3_hyper_direct_target_;
     dynamo_dbelt_connector_source = dynamo_dbelt_connector_source_;
   }
    : code_gen_configuration_node)

let make_connections_list ?connections:(connections_ : connection_string_list option) () =
  ({ connections = connections_ } : connections_list)

let make_job_command ?name:(name_ : generic_string option)
    ?script_location:(script_location_ : script_location_string option)
    ?python_version:(python_version_ : python_version_string option)
    ?runtime:(runtime_ : runtime_name_string option) () =
  ({
     name = name_;
     script_location = script_location_;
     python_version = python_version_;
     runtime = runtime_;
   }
    : job_command)

let make_execution_property ?max_concurrent_runs:(max_concurrent_runs_ : max_concurrent_runs option)
    () =
  ({ max_concurrent_runs = max_concurrent_runs_ } : execution_property)

let make_job_update ?job_mode:(job_mode_ : job_mode option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?description:(description_ : description_string option) ?log_uri:(log_uri_ : uri_string option)
    ?role:(role_ : role_string option)
    ?execution_property:(execution_property_ : execution_property option)
    ?command:(command_ : job_command option)
    ?default_arguments:(default_arguments_ : generic_map option)
    ?non_overridable_arguments:(non_overridable_arguments_ : generic_map option)
    ?connections:(connections_ : connections_list option)
    ?max_retries:(max_retries_ : max_retries option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?timeout:(timeout_ : timeout option) ?max_capacity:(max_capacity_ : nullable_double option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?code_gen_configuration_nodes:
      (code_gen_configuration_nodes_ : code_gen_configuration_nodes option)
    ?execution_class:(execution_class_ : execution_class option)
    ?source_control_details:(source_control_details_ : source_control_details option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option) () =
  ({
     job_mode = job_mode_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     description = description_;
     log_uri = log_uri_;
     role = role_;
     execution_property = execution_property_;
     command = command_;
     default_arguments = default_arguments_;
     non_overridable_arguments = non_overridable_arguments_;
     connections = connections_;
     max_retries = max_retries_;
     allocated_capacity = allocated_capacity_;
     timeout = timeout_;
     max_capacity = max_capacity_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     security_configuration = security_configuration_;
     notification_property = notification_property_;
     glue_version = glue_version_;
     code_gen_configuration_nodes = code_gen_configuration_nodes_;
     execution_class = execution_class_;
     source_control_details = source_control_details_;
     maintenance_window = maintenance_window_;
   }
    : job_update)

let make_update_job_request ~job_name:(job_name_ : name_string)
    ~job_update:(job_update_ : job_update) () =
  ({ job_name = job_name_; job_update = job_update_ } : update_job_request)

let make_update_integration_table_properties_response () = (() : unit)

let make_integration_partition ?field_name:(field_name_ : string128 option)
    ?function_spec:(function_spec_ : string128 option)
    ?conversion_spec:(conversion_spec_ : string128 option) () =
  ({ field_name = field_name_; function_spec = function_spec_; conversion_spec = conversion_spec_ }
    : integration_partition)

let make_target_table_config ?unnest_spec:(unnest_spec_ : unnest_spec option)
    ?partition_spec:(partition_spec_ : integration_partition_spec_list option)
    ?target_table_name:(target_table_name_ : string128 option) () =
  ({
     unnest_spec = unnest_spec_;
     partition_spec = partition_spec_;
     target_table_name = target_table_name_;
   }
    : target_table_config)

let make_source_table_config ?fields:(fields_ : source_table_fields_list option)
    ?filter_predicate:(filter_predicate_ : string128 option)
    ?primary_key:(primary_key_ : primary_key_list option)
    ?record_update_field:(record_update_field_ : string128 option) () =
  ({
     fields = fields_;
     filter_predicate = filter_predicate_;
     primary_key = primary_key_;
     record_update_field = record_update_field_;
   }
    : source_table_config)

let make_update_integration_table_properties_request
    ?source_table_config:(source_table_config_ : source_table_config option)
    ?target_table_config:(target_table_config_ : target_table_config option)
    ~resource_arn:(resource_arn_ : string512) ~table_name:(table_name_ : string128) () =
  ({
     resource_arn = resource_arn_;
     table_name = table_name_;
     source_table_config = source_table_config_;
     target_table_config = target_table_config_;
   }
    : update_integration_table_properties_request)

let make_target_processing_properties ?role_arn:(role_arn_ : string128 option)
    ?kms_arn:(kms_arn_ : string2048 option) ?connection_name:(connection_name_ : string128 option)
    ?event_bus_arn:(event_bus_arn_ : string2048 option) () =
  ({
     role_arn = role_arn_;
     kms_arn = kms_arn_;
     connection_name = connection_name_;
     event_bus_arn = event_bus_arn_;
   }
    : target_processing_properties)

let make_source_processing_properties ?role_arn:(role_arn_ : string128 option) () =
  ({ role_arn = role_arn_ } : source_processing_properties)

let make_update_integration_resource_property_response
    ?resource_arn:(resource_arn_ : string512 option)
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option) () =
  ({
     resource_arn = resource_arn_;
     resource_property_arn = resource_property_arn_;
     source_processing_properties = source_processing_properties_;
     target_processing_properties = target_processing_properties_;
   }
    : update_integration_resource_property_response)

let make_update_integration_resource_property_request
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ~resource_arn:(resource_arn_ : string512) () =
  ({
     resource_arn = resource_arn_;
     source_processing_properties = source_processing_properties_;
     target_processing_properties = target_processing_properties_;
   }
    : update_integration_resource_property_request)

let make_update_glue_identity_center_configuration_response () = (() : unit)

let make_update_glue_identity_center_configuration_request
    ?scopes:(scopes_ : identity_center_scopes_list option)
    ?user_background_sessions_enabled:(user_background_sessions_enabled_ : nullable_boolean option)
    () =
  ({ scopes = scopes_; user_background_sessions_enabled = user_background_sessions_enabled_ }
    : update_glue_identity_center_configuration_request)

let make_update_glossary_term_response ?id:(id_ : glossary_term_id option)
    ?glossary_id:(glossary_id_ : glossary_id option) ?name:(name_ : glossary_term_name option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?long_description:(long_description_ : glossary_long_description option) () =
  ({
     id = id_;
     glossary_id = glossary_id_;
     name = name_;
     short_description = short_description_;
     long_description = long_description_;
   }
    : update_glossary_term_response)

let make_update_glossary_term_request ?name:(name_ : glossary_term_name option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?long_description:(long_description_ : glossary_long_description option)
    ?client_token:(client_token_ : hash_string option) ~identifier:(identifier_ : glossary_term_id)
    () =
  ({
     identifier = identifier_;
     name = name_;
     short_description = short_description_;
     long_description = long_description_;
     client_token = client_token_;
   }
    : update_glossary_term_request)

let make_update_glossary_response ?id:(id_ : glossary_id option)
    ?name:(name_ : glossary_name option) ?description:(description_ : metadata_description option)
    () =
  ({ id = id_; name = name_; description = description_ } : update_glossary_response)

let make_update_glossary_request ?name:(name_ : glossary_name option)
    ?description:(description_ : metadata_description option)
    ?client_token:(client_token_ : hash_string option) ~identifier:(identifier_ : glossary_id) () =
  ({
     identifier = identifier_;
     name = name_;
     description = description_;
     client_token = client_token_;
   }
    : update_glossary_request)

let make_update_dev_endpoint_response () = (() : unit)

let make_dev_endpoint_custom_libraries
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option)
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option) () =
  ({
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
     extra_jars_s3_path = extra_jars_s3_path_;
   }
    : dev_endpoint_custom_libraries)

let make_update_dev_endpoint_request ?public_key:(public_key_ : generic_string option)
    ?add_public_keys:(add_public_keys_ : public_keys_list option)
    ?delete_public_keys:(delete_public_keys_ : public_keys_list option)
    ?custom_libraries:(custom_libraries_ : dev_endpoint_custom_libraries option)
    ?update_etl_libraries:(update_etl_libraries_ : boolean_value option)
    ?delete_arguments:(delete_arguments_ : string_list option)
    ?add_arguments:(add_arguments_ : map_value option)
    ~endpoint_name:(endpoint_name_ : generic_string) () =
  ({
     endpoint_name = endpoint_name_;
     public_key = public_key_;
     add_public_keys = add_public_keys_;
     delete_public_keys = delete_public_keys_;
     custom_libraries = custom_libraries_;
     update_etl_libraries = update_etl_libraries_;
     delete_arguments = delete_arguments_;
     add_arguments = add_arguments_;
   }
    : update_dev_endpoint_request)

let make_update_data_quality_ruleset_response ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?ruleset:(ruleset_ : data_quality_ruleset_string option) () =
  ({ name = name_; description = description_; ruleset = ruleset_ }
    : update_data_quality_ruleset_response)

let make_update_data_quality_ruleset_request ?description:(description_ : description_string option)
    ?ruleset:(ruleset_ : data_quality_ruleset_string option) ~name:(name_ : name_string) () =
  ({ name = name_; description = description_; ruleset = ruleset_ }
    : update_data_quality_ruleset_request)

let make_update_database_response () = (() : unit)

let make_federated_database ?identifier:(identifier_ : federation_identifier option)
    ?connection_name:(connection_name_ : name_string option)
    ?connection_type:(connection_type_ : name_string option) () =
  ({
     identifier = identifier_;
     connection_name = connection_name_;
     connection_type = connection_type_;
   }
    : federated_database)

let make_database_identifier ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : name_string option) ?region:(region_ : name_string option) () =
  ({ catalog_id = catalog_id_; database_name = database_name_; region = region_ }
    : database_identifier)

let make_data_lake_principal
    ?data_lake_principal_identifier:
      (data_lake_principal_identifier_ : data_lake_principal_string option) () =
  ({ data_lake_principal_identifier = data_lake_principal_identifier_ } : data_lake_principal)

let make_principal_permissions ?principal:(principal_ : data_lake_principal option)
    ?permissions:(permissions_ : permission_list option) () =
  ({ principal = principal_; permissions = permissions_ } : principal_permissions)

let make_database_input ?description:(description_ : description_string option)
    ?location_uri:(location_uri_ : ur_i option) ?parameters:(parameters_ : parameters_map option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?target_database:(target_database_ : database_identifier option)
    ?federated_database:(federated_database_ : federated_database option)
    ~name:(name_ : name_string) () =
  ({
     name = name_;
     description = description_;
     location_uri = location_uri_;
     parameters = parameters_;
     create_table_default_permissions = create_table_default_permissions_;
     target_database = target_database_;
     federated_database = federated_database_;
   }
    : database_input)

let make_update_database_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~name:(name_ : name_string) ~database_input:(database_input_ : database_input) () =
  ({ catalog_id = catalog_id_; name = name_; database_input = database_input_ }
    : update_database_request)

let make_update_crawler_schedule_response () = (() : unit)

let make_update_crawler_schedule_request ?schedule:(schedule_ : cron_expression option)
    ~crawler_name:(crawler_name_ : name_string) () =
  ({ crawler_name = crawler_name_; schedule = schedule_ } : update_crawler_schedule_request)

let make_update_crawler_response () = (() : unit)

let make_lake_formation_configuration
    ?use_lake_formation_credentials:(use_lake_formation_credentials_ : nullable_boolean option)
    ?account_id:(account_id_ : account_id option) () =
  ({ use_lake_formation_credentials = use_lake_formation_credentials_; account_id = account_id_ }
    : lake_formation_configuration)

let make_lineage_configuration
    ?crawler_lineage_settings:(crawler_lineage_settings_ : crawler_lineage_settings option) () =
  ({ crawler_lineage_settings = crawler_lineage_settings_ } : lineage_configuration)

let make_recrawl_policy ?recrawl_behavior:(recrawl_behavior_ : recrawl_behavior option) () =
  ({ recrawl_behavior = recrawl_behavior_ } : recrawl_policy)

let make_schema_change_policy ?update_behavior:(update_behavior_ : update_behavior option)
    ?delete_behavior:(delete_behavior_ : delete_behavior option) () =
  ({ update_behavior = update_behavior_; delete_behavior = delete_behavior_ }
    : schema_change_policy)

let make_hudi_target ?paths:(paths_ : path_list option)
    ?connection_name:(connection_name_ : connection_name option)
    ?exclusions:(exclusions_ : path_list option)
    ?maximum_traversal_depth:(maximum_traversal_depth_ : nullable_integer option) () =
  ({
     paths = paths_;
     connection_name = connection_name_;
     exclusions = exclusions_;
     maximum_traversal_depth = maximum_traversal_depth_;
   }
    : hudi_target)

let make_iceberg_target ?paths:(paths_ : path_list option)
    ?connection_name:(connection_name_ : connection_name option)
    ?exclusions:(exclusions_ : path_list option)
    ?maximum_traversal_depth:(maximum_traversal_depth_ : nullable_integer option) () =
  ({
     paths = paths_;
     connection_name = connection_name_;
     exclusions = exclusions_;
     maximum_traversal_depth = maximum_traversal_depth_;
   }
    : iceberg_target)

let make_delta_target ?delta_tables:(delta_tables_ : path_list option)
    ?connection_name:(connection_name_ : connection_name option)
    ?write_manifest:(write_manifest_ : nullable_boolean option)
    ?create_native_delta_table:(create_native_delta_table_ : nullable_boolean option) () =
  ({
     delta_tables = delta_tables_;
     connection_name = connection_name_;
     write_manifest = write_manifest_;
     create_native_delta_table = create_native_delta_table_;
   }
    : delta_target)

let make_catalog_target ?connection_name:(connection_name_ : connection_name option)
    ?event_queue_arn:(event_queue_arn_ : event_queue_arn option)
    ?dlq_event_queue_arn:(dlq_event_queue_arn_ : event_queue_arn option)
    ~database_name:(database_name_ : name_string) ~tables:(tables_ : catalog_tables_list) () =
  ({
     database_name = database_name_;
     tables = tables_;
     connection_name = connection_name_;
     event_queue_arn = event_queue_arn_;
     dlq_event_queue_arn = dlq_event_queue_arn_;
   }
    : catalog_target)

let make_dynamo_db_target ?path:(path_ : path option)
    ?scan_all:(scan_all_ : nullable_boolean option) ?scan_rate:(scan_rate_ : nullable_double option)
    () =
  ({ path = path_; scan_all = scan_all_; scan_rate = scan_rate_ } : dynamo_db_target)

let make_mongo_db_target ?connection_name:(connection_name_ : connection_name option)
    ?path:(path_ : path option) ?scan_all:(scan_all_ : nullable_boolean option) () =
  ({ connection_name = connection_name_; path = path_; scan_all = scan_all_ } : mongo_db_target)

let make_jdbc_target ?connection_name:(connection_name_ : connection_name option)
    ?path:(path_ : path option) ?exclusions:(exclusions_ : path_list option)
    ?enable_additional_metadata:(enable_additional_metadata_ : enable_additional_metadata option) ()
    =
  ({
     connection_name = connection_name_;
     path = path_;
     exclusions = exclusions_;
     enable_additional_metadata = enable_additional_metadata_;
   }
    : jdbc_target)

let make_s3_target ?path:(path_ : path option) ?exclusions:(exclusions_ : path_list option)
    ?connection_name:(connection_name_ : connection_name option)
    ?sample_size:(sample_size_ : nullable_integer option)
    ?event_queue_arn:(event_queue_arn_ : event_queue_arn option)
    ?dlq_event_queue_arn:(dlq_event_queue_arn_ : event_queue_arn option) () =
  ({
     path = path_;
     exclusions = exclusions_;
     connection_name = connection_name_;
     sample_size = sample_size_;
     event_queue_arn = event_queue_arn_;
     dlq_event_queue_arn = dlq_event_queue_arn_;
   }
    : s3_target)

let make_crawler_targets ?s3_targets:(s3_targets_ : s3_target_list option)
    ?jdbc_targets:(jdbc_targets_ : jdbc_target_list option)
    ?mongo_db_targets:(mongo_db_targets_ : mongo_db_target_list option)
    ?dynamo_db_targets:(dynamo_db_targets_ : dynamo_db_target_list option)
    ?catalog_targets:(catalog_targets_ : catalog_target_list option)
    ?delta_targets:(delta_targets_ : delta_target_list option)
    ?iceberg_targets:(iceberg_targets_ : iceberg_target_list option)
    ?hudi_targets:(hudi_targets_ : hudi_target_list option) () =
  ({
     s3_targets = s3_targets_;
     jdbc_targets = jdbc_targets_;
     mongo_db_targets = mongo_db_targets_;
     dynamo_db_targets = dynamo_db_targets_;
     catalog_targets = catalog_targets_;
     delta_targets = delta_targets_;
     iceberg_targets = iceberg_targets_;
     hudi_targets = hudi_targets_;
   }
    : crawler_targets)

let make_update_crawler_request ?role:(role_ : role option)
    ?database_name:(database_name_ : database_name option)
    ?description:(description_ : description_string_removable option)
    ?targets:(targets_ : crawler_targets option) ?schedule:(schedule_ : cron_expression option)
    ?classifiers:(classifiers_ : classifier_name_list option)
    ?table_prefix:(table_prefix_ : table_prefix option)
    ?schema_change_policy:(schema_change_policy_ : schema_change_policy option)
    ?recrawl_policy:(recrawl_policy_ : recrawl_policy option)
    ?lineage_configuration:(lineage_configuration_ : lineage_configuration option)
    ?lake_formation_configuration:
      (lake_formation_configuration_ : lake_formation_configuration option)
    ?configuration:(configuration_ : crawler_configuration option)
    ?crawler_security_configuration:
      (crawler_security_configuration_ : crawler_security_configuration option)
    ~name:(name_ : name_string) () =
  ({
     name = name_;
     role = role_;
     database_name = database_name_;
     description = description_;
     targets = targets_;
     schedule = schedule_;
     classifiers = classifiers_;
     table_prefix = table_prefix_;
     schema_change_policy = schema_change_policy_;
     recrawl_policy = recrawl_policy_;
     lineage_configuration = lineage_configuration_;
     lake_formation_configuration = lake_formation_configuration_;
     configuration = configuration_;
     crawler_security_configuration = crawler_security_configuration_;
   }
    : update_crawler_request)

let make_update_connection_response () = (() : unit)

let make_basic_authentication_credentials ?username:(username_ : username option)
    ?password:(password_ : password option) () =
  ({ username = username_; password = password_ } : basic_authentication_credentials)

let make_o_auth2_credentials
    ?user_managed_client_application_client_secret:
      (user_managed_client_application_client_secret_ :
         user_managed_client_application_client_secret option)
    ?access_token:(access_token_ : access_token option)
    ?refresh_token:(refresh_token_ : refresh_token option)
    ?jwt_token:(jwt_token_ : jwt_token option) () =
  ({
     user_managed_client_application_client_secret = user_managed_client_application_client_secret_;
     access_token = access_token_;
     refresh_token = refresh_token_;
     jwt_token = jwt_token_;
   }
    : o_auth2_credentials)

let make_authorization_code_properties
    ?authorization_code:(authorization_code_ : authorization_code option)
    ?redirect_uri:(redirect_uri_ : redirect_uri option) () =
  ({ authorization_code = authorization_code_; redirect_uri = redirect_uri_ }
    : authorization_code_properties)

let make_o_auth2_client_application
    ?user_managed_client_application_client_id:
      (user_managed_client_application_client_id_ : user_managed_client_application_client_id option)
    ?aws_managed_client_application_reference:
      (aws_managed_client_application_reference_ : aws_managed_client_application_reference option)
    () =
  ({
     user_managed_client_application_client_id = user_managed_client_application_client_id_;
     aws_managed_client_application_reference = aws_managed_client_application_reference_;
   }
    : o_auth2_client_application)

let make_o_auth2_properties_input
    ?o_auth2_grant_type:(o_auth2_grant_type_ : o_auth2_grant_type option)
    ?o_auth2_client_application:(o_auth2_client_application_ : o_auth2_client_application option)
    ?token_url:(token_url_ : token_url option)
    ?token_url_parameters_map:(token_url_parameters_map_ : token_url_parameters_map option)
    ?authorization_code_properties:
      (authorization_code_properties_ : authorization_code_properties option)
    ?o_auth2_credentials:(o_auth2_credentials_ : o_auth2_credentials option) () =
  ({
     o_auth2_grant_type = o_auth2_grant_type_;
     o_auth2_client_application = o_auth2_client_application_;
     token_url = token_url_;
     token_url_parameters_map = token_url_parameters_map_;
     authorization_code_properties = authorization_code_properties_;
     o_auth2_credentials = o_auth2_credentials_;
   }
    : o_auth2_properties_input)

let make_authentication_configuration_input
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?o_auth2_properties:(o_auth2_properties_ : o_auth2_properties_input option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?basic_authentication_credentials:
      (basic_authentication_credentials_ : basic_authentication_credentials option)
    ?custom_authentication_credentials:(custom_authentication_credentials_ : credential_map option)
    () =
  ({
     authentication_type = authentication_type_;
     o_auth2_properties = o_auth2_properties_;
     secret_arn = secret_arn_;
     kms_key_arn = kms_key_arn_;
     basic_authentication_credentials = basic_authentication_credentials_;
     custom_authentication_credentials = custom_authentication_credentials_;
   }
    : authentication_configuration_input)

let make_physical_connection_requirements ?subnet_id:(subnet_id_ : name_string option)
    ?security_group_id_list:(security_group_id_list_ : security_group_id_list option)
    ?availability_zone:(availability_zone_ : name_string option) () =
  ({
     subnet_id = subnet_id_;
     security_group_id_list = security_group_id_list_;
     availability_zone = availability_zone_;
   }
    : physical_connection_requirements)

let make_connection_input ?description:(description_ : description_string option)
    ?match_criteria:(match_criteria_ : match_criteria option)
    ?spark_properties:(spark_properties_ : property_map option)
    ?athena_properties:(athena_properties_ : property_map option)
    ?python_properties:(python_properties_ : property_map option)
    ?physical_connection_requirements:
      (physical_connection_requirements_ : physical_connection_requirements option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration_input option)
    ?validate_credentials:(validate_credentials_ : boolean_ option)
    ?validate_for_compute_environments:
      (validate_for_compute_environments_ : compute_environment_list option)
    ~name:(name_ : name_string) ~connection_type:(connection_type_ : connection_type)
    ~connection_properties:(connection_properties_ : connection_properties) () =
  ({
     name = name_;
     description = description_;
     connection_type = connection_type_;
     match_criteria = match_criteria_;
     connection_properties = connection_properties_;
     spark_properties = spark_properties_;
     athena_properties = athena_properties_;
     python_properties = python_properties_;
     physical_connection_requirements = physical_connection_requirements_;
     authentication_configuration = authentication_configuration_;
     validate_credentials = validate_credentials_;
     validate_for_compute_environments = validate_for_compute_environments_;
   }
    : connection_input)

let make_update_connection_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~name:(name_ : name_string) ~connection_input:(connection_input_ : connection_input) () =
  ({ catalog_id = catalog_id_; name = name_; connection_input = connection_input_ }
    : update_connection_request)

let make_update_column_statistics_task_settings_response () = (() : unit)

let make_update_column_statistics_task_settings_request ?role:(role_ : name_string option)
    ?schedule:(schedule_ : cron_expression option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?catalog_i_d:(catalog_i_d_ : name_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     role = role_;
     schedule = schedule_;
     column_name_list = column_name_list_;
     sample_size = sample_size_;
     catalog_i_d = catalog_i_d_;
     security_configuration = security_configuration_;
   }
    : update_column_statistics_task_settings_request)

let make_error_detail ?error_code:(error_code_ : name_string option)
    ?error_message:(error_message_ : description_string option) () =
  ({ error_code = error_code_; error_message = error_message_ } : error_detail)

let make_binary_column_statistics_data ~maximum_length:(maximum_length_ : non_negative_long)
    ~average_length:(average_length_ : non_negative_double)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long) () =
  ({
     maximum_length = maximum_length_;
     average_length = average_length_;
     number_of_nulls = number_of_nulls_;
   }
    : binary_column_statistics_data)

let make_string_column_statistics_data ~maximum_length:(maximum_length_ : non_negative_long)
    ~average_length:(average_length_ : non_negative_double)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long) () =
  ({
     maximum_length = maximum_length_;
     average_length = average_length_;
     number_of_nulls = number_of_nulls_;
     number_of_distinct_values = number_of_distinct_values_;
   }
    : string_column_statistics_data)

let make_long_column_statistics_data ?minimum_value:(minimum_value_ : long option)
    ?maximum_value:(maximum_value_ : long option)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long) () =
  ({
     minimum_value = minimum_value_;
     maximum_value = maximum_value_;
     number_of_nulls = number_of_nulls_;
     number_of_distinct_values = number_of_distinct_values_;
   }
    : long_column_statistics_data)

let make_double_column_statistics_data ?minimum_value:(minimum_value_ : double option)
    ?maximum_value:(maximum_value_ : double option)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long) () =
  ({
     minimum_value = minimum_value_;
     maximum_value = maximum_value_;
     number_of_nulls = number_of_nulls_;
     number_of_distinct_values = number_of_distinct_values_;
   }
    : double_column_statistics_data)

let make_decimal_number ~unscaled_value:(unscaled_value_ : blob) ~scale:(scale_ : integer) () =
  ({ unscaled_value = unscaled_value_; scale = scale_ } : decimal_number)

let make_decimal_column_statistics_data ?minimum_value:(minimum_value_ : decimal_number option)
    ?maximum_value:(maximum_value_ : decimal_number option)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long) () =
  ({
     minimum_value = minimum_value_;
     maximum_value = maximum_value_;
     number_of_nulls = number_of_nulls_;
     number_of_distinct_values = number_of_distinct_values_;
   }
    : decimal_column_statistics_data)

let make_date_column_statistics_data ?minimum_value:(minimum_value_ : timestamp option)
    ?maximum_value:(maximum_value_ : timestamp option)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long)
    ~number_of_distinct_values:(number_of_distinct_values_ : non_negative_long) () =
  ({
     minimum_value = minimum_value_;
     maximum_value = maximum_value_;
     number_of_nulls = number_of_nulls_;
     number_of_distinct_values = number_of_distinct_values_;
   }
    : date_column_statistics_data)

let make_boolean_column_statistics_data ~number_of_trues:(number_of_trues_ : non_negative_long)
    ~number_of_falses:(number_of_falses_ : non_negative_long)
    ~number_of_nulls:(number_of_nulls_ : non_negative_long) () =
  ({
     number_of_trues = number_of_trues_;
     number_of_falses = number_of_falses_;
     number_of_nulls = number_of_nulls_;
   }
    : boolean_column_statistics_data)

let make_column_statistics_data
    ?boolean_column_statistics_data:
      (boolean_column_statistics_data_ : boolean_column_statistics_data option)
    ?date_column_statistics_data:(date_column_statistics_data_ : date_column_statistics_data option)
    ?decimal_column_statistics_data:
      (decimal_column_statistics_data_ : decimal_column_statistics_data option)
    ?double_column_statistics_data:
      (double_column_statistics_data_ : double_column_statistics_data option)
    ?long_column_statistics_data:(long_column_statistics_data_ : long_column_statistics_data option)
    ?string_column_statistics_data:
      (string_column_statistics_data_ : string_column_statistics_data option)
    ?binary_column_statistics_data:
      (binary_column_statistics_data_ : binary_column_statistics_data option)
    ~type_:(type__ : column_statistics_type) () =
  ({
     type_ = type__;
     boolean_column_statistics_data = boolean_column_statistics_data_;
     date_column_statistics_data = date_column_statistics_data_;
     decimal_column_statistics_data = decimal_column_statistics_data_;
     double_column_statistics_data = double_column_statistics_data_;
     long_column_statistics_data = long_column_statistics_data_;
     string_column_statistics_data = string_column_statistics_data_;
     binary_column_statistics_data = binary_column_statistics_data_;
   }
    : column_statistics_data)

let make_column_statistics ~column_name:(column_name_ : name_string)
    ~column_type:(column_type_ : type_string) ~analyzed_time:(analyzed_time_ : timestamp)
    ~statistics_data:(statistics_data_ : column_statistics_data) () =
  ({
     column_name = column_name_;
     column_type = column_type_;
     analyzed_time = analyzed_time_;
     statistics_data = statistics_data_;
   }
    : column_statistics)

let make_column_statistics_error ?column_statistics:(column_statistics_ : column_statistics option)
    ?error:(error_ : error_detail option) () =
  ({ column_statistics = column_statistics_; error = error_ } : column_statistics_error)

let make_update_column_statistics_for_table_response
    ?errors:(errors_ : column_statistics_errors option) () =
  ({ errors = errors_ } : update_column_statistics_for_table_response)

let make_update_column_statistics_for_table_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~column_statistics_list:(column_statistics_list_ : update_column_statistics_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     column_statistics_list = column_statistics_list_;
   }
    : update_column_statistics_for_table_request)

let make_update_column_statistics_for_partition_response
    ?errors:(errors_ : column_statistics_errors option) () =
  ({ errors = errors_ } : update_column_statistics_for_partition_response)

let make_update_column_statistics_for_partition_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_values:(partition_values_ : value_string_list)
    ~column_statistics_list:(column_statistics_list_ : update_column_statistics_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_values = partition_values_;
     column_statistics_list = column_statistics_list_;
   }
    : update_column_statistics_for_partition_request)

let make_update_classifier_response () = (() : unit)

let make_update_csv_classifier_request ?delimiter:(delimiter_ : csv_column_delimiter option)
    ?quote_symbol:(quote_symbol_ : csv_quote_symbol option)
    ?contains_header:(contains_header_ : csv_header_option option)
    ?header:(header_ : csv_header option)
    ?disable_value_trimming:(disable_value_trimming_ : nullable_boolean option)
    ?allow_single_column:(allow_single_column_ : nullable_boolean option)
    ?custom_datatype_configured:(custom_datatype_configured_ : nullable_boolean option)
    ?custom_datatypes:(custom_datatypes_ : custom_datatypes option)
    ?serde:(serde_ : csv_serde_option option) ~name:(name_ : name_string) () =
  ({
     name = name_;
     delimiter = delimiter_;
     quote_symbol = quote_symbol_;
     contains_header = contains_header_;
     header = header_;
     disable_value_trimming = disable_value_trimming_;
     allow_single_column = allow_single_column_;
     custom_datatype_configured = custom_datatype_configured_;
     custom_datatypes = custom_datatypes_;
     serde = serde_;
   }
    : update_csv_classifier_request)

let make_update_json_classifier_request ?json_path:(json_path_ : json_path option)
    ~name:(name_ : name_string) () =
  ({ name = name_; json_path = json_path_ } : update_json_classifier_request)

let make_update_xml_classifier_request ?classification:(classification_ : classification option)
    ?row_tag:(row_tag_ : row_tag option) ~name:(name_ : name_string) () =
  ({ name = name_; classification = classification_; row_tag = row_tag_ }
    : update_xml_classifier_request)

let make_update_grok_classifier_request ?classification:(classification_ : classification option)
    ?grok_pattern:(grok_pattern_ : grok_pattern option)
    ?custom_patterns:(custom_patterns_ : custom_patterns option) ~name:(name_ : name_string) () =
  ({
     name = name_;
     classification = classification_;
     grok_pattern = grok_pattern_;
     custom_patterns = custom_patterns_;
   }
    : update_grok_classifier_request)

let make_update_classifier_request
    ?grok_classifier:(grok_classifier_ : update_grok_classifier_request option)
    ?xml_classifier:(xml_classifier_ : update_xml_classifier_request option)
    ?json_classifier:(json_classifier_ : update_json_classifier_request option)
    ?csv_classifier:(csv_classifier_ : update_csv_classifier_request option) () =
  ({
     grok_classifier = grok_classifier_;
     xml_classifier = xml_classifier_;
     json_classifier = json_classifier_;
     csv_classifier = csv_classifier_;
   }
    : update_classifier_request)

let make_update_catalog_response () = (() : unit)

let make_iceberg_optimization_properties ?role_arn:(role_arn_ : iam_role_arn option)
    ?compaction:(compaction_ : parameters_map option)
    ?retention:(retention_ : parameters_map option)
    ?orphan_file_deletion:(orphan_file_deletion_ : parameters_map option) () =
  ({
     role_arn = role_arn_;
     compaction = compaction_;
     retention = retention_;
     orphan_file_deletion = orphan_file_deletion_;
   }
    : iceberg_optimization_properties)

let make_data_lake_access_properties ?data_lake_access:(data_lake_access_ : boolean_ option)
    ?data_transfer_role:(data_transfer_role_ : iam_role_arn option)
    ?kms_key:(kms_key_ : resource_arn_string option)
    ?catalog_type:(catalog_type_ : name_string option) () =
  ({
     data_lake_access = data_lake_access_;
     data_transfer_role = data_transfer_role_;
     kms_key = kms_key_;
     catalog_type = catalog_type_;
   }
    : data_lake_access_properties)

let make_catalog_properties
    ?data_lake_access_properties:(data_lake_access_properties_ : data_lake_access_properties option)
    ?iceberg_optimization_properties:
      (iceberg_optimization_properties_ : iceberg_optimization_properties option)
    ?custom_properties:(custom_properties_ : parameters_map option) () =
  ({
     data_lake_access_properties = data_lake_access_properties_;
     iceberg_optimization_properties = iceberg_optimization_properties_;
     custom_properties = custom_properties_;
   }
    : catalog_properties)

let make_target_redshift_catalog ~catalog_arn:(catalog_arn_ : resource_arn_string) () =
  ({ catalog_arn = catalog_arn_ } : target_redshift_catalog)

let make_federated_catalog ?identifier:(identifier_ : federation_identifier option)
    ?connection_name:(connection_name_ : name_string option)
    ?connection_type:(connection_type_ : name_string option) () =
  ({
     identifier = identifier_;
     connection_name = connection_name_;
     connection_type = connection_type_;
   }
    : federated_catalog)

let make_catalog_input ?description:(description_ : description_string option)
    ?federated_catalog:(federated_catalog_ : federated_catalog option)
    ?parameters:(parameters_ : parameters_map option)
    ?target_redshift_catalog:(target_redshift_catalog_ : target_redshift_catalog option)
    ?catalog_properties:(catalog_properties_ : catalog_properties option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?create_database_default_permissions:
      (create_database_default_permissions_ : principal_permissions_list option)
    ?allow_full_table_external_data_access:
      (allow_full_table_external_data_access_ : allow_full_table_external_data_access_enum option)
    ?overwrite_child_resource_permissions_with_default:
      (overwrite_child_resource_permissions_with_default_ :
         overwrite_child_resource_permissions_with_default_enum option) () =
  ({
     description = description_;
     federated_catalog = federated_catalog_;
     parameters = parameters_;
     target_redshift_catalog = target_redshift_catalog_;
     catalog_properties = catalog_properties_;
     create_table_default_permissions = create_table_default_permissions_;
     create_database_default_permissions = create_database_default_permissions_;
     allow_full_table_external_data_access = allow_full_table_external_data_access_;
     overwrite_child_resource_permissions_with_default =
       overwrite_child_resource_permissions_with_default_;
   }
    : catalog_input)

let make_update_catalog_request ~catalog_id:(catalog_id_ : catalog_id_string)
    ~catalog_input:(catalog_input_ : catalog_input) () =
  ({ catalog_id = catalog_id_; catalog_input = catalog_input_ } : update_catalog_request)

let make_update_blueprint_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : update_blueprint_response)

let make_update_blueprint_request ?description:(description_ : generic512_char_string option)
    ~name:(name_ : orchestration_name_string)
    ~blueprint_location:(blueprint_location_ : orchestration_s3_location) () =
  ({ name = name_; description = description_; blueprint_location = blueprint_location_ }
    : update_blueprint_request)

let make_update_asset_response ?name:(name_ : asset_name option)
    ?description:(description_ : asset_description option)
    ?updated_at:(updated_at_ : updated_at option) ~id:(id_ : asset_id) () =
  ({ id = id_; name = name_; description = description_; updated_at = updated_at_ }
    : update_asset_response)

let make_update_asset_request ?name:(name_ : asset_name option)
    ?description:(description_ : asset_description option)
    ?client_token:(client_token_ : hash_string option) ~identifier:(identifier_ : asset_id) () =
  ({
     identifier = identifier_;
     name = name_;
     description = description_;
     client_token = client_token_;
   }
    : update_asset_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : glue_resource_arn)
    ~tags_to_remove:(tags_to_remove_ : tag_keys_list) () =
  ({ resource_arn = resource_arn_; tags_to_remove = tags_to_remove_ } : untag_resource_request)

let make_test_connection_response () = (() : unit)

let make_test_connection_input
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration_input option)
    ~connection_type:(connection_type_ : connection_type)
    ~connection_properties:(connection_properties_ : connection_properties) () =
  ({
     connection_type = connection_type_;
     connection_properties = connection_properties_;
     authentication_configuration = authentication_configuration_;
   }
    : test_connection_input)

let make_test_connection_request ?connection_name:(connection_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?test_connection_input:(test_connection_input_ : test_connection_input option) () =
  ({
     connection_name = connection_name_;
     catalog_id = catalog_id_;
     test_connection_input = test_connection_input_;
   }
    : test_connection_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : glue_resource_arn)
    ~tags_to_add:(tags_to_add_ : tags_map) () =
  ({ resource_arn = resource_arn_; tags_to_add = tags_to_add_ } : tag_resource_request)

let make_stop_workflow_run_response () = (() : unit)

let make_stop_workflow_run_request ~name:(name_ : name_string) ~run_id:(run_id_ : id_string) () =
  ({ name = name_; run_id = run_id_ } : stop_workflow_run_request)

let make_stop_trigger_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : stop_trigger_response)

let make_stop_trigger_request ~name:(name_ : name_string) () =
  ({ name = name_ } : stop_trigger_request)

let make_stop_session_response ?id:(id_ : name_string option) () =
  ({ id = id_ } : stop_session_response)

let make_stop_session_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~id:(id_ : name_string) () =
  ({ id = id_; request_origin = request_origin_ } : stop_session_request)

let make_stop_materialized_view_refresh_task_run_response () = (() : unit)

let make_stop_materialized_view_refresh_task_run_request ~catalog_id:(catalog_id_ : name_string)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({ catalog_id = catalog_id_; database_name = database_name_; table_name = table_name_ }
    : stop_materialized_view_refresh_task_run_request)

let make_stop_crawler_schedule_response () = (() : unit)

let make_stop_crawler_schedule_request ~crawler_name:(crawler_name_ : name_string) () =
  ({ crawler_name = crawler_name_ } : stop_crawler_schedule_request)

let make_stop_crawler_response () = (() : unit)

let make_stop_crawler_request ~name:(name_ : name_string) () =
  ({ name = name_ } : stop_crawler_request)

let make_stop_column_statistics_task_run_schedule_response () = (() : unit)

let make_stop_column_statistics_task_run_schedule_request
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({ database_name = database_name_; table_name = table_name_ }
    : stop_column_statistics_task_run_schedule_request)

let make_stop_column_statistics_task_run_response () = (() : unit)

let make_stop_column_statistics_task_run_request ~database_name:(database_name_ : database_name)
    ~table_name:(table_name_ : name_string) () =
  ({ database_name = database_name_; table_name = table_name_ }
    : stop_column_statistics_task_run_request)

let make_start_workflow_run_response ?run_id:(run_id_ : id_string option) () =
  ({ run_id = run_id_ } : start_workflow_run_response)

let make_start_workflow_run_request
    ?run_properties:(run_properties_ : workflow_run_properties option) ~name:(name_ : name_string)
    () =
  ({ name = name_; run_properties = run_properties_ } : start_workflow_run_request)

let make_start_trigger_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : start_trigger_response)

let make_start_trigger_request ~name:(name_ : name_string) () =
  ({ name = name_ } : start_trigger_request)

let make_start_ml_labeling_set_generation_task_run_response
    ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_ml_labeling_set_generation_task_run_response)

let make_start_ml_labeling_set_generation_task_run_request
    ~transform_id:(transform_id_ : hash_string) ~output_s3_path:(output_s3_path_ : uri_string) () =
  ({ transform_id = transform_id_; output_s3_path = output_s3_path_ }
    : start_ml_labeling_set_generation_task_run_request)

let make_start_ml_evaluation_task_run_response ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_ml_evaluation_task_run_response)

let make_start_ml_evaluation_task_run_request ~transform_id:(transform_id_ : hash_string) () =
  ({ transform_id = transform_id_ } : start_ml_evaluation_task_run_request)

let make_start_materialized_view_refresh_task_run_response
    ?materialized_view_refresh_task_run_id:(materialized_view_refresh_task_run_id_ : uui_dv4 option)
    () =
  ({ materialized_view_refresh_task_run_id = materialized_view_refresh_task_run_id_ }
    : start_materialized_view_refresh_task_run_response)

let make_start_materialized_view_refresh_task_run_request
    ?full_refresh:(full_refresh_ : nullable_boolean option) ~catalog_id:(catalog_id_ : name_string)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     full_refresh = full_refresh_;
   }
    : start_materialized_view_refresh_task_run_request)

let make_start_job_run_response ?job_run_id:(job_run_id_ : id_string option) () =
  ({ job_run_id = job_run_id_ } : start_job_run_response)

let make_start_job_run_request
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?job_run_id:(job_run_id_ : id_string option) ?arguments:(arguments_ : generic_map option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?timeout:(timeout_ : timeout option) ?max_capacity:(max_capacity_ : nullable_double option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?execution_class:(execution_class_ : execution_class option)
    ?execution_role_session_policy:
      (execution_role_session_policy_ : orchestration_policy_json_string option)
    ~job_name:(job_name_ : name_string) () =
  ({
     job_name = job_name_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     job_run_id = job_run_id_;
     arguments = arguments_;
     allocated_capacity = allocated_capacity_;
     timeout = timeout_;
     max_capacity = max_capacity_;
     security_configuration = security_configuration_;
     notification_property = notification_property_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     execution_class = execution_class_;
     execution_role_session_policy = execution_role_session_policy_;
   }
    : start_job_run_request)

let make_start_import_labels_task_run_response ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_import_labels_task_run_response)

let make_start_import_labels_task_run_request
    ?replace_all_labels:(replace_all_labels_ : replace_boolean option)
    ~transform_id:(transform_id_ : hash_string) ~input_s3_path:(input_s3_path_ : uri_string) () =
  ({
     transform_id = transform_id_;
     input_s3_path = input_s3_path_;
     replace_all_labels = replace_all_labels_;
   }
    : start_import_labels_task_run_request)

let make_start_export_labels_task_run_response ?task_run_id:(task_run_id_ : hash_string option) () =
  ({ task_run_id = task_run_id_ } : start_export_labels_task_run_response)

let make_start_export_labels_task_run_request ~transform_id:(transform_id_ : hash_string)
    ~output_s3_path:(output_s3_path_ : uri_string) () =
  ({ transform_id = transform_id_; output_s3_path = output_s3_path_ }
    : start_export_labels_task_run_request)

let make_start_data_quality_ruleset_evaluation_run_response ?run_id:(run_id_ : hash_string option)
    () =
  ({ run_id = run_id_ } : start_data_quality_ruleset_evaluation_run_response)

let make_data_quality_glue_table ?catalog_id:(catalog_id_ : name_string option)
    ?connection_name:(connection_name_ : name_string option)
    ?additional_options:(additional_options_ : glue_table_additional_options option)
    ?pre_processing_query:(pre_processing_query_ : pre_processing_query_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     catalog_id = catalog_id_;
     connection_name = connection_name_;
     additional_options = additional_options_;
     pre_processing_query = pre_processing_query_;
   }
    : data_quality_glue_table)

let make_glue_table ?catalog_id:(catalog_id_ : name_string option)
    ?connection_name:(connection_name_ : name_string option)
    ?additional_options:(additional_options_ : glue_table_additional_options option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     catalog_id = catalog_id_;
     connection_name = connection_name_;
     additional_options = additional_options_;
   }
    : glue_table)

let make_data_source ?glue_table:(glue_table_ : glue_table option)
    ?data_quality_glue_table:(data_quality_glue_table_ : data_quality_glue_table option) () =
  ({ glue_table = glue_table_; data_quality_glue_table = data_quality_glue_table_ } : data_source)

let make_data_quality_evaluation_run_additional_run_options
    ?cloud_watch_metrics_enabled:(cloud_watch_metrics_enabled_ : nullable_boolean option)
    ?results_s3_prefix:(results_s3_prefix_ : uri_string option)
    ?composite_rule_evaluation_method:
      (composite_rule_evaluation_method_ : dq_composite_rule_evaluation_method option)
    ?custom_log_group_prefix:(custom_log_group_prefix_ : generic_string option) () =
  ({
     cloud_watch_metrics_enabled = cloud_watch_metrics_enabled_;
     results_s3_prefix = results_s3_prefix_;
     composite_rule_evaluation_method = composite_rule_evaluation_method_;
     custom_log_group_prefix = custom_log_group_prefix_;
   }
    : data_quality_evaluation_run_additional_run_options)

let make_start_data_quality_ruleset_evaluation_run_request
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option) ?client_token:(client_token_ : hash_string option)
    ?additional_run_options:
      (additional_run_options_ : data_quality_evaluation_run_additional_run_options option)
    ?additional_data_sources:(additional_data_sources_ : data_source_map option)
    ~data_source:(data_source_ : data_source) ~role:(role_ : role_string)
    ~ruleset_names:(ruleset_names_ : ruleset_names) () =
  ({
     data_source = data_source_;
     role = role_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     client_token = client_token_;
     additional_run_options = additional_run_options_;
     ruleset_names = ruleset_names_;
     additional_data_sources = additional_data_sources_;
   }
    : start_data_quality_ruleset_evaluation_run_request)

let make_start_data_quality_rule_recommendation_run_response ?run_id:(run_id_ : hash_string option)
    () =
  ({ run_id = run_id_ } : start_data_quality_rule_recommendation_run_response)

let make_start_data_quality_rule_recommendation_run_request
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option)
    ?created_ruleset_name:(created_ruleset_name_ : name_string option)
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    ?client_token:(client_token_ : hash_string option) ~data_source:(data_source_ : data_source)
    ~role:(role_ : role_string) () =
  ({
     data_source = data_source_;
     role = role_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     created_ruleset_name = created_ruleset_name_;
     data_quality_security_configuration = data_quality_security_configuration_;
     client_token = client_token_;
   }
    : start_data_quality_rule_recommendation_run_request)

let make_start_crawler_schedule_response () = (() : unit)

let make_start_crawler_schedule_request ~crawler_name:(crawler_name_ : name_string) () =
  ({ crawler_name = crawler_name_ } : start_crawler_schedule_request)

let make_start_crawler_response () = (() : unit)

let make_start_crawler_request ~name:(name_ : name_string) () =
  ({ name = name_ } : start_crawler_request)

let make_start_column_statistics_task_run_schedule_response () = (() : unit)

let make_start_column_statistics_task_run_schedule_request
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({ database_name = database_name_; table_name = table_name_ }
    : start_column_statistics_task_run_schedule_request)

let make_start_column_statistics_task_run_response
    ?column_statistics_task_run_id:(column_statistics_task_run_id_ : hash_string option) () =
  ({ column_statistics_task_run_id = column_statistics_task_run_id_ }
    : start_column_statistics_task_run_response)

let make_start_column_statistics_task_run_request
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?catalog_i_d:(catalog_i_d_ : name_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~role:(role_ : name_string) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     column_name_list = column_name_list_;
     role = role_;
     sample_size = sample_size_;
     catalog_i_d = catalog_i_d_;
     security_configuration = security_configuration_;
   }
    : start_column_statistics_task_run_request)

let make_start_blueprint_run_response ?run_id:(run_id_ : id_string option) () =
  ({ run_id = run_id_ } : start_blueprint_run_response)

let make_start_blueprint_run_request ?parameters:(parameters_ : blueprint_parameters option)
    ~blueprint_name:(blueprint_name_ : orchestration_name_string)
    ~role_arn:(role_arn_ : orchestration_iam_role_arn) () =
  ({ blueprint_name = blueprint_name_; parameters = parameters_; role_arn = role_arn_ }
    : start_blueprint_run_request)

let make_view_validation ?dialect:(dialect_ : view_dialect option)
    ?dialect_version:(dialect_version_ : view_dialect_version_string option)
    ?view_validation_text:(view_validation_text_ : view_text_string option)
    ?update_time:(update_time_ : timestamp option) ?state:(state_ : resource_state option)
    ?error:(error_ : error_detail option) () =
  ({
     dialect = dialect_;
     dialect_version = dialect_version_;
     view_validation_text = view_validation_text_;
     update_time = update_time_;
     state = state_;
     error = error_;
   }
    : view_validation)

let make_iceberg_table_metadata ?format_version:(format_version_ : version_string option)
    ?table_uuid:(table_uuid_ : table_id_string option)
    ?location:(location_ : location_string option)
    ?properties:(properties_ : string_to_string_map option)
    ?schemas:(schemas_ : iceberg_schema_list option)
    ?current_schema_id:(current_schema_id_ : integer option)
    ?last_column_id:(last_column_id_ : integer option)
    ?partition_specs:(partition_specs_ : iceberg_partition_spec_list option)
    ?default_spec_id:(default_spec_id_ : integer option)
    ?last_partition_id:(last_partition_id_ : integer option)
    ?sort_orders:(sort_orders_ : iceberg_sort_order_list option)
    ?default_sort_order_id:(default_sort_order_id_ : integer option) () =
  ({
     format_version = format_version_;
     table_uuid = table_uuid_;
     location = location_;
     properties = properties_;
     schemas = schemas_;
     current_schema_id = current_schema_id_;
     last_column_id = last_column_id_;
     partition_specs = partition_specs_;
     default_spec_id = default_spec_id_;
     last_partition_id = last_partition_id_;
     sort_orders = sort_orders_;
     default_sort_order_id = default_sort_order_id_;
   }
    : iceberg_table_metadata)

let make_view_representation ?dialect:(dialect_ : view_dialect option)
    ?dialect_version:(dialect_version_ : view_dialect_version_string option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?view_expanded_text:(view_expanded_text_ : view_text_string option)
    ?validation_connection:(validation_connection_ : name_string option)
    ?is_stale:(is_stale_ : nullable_boolean option) () =
  ({
     dialect = dialect_;
     dialect_version = dialect_version_;
     view_original_text = view_original_text_;
     view_expanded_text = view_expanded_text_;
     validation_connection = validation_connection_;
     is_stale = is_stale_;
   }
    : view_representation)

let make_view_definition ?is_protected:(is_protected_ : nullable_boolean option)
    ?definer:(definer_ : arn_string option)
    ?view_version_id:(view_version_id_ : table_version_id option)
    ?view_version_token:(view_version_token_ : hash_string option)
    ?refresh_seconds:(refresh_seconds_ : refresh_seconds option)
    ?last_refresh_type:(last_refresh_type_ : last_refresh_type option)
    ?sub_objects:(sub_objects_ : view_sub_objects_list option)
    ?sub_object_version_ids:(sub_object_version_ids_ : view_sub_object_version_ids_list option)
    ?representations:(representations_ : view_representation_list option) () =
  ({
     is_protected = is_protected_;
     definer = definer_;
     view_version_id = view_version_id_;
     view_version_token = view_version_token_;
     refresh_seconds = refresh_seconds_;
     last_refresh_type = last_refresh_type_;
     sub_objects = sub_objects_;
     sub_object_version_ids = sub_object_version_ids_;
     representations = representations_;
   }
    : view_definition)

let make_federated_table ?identifier:(identifier_ : federation_identifier option)
    ?database_identifier:(database_identifier_ : federation_identifier option)
    ?connection_name:(connection_name_ : name_string option)
    ?connection_type:(connection_type_ : name_string option) () =
  ({
     identifier = identifier_;
     database_identifier = database_identifier_;
     connection_name = connection_name_;
     connection_type = connection_type_;
   }
    : federated_table)

let make_table_status ?requested_by:(requested_by_ : name_string option)
    ?updated_by:(updated_by_ : name_string option) ?request_time:(request_time_ : timestamp option)
    ?update_time:(update_time_ : timestamp option) ?action:(action_ : resource_action option)
    ?state:(state_ : resource_state option) ?error:(error_ : error_detail option)
    ?details:(details_ : status_details option) () =
  ({
     requested_by = requested_by_;
     updated_by = updated_by_;
     request_time = request_time_;
     update_time = update_time_;
     action = action_;
     state = state_;
     error = error_;
     details = details_;
   }
    : table_status)

let make_table ?database_name:(database_name_ : name_string option)
    ?description:(description_ : description_string option) ?owner:(owner_ : name_string option)
    ?create_time:(create_time_ : timestamp option) ?update_time:(update_time_ : timestamp option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?last_analyzed_time:(last_analyzed_time_ : timestamp option)
    ?retention:(retention_ : non_negative_integer option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?partition_keys:(partition_keys_ : column_list option)
    ?view_original_text:(view_original_text_ : view_text_string option)
    ?view_expanded_text:(view_expanded_text_ : view_text_string option)
    ?table_type:(table_type_ : table_type_string option)
    ?parameters:(parameters_ : parameters_map option) ?created_by:(created_by_ : name_string option)
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option)
    ?target_table:(target_table_ : table_identifier option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?version_id:(version_id_ : version_string option)
    ?federated_table:(federated_table_ : federated_table option)
    ?view_definition:(view_definition_ : view_definition option)
    ?is_multi_dialect_view:(is_multi_dialect_view_ : nullable_boolean option)
    ?is_materialized_view:(is_materialized_view_ : nullable_boolean option)
    ?iceberg_table_metadata:(iceberg_table_metadata_ : iceberg_table_metadata option)
    ?status:(status_ : table_status option) ~name:(name_ : name_string) () =
  ({
     name = name_;
     database_name = database_name_;
     description = description_;
     owner = owner_;
     create_time = create_time_;
     update_time = update_time_;
     last_access_time = last_access_time_;
     last_analyzed_time = last_analyzed_time_;
     retention = retention_;
     storage_descriptor = storage_descriptor_;
     partition_keys = partition_keys_;
     view_original_text = view_original_text_;
     view_expanded_text = view_expanded_text_;
     table_type = table_type_;
     parameters = parameters_;
     created_by = created_by_;
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
     target_table = target_table_;
     catalog_id = catalog_id_;
     version_id = version_id_;
     federated_table = federated_table_;
     view_definition = view_definition_;
     is_multi_dialect_view = is_multi_dialect_view_;
     is_materialized_view = is_materialized_view_;
     iceberg_table_metadata = iceberg_table_metadata_;
     status = status_;
   }
    : table)

let make_status_details ?requested_change:(requested_change_ : table option)
    ?view_validations:(view_validations_ : view_validation_list option) () =
  ({ requested_change = requested_change_; view_validations = view_validations_ } : status_details)

let make_search_tables_response ?next_token:(next_token_ : token option)
    ?table_list:(table_list_ : table_list option) () =
  ({ next_token = next_token_; table_list = table_list_ } : search_tables_response)

let make_sort_criterion ?field_name:(field_name_ : value_string option) ?sort:(sort_ : sort option)
    () =
  ({ field_name = field_name_; sort = sort_ } : sort_criterion)

let make_property_predicate ?key:(key_ : value_string option) ?value:(value_ : value_string option)
    ?comparator:(comparator_ : comparator option) () =
  ({ key = key_; value = value_; comparator = comparator_ } : property_predicate)

let make_search_tables_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?next_token:(next_token_ : token option) ?filters:(filters_ : search_property_predicates option)
    ?search_text:(search_text_ : value_string option)
    ?sort_criteria:(sort_criteria_ : sort_criteria option)
    ?max_results:(max_results_ : page_size option)
    ?resource_share_type:(resource_share_type_ : resource_share_type option)
    ?include_status_details:(include_status_details_ : boolean_nullable option) () =
  ({
     catalog_id = catalog_id_;
     next_token = next_token_;
     filters = filters_;
     search_text = search_text_;
     sort_criteria = sort_criteria_;
     max_results = max_results_;
     resource_share_type = resource_share_type_;
     include_status_details = include_status_details_;
   }
    : search_tables_request)

let make_search_result_item ?id:(id_ : asset_id option)
    ?asset_name:(asset_name_ : search_result_name option)
    ?asset_description:(asset_description_ : asset_description option)
    ?updated_at:(updated_at_ : updated_at option)
    ?asset_type_id:(asset_type_id_ : asset_type_id option) () =
  ({
     id = id_;
     asset_name = asset_name_;
     asset_description = asset_description_;
     updated_at = updated_at_;
     asset_type_id = asset_type_id_;
   }
    : search_result_item)

let make_search_assets_output ?items:(items_ : search_result_item_list option)
    ?next_token:(next_token_ : search_next_token option) () =
  ({ items = items_; next_token = next_token_ } : search_assets_output)

let make_search_map_filter ~attribute:(attribute_ : search_attribute) ~key:(key_ : search_map_key)
    ~value:(value_ : search_map_filter_value) () =
  ({ attribute = attribute_; key = key_; value = value_ } : search_map_filter)

let make_search_attribute_filter ?value:(value_ : search_filter_value option)
    ~attribute:(attribute_ : search_attribute) ~operator:(operator_ : search_filter_operator) () =
  ({ attribute = attribute_; operator = operator_; value = value_ } : search_attribute_filter)

let make_search_sort ?order:(order_ : search_sort_order option)
    ~attribute:(attribute_ : search_attribute) () =
  ({ attribute = attribute_; order = order_ } : search_sort)

let make_search_assets_input ?search_text:(search_text_ : search_text option)
    ?max_results:(max_results_ : search_max_results option)
    ?next_token:(next_token_ : search_next_token option) ?sort:(sort_ : search_sort option)
    ?filter_clause:(filter_clause_ : search_filter_clause option) () =
  ({
     search_text = search_text_;
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     filter_clause = filter_clause_;
   }
    : search_assets_input)

let make_run_statement_response ?id:(id_ : integer_value option) () =
  ({ id = id_ } : run_statement_response)

let make_run_statement_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~session_id:(session_id_ : name_string) ~code:(code_ : orchestration_statement_code_string) () =
  ({ session_id = session_id_; code = code_; request_origin = request_origin_ }
    : run_statement_request)

let make_resume_workflow_run_response ?run_id:(run_id_ : id_string option)
    ?node_ids:(node_ids_ : node_id_list option) () =
  ({ run_id = run_id_; node_ids = node_ids_ } : resume_workflow_run_response)

let make_resume_workflow_run_request ~name:(name_ : name_string) ~run_id:(run_id_ : id_string)
    ~node_ids:(node_ids_ : node_id_list) () =
  ({ name = name_; run_id = run_id_; node_ids = node_ids_ } : resume_workflow_run_request)

let make_job_bookmark_entry ?job_name:(job_name_ : job_name option)
    ?version:(version_ : integer_value option) ?run:(run_ : integer_value option)
    ?attempt:(attempt_ : integer_value option) ?previous_run_id:(previous_run_id_ : run_id option)
    ?run_id:(run_id_ : run_id option) ?job_bookmark:(job_bookmark_ : json_value option) () =
  ({
     job_name = job_name_;
     version = version_;
     run = run_;
     attempt = attempt_;
     previous_run_id = previous_run_id_;
     run_id = run_id_;
     job_bookmark = job_bookmark_;
   }
    : job_bookmark_entry)

let make_reset_job_bookmark_response
    ?job_bookmark_entry:(job_bookmark_entry_ : job_bookmark_entry option) () =
  ({ job_bookmark_entry = job_bookmark_entry_ } : reset_job_bookmark_response)

let make_reset_job_bookmark_request ?run_id:(run_id_ : run_id option)
    ~job_name:(job_name_ : job_name) () =
  ({ job_name = job_name_; run_id = run_id_ } : reset_job_bookmark_request)

let make_remove_schema_version_metadata_response
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?latest_version:(latest_version_ : latest_schema_version_boolean option)
    ?version_number:(version_number_ : version_long_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?metadata_key:(metadata_key_ : metadata_key_string option)
    ?metadata_value:(metadata_value_ : metadata_value_string option) () =
  ({
     schema_arn = schema_arn_;
     schema_name = schema_name_;
     registry_name = registry_name_;
     latest_version = latest_version_;
     version_number = version_number_;
     schema_version_id = schema_version_id_;
     metadata_key = metadata_key_;
     metadata_value = metadata_value_;
   }
    : remove_schema_version_metadata_response)

let make_metadata_key_value_pair ?metadata_key:(metadata_key_ : metadata_key_string option)
    ?metadata_value:(metadata_value_ : metadata_value_string option) () =
  ({ metadata_key = metadata_key_; metadata_value = metadata_value_ } : metadata_key_value_pair)

let make_remove_schema_version_metadata_input ?schema_id:(schema_id_ : schema_id option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ~metadata_key_value:(metadata_key_value_ : metadata_key_value_pair) () =
  ({
     schema_id = schema_id_;
     schema_version_number = schema_version_number_;
     schema_version_id = schema_version_id_;
     metadata_key_value = metadata_key_value_;
   }
    : remove_schema_version_metadata_input)

let make_register_schema_version_response
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?version_number:(version_number_ : version_long_number option)
    ?status:(status_ : schema_version_status option) () =
  ({ schema_version_id = schema_version_id_; version_number = version_number_; status = status_ }
    : register_schema_version_response)

let make_register_schema_version_input ~schema_id:(schema_id_ : schema_id)
    ~schema_definition:(schema_definition_ : schema_definition_string) () =
  ({ schema_id = schema_id_; schema_definition = schema_definition_ }
    : register_schema_version_input)

let make_register_connection_type_response
    ?connection_type_arn:(connection_type_arn_ : glue_resource_arn option) () =
  ({ connection_type_arn = connection_type_arn_ } : register_connection_type_response)

let make_field_definition ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~field_data_type:(field_data_type_ : field_data_type) () =
  ({ name = name_; field_data_type = field_data_type_ } : field_definition)

let make_response_extraction_mapping ?content_path:(content_path_ : json_path_string option)
    ?header_key:(header_key_ : connector_property_key option) () =
  ({ content_path = content_path_; header_key = header_key_ } : response_extraction_mapping)

let make_extracted_parameter ?key:(key_ : connector_property_key option)
    ?default_value:(default_value_ : default_value option)
    ?property_location:(property_location_ : property_location option)
    ?value:(value_ : response_extraction_mapping option) () =
  ({
     key = key_;
     default_value = default_value_;
     property_location = property_location_;
     value = value_;
   }
    : extracted_parameter)

let make_offset_configuration ~offset_parameter:(offset_parameter_ : extracted_parameter)
    ~limit_parameter:(limit_parameter_ : extracted_parameter) () =
  ({ offset_parameter = offset_parameter_; limit_parameter = limit_parameter_ }
    : offset_configuration)

let make_cursor_configuration ?limit_parameter:(limit_parameter_ : extracted_parameter option)
    ~next_page:(next_page_ : extracted_parameter) () =
  ({ next_page = next_page_; limit_parameter = limit_parameter_ } : cursor_configuration)

let make_pagination_configuration
    ?cursor_configuration:(cursor_configuration_ : cursor_configuration option)
    ?offset_configuration:(offset_configuration_ : offset_configuration option) () =
  ({ cursor_configuration = cursor_configuration_; offset_configuration = offset_configuration_ }
    : pagination_configuration)

let make_response_configuration ?error_path:(error_path_ : json_path_string option)
    ~result_path:(result_path_ : json_path_string) () =
  ({ result_path = result_path_; error_path = error_path_ } : response_configuration)

let make_connector_property ?key_override:(key_override_ : connector_property_key option)
    ?default_value:(default_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?allowed_values:(allowed_values_ : list_of_string option)
    ?property_location:(property_location_ : property_location option) ~name:(name_ : property_name)
    ~required:(required_ : bool_) ~property_type:(property_type_ : property_type) () =
  ({
     name = name_;
     key_override = key_override_;
     required = required_;
     default_value = default_value_;
     allowed_values = allowed_values_;
     property_location = property_location_;
     property_type = property_type_;
   }
    : connector_property)

let make_source_configuration ?request_method:(request_method_ : http_method option)
    ?request_path:(request_path_ : path_string option)
    ?request_parameters:(request_parameters_ : connector_property_list option)
    ?response_configuration:(response_configuration_ : response_configuration option)
    ?pagination_configuration:(pagination_configuration_ : pagination_configuration option) () =
  ({
     request_method = request_method_;
     request_path = request_path_;
     request_parameters = request_parameters_;
     response_configuration = response_configuration_;
     pagination_configuration = pagination_configuration_;
   }
    : source_configuration)

let make_entity_configuration
    ?source_configuration:(source_configuration_ : source_configuration option)
    ?schema:(schema_ : field_definition_map option) () =
  ({ source_configuration = source_configuration_; schema = schema_ } : entity_configuration)

let make_rest_configuration
    ?global_source_configuration:(global_source_configuration_ : source_configuration option)
    ?validation_endpoint_configuration:
      (validation_endpoint_configuration_ : source_configuration option)
    ?entity_configurations:(entity_configurations_ : entity_configuration_map option) () =
  ({
     global_source_configuration = global_source_configuration_;
     validation_endpoint_configuration = validation_endpoint_configuration_;
     entity_configurations = entity_configurations_;
   }
    : rest_configuration)

let make_custom_authentication_properties
    ~authentication_parameters:(authentication_parameters_ : connector_property_list) () =
  ({ authentication_parameters = authentication_parameters_ } : custom_authentication_properties)

let make_basic_authentication_properties ?username:(username_ : connector_property option)
    ?password:(password_ : connector_property option) () =
  ({ username = username_; password = password_ } : basic_authentication_properties)

let make_connector_authorization_code_properties
    ?authorization_code_url:(authorization_code_url_ : connector_property option)
    ?authorization_code:(authorization_code_ : connector_property option)
    ?redirect_uri:(redirect_uri_ : connector_property option)
    ?token_url:(token_url_ : connector_property option)
    ?request_method:(request_method_ : http_method option)
    ?content_type:(content_type_ : content_type option)
    ?client_id:(client_id_ : connector_property option)
    ?client_secret:(client_secret_ : connector_property option)
    ?scope:(scope_ : connector_property option) ?prompt:(prompt_ : connector_property option)
    ?token_url_parameters:(token_url_parameters_ : connector_property_list option) () =
  ({
     authorization_code_url = authorization_code_url_;
     authorization_code = authorization_code_;
     redirect_uri = redirect_uri_;
     token_url = token_url_;
     request_method = request_method_;
     content_type = content_type_;
     client_id = client_id_;
     client_secret = client_secret_;
     scope = scope_;
     prompt = prompt_;
     token_url_parameters = token_url_parameters_;
   }
    : connector_authorization_code_properties)

let make_jwt_bearer_properties ?token_url:(token_url_ : connector_property option)
    ?request_method:(request_method_ : http_method option)
    ?content_type:(content_type_ : content_type option)
    ?jwt_token:(jwt_token_ : connector_property option)
    ?token_url_parameters:(token_url_parameters_ : connector_property_list option) () =
  ({
     token_url = token_url_;
     request_method = request_method_;
     content_type = content_type_;
     jwt_token = jwt_token_;
     token_url_parameters = token_url_parameters_;
   }
    : jwt_bearer_properties)

let make_client_credentials_properties ?token_url:(token_url_ : connector_property option)
    ?request_method:(request_method_ : http_method option)
    ?content_type:(content_type_ : content_type option)
    ?client_id:(client_id_ : connector_property option)
    ?client_secret:(client_secret_ : connector_property option)
    ?scope:(scope_ : connector_property option)
    ?token_url_parameters:(token_url_parameters_ : connector_property_list option) () =
  ({
     token_url = token_url_;
     request_method = request_method_;
     content_type = content_type_;
     client_id = client_id_;
     client_secret = client_secret_;
     scope = scope_;
     token_url_parameters = token_url_parameters_;
   }
    : client_credentials_properties)

let make_connector_o_auth2_properties
    ?client_credentials_properties:
      (client_credentials_properties_ : client_credentials_properties option)
    ?jwt_bearer_properties:(jwt_bearer_properties_ : jwt_bearer_properties option)
    ?authorization_code_properties:
      (authorization_code_properties_ : connector_authorization_code_properties option)
    ~o_auth2_grant_type:(o_auth2_grant_type_ : connector_o_auth2_grant_type) () =
  ({
     o_auth2_grant_type = o_auth2_grant_type_;
     client_credentials_properties = client_credentials_properties_;
     jwt_bearer_properties = jwt_bearer_properties_;
     authorization_code_properties = authorization_code_properties_;
   }
    : connector_o_auth2_properties)

let make_connector_authentication_configuration
    ?o_auth2_properties:(o_auth2_properties_ : connector_o_auth2_properties option)
    ?basic_authentication_properties:
      (basic_authentication_properties_ : basic_authentication_properties option)
    ?custom_authentication_properties:
      (custom_authentication_properties_ : custom_authentication_properties option)
    ~authentication_types:(authentication_types_ : authentication_types) () =
  ({
     authentication_types = authentication_types_;
     o_auth2_properties = o_auth2_properties_;
     basic_authentication_properties = basic_authentication_properties_;
     custom_authentication_properties = custom_authentication_properties_;
   }
    : connector_authentication_configuration)

let make_connection_properties_configuration ?url:(url_ : connector_property option)
    ?additional_request_parameters:(additional_request_parameters_ : connector_property_list option)
    () =
  ({ url = url_; additional_request_parameters = additional_request_parameters_ }
    : connection_properties_configuration)

let make_register_connection_type_request ?description:(description_ : description option)
    ?tags:(tags_ : tags_map option) ~connection_type:(connection_type_ : name_string)
    ~integration_type:(integration_type_ : integration_type)
    ~connection_properties:(connection_properties_ : connection_properties_configuration)
    ~connector_authentication_configuration:
      (connector_authentication_configuration_ : connector_authentication_configuration)
    ~rest_configuration:(rest_configuration_ : rest_configuration) () =
  ({
     connection_type = connection_type_;
     integration_type = integration_type_;
     description = description_;
     connection_properties = connection_properties_;
     connector_authentication_configuration = connector_authentication_configuration_;
     rest_configuration = rest_configuration_;
     tags = tags_;
   }
    : register_connection_type_request)

let make_other_metadata_value_list_item
    ?metadata_value:(metadata_value_ : metadata_value_string option)
    ?created_time:(created_time_ : created_timestamp option) () =
  ({ metadata_value = metadata_value_; created_time = created_time_ }
    : other_metadata_value_list_item)

let make_metadata_info ?metadata_value:(metadata_value_ : metadata_value_string option)
    ?created_time:(created_time_ : created_timestamp option)
    ?other_metadata_value_list:(other_metadata_value_list_ : other_metadata_value_list option) () =
  ({
     metadata_value = metadata_value_;
     created_time = created_time_;
     other_metadata_value_list = other_metadata_value_list_;
   }
    : metadata_info)

let make_query_schema_version_metadata_response
    ?metadata_info_map:(metadata_info_map_ : metadata_info_map option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?next_token:(next_token_ : schema_registry_token_string option) () =
  ({
     metadata_info_map = metadata_info_map_;
     schema_version_id = schema_version_id_;
     next_token = next_token_;
   }
    : query_schema_version_metadata_response)

let make_query_schema_version_metadata_input ?schema_id:(schema_id_ : schema_id option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?metadata_list:(metadata_list_ : metadata_list option)
    ?max_results:(max_results_ : query_schema_version_metadata_max_results option)
    ?next_token:(next_token_ : schema_registry_token_string option) () =
  ({
     schema_id = schema_id_;
     schema_version_number = schema_version_number_;
     schema_version_id = schema_version_id_;
     metadata_list = metadata_list_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : query_schema_version_metadata_input)

let make_put_workflow_run_properties_response () = (() : unit)

let make_put_workflow_run_properties_request ~name:(name_ : name_string)
    ~run_id:(run_id_ : id_string) ~run_properties:(run_properties_ : workflow_run_properties) () =
  ({ name = name_; run_id = run_id_; run_properties = run_properties_ }
    : put_workflow_run_properties_request)

let make_put_schema_version_metadata_response ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?latest_version:(latest_version_ : latest_schema_version_boolean option)
    ?version_number:(version_number_ : version_long_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?metadata_key:(metadata_key_ : metadata_key_string option)
    ?metadata_value:(metadata_value_ : metadata_value_string option) () =
  ({
     schema_arn = schema_arn_;
     schema_name = schema_name_;
     registry_name = registry_name_;
     latest_version = latest_version_;
     version_number = version_number_;
     schema_version_id = schema_version_id_;
     metadata_key = metadata_key_;
     metadata_value = metadata_value_;
   }
    : put_schema_version_metadata_response)

let make_put_schema_version_metadata_input ?schema_id:(schema_id_ : schema_id option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ~metadata_key_value:(metadata_key_value_ : metadata_key_value_pair) () =
  ({
     schema_id = schema_id_;
     schema_version_number = schema_version_number_;
     schema_version_id = schema_version_id_;
     metadata_key_value = metadata_key_value_;
   }
    : put_schema_version_metadata_input)

let make_put_resource_policy_response ?policy_hash:(policy_hash_ : hash_string option) () =
  ({ policy_hash = policy_hash_ } : put_resource_policy_response)

let make_put_resource_policy_request ?resource_arn:(resource_arn_ : glue_resource_arn option)
    ?policy_hash_condition:(policy_hash_condition_ : hash_string option)
    ?policy_exists_condition:(policy_exists_condition_ : exist_condition option)
    ?enable_hybrid:(enable_hybrid_ : enable_hybrid_values option)
    ~policy_in_json:(policy_in_json_ : policy_json_string) () =
  ({
     policy_in_json = policy_in_json_;
     resource_arn = resource_arn_;
     policy_hash_condition = policy_hash_condition_;
     policy_exists_condition = policy_exists_condition_;
     enable_hybrid = enable_hybrid_;
   }
    : put_resource_policy_request)

let make_put_form_type_response ?id:(id_ : form_type_id option)
    ?name:(name_ : form_type_name option) ?schema:(schema_ : form_type_schema option) () =
  ({ id = id_; name = name_; schema = schema_ } : put_form_type_response)

let make_put_form_type_request ?client_token:(client_token_ : hash_string option)
    ~name:(name_ : form_type_name) ~schema:(schema_ : form_type_schema) () =
  ({ name = name_; schema = schema_; client_token = client_token_ } : put_form_type_request)

let make_put_data_quality_profile_annotation_response () = (() : unit)

let make_put_data_quality_profile_annotation_request ~profile_id:(profile_id_ : hash_string)
    ~inclusion_annotation:(inclusion_annotation_ : inclusion_annotation_value) () =
  ({ profile_id = profile_id_; inclusion_annotation = inclusion_annotation_ }
    : put_data_quality_profile_annotation_request)

let make_put_data_catalog_encryption_settings_response () = (() : unit)

let make_connection_password_encryption ?aws_kms_key_id:(aws_kms_key_id_ : name_string option)
    ~return_connection_password_encrypted:(return_connection_password_encrypted_ : boolean_) () =
  ({
     return_connection_password_encrypted = return_connection_password_encrypted_;
     aws_kms_key_id = aws_kms_key_id_;
   }
    : connection_password_encryption)

let make_encryption_at_rest ?sse_aws_kms_key_id:(sse_aws_kms_key_id_ : name_string option)
    ?catalog_encryption_service_role:(catalog_encryption_service_role_ : iam_role_arn option)
    ~catalog_encryption_mode:(catalog_encryption_mode_ : catalog_encryption_mode) () =
  ({
     catalog_encryption_mode = catalog_encryption_mode_;
     sse_aws_kms_key_id = sse_aws_kms_key_id_;
     catalog_encryption_service_role = catalog_encryption_service_role_;
   }
    : encryption_at_rest)

let make_data_catalog_encryption_settings
    ?encryption_at_rest:(encryption_at_rest_ : encryption_at_rest option)
    ?connection_password_encryption:
      (connection_password_encryption_ : connection_password_encryption option) () =
  ({
     encryption_at_rest = encryption_at_rest_;
     connection_password_encryption = connection_password_encryption_;
   }
    : data_catalog_encryption_settings)

let make_put_data_catalog_encryption_settings_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~data_catalog_encryption_settings:
      (data_catalog_encryption_settings_ : data_catalog_encryption_settings) () =
  ({
     catalog_id = catalog_id_;
     data_catalog_encryption_settings = data_catalog_encryption_settings_;
   }
    : put_data_catalog_encryption_settings_request)

let make_put_attachment_response ?asset_identifier:(asset_identifier_ : asset_id option)
    ?iterable_form_name:(iterable_form_name_ : iterable_form_name option)
    ?item_identifier:(item_identifier_ : item_identifier option)
    ?attachment_name:(attachment_name_ : attachment_name option)
    ?form_type_id:(form_type_id_ : form_type_id option) () =
  ({
     asset_identifier = asset_identifier_;
     iterable_form_name = iterable_form_name_;
     item_identifier = item_identifier_;
     attachment_name = attachment_name_;
     form_type_id = form_type_id_;
   }
    : put_attachment_response)

let make_put_attachment_request
    ?iterable_form_name:(iterable_form_name_ : iterable_form_name option)
    ?item_identifier:(item_identifier_ : item_identifier option)
    ?client_token:(client_token_ : hash_string option)
    ~asset_identifier:(asset_identifier_ : asset_id)
    ~attachment_name:(attachment_name_ : attachment_name) ~content:(content_ : form_content)
    ~form_type_id:(form_type_id_ : form_type_id) () =
  ({
     asset_identifier = asset_identifier_;
     iterable_form_name = iterable_form_name_;
     item_identifier = item_identifier_;
     attachment_name = attachment_name_;
     content = content_;
     form_type_id = form_type_id_;
     client_token = client_token_;
   }
    : put_attachment_request)

let make_asset_type_form_reference ~form_type_identifier:(form_type_identifier_ : form_type_id) () =
  ({ form_type_identifier = form_type_identifier_ } : asset_type_form_reference)

let make_put_asset_type_response ?id:(id_ : asset_type_id option)
    ?name:(name_ : asset_type_name option) ?forms:(forms_ : asset_type_forms_map option) () =
  ({ id = id_; name = name_; forms = forms_ } : put_asset_type_response)

let make_put_asset_type_request ?client_token:(client_token_ : hash_string option)
    ~name:(name_ : asset_type_name) ~forms:(forms_ : asset_type_forms_map) () =
  ({ name = name_; forms = forms_; client_token = client_token_ } : put_asset_type_request)

let make_asset_form_entry ?form_type_id:(form_type_id_ : form_type_id option)
    ?content:(content_ : form_content option) () =
  ({ form_type_id = form_type_id_; content = content_ } : asset_form_entry)

let make_put_asset_response ?description:(description_ : asset_description option)
    ?created_at:(created_at_ : created_at option) ?forms:(forms_ : asset_form_map option)
    ~id:(id_ : asset_id) ~name:(name_ : asset_name) () =
  ({ id = id_; name = name_; description = description_; created_at = created_at_; forms = forms_ }
    : put_asset_response)

let make_put_asset_request ?description:(description_ : asset_description option)
    ?client_token:(client_token_ : hash_string option)
    ~asset_type_id:(asset_type_id_ : asset_type_id) ~identifier:(identifier_ : asset_id)
    ~name:(name_ : asset_name) ~forms:(forms_ : asset_form_map) () =
  ({
     asset_type_id = asset_type_id_;
     identifier = identifier_;
     name = name_;
     description = description_;
     forms = forms_;
     client_token = client_token_;
   }
    : put_asset_request)

let make_integration_config ?refresh_interval:(refresh_interval_ : string128 option)
    ?source_properties:(source_properties_ : integration_source_properties_map option)
    ?continuous_sync:(continuous_sync_ : continuous_sync option) () =
  ({
     refresh_interval = refresh_interval_;
     source_properties = source_properties_;
     continuous_sync = continuous_sync_;
   }
    : integration_config)

let make_integration_error ?error_code:(error_code_ : string128 option)
    ?error_message:(error_message_ : string2048 option) () =
  ({ error_code = error_code_; error_message = error_message_ } : integration_error)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_modify_integration_response ?description:(description_ : integration_description option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?tags:(tags_ : integration_tags_list option) ?errors:(errors_ : integration_error_list option)
    ?data_filter:(data_filter_ : string2048 option)
    ?integration_config:(integration_config_ : integration_config option)
    ~source_arn:(source_arn_ : string512) ~target_arn:(target_arn_ : string512)
    ~integration_name:(integration_name_ : string128)
    ~integration_arn:(integration_arn_ : string128) ~status:(status_ : integration_status)
    ~create_time:(create_time_ : integration_timestamp) () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     integration_name = integration_name_;
     description = description_;
     integration_arn = integration_arn_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     tags = tags_;
     status = status_;
     create_time = create_time_;
     errors = errors_;
     data_filter = data_filter_;
     integration_config = integration_config_;
   }
    : modify_integration_response)

let make_modify_integration_request ?description:(description_ : integration_description option)
    ?data_filter:(data_filter_ : string2048 option)
    ?integration_config:(integration_config_ : integration_config option)
    ?integration_name:(integration_name_ : string128 option)
    ~integration_identifier:(integration_identifier_ : string128) () =
  ({
     integration_identifier = integration_identifier_;
     description = description_;
     data_filter = data_filter_;
     integration_config = integration_config_;
     integration_name = integration_name_;
   }
    : modify_integration_request)

let make_list_workflows_response ?workflows:(workflows_ : workflow_names option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ workflows = workflows_; next_token = next_token_ } : list_workflows_response)

let make_list_workflows_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : orchestration_page_size25 option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_workflows_request)

let make_usage_profile_definition ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?created_on:(created_on_ : timestamp_value option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option) () =
  ({
     name = name_;
     description = description_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
   }
    : usage_profile_definition)

let make_list_usage_profiles_response ?profiles:(profiles_ : usage_profile_definition_list option)
    ?next_token:(next_token_ : orchestration_token option) () =
  ({ profiles = profiles_; next_token = next_token_ } : list_usage_profiles_response)

let make_list_usage_profiles_request ?next_token:(next_token_ : orchestration_token option)
    ?max_results:(max_results_ : orchestration_page_size200 option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_usage_profiles_request)

let make_list_triggers_response ?trigger_names:(trigger_names_ : trigger_name_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ trigger_names = trigger_names_; next_token = next_token_ } : list_triggers_response)

let make_list_triggers_request ?next_token:(next_token_ : generic_string option)
    ?dependent_job_name:(dependent_job_name_ : name_string option)
    ?max_results:(max_results_ : orchestration_page_size200 option) ?tags:(tags_ : tags_map option)
    () =
  ({
     next_token = next_token_;
     dependent_job_name = dependent_job_name_;
     max_results = max_results_;
     tags = tags_;
   }
    : list_triggers_request)

let make_iceberg_orphan_file_deletion_metrics
    ?number_of_orphan_files_deleted:(number_of_orphan_files_deleted_ : metric_counts option)
    ?dpu_hours:(dpu_hours_ : dpu_hours option) ?number_of_dpus:(number_of_dpus_ : dpu_counts option)
    ?job_duration_in_hour:(job_duration_in_hour_ : dpu_duration_in_hour option) () =
  ({
     number_of_orphan_files_deleted = number_of_orphan_files_deleted_;
     dpu_hours = dpu_hours_;
     number_of_dpus = number_of_dpus_;
     job_duration_in_hour = job_duration_in_hour_;
   }
    : iceberg_orphan_file_deletion_metrics)

let make_orphan_file_deletion_metrics
    ?iceberg_metrics:(iceberg_metrics_ : iceberg_orphan_file_deletion_metrics option) () =
  ({ iceberg_metrics = iceberg_metrics_ } : orphan_file_deletion_metrics)

let make_iceberg_retention_metrics
    ?number_of_data_files_deleted:(number_of_data_files_deleted_ : metric_counts option)
    ?number_of_manifest_files_deleted:(number_of_manifest_files_deleted_ : metric_counts option)
    ?number_of_manifest_lists_deleted:(number_of_manifest_lists_deleted_ : metric_counts option)
    ?dpu_hours:(dpu_hours_ : dpu_hours option) ?number_of_dpus:(number_of_dpus_ : dpu_counts option)
    ?job_duration_in_hour:(job_duration_in_hour_ : dpu_duration_in_hour option) () =
  ({
     number_of_data_files_deleted = number_of_data_files_deleted_;
     number_of_manifest_files_deleted = number_of_manifest_files_deleted_;
     number_of_manifest_lists_deleted = number_of_manifest_lists_deleted_;
     dpu_hours = dpu_hours_;
     number_of_dpus = number_of_dpus_;
     job_duration_in_hour = job_duration_in_hour_;
   }
    : iceberg_retention_metrics)

let make_retention_metrics ?iceberg_metrics:(iceberg_metrics_ : iceberg_retention_metrics option) ()
    =
  ({ iceberg_metrics = iceberg_metrics_ } : retention_metrics)

let make_iceberg_compaction_metrics
    ?number_of_bytes_compacted:(number_of_bytes_compacted_ : metric_counts option)
    ?number_of_files_compacted:(number_of_files_compacted_ : metric_counts option)
    ?dpu_hours:(dpu_hours_ : dpu_hours option) ?number_of_dpus:(number_of_dpus_ : dpu_counts option)
    ?job_duration_in_hour:(job_duration_in_hour_ : dpu_duration_in_hour option) () =
  ({
     number_of_bytes_compacted = number_of_bytes_compacted_;
     number_of_files_compacted = number_of_files_compacted_;
     dpu_hours = dpu_hours_;
     number_of_dpus = number_of_dpus_;
     job_duration_in_hour = job_duration_in_hour_;
   }
    : iceberg_compaction_metrics)

let make_compaction_metrics ?iceberg_metrics:(iceberg_metrics_ : iceberg_compaction_metrics option)
    () =
  ({ iceberg_metrics = iceberg_metrics_ } : compaction_metrics)

let make_run_metrics ?number_of_bytes_compacted:(number_of_bytes_compacted_ : message_string option)
    ?number_of_files_compacted:(number_of_files_compacted_ : message_string option)
    ?number_of_dpus:(number_of_dpus_ : message_string option)
    ?job_duration_in_hour:(job_duration_in_hour_ : message_string option) () =
  ({
     number_of_bytes_compacted = number_of_bytes_compacted_;
     number_of_files_compacted = number_of_files_compacted_;
     number_of_dpus = number_of_dpus_;
     job_duration_in_hour = job_duration_in_hour_;
   }
    : run_metrics)

let make_table_optimizer_run ?event_type:(event_type_ : table_optimizer_event_type option)
    ?start_timestamp:(start_timestamp_ : table_optimizer_run_timestamp option)
    ?end_timestamp:(end_timestamp_ : table_optimizer_run_timestamp option)
    ?metrics:(metrics_ : run_metrics option) ?error:(error_ : message_string option)
    ?compaction_metrics:(compaction_metrics_ : compaction_metrics option)
    ?compaction_strategy:(compaction_strategy_ : compaction_strategy option)
    ?retention_metrics:(retention_metrics_ : retention_metrics option)
    ?orphan_file_deletion_metrics:
      (orphan_file_deletion_metrics_ : orphan_file_deletion_metrics option) () =
  ({
     event_type = event_type_;
     start_timestamp = start_timestamp_;
     end_timestamp = end_timestamp_;
     metrics = metrics_;
     error = error_;
     compaction_metrics = compaction_metrics_;
     compaction_strategy = compaction_strategy_;
     retention_metrics = retention_metrics_;
     orphan_file_deletion_metrics = orphan_file_deletion_metrics_;
   }
    : table_optimizer_run)

let make_list_table_optimizer_runs_response ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : name_string option)
    ?table_name:(table_name_ : name_string option)
    ?next_token:(next_token_ : list_table_optimizer_runs_token option)
    ?table_optimizer_runs:(table_optimizer_runs_ : table_optimizer_runs option) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     next_token = next_token_;
     table_optimizer_runs = table_optimizer_runs_;
   }
    : list_table_optimizer_runs_response)

let make_list_table_optimizer_runs_request
    ?max_results:(max_results_ : max_list_table_optimizer_runs_token_results option)
    ?next_token:(next_token_ : list_table_optimizer_runs_token option)
    ~catalog_id:(catalog_id_ : catalog_id_string) ~database_name:(database_name_ : name_string)
    ~table_name:(table_name_ : name_string) ~type_:(type__ : table_optimizer_type) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     type_ = type__;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_table_optimizer_runs_request)

let make_statement_output_data ?text_plain:(text_plain_ : generic_string option) () =
  ({ text_plain = text_plain_ } : statement_output_data)

let make_statement_output ?data:(data_ : statement_output_data option)
    ?execution_count:(execution_count_ : integer_value option)
    ?status:(status_ : statement_state option) ?error_name:(error_name_ : generic_string option)
    ?error_value:(error_value_ : generic_string option)
    ?traceback:(traceback_ : orchestration_string_list option) () =
  ({
     data = data_;
     execution_count = execution_count_;
     status = status_;
     error_name = error_name_;
     error_value = error_value_;
     traceback = traceback_;
   }
    : statement_output)

let make_statement ?id:(id_ : integer_value option) ?code:(code_ : generic_string option)
    ?state:(state_ : statement_state option) ?output:(output_ : statement_output option)
    ?progress:(progress_ : double_value option) ?started_on:(started_on_ : long_value option)
    ?completed_on:(completed_on_ : long_value option) () =
  ({
     id = id_;
     code = code_;
     state = state_;
     output = output_;
     progress = progress_;
     started_on = started_on_;
     completed_on = completed_on_;
   }
    : statement)

let make_list_statements_response ?statements:(statements_ : statement_list option)
    ?next_token:(next_token_ : orchestration_token option) () =
  ({ statements = statements_; next_token = next_token_ } : list_statements_response)

let make_list_statements_request
    ?request_origin:(request_origin_ : orchestration_name_string option)
    ?next_token:(next_token_ : orchestration_token option) ~session_id:(session_id_ : name_string)
    () =
  ({ session_id = session_id_; request_origin = request_origin_; next_token = next_token_ }
    : list_statements_request)

let make_session_command ?name:(name_ : name_string option)
    ?python_version:(python_version_ : python_version_string option) () =
  ({ name = name_; python_version = python_version_ } : session_command)

let make_session ?id:(id_ : name_string option) ?created_on:(created_on_ : timestamp_value option)
    ?status:(status_ : session_status option)
    ?error_message:(error_message_ : description_string option)
    ?description:(description_ : description_string option)
    ?role:(role_ : orchestration_role_arn option) ?command:(command_ : session_command option)
    ?default_arguments:(default_arguments_ : orchestration_arguments_map option)
    ?connections:(connections_ : connections_list option)
    ?progress:(progress_ : double_value option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?execution_time:(execution_time_ : nullable_double option)
    ?dpu_seconds:(dpu_seconds_ : nullable_double option)
    ?idle_timeout:(idle_timeout_ : idle_timeout option)
    ?profile_name:(profile_name_ : name_string option)
    ?session_type:(session_type_ : session_type option) () =
  ({
     id = id_;
     created_on = created_on_;
     status = status_;
     error_message = error_message_;
     description = description_;
     role = role_;
     command = command_;
     default_arguments = default_arguments_;
     connections = connections_;
     progress = progress_;
     max_capacity = max_capacity_;
     security_configuration = security_configuration_;
     glue_version = glue_version_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     completed_on = completed_on_;
     execution_time = execution_time_;
     dpu_seconds = dpu_seconds_;
     idle_timeout = idle_timeout_;
     profile_name = profile_name_;
     session_type = session_type_;
   }
    : session)

let make_list_sessions_response ?ids:(ids_ : session_id_list option)
    ?sessions:(sessions_ : session_list option)
    ?next_token:(next_token_ : orchestration_token option) () =
  ({ ids = ids_; sessions = sessions_; next_token = next_token_ } : list_sessions_response)

let make_list_sessions_request ?next_token:(next_token_ : orchestration_token option)
    ?max_results:(max_results_ : page_size option) ?tags:(tags_ : tags_map option)
    ?request_origin:(request_origin_ : orchestration_name_string option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     tags = tags_;
     request_origin = request_origin_;
   }
    : list_sessions_request)

let make_schema_version_list_item ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?version_number:(version_number_ : version_long_number option)
    ?status:(status_ : schema_version_status option)
    ?created_time:(created_time_ : created_timestamp option) () =
  ({
     schema_arn = schema_arn_;
     schema_version_id = schema_version_id_;
     version_number = version_number_;
     status = status_;
     created_time = created_time_;
   }
    : schema_version_list_item)

let make_list_schema_versions_response ?schemas:(schemas_ : schema_version_list option)
    ?next_token:(next_token_ : schema_registry_token_string option) () =
  ({ schemas = schemas_; next_token = next_token_ } : list_schema_versions_response)

let make_list_schema_versions_input ?max_results:(max_results_ : max_results_number option)
    ?next_token:(next_token_ : schema_registry_token_string option)
    ~schema_id:(schema_id_ : schema_id) () =
  ({ schema_id = schema_id_; max_results = max_results_; next_token = next_token_ }
    : list_schema_versions_input)

let make_schema_list_item ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?description:(description_ : description_string option)
    ?schema_status:(schema_status_ : schema_status option)
    ?created_time:(created_time_ : created_timestamp option)
    ?updated_time:(updated_time_ : updated_timestamp option) () =
  ({
     registry_name = registry_name_;
     schema_name = schema_name_;
     schema_arn = schema_arn_;
     description = description_;
     schema_status = schema_status_;
     created_time = created_time_;
     updated_time = updated_time_;
   }
    : schema_list_item)

let make_list_schemas_response ?schemas:(schemas_ : schema_list_definition option)
    ?next_token:(next_token_ : schema_registry_token_string option) () =
  ({ schemas = schemas_; next_token = next_token_ } : list_schemas_response)

let make_list_schemas_input ?registry_id:(registry_id_ : registry_id option)
    ?max_results:(max_results_ : max_results_number option)
    ?next_token:(next_token_ : schema_registry_token_string option) () =
  ({ registry_id = registry_id_; max_results = max_results_; next_token = next_token_ }
    : list_schemas_input)

let make_registry_list_item ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?description:(description_ : description_string option)
    ?status:(status_ : registry_status option)
    ?created_time:(created_time_ : created_timestamp option)
    ?updated_time:(updated_time_ : updated_timestamp option) () =
  ({
     registry_name = registry_name_;
     registry_arn = registry_arn_;
     description = description_;
     status = status_;
     created_time = created_time_;
     updated_time = updated_time_;
   }
    : registry_list_item)

let make_list_registries_response ?registries:(registries_ : registry_list_definition option)
    ?next_token:(next_token_ : schema_registry_token_string option) () =
  ({ registries = registries_; next_token = next_token_ } : list_registries_response)

let make_list_registries_input ?max_results:(max_results_ : max_results_number option)
    ?next_token:(next_token_ : schema_registry_token_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_registries_input)

let make_list_ml_transforms_response ?next_token:(next_token_ : pagination_token option)
    ~transform_ids:(transform_ids_ : transform_id_list) () =
  ({ transform_ids = transform_ids_; next_token = next_token_ } : list_ml_transforms_response)

let make_transform_sort_criteria ~column:(column_ : transform_sort_column_type)
    ~sort_direction:(sort_direction_ : sort_direction_type) () =
  ({ column = column_; sort_direction = sort_direction_ } : transform_sort_criteria)

let make_schema_column ?name:(name_ : column_name_string option)
    ?data_type:(data_type_ : column_type_string option) () =
  ({ name = name_; data_type = data_type_ } : schema_column)

let make_transform_filter_criteria ?name:(name_ : name_string option)
    ?transform_type:(transform_type_ : transform_type option)
    ?status:(status_ : transform_status_type option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?last_modified_before:(last_modified_before_ : timestamp option)
    ?last_modified_after:(last_modified_after_ : timestamp option)
    ?schema:(schema_ : transform_schema option) () =
  ({
     name = name_;
     transform_type = transform_type_;
     status = status_;
     glue_version = glue_version_;
     created_before = created_before_;
     created_after = created_after_;
     last_modified_before = last_modified_before_;
     last_modified_after = last_modified_after_;
     schema = schema_;
   }
    : transform_filter_criteria)

let make_list_ml_transforms_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option)
    ?filter:(filter_ : transform_filter_criteria option)
    ?sort:(sort_ : transform_sort_criteria option) ?tags:(tags_ : tags_map option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
     sort = sort_;
     tags = tags_;
   }
    : list_ml_transforms_request)

let make_materialized_view_refresh_task_run ?customer_id:(customer_id_ : account_id option)
    ?materialized_view_refresh_task_run_id:(materialized_view_refresh_task_run_id_ : uui_dv4 option)
    ?database_name:(database_name_ : database_name option)
    ?table_name:(table_name_ : table_name option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) ?role:(role_ : role option)
    ?status:(status_ : materialized_view_refresh_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?error_message:(error_message_ : description_string option)
    ?dpu_seconds:(dpu_seconds_ : non_negative_double option)
    ?refresh_type:(refresh_type_ : materialized_view_refresh_type option)
    ?processed_bytes:(processed_bytes_ : byte_count option) () =
  ({
     customer_id = customer_id_;
     materialized_view_refresh_task_run_id = materialized_view_refresh_task_run_id_;
     database_name = database_name_;
     table_name = table_name_;
     catalog_id = catalog_id_;
     role = role_;
     status = status_;
     creation_time = creation_time_;
     last_updated = last_updated_;
     start_time = start_time_;
     end_time = end_time_;
     error_message = error_message_;
     dpu_seconds = dpu_seconds_;
     refresh_type = refresh_type_;
     processed_bytes = processed_bytes_;
   }
    : materialized_view_refresh_task_run)

let make_list_materialized_view_refresh_task_runs_response
    ?materialized_view_refresh_task_runs:
      (materialized_view_refresh_task_runs_ : materialized_view_refresh_task_runs_list option)
    ?next_token:(next_token_ : token option) () =
  ({
     materialized_view_refresh_task_runs = materialized_view_refresh_task_runs_;
     next_token = next_token_;
   }
    : list_materialized_view_refresh_task_runs_response)

let make_list_materialized_view_refresh_task_runs_request
    ?database_name:(database_name_ : name_string option)
    ?table_name:(table_name_ : name_string option) ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) ~catalog_id:(catalog_id_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_materialized_view_refresh_task_runs_request)

let make_list_jobs_response ?job_names:(job_names_ : job_name_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ job_names = job_names_; next_token = next_token_ } : list_jobs_response)

let make_list_jobs_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : page_size option) ?tags:(tags_ : tags_map option) () =
  ({ next_token = next_token_; max_results = max_results_; tags = tags_ } : list_jobs_request)

let make_iterable_form_list_item ?item_id:(item_id_ : item_id option)
    ?item_name:(item_name_ : item_name option) ?description:(description_ : item_description option)
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option) () =
  ({
     item_id = item_id_;
     item_name = item_name_;
     description = description_;
     glossary_terms = glossary_terms_;
   }
    : iterable_form_list_item)

let make_list_iterable_forms_response ?items:(items_ : iterable_form_list_item_list option)
    ?next_token:(next_token_ : token option) () =
  ({ items = items_; next_token = next_token_ } : list_iterable_forms_response)

let make_list_iterable_forms_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) ~asset_identifier:(asset_identifier_ : asset_id)
    ~iterable_form_name:(iterable_form_name_ : iterable_form_name) () =
  ({
     asset_identifier = asset_identifier_;
     iterable_form_name = iterable_form_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_iterable_forms_request)

let make_integration_resource_property
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ~resource_arn:(resource_arn_ : string512) () =
  ({
     resource_arn = resource_arn_;
     resource_property_arn = resource_property_arn_;
     source_processing_properties = source_processing_properties_;
     target_processing_properties = target_processing_properties_;
   }
    : integration_resource_property)

let make_list_integration_resource_properties_response
    ?integration_resource_property_list:
      (integration_resource_property_list_ : integration_resource_property_list option)
    ?marker:(marker_ : string1024 option) () =
  ({ integration_resource_property_list = integration_resource_property_list_; marker = marker_ }
    : list_integration_resource_properties_response)

let make_integration_resource_property_filter ?name:(name_ : string128 option)
    ?values:(values_ : integration_resource_property_filter_values option) () =
  ({ name = name_; values = values_ } : integration_resource_property_filter)

let make_list_integration_resource_properties_request ?marker:(marker_ : string1024 option)
    ?filters:(filters_ : integration_resource_property_filter_list option)
    ?max_records:(max_records_ : integration_integer option) () =
  ({ marker = marker_; filters = filters_; max_records = max_records_ }
    : list_integration_resource_properties_request)

let make_glossary_term_item ?id:(id_ : glossary_term_id option)
    ?name:(name_ : glossary_term_name option)
    ?short_description:(short_description_ : glossary_short_description option) () =
  ({ id = id_; name = name_; short_description = short_description_ } : glossary_term_item)

let make_list_glossary_terms_response ?items:(items_ : glossary_term_item_list option)
    ?next_token:(next_token_ : token option) () =
  ({ items = items_; next_token = next_token_ } : list_glossary_terms_response)

let make_list_glossary_terms_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option)
    ~glossary_identifier:(glossary_identifier_ : glossary_id) () =
  ({
     glossary_identifier = glossary_identifier_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_glossary_terms_request)

let make_glossary_item ?id:(id_ : glossary_id option) ?name:(name_ : glossary_name option)
    ?description:(description_ : metadata_description option) () =
  ({ id = id_; name = name_; description = description_ } : glossary_item)

let make_list_glossaries_response ?items:(items_ : glossary_item_list option)
    ?next_token:(next_token_ : token option) () =
  ({ items = items_; next_token = next_token_ } : list_glossaries_response)

let make_list_glossaries_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_glossaries_request)

let make_form_type_item ?id:(id_ : form_type_id option) ?name:(name_ : form_type_name option) () =
  ({ id = id_; name = name_ } : form_type_item)

let make_list_form_types_response ?next_token:(next_token_ : token option)
    ~items:(items_ : form_type_item_list) () =
  ({ items = items_; next_token = next_token_ } : list_form_types_response)

let make_list_form_types_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_form_types_request)

let make_entity ?entity_name:(entity_name_ : entity_name option)
    ?label:(label_ : entity_label option)
    ?is_parent_entity:(is_parent_entity_ : is_parent_entity option)
    ?description:(description_ : entity_description option) ?category:(category_ : category option)
    ?custom_properties:(custom_properties_ : custom_properties option) () =
  ({
     entity_name = entity_name_;
     label = label_;
     is_parent_entity = is_parent_entity_;
     description = description_;
     category = category_;
     custom_properties = custom_properties_;
   }
    : entity)

let make_list_entities_response ?entities:(entities_ : entity_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ entities = entities_; next_token = next_token_ } : list_entities_response)

let make_list_entities_request ?connection_name:(connection_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?parent_entity_name:(parent_entity_name_ : entity_name option)
    ?next_token:(next_token_ : next_token option)
    ?data_store_api_version:(data_store_api_version_ : api_version option) () =
  ({
     connection_name = connection_name_;
     catalog_id = catalog_id_;
     parent_entity_name = parent_entity_name_;
     next_token = next_token_;
     data_store_api_version = data_store_api_version_;
   }
    : list_entities_request)

let make_list_dev_endpoints_response
    ?dev_endpoint_names:(dev_endpoint_names_ : dev_endpoint_name_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ dev_endpoint_names = dev_endpoint_names_; next_token = next_token_ }
    : list_dev_endpoints_response)

let make_list_dev_endpoints_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : page_size option) ?tags:(tags_ : tags_map option) () =
  ({ next_token = next_token_; max_results = max_results_; tags = tags_ }
    : list_dev_endpoints_request)

let make_timestamped_inclusion_annotation ?value:(value_ : inclusion_annotation_value option)
    ?last_modified_on:(last_modified_on_ : timestamp option) () =
  ({ value = value_; last_modified_on = last_modified_on_ } : timestamped_inclusion_annotation)

let make_run_identifier ?run_id:(run_id_ : hash_string option)
    ?job_run_id:(job_run_id_ : hash_string option) () =
  ({ run_id = run_id_; job_run_id = job_run_id_ } : run_identifier)

let make_statistic_summary ?statistic_id:(statistic_id_ : hash_string option)
    ?profile_id:(profile_id_ : hash_string option)
    ?run_identifier:(run_identifier_ : run_identifier option)
    ?statistic_name:(statistic_name_ : statistic_name_string option)
    ?double_value:(double_value_ : double option)
    ?evaluation_level:(evaluation_level_ : statistic_evaluation_level option)
    ?columns_referenced:(columns_referenced_ : column_name_list option)
    ?referenced_datasets:(referenced_datasets_ : reference_datasets_list option)
    ?statistic_properties:(statistic_properties_ : statistic_properties_map option)
    ?recorded_on:(recorded_on_ : timestamp option)
    ?inclusion_annotation:(inclusion_annotation_ : timestamped_inclusion_annotation option) () =
  ({
     statistic_id = statistic_id_;
     profile_id = profile_id_;
     run_identifier = run_identifier_;
     statistic_name = statistic_name_;
     double_value = double_value_;
     evaluation_level = evaluation_level_;
     columns_referenced = columns_referenced_;
     referenced_datasets = referenced_datasets_;
     statistic_properties = statistic_properties_;
     recorded_on = recorded_on_;
     inclusion_annotation = inclusion_annotation_;
   }
    : statistic_summary)

let make_list_data_quality_statistics_response
    ?statistics:(statistics_ : statistic_summary_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ statistics = statistics_; next_token = next_token_ } : list_data_quality_statistics_response)

let make_timestamp_filter ?recorded_before:(recorded_before_ : timestamp option)
    ?recorded_after:(recorded_after_ : timestamp option) () =
  ({ recorded_before = recorded_before_; recorded_after = recorded_after_ } : timestamp_filter)

let make_list_data_quality_statistics_request ?statistic_id:(statistic_id_ : hash_string option)
    ?profile_id:(profile_id_ : hash_string option)
    ?timestamp_filter:(timestamp_filter_ : timestamp_filter option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     statistic_id = statistic_id_;
     profile_id = profile_id_;
     timestamp_filter = timestamp_filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_data_quality_statistics_request)

let make_statistic_annotation ?profile_id:(profile_id_ : hash_string option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?statistic_recorded_on:(statistic_recorded_on_ : timestamp option)
    ?inclusion_annotation:(inclusion_annotation_ : timestamped_inclusion_annotation option) () =
  ({
     profile_id = profile_id_;
     statistic_id = statistic_id_;
     statistic_recorded_on = statistic_recorded_on_;
     inclusion_annotation = inclusion_annotation_;
   }
    : statistic_annotation)

let make_list_data_quality_statistic_annotations_response
    ?annotations:(annotations_ : annotation_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ annotations = annotations_; next_token = next_token_ }
    : list_data_quality_statistic_annotations_response)

let make_list_data_quality_statistic_annotations_request
    ?statistic_id:(statistic_id_ : hash_string option)
    ?profile_id:(profile_id_ : hash_string option)
    ?timestamp_filter:(timestamp_filter_ : timestamp_filter option)
    ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     statistic_id = statistic_id_;
     profile_id = profile_id_;
     timestamp_filter = timestamp_filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_data_quality_statistic_annotations_request)

let make_data_quality_target_table ?catalog_id:(catalog_id_ : name_string option)
    ~table_name:(table_name_ : name_string) ~database_name:(database_name_ : name_string) () =
  ({ table_name = table_name_; database_name = database_name_; catalog_id = catalog_id_ }
    : data_quality_target_table)

let make_data_quality_ruleset_list_details ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?created_on:(created_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?target_table:(target_table_ : data_quality_target_table option)
    ?recommendation_run_id:(recommendation_run_id_ : hash_string option)
    ?rule_count:(rule_count_ : nullable_integer option) () =
  ({
     name = name_;
     description = description_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
     target_table = target_table_;
     recommendation_run_id = recommendation_run_id_;
     rule_count = rule_count_;
   }
    : data_quality_ruleset_list_details)

let make_list_data_quality_rulesets_response
    ?rulesets:(rulesets_ : data_quality_ruleset_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ rulesets = rulesets_; next_token = next_token_ } : list_data_quality_rulesets_response)

let make_data_quality_ruleset_filter_criteria ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?last_modified_before:(last_modified_before_ : timestamp option)
    ?last_modified_after:(last_modified_after_ : timestamp option)
    ?target_table:(target_table_ : data_quality_target_table option) () =
  ({
     name = name_;
     description = description_;
     created_before = created_before_;
     created_after = created_after_;
     last_modified_before = last_modified_before_;
     last_modified_after = last_modified_after_;
     target_table = target_table_;
   }
    : data_quality_ruleset_filter_criteria)

let make_list_data_quality_rulesets_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option)
    ?filter:(filter_ : data_quality_ruleset_filter_criteria option) ?tags:(tags_ : tags_map option)
    () =
  ({ next_token = next_token_; max_results = max_results_; filter = filter_; tags = tags_ }
    : list_data_quality_rulesets_request)

let make_data_quality_ruleset_evaluation_run_description ?run_id:(run_id_ : hash_string option)
    ?status:(status_ : task_status_type option) ?started_on:(started_on_ : timestamp option)
    ?data_source:(data_source_ : data_source option) () =
  ({ run_id = run_id_; status = status_; started_on = started_on_; data_source = data_source_ }
    : data_quality_ruleset_evaluation_run_description)

let make_list_data_quality_ruleset_evaluation_runs_response
    ?runs:(runs_ : data_quality_ruleset_evaluation_run_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ runs = runs_; next_token = next_token_ } : list_data_quality_ruleset_evaluation_runs_response)

let make_data_quality_ruleset_evaluation_run_filter
    ?started_before:(started_before_ : timestamp option)
    ?started_after:(started_after_ : timestamp option)
    ?ruleset_name:(ruleset_name_ : name_string option) ~data_source:(data_source_ : data_source) ()
    =
  ({
     data_source = data_source_;
     started_before = started_before_;
     started_after = started_after_;
     ruleset_name = ruleset_name_;
   }
    : data_quality_ruleset_evaluation_run_filter)

let make_list_data_quality_ruleset_evaluation_runs_request
    ?filter:(filter_ : data_quality_ruleset_evaluation_run_filter option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_data_quality_ruleset_evaluation_runs_request)

let make_data_quality_rule_recommendation_run_description ?run_id:(run_id_ : hash_string option)
    ?status:(status_ : task_status_type option) ?started_on:(started_on_ : timestamp option)
    ?data_source:(data_source_ : data_source option) () =
  ({ run_id = run_id_; status = status_; started_on = started_on_; data_source = data_source_ }
    : data_quality_rule_recommendation_run_description)

let make_list_data_quality_rule_recommendation_runs_response
    ?runs:(runs_ : data_quality_rule_recommendation_run_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ runs = runs_; next_token = next_token_ } : list_data_quality_rule_recommendation_runs_response)

let make_data_quality_rule_recommendation_run_filter
    ?started_before:(started_before_ : timestamp option)
    ?started_after:(started_after_ : timestamp option) ~data_source:(data_source_ : data_source) ()
    =
  ({ data_source = data_source_; started_before = started_before_; started_after = started_after_ }
    : data_quality_rule_recommendation_run_filter)

let make_list_data_quality_rule_recommendation_runs_request
    ?filter:(filter_ : data_quality_rule_recommendation_run_filter option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_data_quality_rule_recommendation_runs_request)

let make_data_quality_result_description ?result_id:(result_id_ : hash_string option)
    ?data_source:(data_source_ : data_source option) ?job_name:(job_name_ : name_string option)
    ?job_run_id:(job_run_id_ : hash_string option) ?started_on:(started_on_ : timestamp option) () =
  ({
     result_id = result_id_;
     data_source = data_source_;
     job_name = job_name_;
     job_run_id = job_run_id_;
     started_on = started_on_;
   }
    : data_quality_result_description)

let make_list_data_quality_results_response ?next_token:(next_token_ : pagination_token option)
    ~results:(results_ : data_quality_result_description_list) () =
  ({ results = results_; next_token = next_token_ } : list_data_quality_results_response)

let make_data_quality_result_filter_criteria ?data_source:(data_source_ : data_source option)
    ?job_name:(job_name_ : name_string option) ?job_run_id:(job_run_id_ : hash_string option)
    ?started_after:(started_after_ : timestamp option)
    ?started_before:(started_before_ : timestamp option) () =
  ({
     data_source = data_source_;
     job_name = job_name_;
     job_run_id = job_run_id_;
     started_after = started_after_;
     started_before = started_before_;
   }
    : data_quality_result_filter_criteria)

let make_list_data_quality_results_request
    ?filter:(filter_ : data_quality_result_filter_criteria option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_data_quality_results_request)

let make_custom_entity_type ?context_words:(context_words_ : context_words option)
    ~name:(name_ : name_string) ~regex_string:(regex_string_ : name_string) () =
  ({ name = name_; regex_string = regex_string_; context_words = context_words_ }
    : custom_entity_type)

let make_list_custom_entity_types_response
    ?custom_entity_types:(custom_entity_types_ : custom_entity_types option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ custom_entity_types = custom_entity_types_; next_token = next_token_ }
    : list_custom_entity_types_response)

let make_list_custom_entity_types_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option) ?tags:(tags_ : tags_map option) () =
  ({ next_token = next_token_; max_results = max_results_; tags = tags_ }
    : list_custom_entity_types_request)

let make_crawler_history ?crawl_id:(crawl_id_ : crawl_id option)
    ?state:(state_ : crawler_history_state option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?summary:(summary_ : name_string option)
    ?error_message:(error_message_ : description_string option)
    ?log_group:(log_group_ : log_group option) ?log_stream:(log_stream_ : log_stream option)
    ?message_prefix:(message_prefix_ : message_prefix option)
    ?dpu_hour:(dpu_hour_ : non_negative_double option) () =
  ({
     crawl_id = crawl_id_;
     state = state_;
     start_time = start_time_;
     end_time = end_time_;
     summary = summary_;
     error_message = error_message_;
     log_group = log_group_;
     log_stream = log_stream_;
     message_prefix = message_prefix_;
     dpu_hour = dpu_hour_;
   }
    : crawler_history)

let make_list_crawls_response ?crawls:(crawls_ : crawler_history_list option)
    ?next_token:(next_token_ : token option) () =
  ({ crawls = crawls_; next_token = next_token_ } : list_crawls_response)

let make_crawls_filter ?field_name:(field_name_ : field_name option)
    ?filter_operator:(filter_operator_ : filter_operator option)
    ?field_value:(field_value_ : generic_string option) () =
  ({ field_name = field_name_; filter_operator = filter_operator_; field_value = field_value_ }
    : crawls_filter)

let make_list_crawls_request ?max_results:(max_results_ : page_size option)
    ?filters:(filters_ : crawls_filter_list option) ?next_token:(next_token_ : token option)
    ~crawler_name:(crawler_name_ : name_string) () =
  ({
     crawler_name = crawler_name_;
     max_results = max_results_;
     filters = filters_;
     next_token = next_token_;
   }
    : list_crawls_request)

let make_list_crawlers_response ?crawler_names:(crawler_names_ : crawler_name_list option)
    ?next_token:(next_token_ : token option) () =
  ({ crawler_names = crawler_names_; next_token = next_token_ } : list_crawlers_response)

let make_list_crawlers_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) ?tags:(tags_ : tags_map option) () =
  ({ max_results = max_results_; next_token = next_token_; tags = tags_ } : list_crawlers_request)

let make_connection_type_variant
    ?connection_type_variant_name:(connection_type_variant_name_ : display_name option)
    ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ?logo_url:(logo_url_ : url_string option) () =
  ({
     connection_type_variant_name = connection_type_variant_name_;
     display_name = display_name_;
     description = description_;
     logo_url = logo_url_;
   }
    : connection_type_variant)

let make_capabilities
    ~supported_authentication_types:(supported_authentication_types_ : authentication_types)
    ~supported_data_operations:(supported_data_operations_ : data_operations)
    ~supported_compute_environments:(supported_compute_environments_ : compute_environments) () =
  ({
     supported_authentication_types = supported_authentication_types_;
     supported_data_operations = supported_data_operations_;
     supported_compute_environments = supported_compute_environments_;
   }
    : capabilities)

let make_connection_type_brief ?connection_type:(connection_type_ : connection_type option)
    ?display_name:(display_name_ : display_name option) ?vendor:(vendor_ : vendor option)
    ?description:(description_ : description option)
    ?categories:(categories_ : list_of_string option)
    ?capabilities:(capabilities_ : capabilities option) ?logo_url:(logo_url_ : url_string option)
    ?connection_type_variants:(connection_type_variants_ : connection_type_variant_list option) () =
  ({
     connection_type = connection_type_;
     display_name = display_name_;
     vendor = vendor_;
     description = description_;
     categories = categories_;
     capabilities = capabilities_;
     logo_url = logo_url_;
     connection_type_variants = connection_type_variants_;
   }
    : connection_type_brief)

let make_list_connection_types_response
    ?connection_types:(connection_types_ : connection_type_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ connection_types = connection_types_; next_token = next_token_ }
    : list_connection_types_response)

let make_list_connection_types_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_connection_types_request)

let make_list_column_statistics_task_runs_response
    ?column_statistics_task_run_ids:
      (column_statistics_task_run_ids_ : column_statistics_task_run_id_list option)
    ?next_token:(next_token_ : token option) () =
  ({ column_statistics_task_run_ids = column_statistics_task_run_ids_; next_token = next_token_ }
    : list_column_statistics_task_runs_response)

let make_list_column_statistics_task_runs_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_column_statistics_task_runs_request)

let make_list_blueprints_response ?blueprints:(blueprints_ : blueprint_names option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ blueprints = blueprints_; next_token = next_token_ } : list_blueprints_response)

let make_list_blueprints_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : orchestration_page_size25 option) ?tags:(tags_ : tags_map option)
    () =
  ({ next_token = next_token_; max_results = max_results_; tags = tags_ } : list_blueprints_request)

let make_asset_type_item ?id:(id_ : asset_type_id option) ?name:(name_ : asset_type_name option) ()
    =
  ({ id = id_; name = name_ } : asset_type_item)

let make_list_asset_types_response ?items:(items_ : asset_type_item_list option)
    ?next_token:(next_token_ : token option) () =
  ({ items = items_; next_token = next_token_ } : list_asset_types_response)

let make_list_asset_types_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_asset_types_request)

let make_import_catalog_to_glue_response () = (() : unit)

let make_import_catalog_to_glue_request ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ catalog_id = catalog_id_ } : import_catalog_to_glue_request)

let make_starting_event_batch_condition ?batch_size:(batch_size_ : nullable_integer option)
    ?batch_window:(batch_window_ : nullable_integer option) () =
  ({ batch_size = batch_size_; batch_window = batch_window_ } : starting_event_batch_condition)

let make_edge ?source_id:(source_id_ : name_string option)
    ?destination_id:(destination_id_ : name_string option) () =
  ({ source_id = source_id_; destination_id = destination_id_ } : edge)

let make_crawl ?state:(state_ : crawl_state option)
    ?started_on:(started_on_ : timestamp_value option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?error_message:(error_message_ : description_string option)
    ?log_group:(log_group_ : log_group option) ?log_stream:(log_stream_ : log_stream option) () =
  ({
     state = state_;
     started_on = started_on_;
     completed_on = completed_on_;
     error_message = error_message_;
     log_group = log_group_;
     log_stream = log_stream_;
   }
    : crawl)

let make_crawler_node_details ?crawls:(crawls_ : crawl_list option) () =
  ({ crawls = crawls_ } : crawler_node_details)

let make_predecessor ?job_name:(job_name_ : name_string option) ?run_id:(run_id_ : id_string option)
    () =
  ({ job_name = job_name_; run_id = run_id_ } : predecessor)

let make_job_run ?id:(id_ : id_string option) ?attempt:(attempt_ : attempt_count option)
    ?previous_run_id:(previous_run_id_ : id_string option)
    ?trigger_name:(trigger_name_ : name_string option) ?job_name:(job_name_ : name_string option)
    ?job_mode:(job_mode_ : job_mode option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?started_on:(started_on_ : timestamp_value option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?job_run_state:(job_run_state_ : job_run_state option)
    ?arguments:(arguments_ : generic_map option)
    ?error_message:(error_message_ : error_string option)
    ?predecessor_runs:(predecessor_runs_ : predecessor_list option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?execution_time:(execution_time_ : execution_time option) ?timeout:(timeout_ : timeout option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?log_group_name:(log_group_name_ : generic_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?dpu_seconds:(dpu_seconds_ : nullable_double option)
    ?execution_class:(execution_class_ : execution_class option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?profile_name:(profile_name_ : name_string option)
    ?state_detail:(state_detail_ : orchestration_message_string option)
    ?execution_role_session_policy:
      (execution_role_session_policy_ : orchestration_policy_json_string option) () =
  ({
     id = id_;
     attempt = attempt_;
     previous_run_id = previous_run_id_;
     trigger_name = trigger_name_;
     job_name = job_name_;
     job_mode = job_mode_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     started_on = started_on_;
     last_modified_on = last_modified_on_;
     completed_on = completed_on_;
     job_run_state = job_run_state_;
     arguments = arguments_;
     error_message = error_message_;
     predecessor_runs = predecessor_runs_;
     allocated_capacity = allocated_capacity_;
     execution_time = execution_time_;
     timeout = timeout_;
     max_capacity = max_capacity_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     security_configuration = security_configuration_;
     log_group_name = log_group_name_;
     notification_property = notification_property_;
     glue_version = glue_version_;
     dpu_seconds = dpu_seconds_;
     execution_class = execution_class_;
     maintenance_window = maintenance_window_;
     profile_name = profile_name_;
     state_detail = state_detail_;
     execution_role_session_policy = execution_role_session_policy_;
   }
    : job_run)

let make_job_node_details ?job_runs:(job_runs_ : job_run_list option) () =
  ({ job_runs = job_runs_ } : job_node_details)

let make_trigger_node_details ?trigger:(trigger_ : trigger option) () =
  ({ trigger = trigger_ } : trigger_node_details)

let make_node ?type_:(type__ : node_type option) ?name:(name_ : name_string option)
    ?unique_id:(unique_id_ : name_string option)
    ?trigger_details:(trigger_details_ : trigger_node_details option)
    ?job_details:(job_details_ : job_node_details option)
    ?crawler_details:(crawler_details_ : crawler_node_details option) () =
  ({
     type_ = type__;
     name = name_;
     unique_id = unique_id_;
     trigger_details = trigger_details_;
     job_details = job_details_;
     crawler_details = crawler_details_;
   }
    : node)

let make_workflow_graph ?nodes:(nodes_ : node_list option) ?edges:(edges_ : edge_list option) () =
  ({ nodes = nodes_; edges = edges_ } : workflow_graph)

let make_workflow_run_statistics ?total_actions:(total_actions_ : integer_value option)
    ?timeout_actions:(timeout_actions_ : integer_value option)
    ?failed_actions:(failed_actions_ : integer_value option)
    ?stopped_actions:(stopped_actions_ : integer_value option)
    ?succeeded_actions:(succeeded_actions_ : integer_value option)
    ?running_actions:(running_actions_ : integer_value option)
    ?errored_actions:(errored_actions_ : integer_value option)
    ?waiting_actions:(waiting_actions_ : integer_value option) () =
  ({
     total_actions = total_actions_;
     timeout_actions = timeout_actions_;
     failed_actions = failed_actions_;
     stopped_actions = stopped_actions_;
     succeeded_actions = succeeded_actions_;
     running_actions = running_actions_;
     errored_actions = errored_actions_;
     waiting_actions = waiting_actions_;
   }
    : workflow_run_statistics)

let make_workflow_run ?name:(name_ : name_string option)
    ?workflow_run_id:(workflow_run_id_ : id_string option)
    ?previous_run_id:(previous_run_id_ : id_string option)
    ?workflow_run_properties:(workflow_run_properties_ : workflow_run_properties option)
    ?started_on:(started_on_ : timestamp_value option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?status:(status_ : workflow_run_status option)
    ?error_message:(error_message_ : error_string option)
    ?statistics:(statistics_ : workflow_run_statistics option)
    ?graph:(graph_ : workflow_graph option)
    ?starting_event_batch_condition:
      (starting_event_batch_condition_ : starting_event_batch_condition option) () =
  ({
     name = name_;
     workflow_run_id = workflow_run_id_;
     previous_run_id = previous_run_id_;
     workflow_run_properties = workflow_run_properties_;
     started_on = started_on_;
     completed_on = completed_on_;
     status = status_;
     error_message = error_message_;
     statistics = statistics_;
     graph = graph_;
     starting_event_batch_condition = starting_event_batch_condition_;
   }
    : workflow_run)

let make_get_workflow_runs_response ?runs:(runs_ : workflow_runs option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ runs = runs_; next_token = next_token_ } : get_workflow_runs_response)

let make_get_workflow_runs_request ?include_graph:(include_graph_ : nullable_boolean option)
    ?next_token:(next_token_ : generic_string option) ?max_results:(max_results_ : page_size option)
    ~name:(name_ : name_string) () =
  ({
     name = name_;
     include_graph = include_graph_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_workflow_runs_request)

let make_get_workflow_run_properties_response
    ?run_properties:(run_properties_ : workflow_run_properties option) () =
  ({ run_properties = run_properties_ } : get_workflow_run_properties_response)

let make_get_workflow_run_properties_request ~name:(name_ : name_string)
    ~run_id:(run_id_ : id_string) () =
  ({ name = name_; run_id = run_id_ } : get_workflow_run_properties_request)

let make_get_workflow_run_response ?run:(run_ : workflow_run option) () =
  ({ run = run_ } : get_workflow_run_response)

let make_get_workflow_run_request ?include_graph:(include_graph_ : nullable_boolean option)
    ~name:(name_ : name_string) ~run_id:(run_id_ : id_string) () =
  ({ name = name_; run_id = run_id_; include_graph = include_graph_ } : get_workflow_run_request)

let make_blueprint_details ?blueprint_name:(blueprint_name_ : orchestration_name_string option)
    ?run_id:(run_id_ : id_string option) () =
  ({ blueprint_name = blueprint_name_; run_id = run_id_ } : blueprint_details)

let make_workflow ?name:(name_ : name_string option)
    ?description:(description_ : generic_string option)
    ?default_run_properties:(default_run_properties_ : workflow_run_properties option)
    ?created_on:(created_on_ : timestamp_value option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?last_run:(last_run_ : workflow_run option) ?graph:(graph_ : workflow_graph option)
    ?max_concurrent_runs:(max_concurrent_runs_ : nullable_integer option)
    ?blueprint_details:(blueprint_details_ : blueprint_details option) () =
  ({
     name = name_;
     description = description_;
     default_run_properties = default_run_properties_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
     last_run = last_run_;
     graph = graph_;
     max_concurrent_runs = max_concurrent_runs_;
     blueprint_details = blueprint_details_;
   }
    : workflow)

let make_get_workflow_response ?workflow:(workflow_ : workflow option) () =
  ({ workflow = workflow_ } : get_workflow_response)

let make_get_workflow_request ?include_graph:(include_graph_ : nullable_boolean option)
    ~name:(name_ : name_string) () =
  ({ name = name_; include_graph = include_graph_ } : get_workflow_request)

let make_user_defined_function ?function_name:(function_name_ : name_string option)
    ?database_name:(database_name_ : name_string option)
    ?class_name:(class_name_ : name_string option) ?owner_name:(owner_name_ : name_string option)
    ?function_type:(function_type_ : function_type option)
    ?owner_type:(owner_type_ : principal_type option) ?create_time:(create_time_ : timestamp option)
    ?resource_uris:(resource_uris_ : resource_uri_list option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     function_name = function_name_;
     database_name = database_name_;
     class_name = class_name_;
     owner_name = owner_name_;
     function_type = function_type_;
     owner_type = owner_type_;
     create_time = create_time_;
     resource_uris = resource_uris_;
     catalog_id = catalog_id_;
   }
    : user_defined_function)

let make_get_user_defined_functions_response
    ?user_defined_functions:(user_defined_functions_ : user_defined_function_list option)
    ?next_token:(next_token_ : token option) () =
  ({ user_defined_functions = user_defined_functions_; next_token = next_token_ }
    : get_user_defined_functions_response)

let make_get_user_defined_functions_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : name_string option)
    ?function_type:(function_type_ : function_type option) ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : catalog_getter_page_size option) ~pattern:(pattern_ : name_string)
    () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     pattern = pattern_;
     function_type = function_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_user_defined_functions_request)

let make_get_user_defined_function_response
    ?user_defined_function:(user_defined_function_ : user_defined_function option) () =
  ({ user_defined_function = user_defined_function_ } : get_user_defined_function_response)

let make_get_user_defined_function_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~function_name:(function_name_ : name_string) () =
  ({ catalog_id = catalog_id_; database_name = database_name_; function_name = function_name_ }
    : get_user_defined_function_request)

let make_get_usage_profile_response ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?configuration:(configuration_ : profile_configuration option)
    ?created_on:(created_on_ : timestamp_value option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option) () =
  ({
     name = name_;
     description = description_;
     configuration = configuration_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
   }
    : get_usage_profile_response)

let make_get_usage_profile_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_usage_profile_request)

let make_column_row_filter ?column_name:(column_name_ : name_string option)
    ?row_filter_expression:(row_filter_expression_ : predicate_string option) () =
  ({ column_name = column_name_; row_filter_expression = row_filter_expression_ }
    : column_row_filter)

let make_get_unfiltered_table_metadata_response ?table:(table_ : table option)
    ?authorized_columns:(authorized_columns_ : name_string_list option)
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option)
    ?cell_filters:(cell_filters_ : column_row_filter_list option)
    ?query_authorization_id:(query_authorization_id_ : hash_string option)
    ?is_multi_dialect_view:(is_multi_dialect_view_ : boolean_ option)
    ?is_materialized_view:(is_materialized_view_ : boolean_ option)
    ?resource_arn:(resource_arn_ : arn_string option)
    ?is_protected:(is_protected_ : boolean_ option)
    ?permissions:(permissions_ : permission_list option)
    ?row_filter:(row_filter_ : predicate_string option) () =
  ({
     table = table_;
     authorized_columns = authorized_columns_;
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
     cell_filters = cell_filters_;
     query_authorization_id = query_authorization_id_;
     is_multi_dialect_view = is_multi_dialect_view_;
     is_materialized_view = is_materialized_view_;
     resource_arn = resource_arn_;
     is_protected = is_protected_;
     permissions = permissions_;
     row_filter = row_filter_;
   }
    : get_unfiltered_table_metadata_response)

let make_query_session_context ?query_id:(query_id_ : hash_string option)
    ?query_start_time:(query_start_time_ : timestamp option)
    ?cluster_id:(cluster_id_ : nullable_string option)
    ?query_authorization_id:(query_authorization_id_ : hash_string option)
    ?additional_context:(additional_context_ : additional_context_map option) () =
  ({
     query_id = query_id_;
     query_start_time = query_start_time_;
     cluster_id = cluster_id_;
     query_authorization_id = query_authorization_id_;
     additional_context = additional_context_;
   }
    : query_session_context)

let make_supported_dialect ?dialect:(dialect_ : view_dialect option)
    ?dialect_version:(dialect_version_ : view_dialect_version_string option) () =
  ({ dialect = dialect_; dialect_version = dialect_version_ } : supported_dialect)

let make_audit_context
    ?additional_audit_context:(additional_audit_context_ : audit_context_string option)
    ?requested_columns:(requested_columns_ : audit_column_names_list option)
    ?all_columns_requested:(all_columns_requested_ : nullable_boolean option) () =
  ({
     additional_audit_context = additional_audit_context_;
     requested_columns = requested_columns_;
     all_columns_requested = all_columns_requested_;
   }
    : audit_context)

let make_get_unfiltered_table_metadata_request ?region:(region_ : value_string option)
    ?audit_context:(audit_context_ : audit_context option)
    ?parent_resource_arn:(parent_resource_arn_ : arn_string option)
    ?root_resource_arn:(root_resource_arn_ : arn_string option)
    ?supported_dialect:(supported_dialect_ : supported_dialect option)
    ?permissions:(permissions_ : permission_list option)
    ?query_session_context:(query_session_context_ : query_session_context option)
    ~catalog_id:(catalog_id_ : catalog_id_string) ~database_name:(database_name_ : name_string)
    ~name:(name_ : name_string)
    ~supported_permission_types:(supported_permission_types_ : permission_type_list) () =
  ({
     region = region_;
     catalog_id = catalog_id_;
     database_name = database_name_;
     name = name_;
     audit_context = audit_context_;
     supported_permission_types = supported_permission_types_;
     parent_resource_arn = parent_resource_arn_;
     root_resource_arn = root_resource_arn_;
     supported_dialect = supported_dialect_;
     permissions = permissions_;
     query_session_context = query_session_context_;
   }
    : get_unfiltered_table_metadata_request)

let make_partition ?values:(values_ : value_string_list option)
    ?database_name:(database_name_ : name_string option)
    ?table_name:(table_name_ : name_string option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_access_time:(last_access_time_ : timestamp option)
    ?storage_descriptor:(storage_descriptor_ : storage_descriptor option)
    ?parameters:(parameters_ : parameters_map option)
    ?last_analyzed_time:(last_analyzed_time_ : timestamp option)
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({
     values = values_;
     database_name = database_name_;
     table_name = table_name_;
     creation_time = creation_time_;
     last_access_time = last_access_time_;
     storage_descriptor = storage_descriptor_;
     parameters = parameters_;
     last_analyzed_time = last_analyzed_time_;
     catalog_id = catalog_id_;
   }
    : partition)

let make_unfiltered_partition ?partition:(partition_ : partition option)
    ?authorized_columns:(authorized_columns_ : name_string_list option)
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option) () =
  ({
     partition = partition_;
     authorized_columns = authorized_columns_;
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
   }
    : unfiltered_partition)

let make_get_unfiltered_partitions_metadata_response
    ?unfiltered_partitions:(unfiltered_partitions_ : unfiltered_partition_list option)
    ?next_token:(next_token_ : token option) () =
  ({ unfiltered_partitions = unfiltered_partitions_; next_token = next_token_ }
    : get_unfiltered_partitions_metadata_response)

let make_segment ~segment_number:(segment_number_ : non_negative_integer)
    ~total_segments:(total_segments_ : total_segments_integer) () =
  ({ segment_number = segment_number_; total_segments = total_segments_ } : segment)

let make_get_unfiltered_partitions_metadata_request ?region:(region_ : value_string option)
    ?expression:(expression_ : predicate_string option)
    ?audit_context:(audit_context_ : audit_context option) ?next_token:(next_token_ : token option)
    ?segment:(segment_ : segment option) ?max_results:(max_results_ : page_size option)
    ?query_session_context:(query_session_context_ : query_session_context option)
    ~catalog_id:(catalog_id_ : catalog_id_string) ~database_name:(database_name_ : name_string)
    ~table_name:(table_name_ : name_string)
    ~supported_permission_types:(supported_permission_types_ : permission_type_list) () =
  ({
     region = region_;
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     expression = expression_;
     audit_context = audit_context_;
     supported_permission_types = supported_permission_types_;
     next_token = next_token_;
     segment = segment_;
     max_results = max_results_;
     query_session_context = query_session_context_;
   }
    : get_unfiltered_partitions_metadata_request)

let make_get_unfiltered_partition_metadata_response ?partition:(partition_ : partition option)
    ?authorized_columns:(authorized_columns_ : name_string_list option)
    ?is_registered_with_lake_formation:(is_registered_with_lake_formation_ : boolean_ option) () =
  ({
     partition = partition_;
     authorized_columns = authorized_columns_;
     is_registered_with_lake_formation = is_registered_with_lake_formation_;
   }
    : get_unfiltered_partition_metadata_response)

let make_get_unfiltered_partition_metadata_request ?region:(region_ : value_string option)
    ?audit_context:(audit_context_ : audit_context option)
    ?query_session_context:(query_session_context_ : query_session_context option)
    ~catalog_id:(catalog_id_ : catalog_id_string) ~database_name:(database_name_ : name_string)
    ~table_name:(table_name_ : name_string)
    ~partition_values:(partition_values_ : value_string_list)
    ~supported_permission_types:(supported_permission_types_ : permission_type_list) () =
  ({
     region = region_;
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_values = partition_values_;
     audit_context = audit_context_;
     supported_permission_types = supported_permission_types_;
     query_session_context = query_session_context_;
   }
    : get_unfiltered_partition_metadata_request)

let make_get_triggers_response ?triggers:(triggers_ : trigger_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ triggers = triggers_; next_token = next_token_ } : get_triggers_response)

let make_get_triggers_request ?next_token:(next_token_ : generic_string option)
    ?dependent_job_name:(dependent_job_name_ : name_string option)
    ?max_results:(max_results_ : orchestration_page_size200 option) () =
  ({
     next_token = next_token_;
     dependent_job_name = dependent_job_name_;
     max_results = max_results_;
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

let make_table_version ?table:(table_ : table option)
    ?version_id:(version_id_ : version_string option) () =
  ({ table = table_; version_id = version_id_ } : table_version)

let make_get_table_versions_response
    ?table_versions:(table_versions_ : get_table_versions_list option)
    ?next_token:(next_token_ : token option) () =
  ({ table_versions = table_versions_; next_token = next_token_ } : get_table_versions_response)

let make_get_table_versions_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : catalog_getter_page_size option)
    ?audit_context:(audit_context_ : audit_context option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     next_token = next_token_;
     max_results = max_results_;
     audit_context = audit_context_;
   }
    : get_table_versions_request)

let make_get_table_version_response ?table_version:(table_version_ : table_version option) () =
  ({ table_version = table_version_ } : get_table_version_response)

let make_get_table_version_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?version_id:(version_id_ : version_string option)
    ?audit_context:(audit_context_ : audit_context option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     version_id = version_id_;
     audit_context = audit_context_;
   }
    : get_table_version_request)

let make_get_tables_response ?table_list:(table_list_ : table_list option)
    ?next_token:(next_token_ : token option) () =
  ({ table_list = table_list_; next_token = next_token_ } : get_tables_response)

let make_get_tables_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?expression:(expression_ : filter_string option) ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : catalog_getter_page_size option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?query_as_of_time:(query_as_of_time_ : timestamp option)
    ?audit_context:(audit_context_ : audit_context option)
    ?include_status_details:(include_status_details_ : boolean_nullable option)
    ?attributes_to_get:(attributes_to_get_ : table_attributes_list option)
    ~database_name:(database_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     expression = expression_;
     next_token = next_token_;
     max_results = max_results_;
     transaction_id = transaction_id_;
     query_as_of_time = query_as_of_time_;
     audit_context = audit_context_;
     include_status_details = include_status_details_;
     attributes_to_get = attributes_to_get_;
   }
    : get_tables_request)

let make_table_optimizer ?type_:(type__ : table_optimizer_type option)
    ?configuration:(configuration_ : table_optimizer_configuration option)
    ?last_run:(last_run_ : table_optimizer_run option)
    ?configuration_source:(configuration_source_ : configuration_source option) () =
  ({
     type_ = type__;
     configuration = configuration_;
     last_run = last_run_;
     configuration_source = configuration_source_;
   }
    : table_optimizer)

let make_get_table_optimizer_response ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : name_string option)
    ?table_name:(table_name_ : name_string option)
    ?table_optimizer:(table_optimizer_ : table_optimizer option) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     table_optimizer = table_optimizer_;
   }
    : get_table_optimizer_response)

let make_get_table_optimizer_request ~catalog_id:(catalog_id_ : catalog_id_string)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~type_:(type__ : table_optimizer_type) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     type_ = type__;
   }
    : get_table_optimizer_request)

let make_get_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : get_table_response)

let make_get_table_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?query_as_of_time:(query_as_of_time_ : timestamp option)
    ?audit_context:(audit_context_ : audit_context option)
    ?include_status_details:(include_status_details_ : boolean_nullable option)
    ?attributes_to_get:(attributes_to_get_ : table_attributes_list option)
    ~database_name:(database_name_ : name_string) ~name:(name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     name = name_;
     transaction_id = transaction_id_;
     query_as_of_time = query_as_of_time_;
     audit_context = audit_context_;
     include_status_details = include_status_details_;
     attributes_to_get = attributes_to_get_;
   }
    : get_table_request)

let make_get_statement_response ?statement:(statement_ : statement option) () =
  ({ statement = statement_ } : get_statement_response)

let make_get_statement_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~session_id:(session_id_ : name_string) ~id:(id_ : integer_value) () =
  ({ session_id = session_id_; id = id_; request_origin = request_origin_ } : get_statement_request)

let make_session_endpoint ~url:(url_ : spark_connect_endpoint_url)
    ~auth_token:(auth_token_ : sensitive_string)
    ~auth_token_expiration_time:(auth_token_expiration_time_ : timestamp_value) () =
  ({
     url = url_;
     auth_token = auth_token_;
     auth_token_expiration_time = auth_token_expiration_time_;
   }
    : session_endpoint)

let make_get_session_endpoint_response ~spark_connect:(spark_connect_ : session_endpoint) () =
  ({ spark_connect = spark_connect_ } : get_session_endpoint_response)

let make_get_session_endpoint_request ~session_id:(session_id_ : name_string) () =
  ({ session_id = session_id_ } : get_session_endpoint_request)

let make_get_session_response ?session:(session_ : session option) () =
  ({ session = session_ } : get_session_response)

let make_get_session_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~id:(id_ : name_string) () =
  ({ id = id_; request_origin = request_origin_ } : get_session_request)

let make_data_quality_encryption
    ?data_quality_encryption_mode:
      (data_quality_encryption_mode_ : data_quality_encryption_mode option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) () =
  ({ data_quality_encryption_mode = data_quality_encryption_mode_; kms_key_arn = kms_key_arn_ }
    : data_quality_encryption)

let make_job_bookmarks_encryption
    ?job_bookmarks_encryption_mode:
      (job_bookmarks_encryption_mode_ : job_bookmarks_encryption_mode option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) () =
  ({ job_bookmarks_encryption_mode = job_bookmarks_encryption_mode_; kms_key_arn = kms_key_arn_ }
    : job_bookmarks_encryption)

let make_cloud_watch_encryption
    ?cloud_watch_encryption_mode:(cloud_watch_encryption_mode_ : cloud_watch_encryption_mode option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) () =
  ({ cloud_watch_encryption_mode = cloud_watch_encryption_mode_; kms_key_arn = kms_key_arn_ }
    : cloud_watch_encryption)

let make_s3_encryption ?s3_encryption_mode:(s3_encryption_mode_ : s3_encryption_mode option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) () =
  ({ s3_encryption_mode = s3_encryption_mode_; kms_key_arn = kms_key_arn_ } : s3_encryption)

let make_encryption_configuration ?s3_encryption:(s3_encryption_ : s3_encryption_list option)
    ?cloud_watch_encryption:(cloud_watch_encryption_ : cloud_watch_encryption option)
    ?job_bookmarks_encryption:(job_bookmarks_encryption_ : job_bookmarks_encryption option)
    ?data_quality_encryption:(data_quality_encryption_ : data_quality_encryption option) () =
  ({
     s3_encryption = s3_encryption_;
     cloud_watch_encryption = cloud_watch_encryption_;
     job_bookmarks_encryption = job_bookmarks_encryption_;
     data_quality_encryption = data_quality_encryption_;
   }
    : encryption_configuration)

let make_security_configuration ?name:(name_ : name_string option)
    ?created_time_stamp:(created_time_stamp_ : timestamp_value option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option) () =
  ({
     name = name_;
     created_time_stamp = created_time_stamp_;
     encryption_configuration = encryption_configuration_;
   }
    : security_configuration)

let make_get_security_configurations_response
    ?security_configurations:(security_configurations_ : security_configuration_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ security_configurations = security_configurations_; next_token = next_token_ }
    : get_security_configurations_response)

let make_get_security_configurations_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : get_security_configurations_request)

let make_get_security_configuration_response
    ?security_configuration:(security_configuration_ : security_configuration option) () =
  ({ security_configuration = security_configuration_ } : get_security_configuration_response)

let make_get_security_configuration_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_security_configuration_request)

let make_get_schema_versions_diff_response ?diff:(diff_ : schema_definition_diff option) () =
  ({ diff = diff_ } : get_schema_versions_diff_response)

let make_get_schema_versions_diff_input ~schema_id:(schema_id_ : schema_id)
    ~first_schema_version_number:(first_schema_version_number_ : schema_version_number)
    ~second_schema_version_number:(second_schema_version_number_ : schema_version_number)
    ~schema_diff_type:(schema_diff_type_ : schema_diff_type) () =
  ({
     schema_id = schema_id_;
     first_schema_version_number = first_schema_version_number_;
     second_schema_version_number = second_schema_version_number_;
     schema_diff_type = schema_diff_type_;
   }
    : get_schema_versions_diff_input)

let make_get_schema_version_response
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_definition:(schema_definition_ : schema_definition_string option)
    ?data_format:(data_format_ : data_format option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?version_number:(version_number_ : version_long_number option)
    ?status:(status_ : schema_version_status option)
    ?created_time:(created_time_ : created_timestamp option) () =
  ({
     schema_version_id = schema_version_id_;
     schema_definition = schema_definition_;
     data_format = data_format_;
     schema_arn = schema_arn_;
     version_number = version_number_;
     status = status_;
     created_time = created_time_;
   }
    : get_schema_version_response)

let make_get_schema_version_input ?schema_id:(schema_id_ : schema_id option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_version_number:(schema_version_number_ : schema_version_number option) () =
  ({
     schema_id = schema_id_;
     schema_version_id = schema_version_id_;
     schema_version_number = schema_version_number_;
   }
    : get_schema_version_input)

let make_get_schema_by_definition_response
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?data_format:(data_format_ : data_format option)
    ?status:(status_ : schema_version_status option)
    ?created_time:(created_time_ : created_timestamp option) () =
  ({
     schema_version_id = schema_version_id_;
     schema_arn = schema_arn_;
     data_format = data_format_;
     status = status_;
     created_time = created_time_;
   }
    : get_schema_by_definition_response)

let make_get_schema_by_definition_input ~schema_id:(schema_id_ : schema_id)
    ~schema_definition:(schema_definition_ : schema_definition_string) () =
  ({ schema_id = schema_id_; schema_definition = schema_definition_ }
    : get_schema_by_definition_input)

let make_get_schema_response ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?description:(description_ : description_string option)
    ?data_format:(data_format_ : data_format option)
    ?compatibility:(compatibility_ : compatibility option)
    ?schema_checkpoint:(schema_checkpoint_ : schema_checkpoint_number option)
    ?latest_schema_version:(latest_schema_version_ : version_long_number option)
    ?next_schema_version:(next_schema_version_ : version_long_number option)
    ?schema_status:(schema_status_ : schema_status option)
    ?created_time:(created_time_ : created_timestamp option)
    ?updated_time:(updated_time_ : updated_timestamp option) () =
  ({
     registry_name = registry_name_;
     registry_arn = registry_arn_;
     schema_name = schema_name_;
     schema_arn = schema_arn_;
     description = description_;
     data_format = data_format_;
     compatibility = compatibility_;
     schema_checkpoint = schema_checkpoint_;
     latest_schema_version = latest_schema_version_;
     next_schema_version = next_schema_version_;
     schema_status = schema_status_;
     created_time = created_time_;
     updated_time = updated_time_;
   }
    : get_schema_response)

let make_get_schema_input ~schema_id:(schema_id_ : schema_id) () =
  ({ schema_id = schema_id_ } : get_schema_input)

let make_get_resource_policy_response ?policy_in_json:(policy_in_json_ : policy_json_string option)
    ?policy_hash:(policy_hash_ : hash_string option) ?create_time:(create_time_ : timestamp option)
    ?update_time:(update_time_ : timestamp option) () =
  ({
     policy_in_json = policy_in_json_;
     policy_hash = policy_hash_;
     create_time = create_time_;
     update_time = update_time_;
   }
    : get_resource_policy_response)

let make_get_resource_policy_request ?resource_arn:(resource_arn_ : glue_resource_arn option) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_glue_policy ?policy_in_json:(policy_in_json_ : policy_json_string option)
    ?policy_hash:(policy_hash_ : hash_string option) ?create_time:(create_time_ : timestamp option)
    ?update_time:(update_time_ : timestamp option) () =
  ({
     policy_in_json = policy_in_json_;
     policy_hash = policy_hash_;
     create_time = create_time_;
     update_time = update_time_;
   }
    : glue_policy)

let make_get_resource_policies_response
    ?get_resource_policies_response_list:
      (get_resource_policies_response_list_ : get_resource_policies_response_list option)
    ?next_token:(next_token_ : token option) () =
  ({
     get_resource_policies_response_list = get_resource_policies_response_list_;
     next_token = next_token_;
   }
    : get_resource_policies_response)

let make_get_resource_policies_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : get_resource_policies_request)

let make_get_registry_response ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?description:(description_ : description_string option)
    ?status:(status_ : registry_status option)
    ?created_time:(created_time_ : created_timestamp option)
    ?updated_time:(updated_time_ : updated_timestamp option) () =
  ({
     registry_name = registry_name_;
     registry_arn = registry_arn_;
     description = description_;
     status = status_;
     created_time = created_time_;
     updated_time = updated_time_;
   }
    : get_registry_response)

let make_get_registry_input ~registry_id:(registry_id_ : registry_id) () =
  ({ registry_id = registry_id_ } : get_registry_input)

let make_get_plan_response ?python_script:(python_script_ : python_script option)
    ?scala_code:(scala_code_ : scala_code option) () =
  ({ python_script = python_script_; scala_code = scala_code_ } : get_plan_response)

let make_code_gen_node_arg ?param:(param_ : boolean_ option) ~name:(name_ : code_gen_arg_name)
    ~value:(value_ : code_gen_arg_value) () =
  ({ name = name_; value = value_; param = param_ } : code_gen_node_arg)

let make_location ?jdbc:(jdbc_ : code_gen_node_args option) ?s3:(s3_ : code_gen_node_args option)
    ?dynamo_d_b:(dynamo_d_b_ : code_gen_node_args option) () =
  ({ jdbc = jdbc_; s3 = s3_; dynamo_d_b = dynamo_d_b_ } : location)

let make_catalog_entry ~database_name:(database_name_ : name_string)
    ~table_name:(table_name_ : name_string) () =
  ({ database_name = database_name_; table_name = table_name_ } : catalog_entry)

let make_mapping_entry ?source_table:(source_table_ : table_name option)
    ?source_path:(source_path_ : schema_path_string option)
    ?source_type:(source_type_ : field_type option)
    ?target_table:(target_table_ : table_name option)
    ?target_path:(target_path_ : schema_path_string option)
    ?target_type:(target_type_ : field_type option) () =
  ({
     source_table = source_table_;
     source_path = source_path_;
     source_type = source_type_;
     target_table = target_table_;
     target_path = target_path_;
     target_type = target_type_;
   }
    : mapping_entry)

let make_get_plan_request ?sinks:(sinks_ : catalog_entries option)
    ?location:(location_ : location option) ?language:(language_ : language option)
    ?additional_plan_options_map:(additional_plan_options_map_ : additional_plan_options_map option)
    ~mapping:(mapping_ : mapping_list) ~source:(source_ : catalog_entry) () =
  ({
     mapping = mapping_;
     source = source_;
     sinks = sinks_;
     location = location_;
     language = language_;
     additional_plan_options_map = additional_plan_options_map_;
   }
    : get_plan_request)

let make_get_partitions_response ?partitions:(partitions_ : partition_list option)
    ?next_token:(next_token_ : token option) () =
  ({ partitions = partitions_; next_token = next_token_ } : get_partitions_response)

let make_get_partitions_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?expression:(expression_ : predicate_string option) ?next_token:(next_token_ : token option)
    ?segment:(segment_ : segment option) ?max_results:(max_results_ : page_size option)
    ?exclude_column_schema:(exclude_column_schema_ : boolean_nullable option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?query_as_of_time:(query_as_of_time_ : timestamp option)
    ?audit_context:(audit_context_ : audit_context option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     expression = expression_;
     next_token = next_token_;
     segment = segment_;
     max_results = max_results_;
     exclude_column_schema = exclude_column_schema_;
     transaction_id = transaction_id_;
     query_as_of_time = query_as_of_time_;
     audit_context = audit_context_;
   }
    : get_partitions_request)

let make_partition_value_list ~values:(values_ : value_string_list) () =
  ({ values = values_ } : partition_value_list)

let make_backfill_error ?code:(code_ : backfill_error_code option)
    ?partitions:(partitions_ : backfill_errored_partitions_list option) () =
  ({ code = code_; partitions = partitions_ } : backfill_error)

let make_key_schema_element ~name:(name_ : name_string) ~type_:(type__ : column_type_string) () =
  ({ name = name_; type_ = type__ } : key_schema_element)

let make_partition_index_descriptor ?backfill_errors:(backfill_errors_ : backfill_errors option)
    ~index_name:(index_name_ : name_string) ~keys:(keys_ : key_schema_element_list)
    ~index_status:(index_status_ : partition_index_status) () =
  ({
     index_name = index_name_;
     keys = keys_;
     index_status = index_status_;
     backfill_errors = backfill_errors_;
   }
    : partition_index_descriptor)

let make_get_partition_indexes_response
    ?partition_index_descriptor_list:
      (partition_index_descriptor_list_ : partition_index_descriptor_list option)
    ?next_token:(next_token_ : token option) () =
  ({ partition_index_descriptor_list = partition_index_descriptor_list_; next_token = next_token_ }
    : get_partition_indexes_response)

let make_get_partition_indexes_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?next_token:(next_token_ : token option) ~database_name:(database_name_ : name_string)
    ~table_name:(table_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     next_token = next_token_;
   }
    : get_partition_indexes_request)

let make_get_partition_response ?partition:(partition_ : partition option) () =
  ({ partition = partition_ } : get_partition_response)

let make_get_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?audit_context:(audit_context_ : audit_context option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_values:(partition_values_ : value_string_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_values = partition_values_;
     audit_context = audit_context_;
   }
    : get_partition_request)

let make_ml_user_data_encryption ?kms_key_id:(kms_key_id_ : name_string option)
    ~ml_user_data_encryption_mode:
      (ml_user_data_encryption_mode_ : ml_user_data_encryption_mode_string) () =
  ({ ml_user_data_encryption_mode = ml_user_data_encryption_mode_; kms_key_id = kms_key_id_ }
    : ml_user_data_encryption)

let make_transform_encryption
    ?ml_user_data_encryption:(ml_user_data_encryption_ : ml_user_data_encryption option)
    ?task_run_security_configuration_name:
      (task_run_security_configuration_name_ : name_string option) () =
  ({
     ml_user_data_encryption = ml_user_data_encryption_;
     task_run_security_configuration_name = task_run_security_configuration_name_;
   }
    : transform_encryption)

let make_column_importance ?column_name:(column_name_ : name_string option)
    ?importance:(importance_ : generic_bounded_double option) () =
  ({ column_name = column_name_; importance = importance_ } : column_importance)

let make_confusion_matrix ?num_true_positives:(num_true_positives_ : records_count option)
    ?num_false_positives:(num_false_positives_ : records_count option)
    ?num_true_negatives:(num_true_negatives_ : records_count option)
    ?num_false_negatives:(num_false_negatives_ : records_count option) () =
  ({
     num_true_positives = num_true_positives_;
     num_false_positives = num_false_positives_;
     num_true_negatives = num_true_negatives_;
     num_false_negatives = num_false_negatives_;
   }
    : confusion_matrix)

let make_find_matches_metrics
    ?area_under_pr_curve:(area_under_pr_curve_ : generic_bounded_double option)
    ?precision:(precision_ : generic_bounded_double option)
    ?recall:(recall_ : generic_bounded_double option) ?f1:(f1_ : generic_bounded_double option)
    ?confusion_matrix:(confusion_matrix_ : confusion_matrix option)
    ?column_importances:(column_importances_ : column_importance_list option) () =
  ({
     area_under_pr_curve = area_under_pr_curve_;
     precision = precision_;
     recall = recall_;
     f1 = f1_;
     confusion_matrix = confusion_matrix_;
     column_importances = column_importances_;
   }
    : find_matches_metrics)

let make_evaluation_metrics
    ?find_matches_metrics:(find_matches_metrics_ : find_matches_metrics option)
    ~transform_type:(transform_type_ : transform_type) () =
  ({ transform_type = transform_type_; find_matches_metrics = find_matches_metrics_ }
    : evaluation_metrics)

let make_ml_transform ?transform_id:(transform_id_ : hash_string option)
    ?name:(name_ : name_string option) ?description:(description_ : description_string option)
    ?status:(status_ : transform_status_type option) ?created_on:(created_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?input_record_tables:(input_record_tables_ : glue_tables option)
    ?parameters:(parameters_ : transform_parameters option)
    ?evaluation_metrics:(evaluation_metrics_ : evaluation_metrics option)
    ?label_count:(label_count_ : label_count option) ?schema:(schema_ : transform_schema option)
    ?role:(role_ : role_string option) ?glue_version:(glue_version_ : glue_version_string option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option) ?max_retries:(max_retries_ : nullable_integer option)
    ?transform_encryption:(transform_encryption_ : transform_encryption option) () =
  ({
     transform_id = transform_id_;
     name = name_;
     description = description_;
     status = status_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
     input_record_tables = input_record_tables_;
     parameters = parameters_;
     evaluation_metrics = evaluation_metrics_;
     label_count = label_count_;
     schema = schema_;
     role = role_;
     glue_version = glue_version_;
     max_capacity = max_capacity_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     max_retries = max_retries_;
     transform_encryption = transform_encryption_;
   }
    : ml_transform)

let make_get_ml_transforms_response ?next_token:(next_token_ : pagination_token option)
    ~transforms:(transforms_ : transform_list) () =
  ({ transforms = transforms_; next_token = next_token_ } : get_ml_transforms_response)

let make_get_ml_transforms_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option)
    ?filter:(filter_ : transform_filter_criteria option)
    ?sort:(sort_ : transform_sort_criteria option) () =
  ({ next_token = next_token_; max_results = max_results_; filter = filter_; sort = sort_ }
    : get_ml_transforms_request)

let make_get_ml_transform_response ?transform_id:(transform_id_ : hash_string option)
    ?name:(name_ : name_string option) ?description:(description_ : description_string option)
    ?status:(status_ : transform_status_type option) ?created_on:(created_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?input_record_tables:(input_record_tables_ : glue_tables option)
    ?parameters:(parameters_ : transform_parameters option)
    ?evaluation_metrics:(evaluation_metrics_ : evaluation_metrics option)
    ?label_count:(label_count_ : label_count option) ?schema:(schema_ : transform_schema option)
    ?role:(role_ : role_string option) ?glue_version:(glue_version_ : glue_version_string option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option) ?max_retries:(max_retries_ : nullable_integer option)
    ?transform_encryption:(transform_encryption_ : transform_encryption option) () =
  ({
     transform_id = transform_id_;
     name = name_;
     description = description_;
     status = status_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
     input_record_tables = input_record_tables_;
     parameters = parameters_;
     evaluation_metrics = evaluation_metrics_;
     label_count = label_count_;
     schema = schema_;
     role = role_;
     glue_version = glue_version_;
     max_capacity = max_capacity_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     max_retries = max_retries_;
     transform_encryption = transform_encryption_;
   }
    : get_ml_transform_response)

let make_get_ml_transform_request ~transform_id:(transform_id_ : hash_string) () =
  ({ transform_id = transform_id_ } : get_ml_transform_request)

let make_find_matches_task_run_properties ?job_id:(job_id_ : hash_string option)
    ?job_name:(job_name_ : name_string option) ?job_run_id:(job_run_id_ : hash_string option) () =
  ({ job_id = job_id_; job_name = job_name_; job_run_id = job_run_id_ }
    : find_matches_task_run_properties)

let make_labeling_set_generation_task_run_properties
    ?output_s3_path:(output_s3_path_ : uri_string option) () =
  ({ output_s3_path = output_s3_path_ } : labeling_set_generation_task_run_properties)

let make_export_labels_task_run_properties ?output_s3_path:(output_s3_path_ : uri_string option) ()
    =
  ({ output_s3_path = output_s3_path_ } : export_labels_task_run_properties)

let make_import_labels_task_run_properties ?input_s3_path:(input_s3_path_ : uri_string option)
    ?replace:(replace_ : replace_boolean option) () =
  ({ input_s3_path = input_s3_path_; replace = replace_ } : import_labels_task_run_properties)

let make_task_run_properties ?task_type:(task_type_ : task_type option)
    ?import_labels_task_run_properties:
      (import_labels_task_run_properties_ : import_labels_task_run_properties option)
    ?export_labels_task_run_properties:
      (export_labels_task_run_properties_ : export_labels_task_run_properties option)
    ?labeling_set_generation_task_run_properties:
      (labeling_set_generation_task_run_properties_ :
         labeling_set_generation_task_run_properties option)
    ?find_matches_task_run_properties:
      (find_matches_task_run_properties_ : find_matches_task_run_properties option) () =
  ({
     task_type = task_type_;
     import_labels_task_run_properties = import_labels_task_run_properties_;
     export_labels_task_run_properties = export_labels_task_run_properties_;
     labeling_set_generation_task_run_properties = labeling_set_generation_task_run_properties_;
     find_matches_task_run_properties = find_matches_task_run_properties_;
   }
    : task_run_properties)

let make_task_run ?transform_id:(transform_id_ : hash_string option)
    ?task_run_id:(task_run_id_ : hash_string option) ?status:(status_ : task_status_type option)
    ?log_group_name:(log_group_name_ : generic_string option)
    ?properties:(properties_ : task_run_properties option)
    ?error_string:(error_string_ : generic_string option)
    ?started_on:(started_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?completed_on:(completed_on_ : timestamp option)
    ?execution_time:(execution_time_ : execution_time option) () =
  ({
     transform_id = transform_id_;
     task_run_id = task_run_id_;
     status = status_;
     log_group_name = log_group_name_;
     properties = properties_;
     error_string = error_string_;
     started_on = started_on_;
     last_modified_on = last_modified_on_;
     completed_on = completed_on_;
     execution_time = execution_time_;
   }
    : task_run)

let make_get_ml_task_runs_response ?task_runs:(task_runs_ : task_run_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ task_runs = task_runs_; next_token = next_token_ } : get_ml_task_runs_response)

let make_task_run_sort_criteria ~column:(column_ : task_run_sort_column_type)
    ~sort_direction:(sort_direction_ : sort_direction_type) () =
  ({ column = column_; sort_direction = sort_direction_ } : task_run_sort_criteria)

let make_task_run_filter_criteria ?task_run_type:(task_run_type_ : task_type option)
    ?status:(status_ : task_status_type option) ?started_before:(started_before_ : timestamp option)
    ?started_after:(started_after_ : timestamp option) () =
  ({
     task_run_type = task_run_type_;
     status = status_;
     started_before = started_before_;
     started_after = started_after_;
   }
    : task_run_filter_criteria)

let make_get_ml_task_runs_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : page_size option)
    ?filter:(filter_ : task_run_filter_criteria option)
    ?sort:(sort_ : task_run_sort_criteria option) ~transform_id:(transform_id_ : hash_string) () =
  ({
     transform_id = transform_id_;
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
     sort = sort_;
   }
    : get_ml_task_runs_request)

let make_get_ml_task_run_response ?transform_id:(transform_id_ : hash_string option)
    ?task_run_id:(task_run_id_ : hash_string option) ?status:(status_ : task_status_type option)
    ?log_group_name:(log_group_name_ : generic_string option)
    ?properties:(properties_ : task_run_properties option)
    ?error_string:(error_string_ : generic_string option)
    ?started_on:(started_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?completed_on:(completed_on_ : timestamp option)
    ?execution_time:(execution_time_ : execution_time option) () =
  ({
     transform_id = transform_id_;
     task_run_id = task_run_id_;
     status = status_;
     log_group_name = log_group_name_;
     properties = properties_;
     error_string = error_string_;
     started_on = started_on_;
     last_modified_on = last_modified_on_;
     completed_on = completed_on_;
     execution_time = execution_time_;
   }
    : get_ml_task_run_response)

let make_get_ml_task_run_request ~transform_id:(transform_id_ : hash_string)
    ~task_run_id:(task_run_id_ : hash_string) () =
  ({ transform_id = transform_id_; task_run_id = task_run_id_ } : get_ml_task_run_request)

let make_get_materialized_view_refresh_task_run_response
    ?materialized_view_refresh_task_run:
      (materialized_view_refresh_task_run_ : materialized_view_refresh_task_run option) () =
  ({ materialized_view_refresh_task_run = materialized_view_refresh_task_run_ }
    : get_materialized_view_refresh_task_run_response)

let make_get_materialized_view_refresh_task_run_request ~catalog_id:(catalog_id_ : name_string)
    ~materialized_view_refresh_task_run_id:(materialized_view_refresh_task_run_id_ : uui_dv4) () =
  ({
     catalog_id = catalog_id_;
     materialized_view_refresh_task_run_id = materialized_view_refresh_task_run_id_;
   }
    : get_materialized_view_refresh_task_run_request)

let make_get_mapping_response ~mapping:(mapping_ : mapping_list) () =
  ({ mapping = mapping_ } : get_mapping_response)

let make_get_mapping_request ?sinks:(sinks_ : catalog_entries option)
    ?location:(location_ : location option) ~source:(source_ : catalog_entry) () =
  ({ source = source_; sinks = sinks_; location = location_ } : get_mapping_request)

let make_job ?name:(name_ : name_string option) ?job_mode:(job_mode_ : job_mode option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?description:(description_ : description_string option) ?log_uri:(log_uri_ : uri_string option)
    ?role:(role_ : role_string option) ?created_on:(created_on_ : timestamp_value option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?execution_property:(execution_property_ : execution_property option)
    ?command:(command_ : job_command option)
    ?default_arguments:(default_arguments_ : generic_map option)
    ?non_overridable_arguments:(non_overridable_arguments_ : generic_map option)
    ?connections:(connections_ : connections_list option)
    ?max_retries:(max_retries_ : max_retries option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?timeout:(timeout_ : timeout option) ?max_capacity:(max_capacity_ : nullable_double option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?notification_property:(notification_property_ : notification_property option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?code_gen_configuration_nodes:
      (code_gen_configuration_nodes_ : code_gen_configuration_nodes option)
    ?execution_class:(execution_class_ : execution_class option)
    ?source_control_details:(source_control_details_ : source_control_details option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ?profile_name:(profile_name_ : name_string option) () =
  ({
     name = name_;
     job_mode = job_mode_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     description = description_;
     log_uri = log_uri_;
     role = role_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
     execution_property = execution_property_;
     command = command_;
     default_arguments = default_arguments_;
     non_overridable_arguments = non_overridable_arguments_;
     connections = connections_;
     max_retries = max_retries_;
     allocated_capacity = allocated_capacity_;
     timeout = timeout_;
     max_capacity = max_capacity_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     security_configuration = security_configuration_;
     notification_property = notification_property_;
     glue_version = glue_version_;
     code_gen_configuration_nodes = code_gen_configuration_nodes_;
     execution_class = execution_class_;
     source_control_details = source_control_details_;
     maintenance_window = maintenance_window_;
     profile_name = profile_name_;
   }
    : job)

let make_get_jobs_response ?jobs:(jobs_ : job_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ jobs = jobs_; next_token = next_token_ } : get_jobs_response)

let make_get_jobs_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : page_size option) () =
  ({ next_token = next_token_; max_results = max_results_ } : get_jobs_request)

let make_get_job_runs_response ?job_runs:(job_runs_ : job_run_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ job_runs = job_runs_; next_token = next_token_ } : get_job_runs_response)

let make_get_job_runs_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : orchestration_page_size200 option)
    ~job_name:(job_name_ : name_string) () =
  ({ job_name = job_name_; next_token = next_token_; max_results = max_results_ }
    : get_job_runs_request)

let make_get_job_run_response ?job_run:(job_run_ : job_run option) () =
  ({ job_run = job_run_ } : get_job_run_response)

let make_get_job_run_request ?predecessors_included:(predecessors_included_ : boolean_value option)
    ~job_name:(job_name_ : name_string) ~run_id:(run_id_ : id_string) () =
  ({ job_name = job_name_; run_id = run_id_; predecessors_included = predecessors_included_ }
    : get_job_run_request)

let make_get_job_bookmark_response
    ?job_bookmark_entry:(job_bookmark_entry_ : job_bookmark_entry option) () =
  ({ job_bookmark_entry = job_bookmark_entry_ } : get_job_bookmark_response)

let make_get_job_bookmark_request ?run_id:(run_id_ : run_id option) ~job_name:(job_name_ : job_name)
    () =
  ({ job_name = job_name_; run_id = run_id_ } : get_job_bookmark_request)

let make_get_job_response ?job:(job_ : job option) () = ({ job = job_ } : get_job_response)

let make_get_job_request ~job_name:(job_name_ : name_string) () =
  ({ job_name = job_name_ } : get_job_request)

let make_get_integration_table_properties_response ?resource_arn:(resource_arn_ : string512 option)
    ?table_name:(table_name_ : string128 option)
    ?source_table_config:(source_table_config_ : source_table_config option)
    ?target_table_config:(target_table_config_ : target_table_config option) () =
  ({
     resource_arn = resource_arn_;
     table_name = table_name_;
     source_table_config = source_table_config_;
     target_table_config = target_table_config_;
   }
    : get_integration_table_properties_response)

let make_get_integration_table_properties_request ~resource_arn:(resource_arn_ : string512)
    ~table_name:(table_name_ : string128) () =
  ({ resource_arn = resource_arn_; table_name = table_name_ }
    : get_integration_table_properties_request)

let make_get_integration_resource_property_response ?resource_arn:(resource_arn_ : string512 option)
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option) () =
  ({
     resource_arn = resource_arn_;
     resource_property_arn = resource_property_arn_;
     source_processing_properties = source_processing_properties_;
     target_processing_properties = target_processing_properties_;
   }
    : get_integration_resource_property_response)

let make_get_integration_resource_property_request ~resource_arn:(resource_arn_ : string512) () =
  ({ resource_arn = resource_arn_ } : get_integration_resource_property_request)

let make_get_glue_identity_center_configuration_response
    ?application_arn:(application_arn_ : application_arn option)
    ?instance_arn:(instance_arn_ : identity_center_instance_arn option)
    ?scopes:(scopes_ : orchestration_string_list option)
    ?user_background_sessions_enabled:(user_background_sessions_enabled_ : nullable_boolean option)
    () =
  ({
     application_arn = application_arn_;
     instance_arn = instance_arn_;
     scopes = scopes_;
     user_background_sessions_enabled = user_background_sessions_enabled_;
   }
    : get_glue_identity_center_configuration_response)

let make_get_glue_identity_center_configuration_request () = (() : unit)

let make_get_glossary_term_response ?id:(id_ : glossary_term_id option)
    ?glossary_id:(glossary_id_ : glossary_id option) ?name:(name_ : glossary_term_name option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?long_description:(long_description_ : glossary_long_description option) () =
  ({
     id = id_;
     glossary_id = glossary_id_;
     name = name_;
     short_description = short_description_;
     long_description = long_description_;
   }
    : get_glossary_term_response)

let make_get_glossary_term_request ~identifier:(identifier_ : glossary_term_id) () =
  ({ identifier = identifier_ } : get_glossary_term_request)

let make_get_glossary_response ?id:(id_ : glossary_id option) ?name:(name_ : glossary_name option)
    ?description:(description_ : metadata_description option) () =
  ({ id = id_; name = name_; description = description_ } : get_glossary_response)

let make_get_glossary_request ~identifier:(identifier_ : glossary_id) () =
  ({ identifier = identifier_ } : get_glossary_request)

let make_get_form_type_response ?id:(id_ : form_type_id option)
    ?name:(name_ : form_type_name option) ?schema:(schema_ : form_type_schema option) () =
  ({ id = id_; name = name_; schema = schema_ } : get_form_type_response)

let make_get_form_type_request ~identifier:(identifier_ : form_type_id) () =
  ({ identifier = identifier_ } : get_form_type_request)

let make_get_entity_records_response ?records:(records_ : records option)
    ?next_token:(next_token_ : next_token option) () =
  ({ records = records_; next_token = next_token_ } : get_entity_records_response)

let make_get_entity_records_request ?connection_name:(connection_name_ : name_string option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?next_token:(next_token_ : next_token option)
    ?data_store_api_version:(data_store_api_version_ : api_version option)
    ?connection_options:(connection_options_ : connection_options option)
    ?filter_predicate:(filter_predicate_ : filter_predicate option)
    ?order_by:(order_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?selected_fields:(selected_fields_ : selected_fields option)
    ~entity_name:(entity_name_ : entity_name) ~limit:(limit_ : limit) () =
  ({
     connection_name = connection_name_;
     catalog_id = catalog_id_;
     entity_name = entity_name_;
     next_token = next_token_;
     data_store_api_version = data_store_api_version_;
     connection_options = connection_options_;
     filter_predicate = filter_predicate_;
     limit = limit_;
     order_by = order_by_;
     selected_fields = selected_fields_;
   }
    : get_entity_records_request)

let make_dev_endpoint ?endpoint_name:(endpoint_name_ : generic_string option)
    ?role_arn:(role_arn_ : role_arn option)
    ?security_group_ids:(security_group_ids_ : string_list option)
    ?subnet_id:(subnet_id_ : generic_string option)
    ?yarn_endpoint_address:(yarn_endpoint_address_ : generic_string option)
    ?private_address:(private_address_ : generic_string option)
    ?zeppelin_remote_spark_interpreter_port:
      (zeppelin_remote_spark_interpreter_port_ : integer_value option)
    ?public_address:(public_address_ : generic_string option)
    ?status:(status_ : generic_string option) ?worker_type:(worker_type_ : worker_type option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?number_of_nodes:(number_of_nodes_ : integer_value option)
    ?availability_zone:(availability_zone_ : generic_string option)
    ?vpc_id:(vpc_id_ : generic_string option)
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option)
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option)
    ?failure_reason:(failure_reason_ : generic_string option)
    ?last_update_status:(last_update_status_ : generic_string option)
    ?created_timestamp:(created_timestamp_ : timestamp_value option)
    ?last_modified_timestamp:(last_modified_timestamp_ : timestamp_value option)
    ?public_key:(public_key_ : generic_string option)
    ?public_keys:(public_keys_ : public_keys_list option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?arguments:(arguments_ : map_value option) () =
  ({
     endpoint_name = endpoint_name_;
     role_arn = role_arn_;
     security_group_ids = security_group_ids_;
     subnet_id = subnet_id_;
     yarn_endpoint_address = yarn_endpoint_address_;
     private_address = private_address_;
     zeppelin_remote_spark_interpreter_port = zeppelin_remote_spark_interpreter_port_;
     public_address = public_address_;
     status = status_;
     worker_type = worker_type_;
     glue_version = glue_version_;
     number_of_workers = number_of_workers_;
     number_of_nodes = number_of_nodes_;
     availability_zone = availability_zone_;
     vpc_id = vpc_id_;
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
     extra_jars_s3_path = extra_jars_s3_path_;
     failure_reason = failure_reason_;
     last_update_status = last_update_status_;
     created_timestamp = created_timestamp_;
     last_modified_timestamp = last_modified_timestamp_;
     public_key = public_key_;
     public_keys = public_keys_;
     security_configuration = security_configuration_;
     arguments = arguments_;
   }
    : dev_endpoint)

let make_get_dev_endpoints_response ?dev_endpoints:(dev_endpoints_ : dev_endpoint_list option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ dev_endpoints = dev_endpoints_; next_token = next_token_ } : get_dev_endpoints_response)

let make_get_dev_endpoints_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : get_dev_endpoints_request)

let make_get_dev_endpoint_response ?dev_endpoint:(dev_endpoint_ : dev_endpoint option) () =
  ({ dev_endpoint = dev_endpoint_ } : get_dev_endpoint_response)

let make_get_dev_endpoint_request ~endpoint_name:(endpoint_name_ : generic_string) () =
  ({ endpoint_name = endpoint_name_ } : get_dev_endpoint_request)

let make_get_data_quality_ruleset_evaluation_run_response ?run_id:(run_id_ : hash_string option)
    ?data_source:(data_source_ : data_source option) ?role:(role_ : role_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option)
    ?additional_run_options:
      (additional_run_options_ : data_quality_evaluation_run_additional_run_options option)
    ?status:(status_ : task_status_type option)
    ?error_string:(error_string_ : generic_string option)
    ?started_on:(started_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?completed_on:(completed_on_ : timestamp option)
    ?execution_time:(execution_time_ : execution_time option)
    ?ruleset_names:(ruleset_names_ : ruleset_names option)
    ?result_ids:(result_ids_ : data_quality_result_id_list option)
    ?additional_data_sources:(additional_data_sources_ : data_source_map option) () =
  ({
     run_id = run_id_;
     data_source = data_source_;
     role = role_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     additional_run_options = additional_run_options_;
     status = status_;
     error_string = error_string_;
     started_on = started_on_;
     last_modified_on = last_modified_on_;
     completed_on = completed_on_;
     execution_time = execution_time_;
     ruleset_names = ruleset_names_;
     result_ids = result_ids_;
     additional_data_sources = additional_data_sources_;
   }
    : get_data_quality_ruleset_evaluation_run_response)

let make_get_data_quality_ruleset_evaluation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : get_data_quality_ruleset_evaluation_run_request)

let make_get_data_quality_ruleset_response ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?ruleset:(ruleset_ : data_quality_ruleset_string option)
    ?target_table:(target_table_ : data_quality_target_table option)
    ?created_on:(created_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?recommendation_run_id:(recommendation_run_id_ : hash_string option)
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    () =
  ({
     name = name_;
     description = description_;
     ruleset = ruleset_;
     target_table = target_table_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
     recommendation_run_id = recommendation_run_id_;
     data_quality_security_configuration = data_quality_security_configuration_;
   }
    : get_data_quality_ruleset_response)

let make_get_data_quality_ruleset_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_data_quality_ruleset_request)

let make_get_data_quality_rule_recommendation_run_response ?run_id:(run_id_ : hash_string option)
    ?data_source:(data_source_ : data_source option) ?role:(role_ : role_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option) ?status:(status_ : task_status_type option)
    ?error_string:(error_string_ : generic_string option)
    ?started_on:(started_on_ : timestamp option)
    ?last_modified_on:(last_modified_on_ : timestamp option)
    ?completed_on:(completed_on_ : timestamp option)
    ?execution_time:(execution_time_ : execution_time option)
    ?recommended_ruleset:(recommended_ruleset_ : data_quality_ruleset_string option)
    ?created_ruleset_name:(created_ruleset_name_ : name_string option)
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    () =
  ({
     run_id = run_id_;
     data_source = data_source_;
     role = role_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     status = status_;
     error_string = error_string_;
     started_on = started_on_;
     last_modified_on = last_modified_on_;
     completed_on = completed_on_;
     execution_time = execution_time_;
     recommended_ruleset = recommended_ruleset_;
     created_ruleset_name = created_ruleset_name_;
     data_quality_security_configuration = data_quality_security_configuration_;
   }
    : get_data_quality_rule_recommendation_run_response)

let make_get_data_quality_rule_recommendation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : get_data_quality_rule_recommendation_run_request)

let make_data_quality_aggregated_metrics
    ?total_rows_processed:(total_rows_processed_ : nullable_double option)
    ?total_rows_passed:(total_rows_passed_ : nullable_double option)
    ?total_rows_failed:(total_rows_failed_ : nullable_double option)
    ?total_rules_processed:(total_rules_processed_ : nullable_double option)
    ?total_rules_passed:(total_rules_passed_ : nullable_double option)
    ?total_rules_failed:(total_rules_failed_ : nullable_double option) () =
  ({
     total_rows_processed = total_rows_processed_;
     total_rows_passed = total_rows_passed_;
     total_rows_failed = total_rows_failed_;
     total_rules_processed = total_rules_processed_;
     total_rules_passed = total_rules_passed_;
     total_rules_failed = total_rules_failed_;
   }
    : data_quality_aggregated_metrics)

let make_data_quality_metric_values ?actual_value:(actual_value_ : nullable_double option)
    ?expected_value:(expected_value_ : nullable_double option)
    ?lower_limit:(lower_limit_ : nullable_double option)
    ?upper_limit:(upper_limit_ : nullable_double option) () =
  ({
     actual_value = actual_value_;
     expected_value = expected_value_;
     lower_limit = lower_limit_;
     upper_limit = upper_limit_;
   }
    : data_quality_metric_values)

let make_metric_based_observation ?metric_name:(metric_name_ : name_string option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?metric_values:(metric_values_ : data_quality_metric_values option)
    ?new_rules:(new_rules_ : new_rules option) () =
  ({
     metric_name = metric_name_;
     statistic_id = statistic_id_;
     metric_values = metric_values_;
     new_rules = new_rules_;
   }
    : metric_based_observation)

let make_data_quality_observation
    ?description:(description_ : data_quality_observation_description option)
    ?metric_based_observation:(metric_based_observation_ : metric_based_observation option) () =
  ({ description = description_; metric_based_observation = metric_based_observation_ }
    : data_quality_observation)

let make_get_data_quality_result_response ?result_id:(result_id_ : hash_string option)
    ?profile_id:(profile_id_ : hash_string option) ?score:(score_ : generic_bounded_double option)
    ?data_source:(data_source_ : data_source option)
    ?ruleset_name:(ruleset_name_ : name_string option)
    ?evaluation_context:(evaluation_context_ : generic_string option)
    ?started_on:(started_on_ : timestamp option) ?completed_on:(completed_on_ : timestamp option)
    ?job_name:(job_name_ : name_string option) ?job_run_id:(job_run_id_ : hash_string option)
    ?ruleset_evaluation_run_id:(ruleset_evaluation_run_id_ : hash_string option)
    ?rule_results:(rule_results_ : data_quality_rule_results option)
    ?analyzer_results:(analyzer_results_ : data_quality_analyzer_results option)
    ?observations:(observations_ : data_quality_observations option)
    ?aggregated_metrics:(aggregated_metrics_ : data_quality_aggregated_metrics option) () =
  ({
     result_id = result_id_;
     profile_id = profile_id_;
     score = score_;
     data_source = data_source_;
     ruleset_name = ruleset_name_;
     evaluation_context = evaluation_context_;
     started_on = started_on_;
     completed_on = completed_on_;
     job_name = job_name_;
     job_run_id = job_run_id_;
     ruleset_evaluation_run_id = ruleset_evaluation_run_id_;
     rule_results = rule_results_;
     analyzer_results = analyzer_results_;
     observations = observations_;
     aggregated_metrics = aggregated_metrics_;
   }
    : get_data_quality_result_response)

let make_get_data_quality_result_request ~result_id:(result_id_ : hash_string) () =
  ({ result_id = result_id_ } : get_data_quality_result_request)

let make_get_data_quality_model_result_response ?completed_on:(completed_on_ : timestamp option)
    ?model:(model_ : statistic_model_results option) () =
  ({ completed_on = completed_on_; model = model_ } : get_data_quality_model_result_response)

let make_get_data_quality_model_result_request ~statistic_id:(statistic_id_ : hash_string)
    ~profile_id:(profile_id_ : hash_string) () =
  ({ statistic_id = statistic_id_; profile_id = profile_id_ }
    : get_data_quality_model_result_request)

let make_get_data_quality_model_response ?status:(status_ : data_quality_model_status option)
    ?started_on:(started_on_ : timestamp option) ?completed_on:(completed_on_ : timestamp option)
    ?failure_reason:(failure_reason_ : hash_string option) () =
  ({
     status = status_;
     started_on = started_on_;
     completed_on = completed_on_;
     failure_reason = failure_reason_;
   }
    : get_data_quality_model_response)

let make_get_data_quality_model_request ?statistic_id:(statistic_id_ : hash_string option)
    ~profile_id:(profile_id_ : hash_string) () =
  ({ statistic_id = statistic_id_; profile_id = profile_id_ } : get_data_quality_model_request)

let make_code_gen_edge ?target_parameter:(target_parameter_ : code_gen_arg_name option)
    ~source:(source_ : code_gen_identifier) ~target:(target_ : code_gen_identifier) () =
  ({ source = source_; target = target_; target_parameter = target_parameter_ } : code_gen_edge)

let make_code_gen_node ?line_number:(line_number_ : integer option) ~id:(id_ : code_gen_identifier)
    ~node_type:(node_type_ : code_gen_node_type) ~args:(args_ : code_gen_node_args) () =
  ({ id = id_; node_type = node_type_; args = args_; line_number = line_number_ } : code_gen_node)

let make_get_dataflow_graph_response ?dag_nodes:(dag_nodes_ : dag_nodes option)
    ?dag_edges:(dag_edges_ : dag_edges option) () =
  ({ dag_nodes = dag_nodes_; dag_edges = dag_edges_ } : get_dataflow_graph_response)

let make_get_dataflow_graph_request ?python_script:(python_script_ : python_script option) () =
  ({ python_script = python_script_ } : get_dataflow_graph_request)

let make_get_data_catalog_encryption_settings_response
    ?data_catalog_encryption_settings:
      (data_catalog_encryption_settings_ : data_catalog_encryption_settings option) () =
  ({ data_catalog_encryption_settings = data_catalog_encryption_settings_ }
    : get_data_catalog_encryption_settings_response)

let make_get_data_catalog_encryption_settings_request
    ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ catalog_id = catalog_id_ } : get_data_catalog_encryption_settings_request)

let make_database ?description:(description_ : description_string option)
    ?location_uri:(location_uri_ : ur_i option) ?parameters:(parameters_ : parameters_map option)
    ?create_time:(create_time_ : timestamp option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?target_database:(target_database_ : database_identifier option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?federated_database:(federated_database_ : federated_database option)
    ~name:(name_ : name_string) () =
  ({
     name = name_;
     description = description_;
     location_uri = location_uri_;
     parameters = parameters_;
     create_time = create_time_;
     create_table_default_permissions = create_table_default_permissions_;
     target_database = target_database_;
     catalog_id = catalog_id_;
     federated_database = federated_database_;
   }
    : database)

let make_get_databases_response ?next_token:(next_token_ : token option)
    ~database_list:(database_list_ : database_list) () =
  ({ database_list = database_list_; next_token = next_token_ } : get_databases_response)

let make_get_databases_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : catalog_getter_page_size option)
    ?resource_share_type:(resource_share_type_ : resource_share_type option)
    ?attributes_to_get:(attributes_to_get_ : database_attributes_list option) () =
  ({
     catalog_id = catalog_id_;
     next_token = next_token_;
     max_results = max_results_;
     resource_share_type = resource_share_type_;
     attributes_to_get = attributes_to_get_;
   }
    : get_databases_request)

let make_get_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : get_database_response)

let make_get_database_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~name:(name_ : name_string) () =
  ({ catalog_id = catalog_id_; name = name_ } : get_database_request)

let make_get_dashboard_url_response ~url:(url_ : sensitive_url) () =
  ({ url = url_ } : get_dashboard_url_response)

let make_get_dashboard_url_request
    ?request_origin:(request_origin_ : orchestration_name_string option)
    ~resource_id:(resource_id_ : name_string) ~resource_type:(resource_type_ : glue_resource_type)
    () =
  ({ resource_id = resource_id_; resource_type = resource_type_; request_origin = request_origin_ }
    : get_dashboard_url_request)

let make_get_custom_entity_type_response ?name:(name_ : name_string option)
    ?regex_string:(regex_string_ : name_string option)
    ?context_words:(context_words_ : context_words option) () =
  ({ name = name_; regex_string = regex_string_; context_words = context_words_ }
    : get_custom_entity_type_response)

let make_get_custom_entity_type_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_custom_entity_type_request)

let make_last_crawl_info ?status:(status_ : last_crawl_status option)
    ?error_message:(error_message_ : description_string option)
    ?log_group:(log_group_ : log_group option) ?log_stream:(log_stream_ : log_stream option)
    ?message_prefix:(message_prefix_ : message_prefix option)
    ?start_time:(start_time_ : timestamp option) () =
  ({
     status = status_;
     error_message = error_message_;
     log_group = log_group_;
     log_stream = log_stream_;
     message_prefix = message_prefix_;
     start_time = start_time_;
   }
    : last_crawl_info)

let make_schedule ?schedule_expression:(schedule_expression_ : cron_expression option)
    ?state:(state_ : schedule_state option) () =
  ({ schedule_expression = schedule_expression_; state = state_ } : schedule)

let make_crawler ?name:(name_ : name_string option) ?role:(role_ : role option)
    ?targets:(targets_ : crawler_targets option)
    ?database_name:(database_name_ : database_name option)
    ?description:(description_ : description_string option)
    ?classifiers:(classifiers_ : classifier_name_list option)
    ?recrawl_policy:(recrawl_policy_ : recrawl_policy option)
    ?schema_change_policy:(schema_change_policy_ : schema_change_policy option)
    ?lineage_configuration:(lineage_configuration_ : lineage_configuration option)
    ?state:(state_ : crawler_state option) ?table_prefix:(table_prefix_ : table_prefix option)
    ?schedule:(schedule_ : schedule option)
    ?crawl_elapsed_time:(crawl_elapsed_time_ : milliseconds_count option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option)
    ?last_crawl:(last_crawl_ : last_crawl_info option) ?version:(version_ : version_id option)
    ?configuration:(configuration_ : crawler_configuration option)
    ?crawler_security_configuration:
      (crawler_security_configuration_ : crawler_security_configuration option)
    ?lake_formation_configuration:
      (lake_formation_configuration_ : lake_formation_configuration option) () =
  ({
     name = name_;
     role = role_;
     targets = targets_;
     database_name = database_name_;
     description = description_;
     classifiers = classifiers_;
     recrawl_policy = recrawl_policy_;
     schema_change_policy = schema_change_policy_;
     lineage_configuration = lineage_configuration_;
     state = state_;
     table_prefix = table_prefix_;
     schedule = schedule_;
     crawl_elapsed_time = crawl_elapsed_time_;
     creation_time = creation_time_;
     last_updated = last_updated_;
     last_crawl = last_crawl_;
     version = version_;
     configuration = configuration_;
     crawler_security_configuration = crawler_security_configuration_;
     lake_formation_configuration = lake_formation_configuration_;
   }
    : crawler)

let make_get_crawlers_response ?crawlers:(crawlers_ : crawler_list option)
    ?next_token:(next_token_ : token option) () =
  ({ crawlers = crawlers_; next_token = next_token_ } : get_crawlers_response)

let make_get_crawlers_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : get_crawlers_request)

let make_crawler_metrics ?crawler_name:(crawler_name_ : name_string option)
    ?time_left_seconds:(time_left_seconds_ : non_negative_double option)
    ?still_estimating:(still_estimating_ : boolean_ option)
    ?last_runtime_seconds:(last_runtime_seconds_ : non_negative_double option)
    ?median_runtime_seconds:(median_runtime_seconds_ : non_negative_double option)
    ?tables_created:(tables_created_ : non_negative_integer option)
    ?tables_updated:(tables_updated_ : non_negative_integer option)
    ?tables_deleted:(tables_deleted_ : non_negative_integer option) () =
  ({
     crawler_name = crawler_name_;
     time_left_seconds = time_left_seconds_;
     still_estimating = still_estimating_;
     last_runtime_seconds = last_runtime_seconds_;
     median_runtime_seconds = median_runtime_seconds_;
     tables_created = tables_created_;
     tables_updated = tables_updated_;
     tables_deleted = tables_deleted_;
   }
    : crawler_metrics)

let make_get_crawler_metrics_response
    ?crawler_metrics_list:(crawler_metrics_list_ : crawler_metrics_list option)
    ?next_token:(next_token_ : token option) () =
  ({ crawler_metrics_list = crawler_metrics_list_; next_token = next_token_ }
    : get_crawler_metrics_response)

let make_get_crawler_metrics_request
    ?crawler_name_list:(crawler_name_list_ : crawler_name_list option)
    ?max_results:(max_results_ : page_size option) ?next_token:(next_token_ : token option) () =
  ({ crawler_name_list = crawler_name_list_; max_results = max_results_; next_token = next_token_ }
    : get_crawler_metrics_request)

let make_get_crawler_response ?crawler:(crawler_ : crawler option) () =
  ({ crawler = crawler_ } : get_crawler_response)

let make_get_crawler_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_crawler_request)

let make_o_auth2_properties ?o_auth2_grant_type:(o_auth2_grant_type_ : o_auth2_grant_type option)
    ?o_auth2_client_application:(o_auth2_client_application_ : o_auth2_client_application option)
    ?token_url:(token_url_ : token_url option)
    ?token_url_parameters_map:(token_url_parameters_map_ : token_url_parameters_map option) () =
  ({
     o_auth2_grant_type = o_auth2_grant_type_;
     o_auth2_client_application = o_auth2_client_application_;
     token_url = token_url_;
     token_url_parameters_map = token_url_parameters_map_;
   }
    : o_auth2_properties)

let make_authentication_configuration
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?secret_arn:(secret_arn_ : secret_arn option) ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?o_auth2_properties:(o_auth2_properties_ : o_auth2_properties option) () =
  ({
     authentication_type = authentication_type_;
     secret_arn = secret_arn_;
     kms_key_arn = kms_key_arn_;
     o_auth2_properties = o_auth2_properties_;
   }
    : authentication_configuration)

let make_connection ?name:(name_ : name_string option)
    ?description:(description_ : description_string option)
    ?connection_type:(connection_type_ : connection_type option)
    ?match_criteria:(match_criteria_ : match_criteria option)
    ?connection_properties:(connection_properties_ : connection_properties option)
    ?spark_properties:(spark_properties_ : property_map option)
    ?athena_properties:(athena_properties_ : property_map option)
    ?python_properties:(python_properties_ : property_map option)
    ?physical_connection_requirements:
      (physical_connection_requirements_ : physical_connection_requirements option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?last_updated_by:(last_updated_by_ : name_string option)
    ?status:(status_ : connection_status option)
    ?status_reason:(status_reason_ : long_value_string option)
    ?last_connection_validation_time:(last_connection_validation_time_ : timestamp option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration option)
    ?connection_schema_version:(connection_schema_version_ : connection_schema_version option)
    ?compatible_compute_environments:
      (compatible_compute_environments_ : compute_environment_list option) () =
  ({
     name = name_;
     description = description_;
     connection_type = connection_type_;
     match_criteria = match_criteria_;
     connection_properties = connection_properties_;
     spark_properties = spark_properties_;
     athena_properties = athena_properties_;
     python_properties = python_properties_;
     physical_connection_requirements = physical_connection_requirements_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     last_updated_by = last_updated_by_;
     status = status_;
     status_reason = status_reason_;
     last_connection_validation_time = last_connection_validation_time_;
     authentication_configuration = authentication_configuration_;
     connection_schema_version = connection_schema_version_;
     compatible_compute_environments = compatible_compute_environments_;
   }
    : connection)

let make_get_connections_response ?connection_list:(connection_list_ : connection_list option)
    ?next_token:(next_token_ : token option) () =
  ({ connection_list = connection_list_; next_token = next_token_ } : get_connections_response)

let make_get_connections_filter ?match_criteria:(match_criteria_ : match_criteria option)
    ?connection_type:(connection_type_ : connection_type option)
    ?connection_schema_version:(connection_schema_version_ : connection_schema_version option) () =
  ({
     match_criteria = match_criteria_;
     connection_type = connection_type_;
     connection_schema_version = connection_schema_version_;
   }
    : get_connections_filter)

let make_get_connections_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?filter:(filter_ : get_connections_filter option)
    ?hide_password:(hide_password_ : boolean_ option) ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : page_size option) () =
  ({
     catalog_id = catalog_id_;
     filter = filter_;
     hide_password = hide_password_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_connections_request)

let make_get_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : get_connection_response)

let make_get_connection_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?hide_password:(hide_password_ : boolean_ option)
    ?apply_override_for_compute_environment:
      (apply_override_for_compute_environment_ : compute_environment option)
    ~name:(name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     name = name_;
     hide_password = hide_password_;
     apply_override_for_compute_environment = apply_override_for_compute_environment_;
   }
    : get_connection_request)

let make_execution_attempt ?status:(status_ : execution_status option)
    ?column_statistics_task_run_id:(column_statistics_task_run_id_ : hash_string option)
    ?execution_timestamp:(execution_timestamp_ : timestamp option)
    ?error_message:(error_message_ : description_string option) () =
  ({
     status = status_;
     column_statistics_task_run_id = column_statistics_task_run_id_;
     execution_timestamp = execution_timestamp_;
     error_message = error_message_;
   }
    : execution_attempt)

let make_column_statistics_task_settings ?database_name:(database_name_ : database_name option)
    ?table_name:(table_name_ : table_name option) ?schedule:(schedule_ : schedule option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?catalog_i_d:(catalog_i_d_ : catalog_id_string option) ?role:(role_ : role option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?security_configuration:(security_configuration_ : crawler_security_configuration option)
    ?schedule_type:(schedule_type_ : schedule_type option)
    ?setting_source:(setting_source_ : setting_source option)
    ?last_execution_attempt:(last_execution_attempt_ : execution_attempt option) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     schedule = schedule_;
     column_name_list = column_name_list_;
     catalog_i_d = catalog_i_d_;
     role = role_;
     sample_size = sample_size_;
     security_configuration = security_configuration_;
     schedule_type = schedule_type_;
     setting_source = setting_source_;
     last_execution_attempt = last_execution_attempt_;
   }
    : column_statistics_task_settings)

let make_get_column_statistics_task_settings_response
    ?column_statistics_task_settings:
      (column_statistics_task_settings_ : column_statistics_task_settings option) () =
  ({ column_statistics_task_settings = column_statistics_task_settings_ }
    : get_column_statistics_task_settings_response)

let make_get_column_statistics_task_settings_request ~database_name:(database_name_ : name_string)
    ~table_name:(table_name_ : name_string) () =
  ({ database_name = database_name_; table_name = table_name_ }
    : get_column_statistics_task_settings_request)

let make_column_statistics_task_run ?customer_id:(customer_id_ : account_id option)
    ?column_statistics_task_run_id:(column_statistics_task_run_id_ : hash_string option)
    ?database_name:(database_name_ : database_name option)
    ?table_name:(table_name_ : table_name option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?catalog_i_d:(catalog_i_d_ : catalog_id_string option) ?role:(role_ : role option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?security_configuration:(security_configuration_ : crawler_security_configuration option)
    ?number_of_workers:(number_of_workers_ : positive_integer option)
    ?worker_type:(worker_type_ : name_string option)
    ?computation_type:(computation_type_ : computation_type option)
    ?status:(status_ : column_statistics_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?error_message:(error_message_ : description_string option)
    ?dpu_seconds:(dpu_seconds_ : non_negative_double option) () =
  ({
     customer_id = customer_id_;
     column_statistics_task_run_id = column_statistics_task_run_id_;
     database_name = database_name_;
     table_name = table_name_;
     column_name_list = column_name_list_;
     catalog_i_d = catalog_i_d_;
     role = role_;
     sample_size = sample_size_;
     security_configuration = security_configuration_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     computation_type = computation_type_;
     status = status_;
     creation_time = creation_time_;
     last_updated = last_updated_;
     start_time = start_time_;
     end_time = end_time_;
     error_message = error_message_;
     dpu_seconds = dpu_seconds_;
   }
    : column_statistics_task_run)

let make_get_column_statistics_task_runs_response
    ?column_statistics_task_runs:
      (column_statistics_task_runs_ : column_statistics_task_runs_list option)
    ?next_token:(next_token_ : token option) () =
  ({ column_statistics_task_runs = column_statistics_task_runs_; next_token = next_token_ }
    : get_column_statistics_task_runs_response)

let make_get_column_statistics_task_runs_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) ~database_name:(database_name_ : database_name)
    ~table_name:(table_name_ : name_string) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     max_results = max_results_;
     next_token = next_token_;
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

let make_column_error ?column_name:(column_name_ : name_string option)
    ?error:(error_ : error_detail option) () =
  ({ column_name = column_name_; error = error_ } : column_error)

let make_get_column_statistics_for_table_response
    ?column_statistics_list:(column_statistics_list_ : column_statistics_list option)
    ?errors:(errors_ : column_errors option) () =
  ({ column_statistics_list = column_statistics_list_; errors = errors_ }
    : get_column_statistics_for_table_response)

let make_get_column_statistics_for_table_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~column_names:(column_names_ : get_column_names_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     column_names = column_names_;
   }
    : get_column_statistics_for_table_request)

let make_get_column_statistics_for_partition_response
    ?column_statistics_list:(column_statistics_list_ : column_statistics_list option)
    ?errors:(errors_ : column_errors option) () =
  ({ column_statistics_list = column_statistics_list_; errors = errors_ }
    : get_column_statistics_for_partition_response)

let make_get_column_statistics_for_partition_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_values:(partition_values_ : value_string_list)
    ~column_names:(column_names_ : get_column_names_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_values = partition_values_;
     column_names = column_names_;
   }
    : get_column_statistics_for_partition_request)

let make_csv_classifier ?creation_time:(creation_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option) ?version:(version_ : version_id option)
    ?delimiter:(delimiter_ : csv_column_delimiter option)
    ?quote_symbol:(quote_symbol_ : csv_quote_symbol option)
    ?contains_header:(contains_header_ : csv_header_option option)
    ?header:(header_ : csv_header option)
    ?disable_value_trimming:(disable_value_trimming_ : nullable_boolean option)
    ?allow_single_column:(allow_single_column_ : nullable_boolean option)
    ?custom_datatype_configured:(custom_datatype_configured_ : nullable_boolean option)
    ?custom_datatypes:(custom_datatypes_ : custom_datatypes option)
    ?serde:(serde_ : csv_serde_option option) ~name:(name_ : name_string) () =
  ({
     name = name_;
     creation_time = creation_time_;
     last_updated = last_updated_;
     version = version_;
     delimiter = delimiter_;
     quote_symbol = quote_symbol_;
     contains_header = contains_header_;
     header = header_;
     disable_value_trimming = disable_value_trimming_;
     allow_single_column = allow_single_column_;
     custom_datatype_configured = custom_datatype_configured_;
     custom_datatypes = custom_datatypes_;
     serde = serde_;
   }
    : csv_classifier)

let make_json_classifier ?creation_time:(creation_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option) ?version:(version_ : version_id option)
    ~name:(name_ : name_string) ~json_path:(json_path_ : json_path) () =
  ({
     name = name_;
     creation_time = creation_time_;
     last_updated = last_updated_;
     version = version_;
     json_path = json_path_;
   }
    : json_classifier)

let make_xml_classifier ?creation_time:(creation_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option) ?version:(version_ : version_id option)
    ?row_tag:(row_tag_ : row_tag option) ~name:(name_ : name_string)
    ~classification:(classification_ : classification) () =
  ({
     name = name_;
     classification = classification_;
     creation_time = creation_time_;
     last_updated = last_updated_;
     version = version_;
     row_tag = row_tag_;
   }
    : xml_classifier)

let make_grok_classifier ?creation_time:(creation_time_ : timestamp option)
    ?last_updated:(last_updated_ : timestamp option) ?version:(version_ : version_id option)
    ?custom_patterns:(custom_patterns_ : custom_patterns option) ~name:(name_ : name_string)
    ~classification:(classification_ : classification) ~grok_pattern:(grok_pattern_ : grok_pattern)
    () =
  ({
     name = name_;
     classification = classification_;
     creation_time = creation_time_;
     last_updated = last_updated_;
     version = version_;
     grok_pattern = grok_pattern_;
     custom_patterns = custom_patterns_;
   }
    : grok_classifier)

let make_classifier ?grok_classifier:(grok_classifier_ : grok_classifier option)
    ?xml_classifier:(xml_classifier_ : xml_classifier option)
    ?json_classifier:(json_classifier_ : json_classifier option)
    ?csv_classifier:(csv_classifier_ : csv_classifier option) () =
  ({
     grok_classifier = grok_classifier_;
     xml_classifier = xml_classifier_;
     json_classifier = json_classifier_;
     csv_classifier = csv_classifier_;
   }
    : classifier)

let make_get_classifiers_response ?classifiers:(classifiers_ : classifier_list option)
    ?next_token:(next_token_ : token option) () =
  ({ classifiers = classifiers_; next_token = next_token_ } : get_classifiers_response)

let make_get_classifiers_request ?max_results:(max_results_ : page_size option)
    ?next_token:(next_token_ : token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : get_classifiers_request)

let make_get_classifier_response ?classifier:(classifier_ : classifier option) () =
  ({ classifier = classifier_ } : get_classifier_response)

let make_get_classifier_request ~name:(name_ : name_string) () =
  ({ name = name_ } : get_classifier_request)

let make_iceberg_optimization_properties_output ?role_arn:(role_arn_ : iam_role_arn option)
    ?compaction:(compaction_ : parameters_map option)
    ?retention:(retention_ : parameters_map option)
    ?orphan_file_deletion:(orphan_file_deletion_ : parameters_map option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     role_arn = role_arn_;
     compaction = compaction_;
     retention = retention_;
     orphan_file_deletion = orphan_file_deletion_;
     last_updated_time = last_updated_time_;
   }
    : iceberg_optimization_properties_output)

let make_data_lake_access_properties_output ?data_lake_access:(data_lake_access_ : boolean_ option)
    ?data_transfer_role:(data_transfer_role_ : iam_role_arn option)
    ?kms_key:(kms_key_ : resource_arn_string option)
    ?managed_workgroup_name:(managed_workgroup_name_ : name_string option)
    ?managed_workgroup_status:(managed_workgroup_status_ : name_string option)
    ?redshift_database_name:(redshift_database_name_ : name_string option)
    ?status_message:(status_message_ : name_string option)
    ?catalog_type:(catalog_type_ : name_string option) () =
  ({
     data_lake_access = data_lake_access_;
     data_transfer_role = data_transfer_role_;
     kms_key = kms_key_;
     managed_workgroup_name = managed_workgroup_name_;
     managed_workgroup_status = managed_workgroup_status_;
     redshift_database_name = redshift_database_name_;
     status_message = status_message_;
     catalog_type = catalog_type_;
   }
    : data_lake_access_properties_output)

let make_catalog_properties_output
    ?data_lake_access_properties:
      (data_lake_access_properties_ : data_lake_access_properties_output option)
    ?iceberg_optimization_properties:
      (iceberg_optimization_properties_ : iceberg_optimization_properties_output option)
    ?custom_properties:(custom_properties_ : parameters_map option) () =
  ({
     data_lake_access_properties = data_lake_access_properties_;
     iceberg_optimization_properties = iceberg_optimization_properties_;
     custom_properties = custom_properties_;
   }
    : catalog_properties_output)

let make_catalog ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?resource_arn:(resource_arn_ : resource_arn_string option)
    ?description:(description_ : description_string option)
    ?parameters:(parameters_ : parameters_map option) ?create_time:(create_time_ : timestamp option)
    ?update_time:(update_time_ : timestamp option)
    ?target_redshift_catalog:(target_redshift_catalog_ : target_redshift_catalog option)
    ?federated_catalog:(federated_catalog_ : federated_catalog option)
    ?catalog_properties:(catalog_properties_ : catalog_properties_output option)
    ?create_table_default_permissions:
      (create_table_default_permissions_ : principal_permissions_list option)
    ?create_database_default_permissions:
      (create_database_default_permissions_ : principal_permissions_list option)
    ?allow_full_table_external_data_access:
      (allow_full_table_external_data_access_ : allow_full_table_external_data_access_enum option)
    ~name:(name_ : catalog_name_string) () =
  ({
     catalog_id = catalog_id_;
     name = name_;
     resource_arn = resource_arn_;
     description = description_;
     parameters = parameters_;
     create_time = create_time_;
     update_time = update_time_;
     target_redshift_catalog = target_redshift_catalog_;
     federated_catalog = federated_catalog_;
     catalog_properties = catalog_properties_;
     create_table_default_permissions = create_table_default_permissions_;
     create_database_default_permissions = create_database_default_permissions_;
     allow_full_table_external_data_access = allow_full_table_external_data_access_;
   }
    : catalog)

let make_get_catalogs_response ?next_token:(next_token_ : token option)
    ~catalog_list:(catalog_list_ : catalog_list) () =
  ({ catalog_list = catalog_list_; next_token = next_token_ } : get_catalogs_response)

let make_get_catalogs_request ?parent_catalog_id:(parent_catalog_id_ : catalog_id_string option)
    ?next_token:(next_token_ : token option) ?max_results:(max_results_ : page_size option)
    ?recursive:(recursive_ : boolean_ option)
    ?include_root:(include_root_ : nullable_boolean option)
    ?has_databases:(has_databases_ : nullable_boolean option) () =
  ({
     parent_catalog_id = parent_catalog_id_;
     next_token = next_token_;
     max_results = max_results_;
     recursive = recursive_;
     include_root = include_root_;
     has_databases = has_databases_;
   }
    : get_catalogs_request)

let make_catalog_import_status ?import_completed:(import_completed_ : boolean_ option)
    ?import_time:(import_time_ : timestamp option) ?imported_by:(imported_by_ : name_string option)
    () =
  ({ import_completed = import_completed_; import_time = import_time_; imported_by = imported_by_ }
    : catalog_import_status)

let make_get_catalog_import_status_response
    ?import_status:(import_status_ : catalog_import_status option) () =
  ({ import_status = import_status_ } : get_catalog_import_status_response)

let make_get_catalog_import_status_request ?catalog_id:(catalog_id_ : catalog_id_string option) () =
  ({ catalog_id = catalog_id_ } : get_catalog_import_status_request)

let make_get_catalog_response ?catalog:(catalog_ : catalog option) () =
  ({ catalog = catalog_ } : get_catalog_response)

let make_get_catalog_request ~catalog_id:(catalog_id_ : catalog_id_string) () =
  ({ catalog_id = catalog_id_ } : get_catalog_request)

let make_blueprint_run ?blueprint_name:(blueprint_name_ : orchestration_name_string option)
    ?run_id:(run_id_ : id_string option) ?workflow_name:(workflow_name_ : name_string option)
    ?state:(state_ : blueprint_run_state option) ?started_on:(started_on_ : timestamp_value option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?error_message:(error_message_ : message_string option)
    ?rollback_error_message:(rollback_error_message_ : message_string option)
    ?parameters:(parameters_ : blueprint_parameters option)
    ?role_arn:(role_arn_ : orchestration_iam_role_arn option) () =
  ({
     blueprint_name = blueprint_name_;
     run_id = run_id_;
     workflow_name = workflow_name_;
     state = state_;
     started_on = started_on_;
     completed_on = completed_on_;
     error_message = error_message_;
     rollback_error_message = rollback_error_message_;
     parameters = parameters_;
     role_arn = role_arn_;
   }
    : blueprint_run)

let make_get_blueprint_runs_response ?blueprint_runs:(blueprint_runs_ : blueprint_runs option)
    ?next_token:(next_token_ : generic_string option) () =
  ({ blueprint_runs = blueprint_runs_; next_token = next_token_ } : get_blueprint_runs_response)

let make_get_blueprint_runs_request ?next_token:(next_token_ : generic_string option)
    ?max_results:(max_results_ : page_size option) ~blueprint_name:(blueprint_name_ : name_string)
    () =
  ({ blueprint_name = blueprint_name_; next_token = next_token_; max_results = max_results_ }
    : get_blueprint_runs_request)

let make_get_blueprint_run_response ?blueprint_run:(blueprint_run_ : blueprint_run option) () =
  ({ blueprint_run = blueprint_run_ } : get_blueprint_run_response)

let make_get_blueprint_run_request ~blueprint_name:(blueprint_name_ : orchestration_name_string)
    ~run_id:(run_id_ : id_string) () =
  ({ blueprint_name = blueprint_name_; run_id = run_id_ } : get_blueprint_run_request)

let make_last_active_definition ?description:(description_ : generic512_char_string option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?parameter_spec:(parameter_spec_ : blueprint_parameter_spec option)
    ?blueprint_location:(blueprint_location_ : generic_string option)
    ?blueprint_service_location:(blueprint_service_location_ : generic_string option) () =
  ({
     description = description_;
     last_modified_on = last_modified_on_;
     parameter_spec = parameter_spec_;
     blueprint_location = blueprint_location_;
     blueprint_service_location = blueprint_service_location_;
   }
    : last_active_definition)

let make_blueprint ?name:(name_ : orchestration_name_string option)
    ?description:(description_ : generic512_char_string option)
    ?created_on:(created_on_ : timestamp_value option)
    ?last_modified_on:(last_modified_on_ : timestamp_value option)
    ?parameter_spec:(parameter_spec_ : blueprint_parameter_spec option)
    ?blueprint_location:(blueprint_location_ : generic_string option)
    ?blueprint_service_location:(blueprint_service_location_ : generic_string option)
    ?status:(status_ : blueprint_status option)
    ?error_message:(error_message_ : error_string option)
    ?last_active_definition:(last_active_definition_ : last_active_definition option) () =
  ({
     name = name_;
     description = description_;
     created_on = created_on_;
     last_modified_on = last_modified_on_;
     parameter_spec = parameter_spec_;
     blueprint_location = blueprint_location_;
     blueprint_service_location = blueprint_service_location_;
     status = status_;
     error_message = error_message_;
     last_active_definition = last_active_definition_;
   }
    : blueprint)

let make_get_blueprint_response ?blueprint:(blueprint_ : blueprint option) () =
  ({ blueprint = blueprint_ } : get_blueprint_response)

let make_get_blueprint_request ?include_blueprint:(include_blueprint_ : nullable_boolean option)
    ?include_parameter_spec:(include_parameter_spec_ : nullable_boolean option)
    ~name:(name_ : name_string) () =
  ({
     name = name_;
     include_blueprint = include_blueprint_;
     include_parameter_spec = include_parameter_spec_;
   }
    : get_blueprint_request)

let make_get_asset_type_response ?id:(id_ : asset_type_id option)
    ?name:(name_ : asset_type_name option) ?forms:(forms_ : asset_type_forms_map option) () =
  ({ id = id_; name = name_; forms = forms_ } : get_asset_type_response)

let make_get_asset_type_request ~identifier:(identifier_ : asset_type_id) () =
  ({ identifier = identifier_ } : get_asset_type_request)

let make_iterable_form_entry ?form_type_id:(form_type_id_ : form_type_id option) () =
  ({ form_type_id = form_type_id_ } : iterable_form_entry)

let make_get_asset_output ?name:(name_ : asset_name option)
    ?description:(description_ : asset_description option)
    ?created_at:(created_at_ : created_at option) ?updated_at:(updated_at_ : updated_at option)
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option)
    ?forms:(forms_ : asset_form_map option) ?attachments:(attachments_ : asset_form_map option)
    ?iterable_forms:(iterable_forms_ : iterable_form_map option) ~id:(id_ : asset_id)
    ~asset_type_id:(asset_type_id_ : asset_type_id) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     created_at = created_at_;
     updated_at = updated_at_;
     asset_type_id = asset_type_id_;
     glossary_terms = glossary_terms_;
     forms = forms_;
     attachments = attachments_;
     iterable_forms = iterable_forms_;
   }
    : get_asset_output)

let make_get_asset_input ~identifier:(identifier_ : asset_id) () =
  ({ identifier = identifier_ } : get_asset_input)

let make_disassociate_glossary_terms_response
    ?asset_identifier:(asset_identifier_ : asset_id option)
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option) () =
  ({ asset_identifier = asset_identifier_; glossary_terms = glossary_terms_ }
    : disassociate_glossary_terms_response)

let make_disassociate_glossary_terms_request ?client_token:(client_token_ : hash_string option)
    ~asset_identifier:(asset_identifier_ : asset_id)
    ~glossary_term_identifiers:(glossary_term_identifiers_ : glossary_term_id_list) () =
  ({
     asset_identifier = asset_identifier_;
     glossary_term_identifiers = glossary_term_identifiers_;
     client_token = client_token_;
   }
    : disassociate_glossary_terms_request)

let make_integration ?description:(description_ : integration_description option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?tags:(tags_ : integration_tags_list option)
    ?integration_config:(integration_config_ : integration_config option)
    ?errors:(errors_ : integration_error_list option)
    ?data_filter:(data_filter_ : string2048 option) ~source_arn:(source_arn_ : string512)
    ~target_arn:(target_arn_ : string512) ~integration_name:(integration_name_ : string128)
    ~integration_arn:(integration_arn_ : string128) ~status:(status_ : integration_status)
    ~create_time:(create_time_ : integration_timestamp) () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     description = description_;
     integration_name = integration_name_;
     integration_arn = integration_arn_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     tags = tags_;
     status = status_;
     create_time = create_time_;
     integration_config = integration_config_;
     errors = errors_;
     data_filter = data_filter_;
   }
    : integration)

let make_describe_integrations_response ?integrations:(integrations_ : integrations_list option)
    ?marker:(marker_ : string128 option) () =
  ({ integrations = integrations_; marker = marker_ } : describe_integrations_response)

let make_integration_filter ?name:(name_ : string128 option)
    ?values:(values_ : integration_filter_values option) () =
  ({ name = name_; values = values_ } : integration_filter)

let make_describe_integrations_request
    ?integration_identifier:(integration_identifier_ : string128 option)
    ?marker:(marker_ : string128 option) ?max_records:(max_records_ : integration_integer option)
    ?filters:(filters_ : integration_filter_list option) () =
  ({
     integration_identifier = integration_identifier_;
     marker = marker_;
     max_records = max_records_;
     filters = filters_;
   }
    : describe_integrations_request)

let make_inbound_integration ?integration_config:(integration_config_ : integration_config option)
    ?errors:(errors_ : integration_error_list option) ~source_arn:(source_arn_ : string512)
    ~target_arn:(target_arn_ : string512) ~integration_arn:(integration_arn_ : string128)
    ~status:(status_ : integration_status) ~create_time:(create_time_ : integration_timestamp) () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     integration_arn = integration_arn_;
     status = status_;
     create_time = create_time_;
     integration_config = integration_config_;
     errors = errors_;
   }
    : inbound_integration)

let make_describe_inbound_integrations_response
    ?inbound_integrations:(inbound_integrations_ : inbound_integrations_list option)
    ?marker:(marker_ : string128 option) () =
  ({ inbound_integrations = inbound_integrations_; marker = marker_ }
    : describe_inbound_integrations_response)

let make_describe_inbound_integrations_request
    ?integration_arn:(integration_arn_ : string128 option) ?marker:(marker_ : string128 option)
    ?max_records:(max_records_ : integration_integer option)
    ?target_arn:(target_arn_ : string512 option) () =
  ({
     integration_arn = integration_arn_;
     marker = marker_;
     max_records = max_records_;
     target_arn = target_arn_;
   }
    : describe_inbound_integrations_request)

let make_field ?field_name:(field_name_ : entity_field_name option)
    ?label:(label_ : field_label option) ?description:(description_ : field_description option)
    ?field_type:(field_type_ : field_data_type option)
    ?is_primary_key:(is_primary_key_ : bool_ option) ?is_nullable:(is_nullable_ : bool_ option)
    ?is_retrievable:(is_retrievable_ : bool_ option) ?is_filterable:(is_filterable_ : bool_ option)
    ?is_partitionable:(is_partitionable_ : bool_ option)
    ?is_createable:(is_createable_ : bool_ option) ?is_updateable:(is_updateable_ : bool_ option)
    ?is_upsertable:(is_upsertable_ : bool_ option)
    ?is_default_on_create:(is_default_on_create_ : bool_ option)
    ?supported_values:(supported_values_ : list_of_string option)
    ?supported_filter_operators:(supported_filter_operators_ : field_filter_operators_list option)
    ?parent_field:(parent_field_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?native_data_type:(native_data_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_properties:(custom_properties_ : custom_properties option) () =
  ({
     field_name = field_name_;
     label = label_;
     description = description_;
     field_type = field_type_;
     is_primary_key = is_primary_key_;
     is_nullable = is_nullable_;
     is_retrievable = is_retrievable_;
     is_filterable = is_filterable_;
     is_partitionable = is_partitionable_;
     is_createable = is_createable_;
     is_updateable = is_updateable_;
     is_upsertable = is_upsertable_;
     is_default_on_create = is_default_on_create_;
     supported_values = supported_values_;
     supported_filter_operators = supported_filter_operators_;
     parent_field = parent_field_;
     native_data_type = native_data_type_;
     custom_properties = custom_properties_;
   }
    : field)

let make_describe_entity_response ?fields:(fields_ : fields_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ fields = fields_; next_token = next_token_ } : describe_entity_response)

let make_describe_entity_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?next_token:(next_token_ : next_token option)
    ?data_store_api_version:(data_store_api_version_ : api_version option)
    ~connection_name:(connection_name_ : name_string) ~entity_name:(entity_name_ : entity_name) () =
  ({
     connection_name = connection_name_;
     catalog_id = catalog_id_;
     entity_name = entity_name_;
     next_token = next_token_;
     data_store_api_version = data_store_api_version_;
   }
    : describe_entity_request)

let make_allowed_value ?description:(description_ : allowed_value_description_string option)
    ~value:(value_ : allowed_value_value_string) () =
  ({ description = description_; value = value_ } : allowed_value)

let make_property ?default_value:(default_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?allowed_values:(allowed_values_ : allowed_values option)
    ?data_operation_scopes:(data_operation_scopes_ : data_operations option)
    ?key_override:(key_override_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?property_location:(property_location_ : property_location option) ~name:(name_ : property_name)
    ~description:(description_ : property_description_string) ~required:(required_ : bool_)
    ~property_types:(property_types_ : property_types) () =
  ({
     name = name_;
     description = description_;
     required = required_;
     default_value = default_value_;
     property_types = property_types_;
     allowed_values = allowed_values_;
     data_operation_scopes = data_operation_scopes_;
     key_override = key_override_;
     property_location = property_location_;
   }
    : property)

let make_compute_environment_configuration
    ?physical_connection_properties_required:
      (physical_connection_properties_required_ : bool_ option)
    ~name:(name_ : compute_environment_name)
    ~description:(description_ : compute_environment_configuration_description_string)
    ~compute_environment:(compute_environment_ : compute_environment)
    ~supported_authentication_types:(supported_authentication_types_ : authentication_types)
    ~connection_options:(connection_options_ : properties_map)
    ~connection_property_name_overrides:
      (connection_property_name_overrides_ : property_name_overrides)
    ~connection_option_name_overrides:(connection_option_name_overrides_ : property_name_overrides)
    ~connection_properties_required_overrides:
      (connection_properties_required_overrides_ : list_of_string) () =
  ({
     name = name_;
     description = description_;
     compute_environment = compute_environment_;
     supported_authentication_types = supported_authentication_types_;
     connection_options = connection_options_;
     connection_property_name_overrides = connection_property_name_overrides_;
     connection_option_name_overrides = connection_option_name_overrides_;
     connection_properties_required_overrides = connection_properties_required_overrides_;
     physical_connection_properties_required = physical_connection_properties_required_;
   }
    : compute_environment_configuration)

let make_auth_configuration ?secret_arn:(secret_arn_ : property option)
    ?o_auth2_properties:(o_auth2_properties_ : properties_map option)
    ?basic_authentication_properties:(basic_authentication_properties_ : properties_map option)
    ?custom_authentication_properties:(custom_authentication_properties_ : properties_map option)
    ~authentication_type:(authentication_type_ : property) () =
  ({
     authentication_type = authentication_type_;
     secret_arn = secret_arn_;
     o_auth2_properties = o_auth2_properties_;
     basic_authentication_properties = basic_authentication_properties_;
     custom_authentication_properties = custom_authentication_properties_;
   }
    : auth_configuration)

let make_describe_connection_type_response ?connection_type:(connection_type_ : name_string option)
    ?description:(description_ : description option)
    ?capabilities:(capabilities_ : capabilities option)
    ?connection_properties:(connection_properties_ : properties_map option)
    ?connection_options:(connection_options_ : properties_map option)
    ?authentication_configuration:(authentication_configuration_ : auth_configuration option)
    ?compute_environment_configurations:
      (compute_environment_configurations_ : compute_environment_configuration_map option)
    ?physical_connection_requirements:(physical_connection_requirements_ : properties_map option)
    ?athena_connection_properties:(athena_connection_properties_ : properties_map option)
    ?python_connection_properties:(python_connection_properties_ : properties_map option)
    ?spark_connection_properties:(spark_connection_properties_ : properties_map option)
    ?rest_configuration:(rest_configuration_ : rest_configuration option) () =
  ({
     connection_type = connection_type_;
     description = description_;
     capabilities = capabilities_;
     connection_properties = connection_properties_;
     connection_options = connection_options_;
     authentication_configuration = authentication_configuration_;
     compute_environment_configurations = compute_environment_configurations_;
     physical_connection_requirements = physical_connection_requirements_;
     athena_connection_properties = athena_connection_properties_;
     python_connection_properties = python_connection_properties_;
     spark_connection_properties = spark_connection_properties_;
     rest_configuration = rest_configuration_;
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
    ~database_name:(database_name_ : name_string) ~function_name:(function_name_ : name_string) () =
  ({ catalog_id = catalog_id_; database_name = database_name_; function_name = function_name_ }
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
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~version_id:(version_id_ : version_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     version_id = version_id_;
   }
    : delete_table_version_request)

let make_delete_table_optimizer_response () = (() : unit)

let make_delete_table_optimizer_request ~catalog_id:(catalog_id_ : catalog_id_string)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~type_:(type__ : table_optimizer_type) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     type_ = type__;
   }
    : delete_table_optimizer_request)

let make_delete_table_response () = (() : unit)

let make_delete_table_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ~database_name:(database_name_ : name_string) ~name:(name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     name = name_;
     transaction_id = transaction_id_;
   }
    : delete_table_request)

let make_delete_session_response ?id:(id_ : name_string option) () =
  ({ id = id_ } : delete_session_response)

let make_delete_session_request ?request_origin:(request_origin_ : orchestration_name_string option)
    ~id:(id_ : name_string) () =
  ({ id = id_; request_origin = request_origin_ } : delete_session_request)

let make_delete_security_configuration_response () = (() : unit)

let make_delete_security_configuration_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_security_configuration_request)

let make_error_details ?error_code:(error_code_ : error_code_string option)
    ?error_message:(error_message_ : error_message_string option) () =
  ({ error_code = error_code_; error_message = error_message_ } : error_details)

let make_schema_version_error_item ?version_number:(version_number_ : version_long_number option)
    ?error_details:(error_details_ : error_details option) () =
  ({ version_number = version_number_; error_details = error_details_ } : schema_version_error_item)

let make_delete_schema_versions_response
    ?schema_version_errors:(schema_version_errors_ : schema_version_error_list option) () =
  ({ schema_version_errors = schema_version_errors_ } : delete_schema_versions_response)

let make_delete_schema_versions_input ~schema_id:(schema_id_ : schema_id)
    ~versions:(versions_ : versions_string) () =
  ({ schema_id = schema_id_; versions = versions_ } : delete_schema_versions_input)

let make_delete_schema_response ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?status:(status_ : schema_status option) () =
  ({ schema_arn = schema_arn_; schema_name = schema_name_; status = status_ }
    : delete_schema_response)

let make_delete_schema_input ~schema_id:(schema_id_ : schema_id) () =
  ({ schema_id = schema_id_ } : delete_schema_input)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request
    ?policy_hash_condition:(policy_hash_condition_ : hash_string option)
    ?resource_arn:(resource_arn_ : glue_resource_arn option) () =
  ({ policy_hash_condition = policy_hash_condition_; resource_arn = resource_arn_ }
    : delete_resource_policy_request)

let make_delete_registry_response
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?status:(status_ : registry_status option) () =
  ({ registry_name = registry_name_; registry_arn = registry_arn_; status = status_ }
    : delete_registry_response)

let make_delete_registry_input ~registry_id:(registry_id_ : registry_id) () =
  ({ registry_id = registry_id_ } : delete_registry_input)

let make_delete_partition_index_response () = (() : unit)

let make_delete_partition_index_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~index_name:(index_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     index_name = index_name_;
   }
    : delete_partition_index_request)

let make_delete_partition_response () = (() : unit)

let make_delete_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_values:(partition_values_ : value_string_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_values = partition_values_;
   }
    : delete_partition_request)

let make_delete_ml_transform_response ?transform_id:(transform_id_ : hash_string option) () =
  ({ transform_id = transform_id_ } : delete_ml_transform_response)

let make_delete_ml_transform_request ~transform_id:(transform_id_ : hash_string) () =
  ({ transform_id = transform_id_ } : delete_ml_transform_request)

let make_delete_job_response ?job_name:(job_name_ : name_string option) () =
  ({ job_name = job_name_ } : delete_job_response)

let make_delete_job_request ~job_name:(job_name_ : name_string) () =
  ({ job_name = job_name_ } : delete_job_request)

let make_delete_integration_table_properties_response () = (() : unit)

let make_delete_integration_table_properties_request ~resource_arn:(resource_arn_ : string512)
    ~table_name:(table_name_ : string128) () =
  ({ resource_arn = resource_arn_; table_name = table_name_ }
    : delete_integration_table_properties_request)

let make_delete_integration_resource_property_response () = (() : unit)

let make_delete_integration_resource_property_request ~resource_arn:(resource_arn_ : string512) () =
  ({ resource_arn = resource_arn_ } : delete_integration_resource_property_request)

let make_delete_integration_response ?description:(description_ : integration_description option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?tags:(tags_ : integration_tags_list option) ?errors:(errors_ : integration_error_list option)
    ?data_filter:(data_filter_ : string2048 option) ~source_arn:(source_arn_ : string512)
    ~target_arn:(target_arn_ : string512) ~integration_name:(integration_name_ : string128)
    ~integration_arn:(integration_arn_ : string128) ~status:(status_ : integration_status)
    ~create_time:(create_time_ : integration_timestamp) () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     integration_name = integration_name_;
     description = description_;
     integration_arn = integration_arn_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     tags = tags_;
     status = status_;
     create_time = create_time_;
     errors = errors_;
     data_filter = data_filter_;
   }
    : delete_integration_response)

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

let make_delete_data_quality_ruleset_response () = (() : unit)

let make_delete_data_quality_ruleset_request ~name:(name_ : name_string) () =
  ({ name = name_ } : delete_data_quality_ruleset_request)

let make_delete_database_response () = (() : unit)

let make_delete_database_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~name:(name_ : name_string) () =
  ({ catalog_id = catalog_id_; name = name_ } : delete_database_request)

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
  ({ catalog_id = catalog_id_; connection_name = connection_name_ } : delete_connection_request)

let make_delete_column_statistics_task_settings_response () = (() : unit)

let make_delete_column_statistics_task_settings_request
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string) () =
  ({ database_name = database_name_; table_name = table_name_ }
    : delete_column_statistics_task_settings_request)

let make_delete_column_statistics_for_table_response () = (() : unit)

let make_delete_column_statistics_for_table_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~column_name:(column_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     column_name = column_name_;
   }
    : delete_column_statistics_for_table_request)

let make_delete_column_statistics_for_partition_response () = (() : unit)

let make_delete_column_statistics_for_partition_request
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_values:(partition_values_ : value_string_list)
    ~column_name:(column_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_values = partition_values_;
     column_name = column_name_;
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

let make_delete_attachment_request
    ?iterable_form_name:(iterable_form_name_ : iterable_form_name option)
    ?item_identifier:(item_identifier_ : item_identifier option)
    ~asset_identifier:(asset_identifier_ : asset_id)
    ~attachment_name:(attachment_name_ : attachment_name) () =
  ({
     asset_identifier = asset_identifier_;
     iterable_form_name = iterable_form_name_;
     item_identifier = item_identifier_;
     attachment_name = attachment_name_;
   }
    : delete_attachment_request)

let make_delete_asset_type_response () = (() : unit)

let make_delete_asset_type_request ~identifier:(identifier_ : asset_type_id) () =
  ({ identifier = identifier_ } : delete_asset_type_request)

let make_delete_asset_response () = (() : unit)

let make_delete_asset_request ~identifier:(identifier_ : asset_id) () =
  ({ identifier = identifier_ } : delete_asset_request)

let make_create_workflow_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_workflow_response)

let make_create_workflow_request ?description:(description_ : workflow_description_string option)
    ?default_run_properties:(default_run_properties_ : workflow_run_properties option)
    ?tags:(tags_ : tags_map option)
    ?max_concurrent_runs:(max_concurrent_runs_ : nullable_integer option)
    ~name:(name_ : name_string) () =
  ({
     name = name_;
     description = description_;
     default_run_properties = default_run_properties_;
     tags = tags_;
     max_concurrent_runs = max_concurrent_runs_;
   }
    : create_workflow_request)

let make_create_user_defined_function_response () = (() : unit)

let make_create_user_defined_function_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string)
    ~function_input:(function_input_ : user_defined_function_input) () =
  ({ catalog_id = catalog_id_; database_name = database_name_; function_input = function_input_ }
    : create_user_defined_function_request)

let make_create_usage_profile_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_usage_profile_response)

let make_create_usage_profile_request ?description:(description_ : description_string option)
    ?tags:(tags_ : tags_map option) ~name:(name_ : name_string)
    ~configuration:(configuration_ : profile_configuration) () =
  ({ name = name_; description = description_; configuration = configuration_; tags = tags_ }
    : create_usage_profile_request)

let make_create_trigger_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_trigger_response)

let make_create_trigger_request ?workflow_name:(workflow_name_ : name_string option)
    ?schedule:(schedule_ : generic_string option) ?predicate:(predicate_ : predicate option)
    ?description:(description_ : description_string option)
    ?start_on_creation:(start_on_creation_ : boolean_value option) ?tags:(tags_ : tags_map option)
    ?event_batching_condition:(event_batching_condition_ : event_batching_condition option)
    ~name:(name_ : name_string) ~type_:(type__ : trigger_type) ~actions:(actions_ : action_list) ()
    =
  ({
     name = name_;
     workflow_name = workflow_name_;
     type_ = type__;
     schedule = schedule_;
     predicate = predicate_;
     actions = actions_;
     description = description_;
     start_on_creation = start_on_creation_;
     tags = tags_;
     event_batching_condition = event_batching_condition_;
   }
    : create_trigger_request)

let make_create_table_optimizer_response () = (() : unit)

let make_create_table_optimizer_request ~catalog_id:(catalog_id_ : catalog_id_string)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~type_:(type__ : table_optimizer_type)
    ~table_optimizer_configuration:(table_optimizer_configuration_ : table_optimizer_configuration)
    () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     type_ = type__;
     table_optimizer_configuration = table_optimizer_configuration_;
   }
    : create_table_optimizer_request)

let make_create_table_response () = (() : unit)

let make_create_iceberg_table_input
    ?partition_spec:(partition_spec_ : iceberg_partition_spec option)
    ?write_order:(write_order_ : iceberg_sort_order option)
    ?properties:(properties_ : string_to_string_map option) ~location:(location_ : location_string)
    ~schema:(schema_ : iceberg_schema) () =
  ({
     location = location_;
     schema = schema_;
     partition_spec = partition_spec_;
     write_order = write_order_;
     properties = properties_;
   }
    : create_iceberg_table_input)

let make_iceberg_input ?version:(version_ : version_string option)
    ?create_iceberg_table_input:(create_iceberg_table_input_ : create_iceberg_table_input option)
    ~metadata_operation:(metadata_operation_ : metadata_operation) () =
  ({
     metadata_operation = metadata_operation_;
     version = version_;
     create_iceberg_table_input = create_iceberg_table_input_;
   }
    : iceberg_input)

let make_open_table_format_input ?iceberg_input:(iceberg_input_ : iceberg_input option) () =
  ({ iceberg_input = iceberg_input_ } : open_table_format_input)

let make_partition_index ~keys:(keys_ : key_list) ~index_name:(index_name_ : name_string) () =
  ({ keys = keys_; index_name = index_name_ } : partition_index)

let make_create_table_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?name:(name_ : name_string option) ?table_input:(table_input_ : table_input option)
    ?partition_indexes:(partition_indexes_ : partition_index_list option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ?open_table_format_input:(open_table_format_input_ : open_table_format_input option)
    ~database_name:(database_name_ : name_string) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     name = name_;
     table_input = table_input_;
     partition_indexes = partition_indexes_;
     transaction_id = transaction_id_;
     open_table_format_input = open_table_format_input_;
   }
    : create_table_request)

let make_create_session_response ?session:(session_ : session option) () =
  ({ session = session_ } : create_session_response)

let make_create_session_request ?description:(description_ : description_string option)
    ?timeout:(timeout_ : timeout option) ?idle_timeout:(idle_timeout_ : timeout option)
    ?default_arguments:(default_arguments_ : orchestration_arguments_map option)
    ?connections:(connections_ : connections_list option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?glue_version:(glue_version_ : glue_version_string option) ?tags:(tags_ : tags_map option)
    ?request_origin:(request_origin_ : orchestration_name_string option)
    ?session_type:(session_type_ : session_type option) ~id:(id_ : name_string)
    ~role:(role_ : orchestration_role_arn) ~command:(command_ : session_command) () =
  ({
     id = id_;
     description = description_;
     role = role_;
     command = command_;
     timeout = timeout_;
     idle_timeout = idle_timeout_;
     default_arguments = default_arguments_;
     connections = connections_;
     max_capacity = max_capacity_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     security_configuration = security_configuration_;
     glue_version = glue_version_;
     tags = tags_;
     request_origin = request_origin_;
     session_type = session_type_;
   }
    : create_session_request)

let make_create_security_configuration_response ?name:(name_ : name_string option)
    ?created_timestamp:(created_timestamp_ : timestamp_value option) () =
  ({ name = name_; created_timestamp = created_timestamp_ }
    : create_security_configuration_response)

let make_create_security_configuration_request ~name:(name_ : name_string)
    ~encryption_configuration:(encryption_configuration_ : encryption_configuration) () =
  ({ name = name_; encryption_configuration = encryption_configuration_ }
    : create_security_configuration_request)

let make_create_script_response ?python_script:(python_script_ : python_script option)
    ?scala_code:(scala_code_ : scala_code option) () =
  ({ python_script = python_script_; scala_code = scala_code_ } : create_script_response)

let make_create_script_request ?dag_nodes:(dag_nodes_ : dag_nodes option)
    ?dag_edges:(dag_edges_ : dag_edges option) ?language:(language_ : language option) () =
  ({ dag_nodes = dag_nodes_; dag_edges = dag_edges_; language = language_ } : create_script_request)

let make_create_schema_response ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?schema_name:(schema_name_ : schema_registry_name_string option)
    ?schema_arn:(schema_arn_ : glue_resource_arn option)
    ?description:(description_ : description_string option)
    ?data_format:(data_format_ : data_format option)
    ?compatibility:(compatibility_ : compatibility option)
    ?schema_checkpoint:(schema_checkpoint_ : schema_checkpoint_number option)
    ?latest_schema_version:(latest_schema_version_ : version_long_number option)
    ?next_schema_version:(next_schema_version_ : version_long_number option)
    ?schema_status:(schema_status_ : schema_status option) ?tags:(tags_ : tags_map option)
    ?schema_version_id:(schema_version_id_ : schema_version_id_string option)
    ?schema_version_status:(schema_version_status_ : schema_version_status option) () =
  ({
     registry_name = registry_name_;
     registry_arn = registry_arn_;
     schema_name = schema_name_;
     schema_arn = schema_arn_;
     description = description_;
     data_format = data_format_;
     compatibility = compatibility_;
     schema_checkpoint = schema_checkpoint_;
     latest_schema_version = latest_schema_version_;
     next_schema_version = next_schema_version_;
     schema_status = schema_status_;
     tags = tags_;
     schema_version_id = schema_version_id_;
     schema_version_status = schema_version_status_;
   }
    : create_schema_response)

let make_create_schema_input ?registry_id:(registry_id_ : registry_id option)
    ?compatibility:(compatibility_ : compatibility option)
    ?description:(description_ : description_string option) ?tags:(tags_ : tags_map option)
    ?schema_definition:(schema_definition_ : schema_definition_string option)
    ~schema_name:(schema_name_ : schema_registry_name_string)
    ~data_format:(data_format_ : data_format) () =
  ({
     registry_id = registry_id_;
     schema_name = schema_name_;
     data_format = data_format_;
     compatibility = compatibility_;
     description = description_;
     tags = tags_;
     schema_definition = schema_definition_;
   }
    : create_schema_input)

let make_create_registry_response ?registry_arn:(registry_arn_ : glue_resource_arn option)
    ?registry_name:(registry_name_ : schema_registry_name_string option)
    ?description:(description_ : description_string option) ?tags:(tags_ : tags_map option) () =
  ({
     registry_arn = registry_arn_;
     registry_name = registry_name_;
     description = description_;
     tags = tags_;
   }
    : create_registry_response)

let make_create_registry_input ?description:(description_ : description_string option)
    ?tags:(tags_ : tags_map option) ~registry_name:(registry_name_ : schema_registry_name_string) ()
    =
  ({ registry_name = registry_name_; description = description_; tags = tags_ }
    : create_registry_input)

let make_create_partition_index_response () = (() : unit)

let make_create_partition_index_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_index:(partition_index_ : partition_index) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_index = partition_index_;
   }
    : create_partition_index_request)

let make_create_partition_response () = (() : unit)

let make_create_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_input:(partition_input_ : partition_input) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_input = partition_input_;
   }
    : create_partition_request)

let make_create_ml_transform_response ?transform_id:(transform_id_ : hash_string option) () =
  ({ transform_id = transform_id_ } : create_ml_transform_response)

let make_create_ml_transform_request ?description:(description_ : description_string option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?max_capacity:(max_capacity_ : nullable_double option)
    ?worker_type:(worker_type_ : worker_type option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?timeout:(timeout_ : timeout option) ?max_retries:(max_retries_ : nullable_integer option)
    ?tags:(tags_ : tags_map option)
    ?transform_encryption:(transform_encryption_ : transform_encryption option)
    ~name:(name_ : name_string) ~input_record_tables:(input_record_tables_ : glue_tables)
    ~parameters:(parameters_ : transform_parameters) ~role:(role_ : role_string) () =
  ({
     name = name_;
     description = description_;
     input_record_tables = input_record_tables_;
     parameters = parameters_;
     role = role_;
     glue_version = glue_version_;
     max_capacity = max_capacity_;
     worker_type = worker_type_;
     number_of_workers = number_of_workers_;
     timeout = timeout_;
     max_retries = max_retries_;
     tags = tags_;
     transform_encryption = transform_encryption_;
   }
    : create_ml_transform_request)

let make_create_job_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_job_response)

let make_create_job_request ?job_mode:(job_mode_ : job_mode option)
    ?job_run_queuing_enabled:(job_run_queuing_enabled_ : nullable_boolean option)
    ?description:(description_ : description_string option) ?log_uri:(log_uri_ : uri_string option)
    ?execution_property:(execution_property_ : execution_property option)
    ?default_arguments:(default_arguments_ : generic_map option)
    ?non_overridable_arguments:(non_overridable_arguments_ : generic_map option)
    ?connections:(connections_ : connections_list option)
    ?max_retries:(max_retries_ : max_retries option)
    ?allocated_capacity:(allocated_capacity_ : integer_value option)
    ?timeout:(timeout_ : timeout option) ?max_capacity:(max_capacity_ : nullable_double option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?tags:(tags_ : tags_map option)
    ?notification_property:(notification_property_ : notification_property option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?worker_type:(worker_type_ : worker_type option)
    ?code_gen_configuration_nodes:
      (code_gen_configuration_nodes_ : code_gen_configuration_nodes option)
    ?execution_class:(execution_class_ : execution_class option)
    ?source_control_details:(source_control_details_ : source_control_details option)
    ?maintenance_window:(maintenance_window_ : maintenance_window option)
    ~name:(name_ : name_string) ~role:(role_ : role_string) ~command:(command_ : job_command) () =
  ({
     name = name_;
     job_mode = job_mode_;
     job_run_queuing_enabled = job_run_queuing_enabled_;
     description = description_;
     log_uri = log_uri_;
     role = role_;
     execution_property = execution_property_;
     command = command_;
     default_arguments = default_arguments_;
     non_overridable_arguments = non_overridable_arguments_;
     connections = connections_;
     max_retries = max_retries_;
     allocated_capacity = allocated_capacity_;
     timeout = timeout_;
     max_capacity = max_capacity_;
     security_configuration = security_configuration_;
     tags = tags_;
     notification_property = notification_property_;
     glue_version = glue_version_;
     number_of_workers = number_of_workers_;
     worker_type = worker_type_;
     code_gen_configuration_nodes = code_gen_configuration_nodes_;
     execution_class = execution_class_;
     source_control_details = source_control_details_;
     maintenance_window = maintenance_window_;
   }
    : create_job_request)

let make_create_integration_table_properties_response () = (() : unit)

let make_create_integration_table_properties_request
    ?source_table_config:(source_table_config_ : source_table_config option)
    ?target_table_config:(target_table_config_ : target_table_config option)
    ~resource_arn:(resource_arn_ : string512) ~table_name:(table_name_ : string128) () =
  ({
     resource_arn = resource_arn_;
     table_name = table_name_;
     source_table_config = source_table_config_;
     target_table_config = target_table_config_;
   }
    : create_integration_table_properties_request)

let make_create_integration_resource_property_response
    ?resource_property_arn:(resource_property_arn_ : string512 option)
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ~resource_arn:(resource_arn_ : string512) () =
  ({
     resource_arn = resource_arn_;
     resource_property_arn = resource_property_arn_;
     source_processing_properties = source_processing_properties_;
     target_processing_properties = target_processing_properties_;
   }
    : create_integration_resource_property_response)

let make_create_integration_resource_property_request
    ?source_processing_properties:
      (source_processing_properties_ : source_processing_properties option)
    ?target_processing_properties:
      (target_processing_properties_ : target_processing_properties option)
    ?tags:(tags_ : integration_tags_list option) ~resource_arn:(resource_arn_ : string512) () =
  ({
     resource_arn = resource_arn_;
     source_processing_properties = source_processing_properties_;
     target_processing_properties = target_processing_properties_;
     tags = tags_;
   }
    : create_integration_resource_property_request)

let make_create_integration_response ?description:(description_ : integration_description option)
    ?kms_key_id:(kms_key_id_ : string2048 option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?tags:(tags_ : integration_tags_list option) ?errors:(errors_ : integration_error_list option)
    ?data_filter:(data_filter_ : string2048 option)
    ?integration_config:(integration_config_ : integration_config option)
    ~source_arn:(source_arn_ : string512) ~target_arn:(target_arn_ : string512)
    ~integration_name:(integration_name_ : string128)
    ~integration_arn:(integration_arn_ : string128) ~status:(status_ : integration_status)
    ~create_time:(create_time_ : integration_timestamp) () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     integration_name = integration_name_;
     description = description_;
     integration_arn = integration_arn_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     tags = tags_;
     status = status_;
     create_time = create_time_;
     errors = errors_;
     data_filter = data_filter_;
     integration_config = integration_config_;
   }
    : create_integration_response)

let make_create_integration_request ?description:(description_ : integration_description option)
    ?data_filter:(data_filter_ : string2048 option) ?kms_key_id:(kms_key_id_ : string2048 option)
    ?additional_encryption_context:
      (additional_encryption_context_ : integration_additional_encryption_context_map option)
    ?tags:(tags_ : integration_tags_list option)
    ?integration_config:(integration_config_ : integration_config option)
    ~integration_name:(integration_name_ : string128) ~source_arn:(source_arn_ : string512)
    ~target_arn:(target_arn_ : string512) () =
  ({
     integration_name = integration_name_;
     source_arn = source_arn_;
     target_arn = target_arn_;
     description = description_;
     data_filter = data_filter_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     tags = tags_;
     integration_config = integration_config_;
   }
    : create_integration_request)

let make_create_glue_identity_center_configuration_response
    ?application_arn:(application_arn_ : application_arn option) () =
  ({ application_arn = application_arn_ } : create_glue_identity_center_configuration_response)

let make_create_glue_identity_center_configuration_request
    ?scopes:(scopes_ : identity_center_scopes_list option)
    ?user_background_sessions_enabled:(user_background_sessions_enabled_ : nullable_boolean option)
    ~instance_arn:(instance_arn_ : identity_center_instance_arn) () =
  ({
     instance_arn = instance_arn_;
     scopes = scopes_;
     user_background_sessions_enabled = user_background_sessions_enabled_;
   }
    : create_glue_identity_center_configuration_request)

let make_create_glossary_term_response ?id:(id_ : glossary_term_id option)
    ?glossary_id:(glossary_id_ : glossary_id option) ?name:(name_ : glossary_term_name option)
    ?short_description:(short_description_ : glossary_short_description option)
    ?long_description:(long_description_ : glossary_long_description option) () =
  ({
     id = id_;
     glossary_id = glossary_id_;
     name = name_;
     short_description = short_description_;
     long_description = long_description_;
   }
    : create_glossary_term_response)

let make_create_glossary_term_request
    ?short_description:(short_description_ : glossary_short_description option)
    ?long_description:(long_description_ : glossary_long_description option)
    ?client_token:(client_token_ : hash_string option)
    ~glossary_identifier:(glossary_identifier_ : glossary_id) ~name:(name_ : glossary_term_name) ()
    =
  ({
     glossary_identifier = glossary_identifier_;
     name = name_;
     short_description = short_description_;
     long_description = long_description_;
     client_token = client_token_;
   }
    : create_glossary_term_request)

let make_create_glossary_response ?id:(id_ : glossary_id option)
    ?name:(name_ : glossary_name option) ?description:(description_ : metadata_description option)
    () =
  ({ id = id_; name = name_; description = description_ } : create_glossary_response)

let make_create_glossary_request ?description:(description_ : metadata_description option)
    ?client_token:(client_token_ : hash_string option) ~name:(name_ : glossary_name) () =
  ({ name = name_; description = description_; client_token = client_token_ }
    : create_glossary_request)

let make_create_dev_endpoint_response ?endpoint_name:(endpoint_name_ : generic_string option)
    ?status:(status_ : generic_string option)
    ?security_group_ids:(security_group_ids_ : string_list option)
    ?subnet_id:(subnet_id_ : generic_string option) ?role_arn:(role_arn_ : role_arn option)
    ?yarn_endpoint_address:(yarn_endpoint_address_ : generic_string option)
    ?zeppelin_remote_spark_interpreter_port:
      (zeppelin_remote_spark_interpreter_port_ : integer_value option)
    ?number_of_nodes:(number_of_nodes_ : integer_value option)
    ?worker_type:(worker_type_ : worker_type option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?availability_zone:(availability_zone_ : generic_string option)
    ?vpc_id:(vpc_id_ : generic_string option)
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option)
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option)
    ?failure_reason:(failure_reason_ : generic_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?created_timestamp:(created_timestamp_ : timestamp_value option)
    ?arguments:(arguments_ : map_value option) () =
  ({
     endpoint_name = endpoint_name_;
     status = status_;
     security_group_ids = security_group_ids_;
     subnet_id = subnet_id_;
     role_arn = role_arn_;
     yarn_endpoint_address = yarn_endpoint_address_;
     zeppelin_remote_spark_interpreter_port = zeppelin_remote_spark_interpreter_port_;
     number_of_nodes = number_of_nodes_;
     worker_type = worker_type_;
     glue_version = glue_version_;
     number_of_workers = number_of_workers_;
     availability_zone = availability_zone_;
     vpc_id = vpc_id_;
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
     extra_jars_s3_path = extra_jars_s3_path_;
     failure_reason = failure_reason_;
     security_configuration = security_configuration_;
     created_timestamp = created_timestamp_;
     arguments = arguments_;
   }
    : create_dev_endpoint_response)

let make_create_dev_endpoint_request ?security_group_ids:(security_group_ids_ : string_list option)
    ?subnet_id:(subnet_id_ : generic_string option)
    ?public_key:(public_key_ : generic_string option)
    ?public_keys:(public_keys_ : public_keys_list option)
    ?number_of_nodes:(number_of_nodes_ : integer_value option)
    ?worker_type:(worker_type_ : worker_type option)
    ?glue_version:(glue_version_ : glue_version_string option)
    ?number_of_workers:(number_of_workers_ : nullable_integer option)
    ?extra_python_libs_s3_path:(extra_python_libs_s3_path_ : generic_string option)
    ?extra_jars_s3_path:(extra_jars_s3_path_ : generic_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?tags:(tags_ : tags_map option) ?arguments:(arguments_ : map_value option)
    ~endpoint_name:(endpoint_name_ : generic_string) ~role_arn:(role_arn_ : role_arn) () =
  ({
     endpoint_name = endpoint_name_;
     role_arn = role_arn_;
     security_group_ids = security_group_ids_;
     subnet_id = subnet_id_;
     public_key = public_key_;
     public_keys = public_keys_;
     number_of_nodes = number_of_nodes_;
     worker_type = worker_type_;
     glue_version = glue_version_;
     number_of_workers = number_of_workers_;
     extra_python_libs_s3_path = extra_python_libs_s3_path_;
     extra_jars_s3_path = extra_jars_s3_path_;
     security_configuration = security_configuration_;
     tags = tags_;
     arguments = arguments_;
   }
    : create_dev_endpoint_request)

let make_create_data_quality_ruleset_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_data_quality_ruleset_response)

let make_create_data_quality_ruleset_request ?description:(description_ : description_string option)
    ?tags:(tags_ : tags_map option) ?target_table:(target_table_ : data_quality_target_table option)
    ?data_quality_security_configuration:(data_quality_security_configuration_ : name_string option)
    ?client_token:(client_token_ : hash_string option) ~name:(name_ : name_string)
    ~ruleset:(ruleset_ : data_quality_ruleset_string) () =
  ({
     name = name_;
     description = description_;
     ruleset = ruleset_;
     tags = tags_;
     target_table = target_table_;
     data_quality_security_configuration = data_quality_security_configuration_;
     client_token = client_token_;
   }
    : create_data_quality_ruleset_request)

let make_create_database_response () = (() : unit)

let make_create_database_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?tags:(tags_ : tags_map option) ~database_input:(database_input_ : database_input) () =
  ({ catalog_id = catalog_id_; database_input = database_input_; tags = tags_ }
    : create_database_request)

let make_create_custom_entity_type_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_custom_entity_type_response)

let make_create_custom_entity_type_request ?context_words:(context_words_ : context_words option)
    ?tags:(tags_ : tags_map option) ~name:(name_ : name_string)
    ~regex_string:(regex_string_ : name_string) () =
  ({ name = name_; regex_string = regex_string_; context_words = context_words_; tags = tags_ }
    : create_custom_entity_type_request)

let make_create_crawler_response () = (() : unit)

let make_create_crawler_request ?database_name:(database_name_ : database_name option)
    ?description:(description_ : description_string option)
    ?schedule:(schedule_ : cron_expression option)
    ?classifiers:(classifiers_ : classifier_name_list option)
    ?table_prefix:(table_prefix_ : table_prefix option)
    ?schema_change_policy:(schema_change_policy_ : schema_change_policy option)
    ?recrawl_policy:(recrawl_policy_ : recrawl_policy option)
    ?lineage_configuration:(lineage_configuration_ : lineage_configuration option)
    ?lake_formation_configuration:
      (lake_formation_configuration_ : lake_formation_configuration option)
    ?configuration:(configuration_ : crawler_configuration option)
    ?crawler_security_configuration:
      (crawler_security_configuration_ : crawler_security_configuration option)
    ?tags:(tags_ : tags_map option) ~name:(name_ : name_string) ~role:(role_ : role)
    ~targets:(targets_ : crawler_targets) () =
  ({
     name = name_;
     role = role_;
     database_name = database_name_;
     description = description_;
     targets = targets_;
     schedule = schedule_;
     classifiers = classifiers_;
     table_prefix = table_prefix_;
     schema_change_policy = schema_change_policy_;
     recrawl_policy = recrawl_policy_;
     lineage_configuration = lineage_configuration_;
     lake_formation_configuration = lake_formation_configuration_;
     configuration = configuration_;
     crawler_security_configuration = crawler_security_configuration_;
     tags = tags_;
   }
    : create_crawler_request)

let make_create_connection_response
    ?create_connection_status:(create_connection_status_ : connection_status option) () =
  ({ create_connection_status = create_connection_status_ } : create_connection_response)

let make_create_connection_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?tags:(tags_ : tags_map option) ~connection_input:(connection_input_ : connection_input) () =
  ({ catalog_id = catalog_id_; connection_input = connection_input_; tags = tags_ }
    : create_connection_request)

let make_create_column_statistics_task_settings_response () = (() : unit)

let make_create_column_statistics_task_settings_request
    ?schedule:(schedule_ : cron_expression option)
    ?column_name_list:(column_name_list_ : column_name_list option)
    ?sample_size:(sample_size_ : sample_size_percentage option)
    ?catalog_i_d:(catalog_i_d_ : name_string option)
    ?security_configuration:(security_configuration_ : name_string option)
    ?tags:(tags_ : tags_map option) ~database_name:(database_name_ : name_string)
    ~table_name:(table_name_ : name_string) ~role:(role_ : name_string) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     role = role_;
     schedule = schedule_;
     column_name_list = column_name_list_;
     sample_size = sample_size_;
     catalog_i_d = catalog_i_d_;
     security_configuration = security_configuration_;
     tags = tags_;
   }
    : create_column_statistics_task_settings_request)

let make_create_classifier_response () = (() : unit)

let make_create_csv_classifier_request ?delimiter:(delimiter_ : csv_column_delimiter option)
    ?quote_symbol:(quote_symbol_ : csv_quote_symbol option)
    ?contains_header:(contains_header_ : csv_header_option option)
    ?header:(header_ : csv_header option)
    ?disable_value_trimming:(disable_value_trimming_ : nullable_boolean option)
    ?allow_single_column:(allow_single_column_ : nullable_boolean option)
    ?custom_datatype_configured:(custom_datatype_configured_ : nullable_boolean option)
    ?custom_datatypes:(custom_datatypes_ : custom_datatypes option)
    ?serde:(serde_ : csv_serde_option option) ~name:(name_ : name_string) () =
  ({
     name = name_;
     delimiter = delimiter_;
     quote_symbol = quote_symbol_;
     contains_header = contains_header_;
     header = header_;
     disable_value_trimming = disable_value_trimming_;
     allow_single_column = allow_single_column_;
     custom_datatype_configured = custom_datatype_configured_;
     custom_datatypes = custom_datatypes_;
     serde = serde_;
   }
    : create_csv_classifier_request)

let make_create_json_classifier_request ~name:(name_ : name_string)
    ~json_path:(json_path_ : json_path) () =
  ({ name = name_; json_path = json_path_ } : create_json_classifier_request)

let make_create_xml_classifier_request ?row_tag:(row_tag_ : row_tag option)
    ~classification:(classification_ : classification) ~name:(name_ : name_string) () =
  ({ classification = classification_; name = name_; row_tag = row_tag_ }
    : create_xml_classifier_request)

let make_create_grok_classifier_request ?custom_patterns:(custom_patterns_ : custom_patterns option)
    ~classification:(classification_ : classification) ~name:(name_ : name_string)
    ~grok_pattern:(grok_pattern_ : grok_pattern) () =
  ({
     classification = classification_;
     name = name_;
     grok_pattern = grok_pattern_;
     custom_patterns = custom_patterns_;
   }
    : create_grok_classifier_request)

let make_create_classifier_request
    ?grok_classifier:(grok_classifier_ : create_grok_classifier_request option)
    ?xml_classifier:(xml_classifier_ : create_xml_classifier_request option)
    ?json_classifier:(json_classifier_ : create_json_classifier_request option)
    ?csv_classifier:(csv_classifier_ : create_csv_classifier_request option) () =
  ({
     grok_classifier = grok_classifier_;
     xml_classifier = xml_classifier_;
     json_classifier = json_classifier_;
     csv_classifier = csv_classifier_;
   }
    : create_classifier_request)

let make_create_catalog_response () = (() : unit)

let make_create_catalog_request ?tags:(tags_ : tags_map option) ~name:(name_ : catalog_name_string)
    ~catalog_input:(catalog_input_ : catalog_input) () =
  ({ name = name_; catalog_input = catalog_input_; tags = tags_ } : create_catalog_request)

let make_create_blueprint_response ?name:(name_ : name_string option) () =
  ({ name = name_ } : create_blueprint_response)

let make_create_blueprint_request ?description:(description_ : generic512_char_string option)
    ?tags:(tags_ : tags_map option) ~name:(name_ : orchestration_name_string)
    ~blueprint_location:(blueprint_location_ : orchestration_s3_location) () =
  ({
     name = name_;
     description = description_;
     blueprint_location = blueprint_location_;
     tags = tags_;
   }
    : create_blueprint_request)

let make_check_schema_version_validity_response ?valid:(valid_ : is_version_valid option)
    ?error:(error_ : schema_validation_error option) () =
  ({ valid = valid_; error = error_ } : check_schema_version_validity_response)

let make_check_schema_version_validity_input ~data_format:(data_format_ : data_format)
    ~schema_definition:(schema_definition_ : schema_definition_string) () =
  ({ data_format = data_format_; schema_definition = schema_definition_ }
    : check_schema_version_validity_input)

let make_cancel_statement_response () = (() : unit)

let make_cancel_statement_request
    ?request_origin:(request_origin_ : orchestration_name_string option)
    ~session_id:(session_id_ : name_string) ~id:(id_ : integer_value) () =
  ({ session_id = session_id_; id = id_; request_origin = request_origin_ }
    : cancel_statement_request)

let make_cancel_ml_task_run_response ?transform_id:(transform_id_ : hash_string option)
    ?task_run_id:(task_run_id_ : hash_string option) ?status:(status_ : task_status_type option) ()
    =
  ({ transform_id = transform_id_; task_run_id = task_run_id_; status = status_ }
    : cancel_ml_task_run_response)

let make_cancel_ml_task_run_request ~transform_id:(transform_id_ : hash_string)
    ~task_run_id:(task_run_id_ : hash_string) () =
  ({ transform_id = transform_id_; task_run_id = task_run_id_ } : cancel_ml_task_run_request)

let make_cancel_data_quality_ruleset_evaluation_run_response () = (() : unit)

let make_cancel_data_quality_ruleset_evaluation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : cancel_data_quality_ruleset_evaluation_run_request)

let make_cancel_data_quality_rule_recommendation_run_response () = (() : unit)

let make_cancel_data_quality_rule_recommendation_run_request ~run_id:(run_id_ : hash_string) () =
  ({ run_id = run_id_ } : cancel_data_quality_rule_recommendation_run_request)

let make_batch_update_partition_failure_entry
    ?partition_value_list:(partition_value_list_ : bounded_partition_value_list option)
    ?error_detail:(error_detail_ : error_detail option) () =
  ({ partition_value_list = partition_value_list_; error_detail = error_detail_ }
    : batch_update_partition_failure_entry)

let make_batch_update_partition_response
    ?errors:(errors_ : batch_update_partition_failure_list option) () =
  ({ errors = errors_ } : batch_update_partition_response)

let make_batch_update_partition_request_entry
    ~partition_value_list:(partition_value_list_ : bounded_partition_value_list)
    ~partition_input:(partition_input_ : partition_input) () =
  ({ partition_value_list = partition_value_list_; partition_input = partition_input_ }
    : batch_update_partition_request_entry)

let make_batch_update_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~entries:(entries_ : batch_update_partition_request_entry_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     entries = entries_;
   }
    : batch_update_partition_request)

let make_batch_stop_job_run_error ?job_name:(job_name_ : name_string option)
    ?job_run_id:(job_run_id_ : id_string option) ?error_detail:(error_detail_ : error_detail option)
    () =
  ({ job_name = job_name_; job_run_id = job_run_id_; error_detail = error_detail_ }
    : batch_stop_job_run_error)

let make_batch_stop_job_run_successful_submission ?job_name:(job_name_ : name_string option)
    ?job_run_id:(job_run_id_ : id_string option) () =
  ({ job_name = job_name_; job_run_id = job_run_id_ } : batch_stop_job_run_successful_submission)

let make_batch_stop_job_run_response
    ?successful_submissions:
      (successful_submissions_ : batch_stop_job_run_successful_submission_list option)
    ?errors:(errors_ : batch_stop_job_run_error_list option) () =
  ({ successful_submissions = successful_submissions_; errors = errors_ }
    : batch_stop_job_run_response)

let make_batch_stop_job_run_request ~job_name:(job_name_ : name_string)
    ~job_run_ids:(job_run_ids_ : batch_stop_job_run_job_run_id_list) () =
  ({ job_name = job_name_; job_run_ids = job_run_ids_ } : batch_stop_job_run_request)

let make_annotation_error ?profile_id:(profile_id_ : hash_string option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?failure_reason:(failure_reason_ : description_string option) () =
  ({ profile_id = profile_id_; statistic_id = statistic_id_; failure_reason = failure_reason_ }
    : annotation_error)

let make_batch_put_data_quality_statistic_annotation_response
    ?failed_inclusion_annotations:(failed_inclusion_annotations_ : annotation_error_list option) ()
    =
  ({ failed_inclusion_annotations = failed_inclusion_annotations_ }
    : batch_put_data_quality_statistic_annotation_response)

let make_datapoint_inclusion_annotation ?profile_id:(profile_id_ : hash_string option)
    ?statistic_id:(statistic_id_ : hash_string option)
    ?inclusion_annotation:(inclusion_annotation_ : inclusion_annotation_value option) () =
  ({
     profile_id = profile_id_;
     statistic_id = statistic_id_;
     inclusion_annotation = inclusion_annotation_;
   }
    : datapoint_inclusion_annotation)

let make_batch_put_data_quality_statistic_annotation_request
    ?client_token:(client_token_ : hash_string option)
    ~inclusion_annotations:(inclusion_annotations_ : inclusion_annotation_list) () =
  ({ inclusion_annotations = inclusion_annotations_; client_token = client_token_ }
    : batch_put_data_quality_statistic_annotation_request)

let make_batch_get_workflows_response ?workflows:(workflows_ : workflows option)
    ?missing_workflows:(missing_workflows_ : workflow_names option) () =
  ({ workflows = workflows_; missing_workflows = missing_workflows_ }
    : batch_get_workflows_response)

let make_batch_get_workflows_request ?include_graph:(include_graph_ : nullable_boolean option)
    ~names:(names_ : workflow_names) () =
  ({ names = names_; include_graph = include_graph_ } : batch_get_workflows_request)

let make_batch_get_triggers_response ?triggers:(triggers_ : trigger_list option)
    ?triggers_not_found:(triggers_not_found_ : trigger_name_list option) () =
  ({ triggers = triggers_; triggers_not_found = triggers_not_found_ } : batch_get_triggers_response)

let make_batch_get_triggers_request ~trigger_names:(trigger_names_ : trigger_name_list) () =
  ({ trigger_names = trigger_names_ } : batch_get_triggers_request)

let make_batch_get_table_optimizer_error ?error:(error_ : error_detail option)
    ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : database_name_string option)
    ?table_name:(table_name_ : table_name_string option)
    ?type_:(type__ : table_optimizer_type option) () =
  ({
     error = error_;
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     type_ = type__;
   }
    : batch_get_table_optimizer_error)

let make_batch_table_optimizer ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : database_name_string option)
    ?table_name:(table_name_ : table_name_string option)
    ?table_optimizer:(table_optimizer_ : table_optimizer option) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     table_optimizer = table_optimizer_;
   }
    : batch_table_optimizer)

let make_batch_get_table_optimizer_response
    ?table_optimizers:(table_optimizers_ : batch_table_optimizers option)
    ?failures:(failures_ : batch_get_table_optimizer_errors option) () =
  ({ table_optimizers = table_optimizers_; failures = failures_ }
    : batch_get_table_optimizer_response)

let make_batch_get_table_optimizer_entry ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?database_name:(database_name_ : database_name_string option)
    ?table_name:(table_name_ : table_name_string option)
    ?type_:(type__ : table_optimizer_type option) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     type_ = type__;
   }
    : batch_get_table_optimizer_entry)

let make_batch_get_table_optimizer_request ~entries:(entries_ : batch_get_table_optimizer_entries)
    () =
  ({ entries = entries_ } : batch_get_table_optimizer_request)

let make_batch_get_partition_response ?partitions:(partitions_ : partition_list option)
    ?unprocessed_keys:(unprocessed_keys_ : batch_get_partition_value_list option) () =
  ({ partitions = partitions_; unprocessed_keys = unprocessed_keys_ }
    : batch_get_partition_response)

let make_batch_get_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?audit_context:(audit_context_ : audit_context option)
    ?query_session_context:(query_session_context_ : query_session_context option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partitions_to_get:(partitions_to_get_ : batch_get_partition_value_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partitions_to_get = partitions_to_get_;
     audit_context = audit_context_;
     query_session_context = query_session_context_;
   }
    : batch_get_partition_request)

let make_batch_get_jobs_response ?jobs:(jobs_ : job_list option)
    ?jobs_not_found:(jobs_not_found_ : job_name_list option) () =
  ({ jobs = jobs_; jobs_not_found = jobs_not_found_ } : batch_get_jobs_response)

let make_batch_get_jobs_request ~job_names:(job_names_ : job_name_list) () =
  ({ job_names = job_names_ } : batch_get_jobs_request)

let make_item_error ?item_identifier:(item_identifier_ : item_identifier option)
    ?code:(code_ : item_error_code option) ?message:(message_ : item_error_message option) () =
  ({ item_identifier = item_identifier_; code = code_; message = message_ } : item_error)

let make_iterable_form_item ?item_id:(item_id_ : item_id option)
    ?item_name:(item_name_ : item_name option)
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option)
    ?forms:(forms_ : asset_form_map option) ?attachments:(attachments_ : asset_form_map option) () =
  ({
     item_id = item_id_;
     item_name = item_name_;
     glossary_terms = glossary_terms_;
     forms = forms_;
     attachments = attachments_;
   }
    : iterable_form_item)

let make_batch_get_iterable_forms_response ?items:(items_ : iterable_form_item_list option)
    ?errors:(errors_ : item_error_list option) () =
  ({ items = items_; errors = errors_ } : batch_get_iterable_forms_response)

let make_batch_get_iterable_forms_request ~asset_identifier:(asset_identifier_ : asset_id)
    ~iterable_form_name:(iterable_form_name_ : iterable_form_name)
    ~item_identifiers:(item_identifiers_ : item_identifier_list) () =
  ({
     asset_identifier = asset_identifier_;
     iterable_form_name = iterable_form_name_;
     item_identifiers = item_identifiers_;
   }
    : batch_get_iterable_forms_request)

let make_batch_get_dev_endpoints_response ?dev_endpoints:(dev_endpoints_ : dev_endpoint_list option)
    ?dev_endpoints_not_found:(dev_endpoints_not_found_ : dev_endpoint_names option) () =
  ({ dev_endpoints = dev_endpoints_; dev_endpoints_not_found = dev_endpoints_not_found_ }
    : batch_get_dev_endpoints_response)

let make_batch_get_dev_endpoints_request
    ~dev_endpoint_names:(dev_endpoint_names_ : dev_endpoint_names) () =
  ({ dev_endpoint_names = dev_endpoint_names_ } : batch_get_dev_endpoints_request)

let make_batch_get_data_quality_result_response
    ?results_not_found:(results_not_found_ : data_quality_result_ids option)
    ~results:(results_ : data_quality_results_list) () =
  ({ results = results_; results_not_found = results_not_found_ }
    : batch_get_data_quality_result_response)

let make_batch_get_data_quality_result_request ~result_ids:(result_ids_ : data_quality_result_ids)
    () =
  ({ result_ids = result_ids_ } : batch_get_data_quality_result_request)

let make_batch_get_custom_entity_types_response
    ?custom_entity_types:(custom_entity_types_ : custom_entity_types option)
    ?custom_entity_types_not_found:
      (custom_entity_types_not_found_ : custom_entity_type_names option) () =
  ({
     custom_entity_types = custom_entity_types_;
     custom_entity_types_not_found = custom_entity_types_not_found_;
   }
    : batch_get_custom_entity_types_response)

let make_batch_get_custom_entity_types_request ~names:(names_ : custom_entity_type_names) () =
  ({ names = names_ } : batch_get_custom_entity_types_request)

let make_batch_get_crawlers_response ?crawlers:(crawlers_ : crawler_list option)
    ?crawlers_not_found:(crawlers_not_found_ : crawler_name_list option) () =
  ({ crawlers = crawlers_; crawlers_not_found = crawlers_not_found_ } : batch_get_crawlers_response)

let make_batch_get_crawlers_request ~crawler_names:(crawler_names_ : crawler_name_list) () =
  ({ crawler_names = crawler_names_ } : batch_get_crawlers_request)

let make_batch_get_blueprints_response ?blueprints:(blueprints_ : blueprints option)
    ?missing_blueprints:(missing_blueprints_ : blueprint_names option) () =
  ({ blueprints = blueprints_; missing_blueprints = missing_blueprints_ }
    : batch_get_blueprints_response)

let make_batch_get_blueprints_request
    ?include_blueprint:(include_blueprint_ : nullable_boolean option)
    ?include_parameter_spec:(include_parameter_spec_ : nullable_boolean option)
    ~names:(names_ : batch_get_blueprint_names) () =
  ({
     names = names_;
     include_blueprint = include_blueprint_;
     include_parameter_spec = include_parameter_spec_;
   }
    : batch_get_blueprints_request)

let make_table_version_error ?table_name:(table_name_ : name_string option)
    ?version_id:(version_id_ : version_string option)
    ?error_detail:(error_detail_ : error_detail option) () =
  ({ table_name = table_name_; version_id = version_id_; error_detail = error_detail_ }
    : table_version_error)

let make_batch_delete_table_version_response ?errors:(errors_ : table_version_errors option) () =
  ({ errors = errors_ } : batch_delete_table_version_response)

let make_batch_delete_table_version_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~version_ids:(version_ids_ : batch_delete_table_version_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     version_ids = version_ids_;
   }
    : batch_delete_table_version_request)

let make_table_error ?table_name:(table_name_ : name_string option)
    ?error_detail:(error_detail_ : error_detail option) () =
  ({ table_name = table_name_; error_detail = error_detail_ } : table_error)

let make_batch_delete_table_response ?errors:(errors_ : table_errors option) () =
  ({ errors = errors_ } : batch_delete_table_response)

let make_batch_delete_table_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ?transaction_id:(transaction_id_ : transaction_id_string option)
    ~database_name:(database_name_ : name_string)
    ~tables_to_delete:(tables_to_delete_ : batch_delete_table_name_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     tables_to_delete = tables_to_delete_;
     transaction_id = transaction_id_;
   }
    : batch_delete_table_request)

let make_partition_error ?partition_values:(partition_values_ : value_string_list option)
    ?error_detail:(error_detail_ : error_detail option) () =
  ({ partition_values = partition_values_; error_detail = error_detail_ } : partition_error)

let make_batch_delete_partition_response ?errors:(errors_ : partition_errors option) () =
  ({ errors = errors_ } : batch_delete_partition_response)

let make_batch_delete_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partitions_to_delete:(partitions_to_delete_ : batch_delete_partition_value_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partitions_to_delete = partitions_to_delete_;
   }
    : batch_delete_partition_request)

let make_batch_delete_connection_response ?succeeded:(succeeded_ : name_string_list option)
    ?errors:(errors_ : error_by_name option) () =
  ({ succeeded = succeeded_; errors = errors_ } : batch_delete_connection_response)

let make_batch_delete_connection_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~connection_name_list:(connection_name_list_ : delete_connection_name_list) () =
  ({ catalog_id = catalog_id_; connection_name_list = connection_name_list_ }
    : batch_delete_connection_request)

let make_batch_create_partition_response ?errors:(errors_ : partition_errors option) () =
  ({ errors = errors_ } : batch_create_partition_response)

let make_batch_create_partition_request ?catalog_id:(catalog_id_ : catalog_id_string option)
    ~database_name:(database_name_ : name_string) ~table_name:(table_name_ : name_string)
    ~partition_input_list:(partition_input_list_ : partition_input_list) () =
  ({
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     partition_input_list = partition_input_list_;
   }
    : batch_create_partition_request)

let make_associate_glossary_terms_response ?asset_identifier:(asset_identifier_ : asset_id option)
    ?glossary_terms:(glossary_terms_ : glossary_term_id_list option) () =
  ({ asset_identifier = asset_identifier_; glossary_terms = glossary_terms_ }
    : associate_glossary_terms_response)

let make_associate_glossary_terms_request ?client_token:(client_token_ : hash_string option)
    ~asset_identifier:(asset_identifier_ : asset_id)
    ~glossary_term_identifiers:(glossary_term_identifiers_ : glossary_term_id_list) () =
  ({
     asset_identifier = asset_identifier_;
     glossary_term_identifiers = glossary_term_identifiers_;
     client_token = client_token_;
   }
    : associate_glossary_terms_request)
