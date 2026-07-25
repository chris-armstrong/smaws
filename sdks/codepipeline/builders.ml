open Types

let make_aws_session_credentials ~access_key_id:(access_key_id_ : access_key_id)
    ~secret_access_key:(secret_access_key_ : secret_access_key)
    ~session_token:(session_token_ : session_token) () =
  ({
     access_key_id = access_key_id_;
     secret_access_key = secret_access_key_;
     session_token = session_token_;
   }
    : aws_session_credentials)

let make_acknowledge_job_output ?status:(status_ : job_status option) () =
  ({ status = status_ } : acknowledge_job_output)

let make_acknowledge_job_input ~job_id:(job_id_ : job_id) ~nonce:(nonce_ : nonce) () =
  ({ job_id = job_id_; nonce = nonce_ } : acknowledge_job_input)

let make_acknowledge_third_party_job_output ?status:(status_ : job_status option) () =
  ({ status = status_ } : acknowledge_third_party_job_output)

let make_acknowledge_third_party_job_input ~job_id:(job_id_ : third_party_job_id)
    ~nonce:(nonce_ : nonce) ~client_token:(client_token_ : client_token) () =
  ({ job_id = job_id_; nonce = nonce_; client_token = client_token_ }
    : acknowledge_third_party_job_input)

let make_action_configuration ?configuration:(configuration_ : action_configuration_map option) () =
  ({ configuration = configuration_ } : action_configuration)

let make_action_configuration_property ?queryable:(queryable_ : boolean_ option)
    ?description:(description_ : description option)
    ?type_:(type__ : action_configuration_property_type option)
    ~name:(name_ : action_configuration_key) ~required:(required_ : boolean_) ~key:(key_ : boolean_)
    ~secret:(secret_ : boolean_) () =
  ({
     name = name_;
     required = required_;
     key = key_;
     secret = secret_;
     queryable = queryable_;
     description = description_;
     type_ = type__;
   }
    : action_configuration_property)

let make_action_context ?name:(name_ : action_name option)
    ?action_execution_id:(action_execution_id_ : action_execution_id option) () =
  ({ name = name_; action_execution_id = action_execution_id_ } : action_context)

let make_environment_variable ?type_:(type__ : environment_variable_type option)
    ~name:(name_ : environment_variable_name) ~value:(value_ : environment_variable_value) () =
  ({ name = name_; value = value_; type_ = type__ } : environment_variable)

let make_input_artifact ~name:(name_ : artifact_name) () = ({ name = name_ } : input_artifact)

let make_output_artifact ?files:(files_ : file_path_list option) ~name:(name_ : artifact_name) () =
  ({ name = name_; files = files_ } : output_artifact)

let make_action_type_id ~category:(category_ : action_category) ~owner:(owner_ : action_owner)
    ~provider:(provider_ : action_provider) ~version:(version_ : version) () =
  ({ category = category_; owner = owner_; provider = provider_; version = version_ }
    : action_type_id)

let make_action_declaration ?run_order:(run_order_ : action_run_order option)
    ?configuration:(configuration_ : action_configuration_map option)
    ?commands:(commands_ : command_list option)
    ?output_artifacts:(output_artifacts_ : output_artifact_list option)
    ?input_artifacts:(input_artifacts_ : input_artifact_list option)
    ?output_variables:(output_variables_ : output_variable_list option)
    ?role_arn:(role_arn_ : role_arn option) ?region:(region_ : aws_region_name option)
    ?namespace:(namespace_ : action_namespace option)
    ?timeout_in_minutes:(timeout_in_minutes_ : action_timeout option)
    ?environment_variables:(environment_variables_ : environment_variable_list option)
    ~name:(name_ : action_name) ~action_type_id:(action_type_id_ : action_type_id) () =
  ({
     name = name_;
     action_type_id = action_type_id_;
     run_order = run_order_;
     configuration = configuration_;
     commands = commands_;
     output_artifacts = output_artifacts_;
     input_artifacts = input_artifacts_;
     output_variables = output_variables_;
     role_arn = role_arn_;
     region = region_;
     namespace = namespace_;
     timeout_in_minutes = timeout_in_minutes_;
     environment_variables = environment_variables_;
   }
    : action_declaration)

let make_error_details ?code:(code_ : code option) ?message:(message_ : message option) () =
  ({ code = code_; message = message_ } : error_details)

let make_action_execution ?action_execution_id:(action_execution_id_ : action_execution_id option)
    ?status:(status_ : action_execution_status option)
    ?summary:(summary_ : execution_summary option)
    ?last_status_change:(last_status_change_ : timestamp option)
    ?token:(token_ : action_execution_token option)
    ?last_updated_by:(last_updated_by_ : last_updated_by option)
    ?external_execution_id:(external_execution_id_ : execution_id option)
    ?external_execution_url:(external_execution_url_ : url option)
    ?percent_complete:(percent_complete_ : percentage option)
    ?error_details:(error_details_ : error_details option)
    ?log_stream_ar_n:(log_stream_ar_n_ : log_stream_ar_n option) () =
  ({
     action_execution_id = action_execution_id_;
     status = status_;
     summary = summary_;
     last_status_change = last_status_change_;
     token = token_;
     last_updated_by = last_updated_by_;
     external_execution_id = external_execution_id_;
     external_execution_url = external_execution_url_;
     percent_complete = percent_complete_;
     error_details = error_details_;
     log_stream_ar_n = log_stream_ar_n_;
   }
    : action_execution)

let make_s3_location ?bucket:(bucket_ : s3_bucket option) ?key:(key_ : s3_key option) () =
  ({ bucket = bucket_; key = key_ } : s3_location)

let make_artifact_detail ?name:(name_ : artifact_name option)
    ?s3location:(s3location_ : s3_location option) () =
  ({ name = name_; s3location = s3location_ } : artifact_detail)

let make_action_execution_output ?output_artifacts:(output_artifacts_ : artifact_detail_list option)
    ?execution_result:(execution_result_ : action_execution_result option)
    ?output_variables:(output_variables_ : output_variables_map option) () =
  ({
     output_artifacts = output_artifacts_;
     execution_result = execution_result_;
     output_variables = output_variables_;
   }
    : action_execution_output)

let make_action_execution_input ?action_type_id:(action_type_id_ : action_type_id option)
    ?configuration:(configuration_ : action_configuration_map option)
    ?resolved_configuration:(resolved_configuration_ : resolved_action_configuration_map option)
    ?role_arn:(role_arn_ : role_arn option) ?region:(region_ : aws_region_name option)
    ?input_artifacts:(input_artifacts_ : artifact_detail_list option)
    ?namespace:(namespace_ : action_namespace option) () =
  ({
     action_type_id = action_type_id_;
     configuration = configuration_;
     resolved_configuration = resolved_configuration_;
     role_arn = role_arn_;
     region = region_;
     input_artifacts = input_artifacts_;
     namespace = namespace_;
   }
    : action_execution_input)

let make_action_execution_detail
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?action_execution_id:(action_execution_id_ : action_execution_id option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?stage_name:(stage_name_ : stage_name option) ?action_name:(action_name_ : action_name option)
    ?start_time:(start_time_ : timestamp option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?updated_by:(updated_by_ : last_updated_by option)
    ?status:(status_ : action_execution_status option)
    ?input:(input_ : action_execution_input option)
    ?output:(output_ : action_execution_output option) () =
  ({
     pipeline_execution_id = pipeline_execution_id_;
     action_execution_id = action_execution_id_;
     pipeline_version = pipeline_version_;
     stage_name = stage_name_;
     action_name = action_name_;
     start_time = start_time_;
     last_update_time = last_update_time_;
     updated_by = updated_by_;
     status = status_;
     input = input_;
     output = output_;
   }
    : action_execution_detail)

let make_latest_in_pipeline_execution_filter
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~start_time_range:(start_time_range_ : start_time_range) () =
  ({ pipeline_execution_id = pipeline_execution_id_; start_time_range = start_time_range_ }
    : latest_in_pipeline_execution_filter)

let make_action_execution_filter
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?latest_in_pipeline_execution:
      (latest_in_pipeline_execution_ : latest_in_pipeline_execution_filter option) () =
  ({
     pipeline_execution_id = pipeline_execution_id_;
     latest_in_pipeline_execution = latest_in_pipeline_execution_;
   }
    : action_execution_filter)

let make_action_revision ~revision_id:(revision_id_ : revision)
    ~revision_change_id:(revision_change_id_ : revision_change_identifier)
    ~created:(created_ : timestamp) () =
  ({ revision_id = revision_id_; revision_change_id = revision_change_id_; created = created_ }
    : action_revision)

let make_action_state ?action_name:(action_name_ : action_name option)
    ?current_revision:(current_revision_ : action_revision option)
    ?latest_execution:(latest_execution_ : action_execution option)
    ?entity_url:(entity_url_ : url option) ?revision_url:(revision_url_ : url option) () =
  ({
     action_name = action_name_;
     current_revision = current_revision_;
     latest_execution = latest_execution_;
     entity_url = entity_url_;
     revision_url = revision_url_;
   }
    : action_state)

let make_artifact_details ~minimum_count:(minimum_count_ : minimum_artifact_count)
    ~maximum_count:(maximum_count_ : maximum_artifact_count) () =
  ({ minimum_count = minimum_count_; maximum_count = maximum_count_ } : artifact_details)

let make_action_type_settings
    ?third_party_configuration_url:(third_party_configuration_url_ : url option)
    ?entity_url_template:(entity_url_template_ : url_template option)
    ?execution_url_template:(execution_url_template_ : url_template option)
    ?revision_url_template:(revision_url_template_ : url_template option) () =
  ({
     third_party_configuration_url = third_party_configuration_url_;
     entity_url_template = entity_url_template_;
     execution_url_template = execution_url_template_;
     revision_url_template = revision_url_template_;
   }
    : action_type_settings)

let make_action_type ?settings:(settings_ : action_type_settings option)
    ?action_configuration_properties:
      (action_configuration_properties_ : action_configuration_property_list option)
    ~id:(id_ : action_type_id) ~input_artifact_details:(input_artifact_details_ : artifact_details)
    ~output_artifact_details:(output_artifact_details_ : artifact_details) () =
  ({
     id = id_;
     settings = settings_;
     action_configuration_properties = action_configuration_properties_;
     input_artifact_details = input_artifact_details_;
     output_artifact_details = output_artifact_details_;
   }
    : action_type)

let make_action_type_artifact_details
    ~minimum_count:(minimum_count_ : minimum_action_type_artifact_count)
    ~maximum_count:(maximum_count_ : maximum_action_type_artifact_count) () =
  ({ minimum_count = minimum_count_; maximum_count = maximum_count_ }
    : action_type_artifact_details)

let make_action_type_urls ?configuration_url:(configuration_url_ : url option)
    ?entity_url_template:(entity_url_template_ : url_template option)
    ?execution_url_template:(execution_url_template_ : url_template option)
    ?revision_url_template:(revision_url_template_ : url_template option) () =
  ({
     configuration_url = configuration_url_;
     entity_url_template = entity_url_template_;
     execution_url_template = execution_url_template_;
     revision_url_template = revision_url_template_;
   }
    : action_type_urls)

let make_action_type_property ?queryable:(queryable_ : boolean_ option)
    ?description:(description_ : property_description option)
    ~name:(name_ : action_configuration_key) ~optional:(optional_ : boolean_) ~key:(key_ : boolean_)
    ~no_echo:(no_echo_ : boolean_) () =
  ({
     name = name_;
     optional = optional_;
     key = key_;
     no_echo = no_echo_;
     queryable = queryable_;
     description = description_;
   }
    : action_type_property)

let make_action_type_permissions ~allowed_accounts:(allowed_accounts_ : allowed_accounts) () =
  ({ allowed_accounts = allowed_accounts_ } : action_type_permissions)

let make_action_type_identifier ~category:(category_ : action_category)
    ~owner:(owner_ : action_type_owner) ~provider:(provider_ : action_provider)
    ~version:(version_ : version) () =
  ({ category = category_; owner = owner_; provider = provider_; version = version_ }
    : action_type_identifier)

let make_job_worker_executor_configuration
    ?polling_accounts:(polling_accounts_ : polling_account_list option)
    ?polling_service_principals:
      (polling_service_principals_ : polling_service_principal_list option) () =
  ({
     polling_accounts = polling_accounts_;
     polling_service_principals = polling_service_principals_;
   }
    : job_worker_executor_configuration)

let make_lambda_executor_configuration
    ~lambda_function_arn:(lambda_function_arn_ : lambda_function_arn) () =
  ({ lambda_function_arn = lambda_function_arn_ } : lambda_executor_configuration)

let make_executor_configuration
    ?lambda_executor_configuration:
      (lambda_executor_configuration_ : lambda_executor_configuration option)
    ?job_worker_executor_configuration:
      (job_worker_executor_configuration_ : job_worker_executor_configuration option) () =
  ({
     lambda_executor_configuration = lambda_executor_configuration_;
     job_worker_executor_configuration = job_worker_executor_configuration_;
   }
    : executor_configuration)

let make_action_type_executor
    ?policy_statements_template:(policy_statements_template_ : policy_statements_template option)
    ?job_timeout:(job_timeout_ : job_timeout option)
    ~configuration:(configuration_ : executor_configuration) ~type_:(type__ : executor_type) () =
  ({
     configuration = configuration_;
     type_ = type__;
     policy_statements_template = policy_statements_template_;
     job_timeout = job_timeout_;
   }
    : action_type_executor)

let make_action_type_declaration ?description:(description_ : action_type_description option)
    ?permissions:(permissions_ : action_type_permissions option)
    ?properties:(properties_ : action_type_properties option)
    ?urls:(urls_ : action_type_urls option) ~executor:(executor_ : action_type_executor)
    ~id:(id_ : action_type_identifier)
    ~input_artifact_details:(input_artifact_details_ : action_type_artifact_details)
    ~output_artifact_details:(output_artifact_details_ : action_type_artifact_details) () =
  ({
     description = description_;
     executor = executor_;
     id = id_;
     input_artifact_details = input_artifact_details_;
     output_artifact_details = output_artifact_details_;
     permissions = permissions_;
     properties = properties_;
     urls = urls_;
   }
    : action_type_declaration)

let make_s3_artifact_location ~bucket_name:(bucket_name_ : s3_bucket_name)
    ~object_key:(object_key_ : s3_object_key) () =
  ({ bucket_name = bucket_name_; object_key = object_key_ } : s3_artifact_location)

let make_artifact_location ?type_:(type__ : artifact_location_type option)
    ?s3_location:(s3_location_ : s3_artifact_location option) () =
  ({ type_ = type__; s3_location = s3_location_ } : artifact_location)

let make_artifact ?name:(name_ : artifact_name option) ?revision:(revision_ : revision option)
    ?location:(location_ : artifact_location option) () =
  ({ name = name_; revision = revision_; location = location_ } : artifact)

let make_artifact_revision ?name:(name_ : artifact_name option)
    ?revision_id:(revision_id_ : revision option)
    ?revision_change_identifier:(revision_change_identifier_ : revision_change_identifier option)
    ?revision_summary:(revision_summary_ : revision_summary option)
    ?created:(created_ : timestamp option) ?revision_url:(revision_url_ : url option) () =
  ({
     name = name_;
     revision_id = revision_id_;
     revision_change_identifier = revision_change_identifier_;
     revision_summary = revision_summary_;
     created = created_;
     revision_url = revision_url_;
   }
    : artifact_revision)

let make_encryption_key ~id:(id_ : encryption_key_id) ~type_:(type__ : encryption_key_type) () =
  ({ id = id_; type_ = type__ } : encryption_key)

let make_artifact_store ?encryption_key:(encryption_key_ : encryption_key option)
    ~type_:(type__ : artifact_store_type) ~location:(location_ : artifact_store_location) () =
  ({ type_ = type__; location = location_; encryption_key = encryption_key_ } : artifact_store)

let make_rule_type_id ?owner:(owner_ : rule_owner option) ?version:(version_ : version option)
    ~category:(category_ : rule_category) ~provider:(provider_ : rule_provider) () =
  ({ category = category_; owner = owner_; provider = provider_; version = version_ }
    : rule_type_id)

let make_rule_declaration ?configuration:(configuration_ : rule_configuration_map option)
    ?commands:(commands_ : command_list option)
    ?input_artifacts:(input_artifacts_ : input_artifact_list option)
    ?role_arn:(role_arn_ : role_arn option) ?region:(region_ : aws_region_name option)
    ?timeout_in_minutes:(timeout_in_minutes_ : rule_timeout option) ~name:(name_ : rule_name)
    ~rule_type_id:(rule_type_id_ : rule_type_id) () =
  ({
     name = name_;
     rule_type_id = rule_type_id_;
     configuration = configuration_;
     commands = commands_;
     input_artifacts = input_artifacts_;
     role_arn = role_arn_;
     region = region_;
     timeout_in_minutes = timeout_in_minutes_;
   }
    : rule_declaration)

let make_condition ?result_:(result__ : result_ option)
    ?rules:(rules_ : rule_declaration_list option) () =
  ({ result_ = result__; rules = rules_ } : condition)

let make_before_entry_conditions ~conditions:(conditions_ : condition_list) () =
  ({ conditions = conditions_ } : before_entry_conditions)

let make_blocker_declaration ~name:(name_ : blocker_name) ~type_:(type__ : blocker_type) () =
  ({ name = name_; type_ = type__ } : blocker_declaration)

let make_git_file_path_filter_criteria ?includes:(includes_ : git_file_path_pattern_list option)
    ?excludes:(excludes_ : git_file_path_pattern_list option) () =
  ({ includes = includes_; excludes = excludes_ } : git_file_path_filter_criteria)

let make_git_branch_filter_criteria ?includes:(includes_ : git_branch_pattern_list option)
    ?excludes:(excludes_ : git_branch_pattern_list option) () =
  ({ includes = includes_; excludes = excludes_ } : git_branch_filter_criteria)

let make_git_pull_request_filter ?events:(events_ : git_pull_request_event_type_list option)
    ?branches:(branches_ : git_branch_filter_criteria option)
    ?file_paths:(file_paths_ : git_file_path_filter_criteria option) () =
  ({ events = events_; branches = branches_; file_paths = file_paths_ } : git_pull_request_filter)

let make_git_tag_filter_criteria ?includes:(includes_ : git_tag_pattern_list option)
    ?excludes:(excludes_ : git_tag_pattern_list option) () =
  ({ includes = includes_; excludes = excludes_ } : git_tag_filter_criteria)

let make_git_push_filter ?tags:(tags_ : git_tag_filter_criteria option)
    ?branches:(branches_ : git_branch_filter_criteria option)
    ?file_paths:(file_paths_ : git_file_path_filter_criteria option) () =
  ({ tags = tags_; branches = branches_; file_paths = file_paths_ } : git_push_filter)

let make_git_configuration ?push:(push_ : git_push_filter_list option)
    ?pull_request:(pull_request_ : git_pull_request_filter_list option)
    ~source_action_name:(source_action_name_ : action_name) () =
  ({ source_action_name = source_action_name_; push = push_; pull_request = pull_request_ }
    : git_configuration)

let make_pipeline_trigger_declaration
    ~provider_type:(provider_type_ : pipeline_trigger_provider_type)
    ~git_configuration:(git_configuration_ : git_configuration) () =
  ({ provider_type = provider_type_; git_configuration = git_configuration_ }
    : pipeline_trigger_declaration)

let make_pipeline_variable_declaration
    ?default_value:(default_value_ : pipeline_variable_value option)
    ?description:(description_ : pipeline_variable_description option)
    ~name:(name_ : pipeline_variable_name) () =
  ({ name = name_; default_value = default_value_; description = description_ }
    : pipeline_variable_declaration)

let make_success_conditions ~conditions:(conditions_ : condition_list) () =
  ({ conditions = conditions_ } : success_conditions)

let make_retry_configuration ?retry_mode:(retry_mode_ : stage_retry_mode option) () =
  ({ retry_mode = retry_mode_ } : retry_configuration)

let make_failure_conditions ?result_:(result__ : result_ option)
    ?retry_configuration:(retry_configuration_ : retry_configuration option)
    ?conditions:(conditions_ : condition_list option) () =
  ({ result_ = result__; retry_configuration = retry_configuration_; conditions = conditions_ }
    : failure_conditions)

let make_stage_declaration ?blockers:(blockers_ : stage_blocker_declaration_list option)
    ?on_failure:(on_failure_ : failure_conditions option)
    ?on_success:(on_success_ : success_conditions option)
    ?before_entry:(before_entry_ : before_entry_conditions option) ~name:(name_ : stage_name)
    ~actions:(actions_ : stage_action_declaration_list) () =
  ({
     name = name_;
     blockers = blockers_;
     actions = actions_;
     on_failure = on_failure_;
     on_success = on_success_;
     before_entry = before_entry_;
   }
    : stage_declaration)

let make_pipeline_declaration ?artifact_store:(artifact_store_ : artifact_store option)
    ?artifact_stores:(artifact_stores_ : artifact_store_map option)
    ?version:(version_ : pipeline_version option)
    ?execution_mode:(execution_mode_ : execution_mode option)
    ?pipeline_type:(pipeline_type_ : pipeline_type option)
    ?variables:(variables_ : pipeline_variable_declaration_list option)
    ?triggers:(triggers_ : pipeline_trigger_declaration_list option) ~name:(name_ : pipeline_name)
    ~role_arn:(role_arn_ : role_arn) ~stages:(stages_ : pipeline_stage_declaration_list) () =
  ({
     name = name_;
     role_arn = role_arn_;
     artifact_store = artifact_store_;
     artifact_stores = artifact_stores_;
     stages = stages_;
     version = version_;
     execution_mode = execution_mode_;
     pipeline_type = pipeline_type_;
     variables = variables_;
     triggers = triggers_;
   }
    : pipeline_declaration)

let make_update_pipeline_output ?pipeline:(pipeline_ : pipeline_declaration option) () =
  ({ pipeline = pipeline_ } : update_pipeline_output)

let make_update_pipeline_input ~pipeline:(pipeline_ : pipeline_declaration) () =
  ({ pipeline = pipeline_ } : update_pipeline_input)

let make_update_action_type_input ~action_type:(action_type_ : action_type_declaration) () =
  ({ action_type = action_type_ } : update_action_type_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_input ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tag_list) ()
    =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_stop_pipeline_execution_output
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : stop_pipeline_execution_output)

let make_stop_pipeline_execution_input ?abandon:(abandon_ : boolean_ option)
    ?reason:(reason_ : stop_pipeline_execution_reason option)
    ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id) () =
  ({
     pipeline_name = pipeline_name_;
     pipeline_execution_id = pipeline_execution_id_;
     abandon = abandon_;
     reason = reason_;
   }
    : stop_pipeline_execution_input)

let make_start_pipeline_execution_output
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : start_pipeline_execution_output)

let make_source_revision_override ~action_name:(action_name_ : action_name)
    ~revision_type:(revision_type_ : source_revision_type)
    ~revision_value:(revision_value_ : revision) () =
  ({ action_name = action_name_; revision_type = revision_type_; revision_value = revision_value_ }
    : source_revision_override)

let make_pipeline_variable ~name:(name_ : pipeline_variable_name)
    ~value:(value_ : pipeline_variable_value) () =
  ({ name = name_; value = value_ } : pipeline_variable)

let make_start_pipeline_execution_input ?variables:(variables_ : pipeline_variable_list option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?source_revisions:(source_revisions_ : source_revision_override_list option)
    ~name:(name_ : pipeline_name) () =
  ({
     name = name_;
     variables = variables_;
     client_request_token = client_request_token_;
     source_revisions = source_revisions_;
   }
    : start_pipeline_execution_input)

let make_rollback_stage_output
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : rollback_stage_output)

let make_rollback_stage_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~stage_name:(stage_name_ : stage_name)
    ~target_pipeline_execution_id:(target_pipeline_execution_id_ : pipeline_execution_id) () =
  ({
     pipeline_name = pipeline_name_;
     stage_name = stage_name_;
     target_pipeline_execution_id = target_pipeline_execution_id_;
   }
    : rollback_stage_input)

let make_retry_stage_execution_output
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : retry_stage_execution_output)

let make_retry_stage_execution_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~stage_name:(stage_name_ : stage_name)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~retry_mode:(retry_mode_ : stage_retry_mode) () =
  ({
     pipeline_name = pipeline_name_;
     stage_name = stage_name_;
     pipeline_execution_id = pipeline_execution_id_;
     retry_mode = retry_mode_;
   }
    : retry_stage_execution_input)

let make_register_webhook_with_third_party_output () = (() : unit)

let make_register_webhook_with_third_party_input ?webhook_name:(webhook_name_ : webhook_name option)
    () =
  ({ webhook_name = webhook_name_ } : register_webhook_with_third_party_input)

let make_webhook_auth_configuration
    ?allowed_ip_range:(allowed_ip_range_ : webhook_auth_configuration_allowed_ip_range option)
    ?secret_token:(secret_token_ : webhook_auth_configuration_secret_token option) () =
  ({ allowed_ip_range = allowed_ip_range_; secret_token = secret_token_ }
    : webhook_auth_configuration)

let make_webhook_filter_rule ?match_equals:(match_equals_ : match_equals option)
    ~json_path:(json_path_ : json_path) () =
  ({ json_path = json_path_; match_equals = match_equals_ } : webhook_filter_rule)

let make_webhook_definition ~name:(name_ : webhook_name)
    ~target_pipeline:(target_pipeline_ : pipeline_name)
    ~target_action:(target_action_ : action_name) ~filters:(filters_ : webhook_filters)
    ~authentication:(authentication_ : webhook_authentication_type)
    ~authentication_configuration:(authentication_configuration_ : webhook_auth_configuration) () =
  ({
     name = name_;
     target_pipeline = target_pipeline_;
     target_action = target_action_;
     filters = filters_;
     authentication = authentication_;
     authentication_configuration = authentication_configuration_;
   }
    : webhook_definition)

let make_list_webhook_item ?error_message:(error_message_ : webhook_error_message option)
    ?error_code:(error_code_ : webhook_error_code option)
    ?last_triggered:(last_triggered_ : webhook_last_triggered option)
    ?arn:(arn_ : webhook_arn option) ?tags:(tags_ : tag_list option)
    ~definition:(definition_ : webhook_definition) ~url:(url_ : webhook_url) () =
  ({
     definition = definition_;
     url = url_;
     error_message = error_message_;
     error_code = error_code_;
     last_triggered = last_triggered_;
     arn = arn_;
     tags = tags_;
   }
    : list_webhook_item)

let make_put_webhook_output ?webhook:(webhook_ : list_webhook_item option) () =
  ({ webhook = webhook_ } : put_webhook_output)

let make_put_webhook_input ?tags:(tags_ : tag_list option) ~webhook:(webhook_ : webhook_definition)
    () =
  ({ webhook = webhook_; tags = tags_ } : put_webhook_input)

let make_execution_details ?summary:(summary_ : execution_summary option)
    ?external_execution_id:(external_execution_id_ : execution_id option)
    ?percent_complete:(percent_complete_ : percentage option) () =
  ({
     summary = summary_;
     external_execution_id = external_execution_id_;
     percent_complete = percent_complete_;
   }
    : execution_details)

let make_current_revision ?created:(created_ : time option)
    ?revision_summary:(revision_summary_ : revision_summary option) ~revision:(revision_ : revision)
    ~change_identifier:(change_identifier_ : revision_change_identifier) () =
  ({
     revision = revision_;
     change_identifier = change_identifier_;
     created = created_;
     revision_summary = revision_summary_;
   }
    : current_revision)

let make_put_third_party_job_success_result_input
    ?current_revision:(current_revision_ : current_revision option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?execution_details:(execution_details_ : execution_details option)
    ~job_id:(job_id_ : third_party_job_id) ~client_token:(client_token_ : client_token) () =
  ({
     job_id = job_id_;
     client_token = client_token_;
     current_revision = current_revision_;
     continuation_token = continuation_token_;
     execution_details = execution_details_;
   }
    : put_third_party_job_success_result_input)

let make_failure_details ?external_execution_id:(external_execution_id_ : execution_id option)
    ~type_:(type__ : failure_type) ~message:(message_ : message) () =
  ({ type_ = type__; message = message_; external_execution_id = external_execution_id_ }
    : failure_details)

let make_put_third_party_job_failure_result_input ~job_id:(job_id_ : third_party_job_id)
    ~client_token:(client_token_ : client_token)
    ~failure_details:(failure_details_ : failure_details) () =
  ({ job_id = job_id_; client_token = client_token_; failure_details = failure_details_ }
    : put_third_party_job_failure_result_input)

let make_put_job_success_result_input
    ?current_revision:(current_revision_ : current_revision option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?execution_details:(execution_details_ : execution_details option)
    ?output_variables:(output_variables_ : output_variables_map option) ~job_id:(job_id_ : job_id)
    () =
  ({
     job_id = job_id_;
     current_revision = current_revision_;
     continuation_token = continuation_token_;
     execution_details = execution_details_;
     output_variables = output_variables_;
   }
    : put_job_success_result_input)

let make_put_job_failure_result_input ~job_id:(job_id_ : job_id)
    ~failure_details:(failure_details_ : failure_details) () =
  ({ job_id = job_id_; failure_details = failure_details_ } : put_job_failure_result_input)

let make_put_approval_result_output ?approved_at:(approved_at_ : timestamp option) () =
  ({ approved_at = approved_at_ } : put_approval_result_output)

let make_put_approval_result_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~stage_name:(stage_name_ : stage_name) ~action_name:(action_name_ : action_name)
    ~result_:(result__ : approval_result) ~token:(token_ : approval_token) () =
  ({
     pipeline_name = pipeline_name_;
     stage_name = stage_name_;
     action_name = action_name_;
     result_ = result__;
     token = token_;
   }
    : put_approval_result_input)

let make_put_action_revision_output ?new_revision:(new_revision_ : boolean_ option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ new_revision = new_revision_; pipeline_execution_id = pipeline_execution_id_ }
    : put_action_revision_output)

let make_put_action_revision_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~stage_name:(stage_name_ : stage_name) ~action_name:(action_name_ : action_name)
    ~action_revision:(action_revision_ : action_revision) () =
  ({
     pipeline_name = pipeline_name_;
     stage_name = stage_name_;
     action_name = action_name_;
     action_revision = action_revision_;
   }
    : put_action_revision_input)

let make_third_party_job ?client_id:(client_id_ : client_id option)
    ?job_id:(job_id_ : job_id option) () =
  ({ client_id = client_id_; job_id = job_id_ } : third_party_job)

let make_poll_for_third_party_jobs_output ?jobs:(jobs_ : third_party_job_list option) () =
  ({ jobs = jobs_ } : poll_for_third_party_jobs_output)

let make_poll_for_third_party_jobs_input ?max_batch_size:(max_batch_size_ : max_batch_size option)
    ~action_type_id:(action_type_id_ : action_type_id) () =
  ({ action_type_id = action_type_id_; max_batch_size = max_batch_size_ }
    : poll_for_third_party_jobs_input)

let make_stage_context ?name:(name_ : stage_name option) () = ({ name = name_ } : stage_context)

let make_pipeline_context ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?stage:(stage_ : stage_context option) ?action:(action_ : action_context option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({
     pipeline_name = pipeline_name_;
     stage = stage_;
     action = action_;
     pipeline_arn = pipeline_arn_;
     pipeline_execution_id = pipeline_execution_id_;
   }
    : pipeline_context)

let make_job_data ?action_type_id:(action_type_id_ : action_type_id option)
    ?action_configuration:(action_configuration_ : action_configuration option)
    ?pipeline_context:(pipeline_context_ : pipeline_context option)
    ?input_artifacts:(input_artifacts_ : artifact_list option)
    ?output_artifacts:(output_artifacts_ : artifact_list option)
    ?artifact_credentials:(artifact_credentials_ : aws_session_credentials option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?encryption_key:(encryption_key_ : encryption_key option) () =
  ({
     action_type_id = action_type_id_;
     action_configuration = action_configuration_;
     pipeline_context = pipeline_context_;
     input_artifacts = input_artifacts_;
     output_artifacts = output_artifacts_;
     artifact_credentials = artifact_credentials_;
     continuation_token = continuation_token_;
     encryption_key = encryption_key_;
   }
    : job_data)

let make_job ?id:(id_ : job_id option) ?data:(data_ : job_data option)
    ?nonce:(nonce_ : nonce option) ?account_id:(account_id_ : account_id option) () =
  ({ id = id_; data = data_; nonce = nonce_; account_id = account_id_ } : job)

let make_poll_for_jobs_output ?jobs:(jobs_ : job_list option) () =
  ({ jobs = jobs_ } : poll_for_jobs_output)

let make_poll_for_jobs_input ?max_batch_size:(max_batch_size_ : max_batch_size option)
    ?query_param:(query_param_ : query_param_map option)
    ~action_type_id:(action_type_id_ : action_type_id) () =
  ({
     action_type_id = action_type_id_;
     max_batch_size = max_batch_size_;
     query_param = query_param_;
   }
    : poll_for_jobs_input)

let make_override_stage_condition_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~stage_name:(stage_name_ : stage_name)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~condition_type:(condition_type_ : condition_type) () =
  ({
     pipeline_name = pipeline_name_;
     stage_name = stage_name_;
     pipeline_execution_id = pipeline_execution_id_;
     condition_type = condition_type_;
   }
    : override_stage_condition_input)

let make_list_webhooks_output ?webhooks:(webhooks_ : webhook_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ webhooks = webhooks_; next_token = next_token_ } : list_webhooks_output)

let make_list_webhooks_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_webhooks_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~resource_arn:(resource_arn_ : resource_arn) ()
    =
  ({ resource_arn = resource_arn_; next_token = next_token_; max_results = max_results_ }
    : list_tags_for_resource_input)

let make_rule_configuration_property ?queryable:(queryable_ : boolean_ option)
    ?description:(description_ : description option)
    ?type_:(type__ : rule_configuration_property_type option) ~name:(name_ : rule_configuration_key)
    ~required:(required_ : boolean_) ~key:(key_ : boolean_) ~secret:(secret_ : boolean_) () =
  ({
     name = name_;
     required = required_;
     key = key_;
     secret = secret_;
     queryable = queryable_;
     description = description_;
     type_ = type__;
   }
    : rule_configuration_property)

let make_rule_type_settings
    ?third_party_configuration_url:(third_party_configuration_url_ : url option)
    ?entity_url_template:(entity_url_template_ : url_template option)
    ?execution_url_template:(execution_url_template_ : url_template option)
    ?revision_url_template:(revision_url_template_ : url_template option) () =
  ({
     third_party_configuration_url = third_party_configuration_url_;
     entity_url_template = entity_url_template_;
     execution_url_template = execution_url_template_;
     revision_url_template = revision_url_template_;
   }
    : rule_type_settings)

let make_rule_type ?settings:(settings_ : rule_type_settings option)
    ?rule_configuration_properties:
      (rule_configuration_properties_ : rule_configuration_property_list option)
    ~id:(id_ : rule_type_id) ~input_artifact_details:(input_artifact_details_ : artifact_details) ()
    =
  ({
     id = id_;
     settings = settings_;
     rule_configuration_properties = rule_configuration_properties_;
     input_artifact_details = input_artifact_details_;
   }
    : rule_type)

let make_list_rule_types_output ~rule_types:(rule_types_ : rule_type_list) () =
  ({ rule_types = rule_types_ } : list_rule_types_output)

let make_list_rule_types_input ?rule_owner_filter:(rule_owner_filter_ : rule_owner option)
    ?region_filter:(region_filter_ : aws_region_name option) () =
  ({ rule_owner_filter = rule_owner_filter_; region_filter = region_filter_ }
    : list_rule_types_input)

let make_rule_execution_output ?execution_result:(execution_result_ : rule_execution_result option)
    () =
  ({ execution_result = execution_result_ } : rule_execution_output)

let make_rule_execution_input ?rule_type_id:(rule_type_id_ : rule_type_id option)
    ?configuration:(configuration_ : rule_configuration_map option)
    ?resolved_configuration:(resolved_configuration_ : resolved_rule_configuration_map option)
    ?role_arn:(role_arn_ : role_arn option) ?region:(region_ : aws_region_name option)
    ?input_artifacts:(input_artifacts_ : artifact_detail_list option) () =
  ({
     rule_type_id = rule_type_id_;
     configuration = configuration_;
     resolved_configuration = resolved_configuration_;
     role_arn = role_arn_;
     region = region_;
     input_artifacts = input_artifacts_;
   }
    : rule_execution_input)

let make_rule_execution_detail
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?rule_execution_id:(rule_execution_id_ : rule_execution_id option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?stage_name:(stage_name_ : stage_name option) ?rule_name:(rule_name_ : rule_name option)
    ?start_time:(start_time_ : timestamp option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?updated_by:(updated_by_ : last_updated_by option)
    ?status:(status_ : rule_execution_status option) ?input:(input_ : rule_execution_input option)
    ?output:(output_ : rule_execution_output option) () =
  ({
     pipeline_execution_id = pipeline_execution_id_;
     rule_execution_id = rule_execution_id_;
     pipeline_version = pipeline_version_;
     stage_name = stage_name_;
     rule_name = rule_name_;
     start_time = start_time_;
     last_update_time = last_update_time_;
     updated_by = updated_by_;
     status = status_;
     input = input_;
     output = output_;
   }
    : rule_execution_detail)

let make_list_rule_executions_output
    ?rule_execution_details:(rule_execution_details_ : rule_execution_detail_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ rule_execution_details = rule_execution_details_; next_token = next_token_ }
    : list_rule_executions_output)

let make_rule_execution_filter
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?latest_in_pipeline_execution:
      (latest_in_pipeline_execution_ : latest_in_pipeline_execution_filter option) () =
  ({
     pipeline_execution_id = pipeline_execution_id_;
     latest_in_pipeline_execution = latest_in_pipeline_execution_;
   }
    : rule_execution_filter)

let make_list_rule_executions_input ?filter:(filter_ : rule_execution_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     pipeline_name = pipeline_name_;
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_rule_executions_input)

let make_pipeline_summary ?name:(name_ : pipeline_name option)
    ?version:(version_ : pipeline_version option)
    ?pipeline_type:(pipeline_type_ : pipeline_type option)
    ?execution_mode:(execution_mode_ : execution_mode option) ?created:(created_ : timestamp option)
    ?updated:(updated_ : timestamp option) () =
  ({
     name = name_;
     version = version_;
     pipeline_type = pipeline_type_;
     execution_mode = execution_mode_;
     created = created_;
     updated = updated_;
   }
    : pipeline_summary)

let make_list_pipelines_output ?pipelines:(pipelines_ : pipeline_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pipelines = pipelines_; next_token = next_token_ } : list_pipelines_output)

let make_list_pipelines_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_pipelines option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_pipelines_input)

let make_pipeline_rollback_metadata
    ?rollback_target_pipeline_execution_id:
      (rollback_target_pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ rollback_target_pipeline_execution_id = rollback_target_pipeline_execution_id_ }
    : pipeline_rollback_metadata)

let make_stop_execution_trigger ?reason:(reason_ : stop_pipeline_execution_reason option) () =
  ({ reason = reason_ } : stop_execution_trigger)

let make_execution_trigger ?trigger_type:(trigger_type_ : trigger_type option)
    ?trigger_detail:(trigger_detail_ : trigger_detail option) () =
  ({ trigger_type = trigger_type_; trigger_detail = trigger_detail_ } : execution_trigger)

let make_source_revision ?revision_id:(revision_id_ : revision option)
    ?revision_summary:(revision_summary_ : revision_summary option)
    ?revision_url:(revision_url_ : url option) ~action_name:(action_name_ : action_name) () =
  ({
     action_name = action_name_;
     revision_id = revision_id_;
     revision_summary = revision_summary_;
     revision_url = revision_url_;
   }
    : source_revision)

let make_pipeline_execution_summary
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?status:(status_ : pipeline_execution_status option)
    ?status_summary:(status_summary_ : pipeline_execution_status_summary option)
    ?start_time:(start_time_ : timestamp option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?source_revisions:(source_revisions_ : source_revision_list option)
    ?trigger:(trigger_ : execution_trigger option)
    ?stop_trigger:(stop_trigger_ : stop_execution_trigger option)
    ?execution_mode:(execution_mode_ : execution_mode option)
    ?execution_type:(execution_type_ : execution_type option)
    ?rollback_metadata:(rollback_metadata_ : pipeline_rollback_metadata option) () =
  ({
     pipeline_execution_id = pipeline_execution_id_;
     status = status_;
     status_summary = status_summary_;
     start_time = start_time_;
     last_update_time = last_update_time_;
     source_revisions = source_revisions_;
     trigger = trigger_;
     stop_trigger = stop_trigger_;
     execution_mode = execution_mode_;
     execution_type = execution_type_;
     rollback_metadata = rollback_metadata_;
   }
    : pipeline_execution_summary)

let make_list_pipeline_executions_output
    ?pipeline_execution_summaries:
      (pipeline_execution_summaries_ : pipeline_execution_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pipeline_execution_summaries = pipeline_execution_summaries_; next_token = next_token_ }
    : list_pipeline_executions_output)

let make_succeeded_in_stage_filter ?stage_name:(stage_name_ : stage_name option) () =
  ({ stage_name = stage_name_ } : succeeded_in_stage_filter)

let make_pipeline_execution_filter
    ?succeeded_in_stage:(succeeded_in_stage_ : succeeded_in_stage_filter option) () =
  ({ succeeded_in_stage = succeeded_in_stage_ } : pipeline_execution_filter)

let make_list_pipeline_executions_input ?max_results:(max_results_ : max_results option)
    ?filter:(filter_ : pipeline_execution_filter option)
    ?next_token:(next_token_ : next_token option) ~pipeline_name:(pipeline_name_ : pipeline_name) ()
    =
  ({
     pipeline_name = pipeline_name_;
     max_results = max_results_;
     filter = filter_;
     next_token = next_token_;
   }
    : list_pipeline_executions_input)

let make_deploy_target_event_context ?ssm_command_id:(ssm_command_id_ : string_ option)
    ?message:(message_ : string_ option) () =
  ({ ssm_command_id = ssm_command_id_; message = message_ } : deploy_target_event_context)

let make_deploy_target_event ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?context:(context_ : deploy_target_event_context option) () =
  ({
     name = name_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     context = context_;
   }
    : deploy_target_event)

let make_deploy_action_execution_target ?target_id:(target_id_ : string_ option)
    ?target_type:(target_type_ : string_ option) ?status:(status_ : string_ option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?events:(events_ : deploy_target_event_list option) () =
  ({
     target_id = target_id_;
     target_type = target_type_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     events = events_;
   }
    : deploy_action_execution_target)

let make_list_deploy_action_execution_targets_output
    ?targets:(targets_ : deploy_action_execution_target_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ targets = targets_; next_token = next_token_ } : list_deploy_action_execution_targets_output)

let make_target_filter ?name:(name_ : target_filter_name option)
    ?values:(values_ : target_filter_value_list option) () =
  ({ name = name_; values = values_ } : target_filter)

let make_list_deploy_action_execution_targets_input
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?filters:(filters_ : target_filter_list option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~action_execution_id:(action_execution_id_ : action_execution_id) () =
  ({
     pipeline_name = pipeline_name_;
     action_execution_id = action_execution_id_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_deploy_action_execution_targets_input)

let make_list_action_types_output ?next_token:(next_token_ : next_token option)
    ~action_types:(action_types_ : action_type_list) () =
  ({ action_types = action_types_; next_token = next_token_ } : list_action_types_output)

let make_list_action_types_input ?action_owner_filter:(action_owner_filter_ : action_owner option)
    ?next_token:(next_token_ : next_token option)
    ?region_filter:(region_filter_ : aws_region_name option) () =
  ({
     action_owner_filter = action_owner_filter_;
     next_token = next_token_;
     region_filter = region_filter_;
   }
    : list_action_types_input)

let make_list_action_executions_output
    ?action_execution_details:(action_execution_details_ : action_execution_detail_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ action_execution_details = action_execution_details_; next_token = next_token_ }
    : list_action_executions_output)

let make_list_action_executions_input ?filter:(filter_ : action_execution_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     pipeline_name = pipeline_name_;
     filter = filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_action_executions_input)

let make_third_party_job_data ?action_type_id:(action_type_id_ : action_type_id option)
    ?action_configuration:(action_configuration_ : action_configuration option)
    ?pipeline_context:(pipeline_context_ : pipeline_context option)
    ?input_artifacts:(input_artifacts_ : artifact_list option)
    ?output_artifacts:(output_artifacts_ : artifact_list option)
    ?artifact_credentials:(artifact_credentials_ : aws_session_credentials option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?encryption_key:(encryption_key_ : encryption_key option) () =
  ({
     action_type_id = action_type_id_;
     action_configuration = action_configuration_;
     pipeline_context = pipeline_context_;
     input_artifacts = input_artifacts_;
     output_artifacts = output_artifacts_;
     artifact_credentials = artifact_credentials_;
     continuation_token = continuation_token_;
     encryption_key = encryption_key_;
   }
    : third_party_job_data)

let make_third_party_job_details ?id:(id_ : third_party_job_id option)
    ?data:(data_ : third_party_job_data option) ?nonce:(nonce_ : nonce option) () =
  ({ id = id_; data = data_; nonce = nonce_ } : third_party_job_details)

let make_get_third_party_job_details_output
    ?job_details:(job_details_ : third_party_job_details option) () =
  ({ job_details = job_details_ } : get_third_party_job_details_output)

let make_get_third_party_job_details_input ~job_id:(job_id_ : third_party_job_id)
    ~client_token:(client_token_ : client_token) () =
  ({ job_id = job_id_; client_token = client_token_ } : get_third_party_job_details_input)

let make_retry_stage_metadata
    ?auto_stage_retry_attempt:(auto_stage_retry_attempt_ : retry_attempt option)
    ?manual_stage_retry_attempt:(manual_stage_retry_attempt_ : retry_attempt option)
    ?latest_retry_trigger:(latest_retry_trigger_ : retry_trigger option) () =
  ({
     auto_stage_retry_attempt = auto_stage_retry_attempt_;
     manual_stage_retry_attempt = manual_stage_retry_attempt_;
     latest_retry_trigger = latest_retry_trigger_;
   }
    : retry_stage_metadata)

let make_rule_execution ?rule_execution_id:(rule_execution_id_ : rule_execution_id option)
    ?status:(status_ : rule_execution_status option) ?summary:(summary_ : execution_summary option)
    ?last_status_change:(last_status_change_ : timestamp option)
    ?token:(token_ : rule_execution_token option)
    ?last_updated_by:(last_updated_by_ : last_updated_by option)
    ?external_execution_id:(external_execution_id_ : execution_id option)
    ?external_execution_url:(external_execution_url_ : url option)
    ?error_details:(error_details_ : error_details option) () =
  ({
     rule_execution_id = rule_execution_id_;
     status = status_;
     summary = summary_;
     last_status_change = last_status_change_;
     token = token_;
     last_updated_by = last_updated_by_;
     external_execution_id = external_execution_id_;
     external_execution_url = external_execution_url_;
     error_details = error_details_;
   }
    : rule_execution)

let make_rule_revision ~revision_id:(revision_id_ : revision)
    ~revision_change_id:(revision_change_id_ : revision_change_identifier)
    ~created:(created_ : timestamp) () =
  ({ revision_id = revision_id_; revision_change_id = revision_change_id_; created = created_ }
    : rule_revision)

let make_rule_state ?rule_name:(rule_name_ : rule_name option)
    ?current_revision:(current_revision_ : rule_revision option)
    ?latest_execution:(latest_execution_ : rule_execution option)
    ?entity_url:(entity_url_ : url option) ?revision_url:(revision_url_ : url option) () =
  ({
     rule_name = rule_name_;
     current_revision = current_revision_;
     latest_execution = latest_execution_;
     entity_url = entity_url_;
     revision_url = revision_url_;
   }
    : rule_state)

let make_condition_execution ?status:(status_ : condition_execution_status option)
    ?summary:(summary_ : execution_summary option)
    ?last_status_change:(last_status_change_ : timestamp option) () =
  ({ status = status_; summary = summary_; last_status_change = last_status_change_ }
    : condition_execution)

let make_condition_state ?latest_execution:(latest_execution_ : condition_execution option)
    ?rule_states:(rule_states_ : rule_state_list option) () =
  ({ latest_execution = latest_execution_; rule_states = rule_states_ } : condition_state)

let make_stage_conditions_execution ?status:(status_ : condition_execution_status option)
    ?summary:(summary_ : execution_summary option) () =
  ({ status = status_; summary = summary_ } : stage_conditions_execution)

let make_stage_condition_state
    ?latest_execution:(latest_execution_ : stage_conditions_execution option)
    ?condition_states:(condition_states_ : condition_state_list option) () =
  ({ latest_execution = latest_execution_; condition_states = condition_states_ }
    : stage_condition_state)

let make_stage_execution ?type_:(type__ : execution_type option)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~status:(status_ : stage_execution_status) () =
  ({ pipeline_execution_id = pipeline_execution_id_; status = status_; type_ = type__ }
    : stage_execution)

let make_transition_state ?enabled:(enabled_ : enabled option)
    ?last_changed_by:(last_changed_by_ : last_changed_by option)
    ?last_changed_at:(last_changed_at_ : last_changed_at option)
    ?disabled_reason:(disabled_reason_ : disabled_reason option) () =
  ({
     enabled = enabled_;
     last_changed_by = last_changed_by_;
     last_changed_at = last_changed_at_;
     disabled_reason = disabled_reason_;
   }
    : transition_state)

let make_stage_state ?stage_name:(stage_name_ : stage_name option)
    ?inbound_execution:(inbound_execution_ : stage_execution option)
    ?inbound_executions:(inbound_executions_ : stage_execution_list option)
    ?inbound_transition_state:(inbound_transition_state_ : transition_state option)
    ?action_states:(action_states_ : action_state_list option)
    ?latest_execution:(latest_execution_ : stage_execution option)
    ?before_entry_condition_state:(before_entry_condition_state_ : stage_condition_state option)
    ?on_success_condition_state:(on_success_condition_state_ : stage_condition_state option)
    ?on_failure_condition_state:(on_failure_condition_state_ : stage_condition_state option)
    ?retry_stage_metadata:(retry_stage_metadata_ : retry_stage_metadata option) () =
  ({
     stage_name = stage_name_;
     inbound_execution = inbound_execution_;
     inbound_executions = inbound_executions_;
     inbound_transition_state = inbound_transition_state_;
     action_states = action_states_;
     latest_execution = latest_execution_;
     before_entry_condition_state = before_entry_condition_state_;
     on_success_condition_state = on_success_condition_state_;
     on_failure_condition_state = on_failure_condition_state_;
     retry_stage_metadata = retry_stage_metadata_;
   }
    : stage_state)

let make_get_pipeline_state_output ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?stage_states:(stage_states_ : stage_state_list option) ?created:(created_ : timestamp option)
    ?updated:(updated_ : timestamp option) () =
  ({
     pipeline_name = pipeline_name_;
     pipeline_version = pipeline_version_;
     stage_states = stage_states_;
     created = created_;
     updated = updated_;
   }
    : get_pipeline_state_output)

let make_get_pipeline_state_input ~name:(name_ : pipeline_name) () =
  ({ name = name_ } : get_pipeline_state_input)

let make_resolved_pipeline_variable ?name:(name_ : string_ option)
    ?resolved_value:(resolved_value_ : string_ option) () =
  ({ name = name_; resolved_value = resolved_value_ } : resolved_pipeline_variable)

let make_pipeline_execution ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?status:(status_ : pipeline_execution_status option)
    ?status_summary:(status_summary_ : pipeline_execution_status_summary option)
    ?artifact_revisions:(artifact_revisions_ : artifact_revision_list option)
    ?variables:(variables_ : resolved_pipeline_variable_list option)
    ?trigger:(trigger_ : execution_trigger option)
    ?execution_mode:(execution_mode_ : execution_mode option)
    ?execution_type:(execution_type_ : execution_type option)
    ?rollback_metadata:(rollback_metadata_ : pipeline_rollback_metadata option) () =
  ({
     pipeline_name = pipeline_name_;
     pipeline_version = pipeline_version_;
     pipeline_execution_id = pipeline_execution_id_;
     status = status_;
     status_summary = status_summary_;
     artifact_revisions = artifact_revisions_;
     variables = variables_;
     trigger = trigger_;
     execution_mode = execution_mode_;
     execution_type = execution_type_;
     rollback_metadata = rollback_metadata_;
   }
    : pipeline_execution)

let make_get_pipeline_execution_output
    ?pipeline_execution:(pipeline_execution_ : pipeline_execution option) () =
  ({ pipeline_execution = pipeline_execution_ } : get_pipeline_execution_output)

let make_get_pipeline_execution_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id) () =
  ({ pipeline_name = pipeline_name_; pipeline_execution_id = pipeline_execution_id_ }
    : get_pipeline_execution_input)

let make_pipeline_metadata ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?created:(created_ : timestamp option) ?updated:(updated_ : timestamp option)
    ?polling_disabled_at:(polling_disabled_at_ : timestamp option) () =
  ({
     pipeline_arn = pipeline_arn_;
     created = created_;
     updated = updated_;
     polling_disabled_at = polling_disabled_at_;
   }
    : pipeline_metadata)

let make_get_pipeline_output ?pipeline:(pipeline_ : pipeline_declaration option)
    ?metadata:(metadata_ : pipeline_metadata option) () =
  ({ pipeline = pipeline_; metadata = metadata_ } : get_pipeline_output)

let make_get_pipeline_input ?version:(version_ : pipeline_version option)
    ~name:(name_ : pipeline_name) () =
  ({ name = name_; version = version_ } : get_pipeline_input)

let make_job_details ?id:(id_ : job_id option) ?data:(data_ : job_data option)
    ?account_id:(account_id_ : account_id option) () =
  ({ id = id_; data = data_; account_id = account_id_ } : job_details)

let make_get_job_details_output ?job_details:(job_details_ : job_details option) () =
  ({ job_details = job_details_ } : get_job_details_output)

let make_get_job_details_input ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_job_details_input)

let make_get_action_type_output ?action_type:(action_type_ : action_type_declaration option) () =
  ({ action_type = action_type_ } : get_action_type_output)

let make_get_action_type_input ~category:(category_ : action_category)
    ~owner:(owner_ : action_type_owner) ~provider:(provider_ : action_provider)
    ~version:(version_ : version) () =
  ({ category = category_; owner = owner_; provider = provider_; version = version_ }
    : get_action_type_input)

let make_enable_stage_transition_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~stage_name:(stage_name_ : stage_name)
    ~transition_type:(transition_type_ : stage_transition_type) () =
  ({ pipeline_name = pipeline_name_; stage_name = stage_name_; transition_type = transition_type_ }
    : enable_stage_transition_input)

let make_disable_stage_transition_input ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~stage_name:(stage_name_ : stage_name)
    ~transition_type:(transition_type_ : stage_transition_type) ~reason:(reason_ : disabled_reason)
    () =
  ({
     pipeline_name = pipeline_name_;
     stage_name = stage_name_;
     transition_type = transition_type_;
     reason = reason_;
   }
    : disable_stage_transition_input)

let make_deregister_webhook_with_third_party_output () = (() : unit)

let make_deregister_webhook_with_third_party_input
    ?webhook_name:(webhook_name_ : webhook_name option) () =
  ({ webhook_name = webhook_name_ } : deregister_webhook_with_third_party_input)

let make_delete_webhook_output () = (() : unit)

let make_delete_webhook_input ~name:(name_ : webhook_name) () =
  ({ name = name_ } : delete_webhook_input)

let make_delete_pipeline_input ~name:(name_ : pipeline_name) () =
  ({ name = name_ } : delete_pipeline_input)

let make_delete_custom_action_type_input ~category:(category_ : action_category)
    ~provider:(provider_ : action_provider) ~version:(version_ : version) () =
  ({ category = category_; provider = provider_; version = version_ }
    : delete_custom_action_type_input)

let make_create_pipeline_output ?pipeline:(pipeline_ : pipeline_declaration option)
    ?tags:(tags_ : tag_list option) () =
  ({ pipeline = pipeline_; tags = tags_ } : create_pipeline_output)

let make_create_pipeline_input ?tags:(tags_ : tag_list option)
    ~pipeline:(pipeline_ : pipeline_declaration) () =
  ({ pipeline = pipeline_; tags = tags_ } : create_pipeline_input)

let make_create_custom_action_type_output ?tags:(tags_ : tag_list option)
    ~action_type:(action_type_ : action_type) () =
  ({ action_type = action_type_; tags = tags_ } : create_custom_action_type_output)

let make_create_custom_action_type_input ?settings:(settings_ : action_type_settings option)
    ?configuration_properties:
      (configuration_properties_ : action_configuration_property_list option)
    ?tags:(tags_ : tag_list option) ~category:(category_ : action_category)
    ~provider:(provider_ : action_provider) ~version:(version_ : version)
    ~input_artifact_details:(input_artifact_details_ : artifact_details)
    ~output_artifact_details:(output_artifact_details_ : artifact_details) () =
  ({
     category = category_;
     provider = provider_;
     version = version_;
     settings = settings_;
     configuration_properties = configuration_properties_;
     input_artifact_details = input_artifact_details_;
     output_artifact_details = output_artifact_details_;
     tags = tags_;
   }
    : create_custom_action_type_input)
