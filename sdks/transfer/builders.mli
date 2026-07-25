open Types

val make_as2_async_mdn_connector_config :
  ?url:url -> ?server_ids:as2_async_mdn_server_ids -> unit -> as2_async_mdn_connector_config

val make_as2_connector_config :
  ?local_profile_id:profile_id ->
  ?partner_profile_id:profile_id ->
  ?message_subject:message_subject ->
  ?compression:compression_enum ->
  ?encryption_algorithm:encryption_alg ->
  ?signing_algorithm:signing_alg ->
  ?mdn_signing_algorithm:mdn_signing_alg ->
  ?mdn_response:mdn_response ->
  ?basic_auth_secret_id:as2_connector_secret_id ->
  ?preserve_content_type:preserve_content_type ->
  ?async_mdn_config:as2_async_mdn_connector_config ->
  unit ->
  as2_connector_config

val make_connector_vpc_lattice_egress_config :
  ?port_number:sftp_port ->
  resource_configuration_arn:vpc_lattice_resource_configuration_arn ->
  unit ->
  connector_vpc_lattice_egress_config

val make_efs_file_location :
  ?file_system_id:efs_file_system_id -> ?path:efs_path -> unit -> efs_file_location

val make_s3_input_file_location : ?bucket:s3_bucket -> ?key:s3_key -> unit -> s3_input_file_location

val make_input_file_location :
  ?s3_file_location:s3_input_file_location ->
  ?efs_file_location:efs_file_location ->
  unit ->
  input_file_location

val make_copy_step_details :
  ?name:workflow_step_name ->
  ?destination_file_location:input_file_location ->
  ?overwrite_existing:overwrite_existing ->
  ?source_file_location:source_file_location ->
  unit ->
  copy_step_details

val make_create_access_response :
  server_id:server_id -> external_id:external_id -> unit -> create_access_response

val make_posix_profile :
  ?secondary_gids:secondary_gids -> uid:posix_id -> gid:posix_id -> unit -> posix_profile

val make_home_directory_map_entry :
  ?type_:map_type -> entry:map_entry -> target:map_target -> unit -> home_directory_map_entry

val make_create_access_request :
  ?home_directory:home_directory ->
  ?home_directory_type:home_directory_type ->
  ?home_directory_mappings:home_directory_mappings ->
  ?policy:policy ->
  ?posix_profile:posix_profile ->
  role:role ->
  server_id:server_id ->
  external_id:external_id ->
  unit ->
  create_access_request

val make_create_agreement_response : agreement_id:agreement_id -> unit -> create_agreement_response

val make_custom_directories_type :
  failed_files_directory:home_directory ->
  mdn_files_directory:home_directory ->
  payload_files_directory:home_directory ->
  status_files_directory:home_directory ->
  temporary_files_directory:home_directory ->
  unit ->
  custom_directories_type

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_agreement_request :
  ?description:description ->
  ?base_directory:home_directory ->
  ?status:agreement_status_type ->
  ?tags:tags ->
  ?preserve_filename:preserve_filename_type ->
  ?enforce_message_signing:enforce_message_signing_type ->
  ?custom_directories:custom_directories_type ->
  server_id:server_id ->
  local_profile_id:profile_id ->
  partner_profile_id:profile_id ->
  access_role:role ->
  unit ->
  create_agreement_request

val make_create_connector_response : connector_id:connector_id -> unit -> create_connector_response

val make_sftp_connector_config :
  ?user_secret_id:secret_id ->
  ?trusted_host_keys:sftp_connector_trusted_host_key_list ->
  ?max_concurrent_connections:max_concurrent_connections ->
  unit ->
  sftp_connector_config

val make_create_connector_request :
  ?url:url ->
  ?as2_config:as2_connector_config ->
  ?logging_role:role ->
  ?tags:tags ->
  ?sftp_config:sftp_connector_config ->
  ?security_policy_name:connector_security_policy_name ->
  ?egress_config:connector_egress_config ->
  ?ip_address_type:connectors_ip_address_type ->
  access_role:role ->
  unit ->
  create_connector_request

val make_create_profile_response : profile_id:profile_id -> unit -> create_profile_response

val make_create_profile_request :
  ?certificate_ids:certificate_ids ->
  ?tags:tags ->
  as2_id:as2_id ->
  profile_type:profile_type ->
  unit ->
  create_profile_request

val make_create_server_response : server_id:server_id -> unit -> create_server_response

val make_s3_storage_options :
  ?directory_listing_optimization:directory_listing_optimization -> unit -> s3_storage_options

val make_workflow_detail : workflow_id:workflow_id -> execution_role:role -> unit -> workflow_detail

val make_workflow_details :
  ?on_upload:on_upload_workflow_details ->
  ?on_partial_upload:on_partial_upload_workflow_details ->
  unit ->
  workflow_details

val make_protocol_details :
  ?passive_ip:passive_ip ->
  ?tls_session_resumption_mode:tls_session_resumption_mode ->
  ?set_stat_option:set_stat_option ->
  ?as2_transports:as2_transports ->
  unit ->
  protocol_details

val make_identity_provider_details :
  ?url:url ->
  ?invocation_role:role ->
  ?directory_id:directory_id ->
  ?\#function:\#function ->
  ?sftp_authentication_methods:sftp_authentication_methods ->
  unit ->
  identity_provider_details

val make_endpoint_details :
  ?address_allocation_ids:address_allocation_ids ->
  ?subnet_ids:subnet_ids ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  ?vpc_id:vpc_id ->
  ?security_group_ids:security_group_ids ->
  unit ->
  endpoint_details

val make_create_server_request :
  ?certificate:certificate ->
  ?domain:domain ->
  ?endpoint_details:endpoint_details ->
  ?endpoint_type:endpoint_type ->
  ?host_key:host_key ->
  ?identity_provider_details:identity_provider_details ->
  ?identity_provider_type:identity_provider_type ->
  ?logging_role:nullable_role ->
  ?post_authentication_login_banner:post_authentication_login_banner ->
  ?pre_authentication_login_banner:pre_authentication_login_banner ->
  ?protocols:protocols ->
  ?protocol_details:protocol_details ->
  ?security_policy_name:security_policy_name ->
  ?tags:tags ->
  ?workflow_details:workflow_details ->
  ?structured_log_destinations:structured_log_destinations ->
  ?s3_storage_options:s3_storage_options ->
  ?ip_address_type:ip_address_type ->
  unit ->
  create_server_request

val make_create_user_response :
  server_id:server_id -> user_name:user_name -> unit -> create_user_response

val make_create_user_request :
  ?home_directory:home_directory ->
  ?home_directory_type:home_directory_type ->
  ?home_directory_mappings:home_directory_mappings ->
  ?policy:policy ->
  ?posix_profile:posix_profile ->
  ?ssh_public_key_body:ssh_public_key_body ->
  ?tags:tags ->
  role:role ->
  server_id:server_id ->
  user_name:user_name ->
  unit ->
  create_user_request

val make_create_web_app_response : web_app_id:web_app_id -> unit -> create_web_app_response

val make_web_app_vpc_config :
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  ?security_group_ids:security_group_ids ->
  ?ip_address_type:web_app_vpc_endpoint_ip_address_type ->
  unit ->
  web_app_vpc_config

val make_identity_center_config :
  ?instance_arn:identity_center_instance_arn -> ?role:role -> unit -> identity_center_config

val make_create_web_app_request :
  ?access_endpoint:web_app_access_endpoint ->
  ?web_app_units:web_app_units ->
  ?tags:tags ->
  ?web_app_endpoint_policy:web_app_endpoint_policy ->
  ?endpoint_details:web_app_endpoint_details ->
  identity_provider_details:web_app_identity_provider_details ->
  unit ->
  create_web_app_request

val make_create_workflow_response : workflow_id:workflow_id -> unit -> create_workflow_response

val make_decrypt_step_details :
  ?name:workflow_step_name ->
  ?source_file_location:source_file_location ->
  ?overwrite_existing:overwrite_existing ->
  type_:encryption_type ->
  destination_file_location:input_file_location ->
  unit ->
  decrypt_step_details

val make_s3_tag : key:s3_tag_key -> value:s3_tag_value -> unit -> s3_tag

val make_tag_step_details :
  ?name:workflow_step_name ->
  ?tags:s3_tags ->
  ?source_file_location:source_file_location ->
  unit ->
  tag_step_details

val make_delete_step_details :
  ?name:workflow_step_name ->
  ?source_file_location:source_file_location ->
  unit ->
  delete_step_details

val make_custom_step_details :
  ?name:workflow_step_name ->
  ?target:custom_step_target ->
  ?timeout_seconds:custom_step_timeout_seconds ->
  ?source_file_location:source_file_location ->
  unit ->
  custom_step_details

val make_workflow_step :
  ?type_:workflow_step_type ->
  ?copy_step_details:copy_step_details ->
  ?custom_step_details:custom_step_details ->
  ?delete_step_details:delete_step_details ->
  ?tag_step_details:tag_step_details ->
  ?decrypt_step_details:decrypt_step_details ->
  unit ->
  workflow_step

val make_create_workflow_request :
  ?description:workflow_description ->
  ?on_exception_steps:workflow_steps ->
  ?tags:tags ->
  steps:workflow_steps ->
  unit ->
  create_workflow_request

val make_custom_http_header :
  ?key:custom_http_header_key_type ->
  ?value:custom_http_header_value_type ->
  unit ->
  custom_http_header

val make_delete_access_request :
  server_id:server_id -> external_id:external_id -> unit -> delete_access_request

val make_delete_agreement_request :
  agreement_id:agreement_id -> server_id:server_id -> unit -> delete_agreement_request

val make_delete_certificate_request :
  certificate_id:certificate_id -> unit -> delete_certificate_request

val make_delete_connector_request : connector_id:connector_id -> unit -> delete_connector_request

val make_delete_host_key_request :
  server_id:server_id -> host_key_id:host_key_id -> unit -> delete_host_key_request

val make_delete_profile_request : profile_id:profile_id -> unit -> delete_profile_request
val make_delete_server_request : server_id:server_id -> unit -> delete_server_request

val make_delete_ssh_public_key_request :
  server_id:server_id ->
  ssh_public_key_id:ssh_public_key_id ->
  user_name:user_name ->
  unit ->
  delete_ssh_public_key_request

val make_delete_user_request :
  server_id:server_id -> user_name:user_name -> unit -> delete_user_request

val make_delete_web_app_request : web_app_id:web_app_id -> unit -> delete_web_app_request

val make_delete_web_app_customization_request :
  web_app_id:web_app_id -> unit -> delete_web_app_customization_request

val make_delete_workflow_request : workflow_id:workflow_id -> unit -> delete_workflow_request

val make_described_access :
  ?home_directory:home_directory ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory_type:home_directory_type ->
  ?policy:policy ->
  ?posix_profile:posix_profile ->
  ?role:role ->
  ?external_id:external_id ->
  unit ->
  described_access

val make_describe_access_response :
  server_id:server_id -> access:described_access -> unit -> describe_access_response

val make_describe_access_request :
  server_id:server_id -> external_id:external_id -> unit -> describe_access_request

val make_described_agreement :
  ?agreement_id:agreement_id ->
  ?description:description ->
  ?status:agreement_status_type ->
  ?server_id:server_id ->
  ?local_profile_id:profile_id ->
  ?partner_profile_id:profile_id ->
  ?base_directory:home_directory ->
  ?access_role:role ->
  ?tags:tags ->
  ?preserve_filename:preserve_filename_type ->
  ?enforce_message_signing:enforce_message_signing_type ->
  ?custom_directories:custom_directories_type ->
  arn:arn ->
  unit ->
  described_agreement

val make_describe_agreement_response :
  agreement:described_agreement -> unit -> describe_agreement_response

val make_describe_agreement_request :
  agreement_id:agreement_id -> server_id:server_id -> unit -> describe_agreement_request

val make_described_certificate :
  ?certificate_id:certificate_id ->
  ?usage:certificate_usage_type ->
  ?status:certificate_status_type ->
  ?certificate:certificate_body_type ->
  ?certificate_chain:certificate_chain_type ->
  ?active_date:cert_date ->
  ?inactive_date:cert_date ->
  ?serial:cert_serial ->
  ?not_before_date:cert_date ->
  ?not_after_date:cert_date ->
  ?type_:certificate_type ->
  ?description:description ->
  ?tags:tags ->
  arn:arn ->
  unit ->
  described_certificate

val make_describe_certificate_response :
  certificate:described_certificate -> unit -> describe_certificate_response

val make_describe_certificate_request :
  certificate_id:certificate_id -> unit -> describe_certificate_request

val make_described_connector_vpc_lattice_egress_config :
  ?port_number:sftp_port ->
  resource_configuration_arn:vpc_lattice_resource_configuration_arn ->
  unit ->
  described_connector_vpc_lattice_egress_config

val make_described_connector :
  ?connector_id:connector_id ->
  ?url:url ->
  ?as2_config:as2_connector_config ->
  ?access_role:role ->
  ?logging_role:role ->
  ?tags:tags ->
  ?sftp_config:sftp_connector_config ->
  ?service_managed_egress_ip_addresses:service_managed_egress_ip_addresses ->
  ?security_policy_name:connector_security_policy_name ->
  ?egress_config:described_connector_egress_config ->
  ?error_message:connector_error_message ->
  ?ip_address_type:connectors_ip_address_type ->
  arn:arn ->
  egress_type:connector_egress_type ->
  status:connector_status ->
  unit ->
  described_connector

val make_describe_connector_response :
  connector:described_connector -> unit -> describe_connector_response

val make_describe_connector_request :
  connector_id:connector_id -> unit -> describe_connector_request

val make_execution_error :
  type_:execution_error_type -> message:execution_error_message -> unit -> execution_error

val make_execution_results :
  ?steps:execution_step_results ->
  ?on_exception_steps:execution_step_results ->
  unit ->
  execution_results

val make_logging_configuration :
  ?logging_role:role -> ?log_group_name:log_group_name -> unit -> logging_configuration

val make_user_details :
  ?session_id:session_id -> user_name:user_name -> server_id:server_id -> unit -> user_details

val make_service_metadata : user_details:user_details -> unit -> service_metadata

val make_s3_file_location :
  ?bucket:s3_bucket ->
  ?key:s3_key ->
  ?version_id:s3_version_id ->
  ?etag:s3_etag ->
  unit ->
  s3_file_location

val make_file_location :
  ?s3_file_location:s3_file_location ->
  ?efs_file_location:efs_file_location ->
  unit ->
  file_location

val make_described_execution :
  ?execution_id:execution_id ->
  ?initial_file_location:file_location ->
  ?service_metadata:service_metadata ->
  ?execution_role:role ->
  ?logging_configuration:logging_configuration ->
  ?posix_profile:posix_profile ->
  ?status:execution_status ->
  ?results:execution_results ->
  unit ->
  described_execution

val make_describe_execution_response :
  workflow_id:workflow_id -> execution:described_execution -> unit -> describe_execution_response

val make_describe_execution_request :
  execution_id:execution_id -> workflow_id:workflow_id -> unit -> describe_execution_request

val make_described_host_key :
  ?host_key_id:host_key_id ->
  ?host_key_fingerprint:host_key_fingerprint ->
  ?description:host_key_description ->
  ?type_:host_key_type ->
  ?date_imported:date_imported ->
  ?tags:tags ->
  arn:arn ->
  unit ->
  described_host_key

val make_describe_host_key_response :
  host_key:described_host_key -> unit -> describe_host_key_response

val make_describe_host_key_request :
  server_id:server_id -> host_key_id:host_key_id -> unit -> describe_host_key_request

val make_described_profile :
  ?profile_id:profile_id ->
  ?profile_type:profile_type ->
  ?as2_id:as2_id ->
  ?certificate_ids:certificate_ids ->
  ?tags:tags ->
  arn:arn ->
  unit ->
  described_profile

val make_describe_profile_response : profile:described_profile -> unit -> describe_profile_response
val make_describe_profile_request : profile_id:profile_id -> unit -> describe_profile_request

val make_described_security_policy :
  ?fips:fips ->
  ?ssh_ciphers:security_policy_options ->
  ?ssh_kexs:security_policy_options ->
  ?ssh_macs:security_policy_options ->
  ?tls_ciphers:security_policy_options ->
  ?ssh_host_key_algorithms:security_policy_options ->
  ?type_:security_policy_resource_type ->
  ?protocols:security_policy_protocols ->
  security_policy_name:security_policy_name ->
  unit ->
  described_security_policy

val make_describe_security_policy_response :
  security_policy:described_security_policy -> unit -> describe_security_policy_response

val make_describe_security_policy_request :
  security_policy_name:security_policy_name -> unit -> describe_security_policy_request

val make_described_server :
  ?certificate:certificate ->
  ?protocol_details:protocol_details ->
  ?domain:domain ->
  ?endpoint_details:endpoint_details ->
  ?endpoint_type:endpoint_type ->
  ?host_key_fingerprint:host_key_fingerprint ->
  ?identity_provider_details:identity_provider_details ->
  ?identity_provider_type:identity_provider_type ->
  ?logging_role:nullable_role ->
  ?post_authentication_login_banner:post_authentication_login_banner ->
  ?pre_authentication_login_banner:pre_authentication_login_banner ->
  ?protocols:protocols ->
  ?security_policy_name:security_policy_name ->
  ?server_id:server_id ->
  ?state:state ->
  ?tags:tags ->
  ?user_count:user_count ->
  ?workflow_details:workflow_details ->
  ?structured_log_destinations:structured_log_destinations ->
  ?s3_storage_options:s3_storage_options ->
  ?as2_service_managed_egress_ip_addresses:service_managed_egress_ip_addresses ->
  ?ip_address_type:ip_address_type ->
  arn:arn ->
  unit ->
  described_server

val make_describe_server_response : server:described_server -> unit -> describe_server_response
val make_describe_server_request : server_id:server_id -> unit -> describe_server_request

val make_ssh_public_key :
  date_imported:date_imported ->
  ssh_public_key_body:ssh_public_key_body ->
  ssh_public_key_id:ssh_public_key_id ->
  unit ->
  ssh_public_key

val make_described_user :
  ?home_directory:home_directory ->
  ?home_directory_mappings:home_directory_mappings ->
  ?home_directory_type:home_directory_type ->
  ?policy:policy ->
  ?posix_profile:posix_profile ->
  ?role:role ->
  ?ssh_public_keys:ssh_public_keys ->
  ?tags:tags ->
  ?user_name:user_name ->
  arn:arn ->
  unit ->
  described_user

val make_describe_user_response :
  server_id:server_id -> user:described_user -> unit -> describe_user_response

val make_describe_user_request :
  server_id:server_id -> user_name:user_name -> unit -> describe_user_request

val make_described_web_app_vpc_config :
  ?subnet_ids:subnet_ids ->
  ?vpc_id:vpc_id ->
  ?vpc_endpoint_id:vpc_endpoint_id ->
  unit ->
  described_web_app_vpc_config

val make_described_identity_center_config :
  ?application_arn:identity_center_application_arn ->
  ?instance_arn:identity_center_instance_arn ->
  ?role:role ->
  unit ->
  described_identity_center_config

val make_described_web_app :
  ?described_identity_provider_details:described_web_app_identity_provider_details ->
  ?access_endpoint:web_app_access_endpoint ->
  ?web_app_endpoint:web_app_endpoint ->
  ?web_app_units:web_app_units ->
  ?tags:tags ->
  ?web_app_endpoint_policy:web_app_endpoint_policy ->
  ?endpoint_type:web_app_endpoint_type ->
  ?described_endpoint_details:described_web_app_endpoint_details ->
  arn:arn ->
  web_app_id:web_app_id ->
  unit ->
  described_web_app

val make_describe_web_app_response : web_app:described_web_app -> unit -> describe_web_app_response
val make_describe_web_app_request : web_app_id:web_app_id -> unit -> describe_web_app_request

val make_described_web_app_customization :
  ?title:web_app_title ->
  ?logo_file:web_app_logo_file ->
  ?favicon_file:web_app_favicon_file ->
  arn:arn ->
  web_app_id:web_app_id ->
  unit ->
  described_web_app_customization

val make_describe_web_app_customization_response :
  web_app_customization:described_web_app_customization ->
  unit ->
  describe_web_app_customization_response

val make_describe_web_app_customization_request :
  web_app_id:web_app_id -> unit -> describe_web_app_customization_request

val make_described_workflow :
  ?description:workflow_description ->
  ?steps:workflow_steps ->
  ?on_exception_steps:workflow_steps ->
  ?workflow_id:workflow_id ->
  ?tags:tags ->
  arn:arn ->
  unit ->
  described_workflow

val make_describe_workflow_response :
  workflow:described_workflow -> unit -> describe_workflow_response

val make_describe_workflow_request : workflow_id:workflow_id -> unit -> describe_workflow_request

val make_import_certificate_response :
  certificate_id:certificate_id -> unit -> import_certificate_response

val make_import_certificate_request :
  ?certificate_chain:certificate_chain_type ->
  ?private_key:private_key_type ->
  ?active_date:cert_date ->
  ?inactive_date:cert_date ->
  ?description:description ->
  ?tags:tags ->
  usage:certificate_usage_type ->
  certificate:certificate_body_type ->
  unit ->
  import_certificate_request

val make_import_host_key_response :
  server_id:server_id -> host_key_id:host_key_id -> unit -> import_host_key_response

val make_import_host_key_request :
  ?description:host_key_description ->
  ?tags:tags ->
  server_id:server_id ->
  host_key_body:host_key ->
  unit ->
  import_host_key_request

val make_import_ssh_public_key_response :
  server_id:server_id ->
  ssh_public_key_id:ssh_public_key_id ->
  user_name:user_name ->
  unit ->
  import_ssh_public_key_response

val make_import_ssh_public_key_request :
  server_id:server_id ->
  ssh_public_key_body:ssh_public_key_body ->
  user_name:user_name ->
  unit ->
  import_ssh_public_key_request

val make_listed_access :
  ?home_directory:home_directory ->
  ?home_directory_type:home_directory_type ->
  ?role:role ->
  ?external_id:external_id ->
  unit ->
  listed_access

val make_list_accesses_response :
  ?next_token:next_token ->
  server_id:server_id ->
  accesses:listed_accesses ->
  unit ->
  list_accesses_response

val make_list_accesses_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  server_id:server_id ->
  unit ->
  list_accesses_request

val make_listed_agreement :
  ?arn:arn ->
  ?agreement_id:agreement_id ->
  ?description:description ->
  ?status:agreement_status_type ->
  ?server_id:server_id ->
  ?local_profile_id:profile_id ->
  ?partner_profile_id:profile_id ->
  unit ->
  listed_agreement

val make_list_agreements_response :
  ?next_token:next_token -> agreements:listed_agreements -> unit -> list_agreements_response

val make_list_agreements_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  server_id:server_id ->
  unit ->
  list_agreements_request

val make_listed_certificate :
  ?arn:arn ->
  ?certificate_id:certificate_id ->
  ?usage:certificate_usage_type ->
  ?status:certificate_status_type ->
  ?active_date:cert_date ->
  ?inactive_date:cert_date ->
  ?type_:certificate_type ->
  ?description:description ->
  unit ->
  listed_certificate

val make_list_certificates_response :
  ?next_token:next_token -> certificates:listed_certificates -> unit -> list_certificates_response

val make_list_certificates_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_certificates_request

val make_listed_connector :
  ?arn:arn -> ?connector_id:connector_id -> ?url:url -> unit -> listed_connector

val make_list_connectors_response :
  ?next_token:next_token -> connectors:listed_connectors -> unit -> list_connectors_response

val make_list_connectors_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_connectors_request

val make_listed_execution :
  ?execution_id:execution_id ->
  ?initial_file_location:file_location ->
  ?service_metadata:service_metadata ->
  ?status:execution_status ->
  unit ->
  listed_execution

val make_list_executions_response :
  ?next_token:next_token ->
  workflow_id:workflow_id ->
  executions:listed_executions ->
  unit ->
  list_executions_response

val make_list_executions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  workflow_id:workflow_id ->
  unit ->
  list_executions_request

val make_list_file_transfer_results_response :
  ?next_token:next_token ->
  file_transfer_results:connector_file_transfer_results ->
  unit ->
  list_file_transfer_results_response

val make_list_file_transfer_results_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  connector_id:connector_id ->
  transfer_id:transfer_id ->
  unit ->
  list_file_transfer_results_request

val make_listed_host_key :
  ?host_key_id:host_key_id ->
  ?fingerprint:host_key_fingerprint ->
  ?description:host_key_description ->
  ?type_:host_key_type ->
  ?date_imported:date_imported ->
  arn:arn ->
  unit ->
  listed_host_key

val make_list_host_keys_response :
  ?next_token:next_token ->
  server_id:server_id ->
  host_keys:listed_host_keys ->
  unit ->
  list_host_keys_response

val make_list_host_keys_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  server_id:server_id ->
  unit ->
  list_host_keys_request

val make_listed_profile :
  ?arn:arn ->
  ?profile_id:profile_id ->
  ?as2_id:as2_id ->
  ?profile_type:profile_type ->
  unit ->
  listed_profile

val make_list_profiles_response :
  ?next_token:next_token -> profiles:listed_profiles -> unit -> list_profiles_response

val make_list_profiles_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?profile_type:profile_type ->
  unit ->
  list_profiles_request

val make_list_security_policies_response :
  ?next_token:next_token ->
  security_policy_names:security_policy_names ->
  unit ->
  list_security_policies_response

val make_list_security_policies_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_security_policies_request

val make_listed_server :
  ?domain:domain ->
  ?identity_provider_type:identity_provider_type ->
  ?endpoint_type:endpoint_type ->
  ?logging_role:role ->
  ?server_id:server_id ->
  ?state:state ->
  ?user_count:user_count ->
  arn:arn ->
  unit ->
  listed_server

val make_list_servers_response :
  ?next_token:next_token -> servers:listed_servers -> unit -> list_servers_response

val make_list_servers_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_servers_request

val make_list_tags_for_resource_response :
  ?arn:arn -> ?next_token:next_token -> ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  arn:arn ->
  unit ->
  list_tags_for_resource_request

val make_listed_user :
  ?home_directory:home_directory ->
  ?home_directory_type:home_directory_type ->
  ?role:role ->
  ?ssh_public_key_count:ssh_public_key_count ->
  ?user_name:user_name ->
  arn:arn ->
  unit ->
  listed_user

val make_list_users_response :
  ?next_token:next_token -> server_id:server_id -> users:listed_users -> unit -> list_users_response

val make_list_users_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  server_id:server_id ->
  unit ->
  list_users_request

val make_listed_web_app :
  ?access_endpoint:web_app_access_endpoint ->
  ?web_app_endpoint:web_app_endpoint ->
  ?endpoint_type:web_app_endpoint_type ->
  arn:arn ->
  web_app_id:web_app_id ->
  unit ->
  listed_web_app

val make_list_web_apps_response :
  ?next_token:next_token -> web_apps:listed_web_apps -> unit -> list_web_apps_response

val make_list_web_apps_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_web_apps_request

val make_listed_workflow :
  ?workflow_id:workflow_id ->
  ?description:workflow_description ->
  ?arn:arn ->
  unit ->
  listed_workflow

val make_list_workflows_response :
  ?next_token:next_token -> workflows:listed_workflows -> unit -> list_workflows_response

val make_list_workflows_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_workflows_request

val make_send_workflow_step_state_response : unit -> unit

val make_send_workflow_step_state_request :
  workflow_id:workflow_id ->
  execution_id:execution_id ->
  token:callback_token ->
  status:custom_step_status ->
  unit ->
  send_workflow_step_state_request

val make_sftp_connector_connection_details :
  ?host_key:sftp_connector_host_key -> unit -> sftp_connector_connection_details

val make_start_directory_listing_response :
  listing_id:listing_id ->
  output_file_name:output_file_name ->
  unit ->
  start_directory_listing_response

val make_start_directory_listing_request :
  ?max_items:max_items ->
  connector_id:connector_id ->
  remote_directory_path:file_path ->
  output_directory_path:file_path ->
  unit ->
  start_directory_listing_request

val make_start_file_transfer_response :
  transfer_id:transfer_id -> unit -> start_file_transfer_response

val make_start_file_transfer_request :
  ?send_file_paths:file_paths ->
  ?retrieve_file_paths:file_paths ->
  ?local_directory_path:file_path ->
  ?remote_directory_path:file_path ->
  ?custom_http_headers:custom_http_headers ->
  connector_id:connector_id ->
  unit ->
  start_file_transfer_request

val make_start_remote_delete_response : delete_id:delete_id -> unit -> start_remote_delete_response

val make_start_remote_delete_request :
  connector_id:connector_id -> delete_path:file_path -> unit -> start_remote_delete_request

val make_start_remote_move_response : move_id:move_id -> unit -> start_remote_move_response

val make_start_remote_move_request :
  connector_id:connector_id ->
  source_path:file_path ->
  target_path:file_path ->
  unit ->
  start_remote_move_request

val make_start_server_request : server_id:server_id -> unit -> start_server_request
val make_stop_server_request : server_id:server_id -> unit -> stop_server_request
val make_tag_resource_request : arn:arn -> tags:tags -> unit -> tag_resource_request

val make_test_connection_response :
  ?connector_id:connector_id ->
  ?status:status ->
  ?status_message:message ->
  ?sftp_connection_details:sftp_connector_connection_details ->
  unit ->
  test_connection_response

val make_test_connection_request : connector_id:connector_id -> unit -> test_connection_request

val make_test_identity_provider_response :
  ?response:response ->
  ?message:message ->
  status_code:status_code ->
  url:url ->
  unit ->
  test_identity_provider_response

val make_test_identity_provider_request :
  ?server_protocol:protocol ->
  ?source_ip:source_ip ->
  ?user_password:user_password ->
  server_id:server_id ->
  user_name:user_name ->
  unit ->
  test_identity_provider_request

val make_update_host_key_response :
  server_id:server_id -> host_key_id:host_key_id -> unit -> update_host_key_response

val make_update_host_key_request :
  server_id:server_id ->
  host_key_id:host_key_id ->
  description:host_key_description ->
  unit ->
  update_host_key_request

val make_update_access_response :
  server_id:server_id -> external_id:external_id -> unit -> update_access_response

val make_update_access_request :
  ?home_directory:home_directory ->
  ?home_directory_type:home_directory_type ->
  ?home_directory_mappings:home_directory_mappings ->
  ?policy:policy ->
  ?posix_profile:posix_profile ->
  ?role:role ->
  server_id:server_id ->
  external_id:external_id ->
  unit ->
  update_access_request

val make_untag_resource_request : arn:arn -> tag_keys:tag_keys -> unit -> untag_resource_request
val make_update_agreement_response : agreement_id:agreement_id -> unit -> update_agreement_response

val make_update_agreement_request :
  ?description:description ->
  ?status:agreement_status_type ->
  ?local_profile_id:profile_id ->
  ?partner_profile_id:profile_id ->
  ?base_directory:home_directory ->
  ?access_role:role ->
  ?preserve_filename:preserve_filename_type ->
  ?enforce_message_signing:enforce_message_signing_type ->
  ?custom_directories:custom_directories_type ->
  agreement_id:agreement_id ->
  server_id:server_id ->
  unit ->
  update_agreement_request

val make_update_certificate_response :
  certificate_id:certificate_id -> unit -> update_certificate_response

val make_update_certificate_request :
  ?active_date:cert_date ->
  ?inactive_date:cert_date ->
  ?description:description ->
  certificate_id:certificate_id ->
  unit ->
  update_certificate_request

val make_update_connector_response : connector_id:connector_id -> unit -> update_connector_response

val make_update_connector_vpc_lattice_egress_config :
  ?resource_configuration_arn:vpc_lattice_resource_configuration_arn ->
  ?port_number:sftp_port ->
  unit ->
  update_connector_vpc_lattice_egress_config

val make_update_connector_request :
  ?url:url ->
  ?as2_config:as2_connector_config ->
  ?access_role:role ->
  ?logging_role:role ->
  ?sftp_config:sftp_connector_config ->
  ?security_policy_name:connector_security_policy_name ->
  ?egress_config:update_connector_egress_config ->
  ?ip_address_type:connectors_ip_address_type ->
  connector_id:connector_id ->
  unit ->
  update_connector_request

val make_update_profile_response : profile_id:profile_id -> unit -> update_profile_response

val make_update_profile_request :
  ?certificate_ids:certificate_ids -> profile_id:profile_id -> unit -> update_profile_request

val make_update_server_response : server_id:server_id -> unit -> update_server_response

val make_update_server_request :
  ?certificate:certificate ->
  ?protocol_details:protocol_details ->
  ?endpoint_details:endpoint_details ->
  ?endpoint_type:endpoint_type ->
  ?host_key:host_key ->
  ?identity_provider_details:identity_provider_details ->
  ?logging_role:nullable_role ->
  ?post_authentication_login_banner:post_authentication_login_banner ->
  ?pre_authentication_login_banner:pre_authentication_login_banner ->
  ?protocols:protocols ->
  ?security_policy_name:security_policy_name ->
  ?workflow_details:workflow_details ->
  ?structured_log_destinations:structured_log_destinations ->
  ?s3_storage_options:s3_storage_options ->
  ?ip_address_type:ip_address_type ->
  ?identity_provider_type:identity_provider_type ->
  server_id:server_id ->
  unit ->
  update_server_request

val make_update_user_response :
  server_id:server_id -> user_name:user_name -> unit -> update_user_response

val make_update_user_request :
  ?home_directory:home_directory ->
  ?home_directory_type:home_directory_type ->
  ?home_directory_mappings:home_directory_mappings ->
  ?policy:policy ->
  ?posix_profile:posix_profile ->
  ?role:role ->
  server_id:server_id ->
  user_name:user_name ->
  unit ->
  update_user_request

val make_update_web_app_response : web_app_id:web_app_id -> unit -> update_web_app_response

val make_update_web_app_vpc_config :
  ?subnet_ids:subnet_ids ->
  ?ip_address_type:web_app_vpc_endpoint_ip_address_type ->
  unit ->
  update_web_app_vpc_config

val make_update_web_app_identity_center_config :
  ?role:role -> unit -> update_web_app_identity_center_config

val make_update_web_app_request :
  ?identity_provider_details:update_web_app_identity_provider_details ->
  ?access_endpoint:web_app_access_endpoint ->
  ?web_app_units:web_app_units ->
  ?endpoint_details:update_web_app_endpoint_details ->
  web_app_id:web_app_id ->
  unit ->
  update_web_app_request

val make_update_web_app_customization_response :
  web_app_id:web_app_id -> unit -> update_web_app_customization_response

val make_update_web_app_customization_request :
  ?title:web_app_title ->
  ?logo_file:web_app_logo_file ->
  ?favicon_file:web_app_favicon_file ->
  web_app_id:web_app_id ->
  unit ->
  update_web_app_customization_request
