open Types

let make_ingress_vpc_configuration ?vpc_id:(vpc_id_ : string_ option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : string_ option) () =
  ({ vpc_id = vpc_id_; vpc_endpoint_id = vpc_endpoint_id_ } : ingress_vpc_configuration)

let make_vpc_ingress_connection
    ?vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : app_runner_resource_arn option)
    ?vpc_ingress_connection_name:(vpc_ingress_connection_name_ : vpc_ingress_connection_name option)
    ?service_arn:(service_arn_ : app_runner_resource_arn option)
    ?status:(status_ : vpc_ingress_connection_status option)
    ?account_id:(account_id_ : customer_account_id option)
    ?domain_name:(domain_name_ : domain_name option)
    ?ingress_vpc_configuration:(ingress_vpc_configuration_ : ingress_vpc_configuration option)
    ?created_at:(created_at_ : timestamp option) ?deleted_at:(deleted_at_ : timestamp option) () =
  ({
     vpc_ingress_connection_arn = vpc_ingress_connection_arn_;
     vpc_ingress_connection_name = vpc_ingress_connection_name_;
     service_arn = service_arn_;
     status = status_;
     account_id = account_id_;
     domain_name = domain_name_;
     ingress_vpc_configuration = ingress_vpc_configuration_;
     created_at = created_at_;
     deleted_at = deleted_at_;
   }
    : vpc_ingress_connection)

let make_update_vpc_ingress_connection_response
    ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : update_vpc_ingress_connection_response)

let make_update_vpc_ingress_connection_request
    ~vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : app_runner_resource_arn)
    ~ingress_vpc_configuration:(ingress_vpc_configuration_ : ingress_vpc_configuration) () =
  ({
     vpc_ingress_connection_arn = vpc_ingress_connection_arn_;
     ingress_vpc_configuration = ingress_vpc_configuration_;
   }
    : update_vpc_ingress_connection_request)

let make_service_observability_configuration
    ?observability_configuration_arn:
      (observability_configuration_arn_ : app_runner_resource_arn option)
    ~observability_enabled:(observability_enabled_ : boolean_) () =
  ({
     observability_enabled = observability_enabled_;
     observability_configuration_arn = observability_configuration_arn_;
   }
    : service_observability_configuration)

let make_ingress_configuration ?is_publicly_accessible:(is_publicly_accessible_ : boolean_ option)
    () =
  ({ is_publicly_accessible = is_publicly_accessible_ } : ingress_configuration)

let make_egress_configuration ?egress_type:(egress_type_ : egress_type option)
    ?vpc_connector_arn:(vpc_connector_arn_ : app_runner_resource_arn option) () =
  ({ egress_type = egress_type_; vpc_connector_arn = vpc_connector_arn_ } : egress_configuration)

let make_network_configuration
    ?egress_configuration:(egress_configuration_ : egress_configuration option)
    ?ingress_configuration:(ingress_configuration_ : ingress_configuration option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option) () =
  ({
     egress_configuration = egress_configuration_;
     ingress_configuration = ingress_configuration_;
     ip_address_type = ip_address_type_;
   }
    : network_configuration)

let make_auto_scaling_configuration_summary
    ?auto_scaling_configuration_arn:
      (auto_scaling_configuration_arn_ : app_runner_resource_arn option)
    ?auto_scaling_configuration_name:
      (auto_scaling_configuration_name_ : auto_scaling_configuration_name option)
    ?auto_scaling_configuration_revision:(auto_scaling_configuration_revision_ : integer option)
    ?status:(status_ : auto_scaling_configuration_status option)
    ?created_at:(created_at_ : timestamp option)
    ?has_associated_service:(has_associated_service_ : has_associated_service option)
    ?is_default:(is_default_ : is_default option) () =
  ({
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     auto_scaling_configuration_name = auto_scaling_configuration_name_;
     auto_scaling_configuration_revision = auto_scaling_configuration_revision_;
     status = status_;
     created_at = created_at_;
     has_associated_service = has_associated_service_;
     is_default = is_default_;
   }
    : auto_scaling_configuration_summary)

let make_health_check_configuration ?protocol:(protocol_ : health_check_protocol option)
    ?path:(path_ : health_check_path option) ?interval:(interval_ : health_check_interval option)
    ?timeout:(timeout_ : health_check_timeout option)
    ?healthy_threshold:(healthy_threshold_ : health_check_healthy_threshold option)
    ?unhealthy_threshold:(unhealthy_threshold_ : health_check_unhealthy_threshold option) () =
  ({
     protocol = protocol_;
     path = path_;
     interval = interval_;
     timeout = timeout_;
     healthy_threshold = healthy_threshold_;
     unhealthy_threshold = unhealthy_threshold_;
   }
    : health_check_configuration)

let make_encryption_configuration ~kms_key:(kms_key_ : kms_key_arn) () =
  ({ kms_key = kms_key_ } : encryption_configuration)

let make_instance_configuration ?cpu:(cpu_ : cpu option) ?memory:(memory_ : memory option)
    ?instance_role_arn:(instance_role_arn_ : role_arn option) () =
  ({ cpu = cpu_; memory = memory_; instance_role_arn = instance_role_arn_ }
    : instance_configuration)

let make_authentication_configuration
    ?connection_arn:(connection_arn_ : app_runner_resource_arn option)
    ?access_role_arn:(access_role_arn_ : role_arn option) () =
  ({ connection_arn = connection_arn_; access_role_arn = access_role_arn_ }
    : authentication_configuration)

let make_image_configuration
    ?runtime_environment_variables:
      (runtime_environment_variables_ : runtime_environment_variables option)
    ?start_command:(start_command_ : start_command option) ?port:(port_ : string_ option)
    ?runtime_environment_secrets:(runtime_environment_secrets_ : runtime_environment_secrets option)
    () =
  ({
     runtime_environment_variables = runtime_environment_variables_;
     start_command = start_command_;
     port = port_;
     runtime_environment_secrets = runtime_environment_secrets_;
   }
    : image_configuration)

let make_image_repository ?image_configuration:(image_configuration_ : image_configuration option)
    ~image_identifier:(image_identifier_ : image_identifier)
    ~image_repository_type:(image_repository_type_ : image_repository_type) () =
  ({
     image_identifier = image_identifier_;
     image_configuration = image_configuration_;
     image_repository_type = image_repository_type_;
   }
    : image_repository)

let make_code_configuration_values ?build_command:(build_command_ : build_command option)
    ?start_command:(start_command_ : start_command option) ?port:(port_ : string_ option)
    ?runtime_environment_variables:
      (runtime_environment_variables_ : runtime_environment_variables option)
    ?runtime_environment_secrets:(runtime_environment_secrets_ : runtime_environment_secrets option)
    ~runtime:(runtime_ : runtime) () =
  ({
     runtime = runtime_;
     build_command = build_command_;
     start_command = start_command_;
     port = port_;
     runtime_environment_variables = runtime_environment_variables_;
     runtime_environment_secrets = runtime_environment_secrets_;
   }
    : code_configuration_values)

let make_code_configuration
    ?code_configuration_values:(code_configuration_values_ : code_configuration_values option)
    ~configuration_source:(configuration_source_ : configuration_source) () =
  ({
     configuration_source = configuration_source_;
     code_configuration_values = code_configuration_values_;
   }
    : code_configuration)

let make_source_code_version ~type_:(type__ : source_code_version_type) ~value:(value_ : string_) ()
    =
  ({ type_ = type__; value = value_ } : source_code_version)

let make_code_repository ?code_configuration:(code_configuration_ : code_configuration option)
    ?source_directory:(source_directory_ : source_directory option)
    ~repository_url:(repository_url_ : string_)
    ~source_code_version:(source_code_version_ : source_code_version) () =
  ({
     repository_url = repository_url_;
     source_code_version = source_code_version_;
     code_configuration = code_configuration_;
     source_directory = source_directory_;
   }
    : code_repository)

let make_source_configuration ?code_repository:(code_repository_ : code_repository option)
    ?image_repository:(image_repository_ : image_repository option)
    ?auto_deployments_enabled:(auto_deployments_enabled_ : nullable_boolean option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration option) () =
  ({
     code_repository = code_repository_;
     image_repository = image_repository_;
     auto_deployments_enabled = auto_deployments_enabled_;
     authentication_configuration = authentication_configuration_;
   }
    : source_configuration)

let make_service ?service_url:(service_url_ : string_ option)
    ?deleted_at:(deleted_at_ : timestamp option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?health_check_configuration:(health_check_configuration_ : health_check_configuration option)
    ?observability_configuration:
      (observability_configuration_ : service_observability_configuration option)
    ~service_name:(service_name_ : service_name) ~service_id:(service_id_ : service_id)
    ~service_arn:(service_arn_ : app_runner_resource_arn) ~created_at:(created_at_ : timestamp)
    ~updated_at:(updated_at_ : timestamp) ~status:(status_ : service_status)
    ~source_configuration:(source_configuration_ : source_configuration)
    ~instance_configuration:(instance_configuration_ : instance_configuration)
    ~auto_scaling_configuration_summary:
      (auto_scaling_configuration_summary_ : auto_scaling_configuration_summary)
    ~network_configuration:(network_configuration_ : network_configuration) () =
  ({
     service_name = service_name_;
     service_id = service_id_;
     service_arn = service_arn_;
     service_url = service_url_;
     created_at = created_at_;
     updated_at = updated_at_;
     deleted_at = deleted_at_;
     status = status_;
     source_configuration = source_configuration_;
     instance_configuration = instance_configuration_;
     encryption_configuration = encryption_configuration_;
     health_check_configuration = health_check_configuration_;
     auto_scaling_configuration_summary = auto_scaling_configuration_summary_;
     network_configuration = network_configuration_;
     observability_configuration = observability_configuration_;
   }
    : service)

let make_update_service_response ~service:(service_ : service) ~operation_id:(operation_id_ : uui_d)
    () =
  ({ service = service_; operation_id = operation_id_ } : update_service_response)

let make_update_service_request
    ?source_configuration:(source_configuration_ : source_configuration option)
    ?instance_configuration:(instance_configuration_ : instance_configuration option)
    ?auto_scaling_configuration_arn:
      (auto_scaling_configuration_arn_ : app_runner_resource_arn option)
    ?health_check_configuration:(health_check_configuration_ : health_check_configuration option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?observability_configuration:
      (observability_configuration_ : service_observability_configuration option)
    ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({
     service_arn = service_arn_;
     source_configuration = source_configuration_;
     instance_configuration = instance_configuration_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     health_check_configuration = health_check_configuration_;
     network_configuration = network_configuration_;
     observability_configuration = observability_configuration_;
   }
    : update_service_request)

let make_auto_scaling_configuration
    ?auto_scaling_configuration_arn:
      (auto_scaling_configuration_arn_ : app_runner_resource_arn option)
    ?auto_scaling_configuration_name:
      (auto_scaling_configuration_name_ : auto_scaling_configuration_name option)
    ?auto_scaling_configuration_revision:
      (auto_scaling_configuration_revision_ : auto_scaling_configuration_revision option)
    ?latest:(latest_ : latest option) ?status:(status_ : auto_scaling_configuration_status option)
    ?max_concurrency:(max_concurrency_ : max_concurrency option)
    ?min_size:(min_size_ : min_size option) ?max_size:(max_size_ : max_size option)
    ?created_at:(created_at_ : timestamp option) ?deleted_at:(deleted_at_ : timestamp option)
    ?has_associated_service:(has_associated_service_ : has_associated_service option)
    ?is_default:(is_default_ : is_default option) () =
  ({
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     auto_scaling_configuration_name = auto_scaling_configuration_name_;
     auto_scaling_configuration_revision = auto_scaling_configuration_revision_;
     latest = latest_;
     status = status_;
     max_concurrency = max_concurrency_;
     min_size = min_size_;
     max_size = max_size_;
     created_at = created_at_;
     deleted_at = deleted_at_;
     has_associated_service = has_associated_service_;
     is_default = is_default_;
   }
    : auto_scaling_configuration)

let make_update_default_auto_scaling_configuration_response
    ~auto_scaling_configuration:(auto_scaling_configuration_ : auto_scaling_configuration) () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ }
    : update_default_auto_scaling_configuration_response)

let make_update_default_auto_scaling_configuration_request
    ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : app_runner_resource_arn) () =
  ({ auto_scaling_configuration_arn = auto_scaling_configuration_arn_ }
    : update_default_auto_scaling_configuration_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : app_runner_resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : app_runner_resource_arn)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_start_deployment_response ~operation_id:(operation_id_ : uui_d) () =
  ({ operation_id = operation_id_ } : start_deployment_response)

let make_start_deployment_request ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({ service_arn = service_arn_ } : start_deployment_request)

let make_resume_service_response ?operation_id:(operation_id_ : uui_d option)
    ~service:(service_ : service) () =
  ({ service = service_; operation_id = operation_id_ } : resume_service_response)

let make_resume_service_request ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({ service_arn = service_arn_ } : resume_service_request)

let make_pause_service_response ?operation_id:(operation_id_ : uui_d option)
    ~service:(service_ : service) () =
  ({ service = service_; operation_id = operation_id_ } : pause_service_response)

let make_pause_service_request ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({ service_arn = service_arn_ } : pause_service_request)

let make_vpc_ingress_connection_summary
    ?vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : app_runner_resource_arn option)
    ?service_arn:(service_arn_ : app_runner_resource_arn option) () =
  ({ vpc_ingress_connection_arn = vpc_ingress_connection_arn_; service_arn = service_arn_ }
    : vpc_ingress_connection_summary)

let make_list_vpc_ingress_connections_response ?next_token:(next_token_ : next_token option)
    ~vpc_ingress_connection_summary_list:
      (vpc_ingress_connection_summary_list_ : vpc_ingress_connection_summary_list) () =
  ({
     vpc_ingress_connection_summary_list = vpc_ingress_connection_summary_list_;
     next_token = next_token_;
   }
    : list_vpc_ingress_connections_response)

let make_list_vpc_ingress_connections_filter
    ?service_arn:(service_arn_ : app_runner_resource_arn option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : string_ option) () =
  ({ service_arn = service_arn_; vpc_endpoint_id = vpc_endpoint_id_ }
    : list_vpc_ingress_connections_filter)

let make_list_vpc_ingress_connections_request
    ?filter:(filter_ : list_vpc_ingress_connections_filter option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filter = filter_; max_results = max_results_; next_token = next_token_ }
    : list_vpc_ingress_connections_request)

let make_vpc_connector ?vpc_connector_name:(vpc_connector_name_ : vpc_connector_name option)
    ?vpc_connector_arn:(vpc_connector_arn_ : app_runner_resource_arn option)
    ?vpc_connector_revision:(vpc_connector_revision_ : integer option)
    ?subnets:(subnets_ : string_list option)
    ?security_groups:(security_groups_ : string_list option)
    ?status:(status_ : vpc_connector_status option) ?created_at:(created_at_ : timestamp option)
    ?deleted_at:(deleted_at_ : timestamp option) () =
  ({
     vpc_connector_name = vpc_connector_name_;
     vpc_connector_arn = vpc_connector_arn_;
     vpc_connector_revision = vpc_connector_revision_;
     subnets = subnets_;
     security_groups = security_groups_;
     status = status_;
     created_at = created_at_;
     deleted_at = deleted_at_;
   }
    : vpc_connector)

let make_list_vpc_connectors_response ?next_token:(next_token_ : next_token option)
    ~vpc_connectors:(vpc_connectors_ : vpc_connectors) () =
  ({ vpc_connectors = vpc_connectors_; next_token = next_token_ } : list_vpc_connectors_response)

let make_list_vpc_connectors_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_vpc_connectors_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : app_runner_resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_services_for_auto_scaling_configuration_response
    ?next_token:(next_token_ : next_token option)
    ~service_arn_list:(service_arn_list_ : service_arn_list) () =
  ({ service_arn_list = service_arn_list_; next_token = next_token_ }
    : list_services_for_auto_scaling_configuration_response)

let make_list_services_for_auto_scaling_configuration_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : app_runner_resource_arn) () =
  ({
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_services_for_auto_scaling_configuration_request)

let make_service_summary ?service_name:(service_name_ : service_name option)
    ?service_id:(service_id_ : service_id option)
    ?service_arn:(service_arn_ : app_runner_resource_arn option)
    ?service_url:(service_url_ : string_ option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) ?status:(status_ : service_status option) () =
  ({
     service_name = service_name_;
     service_id = service_id_;
     service_arn = service_arn_;
     service_url = service_url_;
     created_at = created_at_;
     updated_at = updated_at_;
     status = status_;
   }
    : service_summary)

let make_list_services_response ?next_token:(next_token_ : string_ option)
    ~service_summary_list:(service_summary_list_ : service_summary_list) () =
  ({ service_summary_list = service_summary_list_; next_token = next_token_ }
    : list_services_response)

let make_list_services_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : service_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_services_request)

let make_operation_summary ?id:(id_ : uui_d option) ?type_:(type__ : operation_type option)
    ?status:(status_ : operation_status option)
    ?target_arn:(target_arn_ : app_runner_resource_arn option)
    ?started_at:(started_at_ : timestamp option) ?ended_at:(ended_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({
     id = id_;
     type_ = type__;
     status = status_;
     target_arn = target_arn_;
     started_at = started_at_;
     ended_at = ended_at_;
     updated_at = updated_at_;
   }
    : operation_summary)

let make_list_operations_response
    ?operation_summary_list:(operation_summary_list_ : operation_summary_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ operation_summary_list = operation_summary_list_; next_token = next_token_ }
    : list_operations_response)

let make_list_operations_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : list_operations_max_results option)
    ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({ service_arn = service_arn_; next_token = next_token_; max_results = max_results_ }
    : list_operations_request)

let make_observability_configuration_summary
    ?observability_configuration_arn:
      (observability_configuration_arn_ : app_runner_resource_arn option)
    ?observability_configuration_name:
      (observability_configuration_name_ : observability_configuration_name option)
    ?observability_configuration_revision:(observability_configuration_revision_ : integer option)
    () =
  ({
     observability_configuration_arn = observability_configuration_arn_;
     observability_configuration_name = observability_configuration_name_;
     observability_configuration_revision = observability_configuration_revision_;
   }
    : observability_configuration_summary)

let make_list_observability_configurations_response ?next_token:(next_token_ : next_token option)
    ~observability_configuration_summary_list:
      (observability_configuration_summary_list_ : observability_configuration_summary_list) () =
  ({
     observability_configuration_summary_list = observability_configuration_summary_list_;
     next_token = next_token_;
   }
    : list_observability_configurations_response)

let make_list_observability_configurations_request
    ?observability_configuration_name:
      (observability_configuration_name_ : observability_configuration_name option)
    ?latest_only:(latest_only_ : boolean_ option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     observability_configuration_name = observability_configuration_name_;
     latest_only = latest_only_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_observability_configurations_request)

let make_connection_summary ?connection_name:(connection_name_ : connection_name option)
    ?connection_arn:(connection_arn_ : app_runner_resource_arn option)
    ?provider_type:(provider_type_ : provider_type option)
    ?status:(status_ : connection_status option) ?created_at:(created_at_ : timestamp option) () =
  ({
     connection_name = connection_name_;
     connection_arn = connection_arn_;
     provider_type = provider_type_;
     status = status_;
     created_at = created_at_;
   }
    : connection_summary)

let make_list_connections_response ?next_token:(next_token_ : next_token option)
    ~connection_summary_list:(connection_summary_list_ : connection_summary_list) () =
  ({ connection_summary_list = connection_summary_list_; next_token = next_token_ }
    : list_connections_response)

let make_list_connections_request ?connection_name:(connection_name_ : connection_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ connection_name = connection_name_; max_results = max_results_; next_token = next_token_ }
    : list_connections_request)

let make_list_auto_scaling_configurations_response ?next_token:(next_token_ : next_token option)
    ~auto_scaling_configuration_summary_list:
      (auto_scaling_configuration_summary_list_ : auto_scaling_configuration_summary_list) () =
  ({
     auto_scaling_configuration_summary_list = auto_scaling_configuration_summary_list_;
     next_token = next_token_;
   }
    : list_auto_scaling_configurations_response)

let make_list_auto_scaling_configurations_request
    ?auto_scaling_configuration_name:
      (auto_scaling_configuration_name_ : auto_scaling_configuration_name option)
    ?latest_only:(latest_only_ : boolean_ option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     auto_scaling_configuration_name = auto_scaling_configuration_name_;
     latest_only = latest_only_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_auto_scaling_configurations_request)

let make_vpc_dns_target
    ?vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : app_runner_resource_arn option)
    ?vpc_id:(vpc_id_ : string_ option) ?domain_name:(domain_name_ : domain_name option) () =
  ({
     vpc_ingress_connection_arn = vpc_ingress_connection_arn_;
     vpc_id = vpc_id_;
     domain_name = domain_name_;
   }
    : vpc_dns_target)

let make_certificate_validation_record ?name:(name_ : string_ option)
    ?type_:(type__ : string_ option) ?value:(value_ : string_ option)
    ?status:(status_ : certificate_validation_record_status option) () =
  ({ name = name_; type_ = type__; value = value_; status = status_ }
    : certificate_validation_record)

let make_custom_domain
    ?certificate_validation_records:
      (certificate_validation_records_ : certificate_validation_record_list option)
    ~domain_name:(domain_name_ : domain_name)
    ~enable_www_subdomain:(enable_www_subdomain_ : nullable_boolean)
    ~status:(status_ : custom_domain_association_status) () =
  ({
     domain_name = domain_name_;
     enable_www_subdomain = enable_www_subdomain_;
     certificate_validation_records = certificate_validation_records_;
     status = status_;
   }
    : custom_domain)

let make_disassociate_custom_domain_response ~dns_target:(dns_target_ : string_)
    ~service_arn:(service_arn_ : app_runner_resource_arn)
    ~custom_domain:(custom_domain_ : custom_domain)
    ~vpc_dns_targets:(vpc_dns_targets_ : vpc_dns_target_list) () =
  ({
     dns_target = dns_target_;
     service_arn = service_arn_;
     custom_domain = custom_domain_;
     vpc_dns_targets = vpc_dns_targets_;
   }
    : disassociate_custom_domain_response)

let make_disassociate_custom_domain_request ~service_arn:(service_arn_ : app_runner_resource_arn)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ service_arn = service_arn_; domain_name = domain_name_ } : disassociate_custom_domain_request)

let make_describe_vpc_ingress_connection_response
    ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : describe_vpc_ingress_connection_response)

let make_describe_vpc_ingress_connection_request
    ~vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : app_runner_resource_arn) () =
  ({ vpc_ingress_connection_arn = vpc_ingress_connection_arn_ }
    : describe_vpc_ingress_connection_request)

let make_describe_vpc_connector_response ~vpc_connector:(vpc_connector_ : vpc_connector) () =
  ({ vpc_connector = vpc_connector_ } : describe_vpc_connector_response)

let make_describe_vpc_connector_request
    ~vpc_connector_arn:(vpc_connector_arn_ : app_runner_resource_arn) () =
  ({ vpc_connector_arn = vpc_connector_arn_ } : describe_vpc_connector_request)

let make_describe_service_response ~service:(service_ : service) () =
  ({ service = service_ } : describe_service_response)

let make_describe_service_request ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({ service_arn = service_arn_ } : describe_service_request)

let make_trace_configuration ~vendor:(vendor_ : tracing_vendor) () =
  ({ vendor = vendor_ } : trace_configuration)

let make_observability_configuration
    ?observability_configuration_arn:
      (observability_configuration_arn_ : app_runner_resource_arn option)
    ?observability_configuration_name:
      (observability_configuration_name_ : observability_configuration_name option)
    ?trace_configuration:(trace_configuration_ : trace_configuration option)
    ?observability_configuration_revision:(observability_configuration_revision_ : integer option)
    ?latest:(latest_ : boolean_ option)
    ?status:(status_ : observability_configuration_status option)
    ?created_at:(created_at_ : timestamp option) ?deleted_at:(deleted_at_ : timestamp option) () =
  ({
     observability_configuration_arn = observability_configuration_arn_;
     observability_configuration_name = observability_configuration_name_;
     trace_configuration = trace_configuration_;
     observability_configuration_revision = observability_configuration_revision_;
     latest = latest_;
     status = status_;
     created_at = created_at_;
     deleted_at = deleted_at_;
   }
    : observability_configuration)

let make_describe_observability_configuration_response
    ~observability_configuration:(observability_configuration_ : observability_configuration) () =
  ({ observability_configuration = observability_configuration_ }
    : describe_observability_configuration_response)

let make_describe_observability_configuration_request
    ~observability_configuration_arn:(observability_configuration_arn_ : app_runner_resource_arn) ()
    =
  ({ observability_configuration_arn = observability_configuration_arn_ }
    : describe_observability_configuration_request)

let make_describe_custom_domains_response ?next_token:(next_token_ : string_ option)
    ~dns_target:(dns_target_ : string_) ~service_arn:(service_arn_ : app_runner_resource_arn)
    ~custom_domains:(custom_domains_ : custom_domain_list)
    ~vpc_dns_targets:(vpc_dns_targets_ : vpc_dns_target_list) () =
  ({
     dns_target = dns_target_;
     service_arn = service_arn_;
     custom_domains = custom_domains_;
     vpc_dns_targets = vpc_dns_targets_;
     next_token = next_token_;
   }
    : describe_custom_domains_response)

let make_describe_custom_domains_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : describe_custom_domains_max_results option)
    ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({ service_arn = service_arn_; next_token = next_token_; max_results = max_results_ }
    : describe_custom_domains_request)

let make_describe_auto_scaling_configuration_response
    ~auto_scaling_configuration:(auto_scaling_configuration_ : auto_scaling_configuration) () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ }
    : describe_auto_scaling_configuration_response)

let make_describe_auto_scaling_configuration_request
    ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : app_runner_resource_arn) () =
  ({ auto_scaling_configuration_arn = auto_scaling_configuration_arn_ }
    : describe_auto_scaling_configuration_request)

let make_delete_vpc_ingress_connection_response
    ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : delete_vpc_ingress_connection_response)

let make_delete_vpc_ingress_connection_request
    ~vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : app_runner_resource_arn) () =
  ({ vpc_ingress_connection_arn = vpc_ingress_connection_arn_ }
    : delete_vpc_ingress_connection_request)

let make_delete_vpc_connector_response ~vpc_connector:(vpc_connector_ : vpc_connector) () =
  ({ vpc_connector = vpc_connector_ } : delete_vpc_connector_response)

let make_delete_vpc_connector_request
    ~vpc_connector_arn:(vpc_connector_arn_ : app_runner_resource_arn) () =
  ({ vpc_connector_arn = vpc_connector_arn_ } : delete_vpc_connector_request)

let make_delete_service_response ~service:(service_ : service) ~operation_id:(operation_id_ : uui_d)
    () =
  ({ service = service_; operation_id = operation_id_ } : delete_service_response)

let make_delete_service_request ~service_arn:(service_arn_ : app_runner_resource_arn) () =
  ({ service_arn = service_arn_ } : delete_service_request)

let make_delete_observability_configuration_response
    ~observability_configuration:(observability_configuration_ : observability_configuration) () =
  ({ observability_configuration = observability_configuration_ }
    : delete_observability_configuration_response)

let make_delete_observability_configuration_request
    ~observability_configuration_arn:(observability_configuration_arn_ : app_runner_resource_arn) ()
    =
  ({ observability_configuration_arn = observability_configuration_arn_ }
    : delete_observability_configuration_request)

let make_connection ?connection_name:(connection_name_ : connection_name option)
    ?connection_arn:(connection_arn_ : app_runner_resource_arn option)
    ?provider_type:(provider_type_ : provider_type option)
    ?status:(status_ : connection_status option) ?created_at:(created_at_ : timestamp option) () =
  ({
     connection_name = connection_name_;
     connection_arn = connection_arn_;
     provider_type = provider_type_;
     status = status_;
     created_at = created_at_;
   }
    : connection)

let make_delete_connection_response ?connection:(connection_ : connection option) () =
  ({ connection = connection_ } : delete_connection_response)

let make_delete_connection_request ~connection_arn:(connection_arn_ : app_runner_resource_arn) () =
  ({ connection_arn = connection_arn_ } : delete_connection_request)

let make_delete_auto_scaling_configuration_response
    ~auto_scaling_configuration:(auto_scaling_configuration_ : auto_scaling_configuration) () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ }
    : delete_auto_scaling_configuration_response)

let make_delete_auto_scaling_configuration_request
    ?delete_all_revisions:(delete_all_revisions_ : boolean_ option)
    ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : app_runner_resource_arn) () =
  ({
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     delete_all_revisions = delete_all_revisions_;
   }
    : delete_auto_scaling_configuration_request)

let make_create_vpc_ingress_connection_response
    ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : create_vpc_ingress_connection_response)

let make_create_vpc_ingress_connection_request ?tags:(tags_ : tag_list option)
    ~service_arn:(service_arn_ : app_runner_resource_arn)
    ~vpc_ingress_connection_name:(vpc_ingress_connection_name_ : vpc_ingress_connection_name)
    ~ingress_vpc_configuration:(ingress_vpc_configuration_ : ingress_vpc_configuration) () =
  ({
     service_arn = service_arn_;
     vpc_ingress_connection_name = vpc_ingress_connection_name_;
     ingress_vpc_configuration = ingress_vpc_configuration_;
     tags = tags_;
   }
    : create_vpc_ingress_connection_request)

let make_create_vpc_connector_response ~vpc_connector:(vpc_connector_ : vpc_connector) () =
  ({ vpc_connector = vpc_connector_ } : create_vpc_connector_response)

let make_create_vpc_connector_request ?security_groups:(security_groups_ : string_list option)
    ?tags:(tags_ : tag_list option) ~vpc_connector_name:(vpc_connector_name_ : vpc_connector_name)
    ~subnets:(subnets_ : string_list) () =
  ({
     vpc_connector_name = vpc_connector_name_;
     subnets = subnets_;
     security_groups = security_groups_;
     tags = tags_;
   }
    : create_vpc_connector_request)

let make_create_service_response ~service:(service_ : service) ~operation_id:(operation_id_ : uui_d)
    () =
  ({ service = service_; operation_id = operation_id_ } : create_service_response)

let make_create_service_request
    ?instance_configuration:(instance_configuration_ : instance_configuration option)
    ?tags:(tags_ : tag_list option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?health_check_configuration:(health_check_configuration_ : health_check_configuration option)
    ?auto_scaling_configuration_arn:
      (auto_scaling_configuration_arn_ : app_runner_resource_arn option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?observability_configuration:
      (observability_configuration_ : service_observability_configuration option)
    ~service_name:(service_name_ : service_name)
    ~source_configuration:(source_configuration_ : source_configuration) () =
  ({
     service_name = service_name_;
     source_configuration = source_configuration_;
     instance_configuration = instance_configuration_;
     tags = tags_;
     encryption_configuration = encryption_configuration_;
     health_check_configuration = health_check_configuration_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     network_configuration = network_configuration_;
     observability_configuration = observability_configuration_;
   }
    : create_service_request)

let make_create_observability_configuration_response
    ~observability_configuration:(observability_configuration_ : observability_configuration) () =
  ({ observability_configuration = observability_configuration_ }
    : create_observability_configuration_response)

let make_create_observability_configuration_request
    ?trace_configuration:(trace_configuration_ : trace_configuration option)
    ?tags:(tags_ : tag_list option)
    ~observability_configuration_name:
      (observability_configuration_name_ : observability_configuration_name) () =
  ({
     observability_configuration_name = observability_configuration_name_;
     trace_configuration = trace_configuration_;
     tags = tags_;
   }
    : create_observability_configuration_request)

let make_create_connection_response ~connection:(connection_ : connection) () =
  ({ connection = connection_ } : create_connection_response)

let make_create_connection_request ?tags:(tags_ : tag_list option)
    ~connection_name:(connection_name_ : connection_name)
    ~provider_type:(provider_type_ : provider_type) () =
  ({ connection_name = connection_name_; provider_type = provider_type_; tags = tags_ }
    : create_connection_request)

let make_create_auto_scaling_configuration_response
    ~auto_scaling_configuration:(auto_scaling_configuration_ : auto_scaling_configuration) () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ }
    : create_auto_scaling_configuration_response)

let make_create_auto_scaling_configuration_request
    ?max_concurrency:(max_concurrency_ : as_config_max_concurrency option)
    ?min_size:(min_size_ : as_config_min_size option)
    ?max_size:(max_size_ : as_config_max_size option) ?tags:(tags_ : tag_list option)
    ~auto_scaling_configuration_name:
      (auto_scaling_configuration_name_ : auto_scaling_configuration_name) () =
  ({
     auto_scaling_configuration_name = auto_scaling_configuration_name_;
     max_concurrency = max_concurrency_;
     min_size = min_size_;
     max_size = max_size_;
     tags = tags_;
   }
    : create_auto_scaling_configuration_request)

let make_associate_custom_domain_response ~dns_target:(dns_target_ : string_)
    ~service_arn:(service_arn_ : app_runner_resource_arn)
    ~custom_domain:(custom_domain_ : custom_domain)
    ~vpc_dns_targets:(vpc_dns_targets_ : vpc_dns_target_list) () =
  ({
     dns_target = dns_target_;
     service_arn = service_arn_;
     custom_domain = custom_domain_;
     vpc_dns_targets = vpc_dns_targets_;
   }
    : associate_custom_domain_response)

let make_associate_custom_domain_request
    ?enable_www_subdomain:(enable_www_subdomain_ : nullable_boolean option)
    ~service_arn:(service_arn_ : app_runner_resource_arn) ~domain_name:(domain_name_ : domain_name)
    () =
  ({
     service_arn = service_arn_;
     domain_name = domain_name_;
     enable_www_subdomain = enable_www_subdomain_;
   }
    : associate_custom_domain_request)
