open Smaws_Lib
open Types
let make_setup_request
  ?certificate_provider:(certificate_provider_ : certificate_provider option)
  ?domain_names:(domain_names_ : string list option)
  ?instance_name:(instance_name_ : string option) () =
  ({
     certificate_provider = certificate_provider_;
     domain_names = domain_names_;
     instance_name = instance_name_
   } : setup_request)
let make_resource_location ?region_name:(region_name_ : region_name option)
  ?availability_zone:(availability_zone_ : string option) () =
  ({ region_name = region_name_; availability_zone = availability_zone_ } : 
  resource_location)
let make_setup_history_resource
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?arn:(arn_ : string option) ?name:(name_ : string option) () =
  ({
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : setup_history_resource)
let make_setup_execution_details ?version:(version_ : string option)
  ?standard_output:(standard_output_ : string option)
  ?standard_error:(standard_error_ : string option)
  ?status:(status_ : setup_status option) ?name:(name_ : string option)
  ?date_time:(date_time_ : CoreTypes.Timestamp.t option)
  ?command:(command_ : string option) () =
  ({
     version = version_;
     standard_output = standard_output_;
     standard_error = standard_error_;
     status = status_;
     name = name_;
     date_time = date_time_;
     command = command_
   } : setup_execution_details)
let make_setup_history ?status:(status_ : setup_status option)
  ?execution_details:(execution_details_ :
                       setup_execution_details list option)
  ?resource:(resource_ : setup_history_resource option)
  ?request:(request_ : setup_request option)
  ?operation_id:(operation_id_ : string option) () =
  ({
     status = status_;
     execution_details = execution_details_;
     resource = resource_;
     request = request_;
     operation_id = operation_id_
   } : setup_history)
let make_operation ?error_details:(error_details_ : string option)
  ?error_code:(error_code_ : string option)
  ?status_changed_at:(status_changed_at_ : CoreTypes.Timestamp.t option)
  ?status:(status_ : operation_status option)
  ?operation_type:(operation_type_ : operation_type option)
  ?operation_details:(operation_details_ : string option)
  ?is_terminal:(is_terminal_ : bool option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?resource_type:(resource_type_ : resource_type option)
  ?resource_name:(resource_name_ : string option) ?id:(id_ : string option)
  () =
  ({
     error_details = error_details_;
     error_code = error_code_;
     status_changed_at = status_changed_at_;
     status = status_;
     operation_type = operation_type_;
     operation_details = operation_details_;
     is_terminal = is_terminal_;
     location = location_;
     created_at = created_at_;
     resource_type = resource_type_;
     resource_name = resource_name_;
     id = id_
   } : operation)
let make_update_relational_database_request
  ?relational_database_blueprint_id:(relational_database_blueprint_id_ :
                                      string option)
  ?ca_certificate_identifier:(ca_certificate_identifier_ : string option)
  ?apply_immediately:(apply_immediately_ : bool option)
  ?publicly_accessible:(publicly_accessible_ : bool option)
  ?disable_backup_retention:(disable_backup_retention_ : bool option)
  ?enable_backup_retention:(enable_backup_retention_ : bool option)
  ?preferred_maintenance_window:(preferred_maintenance_window_ :
                                  string option)
  ?preferred_backup_window:(preferred_backup_window_ : string option)
  ?rotate_master_user_password:(rotate_master_user_password_ : bool option)
  ?master_user_password:(master_user_password_ : string option)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     relational_database_blueprint_id = relational_database_blueprint_id_;
     ca_certificate_identifier = ca_certificate_identifier_;
     apply_immediately = apply_immediately_;
     publicly_accessible = publicly_accessible_;
     disable_backup_retention = disable_backup_retention_;
     enable_backup_retention = enable_backup_retention_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     rotate_master_user_password = rotate_master_user_password_;
     master_user_password = master_user_password_;
     relational_database_name = relational_database_name_
   } : update_relational_database_request)
let make_relational_database_parameter
  ?parameter_value:(parameter_value_ : string option)
  ?parameter_name:(parameter_name_ : string option)
  ?is_modifiable:(is_modifiable_ : bool option)
  ?description:(description_ : string option)
  ?data_type:(data_type_ : string option)
  ?apply_type:(apply_type_ : string option)
  ?apply_method:(apply_method_ : string option)
  ?allowed_values:(allowed_values_ : string option) () =
  ({
     parameter_value = parameter_value_;
     parameter_name = parameter_name_;
     is_modifiable = is_modifiable_;
     description = description_;
     data_type = data_type_;
     apply_type = apply_type_;
     apply_method = apply_method_;
     allowed_values = allowed_values_
   } : relational_database_parameter)
let make_update_relational_database_parameters_request
  ~parameters:(parameters_ : relational_database_parameter list)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     parameters = parameters_;
     relational_database_name = relational_database_name_
   } : update_relational_database_parameters_request)
let make_update_load_balancer_attribute_request
  ~attribute_value:(attribute_value_ : string)
  ~attribute_name:(attribute_name_ : load_balancer_attribute_name)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     attribute_value = attribute_value_;
     attribute_name = attribute_name_;
     load_balancer_name = load_balancer_name_
   } : update_load_balancer_attribute_request)
let make_update_instance_metadata_options_request
  ?http_protocol_ipv6:(http_protocol_ipv6_ : http_protocol_ipv6 option)
  ?http_put_response_hop_limit:(http_put_response_hop_limit_ : int option)
  ?http_endpoint:(http_endpoint_ : http_endpoint option)
  ?http_tokens:(http_tokens_ : http_tokens option)
  ~instance_name:(instance_name_ : string) () =
  ({
     http_protocol_ipv6 = http_protocol_ipv6_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_endpoint = http_endpoint_;
     http_tokens = http_tokens_;
     instance_name = instance_name_
   } : update_instance_metadata_options_request)
let make_domain_entry ?options:(options_ : domain_entry_options option)
  ?type_:(type__ : string option) ?is_alias:(is_alias_ : bool option)
  ?target:(target_ : string option) ?name:(name_ : string option)
  ?id:(id_ : string option) () =
  ({
     options = options_;
     type_ = type__;
     is_alias = is_alias_;
     target = target_;
     name = name_;
     id = id_
   } : domain_entry)
let make_update_domain_entry_request
  ~domain_entry:(domain_entry_ : domain_entry)
  ~domain_name:(domain_name_ : string) () =
  ({ domain_entry = domain_entry_; domain_name = domain_name_ } : update_domain_entry_request)
let make_input_origin ?response_timeout:(response_timeout_ : int option)
  ?protocol_policy:(protocol_policy_ : origin_protocol_policy_enum option)
  ?region_name:(region_name_ : region_name option)
  ?name:(name_ : string option) () =
  ({
     response_timeout = response_timeout_;
     protocol_policy = protocol_policy_;
     region_name = region_name_;
     name = name_
   } : input_origin)
let make_cache_behavior ?behavior:(behavior_ : behavior_enum option) () =
  ({ behavior = behavior_ } : cache_behavior)
let make_cookie_object
  ?cookies_allow_list:(cookies_allow_list_ : string list option)
  ?option_:(option__ : forward_values option) () =
  ({ cookies_allow_list = cookies_allow_list_; option_ = option__ } : 
  cookie_object)
let make_header_object
  ?headers_allow_list:(headers_allow_list_ : header_enum list option)
  ?option_:(option__ : forward_values option) () =
  ({ headers_allow_list = headers_allow_list_; option_ = option__ } : 
  header_object)
let make_query_string_object
  ?query_strings_allow_list:(query_strings_allow_list_ : string list option)
  ?option_:(option__ : bool option) () =
  ({ query_strings_allow_list = query_strings_allow_list_; option_ = option__
   } : query_string_object)
let make_cache_settings
  ?forwarded_query_strings:(forwarded_query_strings_ :
                             query_string_object option)
  ?forwarded_headers:(forwarded_headers_ : header_object option)
  ?forwarded_cookies:(forwarded_cookies_ : cookie_object option)
  ?cached_http_methods:(cached_http_methods_ : string option)
  ?allowed_http_methods:(allowed_http_methods_ : string option)
  ?maximum_tt_l:(maximum_tt_l_ : int option)
  ?minimum_tt_l:(minimum_tt_l_ : int option)
  ?default_tt_l:(default_tt_l_ : int option) () =
  ({
     forwarded_query_strings = forwarded_query_strings_;
     forwarded_headers = forwarded_headers_;
     forwarded_cookies = forwarded_cookies_;
     cached_http_methods = cached_http_methods_;
     allowed_http_methods = allowed_http_methods_;
     maximum_tt_l = maximum_tt_l_;
     minimum_tt_l = minimum_tt_l_;
     default_tt_l = default_tt_l_
   } : cache_settings)
let make_cache_behavior_per_path ?behavior:(behavior_ : behavior_enum option)
  ?path:(path_ : string option) () =
  ({ behavior = behavior_; path = path_ } : cache_behavior_per_path)
let make_update_distribution_request
  ?use_default_certificate:(use_default_certificate_ : bool option)
  ?certificate_name:(certificate_name_ : string option)
  ?viewer_minimum_tls_protocol_version:(viewer_minimum_tls_protocol_version_
                                         :
                                         viewer_minimum_tls_protocol_version_enum
                                           option)
  ?is_enabled:(is_enabled_ : bool option)
  ?cache_behaviors:(cache_behaviors_ : cache_behavior_per_path list option)
  ?cache_behavior_settings:(cache_behavior_settings_ : cache_settings option)
  ?default_cache_behavior:(default_cache_behavior_ : cache_behavior option)
  ?origin:(origin_ : input_origin option)
  ~distribution_name:(distribution_name_ : string) () =
  ({
     use_default_certificate = use_default_certificate_;
     certificate_name = certificate_name_;
     viewer_minimum_tls_protocol_version =
       viewer_minimum_tls_protocol_version_;
     is_enabled = is_enabled_;
     cache_behaviors = cache_behaviors_;
     cache_behavior_settings = cache_behavior_settings_;
     default_cache_behavior = default_cache_behavior_;
     origin = origin_;
     distribution_name = distribution_name_
   } : update_distribution_request)
let make_update_distribution_bundle_request
  ?bundle_id:(bundle_id_ : string option)
  ?distribution_name:(distribution_name_ : string option) () =
  ({ bundle_id = bundle_id_; distribution_name = distribution_name_ } : 
  update_distribution_bundle_request)
let make_tag ?value:(value_ : string option) ?key:(key_ : string option) () =
  ({ value = value_; key = key_ } : tag)
let make_container_service_state_detail ?message:(message_ : string option)
  ?code:(code_ : container_service_state_detail_code option) () =
  ({ message = message_; code = code_ } : container_service_state_detail)
let make_container ?ports:(ports_ : port_map option)
  ?environment:(environment_ : environment option)
  ?command:(command_ : string list option) ?image:(image_ : string option) ()
  =
  ({
     ports = ports_;
     environment = environment_;
     command = command_;
     image = image_
   } : container)
let make_container_service_health_check_config
  ?success_codes:(success_codes_ : string option)
  ?path:(path_ : string option)
  ?interval_seconds:(interval_seconds_ : int option)
  ?timeout_seconds:(timeout_seconds_ : int option)
  ?unhealthy_threshold:(unhealthy_threshold_ : int option)
  ?healthy_threshold:(healthy_threshold_ : int option) () =
  ({
     success_codes = success_codes_;
     path = path_;
     interval_seconds = interval_seconds_;
     timeout_seconds = timeout_seconds_;
     unhealthy_threshold = unhealthy_threshold_;
     healthy_threshold = healthy_threshold_
   } : container_service_health_check_config)
let make_container_service_endpoint
  ?health_check:(health_check_ :
                  container_service_health_check_config option)
  ?container_port:(container_port_ : int option)
  ?container_name:(container_name_ : string option) () =
  ({
     health_check = health_check_;
     container_port = container_port_;
     container_name = container_name_
   } : container_service_endpoint)
let make_container_service_deployment
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?public_endpoint:(public_endpoint_ : container_service_endpoint option)
  ?containers:(containers_ : container_map option)
  ?state:(state_ : container_service_deployment_state option)
  ?version:(version_ : int option) () =
  ({
     created_at = created_at_;
     public_endpoint = public_endpoint_;
     containers = containers_;
     state = state_;
     version = version_
   } : container_service_deployment)
let make_container_service_ecr_image_puller_role
  ?principal_arn:(principal_arn_ : string option)
  ?is_active:(is_active_ : bool option) () =
  ({ principal_arn = principal_arn_; is_active = is_active_ } : container_service_ecr_image_puller_role)
let make_private_registry_access
  ?ecr_image_puller_role:(ecr_image_puller_role_ :
                           container_service_ecr_image_puller_role option)
  () =
  ({ ecr_image_puller_role = ecr_image_puller_role_ } : private_registry_access)
let make_container_service
  ?private_registry_access:(private_registry_access_ :
                             private_registry_access option)
  ?url:(url_ : string option)
  ?public_domain_names:(public_domain_names_ :
                         container_service_public_domains option)
  ?private_domain_name:(private_domain_name_ : string option)
  ?principal_arn:(principal_arn_ : string option)
  ?is_disabled:(is_disabled_ : bool option)
  ?next_deployment:(next_deployment_ : container_service_deployment option)
  ?current_deployment:(current_deployment_ :
                        container_service_deployment option)
  ?scale:(scale_ : int option)
  ?state_detail:(state_detail_ : container_service_state_detail option)
  ?state:(state_ : container_service_state option)
  ?power_id:(power_id_ : string option)
  ?power:(power_ : container_service_power_name option)
  ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?arn:(arn_ : string option)
  ?container_service_name:(container_service_name_ : string option) () =
  ({
     private_registry_access = private_registry_access_;
     url = url_;
     public_domain_names = public_domain_names_;
     private_domain_name = private_domain_name_;
     principal_arn = principal_arn_;
     is_disabled = is_disabled_;
     next_deployment = next_deployment_;
     current_deployment = current_deployment_;
     scale = scale_;
     state_detail = state_detail_;
     state = state_;
     power_id = power_id_;
     power = power_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     arn = arn_;
     container_service_name = container_service_name_
   } : container_service)
let make_container_service_ecr_image_puller_role_request
  ?is_active:(is_active_ : bool option) () =
  ({ is_active = is_active_ } : container_service_ecr_image_puller_role_request)
let make_private_registry_access_request
  ?ecr_image_puller_role:(ecr_image_puller_role_ :
                           container_service_ecr_image_puller_role_request
                             option)
  () =
  ({ ecr_image_puller_role = ecr_image_puller_role_ } : private_registry_access_request)
let make_update_container_service_request
  ?private_registry_access:(private_registry_access_ :
                             private_registry_access_request option)
  ?public_domain_names:(public_domain_names_ :
                         container_service_public_domains option)
  ?is_disabled:(is_disabled_ : bool option) ?scale:(scale_ : int option)
  ?power:(power_ : container_service_power_name option)
  ~service_name:(service_name_ : string) () =
  ({
     private_registry_access = private_registry_access_;
     public_domain_names = public_domain_names_;
     is_disabled = is_disabled_;
     scale = scale_;
     power = power_;
     service_name = service_name_
   } : update_container_service_request)
let make_access_rules
  ?allow_public_overrides:(allow_public_overrides_ : bool option)
  ?get_object:(get_object_ : access_type option) () =
  ({
     allow_public_overrides = allow_public_overrides_;
     get_object = get_object_
   } : access_rules)
let make_resource_receiving_access
  ?resource_type:(resource_type_ : string option)
  ?name:(name_ : string option) () =
  ({ resource_type = resource_type_; name = name_ } : resource_receiving_access)
let make_bucket_state ?message:(message_ : string option)
  ?code:(code_ : string option) () =
  ({ message = message_; code = code_ } : bucket_state)
let make_bucket_access_log_config ?prefix:(prefix_ : string option)
  ?destination:(destination_ : string option) ~enabled:(enabled_ : bool) () =
  ({ prefix = prefix_; destination = destination_; enabled = enabled_ } : 
  bucket_access_log_config)
let make_bucket
  ?access_log_config:(access_log_config_ : bucket_access_log_config option)
  ?state:(state_ : bucket_state option)
  ?resources_receiving_access:(resources_receiving_access_ :
                                resource_receiving_access list option)
  ?readonly_access_accounts:(readonly_access_accounts_ : string list option)
  ?able_to_update_bundle:(able_to_update_bundle_ : bool option)
  ?object_versioning:(object_versioning_ : string option)
  ?tags:(tags_ : tag list option)
  ?support_code:(support_code_ : string option) ?name:(name_ : string option)
  ?location:(location_ : resource_location option)
  ?url:(url_ : string option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?bundle_id:(bundle_id_ : string option) ?arn:(arn_ : string option)
  ?access_rules:(access_rules_ : access_rules option)
  ?resource_type:(resource_type_ : string option) () =
  ({
     access_log_config = access_log_config_;
     state = state_;
     resources_receiving_access = resources_receiving_access_;
     readonly_access_accounts = readonly_access_accounts_;
     able_to_update_bundle = able_to_update_bundle_;
     object_versioning = object_versioning_;
     tags = tags_;
     support_code = support_code_;
     name = name_;
     location = location_;
     url = url_;
     created_at = created_at_;
     bundle_id = bundle_id_;
     arn = arn_;
     access_rules = access_rules_;
     resource_type = resource_type_
   } : bucket)
let make_update_bucket_request
  ?access_log_config:(access_log_config_ : bucket_access_log_config option)
  ?readonly_access_accounts:(readonly_access_accounts_ : string list option)
  ?versioning:(versioning_ : string option)
  ?access_rules:(access_rules_ : access_rules option)
  ~bucket_name:(bucket_name_ : string) () =
  ({
     access_log_config = access_log_config_;
     readonly_access_accounts = readonly_access_accounts_;
     versioning = versioning_;
     access_rules = access_rules_;
     bucket_name = bucket_name_
   } : update_bucket_request)
let make_update_bucket_bundle_request ~bundle_id:(bundle_id_ : string)
  ~bucket_name:(bucket_name_ : string) () =
  ({ bundle_id = bundle_id_; bucket_name = bucket_name_ } : update_bucket_bundle_request)
let make_untag_resource_request ?resource_arn:(resource_arn_ : string option)
  ~tag_keys:(tag_keys_ : string list)
  ~resource_name:(resource_name_ : string) () =
  ({
     tag_keys = tag_keys_;
     resource_arn = resource_arn_;
     resource_name = resource_name_
   } : untag_resource_request)
let make_unpeer_vpc_request () = (() : unit)
let make_time_period ?end_:(end__ : CoreTypes.Timestamp.t option)
  ?start:(start_ : CoreTypes.Timestamp.t option) () =
  ({ end_ = end__; start = start_ } : time_period)
let make_test_alarm_request ~state:(state_ : alarm_state)
  ~alarm_name:(alarm_name_ : string) () =
  ({ state = state_; alarm_name = alarm_name_ } : test_alarm_request)
let make_tag_resource_request ?resource_arn:(resource_arn_ : string option)
  ~tags:(tags_ : tag list) ~resource_name:(resource_name_ : string) () =
  ({
     tags = tags_;
     resource_arn = resource_arn_;
     resource_name = resource_name_
   } : tag_resource_request)
let make_stop_relational_database_request
  ?relational_database_snapshot_name:(relational_database_snapshot_name_ :
                                       string option)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     relational_database_snapshot_name = relational_database_snapshot_name_;
     relational_database_name = relational_database_name_
   } : stop_relational_database_request)
let make_stop_instance_request ?force:(force_ : bool option)
  ~instance_name:(instance_name_ : string) () =
  ({ force = force_; instance_name = instance_name_ } : stop_instance_request)
let make_stop_instance_on_idle_request ?duration:(duration_ : string option)
  ?threshold:(threshold_ : string option) () =
  ({ duration = duration_; threshold = threshold_ } : stop_instance_on_idle_request)
let make_stop_gui_session_request ~resource_name:(resource_name_ : string) ()
  = ({ resource_name = resource_name_ } : stop_gui_session_request)
let make_static_ip ?is_attached:(is_attached_ : bool option)
  ?attached_to:(attached_to_ : string option)
  ?ip_address:(ip_address_ : string option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     is_attached = is_attached_;
     attached_to = attached_to_;
     ip_address = ip_address_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : static_ip)
let make_start_relational_database_request
  ~relational_database_name:(relational_database_name_ : string) () =
  ({ relational_database_name = relational_database_name_ } : start_relational_database_request)
let make_start_instance_request ~instance_name:(instance_name_ : string) () =
  ({ instance_name = instance_name_ } : start_instance_request)
let make_start_gui_session_request ~resource_name:(resource_name_ : string)
  () = ({ resource_name = resource_name_ } : start_gui_session_request)
let make_setup_instance_https_request
  ~certificate_provider:(certificate_provider_ : certificate_provider)
  ~domain_names:(domain_names_ : string list)
  ~email_address:(email_address_ : string)
  ~instance_name:(instance_name_ : string) () =
  ({
     certificate_provider = certificate_provider_;
     domain_names = domain_names_;
     email_address = email_address_;
     instance_name = instance_name_
   } : setup_instance_https_request)
let make_set_resource_access_for_bucket_request
  ~access:(access_ : resource_bucket_access)
  ~bucket_name:(bucket_name_ : string)
  ~resource_name:(resource_name_ : string) () =
  ({
     access = access_;
     bucket_name = bucket_name_;
     resource_name = resource_name_
   } : set_resource_access_for_bucket_request)
let make_set_ip_address_type_request
  ?accept_bundle_update:(accept_bundle_update_ : bool option)
  ~ip_address_type:(ip_address_type_ : ip_address_type)
  ~resource_name:(resource_name_ : string)
  ~resource_type:(resource_type_ : resource_type) () =
  ({
     accept_bundle_update = accept_bundle_update_;
     ip_address_type = ip_address_type_;
     resource_name = resource_name_;
     resource_type = resource_type_
   } : set_ip_address_type_request)
let make_session ?is_primary:(is_primary_ : bool option)
  ?url:(url_ : string option) ?name:(name_ : string option) () =
  ({ is_primary = is_primary_; url = url_; name = name_ } : session)
let make_send_contact_method_verification_request
  ~protocol:(protocol_ : contact_method_verification_protocol) () =
  ({ protocol = protocol_ } : send_contact_method_verification_request)
let make_estimate_by_time ?time_period:(time_period_ : time_period option)
  ?currency:(currency_ : currency option) ?unit_:(unit__ : float option)
  ?pricing_unit:(pricing_unit_ : pricing_unit option)
  ?usage_cost:(usage_cost_ : float option) () =
  ({
     time_period = time_period_;
     currency = currency_;
     unit_ = unit__;
     pricing_unit = pricing_unit_;
     usage_cost = usage_cost_
   } : estimate_by_time)
let make_cost_estimate
  ?results_by_time:(results_by_time_ : estimate_by_time list option)
  ?usage_type:(usage_type_ : string option) () =
  ({ results_by_time = results_by_time_; usage_type = usage_type_ } : 
  cost_estimate)
let make_resource_budget_estimate
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ?cost_estimates:(cost_estimates_ : cost_estimate list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?resource_name:(resource_name_ : string option) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     cost_estimates = cost_estimates_;
     resource_type = resource_type_;
     resource_name = resource_name_
   } : resource_budget_estimate)
let make_resource_record ?value:(value_ : string option)
  ?type_:(type__ : string option) ?name:(name_ : string option) () =
  ({ value = value_; type_ = type__; name = name_ } : resource_record)
let make_reset_distribution_cache_request
  ?distribution_name:(distribution_name_ : string option) () =
  ({ distribution_name = distribution_name_ } : reset_distribution_cache_request)
let make_dns_record_creation_state ?message:(message_ : string option)
  ?code:(code_ : dns_record_creation_state_code option) () =
  ({ message = message_; code = code_ } : dns_record_creation_state)
let make_domain_validation_record
  ?validation_status:(validation_status_ :
                       certificate_domain_validation_status option)
  ?dns_record_creation_state:(dns_record_creation_state_ :
                               dns_record_creation_state option)
  ?resource_record:(resource_record_ : resource_record option)
  ?domain_name:(domain_name_ : string option) () =
  ({
     validation_status = validation_status_;
     dns_record_creation_state = dns_record_creation_state_;
     resource_record = resource_record_;
     domain_name = domain_name_
   } : domain_validation_record)
let make_renewal_summary
  ?updated_at:(updated_at_ : CoreTypes.Timestamp.t option)
  ?renewal_status_reason:(renewal_status_reason_ : string option)
  ?renewal_status:(renewal_status_ : renewal_status option)
  ?domain_validation_records:(domain_validation_records_ :
                               domain_validation_record list option)
  () =
  ({
     updated_at = updated_at_;
     renewal_status_reason = renewal_status_reason_;
     renewal_status = renewal_status_;
     domain_validation_records = domain_validation_records_
   } : renewal_summary)
let make_release_static_ip_request ~static_ip_name:(static_ip_name_ : string)
  () = ({ static_ip_name = static_ip_name_ } : release_static_ip_request)
let make_relational_database_snapshot
  ?from_relational_database_blueprint_id:(from_relational_database_blueprint_id_
                                           : string option)
  ?from_relational_database_bundle_id:(from_relational_database_bundle_id_ :
                                        string option)
  ?from_relational_database_arn:(from_relational_database_arn_ :
                                  string option)
  ?from_relational_database_name:(from_relational_database_name_ :
                                   string option)
  ?state:(state_ : string option) ?size_in_gb:(size_in_gb_ : int option)
  ?engine_version:(engine_version_ : string option)
  ?engine:(engine_ : string option) ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     from_relational_database_blueprint_id =
       from_relational_database_blueprint_id_;
     from_relational_database_bundle_id = from_relational_database_bundle_id_;
     from_relational_database_arn = from_relational_database_arn_;
     from_relational_database_name = from_relational_database_name_;
     state = state_;
     size_in_gb = size_in_gb_;
     engine_version = engine_version_;
     engine = engine_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : relational_database_snapshot)
let make_relational_database_hardware
  ?ram_size_in_gb:(ram_size_in_gb_ : float option)
  ?disk_size_in_gb:(disk_size_in_gb_ : int option)
  ?cpu_count:(cpu_count_ : int option) () =
  ({
     ram_size_in_gb = ram_size_in_gb_;
     disk_size_in_gb = disk_size_in_gb_;
     cpu_count = cpu_count_
   } : relational_database_hardware)
let make_pending_modified_relational_database_values
  ?backup_retention_enabled:(backup_retention_enabled_ : bool option)
  ?engine_version:(engine_version_ : string option)
  ?master_user_password:(master_user_password_ : string option) () =
  ({
     backup_retention_enabled = backup_retention_enabled_;
     engine_version = engine_version_;
     master_user_password = master_user_password_
   } : pending_modified_relational_database_values)
let make_relational_database_endpoint ?address:(address_ : string option)
  ?port:(port_ : int option) () =
  ({ address = address_; port = port_ } : relational_database_endpoint)
let make_pending_maintenance_action
  ?current_apply_date:(current_apply_date_ : CoreTypes.Timestamp.t option)
  ?description:(description_ : string option)
  ?action:(action_ : string option) () =
  ({
     current_apply_date = current_apply_date_;
     description = description_;
     action = action_
   } : pending_maintenance_action)
let make_relational_database
  ?ca_certificate_identifier:(ca_certificate_identifier_ : string option)
  ?pending_maintenance_actions:(pending_maintenance_actions_ :
                                 pending_maintenance_action list option)
  ?master_endpoint:(master_endpoint_ : relational_database_endpoint option)
  ?publicly_accessible:(publicly_accessible_ : bool option)
  ?preferred_maintenance_window:(preferred_maintenance_window_ :
                                  string option)
  ?preferred_backup_window:(preferred_backup_window_ : string option)
  ?parameter_apply_status:(parameter_apply_status_ : string option)
  ?master_username:(master_username_ : string option)
  ?latest_restorable_time:(latest_restorable_time_ :
                            CoreTypes.Timestamp.t option)
  ?engine_version:(engine_version_ : string option)
  ?engine:(engine_ : string option)
  ?pending_modified_values:(pending_modified_values_ :
                             pending_modified_relational_database_values
                               option)
  ?backup_retention_enabled:(backup_retention_enabled_ : bool option)
  ?secondary_availability_zone:(secondary_availability_zone_ : string option)
  ?state:(state_ : string option)
  ?hardware:(hardware_ : relational_database_hardware option)
  ?master_database_name:(master_database_name_ : string option)
  ?relational_database_bundle_id:(relational_database_bundle_id_ :
                                   string option)
  ?relational_database_blueprint_id:(relational_database_blueprint_id_ :
                                      string option)
  ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     ca_certificate_identifier = ca_certificate_identifier_;
     pending_maintenance_actions = pending_maintenance_actions_;
     master_endpoint = master_endpoint_;
     publicly_accessible = publicly_accessible_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     parameter_apply_status = parameter_apply_status_;
     master_username = master_username_;
     latest_restorable_time = latest_restorable_time_;
     engine_version = engine_version_;
     engine = engine_;
     pending_modified_values = pending_modified_values_;
     backup_retention_enabled = backup_retention_enabled_;
     secondary_availability_zone = secondary_availability_zone_;
     state = state_;
     hardware = hardware_;
     master_database_name = master_database_name_;
     relational_database_bundle_id = relational_database_bundle_id_;
     relational_database_blueprint_id = relational_database_blueprint_id_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : relational_database)
let make_relational_database_event
  ?event_categories:(event_categories_ : string list option)
  ?message:(message_ : string option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?resource:(resource_ : string option) () =
  ({
     event_categories = event_categories_;
     message = message_;
     created_at = created_at_;
     resource = resource_
   } : relational_database_event)
let make_relational_database_bundle ?is_active:(is_active_ : bool option)
  ?is_encrypted:(is_encrypted_ : bool option)
  ?cpu_count:(cpu_count_ : int option)
  ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : int option)
  ?disk_size_in_gb:(disk_size_in_gb_ : int option)
  ?ram_size_in_gb:(ram_size_in_gb_ : float option)
  ?price:(price_ : float option) ?name:(name_ : string option)
  ?bundle_id:(bundle_id_ : string option) () =
  ({
     is_active = is_active_;
     is_encrypted = is_encrypted_;
     cpu_count = cpu_count_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     disk_size_in_gb = disk_size_in_gb_;
     ram_size_in_gb = ram_size_in_gb_;
     price = price_;
     name = name_;
     bundle_id = bundle_id_
   } : relational_database_bundle)
let make_relational_database_blueprint
  ?is_engine_default:(is_engine_default_ : bool option)
  ?engine_version_description:(engine_version_description_ : string option)
  ?engine_description:(engine_description_ : string option)
  ?engine_version:(engine_version_ : string option)
  ?engine:(engine_ : relational_database_engine option)
  ?blueprint_id:(blueprint_id_ : string option) () =
  ({
     is_engine_default = is_engine_default_;
     engine_version_description = engine_version_description_;
     engine_description = engine_description_;
     engine_version = engine_version_;
     engine = engine_;
     blueprint_id = blueprint_id_
   } : relational_database_blueprint)
let make_name_servers_update_state ?message:(message_ : string option)
  ?code:(code_ : name_servers_update_state_code option) () =
  ({ message = message_; code = code_ } : name_servers_update_state)
let make_r53_hosted_zone_deletion_state ?message:(message_ : string option)
  ?code:(code_ : r53_hosted_zone_deletion_state_code option) () =
  ({ message = message_; code = code_ } : r53_hosted_zone_deletion_state)
let make_registered_domain_delegation_info
  ?r53_hosted_zone_deletion_state:(r53_hosted_zone_deletion_state_ :
                                    r53_hosted_zone_deletion_state option)
  ?name_servers_update_state:(name_servers_update_state_ :
                               name_servers_update_state option)
  () =
  ({
     r53_hosted_zone_deletion_state = r53_hosted_zone_deletion_state_;
     name_servers_update_state = name_servers_update_state_
   } : registered_domain_delegation_info)
let make_container_image
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?digest:(digest_ : string option) ?image:(image_ : string option) () =
  ({ created_at = created_at_; digest = digest_; image = image_ } : container_image)
let make_register_container_image_request ~digest:(digest_ : string)
  ~label:(label_ : string) ~service_name:(service_name_ : string) () =
  ({ digest = digest_; label = label_; service_name = service_name_ } : 
  register_container_image_request)
let make_availability_zone ?state:(state_ : string option)
  ?zone_name:(zone_name_ : string option) () =
  ({ state = state_; zone_name = zone_name_ } : availability_zone)
let make_region
  ?relational_database_availability_zones:(relational_database_availability_zones_
                                            : availability_zone list option)
  ?availability_zones:(availability_zones_ : availability_zone list option)
  ?name:(name_ : region_name option)
  ?display_name:(display_name_ : string option)
  ?description:(description_ : string option)
  ?continent_code:(continent_code_ : string option) () =
  ({
     relational_database_availability_zones =
       relational_database_availability_zones_;
     availability_zones = availability_zones_;
     name = name_;
     display_name = display_name_;
     description = description_;
     continent_code = continent_code_
   } : region)
let make_reboot_relational_database_request
  ~relational_database_name:(relational_database_name_ : string) () =
  ({ relational_database_name = relational_database_name_ } : reboot_relational_database_request)
let make_reboot_instance_request ~instance_name:(instance_name_ : string) ()
  = ({ instance_name = instance_name_ } : reboot_instance_request)
let make_port_info
  ?cidr_list_aliases:(cidr_list_aliases_ : string list option)
  ?ipv6_cidrs:(ipv6_cidrs_ : string list option)
  ?cidrs:(cidrs_ : string list option)
  ?protocol:(protocol_ : network_protocol option)
  ?to_port:(to_port_ : int option) ?from_port:(from_port_ : int option) () =
  ({
     cidr_list_aliases = cidr_list_aliases_;
     ipv6_cidrs = ipv6_cidrs_;
     cidrs = cidrs_;
     protocol = protocol_;
     to_port = to_port_;
     from_port = from_port_
   } : port_info)
let make_put_instance_public_ports_request
  ~instance_name:(instance_name_ : string)
  ~port_infos:(port_infos_ : port_info list) () =
  ({ instance_name = instance_name_; port_infos = port_infos_ } : put_instance_public_ports_request)
let make_put_alarm_request
  ?notification_enabled:(notification_enabled_ : bool option)
  ?notification_triggers:(notification_triggers_ : alarm_state list option)
  ?contact_protocols:(contact_protocols_ : contact_protocol list option)
  ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
  ?datapoints_to_alarm:(datapoints_to_alarm_ : int option)
  ~evaluation_periods:(evaluation_periods_ : int)
  ~threshold:(threshold_ : float)
  ~comparison_operator:(comparison_operator_ : comparison_operator)
  ~monitored_resource_name:(monitored_resource_name_ : string)
  ~metric_name:(metric_name_ : metric_name)
  ~alarm_name:(alarm_name_ : string) () =
  ({
     notification_enabled = notification_enabled_;
     notification_triggers = notification_triggers_;
     contact_protocols = contact_protocols_;
     treat_missing_data = treat_missing_data_;
     datapoints_to_alarm = datapoints_to_alarm_;
     evaluation_periods = evaluation_periods_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     monitored_resource_name = monitored_resource_name_;
     metric_name = metric_name_;
     alarm_name = alarm_name_
   } : put_alarm_request)
let make_peer_vpc_request () = (() : unit)
let make_password_data ?key_pair_name:(key_pair_name_ : string option)
  ?ciphertext:(ciphertext_ : string option) () =
  ({ key_pair_name = key_pair_name_; ciphertext = ciphertext_ } : password_data)
let make_origin ?response_timeout:(response_timeout_ : int option)
  ?protocol_policy:(protocol_policy_ : origin_protocol_policy_enum option)
  ?region_name:(region_name_ : region_name option)
  ?resource_type:(resource_type_ : resource_type option)
  ?name:(name_ : string option) () =
  ({
     response_timeout = response_timeout_;
     protocol_policy = protocol_policy_;
     region_name = region_name_;
     resource_type = resource_type_;
     name = name_
   } : origin)
let make_open_instance_public_ports_request
  ~instance_name:(instance_name_ : string)
  ~port_info:(port_info_ : port_info) () =
  ({ instance_name = instance_name_; port_info = port_info_ } : open_instance_public_ports_request)
let make_monthly_transfer
  ?gb_per_month_allocated:(gb_per_month_allocated_ : int option) () =
  ({ gb_per_month_allocated = gb_per_month_allocated_ } : monthly_transfer)
let make_monitored_resource_info
  ?resource_type:(resource_type_ : resource_type option)
  ?name:(name_ : string option) ?arn:(arn_ : string option) () =
  ({ resource_type = resource_type_; name = name_; arn = arn_ } : monitored_resource_info)
let make_metric_datapoint ?unit_:(unit__ : metric_unit option)
  ?timestamp_:(timestamp__ : CoreTypes.Timestamp.t option)
  ?sum:(sum_ : float option) ?sample_count:(sample_count_ : float option)
  ?minimum:(minimum_ : float option) ?maximum:(maximum_ : float option)
  ?average:(average_ : float option) () =
  ({
     unit_ = unit__;
     timestamp_ = timestamp__;
     sum = sum_;
     sample_count = sample_count_;
     minimum = minimum_;
     maximum = maximum_;
     average = average_
   } : metric_datapoint)
let make_log_event ?message:(message_ : string option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) () =
  ({ message = message_; created_at = created_at_ } : log_event)
let make_load_balancer_tls_policy ?ciphers:(ciphers_ : string list option)
  ?protocols:(protocols_ : string list option)
  ?description:(description_ : string option)
  ?is_default:(is_default_ : bool option) ?name:(name_ : string option) () =
  ({
     ciphers = ciphers_;
     protocols = protocols_;
     description = description_;
     is_default = is_default_;
     name = name_
   } : load_balancer_tls_policy)
let make_load_balancer_tls_certificate_summary
  ?is_attached:(is_attached_ : bool option) ?name:(name_ : string option) ()
  =
  ({ is_attached = is_attached_; name = name_ } : load_balancer_tls_certificate_summary)
let make_load_balancer_tls_certificate_domain_validation_option
  ?validation_status:(validation_status_ :
                       load_balancer_tls_certificate_domain_status option)
  ?domain_name:(domain_name_ : string option) () =
  ({ validation_status = validation_status_; domain_name = domain_name_ } : 
  load_balancer_tls_certificate_domain_validation_option)
let make_load_balancer_tls_certificate_renewal_summary
  ?domain_validation_options:(domain_validation_options_ :
                               load_balancer_tls_certificate_domain_validation_option
                                 list option)
  ?renewal_status:(renewal_status_ :
                    load_balancer_tls_certificate_renewal_status option)
  () =
  ({
     domain_validation_options = domain_validation_options_;
     renewal_status = renewal_status_
   } : load_balancer_tls_certificate_renewal_summary)
let make_load_balancer_tls_certificate_dns_record_creation_state
  ?message:(message_ : string option)
  ?code:(code_ :
          load_balancer_tls_certificate_dns_record_creation_state_code option)
  () =
  ({ message = message_; code = code_ } : load_balancer_tls_certificate_dns_record_creation_state)
let make_load_balancer_tls_certificate_domain_validation_record
  ?dns_record_creation_state:(dns_record_creation_state_ :
                               load_balancer_tls_certificate_dns_record_creation_state
                                 option)
  ?domain_name:(domain_name_ : string option)
  ?validation_status:(validation_status_ :
                       load_balancer_tls_certificate_domain_status option)
  ?value:(value_ : string option) ?type_:(type__ : string option)
  ?name:(name_ : string option) () =
  ({
     dns_record_creation_state = dns_record_creation_state_;
     domain_name = domain_name_;
     validation_status = validation_status_;
     value = value_;
     type_ = type__;
     name = name_
   } : load_balancer_tls_certificate_domain_validation_record)
let make_load_balancer_tls_certificate
  ?subject_alternative_names:(subject_alternative_names_ :
                               string list option)
  ?subject:(subject_ : string option)
  ?signature_algorithm:(signature_algorithm_ : string option)
  ?serial:(serial_ : string option)
  ?revoked_at:(revoked_at_ : CoreTypes.Timestamp.t option)
  ?revocation_reason:(revocation_reason_ :
                       load_balancer_tls_certificate_revocation_reason option)
  ?renewal_summary:(renewal_summary_ :
                     load_balancer_tls_certificate_renewal_summary option)
  ?not_before:(not_before_ : CoreTypes.Timestamp.t option)
  ?not_after:(not_after_ : CoreTypes.Timestamp.t option)
  ?key_algorithm:(key_algorithm_ : string option)
  ?issuer:(issuer_ : string option)
  ?issued_at:(issued_at_ : CoreTypes.Timestamp.t option)
  ?failure_reason:(failure_reason_ :
                    load_balancer_tls_certificate_failure_reason option)
  ?domain_validation_records:(domain_validation_records_ :
                               load_balancer_tls_certificate_domain_validation_record
                                 list option)
  ?domain_name:(domain_name_ : string option)
  ?status:(status_ : load_balancer_tls_certificate_status option)
  ?is_attached:(is_attached_ : bool option)
  ?load_balancer_name:(load_balancer_name_ : string option)
  ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     subject_alternative_names = subject_alternative_names_;
     subject = subject_;
     signature_algorithm = signature_algorithm_;
     serial = serial_;
     revoked_at = revoked_at_;
     revocation_reason = revocation_reason_;
     renewal_summary = renewal_summary_;
     not_before = not_before_;
     not_after = not_after_;
     key_algorithm = key_algorithm_;
     issuer = issuer_;
     issued_at = issued_at_;
     failure_reason = failure_reason_;
     domain_validation_records = domain_validation_records_;
     domain_name = domain_name_;
     status = status_;
     is_attached = is_attached_;
     load_balancer_name = load_balancer_name_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : load_balancer_tls_certificate)
let make_instance_health_summary
  ?instance_health_reason:(instance_health_reason_ :
                            instance_health_reason option)
  ?instance_health:(instance_health_ : instance_health_state option)
  ?instance_name:(instance_name_ : string option) () =
  ({
     instance_health_reason = instance_health_reason_;
     instance_health = instance_health_;
     instance_name = instance_name_
   } : instance_health_summary)
let make_load_balancer ?tls_policy_name:(tls_policy_name_ : string option)
  ?https_redirection_enabled:(https_redirection_enabled_ : bool option)
  ?ip_address_type:(ip_address_type_ : ip_address_type option)
  ?configuration_options:(configuration_options_ :
                           load_balancer_configuration_options option)
  ?tls_certificate_summaries:(tls_certificate_summaries_ :
                               load_balancer_tls_certificate_summary list
                                 option)
  ?instance_health_summary:(instance_health_summary_ :
                             instance_health_summary list option)
  ?instance_port:(instance_port_ : int option)
  ?health_check_path:(health_check_path_ : string option)
  ?public_ports:(public_ports_ : int list option)
  ?protocol:(protocol_ : load_balancer_protocol option)
  ?state:(state_ : load_balancer_state option)
  ?dns_name:(dns_name_ : string option) ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     tls_policy_name = tls_policy_name_;
     https_redirection_enabled = https_redirection_enabled_;
     ip_address_type = ip_address_type_;
     configuration_options = configuration_options_;
     tls_certificate_summaries = tls_certificate_summaries_;
     instance_health_summary = instance_health_summary_;
     instance_port = instance_port_;
     health_check_path = health_check_path_;
     public_ports = public_ports_;
     protocol = protocol_;
     state = state_;
     dns_name = dns_name_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : load_balancer)
let make_is_vpc_peered_request () = (() : unit)
let make_import_key_pair_request
  ~public_key_base64:(public_key_base64_ : string)
  ~key_pair_name:(key_pair_name_ : string) () =
  ({ public_key_base64 = public_key_base64_; key_pair_name = key_pair_name_ } : 
  import_key_pair_request)
let make_get_static_ips_request ?page_token:(page_token_ : string option) ()
  = ({ page_token = page_token_ } : get_static_ips_request)
let make_get_static_ip_request ~static_ip_name:(static_ip_name_ : string) ()
  = ({ static_ip_name = static_ip_name_ } : get_static_ip_request)
let make_get_setup_history_request ?page_token:(page_token_ : string option)
  ~resource_name:(resource_name_ : string) () =
  ({ page_token = page_token_; resource_name = resource_name_ } : get_setup_history_request)
let make_get_relational_database_snapshots_request
  ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_relational_database_snapshots_request)
let make_get_relational_database_snapshot_request
  ~relational_database_snapshot_name:(relational_database_snapshot_name_ :
                                       string)
  () =
  ({ relational_database_snapshot_name = relational_database_snapshot_name_ } : 
  get_relational_database_snapshot_request)
let make_get_relational_databases_request
  ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_relational_databases_request)
let make_get_relational_database_parameters_request
  ?page_token:(page_token_ : string option)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     page_token = page_token_;
     relational_database_name = relational_database_name_
   } : get_relational_database_parameters_request)
let make_get_relational_database_metric_data_request
  ~statistics:(statistics_ : metric_statistic list)
  ~unit_:(unit__ : metric_unit) ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t) ~period:(period_ : int)
  ~metric_name:(metric_name_ : relational_database_metric_name)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     statistics = statistics_;
     unit_ = unit__;
     end_time = end_time_;
     start_time = start_time_;
     period = period_;
     metric_name = metric_name_;
     relational_database_name = relational_database_name_
   } : get_relational_database_metric_data_request)
let make_get_relational_database_master_user_password_request
  ?password_version:(password_version_ :
                      relational_database_password_version option)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     password_version = password_version_;
     relational_database_name = relational_database_name_
   } : get_relational_database_master_user_password_request)
let make_get_relational_database_log_streams_request
  ~relational_database_name:(relational_database_name_ : string) () =
  ({ relational_database_name = relational_database_name_ } : get_relational_database_log_streams_request)
let make_get_relational_database_log_events_request
  ?page_token:(page_token_ : string option)
  ?start_from_head:(start_from_head_ : bool option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ~log_stream_name:(log_stream_name_ : string)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     page_token = page_token_;
     start_from_head = start_from_head_;
     end_time = end_time_;
     start_time = start_time_;
     log_stream_name = log_stream_name_;
     relational_database_name = relational_database_name_
   } : get_relational_database_log_events_request)
let make_get_relational_database_events_request
  ?page_token:(page_token_ : string option)
  ?duration_in_minutes:(duration_in_minutes_ : int option)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     page_token = page_token_;
     duration_in_minutes = duration_in_minutes_;
     relational_database_name = relational_database_name_
   } : get_relational_database_events_request)
let make_get_relational_database_bundles_request
  ?include_inactive:(include_inactive_ : bool option)
  ?page_token:(page_token_ : string option) () =
  ({ include_inactive = include_inactive_; page_token = page_token_ } : 
  get_relational_database_bundles_request)
let make_get_relational_database_blueprints_request
  ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_relational_database_blueprints_request)
let make_get_relational_database_request
  ~relational_database_name:(relational_database_name_ : string) () =
  ({ relational_database_name = relational_database_name_ } : get_relational_database_request)
let make_get_regions_request
  ?include_relational_database_availability_zones:(include_relational_database_availability_zones_
                                                    : bool option)
  ?include_availability_zones:(include_availability_zones_ : bool option) ()
  =
  ({
     include_relational_database_availability_zones =
       include_relational_database_availability_zones_;
     include_availability_zones = include_availability_zones_
   } : get_regions_request)
let make_get_operations_for_resource_request
  ?page_token:(page_token_ : string option)
  ~resource_name:(resource_name_ : string) () =
  ({ page_token = page_token_; resource_name = resource_name_ } : get_operations_for_resource_request)
let make_get_operations_request ?page_token:(page_token_ : string option) ()
  = ({ page_token = page_token_ } : get_operations_request)
let make_get_operation_request ~operation_id:(operation_id_ : string) () =
  ({ operation_id = operation_id_ } : get_operation_request)
let make_get_load_balancer_tls_policies_request
  ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_load_balancer_tls_policies_request)
let make_get_load_balancer_tls_certificates_request
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({ load_balancer_name = load_balancer_name_ } : get_load_balancer_tls_certificates_request)
let make_get_load_balancers_request ?page_token:(page_token_ : string option)
  () = ({ page_token = page_token_ } : get_load_balancers_request)
let make_get_load_balancer_metric_data_request
  ~statistics:(statistics_ : metric_statistic list)
  ~unit_:(unit__ : metric_unit) ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t) ~period:(period_ : int)
  ~metric_name:(metric_name_ : load_balancer_metric_name)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     statistics = statistics_;
     unit_ = unit__;
     end_time = end_time_;
     start_time = start_time_;
     period = period_;
     metric_name = metric_name_;
     load_balancer_name = load_balancer_name_
   } : get_load_balancer_metric_data_request)
let make_get_load_balancer_request
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({ load_balancer_name = load_balancer_name_ } : get_load_balancer_request)
let make_key_pair ?fingerprint:(fingerprint_ : string option)
  ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     fingerprint = fingerprint_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : key_pair)
let make_get_key_pairs_request
  ?include_default_key_pair:(include_default_key_pair_ : bool option)
  ?page_token:(page_token_ : string option) () =
  ({
     include_default_key_pair = include_default_key_pair_;
     page_token = page_token_
   } : get_key_pairs_request)
let make_get_key_pair_request ~key_pair_name:(key_pair_name_ : string) () =
  ({ key_pair_name = key_pair_name_ } : get_key_pair_request)
let make_instance_state ?name:(name_ : string option)
  ?code:(code_ : int option) () =
  ({ name = name_; code = code_ } : instance_state)
let make_get_instance_state_request ~instance_name:(instance_name_ : string)
  () = ({ instance_name = instance_name_ } : get_instance_state_request)
let make_add_on ?duration:(duration_ : string option)
  ?threshold:(threshold_ : string option)
  ?next_snapshot_time_of_day:(next_snapshot_time_of_day_ : string option)
  ?snapshot_time_of_day:(snapshot_time_of_day_ : string option)
  ?status:(status_ : string option) ?name:(name_ : string option) () =
  ({
     duration = duration_;
     threshold = threshold_;
     next_snapshot_time_of_day = next_snapshot_time_of_day_;
     snapshot_time_of_day = snapshot_time_of_day_;
     status = status_;
     name = name_
   } : add_on)
let make_disk
  ?auto_mount_status:(auto_mount_status_ : auto_mount_status option)
  ?gb_in_use:(gb_in_use_ : int option)
  ?attachment_state:(attachment_state_ : string option)
  ?is_attached:(is_attached_ : bool option)
  ?attached_to:(attached_to_ : string option)
  ?state:(state_ : disk_state option) ?path:(path_ : string option)
  ?iops:(iops_ : int option) ?is_system_disk:(is_system_disk_ : bool option)
  ?size_in_gb:(size_in_gb_ : int option)
  ?add_ons:(add_ons_ : add_on list option) ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     auto_mount_status = auto_mount_status_;
     gb_in_use = gb_in_use_;
     attachment_state = attachment_state_;
     is_attached = is_attached_;
     attached_to = attached_to_;
     state = state_;
     path = path_;
     iops = iops_;
     is_system_disk = is_system_disk_;
     size_in_gb = size_in_gb_;
     add_ons = add_ons_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : disk)
let make_instance_snapshot ?size_in_gb:(size_in_gb_ : int option)
  ?is_from_auto_snapshot:(is_from_auto_snapshot_ : bool option)
  ?from_bundle_id:(from_bundle_id_ : string option)
  ?from_blueprint_id:(from_blueprint_id_ : string option)
  ?from_instance_arn:(from_instance_arn_ : string option)
  ?from_instance_name:(from_instance_name_ : string option)
  ?from_attached_disks:(from_attached_disks_ : disk list option)
  ?progress:(progress_ : string option)
  ?state:(state_ : instance_snapshot_state option)
  ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     size_in_gb = size_in_gb_;
     is_from_auto_snapshot = is_from_auto_snapshot_;
     from_bundle_id = from_bundle_id_;
     from_blueprint_id = from_blueprint_id_;
     from_instance_arn = from_instance_arn_;
     from_instance_name = from_instance_name_;
     from_attached_disks = from_attached_disks_;
     progress = progress_;
     state = state_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : instance_snapshot)
let make_get_instance_snapshots_request
  ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_instance_snapshots_request)
let make_get_instance_snapshot_request
  ~instance_snapshot_name:(instance_snapshot_name_ : string) () =
  ({ instance_snapshot_name = instance_snapshot_name_ } : get_instance_snapshot_request)
let make_instance_hardware ?ram_size_in_gb:(ram_size_in_gb_ : float option)
  ?disks:(disks_ : disk list option) ?cpu_count:(cpu_count_ : int option) ()
  =
  ({ ram_size_in_gb = ram_size_in_gb_; disks = disks_; cpu_count = cpu_count_
   } : instance_hardware)
let make_instance_port_info
  ?cidr_list_aliases:(cidr_list_aliases_ : string list option)
  ?ipv6_cidrs:(ipv6_cidrs_ : string list option)
  ?cidrs:(cidrs_ : string list option)
  ?access_direction:(access_direction_ : access_direction option)
  ?common_name:(common_name_ : string option)
  ?access_type:(access_type_ : port_access_type option)
  ?access_from:(access_from_ : string option)
  ?protocol:(protocol_ : network_protocol option)
  ?to_port:(to_port_ : int option) ?from_port:(from_port_ : int option) () =
  ({
     cidr_list_aliases = cidr_list_aliases_;
     ipv6_cidrs = ipv6_cidrs_;
     cidrs = cidrs_;
     access_direction = access_direction_;
     common_name = common_name_;
     access_type = access_type_;
     access_from = access_from_;
     protocol = protocol_;
     to_port = to_port_;
     from_port = from_port_
   } : instance_port_info)
let make_instance_networking ?ports:(ports_ : instance_port_info list option)
  ?monthly_transfer:(monthly_transfer_ : monthly_transfer option) () =
  ({ ports = ports_; monthly_transfer = monthly_transfer_ } : instance_networking)
let make_instance_metadata_options
  ?http_protocol_ipv6:(http_protocol_ipv6_ : http_protocol_ipv6 option)
  ?http_put_response_hop_limit:(http_put_response_hop_limit_ : int option)
  ?http_endpoint:(http_endpoint_ : http_endpoint option)
  ?http_tokens:(http_tokens_ : http_tokens option)
  ?state:(state_ : instance_metadata_state option) () =
  ({
     http_protocol_ipv6 = http_protocol_ipv6_;
     http_put_response_hop_limit = http_put_response_hop_limit_;
     http_endpoint = http_endpoint_;
     http_tokens = http_tokens_;
     state = state_
   } : instance_metadata_options)
let make_instance
  ?metadata_options:(metadata_options_ : instance_metadata_options option)
  ?ssh_key_name:(ssh_key_name_ : string option)
  ?username:(username_ : string option)
  ?state:(state_ : instance_state option)
  ?networking:(networking_ : instance_networking option)
  ?hardware:(hardware_ : instance_hardware option)
  ?ip_address_type:(ip_address_type_ : ip_address_type option)
  ?ipv6_addresses:(ipv6_addresses_ : string list option)
  ?public_ip_address:(public_ip_address_ : string option)
  ?private_ip_address:(private_ip_address_ : string option)
  ?is_static_ip:(is_static_ip_ : bool option)
  ?add_ons:(add_ons_ : add_on list option)
  ?bundle_id:(bundle_id_ : string option)
  ?blueprint_name:(blueprint_name_ : string option)
  ?blueprint_id:(blueprint_id_ : string option)
  ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     metadata_options = metadata_options_;
     ssh_key_name = ssh_key_name_;
     username = username_;
     state = state_;
     networking = networking_;
     hardware = hardware_;
     ip_address_type = ip_address_type_;
     ipv6_addresses = ipv6_addresses_;
     public_ip_address = public_ip_address_;
     private_ip_address = private_ip_address_;
     is_static_ip = is_static_ip_;
     add_ons = add_ons_;
     bundle_id = bundle_id_;
     blueprint_name = blueprint_name_;
     blueprint_id = blueprint_id_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : instance)
let make_get_instances_request ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_instances_request)
let make_instance_port_state
  ?cidr_list_aliases:(cidr_list_aliases_ : string list option)
  ?ipv6_cidrs:(ipv6_cidrs_ : string list option)
  ?cidrs:(cidrs_ : string list option) ?state:(state_ : port_state option)
  ?protocol:(protocol_ : network_protocol option)
  ?to_port:(to_port_ : int option) ?from_port:(from_port_ : int option) () =
  ({
     cidr_list_aliases = cidr_list_aliases_;
     ipv6_cidrs = ipv6_cidrs_;
     cidrs = cidrs_;
     state = state_;
     protocol = protocol_;
     to_port = to_port_;
     from_port = from_port_
   } : instance_port_state)
let make_get_instance_port_states_request
  ~instance_name:(instance_name_ : string) () =
  ({ instance_name = instance_name_ } : get_instance_port_states_request)
let make_get_instance_metric_data_request
  ~statistics:(statistics_ : metric_statistic list)
  ~unit_:(unit__ : metric_unit) ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t) ~period:(period_ : int)
  ~metric_name:(metric_name_ : instance_metric_name)
  ~instance_name:(instance_name_ : string) () =
  ({
     statistics = statistics_;
     unit_ = unit__;
     end_time = end_time_;
     start_time = start_time_;
     period = period_;
     metric_name = metric_name_;
     instance_name = instance_name_
   } : get_instance_metric_data_request)
let make_host_key_attributes
  ?not_valid_after:(not_valid_after_ : CoreTypes.Timestamp.t option)
  ?not_valid_before:(not_valid_before_ : CoreTypes.Timestamp.t option)
  ?fingerprint_sh_a256:(fingerprint_sh_a256_ : string option)
  ?fingerprint_sh_a1:(fingerprint_sh_a1_ : string option)
  ?witnessed_at:(witnessed_at_ : CoreTypes.Timestamp.t option)
  ?public_key:(public_key_ : string option)
  ?algorithm:(algorithm_ : string option) () =
  ({
     not_valid_after = not_valid_after_;
     not_valid_before = not_valid_before_;
     fingerprint_sh_a256 = fingerprint_sh_a256_;
     fingerprint_sh_a1 = fingerprint_sh_a1_;
     witnessed_at = witnessed_at_;
     public_key = public_key_;
     algorithm = algorithm_
   } : host_key_attributes)
let make_instance_access_details
  ?host_keys:(host_keys_ : host_key_attributes list option)
  ?username:(username_ : string option)
  ?instance_name:(instance_name_ : string option)
  ?protocol:(protocol_ : instance_access_protocol option)
  ?private_key:(private_key_ : string option)
  ?password_data:(password_data_ : password_data option)
  ?password:(password_ : string option)
  ?ipv6_addresses:(ipv6_addresses_ : string list option)
  ?ip_address:(ip_address_ : string option)
  ?expires_at:(expires_at_ : CoreTypes.Timestamp.t option)
  ?cert_key:(cert_key_ : string option) () =
  ({
     host_keys = host_keys_;
     username = username_;
     instance_name = instance_name_;
     protocol = protocol_;
     private_key = private_key_;
     password_data = password_data_;
     password = password_;
     ipv6_addresses = ipv6_addresses_;
     ip_address = ip_address_;
     expires_at = expires_at_;
     cert_key = cert_key_
   } : instance_access_details)
let make_get_instance_access_details_request
  ?protocol:(protocol_ : instance_access_protocol option)
  ~instance_name:(instance_name_ : string) () =
  ({ protocol = protocol_; instance_name = instance_name_ } : get_instance_access_details_request)
let make_get_instance_request ~instance_name:(instance_name_ : string) () =
  ({ instance_name = instance_name_ } : get_instance_request)
let make_disk_info ?is_system_disk:(is_system_disk_ : bool option)
  ?size_in_gb:(size_in_gb_ : int option) ?path:(path_ : string option)
  ?name:(name_ : string option) () =
  ({
     is_system_disk = is_system_disk_;
     size_in_gb = size_in_gb_;
     path = path_;
     name = name_
   } : disk_info)
let make_instance_snapshot_info
  ?from_disk_info:(from_disk_info_ : disk_info list option)
  ?from_blueprint_id:(from_blueprint_id_ : string option)
  ?from_bundle_id:(from_bundle_id_ : string option) () =
  ({
     from_disk_info = from_disk_info_;
     from_blueprint_id = from_blueprint_id_;
     from_bundle_id = from_bundle_id_
   } : instance_snapshot_info)
let make_disk_snapshot_info ?size_in_gb:(size_in_gb_ : int option) () =
  ({ size_in_gb = size_in_gb_ } : disk_snapshot_info)
let make_export_snapshot_record_source_info
  ?disk_snapshot_info:(disk_snapshot_info_ : disk_snapshot_info option)
  ?instance_snapshot_info:(instance_snapshot_info_ :
                            instance_snapshot_info option)
  ?from_resource_arn:(from_resource_arn_ : string option)
  ?from_resource_name:(from_resource_name_ : string option)
  ?arn:(arn_ : string option) ?name:(name_ : string option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?resource_type:(resource_type_ : export_snapshot_record_source_type option)
  () =
  ({
     disk_snapshot_info = disk_snapshot_info_;
     instance_snapshot_info = instance_snapshot_info_;
     from_resource_arn = from_resource_arn_;
     from_resource_name = from_resource_name_;
     arn = arn_;
     name = name_;
     created_at = created_at_;
     resource_type = resource_type_
   } : export_snapshot_record_source_info)
let make_destination_info ?service:(service_ : string option)
  ?id:(id_ : string option) () =
  ({ service = service_; id = id_ } : destination_info)
let make_export_snapshot_record
  ?destination_info:(destination_info_ : destination_info option)
  ?source_info:(source_info_ : export_snapshot_record_source_info option)
  ?state:(state_ : record_state option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?arn:(arn_ : string option) ?name:(name_ : string option) () =
  ({
     destination_info = destination_info_;
     source_info = source_info_;
     state = state_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : export_snapshot_record)
let make_get_export_snapshot_records_request
  ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_export_snapshot_records_request)
let make_domain
  ?registered_domain_delegation_info:(registered_domain_delegation_info_ :
                                       registered_domain_delegation_info
                                         option)
  ?domain_entries:(domain_entries_ : domain_entry list option)
  ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     registered_domain_delegation_info = registered_domain_delegation_info_;
     domain_entries = domain_entries_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : domain)
let make_get_domains_request ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_domains_request)
let make_get_domain_request ~domain_name:(domain_name_ : string) () =
  ({ domain_name = domain_name_ } : get_domain_request)
let make_lightsail_distribution
  ?viewer_minimum_tls_protocol_version:(viewer_minimum_tls_protocol_version_
                                         : string option)
  ?tags:(tags_ : tag list option)
  ?ip_address_type:(ip_address_type_ : ip_address_type option)
  ?able_to_update_bundle:(able_to_update_bundle_ : bool option)
  ?cache_behaviors:(cache_behaviors_ : cache_behavior_per_path list option)
  ?cache_behavior_settings:(cache_behavior_settings_ : cache_settings option)
  ?default_cache_behavior:(default_cache_behavior_ : cache_behavior option)
  ?origin_public_dn_s:(origin_public_dn_s_ : string option)
  ?origin:(origin_ : origin option)
  ?certificate_name:(certificate_name_ : string option)
  ?bundle_id:(bundle_id_ : string option)
  ?domain_name:(domain_name_ : string option)
  ?is_enabled:(is_enabled_ : bool option) ?status:(status_ : string option)
  ?alternative_domain_names:(alternative_domain_names_ : string list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     viewer_minimum_tls_protocol_version =
       viewer_minimum_tls_protocol_version_;
     tags = tags_;
     ip_address_type = ip_address_type_;
     able_to_update_bundle = able_to_update_bundle_;
     cache_behaviors = cache_behaviors_;
     cache_behavior_settings = cache_behavior_settings_;
     default_cache_behavior = default_cache_behavior_;
     origin_public_dn_s = origin_public_dn_s_;
     origin = origin_;
     certificate_name = certificate_name_;
     bundle_id = bundle_id_;
     domain_name = domain_name_;
     is_enabled = is_enabled_;
     status = status_;
     alternative_domain_names = alternative_domain_names_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : lightsail_distribution)
let make_get_distributions_request ?page_token:(page_token_ : string option)
  ?distribution_name:(distribution_name_ : string option) () =
  ({ page_token = page_token_; distribution_name = distribution_name_ } : 
  get_distributions_request)
let make_get_distribution_metric_data_request
  ~statistics:(statistics_ : metric_statistic list)
  ~unit_:(unit__ : metric_unit) ~period:(period_ : int)
  ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t)
  ~metric_name:(metric_name_ : distribution_metric_name)
  ~distribution_name:(distribution_name_ : string) () =
  ({
     statistics = statistics_;
     unit_ = unit__;
     period = period_;
     end_time = end_time_;
     start_time = start_time_;
     metric_name = metric_name_;
     distribution_name = distribution_name_
   } : get_distribution_metric_data_request)
let make_get_distribution_latest_cache_reset_request
  ?distribution_name:(distribution_name_ : string option) () =
  ({ distribution_name = distribution_name_ } : get_distribution_latest_cache_reset_request)
let make_distribution_bundle ?is_active:(is_active_ : bool option)
  ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : int option)
  ?price:(price_ : float option) ?name:(name_ : string option)
  ?bundle_id:(bundle_id_ : string option) () =
  ({
     is_active = is_active_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     price = price_;
     name = name_;
     bundle_id = bundle_id_
   } : distribution_bundle)
let make_get_distribution_bundles_request () = (() : unit)
let make_disk_snapshot
  ?is_from_auto_snapshot:(is_from_auto_snapshot_ : bool option)
  ?from_instance_arn:(from_instance_arn_ : string option)
  ?from_instance_name:(from_instance_name_ : string option)
  ?from_disk_arn:(from_disk_arn_ : string option)
  ?from_disk_name:(from_disk_name_ : string option)
  ?progress:(progress_ : string option)
  ?state:(state_ : disk_snapshot_state option)
  ?size_in_gb:(size_in_gb_ : int option) ?tags:(tags_ : tag list option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?support_code:(support_code_ : string option) ?arn:(arn_ : string option)
  ?name:(name_ : string option) () =
  ({
     is_from_auto_snapshot = is_from_auto_snapshot_;
     from_instance_arn = from_instance_arn_;
     from_instance_name = from_instance_name_;
     from_disk_arn = from_disk_arn_;
     from_disk_name = from_disk_name_;
     progress = progress_;
     state = state_;
     size_in_gb = size_in_gb_;
     tags = tags_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     support_code = support_code_;
     arn = arn_;
     name = name_
   } : disk_snapshot)
let make_get_disk_snapshots_request ?page_token:(page_token_ : string option)
  () = ({ page_token = page_token_ } : get_disk_snapshots_request)
let make_get_disk_snapshot_request
  ~disk_snapshot_name:(disk_snapshot_name_ : string) () =
  ({ disk_snapshot_name = disk_snapshot_name_ } : get_disk_snapshot_request)
let make_get_disks_request ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_disks_request)
let make_get_disk_request ~disk_name:(disk_name_ : string) () =
  ({ disk_name = disk_name_ } : get_disk_request)
let make_get_cost_estimate_request
  ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t)
  ~resource_name:(resource_name_ : string) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     resource_name = resource_name_
   } : get_cost_estimate_request)
let make_get_container_services_request
  ?service_name:(service_name_ : string option) () =
  ({ service_name = service_name_ } : get_container_services_request)
let make_container_service_power ?is_active:(is_active_ : bool option)
  ?name:(name_ : string option)
  ?ram_size_in_gb:(ram_size_in_gb_ : float option)
  ?cpu_count:(cpu_count_ : float option) ?price:(price_ : float option)
  ?power_id:(power_id_ : string option) () =
  ({
     is_active = is_active_;
     name = name_;
     ram_size_in_gb = ram_size_in_gb_;
     cpu_count = cpu_count_;
     price = price_;
     power_id = power_id_
   } : container_service_power)
let make_get_container_service_powers_request () = (() : unit)
let make_get_container_service_metric_data_request
  ~statistics:(statistics_ : metric_statistic list) ~period:(period_ : int)
  ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t)
  ~metric_name:(metric_name_ : container_service_metric_name)
  ~service_name:(service_name_ : string) () =
  ({
     statistics = statistics_;
     period = period_;
     end_time = end_time_;
     start_time = start_time_;
     metric_name = metric_name_;
     service_name = service_name_
   } : get_container_service_metric_data_request)
let make_get_container_service_deployments_request
  ~service_name:(service_name_ : string) () =
  ({ service_name = service_name_ } : get_container_service_deployments_request)
let make_container_service_log_event ?message:(message_ : string option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option) () =
  ({ message = message_; created_at = created_at_ } : container_service_log_event)
let make_get_container_log_request ?page_token:(page_token_ : string option)
  ?filter_pattern:(filter_pattern_ : string option)
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option)
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option)
  ~container_name:(container_name_ : string)
  ~service_name:(service_name_ : string) () =
  ({
     page_token = page_token_;
     filter_pattern = filter_pattern_;
     end_time = end_time_;
     start_time = start_time_;
     container_name = container_name_;
     service_name = service_name_
   } : get_container_log_request)
let make_get_container_images_request ~service_name:(service_name_ : string)
  () = ({ service_name = service_name_ } : get_container_images_request)
let make_get_container_api_metadata_request () = (() : unit)
let make_contact_method ?support_code:(support_code_ : string option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?arn:(arn_ : string option) ?name:(name_ : string option)
  ?protocol:(protocol_ : contact_protocol option)
  ?status:(status_ : contact_method_status option)
  ?contact_endpoint:(contact_endpoint_ : string option) () =
  ({
     support_code = support_code_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     arn = arn_;
     name = name_;
     protocol = protocol_;
     status = status_;
     contact_endpoint = contact_endpoint_
   } : contact_method)
let make_get_contact_methods_request
  ?protocols:(protocols_ : contact_protocol list option) () =
  ({ protocols = protocols_ } : get_contact_methods_request)
let make_cloud_formation_stack_record_source_info ?arn:(arn_ : string option)
  ?name:(name_ : string option)
  ?resource_type:(resource_type_ :
                   cloud_formation_stack_record_source_type option)
  () =
  ({ arn = arn_; name = name_; resource_type = resource_type_ } : cloud_formation_stack_record_source_info)
let make_cloud_formation_stack_record
  ?destination_info:(destination_info_ : destination_info option)
  ?source_info:(source_info_ :
                 cloud_formation_stack_record_source_info list option)
  ?state:(state_ : record_state option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?arn:(arn_ : string option) ?name:(name_ : string option) () =
  ({
     destination_info = destination_info_;
     source_info = source_info_;
     state = state_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : cloud_formation_stack_record)
let make_get_cloud_formation_stack_records_request
  ?page_token:(page_token_ : string option) () =
  ({ page_token = page_token_ } : get_cloud_formation_stack_records_request)
let make_certificate ?support_code:(support_code_ : string option)
  ?tags:(tags_ : tag list option)
  ?revocation_reason:(revocation_reason_ : string option)
  ?revoked_at:(revoked_at_ : CoreTypes.Timestamp.t option)
  ?renewal_summary:(renewal_summary_ : renewal_summary option)
  ?eligible_to_renew:(eligible_to_renew_ : string option)
  ?not_after:(not_after_ : CoreTypes.Timestamp.t option)
  ?not_before:(not_before_ : CoreTypes.Timestamp.t option)
  ?issuer_c_a:(issuer_c_a_ : string option)
  ?issued_at:(issued_at_ : CoreTypes.Timestamp.t option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?key_algorithm:(key_algorithm_ : string option)
  ?in_use_resource_count:(in_use_resource_count_ : int option)
  ?request_failure_reason:(request_failure_reason_ : string option)
  ?domain_validation_records:(domain_validation_records_ :
                               domain_validation_record list option)
  ?subject_alternative_names:(subject_alternative_names_ :
                               string list option)
  ?serial_number:(serial_number_ : string option)
  ?status:(status_ : certificate_status option)
  ?domain_name:(domain_name_ : string option) ?name:(name_ : string option)
  ?arn:(arn_ : string option) () =
  ({
     support_code = support_code_;
     tags = tags_;
     revocation_reason = revocation_reason_;
     revoked_at = revoked_at_;
     renewal_summary = renewal_summary_;
     eligible_to_renew = eligible_to_renew_;
     not_after = not_after_;
     not_before = not_before_;
     issuer_c_a = issuer_c_a_;
     issued_at = issued_at_;
     created_at = created_at_;
     key_algorithm = key_algorithm_;
     in_use_resource_count = in_use_resource_count_;
     request_failure_reason = request_failure_reason_;
     domain_validation_records = domain_validation_records_;
     subject_alternative_names = subject_alternative_names_;
     serial_number = serial_number_;
     status = status_;
     domain_name = domain_name_;
     name = name_;
     arn = arn_
   } : certificate)
let make_certificate_summary ?tags:(tags_ : tag list option)
  ?certificate_detail:(certificate_detail_ : certificate option)
  ?domain_name:(domain_name_ : string option)
  ?certificate_name:(certificate_name_ : string option)
  ?certificate_arn:(certificate_arn_ : string option) () =
  ({
     tags = tags_;
     certificate_detail = certificate_detail_;
     domain_name = domain_name_;
     certificate_name = certificate_name_;
     certificate_arn = certificate_arn_
   } : certificate_summary)
let make_get_certificates_request ?page_token:(page_token_ : string option)
  ?certificate_name:(certificate_name_ : string option)
  ?include_certificate_details:(include_certificate_details_ : bool option)
  ?certificate_statuses:(certificate_statuses_ :
                          certificate_status list option)
  () =
  ({
     page_token = page_token_;
     certificate_name = certificate_name_;
     include_certificate_details = include_certificate_details_;
     certificate_statuses = certificate_statuses_
   } : get_certificates_request)
let make_bundle
  ?public_ipv4_address_count:(public_ipv4_address_count_ : int option)
  ?supported_app_categories:(supported_app_categories_ :
                              app_category list option)
  ?supported_platforms:(supported_platforms_ : instance_platform list option)
  ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : int option)
  ?ram_size_in_gb:(ram_size_in_gb_ : float option)
  ?power:(power_ : int option) ?name:(name_ : string option)
  ?is_active:(is_active_ : bool option)
  ?instance_type:(instance_type_ : string option)
  ?bundle_id:(bundle_id_ : string option)
  ?disk_size_in_gb:(disk_size_in_gb_ : int option)
  ?cpu_count:(cpu_count_ : int option) ?price:(price_ : float option) () =
  ({
     public_ipv4_address_count = public_ipv4_address_count_;
     supported_app_categories = supported_app_categories_;
     supported_platforms = supported_platforms_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     ram_size_in_gb = ram_size_in_gb_;
     power = power_;
     name = name_;
     is_active = is_active_;
     instance_type = instance_type_;
     bundle_id = bundle_id_;
     disk_size_in_gb = disk_size_in_gb_;
     cpu_count = cpu_count_;
     price = price_
   } : bundle)
let make_get_bundles_request
  ?app_category:(app_category_ : app_category option)
  ?page_token:(page_token_ : string option)
  ?include_inactive:(include_inactive_ : bool option) () =
  ({
     app_category = app_category_;
     page_token = page_token_;
     include_inactive = include_inactive_
   } : get_bundles_request)
let make_account_level_bpa_sync
  ?bpa_impacts_lightsail:(bpa_impacts_lightsail_ : bool option)
  ?message:(message_ : bpa_status_message option)
  ?last_synced_at:(last_synced_at_ : CoreTypes.Timestamp.t option)
  ?status:(status_ : account_level_bpa_sync_status option) () =
  ({
     bpa_impacts_lightsail = bpa_impacts_lightsail_;
     message = message_;
     last_synced_at = last_synced_at_;
     status = status_
   } : account_level_bpa_sync)
let make_get_buckets_request
  ?include_connected_resources:(include_connected_resources_ : bool option)
  ?page_token:(page_token_ : string option)
  ?bucket_name:(bucket_name_ : string option) () =
  ({
     include_connected_resources = include_connected_resources_;
     page_token = page_token_;
     bucket_name = bucket_name_
   } : get_buckets_request)
let make_get_bucket_metric_data_request ~unit_:(unit__ : metric_unit)
  ~statistics:(statistics_ : metric_statistic list) ~period:(period_ : int)
  ~end_time:(end_time_ : CoreTypes.Timestamp.t)
  ~start_time:(start_time_ : CoreTypes.Timestamp.t)
  ~metric_name:(metric_name_ : bucket_metric_name)
  ~bucket_name:(bucket_name_ : string) () =
  ({
     unit_ = unit__;
     statistics = statistics_;
     period = period_;
     end_time = end_time_;
     start_time = start_time_;
     metric_name = metric_name_;
     bucket_name = bucket_name_
   } : get_bucket_metric_data_request)
let make_bucket_bundle ?is_active:(is_active_ : bool option)
  ?transfer_per_month_in_gb:(transfer_per_month_in_gb_ : int option)
  ?storage_per_month_in_gb:(storage_per_month_in_gb_ : int option)
  ?price:(price_ : float option) ?name:(name_ : string option)
  ?bundle_id:(bundle_id_ : string option) () =
  ({
     is_active = is_active_;
     transfer_per_month_in_gb = transfer_per_month_in_gb_;
     storage_per_month_in_gb = storage_per_month_in_gb_;
     price = price_;
     name = name_;
     bundle_id = bundle_id_
   } : bucket_bundle)
let make_get_bucket_bundles_request
  ?include_inactive:(include_inactive_ : bool option) () =
  ({ include_inactive = include_inactive_ } : get_bucket_bundles_request)
let make_access_key_last_used ?service_name:(service_name_ : string option)
  ?region:(region_ : string option)
  ?last_used_date:(last_used_date_ : CoreTypes.Timestamp.t option) () =
  ({
     service_name = service_name_;
     region = region_;
     last_used_date = last_used_date_
   } : access_key_last_used)
let make_access_key ?last_used:(last_used_ : access_key_last_used option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?status:(status_ : status_type option)
  ?secret_access_key:(secret_access_key_ : string option)
  ?access_key_id:(access_key_id_ : string option) () =
  ({
     last_used = last_used_;
     created_at = created_at_;
     status = status_;
     secret_access_key = secret_access_key_;
     access_key_id = access_key_id_
   } : access_key)
let make_get_bucket_access_keys_request ~bucket_name:(bucket_name_ : string)
  () = ({ bucket_name = bucket_name_ } : get_bucket_access_keys_request)
let make_blueprint ?app_category:(app_category_ : app_category option)
  ?platform:(platform_ : instance_platform option)
  ?license_url:(license_url_ : string option)
  ?product_url:(product_url_ : string option)
  ?version_code:(version_code_ : string option)
  ?version:(version_ : string option) ?min_power:(min_power_ : int option)
  ?is_active:(is_active_ : bool option)
  ?description:(description_ : string option)
  ?type_:(type__ : blueprint_type option) ?group:(group_ : string option)
  ?name:(name_ : string option) ?blueprint_id:(blueprint_id_ : string option)
  () =
  ({
     app_category = app_category_;
     platform = platform_;
     license_url = license_url_;
     product_url = product_url_;
     version_code = version_code_;
     version = version_;
     min_power = min_power_;
     is_active = is_active_;
     description = description_;
     type_ = type__;
     group = group_;
     name = name_;
     blueprint_id = blueprint_id_
   } : blueprint)
let make_get_blueprints_request
  ?app_category:(app_category_ : app_category option)
  ?page_token:(page_token_ : string option)
  ?include_inactive:(include_inactive_ : bool option) () =
  ({
     app_category = app_category_;
     page_token = page_token_;
     include_inactive = include_inactive_
   } : get_blueprints_request)
let make_attached_disk ?size_in_gb:(size_in_gb_ : int option)
  ?path:(path_ : string option) () =
  ({ size_in_gb = size_in_gb_; path = path_ } : attached_disk)
let make_auto_snapshot_details
  ?from_attached_disks:(from_attached_disks_ : attached_disk list option)
  ?status:(status_ : auto_snapshot_status option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?date:(date_ : string option) () =
  ({
     from_attached_disks = from_attached_disks_;
     status = status_;
     created_at = created_at_;
     date = date_
   } : auto_snapshot_details)
let make_get_auto_snapshots_request ~resource_name:(resource_name_ : string)
  () = ({ resource_name = resource_name_ } : get_auto_snapshots_request)
let make_alarm ?notification_enabled:(notification_enabled_ : bool option)
  ?notification_triggers:(notification_triggers_ : alarm_state list option)
  ?contact_protocols:(contact_protocols_ : contact_protocol list option)
  ?unit_:(unit__ : metric_unit option) ?state:(state_ : alarm_state option)
  ?metric_name:(metric_name_ : metric_name option)
  ?statistic:(statistic_ : metric_statistic option)
  ?treat_missing_data:(treat_missing_data_ : treat_missing_data option)
  ?datapoints_to_alarm:(datapoints_to_alarm_ : int option)
  ?threshold:(threshold_ : float option) ?period:(period_ : int option)
  ?evaluation_periods:(evaluation_periods_ : int option)
  ?comparison_operator:(comparison_operator_ : comparison_operator option)
  ?monitored_resource_info:(monitored_resource_info_ :
                             monitored_resource_info option)
  ?support_code:(support_code_ : string option)
  ?resource_type:(resource_type_ : resource_type option)
  ?location:(location_ : resource_location option)
  ?created_at:(created_at_ : CoreTypes.Timestamp.t option)
  ?arn:(arn_ : string option) ?name:(name_ : string option) () =
  ({
     notification_enabled = notification_enabled_;
     notification_triggers = notification_triggers_;
     contact_protocols = contact_protocols_;
     unit_ = unit__;
     state = state_;
     metric_name = metric_name_;
     statistic = statistic_;
     treat_missing_data = treat_missing_data_;
     datapoints_to_alarm = datapoints_to_alarm_;
     threshold = threshold_;
     period = period_;
     evaluation_periods = evaluation_periods_;
     comparison_operator = comparison_operator_;
     monitored_resource_info = monitored_resource_info_;
     support_code = support_code_;
     resource_type = resource_type_;
     location = location_;
     created_at = created_at_;
     arn = arn_;
     name = name_
   } : alarm)
let make_get_alarms_request
  ?monitored_resource_name:(monitored_resource_name_ : string option)
  ?page_token:(page_token_ : string option)
  ?alarm_name:(alarm_name_ : string option) () =
  ({
     monitored_resource_name = monitored_resource_name_;
     page_token = page_token_;
     alarm_name = alarm_name_
   } : get_alarms_request)
let make_get_active_names_request ?page_token:(page_token_ : string option)
  () = ({ page_token = page_token_ } : get_active_names_request)
let make_export_snapshot_request
  ~source_snapshot_name:(source_snapshot_name_ : string) () =
  ({ source_snapshot_name = source_snapshot_name_ } : export_snapshot_request)
let make_auto_snapshot_add_on_request
  ?snapshot_time_of_day:(snapshot_time_of_day_ : string option) () =
  ({ snapshot_time_of_day = snapshot_time_of_day_ } : auto_snapshot_add_on_request)
let make_add_on_request
  ?stop_instance_on_idle_request:(stop_instance_on_idle_request_ :
                                   stop_instance_on_idle_request option)
  ?auto_snapshot_add_on_request:(auto_snapshot_add_on_request_ :
                                  auto_snapshot_add_on_request option)
  ~add_on_type:(add_on_type_ : add_on_type) () =
  ({
     stop_instance_on_idle_request = stop_instance_on_idle_request_;
     auto_snapshot_add_on_request = auto_snapshot_add_on_request_;
     add_on_type = add_on_type_
   } : add_on_request)
let make_enable_add_on_request
  ~add_on_request:(add_on_request_ : add_on_request)
  ~resource_name:(resource_name_ : string) () =
  ({ add_on_request = add_on_request_; resource_name = resource_name_ } : 
  enable_add_on_request)
let make_download_default_key_pair_request () = (() : unit)
let make_disable_add_on_request ~resource_name:(resource_name_ : string)
  ~add_on_type:(add_on_type_ : add_on_type) () =
  ({ resource_name = resource_name_; add_on_type = add_on_type_ } : disable_add_on_request)
let make_detach_static_ip_request ~static_ip_name:(static_ip_name_ : string)
  () = ({ static_ip_name = static_ip_name_ } : detach_static_ip_request)
let make_detach_instances_from_load_balancer_request
  ~instance_names:(instance_names_ : string list)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     instance_names = instance_names_;
     load_balancer_name = load_balancer_name_
   } : detach_instances_from_load_balancer_request)
let make_detach_disk_request ~disk_name:(disk_name_ : string) () =
  ({ disk_name = disk_name_ } : detach_disk_request)
let make_detach_certificate_from_distribution_request
  ~distribution_name:(distribution_name_ : string) () =
  ({ distribution_name = distribution_name_ } : detach_certificate_from_distribution_request)
let make_delete_relational_database_snapshot_request
  ~relational_database_snapshot_name:(relational_database_snapshot_name_ :
                                       string)
  () =
  ({ relational_database_snapshot_name = relational_database_snapshot_name_ } : 
  delete_relational_database_snapshot_request)
let make_delete_relational_database_request
  ?final_relational_database_snapshot_name:(final_relational_database_snapshot_name_
                                             : string option)
  ?skip_final_snapshot:(skip_final_snapshot_ : bool option)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     final_relational_database_snapshot_name =
       final_relational_database_snapshot_name_;
     skip_final_snapshot = skip_final_snapshot_;
     relational_database_name = relational_database_name_
   } : delete_relational_database_request)
let make_delete_load_balancer_tls_certificate_request
  ?force:(force_ : bool option)
  ~certificate_name:(certificate_name_ : string)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     force = force_;
     certificate_name = certificate_name_;
     load_balancer_name = load_balancer_name_
   } : delete_load_balancer_tls_certificate_request)
let make_delete_load_balancer_request
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({ load_balancer_name = load_balancer_name_ } : delete_load_balancer_request)
let make_delete_known_host_keys_request
  ~instance_name:(instance_name_ : string) () =
  ({ instance_name = instance_name_ } : delete_known_host_keys_request)
let make_delete_key_pair_request
  ?expected_fingerprint:(expected_fingerprint_ : string option)
  ~key_pair_name:(key_pair_name_ : string) () =
  ({
     expected_fingerprint = expected_fingerprint_;
     key_pair_name = key_pair_name_
   } : delete_key_pair_request)
let make_delete_instance_snapshot_request
  ~instance_snapshot_name:(instance_snapshot_name_ : string) () =
  ({ instance_snapshot_name = instance_snapshot_name_ } : delete_instance_snapshot_request)
let make_delete_instance_request
  ?force_delete_add_ons:(force_delete_add_ons_ : bool option)
  ~instance_name:(instance_name_ : string) () =
  ({
     force_delete_add_ons = force_delete_add_ons_;
     instance_name = instance_name_
   } : delete_instance_request)
let make_delete_domain_entry_request
  ~domain_entry:(domain_entry_ : domain_entry)
  ~domain_name:(domain_name_ : string) () =
  ({ domain_entry = domain_entry_; domain_name = domain_name_ } : delete_domain_entry_request)
let make_delete_domain_request ~domain_name:(domain_name_ : string) () =
  ({ domain_name = domain_name_ } : delete_domain_request)
let make_delete_distribution_request
  ?distribution_name:(distribution_name_ : string option) () =
  ({ distribution_name = distribution_name_ } : delete_distribution_request)
let make_delete_disk_snapshot_request
  ~disk_snapshot_name:(disk_snapshot_name_ : string) () =
  ({ disk_snapshot_name = disk_snapshot_name_ } : delete_disk_snapshot_request)
let make_delete_disk_request
  ?force_delete_add_ons:(force_delete_add_ons_ : bool option)
  ~disk_name:(disk_name_ : string) () =
  ({ force_delete_add_ons = force_delete_add_ons_; disk_name = disk_name_ } : 
  delete_disk_request)
let make_delete_container_service_request
  ~service_name:(service_name_ : string) () =
  ({ service_name = service_name_ } : delete_container_service_request)
let make_delete_container_image_request ~image:(image_ : string)
  ~service_name:(service_name_ : string) () =
  ({ image = image_; service_name = service_name_ } : delete_container_image_request)
let make_delete_contact_method_request
  ~protocol:(protocol_ : contact_protocol) () =
  ({ protocol = protocol_ } : delete_contact_method_request)
let make_delete_certificate_request
  ~certificate_name:(certificate_name_ : string) () =
  ({ certificate_name = certificate_name_ } : delete_certificate_request)
let make_delete_bucket_access_key_request
  ~access_key_id:(access_key_id_ : string)
  ~bucket_name:(bucket_name_ : string) () =
  ({ access_key_id = access_key_id_; bucket_name = bucket_name_ } : delete_bucket_access_key_request)
let make_delete_bucket_request ?force_delete:(force_delete_ : bool option)
  ~bucket_name:(bucket_name_ : string) () =
  ({ force_delete = force_delete_; bucket_name = bucket_name_ } : delete_bucket_request)
let make_delete_auto_snapshot_request ~date:(date_ : string)
  ~resource_name:(resource_name_ : string) () =
  ({ date = date_; resource_name = resource_name_ } : delete_auto_snapshot_request)
let make_delete_alarm_request ~alarm_name:(alarm_name_ : string) () =
  ({ alarm_name = alarm_name_ } : delete_alarm_request)
let make_create_relational_database_snapshot_request
  ?tags:(tags_ : tag list option)
  ~relational_database_snapshot_name:(relational_database_snapshot_name_ :
                                       string)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     tags = tags_;
     relational_database_snapshot_name = relational_database_snapshot_name_;
     relational_database_name = relational_database_name_
   } : create_relational_database_snapshot_request)
let make_create_relational_database_from_snapshot_request
  ?tags:(tags_ : tag list option)
  ?use_latest_restorable_time:(use_latest_restorable_time_ : bool option)
  ?restore_time:(restore_time_ : CoreTypes.Timestamp.t option)
  ?source_relational_database_name:(source_relational_database_name_ :
                                     string option)
  ?relational_database_bundle_id:(relational_database_bundle_id_ :
                                   string option)
  ?relational_database_snapshot_name:(relational_database_snapshot_name_ :
                                       string option)
  ?publicly_accessible:(publicly_accessible_ : bool option)
  ?availability_zone:(availability_zone_ : string option)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     tags = tags_;
     use_latest_restorable_time = use_latest_restorable_time_;
     restore_time = restore_time_;
     source_relational_database_name = source_relational_database_name_;
     relational_database_bundle_id = relational_database_bundle_id_;
     relational_database_snapshot_name = relational_database_snapshot_name_;
     publicly_accessible = publicly_accessible_;
     availability_zone = availability_zone_;
     relational_database_name = relational_database_name_
   } : create_relational_database_from_snapshot_request)
let make_create_relational_database_request ?tags:(tags_ : tag list option)
  ?publicly_accessible:(publicly_accessible_ : bool option)
  ?preferred_maintenance_window:(preferred_maintenance_window_ :
                                  string option)
  ?preferred_backup_window:(preferred_backup_window_ : string option)
  ?master_user_password:(master_user_password_ : string option)
  ?availability_zone:(availability_zone_ : string option)
  ~master_username:(master_username_ : string)
  ~master_database_name:(master_database_name_ : string)
  ~relational_database_bundle_id:(relational_database_bundle_id_ : string)
  ~relational_database_blueprint_id:(relational_database_blueprint_id_ :
                                      string)
  ~relational_database_name:(relational_database_name_ : string) () =
  ({
     tags = tags_;
     publicly_accessible = publicly_accessible_;
     preferred_maintenance_window = preferred_maintenance_window_;
     preferred_backup_window = preferred_backup_window_;
     master_user_password = master_user_password_;
     master_username = master_username_;
     master_database_name = master_database_name_;
     relational_database_bundle_id = relational_database_bundle_id_;
     relational_database_blueprint_id = relational_database_blueprint_id_;
     availability_zone = availability_zone_;
     relational_database_name = relational_database_name_
   } : create_relational_database_request)
let make_create_load_balancer_tls_certificate_request
  ?tags:(tags_ : tag list option)
  ?certificate_alternative_names:(certificate_alternative_names_ :
                                   string list option)
  ~certificate_domain_name:(certificate_domain_name_ : string)
  ~certificate_name:(certificate_name_ : string)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     tags = tags_;
     certificate_alternative_names = certificate_alternative_names_;
     certificate_domain_name = certificate_domain_name_;
     certificate_name = certificate_name_;
     load_balancer_name = load_balancer_name_
   } : create_load_balancer_tls_certificate_request)
let make_create_load_balancer_request
  ?tls_policy_name:(tls_policy_name_ : string option)
  ?ip_address_type:(ip_address_type_ : ip_address_type option)
  ?tags:(tags_ : tag list option)
  ?certificate_alternative_names:(certificate_alternative_names_ :
                                   string list option)
  ?certificate_domain_name:(certificate_domain_name_ : string option)
  ?certificate_name:(certificate_name_ : string option)
  ?health_check_path:(health_check_path_ : string option)
  ~instance_port:(instance_port_ : int)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     tls_policy_name = tls_policy_name_;
     ip_address_type = ip_address_type_;
     tags = tags_;
     certificate_alternative_names = certificate_alternative_names_;
     certificate_domain_name = certificate_domain_name_;
     certificate_name = certificate_name_;
     health_check_path = health_check_path_;
     instance_port = instance_port_;
     load_balancer_name = load_balancer_name_
   } : create_load_balancer_request)
let make_create_key_pair_request ?tags:(tags_ : tag list option)
  ~key_pair_name:(key_pair_name_ : string) () =
  ({ tags = tags_; key_pair_name = key_pair_name_ } : create_key_pair_request)
let make_create_instance_snapshot_request ?tags:(tags_ : tag list option)
  ~instance_name:(instance_name_ : string)
  ~instance_snapshot_name:(instance_snapshot_name_ : string) () =
  ({
     tags = tags_;
     instance_name = instance_name_;
     instance_snapshot_name = instance_snapshot_name_
   } : create_instance_snapshot_request)
let make_disk_map ?new_disk_name:(new_disk_name_ : string option)
  ?original_disk_path:(original_disk_path_ : string option) () =
  ({ new_disk_name = new_disk_name_; original_disk_path = original_disk_path_
   } : disk_map)
let make_create_instances_from_snapshot_request
  ?use_latest_restorable_auto_snapshot:(use_latest_restorable_auto_snapshot_
                                         : bool option)
  ?restore_date:(restore_date_ : string option)
  ?source_instance_name:(source_instance_name_ : string option)
  ?ip_address_type:(ip_address_type_ : ip_address_type option)
  ?add_ons:(add_ons_ : add_on_request list option)
  ?tags:(tags_ : tag list option)
  ?key_pair_name:(key_pair_name_ : string option)
  ?user_data:(user_data_ : string option)
  ?instance_snapshot_name:(instance_snapshot_name_ : string option)
  ?attached_disk_mapping:(attached_disk_mapping_ : attached_disk_map option)
  ~bundle_id:(bundle_id_ : string)
  ~availability_zone:(availability_zone_ : string)
  ~instance_names:(instance_names_ : string list) () =
  ({
     use_latest_restorable_auto_snapshot =
       use_latest_restorable_auto_snapshot_;
     restore_date = restore_date_;
     source_instance_name = source_instance_name_;
     ip_address_type = ip_address_type_;
     add_ons = add_ons_;
     tags = tags_;
     key_pair_name = key_pair_name_;
     user_data = user_data_;
     bundle_id = bundle_id_;
     instance_snapshot_name = instance_snapshot_name_;
     availability_zone = availability_zone_;
     attached_disk_mapping = attached_disk_mapping_;
     instance_names = instance_names_
   } : create_instances_from_snapshot_request)
let make_create_instances_request
  ?ip_address_type:(ip_address_type_ : ip_address_type option)
  ?add_ons:(add_ons_ : add_on_request list option)
  ?tags:(tags_ : tag list option)
  ?key_pair_name:(key_pair_name_ : string option)
  ?user_data:(user_data_ : string option)
  ?custom_image_name:(custom_image_name_ : string option)
  ~bundle_id:(bundle_id_ : string) ~blueprint_id:(blueprint_id_ : string)
  ~availability_zone:(availability_zone_ : string)
  ~instance_names:(instance_names_ : string list) () =
  ({
     ip_address_type = ip_address_type_;
     add_ons = add_ons_;
     tags = tags_;
     key_pair_name = key_pair_name_;
     user_data = user_data_;
     bundle_id = bundle_id_;
     blueprint_id = blueprint_id_;
     custom_image_name = custom_image_name_;
     availability_zone = availability_zone_;
     instance_names = instance_names_
   } : create_instances_request)
let make_create_gui_session_access_details_request
  ~resource_name:(resource_name_ : string) () =
  ({ resource_name = resource_name_ } : create_gui_session_access_details_request)
let make_create_domain_entry_request
  ~domain_entry:(domain_entry_ : domain_entry)
  ~domain_name:(domain_name_ : string) () =
  ({ domain_entry = domain_entry_; domain_name = domain_name_ } : create_domain_entry_request)
let make_create_domain_request ?tags:(tags_ : tag list option)
  ~domain_name:(domain_name_ : string) () =
  ({ tags = tags_; domain_name = domain_name_ } : create_domain_request)
let make_create_distribution_request
  ?viewer_minimum_tls_protocol_version:(viewer_minimum_tls_protocol_version_
                                         :
                                         viewer_minimum_tls_protocol_version_enum
                                           option)
  ?certificate_name:(certificate_name_ : string option)
  ?tags:(tags_ : tag list option)
  ?ip_address_type:(ip_address_type_ : ip_address_type option)
  ?cache_behaviors:(cache_behaviors_ : cache_behavior_per_path list option)
  ?cache_behavior_settings:(cache_behavior_settings_ : cache_settings option)
  ~bundle_id:(bundle_id_ : string)
  ~default_cache_behavior:(default_cache_behavior_ : cache_behavior)
  ~origin:(origin_ : input_origin)
  ~distribution_name:(distribution_name_ : string) () =
  ({
     viewer_minimum_tls_protocol_version =
       viewer_minimum_tls_protocol_version_;
     certificate_name = certificate_name_;
     tags = tags_;
     ip_address_type = ip_address_type_;
     bundle_id = bundle_id_;
     cache_behaviors = cache_behaviors_;
     cache_behavior_settings = cache_behavior_settings_;
     default_cache_behavior = default_cache_behavior_;
     origin = origin_;
     distribution_name = distribution_name_
   } : create_distribution_request)
let make_create_disk_snapshot_request ?tags:(tags_ : tag list option)
  ?instance_name:(instance_name_ : string option)
  ?disk_name:(disk_name_ : string option)
  ~disk_snapshot_name:(disk_snapshot_name_ : string) () =
  ({
     tags = tags_;
     instance_name = instance_name_;
     disk_snapshot_name = disk_snapshot_name_;
     disk_name = disk_name_
   } : create_disk_snapshot_request)
let make_create_disk_from_snapshot_request
  ?use_latest_restorable_auto_snapshot:(use_latest_restorable_auto_snapshot_
                                         : bool option)
  ?restore_date:(restore_date_ : string option)
  ?source_disk_name:(source_disk_name_ : string option)
  ?add_ons:(add_ons_ : add_on_request list option)
  ?tags:(tags_ : tag list option)
  ?disk_snapshot_name:(disk_snapshot_name_ : string option)
  ~size_in_gb:(size_in_gb_ : int)
  ~availability_zone:(availability_zone_ : string)
  ~disk_name:(disk_name_ : string) () =
  ({
     use_latest_restorable_auto_snapshot =
       use_latest_restorable_auto_snapshot_;
     restore_date = restore_date_;
     source_disk_name = source_disk_name_;
     add_ons = add_ons_;
     tags = tags_;
     size_in_gb = size_in_gb_;
     availability_zone = availability_zone_;
     disk_snapshot_name = disk_snapshot_name_;
     disk_name = disk_name_
   } : create_disk_from_snapshot_request)
let make_create_disk_request ?add_ons:(add_ons_ : add_on_request list option)
  ?tags:(tags_ : tag list option) ~size_in_gb:(size_in_gb_ : int)
  ~availability_zone:(availability_zone_ : string)
  ~disk_name:(disk_name_ : string) () =
  ({
     add_ons = add_ons_;
     tags = tags_;
     size_in_gb = size_in_gb_;
     availability_zone = availability_zone_;
     disk_name = disk_name_
   } : create_disk_request)
let make_container_service_registry_login
  ?registry:(registry_ : string option)
  ?expires_at:(expires_at_ : CoreTypes.Timestamp.t option)
  ?password:(password_ : string option) ?username:(username_ : string option)
  () =
  ({
     registry = registry_;
     expires_at = expires_at_;
     password = password_;
     username = username_
   } : container_service_registry_login)
let make_create_container_service_registry_login_request () = (() : unit)
let make_endpoint_request
  ?health_check:(health_check_ :
                  container_service_health_check_config option)
  ~container_port:(container_port_ : int)
  ~container_name:(container_name_ : string) () =
  ({
     health_check = health_check_;
     container_port = container_port_;
     container_name = container_name_
   } : endpoint_request)
let make_create_container_service_deployment_request
  ?public_endpoint:(public_endpoint_ : endpoint_request option)
  ?containers:(containers_ : container_map option)
  ~service_name:(service_name_ : string) () =
  ({
     public_endpoint = public_endpoint_;
     containers = containers_;
     service_name = service_name_
   } : create_container_service_deployment_request)
let make_container_service_deployment_request
  ?public_endpoint:(public_endpoint_ : endpoint_request option)
  ?containers:(containers_ : container_map option) () =
  ({ public_endpoint = public_endpoint_; containers = containers_ } : 
  container_service_deployment_request)
let make_create_container_service_request
  ?private_registry_access:(private_registry_access_ :
                             private_registry_access_request option)
  ?deployment:(deployment_ : container_service_deployment_request option)
  ?public_domain_names:(public_domain_names_ :
                         container_service_public_domains option)
  ?tags:(tags_ : tag list option) ~scale:(scale_ : int)
  ~power:(power_ : container_service_power_name)
  ~service_name:(service_name_ : string) () =
  ({
     private_registry_access = private_registry_access_;
     deployment = deployment_;
     public_domain_names = public_domain_names_;
     tags = tags_;
     scale = scale_;
     power = power_;
     service_name = service_name_
   } : create_container_service_request)
let make_create_contact_method_request
  ~contact_endpoint:(contact_endpoint_ : string)
  ~protocol:(protocol_ : contact_protocol) () =
  ({ contact_endpoint = contact_endpoint_; protocol = protocol_ } : create_contact_method_request)
let make_instance_entry ?user_data:(user_data_ : string option)
  ~availability_zone:(availability_zone_ : string)
  ~port_info_source:(port_info_source_ : port_info_source_type)
  ~instance_type:(instance_type_ : string)
  ~source_name:(source_name_ : string) () =
  ({
     availability_zone = availability_zone_;
     user_data = user_data_;
     port_info_source = port_info_source_;
     instance_type = instance_type_;
     source_name = source_name_
   } : instance_entry)
let make_create_cloud_formation_stack_request
  ~instances:(instances_ : instance_entry list) () =
  ({ instances = instances_ } : create_cloud_formation_stack_request)
let make_create_certificate_request ?tags:(tags_ : tag list option)
  ?subject_alternative_names:(subject_alternative_names_ :
                               string list option)
  ~domain_name:(domain_name_ : string)
  ~certificate_name:(certificate_name_ : string) () =
  ({
     tags = tags_;
     subject_alternative_names = subject_alternative_names_;
     domain_name = domain_name_;
     certificate_name = certificate_name_
   } : create_certificate_request)
let make_create_bucket_access_key_request
  ~bucket_name:(bucket_name_ : string) () =
  ({ bucket_name = bucket_name_ } : create_bucket_access_key_request)
let make_create_bucket_request
  ?enable_object_versioning:(enable_object_versioning_ : bool option)
  ?tags:(tags_ : tag list option) ~bundle_id:(bundle_id_ : string)
  ~bucket_name:(bucket_name_ : string) () =
  ({
     enable_object_versioning = enable_object_versioning_;
     tags = tags_;
     bundle_id = bundle_id_;
     bucket_name = bucket_name_
   } : create_bucket_request)
let make_copy_snapshot_request
  ?use_latest_restorable_auto_snapshot:(use_latest_restorable_auto_snapshot_
                                         : bool option)
  ?restore_date:(restore_date_ : string option)
  ?source_resource_name:(source_resource_name_ : string option)
  ?source_snapshot_name:(source_snapshot_name_ : string option)
  ~source_region:(source_region_ : region_name)
  ~target_snapshot_name:(target_snapshot_name_ : string) () =
  ({
     source_region = source_region_;
     target_snapshot_name = target_snapshot_name_;
     use_latest_restorable_auto_snapshot =
       use_latest_restorable_auto_snapshot_;
     restore_date = restore_date_;
     source_resource_name = source_resource_name_;
     source_snapshot_name = source_snapshot_name_
   } : copy_snapshot_request)
let make_close_instance_public_ports_request
  ~instance_name:(instance_name_ : string)
  ~port_info:(port_info_ : port_info) () =
  ({ instance_name = instance_name_; port_info = port_info_ } : close_instance_public_ports_request)
let make_attach_static_ip_request ~instance_name:(instance_name_ : string)
  ~static_ip_name:(static_ip_name_ : string) () =
  ({ instance_name = instance_name_; static_ip_name = static_ip_name_ } : 
  attach_static_ip_request)
let make_attach_load_balancer_tls_certificate_request
  ~certificate_name:(certificate_name_ : string)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     certificate_name = certificate_name_;
     load_balancer_name = load_balancer_name_
   } : attach_load_balancer_tls_certificate_request)
let make_attach_instances_to_load_balancer_request
  ~instance_names:(instance_names_ : string list)
  ~load_balancer_name:(load_balancer_name_ : string) () =
  ({
     instance_names = instance_names_;
     load_balancer_name = load_balancer_name_
   } : attach_instances_to_load_balancer_request)
let make_attach_disk_request ?auto_mounting:(auto_mounting_ : bool option)
  ~disk_path:(disk_path_ : string) ~instance_name:(instance_name_ : string)
  ~disk_name:(disk_name_ : string) () =
  ({
     auto_mounting = auto_mounting_;
     disk_path = disk_path_;
     instance_name = instance_name_;
     disk_name = disk_name_
   } : attach_disk_request)
let make_attach_certificate_to_distribution_request
  ~certificate_name:(certificate_name_ : string)
  ~distribution_name:(distribution_name_ : string) () =
  ({
     certificate_name = certificate_name_;
     distribution_name = distribution_name_
   } : attach_certificate_to_distribution_request)
let make_allocate_static_ip_request
  ~static_ip_name:(static_ip_name_ : string) () =
  ({ static_ip_name = static_ip_name_ } : allocate_static_ip_request)