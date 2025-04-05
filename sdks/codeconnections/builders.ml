open Smaws_Lib
open Types
let make_vpc_configuration
  ?tls_certificate:(tls_certificate_ : string option) 
  ~security_group_ids:(security_group_ids_ : string list) 
  ~subnet_ids:(subnet_ids_ : string list)  ~vpc_id:(vpc_id_ : string)  () =
  ({
     tls_certificate = tls_certificate_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_
   } : vpc_configuration)
let make_sync_configuration
  ?trigger_resource_update_on:(trigger_resource_update_on_ :
                                trigger_resource_update_on option)
   ?publish_deployment_status:(publish_deployment_status_ :
                                publish_deployment_status option)
   ?config_file:(config_file_ : string option) 
  ~sync_type:(sync_type_ : sync_configuration_type) 
  ~role_arn:(role_arn_ : string)  ~resource_name:(resource_name_ : string) 
  ~repository_name:(repository_name_ : string) 
  ~repository_link_id:(repository_link_id_ : string) 
  ~provider_type:(provider_type_ : provider_type) 
  ~owner_id:(owner_id_ : string)  ~branch:(branch_ : string)  () =
  ({
     trigger_resource_update_on = trigger_resource_update_on_;
     publish_deployment_status = publish_deployment_status_;
     sync_type = sync_type_;
     role_arn = role_arn_;
     resource_name = resource_name_;
     repository_name = repository_name_;
     repository_link_id = repository_link_id_;
     provider_type = provider_type_;
     owner_id = owner_id_;
     config_file = config_file_;
     branch = branch_
   } : sync_configuration)
let make_update_sync_configuration_output
  ~sync_configuration:(sync_configuration_ : sync_configuration)  () =
  ({ sync_configuration = sync_configuration_ } : update_sync_configuration_output)
let make_update_sync_configuration_input
  ?trigger_resource_update_on:(trigger_resource_update_on_ :
                                trigger_resource_update_on option)
   ?publish_deployment_status:(publish_deployment_status_ :
                                publish_deployment_status option)
   ?role_arn:(role_arn_ : string option) 
  ?repository_link_id:(repository_link_id_ : string option) 
  ?config_file:(config_file_ : string option) 
  ?branch:(branch_ : string option) 
  ~sync_type:(sync_type_ : sync_configuration_type) 
  ~resource_name:(resource_name_ : string)  () =
  ({
     trigger_resource_update_on = trigger_resource_update_on_;
     publish_deployment_status = publish_deployment_status_;
     sync_type = sync_type_;
     role_arn = role_arn_;
     resource_name = resource_name_;
     repository_link_id = repository_link_id_;
     config_file = config_file_;
     branch = branch_
   } : update_sync_configuration_input)
let make_sync_blocker_context ~value:(value_ : string)  ~key:(key_ : string) 
  () = ({ value = value_; key = key_ } : sync_blocker_context)
let make_sync_blocker
  ?resolved_at:(resolved_at_ : CoreTypes.Timestamp.t option) 
  ?resolved_reason:(resolved_reason_ : string option) 
  ?contexts:(contexts_ : sync_blocker_context list option) 
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) 
  ~created_reason:(created_reason_ : string) 
  ~status:(status_ : blocker_status)  ~type_:(type__ : blocker_type) 
  ~id:(id_ : string)  () =
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
let make_update_sync_blocker_output
  ?parent_resource_name:(parent_resource_name_ : string option) 
  ~sync_blocker:(sync_blocker_ : sync_blocker) 
  ~resource_name:(resource_name_ : string)  () =
  ({
     sync_blocker = sync_blocker_;
     parent_resource_name = parent_resource_name_;
     resource_name = resource_name_
   } : update_sync_blocker_output)
let make_update_sync_blocker_input
  ~resolved_reason:(resolved_reason_ : string) 
  ~resource_name:(resource_name_ : string) 
  ~sync_type:(sync_type_ : sync_configuration_type)  ~id:(id_ : string)  () =
  ({
     resolved_reason = resolved_reason_;
     resource_name = resource_name_;
     sync_type = sync_type_;
     id = id_
   } : update_sync_blocker_input)
let make_repository_link_info
  ?encryption_key_arn:(encryption_key_arn_ : string option) 
  ~repository_name:(repository_name_ : string) 
  ~repository_link_id:(repository_link_id_ : string) 
  ~repository_link_arn:(repository_link_arn_ : string) 
  ~provider_type:(provider_type_ : provider_type) 
  ~owner_id:(owner_id_ : string)  ~connection_arn:(connection_arn_ : string) 
  () =
  ({
     repository_name = repository_name_;
     repository_link_id = repository_link_id_;
     repository_link_arn = repository_link_arn_;
     provider_type = provider_type_;
     owner_id = owner_id_;
     encryption_key_arn = encryption_key_arn_;
     connection_arn = connection_arn_
   } : repository_link_info)
let make_update_repository_link_output
  ~repository_link_info:(repository_link_info_ : repository_link_info)  () =
  ({ repository_link_info = repository_link_info_ } : update_repository_link_output)
let make_update_repository_link_input
  ?encryption_key_arn:(encryption_key_arn_ : string option) 
  ?connection_arn:(connection_arn_ : string option) 
  ~repository_link_id:(repository_link_id_ : string)  () =
  ({
     repository_link_id = repository_link_id_;
     encryption_key_arn = encryption_key_arn_;
     connection_arn = connection_arn_
   } : update_repository_link_input)
let make_update_host_output () = (() : update_host_output)
let make_update_host_input
  ?vpc_configuration:(vpc_configuration_ : vpc_configuration option) 
  ?provider_endpoint:(provider_endpoint_ : string option) 
  ~host_arn:(host_arn_ : string)  () =
  ({
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     host_arn = host_arn_
   } : update_host_input)
let make_untag_resource_output () = (() : untag_resource_output)
let make_untag_resource_input ~tag_keys:(tag_keys_ : string list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)
let make_tag_resource_output () = (() : tag_resource_output)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_input ~tags:(tags_ : tag list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)
let make_sync_blocker_summary
  ?latest_blockers:(latest_blockers_ : sync_blocker list option) 
  ?parent_resource_name:(parent_resource_name_ : string option) 
  ~resource_name:(resource_name_ : string)  () =
  ({
     latest_blockers = latest_blockers_;
     parent_resource_name = parent_resource_name_;
     resource_name = resource_name_
   } : sync_blocker_summary)
let make_revision ~sha:(sha_ : string) 
  ~provider_type:(provider_type_ : provider_type) 
  ~repository_name:(repository_name_ : string) 
  ~owner_id:(owner_id_ : string)  ~directory:(directory_ : string) 
  ~branch:(branch_ : string)  () =
  ({
     sha = sha_;
     provider_type = provider_type_;
     repository_name = repository_name_;
     owner_id = owner_id_;
     directory = directory_;
     branch = branch_
   } : revision)
let make_resource_sync_event ?external_id:(external_id_ : string option) 
  ~type_:(type__ : string)  ~time:(time_ : CoreTypes.Timestamp.t) 
  ~event:(event_ : string)  () =
  ({ type_ = type__; time = time_; external_id = external_id_; event = event_
   } : resource_sync_event)
let make_resource_sync_attempt ~target:(target_ : string) 
  ~target_revision:(target_revision_ : revision) 
  ~status:(status_ : resource_sync_status) 
  ~started_at:(started_at_ : CoreTypes.Timestamp.t) 
  ~initial_revision:(initial_revision_ : revision) 
  ~events:(events_ : resource_sync_event list)  () =
  ({
     target = target_;
     target_revision = target_revision_;
     status = status_;
     started_at = started_at_;
     initial_revision = initial_revision_;
     events = events_
   } : resource_sync_attempt)
let make_repository_sync_event ?external_id:(external_id_ : string option) 
  ~type_:(type__ : string)  ~time:(time_ : CoreTypes.Timestamp.t) 
  ~event:(event_ : string)  () =
  ({ type_ = type__; time = time_; external_id = external_id_; event = event_
   } : repository_sync_event)
let make_repository_sync_definition ~target:(target_ : string) 
  ~parent:(parent_ : string)  ~directory:(directory_ : string) 
  ~branch:(branch_ : string)  () =
  ({
     target = target_;
     parent = parent_;
     directory = directory_;
     branch = branch_
   } : repository_sync_definition)
let make_repository_sync_attempt
  ~events:(events_ : repository_sync_event list) 
  ~status:(status_ : repository_sync_status) 
  ~started_at:(started_at_ : CoreTypes.Timestamp.t)  () =
  ({ events = events_; status = status_; started_at = started_at_ } : 
  repository_sync_attempt)
let make_list_tags_for_resource_output ?tags:(tags_ : tag list option)  () =
  ({ tags = tags_ } : list_tags_for_resource_output)
let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : string) 
  () = ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)
let make_list_sync_configurations_output
  ?next_token:(next_token_ : string option) 
  ~sync_configurations:(sync_configurations_ : sync_configuration list)  () =
  ({ next_token = next_token_; sync_configurations = sync_configurations_ } : 
  list_sync_configurations_output)
let make_list_sync_configurations_input
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~sync_type:(sync_type_ : sync_configuration_type) 
  ~repository_link_id:(repository_link_id_ : string)  () =
  ({
     sync_type = sync_type_;
     repository_link_id = repository_link_id_;
     next_token = next_token_;
     max_results = max_results_
   } : list_sync_configurations_input)
let make_list_repository_sync_definitions_output
  ?next_token:(next_token_ : string option) 
  ~repository_sync_definitions:(repository_sync_definitions_ :
                                 repository_sync_definition list)
   () =
  ({
     next_token = next_token_;
     repository_sync_definitions = repository_sync_definitions_
   } : list_repository_sync_definitions_output)
let make_list_repository_sync_definitions_input
  ~sync_type:(sync_type_ : sync_configuration_type) 
  ~repository_link_id:(repository_link_id_ : string)  () =
  ({ sync_type = sync_type_; repository_link_id = repository_link_id_ } : 
  list_repository_sync_definitions_input)
let make_list_repository_links_output
  ?next_token:(next_token_ : string option) 
  ~repository_links:(repository_links_ : repository_link_info list)  () =
  ({ next_token = next_token_; repository_links = repository_links_ } : 
  list_repository_links_output)
let make_list_repository_links_input
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_repository_links_input)
let make_host ?status_message:(status_message_ : string option) 
  ?status:(status_ : string option) 
  ?vpc_configuration:(vpc_configuration_ : vpc_configuration option) 
  ?provider_endpoint:(provider_endpoint_ : string option) 
  ?provider_type:(provider_type_ : provider_type option) 
  ?host_arn:(host_arn_ : string option)  ?name:(name_ : string option)  () =
  ({
     status_message = status_message_;
     status = status_;
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     provider_type = provider_type_;
     host_arn = host_arn_;
     name = name_
   } : host)
let make_list_hosts_output ?next_token:(next_token_ : string option) 
  ?hosts:(hosts_ : host list option)  () =
  ({ next_token = next_token_; hosts = hosts_ } : list_hosts_output)
let make_list_hosts_input ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_hosts_input)
let make_connection ?host_arn:(host_arn_ : string option) 
  ?connection_status:(connection_status_ : connection_status option) 
  ?owner_account_id:(owner_account_id_ : string option) 
  ?provider_type:(provider_type_ : provider_type option) 
  ?connection_arn:(connection_arn_ : string option) 
  ?connection_name:(connection_name_ : string option)  () =
  ({
     host_arn = host_arn_;
     connection_status = connection_status_;
     owner_account_id = owner_account_id_;
     provider_type = provider_type_;
     connection_arn = connection_arn_;
     connection_name = connection_name_
   } : connection)
let make_list_connections_output ?next_token:(next_token_ : string option) 
  ?connections:(connections_ : connection list option)  () =
  ({ next_token = next_token_; connections = connections_ } : list_connections_output)
let make_list_connections_input ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?host_arn_filter:(host_arn_filter_ : string option) 
  ?provider_type_filter:(provider_type_filter_ : provider_type option)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     host_arn_filter = host_arn_filter_;
     provider_type_filter = provider_type_filter_
   } : list_connections_input)
let make_get_sync_configuration_output
  ~sync_configuration:(sync_configuration_ : sync_configuration)  () =
  ({ sync_configuration = sync_configuration_ } : get_sync_configuration_output)
let make_get_sync_configuration_input
  ~resource_name:(resource_name_ : string) 
  ~sync_type:(sync_type_ : sync_configuration_type)  () =
  ({ resource_name = resource_name_; sync_type = sync_type_ } : get_sync_configuration_input)
let make_get_sync_blocker_summary_output
  ~sync_blocker_summary:(sync_blocker_summary_ : sync_blocker_summary)  () =
  ({ sync_blocker_summary = sync_blocker_summary_ } : get_sync_blocker_summary_output)
let make_get_sync_blocker_summary_input
  ~resource_name:(resource_name_ : string) 
  ~sync_type:(sync_type_ : sync_configuration_type)  () =
  ({ resource_name = resource_name_; sync_type = sync_type_ } : get_sync_blocker_summary_input)
let make_get_resource_sync_status_output
  ?latest_successful_sync:(latest_successful_sync_ :
                            resource_sync_attempt option)
   ?desired_state:(desired_state_ : revision option) 
  ~latest_sync:(latest_sync_ : resource_sync_attempt)  () =
  ({
     latest_sync = latest_sync_;
     latest_successful_sync = latest_successful_sync_;
     desired_state = desired_state_
   } : get_resource_sync_status_output)
let make_get_resource_sync_status_input
  ~sync_type:(sync_type_ : sync_configuration_type) 
  ~resource_name:(resource_name_ : string)  () =
  ({ sync_type = sync_type_; resource_name = resource_name_ } : get_resource_sync_status_input)
let make_get_repository_sync_status_output
  ~latest_sync:(latest_sync_ : repository_sync_attempt)  () =
  ({ latest_sync = latest_sync_ } : get_repository_sync_status_output)
let make_get_repository_sync_status_input
  ~sync_type:(sync_type_ : sync_configuration_type) 
  ~repository_link_id:(repository_link_id_ : string) 
  ~branch:(branch_ : string)  () =
  ({
     sync_type = sync_type_;
     repository_link_id = repository_link_id_;
     branch = branch_
   } : get_repository_sync_status_input)
let make_get_repository_link_output
  ~repository_link_info:(repository_link_info_ : repository_link_info)  () =
  ({ repository_link_info = repository_link_info_ } : get_repository_link_output)
let make_get_repository_link_input
  ~repository_link_id:(repository_link_id_ : string)  () =
  ({ repository_link_id = repository_link_id_ } : get_repository_link_input)
let make_get_host_output
  ?vpc_configuration:(vpc_configuration_ : vpc_configuration option) 
  ?provider_endpoint:(provider_endpoint_ : string option) 
  ?provider_type:(provider_type_ : provider_type option) 
  ?status:(status_ : string option)  ?name:(name_ : string option)  () =
  ({
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     provider_type = provider_type_;
     status = status_;
     name = name_
   } : get_host_output)
let make_get_host_input ~host_arn:(host_arn_ : string)  () =
  ({ host_arn = host_arn_ } : get_host_input)
let make_get_connection_output ?connection:(connection_ : connection option) 
  () = ({ connection = connection_ } : get_connection_output)
let make_get_connection_input ~connection_arn:(connection_arn_ : string)  ()
  = ({ connection_arn = connection_arn_ } : get_connection_input)
let make_delete_sync_configuration_output () =
  (() : delete_sync_configuration_output)
let make_delete_sync_configuration_input
  ~resource_name:(resource_name_ : string) 
  ~sync_type:(sync_type_ : sync_configuration_type)  () =
  ({ resource_name = resource_name_; sync_type = sync_type_ } : delete_sync_configuration_input)
let make_delete_repository_link_output () =
  (() : delete_repository_link_output)
let make_delete_repository_link_input
  ~repository_link_id:(repository_link_id_ : string)  () =
  ({ repository_link_id = repository_link_id_ } : delete_repository_link_input)
let make_delete_host_output () = (() : delete_host_output)
let make_delete_host_input ~host_arn:(host_arn_ : string)  () =
  ({ host_arn = host_arn_ } : delete_host_input)
let make_delete_connection_output () = (() : delete_connection_output)
let make_delete_connection_input ~connection_arn:(connection_arn_ : string) 
  () = ({ connection_arn = connection_arn_ } : delete_connection_input)
let make_create_sync_configuration_output
  ~sync_configuration:(sync_configuration_ : sync_configuration)  () =
  ({ sync_configuration = sync_configuration_ } : create_sync_configuration_output)
let make_create_sync_configuration_input
  ?trigger_resource_update_on:(trigger_resource_update_on_ :
                                trigger_resource_update_on option)
   ?publish_deployment_status:(publish_deployment_status_ :
                                publish_deployment_status option)
   ~sync_type:(sync_type_ : sync_configuration_type) 
  ~role_arn:(role_arn_ : string)  ~resource_name:(resource_name_ : string) 
  ~repository_link_id:(repository_link_id_ : string) 
  ~config_file:(config_file_ : string)  ~branch:(branch_ : string)  () =
  ({
     trigger_resource_update_on = trigger_resource_update_on_;
     publish_deployment_status = publish_deployment_status_;
     sync_type = sync_type_;
     role_arn = role_arn_;
     resource_name = resource_name_;
     repository_link_id = repository_link_id_;
     config_file = config_file_;
     branch = branch_
   } : create_sync_configuration_input)
let make_create_repository_link_output
  ~repository_link_info:(repository_link_info_ : repository_link_info)  () =
  ({ repository_link_info = repository_link_info_ } : create_repository_link_output)
let make_create_repository_link_input ?tags:(tags_ : tag list option) 
  ?encryption_key_arn:(encryption_key_arn_ : string option) 
  ~repository_name:(repository_name_ : string) 
  ~owner_id:(owner_id_ : string)  ~connection_arn:(connection_arn_ : string) 
  () =
  ({
     tags = tags_;
     encryption_key_arn = encryption_key_arn_;
     repository_name = repository_name_;
     owner_id = owner_id_;
     connection_arn = connection_arn_
   } : create_repository_link_input)
let make_create_host_output ?tags:(tags_ : tag list option) 
  ?host_arn:(host_arn_ : string option)  () =
  ({ tags = tags_; host_arn = host_arn_ } : create_host_output)
let make_create_host_input ?tags:(tags_ : tag list option) 
  ?vpc_configuration:(vpc_configuration_ : vpc_configuration option) 
  ~provider_endpoint:(provider_endpoint_ : string) 
  ~provider_type:(provider_type_ : provider_type)  ~name:(name_ : string)  ()
  =
  ({
     tags = tags_;
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     provider_type = provider_type_;
     name = name_
   } : create_host_input)
let make_create_connection_output ?tags:(tags_ : tag list option) 
  ~connection_arn:(connection_arn_ : string)  () =
  ({ tags = tags_; connection_arn = connection_arn_ } : create_connection_output)
let make_create_connection_input ?host_arn:(host_arn_ : string option) 
  ?tags:(tags_ : tag list option) 
  ?provider_type:(provider_type_ : provider_type option) 
  ~connection_name:(connection_name_ : string)  () =
  ({
     host_arn = host_arn_;
     tags = tags_;
     connection_name = connection_name_;
     provider_type = provider_type_
   } : create_connection_input)