(** Transfer client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module UpdateWebAppCustomization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_web_app_customization_request ->
    ( update_web_app_customization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_web_app_customization_request ->
    ( update_web_app_customization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns new customization properties to a web app. You can modify the icon file, logo file, and \
   title.\n"]

module UpdateWebApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_web_app_request ->
    ( update_web_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_web_app_request ->
    ( update_web_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns new properties to a web app. You can modify the access point, identity provider \
   details, endpoint configuration, and the web app units.\n\n\
  \ For more information about using VPC endpoints with Transfer Family, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html}Create a \
   Transfer Family web app in a VPC}.\n\
  \ "]

module UpdateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( update_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_request ->
    ( update_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns new properties to a user. Parameters you pass modify any or all of the following: the \
   home directory, role, and policy for the [UserName] and [ServerId] you specify.\n\n\
  \ The response returns the [ServerId] and the [UserName] for the updated user.\n\
  \ \n\
  \  In the console, you can select {i Restricted} when you create or update a user. This ensures \
   that the user can't access anything outside of their home directory. The programmatic way to \
   configure this behavior is to update the user. Set their [HomeDirectoryType] to [LOGICAL], and \
   specify [HomeDirectoryMappings] with [Entry] as root ([/]) and [Target] as their home directory.\n\
  \  \n\
  \   For example, if the user's home directory is [/test/admin-user], the following command \
   updates the user so that their configuration in the console shows the {i Restricted} flag as \
   selected.\n\
  \   \n\
  \     [ aws transfer update-user --server-id <server-id> --user-name admin-user \
   --home-directory-type LOGICAL --home-directory-mappings \"\\[{\\\"Entry\\\":\\\"/\\\", \
   \\\"Target\\\":\\\"/test/admin-user\\\"}\\]\"] \n\
  \    "]

module UpdateServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_server_request ->
    ( update_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_server_request ->
    ( update_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the file transfer protocol-enabled server's properties after that server has been \
   created.\n\n\
  \ The [UpdateServer] call returns the [ServerId] of the server you updated.\n\
  \ "]

module UpdateProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_profile_request ->
    ( update_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_profile_request ->
    ( update_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates some of the parameters for an existing profile. Provide the [ProfileId] for the profile \
   that you want to update, along with the new values for the parameters to update.\n"]

module UpdateConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connector_request ->
    ( update_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connector_request ->
    ( update_connector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates some of the parameters for an existing connector. Provide the [ConnectorId] for the \
   connector that you want to update, along with the new values for the parameters to update.\n"]

module UpdateCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_certificate_request ->
    ( update_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_certificate_request ->
    ( update_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the active and inactive dates for a certificate.\n"]

module UpdateAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_agreement_request ->
    ( update_agreement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_agreement_request ->
    ( update_agreement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates some of the parameters for an existing agreement. Provide the [AgreementId] and the \
   [ServerId] for the agreement that you want to update, along with the new values for the \
   parameters to update.\n\n\
  \  Specify {i either} [BaseDirectory] or [CustomDirectories], but not both. Specifying both \
   causes the command to fail.\n\
  \  \n\
  \   If you update an agreement from using base directory to custom directories, the base \
   directory is no longer used. Similarly, if you change from custom directories to a base \
   directory, the custom directories are no longer used.\n\
  \   \n\
  \    "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN). \
   Resources are users, servers, roles, and other entities.\n\n\
  \ No response is returned from this call.\n\
  \ "]

module UpdateAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_access_request ->
    ( update_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_access_request ->
    ( update_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows you to update parameters for the access specified in the [ServerID] and [ExternalID] \
   parameters.\n"]

module UpdateHostKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_host_key_request ->
    ( update_host_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_host_key_request ->
    ( update_host_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the description for the host key that's specified by the [ServerId] and [HostKeyId] \
   parameters.\n"]

module TestIdentityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_identity_provider_request ->
    ( test_identity_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_identity_provider_request ->
    ( test_identity_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "If the [IdentityProviderType] of a file transfer protocol-enabled server is \
   [AWS_DIRECTORY_SERVICE] or [API_Gateway], tests whether your identity provider is set up \
   successfully. We highly recommend that you call this operation to test your authentication \
   method as soon as you create your server. By doing so, you can troubleshoot issues with the \
   identity provider integration to ensure that your users can successfully use the service.\n\n\
  \  The [ServerId] and [UserName] parameters are required. The [ServerProtocol], [SourceIp], and \
   [UserPassword] are all optional. \n\
  \ \n\
  \  Note the following:\n\
  \  \n\
  \   {ul\n\
  \         {-   You cannot use [TestIdentityProvider] if the [IdentityProviderType] of your \
   server is [SERVICE_MANAGED].\n\
  \             \n\
  \              }\n\
  \         {-   [TestIdentityProvider] does not work with keys: it only accepts passwords.\n\
  \             \n\
  \              }\n\
  \         {-   [TestIdentityProvider] can test the password operation for a custom Identity \
   Provider that handles keys and passwords.\n\
  \             \n\
  \              }\n\
  \         {-   If you provide any incorrect values for any parameters, the [Response] field is \
   empty. \n\
  \             \n\
  \              }\n\
  \         {-   If you provide a server ID for a server that uses service-managed users, you get \
   an error: \n\
  \             \n\
  \               \n\
  \              {[\n\
  \               An error occurred (InvalidRequestException) when calling the \
   TestIdentityProvider operation: s-{i server-ID} not configured for external auth \n\
  \              ]}\n\
  \               \n\
  \              \n\
  \               }\n\
  \         {-   If you enter a Server ID for the [--server-id] parameter that does not identify \
   an actual Transfer server, you receive the following error: \n\
  \             \n\
  \               [An error occurred (ResourceNotFoundException) when calling the \
   TestIdentityProvider operation: Unknown server]. \n\
  \              \n\
  \               It is possible your sever is in a different region. You can specify a region by \
   adding the following: [--region region-code], such as [--region us-east-2] to specify a server \
   in {b US East (Ohio)}.\n\
  \               \n\
  \                }\n\
  \         }\n\
  \  "]

module TestConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_connection_request ->
    ( test_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_connection_request ->
    ( test_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tests whether your SFTP connector is set up successfully. We highly recommend that you call \
   this operation to test your ability to transfer files between local Amazon Web Services storage \
   and a trading partner's SFTP server.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). \
   Resources are users, servers, roles, and other entities.\n\n\
  \ There is no response returned from this call.\n\
  \ "]

module StopServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the state of a file transfer protocol-enabled server from [ONLINE] to [OFFLINE]. An \
   [OFFLINE] server cannot accept and process file transfer jobs. Information tied to your server, \
   such as server and user properties, are not affected by stopping your server.\n\n\
  \  Stopping the server does not reduce or impact your file transfer protocol endpoint billing; \
   you must delete the server to stop being billed.\n\
  \  \n\
  \    The state of [STOPPING] indicates that the server is in an intermediate state, either not \
   fully able to respond, or not fully offline. The values of [STOP_FAILED] can indicate an error \
   condition.\n\
  \    \n\
  \     No response is returned from this call.\n\
  \     "]

module StartServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the state of a file transfer protocol-enabled server from [OFFLINE] to [ONLINE]. It has \
   no impact on a server that is already [ONLINE]. An [ONLINE] server can accept and process file \
   transfer jobs.\n\n\
  \ The state of [STARTING] indicates that the server is in an intermediate state, either not \
   fully able to respond, or not fully online. The values of [START_FAILED] can indicate an error \
   condition.\n\
  \ \n\
  \  No response is returned from this call.\n\
  \  "]

module StartRemoteMove : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_remote_move_request ->
    ( start_remote_move_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_remote_move_request ->
    ( start_remote_move_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Moves or renames a file or directory on the remote SFTP server.\n"]

module StartRemoteDelete : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_remote_delete_request ->
    ( start_remote_delete_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_remote_delete_request ->
    ( start_remote_delete_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a file or directory on the remote SFTP server.\n"]

module StartFileTransfer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_file_transfer_request ->
    ( start_file_transfer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_file_transfer_request ->
    ( start_file_transfer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins a file transfer between local Amazon Web Services storage and a remote AS2 or SFTP \
   server.\n\n\
  \ {ul\n\
  \       {-  For an AS2 connector, you specify the [ConnectorId] and one or more [SendFilePaths] \
   to identify the files you want to transfer.\n\
  \           \n\
  \            }\n\
  \       {-  For an SFTP connector, the file transfer can be either outbound or inbound. In both \
   cases, you specify the [ConnectorId]. Depending on the direction of the transfer, you also \
   specify the following items:\n\
  \           \n\
  \            {ul\n\
  \                  {-  If you are transferring file from a partner's SFTP server to Amazon Web \
   Services storage, you specify one or more [RetrieveFilePaths] to identify the files you want to \
   transfer, and a [LocalDirectoryPath] to specify the destination folder.\n\
  \                      \n\
  \                       }\n\
  \                  {-  If you are transferring file to a partner's SFTP server from Amazon Web \
   Services storage, you specify one or more [SendFilePaths] to identify the files you want to \
   transfer, and a [RemoteDirectoryPath] to specify the destination folder.\n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       }\n\
  \  "]

module StartDirectoryListing : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_directory_listing_request ->
    ( start_directory_listing_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_directory_listing_request ->
    ( start_directory_listing_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of the contents of a directory from a remote SFTP server. You specify the \
   connector ID, the output path, and the remote directory path. You can also specify the optional \
   [MaxItems] value to control the maximum number of items that are listed from the remote \
   directory. This API returns a list of all files and directories in the remote directory (up to \
   the maximum value), but does not return files or folders in sub-directories. That is, it only \
   returns a list of files and directories one-level deep.\n\n\
  \ After you receive the listing file, you can provide the files that you want to transfer to the \
   [RetrieveFilePaths] parameter of the [StartFileTransfer] API call.\n\
  \ \n\
  \  The naming convention for the output file is \n\
  \  {[\n\
  \   {i connector-ID}-{i listing-ID}.json\n\
  \  ]}\n\
  \  . The output file contains the following information:\n\
  \  \n\
  \   {ul\n\
  \         {-   [filePath]: the complete path of a remote file, relative to the directory of the \
   listing request for your SFTP connector on the remote server.\n\
  \             \n\
  \              }\n\
  \         {-   [modifiedTimestamp]: the last time the file was modified, in UTC time format. \
   This field is optional. If the remote file attributes don't contain a timestamp, it is omitted \
   from the file listing.\n\
  \             \n\
  \              }\n\
  \         {-   [size]: the size of the file, in bytes. This field is optional. If the remote \
   file attributes don't contain a file size, it is omitted from the file listing.\n\
  \             \n\
  \              }\n\
  \         {-   [path]: the complete path of a remote directory, relative to the directory of the \
   listing request for your SFTP connector on the remote server.\n\
  \             \n\
  \              }\n\
  \         {-   [truncated]: a flag indicating whether the list output contains all of the items \
   contained in the remote directory or not. If your [Truncated] output value is true, you can \
   increase the value provided in the optional [max-items] input attribute to be able to list more \
   items (up to the maximum allowed list size of 200,000 items).\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module SendWorkflowStepState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_workflow_step_state_request ->
    ( send_workflow_step_state_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_workflow_step_state_request ->
    ( send_workflow_step_state_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends a callback for asynchronous custom steps.\n\n\
  \  The [ExecutionId], [WorkflowId], and [Token] are passed to the target resource during \
   execution of a custom step of a workflow. You must include those with their callback as well as \
   providing a status. \n\
  \ "]

module ListWorkflows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all workflows associated with your Amazon Web Services account for your current region.\n"]

module ListWebApps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_web_apps_request ->
    ( list_web_apps_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_web_apps_request ->
    ( list_web_apps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all web apps associated with your Amazon Web Services account for your current region. \
   The response includes the endpoint type for each web app, showing whether it is publicly \
   accessible or VPC hosted.\n\n\
  \ For more information about using VPC endpoints with Transfer Family, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html}Create a \
   Transfer Family web app in a VPC}.\n\
  \ "]

module ListUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_users_request ->
    ( list_users_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the users for a file transfer protocol-enabled server that you specify by passing the \
   [ServerId] parameter.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all of the tags associated with the Amazon Resource Name (ARN) that you specify. The \
   resource can be a user, server, or role.\n"]

module ListServers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_servers_request ->
    ( list_servers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_servers_request ->
    ( list_servers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the file transfer protocol-enabled servers that are associated with your Amazon Web \
   Services account.\n"]

module ListSecurityPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_security_policies_request ->
    ( list_security_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_security_policies_request ->
    ( list_security_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the security policies that are attached to your servers and SFTP connectors. For more \
   information about security policies, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html}Working with \
   security policies for servers} or \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/security-policies-connectors.html}Working \
   with security policies for SFTP connectors}.\n"]

module ListProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_profiles_request ->
    ( list_profiles_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_profiles_request ->
    ( list_profiles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the profiles for your system. If you want to limit the results to a certain \
   number, supply a value for the [MaxResults] parameter. If you ran the command previously and \
   received a value for [NextToken], you can supply that value to continue listing profiles from \
   where you left off.\n"]

module ListHostKeys : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_host_keys_request ->
    ( list_host_keys_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_host_keys_request ->
    ( list_host_keys_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of host keys for the server that's specified by the [ServerId] parameter.\n"]

module ListFileTransferResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_file_transfer_results_request ->
    ( list_file_transfer_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_file_transfer_results_request ->
    ( list_file_transfer_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns real-time updates and detailed information on the status of each individual file being \
   transferred in a specific file transfer operation. You specify the file transfer by providing \
   its [ConnectorId] and its [TransferId].\n\n\
  \  File transfer results are available up to 7 days after an operation has been requested.\n\
  \  \n\
  \   "]

module ListExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_executions_request ->
    ( list_executions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_executions_request ->
    ( list_executions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all in-progress executions for the specified workflow.\n\n\
  \  If the specified workflow ID cannot be found, [ListExecutions] returns a [ResourceNotFound] \
   exception.\n\
  \  \n\
  \   "]

module ListConnectors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connectors_request ->
    ( list_connectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connectors_request ->
    ( list_connectors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the connectors for the specified Region.\n"]

module ListCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_certificates_request ->
    ( list_certificates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the current certificates that have been imported into Transfer Family. If you \
   want to limit the results to a certain number, supply a value for the [MaxResults] parameter. \
   If you ran the command previously and received a value for the [NextToken] parameter, you can \
   supply that value to continue listing certificates from where you left off.\n"]

module ListAgreements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreements_request ->
    ( list_agreements_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreements_request ->
    ( list_agreements_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the agreements for the server that's identified by the [ServerId] that you \
   supply. If you want to limit the results to a certain number, supply a value for the \
   [MaxResults] parameter. If you ran the command previously and received a value for [NextToken], \
   you can supply that value to continue listing agreements from where you left off.\n"]

module ListAccesses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accesses_request ->
    ( list_accesses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accesses_request ->
    ( list_accesses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the details for all the accesses you have on your server.\n"]

module ImportSshPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_ssh_public_key_request ->
    ( import_ssh_public_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_ssh_public_key_request ->
    ( import_ssh_public_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a Secure Shell (SSH) public key to a Transfer Family user identified by a [UserName] value \
   assigned to the specific file transfer protocol-enabled server, identified by [ServerId].\n\n\
  \ The response returns the [UserName] value, the [ServerId] value, and the name of the \
   [SshPublicKeyId].\n\
  \ "]

module ImportHostKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_host_key_request ->
    ( import_host_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_host_key_request ->
    ( import_host_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a host key to the server that's specified by the [ServerId] parameter.\n"]

module ImportCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_request ->
    ( import_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_certificate_request ->
    ( import_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports the signing and encryption certificates that you need to create local (AS2) profiles \
   and partner profiles.\n\n\
  \ You can import both the certificate and its chain in the [Certificate] parameter.\n\
  \ \n\
  \  After importing a certificate, Transfer Family automatically creates a Amazon CloudWatch \
   metric called [DaysUntilExpiry] that tracks the number of days until the certificate expires. \
   The metric is based on the [InactiveDate] parameter and is published daily in the \
   [AWS/Transfer] namespace.\n\
  \  \n\
  \    It can take up to a full day after importing a certificate for Transfer Family to emit the \
   [DaysUntilExpiry] metric to your account.\n\
  \    \n\
  \       If you use the [Certificate] parameter to upload both the certificate and its chain, \
   don't use the [CertificateChain] parameter.\n\
  \       \n\
  \          {b CloudWatch monitoring} \n\
  \         \n\
  \          The [DaysUntilExpiry] metric includes the following specifications:\n\
  \          \n\
  \           {ul\n\
  \                 {-   {b Units:} Count (days)\n\
  \                     \n\
  \                      }\n\
  \                 {-   {b Dimensions:} [CertificateId] (always present), [Description] (if \
   provided during certificate import)\n\
  \                     \n\
  \                      }\n\
  \                 {-   {b Statistics:} Minimum, Maximum, Average\n\
  \                     \n\
  \                      }\n\
  \                 {-   {b Frequency:} Published daily\n\
  \                     \n\
  \                      }\n\
  \                 }\n\
  \  "]

module DescribeWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workflow_request ->
    ( describe_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workflow_request ->
    ( describe_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified workflow.\n"]

module DescribeWebAppCustomization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_web_app_customization_request ->
    ( describe_web_app_customization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_web_app_customization_request ->
    ( describe_web_app_customization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the web app customization object that's identified by [WebAppId].\n"]

module DescribeWebApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_web_app_request ->
    ( describe_web_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_web_app_request ->
    ( describe_web_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the web app that's identified by [WebAppId]. The response includes endpoint \
   configuration details such as whether the web app is publicly accessible or VPC hosted.\n\n\
  \ For more information about using VPC endpoints with Transfer Family, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html}Create a \
   Transfer Family web app in a VPC}.\n\
  \ "]

module DescribeUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_request ->
    ( describe_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_request ->
    ( describe_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the user assigned to the specific file transfer protocol-enabled server, as \
   identified by its [ServerId] property.\n\n\
  \ The response from this call returns the properties of the user associated with the [ServerId] \
   value that was specified.\n\
  \ "]

module DescribeServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_server_request ->
    ( describe_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_server_request ->
    ( describe_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a file transfer protocol-enabled server that you specify by passing the [ServerId] \
   parameter.\n\n\
  \ The response contains a description of a server's properties. When you set [EndpointType] to \
   VPC, the response will contain the [EndpointDetails].\n\
  \ "]

module DescribeSecurityPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_security_policy_request ->
    ( describe_security_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_security_policy_request ->
    ( describe_security_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the security policy that is attached to your server or SFTP connector. The response \
   contains a description of the security policy's properties. For more information about security \
   policies, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/security-policies.html}Working with \
   security policies for servers} or \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/security-policies-connectors.html}Working \
   with security policies for SFTP connectors}.\n"]

module DescribeProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_profile_request ->
    ( describe_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_profile_request ->
    ( describe_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the details of the profile that's specified by the [ProfileId].\n"]

module DescribeHostKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_host_key_request ->
    ( describe_host_key_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_host_key_request ->
    ( describe_host_key_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of the host key that's specified by the [HostKeyId] and [ServerId].\n"]

module DescribeExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_execution_request ->
    ( describe_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_execution_request ->
    ( describe_execution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use [DescribeExecution] to check the details of the execution of the specified \
   workflow.\n\n\
  \  This API call only returns details for in-progress workflows.\n\
  \  \n\
  \    If you provide an ID for an execution that is not in progress, or if the execution doesn't \
   match the specified workflow ID, you receive a [ResourceNotFound] exception.\n\
  \   \n\
  \    "]

module DescribeConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connector_request ->
    ( describe_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connector_request ->
    ( describe_connector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the connector that's identified by the [ConnectorId.] \n"]

module DescribeCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_certificate_request ->
    ( describe_certificate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the certificate that's identified by the [CertificateId].\n\n\
  \  Transfer Family automatically publishes a Amazon CloudWatch metric called [DaysUntilExpiry] \
   for imported certificates. This metric tracks the number of days until the certificate expires \
   based on the [InactiveDate]. The metric is available in the [AWS/Transfer] namespace and \
   includes the [CertificateId] as a dimension.\n\
  \  \n\
  \   "]

module DescribeAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_agreement_request ->
    ( describe_agreement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_agreement_request ->
    ( describe_agreement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the agreement that's identified by the [AgreementId].\n"]

module DescribeAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_access_request ->
    ( describe_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_access_request ->
    ( describe_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the access that is assigned to the specific file transfer protocol-enabled server, as \
   identified by its [ServerId] property and its [ExternalId].\n\n\
  \ The response from this call returns the properties of the access that is associated with the \
   [ServerId] value that was specified.\n\
  \ "]

module DeleteWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified workflow.\n"]

module DeleteWebAppCustomization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_web_app_customization_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_web_app_customization_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the [WebAppCustomization] object that corresponds to the web app ID specified.\n"]

module DeleteWebApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_web_app_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_web_app_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified web app.\n"]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the user belonging to a file transfer protocol-enabled server you specify.\n\n\
  \ No response returns from this operation.\n\
  \ \n\
  \   When you delete a user from a server, the user's information is lost.\n\
  \   \n\
  \    "]

module DeleteSshPublicKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ssh_public_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ssh_public_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a user's Secure Shell (SSH) public key.\n"]

module DeleteServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_server_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the file transfer protocol-enabled server that you specify.\n\n\
  \ No response returns from this operation.\n\
  \ "]

module DeleteProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the profile that's specified in the [ProfileId] parameter.\n"]

module DeleteHostKey : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_host_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_host_key_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the host key that's specified in the [HostKeyId] parameter.\n"]

module DeleteConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connector_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the connector that's specified in the provided [ConnectorId].\n"]

module DeleteCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_certificate_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the certificate that's specified in the [CertificateId] parameter.\n"]

module DeleteAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_agreement_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_agreement_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete the agreement that's specified in the provided [AgreementId].\n"]

module DeleteAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_access_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_access_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows you to delete the access specified in the [ServerID] and [ExternalID] parameters.\n"]

module CreateWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Allows you to create a workflow with specified steps and step details the workflow invokes \
   after file transfer completes. After creating a workflow, you can associate the workflow \
   created with any transfer servers by specifying the [workflow-details] field in [CreateServer] \
   and [UpdateServer] operations. \n"]

module CreateWebApp : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_web_app_request ->
    ( create_web_app_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_web_app_request ->
    ( create_web_app_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a web app based on specified parameters, and returns the ID for the new web app. You \
   can configure the web app to be publicly accessible or hosted within a VPC.\n\n\
  \ For more information about using VPC endpoints with Transfer Family, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/create-webapp-in-vpc.html}Create a \
   Transfer Family web app in a VPC}.\n\
  \ "]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a user and associates them with an existing file transfer protocol-enabled server. You \
   can only create and associate users with servers that have the [IdentityProviderType] set to \
   [SERVICE_MANAGED]. Using parameters for [CreateUser], you can specify the user name, set the \
   home directory, store the user's public key, and assign the user's Identity and Access \
   Management (IAM) role. You can also optionally add a session policy, and assign metadata with \
   tags that can be used to group and search for users.\n"]

module CreateServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_server_request ->
    ( create_server_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_server_request ->
    ( create_server_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Instantiates an auto-scaling virtual server based on the selected file transfer protocol in \
   Amazon Web Services. When you make updates to your file transfer protocol-enabled server or \
   when you work with users, use the service-generated [ServerId] property that is assigned to the \
   newly created server.\n"]

module CreateProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_profile_request ->
    ( create_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_profile_request ->
    ( create_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates the local or partner profile to use for AS2 transfers.\n"]

module CreateConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connector_request ->
    ( create_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connector_request ->
    ( create_connector_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the connector, which captures the parameters for a connection for the AS2 or SFTP \
   protocol. For AS2, the connector is required for sending files to an externally hosted AS2 \
   server. For SFTP, the connector is required when sending files to an SFTP server or receiving \
   files from an SFTP server. For more details about connectors, see \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/configure-as2-connector.html}Configure \
   AS2 connectors} and \
   {{:https://docs.aws.amazon.com/transfer/latest/userguide/configure-sftp-connector.html}Create \
   SFTP connectors}.\n\n\
  \  You must specify exactly one configuration object: either for AS2 ([As2Config]) or SFTP \
   ([SftpConfig]).\n\
  \  \n\
  \   "]

module CreateAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_agreement_request ->
    ( create_agreement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_agreement_request ->
    ( create_agreement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an agreement. An agreement is a bilateral trading partner agreement, or partnership, \
   between an Transfer Family server and an AS2 process. The agreement defines the file and \
   message transfer relationship between the server and the AS2 process. To define an agreement, \
   Transfer Family combines a server, local profile, partner profile, certificate, and other \
   attributes.\n\n\
  \ The partner is identified with the [PartnerProfileId], and the AS2 process is identified with \
   the [LocalProfileId].\n\
  \ \n\
  \   Specify {i either} [BaseDirectory] or [CustomDirectories], but not both. Specifying both \
   causes the command to fail.\n\
  \   \n\
  \    "]

(** {1:Serialization and Deserialization} *)
module CreateAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidRequestException of invalid_request_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_access_request ->
    ( create_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_access_request ->
    ( create_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidRequestException of invalid_request_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Used by administrators to choose which groups in the directory should have access to upload and \
   download files over the enabled protocols using Transfer Family. For example, a Microsoft \
   Active Directory might contain 50,000 users, but only a small fraction might need the ability \
   to transfer files to the server. An administrator can use [CreateAccess] to limit the access to \
   the correct set of users who need this ability.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
