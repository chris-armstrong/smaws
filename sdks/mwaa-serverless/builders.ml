open Types

let make_definition_s3_location
    ?version_id:(version_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~object_key:(object_key_ : Smaws_Lib.Smithy_api.Types.string_)
    ~bucket:(bucket_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ version_id = version_id_; object_key = object_key_; bucket = bucket_ }
    : definition_s3_location)

let make_schedule_configuration
    ?cron_expression:(cron_expression_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ cron_expression = cron_expression_ } : schedule_configuration)

let make_workflow_version_summary ?trigger_mode:(trigger_mode_ : generic_string option)
    ?schedule_configuration:(schedule_configuration_ : schedule_configuration option)
    ?definition_s3_location:(definition_s3_location_ : definition_s3_location option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?created_at:(created_at_ : timestamp_value option)
    ?is_latest_version:(is_latest_version_ : is_latest_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn)
    ~workflow_version:(workflow_version_ : workflow_version) () =
  ({
     trigger_mode = trigger_mode_;
     schedule_configuration = schedule_configuration_;
     definition_s3_location = definition_s3_location_;
     modified_at = modified_at_;
     created_at = created_at_;
     is_latest_version = is_latest_version_;
     workflow_arn = workflow_arn_;
     workflow_version = workflow_version_;
   }
    : workflow_version_summary)

let make_workflow_summary ?trigger_mode:(trigger_mode_ : generic_string option)
    ?workflow_status:(workflow_status_ : workflow_status option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?created_at:(created_at_ : timestamp_value option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option)
    ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     trigger_mode = trigger_mode_;
     workflow_status = workflow_status_;
     modified_at = modified_at_;
     created_at = created_at_;
     description = description_;
     name = name_;
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
   }
    : workflow_summary)

let make_run_detail_summary ?ended_at:(ended_at_ : timestamp_value option)
    ?started_at:(started_at_ : timestamp_value option)
    ?created_on:(created_on_ : timestamp_value option)
    ?status:(status_ : workflow_run_status option) () =
  ({ ended_at = ended_at_; started_at = started_at_; created_on = created_on_; status = status_ }
    : run_detail_summary)

let make_workflow_run_summary ?run_detail_summary:(run_detail_summary_ : run_detail_summary option)
    ?run_type:(run_type_ : run_type option)
    ?workflow_version:(workflow_version_ : version_id option)
    ?workflow_arn:(workflow_arn_ : workflow_arn option) ?run_id:(run_id_ : id_string option) () =
  ({
     run_detail_summary = run_detail_summary_;
     run_type = run_type_;
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
     run_id = run_id_;
   }
    : workflow_run_summary)

let make_workflow_run_detail ?run_state:(run_state_ : workflow_run_status option)
    ?task_instances:(task_instances_ : task_instance_ids option)
    ?error_message:(error_message_ : generic_string option)
    ?duration:(duration_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?completed_on:(completed_on_ : timestamp_value option)
    ?created_at:(created_at_ : timestamp_value option)
    ?started_on:(started_on_ : timestamp_value option) ?run_type:(run_type_ : run_type option)
    ?run_id:(run_id_ : id_string option) ?workflow_version:(workflow_version_ : version_id option)
    ?workflow_arn:(workflow_arn_ : workflow_arn option) () =
  ({
     run_state = run_state_;
     task_instances = task_instances_;
     error_message = error_message_;
     duration = duration_;
     modified_at = modified_at_;
     completed_on = completed_on_;
     created_at = created_at_;
     started_on = started_on_;
     run_type = run_type_;
     run_id = run_id_;
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
   }
    : workflow_run_detail)

let make_validation_exception_field ~message:(message_ : error_message)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_update_workflow_response ?warnings:(warnings_ : warning_messages option)
    ?workflow_version:(workflow_version_ : workflow_version option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     warnings = warnings_;
     workflow_version = workflow_version_;
     modified_at = modified_at_;
     workflow_arn = workflow_arn_;
   }
    : update_workflow_response)

let make_logging_configuration
    ~log_group_name:(log_group_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ log_group_name = log_group_name_ } : logging_configuration)

let make_network_configuration ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option) () =
  ({ subnet_ids = subnet_ids_; security_group_ids = security_group_ids_ } : network_configuration)

let make_update_workflow_request ?trigger_mode:(trigger_mode_ : generic_string option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?engine_version:(engine_version_ : engine_version option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?description:(description_ : description_string option) ~role_arn:(role_arn_ : role_ar_n)
    ~definition_s3_location:(definition_s3_location_ : definition_s3_location)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     trigger_mode = trigger_mode_;
     network_configuration = network_configuration_;
     engine_version = engine_version_;
     logging_configuration = logging_configuration_;
     description = description_;
     role_arn = role_arn_;
     definition_s3_location = definition_s3_location_;
     workflow_arn = workflow_arn_;
   }
    : update_workflow_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_task_instance_summary ?operator_name:(operator_name_ : generic_string option)
    ?duration_in_seconds:(duration_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status:(status_ : task_instance_status option)
    ?task_instance_id:(task_instance_id_ : id_string option) ?run_id:(run_id_ : id_string option)
    ?workflow_version:(workflow_version_ : version_id option)
    ?workflow_arn:(workflow_arn_ : workflow_arn option) () =
  ({
     operator_name = operator_name_;
     duration_in_seconds = duration_in_seconds_;
     status = status_;
     task_instance_id = task_instance_id_;
     run_id = run_id_;
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
   }
    : task_instance_summary)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags)
    ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_stop_workflow_run_response ?status:(status_ : workflow_run_status option)
    ?run_id:(run_id_ : id_string option) ?workflow_version:(workflow_version_ : version_id option)
    ?workflow_arn:(workflow_arn_ : workflow_arn option) () =
  ({
     status = status_;
     run_id = run_id_;
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
   }
    : stop_workflow_run_response)

let make_stop_workflow_run_request ~run_id:(run_id_ : id_string)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ run_id = run_id_; workflow_arn = workflow_arn_ } : stop_workflow_run_request)

let make_start_workflow_run_response ?started_at:(started_at_ : timestamp_value option)
    ?status:(status_ : workflow_run_status option) ?run_id:(run_id_ : id_string option) () =
  ({ started_at = started_at_; status = status_; run_id = run_id_ } : start_workflow_run_response)

let make_start_workflow_run_request ?workflow_version:(workflow_version_ : version_id option)
    ?override_parameters:(override_parameters_ : object_map option)
    ?client_token:(client_token_ : idempotency_token_string option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     workflow_version = workflow_version_;
     override_parameters = override_parameters_;
     client_token = client_token_;
     workflow_arn = workflow_arn_;
   }
    : start_workflow_run_request)

let make_list_workflows_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workflows:(workflows_ : workflow_summaries) () =
  ({ next_token = next_token_; workflows = workflows_ } : list_workflows_response)

let make_list_workflows_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_workflows_request)

let make_list_workflow_versions_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workflow_versions:(workflow_versions_ : workflow_version_summaries option) () =
  ({ next_token = next_token_; workflow_versions = workflow_versions_ }
    : list_workflow_versions_response)

let make_list_workflow_versions_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ workflow_arn = workflow_arn_; next_token = next_token_; max_results = max_results_ }
    : list_workflow_versions_request)

let make_list_workflow_runs_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workflow_runs:(workflow_runs_ : workflow_run_summaries option) () =
  ({ next_token = next_token_; workflow_runs = workflow_runs_ } : list_workflow_runs_response)

let make_list_workflow_runs_request ?workflow_version:(workflow_version_ : version_id option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_workflow_runs_request)

let make_list_task_instances_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?task_instances:(task_instances_ : task_instance_summaries option) () =
  ({ next_token = next_token_; task_instances = task_instances_ } : list_task_instances_response)

let make_list_task_instances_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~run_id:(run_id_ : id_string) ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     run_id = run_id_;
     workflow_arn = workflow_arn_;
   }
    : list_task_instances_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : taggable_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_get_workflow_run_response ?run_detail:(run_detail_ : workflow_run_detail option)
    ?override_parameters:(override_parameters_ : object_map option)
    ?run_type:(run_type_ : run_type option) ?run_id:(run_id_ : id_string option)
    ?workflow_version:(workflow_version_ : version_id option)
    ?workflow_arn:(workflow_arn_ : workflow_arn option) () =
  ({
     run_detail = run_detail_;
     override_parameters = override_parameters_;
     run_type = run_type_;
     run_id = run_id_;
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
   }
    : get_workflow_run_response)

let make_get_workflow_run_request ~run_id:(run_id_ : id_string)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ run_id = run_id_; workflow_arn = workflow_arn_ } : get_workflow_run_request)

let make_encryption_configuration
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~type_:(type__ : encryption_type) () =
  ({ kms_key_id = kms_key_id_; type_ = type__ } : encryption_configuration)

let make_get_workflow_response ?workflow_definition:(workflow_definition_ : generic_string option)
    ?trigger_mode:(trigger_mode_ : generic_string option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?role_arn:(role_arn_ : role_ar_n option)
    ?schedule_configuration:(schedule_configuration_ : schedule_configuration option)
    ?definition_s3_location:(definition_s3_location_ : definition_s3_location option)
    ?workflow_status:(workflow_status_ : workflow_status option)
    ?engine_version:(engine_version_ : engine_version option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?created_at:(created_at_ : timestamp_value option)
    ?description:(description_ : description_string option) ?name:(name_ : name_string option)
    ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     workflow_definition = workflow_definition_;
     trigger_mode = trigger_mode_;
     network_configuration = network_configuration_;
     role_arn = role_arn_;
     schedule_configuration = schedule_configuration_;
     definition_s3_location = definition_s3_location_;
     workflow_status = workflow_status_;
     engine_version = engine_version_;
     logging_configuration = logging_configuration_;
     encryption_configuration = encryption_configuration_;
     modified_at = modified_at_;
     created_at = created_at_;
     description = description_;
     name = name_;
     workflow_version = workflow_version_;
     workflow_arn = workflow_arn_;
   }
    : get_workflow_response)

let make_get_workflow_request ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ workflow_version = workflow_version_; workflow_arn = workflow_arn_ } : get_workflow_request)

let make_get_task_instance_response ?xcom:(xcom_ : generic_map option)
    ?log_stream:(log_stream_ : id_string option) ?task_id:(task_id_ : id_string option)
    ?error_message:(error_message_ : generic_string option)
    ?attempt_number:(attempt_number_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?started_at:(started_at_ : timestamp_value option)
    ?ended_at:(ended_at_ : timestamp_value option)
    ?modified_at:(modified_at_ : timestamp_value option)
    ?operator_name:(operator_name_ : generic_string option)
    ?duration_in_seconds:(duration_in_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status:(status_ : task_instance_status option)
    ?workflow_version:(workflow_version_ : version_id option)
    ~task_instance_id:(task_instance_id_ : id_string) ~run_id:(run_id_ : id_string)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({
     xcom = xcom_;
     log_stream = log_stream_;
     task_id = task_id_;
     error_message = error_message_;
     attempt_number = attempt_number_;
     started_at = started_at_;
     ended_at = ended_at_;
     modified_at = modified_at_;
     operator_name = operator_name_;
     duration_in_seconds = duration_in_seconds_;
     status = status_;
     workflow_version = workflow_version_;
     task_instance_id = task_instance_id_;
     run_id = run_id_;
     workflow_arn = workflow_arn_;
   }
    : get_task_instance_response)

let make_get_task_instance_request ~run_id:(run_id_ : id_string)
    ~task_instance_id:(task_instance_id_ : id_string) ~workflow_arn:(workflow_arn_ : workflow_arn)
    () =
  ({ run_id = run_id_; task_instance_id = task_instance_id_; workflow_arn = workflow_arn_ }
    : get_task_instance_request)

let make_delete_workflow_response ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ workflow_version = workflow_version_; workflow_arn = workflow_arn_ }
    : delete_workflow_response)

let make_delete_workflow_request ?workflow_version:(workflow_version_ : workflow_version option)
    ~workflow_arn:(workflow_arn_ : workflow_arn) () =
  ({ workflow_version = workflow_version_; workflow_arn = workflow_arn_ } : delete_workflow_request)

let make_create_workflow_response ?warnings:(warnings_ : warning_messages option)
    ?is_latest_version:(is_latest_version_ : is_latest_version option)
    ?workflow_version:(workflow_version_ : workflow_version option)
    ?workflow_status:(workflow_status_ : workflow_status option)
    ?revision_id:(revision_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : timestamp_value option) ~workflow_arn:(workflow_arn_ : workflow_arn)
    () =
  ({
     warnings = warnings_;
     is_latest_version = is_latest_version_;
     workflow_version = workflow_version_;
     workflow_status = workflow_status_;
     revision_id = revision_id_;
     created_at = created_at_;
     workflow_arn = workflow_arn_;
   }
    : create_workflow_response)

let make_create_workflow_request ?trigger_mode:(trigger_mode_ : generic_string option)
    ?tags:(tags_ : tags option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?engine_version:(engine_version_ : engine_version option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?description:(description_ : description_string option)
    ?client_token:(client_token_ : idempotency_token_string option)
    ~role_arn:(role_arn_ : role_ar_n)
    ~definition_s3_location:(definition_s3_location_ : definition_s3_location)
    ~name:(name_ : name_string) () =
  ({
     trigger_mode = trigger_mode_;
     tags = tags_;
     network_configuration = network_configuration_;
     engine_version = engine_version_;
     logging_configuration = logging_configuration_;
     encryption_configuration = encryption_configuration_;
     description = description_;
     role_arn = role_arn_;
     definition_s3_location = definition_s3_location_;
     client_token = client_token_;
     name = name_;
   }
    : create_workflow_request)
