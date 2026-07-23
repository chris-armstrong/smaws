open Types

let make_sync_configuration ?config_file:(config_file_ : deployment_file_path option)
    ?publish_deployment_status:(publish_deployment_status_ : publish_deployment_status option)
    ?trigger_resource_update_on:(trigger_resource_update_on_ : trigger_resource_update_on option)
    ~branch:(branch_ : branch_name) ~owner_id:(owner_id_ : owner_id)
    ~provider_type:(provider_type_ : provider_type)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~repository_name:(repository_name_ : repository_name)
    ~resource_name:(resource_name_ : resource_name) ~role_arn:(role_arn_ : iam_role_arn)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({
     branch = branch_;
     config_file = config_file_;
     owner_id = owner_id_;
     provider_type = provider_type_;
     repository_link_id = repository_link_id_;
     repository_name = repository_name_;
     resource_name = resource_name_;
     role_arn = role_arn_;
     sync_type = sync_type_;
     publish_deployment_status = publish_deployment_status_;
     trigger_resource_update_on = trigger_resource_update_on_;
   }
    : sync_configuration)

let make_update_sync_configuration_output
    ~sync_configuration:(sync_configuration_ : sync_configuration) () =
  ({ sync_configuration = sync_configuration_ } : update_sync_configuration_output)

let make_update_sync_configuration_input ?branch:(branch_ : branch_name option)
    ?config_file:(config_file_ : deployment_file_path option)
    ?repository_link_id:(repository_link_id_ : repository_link_id option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?publish_deployment_status:(publish_deployment_status_ : publish_deployment_status option)
    ?trigger_resource_update_on:(trigger_resource_update_on_ : trigger_resource_update_on option)
    ~resource_name:(resource_name_ : resource_name)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({
     branch = branch_;
     config_file = config_file_;
     repository_link_id = repository_link_id_;
     resource_name = resource_name_;
     role_arn = role_arn_;
     sync_type = sync_type_;
     publish_deployment_status = publish_deployment_status_;
     trigger_resource_update_on = trigger_resource_update_on_;
   }
    : update_sync_configuration_input)

let make_sync_blocker_context ~key:(key_ : sync_blocker_context_key)
    ~value:(value_ : sync_blocker_context_value) () =
  ({ key = key_; value = value_ } : sync_blocker_context)

let make_sync_blocker ?contexts:(contexts_ : sync_blocker_context_list option)
    ?resolved_reason:(resolved_reason_ : resolved_reason option)
    ?resolved_at:(resolved_at_ : timestamp option) ~id:(id_ : id) ~type_:(type__ : blocker_type)
    ~status:(status_ : blocker_status) ~created_reason:(created_reason_ : created_reason)
    ~created_at:(created_at_ : timestamp) () =
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

let make_update_sync_blocker_output
    ?parent_resource_name:(parent_resource_name_ : resource_name option)
    ~resource_name:(resource_name_ : resource_name) ~sync_blocker:(sync_blocker_ : sync_blocker) ()
    =
  ({
     resource_name = resource_name_;
     parent_resource_name = parent_resource_name_;
     sync_blocker = sync_blocker_;
   }
    : update_sync_blocker_output)

let make_update_sync_blocker_input ~id:(id_ : id) ~sync_type:(sync_type_ : sync_configuration_type)
    ~resource_name:(resource_name_ : resource_name)
    ~resolved_reason:(resolved_reason_ : resolved_reason) () =
  ({
     id = id_;
     sync_type = sync_type_;
     resource_name = resource_name_;
     resolved_reason = resolved_reason_;
   }
    : update_sync_blocker_input)

let make_repository_link_info ?encryption_key_arn:(encryption_key_arn_ : kms_key_arn option)
    ~connection_arn:(connection_arn_ : connection_arn) ~owner_id:(owner_id_ : owner_id)
    ~provider_type:(provider_type_ : provider_type)
    ~repository_link_arn:(repository_link_arn_ : repository_link_arn)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~repository_name:(repository_name_ : repository_name) () =
  ({
     connection_arn = connection_arn_;
     encryption_key_arn = encryption_key_arn_;
     owner_id = owner_id_;
     provider_type = provider_type_;
     repository_link_arn = repository_link_arn_;
     repository_link_id = repository_link_id_;
     repository_name = repository_name_;
   }
    : repository_link_info)

let make_update_repository_link_output
    ~repository_link_info:(repository_link_info_ : repository_link_info) () =
  ({ repository_link_info = repository_link_info_ } : update_repository_link_output)

let make_update_repository_link_input ?connection_arn:(connection_arn_ : connection_arn option)
    ?encryption_key_arn:(encryption_key_arn_ : kms_key_arn option)
    ~repository_link_id:(repository_link_id_ : repository_link_id) () =
  ({
     connection_arn = connection_arn_;
     encryption_key_arn = encryption_key_arn_;
     repository_link_id = repository_link_id_;
   }
    : update_repository_link_input)

let make_update_host_output () = (() : unit)

let make_vpc_configuration ?tls_certificate:(tls_certificate_ : tls_certificate option)
    ~vpc_id:(vpc_id_ : vpc_id) ~subnet_ids:(subnet_ids_ : subnet_ids)
    ~security_group_ids:(security_group_ids_ : security_group_ids) () =
  ({
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     tls_certificate = tls_certificate_;
   }
    : vpc_configuration)

let make_update_host_input ?provider_endpoint:(provider_endpoint_ : url option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ~host_arn:(host_arn_ : host_arn) () =
  ({
     host_arn = host_arn_;
     provider_endpoint = provider_endpoint_;
     vpc_configuration = vpc_configuration_;
   }
    : update_host_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_list_sync_configurations_output ?next_token:(next_token_ : sharp_next_token option)
    ~sync_configurations:(sync_configurations_ : sync_configuration_list) () =
  ({ sync_configurations = sync_configurations_; next_token = next_token_ }
    : list_sync_configurations_output)

let make_list_sync_configurations_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : sharp_next_token option)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     repository_link_id = repository_link_id_;
     sync_type = sync_type_;
   }
    : list_sync_configurations_input)

let make_repository_sync_definition ~branch:(branch_ : branch_name)
    ~directory:(directory_ : directory) ~parent:(parent_ : parent) ~target:(target_ : target) () =
  ({ branch = branch_; directory = directory_; parent = parent_; target = target_ }
    : repository_sync_definition)

let make_list_repository_sync_definitions_output ?next_token:(next_token_ : sharp_next_token option)
    ~repository_sync_definitions:(repository_sync_definitions_ : repository_sync_definition_list) ()
    =
  ({ repository_sync_definitions = repository_sync_definitions_; next_token = next_token_ }
    : list_repository_sync_definitions_output)

let make_list_repository_sync_definitions_input
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({ repository_link_id = repository_link_id_; sync_type = sync_type_ }
    : list_repository_sync_definitions_input)

let make_list_repository_links_output ?next_token:(next_token_ : sharp_next_token option)
    ~repository_links:(repository_links_ : repository_link_list) () =
  ({ repository_links = repository_links_; next_token = next_token_ }
    : list_repository_links_output)

let make_list_repository_links_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : sharp_next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_repository_links_input)

let make_host ?name:(name_ : host_name option) ?host_arn:(host_arn_ : host_arn option)
    ?provider_type:(provider_type_ : provider_type option)
    ?provider_endpoint:(provider_endpoint_ : url option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?status:(status_ : host_status option)
    ?status_message:(status_message_ : host_status_message option) () =
  ({
     name = name_;
     host_arn = host_arn_;
     provider_type = provider_type_;
     provider_endpoint = provider_endpoint_;
     vpc_configuration = vpc_configuration_;
     status = status_;
     status_message = status_message_;
   }
    : host)

let make_list_hosts_output ?hosts:(hosts_ : host_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ hosts = hosts_; next_token = next_token_ } : list_hosts_output)

let make_list_hosts_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_hosts_input)

let make_connection ?connection_name:(connection_name_ : connection_name option)
    ?connection_arn:(connection_arn_ : connection_arn option)
    ?provider_type:(provider_type_ : provider_type option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?connection_status:(connection_status_ : connection_status option)
    ?host_arn:(host_arn_ : host_arn option) () =
  ({
     connection_name = connection_name_;
     connection_arn = connection_arn_;
     provider_type = provider_type_;
     owner_account_id = owner_account_id_;
     connection_status = connection_status_;
     host_arn = host_arn_;
   }
    : connection)

let make_list_connections_output ?connections:(connections_ : connection_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ connections = connections_; next_token = next_token_ } : list_connections_output)

let make_list_connections_input ?provider_type_filter:(provider_type_filter_ : provider_type option)
    ?host_arn_filter:(host_arn_filter_ : host_arn option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     provider_type_filter = provider_type_filter_;
     host_arn_filter = host_arn_filter_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_connections_input)

let make_get_sync_configuration_output
    ~sync_configuration:(sync_configuration_ : sync_configuration) () =
  ({ sync_configuration = sync_configuration_ } : get_sync_configuration_output)

let make_get_sync_configuration_input ~sync_type:(sync_type_ : sync_configuration_type)
    ~resource_name:(resource_name_ : resource_name) () =
  ({ sync_type = sync_type_; resource_name = resource_name_ } : get_sync_configuration_input)

let make_sync_blocker_summary ?parent_resource_name:(parent_resource_name_ : resource_name option)
    ?latest_blockers:(latest_blockers_ : latest_sync_blocker_list option)
    ~resource_name:(resource_name_ : resource_name) () =
  ({
     resource_name = resource_name_;
     parent_resource_name = parent_resource_name_;
     latest_blockers = latest_blockers_;
   }
    : sync_blocker_summary)

let make_get_sync_blocker_summary_output
    ~sync_blocker_summary:(sync_blocker_summary_ : sync_blocker_summary) () =
  ({ sync_blocker_summary = sync_blocker_summary_ } : get_sync_blocker_summary_output)

let make_get_sync_blocker_summary_input ~sync_type:(sync_type_ : sync_configuration_type)
    ~resource_name:(resource_name_ : resource_name) () =
  ({ sync_type = sync_type_; resource_name = resource_name_ } : get_sync_blocker_summary_input)

let make_revision ~branch:(branch_ : branch_name) ~directory:(directory_ : directory)
    ~owner_id:(owner_id_ : owner_id) ~repository_name:(repository_name_ : repository_name)
    ~provider_type:(provider_type_ : provider_type) ~sha:(sha_ : sh_a) () =
  ({
     branch = branch_;
     directory = directory_;
     owner_id = owner_id_;
     repository_name = repository_name_;
     provider_type = provider_type_;
     sha = sha_;
   }
    : revision)

let make_resource_sync_event ?external_id:(external_id_ : external_id option)
    ~event:(event_ : event) ~time:(time_ : timestamp) ~type_:(type__ : type_) () =
  ({ event = event_; external_id = external_id_; time = time_; type_ = type__ }
    : resource_sync_event)

let make_resource_sync_attempt ~events:(events_ : resource_sync_event_list)
    ~initial_revision:(initial_revision_ : revision) ~started_at:(started_at_ : timestamp)
    ~status:(status_ : resource_sync_status) ~target_revision:(target_revision_ : revision)
    ~target:(target_ : target) () =
  ({
     events = events_;
     initial_revision = initial_revision_;
     started_at = started_at_;
     status = status_;
     target_revision = target_revision_;
     target = target_;
   }
    : resource_sync_attempt)

let make_get_resource_sync_status_output ?desired_state:(desired_state_ : revision option)
    ?latest_successful_sync:(latest_successful_sync_ : resource_sync_attempt option)
    ~latest_sync:(latest_sync_ : resource_sync_attempt) () =
  ({
     desired_state = desired_state_;
     latest_successful_sync = latest_successful_sync_;
     latest_sync = latest_sync_;
   }
    : get_resource_sync_status_output)

let make_get_resource_sync_status_input ~resource_name:(resource_name_ : resource_name)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({ resource_name = resource_name_; sync_type = sync_type_ } : get_resource_sync_status_input)

let make_repository_sync_event ?external_id:(external_id_ : external_id option)
    ~event:(event_ : event) ~time:(time_ : timestamp) ~type_:(type__ : type_) () =
  ({ event = event_; external_id = external_id_; time = time_; type_ = type__ }
    : repository_sync_event)

let make_repository_sync_attempt ~started_at:(started_at_ : timestamp)
    ~status:(status_ : repository_sync_status) ~events:(events_ : repository_sync_event_list) () =
  ({ started_at = started_at_; status = status_; events = events_ } : repository_sync_attempt)

let make_get_repository_sync_status_output ~latest_sync:(latest_sync_ : repository_sync_attempt) ()
    =
  ({ latest_sync = latest_sync_ } : get_repository_sync_status_output)

let make_get_repository_sync_status_input ~branch:(branch_ : branch_name)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({ branch = branch_; repository_link_id = repository_link_id_; sync_type = sync_type_ }
    : get_repository_sync_status_input)

let make_get_repository_link_output
    ~repository_link_info:(repository_link_info_ : repository_link_info) () =
  ({ repository_link_info = repository_link_info_ } : get_repository_link_output)

let make_get_repository_link_input ~repository_link_id:(repository_link_id_ : repository_link_id) ()
    =
  ({ repository_link_id = repository_link_id_ } : get_repository_link_input)

let make_get_host_output ?name:(name_ : host_name option) ?status:(status_ : host_status option)
    ?provider_type:(provider_type_ : provider_type option)
    ?provider_endpoint:(provider_endpoint_ : url option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option) () =
  ({
     name = name_;
     status = status_;
     provider_type = provider_type_;
     provider_endpoint = provider_endpoint_;
     vpc_configuration = vpc_configuration_;
   }
    : get_host_output)

let make_get_host_input ~host_arn:(host_arn_ : host_arn) () =
  ({ host_arn = host_arn_ } : get_host_input)

let make_get_connection_output ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : get_connection_output)

let make_get_connection_input ~connection_arn:(connection_arn_ : connection_arn) () =
  ({ connection_arn = connection_arn_ } : get_connection_input)

let make_delete_sync_configuration_output () = (() : unit)

let make_delete_sync_configuration_input ~sync_type:(sync_type_ : sync_configuration_type)
    ~resource_name:(resource_name_ : resource_name) () =
  ({ sync_type = sync_type_; resource_name = resource_name_ } : delete_sync_configuration_input)

let make_delete_repository_link_output () = (() : unit)

let make_delete_repository_link_input ~repository_link_id:(repository_link_id_ : repository_link_id)
    () =
  ({ repository_link_id = repository_link_id_ } : delete_repository_link_input)

let make_delete_host_output () = (() : unit)

let make_delete_host_input ~host_arn:(host_arn_ : host_arn) () =
  ({ host_arn = host_arn_ } : delete_host_input)

let make_delete_connection_output () = (() : unit)

let make_delete_connection_input ~connection_arn:(connection_arn_ : connection_arn) () =
  ({ connection_arn = connection_arn_ } : delete_connection_input)

let make_create_sync_configuration_output
    ~sync_configuration:(sync_configuration_ : sync_configuration) () =
  ({ sync_configuration = sync_configuration_ } : create_sync_configuration_output)

let make_create_sync_configuration_input
    ?publish_deployment_status:(publish_deployment_status_ : publish_deployment_status option)
    ?trigger_resource_update_on:(trigger_resource_update_on_ : trigger_resource_update_on option)
    ~branch:(branch_ : branch_name) ~config_file:(config_file_ : deployment_file_path)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~resource_name:(resource_name_ : resource_name) ~role_arn:(role_arn_ : iam_role_arn)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({
     branch = branch_;
     config_file = config_file_;
     repository_link_id = repository_link_id_;
     resource_name = resource_name_;
     role_arn = role_arn_;
     sync_type = sync_type_;
     publish_deployment_status = publish_deployment_status_;
     trigger_resource_update_on = trigger_resource_update_on_;
   }
    : create_sync_configuration_input)

let make_create_repository_link_output
    ~repository_link_info:(repository_link_info_ : repository_link_info) () =
  ({ repository_link_info = repository_link_info_ } : create_repository_link_output)

let make_create_repository_link_input ?encryption_key_arn:(encryption_key_arn_ : kms_key_arn option)
    ?tags:(tags_ : tag_list option) ~connection_arn:(connection_arn_ : connection_arn)
    ~owner_id:(owner_id_ : owner_id) ~repository_name:(repository_name_ : repository_name) () =
  ({
     connection_arn = connection_arn_;
     owner_id = owner_id_;
     repository_name = repository_name_;
     encryption_key_arn = encryption_key_arn_;
     tags = tags_;
   }
    : create_repository_link_input)

let make_create_host_output ?host_arn:(host_arn_ : host_arn option) ?tags:(tags_ : tag_list option)
    () =
  ({ host_arn = host_arn_; tags = tags_ } : create_host_output)

let make_create_host_input ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : host_name)
    ~provider_type:(provider_type_ : provider_type) ~provider_endpoint:(provider_endpoint_ : url) ()
    =
  ({
     name = name_;
     provider_type = provider_type_;
     provider_endpoint = provider_endpoint_;
     vpc_configuration = vpc_configuration_;
     tags = tags_;
   }
    : create_host_input)

let make_create_connection_output ?tags:(tags_ : tag_list option)
    ~connection_arn:(connection_arn_ : connection_arn) () =
  ({ connection_arn = connection_arn_; tags = tags_ } : create_connection_output)

let make_create_connection_input ?provider_type:(provider_type_ : provider_type option)
    ?tags:(tags_ : tag_list option) ?host_arn:(host_arn_ : host_arn option)
    ~connection_name:(connection_name_ : connection_name) () =
  ({
     provider_type = provider_type_;
     connection_name = connection_name_;
     tags = tags_;
     host_arn = host_arn_;
   }
    : create_connection_input)
