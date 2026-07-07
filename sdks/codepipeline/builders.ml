open Types

let make_webhook_filter_rule ?match_equals:(match_equals_ : match_equals option)
    ~json_path:(json_path_ : json_path) () =
  ({ match_equals = match_equals_; json_path = json_path_ } : webhook_filter_rule)

let make_webhook_auth_configuration
    ?secret_token:(secret_token_ : webhook_auth_configuration_secret_token option)
    ?allowed_ip_range:(allowed_ip_range_ : webhook_auth_configuration_allowed_ip_range option) () =
  ({ secret_token = secret_token_; allowed_ip_range = allowed_ip_range_ }
    : webhook_auth_configuration)

let make_webhook_definition
    ~authentication_configuration:(authentication_configuration_ : webhook_auth_configuration)
    ~authentication:(authentication_ : webhook_authentication_type)
    ~filters:(filters_ : webhook_filters) ~target_action:(target_action_ : action_name)
    ~target_pipeline:(target_pipeline_ : pipeline_name) ~name:(name_ : webhook_name) () =
  ({
     authentication_configuration = authentication_configuration_;
     authentication = authentication_;
     filters = filters_;
     target_action = target_action_;
     target_pipeline = target_pipeline_;
     name = name_;
   }
    : webhook_definition)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_list_webhook_item ?tags:(tags_ : tag_list option) ?arn:(arn_ : webhook_arn option)
    ?last_triggered:(last_triggered_ : webhook_last_triggered option)
    ?error_code:(error_code_ : webhook_error_code option)
    ?error_message:(error_message_ : webhook_error_message option) ~url:(url_ : webhook_url)
    ~definition:(definition_ : webhook_definition) () =
  ({
     tags = tags_;
     arn = arn_;
     last_triggered = last_triggered_;
     error_code = error_code_;
     error_message = error_message_;
     url = url_;
     definition = definition_;
   }
    : list_webhook_item)

let make_encryption_key ~type_:(type__ : encryption_key_type) ~id:(id_ : encryption_key_id) () =
  ({ type_ = type__; id = id_ } : encryption_key)

let make_artifact_store ?encryption_key:(encryption_key_ : encryption_key option)
    ~location:(location_ : artifact_store_location) ~type_:(type__ : artifact_store_type) () =
  ({ encryption_key = encryption_key_; location = location_; type_ = type__ } : artifact_store)

let make_blocker_declaration ~type_:(type__ : blocker_type) ~name:(name_ : blocker_name) () =
  ({ type_ = type__; name = name_ } : blocker_declaration)

let make_action_type_id ~version:(version_ : version) ~provider:(provider_ : action_provider)
    ~owner:(owner_ : action_owner) ~category:(category_ : action_category) () =
  ({ version = version_; provider = provider_; owner = owner_; category = category_ }
    : action_type_id)

let make_output_artifact ?files:(files_ : file_path_list option) ~name:(name_ : artifact_name) () =
  ({ files = files_; name = name_ } : output_artifact)

let make_input_artifact ~name:(name_ : artifact_name) () = ({ name = name_ } : input_artifact)

let make_environment_variable ?type_:(type__ : environment_variable_type option)
    ~value:(value_ : environment_variable_value) ~name:(name_ : environment_variable_name) () =
  ({ type_ = type__; value = value_; name = name_ } : environment_variable)

let make_action_declaration
    ?environment_variables:(environment_variables_ : environment_variable_list option)
    ?timeout_in_minutes:(timeout_in_minutes_ : action_timeout option)
    ?namespace:(namespace_ : action_namespace option) ?region:(region_ : aws_region_name option)
    ?role_arn:(role_arn_ : role_arn option)
    ?output_variables:(output_variables_ : output_variable_list option)
    ?input_artifacts:(input_artifacts_ : input_artifact_list option)
    ?output_artifacts:(output_artifacts_ : output_artifact_list option)
    ?commands:(commands_ : command_list option)
    ?configuration:(configuration_ : action_configuration_map option)
    ?run_order:(run_order_ : action_run_order option)
    ~action_type_id:(action_type_id_ : action_type_id) ~name:(name_ : action_name) () =
  ({
     environment_variables = environment_variables_;
     timeout_in_minutes = timeout_in_minutes_;
     namespace = namespace_;
     region = region_;
     role_arn = role_arn_;
     output_variables = output_variables_;
     input_artifacts = input_artifacts_;
     output_artifacts = output_artifacts_;
     commands = commands_;
     configuration = configuration_;
     run_order = run_order_;
     action_type_id = action_type_id_;
     name = name_;
   }
    : action_declaration)

let make_retry_configuration ?retry_mode:(retry_mode_ : stage_retry_mode option) () =
  ({ retry_mode = retry_mode_ } : retry_configuration)

let make_rule_type_id ?version:(version_ : version option) ?owner:(owner_ : rule_owner option)
    ~provider:(provider_ : rule_provider) ~category:(category_ : rule_category) () =
  ({ version = version_; provider = provider_; owner = owner_; category = category_ }
    : rule_type_id)

let make_rule_declaration ?timeout_in_minutes:(timeout_in_minutes_ : rule_timeout option)
    ?region:(region_ : aws_region_name option) ?role_arn:(role_arn_ : role_arn option)
    ?input_artifacts:(input_artifacts_ : input_artifact_list option)
    ?commands:(commands_ : command_list option)
    ?configuration:(configuration_ : rule_configuration_map option)
    ~rule_type_id:(rule_type_id_ : rule_type_id) ~name:(name_ : rule_name) () =
  ({
     timeout_in_minutes = timeout_in_minutes_;
     region = region_;
     role_arn = role_arn_;
     input_artifacts = input_artifacts_;
     commands = commands_;
     configuration = configuration_;
     rule_type_id = rule_type_id_;
     name = name_;
   }
    : rule_declaration)

let make_condition ?rules:(rules_ : rule_declaration_list option)
    ?result_:(result__ : result_ option) () =
  ({ rules = rules_; result_ = result__ } : condition)

let make_failure_conditions ?conditions:(conditions_ : condition_list option)
    ?retry_configuration:(retry_configuration_ : retry_configuration option)
    ?result_:(result__ : result_ option) () =
  ({ conditions = conditions_; retry_configuration = retry_configuration_; result_ = result__ }
    : failure_conditions)

let make_success_conditions ~conditions:(conditions_ : condition_list) () =
  ({ conditions = conditions_ } : success_conditions)

let make_before_entry_conditions ~conditions:(conditions_ : condition_list) () =
  ({ conditions = conditions_ } : before_entry_conditions)

let make_stage_declaration ?before_entry:(before_entry_ : before_entry_conditions option)
    ?on_success:(on_success_ : success_conditions option)
    ?on_failure:(on_failure_ : failure_conditions option)
    ?blockers:(blockers_ : stage_blocker_declaration_list option)
    ~actions:(actions_ : stage_action_declaration_list) ~name:(name_ : stage_name) () =
  ({
     before_entry = before_entry_;
     on_success = on_success_;
     on_failure = on_failure_;
     actions = actions_;
     blockers = blockers_;
     name = name_;
   }
    : stage_declaration)

let make_pipeline_variable_declaration
    ?description:(description_ : pipeline_variable_description option)
    ?default_value:(default_value_ : pipeline_variable_value option)
    ~name:(name_ : pipeline_variable_name) () =
  ({ description = description_; default_value = default_value_; name = name_ }
    : pipeline_variable_declaration)

let make_git_tag_filter_criteria ?excludes:(excludes_ : git_tag_pattern_list option)
    ?includes:(includes_ : git_tag_pattern_list option) () =
  ({ excludes = excludes_; includes = includes_ } : git_tag_filter_criteria)

let make_git_branch_filter_criteria ?excludes:(excludes_ : git_branch_pattern_list option)
    ?includes:(includes_ : git_branch_pattern_list option) () =
  ({ excludes = excludes_; includes = includes_ } : git_branch_filter_criteria)

let make_git_file_path_filter_criteria ?excludes:(excludes_ : git_file_path_pattern_list option)
    ?includes:(includes_ : git_file_path_pattern_list option) () =
  ({ excludes = excludes_; includes = includes_ } : git_file_path_filter_criteria)

let make_git_push_filter ?file_paths:(file_paths_ : git_file_path_filter_criteria option)
    ?branches:(branches_ : git_branch_filter_criteria option)
    ?tags:(tags_ : git_tag_filter_criteria option) () =
  ({ file_paths = file_paths_; branches = branches_; tags = tags_ } : git_push_filter)

let make_git_pull_request_filter ?file_paths:(file_paths_ : git_file_path_filter_criteria option)
    ?branches:(branches_ : git_branch_filter_criteria option)
    ?events:(events_ : git_pull_request_event_type_list option) () =
  ({ file_paths = file_paths_; branches = branches_; events = events_ } : git_pull_request_filter)

let make_git_configuration ?pull_request:(pull_request_ : git_pull_request_filter_list option)
    ?push:(push_ : git_push_filter_list option)
    ~source_action_name:(source_action_name_ : action_name) () =
  ({ pull_request = pull_request_; push = push_; source_action_name = source_action_name_ }
    : git_configuration)

let make_pipeline_trigger_declaration ~git_configuration:(git_configuration_ : git_configuration)
    ~provider_type:(provider_type_ : pipeline_trigger_provider_type) () =
  ({ git_configuration = git_configuration_; provider_type = provider_type_ }
    : pipeline_trigger_declaration)

let make_pipeline_declaration ?triggers:(triggers_ : pipeline_trigger_declaration_list option)
    ?variables:(variables_ : pipeline_variable_declaration_list option)
    ?pipeline_type:(pipeline_type_ : pipeline_type option)
    ?execution_mode:(execution_mode_ : execution_mode option)
    ?version:(version_ : pipeline_version option)
    ?artifact_stores:(artifact_stores_ : artifact_store_map option)
    ?artifact_store:(artifact_store_ : artifact_store option)
    ~stages:(stages_ : pipeline_stage_declaration_list) ~role_arn:(role_arn_ : role_arn)
    ~name:(name_ : pipeline_name) () =
  ({
     triggers = triggers_;
     variables = variables_;
     pipeline_type = pipeline_type_;
     execution_mode = execution_mode_;
     version = version_;
     stages = stages_;
     artifact_stores = artifact_stores_;
     artifact_store = artifact_store_;
     role_arn = role_arn_;
     name = name_;
   }
    : pipeline_declaration)

let make_update_pipeline_output ?pipeline:(pipeline_ : pipeline_declaration option) () =
  ({ pipeline = pipeline_ } : update_pipeline_output)

let make_update_pipeline_input ~pipeline:(pipeline_ : pipeline_declaration) () =
  ({ pipeline = pipeline_ } : update_pipeline_input)

let make_lambda_executor_configuration
    ~lambda_function_arn:(lambda_function_arn_ : lambda_function_arn) () =
  ({ lambda_function_arn = lambda_function_arn_ } : lambda_executor_configuration)

let make_job_worker_executor_configuration
    ?polling_service_principals:
      (polling_service_principals_ : polling_service_principal_list option)
    ?polling_accounts:(polling_accounts_ : polling_account_list option) () =
  ({
     polling_service_principals = polling_service_principals_;
     polling_accounts = polling_accounts_;
   }
    : job_worker_executor_configuration)

let make_executor_configuration
    ?job_worker_executor_configuration:
      (job_worker_executor_configuration_ : job_worker_executor_configuration option)
    ?lambda_executor_configuration:
      (lambda_executor_configuration_ : lambda_executor_configuration option) () =
  ({
     job_worker_executor_configuration = job_worker_executor_configuration_;
     lambda_executor_configuration = lambda_executor_configuration_;
   }
    : executor_configuration)

let make_action_type_executor ?job_timeout:(job_timeout_ : job_timeout option)
    ?policy_statements_template:(policy_statements_template_ : policy_statements_template option)
    ~type_:(type__ : executor_type) ~configuration:(configuration_ : executor_configuration) () =
  ({
     job_timeout = job_timeout_;
     policy_statements_template = policy_statements_template_;
     type_ = type__;
     configuration = configuration_;
   }
    : action_type_executor)

let make_action_type_identifier ~version:(version_ : version)
    ~provider:(provider_ : action_provider) ~owner:(owner_ : action_type_owner)
    ~category:(category_ : action_category) () =
  ({ version = version_; provider = provider_; owner = owner_; category = category_ }
    : action_type_identifier)

let make_action_type_artifact_details
    ~maximum_count:(maximum_count_ : maximum_action_type_artifact_count)
    ~minimum_count:(minimum_count_ : minimum_action_type_artifact_count) () =
  ({ maximum_count = maximum_count_; minimum_count = minimum_count_ }
    : action_type_artifact_details)

let make_action_type_permissions ~allowed_accounts:(allowed_accounts_ : allowed_accounts) () =
  ({ allowed_accounts = allowed_accounts_ } : action_type_permissions)

let make_action_type_property ?description:(description_ : property_description option)
    ?queryable:(queryable_ : boolean_ option) ~no_echo:(no_echo_ : boolean_) ~key:(key_ : boolean_)
    ~optional:(optional_ : boolean_) ~name:(name_ : action_configuration_key) () =
  ({
     description = description_;
     queryable = queryable_;
     no_echo = no_echo_;
     key = key_;
     optional = optional_;
     name = name_;
   }
    : action_type_property)

let make_action_type_urls ?revision_url_template:(revision_url_template_ : url_template option)
    ?execution_url_template:(execution_url_template_ : url_template option)
    ?entity_url_template:(entity_url_template_ : url_template option)
    ?configuration_url:(configuration_url_ : url option) () =
  ({
     revision_url_template = revision_url_template_;
     execution_url_template = execution_url_template_;
     entity_url_template = entity_url_template_;
     configuration_url = configuration_url_;
   }
    : action_type_urls)

let make_action_type_declaration ?urls:(urls_ : action_type_urls option)
    ?properties:(properties_ : action_type_properties option)
    ?permissions:(permissions_ : action_type_permissions option)
    ?description:(description_ : action_type_description option)
    ~output_artifact_details:(output_artifact_details_ : action_type_artifact_details)
    ~input_artifact_details:(input_artifact_details_ : action_type_artifact_details)
    ~id:(id_ : action_type_identifier) ~executor:(executor_ : action_type_executor) () =
  ({
     urls = urls_;
     properties = properties_;
     permissions = permissions_;
     output_artifact_details = output_artifact_details_;
     input_artifact_details = input_artifact_details_;
     id = id_;
     executor = executor_;
     description = description_;
   }
    : action_type_declaration)

let make_update_action_type_input ~action_type:(action_type_ : action_type_declaration) () =
  ({ action_type = action_type_ } : update_action_type_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)

let make_transition_state ?disabled_reason:(disabled_reason_ : disabled_reason option)
    ?last_changed_at:(last_changed_at_ : last_changed_at option)
    ?last_changed_by:(last_changed_by_ : last_changed_by option)
    ?enabled:(enabled_ : enabled option) () =
  ({
     disabled_reason = disabled_reason_;
     last_changed_at = last_changed_at_;
     last_changed_by = last_changed_by_;
     enabled = enabled_;
   }
    : transition_state)

let make_third_party_job ?job_id:(job_id_ : job_id option)
    ?client_id:(client_id_ : client_id option) () =
  ({ job_id = job_id_; client_id = client_id_ } : third_party_job)

let make_action_configuration ?configuration:(configuration_ : action_configuration_map option) () =
  ({ configuration = configuration_ } : action_configuration)

let make_stage_context ?name:(name_ : stage_name option) () = ({ name = name_ } : stage_context)

let make_action_context ?action_execution_id:(action_execution_id_ : action_execution_id option)
    ?name:(name_ : action_name option) () =
  ({ action_execution_id = action_execution_id_; name = name_ } : action_context)

let make_pipeline_context
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) ?action:(action_ : action_context option)
    ?stage:(stage_ : stage_context option) ?pipeline_name:(pipeline_name_ : pipeline_name option) ()
    =
  ({
     pipeline_execution_id = pipeline_execution_id_;
     pipeline_arn = pipeline_arn_;
     action = action_;
     stage = stage_;
     pipeline_name = pipeline_name_;
   }
    : pipeline_context)

let make_s3_artifact_location ~object_key:(object_key_ : s3_object_key)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({ object_key = object_key_; bucket_name = bucket_name_ } : s3_artifact_location)

let make_artifact_location ?s3_location:(s3_location_ : s3_artifact_location option)
    ?type_:(type__ : artifact_location_type option) () =
  ({ s3_location = s3_location_; type_ = type__ } : artifact_location)

let make_artifact ?location:(location_ : artifact_location option)
    ?revision:(revision_ : revision option) ?name:(name_ : artifact_name option) () =
  ({ location = location_; revision = revision_; name = name_ } : artifact)

let make_aws_session_credentials ~session_token:(session_token_ : session_token)
    ~secret_access_key:(secret_access_key_ : secret_access_key)
    ~access_key_id:(access_key_id_ : access_key_id) () =
  ({
     session_token = session_token_;
     secret_access_key = secret_access_key_;
     access_key_id = access_key_id_;
   }
    : aws_session_credentials)

let make_third_party_job_data ?encryption_key:(encryption_key_ : encryption_key option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?artifact_credentials:(artifact_credentials_ : aws_session_credentials option)
    ?output_artifacts:(output_artifacts_ : artifact_list option)
    ?input_artifacts:(input_artifacts_ : artifact_list option)
    ?pipeline_context:(pipeline_context_ : pipeline_context option)
    ?action_configuration:(action_configuration_ : action_configuration option)
    ?action_type_id:(action_type_id_ : action_type_id option) () =
  ({
     encryption_key = encryption_key_;
     continuation_token = continuation_token_;
     artifact_credentials = artifact_credentials_;
     output_artifacts = output_artifacts_;
     input_artifacts = input_artifacts_;
     pipeline_context = pipeline_context_;
     action_configuration = action_configuration_;
     action_type_id = action_type_id_;
   }
    : third_party_job_data)

let make_third_party_job_details ?nonce:(nonce_ : nonce option)
    ?data:(data_ : third_party_job_data option) ?id:(id_ : third_party_job_id option) () =
  ({ nonce = nonce_; data = data_; id = id_ } : third_party_job_details)

let make_target_filter ?values:(values_ : target_filter_value_list option)
    ?name:(name_ : target_filter_name option) () =
  ({ values = values_; name = name_ } : target_filter)

let make_tag_resource_output () = (() : unit)

let make_tag_resource_input ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : resource_arn) ()
    =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)

let make_succeeded_in_stage_filter ?stage_name:(stage_name_ : stage_name option) () =
  ({ stage_name = stage_name_ } : succeeded_in_stage_filter)

let make_stop_pipeline_execution_output
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : stop_pipeline_execution_output)

let make_stop_pipeline_execution_input ?reason:(reason_ : stop_pipeline_execution_reason option)
    ?abandon:(abandon_ : boolean_ option)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     reason = reason_;
     abandon = abandon_;
     pipeline_execution_id = pipeline_execution_id_;
     pipeline_name = pipeline_name_;
   }
    : stop_pipeline_execution_input)

let make_stop_execution_trigger ?reason:(reason_ : stop_pipeline_execution_reason option) () =
  ({ reason = reason_ } : stop_execution_trigger)

let make_start_pipeline_execution_output
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : start_pipeline_execution_output)

let make_pipeline_variable ~value:(value_ : pipeline_variable_value)
    ~name:(name_ : pipeline_variable_name) () =
  ({ value = value_; name = name_ } : pipeline_variable)

let make_source_revision_override ~revision_value:(revision_value_ : revision)
    ~revision_type:(revision_type_ : source_revision_type) ~action_name:(action_name_ : action_name)
    () =
  ({ revision_value = revision_value_; revision_type = revision_type_; action_name = action_name_ }
    : source_revision_override)

let make_start_pipeline_execution_input
    ?source_revisions:(source_revisions_ : source_revision_override_list option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?variables:(variables_ : pipeline_variable_list option) ~name:(name_ : pipeline_name) () =
  ({
     source_revisions = source_revisions_;
     client_request_token = client_request_token_;
     variables = variables_;
     name = name_;
   }
    : start_pipeline_execution_input)

let make_stage_execution ?type_:(type__ : execution_type option)
    ~status:(status_ : stage_execution_status)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id) () =
  ({ type_ = type__; status = status_; pipeline_execution_id = pipeline_execution_id_ }
    : stage_execution)

let make_action_revision ~created:(created_ : timestamp)
    ~revision_change_id:(revision_change_id_ : revision_change_identifier)
    ~revision_id:(revision_id_ : revision) () =
  ({ created = created_; revision_change_id = revision_change_id_; revision_id = revision_id_ }
    : action_revision)

let make_error_details ?message:(message_ : message option) ?code:(code_ : code option) () =
  ({ message = message_; code = code_ } : error_details)

let make_action_execution ?log_stream_ar_n:(log_stream_ar_n_ : log_stream_ar_n option)
    ?error_details:(error_details_ : error_details option)
    ?percent_complete:(percent_complete_ : percentage option)
    ?external_execution_url:(external_execution_url_ : url option)
    ?external_execution_id:(external_execution_id_ : execution_id option)
    ?last_updated_by:(last_updated_by_ : last_updated_by option)
    ?token:(token_ : action_execution_token option)
    ?last_status_change:(last_status_change_ : timestamp option)
    ?summary:(summary_ : execution_summary option)
    ?status:(status_ : action_execution_status option)
    ?action_execution_id:(action_execution_id_ : action_execution_id option) () =
  ({
     log_stream_ar_n = log_stream_ar_n_;
     error_details = error_details_;
     percent_complete = percent_complete_;
     external_execution_url = external_execution_url_;
     external_execution_id = external_execution_id_;
     last_updated_by = last_updated_by_;
     token = token_;
     last_status_change = last_status_change_;
     summary = summary_;
     status = status_;
     action_execution_id = action_execution_id_;
   }
    : action_execution)

let make_action_state ?revision_url:(revision_url_ : url option)
    ?entity_url:(entity_url_ : url option)
    ?latest_execution:(latest_execution_ : action_execution option)
    ?current_revision:(current_revision_ : action_revision option)
    ?action_name:(action_name_ : action_name option) () =
  ({
     revision_url = revision_url_;
     entity_url = entity_url_;
     latest_execution = latest_execution_;
     current_revision = current_revision_;
     action_name = action_name_;
   }
    : action_state)

let make_stage_conditions_execution ?summary:(summary_ : execution_summary option)
    ?status:(status_ : condition_execution_status option) () =
  ({ summary = summary_; status = status_ } : stage_conditions_execution)

let make_condition_execution ?last_status_change:(last_status_change_ : timestamp option)
    ?summary:(summary_ : execution_summary option)
    ?status:(status_ : condition_execution_status option) () =
  ({ last_status_change = last_status_change_; summary = summary_; status = status_ }
    : condition_execution)

let make_rule_revision ~created:(created_ : timestamp)
    ~revision_change_id:(revision_change_id_ : revision_change_identifier)
    ~revision_id:(revision_id_ : revision) () =
  ({ created = created_; revision_change_id = revision_change_id_; revision_id = revision_id_ }
    : rule_revision)

let make_rule_execution ?error_details:(error_details_ : error_details option)
    ?external_execution_url:(external_execution_url_ : url option)
    ?external_execution_id:(external_execution_id_ : execution_id option)
    ?last_updated_by:(last_updated_by_ : last_updated_by option)
    ?token:(token_ : rule_execution_token option)
    ?last_status_change:(last_status_change_ : timestamp option)
    ?summary:(summary_ : execution_summary option) ?status:(status_ : rule_execution_status option)
    ?rule_execution_id:(rule_execution_id_ : rule_execution_id option) () =
  ({
     error_details = error_details_;
     external_execution_url = external_execution_url_;
     external_execution_id = external_execution_id_;
     last_updated_by = last_updated_by_;
     token = token_;
     last_status_change = last_status_change_;
     summary = summary_;
     status = status_;
     rule_execution_id = rule_execution_id_;
   }
    : rule_execution)

let make_rule_state ?revision_url:(revision_url_ : url option)
    ?entity_url:(entity_url_ : url option)
    ?latest_execution:(latest_execution_ : rule_execution option)
    ?current_revision:(current_revision_ : rule_revision option)
    ?rule_name:(rule_name_ : rule_name option) () =
  ({
     revision_url = revision_url_;
     entity_url = entity_url_;
     latest_execution = latest_execution_;
     current_revision = current_revision_;
     rule_name = rule_name_;
   }
    : rule_state)

let make_condition_state ?rule_states:(rule_states_ : rule_state_list option)
    ?latest_execution:(latest_execution_ : condition_execution option) () =
  ({ rule_states = rule_states_; latest_execution = latest_execution_ } : condition_state)

let make_stage_condition_state ?condition_states:(condition_states_ : condition_state_list option)
    ?latest_execution:(latest_execution_ : stage_conditions_execution option) () =
  ({ condition_states = condition_states_; latest_execution = latest_execution_ }
    : stage_condition_state)

let make_retry_stage_metadata ?latest_retry_trigger:(latest_retry_trigger_ : retry_trigger option)
    ?manual_stage_retry_attempt:(manual_stage_retry_attempt_ : retry_attempt option)
    ?auto_stage_retry_attempt:(auto_stage_retry_attempt_ : retry_attempt option) () =
  ({
     latest_retry_trigger = latest_retry_trigger_;
     manual_stage_retry_attempt = manual_stage_retry_attempt_;
     auto_stage_retry_attempt = auto_stage_retry_attempt_;
   }
    : retry_stage_metadata)

let make_stage_state ?retry_stage_metadata:(retry_stage_metadata_ : retry_stage_metadata option)
    ?on_failure_condition_state:(on_failure_condition_state_ : stage_condition_state option)
    ?on_success_condition_state:(on_success_condition_state_ : stage_condition_state option)
    ?before_entry_condition_state:(before_entry_condition_state_ : stage_condition_state option)
    ?latest_execution:(latest_execution_ : stage_execution option)
    ?action_states:(action_states_ : action_state_list option)
    ?inbound_transition_state:(inbound_transition_state_ : transition_state option)
    ?inbound_executions:(inbound_executions_ : stage_execution_list option)
    ?inbound_execution:(inbound_execution_ : stage_execution option)
    ?stage_name:(stage_name_ : stage_name option) () =
  ({
     retry_stage_metadata = retry_stage_metadata_;
     on_failure_condition_state = on_failure_condition_state_;
     on_success_condition_state = on_success_condition_state_;
     before_entry_condition_state = before_entry_condition_state_;
     latest_execution = latest_execution_;
     action_states = action_states_;
     inbound_transition_state = inbound_transition_state_;
     inbound_executions = inbound_executions_;
     inbound_execution = inbound_execution_;
     stage_name = stage_name_;
   }
    : stage_state)

let make_source_revision ?revision_url:(revision_url_ : url option)
    ?revision_summary:(revision_summary_ : revision_summary option)
    ?revision_id:(revision_id_ : revision option) ~action_name:(action_name_ : action_name) () =
  ({
     revision_url = revision_url_;
     revision_summary = revision_summary_;
     revision_id = revision_id_;
     action_name = action_name_;
   }
    : source_revision)

let make_s3_location ?key:(key_ : s3_key option) ?bucket:(bucket_ : s3_bucket option) () =
  ({ key = key_; bucket = bucket_ } : s3_location)

let make_rule_type_settings ?revision_url_template:(revision_url_template_ : url_template option)
    ?execution_url_template:(execution_url_template_ : url_template option)
    ?entity_url_template:(entity_url_template_ : url_template option)
    ?third_party_configuration_url:(third_party_configuration_url_ : url option) () =
  ({
     revision_url_template = revision_url_template_;
     execution_url_template = execution_url_template_;
     entity_url_template = entity_url_template_;
     third_party_configuration_url = third_party_configuration_url_;
   }
    : rule_type_settings)

let make_rule_configuration_property ?type_:(type__ : rule_configuration_property_type option)
    ?description:(description_ : description option) ?queryable:(queryable_ : boolean_ option)
    ~secret:(secret_ : boolean_) ~key:(key_ : boolean_) ~required:(required_ : boolean_)
    ~name:(name_ : rule_configuration_key) () =
  ({
     type_ = type__;
     description = description_;
     queryable = queryable_;
     secret = secret_;
     key = key_;
     required = required_;
     name = name_;
   }
    : rule_configuration_property)

let make_artifact_details ~maximum_count:(maximum_count_ : maximum_artifact_count)
    ~minimum_count:(minimum_count_ : minimum_artifact_count) () =
  ({ maximum_count = maximum_count_; minimum_count = minimum_count_ } : artifact_details)

let make_rule_type
    ?rule_configuration_properties:
      (rule_configuration_properties_ : rule_configuration_property_list option)
    ?settings:(settings_ : rule_type_settings option)
    ~input_artifact_details:(input_artifact_details_ : artifact_details) ~id:(id_ : rule_type_id) ()
    =
  ({
     input_artifact_details = input_artifact_details_;
     rule_configuration_properties = rule_configuration_properties_;
     settings = settings_;
     id = id_;
   }
    : rule_type)

let make_rule_execution_output ?execution_result:(execution_result_ : rule_execution_result option)
    () =
  ({ execution_result = execution_result_ } : rule_execution_output)

let make_artifact_detail ?s3location:(s3location_ : s3_location option)
    ?name:(name_ : artifact_name option) () =
  ({ s3location = s3location_; name = name_ } : artifact_detail)

let make_rule_execution_input ?input_artifacts:(input_artifacts_ : artifact_detail_list option)
    ?region:(region_ : aws_region_name option) ?role_arn:(role_arn_ : role_arn option)
    ?resolved_configuration:(resolved_configuration_ : resolved_rule_configuration_map option)
    ?configuration:(configuration_ : rule_configuration_map option)
    ?rule_type_id:(rule_type_id_ : rule_type_id option) () =
  ({
     input_artifacts = input_artifacts_;
     region = region_;
     role_arn = role_arn_;
     resolved_configuration = resolved_configuration_;
     configuration = configuration_;
     rule_type_id = rule_type_id_;
   }
    : rule_execution_input)

let make_latest_in_pipeline_execution_filter
    ~start_time_range:(start_time_range_ : start_time_range)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id) () =
  ({ start_time_range = start_time_range_; pipeline_execution_id = pipeline_execution_id_ }
    : latest_in_pipeline_execution_filter)

let make_rule_execution_filter
    ?latest_in_pipeline_execution:
      (latest_in_pipeline_execution_ : latest_in_pipeline_execution_filter option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({
     latest_in_pipeline_execution = latest_in_pipeline_execution_;
     pipeline_execution_id = pipeline_execution_id_;
   }
    : rule_execution_filter)

let make_rule_execution_detail ?output:(output_ : rule_execution_output option)
    ?input:(input_ : rule_execution_input option) ?status:(status_ : rule_execution_status option)
    ?updated_by:(updated_by_ : last_updated_by option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?rule_name:(rule_name_ : rule_name option)
    ?stage_name:(stage_name_ : stage_name option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?rule_execution_id:(rule_execution_id_ : rule_execution_id option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({
     output = output_;
     input = input_;
     status = status_;
     updated_by = updated_by_;
     last_update_time = last_update_time_;
     start_time = start_time_;
     rule_name = rule_name_;
     stage_name = stage_name_;
     pipeline_version = pipeline_version_;
     rule_execution_id = rule_execution_id_;
     pipeline_execution_id = pipeline_execution_id_;
   }
    : rule_execution_detail)

let make_rollback_stage_output
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : rollback_stage_output)

let make_rollback_stage_input
    ~target_pipeline_execution_id:(target_pipeline_execution_id_ : pipeline_execution_id)
    ~stage_name:(stage_name_ : stage_name) ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     target_pipeline_execution_id = target_pipeline_execution_id_;
     stage_name = stage_name_;
     pipeline_name = pipeline_name_;
   }
    : rollback_stage_input)

let make_retry_stage_execution_output
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ pipeline_execution_id = pipeline_execution_id_ } : retry_stage_execution_output)

let make_retry_stage_execution_input ~retry_mode:(retry_mode_ : stage_retry_mode)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~stage_name:(stage_name_ : stage_name) ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     retry_mode = retry_mode_;
     pipeline_execution_id = pipeline_execution_id_;
     stage_name = stage_name_;
     pipeline_name = pipeline_name_;
   }
    : retry_stage_execution_input)

let make_resolved_pipeline_variable ?resolved_value:(resolved_value_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ resolved_value = resolved_value_; name = name_ } : resolved_pipeline_variable)

let make_register_webhook_with_third_party_output () = (() : unit)

let make_register_webhook_with_third_party_input ?webhook_name:(webhook_name_ : webhook_name option)
    () =
  ({ webhook_name = webhook_name_ } : register_webhook_with_third_party_input)

let make_put_webhook_output ?webhook:(webhook_ : list_webhook_item option) () =
  ({ webhook = webhook_ } : put_webhook_output)

let make_put_webhook_input ?tags:(tags_ : tag_list option) ~webhook:(webhook_ : webhook_definition)
    () =
  ({ tags = tags_; webhook = webhook_ } : put_webhook_input)

let make_current_revision ?revision_summary:(revision_summary_ : revision_summary option)
    ?created:(created_ : time option)
    ~change_identifier:(change_identifier_ : revision_change_identifier)
    ~revision:(revision_ : revision) () =
  ({
     revision_summary = revision_summary_;
     created = created_;
     change_identifier = change_identifier_;
     revision = revision_;
   }
    : current_revision)

let make_execution_details ?percent_complete:(percent_complete_ : percentage option)
    ?external_execution_id:(external_execution_id_ : execution_id option)
    ?summary:(summary_ : execution_summary option) () =
  ({
     percent_complete = percent_complete_;
     external_execution_id = external_execution_id_;
     summary = summary_;
   }
    : execution_details)

let make_put_third_party_job_success_result_input
    ?execution_details:(execution_details_ : execution_details option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?current_revision:(current_revision_ : current_revision option)
    ~client_token:(client_token_ : client_token) ~job_id:(job_id_ : third_party_job_id) () =
  ({
     execution_details = execution_details_;
     continuation_token = continuation_token_;
     current_revision = current_revision_;
     client_token = client_token_;
     job_id = job_id_;
   }
    : put_third_party_job_success_result_input)

let make_failure_details ?external_execution_id:(external_execution_id_ : execution_id option)
    ~message:(message_ : message) ~type_:(type__ : failure_type) () =
  ({ external_execution_id = external_execution_id_; message = message_; type_ = type__ }
    : failure_details)

let make_put_third_party_job_failure_result_input
    ~failure_details:(failure_details_ : failure_details)
    ~client_token:(client_token_ : client_token) ~job_id:(job_id_ : third_party_job_id) () =
  ({ failure_details = failure_details_; client_token = client_token_; job_id = job_id_ }
    : put_third_party_job_failure_result_input)

let make_put_job_success_result_input
    ?output_variables:(output_variables_ : output_variables_map option)
    ?execution_details:(execution_details_ : execution_details option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?current_revision:(current_revision_ : current_revision option) ~job_id:(job_id_ : job_id) () =
  ({
     output_variables = output_variables_;
     execution_details = execution_details_;
     continuation_token = continuation_token_;
     current_revision = current_revision_;
     job_id = job_id_;
   }
    : put_job_success_result_input)

let make_put_job_failure_result_input ~failure_details:(failure_details_ : failure_details)
    ~job_id:(job_id_ : job_id) () =
  ({ failure_details = failure_details_; job_id = job_id_ } : put_job_failure_result_input)

let make_put_approval_result_output ?approved_at:(approved_at_ : timestamp option) () =
  ({ approved_at = approved_at_ } : put_approval_result_output)

let make_put_approval_result_input ~token:(token_ : approval_token)
    ~result_:(result__ : approval_result) ~action_name:(action_name_ : action_name)
    ~stage_name:(stage_name_ : stage_name) ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     token = token_;
     result_ = result__;
     action_name = action_name_;
     stage_name = stage_name_;
     pipeline_name = pipeline_name_;
   }
    : put_approval_result_input)

let make_put_action_revision_output
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?new_revision:(new_revision_ : boolean_ option) () =
  ({ pipeline_execution_id = pipeline_execution_id_; new_revision = new_revision_ }
    : put_action_revision_output)

let make_put_action_revision_input ~action_revision:(action_revision_ : action_revision)
    ~action_name:(action_name_ : action_name) ~stage_name:(stage_name_ : stage_name)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     action_revision = action_revision_;
     action_name = action_name_;
     stage_name = stage_name_;
     pipeline_name = pipeline_name_;
   }
    : put_action_revision_input)

let make_poll_for_third_party_jobs_output ?jobs:(jobs_ : third_party_job_list option) () =
  ({ jobs = jobs_ } : poll_for_third_party_jobs_output)

let make_poll_for_third_party_jobs_input ?max_batch_size:(max_batch_size_ : max_batch_size option)
    ~action_type_id:(action_type_id_ : action_type_id) () =
  ({ max_batch_size = max_batch_size_; action_type_id = action_type_id_ }
    : poll_for_third_party_jobs_input)

let make_job_data ?encryption_key:(encryption_key_ : encryption_key option)
    ?continuation_token:(continuation_token_ : continuation_token option)
    ?artifact_credentials:(artifact_credentials_ : aws_session_credentials option)
    ?output_artifacts:(output_artifacts_ : artifact_list option)
    ?input_artifacts:(input_artifacts_ : artifact_list option)
    ?pipeline_context:(pipeline_context_ : pipeline_context option)
    ?action_configuration:(action_configuration_ : action_configuration option)
    ?action_type_id:(action_type_id_ : action_type_id option) () =
  ({
     encryption_key = encryption_key_;
     continuation_token = continuation_token_;
     artifact_credentials = artifact_credentials_;
     output_artifacts = output_artifacts_;
     input_artifacts = input_artifacts_;
     pipeline_context = pipeline_context_;
     action_configuration = action_configuration_;
     action_type_id = action_type_id_;
   }
    : job_data)

let make_job ?account_id:(account_id_ : account_id option) ?nonce:(nonce_ : nonce option)
    ?data:(data_ : job_data option) ?id:(id_ : job_id option) () =
  ({ account_id = account_id_; nonce = nonce_; data = data_; id = id_ } : job)

let make_poll_for_jobs_output ?jobs:(jobs_ : job_list option) () =
  ({ jobs = jobs_ } : poll_for_jobs_output)

let make_poll_for_jobs_input ?query_param:(query_param_ : query_param_map option)
    ?max_batch_size:(max_batch_size_ : max_batch_size option)
    ~action_type_id:(action_type_id_ : action_type_id) () =
  ({
     query_param = query_param_;
     max_batch_size = max_batch_size_;
     action_type_id = action_type_id_;
   }
    : poll_for_jobs_input)

let make_pipeline_summary ?updated:(updated_ : timestamp option)
    ?created:(created_ : timestamp option) ?execution_mode:(execution_mode_ : execution_mode option)
    ?pipeline_type:(pipeline_type_ : pipeline_type option)
    ?version:(version_ : pipeline_version option) ?name:(name_ : pipeline_name option) () =
  ({
     updated = updated_;
     created = created_;
     execution_mode = execution_mode_;
     pipeline_type = pipeline_type_;
     version = version_;
     name = name_;
   }
    : pipeline_summary)

let make_pipeline_rollback_metadata
    ?rollback_target_pipeline_execution_id:
      (rollback_target_pipeline_execution_id_ : pipeline_execution_id option) () =
  ({ rollback_target_pipeline_execution_id = rollback_target_pipeline_execution_id_ }
    : pipeline_rollback_metadata)

let make_pipeline_metadata ?polling_disabled_at:(polling_disabled_at_ : timestamp option)
    ?updated:(updated_ : timestamp option) ?created:(created_ : timestamp option)
    ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({
     polling_disabled_at = polling_disabled_at_;
     updated = updated_;
     created = created_;
     pipeline_arn = pipeline_arn_;
   }
    : pipeline_metadata)

let make_execution_trigger ?trigger_detail:(trigger_detail_ : trigger_detail option)
    ?trigger_type:(trigger_type_ : trigger_type option) () =
  ({ trigger_detail = trigger_detail_; trigger_type = trigger_type_ } : execution_trigger)

let make_pipeline_execution_summary
    ?rollback_metadata:(rollback_metadata_ : pipeline_rollback_metadata option)
    ?execution_type:(execution_type_ : execution_type option)
    ?execution_mode:(execution_mode_ : execution_mode option)
    ?stop_trigger:(stop_trigger_ : stop_execution_trigger option)
    ?trigger:(trigger_ : execution_trigger option)
    ?source_revisions:(source_revisions_ : source_revision_list option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?status_summary:(status_summary_ : pipeline_execution_status_summary option)
    ?status:(status_ : pipeline_execution_status option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({
     rollback_metadata = rollback_metadata_;
     execution_type = execution_type_;
     execution_mode = execution_mode_;
     stop_trigger = stop_trigger_;
     trigger = trigger_;
     source_revisions = source_revisions_;
     last_update_time = last_update_time_;
     start_time = start_time_;
     status_summary = status_summary_;
     status = status_;
     pipeline_execution_id = pipeline_execution_id_;
   }
    : pipeline_execution_summary)

let make_pipeline_execution_filter
    ?succeeded_in_stage:(succeeded_in_stage_ : succeeded_in_stage_filter option) () =
  ({ succeeded_in_stage = succeeded_in_stage_ } : pipeline_execution_filter)

let make_artifact_revision ?revision_url:(revision_url_ : url option)
    ?created:(created_ : timestamp option)
    ?revision_summary:(revision_summary_ : revision_summary option)
    ?revision_change_identifier:(revision_change_identifier_ : revision_change_identifier option)
    ?revision_id:(revision_id_ : revision option) ?name:(name_ : artifact_name option) () =
  ({
     revision_url = revision_url_;
     created = created_;
     revision_summary = revision_summary_;
     revision_change_identifier = revision_change_identifier_;
     revision_id = revision_id_;
     name = name_;
   }
    : artifact_revision)

let make_pipeline_execution
    ?rollback_metadata:(rollback_metadata_ : pipeline_rollback_metadata option)
    ?execution_type:(execution_type_ : execution_type option)
    ?execution_mode:(execution_mode_ : execution_mode option)
    ?trigger:(trigger_ : execution_trigger option)
    ?variables:(variables_ : resolved_pipeline_variable_list option)
    ?artifact_revisions:(artifact_revisions_ : artifact_revision_list option)
    ?status_summary:(status_summary_ : pipeline_execution_status_summary option)
    ?status:(status_ : pipeline_execution_status option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option) () =
  ({
     rollback_metadata = rollback_metadata_;
     execution_type = execution_type_;
     execution_mode = execution_mode_;
     trigger = trigger_;
     variables = variables_;
     artifact_revisions = artifact_revisions_;
     status_summary = status_summary_;
     status = status_;
     pipeline_execution_id = pipeline_execution_id_;
     pipeline_version = pipeline_version_;
     pipeline_name = pipeline_name_;
   }
    : pipeline_execution)

let make_override_stage_condition_input ~condition_type:(condition_type_ : condition_type)
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~stage_name:(stage_name_ : stage_name) ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     condition_type = condition_type_;
     pipeline_execution_id = pipeline_execution_id_;
     stage_name = stage_name_;
     pipeline_name = pipeline_name_;
   }
    : override_stage_condition_input)

let make_list_webhooks_output ?next_token:(next_token_ : next_token option)
    ?webhooks:(webhooks_ : webhook_list option) () =
  ({ next_token = next_token_; webhooks = webhooks_ } : list_webhooks_output)

let make_list_webhooks_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_webhooks_input)

let make_list_tags_for_resource_output ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ max_results = max_results_; next_token = next_token_; resource_arn = resource_arn_ }
    : list_tags_for_resource_input)

let make_list_rule_types_output ~rule_types:(rule_types_ : rule_type_list) () =
  ({ rule_types = rule_types_ } : list_rule_types_output)

let make_list_rule_types_input ?region_filter:(region_filter_ : aws_region_name option)
    ?rule_owner_filter:(rule_owner_filter_ : rule_owner option) () =
  ({ region_filter = region_filter_; rule_owner_filter = rule_owner_filter_ }
    : list_rule_types_input)

let make_list_rule_executions_output ?next_token:(next_token_ : next_token option)
    ?rule_execution_details:(rule_execution_details_ : rule_execution_detail_list option) () =
  ({ next_token = next_token_; rule_execution_details = rule_execution_details_ }
    : list_rule_executions_output)

let make_list_rule_executions_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filter:(filter_ : rule_execution_filter option) ~pipeline_name:(pipeline_name_ : pipeline_name)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
     pipeline_name = pipeline_name_;
   }
    : list_rule_executions_input)

let make_list_pipelines_output ?next_token:(next_token_ : next_token option)
    ?pipelines:(pipelines_ : pipeline_list option) () =
  ({ next_token = next_token_; pipelines = pipelines_ } : list_pipelines_output)

let make_list_pipelines_input ?max_results:(max_results_ : max_pipelines option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_pipelines_input)

let make_list_pipeline_executions_output ?next_token:(next_token_ : next_token option)
    ?pipeline_execution_summaries:
      (pipeline_execution_summaries_ : pipeline_execution_summary_list option) () =
  ({ next_token = next_token_; pipeline_execution_summaries = pipeline_execution_summaries_ }
    : list_pipeline_executions_output)

let make_list_pipeline_executions_input ?next_token:(next_token_ : next_token option)
    ?filter:(filter_ : pipeline_execution_filter option)
    ?max_results:(max_results_ : max_results option) ~pipeline_name:(pipeline_name_ : pipeline_name)
    () =
  ({
     next_token = next_token_;
     filter = filter_;
     max_results = max_results_;
     pipeline_name = pipeline_name_;
   }
    : list_pipeline_executions_input)

let make_deploy_target_event_context ?message:(message_ : string_ option)
    ?ssm_command_id:(ssm_command_id_ : string_ option) () =
  ({ message = message_; ssm_command_id = ssm_command_id_ } : deploy_target_event_context)

let make_deploy_target_event ?context:(context_ : deploy_target_event_context option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?status:(status_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     context = context_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     name = name_;
   }
    : deploy_target_event)

let make_deploy_action_execution_target ?events:(events_ : deploy_target_event_list option)
    ?end_time:(end_time_ : timestamp option) ?start_time:(start_time_ : timestamp option)
    ?status:(status_ : string_ option) ?target_type:(target_type_ : string_ option)
    ?target_id:(target_id_ : string_ option) () =
  ({
     events = events_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     target_type = target_type_;
     target_id = target_id_;
   }
    : deploy_action_execution_target)

let make_list_deploy_action_execution_targets_output ?next_token:(next_token_ : next_token option)
    ?targets:(targets_ : deploy_action_execution_target_list option) () =
  ({ next_token = next_token_; targets = targets_ } : list_deploy_action_execution_targets_output)

let make_list_deploy_action_execution_targets_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : target_filter_list option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ~action_execution_id:(action_execution_id_ : action_execution_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     action_execution_id = action_execution_id_;
     pipeline_name = pipeline_name_;
   }
    : list_deploy_action_execution_targets_input)

let make_action_type_settings ?revision_url_template:(revision_url_template_ : url_template option)
    ?execution_url_template:(execution_url_template_ : url_template option)
    ?entity_url_template:(entity_url_template_ : url_template option)
    ?third_party_configuration_url:(third_party_configuration_url_ : url option) () =
  ({
     revision_url_template = revision_url_template_;
     execution_url_template = execution_url_template_;
     entity_url_template = entity_url_template_;
     third_party_configuration_url = third_party_configuration_url_;
   }
    : action_type_settings)

let make_action_configuration_property ?type_:(type__ : action_configuration_property_type option)
    ?description:(description_ : description option) ?queryable:(queryable_ : boolean_ option)
    ~secret:(secret_ : boolean_) ~key:(key_ : boolean_) ~required:(required_ : boolean_)
    ~name:(name_ : action_configuration_key) () =
  ({
     type_ = type__;
     description = description_;
     queryable = queryable_;
     secret = secret_;
     key = key_;
     required = required_;
     name = name_;
   }
    : action_configuration_property)

let make_action_type
    ?action_configuration_properties:
      (action_configuration_properties_ : action_configuration_property_list option)
    ?settings:(settings_ : action_type_settings option)
    ~output_artifact_details:(output_artifact_details_ : artifact_details)
    ~input_artifact_details:(input_artifact_details_ : artifact_details) ~id:(id_ : action_type_id)
    () =
  ({
     output_artifact_details = output_artifact_details_;
     input_artifact_details = input_artifact_details_;
     action_configuration_properties = action_configuration_properties_;
     settings = settings_;
     id = id_;
   }
    : action_type)

let make_list_action_types_output ?next_token:(next_token_ : next_token option)
    ~action_types:(action_types_ : action_type_list) () =
  ({ next_token = next_token_; action_types = action_types_ } : list_action_types_output)

let make_list_action_types_input ?region_filter:(region_filter_ : aws_region_name option)
    ?next_token:(next_token_ : next_token option)
    ?action_owner_filter:(action_owner_filter_ : action_owner option) () =
  ({
     region_filter = region_filter_;
     next_token = next_token_;
     action_owner_filter = action_owner_filter_;
   }
    : list_action_types_input)

let make_action_execution_input ?namespace:(namespace_ : action_namespace option)
    ?input_artifacts:(input_artifacts_ : artifact_detail_list option)
    ?region:(region_ : aws_region_name option) ?role_arn:(role_arn_ : role_arn option)
    ?resolved_configuration:(resolved_configuration_ : resolved_action_configuration_map option)
    ?configuration:(configuration_ : action_configuration_map option)
    ?action_type_id:(action_type_id_ : action_type_id option) () =
  ({
     namespace = namespace_;
     input_artifacts = input_artifacts_;
     region = region_;
     role_arn = role_arn_;
     resolved_configuration = resolved_configuration_;
     configuration = configuration_;
     action_type_id = action_type_id_;
   }
    : action_execution_input)

let make_action_execution_output ?output_variables:(output_variables_ : output_variables_map option)
    ?execution_result:(execution_result_ : action_execution_result option)
    ?output_artifacts:(output_artifacts_ : artifact_detail_list option) () =
  ({
     output_variables = output_variables_;
     execution_result = execution_result_;
     output_artifacts = output_artifacts_;
   }
    : action_execution_output)

let make_action_execution_detail ?output:(output_ : action_execution_output option)
    ?input:(input_ : action_execution_input option)
    ?status:(status_ : action_execution_status option)
    ?updated_by:(updated_by_ : last_updated_by option)
    ?last_update_time:(last_update_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?action_name:(action_name_ : action_name option)
    ?stage_name:(stage_name_ : stage_name option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?action_execution_id:(action_execution_id_ : action_execution_id option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({
     output = output_;
     input = input_;
     status = status_;
     updated_by = updated_by_;
     last_update_time = last_update_time_;
     start_time = start_time_;
     action_name = action_name_;
     stage_name = stage_name_;
     pipeline_version = pipeline_version_;
     action_execution_id = action_execution_id_;
     pipeline_execution_id = pipeline_execution_id_;
   }
    : action_execution_detail)

let make_list_action_executions_output ?next_token:(next_token_ : next_token option)
    ?action_execution_details:(action_execution_details_ : action_execution_detail_list option) () =
  ({ next_token = next_token_; action_execution_details = action_execution_details_ }
    : list_action_executions_output)

let make_action_execution_filter
    ?latest_in_pipeline_execution:
      (latest_in_pipeline_execution_ : latest_in_pipeline_execution_filter option)
    ?pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id option) () =
  ({
     latest_in_pipeline_execution = latest_in_pipeline_execution_;
     pipeline_execution_id = pipeline_execution_id_;
   }
    : action_execution_filter)

let make_list_action_executions_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filter:(filter_ : action_execution_filter option)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filter = filter_;
     pipeline_name = pipeline_name_;
   }
    : list_action_executions_input)

let make_job_details ?account_id:(account_id_ : account_id option) ?data:(data_ : job_data option)
    ?id:(id_ : job_id option) () =
  ({ account_id = account_id_; data = data_; id = id_ } : job_details)

let make_get_third_party_job_details_output
    ?job_details:(job_details_ : third_party_job_details option) () =
  ({ job_details = job_details_ } : get_third_party_job_details_output)

let make_get_third_party_job_details_input ~client_token:(client_token_ : client_token)
    ~job_id:(job_id_ : third_party_job_id) () =
  ({ client_token = client_token_; job_id = job_id_ } : get_third_party_job_details_input)

let make_get_pipeline_state_output ?updated:(updated_ : timestamp option)
    ?created:(created_ : timestamp option) ?stage_states:(stage_states_ : stage_state_list option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option) () =
  ({
     updated = updated_;
     created = created_;
     stage_states = stage_states_;
     pipeline_version = pipeline_version_;
     pipeline_name = pipeline_name_;
   }
    : get_pipeline_state_output)

let make_get_pipeline_state_input ~name:(name_ : pipeline_name) () =
  ({ name = name_ } : get_pipeline_state_input)

let make_get_pipeline_output ?metadata:(metadata_ : pipeline_metadata option)
    ?pipeline:(pipeline_ : pipeline_declaration option) () =
  ({ metadata = metadata_; pipeline = pipeline_ } : get_pipeline_output)

let make_get_pipeline_input ?version:(version_ : pipeline_version option)
    ~name:(name_ : pipeline_name) () =
  ({ version = version_; name = name_ } : get_pipeline_input)

let make_get_pipeline_execution_output
    ?pipeline_execution:(pipeline_execution_ : pipeline_execution option) () =
  ({ pipeline_execution = pipeline_execution_ } : get_pipeline_execution_output)

let make_get_pipeline_execution_input
    ~pipeline_execution_id:(pipeline_execution_id_ : pipeline_execution_id)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({ pipeline_execution_id = pipeline_execution_id_; pipeline_name = pipeline_name_ }
    : get_pipeline_execution_input)

let make_get_job_details_output ?job_details:(job_details_ : job_details option) () =
  ({ job_details = job_details_ } : get_job_details_output)

let make_get_job_details_input ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_job_details_input)

let make_get_action_type_output ?action_type:(action_type_ : action_type_declaration option) () =
  ({ action_type = action_type_ } : get_action_type_output)

let make_get_action_type_input ~version:(version_ : version) ~provider:(provider_ : action_provider)
    ~owner:(owner_ : action_type_owner) ~category:(category_ : action_category) () =
  ({ version = version_; provider = provider_; owner = owner_; category = category_ }
    : get_action_type_input)

let make_enable_stage_transition_input ~transition_type:(transition_type_ : stage_transition_type)
    ~stage_name:(stage_name_ : stage_name) ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({ transition_type = transition_type_; stage_name = stage_name_; pipeline_name = pipeline_name_ }
    : enable_stage_transition_input)

let make_disable_stage_transition_input ~reason:(reason_ : disabled_reason)
    ~transition_type:(transition_type_ : stage_transition_type)
    ~stage_name:(stage_name_ : stage_name) ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     reason = reason_;
     transition_type = transition_type_;
     stage_name = stage_name_;
     pipeline_name = pipeline_name_;
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

let make_delete_custom_action_type_input ~version:(version_ : version)
    ~provider:(provider_ : action_provider) ~category:(category_ : action_category) () =
  ({ version = version_; provider = provider_; category = category_ }
    : delete_custom_action_type_input)

let make_create_pipeline_output ?tags:(tags_ : tag_list option)
    ?pipeline:(pipeline_ : pipeline_declaration option) () =
  ({ tags = tags_; pipeline = pipeline_ } : create_pipeline_output)

let make_create_pipeline_input ?tags:(tags_ : tag_list option)
    ~pipeline:(pipeline_ : pipeline_declaration) () =
  ({ tags = tags_; pipeline = pipeline_ } : create_pipeline_input)

let make_create_custom_action_type_output ?tags:(tags_ : tag_list option)
    ~action_type:(action_type_ : action_type) () =
  ({ tags = tags_; action_type = action_type_ } : create_custom_action_type_output)

let make_create_custom_action_type_input ?tags:(tags_ : tag_list option)
    ?configuration_properties:
      (configuration_properties_ : action_configuration_property_list option)
    ?settings:(settings_ : action_type_settings option)
    ~output_artifact_details:(output_artifact_details_ : artifact_details)
    ~input_artifact_details:(input_artifact_details_ : artifact_details)
    ~version:(version_ : version) ~provider:(provider_ : action_provider)
    ~category:(category_ : action_category) () =
  ({
     tags = tags_;
     output_artifact_details = output_artifact_details_;
     input_artifact_details = input_artifact_details_;
     configuration_properties = configuration_properties_;
     settings = settings_;
     version = version_;
     provider = provider_;
     category = category_;
   }
    : create_custom_action_type_input)

let make_acknowledge_third_party_job_output ?status:(status_ : job_status option) () =
  ({ status = status_ } : acknowledge_third_party_job_output)

let make_acknowledge_third_party_job_input ~client_token:(client_token_ : client_token)
    ~nonce:(nonce_ : nonce) ~job_id:(job_id_ : third_party_job_id) () =
  ({ client_token = client_token_; nonce = nonce_; job_id = job_id_ }
    : acknowledge_third_party_job_input)

let make_acknowledge_job_output ?status:(status_ : job_status option) () =
  ({ status = status_ } : acknowledge_job_output)

let make_acknowledge_job_input ~nonce:(nonce_ : nonce) ~job_id:(job_id_ : job_id) () =
  ({ nonce = nonce_; job_id = job_id_ } : acknowledge_job_input)
