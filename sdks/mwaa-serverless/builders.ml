open Types

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : error_message) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn)
    ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_create_workflow_response ?created_at:(created_at_ : timestamp_value option)
    ?revision_id:(revision_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workflow_status:(workflow_status_ : workflow_status option)
    ?workflow_version:(workflow_version_ : workflow_version option)
    ?is_latest_version:(is_latest_version_ : is_latest_version option)
    ?warnings:(warnings_ : warning_messages option) ~workflow_arn:(workflow_arn_ : workflow_arn) ()
    =
  ({
     workflow_arn = workflow_arn_;
     created_at = created_at_;
     revision_id = revision_id_;
     workflow_status = workflow_status_;
     workflow_version = workflow_version_;
     is_latest_version = is_latest_version_;
     warnings = warnings_;
   }
    : create_workflow_response)

let make_network_configuration ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option) () =
  ({ security_group_ids = security_group_ids_; subnet_ids = subnet_ids_ } : network_configuration)

let make_logging_configuration
    ~log_group_name:(log_group_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ log_group_name = log_group_name_ } : logging_configuration)

let make_encryption_configuration
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~type_:(type__ : encryption_type) () =
  ({ type_ = type__; kms_key_id = kms_key_id_ } : encryption_configuration)

let make_definition_s3_location
    ?version_id:(version_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~bucket:(bucket_ : Smaws_Lib.Smithy_api.Types.string_)
    ~object_key:(object_key_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ bucket = bucket_; object_key = object_key_; version_id = version_id_ }
    : definition_s3_location)

let make_create_workflow_request ?client_token:(client_token_ : idempotency_token_string option)
    ?description:(description_ : description_string option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?engine_version:(engine_version_ : engine_version option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?tags:(tags_ : tags option) ?trigger_mode:(trigger_mode_ : generic_string option)
    ~name:(name_ : name_string)
    ~definition_s3_location:(definition_s3_location_ : definition_s3_location)
    ~role_arn:(role_arn_ : role_ar_n) () =
  ({
     name = name_;
     client_token = client_token_;
     definition_s3_location = definition_s3_location_;
     role_arn = role_arn_;
     description = description_;
     encryption_configuration = encryption_configuration_;
     logging_configuration = logging_configuration_;
     engine_version = engine_version_;
     network_configuration = network_configuration_;
     tags = tags_;
     trigger_mode = trigger_mode_;
   }
    : create_workflow_request)

let make_delete_workflow_response ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ workflow_arn = workflow_arn_; workflow_version = workflow_version_ }
    : delete_workflow_response)

let make_delete_workflow_request ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ workflow_arn = workflow_arn_; workflow_version = workflow_version_ } : delete_workflow_request)

let make_get_task_instance_response ?workflow_version:(workflow_version_ : version_id option)
    ?status:(status_ : task_instance_status option)
    ?duration_in_seconds:(duration_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?operator_name:(operator_name_ : generic_string option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?ended_at:(ended_at_ : timestamp_value option)
    ?started_at:(started_at_ : timestamp_value option)
    ?attempt_number:(attempt_number_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?error_message:(error_message_ : generic_string option) ?task_id:(task_id_ : id_string option)
    ?log_stream:(log_stream_ : id_string option) ?xcom:(xcom_ : generic_map option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) ~run_id:(run_id_ : id_string)
    ~task_instance_id:(task_instance_id_ : id_string) () =
  ({
     workflow_arn = workflow_arn_;
     run_id = run_id_;
     task_instance_id = task_instance_id_;
     workflow_version = workflow_version_;
     status = status_;
     duration_in_seconds = duration_in_seconds_;
     operator_name = operator_name_;
     modified_at = modified_at_;
     ended_at = ended_at_;
     started_at = started_at_;
     attempt_number = attempt_number_;
     error_message = error_message_;
     task_id = task_id_;
     log_stream = log_stream_;
     xcom = xcom_;
   }
    : get_task_instance_response)

let make_get_task_instance_request ~workflow_arn:(workflow_arn_ : workflow_arn)
    ~task_instance_id:(task_instance_id_ : id_string) ~run_id:(run_id_ : id_string) () =
  ({ workflow_arn = workflow_arn_; task_instance_id = task_instance_id_; run_id = run_id_ }
    : get_task_instance_request)

let make_schedule_configuration
    ?cron_expression:(cron_expression_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ cron_expression = cron_expression_ } : schedule_configuration)

let make_get_workflow_response ?workflow_version:(workflow_version_ : workflow_version option)
    ?name:(name_ : name_string option) ?description:(description_ : description_string option)
    ?created_at:(created_at_ : timestamp_value option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?engine_version:(engine_version_ : engine_version option)
    ?workflow_status:(workflow_status_ : workflow_status option)
    ?definition_s3_location:(definition_s3_location_ : definition_s3_location option)
    ?schedule_configuration:(schedule_configuration_ : schedule_configuration option)
    ?role_arn:(role_arn_ : role_ar_n option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?trigger_mode:(trigger_mode_ : generic_string option)
    ?workflow_definition:(workflow_definition_ : generic_string option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
     name = name_;
     description = description_;
     created_at = created_at_;
     modified_at = modified_at_;
     encryption_configuration = encryption_configuration_;
     logging_configuration = logging_configuration_;
     engine_version = engine_version_;
     workflow_status = workflow_status_;
     definition_s3_location = definition_s3_location_;
     schedule_configuration = schedule_configuration_;
     role_arn = role_arn_;
     network_configuration = network_configuration_;
     trigger_mode = trigger_mode_;
     workflow_definition = workflow_definition_;
   }
    : get_workflow_response)

let make_get_workflow_request ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ workflow_arn = workflow_arn_; workflow_version = workflow_version_ } : get_workflow_request)

let make_workflow_run_detail ?workflow_arn:(workflow_arn_ : workflow_arn option)
    ?workflow_version:(workflow_version_ : version_id option) ?run_id:(run_id_ : id_string option)
    ?run_type:(run_type_ : run_type option) ?started_on:(started_on_ : timestamp_value option)
    ?created_at:(created_at_ : timestamp_value option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?duration:(duration_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?error_message:(error_message_ : generic_string option)
    ?task_instances:(task_instances_ : task_instance_ids option)
    ?run_state:(run_state_ : workflow_run_status option) () =
  ({
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
     run_id = run_id_;
     run_type = run_type_;
     started_on = started_on_;
     created_at = created_at_;
     completed_on = completed_on_;
     modified_at = modified_at_;
     duration = duration_;
     error_message = error_message_;
     task_instances = task_instances_;
     run_state = run_state_;
   }
    : workflow_run_detail)

let make_get_workflow_run_response ?workflow_arn:(workflow_arn_ : workflow_arn option)
    ?workflow_version:(workflow_version_ : version_id option) ?run_id:(run_id_ : id_string option)
    ?run_type:(run_type_ : run_type option)
    ?override_parameters:(override_parameters_ : object_map option)
    ?run_detail:(run_detail_ : workflow_run_detail option) () =
  ({
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
     run_id = run_id_;
     run_type = run_type_;
     override_parameters = override_parameters_;
     run_detail = run_detail_;
   }
    : get_workflow_run_response)

let make_get_workflow_run_request ~workflow_arn:(workflow_arn_ : workflow_arn)
    ~run_id:(run_id_ : id_string) () =
  ({ workflow_arn = workflow_arn_; run_id = run_id_ } : get_workflow_run_request)

let make_task_instance_summary ?workflow_arn:(workflow_arn_ : workflow_arn option)
    ?workflow_version:(workflow_version_ : version_id option) ?run_id:(run_id_ : id_string option)
    ?task_instance_id:(task_instance_id_ : id_string option)
    ?status:(status_ : task_instance_status option)
    ?duration_in_seconds:(duration_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?operator_name:(operator_name_ : generic_string option) () =
  ({
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
     run_id = run_id_;
     task_instance_id = task_instance_id_;
     status = status_;
     duration_in_seconds = duration_in_seconds_;
     operator_name = operator_name_;
   }
    : task_instance_summary)

let make_list_task_instances_response
    ?task_instances:(task_instances_ : task_instance_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ task_instances = task_instances_; next_token = next_token_ } : list_task_instances_response)

let make_list_task_instances_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) ~run_id:(run_id_ : id_string) () =
  ({
     workflow_arn = workflow_arn_;
     run_id = run_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_task_instances_request)

let make_run_detail_summary ?status:(status_ : workflow_run_status option)
    ?created_on:(created_on_ : timestamp_value option)
    ?started_at:(started_at_ : timestamp_value option)
    ?ended_at:(ended_at_ : timestamp_value option) () =
  ({ status = status_; created_on = created_on_; started_at = started_at_; ended_at = ended_at_ }
    : run_detail_summary)

let make_workflow_run_summary ?run_id:(run_id_ : id_string option)
    ?workflow_arn:(workflow_arn_ : workflow_arn option)
    ?workflow_version:(workflow_version_ : version_id option)
    ?run_type:(run_type_ : run_type option)
    ?run_detail_summary:(run_detail_summary_ : run_detail_summary option) () =
  ({
     run_id = run_id_;
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
     run_type = run_type_;
     run_detail_summary = run_detail_summary_;
   }
    : workflow_run_summary)

let make_list_workflow_runs_response ?workflow_runs:(workflow_runs_ : workflow_run_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ workflow_runs = workflow_runs_; next_token = next_token_ } : list_workflow_runs_response)

let make_list_workflow_runs_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workflow_version:(workflow_version_ : version_id option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
   }
    : list_workflow_runs_request)

let make_workflow_version_summary ?is_latest_version:(is_latest_version_ : is_latest_version option)
    ?created_at:(created_at_ : timestamp_value option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?definition_s3_location:(definition_s3_location_ : definition_s3_location option)
    ?schedule_configuration:(schedule_configuration_ : schedule_configuration option)
    ?trigger_mode:(trigger_mode_ : generic_string option)
    ~workflow_version:(workflow_version_ : workflow_version)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
     is_latest_version = is_latest_version_;
     created_at = created_at_;
     modified_at = modified_at_;
     definition_s3_location = definition_s3_location_;
     schedule_configuration = schedule_configuration_;
     trigger_mode = trigger_mode_;
   }
    : workflow_version_summary)

let make_list_workflow_versions_response
    ?workflow_versions:(workflow_versions_ : workflow_version_summaries option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ workflow_versions = workflow_versions_; next_token = next_token_ }
    : list_workflow_versions_response)

let make_list_workflow_versions_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ max_results = max_results_; next_token = next_token_; workflow_arn = workflow_arn_ }
    : list_workflow_versions_request)

let make_workflow_summary ?workflow_version:(workflow_version_ : workflow_version option)
    ?name:(name_ : name_string option) ?description:(description_ : description_string option)
    ?created_at:(created_at_ : timestamp_value option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?workflow_status:(workflow_status_ : workflow_status option)
    ?trigger_mode:(trigger_mode_ : generic_string option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
     name = name_;
     description = description_;
     created_at = created_at_;
     modified_at = modified_at_;
     workflow_status = workflow_status_;
     trigger_mode = trigger_mode_;
   }
    : workflow_summary)

let make_list_workflows_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workflows:(workflows_ : workflow_summaries) () =
  ({ workflows = workflows_; next_token = next_token_ } : list_workflows_response)

let make_list_workflows_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_workflows_request)

let make_start_workflow_run_response ?run_id:(run_id_ : id_string option)
    ?status:(status_ : workflow_run_status option)
    ?started_at:(started_at_ : timestamp_value option) () =
  ({ run_id = run_id_; status = status_; started_at = started_at_ } : start_workflow_run_response)

let make_start_workflow_run_request ?client_token:(client_token_ : idempotency_token_string option)
    ?override_parameters:(override_parameters_ : object_map option)
    ?workflow_version:(workflow_version_ : version_id option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     workflow_arn = workflow_arn_;
     client_token = client_token_;
     override_parameters = override_parameters_;
     workflow_version = workflow_version_;
   }
    : start_workflow_run_request)

let make_stop_workflow_run_response ?workflow_arn:(workflow_arn_ : workflow_arn option)
    ?workflow_version:(workflow_version_ : version_id option) ?run_id:(run_id_ : id_string option)
    ?status:(status_ : workflow_run_status option) () =
  ({
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
     run_id = run_id_;
     status = status_;
   }
    : stop_workflow_run_response)

let make_stop_workflow_run_request ~workflow_arn:(workflow_arn_ : workflow_arn)
    ~run_id:(run_id_ : id_string) () =
  ({ workflow_arn = workflow_arn_; run_id = run_id_ } : stop_workflow_run_request)

let make_update_workflow_response ?modified_at:(modified_at_ : timestamp_value option)
    ?workflow_version:(workflow_version_ : workflow_version option)
    ?warnings:(warnings_ : warning_messages option) ~workflow_arn:(workflow_arn_ : workflow_arn) ()
    =
  ({
     workflow_arn = workflow_arn_;
     modified_at = modified_at_;
     workflow_version = workflow_version_;
     warnings = warnings_;
   }
    : update_workflow_response)

let make_update_workflow_request ?description:(description_ : description_string option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?engine_version:(engine_version_ : engine_version option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?trigger_mode:(trigger_mode_ : generic_string option)
    ~workflow_arn:(workflow_arn_ : workflow_arn)
    ~definition_s3_location:(definition_s3_location_ : definition_s3_location)
    ~role_arn:(role_arn_ : role_ar_n) () =
  ({
     workflow_arn = workflow_arn_;
     definition_s3_location = definition_s3_location_;
     role_arn = role_arn_;
     description = description_;
     logging_configuration = logging_configuration_;
     engine_version = engine_version_;
     network_configuration = network_configuration_;
     trigger_mode = trigger_mode_;
   }
    : update_workflow_request)
