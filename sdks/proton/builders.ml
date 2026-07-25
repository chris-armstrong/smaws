open Types

let make_environment_account_connection ?component_role_arn:(component_role_arn_ : role_arn option)
    ?codebuild_role_arn:(codebuild_role_arn_ : role_arn option)
    ~id:(id_ : environment_account_connection_id) ~arn:(arn_ : environment_account_connection_arn)
    ~management_account_id:(management_account_id_ : aws_account_id)
    ~environment_account_id:(environment_account_id_ : aws_account_id) ~role_arn:(role_arn_ : arn)
    ~environment_name:(environment_name_ : resource_name)
    ~requested_at:(requested_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : environment_account_connection_status) () =
  ({
     id = id_;
     arn = arn_;
     management_account_id = management_account_id_;
     environment_account_id = environment_account_id_;
     role_arn = role_arn_;
     environment_name = environment_name_;
     requested_at = requested_at_;
     last_modified_at = last_modified_at_;
     status = status_;
     component_role_arn = component_role_arn_;
     codebuild_role_arn = codebuild_role_arn_;
   }
    : environment_account_connection)

let make_accept_environment_account_connection_output
    ~environment_account_connection:
      (environment_account_connection_ : environment_account_connection) () =
  ({ environment_account_connection = environment_account_connection_ }
    : accept_environment_account_connection_output)

let make_accept_environment_account_connection_input ~id:(id_ : environment_account_connection_id)
    () =
  ({ id = id_ } : accept_environment_account_connection_input)

let make_repository_branch ~arn:(arn_ : repository_arn) ~provider:(provider_ : repository_provider)
    ~name:(name_ : repository_name) ~branch:(branch_ : git_branch_name) () =
  ({ arn = arn_; provider = provider_; name = name_; branch = branch_ } : repository_branch)

let make_account_settings
    ?pipeline_service_role_arn:(pipeline_service_role_arn_ : role_arn_or_empty_string option)
    ?pipeline_provisioning_repository:(pipeline_provisioning_repository_ : repository_branch option)
    ?pipeline_codebuild_role_arn:(pipeline_codebuild_role_arn_ : role_arn_or_empty_string option) ()
    =
  ({
     pipeline_service_role_arn = pipeline_service_role_arn_;
     pipeline_provisioning_repository = pipeline_provisioning_repository_;
     pipeline_codebuild_role_arn = pipeline_codebuild_role_arn_;
   }
    : account_settings)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_input ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_notify_resource_deployment_status_change_output () = (() : unit)

let make_output ?key:(key_ : output_key option)
    ?value_string:(value_string_ : output_value_string option) () =
  ({ key = key_; value_string = value_string_ } : output)

let make_notify_resource_deployment_status_change_input
    ?status:(status_ : resource_deployment_status option) ?outputs:(outputs_ : outputs_list option)
    ?deployment_id:(deployment_id_ : deployment_id option)
    ?status_message:(status_message_ : status_message option) ~resource_arn:(resource_arn_ : arn) ()
    =
  ({
     resource_arn = resource_arn_;
     status = status_;
     outputs = outputs_;
     deployment_id = deployment_id_;
     status_message = status_message_;
   }
    : notify_resource_deployment_status_change_input)

let make_list_tags_for_resource_output
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) ~tags:(tags_ : tag_list)
    () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : max_page_results option) ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_; next_token = next_token_; max_results = max_results_ }
    : list_tags_for_resource_input)

let make_repository_sync_definition ~target:(target_ : Smaws_Lib.Smithy_api.Types.string_)
    ~parent:(parent_ : Smaws_Lib.Smithy_api.Types.string_) ~branch:(branch_ : git_branch_name)
    ~directory:(directory_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ target = target_; parent = parent_; branch = branch_; directory = directory_ }
    : repository_sync_definition)

let make_list_repository_sync_definitions_output ?next_token:(next_token_ : empty_next_token option)
    ~sync_definitions:(sync_definitions_ : repository_sync_definition_list) () =
  ({ next_token = next_token_; sync_definitions = sync_definitions_ }
    : list_repository_sync_definitions_output)

let make_list_repository_sync_definitions_input ?next_token:(next_token_ : empty_next_token option)
    ~repository_name:(repository_name_ : repository_name)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~sync_type:(sync_type_ : sync_type) () =
  ({
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     sync_type = sync_type_;
     next_token = next_token_;
   }
    : list_repository_sync_definitions_input)

let make_revision ~repository_name:(repository_name_ : repository_name)
    ~repository_provider:(repository_provider_ : repository_provider) ~sha:(sha_ : sh_a)
    ~directory:(directory_ : Smaws_Lib.Smithy_api.Types.string_) ~branch:(branch_ : git_branch_name)
    () =
  ({
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     sha = sha_;
     directory = directory_;
     branch = branch_;
   }
    : revision)

let make_resource_sync_event ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~type_:(type__ : Smaws_Lib.Smithy_api.Types.string_)
    ~time:(time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~event:(event_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ type_ = type__; external_id = external_id_; time = time_; event = event_ }
    : resource_sync_event)

let make_resource_sync_attempt ~initial_revision:(initial_revision_ : revision)
    ~target_revision:(target_revision_ : revision)
    ~target:(target_ : Smaws_Lib.Smithy_api.Types.string_)
    ~started_at:(started_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : resource_sync_status) ~events:(events_ : resource_sync_events) () =
  ({
     initial_revision = initial_revision_;
     target_revision = target_revision_;
     target = target_;
     started_at = started_at_;
     status = status_;
     events = events_;
   }
    : resource_sync_attempt)

let make_get_template_sync_status_output ?latest_sync:(latest_sync_ : resource_sync_attempt option)
    ?latest_successful_sync:(latest_successful_sync_ : resource_sync_attempt option)
    ?desired_state:(desired_state_ : revision option) () =
  ({
     latest_sync = latest_sync_;
     latest_successful_sync = latest_successful_sync_;
     desired_state = desired_state_;
   }
    : get_template_sync_status_output)

let make_get_template_sync_status_input ~template_name:(template_name_ : resource_name)
    ~template_type:(template_type_ : template_type)
    ~template_version:(template_version_ : template_version_part) () =
  ({
     template_name = template_name_;
     template_type = template_type_;
     template_version = template_version_;
   }
    : get_template_sync_status_input)

let make_get_service_instance_sync_status_output
    ?latest_sync:(latest_sync_ : resource_sync_attempt option)
    ?latest_successful_sync:(latest_successful_sync_ : resource_sync_attempt option)
    ?desired_state:(desired_state_ : revision option) () =
  ({
     latest_sync = latest_sync_;
     latest_successful_sync = latest_successful_sync_;
     desired_state = desired_state_;
   }
    : get_service_instance_sync_status_output)

let make_get_service_instance_sync_status_input ~service_name:(service_name_ : resource_name)
    ~service_instance_name:(service_instance_name_ : resource_name) () =
  ({ service_name = service_name_; service_instance_name = service_instance_name_ }
    : get_service_instance_sync_status_input)

let make_resource_counts_summary ?failed:(failed_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?up_to_date:(up_to_date_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?behind_major:(behind_major_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?behind_minor:(behind_minor_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~total:(total_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({
     total = total_;
     failed = failed_;
     up_to_date = up_to_date_;
     behind_major = behind_major_;
     behind_minor = behind_minor_;
   }
    : resource_counts_summary)

let make_counts_summary ?components:(components_ : resource_counts_summary option)
    ?environments:(environments_ : resource_counts_summary option)
    ?environment_templates:(environment_templates_ : resource_counts_summary option)
    ?service_instances:(service_instances_ : resource_counts_summary option)
    ?services:(services_ : resource_counts_summary option)
    ?service_templates:(service_templates_ : resource_counts_summary option)
    ?pipelines:(pipelines_ : resource_counts_summary option) () =
  ({
     components = components_;
     environments = environments_;
     environment_templates = environment_templates_;
     service_instances = service_instances_;
     services = services_;
     service_templates = service_templates_;
     pipelines = pipelines_;
   }
    : counts_summary)

let make_get_resources_summary_output ~counts:(counts_ : counts_summary) () =
  ({ counts = counts_ } : get_resources_summary_output)

let make_get_resources_summary_input () = (() : unit)

let make_repository_sync_event
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~type_:(type__ : Smaws_Lib.Smithy_api.Types.string_)
    ~time:(time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~event:(event_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ type_ = type__; external_id = external_id_; time = time_; event = event_ }
    : repository_sync_event)

let make_repository_sync_attempt ~started_at:(started_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : repository_sync_status) ~events:(events_ : repository_sync_events) () =
  ({ started_at = started_at_; status = status_; events = events_ } : repository_sync_attempt)

let make_get_repository_sync_status_output
    ?latest_sync:(latest_sync_ : repository_sync_attempt option) () =
  ({ latest_sync = latest_sync_ } : get_repository_sync_status_output)

let make_get_repository_sync_status_input ~repository_name:(repository_name_ : repository_name)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~branch:(branch_ : git_branch_name) ~sync_type:(sync_type_ : sync_type) () =
  ({
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     branch = branch_;
     sync_type = sync_type_;
   }
    : get_repository_sync_status_input)

let make_service_pipeline
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?spec:(spec_ : spec_contents option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~arn:(arn_ : arn) ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_attempted_at:
      (last_deployment_attempted_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_succeeded_at:
      (last_deployment_succeeded_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     arn = arn_;
     created_at = created_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     spec = spec_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
   }
    : service_pipeline)

let make_cancel_service_pipeline_deployment_output ~pipeline:(pipeline_ : service_pipeline) () =
  ({ pipeline = pipeline_ } : cancel_service_pipeline_deployment_output)

let make_cancel_service_pipeline_deployment_input ~service_name:(service_name_ : resource_name) () =
  ({ service_name = service_name_ } : cancel_service_pipeline_deployment_input)

let make_service_instance
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?spec:(spec_ : spec_contents option)
    ?last_client_request_token:
      (last_client_request_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~name:(name_ : resource_name) ~arn:(arn_ : service_instance_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_attempted_at:
      (last_deployment_attempted_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_succeeded_at:
      (last_deployment_succeeded_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~service_name:(service_name_ : resource_name)
    ~environment_name:(environment_name_ : resource_name)
    ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     service_name = service_name_;
     environment_name = environment_name_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     spec = spec_;
     last_client_request_token = last_client_request_token_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
   }
    : service_instance)

let make_cancel_service_instance_deployment_output
    ~service_instance:(service_instance_ : service_instance) () =
  ({ service_instance = service_instance_ } : cancel_service_instance_deployment_output)

let make_cancel_service_instance_deployment_input
    ~service_instance_name:(service_instance_name_ : resource_name)
    ~service_name:(service_name_ : resource_name) () =
  ({ service_instance_name = service_instance_name_; service_name = service_name_ }
    : cancel_service_instance_deployment_input)

let make_environment ?description:(description_ : description option)
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?proton_service_role_arn:(proton_service_role_arn_ : arn option)
    ?environment_account_connection_id:
      (environment_account_connection_id_ : environment_account_connection_id option)
    ?environment_account_id:(environment_account_id_ : aws_account_id option)
    ?spec:(spec_ : spec_contents option) ?provisioning:(provisioning_ : provisioning option)
    ?provisioning_repository:(provisioning_repository_ : repository_branch option)
    ?component_role_arn:(component_role_arn_ : role_arn option)
    ?codebuild_role_arn:(codebuild_role_arn_ : role_arn option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~name:(name_ : resource_name) ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_attempted_at:
      (last_deployment_attempted_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_succeeded_at:
      (last_deployment_succeeded_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~arn:(arn_ : environment_arn) ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     name = name_;
     description = description_;
     created_at = created_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     arn = arn_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     proton_service_role_arn = proton_service_role_arn_;
     environment_account_connection_id = environment_account_connection_id_;
     environment_account_id = environment_account_id_;
     spec = spec_;
     provisioning = provisioning_;
     provisioning_repository = provisioning_repository_;
     component_role_arn = component_role_arn_;
     codebuild_role_arn = codebuild_role_arn_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
   }
    : environment)

let make_cancel_environment_deployment_output ~environment:(environment_ : environment) () =
  ({ environment = environment_ } : cancel_environment_deployment_output)

let make_cancel_environment_deployment_input ~environment_name:(environment_name_ : resource_name)
    () =
  ({ environment_name = environment_name_ } : cancel_environment_deployment_input)

let make_component ?description:(description_ : description option)
    ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?last_deployment_attempted_at:
      (last_deployment_attempted_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_deployment_succeeded_at:
      (last_deployment_succeeded_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?service_spec:(service_spec_ : spec_contents option)
    ?last_client_request_token:
      (last_client_request_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~name:(name_ : resource_name) ~arn:(arn_ : component_arn)
    ~environment_name:(environment_name_ : resource_name)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     name = name_;
     description = description_;
     arn = arn_;
     environment_name = environment_name_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     service_spec = service_spec_;
     last_client_request_token = last_client_request_token_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
   }
    : component)

let make_cancel_component_deployment_output ~component:(component_ : component) () =
  ({ component = component_ } : cancel_component_deployment_output)

let make_cancel_component_deployment_input ~component_name:(component_name_ : resource_name) () =
  ({ component_name = component_name_ } : cancel_component_deployment_input)

let make_compatible_environment_template ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part) () =
  ({ template_name = template_name_; major_version = major_version_ }
    : compatible_environment_template)

let make_compatible_environment_template_input ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part) () =
  ({ template_name = template_name_; major_version = major_version_ }
    : compatible_environment_template_input)

let make_component_state ?service_name:(service_name_ : resource_name_or_empty option)
    ?service_instance_name:(service_instance_name_ : resource_name_or_empty option)
    ?service_spec:(service_spec_ : spec_contents option)
    ?template_file:(template_file_ : template_file_contents option) () =
  ({
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     service_spec = service_spec_;
     template_file = template_file_;
   }
    : component_state)

let make_component_summary ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?last_deployment_attempted_at:
      (last_deployment_attempted_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_deployment_succeeded_at:
      (last_deployment_succeeded_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~name:(name_ : resource_name) ~arn:(arn_ : component_arn)
    ~environment_name:(environment_name_ : resource_name)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     name = name_;
     arn = arn_;
     environment_name = environment_name_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
   }
    : component_summary)

let make_create_component_output ~component:(component_ : component) () =
  ({ component = component_ } : create_component_output)

let make_create_component_input ?description:(description_ : description option)
    ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?environment_name:(environment_name_ : resource_name option)
    ?service_spec:(service_spec_ : spec_contents option) ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : resource_name)
    ~template_file:(template_file_ : template_file_contents)
    ~manifest:(manifest_ : template_manifest_contents) () =
  ({
     name = name_;
     description = description_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     environment_name = environment_name_;
     template_file = template_file_;
     manifest = manifest_;
     service_spec = service_spec_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_component_input)

let make_create_environment_output ~environment:(environment_ : environment) () =
  ({ environment = environment_ } : create_environment_output)

let make_repository_branch_input ~provider:(provider_ : repository_provider)
    ~name:(name_ : repository_name) ~branch:(branch_ : git_branch_name) () =
  ({ provider = provider_; name = name_; branch = branch_ } : repository_branch_input)

let make_create_environment_input
    ?template_minor_version:(template_minor_version_ : template_version_part option)
    ?description:(description_ : description option)
    ?proton_service_role_arn:(proton_service_role_arn_ : arn option)
    ?environment_account_connection_id:
      (environment_account_connection_id_ : environment_account_connection_id option)
    ?tags:(tags_ : tag_list option)
    ?provisioning_repository:(provisioning_repository_ : repository_branch_input option)
    ?component_role_arn:(component_role_arn_ : role_arn option)
    ?codebuild_role_arn:(codebuild_role_arn_ : role_arn option) ~name:(name_ : resource_name)
    ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~spec:(spec_ : spec_contents) () =
  ({
     name = name_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     description = description_;
     spec = spec_;
     proton_service_role_arn = proton_service_role_arn_;
     environment_account_connection_id = environment_account_connection_id_;
     tags = tags_;
     provisioning_repository = provisioning_repository_;
     component_role_arn = component_role_arn_;
     codebuild_role_arn = codebuild_role_arn_;
   }
    : create_environment_input)

let make_create_environment_account_connection_output
    ~environment_account_connection:
      (environment_account_connection_ : environment_account_connection) () =
  ({ environment_account_connection = environment_account_connection_ }
    : create_environment_account_connection_output)

let make_create_environment_account_connection_input
    ?client_token:(client_token_ : client_token option) ?role_arn:(role_arn_ : role_arn option)
    ?tags:(tags_ : tag_list option) ?component_role_arn:(component_role_arn_ : role_arn option)
    ?codebuild_role_arn:(codebuild_role_arn_ : role_arn option)
    ~management_account_id:(management_account_id_ : aws_account_id)
    ~environment_name:(environment_name_ : resource_name) () =
  ({
     client_token = client_token_;
     management_account_id = management_account_id_;
     role_arn = role_arn_;
     environment_name = environment_name_;
     tags = tags_;
     component_role_arn = component_role_arn_;
     codebuild_role_arn = codebuild_role_arn_;
   }
    : create_environment_account_connection_input)

let make_environment_template ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?recommended_version:(recommended_version_ : full_template_version_number option)
    ?encryption_key:(encryption_key_ : arn option)
    ?provisioning:(provisioning_ : provisioning option) ~name:(name_ : resource_name)
    ~arn:(arn_ : environment_template_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     display_name = display_name_;
     description = description_;
     recommended_version = recommended_version_;
     encryption_key = encryption_key_;
     provisioning = provisioning_;
   }
    : environment_template)

let make_create_environment_template_output
    ~environment_template:(environment_template_ : environment_template) () =
  ({ environment_template = environment_template_ } : create_environment_template_output)

let make_create_environment_template_input ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ?encryption_key:(encryption_key_ : arn option)
    ?provisioning:(provisioning_ : provisioning option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : resource_name) () =
  ({
     name = name_;
     display_name = display_name_;
     description = description_;
     encryption_key = encryption_key_;
     provisioning = provisioning_;
     tags = tags_;
   }
    : create_environment_template_input)

let make_environment_template_version
    ?recommended_minor_version:(recommended_minor_version_ : template_version_part option)
    ?status_message:(status_message_ : status_message option)
    ?description:(description_ : description option) ?schema:(schema_ : template_schema option)
    ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part)
    ~status:(status_ : template_version_status) ~arn:(arn_ : environment_template_version_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
     recommended_minor_version = recommended_minor_version_;
     status = status_;
     status_message = status_message_;
     description = description_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     schema = schema_;
   }
    : environment_template_version)

let make_create_environment_template_version_output
    ~environment_template_version:(environment_template_version_ : environment_template_version) ()
    =
  ({ environment_template_version = environment_template_version_ }
    : create_environment_template_version_output)

let make_s3_object_source ~bucket:(bucket_ : s3_bucket) ~key:(key_ : s3_key) () =
  ({ bucket = bucket_; key = key_ } : s3_object_source)

let make_create_environment_template_version_input
    ?client_token:(client_token_ : client_token option)
    ?description:(description_ : description option)
    ?major_version:(major_version_ : template_version_part option) ?tags:(tags_ : tag_list option)
    ~template_name:(template_name_ : resource_name)
    ~source:(source_ : template_version_source_input) () =
  ({
     client_token = client_token_;
     template_name = template_name_;
     description = description_;
     major_version = major_version_;
     source = source_;
     tags = tags_;
   }
    : create_environment_template_version_input)

let make_repository ?encryption_key:(encryption_key_ : arn option) ~arn:(arn_ : repository_arn)
    ~provider:(provider_ : repository_provider) ~name:(name_ : repository_name)
    ~connection_arn:(connection_arn_ : arn) () =
  ({
     arn = arn_;
     provider = provider_;
     name = name_;
     connection_arn = connection_arn_;
     encryption_key = encryption_key_;
   }
    : repository)

let make_create_repository_output ~repository:(repository_ : repository) () =
  ({ repository = repository_ } : create_repository_output)

let make_create_repository_input ?encryption_key:(encryption_key_ : arn option)
    ?tags:(tags_ : tag_list option) ~provider:(provider_ : repository_provider)
    ~name:(name_ : repository_name) ~connection_arn:(connection_arn_ : arn) () =
  ({
     provider = provider_;
     name = name_;
     connection_arn = connection_arn_;
     encryption_key = encryption_key_;
     tags = tags_;
   }
    : create_repository_input)

let make_service ?description:(description_ : description option)
    ?status_message:(status_message_ : status_message option)
    ?pipeline:(pipeline_ : service_pipeline option)
    ?repository_connection_arn:(repository_connection_arn_ : arn option)
    ?repository_id:(repository_id_ : repository_id option)
    ?branch_name:(branch_name_ : git_branch_name option) ~name:(name_ : resource_name)
    ~arn:(arn_ : service_arn) ~template_name:(template_name_ : resource_name)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : service_status) ~spec:(spec_ : spec_contents) () =
  ({
     name = name_;
     description = description_;
     arn = arn_;
     template_name = template_name_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     status = status_;
     status_message = status_message_;
     spec = spec_;
     pipeline = pipeline_;
     repository_connection_arn = repository_connection_arn_;
     repository_id = repository_id_;
     branch_name = branch_name_;
   }
    : service)

let make_create_service_output ~service:(service_ : service) () =
  ({ service = service_ } : create_service_output)

let make_create_service_input ?description:(description_ : description option)
    ?template_minor_version:(template_minor_version_ : template_version_part option)
    ?repository_connection_arn:(repository_connection_arn_ : arn option)
    ?repository_id:(repository_id_ : repository_id option)
    ?branch_name:(branch_name_ : git_branch_name option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : resource_name) ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~spec:(spec_ : spec_contents) () =
  ({
     name = name_;
     description = description_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     spec = spec_;
     repository_connection_arn = repository_connection_arn_;
     repository_id = repository_id_;
     branch_name = branch_name_;
     tags = tags_;
   }
    : create_service_input)

let make_create_service_instance_output ~service_instance:(service_instance_ : service_instance) ()
    =
  ({ service_instance = service_instance_ } : create_service_instance_output)

let make_create_service_instance_input
    ?template_major_version:(template_major_version_ : template_version_part option)
    ?template_minor_version:(template_minor_version_ : template_version_part option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option)
    ~name:(name_ : resource_name) ~service_name:(service_name_ : resource_name)
    ~spec:(spec_ : spec_contents) () =
  ({
     name = name_;
     service_name = service_name_;
     spec = spec_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_service_instance_input)

let make_service_sync_config ~service_name:(service_name_ : resource_name)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~repository_name:(repository_name_ : repository_name) ~branch:(branch_ : git_branch_name)
    ~file_path:(file_path_ : ops_file_path) () =
  ({
     service_name = service_name_;
     repository_provider = repository_provider_;
     repository_name = repository_name_;
     branch = branch_;
     file_path = file_path_;
   }
    : service_sync_config)

let make_create_service_sync_config_output
    ?service_sync_config:(service_sync_config_ : service_sync_config option) () =
  ({ service_sync_config = service_sync_config_ } : create_service_sync_config_output)

let make_create_service_sync_config_input ~service_name:(service_name_ : resource_name)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~repository_name:(repository_name_ : repository_name) ~branch:(branch_ : git_branch_name)
    ~file_path:(file_path_ : ops_file_path) () =
  ({
     service_name = service_name_;
     repository_provider = repository_provider_;
     repository_name = repository_name_;
     branch = branch_;
     file_path = file_path_;
   }
    : create_service_sync_config_input)

let make_service_template ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?recommended_version:(recommended_version_ : full_template_version_number option)
    ?encryption_key:(encryption_key_ : arn option)
    ?pipeline_provisioning:(pipeline_provisioning_ : provisioning option)
    ~name:(name_ : resource_name) ~arn:(arn_ : service_template_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     display_name = display_name_;
     description = description_;
     recommended_version = recommended_version_;
     encryption_key = encryption_key_;
     pipeline_provisioning = pipeline_provisioning_;
   }
    : service_template)

let make_create_service_template_output ~service_template:(service_template_ : service_template) ()
    =
  ({ service_template = service_template_ } : create_service_template_output)

let make_create_service_template_input ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ?encryption_key:(encryption_key_ : arn option)
    ?pipeline_provisioning:(pipeline_provisioning_ : provisioning option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : resource_name) () =
  ({
     name = name_;
     display_name = display_name_;
     description = description_;
     encryption_key = encryption_key_;
     pipeline_provisioning = pipeline_provisioning_;
     tags = tags_;
   }
    : create_service_template_input)

let make_service_template_version
    ?recommended_minor_version:(recommended_minor_version_ : template_version_part option)
    ?status_message:(status_message_ : status_message option)
    ?description:(description_ : description option) ?schema:(schema_ : template_schema option)
    ?supported_component_sources:
      (supported_component_sources_ : service_template_supported_component_source_input_list option)
    ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part)
    ~status:(status_ : template_version_status) ~arn:(arn_ : service_template_version_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~compatible_environment_templates:
      (compatible_environment_templates_ : compatible_environment_template_list) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
     recommended_minor_version = recommended_minor_version_;
     status = status_;
     status_message = status_message_;
     description = description_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     compatible_environment_templates = compatible_environment_templates_;
     schema = schema_;
     supported_component_sources = supported_component_sources_;
   }
    : service_template_version)

let make_create_service_template_version_output
    ~service_template_version:(service_template_version_ : service_template_version) () =
  ({ service_template_version = service_template_version_ }
    : create_service_template_version_output)

let make_create_service_template_version_input ?client_token:(client_token_ : client_token option)
    ?description:(description_ : description option)
    ?major_version:(major_version_ : template_version_part option) ?tags:(tags_ : tag_list option)
    ?supported_component_sources:
      (supported_component_sources_ : service_template_supported_component_source_input_list option)
    ~template_name:(template_name_ : resource_name)
    ~source:(source_ : template_version_source_input)
    ~compatible_environment_templates:
      (compatible_environment_templates_ : compatible_environment_template_input_list) () =
  ({
     client_token = client_token_;
     template_name = template_name_;
     description = description_;
     major_version = major_version_;
     source = source_;
     compatible_environment_templates = compatible_environment_templates_;
     tags = tags_;
     supported_component_sources = supported_component_sources_;
   }
    : create_service_template_version_input)

let make_template_sync_config ?subdirectory:(subdirectory_ : subdirectory option)
    ~template_name:(template_name_ : resource_name) ~template_type:(template_type_ : template_type)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~repository_name:(repository_name_ : repository_name) ~branch:(branch_ : git_branch_name) () =
  ({
     template_name = template_name_;
     template_type = template_type_;
     repository_provider = repository_provider_;
     repository_name = repository_name_;
     branch = branch_;
     subdirectory = subdirectory_;
   }
    : template_sync_config)

let make_create_template_sync_config_output
    ?template_sync_config:(template_sync_config_ : template_sync_config option) () =
  ({ template_sync_config = template_sync_config_ } : create_template_sync_config_output)

let make_create_template_sync_config_input ?subdirectory:(subdirectory_ : subdirectory option)
    ~template_name:(template_name_ : resource_name) ~template_type:(template_type_ : template_type)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~repository_name:(repository_name_ : repository_name) ~branch:(branch_ : git_branch_name) () =
  ({
     template_name = template_name_;
     template_type = template_type_;
     repository_provider = repository_provider_;
     repository_name = repository_name_;
     branch = branch_;
     subdirectory = subdirectory_;
   }
    : create_template_sync_config_input)

let make_delete_component_output ?component:(component_ : component option) () =
  ({ component = component_ } : delete_component_output)

let make_delete_component_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_component_input)

let make_service_pipeline_state ?spec:(spec_ : spec_contents option)
    ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part) () =
  ({
     spec = spec_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
   }
    : service_pipeline_state)

let make_environment_state ?spec:(spec_ : spec_contents option)
    ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part) () =
  ({
     spec = spec_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
   }
    : environment_state)

let make_service_instance_state
    ?last_successful_component_deployment_ids:
      (last_successful_component_deployment_ids_ : component_deployment_id_list option)
    ?last_successful_environment_deployment_id:
      (last_successful_environment_deployment_id_ : deployment_id option)
    ?last_successful_service_pipeline_deployment_id:
      (last_successful_service_pipeline_deployment_id_ : deployment_id option)
    ~spec:(spec_ : spec_contents) ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part) () =
  ({
     spec = spec_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     last_successful_component_deployment_ids = last_successful_component_deployment_ids_;
     last_successful_environment_deployment_id = last_successful_environment_deployment_id_;
     last_successful_service_pipeline_deployment_id =
       last_successful_service_pipeline_deployment_id_;
   }
    : service_instance_state)

let make_deployment ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?component_name:(component_name_ : resource_name option)
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?completed_at:(completed_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ?initial_state:(initial_state_ : deployment_state option)
    ?target_state:(target_state_ : deployment_state option) ~id:(id_ : deployment_id)
    ~arn:(arn_ : deployment_arn) ~target_arn:(target_arn_ : arn)
    ~target_resource_created_at:(target_resource_created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~target_resource_type:(target_resource_type_ : deployment_target_resource_type)
    ~environment_name:(environment_name_ : resource_name)
    ~deployment_status:(deployment_status_ : deployment_status)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     id = id_;
     arn = arn_;
     target_arn = target_arn_;
     target_resource_created_at = target_resource_created_at_;
     target_resource_type = target_resource_type_;
     environment_name = environment_name_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     component_name = component_name_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     completed_at = completed_at_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     initial_state = initial_state_;
     target_state = target_state_;
   }
    : deployment)

let make_delete_deployment_output ?deployment:(deployment_ : deployment option) () =
  ({ deployment = deployment_ } : delete_deployment_output)

let make_delete_deployment_input ~id:(id_ : deployment_id) () =
  ({ id = id_ } : delete_deployment_input)

let make_delete_environment_output ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : delete_environment_output)

let make_delete_environment_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_environment_input)

let make_delete_environment_account_connection_output
    ?environment_account_connection:
      (environment_account_connection_ : environment_account_connection option) () =
  ({ environment_account_connection = environment_account_connection_ }
    : delete_environment_account_connection_output)

let make_delete_environment_account_connection_input ~id:(id_ : environment_account_connection_id)
    () =
  ({ id = id_ } : delete_environment_account_connection_input)

let make_delete_environment_template_output
    ?environment_template:(environment_template_ : environment_template option) () =
  ({ environment_template = environment_template_ } : delete_environment_template_output)

let make_delete_environment_template_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_environment_template_input)

let make_delete_environment_template_version_output
    ?environment_template_version:
      (environment_template_version_ : environment_template_version option) () =
  ({ environment_template_version = environment_template_version_ }
    : delete_environment_template_version_output)

let make_delete_environment_template_version_input ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
   }
    : delete_environment_template_version_input)

let make_delete_repository_output ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : delete_repository_output)

let make_delete_repository_input ~provider:(provider_ : repository_provider)
    ~name:(name_ : repository_name) () =
  ({ provider = provider_; name = name_ } : delete_repository_input)

let make_delete_service_output ?service:(service_ : service option) () =
  ({ service = service_ } : delete_service_output)

let make_delete_service_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_service_input)

let make_delete_service_sync_config_output
    ?service_sync_config:(service_sync_config_ : service_sync_config option) () =
  ({ service_sync_config = service_sync_config_ } : delete_service_sync_config_output)

let make_delete_service_sync_config_input ~service_name:(service_name_ : resource_name) () =
  ({ service_name = service_name_ } : delete_service_sync_config_input)

let make_delete_service_template_output
    ?service_template:(service_template_ : service_template option) () =
  ({ service_template = service_template_ } : delete_service_template_output)

let make_delete_service_template_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_service_template_input)

let make_delete_service_template_version_output
    ?service_template_version:(service_template_version_ : service_template_version option) () =
  ({ service_template_version = service_template_version_ }
    : delete_service_template_version_output)

let make_delete_service_template_version_input ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
   }
    : delete_service_template_version_input)

let make_delete_template_sync_config_output
    ?template_sync_config:(template_sync_config_ : template_sync_config option) () =
  ({ template_sync_config = template_sync_config_ } : delete_template_sync_config_output)

let make_delete_template_sync_config_input ~template_name:(template_name_ : resource_name)
    ~template_type:(template_type_ : template_type) () =
  ({ template_name = template_name_; template_type = template_type_ }
    : delete_template_sync_config_input)

let make_deployment_summary
    ?completed_at:(completed_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?component_name:(component_name_ : resource_name option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~id:(id_ : deployment_id) ~arn:(arn_ : deployment_arn) ~target_arn:(target_arn_ : arn)
    ~target_resource_created_at:(target_resource_created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~target_resource_type:(target_resource_type_ : deployment_target_resource_type)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~environment_name:(environment_name_ : resource_name)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     id = id_;
     arn = arn_;
     target_arn = target_arn_;
     target_resource_created_at = target_resource_created_at_;
     target_resource_type = target_resource_type_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     completed_at = completed_at_;
     environment_name = environment_name_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     component_name = component_name_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     deployment_status = deployment_status_;
   }
    : deployment_summary)

let make_environment_account_connection_summary
    ?component_role_arn:(component_role_arn_ : arn option)
    ~id:(id_ : environment_account_connection_id) ~arn:(arn_ : environment_account_connection_arn)
    ~management_account_id:(management_account_id_ : aws_account_id)
    ~environment_account_id:(environment_account_id_ : aws_account_id) ~role_arn:(role_arn_ : arn)
    ~environment_name:(environment_name_ : resource_name)
    ~requested_at:(requested_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : environment_account_connection_status) () =
  ({
     id = id_;
     arn = arn_;
     management_account_id = management_account_id_;
     environment_account_id = environment_account_id_;
     role_arn = role_arn_;
     environment_name = environment_name_;
     requested_at = requested_at_;
     last_modified_at = last_modified_at_;
     status = status_;
     component_role_arn = component_role_arn_;
   }
    : environment_account_connection_summary)

let make_environment_summary ?description:(description_ : description option)
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?proton_service_role_arn:(proton_service_role_arn_ : arn option)
    ?environment_account_connection_id:
      (environment_account_connection_id_ : environment_account_connection_id option)
    ?environment_account_id:(environment_account_id_ : aws_account_id option)
    ?provisioning:(provisioning_ : provisioning option)
    ?component_role_arn:(component_role_arn_ : arn option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~name:(name_ : resource_name) ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_attempted_at:
      (last_deployment_attempted_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_succeeded_at:
      (last_deployment_succeeded_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~arn:(arn_ : environment_arn) ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     name = name_;
     description = description_;
     created_at = created_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     arn = arn_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     proton_service_role_arn = proton_service_role_arn_;
     environment_account_connection_id = environment_account_connection_id_;
     environment_account_id = environment_account_id_;
     provisioning = provisioning_;
     component_role_arn = component_role_arn_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
   }
    : environment_summary)

let make_environment_template_filter ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part) () =
  ({ template_name = template_name_; major_version = major_version_ } : environment_template_filter)

let make_environment_template_summary ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?recommended_version:(recommended_version_ : full_template_version_number option)
    ?provisioning:(provisioning_ : provisioning option) ~name:(name_ : resource_name)
    ~arn:(arn_ : environment_template_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     display_name = display_name_;
     description = description_;
     recommended_version = recommended_version_;
     provisioning = provisioning_;
   }
    : environment_template_summary)

let make_environment_template_version_summary
    ?recommended_minor_version:(recommended_minor_version_ : template_version_part option)
    ?status_message:(status_message_ : status_message option)
    ?description:(description_ : description option) ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part)
    ~status:(status_ : template_version_status) ~arn:(arn_ : environment_template_version_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
     recommended_minor_version = recommended_minor_version_;
     status = status_;
     status_message = status_message_;
     description = description_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
   }
    : environment_template_version_summary)

let make_get_account_settings_output ?account_settings:(account_settings_ : account_settings option)
    () =
  ({ account_settings = account_settings_ } : get_account_settings_output)

let make_get_account_settings_input () = (() : unit)

let make_get_component_output ?component:(component_ : component option) () =
  ({ component = component_ } : get_component_output)

let make_get_component_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_component_input)

let make_get_deployment_output ?deployment:(deployment_ : deployment option) () =
  ({ deployment = deployment_ } : get_deployment_output)

let make_get_deployment_input ?environment_name:(environment_name_ : resource_name option)
    ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?component_name:(component_name_ : resource_name option) ~id:(id_ : deployment_id) () =
  ({
     id = id_;
     environment_name = environment_name_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     component_name = component_name_;
   }
    : get_deployment_input)

let make_get_environment_output ~environment:(environment_ : environment) () =
  ({ environment = environment_ } : get_environment_output)

let make_get_environment_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_environment_input)

let make_get_environment_account_connection_output
    ~environment_account_connection:
      (environment_account_connection_ : environment_account_connection) () =
  ({ environment_account_connection = environment_account_connection_ }
    : get_environment_account_connection_output)

let make_get_environment_account_connection_input ~id:(id_ : environment_account_connection_id) () =
  ({ id = id_ } : get_environment_account_connection_input)

let make_get_environment_template_output
    ~environment_template:(environment_template_ : environment_template) () =
  ({ environment_template = environment_template_ } : get_environment_template_output)

let make_get_environment_template_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_environment_template_input)

let make_get_environment_template_version_output
    ~environment_template_version:(environment_template_version_ : environment_template_version) ()
    =
  ({ environment_template_version = environment_template_version_ }
    : get_environment_template_version_output)

let make_get_environment_template_version_input ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
   }
    : get_environment_template_version_input)

let make_get_repository_output ~repository:(repository_ : repository) () =
  ({ repository = repository_ } : get_repository_output)

let make_get_repository_input ~provider:(provider_ : repository_provider)
    ~name:(name_ : repository_name) () =
  ({ provider = provider_; name = name_ } : get_repository_input)

let make_get_service_output ?service:(service_ : service option) () =
  ({ service = service_ } : get_service_output)

let make_get_service_input ~name:(name_ : resource_name) () = ({ name = name_ } : get_service_input)

let make_get_service_instance_output ~service_instance:(service_instance_ : service_instance) () =
  ({ service_instance = service_instance_ } : get_service_instance_output)

let make_get_service_instance_input ~name:(name_ : resource_name)
    ~service_name:(service_name_ : resource_name) () =
  ({ name = name_; service_name = service_name_ } : get_service_instance_input)

let make_sync_blocker_context ~key:(key_ : Smaws_Lib.Smithy_api.Types.string_)
    ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ key = key_; value = value_ } : sync_blocker_context)

let make_sync_blocker ?contexts:(contexts_ : sync_blocker_contexts option)
    ?resolved_reason:(resolved_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resolved_at:(resolved_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_) ~type_:(type__ : blocker_type)
    ~status:(status_ : blocker_status)
    ~created_reason:(created_reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     id = id_;
     type_ = type__;
     status = status_;
     created_reason = created_reason_;
     created_at = created_at_;
     contexts = contexts_;
     resolved_reason = resolved_reason_;
     resolved_at = resolved_at_;
   }
    : sync_blocker)

let make_service_sync_blocker_summary
    ?service_instance_name:(service_instance_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?latest_blockers:(latest_blockers_ : latest_sync_blockers option)
    ~service_name:(service_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     latest_blockers = latest_blockers_;
   }
    : service_sync_blocker_summary)

let make_get_service_sync_blocker_summary_output
    ?service_sync_blocker_summary:
      (service_sync_blocker_summary_ : service_sync_blocker_summary option) () =
  ({ service_sync_blocker_summary = service_sync_blocker_summary_ }
    : get_service_sync_blocker_summary_output)

let make_get_service_sync_blocker_summary_input
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ~service_name:(service_name_ : resource_name) () =
  ({ service_name = service_name_; service_instance_name = service_instance_name_ }
    : get_service_sync_blocker_summary_input)

let make_get_service_sync_config_output
    ?service_sync_config:(service_sync_config_ : service_sync_config option) () =
  ({ service_sync_config = service_sync_config_ } : get_service_sync_config_output)

let make_get_service_sync_config_input ~service_name:(service_name_ : resource_name) () =
  ({ service_name = service_name_ } : get_service_sync_config_input)

let make_get_service_template_output ~service_template:(service_template_ : service_template) () =
  ({ service_template = service_template_ } : get_service_template_output)

let make_get_service_template_input ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_service_template_input)

let make_get_service_template_version_output
    ~service_template_version:(service_template_version_ : service_template_version) () =
  ({ service_template_version = service_template_version_ } : get_service_template_version_output)

let make_get_service_template_version_input ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
   }
    : get_service_template_version_input)

let make_get_template_sync_config_output
    ?template_sync_config:(template_sync_config_ : template_sync_config option) () =
  ({ template_sync_config = template_sync_config_ } : get_template_sync_config_output)

let make_get_template_sync_config_input ~template_name:(template_name_ : resource_name)
    ~template_type:(template_type_ : template_type) () =
  ({ template_name = template_name_; template_type = template_type_ }
    : get_template_sync_config_input)

let make_list_component_outputs_output ?next_token:(next_token_ : empty_next_token option)
    ~outputs:(outputs_ : outputs_list) () =
  ({ next_token = next_token_; outputs = outputs_ } : list_component_outputs_output)

let make_list_component_outputs_input ?next_token:(next_token_ : empty_next_token option)
    ?deployment_id:(deployment_id_ : deployment_id option)
    ~component_name:(component_name_ : resource_name) () =
  ({ component_name = component_name_; next_token = next_token_; deployment_id = deployment_id_ }
    : list_component_outputs_input)

let make_provisioned_resource ?name:(name_ : provisioned_resource_name option)
    ?identifier:(identifier_ : provisioned_resource_identifier option)
    ?provisioning_engine:(provisioning_engine_ : provisioned_resource_engine option) () =
  ({ name = name_; identifier = identifier_; provisioning_engine = provisioning_engine_ }
    : provisioned_resource)

let make_list_component_provisioned_resources_output
    ?next_token:(next_token_ : empty_next_token option)
    ~provisioned_resources:(provisioned_resources_ : provisioned_resource_list) () =
  ({ next_token = next_token_; provisioned_resources = provisioned_resources_ }
    : list_component_provisioned_resources_output)

let make_list_component_provisioned_resources_input
    ?next_token:(next_token_ : empty_next_token option)
    ~component_name:(component_name_ : resource_name) () =
  ({ component_name = component_name_; next_token = next_token_ }
    : list_component_provisioned_resources_input)

let make_list_components_output ?next_token:(next_token_ : next_token option)
    ~components:(components_ : component_summary_list) () =
  ({ next_token = next_token_; components = components_ } : list_components_output)

let make_list_components_input ?next_token:(next_token_ : next_token option)
    ?environment_name:(environment_name_ : resource_name option)
    ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?max_results:(max_results_ : max_page_results option) () =
  ({
     next_token = next_token_;
     environment_name = environment_name_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     max_results = max_results_;
   }
    : list_components_input)

let make_list_deployments_output ?next_token:(next_token_ : next_token option)
    ~deployments:(deployments_ : deployment_summary_list) () =
  ({ next_token = next_token_; deployments = deployments_ } : list_deployments_output)

let make_list_deployments_input ?next_token:(next_token_ : next_token option)
    ?environment_name:(environment_name_ : resource_name option)
    ?service_name:(service_name_ : resource_name option)
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ?component_name:(component_name_ : resource_name option)
    ?max_results:(max_results_ : max_page_results option) () =
  ({
     next_token = next_token_;
     environment_name = environment_name_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     component_name = component_name_;
     max_results = max_results_;
   }
    : list_deployments_input)

let make_list_environment_account_connections_output ?next_token:(next_token_ : next_token option)
    ~environment_account_connections:
      (environment_account_connections_ : environment_account_connection_summary_list) () =
  ({ environment_account_connections = environment_account_connections_; next_token = next_token_ }
    : list_environment_account_connections_output)

let make_list_environment_account_connections_input
    ?environment_name:(environment_name_ : resource_name option)
    ?statuses:(statuses_ : environment_account_connection_status_list option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option)
    ~requested_by:(requested_by_ : environment_account_connection_requester_account_type) () =
  ({
     requested_by = requested_by_;
     environment_name = environment_name_;
     statuses = statuses_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_environment_account_connections_input)

let make_list_environment_outputs_output ?next_token:(next_token_ : empty_next_token option)
    ~outputs:(outputs_ : outputs_list) () =
  ({ next_token = next_token_; outputs = outputs_ } : list_environment_outputs_output)

let make_list_environment_outputs_input ?next_token:(next_token_ : empty_next_token option)
    ?deployment_id:(deployment_id_ : deployment_id option)
    ~environment_name:(environment_name_ : resource_name) () =
  ({
     environment_name = environment_name_;
     next_token = next_token_;
     deployment_id = deployment_id_;
   }
    : list_environment_outputs_input)

let make_list_environment_provisioned_resources_output
    ?next_token:(next_token_ : empty_next_token option)
    ~provisioned_resources:(provisioned_resources_ : provisioned_resource_list) () =
  ({ next_token = next_token_; provisioned_resources = provisioned_resources_ }
    : list_environment_provisioned_resources_output)

let make_list_environment_provisioned_resources_input
    ?next_token:(next_token_ : empty_next_token option)
    ~environment_name:(environment_name_ : resource_name) () =
  ({ environment_name = environment_name_; next_token = next_token_ }
    : list_environment_provisioned_resources_input)

let make_list_environment_template_versions_output ?next_token:(next_token_ : next_token option)
    ~template_versions:(template_versions_ : environment_template_version_summary_list) () =
  ({ next_token = next_token_; template_versions = template_versions_ }
    : list_environment_template_versions_output)

let make_list_environment_template_versions_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option)
    ?major_version:(major_version_ : template_version_part option)
    ~template_name:(template_name_ : resource_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     template_name = template_name_;
     major_version = major_version_;
   }
    : list_environment_template_versions_input)

let make_list_environment_templates_output ?next_token:(next_token_ : next_token option)
    ~templates:(templates_ : environment_template_summary_list) () =
  ({ next_token = next_token_; templates = templates_ } : list_environment_templates_output)

let make_list_environment_templates_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_environment_templates_input)

let make_list_environments_output ?next_token:(next_token_ : next_token option)
    ~environments:(environments_ : environment_summary_list) () =
  ({ next_token = next_token_; environments = environments_ } : list_environments_output)

let make_list_environments_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option)
    ?environment_templates:(environment_templates_ : environment_template_filter_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     environment_templates = environment_templates_;
   }
    : list_environments_input)

let make_repository_summary ~arn:(arn_ : repository_arn) ~provider:(provider_ : repository_provider)
    ~name:(name_ : repository_name) ~connection_arn:(connection_arn_ : arn) () =
  ({ arn = arn_; provider = provider_; name = name_; connection_arn = connection_arn_ }
    : repository_summary)

let make_list_repositories_output ?next_token:(next_token_ : next_token option)
    ~repositories:(repositories_ : repository_summary_list) () =
  ({ next_token = next_token_; repositories = repositories_ } : list_repositories_output)

let make_list_repositories_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_repositories_input)

let make_list_service_instance_outputs_output ?next_token:(next_token_ : empty_next_token option)
    ~outputs:(outputs_ : outputs_list) () =
  ({ next_token = next_token_; outputs = outputs_ } : list_service_instance_outputs_output)

let make_list_service_instance_outputs_input ?next_token:(next_token_ : empty_next_token option)
    ?deployment_id:(deployment_id_ : deployment_id option)
    ~service_instance_name:(service_instance_name_ : resource_name)
    ~service_name:(service_name_ : resource_name) () =
  ({
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     next_token = next_token_;
     deployment_id = deployment_id_;
   }
    : list_service_instance_outputs_input)

let make_list_service_instance_provisioned_resources_output
    ?next_token:(next_token_ : empty_next_token option)
    ~provisioned_resources:(provisioned_resources_ : provisioned_resource_list) () =
  ({ next_token = next_token_; provisioned_resources = provisioned_resources_ }
    : list_service_instance_provisioned_resources_output)

let make_list_service_instance_provisioned_resources_input
    ?next_token:(next_token_ : empty_next_token option)
    ~service_name:(service_name_ : resource_name)
    ~service_instance_name:(service_instance_name_ : resource_name) () =
  ({
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     next_token = next_token_;
   }
    : list_service_instance_provisioned_resources_input)

let make_service_instance_summary
    ?deployment_status_message:(deployment_status_message_ : status_message option)
    ?last_attempted_deployment_id:(last_attempted_deployment_id_ : deployment_id option)
    ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ : deployment_id option)
    ~name:(name_ : resource_name) ~arn:(arn_ : service_instance_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_attempted_at:
      (last_deployment_attempted_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_deployment_succeeded_at:
      (last_deployment_succeeded_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~service_name:(service_name_ : resource_name)
    ~environment_name:(environment_name_ : resource_name)
    ~template_name:(template_name_ : resource_name)
    ~template_major_version:(template_major_version_ : template_version_part)
    ~template_minor_version:(template_minor_version_ : template_version_part)
    ~deployment_status:(deployment_status_ : deployment_status) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     service_name = service_name_;
     environment_name = environment_name_;
     template_name = template_name_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     deployment_status = deployment_status_;
     deployment_status_message = deployment_status_message_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
   }
    : service_instance_summary)

let make_list_service_instances_output ?next_token:(next_token_ : next_token option)
    ~service_instances:(service_instances_ : service_instance_summary_list) () =
  ({ next_token = next_token_; service_instances = service_instances_ }
    : list_service_instances_output)

let make_list_service_instances_filter ?key:(key_ : list_service_instances_filter_by option)
    ?value:(value_ : list_service_instances_filter_value option) () =
  ({ key = key_; value = value_ } : list_service_instances_filter)

let make_list_service_instances_input ?service_name:(service_name_ : resource_name option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option)
    ?filters:(filters_ : list_service_instances_filter_list option)
    ?sort_by:(sort_by_ : list_service_instances_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     service_name = service_name_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_service_instances_input)

let make_list_service_pipeline_outputs_output ?next_token:(next_token_ : empty_next_token option)
    ~outputs:(outputs_ : outputs_list) () =
  ({ next_token = next_token_; outputs = outputs_ } : list_service_pipeline_outputs_output)

let make_list_service_pipeline_outputs_input ?next_token:(next_token_ : empty_next_token option)
    ?deployment_id:(deployment_id_ : deployment_id option)
    ~service_name:(service_name_ : resource_name) () =
  ({ service_name = service_name_; next_token = next_token_; deployment_id = deployment_id_ }
    : list_service_pipeline_outputs_input)

let make_list_service_pipeline_provisioned_resources_output
    ?next_token:(next_token_ : empty_next_token option)
    ~provisioned_resources:(provisioned_resources_ : provisioned_resource_list) () =
  ({ next_token = next_token_; provisioned_resources = provisioned_resources_ }
    : list_service_pipeline_provisioned_resources_output)

let make_list_service_pipeline_provisioned_resources_input
    ?next_token:(next_token_ : empty_next_token option)
    ~service_name:(service_name_ : resource_name) () =
  ({ service_name = service_name_; next_token = next_token_ }
    : list_service_pipeline_provisioned_resources_input)

let make_service_template_version_summary
    ?recommended_minor_version:(recommended_minor_version_ : template_version_part option)
    ?status_message:(status_message_ : status_message option)
    ?description:(description_ : description option) ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part)
    ~status:(status_ : template_version_status) ~arn:(arn_ : service_template_version_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
     recommended_minor_version = recommended_minor_version_;
     status = status_;
     status_message = status_message_;
     description = description_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
   }
    : service_template_version_summary)

let make_list_service_template_versions_output ?next_token:(next_token_ : next_token option)
    ~template_versions:(template_versions_ : service_template_version_summary_list) () =
  ({ next_token = next_token_; template_versions = template_versions_ }
    : list_service_template_versions_output)

let make_list_service_template_versions_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option)
    ?major_version:(major_version_ : template_version_part option)
    ~template_name:(template_name_ : resource_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     template_name = template_name_;
     major_version = major_version_;
   }
    : list_service_template_versions_input)

let make_service_template_summary ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?recommended_version:(recommended_version_ : full_template_version_number option)
    ?pipeline_provisioning:(pipeline_provisioning_ : provisioning option)
    ~name:(name_ : resource_name) ~arn:(arn_ : service_template_arn)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     name = name_;
     arn = arn_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     display_name = display_name_;
     description = description_;
     recommended_version = recommended_version_;
     pipeline_provisioning = pipeline_provisioning_;
   }
    : service_template_summary)

let make_list_service_templates_output ?next_token:(next_token_ : next_token option)
    ~templates:(templates_ : service_template_summary_list) () =
  ({ next_token = next_token_; templates = templates_ } : list_service_templates_output)

let make_list_service_templates_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_service_templates_input)

let make_service_summary ?description:(description_ : description option)
    ?status_message:(status_message_ : status_message option) ~name:(name_ : resource_name)
    ~arn:(arn_ : service_arn) ~template_name:(template_name_ : resource_name)
    ~created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~last_modified_at:(last_modified_at_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : service_status) () =
  ({
     name = name_;
     description = description_;
     arn = arn_;
     template_name = template_name_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     status = status_;
     status_message = status_message_;
   }
    : service_summary)

let make_list_services_output ?next_token:(next_token_ : next_token option)
    ~services:(services_ : service_summary_list) () =
  ({ next_token = next_token_; services = services_ } : list_services_output)

let make_list_services_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_page_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_services_input)

let make_reject_environment_account_connection_output
    ~environment_account_connection:
      (environment_account_connection_ : environment_account_connection) () =
  ({ environment_account_connection = environment_account_connection_ }
    : reject_environment_account_connection_output)

let make_reject_environment_account_connection_input ~id:(id_ : environment_account_connection_id)
    () =
  ({ id = id_ } : reject_environment_account_connection_input)

let make_update_account_settings_output ~account_settings:(account_settings_ : account_settings) ()
    =
  ({ account_settings = account_settings_ } : update_account_settings_output)

let make_update_account_settings_input
    ?pipeline_service_role_arn:(pipeline_service_role_arn_ : role_arn_or_empty_string option)
    ?pipeline_provisioning_repository:
      (pipeline_provisioning_repository_ : repository_branch_input option)
    ?delete_pipeline_provisioning_repository:
      (delete_pipeline_provisioning_repository_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?pipeline_codebuild_role_arn:(pipeline_codebuild_role_arn_ : role_arn_or_empty_string option) ()
    =
  ({
     pipeline_service_role_arn = pipeline_service_role_arn_;
     pipeline_provisioning_repository = pipeline_provisioning_repository_;
     delete_pipeline_provisioning_repository = delete_pipeline_provisioning_repository_;
     pipeline_codebuild_role_arn = pipeline_codebuild_role_arn_;
   }
    : update_account_settings_input)

let make_update_component_output ~component:(component_ : component) () =
  ({ component = component_ } : update_component_output)

let make_update_component_input ?description:(description_ : description option)
    ?service_name:(service_name_ : resource_name_or_empty option)
    ?service_instance_name:(service_instance_name_ : resource_name_or_empty option)
    ?service_spec:(service_spec_ : spec_contents option)
    ?template_file:(template_file_ : template_file_contents option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : resource_name)
    ~deployment_type:(deployment_type_ : component_deployment_update_type) () =
  ({
     name = name_;
     deployment_type = deployment_type_;
     description = description_;
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     service_spec = service_spec_;
     template_file = template_file_;
     client_token = client_token_;
   }
    : update_component_input)

let make_update_environment_output ~environment:(environment_ : environment) () =
  ({ environment = environment_ } : update_environment_output)

let make_update_environment_input ?description:(description_ : description option)
    ?spec:(spec_ : spec_contents option)
    ?template_major_version:(template_major_version_ : template_version_part option)
    ?template_minor_version:(template_minor_version_ : template_version_part option)
    ?proton_service_role_arn:(proton_service_role_arn_ : arn option)
    ?environment_account_connection_id:
      (environment_account_connection_id_ : environment_account_connection_id option)
    ?provisioning_repository:(provisioning_repository_ : repository_branch_input option)
    ?component_role_arn:(component_role_arn_ : role_arn option)
    ?codebuild_role_arn:(codebuild_role_arn_ : role_arn option) ~name:(name_ : resource_name)
    ~deployment_type:(deployment_type_ : deployment_update_type) () =
  ({
     name = name_;
     description = description_;
     spec = spec_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     proton_service_role_arn = proton_service_role_arn_;
     deployment_type = deployment_type_;
     environment_account_connection_id = environment_account_connection_id_;
     provisioning_repository = provisioning_repository_;
     component_role_arn = component_role_arn_;
     codebuild_role_arn = codebuild_role_arn_;
   }
    : update_environment_input)

let make_update_environment_account_connection_output
    ~environment_account_connection:
      (environment_account_connection_ : environment_account_connection) () =
  ({ environment_account_connection = environment_account_connection_ }
    : update_environment_account_connection_output)

let make_update_environment_account_connection_input ?role_arn:(role_arn_ : role_arn option)
    ?component_role_arn:(component_role_arn_ : role_arn option)
    ?codebuild_role_arn:(codebuild_role_arn_ : role_arn option)
    ~id:(id_ : environment_account_connection_id) () =
  ({
     id = id_;
     role_arn = role_arn_;
     component_role_arn = component_role_arn_;
     codebuild_role_arn = codebuild_role_arn_;
   }
    : update_environment_account_connection_input)

let make_update_environment_template_output
    ~environment_template:(environment_template_ : environment_template) () =
  ({ environment_template = environment_template_ } : update_environment_template_output)

let make_update_environment_template_input ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ~name:(name_ : resource_name) () =
  ({ name = name_; display_name = display_name_; description = description_ }
    : update_environment_template_input)

let make_update_environment_template_version_output
    ~environment_template_version:(environment_template_version_ : environment_template_version) ()
    =
  ({ environment_template_version = environment_template_version_ }
    : update_environment_template_version_output)

let make_update_environment_template_version_input ?description:(description_ : description option)
    ?status:(status_ : template_version_status option)
    ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
     description = description_;
     status = status_;
   }
    : update_environment_template_version_input)

let make_update_service_output ~service:(service_ : service) () =
  ({ service = service_ } : update_service_output)

let make_update_service_input ?description:(description_ : description option)
    ?spec:(spec_ : spec_contents option) ~name:(name_ : resource_name) () =
  ({ name = name_; description = description_; spec = spec_ } : update_service_input)

let make_update_service_instance_output ~service_instance:(service_instance_ : service_instance) ()
    =
  ({ service_instance = service_instance_ } : update_service_instance_output)

let make_update_service_instance_input ?spec:(spec_ : spec_contents option)
    ?template_major_version:(template_major_version_ : template_version_part option)
    ?template_minor_version:(template_minor_version_ : template_version_part option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : resource_name)
    ~service_name:(service_name_ : resource_name)
    ~deployment_type:(deployment_type_ : deployment_update_type) () =
  ({
     name = name_;
     service_name = service_name_;
     deployment_type = deployment_type_;
     spec = spec_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
     client_token = client_token_;
   }
    : update_service_instance_input)

let make_update_service_pipeline_output ~pipeline:(pipeline_ : service_pipeline) () =
  ({ pipeline = pipeline_ } : update_service_pipeline_output)

let make_update_service_pipeline_input
    ?template_major_version:(template_major_version_ : template_version_part option)
    ?template_minor_version:(template_minor_version_ : template_version_part option)
    ~service_name:(service_name_ : resource_name) ~spec:(spec_ : spec_contents)
    ~deployment_type:(deployment_type_ : deployment_update_type) () =
  ({
     service_name = service_name_;
     spec = spec_;
     deployment_type = deployment_type_;
     template_major_version = template_major_version_;
     template_minor_version = template_minor_version_;
   }
    : update_service_pipeline_input)

let make_update_service_sync_blocker_output
    ?service_instance_name:(service_instance_name_ : resource_name option)
    ~service_name:(service_name_ : resource_name)
    ~service_sync_blocker:(service_sync_blocker_ : sync_blocker) () =
  ({
     service_name = service_name_;
     service_instance_name = service_instance_name_;
     service_sync_blocker = service_sync_blocker_;
   }
    : update_service_sync_blocker_output)

let make_update_service_sync_blocker_input ~id:(id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~resolved_reason:(resolved_reason_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ id = id_; resolved_reason = resolved_reason_ } : update_service_sync_blocker_input)

let make_update_service_sync_config_output
    ?service_sync_config:(service_sync_config_ : service_sync_config option) () =
  ({ service_sync_config = service_sync_config_ } : update_service_sync_config_output)

let make_update_service_sync_config_input ~service_name:(service_name_ : resource_name)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~repository_name:(repository_name_ : repository_name) ~branch:(branch_ : git_branch_name)
    ~file_path:(file_path_ : ops_file_path) () =
  ({
     service_name = service_name_;
     repository_provider = repository_provider_;
     repository_name = repository_name_;
     branch = branch_;
     file_path = file_path_;
   }
    : update_service_sync_config_input)

let make_update_service_template_output ~service_template:(service_template_ : service_template) ()
    =
  ({ service_template = service_template_ } : update_service_template_output)

let make_update_service_template_input ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ~name:(name_ : resource_name) () =
  ({ name = name_; display_name = display_name_; description = description_ }
    : update_service_template_input)

let make_update_service_template_version_output
    ~service_template_version:(service_template_version_ : service_template_version) () =
  ({ service_template_version = service_template_version_ }
    : update_service_template_version_output)

let make_update_service_template_version_input ?description:(description_ : description option)
    ?status:(status_ : template_version_status option)
    ?compatible_environment_templates:
      (compatible_environment_templates_ : compatible_environment_template_input_list option)
    ?supported_component_sources:
      (supported_component_sources_ : service_template_supported_component_source_input_list option)
    ~template_name:(template_name_ : resource_name)
    ~major_version:(major_version_ : template_version_part)
    ~minor_version:(minor_version_ : template_version_part) () =
  ({
     template_name = template_name_;
     major_version = major_version_;
     minor_version = minor_version_;
     description = description_;
     status = status_;
     compatible_environment_templates = compatible_environment_templates_;
     supported_component_sources = supported_component_sources_;
   }
    : update_service_template_version_input)

let make_update_template_sync_config_output
    ?template_sync_config:(template_sync_config_ : template_sync_config option) () =
  ({ template_sync_config = template_sync_config_ } : update_template_sync_config_output)

let make_update_template_sync_config_input ?subdirectory:(subdirectory_ : subdirectory option)
    ~template_name:(template_name_ : resource_name) ~template_type:(template_type_ : template_type)
    ~repository_provider:(repository_provider_ : repository_provider)
    ~repository_name:(repository_name_ : repository_name) ~branch:(branch_ : git_branch_name) () =
  ({
     template_name = template_name_;
     template_type = template_type_;
     repository_provider = repository_provider_;
     repository_name = repository_name_;
     branch = branch_;
     subdirectory = subdirectory_;
   }
    : update_template_sync_config_input)
