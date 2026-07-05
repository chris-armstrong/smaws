open Types

let make_vpc_configuration ?tls_certificate:(tls_certificate_ : tls_certificate option)
    ~security_group_ids:(security_group_ids_ : security_group_ids)
    ~subnet_ids:(subnet_ids_ : subnet_ids) ~vpc_id:(vpc_id_ : vpc_id) () =
  ({
     tls_certificate = tls_certificate_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
   }
    : vpc_configuration)

let make_sync_configuration
    ?pull_request_comment:(pull_request_comment_ : pull_request_comment option)
    ?trigger_resource_update_on:(trigger_resource_update_on_ : trigger_resource_update_on option)
    ?publish_deployment_status:(publish_deployment_status_ : publish_deployment_status option)
    ?config_file:(config_file_ : deployment_file_path option)
    ~sync_type:(sync_type_ : sync_configuration_type) ~role_arn:(role_arn_ : iam_role_arn)
    ~resource_name:(resource_name_ : resource_name)
    ~repository_name:(repository_name_ : repository_name)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~provider_type:(provider_type_ : provider_type) ~owner_id:(owner_id_ : owner_id)
    ~branch:(branch_ : branch_name) () =
  ({
     pull_request_comment = pull_request_comment_;
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
     branch = branch_;
   }
    : sync_configuration)

let make_update_sync_configuration_output
    ~sync_configuration:(sync_configuration_ : sync_configuration) () =
  ({ sync_configuration = sync_configuration_ } : update_sync_configuration_output)

let make_update_sync_configuration_input
    ?pull_request_comment:(pull_request_comment_ : pull_request_comment option)
    ?trigger_resource_update_on:(trigger_resource_update_on_ : trigger_resource_update_on option)
    ?publish_deployment_status:(publish_deployment_status_ : publish_deployment_status option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?repository_link_id:(repository_link_id_ : repository_link_id option)
    ?config_file:(config_file_ : deployment_file_path option) ?branch:(branch_ : branch_name option)
    ~sync_type:(sync_type_ : sync_configuration_type)
    ~resource_name:(resource_name_ : resource_name) () =
  ({
     pull_request_comment = pull_request_comment_;
     trigger_resource_update_on = trigger_resource_update_on_;
     publish_deployment_status = publish_deployment_status_;
     sync_type = sync_type_;
     role_arn = role_arn_;
     resource_name = resource_name_;
     repository_link_id = repository_link_id_;
     config_file = config_file_;
     branch = branch_;
   }
    : update_sync_configuration_input)

let make_sync_blocker_context ~value:(value_ : sync_blocker_context_value)
    ~key:(key_ : sync_blocker_context_key) () =
  ({ value = value_; key = key_ } : sync_blocker_context)

let make_sync_blocker ?resolved_at:(resolved_at_ : timestamp option)
    ?resolved_reason:(resolved_reason_ : resolved_reason option)
    ?contexts:(contexts_ : sync_blocker_context_list option) ~created_at:(created_at_ : timestamp)
    ~created_reason:(created_reason_ : created_reason) ~status:(status_ : blocker_status)
    ~type_:(type__ : blocker_type) ~id:(id_ : id) () =
  ({
     resolved_at = resolved_at_;
     resolved_reason = resolved_reason_;
     contexts = contexts_;
     created_at = created_at_;
     created_reason = created_reason_;
     status = status_;
     type_ = type__;
     id = id_;
   }
    : sync_blocker)

let make_update_sync_blocker_output
    ?parent_resource_name:(parent_resource_name_ : resource_name option)
    ~sync_blocker:(sync_blocker_ : sync_blocker) ~resource_name:(resource_name_ : resource_name) ()
    =
  ({
     sync_blocker = sync_blocker_;
     parent_resource_name = parent_resource_name_;
     resource_name = resource_name_;
   }
    : update_sync_blocker_output)

let make_update_sync_blocker_input ~resolved_reason:(resolved_reason_ : resolved_reason)
    ~resource_name:(resource_name_ : resource_name)
    ~sync_type:(sync_type_ : sync_configuration_type) ~id:(id_ : id) () =
  ({
     resolved_reason = resolved_reason_;
     resource_name = resource_name_;
     sync_type = sync_type_;
     id = id_;
   }
    : update_sync_blocker_input)

let make_repository_link_info ?encryption_key_arn:(encryption_key_arn_ : kms_key_arn option)
    ~repository_name:(repository_name_ : repository_name)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~repository_link_arn:(repository_link_arn_ : repository_link_arn)
    ~provider_type:(provider_type_ : provider_type) ~owner_id:(owner_id_ : owner_id)
    ~connection_arn:(connection_arn_ : connection_arn) () =
  ({
     repository_name = repository_name_;
     repository_link_id = repository_link_id_;
     repository_link_arn = repository_link_arn_;
     provider_type = provider_type_;
     owner_id = owner_id_;
     encryption_key_arn = encryption_key_arn_;
     connection_arn = connection_arn_;
   }
    : repository_link_info)

let make_update_repository_link_output
    ~repository_link_info:(repository_link_info_ : repository_link_info) () =
  ({ repository_link_info = repository_link_info_ } : update_repository_link_output)

let make_update_repository_link_input ?encryption_key_arn:(encryption_key_arn_ : kms_key_arn option)
    ?connection_arn:(connection_arn_ : connection_arn option)
    ~repository_link_id:(repository_link_id_ : repository_link_id) () =
  ({
     repository_link_id = repository_link_id_;
     encryption_key_arn = encryption_key_arn_;
     connection_arn = connection_arn_;
   }
    : update_repository_link_input)

let make_update_host_output () = (() : unit)

let make_update_host_input ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?provider_endpoint:(provider_endpoint_ : url option) ~host_arn:(host_arn_ : host_arn) () =
  ({
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     host_arn = host_arn_;
   }
    : update_host_input)

let make_untag_resource_output () = (() : unit)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_input)

let make_tag_resource_output () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_input ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_input)

let make_sync_blocker_summary ?latest_blockers:(latest_blockers_ : latest_sync_blocker_list option)
    ?parent_resource_name:(parent_resource_name_ : resource_name option)
    ~resource_name:(resource_name_ : resource_name) () =
  ({
     latest_blockers = latest_blockers_;
     parent_resource_name = parent_resource_name_;
     resource_name = resource_name_;
   }
    : sync_blocker_summary)

let make_revision ~sha:(sha_ : sh_a) ~provider_type:(provider_type_ : provider_type)
    ~repository_name:(repository_name_ : repository_name) ~owner_id:(owner_id_ : owner_id)
    ~directory:(directory_ : directory) ~branch:(branch_ : branch_name) () =
  ({
     sha = sha_;
     provider_type = provider_type_;
     repository_name = repository_name_;
     owner_id = owner_id_;
     directory = directory_;
     branch = branch_;
   }
    : revision)

let make_resource_sync_event ?external_id:(external_id_ : external_id option)
    ~type_:(type__ : type_) ~time:(time_ : timestamp) ~event:(event_ : event) () =
  ({ type_ = type__; time = time_; external_id = external_id_; event = event_ }
    : resource_sync_event)

let make_resource_sync_attempt ~target:(target_ : target)
    ~target_revision:(target_revision_ : revision) ~status:(status_ : resource_sync_status)
    ~started_at:(started_at_ : timestamp) ~initial_revision:(initial_revision_ : revision)
    ~events:(events_ : resource_sync_event_list) () =
  ({
     target = target_;
     target_revision = target_revision_;
     status = status_;
     started_at = started_at_;
     initial_revision = initial_revision_;
     events = events_;
   }
    : resource_sync_attempt)

let make_repository_sync_event ?external_id:(external_id_ : external_id option)
    ~type_:(type__ : type_) ~time:(time_ : timestamp) ~event:(event_ : event) () =
  ({ type_ = type__; time = time_; external_id = external_id_; event = event_ }
    : repository_sync_event)

let make_repository_sync_definition ~target:(target_ : target) ~parent:(parent_ : parent)
    ~directory:(directory_ : directory) ~branch:(branch_ : branch_name) () =
  ({ target = target_; parent = parent_; directory = directory_; branch = branch_ }
    : repository_sync_definition)

let make_repository_sync_attempt ~events:(events_ : repository_sync_event_list)
    ~status:(status_ : repository_sync_status) ~started_at:(started_at_ : timestamp) () =
  ({ events = events_; status = status_; started_at = started_at_ } : repository_sync_attempt)

let make_list_tags_for_resource_output ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_list_sync_configurations_output ?next_token:(next_token_ : sharp_next_token option)
    ~sync_configurations:(sync_configurations_ : sync_configuration_list) () =
  ({ next_token = next_token_; sync_configurations = sync_configurations_ }
    : list_sync_configurations_output)

let make_list_sync_configurations_input ?next_token:(next_token_ : sharp_next_token option)
    ?max_results:(max_results_ : max_results option)
    ~sync_type:(sync_type_ : sync_configuration_type)
    ~repository_link_id:(repository_link_id_ : repository_link_id) () =
  ({
     sync_type = sync_type_;
     repository_link_id = repository_link_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_sync_configurations_input)

let make_list_repository_sync_definitions_output ?next_token:(next_token_ : sharp_next_token option)
    ~repository_sync_definitions:(repository_sync_definitions_ : repository_sync_definition_list) ()
    =
  ({ next_token = next_token_; repository_sync_definitions = repository_sync_definitions_ }
    : list_repository_sync_definitions_output)

let make_list_repository_sync_definitions_input ~sync_type:(sync_type_ : sync_configuration_type)
    ~repository_link_id:(repository_link_id_ : repository_link_id) () =
  ({ sync_type = sync_type_; repository_link_id = repository_link_id_ }
    : list_repository_sync_definitions_input)

let make_list_repository_links_output ?next_token:(next_token_ : sharp_next_token option)
    ~repository_links:(repository_links_ : repository_link_list) () =
  ({ next_token = next_token_; repository_links = repository_links_ }
    : list_repository_links_output)

let make_list_repository_links_input ?next_token:(next_token_ : sharp_next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_repository_links_input)

let make_host ?status_message:(status_message_ : host_status_message option)
    ?status:(status_ : host_status option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?provider_endpoint:(provider_endpoint_ : url option)
    ?provider_type:(provider_type_ : provider_type option) ?host_arn:(host_arn_ : host_arn option)
    ?name:(name_ : host_name option) () =
  ({
     status_message = status_message_;
     status = status_;
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     provider_type = provider_type_;
     host_arn = host_arn_;
     name = name_;
   }
    : host)

let make_list_hosts_output ?next_token:(next_token_ : next_token option)
    ?hosts:(hosts_ : host_list option) () =
  ({ next_token = next_token_; hosts = hosts_ } : list_hosts_output)

let make_list_hosts_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_hosts_input)

let make_connection ?host_arn:(host_arn_ : host_arn option)
    ?connection_status:(connection_status_ : connection_status option)
    ?owner_account_id:(owner_account_id_ : account_id option)
    ?provider_type:(provider_type_ : provider_type option)
    ?connection_arn:(connection_arn_ : connection_arn option)
    ?connection_name:(connection_name_ : connection_name option) () =
  ({
     host_arn = host_arn_;
     connection_status = connection_status_;
     owner_account_id = owner_account_id_;
     provider_type = provider_type_;
     connection_arn = connection_arn_;
     connection_name = connection_name_;
   }
    : connection)

let make_list_connections_output ?next_token:(next_token_ : next_token option)
    ?connections:(connections_ : connection_list option) () =
  ({ next_token = next_token_; connections = connections_ } : list_connections_output)

let make_list_connections_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?host_arn_filter:(host_arn_filter_ : host_arn option)
    ?provider_type_filter:(provider_type_filter_ : provider_type option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     host_arn_filter = host_arn_filter_;
     provider_type_filter = provider_type_filter_;
   }
    : list_connections_input)

let make_get_sync_configuration_output
    ~sync_configuration:(sync_configuration_ : sync_configuration) () =
  ({ sync_configuration = sync_configuration_ } : get_sync_configuration_output)

let make_get_sync_configuration_input ~resource_name:(resource_name_ : resource_name)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({ resource_name = resource_name_; sync_type = sync_type_ } : get_sync_configuration_input)

let make_get_sync_blocker_summary_output
    ~sync_blocker_summary:(sync_blocker_summary_ : sync_blocker_summary) () =
  ({ sync_blocker_summary = sync_blocker_summary_ } : get_sync_blocker_summary_output)

let make_get_sync_blocker_summary_input ~resource_name:(resource_name_ : resource_name)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({ resource_name = resource_name_; sync_type = sync_type_ } : get_sync_blocker_summary_input)

let make_get_resource_sync_status_output
    ?latest_successful_sync:(latest_successful_sync_ : resource_sync_attempt option)
    ?desired_state:(desired_state_ : revision option)
    ~latest_sync:(latest_sync_ : resource_sync_attempt) () =
  ({
     latest_sync = latest_sync_;
     latest_successful_sync = latest_successful_sync_;
     desired_state = desired_state_;
   }
    : get_resource_sync_status_output)

let make_get_resource_sync_status_input ~sync_type:(sync_type_ : sync_configuration_type)
    ~resource_name:(resource_name_ : resource_name) () =
  ({ sync_type = sync_type_; resource_name = resource_name_ } : get_resource_sync_status_input)

let make_get_repository_sync_status_output ~latest_sync:(latest_sync_ : repository_sync_attempt) ()
    =
  ({ latest_sync = latest_sync_ } : get_repository_sync_status_output)

let make_get_repository_sync_status_input ~sync_type:(sync_type_ : sync_configuration_type)
    ~repository_link_id:(repository_link_id_ : repository_link_id) ~branch:(branch_ : branch_name)
    () =
  ({ sync_type = sync_type_; repository_link_id = repository_link_id_; branch = branch_ }
    : get_repository_sync_status_input)

let make_get_repository_link_output
    ~repository_link_info:(repository_link_info_ : repository_link_info) () =
  ({ repository_link_info = repository_link_info_ } : get_repository_link_output)

let make_get_repository_link_input ~repository_link_id:(repository_link_id_ : repository_link_id) ()
    =
  ({ repository_link_id = repository_link_id_ } : get_repository_link_input)

let make_get_host_output ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?provider_endpoint:(provider_endpoint_ : url option)
    ?provider_type:(provider_type_ : provider_type option) ?status:(status_ : host_status option)
    ?name:(name_ : host_name option) () =
  ({
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     provider_type = provider_type_;
     status = status_;
     name = name_;
   }
    : get_host_output)

let make_get_host_input ~host_arn:(host_arn_ : host_arn) () =
  ({ host_arn = host_arn_ } : get_host_input)

let make_get_connection_output ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : get_connection_output)

let make_get_connection_input ~connection_arn:(connection_arn_ : connection_arn) () =
  ({ connection_arn = connection_arn_ } : get_connection_input)

let make_delete_sync_configuration_output () = (() : unit)

let make_delete_sync_configuration_input ~resource_name:(resource_name_ : resource_name)
    ~sync_type:(sync_type_ : sync_configuration_type) () =
  ({ resource_name = resource_name_; sync_type = sync_type_ } : delete_sync_configuration_input)

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
    ?pull_request_comment:(pull_request_comment_ : pull_request_comment option)
    ?trigger_resource_update_on:(trigger_resource_update_on_ : trigger_resource_update_on option)
    ?publish_deployment_status:(publish_deployment_status_ : publish_deployment_status option)
    ~sync_type:(sync_type_ : sync_configuration_type) ~role_arn:(role_arn_ : iam_role_arn)
    ~resource_name:(resource_name_ : resource_name)
    ~repository_link_id:(repository_link_id_ : repository_link_id)
    ~config_file:(config_file_ : deployment_file_path) ~branch:(branch_ : branch_name) () =
  ({
     pull_request_comment = pull_request_comment_;
     trigger_resource_update_on = trigger_resource_update_on_;
     publish_deployment_status = publish_deployment_status_;
     sync_type = sync_type_;
     role_arn = role_arn_;
     resource_name = resource_name_;
     repository_link_id = repository_link_id_;
     config_file = config_file_;
     branch = branch_;
   }
    : create_sync_configuration_input)

let make_create_repository_link_output
    ~repository_link_info:(repository_link_info_ : repository_link_info) () =
  ({ repository_link_info = repository_link_info_ } : create_repository_link_output)

let make_create_repository_link_input ?tags:(tags_ : tag_list option)
    ?encryption_key_arn:(encryption_key_arn_ : kms_key_arn option)
    ~repository_name:(repository_name_ : repository_name) ~owner_id:(owner_id_ : owner_id)
    ~connection_arn:(connection_arn_ : connection_arn) () =
  ({
     tags = tags_;
     encryption_key_arn = encryption_key_arn_;
     repository_name = repository_name_;
     owner_id = owner_id_;
     connection_arn = connection_arn_;
   }
    : create_repository_link_input)

let make_create_host_output ?tags:(tags_ : tag_list option) ?host_arn:(host_arn_ : host_arn option)
    () =
  ({ tags = tags_; host_arn = host_arn_ } : create_host_output)

let make_create_host_input ?tags:(tags_ : tag_list option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ~provider_endpoint:(provider_endpoint_ : url) ~provider_type:(provider_type_ : provider_type)
    ~name:(name_ : host_name) () =
  ({
     tags = tags_;
     vpc_configuration = vpc_configuration_;
     provider_endpoint = provider_endpoint_;
     provider_type = provider_type_;
     name = name_;
   }
    : create_host_input)

let make_create_connection_output ?tags:(tags_ : tag_list option)
    ~connection_arn:(connection_arn_ : connection_arn) () =
  ({ tags = tags_; connection_arn = connection_arn_ } : create_connection_output)

let make_create_connection_input ?host_arn:(host_arn_ : host_arn option)
    ?tags:(tags_ : tag_list option) ?provider_type:(provider_type_ : provider_type option)
    ~connection_name:(connection_name_ : connection_name) () =
  ({
     host_arn = host_arn_;
     tags = tags_;
     connection_name = connection_name_;
     provider_type = provider_type_;
   }
    : create_connection_input)
