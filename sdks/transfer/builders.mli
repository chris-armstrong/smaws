open Types

val make_s3_input_file_location : ?key:s3_key -> ?bucket:s3_bucket -> unit -> s3_input_file_location

val make_efs_file_location :
  ?path:efs_path -> ?file_system_id:efs_file_system_id -> unit -> efs_file_location

val make_input_file_location :
  ?efs_file_location:efs_file_location ->
  ?s3_file_location:s3_input_file_location ->
  unit ->
  input_file_location

val make_copy_step_details :
  ?source_file_location:source_file_location ->
  ?overwrite_existing:overwrite_existing ->
  ?destination_file_location:input_file_location ->
  ?name:workflow_step_name ->
  unit ->
  copy_step_details

val make_custom_step_details :
  ?source_file_location:source_file_location ->
  ?timeout_seconds:custom_step_timeout_seconds ->
  ?target:custom_step_target ->
  ?name:workflow_step_name ->
  unit ->
  custom_step_details

val make_delete_step_details :
  ?source_file_location:source_file_location ->
  ?name:workflow_step_name ->
  unit ->
  delete_step_details

val make_s3_tag : value:s3_tag_value -> key:s3_tag_key -> unit -> s3_tag

val make_tag_step_details :
  ?source_file_location:source_file_location ->
  ?tags:s3_tags ->
  ?name:workflow_step_name ->
  unit ->
  tag_step_details

val make_decrypt_step_details :
  ?overwrite_existing:overwrite_existing ->
  ?source_file_location:source_file_location ->
  ?name:workflow_step_name ->
  destination_file_location:input_file_location ->
  type_:encryption_type ->
  unit ->
  decrypt_step_details

val make_workflow_step :
  ?decrypt_step_details:decrypt_step_details ->
  ?tag_step_details:tag_step_details ->
  ?delete_step_details:delete_step_details ->
  ?custom_step_details:custom_step_details ->
  ?copy_step_details:copy_step_details ->
  ?type_:workflow_step_type ->
  unit ->
  workflow_step

val make_workflow_detail : execution_role:role -> workflow_id:workflow_id -> unit -> workflow_detail

val make_workflow_details :
  ?on_partial_upload:on_partial_upload_workflow_details ->
  ?on_upload:on_upload_workflow_details ->
  unit ->
  workflow_details

val make_web_app_vpc_config :
  ?ip_address_type:web_app_vpc_endpoint_ip_address_type ->
  ?security_group_ids:security_group_ids ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  unit ->
  web_app_vpc_config

val make_identity_center_config :
  ?role:role -> ?instance_arn:identity_center_instance_arn -> unit -> identity_center_config

val make_user_details :
  ?session_id:session_id -> server_id:server_id -> user_name:user_name -> unit -> user_details

val make_update_web_app_vpc_config :
  ?ip_address_type:web_app_vpc_endpoint_ip_address_type ->
  ?subnet_ids:subnet_ids ->
  unit ->
  update_web_app_vpc_config

val make_update_web_app_response : web_app_id:web_app_id -> unit -> update_web_app_response

val make_update_web_app_identity_center_config :
  ?role:role -> unit -> update_web_app_identity_center_config

val make_update_web_app_request :
  ?endpoint_details:update_web_app_endpoint_details ->
  ?web_app_units:web_app_units ->
  ?access_endpoint:web_app_access_endpoint ->
  ?identity_provider_details:update_web_app_identity_provider_details ->
  web_app_id:web_app_id ->
  unit ->
  update_web_app_request

val make_update_web_app_customization_response :
  web_app_id:web_app_id -> unit -> update_web_app_customization_response

val make_update_web_app_customization_request :
  ?favicon_file:web_app_favicon_file ->
  ?logo_file:web_app_logo_file ->
  ?title:web_app_title ->
  web_app_id:web_app_id ->
  unit ->
  update_web_app_customization_request

val make_update_user_response :
  user_name:user_name -> server_id:server_id -> unit -> update_user_response

val make_home_directory_map_entry :
  ?type_:map_type -> target:map_target -> entry:map_entry -> unit -> home_directory_map_entry

val make_posix_profile :
  ?secondary_gids:secondary_gids -> gid:posix_id -> uid:posix_id -> unit -> posix_profile

val make_update_user_request :
  ?role:role ->
  ?posix_profile:posix_profile ->
  ?policy:policy ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory_type:home_directory_type ->
  ?home_directory:home_directory ->
  user_name:user_name ->
  server_id:server_id ->
  unit ->
  update_user_request

val make_update_server_response : server_id:server_id -> unit -> update_server_response

val make_protocol_details :
  ?as2_transports:as2_transports ->
  ?set_stat_option:set_stat_option ->
  ?tls_session_resumption_mode:tls_session_resumption_mode ->
  ?passive_ip:passive_ip ->
  unit ->
  protocol_details

val make_endpoint_details :
  ?security_group_ids:security_group_ids ->
  ?vpc_id:vpc_id ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?subnet_ids:subnet_ids ->
  ?address_allocation_ids:address_allocation_ids ->
  unit ->
  endpoint_details

val make_identity_provider_details :
  ?sftp_authentication_methods:sftp_authentication_methods ->
  ?\#function:\#function ->
  ?directory_id:directory_id ->
  ?invocation_role:role ->
  ?url:url ->
  unit ->
  identity_provider_details

val make_s3_storage_options :
  ?directory_listing_optimization:directory_listing_optimization -> unit -> s3_storage_options

val make_update_server_request :
  ?identity_provider_type:identity_provider_type ->
  ?ip_address_type:ip_address_type ->
  ?s3_storage_options:s3_storage_options ->
  ?structured_log_destinations:structured_log_destinations ->
  ?workflow_details:workflow_details ->
  ?security_policy_name:security_policy_name ->
  ?protocols:protocols ->
  ?pre_authentication_login_banner:pre_authentication_login_banner ->
  ?post_authentication_login_banner:post_authentication_login_banner ->
  ?logging_role:nullable_role ->
  ?identity_provider_details:identity_provider_details ->
  ?host_key:host_key ->
  ?endpoint_type:endpoint_type ->
  ?endpoint_details:endpoint_details ->
  ?protocol_details:protocol_details ->
  ?certificate:certificate ->
  server_id:server_id ->
  unit ->
  update_server_request

val make_update_profile_response : profile_id:profile_id -> unit -> update_profile_response

val make_update_profile_request :
  ?certificate_ids:certificate_ids -> profile_id:profile_id -> unit -> update_profile_request

val make_update_host_key_response :
  host_key_id:host_key_id -> server_id:server_id -> unit -> update_host_key_response

val make_update_host_key_request :
  description:host_key_description ->
  host_key_id:host_key_id ->
  server_id:server_id ->
  unit ->
  update_host_key_request

val make_update_connector_vpc_lattice_egress_config :
  ?port_number:sftp_port ->
  ?resource_configuration_arn:vpc_lattice_resource_configuration_arn ->
  unit ->
  update_connector_vpc_lattice_egress_config

val make_update_connector_response : connector_id:connector_id -> unit -> update_connector_response

val make_as2_async_mdn_connector_config :
  ?server_ids:as2_async_mdn_server_ids -> ?url:url -> unit -> as2_async_mdn_connector_config

val make_as2_connector_config :
  ?async_mdn_config:as2_async_mdn_connector_config ->
  ?preserve_content_type:preserve_content_type ->
  ?basic_auth_secret_id:as2_connector_secret_id ->
  ?mdn_response:mdn_response ->
  ?mdn_signing_algorithm:mdn_signing_alg ->
  ?signing_algorithm:signing_alg ->
  ?encryption_algorithm:encryption_alg ->
  ?compression:compression_enum ->
  ?message_subject:message_subject ->
  ?partner_profile_id:profile_id ->
  ?local_profile_id:profile_id ->
  unit ->
  as2_connector_config

val make_sftp_connector_config :
  ?max_concurrent_connections:max_concurrent_connections ->
  ?trusted_host_keys:sftp_connector_trusted_host_key_list ->
  ?user_secret_id:secret_id ->
  unit ->
  sftp_connector_config

val make_update_connector_request :
  ?ip_address_type:connectors_ip_address_type ->
  ?egress_config:update_connector_egress_config ->
  ?security_policy_name:connector_security_policy_name ->
  ?sftp_config:sftp_connector_config ->
  ?logging_role:role ->
  ?access_role:role ->
  ?as2_config:as2_connector_config ->
  ?url:url ->
  connector_id:connector_id ->
  unit ->
  update_connector_request

val make_update_certificate_response :
  certificate_id:certificate_id -> unit -> update_certificate_response

val make_update_certificate_request :
  ?description:description ->
  ?inactive_date:cert_date ->
  ?active_date:cert_date ->
  certificate_id:certificate_id ->
  unit ->
  update_certificate_request

val make_update_agreement_response : agreement_id:agreement_id -> unit -> update_agreement_response

val make_custom_directories_type :
  temporary_files_directory:home_directory ->
  status_files_directory:home_directory ->
  payload_files_directory:home_directory ->
  mdn_files_directory:home_directory ->
  failed_files_directory:home_directory ->
  unit ->
  custom_directories_type

val make_update_agreement_request :
  ?custom_directories:custom_directories_type ->
  ?enforce_message_signing:enforce_message_signing_type ->
  ?preserve_filename:preserve_filename_type ->
  ?access_role:role ->
  ?base_directory:home_directory ->
  ?partner_profile_id:profile_id ->
  ?local_profile_id:profile_id ->
  ?status:agreement_status_type ->
  ?description:description ->
  server_id:server_id ->
  agreement_id:agreement_id ->
  unit ->
  update_agreement_request

val make_update_access_response :
  external_id:external_id -> server_id:server_id -> unit -> update_access_response

val make_update_access_request :
  ?role:role ->
  ?posix_profile:posix_profile ->
  ?policy:policy ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory_type:home_directory_type ->
  ?home_directory:home_directory ->
  external_id:external_id ->
  server_id:server_id ->
  unit ->
  update_access_request

val make_untag_resource_request : tag_keys:tag_keys -> arn:arn -> unit -> untag_resource_request

val make_test_identity_provider_response :
  ?message:message ->
  ?response:response ->
  url:url ->
  status_code:status_code ->
  unit ->
  test_identity_provider_response

val make_test_identity_provider_request :
  ?user_password:user_password ->
  ?source_ip:source_ip ->
  ?server_protocol:protocol ->
  user_name:user_name ->
  server_id:server_id ->
  unit ->
  test_identity_provider_request

val make_sftp_connector_connection_details :
  ?host_key:sftp_connector_host_key -> unit -> sftp_connector_connection_details

val make_test_connection_response :
  ?sftp_connection_details:sftp_connector_connection_details ->
  ?status_message:message ->
  ?status:status ->
  ?connector_id:connector_id ->
  unit ->
  test_connection_response

val make_test_connection_request : connector_id:connector_id -> unit -> test_connection_request
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request : tags:tags -> arn:arn -> unit -> tag_resource_request
val make_stop_server_request : server_id:server_id -> unit -> stop_server_request
val make_start_server_request : server_id:server_id -> unit -> start_server_request
val make_start_remote_move_response : move_id:move_id -> unit -> start_remote_move_response

val make_start_remote_move_request :
  target_path:file_path ->
  source_path:file_path ->
  connector_id:connector_id ->
  unit ->
  start_remote_move_request

val make_start_remote_delete_response : delete_id:delete_id -> unit -> start_remote_delete_response

val make_start_remote_delete_request :
  delete_path:file_path -> connector_id:connector_id -> unit -> start_remote_delete_request

val make_start_file_transfer_response :
  transfer_id:transfer_id -> unit -> start_file_transfer_response

val make_custom_http_header :
  ?value:custom_http_header_value_type ->
  ?key:custom_http_header_key_type ->
  unit ->
  custom_http_header

val make_start_file_transfer_request :
  ?custom_http_headers:custom_http_headers ->
  ?remote_directory_path:file_path ->
  ?local_directory_path:file_path ->
  ?retrieve_file_paths:file_paths ->
  ?send_file_paths:file_paths ->
  connector_id:connector_id ->
  unit ->
  start_file_transfer_request

val make_start_directory_listing_response :
  output_file_name:output_file_name ->
  listing_id:listing_id ->
  unit ->
  start_directory_listing_response

val make_start_directory_listing_request :
  ?max_items:max_items ->
  output_directory_path:file_path ->
  remote_directory_path:file_path ->
  connector_id:connector_id ->
  unit ->
  start_directory_listing_request

val make_send_workflow_step_state_response : unit -> unit

val make_send_workflow_step_state_request :
  status:custom_step_status ->
  token:callback_token ->
  execution_id:execution_id ->
  workflow_id:workflow_id ->
  unit ->
  send_workflow_step_state_request

val make_list_tags_for_resource_response :
  ?tags:tags -> ?next_token:next_token -> ?arn:arn -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  arn:arn ->
  unit ->
  list_tags_for_resource_request

val make_list_security_policies_response :
  ?next_token:next_token ->
  security_policy_names:security_policy_names ->
  unit ->
  list_security_policies_response

val make_list_security_policies_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_security_policies_request

val make_listed_host_key :
  ?date_imported:date_imported ->
  ?type_:host_key_type ->
  ?description:host_key_description ->
  ?fingerprint:host_key_fingerprint ->
  ?host_key_id:host_key_id ->
  arn:arn ->
  unit ->
  listed_host_key

val make_list_host_keys_response :
  ?next_token:next_token ->
  host_keys:listed_host_keys ->
  server_id:server_id ->
  unit ->
  list_host_keys_response

val make_list_host_keys_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  server_id:server_id ->
  unit ->
  list_host_keys_request

val make_list_file_transfer_results_response :
  ?next_token:next_token ->
  file_transfer_results:connector_file_transfer_results ->
  unit ->
  list_file_transfer_results_response

val make_list_file_transfer_results_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  transfer_id:transfer_id ->
  connector_id:connector_id ->
  unit ->
  list_file_transfer_results_request

val make_s3_file_location :
  ?etag:s3_etag ->
  ?version_id:s3_version_id ->
  ?key:s3_key ->
  ?bucket:s3_bucket ->
  unit ->
  s3_file_location

val make_file_location :
  ?efs_file_location:efs_file_location ->
  ?s3_file_location:s3_file_location ->
  unit ->
  file_location

val make_service_metadata : user_details:user_details -> unit -> service_metadata

val make_listed_execution :
  ?status:execution_status ->
  ?service_metadata:service_metadata ->
  ?initial_file_location:file_location ->
  ?execution_id:execution_id ->
  unit ->
  listed_execution

val make_list_executions_response :
  ?next_token:next_token ->
  executions:listed_executions ->
  workflow_id:workflow_id ->
  unit ->
  list_executions_response

val make_list_executions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  workflow_id:workflow_id ->
  unit ->
  list_executions_request

val make_listed_access :
  ?external_id:external_id ->
  ?role:role ->
  ?home_directory_type:home_directory_type ->
  ?home_directory:home_directory ->
  unit ->
  listed_access

val make_list_accesses_response :
  ?next_token:next_token ->
  accesses:listed_accesses ->
  server_id:server_id ->
  unit ->
  list_accesses_response

val make_list_accesses_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  server_id:server_id ->
  unit ->
  list_accesses_request

val make_import_ssh_public_key_response :
  user_name:user_name ->
  ssh_public_key_id:ssh_public_key_id ->
  server_id:server_id ->
  unit ->
  import_ssh_public_key_response

val make_import_ssh_public_key_request :
  user_name:user_name ->
  ssh_public_key_body:ssh_public_key_body ->
  server_id:server_id ->
  unit ->
  import_ssh_public_key_request

val make_import_host_key_response :
  host_key_id:host_key_id -> server_id:server_id -> unit -> import_host_key_response

val make_import_host_key_request :
  ?tags:tags ->
  ?description:host_key_description ->
  host_key_body:host_key ->
  server_id:server_id ->
  unit ->
  import_host_key_request

val make_described_security_policy :
  ?protocols:security_policy_protocols ->
  ?type_:security_policy_resource_type ->
  ?ssh_host_key_algorithms:security_policy_options ->
  ?tls_ciphers:security_policy_options ->
  ?ssh_macs:security_policy_options ->
  ?ssh_kexs:security_policy_options ->
  ?ssh_ciphers:security_policy_options ->
  ?fips:fips ->
  security_policy_name:security_policy_name ->
  unit ->
  described_security_policy

val make_describe_security_policy_response :
  security_policy:described_security_policy -> unit -> describe_security_policy_response

val make_describe_security_policy_request :
  security_policy_name:security_policy_name -> unit -> describe_security_policy_request

val make_described_host_key :
  ?tags:tags ->
  ?date_imported:date_imported ->
  ?type_:host_key_type ->
  ?description:host_key_description ->
  ?host_key_fingerprint:host_key_fingerprint ->
  ?host_key_id:host_key_id ->
  arn:arn ->
  unit ->
  described_host_key

val make_describe_host_key_response :
  host_key:described_host_key -> unit -> describe_host_key_response

val make_describe_host_key_request :
  host_key_id:host_key_id -> server_id:server_id -> unit -> describe_host_key_request

val make_logging_configuration :
  ?log_group_name:log_group_name -> ?logging_role:role -> unit -> logging_configuration

val make_execution_error :
  message:execution_error_message -> type_:execution_error_type -> unit -> execution_error

val make_execution_results :
  ?on_exception_steps:execution_step_results ->
  ?steps:execution_step_results ->
  unit ->
  execution_results

val make_described_execution :
  ?results:execution_results ->
  ?status:execution_status ->
  ?posix_profile:posix_profile ->
  ?logging_configuration:logging_configuration ->
  ?execution_role:role ->
  ?service_metadata:service_metadata ->
  ?initial_file_location:file_location ->
  ?execution_id:execution_id ->
  unit ->
  described_execution

val make_describe_execution_response :
  execution:described_execution -> workflow_id:workflow_id -> unit -> describe_execution_response

val make_describe_execution_request :
  workflow_id:workflow_id -> execution_id:execution_id -> unit -> describe_execution_request

val make_described_access :
  ?external_id:external_id ->
  ?role:role ->
  ?posix_profile:posix_profile ->
  ?policy:policy ->
  ?home_directory_type:home_directory_type ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory:home_directory ->
  unit ->
  described_access

val make_describe_access_response :
  access:described_access -> server_id:server_id -> unit -> describe_access_response

val make_describe_access_request :
  external_id:external_id -> server_id:server_id -> unit -> describe_access_request

val make_delete_ssh_public_key_request :
  user_name:user_name ->
  ssh_public_key_id:ssh_public_key_id ->
  server_id:server_id ->
  unit ->
  delete_ssh_public_key_request

val make_delete_host_key_request :
  host_key_id:host_key_id -> server_id:server_id -> unit -> delete_host_key_request

val make_delete_access_request :
  external_id:external_id -> server_id:server_id -> unit -> delete_access_request

val make_create_access_response :
  external_id:external_id -> server_id:server_id -> unit -> create_access_response

val make_create_access_request :
  ?posix_profile:posix_profile ->
  ?policy:policy ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory_type:home_directory_type ->
  ?home_directory:home_directory ->
  external_id:external_id ->
  server_id:server_id ->
  role:role ->
  unit ->
  create_access_request

val make_ssh_public_key :
  ssh_public_key_id:ssh_public_key_id ->
  ssh_public_key_body:ssh_public_key_body ->
  date_imported:date_imported ->
  unit ->
  ssh_public_key

val make_listed_workflow :
  ?arn:arn ->
  ?description:workflow_description ->
  ?workflow_id:workflow_id ->
  unit ->
  listed_workflow

val make_listed_web_app :
  ?endpoint_type:web_app_endpoint_type ->
  ?web_app_endpoint:web_app_endpoint ->
  ?access_endpoint:web_app_access_endpoint ->
  web_app_id:web_app_id ->
  arn:arn ->
  unit ->
  listed_web_app

val make_listed_user :
  ?user_name:user_name ->
  ?ssh_public_key_count:ssh_public_key_count ->
  ?role:role ->
  ?home_directory_type:home_directory_type ->
  ?home_directory:home_directory ->
  arn:arn ->
  unit ->
  listed_user

val make_listed_server :
  ?user_count:user_count ->
  ?state:state ->
  ?server_id:server_id ->
  ?logging_role:role ->
  ?endpoint_type:endpoint_type ->
  ?identity_provider_type:identity_provider_type ->
  ?domain:domain ->
  arn:arn ->
  unit ->
  listed_server

val make_listed_profile :
  ?profile_type:profile_type ->
  ?as2_id:as2_id ->
  ?profile_id:profile_id ->
  ?arn:arn ->
  unit ->
  listed_profile

val make_listed_connector :
  ?url:url -> ?connector_id:connector_id -> ?arn:arn -> unit -> listed_connector

val make_listed_certificate :
  ?description:description ->
  ?type_:certificate_type ->
  ?inactive_date:cert_date ->
  ?active_date:cert_date ->
  ?status:certificate_status_type ->
  ?usage:certificate_usage_type ->
  ?certificate_id:certificate_id ->
  ?arn:arn ->
  unit ->
  listed_certificate

val make_listed_agreement :
  ?partner_profile_id:profile_id ->
  ?local_profile_id:profile_id ->
  ?server_id:server_id ->
  ?status:agreement_status_type ->
  ?description:description ->
  ?agreement_id:agreement_id ->
  ?arn:arn ->
  unit ->
  listed_agreement

val make_list_workflows_response :
  ?next_token:next_token -> workflows:listed_workflows -> unit -> list_workflows_response

val make_list_workflows_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_workflows_request

val make_list_web_apps_response :
  ?next_token:next_token -> web_apps:listed_web_apps -> unit -> list_web_apps_response

val make_list_web_apps_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_web_apps_request

val make_list_users_response :
  ?next_token:next_token -> users:listed_users -> server_id:server_id -> unit -> list_users_response

val make_list_users_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  server_id:server_id ->
  unit ->
  list_users_request

val make_list_servers_response :
  ?next_token:next_token -> servers:listed_servers -> unit -> list_servers_response

val make_list_servers_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_servers_request

val make_list_profiles_response :
  ?next_token:next_token -> profiles:listed_profiles -> unit -> list_profiles_response

val make_list_profiles_request :
  ?profile_type:profile_type ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_profiles_request

val make_list_connectors_response :
  ?next_token:next_token -> connectors:listed_connectors -> unit -> list_connectors_response

val make_list_connectors_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_connectors_request

val make_list_certificates_response :
  ?next_token:next_token -> certificates:listed_certificates -> unit -> list_certificates_response

val make_list_certificates_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_certificates_request

val make_list_agreements_response :
  ?next_token:next_token -> agreements:listed_agreements -> unit -> list_agreements_response

val make_list_agreements_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  server_id:server_id ->
  unit ->
  list_agreements_request

val make_import_certificate_response :
  certificate_id:certificate_id -> unit -> import_certificate_response

val make_import_certificate_request :
  ?tags:tags ->
  ?description:description ->
  ?inactive_date:cert_date ->
  ?active_date:cert_date ->
  ?private_key:private_key_type ->
  ?certificate_chain:certificate_chain_type ->
  certificate:certificate_body_type ->
  usage:certificate_usage_type ->
  unit ->
  import_certificate_request

val make_described_workflow :
  ?tags:tags ->
  ?workflow_id:workflow_id ->
  ?on_exception_steps:workflow_steps ->
  ?steps:workflow_steps ->
  ?description:workflow_description ->
  arn:arn ->
  unit ->
  described_workflow

val make_described_web_app_vpc_config :
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnet_ids ->
  unit ->
  described_web_app_vpc_config

val make_described_identity_center_config :
  ?role:role ->
  ?instance_arn:identity_center_instance_arn ->
  ?application_arn:identity_center_application_arn ->
  unit ->
  described_identity_center_config

val make_described_web_app_customization :
  ?favicon_file:web_app_favicon_file ->
  ?logo_file:web_app_logo_file ->
  ?title:web_app_title ->
  web_app_id:web_app_id ->
  arn:arn ->
  unit ->
  described_web_app_customization

val make_described_web_app :
  ?described_endpoint_details:described_web_app_endpoint_details ->
  ?endpoint_type:web_app_endpoint_type ->
  ?web_app_endpoint_policy:web_app_endpoint_policy ->
  ?tags:tags ->
  ?web_app_units:web_app_units ->
  ?web_app_endpoint:web_app_endpoint ->
  ?access_endpoint:web_app_access_endpoint ->
  ?described_identity_provider_details:described_web_app_identity_provider_details ->
  web_app_id:web_app_id ->
  arn:arn ->
  unit ->
  described_web_app

val make_described_user :
  ?user_name:user_name ->
  ?tags:tags ->
  ?ssh_public_keys:ssh_public_keys ->
  ?role:role ->
  ?posix_profile:posix_profile ->
  ?policy:policy ->
  ?home_directory_type:home_directory_type ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory:home_directory ->
  arn:arn ->
  unit ->
  described_user

val make_described_server :
  ?ip_address_type:ip_address_type ->
  ?as2_service_managed_egress_ip_addresses:service_managed_egress_ip_addresses ->
  ?s3_storage_options:s3_storage_options ->
  ?structured_log_destinations:structured_log_destinations ->
  ?workflow_details:workflow_details ->
  ?user_count:user_count ->
  ?tags:tags ->
  ?state:state ->
  ?server_id:server_id ->
  ?security_policy_name:security_policy_name ->
  ?protocols:protocols ->
  ?pre_authentication_login_banner:pre_authentication_login_banner ->
  ?post_authentication_login_banner:post_authentication_login_banner ->
  ?logging_role:nullable_role ->
  ?identity_provider_type:identity_provider_type ->
  ?identity_provider_details:identity_provider_details ->
  ?host_key_fingerprint:host_key_fingerprint ->
  ?endpoint_type:endpoint_type ->
  ?endpoint_details:endpoint_details ->
  ?domain:domain ->
  ?protocol_details:protocol_details ->
  ?certificate:certificate ->
  arn:arn ->
  unit ->
  described_server

val make_described_profile :
  ?tags:tags ->
  ?certificate_ids:certificate_ids ->
  ?as2_id:as2_id ->
  ?profile_type:profile_type ->
  ?profile_id:profile_id ->
  arn:arn ->
  unit ->
  described_profile

val make_described_connector_vpc_lattice_egress_config :
  ?port_number:sftp_port ->
  resource_configuration_arn:vpc_lattice_resource_configuration_arn ->
  unit ->
  described_connector_vpc_lattice_egress_config

val make_described_connector :
  ?ip_address_type:connectors_ip_address_type ->
  ?error_message:connector_error_message ->
  ?egress_config:described_connector_egress_config ->
  ?security_policy_name:connector_security_policy_name ->
  ?service_managed_egress_ip_addresses:service_managed_egress_ip_addresses ->
  ?sftp_config:sftp_connector_config ->
  ?tags:tags ->
  ?logging_role:role ->
  ?access_role:role ->
  ?as2_config:as2_connector_config ->
  ?url:url ->
  ?connector_id:connector_id ->
  status:connector_status ->
  egress_type:connector_egress_type ->
  arn:arn ->
  unit ->
  described_connector

val make_described_certificate :
  ?tags:tags ->
  ?description:description ->
  ?type_:certificate_type ->
  ?not_after_date:cert_date ->
  ?not_before_date:cert_date ->
  ?serial:cert_serial ->
  ?inactive_date:cert_date ->
  ?active_date:cert_date ->
  ?certificate_chain:certificate_chain_type ->
  ?certificate:certificate_body_type ->
  ?status:certificate_status_type ->
  ?usage:certificate_usage_type ->
  ?certificate_id:certificate_id ->
  arn:arn ->
  unit ->
  described_certificate

val make_described_agreement :
  ?custom_directories:custom_directories_type ->
  ?enforce_message_signing:enforce_message_signing_type ->
  ?preserve_filename:preserve_filename_type ->
  ?tags:tags ->
  ?access_role:role ->
  ?base_directory:home_directory ->
  ?partner_profile_id:profile_id ->
  ?local_profile_id:profile_id ->
  ?server_id:server_id ->
  ?status:agreement_status_type ->
  ?description:description ->
  ?agreement_id:agreement_id ->
  arn:arn ->
  unit ->
  described_agreement

val make_describe_workflow_response :
  workflow:described_workflow -> unit -> describe_workflow_response

val make_describe_workflow_request : workflow_id:workflow_id -> unit -> describe_workflow_request
val make_describe_web_app_response : web_app:described_web_app -> unit -> describe_web_app_response
val make_describe_web_app_request : web_app_id:web_app_id -> unit -> describe_web_app_request

val make_describe_web_app_customization_response :
  web_app_customization:described_web_app_customization ->
  unit ->
  describe_web_app_customization_response

val make_describe_web_app_customization_request :
  web_app_id:web_app_id -> unit -> describe_web_app_customization_request

val make_describe_user_response :
  user:described_user -> server_id:server_id -> unit -> describe_user_response

val make_describe_user_request :
  user_name:user_name -> server_id:server_id -> unit -> describe_user_request

val make_describe_server_response : server:described_server -> unit -> describe_server_response
val make_describe_server_request : server_id:server_id -> unit -> describe_server_request
val make_describe_profile_response : profile:described_profile -> unit -> describe_profile_response
val make_describe_profile_request : profile_id:profile_id -> unit -> describe_profile_request

val make_describe_connector_response :
  connector:described_connector -> unit -> describe_connector_response

val make_describe_connector_request :
  connector_id:connector_id -> unit -> describe_connector_request

val make_describe_certificate_response :
  certificate:described_certificate -> unit -> describe_certificate_response

val make_describe_certificate_request :
  certificate_id:certificate_id -> unit -> describe_certificate_request

val make_describe_agreement_response :
  agreement:described_agreement -> unit -> describe_agreement_response

val make_describe_agreement_request :
  server_id:server_id -> agreement_id:agreement_id -> unit -> describe_agreement_request

val make_delete_workflow_request : workflow_id:workflow_id -> unit -> delete_workflow_request
val make_delete_web_app_request : web_app_id:web_app_id -> unit -> delete_web_app_request

val make_delete_web_app_customization_request :
  web_app_id:web_app_id -> unit -> delete_web_app_customization_request

val make_delete_user_request :
  user_name:user_name -> server_id:server_id -> unit -> delete_user_request

val make_delete_server_request : server_id:server_id -> unit -> delete_server_request
val make_delete_profile_request : profile_id:profile_id -> unit -> delete_profile_request
val make_delete_connector_request : connector_id:connector_id -> unit -> delete_connector_request

val make_delete_certificate_request :
  certificate_id:certificate_id -> unit -> delete_certificate_request

val make_delete_agreement_request :
  server_id:server_id -> agreement_id:agreement_id -> unit -> delete_agreement_request

val make_create_workflow_response : workflow_id:workflow_id -> unit -> create_workflow_response

val make_create_workflow_request :
  ?tags:tags ->
  ?on_exception_steps:workflow_steps ->
  ?description:workflow_description ->
  steps:workflow_steps ->
  unit ->
  create_workflow_request

val make_create_web_app_response : web_app_id:web_app_id -> unit -> create_web_app_response

val make_create_web_app_request :
  ?endpoint_details:web_app_endpoint_details ->
  ?web_app_endpoint_policy:web_app_endpoint_policy ->
  ?tags:tags ->
  ?web_app_units:web_app_units ->
  ?access_endpoint:web_app_access_endpoint ->
  identity_provider_details:web_app_identity_provider_details ->
  unit ->
  create_web_app_request

val make_create_user_response :
  user_name:user_name -> server_id:server_id -> unit -> create_user_response

val make_create_user_request :
  ?tags:tags ->
  ?ssh_public_key_body:ssh_public_key_body ->
  ?posix_profile:posix_profile ->
  ?policy:policy ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory_type:home_directory_type ->
  ?home_directory:home_directory ->
  user_name:user_name ->
  server_id:server_id ->
  role:role ->
  unit ->
  create_user_request

val make_create_server_response : server_id:server_id -> unit -> create_server_response

val make_create_server_request :
  ?ip_address_type:ip_address_type ->
  ?s3_storage_options:s3_storage_options ->
  ?structured_log_destinations:structured_log_destinations ->
  ?workflow_details:workflow_details ->
  ?tags:tags ->
  ?security_policy_name:security_policy_name ->
  ?protocol_details:protocol_details ->
  ?protocols:protocols ->
  ?pre_authentication_login_banner:pre_authentication_login_banner ->
  ?post_authentication_login_banner:post_authentication_login_banner ->
  ?logging_role:nullable_role ->
  ?identity_provider_type:identity_provider_type ->
  ?identity_provider_details:identity_provider_details ->
  ?host_key:host_key ->
  ?endpoint_type:endpoint_type ->
  ?endpoint_details:endpoint_details ->
  ?domain:domain ->
  ?certificate:certificate ->
  unit ->
  create_server_request

val make_create_profile_response : profile_id:profile_id -> unit -> create_profile_response

val make_create_profile_request :
  ?tags:tags ->
  ?certificate_ids:certificate_ids ->
  profile_type:profile_type ->
  as2_id:as2_id ->
  unit ->
  create_profile_request

val make_create_connector_response : connector_id:connector_id -> unit -> create_connector_response

val make_connector_vpc_lattice_egress_config :
  ?port_number:sftp_port ->
  resource_configuration_arn:vpc_lattice_resource_configuration_arn ->
  unit ->
  connector_vpc_lattice_egress_config

val make_create_connector_request :
  ?ip_address_type:connectors_ip_address_type ->
  ?egress_config:connector_egress_config ->
  ?security_policy_name:connector_security_policy_name ->
  ?sftp_config:sftp_connector_config ->
  ?tags:tags ->
  ?logging_role:role ->
  ?as2_config:as2_connector_config ->
  ?url:url ->
  access_role:role ->
  unit ->
  create_connector_request

val make_create_agreement_response : agreement_id:agreement_id -> unit -> create_agreement_response

val make_create_agreement_request :
  ?custom_directories:custom_directories_type ->
  ?enforce_message_signing:enforce_message_signing_type ->
  ?preserve_filename:preserve_filename_type ->
  ?tags:tags ->
  ?status:agreement_status_type ->
  ?base_directory:home_directory ->
  ?description:description ->
  access_role:role ->
  partner_profile_id:profile_id ->
  local_profile_id:profile_id ->
  server_id:server_id ->
  unit ->
  create_agreement_request
