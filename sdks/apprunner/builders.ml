open Smaws_Lib
open Types
let make_vpc_ingress_connection_summary
  ?service_arn:(service_arn_ : string option) 
  ?vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : string option) 
  () =
  ({
     service_arn = service_arn_;
     vpc_ingress_connection_arn = vpc_ingress_connection_arn_
   } : vpc_ingress_connection_summary)
let make_ingress_vpc_configuration
  ?vpc_endpoint_id:(vpc_endpoint_id_ : string option) 
  ?vpc_id:(vpc_id_ : string option)  () =
  ({ vpc_endpoint_id = vpc_endpoint_id_; vpc_id = vpc_id_ } : ingress_vpc_configuration)
let make_vpc_ingress_connection
  ?deleted_at:(deleted_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?ingress_vpc_configuration:(ingress_vpc_configuration_ :
                               ingress_vpc_configuration option)
   ?domain_name:(domain_name_ : string option) 
  ?account_id:(account_id_ : string option) 
  ?status:(status_ : vpc_ingress_connection_status option) 
  ?service_arn:(service_arn_ : string option) 
  ?vpc_ingress_connection_name:(vpc_ingress_connection_name_ : string option)
   ?vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : string option) 
  () =
  ({
     deleted_at = deleted_at_;
     created_at = created_at_;
     ingress_vpc_configuration = ingress_vpc_configuration_;
     domain_name = domain_name_;
     account_id = account_id_;
     status = status_;
     service_arn = service_arn_;
     vpc_ingress_connection_name = vpc_ingress_connection_name_;
     vpc_ingress_connection_arn = vpc_ingress_connection_arn_
   } : vpc_ingress_connection)
let make_vpc_dns_target ?domain_name:(domain_name_ : string option) 
  ?vpc_id:(vpc_id_ : string option) 
  ?vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : string option) 
  () =
  ({
     domain_name = domain_name_;
     vpc_id = vpc_id_;
     vpc_ingress_connection_arn = vpc_ingress_connection_arn_
   } : vpc_dns_target)
let make_vpc_connector
  ?deleted_at:(deleted_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : vpc_connector_status option) 
  ?security_groups:(security_groups_ : string list option) 
  ?subnets:(subnets_ : string list option) 
  ?vpc_connector_revision:(vpc_connector_revision_ : int option) 
  ?vpc_connector_arn:(vpc_connector_arn_ : string option) 
  ?vpc_connector_name:(vpc_connector_name_ : string option)  () =
  ({
     deleted_at = deleted_at_;
     created_at = created_at_;
     status = status_;
     security_groups = security_groups_;
     subnets = subnets_;
     vpc_connector_revision = vpc_connector_revision_;
     vpc_connector_arn = vpc_connector_arn_;
     vpc_connector_name = vpc_connector_name_
   } : vpc_connector)
let make_update_vpc_ingress_connection_response
  ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) 
  () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : update_vpc_ingress_connection_response)
let make_update_vpc_ingress_connection_request
  ~ingress_vpc_configuration:(ingress_vpc_configuration_ :
                               ingress_vpc_configuration)
   ~vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : string)  () =
  ({
     ingress_vpc_configuration = ingress_vpc_configuration_;
     vpc_ingress_connection_arn = vpc_ingress_connection_arn_
   } : update_vpc_ingress_connection_request)
let make_source_code_version ~value:(value_ : string) 
  ~type_:(type__ : source_code_version_type)  () =
  ({ value = value_; type_ = type__ } : source_code_version)
let make_code_configuration_values
  ?runtime_environment_secrets:(runtime_environment_secrets_ :
                                 runtime_environment_secrets option)
   ?runtime_environment_variables:(runtime_environment_variables_ :
                                    runtime_environment_variables option)
   ?port:(port_ : string option) 
  ?start_command:(start_command_ : string option) 
  ?build_command:(build_command_ : string option) 
  ~runtime:(runtime_ : runtime)  () =
  ({
     runtime_environment_secrets = runtime_environment_secrets_;
     runtime_environment_variables = runtime_environment_variables_;
     port = port_;
     start_command = start_command_;
     build_command = build_command_;
     runtime = runtime_
   } : code_configuration_values)
let make_code_configuration
  ?code_configuration_values:(code_configuration_values_ :
                               code_configuration_values option)
   ~configuration_source:(configuration_source_ : configuration_source)  () =
  ({
     code_configuration_values = code_configuration_values_;
     configuration_source = configuration_source_
   } : code_configuration)
let make_code_repository
  ?source_directory:(source_directory_ : string option) 
  ?code_configuration:(code_configuration_ : code_configuration option) 
  ~source_code_version:(source_code_version_ : source_code_version) 
  ~repository_url:(repository_url_ : string)  () =
  ({
     source_directory = source_directory_;
     code_configuration = code_configuration_;
     source_code_version = source_code_version_;
     repository_url = repository_url_
   } : code_repository)
let make_image_configuration
  ?runtime_environment_secrets:(runtime_environment_secrets_ :
                                 runtime_environment_secrets option)
   ?port:(port_ : string option) 
  ?start_command:(start_command_ : string option) 
  ?runtime_environment_variables:(runtime_environment_variables_ :
                                   runtime_environment_variables option)
   () =
  ({
     runtime_environment_secrets = runtime_environment_secrets_;
     port = port_;
     start_command = start_command_;
     runtime_environment_variables = runtime_environment_variables_
   } : image_configuration)
let make_image_repository
  ?image_configuration:(image_configuration_ : image_configuration option) 
  ~image_repository_type:(image_repository_type_ : image_repository_type) 
  ~image_identifier:(image_identifier_ : string)  () =
  ({
     image_repository_type = image_repository_type_;
     image_configuration = image_configuration_;
     image_identifier = image_identifier_
   } : image_repository)
let make_authentication_configuration
  ?access_role_arn:(access_role_arn_ : string option) 
  ?connection_arn:(connection_arn_ : string option)  () =
  ({ access_role_arn = access_role_arn_; connection_arn = connection_arn_ } : 
  authentication_configuration)
let make_source_configuration
  ?authentication_configuration:(authentication_configuration_ :
                                  authentication_configuration option)
   ?auto_deployments_enabled:(auto_deployments_enabled_ : bool option) 
  ?image_repository:(image_repository_ : image_repository option) 
  ?code_repository:(code_repository_ : code_repository option)  () =
  ({
     authentication_configuration = authentication_configuration_;
     auto_deployments_enabled = auto_deployments_enabled_;
     image_repository = image_repository_;
     code_repository = code_repository_
   } : source_configuration)
let make_instance_configuration
  ?instance_role_arn:(instance_role_arn_ : string option) 
  ?memory:(memory_ : string option)  ?cpu:(cpu_ : string option)  () =
  ({ instance_role_arn = instance_role_arn_; memory = memory_; cpu = cpu_ } : 
  instance_configuration)
let make_encryption_configuration ~kms_key:(kms_key_ : string)  () =
  ({ kms_key = kms_key_ } : encryption_configuration)
let make_health_check_configuration
  ?unhealthy_threshold:(unhealthy_threshold_ : int option) 
  ?healthy_threshold:(healthy_threshold_ : int option) 
  ?timeout:(timeout_ : int option)  ?interval:(interval_ : int option) 
  ?path:(path_ : string option) 
  ?protocol:(protocol_ : health_check_protocol option)  () =
  ({
     unhealthy_threshold = unhealthy_threshold_;
     healthy_threshold = healthy_threshold_;
     timeout = timeout_;
     interval = interval_;
     path = path_;
     protocol = protocol_
   } : health_check_configuration)
let make_auto_scaling_configuration_summary
  ?is_default:(is_default_ : bool option) 
  ?has_associated_service:(has_associated_service_ : bool option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : auto_scaling_configuration_status option) 
  ?auto_scaling_configuration_revision:(auto_scaling_configuration_revision_
                                         : int option)
   ?auto_scaling_configuration_name:(auto_scaling_configuration_name_ :
                                      string option)
   ?auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ :
                                     string option)
   () =
  ({
     is_default = is_default_;
     has_associated_service = has_associated_service_;
     created_at = created_at_;
     status = status_;
     auto_scaling_configuration_revision =
       auto_scaling_configuration_revision_;
     auto_scaling_configuration_name = auto_scaling_configuration_name_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_
   } : auto_scaling_configuration_summary)
let make_egress_configuration
  ?vpc_connector_arn:(vpc_connector_arn_ : string option) 
  ?egress_type:(egress_type_ : egress_type option)  () =
  ({ vpc_connector_arn = vpc_connector_arn_; egress_type = egress_type_ } : 
  egress_configuration)
let make_ingress_configuration
  ?is_publicly_accessible:(is_publicly_accessible_ : bool option)  () =
  ({ is_publicly_accessible = is_publicly_accessible_ } : ingress_configuration)
let make_network_configuration
  ?ip_address_type:(ip_address_type_ : ip_address_type option) 
  ?ingress_configuration:(ingress_configuration_ :
                           ingress_configuration option)
   ?egress_configuration:(egress_configuration_ :
                           egress_configuration option)
   () =
  ({
     ip_address_type = ip_address_type_;
     ingress_configuration = ingress_configuration_;
     egress_configuration = egress_configuration_
   } : network_configuration)
let make_service_observability_configuration
  ?observability_configuration_arn:(observability_configuration_arn_ :
                                     string option)
   ~observability_enabled:(observability_enabled_ : bool)  () =
  ({
     observability_configuration_arn = observability_configuration_arn_;
     observability_enabled = observability_enabled_
   } : service_observability_configuration)
let make_service
  ?observability_configuration:(observability_configuration_ :
                                 service_observability_configuration option)
   ?health_check_configuration:(health_check_configuration_ :
                                 health_check_configuration option)
   ?encryption_configuration:(encryption_configuration_ :
                               encryption_configuration option)
   ?deleted_at:(deleted_at_ : CoreTypes.Timestamp.t option) 
  ?service_url:(service_url_ : string option) 
  ~network_configuration:(network_configuration_ : network_configuration) 
  ~auto_scaling_configuration_summary:(auto_scaling_configuration_summary_ :
                                        auto_scaling_configuration_summary)
   ~instance_configuration:(instance_configuration_ : instance_configuration)
   ~source_configuration:(source_configuration_ : source_configuration) 
  ~status:(status_ : service_status) 
  ~updated_at:(updated_at_ : CoreTypes.Timestamp.t) 
  ~created_at:(created_at_ : CoreTypes.Timestamp.t) 
  ~service_arn:(service_arn_ : string)  ~service_id:(service_id_ : string) 
  ~service_name:(service_name_ : string)  () =
  ({
     observability_configuration = observability_configuration_;
     network_configuration = network_configuration_;
     auto_scaling_configuration_summary = auto_scaling_configuration_summary_;
     health_check_configuration = health_check_configuration_;
     encryption_configuration = encryption_configuration_;
     instance_configuration = instance_configuration_;
     source_configuration = source_configuration_;
     status = status_;
     deleted_at = deleted_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     service_url = service_url_;
     service_arn = service_arn_;
     service_id = service_id_;
     service_name = service_name_
   } : service)
let make_update_service_response ~operation_id:(operation_id_ : string) 
  ~service:(service_ : service)  () =
  ({ operation_id = operation_id_; service = service_ } : update_service_response)
let make_update_service_request
  ?observability_configuration:(observability_configuration_ :
                                 service_observability_configuration option)
   ?network_configuration:(network_configuration_ :
                            network_configuration option)
   ?health_check_configuration:(health_check_configuration_ :
                                 health_check_configuration option)
   ?auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ :
                                     string option)
   ?instance_configuration:(instance_configuration_ :
                             instance_configuration option)
   ?source_configuration:(source_configuration_ :
                           source_configuration option)
   ~service_arn:(service_arn_ : string)  () =
  ({
     observability_configuration = observability_configuration_;
     network_configuration = network_configuration_;
     health_check_configuration = health_check_configuration_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     instance_configuration = instance_configuration_;
     source_configuration = source_configuration_;
     service_arn = service_arn_
   } : update_service_request)
let make_auto_scaling_configuration ?is_default:(is_default_ : bool option) 
  ?has_associated_service:(has_associated_service_ : bool option) 
  ?deleted_at:(deleted_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?max_size:(max_size_ : int option)  ?min_size:(min_size_ : int option) 
  ?max_concurrency:(max_concurrency_ : int option) 
  ?status:(status_ : auto_scaling_configuration_status option) 
  ?latest:(latest_ : bool option) 
  ?auto_scaling_configuration_revision:(auto_scaling_configuration_revision_
                                         : int option)
   ?auto_scaling_configuration_name:(auto_scaling_configuration_name_ :
                                      string option)
   ?auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ :
                                     string option)
   () =
  ({
     is_default = is_default_;
     has_associated_service = has_associated_service_;
     deleted_at = deleted_at_;
     created_at = created_at_;
     max_size = max_size_;
     min_size = min_size_;
     max_concurrency = max_concurrency_;
     status = status_;
     latest = latest_;
     auto_scaling_configuration_revision =
       auto_scaling_configuration_revision_;
     auto_scaling_configuration_name = auto_scaling_configuration_name_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_
   } : auto_scaling_configuration)
let make_update_default_auto_scaling_configuration_response
  ~auto_scaling_configuration:(auto_scaling_configuration_ :
                                auto_scaling_configuration)
   () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ } : update_default_auto_scaling_configuration_response)
let make_update_default_auto_scaling_configuration_request
  ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : string) 
  () =
  ({ auto_scaling_configuration_arn = auto_scaling_configuration_arn_ } : 
  update_default_auto_scaling_configuration_request)
let make_untag_resource_response () = (() : unit)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)
let make_trace_configuration ~vendor:(vendor_ : tracing_vendor)  () =
  ({ vendor = vendor_ } : trace_configuration)
let make_tag_resource_response () = (() : unit)
let make_tag ?value:(value_ : string option)  ?key:(key_ : string option)  ()
  = ({ value = value_; key = key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag list) 
  ~resource_arn:(resource_arn_ : string)  () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)
let make_start_deployment_response ~operation_id:(operation_id_ : string)  ()
  = ({ operation_id = operation_id_ } : start_deployment_response)
let make_start_deployment_request ~service_arn:(service_arn_ : string)  () =
  ({ service_arn = service_arn_ } : start_deployment_request)
let make_service_summary ?status:(status_ : service_status option) 
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?service_url:(service_url_ : string option) 
  ?service_arn:(service_arn_ : string option) 
  ?service_id:(service_id_ : string option) 
  ?service_name:(service_name_ : string option)  () =
  ({
     status = status_;
     updated_at = updated_at_;
     created_at = created_at_;
     service_url = service_url_;
     service_arn = service_arn_;
     service_id = service_id_;
     service_name = service_name_
   } : service_summary)
let make_resume_service_response
  ?operation_id:(operation_id_ : string option) 
  ~service:(service_ : service)  () =
  ({ operation_id = operation_id_; service = service_ } : resume_service_response)
let make_resume_service_request ~service_arn:(service_arn_ : string)  () =
  ({ service_arn = service_arn_ } : resume_service_request)
let make_pause_service_response ?operation_id:(operation_id_ : string option)
   ~service:(service_ : service)  () =
  ({ operation_id = operation_id_; service = service_ } : pause_service_response)
let make_pause_service_request ~service_arn:(service_arn_ : string)  () =
  ({ service_arn = service_arn_ } : pause_service_request)
let make_operation_summary
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option) 
  ?ended_at:(ended_at_ : CoreTypes.Timestamp.t option) 
  ?started_at:(started_at_ : CoreTypes.Timestamp.t option) 
  ?target_arn:(target_arn_ : string option) 
  ?status:(status_ : operation_status option) 
  ?type_:(type__ : operation_type option)  ?id:(id_ : string option)  () =
  ({
     updated_at = updated_at_;
     ended_at = ended_at_;
     started_at = started_at_;
     target_arn = target_arn_;
     status = status_;
     type_ = type__;
     id = id_
   } : operation_summary)
let make_observability_configuration_summary
  ?observability_configuration_revision:(observability_configuration_revision_
                                          : int option)
   ?observability_configuration_name:(observability_configuration_name_ :
                                       string option)
   ?observability_configuration_arn:(observability_configuration_arn_ :
                                      string option)
   () =
  ({
     observability_configuration_revision =
       observability_configuration_revision_;
     observability_configuration_name = observability_configuration_name_;
     observability_configuration_arn = observability_configuration_arn_
   } : observability_configuration_summary)
let make_observability_configuration
  ?deleted_at:(deleted_at_ : CoreTypes.Timestamp.t option) 
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : observability_configuration_status option) 
  ?latest:(latest_ : bool option) 
  ?observability_configuration_revision:(observability_configuration_revision_
                                          : int option)
   ?trace_configuration:(trace_configuration_ : trace_configuration option) 
  ?observability_configuration_name:(observability_configuration_name_ :
                                      string option)
   ?observability_configuration_arn:(observability_configuration_arn_ :
                                      string option)
   () =
  ({
     deleted_at = deleted_at_;
     created_at = created_at_;
     status = status_;
     latest = latest_;
     observability_configuration_revision =
       observability_configuration_revision_;
     trace_configuration = trace_configuration_;
     observability_configuration_name = observability_configuration_name_;
     observability_configuration_arn = observability_configuration_arn_
   } : observability_configuration)
let make_list_vpc_ingress_connections_response
  ?next_token:(next_token_ : string option) 
  ~vpc_ingress_connection_summary_list:(vpc_ingress_connection_summary_list_
                                         :
                                         vpc_ingress_connection_summary list)
   () =
  ({
     next_token = next_token_;
     vpc_ingress_connection_summary_list =
       vpc_ingress_connection_summary_list_
   } : list_vpc_ingress_connections_response)
let make_list_vpc_ingress_connections_filter
  ?vpc_endpoint_id:(vpc_endpoint_id_ : string option) 
  ?service_arn:(service_arn_ : string option)  () =
  ({ vpc_endpoint_id = vpc_endpoint_id_; service_arn = service_arn_ } : 
  list_vpc_ingress_connections_filter)
let make_list_vpc_ingress_connections_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?filter:(filter_ : list_vpc_ingress_connections_filter option)  () =
  ({ next_token = next_token_; max_results = max_results_; filter = filter_ } : 
  list_vpc_ingress_connections_request)
let make_list_vpc_connectors_response
  ?next_token:(next_token_ : string option) 
  ~vpc_connectors:(vpc_connectors_ : vpc_connector list)  () =
  ({ next_token = next_token_; vpc_connectors = vpc_connectors_ } : list_vpc_connectors_response)
let make_list_vpc_connectors_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_vpc_connectors_request)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option)  ()
  = ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_arn:(resource_arn_ : string)  () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)
let make_list_services_response ?next_token:(next_token_ : string option) 
  ~service_summary_list:(service_summary_list_ : service_summary list)  () =
  ({ next_token = next_token_; service_summary_list = service_summary_list_ } : 
  list_services_response)
let make_list_services_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  () =
  ({ max_results = max_results_; next_token = next_token_ } : list_services_request)
let make_list_services_for_auto_scaling_configuration_response
  ?next_token:(next_token_ : string option) 
  ~service_arn_list:(service_arn_list_ : string list)  () =
  ({ next_token = next_token_; service_arn_list = service_arn_list_ } : 
  list_services_for_auto_scaling_configuration_response)
let make_list_services_for_auto_scaling_configuration_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : string) 
  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_
   } : list_services_for_auto_scaling_configuration_request)
let make_list_operations_response ?next_token:(next_token_ : string option) 
  ?operation_summary_list:(operation_summary_list_ :
                            operation_summary list option)
   () =
  ({
     next_token = next_token_;
     operation_summary_list = operation_summary_list_
   } : list_operations_response)
let make_list_operations_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~service_arn:(service_arn_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     service_arn = service_arn_
   } : list_operations_request)
let make_list_observability_configurations_response
  ?next_token:(next_token_ : string option) 
  ~observability_configuration_summary_list:(observability_configuration_summary_list_
                                              :
                                              observability_configuration_summary
                                                list)
   () =
  ({
     next_token = next_token_;
     observability_configuration_summary_list =
       observability_configuration_summary_list_
   } : list_observability_configurations_response)
let make_list_observability_configurations_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?latest_only:(latest_only_ : bool option) 
  ?observability_configuration_name:(observability_configuration_name_ :
                                      string option)
   () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     latest_only = latest_only_;
     observability_configuration_name = observability_configuration_name_
   } : list_observability_configurations_request)
let make_connection_summary
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : connection_status option) 
  ?provider_type:(provider_type_ : provider_type option) 
  ?connection_arn:(connection_arn_ : string option) 
  ?connection_name:(connection_name_ : string option)  () =
  ({
     created_at = created_at_;
     status = status_;
     provider_type = provider_type_;
     connection_arn = connection_arn_;
     connection_name = connection_name_
   } : connection_summary)
let make_list_connections_response ?next_token:(next_token_ : string option) 
  ~connection_summary_list:(connection_summary_list_ :
                             connection_summary list)
   () =
  ({
     next_token = next_token_;
     connection_summary_list = connection_summary_list_
   } : list_connections_response)
let make_list_connections_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?connection_name:(connection_name_ : string option)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     connection_name = connection_name_
   } : list_connections_request)
let make_list_auto_scaling_configurations_response
  ?next_token:(next_token_ : string option) 
  ~auto_scaling_configuration_summary_list:(auto_scaling_configuration_summary_list_
                                             :
                                             auto_scaling_configuration_summary
                                               list)
   () =
  ({
     next_token = next_token_;
     auto_scaling_configuration_summary_list =
       auto_scaling_configuration_summary_list_
   } : list_auto_scaling_configurations_response)
let make_list_auto_scaling_configurations_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?latest_only:(latest_only_ : bool option) 
  ?auto_scaling_configuration_name:(auto_scaling_configuration_name_ :
                                     string option)
   () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     latest_only = latest_only_;
     auto_scaling_configuration_name = auto_scaling_configuration_name_
   } : list_auto_scaling_configurations_request)
let make_certificate_validation_record
  ?status:(status_ : certificate_validation_record_status option) 
  ?value:(value_ : string option)  ?type_:(type__ : string option) 
  ?name:(name_ : string option)  () =
  ({ status = status_; value = value_; type_ = type__; name = name_ } : 
  certificate_validation_record)
let make_custom_domain
  ?certificate_validation_records:(certificate_validation_records_ :
                                    certificate_validation_record list option)
   ~status:(status_ : custom_domain_association_status) 
  ~enable_www_subdomain:(enable_www_subdomain_ : bool) 
  ~domain_name:(domain_name_ : string)  () =
  ({
     status = status_;
     certificate_validation_records = certificate_validation_records_;
     enable_www_subdomain = enable_www_subdomain_;
     domain_name = domain_name_
   } : custom_domain)
let make_disassociate_custom_domain_response
  ~vpc_dns_targets:(vpc_dns_targets_ : vpc_dns_target list) 
  ~custom_domain:(custom_domain_ : custom_domain) 
  ~service_arn:(service_arn_ : string)  ~dns_target:(dns_target_ : string) 
  () =
  ({
     vpc_dns_targets = vpc_dns_targets_;
     custom_domain = custom_domain_;
     service_arn = service_arn_;
     dns_target = dns_target_
   } : disassociate_custom_domain_response)
let make_disassociate_custom_domain_request
  ~domain_name:(domain_name_ : string)  ~service_arn:(service_arn_ : string) 
  () =
  ({ domain_name = domain_name_; service_arn = service_arn_ } : disassociate_custom_domain_request)
let make_describe_vpc_ingress_connection_response
  ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) 
  () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : describe_vpc_ingress_connection_response)
let make_describe_vpc_ingress_connection_request
  ~vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : string)  () =
  ({ vpc_ingress_connection_arn = vpc_ingress_connection_arn_ } : describe_vpc_ingress_connection_request)
let make_describe_vpc_connector_response
  ~vpc_connector:(vpc_connector_ : vpc_connector)  () =
  ({ vpc_connector = vpc_connector_ } : describe_vpc_connector_response)
let make_describe_vpc_connector_request
  ~vpc_connector_arn:(vpc_connector_arn_ : string)  () =
  ({ vpc_connector_arn = vpc_connector_arn_ } : describe_vpc_connector_request)
let make_describe_service_response ~service:(service_ : service)  () =
  ({ service = service_ } : describe_service_response)
let make_describe_service_request ~service_arn:(service_arn_ : string)  () =
  ({ service_arn = service_arn_ } : describe_service_request)
let make_describe_observability_configuration_response
  ~observability_configuration:(observability_configuration_ :
                                 observability_configuration)
   () =
  ({ observability_configuration = observability_configuration_ } : describe_observability_configuration_response)
let make_describe_observability_configuration_request
  ~observability_configuration_arn:(observability_configuration_arn_ :
                                     string)
   () =
  ({ observability_configuration_arn = observability_configuration_arn_ } : 
  describe_observability_configuration_request)
let make_describe_custom_domains_response
  ?next_token:(next_token_ : string option) 
  ~vpc_dns_targets:(vpc_dns_targets_ : vpc_dns_target list) 
  ~custom_domains:(custom_domains_ : custom_domain list) 
  ~service_arn:(service_arn_ : string)  ~dns_target:(dns_target_ : string) 
  () =
  ({
     next_token = next_token_;
     vpc_dns_targets = vpc_dns_targets_;
     custom_domains = custom_domains_;
     service_arn = service_arn_;
     dns_target = dns_target_
   } : describe_custom_domains_response)
let make_describe_custom_domains_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~service_arn:(service_arn_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     service_arn = service_arn_
   } : describe_custom_domains_request)
let make_describe_auto_scaling_configuration_response
  ~auto_scaling_configuration:(auto_scaling_configuration_ :
                                auto_scaling_configuration)
   () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ } : describe_auto_scaling_configuration_response)
let make_describe_auto_scaling_configuration_request
  ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : string) 
  () =
  ({ auto_scaling_configuration_arn = auto_scaling_configuration_arn_ } : 
  describe_auto_scaling_configuration_request)
let make_delete_vpc_ingress_connection_response
  ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) 
  () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : delete_vpc_ingress_connection_response)
let make_delete_vpc_ingress_connection_request
  ~vpc_ingress_connection_arn:(vpc_ingress_connection_arn_ : string)  () =
  ({ vpc_ingress_connection_arn = vpc_ingress_connection_arn_ } : delete_vpc_ingress_connection_request)
let make_delete_vpc_connector_response
  ~vpc_connector:(vpc_connector_ : vpc_connector)  () =
  ({ vpc_connector = vpc_connector_ } : delete_vpc_connector_response)
let make_delete_vpc_connector_request
  ~vpc_connector_arn:(vpc_connector_arn_ : string)  () =
  ({ vpc_connector_arn = vpc_connector_arn_ } : delete_vpc_connector_request)
let make_delete_service_response ~operation_id:(operation_id_ : string) 
  ~service:(service_ : service)  () =
  ({ operation_id = operation_id_; service = service_ } : delete_service_response)
let make_delete_service_request ~service_arn:(service_arn_ : string)  () =
  ({ service_arn = service_arn_ } : delete_service_request)
let make_delete_observability_configuration_response
  ~observability_configuration:(observability_configuration_ :
                                 observability_configuration)
   () =
  ({ observability_configuration = observability_configuration_ } : delete_observability_configuration_response)
let make_delete_observability_configuration_request
  ~observability_configuration_arn:(observability_configuration_arn_ :
                                     string)
   () =
  ({ observability_configuration_arn = observability_configuration_arn_ } : 
  delete_observability_configuration_request)
let make_connection ?created_at:(created_at_ : CoreTypes.Timestamp.t option) 
  ?status:(status_ : connection_status option) 
  ?provider_type:(provider_type_ : provider_type option) 
  ?connection_arn:(connection_arn_ : string option) 
  ?connection_name:(connection_name_ : string option)  () =
  ({
     created_at = created_at_;
     status = status_;
     provider_type = provider_type_;
     connection_arn = connection_arn_;
     connection_name = connection_name_
   } : connection)
let make_delete_connection_response
  ?connection:(connection_ : connection option)  () =
  ({ connection = connection_ } : delete_connection_response)
let make_delete_connection_request ~connection_arn:(connection_arn_ : string)
   () = ({ connection_arn = connection_arn_ } : delete_connection_request)
let make_delete_auto_scaling_configuration_response
  ~auto_scaling_configuration:(auto_scaling_configuration_ :
                                auto_scaling_configuration)
   () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ } : delete_auto_scaling_configuration_response)
let make_delete_auto_scaling_configuration_request
  ?delete_all_revisions:(delete_all_revisions_ : bool option) 
  ~auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ : string) 
  () =
  ({
     delete_all_revisions = delete_all_revisions_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_
   } : delete_auto_scaling_configuration_request)
let make_create_vpc_ingress_connection_response
  ~vpc_ingress_connection:(vpc_ingress_connection_ : vpc_ingress_connection) 
  () =
  ({ vpc_ingress_connection = vpc_ingress_connection_ } : create_vpc_ingress_connection_response)
let make_create_vpc_ingress_connection_request
  ?tags:(tags_ : tag list option) 
  ~ingress_vpc_configuration:(ingress_vpc_configuration_ :
                               ingress_vpc_configuration)
   ~vpc_ingress_connection_name:(vpc_ingress_connection_name_ : string) 
  ~service_arn:(service_arn_ : string)  () =
  ({
     tags = tags_;
     ingress_vpc_configuration = ingress_vpc_configuration_;
     vpc_ingress_connection_name = vpc_ingress_connection_name_;
     service_arn = service_arn_
   } : create_vpc_ingress_connection_request)
let make_create_vpc_connector_response
  ~vpc_connector:(vpc_connector_ : vpc_connector)  () =
  ({ vpc_connector = vpc_connector_ } : create_vpc_connector_response)
let make_create_vpc_connector_request ?tags:(tags_ : tag list option) 
  ?security_groups:(security_groups_ : string list option) 
  ~subnets:(subnets_ : string list) 
  ~vpc_connector_name:(vpc_connector_name_ : string)  () =
  ({
     tags = tags_;
     security_groups = security_groups_;
     subnets = subnets_;
     vpc_connector_name = vpc_connector_name_
   } : create_vpc_connector_request)
let make_create_service_response ~operation_id:(operation_id_ : string) 
  ~service:(service_ : service)  () =
  ({ operation_id = operation_id_; service = service_ } : create_service_response)
let make_create_service_request
  ?observability_configuration:(observability_configuration_ :
                                 service_observability_configuration option)
   ?network_configuration:(network_configuration_ :
                            network_configuration option)
   ?auto_scaling_configuration_arn:(auto_scaling_configuration_arn_ :
                                     string option)
   ?health_check_configuration:(health_check_configuration_ :
                                 health_check_configuration option)
   ?encryption_configuration:(encryption_configuration_ :
                               encryption_configuration option)
   ?tags:(tags_ : tag list option) 
  ?instance_configuration:(instance_configuration_ :
                            instance_configuration option)
   ~source_configuration:(source_configuration_ : source_configuration) 
  ~service_name:(service_name_ : string)  () =
  ({
     observability_configuration = observability_configuration_;
     network_configuration = network_configuration_;
     auto_scaling_configuration_arn = auto_scaling_configuration_arn_;
     health_check_configuration = health_check_configuration_;
     encryption_configuration = encryption_configuration_;
     tags = tags_;
     instance_configuration = instance_configuration_;
     source_configuration = source_configuration_;
     service_name = service_name_
   } : create_service_request)
let make_create_observability_configuration_response
  ~observability_configuration:(observability_configuration_ :
                                 observability_configuration)
   () =
  ({ observability_configuration = observability_configuration_ } : create_observability_configuration_response)
let make_create_observability_configuration_request
  ?tags:(tags_ : tag list option) 
  ?trace_configuration:(trace_configuration_ : trace_configuration option) 
  ~observability_configuration_name:(observability_configuration_name_ :
                                      string)
   () =
  ({
     tags = tags_;
     trace_configuration = trace_configuration_;
     observability_configuration_name = observability_configuration_name_
   } : create_observability_configuration_request)
let make_create_connection_response ~connection:(connection_ : connection) 
  () = ({ connection = connection_ } : create_connection_response)
let make_create_connection_request ?tags:(tags_ : tag list option) 
  ~provider_type:(provider_type_ : provider_type) 
  ~connection_name:(connection_name_ : string)  () =
  ({
     tags = tags_;
     provider_type = provider_type_;
     connection_name = connection_name_
   } : create_connection_request)
let make_create_auto_scaling_configuration_response
  ~auto_scaling_configuration:(auto_scaling_configuration_ :
                                auto_scaling_configuration)
   () =
  ({ auto_scaling_configuration = auto_scaling_configuration_ } : create_auto_scaling_configuration_response)
let make_create_auto_scaling_configuration_request
  ?tags:(tags_ : tag list option)  ?max_size:(max_size_ : int option) 
  ?min_size:(min_size_ : int option) 
  ?max_concurrency:(max_concurrency_ : int option) 
  ~auto_scaling_configuration_name:(auto_scaling_configuration_name_ :
                                     string)
   () =
  ({
     tags = tags_;
     max_size = max_size_;
     min_size = min_size_;
     max_concurrency = max_concurrency_;
     auto_scaling_configuration_name = auto_scaling_configuration_name_
   } : create_auto_scaling_configuration_request)
let make_associate_custom_domain_response
  ~vpc_dns_targets:(vpc_dns_targets_ : vpc_dns_target list) 
  ~custom_domain:(custom_domain_ : custom_domain) 
  ~service_arn:(service_arn_ : string)  ~dns_target:(dns_target_ : string) 
  () =
  ({
     vpc_dns_targets = vpc_dns_targets_;
     custom_domain = custom_domain_;
     service_arn = service_arn_;
     dns_target = dns_target_
   } : associate_custom_domain_response)
let make_associate_custom_domain_request
  ?enable_www_subdomain:(enable_www_subdomain_ : bool option) 
  ~domain_name:(domain_name_ : string)  ~service_arn:(service_arn_ : string) 
  () =
  ({
     enable_www_subdomain = enable_www_subdomain_;
     domain_name = domain_name_;
     service_arn = service_arn_
   } : associate_custom_domain_request)