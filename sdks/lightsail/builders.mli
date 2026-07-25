open Types

val make_access_key_last_used :
  ?last_used_date:iso_date ->
  ?region:string_ ->
  ?service_name:string_ ->
  unit ->
  access_key_last_used

val make_access_key :
  ?access_key_id:iam_access_key_id ->
  ?secret_access_key:non_empty_string ->
  ?status:status_type ->
  ?created_at:iso_date ->
  ?last_used:access_key_last_used ->
  unit ->
  access_key

val make_resource_receiving_access :
  ?name:non_empty_string -> ?resource_type:non_empty_string -> unit -> resource_receiving_access

val make_access_rules :
  ?get_object:access_type -> ?allow_public_overrides:boolean_ -> unit -> access_rules

val make_account_level_bpa_sync :
  ?status:account_level_bpa_sync_status ->
  ?last_synced_at:iso_date ->
  ?message:bpa_status_message ->
  ?bpa_impacts_lightsail:boolean_ ->
  unit ->
  account_level_bpa_sync

val make_add_on :
  ?name:string_ ->
  ?status:string_ ->
  ?snapshot_time_of_day:time_of_day ->
  ?next_snapshot_time_of_day:time_of_day ->
  ?threshold:string_ ->
  ?duration:string_ ->
  unit ->
  add_on

val make_stop_instance_on_idle_request :
  ?threshold:string_ -> ?duration:string_ -> unit -> stop_instance_on_idle_request

val make_auto_snapshot_add_on_request :
  ?snapshot_time_of_day:time_of_day -> unit -> auto_snapshot_add_on_request

val make_add_on_request :
  ?auto_snapshot_add_on_request:auto_snapshot_add_on_request ->
  ?stop_instance_on_idle_request:stop_instance_on_idle_request ->
  add_on_type:add_on_type ->
  unit ->
  add_on_request

val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_monitored_resource_info :
  ?arn:resource_arn ->
  ?name:resource_name ->
  ?resource_type:resource_type ->
  unit ->
  monitored_resource_info

val make_resource_location :
  ?availability_zone:string_ -> ?region_name:region_name -> unit -> resource_location

val make_alarm :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?support_code:string_ ->
  ?monitored_resource_info:monitored_resource_info ->
  ?comparison_operator:comparison_operator ->
  ?evaluation_periods:integer ->
  ?period:metric_period ->
  ?threshold:double ->
  ?datapoints_to_alarm:integer ->
  ?treat_missing_data:treat_missing_data ->
  ?statistic:metric_statistic ->
  ?metric_name:metric_name ->
  ?state:alarm_state ->
  ?unit_:metric_unit ->
  ?contact_protocols:contact_protocols_list ->
  ?notification_triggers:notification_trigger_list ->
  ?notification_enabled:boolean_ ->
  ?tags:tag_list ->
  unit ->
  alarm

val make_operation :
  ?id:non_empty_string ->
  ?resource_name:resource_name ->
  ?resource_type:resource_type ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?is_terminal:boolean_ ->
  ?operation_details:string_ ->
  ?operation_type:operation_type ->
  ?status:operation_status ->
  ?status_changed_at:iso_date ->
  ?error_code:string_ ->
  ?error_details:string_ ->
  unit ->
  operation

val make_allocate_static_ip_request :
  static_ip_name:resource_name -> unit -> allocate_static_ip_request

val make_attach_certificate_to_distribution_request :
  distribution_name:resource_name ->
  certificate_name:resource_name ->
  unit ->
  attach_certificate_to_distribution_request

val make_attach_disk_request :
  ?auto_mounting:boolean_ ->
  disk_name:resource_name ->
  instance_name:resource_name ->
  disk_path:non_empty_string ->
  unit ->
  attach_disk_request

val make_attach_instances_to_load_balancer_request :
  load_balancer_name:resource_name ->
  instance_names:resource_name_list ->
  unit ->
  attach_instances_to_load_balancer_request

val make_attach_load_balancer_tls_certificate_request :
  load_balancer_name:resource_name ->
  certificate_name:resource_name ->
  unit ->
  attach_load_balancer_tls_certificate_request

val make_attach_static_ip_request :
  static_ip_name:resource_name -> instance_name:resource_name -> unit -> attach_static_ip_request

val make_attached_disk : ?path:string_ -> ?size_in_gb:integer -> unit -> attached_disk

val make_disk_map :
  ?original_disk_path:non_empty_string -> ?new_disk_name:resource_name -> unit -> disk_map

val make_auto_snapshot_details :
  ?date:string_ ->
  ?created_at:iso_date ->
  ?status:auto_snapshot_status ->
  ?from_attached_disks:attached_disk_list ->
  unit ->
  auto_snapshot_details

val make_availability_zone :
  ?zone_name:non_empty_string -> ?state:non_empty_string -> unit -> availability_zone

val make_blueprint :
  ?blueprint_id:non_empty_string ->
  ?name:resource_name ->
  ?group:non_empty_string ->
  ?type_:blueprint_type ->
  ?description:string_ ->
  ?is_active:boolean_ ->
  ?min_power:integer ->
  ?version:string_ ->
  ?version_code:string_ ->
  ?product_url:string_ ->
  ?license_url:string_ ->
  ?platform:instance_platform ->
  ?app_category:app_category ->
  unit ->
  blueprint

val make_bucket_cors_rule :
  ?id:bucket_cors_rule_id ->
  ?allowed_headers:bucket_cors_allowed_headers ->
  ?expose_headers:bucket_cors_expose_headers ->
  ?max_age_seconds:integer ->
  allowed_methods:bucket_cors_allowed_methods ->
  allowed_origins:bucket_cors_allowed_origins ->
  unit ->
  bucket_cors_rule

val make_bucket_cors_config : ?rules:bucket_cors_rules -> unit -> bucket_cors_config

val make_bucket_access_log_config :
  ?destination:bucket_name ->
  ?prefix:bucket_access_log_prefix ->
  enabled:boolean_ ->
  unit ->
  bucket_access_log_config

val make_bucket_state : ?code:non_empty_string -> ?message:string_ -> unit -> bucket_state

val make_bucket :
  ?resource_type:non_empty_string ->
  ?access_rules:access_rules ->
  ?arn:non_empty_string ->
  ?bundle_id:non_empty_string ->
  ?created_at:iso_date ->
  ?url:non_empty_string ->
  ?location:resource_location ->
  ?name:bucket_name ->
  ?support_code:non_empty_string ->
  ?tags:tag_list ->
  ?object_versioning:non_empty_string ->
  ?able_to_update_bundle:boolean_ ->
  ?readonly_access_accounts:partner_id_list ->
  ?resources_receiving_access:access_receiver_list ->
  ?state:bucket_state ->
  ?access_log_config:bucket_access_log_config ->
  ?cors:bucket_cors_config ->
  unit ->
  bucket

val make_bucket_bundle :
  ?bundle_id:non_empty_string ->
  ?name:non_empty_string ->
  ?price:float_ ->
  ?storage_per_month_in_gb:integer ->
  ?transfer_per_month_in_gb:integer ->
  ?is_active:boolean_ ->
  unit ->
  bucket_bundle

val make_bundle :
  ?price:float_ ->
  ?cpu_count:integer ->
  ?disk_size_in_gb:integer ->
  ?bundle_id:non_empty_string ->
  ?instance_type:string_ ->
  ?is_active:boolean_ ->
  ?name:string_ ->
  ?power:integer ->
  ?ram_size_in_gb:float_ ->
  ?transfer_per_month_in_gb:integer ->
  ?supported_platforms:instance_platform_list ->
  ?supported_app_categories:app_category_list ->
  ?public_ipv4_address_count:integer ->
  unit ->
  bundle

val make_cache_behavior : ?behavior:behavior_enum -> unit -> cache_behavior

val make_cache_behavior_per_path :
  ?path:string_ -> ?behavior:behavior_enum -> unit -> cache_behavior_per_path

val make_query_string_object :
  ?option_:boolean_ -> ?query_strings_allow_list:string_list -> unit -> query_string_object

val make_header_object :
  ?option_:forward_values -> ?headers_allow_list:header_forward_list -> unit -> header_object

val make_cookie_object :
  ?option_:forward_values -> ?cookies_allow_list:string_list -> unit -> cookie_object

val make_cache_settings :
  ?default_tt_l:long ->
  ?minimum_tt_l:long ->
  ?maximum_tt_l:long ->
  ?allowed_http_methods:non_empty_string ->
  ?cached_http_methods:non_empty_string ->
  ?forwarded_cookies:cookie_object ->
  ?forwarded_headers:header_object ->
  ?forwarded_query_strings:query_string_object ->
  unit ->
  cache_settings

val make_dns_record_creation_state :
  ?code:dns_record_creation_state_code -> ?message:string_ -> unit -> dns_record_creation_state

val make_resource_record :
  ?name:string_ -> ?type_:string_ -> ?value:string_ -> unit -> resource_record

val make_domain_validation_record :
  ?domain_name:domain_name ->
  ?resource_record:resource_record ->
  ?dns_record_creation_state:dns_record_creation_state ->
  ?validation_status:certificate_domain_validation_status ->
  unit ->
  domain_validation_record

val make_renewal_summary :
  ?domain_validation_records:domain_validation_record_list ->
  ?renewal_status:renewal_status ->
  ?renewal_status_reason:renewal_status_reason ->
  ?updated_at:iso_date ->
  unit ->
  renewal_summary

val make_certificate :
  ?arn:non_empty_string ->
  ?name:certificate_name ->
  ?domain_name:domain_name ->
  ?status:certificate_status ->
  ?serial_number:serial_number ->
  ?subject_alternative_names:subject_alternative_name_list ->
  ?domain_validation_records:domain_validation_record_list ->
  ?request_failure_reason:request_failure_reason ->
  ?in_use_resource_count:in_use_resource_count ->
  ?key_algorithm:key_algorithm ->
  ?created_at:iso_date ->
  ?issued_at:iso_date ->
  ?issuer_c_a:issuer_c_a ->
  ?not_before:iso_date ->
  ?not_after:iso_date ->
  ?eligible_to_renew:eligible_to_renew ->
  ?renewal_summary:renewal_summary ->
  ?revoked_at:iso_date ->
  ?revocation_reason:revocation_reason ->
  ?tags:tag_list ->
  ?support_code:string_ ->
  unit ->
  certificate

val make_certificate_summary :
  ?certificate_arn:non_empty_string ->
  ?certificate_name:certificate_name ->
  ?domain_name:domain_name ->
  ?certificate_detail:certificate ->
  ?tags:tag_list ->
  unit ->
  certificate_summary

val make_port_info :
  ?from_port:port ->
  ?to_port:port ->
  ?protocol:network_protocol ->
  ?cidrs:string_list ->
  ?ipv6_cidrs:string_list ->
  ?cidr_list_aliases:string_list ->
  unit ->
  port_info

val make_close_instance_public_ports_request :
  port_info:port_info -> instance_name:resource_name -> unit -> close_instance_public_ports_request

val make_destination_info :
  ?id:non_empty_string -> ?service:non_empty_string -> unit -> destination_info

val make_cloud_formation_stack_record_source_info :
  ?resource_type:cloud_formation_stack_record_source_type ->
  ?name:non_empty_string ->
  ?arn:non_empty_string ->
  unit ->
  cloud_formation_stack_record_source_info

val make_cloud_formation_stack_record :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?state:record_state ->
  ?source_info:cloud_formation_stack_record_source_info_list ->
  ?destination_info:destination_info ->
  unit ->
  cloud_formation_stack_record

val make_contact_method :
  ?contact_endpoint:non_empty_string ->
  ?status:contact_method_status ->
  ?protocol:contact_protocol ->
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?support_code:string_ ->
  ?tags:tag_list ->
  unit ->
  contact_method

val make_container :
  ?image:string_ ->
  ?command:string_list ->
  ?environment:environment ->
  ?ports:port_map ->
  unit ->
  container

val make_container_image :
  ?image:string_ -> ?digest:string_ -> ?created_at:iso_date -> unit -> container_image

val make_container_service_ecr_image_puller_role :
  ?is_active:boolean_ -> ?principal_arn:string_ -> unit -> container_service_ecr_image_puller_role

val make_private_registry_access :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role -> unit -> private_registry_access

val make_container_service_health_check_config :
  ?healthy_threshold:integer ->
  ?unhealthy_threshold:integer ->
  ?timeout_seconds:integer ->
  ?interval_seconds:integer ->
  ?path:string_ ->
  ?success_codes:string_ ->
  unit ->
  container_service_health_check_config

val make_container_service_endpoint :
  ?container_name:string_ ->
  ?container_port:integer ->
  ?health_check:container_service_health_check_config ->
  unit ->
  container_service_endpoint

val make_container_service_deployment :
  ?version:integer ->
  ?state:container_service_deployment_state ->
  ?containers:container_map ->
  ?public_endpoint:container_service_endpoint ->
  ?created_at:iso_date ->
  unit ->
  container_service_deployment

val make_container_service_state_detail :
  ?code:container_service_state_detail_code ->
  ?message:string_ ->
  unit ->
  container_service_state_detail

val make_container_service :
  ?container_service_name:container_service_name ->
  ?arn:non_empty_string ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?power:container_service_power_name ->
  ?power_id:string_ ->
  ?state:container_service_state ->
  ?state_detail:container_service_state_detail ->
  ?scale:container_service_scale ->
  ?current_deployment:container_service_deployment ->
  ?next_deployment:container_service_deployment ->
  ?is_disabled:boolean_ ->
  ?principal_arn:string_ ->
  ?private_domain_name:string_ ->
  ?public_domain_names:container_service_public_domains ->
  ?url:string_ ->
  ?private_registry_access:private_registry_access ->
  unit ->
  container_service

val make_endpoint_request :
  ?health_check:container_service_health_check_config ->
  container_name:string_ ->
  container_port:integer ->
  unit ->
  endpoint_request

val make_container_service_deployment_request :
  ?containers:container_map ->
  ?public_endpoint:endpoint_request ->
  unit ->
  container_service_deployment_request

val make_container_service_ecr_image_puller_role_request :
  ?is_active:boolean_ -> unit -> container_service_ecr_image_puller_role_request

val make_container_service_log_event :
  ?created_at:iso_date -> ?message:string_ -> unit -> container_service_log_event

val make_container_service_power :
  ?power_id:string_ ->
  ?price:float_ ->
  ?cpu_count:float_ ->
  ?ram_size_in_gb:float_ ->
  ?name:string_ ->
  ?is_active:boolean_ ->
  unit ->
  container_service_power

val make_container_service_registry_login :
  ?username:string_ ->
  ?password:string_ ->
  ?expires_at:iso_date ->
  ?registry:string_ ->
  unit ->
  container_service_registry_login

val make_copy_snapshot_request :
  ?source_snapshot_name:resource_name ->
  ?source_resource_name:string_ ->
  ?restore_date:string_ ->
  ?use_latest_restorable_auto_snapshot:boolean_ ->
  target_snapshot_name:resource_name ->
  source_region:region_name ->
  unit ->
  copy_snapshot_request

val make_time_period : ?start:iso_date -> ?end_:iso_date -> unit -> time_period

val make_estimate_by_time :
  ?usage_cost:double ->
  ?pricing_unit:pricing_unit ->
  ?unit_:double ->
  ?currency:currency ->
  ?time_period:time_period ->
  unit ->
  estimate_by_time

val make_cost_estimate :
  ?usage_type:non_empty_string -> ?results_by_time:estimates_by_time -> unit -> cost_estimate

val make_create_bucket_request :
  ?tags:tag_list ->
  ?enable_object_versioning:boolean_ ->
  bucket_name:bucket_name ->
  bundle_id:non_empty_string ->
  unit ->
  create_bucket_request

val make_create_bucket_access_key_request :
  bucket_name:bucket_name -> unit -> create_bucket_access_key_request

val make_create_certificate_request :
  ?subject_alternative_names:subject_alternative_name_list ->
  ?tags:tag_list ->
  certificate_name:certificate_name ->
  domain_name:domain_name ->
  unit ->
  create_certificate_request

val make_instance_entry :
  ?user_data:string_ ->
  source_name:resource_name ->
  instance_type:non_empty_string ->
  port_info_source:port_info_source_type ->
  availability_zone:string_ ->
  unit ->
  instance_entry

val make_create_cloud_formation_stack_request :
  instances:instance_entry_list -> unit -> create_cloud_formation_stack_request

val make_create_contact_method_request :
  ?tags:tag_list ->
  protocol:contact_protocol ->
  contact_endpoint:string_max256 ->
  unit ->
  create_contact_method_request

val make_private_registry_access_request :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role_request ->
  unit ->
  private_registry_access_request

val make_create_container_service_request :
  ?tags:tag_list ->
  ?public_domain_names:container_service_public_domains ->
  ?deployment:container_service_deployment_request ->
  ?private_registry_access:private_registry_access_request ->
  service_name:container_service_name ->
  power:container_service_power_name ->
  scale:container_service_scale ->
  unit ->
  create_container_service_request

val make_create_container_service_deployment_request :
  ?containers:container_map ->
  ?public_endpoint:endpoint_request ->
  service_name:container_service_name ->
  unit ->
  create_container_service_deployment_request

val make_create_container_service_registry_login_request : unit -> unit

val make_create_disk_request :
  ?tags:tag_list ->
  ?add_ons:add_on_request_list ->
  disk_name:resource_name ->
  availability_zone:non_empty_string ->
  size_in_gb:integer ->
  unit ->
  create_disk_request

val make_create_disk_from_snapshot_request :
  ?disk_snapshot_name:resource_name ->
  ?tags:tag_list ->
  ?add_ons:add_on_request_list ->
  ?source_disk_name:string_ ->
  ?restore_date:string_ ->
  ?use_latest_restorable_auto_snapshot:boolean_ ->
  disk_name:resource_name ->
  availability_zone:non_empty_string ->
  size_in_gb:integer ->
  unit ->
  create_disk_from_snapshot_request

val make_create_disk_snapshot_request :
  ?disk_name:resource_name ->
  ?instance_name:resource_name ->
  ?tags:tag_list ->
  disk_snapshot_name:resource_name ->
  unit ->
  create_disk_snapshot_request

val make_origin :
  ?name:resource_name ->
  ?resource_type:resource_type ->
  ?region_name:region_name ->
  ?protocol_policy:origin_protocol_policy_enum ->
  ?response_timeout:integer ->
  ?ip_address_type:origin_ip_address_type_enum ->
  unit ->
  origin

val make_lightsail_distribution :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?alternative_domain_names:string_list ->
  ?status:string_ ->
  ?is_enabled:boolean_ ->
  ?domain_name:string_ ->
  ?bundle_id:string_ ->
  ?certificate_name:resource_name ->
  ?origin:origin ->
  ?origin_public_dn_s:string_ ->
  ?default_cache_behavior:cache_behavior ->
  ?cache_behavior_settings:cache_settings ->
  ?cache_behaviors:cache_behavior_list ->
  ?able_to_update_bundle:boolean_ ->
  ?ip_address_type:ip_address_type ->
  ?tags:tag_list ->
  ?viewer_minimum_tls_protocol_version:string_ ->
  unit ->
  lightsail_distribution

val make_input_origin :
  ?name:resource_name ->
  ?region_name:region_name ->
  ?protocol_policy:origin_protocol_policy_enum ->
  ?response_timeout:integer ->
  ?ip_address_type:origin_ip_address_type_enum ->
  unit ->
  input_origin

val make_create_distribution_request :
  ?cache_behavior_settings:cache_settings ->
  ?cache_behaviors:cache_behavior_list ->
  ?ip_address_type:ip_address_type ->
  ?tags:tag_list ->
  ?certificate_name:resource_name ->
  ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum ->
  distribution_name:resource_name ->
  origin:input_origin ->
  default_cache_behavior:cache_behavior ->
  bundle_id:string_ ->
  unit ->
  create_distribution_request

val make_create_domain_request :
  ?tags:tag_list -> domain_name:domain_name -> unit -> create_domain_request

val make_domain_entry :
  ?id:non_empty_string ->
  ?name:domain_name ->
  ?target:string_ ->
  ?is_alias:boolean_ ->
  ?type_:domain_entry_type ->
  ?options:domain_entry_options ->
  unit ->
  domain_entry

val make_create_domain_entry_request :
  domain_name:domain_name -> domain_entry:domain_entry -> unit -> create_domain_entry_request

val make_session :
  ?name:non_empty_string ->
  ?url:sensitive_non_empty_string ->
  ?is_primary:boolean_ ->
  unit ->
  session

val make_create_gui_session_access_details_request :
  resource_name:resource_name -> unit -> create_gui_session_access_details_request

val make_create_instance_snapshot_request :
  ?tags:tag_list ->
  instance_snapshot_name:resource_name ->
  instance_name:resource_name ->
  unit ->
  create_instance_snapshot_request

val make_create_instances_request :
  ?custom_image_name:resource_name ->
  ?user_data:string_ ->
  ?key_pair_name:resource_name ->
  ?tags:tag_list ->
  ?add_ons:add_on_request_list ->
  ?ip_address_type:ip_address_type ->
  instance_names:string_list ->
  availability_zone:string_ ->
  blueprint_id:non_empty_string ->
  bundle_id:non_empty_string ->
  unit ->
  create_instances_request

val make_create_instances_from_snapshot_request :
  ?attached_disk_mapping:attached_disk_map ->
  ?instance_snapshot_name:resource_name ->
  ?user_data:string_ ->
  ?key_pair_name:resource_name ->
  ?tags:tag_list ->
  ?add_ons:add_on_request_list ->
  ?ip_address_type:ip_address_type ->
  ?source_instance_name:string_ ->
  ?restore_date:string_ ->
  ?use_latest_restorable_auto_snapshot:boolean_ ->
  instance_names:string_list ->
  availability_zone:string_ ->
  bundle_id:non_empty_string ->
  unit ->
  create_instances_from_snapshot_request

val make_key_pair :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?fingerprint:base64 ->
  unit ->
  key_pair

val make_create_key_pair_request :
  ?tags:tag_list -> key_pair_name:resource_name -> unit -> create_key_pair_request

val make_create_load_balancer_request :
  ?health_check_path:string_ ->
  ?certificate_name:resource_name ->
  ?certificate_domain_name:domain_name ->
  ?certificate_alternative_names:domain_name_list ->
  ?tags:tag_list ->
  ?ip_address_type:ip_address_type ->
  ?tls_policy_name:string_ ->
  load_balancer_name:resource_name ->
  instance_port:port ->
  unit ->
  create_load_balancer_request

val make_create_load_balancer_tls_certificate_request :
  ?certificate_alternative_names:domain_name_list ->
  ?tags:tag_list ->
  load_balancer_name:resource_name ->
  certificate_name:resource_name ->
  certificate_domain_name:domain_name ->
  unit ->
  create_load_balancer_tls_certificate_request

val make_create_relational_database_request :
  ?availability_zone:string_ ->
  ?master_user_password:sensitive_string ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?publicly_accessible:boolean_ ->
  ?tags:tag_list ->
  relational_database_name:resource_name ->
  relational_database_blueprint_id:string_ ->
  relational_database_bundle_id:string_ ->
  master_database_name:string_ ->
  master_username:string_ ->
  unit ->
  create_relational_database_request

val make_create_relational_database_from_snapshot_request :
  ?availability_zone:string_ ->
  ?publicly_accessible:boolean_ ->
  ?relational_database_snapshot_name:resource_name ->
  ?relational_database_bundle_id:string_ ->
  ?source_relational_database_name:resource_name ->
  ?restore_time:iso_date ->
  ?use_latest_restorable_time:boolean_ ->
  ?tags:tag_list ->
  relational_database_name:resource_name ->
  unit ->
  create_relational_database_from_snapshot_request

val make_create_relational_database_snapshot_request :
  ?tags:tag_list ->
  relational_database_name:resource_name ->
  relational_database_snapshot_name:resource_name ->
  unit ->
  create_relational_database_snapshot_request

val make_delete_alarm_request : alarm_name:resource_name -> unit -> delete_alarm_request

val make_delete_auto_snapshot_request :
  resource_name:resource_name -> date:auto_snapshot_date -> unit -> delete_auto_snapshot_request

val make_delete_bucket_request :
  ?force_delete:boolean_ -> bucket_name:bucket_name -> unit -> delete_bucket_request

val make_delete_bucket_access_key_request :
  bucket_name:bucket_name ->
  access_key_id:non_empty_string ->
  unit ->
  delete_bucket_access_key_request

val make_delete_certificate_request :
  certificate_name:certificate_name -> unit -> delete_certificate_request

val make_delete_contact_method_request :
  protocol:contact_protocol -> unit -> delete_contact_method_request

val make_delete_container_image_request :
  service_name:container_service_name -> image:string_ -> unit -> delete_container_image_request

val make_delete_container_service_request :
  service_name:container_service_name -> unit -> delete_container_service_request

val make_delete_disk_request :
  ?force_delete_add_ons:boolean_ -> disk_name:resource_name -> unit -> delete_disk_request

val make_delete_disk_snapshot_request :
  disk_snapshot_name:resource_name -> unit -> delete_disk_snapshot_request

val make_delete_distribution_request :
  ?distribution_name:resource_name -> unit -> delete_distribution_request

val make_delete_domain_request : domain_name:domain_name -> unit -> delete_domain_request

val make_delete_domain_entry_request :
  domain_name:domain_name -> domain_entry:domain_entry -> unit -> delete_domain_entry_request

val make_delete_instance_request :
  ?force_delete_add_ons:boolean_ -> instance_name:resource_name -> unit -> delete_instance_request

val make_delete_instance_snapshot_request :
  instance_snapshot_name:resource_name -> unit -> delete_instance_snapshot_request

val make_delete_key_pair_request :
  ?expected_fingerprint:string_ -> key_pair_name:resource_name -> unit -> delete_key_pair_request

val make_delete_known_host_keys_request :
  instance_name:resource_name -> unit -> delete_known_host_keys_request

val make_delete_load_balancer_request :
  load_balancer_name:resource_name -> unit -> delete_load_balancer_request

val make_delete_load_balancer_tls_certificate_request :
  ?force:boolean_ ->
  load_balancer_name:resource_name ->
  certificate_name:resource_name ->
  unit ->
  delete_load_balancer_tls_certificate_request

val make_delete_relational_database_request :
  ?skip_final_snapshot:boolean_ ->
  ?final_relational_database_snapshot_name:resource_name ->
  relational_database_name:resource_name ->
  unit ->
  delete_relational_database_request

val make_delete_relational_database_snapshot_request :
  relational_database_snapshot_name:resource_name ->
  unit ->
  delete_relational_database_snapshot_request

val make_detach_certificate_from_distribution_request :
  distribution_name:resource_name -> unit -> detach_certificate_from_distribution_request

val make_detach_disk_request : disk_name:resource_name -> unit -> detach_disk_request

val make_detach_instances_from_load_balancer_request :
  load_balancer_name:resource_name ->
  instance_names:resource_name_list ->
  unit ->
  detach_instances_from_load_balancer_request

val make_detach_static_ip_request : static_ip_name:resource_name -> unit -> detach_static_ip_request

val make_disable_add_on_request :
  add_on_type:add_on_type -> resource_name:resource_name -> unit -> disable_add_on_request

val make_disk :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?add_ons:add_on_list ->
  ?size_in_gb:integer ->
  ?is_system_disk:boolean_ ->
  ?iops:integer ->
  ?path:string_ ->
  ?state:disk_state ->
  ?attached_to:resource_name ->
  ?is_attached:boolean_ ->
  ?attachment_state:string_ ->
  ?gb_in_use:integer ->
  ?auto_mount_status:auto_mount_status ->
  unit ->
  disk

val make_disk_info :
  ?name:string_ ->
  ?path:non_empty_string ->
  ?size_in_gb:integer ->
  ?is_system_disk:boolean_ ->
  unit ->
  disk_info

val make_disk_snapshot :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?size_in_gb:integer ->
  ?state:disk_snapshot_state ->
  ?progress:string_ ->
  ?from_disk_name:resource_name ->
  ?from_disk_arn:non_empty_string ->
  ?from_instance_name:resource_name ->
  ?from_instance_arn:non_empty_string ->
  ?is_from_auto_snapshot:boolean_ ->
  unit ->
  disk_snapshot

val make_disk_snapshot_info : ?size_in_gb:integer -> unit -> disk_snapshot_info

val make_distribution_bundle :
  ?bundle_id:string_ ->
  ?name:string_ ->
  ?price:float_ ->
  ?transfer_per_month_in_gb:integer ->
  ?is_active:boolean_ ->
  unit ->
  distribution_bundle

val make_r53_hosted_zone_deletion_state :
  ?code:r53_hosted_zone_deletion_state_code ->
  ?message:string_ ->
  unit ->
  r53_hosted_zone_deletion_state

val make_name_servers_update_state :
  ?code:name_servers_update_state_code -> ?message:string_ -> unit -> name_servers_update_state

val make_registered_domain_delegation_info :
  ?name_servers_update_state:name_servers_update_state ->
  ?r53_hosted_zone_deletion_state:r53_hosted_zone_deletion_state ->
  unit ->
  registered_domain_delegation_info

val make_domain :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?domain_entries:domain_entry_list ->
  ?registered_domain_delegation_info:registered_domain_delegation_info ->
  unit ->
  domain

val make_download_default_key_pair_request : unit -> unit

val make_enable_add_on_request :
  resource_name:resource_name -> add_on_request:add_on_request -> unit -> enable_add_on_request

val make_export_snapshot_request :
  source_snapshot_name:resource_name -> unit -> export_snapshot_request

val make_instance_snapshot_info :
  ?from_bundle_id:non_empty_string ->
  ?from_blueprint_id:non_empty_string ->
  ?from_disk_info:disk_info_list ->
  unit ->
  instance_snapshot_info

val make_export_snapshot_record_source_info :
  ?resource_type:export_snapshot_record_source_type ->
  ?created_at:iso_date ->
  ?name:non_empty_string ->
  ?arn:non_empty_string ->
  ?from_resource_name:non_empty_string ->
  ?from_resource_arn:non_empty_string ->
  ?instance_snapshot_info:instance_snapshot_info ->
  ?disk_snapshot_info:disk_snapshot_info ->
  unit ->
  export_snapshot_record_source_info

val make_export_snapshot_record :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?state:record_state ->
  ?source_info:export_snapshot_record_source_info ->
  ?destination_info:destination_info ->
  unit ->
  export_snapshot_record

val make_get_active_names_request : ?page_token:string_ -> unit -> get_active_names_request

val make_get_alarms_request :
  ?alarm_name:resource_name ->
  ?page_token:string_ ->
  ?monitored_resource_name:resource_name ->
  unit ->
  get_alarms_request

val make_get_auto_snapshots_request :
  resource_name:resource_name -> unit -> get_auto_snapshots_request

val make_get_blueprints_request :
  ?include_inactive:boolean_ ->
  ?page_token:string_ ->
  ?app_category:app_category ->
  unit ->
  get_blueprints_request

val make_get_bucket_access_keys_request :
  bucket_name:bucket_name -> unit -> get_bucket_access_keys_request

val make_get_bucket_bundles_request :
  ?include_inactive:boolean_ -> unit -> get_bucket_bundles_request

val make_metric_datapoint :
  ?average:double ->
  ?maximum:double ->
  ?minimum:double ->
  ?sample_count:double ->
  ?sum:double ->
  ?timestamp:timestamp ->
  ?unit_:metric_unit ->
  unit ->
  metric_datapoint

val make_get_bucket_metric_data_request :
  bucket_name:bucket_name ->
  metric_name:bucket_metric_name ->
  start_time:iso_date ->
  end_time:iso_date ->
  period:metric_period ->
  statistics:metric_statistic_list ->
  unit_:metric_unit ->
  unit ->
  get_bucket_metric_data_request

val make_get_buckets_request :
  ?bucket_name:bucket_name ->
  ?page_token:string_ ->
  ?include_connected_resources:boolean_ ->
  ?include_cors:boolean_ ->
  unit ->
  get_buckets_request

val make_get_bundles_request :
  ?include_inactive:boolean_ ->
  ?page_token:string_ ->
  ?app_category:app_category ->
  unit ->
  get_bundles_request

val make_get_certificates_request :
  ?certificate_statuses:certificate_status_list ->
  ?include_certificate_details:include_certificate_details ->
  ?certificate_name:certificate_name ->
  ?page_token:string_ ->
  unit ->
  get_certificates_request

val make_get_cloud_formation_stack_records_request :
  ?page_token:string_ -> unit -> get_cloud_formation_stack_records_request

val make_get_contact_methods_request :
  ?protocols:contact_protocols_list -> unit -> get_contact_methods_request

val make_get_container_api_metadata_request : unit -> unit

val make_get_container_images_request :
  service_name:container_service_name -> unit -> get_container_images_request

val make_get_container_log_request :
  ?start_time:iso_date ->
  ?end_time:iso_date ->
  ?filter_pattern:string_ ->
  ?page_token:string_ ->
  service_name:container_service_name ->
  container_name:string_ ->
  unit ->
  get_container_log_request

val make_get_container_service_deployments_request :
  service_name:container_service_name -> unit -> get_container_service_deployments_request

val make_get_container_service_metric_data_request :
  service_name:container_service_name ->
  metric_name:container_service_metric_name ->
  start_time:iso_date ->
  end_time:iso_date ->
  period:metric_period ->
  statistics:metric_statistic_list ->
  unit ->
  get_container_service_metric_data_request

val make_get_container_service_powers_request : unit -> unit

val make_get_container_services_request :
  ?service_name:container_service_name -> unit -> get_container_services_request

val make_resource_budget_estimate :
  ?resource_name:resource_name ->
  ?resource_type:resource_type ->
  ?cost_estimates:cost_estimates ->
  ?start_time:iso_date ->
  ?end_time:iso_date ->
  unit ->
  resource_budget_estimate

val make_get_cost_estimate_request :
  resource_name:resource_name ->
  start_time:iso_date ->
  end_time:iso_date ->
  unit ->
  get_cost_estimate_request

val make_get_disk_request : disk_name:resource_name -> unit -> get_disk_request

val make_get_disk_snapshot_request :
  disk_snapshot_name:resource_name -> unit -> get_disk_snapshot_request

val make_get_disk_snapshots_request : ?page_token:string_ -> unit -> get_disk_snapshots_request
val make_get_disks_request : ?page_token:string_ -> unit -> get_disks_request
val make_get_distribution_bundles_request : unit -> unit

val make_get_distribution_latest_cache_reset_request :
  ?distribution_name:resource_name -> unit -> get_distribution_latest_cache_reset_request

val make_get_distribution_metric_data_request :
  distribution_name:resource_name ->
  metric_name:distribution_metric_name ->
  start_time:timestamp ->
  end_time:timestamp ->
  period:metric_period ->
  unit_:metric_unit ->
  statistics:metric_statistic_list ->
  unit ->
  get_distribution_metric_data_request

val make_get_distributions_request :
  ?distribution_name:resource_name -> ?page_token:string_ -> unit -> get_distributions_request

val make_get_domain_request : domain_name:domain_name -> unit -> get_domain_request
val make_get_domains_request : ?page_token:string_ -> unit -> get_domains_request

val make_get_export_snapshot_records_request :
  ?page_token:string_ -> unit -> get_export_snapshot_records_request

val make_instance_metadata_options :
  ?state:instance_metadata_state ->
  ?http_tokens:http_tokens ->
  ?http_endpoint:http_endpoint ->
  ?http_put_response_hop_limit:integer ->
  ?http_protocol_ipv6:http_protocol_ipv6 ->
  unit ->
  instance_metadata_options

val make_instance_state : ?code:integer -> ?name:string_ -> unit -> instance_state

val make_instance_port_info :
  ?from_port:port ->
  ?to_port:port ->
  ?protocol:network_protocol ->
  ?access_from:string_ ->
  ?access_type:port_access_type ->
  ?common_name:string_ ->
  ?access_direction:access_direction ->
  ?cidrs:string_list ->
  ?ipv6_cidrs:string_list ->
  ?cidr_list_aliases:string_list ->
  unit ->
  instance_port_info

val make_monthly_transfer : ?gb_per_month_allocated:integer -> unit -> monthly_transfer

val make_instance_networking :
  ?monthly_transfer:monthly_transfer ->
  ?ports:instance_port_info_list ->
  unit ->
  instance_networking

val make_instance_hardware :
  ?cpu_count:integer -> ?disks:disk_list -> ?ram_size_in_gb:float_ -> unit -> instance_hardware

val make_instance :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?blueprint_id:non_empty_string ->
  ?blueprint_name:non_empty_string ->
  ?bundle_id:non_empty_string ->
  ?add_ons:add_on_list ->
  ?is_static_ip:boolean_ ->
  ?private_ip_address:ip_address ->
  ?public_ip_address:ip_address ->
  ?ipv6_addresses:ipv6_address_list ->
  ?ip_address_type:ip_address_type ->
  ?hardware:instance_hardware ->
  ?networking:instance_networking ->
  ?state:instance_state ->
  ?username:non_empty_string ->
  ?ssh_key_name:resource_name ->
  ?metadata_options:instance_metadata_options ->
  unit ->
  instance

val make_get_instance_request : instance_name:resource_name -> unit -> get_instance_request

val make_host_key_attributes :
  ?algorithm:string_ ->
  ?public_key:string_ ->
  ?witnessed_at:iso_date ->
  ?fingerprint_sh_a1:string_ ->
  ?fingerprint_sh_a256:string_ ->
  ?not_valid_before:iso_date ->
  ?not_valid_after:iso_date ->
  unit ->
  host_key_attributes

val make_password_data :
  ?ciphertext:string_ -> ?key_pair_name:resource_name -> unit -> password_data

val make_instance_access_details :
  ?cert_key:string_ ->
  ?expires_at:iso_date ->
  ?ip_address:ip_address ->
  ?ipv6_addresses:ipv6_address_list ->
  ?password:string_ ->
  ?password_data:password_data ->
  ?private_key:string_ ->
  ?protocol:instance_access_protocol ->
  ?instance_name:resource_name ->
  ?username:string_ ->
  ?host_keys:host_keys_list ->
  unit ->
  instance_access_details

val make_get_instance_access_details_request :
  ?protocol:instance_access_protocol ->
  instance_name:resource_name ->
  unit ->
  get_instance_access_details_request

val make_get_instance_metric_data_request :
  instance_name:resource_name ->
  metric_name:instance_metric_name ->
  period:metric_period ->
  start_time:timestamp ->
  end_time:timestamp ->
  unit_:metric_unit ->
  statistics:metric_statistic_list ->
  unit ->
  get_instance_metric_data_request

val make_instance_port_state :
  ?from_port:port ->
  ?to_port:port ->
  ?protocol:network_protocol ->
  ?state:port_state ->
  ?cidrs:string_list ->
  ?ipv6_cidrs:string_list ->
  ?cidr_list_aliases:string_list ->
  unit ->
  instance_port_state

val make_get_instance_port_states_request :
  instance_name:resource_name -> unit -> get_instance_port_states_request

val make_instance_snapshot :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?state:instance_snapshot_state ->
  ?progress:string_ ->
  ?from_attached_disks:disk_list ->
  ?from_instance_name:resource_name ->
  ?from_instance_arn:non_empty_string ->
  ?from_blueprint_id:string_ ->
  ?from_bundle_id:string_ ->
  ?is_from_auto_snapshot:boolean_ ->
  ?size_in_gb:integer ->
  unit ->
  instance_snapshot

val make_get_instance_snapshot_request :
  instance_snapshot_name:resource_name -> unit -> get_instance_snapshot_request

val make_get_instance_snapshots_request :
  ?page_token:string_ -> unit -> get_instance_snapshots_request

val make_get_instance_state_request :
  instance_name:resource_name -> unit -> get_instance_state_request

val make_get_instances_request : ?page_token:string_ -> unit -> get_instances_request
val make_get_key_pair_request : key_pair_name:resource_name -> unit -> get_key_pair_request

val make_get_key_pairs_request :
  ?page_token:string_ -> ?include_default_key_pair:boolean_ -> unit -> get_key_pairs_request

val make_load_balancer_tls_certificate_summary :
  ?name:resource_name -> ?is_attached:boolean_ -> unit -> load_balancer_tls_certificate_summary

val make_instance_health_summary :
  ?instance_name:resource_name ->
  ?instance_health:instance_health_state ->
  ?instance_health_reason:instance_health_reason ->
  unit ->
  instance_health_summary

val make_load_balancer :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?dns_name:non_empty_string ->
  ?state:load_balancer_state ->
  ?protocol:load_balancer_protocol ->
  ?public_ports:port_list ->
  ?health_check_path:non_empty_string ->
  ?instance_port:integer ->
  ?instance_health_summary:instance_health_summary_list ->
  ?tls_certificate_summaries:load_balancer_tls_certificate_summary_list ->
  ?configuration_options:load_balancer_configuration_options ->
  ?ip_address_type:ip_address_type ->
  ?https_redirection_enabled:boolean_ ->
  ?tls_policy_name:resource_name ->
  unit ->
  load_balancer

val make_get_load_balancer_request :
  load_balancer_name:resource_name -> unit -> get_load_balancer_request

val make_get_load_balancer_metric_data_request :
  load_balancer_name:resource_name ->
  metric_name:load_balancer_metric_name ->
  period:metric_period ->
  start_time:timestamp ->
  end_time:timestamp ->
  unit_:metric_unit ->
  statistics:metric_statistic_list ->
  unit ->
  get_load_balancer_metric_data_request

val make_load_balancer_tls_certificate_domain_validation_option :
  ?domain_name:domain_name ->
  ?validation_status:load_balancer_tls_certificate_domain_status ->
  unit ->
  load_balancer_tls_certificate_domain_validation_option

val make_load_balancer_tls_certificate_renewal_summary :
  ?renewal_status:load_balancer_tls_certificate_renewal_status ->
  ?domain_validation_options:load_balancer_tls_certificate_domain_validation_option_list ->
  unit ->
  load_balancer_tls_certificate_renewal_summary

val make_load_balancer_tls_certificate_dns_record_creation_state :
  ?code:load_balancer_tls_certificate_dns_record_creation_state_code ->
  ?message:string_ ->
  unit ->
  load_balancer_tls_certificate_dns_record_creation_state

val make_load_balancer_tls_certificate_domain_validation_record :
  ?name:non_empty_string ->
  ?type_:non_empty_string ->
  ?value:non_empty_string ->
  ?validation_status:load_balancer_tls_certificate_domain_status ->
  ?domain_name:domain_name ->
  ?dns_record_creation_state:load_balancer_tls_certificate_dns_record_creation_state ->
  unit ->
  load_balancer_tls_certificate_domain_validation_record

val make_load_balancer_tls_certificate :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?load_balancer_name:resource_name ->
  ?is_attached:boolean_ ->
  ?status:load_balancer_tls_certificate_status ->
  ?domain_name:domain_name ->
  ?domain_validation_records:load_balancer_tls_certificate_domain_validation_record_list ->
  ?failure_reason:load_balancer_tls_certificate_failure_reason ->
  ?issued_at:iso_date ->
  ?issuer:non_empty_string ->
  ?key_algorithm:non_empty_string ->
  ?not_after:iso_date ->
  ?not_before:iso_date ->
  ?renewal_summary:load_balancer_tls_certificate_renewal_summary ->
  ?revocation_reason:load_balancer_tls_certificate_revocation_reason ->
  ?revoked_at:iso_date ->
  ?serial:non_empty_string ->
  ?signature_algorithm:non_empty_string ->
  ?subject:non_empty_string ->
  ?subject_alternative_names:string_list ->
  unit ->
  load_balancer_tls_certificate

val make_get_load_balancer_tls_certificates_request :
  load_balancer_name:resource_name -> unit -> get_load_balancer_tls_certificates_request

val make_load_balancer_tls_policy :
  ?name:resource_name ->
  ?is_default:boolean_ ->
  ?description:string_ ->
  ?protocols:string_list ->
  ?ciphers:string_list ->
  unit ->
  load_balancer_tls_policy

val make_get_load_balancer_tls_policies_request :
  ?page_token:string_ -> unit -> get_load_balancer_tls_policies_request

val make_get_load_balancers_request : ?page_token:string_ -> unit -> get_load_balancers_request
val make_get_operation_request : operation_id:non_empty_string -> unit -> get_operation_request
val make_get_operations_request : ?page_token:string_ -> unit -> get_operations_request

val make_get_operations_for_resource_request :
  ?page_token:string_ -> resource_name:resource_name -> unit -> get_operations_for_resource_request

val make_region :
  ?continent_code:string_ ->
  ?description:string_ ->
  ?display_name:string_ ->
  ?name:region_name ->
  ?availability_zones:availability_zone_list ->
  ?relational_database_availability_zones:availability_zone_list ->
  unit ->
  region

val make_get_regions_request :
  ?include_availability_zones:boolean_ ->
  ?include_relational_database_availability_zones:boolean_ ->
  unit ->
  get_regions_request

val make_pending_maintenance_action :
  ?action:non_empty_string ->
  ?description:non_empty_string ->
  ?current_apply_date:iso_date ->
  unit ->
  pending_maintenance_action

val make_relational_database_endpoint :
  ?port:integer -> ?address:non_empty_string -> unit -> relational_database_endpoint

val make_pending_modified_relational_database_values :
  ?master_user_password:string_ ->
  ?engine_version:string_ ->
  ?backup_retention_enabled:boolean_ ->
  unit ->
  pending_modified_relational_database_values

val make_relational_database_hardware :
  ?cpu_count:integer ->
  ?disk_size_in_gb:integer ->
  ?ram_size_in_gb:float_ ->
  unit ->
  relational_database_hardware

val make_relational_database :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?relational_database_blueprint_id:non_empty_string ->
  ?relational_database_bundle_id:non_empty_string ->
  ?master_database_name:string_ ->
  ?hardware:relational_database_hardware ->
  ?state:non_empty_string ->
  ?secondary_availability_zone:string_ ->
  ?backup_retention_enabled:boolean_ ->
  ?pending_modified_values:pending_modified_relational_database_values ->
  ?engine:non_empty_string ->
  ?engine_version:non_empty_string ->
  ?latest_restorable_time:iso_date ->
  ?master_username:non_empty_string ->
  ?parameter_apply_status:non_empty_string ->
  ?preferred_backup_window:non_empty_string ->
  ?preferred_maintenance_window:non_empty_string ->
  ?publicly_accessible:boolean_ ->
  ?master_endpoint:relational_database_endpoint ->
  ?pending_maintenance_actions:pending_maintenance_action_list ->
  ?ca_certificate_identifier:string_ ->
  unit ->
  relational_database

val make_get_relational_database_request :
  relational_database_name:resource_name -> unit -> get_relational_database_request

val make_relational_database_blueprint :
  ?blueprint_id:string_ ->
  ?engine:relational_database_engine ->
  ?engine_version:string_ ->
  ?engine_description:string_ ->
  ?engine_version_description:string_ ->
  ?is_engine_default:boolean_ ->
  unit ->
  relational_database_blueprint

val make_get_relational_database_blueprints_request :
  ?page_token:string_ -> unit -> get_relational_database_blueprints_request

val make_relational_database_bundle :
  ?bundle_id:string_ ->
  ?name:string_ ->
  ?price:float_ ->
  ?ram_size_in_gb:float_ ->
  ?disk_size_in_gb:integer ->
  ?transfer_per_month_in_gb:integer ->
  ?cpu_count:integer ->
  ?is_encrypted:boolean_ ->
  ?is_active:boolean_ ->
  unit ->
  relational_database_bundle

val make_get_relational_database_bundles_request :
  ?page_token:string_ ->
  ?include_inactive:boolean_ ->
  unit ->
  get_relational_database_bundles_request

val make_relational_database_event :
  ?resource:resource_name ->
  ?created_at:iso_date ->
  ?message:string_ ->
  ?event_categories:string_list ->
  unit ->
  relational_database_event

val make_get_relational_database_events_request :
  ?duration_in_minutes:integer ->
  ?page_token:string_ ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_events_request

val make_log_event : ?created_at:iso_date -> ?message:string_ -> unit -> log_event

val make_get_relational_database_log_events_request :
  ?start_time:iso_date ->
  ?end_time:iso_date ->
  ?start_from_head:boolean_ ->
  ?page_token:string_ ->
  relational_database_name:resource_name ->
  log_stream_name:string_ ->
  unit ->
  get_relational_database_log_events_request

val make_get_relational_database_log_streams_request :
  relational_database_name:resource_name -> unit -> get_relational_database_log_streams_request

val make_get_relational_database_master_user_password_request :
  ?password_version:relational_database_password_version ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_master_user_password_request

val make_get_relational_database_metric_data_request :
  relational_database_name:resource_name ->
  metric_name:relational_database_metric_name ->
  period:metric_period ->
  start_time:iso_date ->
  end_time:iso_date ->
  unit_:metric_unit ->
  statistics:metric_statistic_list ->
  unit ->
  get_relational_database_metric_data_request

val make_relational_database_parameter :
  ?allowed_values:string_ ->
  ?apply_method:string_ ->
  ?apply_type:string_ ->
  ?data_type:string_ ->
  ?description:string_ ->
  ?is_modifiable:boolean_ ->
  ?parameter_name:string_ ->
  ?parameter_value:string_ ->
  unit ->
  relational_database_parameter

val make_get_relational_database_parameters_request :
  ?page_token:string_ ->
  relational_database_name:resource_name ->
  unit ->
  get_relational_database_parameters_request

val make_relational_database_snapshot :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?tags:tag_list ->
  ?engine:non_empty_string ->
  ?engine_version:non_empty_string ->
  ?size_in_gb:integer ->
  ?state:non_empty_string ->
  ?from_relational_database_name:non_empty_string ->
  ?from_relational_database_arn:non_empty_string ->
  ?from_relational_database_bundle_id:string_ ->
  ?from_relational_database_blueprint_id:string_ ->
  unit ->
  relational_database_snapshot

val make_get_relational_database_snapshot_request :
  relational_database_snapshot_name:resource_name ->
  unit ->
  get_relational_database_snapshot_request

val make_get_relational_database_snapshots_request :
  ?page_token:string_ -> unit -> get_relational_database_snapshots_request

val make_get_relational_databases_request :
  ?page_token:string_ -> unit -> get_relational_databases_request

val make_setup_execution_details :
  ?command:string_ ->
  ?date_time:iso_date ->
  ?name:non_empty_string ->
  ?status:setup_status ->
  ?standard_error:string_ ->
  ?standard_output:string_ ->
  ?version:string_ ->
  unit ->
  setup_execution_details

val make_setup_history_resource :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  unit ->
  setup_history_resource

val make_setup_request :
  ?instance_name:resource_name ->
  ?domain_names:setup_domain_name_list ->
  ?certificate_provider:certificate_provider ->
  unit ->
  setup_request

val make_setup_history :
  ?operation_id:non_empty_string ->
  ?request:setup_request ->
  ?resource:setup_history_resource ->
  ?execution_details:setup_execution_details_list ->
  ?status:setup_status ->
  unit ->
  setup_history

val make_get_setup_history_request :
  ?page_token:setup_history_page_token ->
  resource_name:resource_name ->
  unit ->
  get_setup_history_request

val make_static_ip :
  ?name:resource_name ->
  ?arn:non_empty_string ->
  ?support_code:string_ ->
  ?created_at:iso_date ->
  ?location:resource_location ->
  ?resource_type:resource_type ->
  ?ip_address:ip_address ->
  ?attached_to:resource_name ->
  ?is_attached:boolean_ ->
  unit ->
  static_ip

val make_get_static_ip_request : static_ip_name:resource_name -> unit -> get_static_ip_request
val make_get_static_ips_request : ?page_token:string_ -> unit -> get_static_ips_request

val make_import_key_pair_request :
  key_pair_name:resource_name -> public_key_base64:base64 -> unit -> import_key_pair_request

val make_is_vpc_peered_request : unit -> unit

val make_update_relational_database_parameters_request :
  relational_database_name:resource_name ->
  parameters:relational_database_parameter_list ->
  unit ->
  update_relational_database_parameters_request

val make_update_relational_database_request :
  ?master_user_password:sensitive_string ->
  ?rotate_master_user_password:boolean_ ->
  ?preferred_backup_window:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?enable_backup_retention:boolean_ ->
  ?disable_backup_retention:boolean_ ->
  ?publicly_accessible:boolean_ ->
  ?apply_immediately:boolean_ ->
  ?ca_certificate_identifier:string_ ->
  ?relational_database_blueprint_id:string_ ->
  relational_database_name:resource_name ->
  unit ->
  update_relational_database_request

val make_update_load_balancer_attribute_request :
  load_balancer_name:resource_name ->
  attribute_name:load_balancer_attribute_name ->
  attribute_value:string_max256 ->
  unit ->
  update_load_balancer_attribute_request

val make_update_instance_metadata_options_request :
  ?http_tokens:http_tokens ->
  ?http_endpoint:http_endpoint ->
  ?http_put_response_hop_limit:integer ->
  ?http_protocol_ipv6:http_protocol_ipv6 ->
  instance_name:resource_name ->
  unit ->
  update_instance_metadata_options_request

val make_update_domain_entry_request :
  domain_name:domain_name -> domain_entry:domain_entry -> unit -> update_domain_entry_request

val make_update_distribution_bundle_request :
  ?distribution_name:resource_name ->
  ?bundle_id:string_ ->
  unit ->
  update_distribution_bundle_request

val make_update_distribution_request :
  ?origin:input_origin ->
  ?default_cache_behavior:cache_behavior ->
  ?cache_behavior_settings:cache_settings ->
  ?cache_behaviors:cache_behavior_list ->
  ?is_enabled:boolean_ ->
  ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum ->
  ?certificate_name:resource_name ->
  ?use_default_certificate:boolean_ ->
  distribution_name:resource_name ->
  unit ->
  update_distribution_request

val make_update_container_service_request :
  ?power:container_service_power_name ->
  ?scale:container_service_scale ->
  ?is_disabled:boolean_ ->
  ?public_domain_names:container_service_public_domains ->
  ?private_registry_access:private_registry_access_request ->
  service_name:container_service_name ->
  unit ->
  update_container_service_request

val make_update_bucket_bundle_request :
  bucket_name:bucket_name -> bundle_id:non_empty_string -> unit -> update_bucket_bundle_request

val make_update_bucket_request :
  ?access_rules:access_rules ->
  ?versioning:non_empty_string ->
  ?readonly_access_accounts:partner_id_list ->
  ?access_log_config:bucket_access_log_config ->
  ?cors:bucket_cors_config ->
  bucket_name:bucket_name ->
  unit ->
  update_bucket_request

val make_untag_resource_request :
  ?resource_arn:resource_arn ->
  resource_name:resource_name ->
  tag_keys:tag_key_list ->
  unit ->
  untag_resource_request

val make_unpeer_vpc_request : unit -> unit

val make_test_alarm_request :
  alarm_name:resource_name -> state:alarm_state -> unit -> test_alarm_request

val make_tag_resource_request :
  ?resource_arn:resource_arn ->
  resource_name:resource_name ->
  tags:tag_list ->
  unit ->
  tag_resource_request

val make_stop_relational_database_request :
  ?relational_database_snapshot_name:resource_name ->
  relational_database_name:resource_name ->
  unit ->
  stop_relational_database_request

val make_stop_instance_request :
  ?force:boolean_ -> instance_name:resource_name -> unit -> stop_instance_request

val make_stop_gui_session_request : resource_name:resource_name -> unit -> stop_gui_session_request

val make_start_relational_database_request :
  relational_database_name:resource_name -> unit -> start_relational_database_request

val make_start_instance_request : instance_name:resource_name -> unit -> start_instance_request

val make_start_gui_session_request :
  resource_name:resource_name -> unit -> start_gui_session_request

val make_setup_instance_https_request :
  instance_name:resource_name ->
  email_address:email_address ->
  domain_names:setup_domain_name_list ->
  certificate_provider:certificate_provider ->
  unit ->
  setup_instance_https_request

val make_set_resource_access_for_bucket_request :
  resource_name:resource_name ->
  bucket_name:bucket_name ->
  access:resource_bucket_access ->
  unit ->
  set_resource_access_for_bucket_request

val make_set_ip_address_type_request :
  ?accept_bundle_update:boolean_ ->
  resource_type:resource_type ->
  resource_name:resource_name ->
  ip_address_type:ip_address_type ->
  unit ->
  set_ip_address_type_request

val make_send_contact_method_verification_request :
  protocol:contact_method_verification_protocol -> unit -> send_contact_method_verification_request

val make_reset_distribution_cache_request :
  ?distribution_name:resource_name -> unit -> reset_distribution_cache_request

val make_release_static_ip_request :
  static_ip_name:resource_name -> unit -> release_static_ip_request

val make_register_container_image_request :
  service_name:container_service_name ->
  label:container_label ->
  digest:string_ ->
  unit ->
  register_container_image_request

val make_reboot_relational_database_request :
  relational_database_name:resource_name -> unit -> reboot_relational_database_request

val make_reboot_instance_request : instance_name:resource_name -> unit -> reboot_instance_request

val make_put_instance_public_ports_request :
  port_infos:port_info_list ->
  instance_name:resource_name ->
  unit ->
  put_instance_public_ports_request

val make_put_alarm_request :
  ?datapoints_to_alarm:integer ->
  ?treat_missing_data:treat_missing_data ->
  ?contact_protocols:contact_protocols_list ->
  ?notification_triggers:notification_trigger_list ->
  ?notification_enabled:boolean_ ->
  ?tags:tag_list ->
  alarm_name:resource_name ->
  metric_name:metric_name ->
  monitored_resource_name:resource_name ->
  comparison_operator:comparison_operator ->
  threshold:double ->
  evaluation_periods:integer ->
  unit ->
  put_alarm_request

val make_peer_vpc_request : unit -> unit

val make_open_instance_public_ports_request :
  port_info:port_info -> instance_name:resource_name -> unit -> open_instance_public_ports_request
