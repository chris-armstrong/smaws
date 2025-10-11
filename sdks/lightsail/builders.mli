open Types

val make_setup_request :
  ?certificate_provider:certificate_provider ->
  ?domain_names:setup_domain_name_list ->
  ?instance_name:resource_name ->
  unit ->
  setup_request

val make_resource_location :
  ?region_name:region_name -> ?availability_zone:string_ -> unit -> resource_location

val make_setup_history_resource :
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  setup_history_resource

val make_setup_execution_details :
  ?version:string_ ->
  ?standard_output:string_ ->
  ?standard_error:string_ ->
  ?status:setup_status ->
  ?name:non_empty_string ->
  ?date_time:iso_date ->
  ?command:string_ ->
  unit ->
  setup_execution_details

val make_setup_history :
  ?status:setup_status ->
  ?execution_details:setup_execution_details_list ->
  ?resource:setup_history_resource ->
  ?request:setup_request ->
  ?operation_id:non_empty_string ->
  unit ->
  setup_history

val make_operation :
  ?error_details:string_ ->
  ?error_code:string_ ->
  ?status_changed_at:iso_date ->
  ?status:operation_status ->
  ?operation_type:operation_type ->
  ?operation_details:string_ ->
  ?is_terminal:boolean_ ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?resource_type:resource_type ->
  ?resource_name:resource_name ->
  ?id:non_empty_string ->
  unit ->
  operation

val make_update_relational_database_request :
  ?relational_database_blueprint_id:string_ ->
  ?ca_certificate_identifier:string_ ->
  ?apply_immediately:boolean_ ->
  ?publicly_accessible:boolean_ ->
  ?disable_backup_retention:boolean_ ->
  ?enable_backup_retention:boolean_ ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?rotate_master_user_password:boolean_ ->
  ?master_user_password:sensitive_string ->
  relational_database_name:resource_name ->
  unit ->
  update_relational_database_request

val make_relational_database_parameter :
  ?parameter_value:string_ ->
  ?parameter_name:string_ ->
  ?is_modifiable:boolean_ ->
  ?description:string_ ->
  ?data_type:string_ ->
  ?apply_type:string_ ->
  ?apply_method:string_ ->
  ?allowed_values:string_ ->
  unit ->
  relational_database_parameter

val make_update_relational_database_parameters_request :
  parameters:relational_database_parameter_list ->
  relational_database_name:resource_name ->
  unit ->
  update_relational_database_parameters_request

val make_update_load_balancer_attribute_request :
  attribute_value:string_max256 ->
  attribute_name:load_balancer_attribute_name ->
  load_balancer_name:resource_name ->
  unit ->
  update_load_balancer_attribute_request

val make_update_instance_metadata_options_request :
  ?http_protocol_ipv6:http_protocol_ipv6 ->
  ?http_put_response_hop_limit:integer ->
  ?http_endpoint:http_endpoint ->
  ?http_tokens:http_tokens ->
  instance_name:resource_name ->
  unit ->
  update_instance_metadata_options_request

val make_domain_entry :
  ?options:domain_entry_options ->
  ?type_:domain_entry_type ->
  ?is_alias:boolean_ ->
  ?target:string_ ->
  ?name:domain_name ->
  ?id:non_empty_string ->
  unit ->
  domain_entry

val make_update_domain_entry_request :
  domain_entry:domain_entry -> domain_name:domain_name -> unit -> update_domain_entry_request

val make_input_origin :
  ?response_timeout:integer ->
  ?protocol_policy:origin_protocol_policy_enum ->
  ?region_name:region_name ->
  ?name:resource_name ->
  unit ->
  input_origin

val make_cache_behavior : ?behavior:behavior_enum -> unit -> cache_behavior

val make_cookie_object :
  ?cookies_allow_list:string_list -> ?option_:forward_values -> unit -> cookie_object

val make_header_object :
  ?headers_allow_list:header_forward_list -> ?option_:forward_values -> unit -> header_object

val make_query_string_object :
  ?query_strings_allow_list:string_list -> ?option_:boolean_ -> unit -> query_string_object

val make_cache_settings :
  ?forwarded_query_strings:query_string_object ->
  ?forwarded_headers:header_object ->
  ?forwarded_cookies:cookie_object ->
  ?cached_http_methods:non_empty_string ->
  ?allowed_http_methods:non_empty_string ->
  ?maximum_tt_l:long ->
  ?minimum_tt_l:long ->
  ?default_tt_l:long ->
  unit ->
  cache_settings

val make_cache_behavior_per_path :
  ?behavior:behavior_enum -> ?path:string_ -> unit -> cache_behavior_per_path

val make_update_distribution_request :
  ?use_default_certificate:boolean_ ->
  ?certificate_name:resource_name ->
  ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum ->
  ?is_enabled:boolean_ ->
  ?cache_behaviors:cache_behavior_list ->
  ?cache_behavior_settings:cache_settings ->
  ?default_cache_behavior:cache_behavior ->
  ?origin:input_origin ->
  distribution_name:resource_name ->
  unit ->
  update_distribution_request

val make_update_distribution_bundle_request :
  ?bundle_id:string_ ->
  ?distribution_name:resource_name ->
  unit ->
  update_distribution_bundle_request

val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_container_service_state_detail :
  ?message:string_ ->
  ?code:container_service_state_detail_code ->
  unit ->
  container_service_state_detail

val make_container :
  ?ports:port_map ->
  ?environment:environment ->
  ?command:string_list ->
  ?image:string_ ->
  unit ->
  container

val make_container_service_health_check_config :
  ?success_codes:string_ ->
  ?path:string_ ->
  ?interval_seconds:integer ->
  ?timeout_seconds:integer ->
  ?unhealthy_threshold:integer ->
  ?healthy_threshold:integer ->
  unit ->
  container_service_health_check_config

val make_container_service_endpoint :
  ?health_check:container_service_health_check_config ->
  ?container_port:integer ->
  ?container_name:string_ ->
  unit ->
  container_service_endpoint

val make_container_service_deployment :
  ?created_at:iso_date ->
  ?public_endpoint:container_service_endpoint ->
  ?containers:container_map ->
  ?state:container_service_deployment_state ->
  ?version:integer ->
  unit ->
  container_service_deployment

val make_container_service_ecr_image_puller_role :
  ?principal_arn:string_ -> ?is_active:boolean_ -> unit -> container_service_ecr_image_puller_role

val make_private_registry_access :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role -> unit -> private_registry_access

val make_container_service :
  ?private_registry_access:private_registry_access ->
  ?url:string_ ->
  ?public_domain_names:container_service_public_domains ->
  ?private_domain_name:string_ ->
  ?principal_arn:string_ ->
  ?is_disabled:boolean_ ->
  ?next_deployment:container_service_deployment ->
  ?current_deployment:container_service_deployment ->
  ?scale:container_service_scale ->
  ?state_detail:container_service_state_detail ->
  ?state:container_service_state ->
  ?power_id:string_ ->
  ?power:container_service_power_name ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?arn:non_empty_string ->
  ?container_service_name:container_service_name ->
  unit ->
  container_service

val make_container_service_ecr_image_puller_role_request :
  ?is_active:boolean_ -> unit -> container_service_ecr_image_puller_role_request

val make_private_registry_access_request :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role_request ->
  unit ->
  private_registry_access_request

val make_update_container_service_request :
  ?private_registry_access:private_registry_access_request ->
  ?public_domain_names:container_service_public_domains ->
  ?is_disabled:boolean_ ->
  ?scale:container_service_scale ->
  ?power:container_service_power_name ->
  service_name:container_service_name ->
  unit ->
  update_container_service_request

val make_access_rules :
  ?allow_public_overrides:boolean_ -> ?get_object:access_type -> unit -> access_rules

val make_resource_receiving_access :
  ?resource_type:non_empty_string -> ?name:non_empty_string -> unit -> resource_receiving_access

val make_bucket_state : ?message:string_ -> ?code:non_empty_string -> unit -> bucket_state

val make_bucket_access_log_config :
  ?prefix:bucket_access_log_prefix ->
  ?destination:bucket_name ->
  enabled:boolean_ ->
  unit ->
  bucket_access_log_config

val make_bucket :
  ?access_log_config:bucket_access_log_config ->
  ?state:bucket_state ->
  ?resources_receiving_access:access_receiver_list ->
  ?readonly_access_accounts:partner_id_list ->
  ?able_to_update_bundle:boolean_ ->
  ?object_versioning:non_empty_string ->
  ?tags:tag_list ->
  ?support_code:non_empty_string ->
  ?name:bucket_name ->
  ?location:resource_location ->
  ?url:non_empty_string ->
  ?created_at:iso_date ->
  ?bundle_id:non_empty_string ->
  ?arn:non_empty_string ->
  ?access_rules:access_rules ->
  ?resource_type:non_empty_string ->
  unit ->
  bucket

val make_update_bucket_request :
  ?access_log_config:bucket_access_log_config ->
  ?readonly_access_accounts:partner_id_list ->
  ?versioning:non_empty_string ->
  ?access_rules:access_rules ->
  bucket_name:bucket_name ->
  unit ->
  update_bucket_request

val make_update_bucket_bundle_request :
  bundle_id:non_empty_string -> bucket_name:bucket_name -> unit -> update_bucket_bundle_request

val make_untag_resource_request :
  ?resource_arn:resource_arn ->
  tag_keys:tag_key_list ->
  resource_name:resource_name ->
  unit ->
  untag_resource_request

val make_unpeer_vpc_request : unit -> unit
val make_time_period : ?end_:iso_date -> ?start:iso_date -> unit -> time_period

val make_test_alarm_request :
  state:alarm_state -> alarm_name:resource_name -> unit -> test_alarm_request

val make_tag_resource_request :
  ?resource_arn:resource_arn ->
  tags:tag_list ->
  resource_name:resource_name ->
  unit ->
  tag_resource_request

val make_stop_relational_database_request :
  ?relational_database_snapshot_name:resource_name ->
  relational_database_name:resource_name ->
  unit ->
  stop_relational_database_request

val make_stop_instance_request :
  ?force:boolean_ -> instance_name:resource_name -> unit -> stop_instance_request

val make_stop_instance_on_idle_request :
  ?duration:string_ -> ?threshold:string_ -> unit -> stop_instance_on_idle_request

val make_stop_gui_session_request : resource_name:resource_name -> unit -> stop_gui_session_request

val make_static_ip :
  ?is_attached:boolean_ ->
  ?attached_to:resource_name ->
  ?ip_address:ip_address ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  static_ip

val make_start_relational_database_request :
  relational_database_name:resource_name -> unit -> start_relational_database_request

val make_start_instance_request : instance_name:resource_name -> unit -> start_instance_request

val make_start_gui_session_request :
  resource_name:resource_name -> unit -> start_gui_session_request

val make_setup_instance_https_request :
  certificate_provider:certificate_provider ->
  domain_names:setup_domain_name_list ->
  email_address:email_address ->
  instance_name:resource_name ->
  unit ->
  setup_instance_https_request

val make_set_resource_access_for_bucket_request :
  access:resource_bucket_access ->
  bucket_name:bucket_name ->
  resource_name:resource_name ->
  unit ->
  set_resource_access_for_bucket_request

val make_set_ip_address_type_request :
  ?accept_bundle_update:boolean_ ->
  ip_address_type:ip_address_type ->
  resource_name:resource_name ->
  resource_type:resource_type ->
  unit ->
  set_ip_address_type_request

val make_session :
  ?is_primary:boolean_ ->
  ?url:sensitive_non_empty_string ->
  ?name:non_empty_string ->
  unit ->
  session

val make_send_contact_method_verification_request :
  protocol:contact_method_verification_protocol -> unit -> send_contact_method_verification_request

val make_estimate_by_time :
  ?time_period:time_period ->
  ?currency:currency ->
  ?unit_:double ->
  ?pricing_unit:pricing_unit ->
  ?usage_cost:double ->
  unit ->
  estimate_by_time

val make_cost_estimate :
  ?results_by_time:estimates_by_time -> ?usage_type:non_empty_string -> unit -> cost_estimate

val make_resource_budget_estimate :
  ?end_time:iso_date ->
  ?start_time:iso_date ->
  ?cost_estimates:cost_estimates ->
  ?resource_type:resource_type ->
  ?resource_name:resource_name ->
  unit ->
  resource_budget_estimate

val make_resource_record :
  ?value:string_ -> ?type_:string_ -> ?name:string_ -> unit -> resource_record

val make_reset_distribution_cache_request :
  ?distribution_name:resource_name -> unit -> reset_distribution_cache_request

val make_dns_record_creation_state :
  ?message:string_ -> ?code:dns_record_creation_state_code -> unit -> dns_record_creation_state

val make_domain_validation_record :
  ?validation_status:certificate_domain_validation_status ->
  ?dns_record_creation_state:dns_record_creation_state ->
  ?resource_record:resource_record ->
  ?domain_name:domain_name ->
  unit ->
  domain_validation_record

val make_renewal_summary :
  ?updated_at:iso_date ->
  ?renewal_status_reason:renewal_status_reason ->
  ?renewal_status:renewal_status ->
  ?domain_validation_records:domain_validation_record_list ->
  unit ->
  renewal_summary

val make_release_static_ip_request :
  static_ip_name:resource_name -> unit -> release_static_ip_request

val make_relational_database_snapshot :
  ?from_relational_database_blueprint_id:string_ ->
  ?from_relational_database_bundle_id:string_ ->
  ?from_relational_database_arn:non_empty_string ->
  ?from_relational_database_name:non_empty_string ->
  ?state:non_empty_string ->
  ?size_in_gb:integer ->
  ?engine_version:non_empty_string ->
  ?engine:non_empty_string ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  relational_database_snapshot

val make_relational_database_hardware :
  ?ram_size_in_gb:float_ ->
  ?disk_size_in_gb:integer ->
  ?cpu_count:integer ->
  unit ->
  relational_database_hardware

val make_pending_modified_relational_database_values :
  ?backup_retention_enabled:boolean_ ->
  ?engine_version:string_ ->
  ?master_user_password:string_ ->
  unit ->
  pending_modified_relational_database_values

val make_relational_database_endpoint :
  ?address:non_empty_string -> ?port:integer -> unit -> relational_database_endpoint

val make_pending_maintenance_action :
  ?current_apply_date:iso_date ->
  ?description:non_empty_string ->
  ?action:non_empty_string ->
  unit ->
  pending_maintenance_action

val make_relational_database :
  ?ca_certificate_identifier:string_ ->
  ?pending_maintenance_actions:pending_maintenance_action_list ->
  ?master_endpoint:relational_database_endpoint ->
  ?publicly_accessible:boolean_ ->
  ?preferred_maintenance_window:non_empty_string ->
  ?preferred_backup_window:non_empty_string ->
  ?parameter_apply_status:non_empty_string ->
  ?master_username:non_empty_string ->
  ?latest_restorable_time:iso_date ->
  ?engine_version:non_empty_string ->
  ?engine:non_empty_string ->
  ?pending_modified_values:pending_modified_relational_database_values ->
  ?backup_retention_enabled:boolean_ ->
  ?secondary_availability_zone:string_ ->
  ?state:non_empty_string ->
  ?hardware:relational_database_hardware ->
  ?master_database_name:string_ ->
  ?relational_database_bundle_id:non_empty_string ->
  ?relational_database_blueprint_id:non_empty_string ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  relational_database

val make_relational_database_event :
  ?event_categories:string_list ->
  ?message:string_ ->
  ?created_at:iso_date ->
  ?resource:resource_name ->
  unit ->
  relational_database_event

val make_relational_database_bundle :
  ?is_active:boolean_ ->
  ?is_encrypted:boolean_ ->
  ?cpu_count:integer ->
  ?transfer_per_month_in_gb:integer ->
  ?disk_size_in_gb:integer ->
  ?ram_size_in_gb:float_ ->
  ?price:float_ ->
  ?name:string_ ->
  ?bundle_id:string_ ->
  unit ->
  relational_database_bundle

val make_relational_database_blueprint :
  ?is_engine_default:boolean_ ->
  ?engine_version_description:string_ ->
  ?engine_description:string_ ->
  ?engine_version:string_ ->
  ?engine:relational_database_engine ->
  ?blueprint_id:string_ ->
  unit ->
  relational_database_blueprint

val make_name_servers_update_state :
  ?message:string_ -> ?code:name_servers_update_state_code -> unit -> name_servers_update_state

val make_r53_hosted_zone_deletion_state :
  ?message:string_ ->
  ?code:r53_hosted_zone_deletion_state_code ->
  unit ->
  r53_hosted_zone_deletion_state

val make_registered_domain_delegation_info :
  ?r53_hosted_zone_deletion_state:r53_hosted_zone_deletion_state ->
  ?name_servers_update_state:name_servers_update_state ->
  unit ->
  registered_domain_delegation_info

val make_container_image :
  ?created_at:iso_date -> ?digest:string_ -> ?image:string_ -> unit -> container_image

val make_register_container_image_request :
  digest:string_ ->
  label:container_label ->
  service_name:container_service_name ->
  unit ->
  register_container_image_request

val make_availability_zone :
  ?state:non_empty_string -> ?zone_name:non_empty_string -> unit -> availability_zone

val make_region :
  ?relational_database_availability_zones:availability_zone_list ->
  ?availability_zones:availability_zone_list ->
  ?name:region_name ->
  ?display_name:string_ ->
  ?description:string_ ->
  ?continent_code:string_ ->
  unit ->
  region

val make_reboot_relational_database_request :
  relational_database_name:resource_name -> unit -> reboot_relational_database_request

val make_reboot_instance_request : instance_name:resource_name -> unit -> reboot_instance_request

val make_port_info :
  ?cidr_list_aliases:string_list ->
  ?ipv6_cidrs:string_list ->
  ?cidrs:string_list ->
  ?protocol:network_protocol ->
  ?to_port:port ->
  ?from_port:port ->
  unit ->
  port_info

val make_put_instance_public_ports_request :
  instance_name:resource_name ->
  port_infos:port_info_list ->
  unit ->
  put_instance_public_ports_request

val make_put_alarm_request :
  ?notification_enabled:boolean_ ->
  ?notification_triggers:notification_trigger_list ->
  ?contact_protocols:contact_protocols_list ->
  ?treat_missing_data:treat_missing_data ->
  ?datapoints_to_alarm:integer ->
  evaluation_periods:integer ->
  threshold:double ->
  comparison_operator:comparison_operator ->
  monitored_resource_name:resource_name ->
  metric_name:metric_name ->
  alarm_name:resource_name ->
  unit ->
  put_alarm_request

val make_peer_vpc_request : unit -> unit

val make_password_data :
  ?key_pair_name:resource_name -> ?ciphertext:string_ -> unit -> password_data

val make_origin :
  ?response_timeout:integer ->
  ?protocol_policy:origin_protocol_policy_enum ->
  ?region_name:region_name ->
  ?resource_type:resource_type ->
  ?name:resource_name ->
  unit ->
  origin

val make_open_instance_public_ports_request :
  instance_name:resource_name -> port_info:port_info -> unit -> open_instance_public_ports_request

val make_monthly_transfer : ?gb_per_month_allocated:integer -> unit -> monthly_transfer

val make_monitored_resource_info :
  ?resource_type:resource_type ->
  ?name:resource_name ->
  ?arn:resource_arn ->
  unit ->
  monitored_resource_info

val make_metric_datapoint :
  ?unit_:metric_unit ->
  ?timestamp:timestamp ->
  ?sum:double ->
  ?sample_count:double ->
  ?minimum:double ->
  ?maximum:double ->
  ?average:double ->
  unit ->
  metric_datapoint

val make_log_event : ?message:string_ -> ?created_at:iso_date -> unit -> log_event

val make_load_balancer_tls_policy :
  ?ciphers:string_list ->
  ?protocols:string_list ->
  ?description:string_ ->
  ?is_default:boolean_ ->
  ?name:resource_name ->
  unit ->
  load_balancer_tls_policy

val make_load_balancer_tls_certificate_summary :
  ?is_attached:boolean_ -> ?name:resource_name -> unit -> load_balancer_tls_certificate_summary

val make_load_balancer_tls_certificate_domain_validation_option :
  ?validation_status:load_balancer_tls_certificate_domain_status ->
  ?domain_name:domain_name ->
  unit ->
  load_balancer_tls_certificate_domain_validation_option

val make_load_balancer_tls_certificate_renewal_summary :
  ?domain_validation_options:load_balancer_tls_certificate_domain_validation_option_list ->
  ?renewal_status:load_balancer_tls_certificate_renewal_status ->
  unit ->
  load_balancer_tls_certificate_renewal_summary

val make_load_balancer_tls_certificate_dns_record_creation_state :
  ?message:string_ ->
  ?code:load_balancer_tls_certificate_dns_record_creation_state_code ->
  unit ->
  load_balancer_tls_certificate_dns_record_creation_state

val make_load_balancer_tls_certificate_domain_validation_record :
  ?dns_record_creation_state:load_balancer_tls_certificate_dns_record_creation_state ->
  ?domain_name:domain_name ->
  ?validation_status:load_balancer_tls_certificate_domain_status ->
  ?value:non_empty_string ->
  ?type_:non_empty_string ->
  ?name:non_empty_string ->
  unit ->
  load_balancer_tls_certificate_domain_validation_record

val make_load_balancer_tls_certificate :
  ?subject_alternative_names:string_list ->
  ?subject:non_empty_string ->
  ?signature_algorithm:non_empty_string ->
  ?serial:non_empty_string ->
  ?revoked_at:iso_date ->
  ?revocation_reason:load_balancer_tls_certificate_revocation_reason ->
  ?renewal_summary:load_balancer_tls_certificate_renewal_summary ->
  ?not_before:iso_date ->
  ?not_after:iso_date ->
  ?key_algorithm:non_empty_string ->
  ?issuer:non_empty_string ->
  ?issued_at:iso_date ->
  ?failure_reason:load_balancer_tls_certificate_failure_reason ->
  ?domain_validation_records:load_balancer_tls_certificate_domain_validation_record_list ->
  ?domain_name:domain_name ->
  ?status:load_balancer_tls_certificate_status ->
  ?is_attached:boolean_ ->
  ?load_balancer_name:resource_name ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  load_balancer_tls_certificate

val make_instance_health_summary :
  ?instance_health_reason:instance_health_reason ->
  ?instance_health:instance_health_state ->
  ?instance_name:resource_name ->
  unit ->
  instance_health_summary

val make_load_balancer :
  ?tls_policy_name:resource_name ->
  ?https_redirection_enabled:boolean_ ->
  ?ip_address_type:ip_address_type ->
  ?configuration_options:load_balancer_configuration_options ->
  ?tls_certificate_summaries:load_balancer_tls_certificate_summary_list ->
  ?instance_health_summary:instance_health_summary_list ->
  ?instance_port:integer ->
  ?health_check_path:non_empty_string ->
  ?public_ports:port_list ->
  ?protocol:load_balancer_protocol ->
  ?state:load_balancer_state ->
  ?dns_name:non_empty_string ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  load_balancer

val make_is_vpc_peered_request : unit -> unit

val make_import_key_pair_request :
  public_key_base64:base64 -> key_pair_name:resource_name -> unit -> import_key_pair_request

val make_get_static_ips_request : ?page_token:string_ -> unit -> get_static_ips_request
val make_get_static_ip_request : static_ip_name:resource_name -> unit -> get_static_ip_request

val make_get_setup_history_request :
  ?page_token:setup_history_page_token ->
  resource_name:resource_name ->
  unit ->
  get_setup_history_request

val make_get_relational_database_snapshots_request :
  ?page_token:string_ -> unit -> get_relational_database_snapshots_request

val make_get_relational_database_snapshot_request :
  relational_database_snapshot_name:resource_name ->
  unit ->
  get_relational_database_snapshot_request

val make_get_relational_databases_request :
  ?page_token:string_ -> unit -> get_relational_databases_request

val make_get_relational_database_parameters_request :
  ?page_token:string_ ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_parameters_request

val make_get_relational_database_metric_data_request :
  statistics:metric_statistic_list ->
  unit_:metric_unit ->
  end_time:iso_date ->
  start_time:iso_date ->
  period:metric_period ->
  metric_name:relational_database_metric_name ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_metric_data_request

val make_get_relational_database_master_user_password_request :
  ?password_version:relational_database_password_version ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_master_user_password_request

val make_get_relational_database_log_streams_request :
  relational_database_name:resource_name -> unit -> get_relational_database_log_streams_request

val make_get_relational_database_log_events_request :
  ?page_token:string_ ->
  ?start_from_head:boolean_ ->
  ?end_time:iso_date ->
  ?start_time:iso_date ->
  log_stream_name:string_ ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_log_events_request

val make_get_relational_database_events_request :
  ?page_token:string_ ->
  ?duration_in_minutes:integer ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_events_request

val make_get_relational_database_bundles_request :
  ?include_inactive:boolean_ ->
  ?page_token:string_ ->
  unit ->
  get_relational_database_bundles_request

val make_get_relational_database_blueprints_request :
  ?page_token:string_ -> unit -> get_relational_database_blueprints_request

val make_get_relational_database_request :
  relational_database_name:resource_name -> unit -> get_relational_database_request

val make_get_regions_request :
  ?include_relational_database_availability_zones:boolean_ ->
  ?include_availability_zones:boolean_ ->
  unit ->
  get_regions_request

val make_get_operations_for_resource_request :
  ?page_token:string_ -> resource_name:resource_name -> unit -> get_operations_for_resource_request

val make_get_operations_request : ?page_token:string_ -> unit -> get_operations_request
val make_get_operation_request : operation_id:non_empty_string -> unit -> get_operation_request

val make_get_load_balancer_tls_policies_request :
  ?page_token:string_ -> unit -> get_load_balancer_tls_policies_request

val make_get_load_balancer_tls_certificates_request :
  load_balancer_name:resource_name -> unit -> get_load_balancer_tls_certificates_request

val make_get_load_balancers_request : ?page_token:string_ -> unit -> get_load_balancers_request

val make_get_load_balancer_metric_data_request :
  statistics:metric_statistic_list ->
  unit_:metric_unit ->
  end_time:timestamp ->
  start_time:timestamp ->
  period:metric_period ->
  metric_name:load_balancer_metric_name ->
  load_balancer_name:resource_name ->
  unit ->
  get_load_balancer_metric_data_request

val make_get_load_balancer_request :
  load_balancer_name:resource_name -> unit -> get_load_balancer_request

val make_key_pair :
  ?fingerprint:base64 ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  key_pair

val make_get_key_pairs_request :
  ?include_default_key_pair:boolean_ -> ?page_token:string_ -> unit -> get_key_pairs_request

val make_get_key_pair_request : key_pair_name:resource_name -> unit -> get_key_pair_request
val make_instance_state : ?name:string_ -> ?code:integer -> unit -> instance_state

val make_get_instance_state_request :
  instance_name:resource_name -> unit -> get_instance_state_request

val make_add_on :
  ?duration:string_ ->
  ?threshold:string_ ->
  ?next_snapshot_time_of_day:time_of_day ->
  ?snapshot_time_of_day:time_of_day ->
  ?status:string_ ->
  ?name:string_ ->
  unit ->
  add_on

val make_disk :
  ?auto_mount_status:auto_mount_status ->
  ?gb_in_use:integer ->
  ?attachment_state:string_ ->
  ?is_attached:boolean_ ->
  ?attached_to:resource_name ->
  ?state:disk_state ->
  ?path:string_ ->
  ?iops:integer ->
  ?is_system_disk:boolean_ ->
  ?size_in_gb:integer ->
  ?add_ons:add_on_list ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  disk

val make_instance_snapshot :
  ?size_in_gb:integer ->
  ?is_from_auto_snapshot:boolean_ ->
  ?from_bundle_id:string_ ->
  ?from_blueprint_id:string_ ->
  ?from_instance_arn:non_empty_string ->
  ?from_instance_name:resource_name ->
  ?from_attached_disks:disk_list ->
  ?progress:string_ ->
  ?state:instance_snapshot_state ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  instance_snapshot

val make_get_instance_snapshots_request :
  ?page_token:string_ -> unit -> get_instance_snapshots_request

val make_get_instance_snapshot_request :
  instance_snapshot_name:resource_name -> unit -> get_instance_snapshot_request

val make_instance_hardware :
  ?ram_size_in_gb:float_ -> ?disks:disk_list -> ?cpu_count:integer -> unit -> instance_hardware

val make_instance_port_info :
  ?cidr_list_aliases:string_list ->
  ?ipv6_cidrs:string_list ->
  ?cidrs:string_list ->
  ?access_direction:access_direction ->
  ?common_name:string_ ->
  ?access_type:port_access_type ->
  ?access_from:string_ ->
  ?protocol:network_protocol ->
  ?to_port:port ->
  ?from_port:port ->
  unit ->
  instance_port_info

val make_instance_networking :
  ?ports:instance_port_info_list ->
  ?monthly_transfer:monthly_transfer ->
  unit ->
  instance_networking

val make_instance_metadata_options :
  ?http_protocol_ipv6:http_protocol_ipv6 ->
  ?http_put_response_hop_limit:integer ->
  ?http_endpoint:http_endpoint ->
  ?http_tokens:http_tokens ->
  ?state:instance_metadata_state ->
  unit ->
  instance_metadata_options

val make_instance :
  ?metadata_options:instance_metadata_options ->
  ?ssh_key_name:resource_name ->
  ?username:non_empty_string ->
  ?state:instance_state ->
  ?networking:instance_networking ->
  ?hardware:instance_hardware ->
  ?ip_address_type:ip_address_type ->
  ?ipv6_addresses:ipv6_address_list ->
  ?public_ip_address:ip_address ->
  ?private_ip_address:ip_address ->
  ?is_static_ip:boolean_ ->
  ?add_ons:add_on_list ->
  ?bundle_id:non_empty_string ->
  ?blueprint_name:non_empty_string ->
  ?blueprint_id:non_empty_string ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  instance

val make_get_instances_request : ?page_token:string_ -> unit -> get_instances_request

val make_instance_port_state :
  ?cidr_list_aliases:string_list ->
  ?ipv6_cidrs:string_list ->
  ?cidrs:string_list ->
  ?state:port_state ->
  ?protocol:network_protocol ->
  ?to_port:port ->
  ?from_port:port ->
  unit ->
  instance_port_state

val make_get_instance_port_states_request :
  instance_name:resource_name -> unit -> get_instance_port_states_request

val make_get_instance_metric_data_request :
  statistics:metric_statistic_list ->
  unit_:metric_unit ->
  end_time:timestamp ->
  start_time:timestamp ->
  period:metric_period ->
  metric_name:instance_metric_name ->
  instance_name:resource_name ->
  unit ->
  get_instance_metric_data_request

val make_host_key_attributes :
  ?not_valid_after:iso_date ->
  ?not_valid_before:iso_date ->
  ?fingerprint_sh_a256:string_ ->
  ?fingerprint_sh_a1:string_ ->
  ?witnessed_at:iso_date ->
  ?public_key:string_ ->
  ?algorithm:string_ ->
  unit ->
  host_key_attributes

val make_instance_access_details :
  ?host_keys:host_keys_list ->
  ?username:string_ ->
  ?instance_name:resource_name ->
  ?protocol:instance_access_protocol ->
  ?private_key:string_ ->
  ?password_data:password_data ->
  ?password:string_ ->
  ?ipv6_addresses:ipv6_address_list ->
  ?ip_address:ip_address ->
  ?expires_at:iso_date ->
  ?cert_key:string_ ->
  unit ->
  instance_access_details

val make_get_instance_access_details_request :
  ?protocol:instance_access_protocol ->
  instance_name:resource_name ->
  unit ->
  get_instance_access_details_request

val make_get_instance_request : instance_name:resource_name -> unit -> get_instance_request

val make_disk_info :
  ?is_system_disk:boolean_ ->
  ?size_in_gb:integer ->
  ?path:non_empty_string ->
  ?name:string_ ->
  unit ->
  disk_info

val make_instance_snapshot_info :
  ?from_disk_info:disk_info_list ->
  ?from_blueprint_id:non_empty_string ->
  ?from_bundle_id:non_empty_string ->
  unit ->
  instance_snapshot_info

val make_disk_snapshot_info : ?size_in_gb:integer -> unit -> disk_snapshot_info

val make_export_snapshot_record_source_info :
  ?disk_snapshot_info:disk_snapshot_info ->
  ?instance_snapshot_info:instance_snapshot_info ->
  ?from_resource_arn:non_empty_string ->
  ?from_resource_name:non_empty_string ->
  ?arn:non_empty_string ->
  ?name:non_empty_string ->
  ?created_at:iso_date ->
  ?resource_type:export_snapshot_record_source_type ->
  unit ->
  export_snapshot_record_source_info

val make_destination_info :
  ?service:non_empty_string -> ?id:non_empty_string -> unit -> destination_info

val make_export_snapshot_record :
  ?destination_info:destination_info ->
  ?source_info:export_snapshot_record_source_info ->
  ?state:record_state ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  export_snapshot_record

val make_get_export_snapshot_records_request :
  ?page_token:string_ -> unit -> get_export_snapshot_records_request

val make_domain :
  ?registered_domain_delegation_info:registered_domain_delegation_info ->
  ?domain_entries:domain_entry_list ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  domain

val make_get_domains_request : ?page_token:string_ -> unit -> get_domains_request
val make_get_domain_request : domain_name:domain_name -> unit -> get_domain_request

val make_lightsail_distribution :
  ?viewer_minimum_tls_protocol_version:string_ ->
  ?tags:tag_list ->
  ?ip_address_type:ip_address_type ->
  ?able_to_update_bundle:boolean_ ->
  ?cache_behaviors:cache_behavior_list ->
  ?cache_behavior_settings:cache_settings ->
  ?default_cache_behavior:cache_behavior ->
  ?origin_public_dn_s:string_ ->
  ?origin:origin ->
  ?certificate_name:resource_name ->
  ?bundle_id:string_ ->
  ?domain_name:string_ ->
  ?is_enabled:boolean_ ->
  ?status:string_ ->
  ?alternative_domain_names:string_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  lightsail_distribution

val make_get_distributions_request :
  ?page_token:string_ -> ?distribution_name:resource_name -> unit -> get_distributions_request

val make_get_distribution_metric_data_request :
  statistics:metric_statistic_list ->
  unit_:metric_unit ->
  period:metric_period ->
  end_time:timestamp ->
  start_time:timestamp ->
  metric_name:distribution_metric_name ->
  distribution_name:resource_name ->
  unit ->
  get_distribution_metric_data_request

val make_get_distribution_latest_cache_reset_request :
  ?distribution_name:resource_name -> unit -> get_distribution_latest_cache_reset_request

val make_distribution_bundle :
  ?is_active:boolean_ ->
  ?transfer_per_month_in_gb:integer ->
  ?price:float_ ->
  ?name:string_ ->
  ?bundle_id:string_ ->
  unit ->
  distribution_bundle

val make_get_distribution_bundles_request : unit -> unit

val make_disk_snapshot :
  ?is_from_auto_snapshot:boolean_ ->
  ?from_instance_arn:non_empty_string ->
  ?from_instance_name:resource_name ->
  ?from_disk_arn:non_empty_string ->
  ?from_disk_name:resource_name ->
  ?progress:string_ ->
  ?state:disk_snapshot_state ->
  ?size_in_gb:integer ->
  ?tags:tag_list ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?support_code:string_ ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  disk_snapshot

val make_get_disk_snapshots_request : ?page_token:string_ -> unit -> get_disk_snapshots_request

val make_get_disk_snapshot_request :
  disk_snapshot_name:resource_name -> unit -> get_disk_snapshot_request

val make_get_disks_request : ?page_token:string_ -> unit -> get_disks_request
val make_get_disk_request : disk_name:resource_name -> unit -> get_disk_request

val make_get_cost_estimate_request :
  end_time:iso_date ->
  start_time:iso_date ->
  resource_name:resource_name ->
  unit ->
  get_cost_estimate_request

val make_get_container_services_request :
  ?service_name:container_service_name -> unit -> get_container_services_request

val make_container_service_power :
  ?is_active:boolean_ ->
  ?name:string_ ->
  ?ram_size_in_gb:float_ ->
  ?cpu_count:float_ ->
  ?price:float_ ->
  ?power_id:string_ ->
  unit ->
  container_service_power

val make_get_container_service_powers_request : unit -> unit

val make_get_container_service_metric_data_request :
  statistics:metric_statistic_list ->
  period:metric_period ->
  end_time:iso_date ->
  start_time:iso_date ->
  metric_name:container_service_metric_name ->
  service_name:container_service_name ->
  unit ->
  get_container_service_metric_data_request

val make_get_container_service_deployments_request :
  service_name:container_service_name -> unit -> get_container_service_deployments_request

val make_container_service_log_event :
  ?message:string_ -> ?created_at:iso_date -> unit -> container_service_log_event

val make_get_container_log_request :
  ?page_token:string_ ->
  ?filter_pattern:string_ ->
  ?end_time:iso_date ->
  ?start_time:iso_date ->
  container_name:string_ ->
  service_name:container_service_name ->
  unit ->
  get_container_log_request

val make_get_container_images_request :
  service_name:container_service_name -> unit -> get_container_images_request

val make_get_container_api_metadata_request : unit -> unit

val make_contact_method :
  ?support_code:string_ ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  ?protocol:contact_protocol ->
  ?status:contact_method_status ->
  ?contact_endpoint:non_empty_string ->
  unit ->
  contact_method

val make_get_contact_methods_request :
  ?protocols:contact_protocols_list -> unit -> get_contact_methods_request

val make_cloud_formation_stack_record_source_info :
  ?arn:non_empty_string ->
  ?name:non_empty_string ->
  ?resource_type:cloud_formation_stack_record_source_type ->
  unit ->
  cloud_formation_stack_record_source_info

val make_cloud_formation_stack_record :
  ?destination_info:destination_info ->
  ?source_info:cloud_formation_stack_record_source_info_list ->
  ?state:record_state ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  cloud_formation_stack_record

val make_get_cloud_formation_stack_records_request :
  ?page_token:string_ -> unit -> get_cloud_formation_stack_records_request

val make_certificate :
  ?support_code:string_ ->
  ?tags:tag_list ->
  ?revocation_reason:revocation_reason ->
  ?revoked_at:iso_date ->
  ?renewal_summary:renewal_summary ->
  ?eligible_to_renew:eligible_to_renew ->
  ?not_after:iso_date ->
  ?not_before:iso_date ->
  ?issuer_c_a:issuer_c_a ->
  ?issued_at:iso_date ->
  ?created_at:iso_date ->
  ?key_algorithm:key_algorithm ->
  ?in_use_resource_count:in_use_resource_count ->
  ?request_failure_reason:request_failure_reason ->
  ?domain_validation_records:domain_validation_record_list ->
  ?subject_alternative_names:subject_alternative_name_list ->
  ?serial_number:serial_number ->
  ?status:certificate_status ->
  ?domain_name:domain_name ->
  ?name:certificate_name ->
  ?arn:non_empty_string ->
  unit ->
  certificate

val make_certificate_summary :
  ?tags:tag_list ->
  ?certificate_detail:certificate ->
  ?domain_name:domain_name ->
  ?certificate_name:certificate_name ->
  ?certificate_arn:non_empty_string ->
  unit ->
  certificate_summary

val make_get_certificates_request :
  ?page_token:string_ ->
  ?certificate_name:certificate_name ->
  ?include_certificate_details:include_certificate_details ->
  ?certificate_statuses:certificate_status_list ->
  unit ->
  get_certificates_request

val make_bundle :
  ?public_ipv4_address_count:integer ->
  ?supported_app_categories:app_category_list ->
  ?supported_platforms:instance_platform_list ->
  ?transfer_per_month_in_gb:integer ->
  ?ram_size_in_gb:float_ ->
  ?power:integer ->
  ?name:string_ ->
  ?is_active:boolean_ ->
  ?instance_type:string_ ->
  ?bundle_id:non_empty_string ->
  ?disk_size_in_gb:integer ->
  ?cpu_count:integer ->
  ?price:float_ ->
  unit ->
  bundle

val make_get_bundles_request :
  ?app_category:app_category ->
  ?page_token:string_ ->
  ?include_inactive:boolean_ ->
  unit ->
  get_bundles_request

val make_account_level_bpa_sync :
  ?bpa_impacts_lightsail:boolean_ ->
  ?message:bpa_status_message ->
  ?last_synced_at:iso_date ->
  ?status:account_level_bpa_sync_status ->
  unit ->
  account_level_bpa_sync

val make_get_buckets_request :
  ?include_connected_resources:boolean_ ->
  ?page_token:string_ ->
  ?bucket_name:bucket_name ->
  unit ->
  get_buckets_request

val make_get_bucket_metric_data_request :
  unit_:metric_unit ->
  statistics:metric_statistic_list ->
  period:metric_period ->
  end_time:iso_date ->
  start_time:iso_date ->
  metric_name:bucket_metric_name ->
  bucket_name:bucket_name ->
  unit ->
  get_bucket_metric_data_request

val make_bucket_bundle :
  ?is_active:boolean_ ->
  ?transfer_per_month_in_gb:integer ->
  ?storage_per_month_in_gb:integer ->
  ?price:float_ ->
  ?name:non_empty_string ->
  ?bundle_id:non_empty_string ->
  unit ->
  bucket_bundle

val make_get_bucket_bundles_request :
  ?include_inactive:boolean_ -> unit -> get_bucket_bundles_request

val make_access_key_last_used :
  ?service_name:string_ ->
  ?region:string_ ->
  ?last_used_date:iso_date ->
  unit ->
  access_key_last_used

val make_access_key :
  ?last_used:access_key_last_used ->
  ?created_at:iso_date ->
  ?status:status_type ->
  ?secret_access_key:non_empty_string ->
  ?access_key_id:iam_access_key_id ->
  unit ->
  access_key

val make_get_bucket_access_keys_request :
  bucket_name:bucket_name -> unit -> get_bucket_access_keys_request

val make_blueprint :
  ?app_category:app_category ->
  ?platform:instance_platform ->
  ?license_url:string_ ->
  ?product_url:string_ ->
  ?version_code:string_ ->
  ?version:string_ ->
  ?min_power:integer ->
  ?is_active:boolean_ ->
  ?description:string_ ->
  ?type_:blueprint_type ->
  ?group:non_empty_string ->
  ?name:resource_name ->
  ?blueprint_id:non_empty_string ->
  unit ->
  blueprint

val make_get_blueprints_request :
  ?app_category:app_category ->
  ?page_token:string_ ->
  ?include_inactive:boolean_ ->
  unit ->
  get_blueprints_request

val make_attached_disk : ?size_in_gb:integer -> ?path:string_ -> unit -> attached_disk

val make_auto_snapshot_details :
  ?from_attached_disks:attached_disk_list ->
  ?status:auto_snapshot_status ->
  ?created_at:iso_date ->
  ?date:string_ ->
  unit ->
  auto_snapshot_details

val make_get_auto_snapshots_request :
  resource_name:resource_name -> unit -> get_auto_snapshots_request

val make_alarm :
  ?notification_enabled:boolean_ ->
  ?notification_triggers:notification_trigger_list ->
  ?contact_protocols:contact_protocols_list ->
  ?unit_:metric_unit ->
  ?state:alarm_state ->
  ?metric_name:metric_name ->
  ?statistic:metric_statistic ->
  ?treat_missing_data:treat_missing_data ->
  ?datapoints_to_alarm:integer ->
  ?threshold:double ->
  ?period:metric_period ->
  ?evaluation_periods:integer ->
  ?comparison_operator:comparison_operator ->
  ?monitored_resource_info:monitored_resource_info ->
  ?support_code:string_ ->
  ?resource_type:resource_type ->
  ?location:resource_location ->
  ?created_at:iso_date ->
  ?arn:non_empty_string ->
  ?name:resource_name ->
  unit ->
  alarm

val make_get_alarms_request :
  ?monitored_resource_name:resource_name ->
  ?page_token:string_ ->
  ?alarm_name:resource_name ->
  unit ->
  get_alarms_request

val make_get_active_names_request : ?page_token:string_ -> unit -> get_active_names_request

val make_export_snapshot_request :
  source_snapshot_name:resource_name -> unit -> export_snapshot_request

val make_auto_snapshot_add_on_request :
  ?snapshot_time_of_day:time_of_day -> unit -> auto_snapshot_add_on_request

val make_add_on_request :
  ?stop_instance_on_idle_request:stop_instance_on_idle_request ->
  ?auto_snapshot_add_on_request:auto_snapshot_add_on_request ->
  add_on_type:add_on_type ->
  unit ->
  add_on_request

val make_enable_add_on_request :
  add_on_request:add_on_request -> resource_name:resource_name -> unit -> enable_add_on_request

val make_download_default_key_pair_request : unit -> unit

val make_disable_add_on_request :
  resource_name:resource_name -> add_on_type:add_on_type -> unit -> disable_add_on_request

val make_detach_static_ip_request : static_ip_name:resource_name -> unit -> detach_static_ip_request

val make_detach_instances_from_load_balancer_request :
  instance_names:resource_name_list ->
  load_balancer_name:resource_name ->
  unit ->
  detach_instances_from_load_balancer_request

val make_detach_disk_request : disk_name:resource_name -> unit -> detach_disk_request

val make_detach_certificate_from_distribution_request :
  distribution_name:resource_name -> unit -> detach_certificate_from_distribution_request

val make_delete_relational_database_snapshot_request :
  relational_database_snapshot_name:resource_name ->
  unit ->
  delete_relational_database_snapshot_request

val make_delete_relational_database_request :
  ?final_relational_database_snapshot_name:resource_name ->
  ?skip_final_snapshot:boolean_ ->
  relational_database_name:resource_name ->
  unit ->
  delete_relational_database_request

val make_delete_load_balancer_tls_certificate_request :
  ?force:boolean_ ->
  certificate_name:resource_name ->
  load_balancer_name:resource_name ->
  unit ->
  delete_load_balancer_tls_certificate_request

val make_delete_load_balancer_request :
  load_balancer_name:resource_name -> unit -> delete_load_balancer_request

val make_delete_known_host_keys_request :
  instance_name:resource_name -> unit -> delete_known_host_keys_request

val make_delete_key_pair_request :
  ?expected_fingerprint:string_ -> key_pair_name:resource_name -> unit -> delete_key_pair_request

val make_delete_instance_snapshot_request :
  instance_snapshot_name:resource_name -> unit -> delete_instance_snapshot_request

val make_delete_instance_request :
  ?force_delete_add_ons:boolean_ -> instance_name:resource_name -> unit -> delete_instance_request

val make_delete_domain_entry_request :
  domain_entry:domain_entry -> domain_name:domain_name -> unit -> delete_domain_entry_request

val make_delete_domain_request : domain_name:domain_name -> unit -> delete_domain_request

val make_delete_distribution_request :
  ?distribution_name:resource_name -> unit -> delete_distribution_request

val make_delete_disk_snapshot_request :
  disk_snapshot_name:resource_name -> unit -> delete_disk_snapshot_request

val make_delete_disk_request :
  ?force_delete_add_ons:boolean_ -> disk_name:resource_name -> unit -> delete_disk_request

val make_delete_container_service_request :
  service_name:container_service_name -> unit -> delete_container_service_request

val make_delete_container_image_request :
  image:string_ -> service_name:container_service_name -> unit -> delete_container_image_request

val make_delete_contact_method_request :
  protocol:contact_protocol -> unit -> delete_contact_method_request

val make_delete_certificate_request :
  certificate_name:certificate_name -> unit -> delete_certificate_request

val make_delete_bucket_access_key_request :
  access_key_id:non_empty_string ->
  bucket_name:bucket_name ->
  unit ->
  delete_bucket_access_key_request

val make_delete_bucket_request :
  ?force_delete:boolean_ -> bucket_name:bucket_name -> unit -> delete_bucket_request

val make_delete_auto_snapshot_request :
  date:auto_snapshot_date -> resource_name:resource_name -> unit -> delete_auto_snapshot_request

val make_delete_alarm_request : alarm_name:resource_name -> unit -> delete_alarm_request

val make_create_relational_database_snapshot_request :
  ?tags:tag_list ->
  relational_database_snapshot_name:resource_name ->
  relational_database_name:resource_name ->
  unit ->
  create_relational_database_snapshot_request

val make_create_relational_database_from_snapshot_request :
  ?tags:tag_list ->
  ?use_latest_restorable_time:boolean_ ->
  ?restore_time:iso_date ->
  ?source_relational_database_name:resource_name ->
  ?relational_database_bundle_id:string_ ->
  ?relational_database_snapshot_name:resource_name ->
  ?publicly_accessible:boolean_ ->
  ?availability_zone:string_ ->
  relational_database_name:resource_name ->
  unit ->
  create_relational_database_from_snapshot_request

val make_create_relational_database_request :
  ?tags:tag_list ->
  ?publicly_accessible:boolean_ ->
  ?preferred_maintenance_window:string_ ->
  ?preferred_backup_window:string_ ->
  ?master_user_password:sensitive_string ->
  ?availability_zone:string_ ->
  master_username:string_ ->
  master_database_name:string_ ->
  relational_database_bundle_id:string_ ->
  relational_database_blueprint_id:string_ ->
  relational_database_name:resource_name ->
  unit ->
  create_relational_database_request

val make_create_load_balancer_tls_certificate_request :
  ?tags:tag_list ->
  ?certificate_alternative_names:domain_name_list ->
  certificate_domain_name:domain_name ->
  certificate_name:resource_name ->
  load_balancer_name:resource_name ->
  unit ->
  create_load_balancer_tls_certificate_request

val make_create_load_balancer_request :
  ?tls_policy_name:string_ ->
  ?ip_address_type:ip_address_type ->
  ?tags:tag_list ->
  ?certificate_alternative_names:domain_name_list ->
  ?certificate_domain_name:domain_name ->
  ?certificate_name:resource_name ->
  ?health_check_path:string_ ->
  instance_port:port ->
  load_balancer_name:resource_name ->
  unit ->
  create_load_balancer_request

val make_create_key_pair_request :
  ?tags:tag_list -> key_pair_name:resource_name -> unit -> create_key_pair_request

val make_create_instance_snapshot_request :
  ?tags:tag_list ->
  instance_name:resource_name ->
  instance_snapshot_name:resource_name ->
  unit ->
  create_instance_snapshot_request

val make_disk_map :
  ?new_disk_name:resource_name -> ?original_disk_path:non_empty_string -> unit -> disk_map

val make_create_instances_from_snapshot_request :
  ?use_latest_restorable_auto_snapshot:boolean_ ->
  ?restore_date:string_ ->
  ?source_instance_name:string_ ->
  ?ip_address_type:ip_address_type ->
  ?add_ons:add_on_request_list ->
  ?tags:tag_list ->
  ?key_pair_name:resource_name ->
  ?user_data:string_ ->
  ?instance_snapshot_name:resource_name ->
  ?attached_disk_mapping:attached_disk_map ->
  bundle_id:non_empty_string ->
  availability_zone:string_ ->
  instance_names:string_list ->
  unit ->
  create_instances_from_snapshot_request

val make_create_instances_request :
  ?ip_address_type:ip_address_type ->
  ?add_ons:add_on_request_list ->
  ?tags:tag_list ->
  ?key_pair_name:resource_name ->
  ?user_data:string_ ->
  ?custom_image_name:resource_name ->
  bundle_id:non_empty_string ->
  blueprint_id:non_empty_string ->
  availability_zone:string_ ->
  instance_names:string_list ->
  unit ->
  create_instances_request

val make_create_gui_session_access_details_request :
  resource_name:resource_name -> unit -> create_gui_session_access_details_request

val make_create_domain_entry_request :
  domain_entry:domain_entry -> domain_name:domain_name -> unit -> create_domain_entry_request

val make_create_domain_request :
  ?tags:tag_list -> domain_name:domain_name -> unit -> create_domain_request

val make_create_distribution_request :
  ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum ->
  ?certificate_name:resource_name ->
  ?tags:tag_list ->
  ?ip_address_type:ip_address_type ->
  ?cache_behaviors:cache_behavior_list ->
  ?cache_behavior_settings:cache_settings ->
  bundle_id:string_ ->
  default_cache_behavior:cache_behavior ->
  origin:input_origin ->
  distribution_name:resource_name ->
  unit ->
  create_distribution_request

val make_create_disk_snapshot_request :
  ?tags:tag_list ->
  ?instance_name:resource_name ->
  ?disk_name:resource_name ->
  disk_snapshot_name:resource_name ->
  unit ->
  create_disk_snapshot_request

val make_create_disk_from_snapshot_request :
  ?use_latest_restorable_auto_snapshot:boolean_ ->
  ?restore_date:string_ ->
  ?source_disk_name:string_ ->
  ?add_ons:add_on_request_list ->
  ?tags:tag_list ->
  ?disk_snapshot_name:resource_name ->
  size_in_gb:integer ->
  availability_zone:non_empty_string ->
  disk_name:resource_name ->
  unit ->
  create_disk_from_snapshot_request

val make_create_disk_request :
  ?add_ons:add_on_request_list ->
  ?tags:tag_list ->
  size_in_gb:integer ->
  availability_zone:non_empty_string ->
  disk_name:resource_name ->
  unit ->
  create_disk_request

val make_container_service_registry_login :
  ?registry:string_ ->
  ?expires_at:iso_date ->
  ?password:string_ ->
  ?username:string_ ->
  unit ->
  container_service_registry_login

val make_create_container_service_registry_login_request : unit -> unit

val make_endpoint_request :
  ?health_check:container_service_health_check_config ->
  container_port:integer ->
  container_name:string_ ->
  unit ->
  endpoint_request

val make_create_container_service_deployment_request :
  ?public_endpoint:endpoint_request ->
  ?containers:container_map ->
  service_name:container_service_name ->
  unit ->
  create_container_service_deployment_request

val make_container_service_deployment_request :
  ?public_endpoint:endpoint_request ->
  ?containers:container_map ->
  unit ->
  container_service_deployment_request

val make_create_container_service_request :
  ?private_registry_access:private_registry_access_request ->
  ?deployment:container_service_deployment_request ->
  ?public_domain_names:container_service_public_domains ->
  ?tags:tag_list ->
  scale:container_service_scale ->
  power:container_service_power_name ->
  service_name:container_service_name ->
  unit ->
  create_container_service_request

val make_create_contact_method_request :
  contact_endpoint:string_max256 ->
  protocol:contact_protocol ->
  unit ->
  create_contact_method_request

val make_instance_entry :
  ?user_data:string_ ->
  availability_zone:string_ ->
  port_info_source:port_info_source_type ->
  instance_type:non_empty_string ->
  source_name:resource_name ->
  unit ->
  instance_entry

val make_create_cloud_formation_stack_request :
  instances:instance_entry_list -> unit -> create_cloud_formation_stack_request

val make_create_certificate_request :
  ?tags:tag_list ->
  ?subject_alternative_names:subject_alternative_name_list ->
  domain_name:domain_name ->
  certificate_name:certificate_name ->
  unit ->
  create_certificate_request

val make_create_bucket_access_key_request :
  bucket_name:bucket_name -> unit -> create_bucket_access_key_request

val make_create_bucket_request :
  ?enable_object_versioning:boolean_ ->
  ?tags:tag_list ->
  bundle_id:non_empty_string ->
  bucket_name:bucket_name ->
  unit ->
  create_bucket_request

val make_copy_snapshot_request :
  ?use_latest_restorable_auto_snapshot:boolean_ ->
  ?restore_date:string_ ->
  ?source_resource_name:string_ ->
  ?source_snapshot_name:resource_name ->
  source_region:region_name ->
  target_snapshot_name:resource_name ->
  unit ->
  copy_snapshot_request

val make_close_instance_public_ports_request :
  instance_name:resource_name -> port_info:port_info -> unit -> close_instance_public_ports_request

val make_attach_static_ip_request :
  instance_name:resource_name -> static_ip_name:resource_name -> unit -> attach_static_ip_request

val make_attach_load_balancer_tls_certificate_request :
  certificate_name:resource_name ->
  load_balancer_name:resource_name ->
  unit ->
  attach_load_balancer_tls_certificate_request

val make_attach_instances_to_load_balancer_request :
  instance_names:resource_name_list ->
  load_balancer_name:resource_name ->
  unit ->
  attach_instances_to_load_balancer_request

val make_attach_disk_request :
  ?auto_mounting:boolean_ ->
  disk_path:non_empty_string ->
  instance_name:resource_name ->
  disk_name:resource_name ->
  unit ->
  attach_disk_request

val make_attach_certificate_to_distribution_request :
  certificate_name:resource_name ->
  distribution_name:resource_name ->
  unit ->
  attach_certificate_to_distribution_request

val make_allocate_static_ip_request :
  static_ip_name:resource_name -> unit -> allocate_static_ip_request
