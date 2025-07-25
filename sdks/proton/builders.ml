open Smaws_Lib
open Types
let make_template_sync_config ?subdirectory:(subdirectory_ : string option)
  ~branch:(branch_ : string) ~repository_name:(repository_name_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~template_type:(template_type_ : template_type)
  ~template_name:(template_name_ : string) () =
  ({
     subdirectory = subdirectory_;
     branch = branch_;
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     template_type = template_type_;
     template_name = template_name_
   } : template_sync_config)
let make_update_template_sync_config_output
  ?template_sync_config:(template_sync_config_ : template_sync_config option)
  () =
  ({ template_sync_config = template_sync_config_ } : update_template_sync_config_output)
let make_update_template_sync_config_input
  ?subdirectory:(subdirectory_ : string option) ~branch:(branch_ : string)
  ~repository_name:(repository_name_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~template_type:(template_type_ : template_type)
  ~template_name:(template_name_ : string) () =
  ({
     subdirectory = subdirectory_;
     branch = branch_;
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     template_type = template_type_;
     template_name = template_name_
   } : update_template_sync_config_input)
let make_compatible_environment_template
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({ major_version = major_version_; template_name = template_name_ } : 
  compatible_environment_template)
let make_service_template_version
  ?supported_component_sources:(supported_component_sources_ :
                                 service_template_supported_component_source_type
                                   list option)
  ?schema:(schema_ : string option)
  ?description:(description_ : string option)
  ?status_message:(status_message_ : string option)
  ?recommended_minor_version:(recommended_minor_version_ : string option)
  ~compatible_environment_templates:(compatible_environment_templates_ :
                                      compatible_environment_template list)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~status:(status_ : template_version_status)
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     supported_component_sources = supported_component_sources_;
     schema = schema_;
     compatible_environment_templates = compatible_environment_templates_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     description = description_;
     status_message = status_message_;
     status = status_;
     recommended_minor_version = recommended_minor_version_;
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : service_template_version)
let make_update_service_template_version_output
  ~service_template_version:(service_template_version_ :
                              service_template_version)
  () =
  ({ service_template_version = service_template_version_ } : update_service_template_version_output)
let make_compatible_environment_template_input
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({ major_version = major_version_; template_name = template_name_ } : 
  compatible_environment_template_input)
let make_update_service_template_version_input
  ?supported_component_sources:(supported_component_sources_ :
                                 service_template_supported_component_source_type
                                   list option)
  ?compatible_environment_templates:(compatible_environment_templates_ :
                                      compatible_environment_template_input
                                        list option)
  ?status:(status_ : template_version_status option)
  ?description:(description_ : string option)
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     supported_component_sources = supported_component_sources_;
     compatible_environment_templates = compatible_environment_templates_;
     status = status_;
     description = description_;
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : update_service_template_version_input)
let make_service_template
  ?pipeline_provisioning:(pipeline_provisioning_ : provisioning option)
  ?encryption_key:(encryption_key_ : string option)
  ?recommended_version:(recommended_version_ : string option)
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     pipeline_provisioning = pipeline_provisioning_;
     encryption_key = encryption_key_;
     recommended_version = recommended_version_;
     description = description_;
     display_name = display_name_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : service_template)
let make_update_service_template_output
  ~service_template:(service_template_ : service_template) () =
  ({ service_template = service_template_ } : update_service_template_output)
let make_update_service_template_input
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option) ~name:(name_ : string) () =
  ({ description = description_; display_name = display_name_; name = name_ } : 
  update_service_template_input)
let make_service_sync_config ~file_path:(file_path_ : string)
  ~branch:(branch_ : string) ~repository_name:(repository_name_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~service_name:(service_name_ : string) () =
  ({
     file_path = file_path_;
     branch = branch_;
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     service_name = service_name_
   } : service_sync_config)
let make_update_service_sync_config_output
  ?service_sync_config:(service_sync_config_ : service_sync_config option) ()
  =
  ({ service_sync_config = service_sync_config_ } : update_service_sync_config_output)
let make_update_service_sync_config_input ~file_path:(file_path_ : string)
  ~branch:(branch_ : string) ~repository_name:(repository_name_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~service_name:(service_name_ : string) () =
  ({
     file_path = file_path_;
     branch = branch_;
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     service_name = service_name_
   } : update_service_sync_config_input)
let make_sync_blocker_context ~value:(value_ : string) ~key:(key_ : string)
  () = ({ value = value_; key = key_ } : sync_blocker_context)
let make_sync_blocker
  ?resolved_at:(resolved_at_ : CoreTypes.Timestamp.t option)
  ?resolved_reason:(resolved_reason_ : string option)
  ?contexts:(contexts_ : sync_blocker_context list option)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)
  ~created_reason:(created_reason_ : string)
  ~status:(status_ : blocker_status) ~type_:(type__ : blocker_type)
  ~id:(id_ : string) () =
  ({
     resolved_at = resolved_at_;
     resolved_reason = resolved_reason_;
     contexts = contexts_;
     created_at = created_at_;
     created_reason = created_reason_;
     status = status_;
     type_ = type__;
     id = id_
   } : sync_blocker)
let make_update_service_sync_blocker_output
  ?service_instance_name:(service_instance_name_ : string option)
  ~service_sync_blocker:(service_sync_blocker_ : sync_blocker)
  ~service_name:(service_name_ : string) () =
  ({
     service_sync_blocker = service_sync_blocker_;
     service_instance_name = service_instance_name_;
     service_name = service_name_
   } : update_service_sync_blocker_output)
let make_update_service_sync_blocker_input
  ~resolved_reason:(resolved_reason_ : string) ~id:(id_ : string) () =
  ({ resolved_reason = resolved_reason_; id = id_ } : update_service_sync_blocker_input)
let make_service_pipeline
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?spec:(spec_ : string option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string)
  ~last_deployment_succeeded_at:(last_deployment_succeeded_at_ :
                                  CoreTypes.Timestamp.t)
  ~last_deployment_attempted_at:(last_deployment_attempted_at_ :
                                  CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string) () =
  ({
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     spec = spec_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     created_at = created_at_;
     arn = arn_
   } : service_pipeline)
let make_update_service_pipeline_output
  ~pipeline:(pipeline_ : service_pipeline) () =
  ({ pipeline = pipeline_ } : update_service_pipeline_output)
let make_update_service_pipeline_input
  ?template_minor_version:(template_minor_version_ : string option)
  ?template_major_version:(template_major_version_ : string option)
  ~deployment_type:(deployment_type_ : deployment_update_type)
  ~spec:(spec_ : string) ~service_name:(service_name_ : string) () =
  ({
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     deployment_type = deployment_type_;
     spec = spec_;
     service_name = service_name_
   } : update_service_pipeline_input)
let make_service ?branch_name:(branch_name_ : string option)
  ?repository_id:(repository_id_ : string option)
  ?repository_connection_arn:(repository_connection_arn_ : string option)
  ?pipeline:(pipeline_ : service_pipeline option)
  ?status_message:(status_message_ : string option)
  ?description:(description_ : string option) ~spec:(spec_ : string)
  ~status:(status_ : service_status)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)
  ~template_name:(template_name_ : string) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     branch_name = branch_name_;
     repository_id = repository_id_;
     repository_connection_arn = repository_connection_arn_;
     pipeline = pipeline_;
     spec = spec_;
     status_message = status_message_;
     status = status_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     template_name = template_name_;
     arn = arn_;
     description = description_;
     name = name_
   } : service)
let make_update_service_output ~service:(service_ : service) () =
  ({ service = service_ } : update_service_output)
let make_service_instance
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?last_client_request_token:(last_client_request_token_ : string option)
  ?spec:(spec_ : string option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string)
  ~environment_name:(environment_name_ : string)
  ~service_name:(service_name_ : string)
  ~last_deployment_succeeded_at:(last_deployment_succeeded_at_ :
                                  CoreTypes.Timestamp.t)
  ~last_deployment_attempted_at:(last_deployment_attempted_at_ :
                                  CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_client_request_token = last_client_request_token_;
     spec = spec_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     environment_name = environment_name_;
     service_name = service_name_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : service_instance)
let make_update_service_instance_output
  ~service_instance:(service_instance_ : service_instance) () =
  ({ service_instance = service_instance_ } : update_service_instance_output)
let make_update_service_instance_input
  ?client_token:(client_token_ : string option)
  ?template_minor_version:(template_minor_version_ : string option)
  ?template_major_version:(template_major_version_ : string option)
  ?spec:(spec_ : string option)
  ~deployment_type:(deployment_type_ : deployment_update_type)
  ~service_name:(service_name_ : string) ~name:(name_ : string) () =
  ({
     client_token = client_token_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     spec = spec_;
     deployment_type = deployment_type_;
     service_name = service_name_;
     name = name_
   } : update_service_instance_input)
let make_update_service_input ?spec:(spec_ : string option)
  ?description:(description_ : string option) ~name:(name_ : string) () =
  ({ spec = spec_; description = description_; name = name_ } : update_service_input)
let make_environment_template_version ?schema:(schema_ : string option)
  ?description:(description_ : string option)
  ?status_message:(status_message_ : string option)
  ?recommended_minor_version:(recommended_minor_version_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~status:(status_ : template_version_status)
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     schema = schema_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     description = description_;
     status_message = status_message_;
     status = status_;
     recommended_minor_version = recommended_minor_version_;
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : environment_template_version)
let make_update_environment_template_version_output
  ~environment_template_version:(environment_template_version_ :
                                  environment_template_version)
  () =
  ({ environment_template_version = environment_template_version_ } : 
  update_environment_template_version_output)
let make_update_environment_template_version_input
  ?status:(status_ : template_version_status option)
  ?description:(description_ : string option)
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     status = status_;
     description = description_;
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : update_environment_template_version_input)
let make_environment_template
  ?provisioning:(provisioning_ : provisioning option)
  ?encryption_key:(encryption_key_ : string option)
  ?recommended_version:(recommended_version_ : string option)
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     provisioning = provisioning_;
     encryption_key = encryption_key_;
     recommended_version = recommended_version_;
     description = description_;
     display_name = display_name_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : environment_template)
let make_update_environment_template_output
  ~environment_template:(environment_template_ : environment_template) () =
  ({ environment_template = environment_template_ } : update_environment_template_output)
let make_update_environment_template_input
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option) ~name:(name_ : string) () =
  ({ description = description_; display_name = display_name_; name = name_ } : 
  update_environment_template_input)
let make_repository_branch ~branch:(branch_ : string) ~name:(name_ : string)
  ~provider:(provider_ : repository_provider) ~arn:(arn_ : string) () =
  ({ branch = branch_; name = name_; provider = provider_; arn = arn_ } : 
  repository_branch)
let make_environment
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?codebuild_role_arn:(codebuild_role_arn_ : string option)
  ?component_role_arn:(component_role_arn_ : string option)
  ?provisioning_repository:(provisioning_repository_ :
                             repository_branch option)
  ?provisioning:(provisioning_ : provisioning option)
  ?spec:(spec_ : string option)
  ?environment_account_id:(environment_account_id_ : string option)
  ?environment_account_connection_id:(environment_account_connection_id_ :
                                       string option)
  ?proton_service_role_arn:(proton_service_role_arn_ : string option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ?description:(description_ : string option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string) ~arn:(arn_ : string)
  ~last_deployment_succeeded_at:(last_deployment_succeeded_at_ :
                                  CoreTypes.Timestamp.t)
  ~last_deployment_attempted_at:(last_deployment_attempted_at_ :
                                  CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~name:(name_ : string) ()
  =
  ({
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     codebuild_role_arn = codebuild_role_arn_;
     component_role_arn = component_role_arn_;
     provisioning_repository = provisioning_repository_;
     provisioning = provisioning_;
     spec = spec_;
     environment_account_id = environment_account_id_;
     environment_account_connection_id = environment_account_connection_id_;
     proton_service_role_arn = proton_service_role_arn_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     arn = arn_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     created_at = created_at_;
     description = description_;
     name = name_
   } : environment)
let make_update_environment_output ~environment:(environment_ : environment)
  () = ({ environment = environment_ } : update_environment_output)
let make_repository_branch_input ~branch:(branch_ : string)
  ~name:(name_ : string) ~provider:(provider_ : repository_provider) () =
  ({ branch = branch_; name = name_; provider = provider_ } : repository_branch_input)
let make_update_environment_input
  ?codebuild_role_arn:(codebuild_role_arn_ : string option)
  ?component_role_arn:(component_role_arn_ : string option)
  ?provisioning_repository:(provisioning_repository_ :
                             repository_branch_input option)
  ?environment_account_connection_id:(environment_account_connection_id_ :
                                       string option)
  ?proton_service_role_arn:(proton_service_role_arn_ : string option)
  ?template_minor_version:(template_minor_version_ : string option)
  ?template_major_version:(template_major_version_ : string option)
  ?spec:(spec_ : string option) ?description:(description_ : string option)
  ~deployment_type:(deployment_type_ : deployment_update_type)
  ~name:(name_ : string) () =
  ({
     codebuild_role_arn = codebuild_role_arn_;
     component_role_arn = component_role_arn_;
     provisioning_repository = provisioning_repository_;
     environment_account_connection_id = environment_account_connection_id_;
     deployment_type = deployment_type_;
     proton_service_role_arn = proton_service_role_arn_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     spec = spec_;
     description = description_;
     name = name_
   } : update_environment_input)
let make_environment_account_connection
  ?codebuild_role_arn:(codebuild_role_arn_ : string option)
  ?component_role_arn:(component_role_arn_ : string option)
  ~status:(status_ : environment_account_connection_status)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~requested_at:(requested_at_ : CoreTypes.Timestamp.t)
  ~environment_name:(environment_name_ : string)
  ~role_arn:(role_arn_ : string)
  ~environment_account_id:(environment_account_id_ : string)
  ~management_account_id:(management_account_id_ : string)
  ~arn:(arn_ : string) ~id:(id_ : string) () =
  ({
     codebuild_role_arn = codebuild_role_arn_;
     component_role_arn = component_role_arn_;
     status = status_;
     last_modified_at = last_modified_at_;
     requested_at = requested_at_;
     environment_name = environment_name_;
     role_arn = role_arn_;
     environment_account_id = environment_account_id_;
     management_account_id = management_account_id_;
     arn = arn_;
     id = id_
   } : environment_account_connection)
let make_update_environment_account_connection_output
  ~environment_account_connection:(environment_account_connection_ :
                                    environment_account_connection)
  () =
  ({ environment_account_connection = environment_account_connection_ } : 
  update_environment_account_connection_output)
let make_update_environment_account_connection_input
  ?codebuild_role_arn:(codebuild_role_arn_ : string option)
  ?component_role_arn:(component_role_arn_ : string option)
  ?role_arn:(role_arn_ : string option) ~id:(id_ : string) () =
  ({
     codebuild_role_arn = codebuild_role_arn_;
     component_role_arn = component_role_arn_;
     role_arn = role_arn_;
     id = id_
   } : update_environment_account_connection_input)
let make_component
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?last_client_request_token:(last_client_request_token_ : string option)
  ?service_spec:(service_spec_ : string option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ?last_deployment_succeeded_at:(last_deployment_succeeded_at_ :
                                  CoreTypes.Timestamp.t option)
  ?last_deployment_attempted_at:(last_deployment_attempted_at_ :
                                  CoreTypes.Timestamp.t option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ?description:(description_ : string option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)
  ~environment_name:(environment_name_ : string) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     last_client_request_token = last_client_request_token_;
     service_spec = service_spec_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     environment_name = environment_name_;
     arn = arn_;
     description = description_;
     name = name_
   } : component)
let make_update_component_output ~component:(component_ : component) () =
  ({ component = component_ } : update_component_output)
let make_update_component_input ?client_token:(client_token_ : string option)
  ?template_file:(template_file_ : string option)
  ?service_spec:(service_spec_ : string option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ?description:(description_ : string option)
  ~deployment_type:(deployment_type_ : component_deployment_update_type)
  ~name:(name_ : string) () =
  ({
     client_token = client_token_;
     template_file = template_file_;
     service_spec = service_spec_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     description = description_;
     deployment_type = deployment_type_;
     name = name_
   } : update_component_input)
let make_account_settings
  ?pipeline_codebuild_role_arn:(pipeline_codebuild_role_arn_ : string option)
  ?pipeline_provisioning_repository:(pipeline_provisioning_repository_ :
                                      repository_branch option)
  ?pipeline_service_role_arn:(pipeline_service_role_arn_ : string option) ()
  =
  ({
     pipeline_codebuild_role_arn = pipeline_codebuild_role_arn_;
     pipeline_provisioning_repository = pipeline_provisioning_repository_;
     pipeline_service_role_arn = pipeline_service_role_arn_
   } : account_settings)
let make_update_account_settings_output
  ~account_settings:(account_settings_ : account_settings) () =
  ({ account_settings = account_settings_ } : update_account_settings_output)
let make_update_account_settings_input
  ?pipeline_codebuild_role_arn:(pipeline_codebuild_role_arn_ : string option)
  ?delete_pipeline_provisioning_repository:(delete_pipeline_provisioning_repository_
                                             : bool option)
  ?pipeline_provisioning_repository:(pipeline_provisioning_repository_ :
                                      repository_branch_input option)
  ?pipeline_service_role_arn:(pipeline_service_role_arn_ : string option) ()
  =
  ({
     pipeline_codebuild_role_arn = pipeline_codebuild_role_arn_;
     delete_pipeline_provisioning_repository =
       delete_pipeline_provisioning_repository_;
     pipeline_provisioning_repository = pipeline_provisioning_repository_;
     pipeline_service_role_arn = pipeline_service_role_arn_
   } : update_account_settings_input)
let make_untag_resource_output () = (() : unit)
let make_untag_resource_input ~tag_keys:(tag_keys_ : string list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_s3_object_source ~key:(key_ : string) ~bucket:(bucket_ : string) ()
  = ({ key = key_; bucket = bucket_ } : s3_object_source)
let make_tag_resource_output () = (() : unit)
let make_tag ~value:(value_ : string) ~key:(key_ : string) () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_input ~tags:(tags_ : tag list)
  ~resource_arn:(resource_arn_ : string) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_service_template_version_summary
  ?description:(description_ : string option)
  ?status_message:(status_message_ : string option)
  ?recommended_minor_version:(recommended_minor_version_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~status:(status_ : template_version_status)
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     description = description_;
     status_message = status_message_;
     status = status_;
     recommended_minor_version = recommended_minor_version_;
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : service_template_version_summary)
let make_service_template_summary
  ?pipeline_provisioning:(pipeline_provisioning_ : provisioning option)
  ?recommended_version:(recommended_version_ : string option)
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     pipeline_provisioning = pipeline_provisioning_;
     recommended_version = recommended_version_;
     description = description_;
     display_name = display_name_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : service_template_summary)
let make_service_sync_blocker_summary
  ?latest_blockers:(latest_blockers_ : sync_blocker list option)
  ?service_instance_name:(service_instance_name_ : string option)
  ~service_name:(service_name_ : string) () =
  ({
     latest_blockers = latest_blockers_;
     service_instance_name = service_instance_name_;
     service_name = service_name_
   } : service_sync_blocker_summary)
let make_service_summary ?status_message:(status_message_ : string option)
  ?description:(description_ : string option)
  ~status:(status_ : service_status)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)
  ~template_name:(template_name_ : string) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     status_message = status_message_;
     status = status_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     template_name = template_name_;
     arn = arn_;
     description = description_;
     name = name_
   } : service_summary)
let make_service_pipeline_state ?spec:(spec_ : string option)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     spec = spec_
   } : service_pipeline_state)
let make_service_instance_summary
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string)
  ~environment_name:(environment_name_ : string)
  ~service_name:(service_name_ : string)
  ~last_deployment_succeeded_at:(last_deployment_succeeded_at_ :
                                  CoreTypes.Timestamp.t)
  ~last_deployment_attempted_at:(last_deployment_attempted_at_ :
                                  CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     environment_name = environment_name_;
     service_name = service_name_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : service_instance_summary)
let make_service_instance_state
  ?last_successful_service_pipeline_deployment_id:(last_successful_service_pipeline_deployment_id_
                                                    : string option)
  ?last_successful_environment_deployment_id:(last_successful_environment_deployment_id_
                                               : string option)
  ?last_successful_component_deployment_ids:(last_successful_component_deployment_ids_
                                              : string list option)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string) ~spec:(spec_ : string) () =
  ({
     last_successful_service_pipeline_deployment_id =
       last_successful_service_pipeline_deployment_id_;
     last_successful_environment_deployment_id =
       last_successful_environment_deployment_id_;
     last_successful_component_deployment_ids =
       last_successful_component_deployment_ids_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     spec = spec_
   } : service_instance_state)
let make_revision ~branch:(branch_ : string) ~directory:(directory_ : string)
  ~sha:(sha_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~repository_name:(repository_name_ : string) () =
  ({
     branch = branch_;
     directory = directory_;
     sha = sha_;
     repository_provider = repository_provider_;
     repository_name = repository_name_
   } : revision)
let make_resource_sync_event ?external_id:(external_id_ : string option)
  ~event:(event_ : string) ~time:(time_ : CoreTypes.Timestamp.t)
  ~type_:(type__ : string) () =
  ({ event = event_; time = time_; external_id = external_id_; type_ = type__
   } : resource_sync_event)
let make_resource_sync_attempt ~events:(events_ : resource_sync_event list)
  ~status:(status_ : resource_sync_status)
  ~started_at:(started_at_ : CoreTypes.Timestamp.t)
  ~target:(target_ : string) ~target_revision:(target_revision_ : revision)
  ~initial_revision:(initial_revision_ : revision) () =
  ({
     events = events_;
     status = status_;
     started_at = started_at_;
     target = target_;
     target_revision = target_revision_;
     initial_revision = initial_revision_
   } : resource_sync_attempt)
let make_resource_counts_summary ?behind_minor:(behind_minor_ : int option)
  ?behind_major:(behind_major_ : int option)
  ?up_to_date:(up_to_date_ : int option) ?failed:(failed_ : int option)
  ~total:(total_ : int) () =
  ({
     behind_minor = behind_minor_;
     behind_major = behind_major_;
     up_to_date = up_to_date_;
     failed = failed_;
     total = total_
   } : resource_counts_summary)
let make_repository_sync_event ?external_id:(external_id_ : string option)
  ~event:(event_ : string) ~time:(time_ : CoreTypes.Timestamp.t)
  ~type_:(type__ : string) () =
  ({ event = event_; time = time_; external_id = external_id_; type_ = type__
   } : repository_sync_event)
let make_repository_sync_definition ~directory:(directory_ : string)
  ~branch:(branch_ : string) ~parent:(parent_ : string)
  ~target:(target_ : string) () =
  ({
     directory = directory_;
     branch = branch_;
     parent = parent_;
     target = target_
   } : repository_sync_definition)
let make_repository_sync_attempt
  ~events:(events_ : repository_sync_event list)
  ~status:(status_ : repository_sync_status)
  ~started_at:(started_at_ : CoreTypes.Timestamp.t) () =
  ({ events = events_; status = status_; started_at = started_at_ } : 
  repository_sync_attempt)
let make_repository_summary ~connection_arn:(connection_arn_ : string)
  ~name:(name_ : string) ~provider:(provider_ : repository_provider)
  ~arn:(arn_ : string) () =
  ({
     connection_arn = connection_arn_;
     name = name_;
     provider = provider_;
     arn = arn_
   } : repository_summary)
let make_repository ?encryption_key:(encryption_key_ : string option)
  ~connection_arn:(connection_arn_ : string) ~name:(name_ : string)
  ~provider:(provider_ : repository_provider) ~arn:(arn_ : string) () =
  ({
     encryption_key = encryption_key_;
     connection_arn = connection_arn_;
     name = name_;
     provider = provider_;
     arn = arn_
   } : repository)
let make_reject_environment_account_connection_output
  ~environment_account_connection:(environment_account_connection_ :
                                    environment_account_connection)
  () =
  ({ environment_account_connection = environment_account_connection_ } : 
  reject_environment_account_connection_output)
let make_reject_environment_account_connection_input ~id:(id_ : string) () =
  ({ id = id_ } : reject_environment_account_connection_input)
let make_provisioned_resource
  ?provisioning_engine:(provisioning_engine_ :
                         provisioned_resource_engine option)
  ?identifier:(identifier_ : string option) ?name:(name_ : string option) ()
  =
  ({
     provisioning_engine = provisioning_engine_;
     identifier = identifier_;
     name = name_
   } : provisioned_resource)
let make_output ?value_string:(value_string_ : string option)
  ?key:(key_ : string option) () =
  ({ value_string = value_string_; key = key_ } : output)
let make_notify_resource_deployment_status_change_output () = (() : unit)
let make_notify_resource_deployment_status_change_input
  ?status_message:(status_message_ : string option)
  ?deployment_id:(deployment_id_ : string option)
  ?outputs:(outputs_ : output list option)
  ?status:(status_ : resource_deployment_status option)
  ~resource_arn:(resource_arn_ : string) () =
  ({
     status_message = status_message_;
     deployment_id = deployment_id_;
     outputs = outputs_;
     status = status_;
     resource_arn = resource_arn_
   } : notify_resource_deployment_status_change_input)
let make_list_tags_for_resource_output
  ?next_token:(next_token_ : string option) ~tags:(tags_ : tag list) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_output)
let make_list_tags_for_resource_input
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~resource_arn:(resource_arn_ : string) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_arn = resource_arn_
   } : list_tags_for_resource_input)
let make_list_services_output ?next_token:(next_token_ : string option)
  ~services:(services_ : service_summary list) () =
  ({ services = services_; next_token = next_token_ } : list_services_output)
let make_list_services_input ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_services_input)
let make_list_service_templates_output
  ?next_token:(next_token_ : string option)
  ~templates:(templates_ : service_template_summary list) () =
  ({ templates = templates_; next_token = next_token_ } : list_service_templates_output)
let make_list_service_templates_input
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_service_templates_input)
let make_list_service_template_versions_output
  ?next_token:(next_token_ : string option)
  ~template_versions:(template_versions_ :
                       service_template_version_summary list)
  () =
  ({ template_versions = template_versions_; next_token = next_token_ } : 
  list_service_template_versions_output)
let make_list_service_template_versions_input
  ?major_version:(major_version_ : string option)
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~template_name:(template_name_ : string) () =
  ({
     major_version = major_version_;
     template_name = template_name_;
     max_results = max_results_;
     next_token = next_token_
   } : list_service_template_versions_input)
let make_list_service_pipeline_provisioned_resources_output
  ?next_token:(next_token_ : string option)
  ~provisioned_resources:(provisioned_resources_ : provisioned_resource list)
  () =
  ({ provisioned_resources = provisioned_resources_; next_token = next_token_
   } : list_service_pipeline_provisioned_resources_output)
let make_list_service_pipeline_provisioned_resources_input
  ?next_token:(next_token_ : string option)
  ~service_name:(service_name_ : string) () =
  ({ next_token = next_token_; service_name = service_name_ } : list_service_pipeline_provisioned_resources_input)
let make_list_service_pipeline_outputs_output
  ?next_token:(next_token_ : string option) ~outputs:(outputs_ : output list)
  () =
  ({ outputs = outputs_; next_token = next_token_ } : list_service_pipeline_outputs_output)
let make_list_service_pipeline_outputs_input
  ?deployment_id:(deployment_id_ : string option)
  ?next_token:(next_token_ : string option)
  ~service_name:(service_name_ : string) () =
  ({
     deployment_id = deployment_id_;
     next_token = next_token_;
     service_name = service_name_
   } : list_service_pipeline_outputs_input)
let make_list_service_instances_output
  ?next_token:(next_token_ : string option)
  ~service_instances:(service_instances_ : service_instance_summary list) ()
  =
  ({ service_instances = service_instances_; next_token = next_token_ } : 
  list_service_instances_output)
let make_list_service_instances_filter ?value:(value_ : string option)
  ?key:(key_ : list_service_instances_filter_by option) () =
  ({ value = value_; key = key_ } : list_service_instances_filter)
let make_list_service_instances_input
  ?sort_order:(sort_order_ : sort_order option)
  ?sort_by:(sort_by_ : list_service_instances_sort_by option)
  ?filters:(filters_ : list_service_instances_filter list option)
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?service_name:(service_name_ : string option) () =
  ({
     sort_order = sort_order_;
     sort_by = sort_by_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     service_name = service_name_
   } : list_service_instances_input)
let make_list_service_instance_provisioned_resources_output
  ?next_token:(next_token_ : string option)
  ~provisioned_resources:(provisioned_resources_ : provisioned_resource list)
  () =
  ({ provisioned_resources = provisioned_resources_; next_token = next_token_
   } : list_service_instance_provisioned_resources_output)
let make_list_service_instance_provisioned_resources_input
  ?next_token:(next_token_ : string option)
  ~service_instance_name:(service_instance_name_ : string)
  ~service_name:(service_name_ : string) () =
  ({
     next_token = next_token_;
     service_instance_name = service_instance_name_;
     service_name = service_name_
   } : list_service_instance_provisioned_resources_input)
let make_list_service_instance_outputs_output
  ?next_token:(next_token_ : string option) ~outputs:(outputs_ : output list)
  () =
  ({ outputs = outputs_; next_token = next_token_ } : list_service_instance_outputs_output)
let make_list_service_instance_outputs_input
  ?deployment_id:(deployment_id_ : string option)
  ?next_token:(next_token_ : string option)
  ~service_name:(service_name_ : string)
  ~service_instance_name:(service_instance_name_ : string) () =
  ({
     deployment_id = deployment_id_;
     next_token = next_token_;
     service_name = service_name_;
     service_instance_name = service_instance_name_
   } : list_service_instance_outputs_input)
let make_list_repository_sync_definitions_output
  ?next_token:(next_token_ : string option)
  ~sync_definitions:(sync_definitions_ : repository_sync_definition list) ()
  =
  ({ sync_definitions = sync_definitions_; next_token = next_token_ } : 
  list_repository_sync_definitions_output)
let make_list_repository_sync_definitions_input
  ?next_token:(next_token_ : string option)
  ~sync_type:(sync_type_ : sync_type)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~repository_name:(repository_name_ : string) () =
  ({
     next_token = next_token_;
     sync_type = sync_type_;
     repository_provider = repository_provider_;
     repository_name = repository_name_
   } : list_repository_sync_definitions_input)
let make_list_repositories_output ?next_token:(next_token_ : string option)
  ~repositories:(repositories_ : repository_summary list) () =
  ({ repositories = repositories_; next_token = next_token_ } : list_repositories_output)
let make_list_repositories_input ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_repositories_input)
let make_environment_summary
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?component_role_arn:(component_role_arn_ : string option)
  ?provisioning:(provisioning_ : provisioning option)
  ?environment_account_id:(environment_account_id_ : string option)
  ?environment_account_connection_id:(environment_account_connection_id_ :
                                       string option)
  ?proton_service_role_arn:(proton_service_role_arn_ : string option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ?description:(description_ : string option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string) ~arn:(arn_ : string)
  ~last_deployment_succeeded_at:(last_deployment_succeeded_at_ :
                                  CoreTypes.Timestamp.t)
  ~last_deployment_attempted_at:(last_deployment_attempted_at_ :
                                  CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~name:(name_ : string) ()
  =
  ({
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     component_role_arn = component_role_arn_;
     provisioning = provisioning_;
     environment_account_id = environment_account_id_;
     environment_account_connection_id = environment_account_connection_id_;
     proton_service_role_arn = proton_service_role_arn_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     arn = arn_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     created_at = created_at_;
     description = description_;
     name = name_
   } : environment_summary)
let make_list_environments_output ?next_token:(next_token_ : string option)
  ~environments:(environments_ : environment_summary list) () =
  ({ environments = environments_; next_token = next_token_ } : list_environments_output)
let make_environment_template_filter ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({ major_version = major_version_; template_name = template_name_ } : 
  environment_template_filter)
let make_list_environments_input
  ?environment_templates:(environment_templates_ :
                           environment_template_filter list option)
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({
     environment_templates = environment_templates_;
     max_results = max_results_;
     next_token = next_token_
   } : list_environments_input)
let make_environment_template_summary
  ?provisioning:(provisioning_ : provisioning option)
  ?recommended_version:(recommended_version_ : string option)
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     provisioning = provisioning_;
     recommended_version = recommended_version_;
     description = description_;
     display_name = display_name_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : environment_template_summary)
let make_list_environment_templates_output
  ?next_token:(next_token_ : string option)
  ~templates:(templates_ : environment_template_summary list) () =
  ({ templates = templates_; next_token = next_token_ } : list_environment_templates_output)
let make_list_environment_templates_input
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_environment_templates_input)
let make_environment_template_version_summary
  ?description:(description_ : string option)
  ?status_message:(status_message_ : string option)
  ?recommended_minor_version:(recommended_minor_version_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) ~arn:(arn_ : string)
  ~status:(status_ : template_version_status)
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     arn = arn_;
     description = description_;
     status_message = status_message_;
     status = status_;
     recommended_minor_version = recommended_minor_version_;
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : environment_template_version_summary)
let make_list_environment_template_versions_output
  ?next_token:(next_token_ : string option)
  ~template_versions:(template_versions_ :
                       environment_template_version_summary list)
  () =
  ({ template_versions = template_versions_; next_token = next_token_ } : 
  list_environment_template_versions_output)
let make_list_environment_template_versions_input
  ?major_version:(major_version_ : string option)
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ~template_name:(template_name_ : string) () =
  ({
     major_version = major_version_;
     template_name = template_name_;
     max_results = max_results_;
     next_token = next_token_
   } : list_environment_template_versions_input)
let make_list_environment_provisioned_resources_output
  ?next_token:(next_token_ : string option)
  ~provisioned_resources:(provisioned_resources_ : provisioned_resource list)
  () =
  ({ provisioned_resources = provisioned_resources_; next_token = next_token_
   } : list_environment_provisioned_resources_output)
let make_list_environment_provisioned_resources_input
  ?next_token:(next_token_ : string option)
  ~environment_name:(environment_name_ : string) () =
  ({ next_token = next_token_; environment_name = environment_name_ } : 
  list_environment_provisioned_resources_input)
let make_list_environment_outputs_output
  ?next_token:(next_token_ : string option) ~outputs:(outputs_ : output list)
  () =
  ({ outputs = outputs_; next_token = next_token_ } : list_environment_outputs_output)
let make_list_environment_outputs_input
  ?deployment_id:(deployment_id_ : string option)
  ?next_token:(next_token_ : string option)
  ~environment_name:(environment_name_ : string) () =
  ({
     deployment_id = deployment_id_;
     next_token = next_token_;
     environment_name = environment_name_
   } : list_environment_outputs_input)
let make_environment_account_connection_summary
  ?component_role_arn:(component_role_arn_ : string option)
  ~status:(status_ : environment_account_connection_status)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~requested_at:(requested_at_ : CoreTypes.Timestamp.t)
  ~environment_name:(environment_name_ : string)
  ~role_arn:(role_arn_ : string)
  ~environment_account_id:(environment_account_id_ : string)
  ~management_account_id:(management_account_id_ : string)
  ~arn:(arn_ : string) ~id:(id_ : string) () =
  ({
     component_role_arn = component_role_arn_;
     status = status_;
     last_modified_at = last_modified_at_;
     requested_at = requested_at_;
     environment_name = environment_name_;
     role_arn = role_arn_;
     environment_account_id = environment_account_id_;
     management_account_id = management_account_id_;
     arn = arn_;
     id = id_
   } : environment_account_connection_summary)
let make_list_environment_account_connections_output
  ?next_token:(next_token_ : string option)
  ~environment_account_connections:(environment_account_connections_ :
                                     environment_account_connection_summary
                                       list)
  () =
  ({
     next_token = next_token_;
     environment_account_connections = environment_account_connections_
   } : list_environment_account_connections_output)
let make_list_environment_account_connections_input
  ?max_results:(max_results_ : int option)
  ?next_token:(next_token_ : string option)
  ?statuses:(statuses_ : environment_account_connection_status list option)
  ?environment_name:(environment_name_ : string option)
  ~requested_by:(requested_by_ :
                  environment_account_connection_requester_account_type)
  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     statuses = statuses_;
     environment_name = environment_name_;
     requested_by = requested_by_
   } : list_environment_account_connections_input)
let make_deployment_summary
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?component_name:(component_name_ : string option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ?completed_at:(completed_at_ : CoreTypes.Timestamp.t option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~environment_name:(environment_name_ : string)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)
  ~target_resource_type:(target_resource_type_ :
                          deployment_target_resource_type)
  ~target_resource_created_at:(target_resource_created_at_ :
                                CoreTypes.Timestamp.t)
  ~target_arn:(target_arn_ : string) ~arn:(arn_ : string) ~id:(id_ : string)
  () =
  ({
     deployment_status = deployment_status_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     component_name = component_name_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     environment_name = environment_name_;
     completed_at = completed_at_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     target_resource_type = target_resource_type_;
     target_resource_created_at = target_resource_created_at_;
     target_arn = target_arn_;
     arn = arn_;
     id = id_
   } : deployment_summary)
let make_list_deployments_output ?next_token:(next_token_ : string option)
  ~deployments:(deployments_ : deployment_summary list) () =
  ({ deployments = deployments_; next_token = next_token_ } : list_deployments_output)
let make_list_deployments_input ?max_results:(max_results_ : int option)
  ?component_name:(component_name_ : string option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ?environment_name:(environment_name_ : string option)
  ?next_token:(next_token_ : string option) () =
  ({
     max_results = max_results_;
     component_name = component_name_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     environment_name = environment_name_;
     next_token = next_token_
   } : list_deployments_input)
let make_component_summary
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ?last_deployment_succeeded_at:(last_deployment_succeeded_at_ :
                                  CoreTypes.Timestamp.t option)
  ?last_deployment_attempted_at:(last_deployment_attempted_at_ :
                                  CoreTypes.Timestamp.t option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)
  ~environment_name:(environment_name_ : string) ~arn:(arn_ : string)
  ~name:(name_ : string) () =
  ({
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     last_deployment_succeeded_at = last_deployment_succeeded_at_;
     last_deployment_attempted_at = last_deployment_attempted_at_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     environment_name = environment_name_;
     arn = arn_;
     name = name_
   } : component_summary)
let make_list_components_output ?next_token:(next_token_ : string option)
  ~components:(components_ : component_summary list) () =
  ({ components = components_; next_token = next_token_ } : list_components_output)
let make_list_components_input ?max_results:(max_results_ : int option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ?environment_name:(environment_name_ : string option)
  ?next_token:(next_token_ : string option) () =
  ({
     max_results = max_results_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     environment_name = environment_name_;
     next_token = next_token_
   } : list_components_input)
let make_list_component_provisioned_resources_output
  ?next_token:(next_token_ : string option)
  ~provisioned_resources:(provisioned_resources_ : provisioned_resource list)
  () =
  ({ provisioned_resources = provisioned_resources_; next_token = next_token_
   } : list_component_provisioned_resources_output)
let make_list_component_provisioned_resources_input
  ?next_token:(next_token_ : string option)
  ~component_name:(component_name_ : string) () =
  ({ next_token = next_token_; component_name = component_name_ } : list_component_provisioned_resources_input)
let make_list_component_outputs_output
  ?next_token:(next_token_ : string option) ~outputs:(outputs_ : output list)
  () =
  ({ outputs = outputs_; next_token = next_token_ } : list_component_outputs_output)
let make_list_component_outputs_input
  ?deployment_id:(deployment_id_ : string option)
  ?next_token:(next_token_ : string option)
  ~component_name:(component_name_ : string) () =
  ({
     deployment_id = deployment_id_;
     next_token = next_token_;
     component_name = component_name_
   } : list_component_outputs_input)
let make_get_template_sync_status_output
  ?desired_state:(desired_state_ : revision option)
  ?latest_successful_sync:(latest_successful_sync_ :
                            resource_sync_attempt option)
  ?latest_sync:(latest_sync_ : resource_sync_attempt option) () =
  ({
     desired_state = desired_state_;
     latest_successful_sync = latest_successful_sync_;
     latest_sync = latest_sync_
   } : get_template_sync_status_output)
let make_get_template_sync_status_input
  ~template_version:(template_version_ : string)
  ~template_type:(template_type_ : template_type)
  ~template_name:(template_name_ : string) () =
  ({
     template_version = template_version_;
     template_type = template_type_;
     template_name = template_name_
   } : get_template_sync_status_input)
let make_get_template_sync_config_output
  ?template_sync_config:(template_sync_config_ : template_sync_config option)
  () =
  ({ template_sync_config = template_sync_config_ } : get_template_sync_config_output)
let make_get_template_sync_config_input
  ~template_type:(template_type_ : template_type)
  ~template_name:(template_name_ : string) () =
  ({ template_type = template_type_; template_name = template_name_ } : 
  get_template_sync_config_input)
let make_get_service_template_version_output
  ~service_template_version:(service_template_version_ :
                              service_template_version)
  () =
  ({ service_template_version = service_template_version_ } : get_service_template_version_output)
let make_get_service_template_version_input
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : get_service_template_version_input)
let make_get_service_template_output
  ~service_template:(service_template_ : service_template) () =
  ({ service_template = service_template_ } : get_service_template_output)
let make_get_service_template_input ~name:(name_ : string) () =
  ({ name = name_ } : get_service_template_input)
let make_get_service_sync_config_output
  ?service_sync_config:(service_sync_config_ : service_sync_config option) ()
  =
  ({ service_sync_config = service_sync_config_ } : get_service_sync_config_output)
let make_get_service_sync_config_input ~service_name:(service_name_ : string)
  () = ({ service_name = service_name_ } : get_service_sync_config_input)
let make_get_service_sync_blocker_summary_output
  ?service_sync_blocker_summary:(service_sync_blocker_summary_ :
                                  service_sync_blocker_summary option)
  () =
  ({ service_sync_blocker_summary = service_sync_blocker_summary_ } : 
  get_service_sync_blocker_summary_output)
let make_get_service_sync_blocker_summary_input
  ?service_instance_name:(service_instance_name_ : string option)
  ~service_name:(service_name_ : string) () =
  ({
     service_instance_name = service_instance_name_;
     service_name = service_name_
   } : get_service_sync_blocker_summary_input)
let make_get_service_output ?service:(service_ : service option) () =
  ({ service = service_ } : get_service_output)
let make_get_service_instance_sync_status_output
  ?desired_state:(desired_state_ : revision option)
  ?latest_successful_sync:(latest_successful_sync_ :
                            resource_sync_attempt option)
  ?latest_sync:(latest_sync_ : resource_sync_attempt option) () =
  ({
     desired_state = desired_state_;
     latest_successful_sync = latest_successful_sync_;
     latest_sync = latest_sync_
   } : get_service_instance_sync_status_output)
let make_get_service_instance_sync_status_input
  ~service_instance_name:(service_instance_name_ : string)
  ~service_name:(service_name_ : string) () =
  ({
     service_instance_name = service_instance_name_;
     service_name = service_name_
   } : get_service_instance_sync_status_input)
let make_get_service_instance_output
  ~service_instance:(service_instance_ : service_instance) () =
  ({ service_instance = service_instance_ } : get_service_instance_output)
let make_get_service_instance_input ~service_name:(service_name_ : string)
  ~name:(name_ : string) () =
  ({ service_name = service_name_; name = name_ } : get_service_instance_input)
let make_get_service_input ~name:(name_ : string) () =
  ({ name = name_ } : get_service_input)
let make_counts_summary
  ?pipelines:(pipelines_ : resource_counts_summary option)
  ?service_templates:(service_templates_ : resource_counts_summary option)
  ?services:(services_ : resource_counts_summary option)
  ?service_instances:(service_instances_ : resource_counts_summary option)
  ?environment_templates:(environment_templates_ :
                           resource_counts_summary option)
  ?environments:(environments_ : resource_counts_summary option)
  ?components:(components_ : resource_counts_summary option) () =
  ({
     pipelines = pipelines_;
     service_templates = service_templates_;
     services = services_;
     service_instances = service_instances_;
     environment_templates = environment_templates_;
     environments = environments_;
     components = components_
   } : counts_summary)
let make_get_resources_summary_output ~counts:(counts_ : counts_summary) () =
  ({ counts = counts_ } : get_resources_summary_output)
let make_get_resources_summary_input () = (() : unit)
let make_get_repository_sync_status_output
  ?latest_sync:(latest_sync_ : repository_sync_attempt option) () =
  ({ latest_sync = latest_sync_ } : get_repository_sync_status_output)
let make_get_repository_sync_status_input ~sync_type:(sync_type_ : sync_type)
  ~branch:(branch_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~repository_name:(repository_name_ : string) () =
  ({
     sync_type = sync_type_;
     branch = branch_;
     repository_provider = repository_provider_;
     repository_name = repository_name_
   } : get_repository_sync_status_input)
let make_get_repository_output ~repository:(repository_ : repository) () =
  ({ repository = repository_ } : get_repository_output)
let make_get_repository_input ~name:(name_ : string)
  ~provider:(provider_ : repository_provider) () =
  ({ name = name_; provider = provider_ } : get_repository_input)
let make_get_environment_template_version_output
  ~environment_template_version:(environment_template_version_ :
                                  environment_template_version)
  () =
  ({ environment_template_version = environment_template_version_ } : 
  get_environment_template_version_output)
let make_get_environment_template_version_input
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : get_environment_template_version_input)
let make_get_environment_template_output
  ~environment_template:(environment_template_ : environment_template) () =
  ({ environment_template = environment_template_ } : get_environment_template_output)
let make_get_environment_template_input ~name:(name_ : string) () =
  ({ name = name_ } : get_environment_template_input)
let make_get_environment_output ~environment:(environment_ : environment) ()
  = ({ environment = environment_ } : get_environment_output)
let make_get_environment_input ~name:(name_ : string) () =
  ({ name = name_ } : get_environment_input)
let make_get_environment_account_connection_output
  ~environment_account_connection:(environment_account_connection_ :
                                    environment_account_connection)
  () =
  ({ environment_account_connection = environment_account_connection_ } : 
  get_environment_account_connection_output)
let make_get_environment_account_connection_input ~id:(id_ : string) () =
  ({ id = id_ } : get_environment_account_connection_input)
let make_environment_state ?spec:(spec_ : string option)
  ~template_minor_version:(template_minor_version_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     spec = spec_
   } : environment_state)
let make_component_state ?template_file:(template_file_ : string option)
  ?service_spec:(service_spec_ : string option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option) () =
  ({
     template_file = template_file_;
     service_spec = service_spec_;
     service_instance_name = service_instance_name_;
     service_name = service_name_
   } : component_state)
let make_deployment ?target_state:(target_state_ : deployment_state option)
  ?initial_state:(initial_state_ : deployment_state option)
  ?last_succeeded_deployment_id:(last_succeeded_deployment_id_ :
                                  string option)
  ?last_attempted_deployment_id:(last_attempted_deployment_id_ :
                                  string option)
  ?completed_at:(completed_at_ : CoreTypes.Timestamp.t option)
  ?deployment_status_message:(deployment_status_message_ : string option)
  ?component_name:(component_name_ : string option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ~last_modified_at:(last_modified_at_ : CoreTypes.Timestamp.t)
  ~created_at:(created_at_ : CoreTypes.Timestamp.t)
  ~deployment_status:(deployment_status_ : deployment_status)
  ~environment_name:(environment_name_ : string)
  ~target_resource_type:(target_resource_type_ :
                          deployment_target_resource_type)
  ~target_resource_created_at:(target_resource_created_at_ :
                                CoreTypes.Timestamp.t)
  ~target_arn:(target_arn_ : string) ~arn:(arn_ : string) ~id:(id_ : string)
  () =
  ({
     target_state = target_state_;
     initial_state = initial_state_;
     last_succeeded_deployment_id = last_succeeded_deployment_id_;
     last_attempted_deployment_id = last_attempted_deployment_id_;
     completed_at = completed_at_;
     last_modified_at = last_modified_at_;
     created_at = created_at_;
     deployment_status_message = deployment_status_message_;
     deployment_status = deployment_status_;
     component_name = component_name_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     environment_name = environment_name_;
     target_resource_type = target_resource_type_;
     target_resource_created_at = target_resource_created_at_;
     target_arn = target_arn_;
     arn = arn_;
     id = id_
   } : deployment)
let make_get_deployment_output ?deployment:(deployment_ : deployment option)
  () = ({ deployment = deployment_ } : get_deployment_output)
let make_get_deployment_input
  ?component_name:(component_name_ : string option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ?environment_name:(environment_name_ : string option) ~id:(id_ : string) ()
  =
  ({
     component_name = component_name_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     environment_name = environment_name_;
     id = id_
   } : get_deployment_input)
let make_get_component_output ?component:(component_ : component option) () =
  ({ component = component_ } : get_component_output)
let make_get_component_input ~name:(name_ : string) () =
  ({ name = name_ } : get_component_input)
let make_get_account_settings_output
  ?account_settings:(account_settings_ : account_settings option) () =
  ({ account_settings = account_settings_ } : get_account_settings_output)
let make_get_account_settings_input () = (() : unit)
let make_delete_template_sync_config_output
  ?template_sync_config:(template_sync_config_ : template_sync_config option)
  () =
  ({ template_sync_config = template_sync_config_ } : delete_template_sync_config_output)
let make_delete_template_sync_config_input
  ~template_type:(template_type_ : template_type)
  ~template_name:(template_name_ : string) () =
  ({ template_type = template_type_; template_name = template_name_ } : 
  delete_template_sync_config_input)
let make_delete_service_template_version_output
  ?service_template_version:(service_template_version_ :
                              service_template_version option)
  () =
  ({ service_template_version = service_template_version_ } : delete_service_template_version_output)
let make_delete_service_template_version_input
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : delete_service_template_version_input)
let make_delete_service_template_output
  ?service_template:(service_template_ : service_template option) () =
  ({ service_template = service_template_ } : delete_service_template_output)
let make_delete_service_template_input ~name:(name_ : string) () =
  ({ name = name_ } : delete_service_template_input)
let make_delete_service_sync_config_output
  ?service_sync_config:(service_sync_config_ : service_sync_config option) ()
  =
  ({ service_sync_config = service_sync_config_ } : delete_service_sync_config_output)
let make_delete_service_sync_config_input
  ~service_name:(service_name_ : string) () =
  ({ service_name = service_name_ } : delete_service_sync_config_input)
let make_delete_service_output ?service:(service_ : service option) () =
  ({ service = service_ } : delete_service_output)
let make_delete_service_input ~name:(name_ : string) () =
  ({ name = name_ } : delete_service_input)
let make_delete_repository_output
  ?repository:(repository_ : repository option) () =
  ({ repository = repository_ } : delete_repository_output)
let make_delete_repository_input ~name:(name_ : string)
  ~provider:(provider_ : repository_provider) () =
  ({ name = name_; provider = provider_ } : delete_repository_input)
let make_delete_environment_template_version_output
  ?environment_template_version:(environment_template_version_ :
                                  environment_template_version option)
  () =
  ({ environment_template_version = environment_template_version_ } : 
  delete_environment_template_version_output)
let make_delete_environment_template_version_input
  ~minor_version:(minor_version_ : string)
  ~major_version:(major_version_ : string)
  ~template_name:(template_name_ : string) () =
  ({
     minor_version = minor_version_;
     major_version = major_version_;
     template_name = template_name_
   } : delete_environment_template_version_input)
let make_delete_environment_template_output
  ?environment_template:(environment_template_ : environment_template option)
  () =
  ({ environment_template = environment_template_ } : delete_environment_template_output)
let make_delete_environment_template_input ~name:(name_ : string) () =
  ({ name = name_ } : delete_environment_template_input)
let make_delete_environment_output
  ?environment:(environment_ : environment option) () =
  ({ environment = environment_ } : delete_environment_output)
let make_delete_environment_input ~name:(name_ : string) () =
  ({ name = name_ } : delete_environment_input)
let make_delete_environment_account_connection_output
  ?environment_account_connection:(environment_account_connection_ :
                                    environment_account_connection option)
  () =
  ({ environment_account_connection = environment_account_connection_ } : 
  delete_environment_account_connection_output)
let make_delete_environment_account_connection_input ~id:(id_ : string) () =
  ({ id = id_ } : delete_environment_account_connection_input)
let make_delete_deployment_output
  ?deployment:(deployment_ : deployment option) () =
  ({ deployment = deployment_ } : delete_deployment_output)
let make_delete_deployment_input ~id:(id_ : string) () =
  ({ id = id_ } : delete_deployment_input)
let make_delete_component_output ?component:(component_ : component option)
  () = ({ component = component_ } : delete_component_output)
let make_delete_component_input ~name:(name_ : string) () =
  ({ name = name_ } : delete_component_input)
let make_create_template_sync_config_output
  ?template_sync_config:(template_sync_config_ : template_sync_config option)
  () =
  ({ template_sync_config = template_sync_config_ } : create_template_sync_config_output)
let make_create_template_sync_config_input
  ?subdirectory:(subdirectory_ : string option) ~branch:(branch_ : string)
  ~repository_name:(repository_name_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~template_type:(template_type_ : template_type)
  ~template_name:(template_name_ : string) () =
  ({
     subdirectory = subdirectory_;
     branch = branch_;
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     template_type = template_type_;
     template_name = template_name_
   } : create_template_sync_config_input)
let make_create_service_template_version_output
  ~service_template_version:(service_template_version_ :
                              service_template_version)
  () =
  ({ service_template_version = service_template_version_ } : create_service_template_version_output)
let make_create_service_template_version_input
  ?supported_component_sources:(supported_component_sources_ :
                                 service_template_supported_component_source_type
                                   list option)
  ?tags:(tags_ : tag list option)
  ?major_version:(major_version_ : string option)
  ?description:(description_ : string option)
  ?client_token:(client_token_ : string option)
  ~compatible_environment_templates:(compatible_environment_templates_ :
                                      compatible_environment_template_input
                                        list)
  ~source:(source_ : template_version_source_input)
  ~template_name:(template_name_ : string) () =
  ({
     supported_component_sources = supported_component_sources_;
     tags = tags_;
     compatible_environment_templates = compatible_environment_templates_;
     source = source_;
     major_version = major_version_;
     description = description_;
     template_name = template_name_;
     client_token = client_token_
   } : create_service_template_version_input)
let make_create_service_template_output
  ~service_template:(service_template_ : service_template) () =
  ({ service_template = service_template_ } : create_service_template_output)
let make_create_service_template_input ?tags:(tags_ : tag list option)
  ?pipeline_provisioning:(pipeline_provisioning_ : provisioning option)
  ?encryption_key:(encryption_key_ : string option)
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option) ~name:(name_ : string) () =
  ({
     tags = tags_;
     pipeline_provisioning = pipeline_provisioning_;
     encryption_key = encryption_key_;
     description = description_;
     display_name = display_name_;
     name = name_
   } : create_service_template_input)
let make_create_service_sync_config_output
  ?service_sync_config:(service_sync_config_ : service_sync_config option) ()
  =
  ({ service_sync_config = service_sync_config_ } : create_service_sync_config_output)
let make_create_service_sync_config_input ~file_path:(file_path_ : string)
  ~branch:(branch_ : string) ~repository_name:(repository_name_ : string)
  ~repository_provider:(repository_provider_ : repository_provider)
  ~service_name:(service_name_ : string) () =
  ({
     file_path = file_path_;
     branch = branch_;
     repository_name = repository_name_;
     repository_provider = repository_provider_;
     service_name = service_name_
   } : create_service_sync_config_input)
let make_create_service_output ~service:(service_ : service) () =
  ({ service = service_ } : create_service_output)
let make_create_service_instance_output
  ~service_instance:(service_instance_ : service_instance) () =
  ({ service_instance = service_instance_ } : create_service_instance_output)
let make_create_service_instance_input
  ?client_token:(client_token_ : string option)
  ?tags:(tags_ : tag list option)
  ?template_minor_version:(template_minor_version_ : string option)
  ?template_major_version:(template_major_version_ : string option)
  ~spec:(spec_ : string) ~service_name:(service_name_ : string)
  ~name:(name_ : string) () =
  ({
     client_token = client_token_;
     tags = tags_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     spec = spec_;
     service_name = service_name_;
     name = name_
   } : create_service_instance_input)
let make_create_service_input ?tags:(tags_ : tag list option)
  ?branch_name:(branch_name_ : string option)
  ?repository_id:(repository_id_ : string option)
  ?repository_connection_arn:(repository_connection_arn_ : string option)
  ?template_minor_version:(template_minor_version_ : string option)
  ?description:(description_ : string option) ~spec:(spec_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string) ~name:(name_ : string) () =
  ({
     tags = tags_;
     branch_name = branch_name_;
     repository_id = repository_id_;
     repository_connection_arn = repository_connection_arn_;
     spec = spec_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     description = description_;
     name = name_
   } : create_service_input)
let make_create_repository_output ~repository:(repository_ : repository) () =
  ({ repository = repository_ } : create_repository_output)
let make_create_repository_input ?tags:(tags_ : tag list option)
  ?encryption_key:(encryption_key_ : string option)
  ~connection_arn:(connection_arn_ : string) ~name:(name_ : string)
  ~provider:(provider_ : repository_provider) () =
  ({
     tags = tags_;
     encryption_key = encryption_key_;
     connection_arn = connection_arn_;
     name = name_;
     provider = provider_
   } : create_repository_input)
let make_create_environment_template_version_output
  ~environment_template_version:(environment_template_version_ :
                                  environment_template_version)
  () =
  ({ environment_template_version = environment_template_version_ } : 
  create_environment_template_version_output)
let make_create_environment_template_version_input
  ?tags:(tags_ : tag list option)
  ?major_version:(major_version_ : string option)
  ?description:(description_ : string option)
  ?client_token:(client_token_ : string option)
  ~source:(source_ : template_version_source_input)
  ~template_name:(template_name_ : string) () =
  ({
     tags = tags_;
     source = source_;
     major_version = major_version_;
     description = description_;
     template_name = template_name_;
     client_token = client_token_
   } : create_environment_template_version_input)
let make_create_environment_template_output
  ~environment_template:(environment_template_ : environment_template) () =
  ({ environment_template = environment_template_ } : create_environment_template_output)
let make_create_environment_template_input ?tags:(tags_ : tag list option)
  ?provisioning:(provisioning_ : provisioning option)
  ?encryption_key:(encryption_key_ : string option)
  ?description:(description_ : string option)
  ?display_name:(display_name_ : string option) ~name:(name_ : string) () =
  ({
     tags = tags_;
     provisioning = provisioning_;
     encryption_key = encryption_key_;
     description = description_;
     display_name = display_name_;
     name = name_
   } : create_environment_template_input)
let make_create_environment_output ~environment:(environment_ : environment)
  () = ({ environment = environment_ } : create_environment_output)
let make_create_environment_input
  ?codebuild_role_arn:(codebuild_role_arn_ : string option)
  ?component_role_arn:(component_role_arn_ : string option)
  ?provisioning_repository:(provisioning_repository_ :
                             repository_branch_input option)
  ?tags:(tags_ : tag list option)
  ?environment_account_connection_id:(environment_account_connection_id_ :
                                       string option)
  ?proton_service_role_arn:(proton_service_role_arn_ : string option)
  ?description:(description_ : string option)
  ?template_minor_version:(template_minor_version_ : string option)
  ~spec:(spec_ : string)
  ~template_major_version:(template_major_version_ : string)
  ~template_name:(template_name_ : string) ~name:(name_ : string) () =
  ({
     codebuild_role_arn = codebuild_role_arn_;
     component_role_arn = component_role_arn_;
     provisioning_repository = provisioning_repository_;
     tags = tags_;
     environment_account_connection_id = environment_account_connection_id_;
     proton_service_role_arn = proton_service_role_arn_;
     spec = spec_;
     description = description_;
     template_minor_version = template_minor_version_;
     template_major_version = template_major_version_;
     template_name = template_name_;
     name = name_
   } : create_environment_input)
let make_create_environment_account_connection_output
  ~environment_account_connection:(environment_account_connection_ :
                                    environment_account_connection)
  () =
  ({ environment_account_connection = environment_account_connection_ } : 
  create_environment_account_connection_output)
let make_create_environment_account_connection_input
  ?codebuild_role_arn:(codebuild_role_arn_ : string option)
  ?component_role_arn:(component_role_arn_ : string option)
  ?tags:(tags_ : tag list option) ?role_arn:(role_arn_ : string option)
  ?client_token:(client_token_ : string option)
  ~environment_name:(environment_name_ : string)
  ~management_account_id:(management_account_id_ : string) () =
  ({
     codebuild_role_arn = codebuild_role_arn_;
     component_role_arn = component_role_arn_;
     tags = tags_;
     environment_name = environment_name_;
     role_arn = role_arn_;
     management_account_id = management_account_id_;
     client_token = client_token_
   } : create_environment_account_connection_input)
let make_create_component_output ~component:(component_ : component) () =
  ({ component = component_ } : create_component_output)
let make_create_component_input ?client_token:(client_token_ : string option)
  ?tags:(tags_ : tag list option)
  ?service_spec:(service_spec_ : string option)
  ?environment_name:(environment_name_ : string option)
  ?service_instance_name:(service_instance_name_ : string option)
  ?service_name:(service_name_ : string option)
  ?description:(description_ : string option) ~manifest:(manifest_ : string)
  ~template_file:(template_file_ : string) ~name:(name_ : string) () =
  ({
     client_token = client_token_;
     tags = tags_;
     service_spec = service_spec_;
     manifest = manifest_;
     template_file = template_file_;
     environment_name = environment_name_;
     service_instance_name = service_instance_name_;
     service_name = service_name_;
     description = description_;
     name = name_
   } : create_component_input)
let make_cancel_service_pipeline_deployment_output
  ~pipeline:(pipeline_ : service_pipeline) () =
  ({ pipeline = pipeline_ } : cancel_service_pipeline_deployment_output)
let make_cancel_service_pipeline_deployment_input
  ~service_name:(service_name_ : string) () =
  ({ service_name = service_name_ } : cancel_service_pipeline_deployment_input)
let make_cancel_service_instance_deployment_output
  ~service_instance:(service_instance_ : service_instance) () =
  ({ service_instance = service_instance_ } : cancel_service_instance_deployment_output)
let make_cancel_service_instance_deployment_input
  ~service_name:(service_name_ : string)
  ~service_instance_name:(service_instance_name_ : string) () =
  ({
     service_name = service_name_;
     service_instance_name = service_instance_name_
   } : cancel_service_instance_deployment_input)
let make_cancel_environment_deployment_output
  ~environment:(environment_ : environment) () =
  ({ environment = environment_ } : cancel_environment_deployment_output)
let make_cancel_environment_deployment_input
  ~environment_name:(environment_name_ : string) () =
  ({ environment_name = environment_name_ } : cancel_environment_deployment_input)
let make_cancel_component_deployment_output
  ~component:(component_ : component) () =
  ({ component = component_ } : cancel_component_deployment_output)
let make_cancel_component_deployment_input
  ~component_name:(component_name_ : string) () =
  ({ component_name = component_name_ } : cancel_component_deployment_input)
let make_accept_environment_account_connection_output
  ~environment_account_connection:(environment_account_connection_ :
                                    environment_account_connection)
  () =
  ({ environment_account_connection = environment_account_connection_ } : 
  accept_environment_account_connection_output)
let make_accept_environment_account_connection_input ~id:(id_ : string) () =
  ({ id = id_ } : accept_environment_account_connection_input)