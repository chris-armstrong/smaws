open Types

let make_as2_async_mdn_connector_config ?url:(url_ : url option)
    ?server_ids:(server_ids_ : as2_async_mdn_server_ids option) () =
  ({ url = url_; server_ids = server_ids_ } : as2_async_mdn_connector_config)

let make_as2_connector_config ?local_profile_id:(local_profile_id_ : profile_id option)
    ?partner_profile_id:(partner_profile_id_ : profile_id option)
    ?message_subject:(message_subject_ : message_subject option)
    ?compression:(compression_ : compression_enum option)
    ?encryption_algorithm:(encryption_algorithm_ : encryption_alg option)
    ?signing_algorithm:(signing_algorithm_ : signing_alg option)
    ?mdn_signing_algorithm:(mdn_signing_algorithm_ : mdn_signing_alg option)
    ?mdn_response:(mdn_response_ : mdn_response option)
    ?basic_auth_secret_id:(basic_auth_secret_id_ : as2_connector_secret_id option)
    ?preserve_content_type:(preserve_content_type_ : preserve_content_type option)
    ?async_mdn_config:(async_mdn_config_ : as2_async_mdn_connector_config option) () =
  ({
     local_profile_id = local_profile_id_;
     partner_profile_id = partner_profile_id_;
     message_subject = message_subject_;
     compression = compression_;
     encryption_algorithm = encryption_algorithm_;
     signing_algorithm = signing_algorithm_;
     mdn_signing_algorithm = mdn_signing_algorithm_;
     mdn_response = mdn_response_;
     basic_auth_secret_id = basic_auth_secret_id_;
     preserve_content_type = preserve_content_type_;
     async_mdn_config = async_mdn_config_;
   }
    : as2_connector_config)

let make_connector_vpc_lattice_egress_config ?port_number:(port_number_ : sftp_port option)
    ~resource_configuration_arn:
      (resource_configuration_arn_ : vpc_lattice_resource_configuration_arn) () =
  ({ resource_configuration_arn = resource_configuration_arn_; port_number = port_number_ }
    : connector_vpc_lattice_egress_config)

let make_efs_file_location ?file_system_id:(file_system_id_ : efs_file_system_id option)
    ?path:(path_ : efs_path option) () =
  ({ file_system_id = file_system_id_; path = path_ } : efs_file_location)

let make_s3_input_file_location ?bucket:(bucket_ : s3_bucket option) ?key:(key_ : s3_key option) ()
    =
  ({ bucket = bucket_; key = key_ } : s3_input_file_location)

let make_input_file_location ?s3_file_location:(s3_file_location_ : s3_input_file_location option)
    ?efs_file_location:(efs_file_location_ : efs_file_location option) () =
  ({ s3_file_location = s3_file_location_; efs_file_location = efs_file_location_ }
    : input_file_location)

let make_copy_step_details ?name:(name_ : workflow_step_name option)
    ?destination_file_location:(destination_file_location_ : input_file_location option)
    ?overwrite_existing:(overwrite_existing_ : overwrite_existing option)
    ?source_file_location:(source_file_location_ : source_file_location option) () =
  ({
     name = name_;
     destination_file_location = destination_file_location_;
     overwrite_existing = overwrite_existing_;
     source_file_location = source_file_location_;
   }
    : copy_step_details)

let make_create_access_response ~server_id:(server_id_ : server_id)
    ~external_id:(external_id_ : external_id) () =
  ({ server_id = server_id_; external_id = external_id_ } : create_access_response)

let make_posix_profile ?secondary_gids:(secondary_gids_ : secondary_gids option)
    ~uid:(uid_ : posix_id) ~gid:(gid_ : posix_id) () =
  ({ uid = uid_; gid = gid_; secondary_gids = secondary_gids_ } : posix_profile)

let make_home_directory_map_entry ?type_:(type__ : map_type option) ~entry:(entry_ : map_entry)
    ~target:(target_ : map_target) () =
  ({ entry = entry_; target = target_; type_ = type__ } : home_directory_map_entry)

let make_create_access_request ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?policy:(policy_ : policy option) ?posix_profile:(posix_profile_ : posix_profile option)
    ~role:(role_ : role) ~server_id:(server_id_ : server_id)
    ~external_id:(external_id_ : external_id) () =
  ({
     home_directory = home_directory_;
     home_directory_type = home_directory_type_;
     home_directory_mappings = home_directory_mappings_;
     policy = policy_;
     posix_profile = posix_profile_;
     role = role_;
     server_id = server_id_;
     external_id = external_id_;
   }
    : create_access_request)

let make_create_agreement_response ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ agreement_id = agreement_id_ } : create_agreement_response)

let make_custom_directories_type ~failed_files_directory:(failed_files_directory_ : home_directory)
    ~mdn_files_directory:(mdn_files_directory_ : home_directory)
    ~payload_files_directory:(payload_files_directory_ : home_directory)
    ~status_files_directory:(status_files_directory_ : home_directory)
    ~temporary_files_directory:(temporary_files_directory_ : home_directory) () =
  ({
     failed_files_directory = failed_files_directory_;
     mdn_files_directory = mdn_files_directory_;
     payload_files_directory = payload_files_directory_;
     status_files_directory = status_files_directory_;
     temporary_files_directory = temporary_files_directory_;
   }
    : custom_directories_type)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_agreement_request ?description:(description_ : description option)
    ?base_directory:(base_directory_ : home_directory option)
    ?status:(status_ : agreement_status_type option) ?tags:(tags_ : tags option)
    ?preserve_filename:(preserve_filename_ : preserve_filename_type option)
    ?enforce_message_signing:(enforce_message_signing_ : enforce_message_signing_type option)
    ?custom_directories:(custom_directories_ : custom_directories_type option)
    ~server_id:(server_id_ : server_id) ~local_profile_id:(local_profile_id_ : profile_id)
    ~partner_profile_id:(partner_profile_id_ : profile_id) ~access_role:(access_role_ : role) () =
  ({
     description = description_;
     server_id = server_id_;
     local_profile_id = local_profile_id_;
     partner_profile_id = partner_profile_id_;
     base_directory = base_directory_;
     access_role = access_role_;
     status = status_;
     tags = tags_;
     preserve_filename = preserve_filename_;
     enforce_message_signing = enforce_message_signing_;
     custom_directories = custom_directories_;
   }
    : create_agreement_request)

let make_create_connector_response ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : create_connector_response)

let make_sftp_connector_config ?user_secret_id:(user_secret_id_ : secret_id option)
    ?trusted_host_keys:(trusted_host_keys_ : sftp_connector_trusted_host_key_list option)
    ?max_concurrent_connections:(max_concurrent_connections_ : max_concurrent_connections option) ()
    =
  ({
     user_secret_id = user_secret_id_;
     trusted_host_keys = trusted_host_keys_;
     max_concurrent_connections = max_concurrent_connections_;
   }
    : sftp_connector_config)

let make_create_connector_request ?url:(url_ : url option)
    ?as2_config:(as2_config_ : as2_connector_config option)
    ?logging_role:(logging_role_ : role option) ?tags:(tags_ : tags option)
    ?sftp_config:(sftp_config_ : sftp_connector_config option)
    ?security_policy_name:(security_policy_name_ : connector_security_policy_name option)
    ?egress_config:(egress_config_ : connector_egress_config option)
    ?ip_address_type:(ip_address_type_ : connectors_ip_address_type option)
    ~access_role:(access_role_ : role) () =
  ({
     url = url_;
     as2_config = as2_config_;
     access_role = access_role_;
     logging_role = logging_role_;
     tags = tags_;
     sftp_config = sftp_config_;
     security_policy_name = security_policy_name_;
     egress_config = egress_config_;
     ip_address_type = ip_address_type_;
   }
    : create_connector_request)

let make_create_profile_response ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : create_profile_response)

let make_create_profile_request ?certificate_ids:(certificate_ids_ : certificate_ids option)
    ?tags:(tags_ : tags option) ~as2_id:(as2_id_ : as2_id)
    ~profile_type:(profile_type_ : profile_type) () =
  ({
     as2_id = as2_id_;
     profile_type = profile_type_;
     certificate_ids = certificate_ids_;
     tags = tags_;
   }
    : create_profile_request)

let make_create_server_response ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : create_server_response)

let make_s3_storage_options
    ?directory_listing_optimization:
      (directory_listing_optimization_ : directory_listing_optimization option) () =
  ({ directory_listing_optimization = directory_listing_optimization_ } : s3_storage_options)

let make_workflow_detail ~workflow_id:(workflow_id_ : workflow_id)
    ~execution_role:(execution_role_ : role) () =
  ({ workflow_id = workflow_id_; execution_role = execution_role_ } : workflow_detail)

let make_workflow_details ?on_upload:(on_upload_ : on_upload_workflow_details option)
    ?on_partial_upload:(on_partial_upload_ : on_partial_upload_workflow_details option) () =
  ({ on_upload = on_upload_; on_partial_upload = on_partial_upload_ } : workflow_details)

let make_protocol_details ?passive_ip:(passive_ip_ : passive_ip option)
    ?tls_session_resumption_mode:(tls_session_resumption_mode_ : tls_session_resumption_mode option)
    ?set_stat_option:(set_stat_option_ : set_stat_option option)
    ?as2_transports:(as2_transports_ : as2_transports option) () =
  ({
     passive_ip = passive_ip_;
     tls_session_resumption_mode = tls_session_resumption_mode_;
     set_stat_option = set_stat_option_;
     as2_transports = as2_transports_;
   }
    : protocol_details)

let make_identity_provider_details ?url:(url_ : url option)
    ?invocation_role:(invocation_role_ : role option)
    ?directory_id:(directory_id_ : directory_id option) ?\#function:(function_ : \#function option)
    ?sftp_authentication_methods:(sftp_authentication_methods_ : sftp_authentication_methods option)
    () =
  ({
     url = url_;
     invocation_role = invocation_role_;
     directory_id = directory_id_;
     \#function = function_;
     sftp_authentication_methods = sftp_authentication_methods_;
   }
    : identity_provider_details)

let make_endpoint_details
    ?address_allocation_ids:(address_allocation_ids_ : address_allocation_ids option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option) () =
  ({
     address_allocation_ids = address_allocation_ids_;
     subnet_ids = subnet_ids_;
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_id = vpc_id_;
     security_group_ids = security_group_ids_;
   }
    : endpoint_details)

let make_create_server_request ?certificate:(certificate_ : certificate option)
    ?domain:(domain_ : domain option)
    ?endpoint_details:(endpoint_details_ : endpoint_details option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option) ?host_key:(host_key_ : host_key option)
    ?identity_provider_details:(identity_provider_details_ : identity_provider_details option)
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ?logging_role:(logging_role_ : nullable_role option)
    ?post_authentication_login_banner:
      (post_authentication_login_banner_ : post_authentication_login_banner option)
    ?pre_authentication_login_banner:
      (pre_authentication_login_banner_ : pre_authentication_login_banner option)
    ?protocols:(protocols_ : protocols option)
    ?protocol_details:(protocol_details_ : protocol_details option)
    ?security_policy_name:(security_policy_name_ : security_policy_name option)
    ?tags:(tags_ : tags option) ?workflow_details:(workflow_details_ : workflow_details option)
    ?structured_log_destinations:(structured_log_destinations_ : structured_log_destinations option)
    ?s3_storage_options:(s3_storage_options_ : s3_storage_options option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option) () =
  ({
     certificate = certificate_;
     domain = domain_;
     endpoint_details = endpoint_details_;
     endpoint_type = endpoint_type_;
     host_key = host_key_;
     identity_provider_details = identity_provider_details_;
     identity_provider_type = identity_provider_type_;
     logging_role = logging_role_;
     post_authentication_login_banner = post_authentication_login_banner_;
     pre_authentication_login_banner = pre_authentication_login_banner_;
     protocols = protocols_;
     protocol_details = protocol_details_;
     security_policy_name = security_policy_name_;
     tags = tags_;
     workflow_details = workflow_details_;
     structured_log_destinations = structured_log_destinations_;
     s3_storage_options = s3_storage_options_;
     ip_address_type = ip_address_type_;
   }
    : create_server_request)

let make_create_user_response ~server_id:(server_id_ : server_id)
    ~user_name:(user_name_ : user_name) () =
  ({ server_id = server_id_; user_name = user_name_ } : create_user_response)

let make_create_user_request ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?policy:(policy_ : policy option) ?posix_profile:(posix_profile_ : posix_profile option)
    ?ssh_public_key_body:(ssh_public_key_body_ : ssh_public_key_body option)
    ?tags:(tags_ : tags option) ~role:(role_ : role) ~server_id:(server_id_ : server_id)
    ~user_name:(user_name_ : user_name) () =
  ({
     home_directory = home_directory_;
     home_directory_type = home_directory_type_;
     home_directory_mappings = home_directory_mappings_;
     policy = policy_;
     posix_profile = posix_profile_;
     role = role_;
     server_id = server_id_;
     ssh_public_key_body = ssh_public_key_body_;
     tags = tags_;
     user_name = user_name_;
   }
    : create_user_request)

let make_create_web_app_response ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : create_web_app_response)

let make_web_app_vpc_config ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?vpc_id:(vpc_id_ : vpc_id option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?ip_address_type:(ip_address_type_ : web_app_vpc_endpoint_ip_address_type option) () =
  ({
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     security_group_ids = security_group_ids_;
     ip_address_type = ip_address_type_;
   }
    : web_app_vpc_config)

let make_identity_center_config ?instance_arn:(instance_arn_ : identity_center_instance_arn option)
    ?role:(role_ : role option) () =
  ({ instance_arn = instance_arn_; role = role_ } : identity_center_config)

let make_create_web_app_request ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ?web_app_units:(web_app_units_ : web_app_units option) ?tags:(tags_ : tags option)
    ?web_app_endpoint_policy:(web_app_endpoint_policy_ : web_app_endpoint_policy option)
    ?endpoint_details:(endpoint_details_ : web_app_endpoint_details option)
    ~identity_provider_details:(identity_provider_details_ : web_app_identity_provider_details) () =
  ({
     identity_provider_details = identity_provider_details_;
     access_endpoint = access_endpoint_;
     web_app_units = web_app_units_;
     tags = tags_;
     web_app_endpoint_policy = web_app_endpoint_policy_;
     endpoint_details = endpoint_details_;
   }
    : create_web_app_request)

let make_create_workflow_response ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_ } : create_workflow_response)

let make_decrypt_step_details ?name:(name_ : workflow_step_name option)
    ?source_file_location:(source_file_location_ : source_file_location option)
    ?overwrite_existing:(overwrite_existing_ : overwrite_existing option)
    ~type_:(type__ : encryption_type)
    ~destination_file_location:(destination_file_location_ : input_file_location) () =
  ({
     name = name_;
     type_ = type__;
     source_file_location = source_file_location_;
     overwrite_existing = overwrite_existing_;
     destination_file_location = destination_file_location_;
   }
    : decrypt_step_details)

let make_s3_tag ~key:(key_ : s3_tag_key) ~value:(value_ : s3_tag_value) () =
  ({ key = key_; value = value_ } : s3_tag)

let make_tag_step_details ?name:(name_ : workflow_step_name option) ?tags:(tags_ : s3_tags option)
    ?source_file_location:(source_file_location_ : source_file_location option) () =
  ({ name = name_; tags = tags_; source_file_location = source_file_location_ } : tag_step_details)

let make_delete_step_details ?name:(name_ : workflow_step_name option)
    ?source_file_location:(source_file_location_ : source_file_location option) () =
  ({ name = name_; source_file_location = source_file_location_ } : delete_step_details)

let make_custom_step_details ?name:(name_ : workflow_step_name option)
    ?target:(target_ : custom_step_target option)
    ?timeout_seconds:(timeout_seconds_ : custom_step_timeout_seconds option)
    ?source_file_location:(source_file_location_ : source_file_location option) () =
  ({
     name = name_;
     target = target_;
     timeout_seconds = timeout_seconds_;
     source_file_location = source_file_location_;
   }
    : custom_step_details)

let make_workflow_step ?type_:(type__ : workflow_step_type option)
    ?copy_step_details:(copy_step_details_ : copy_step_details option)
    ?custom_step_details:(custom_step_details_ : custom_step_details option)
    ?delete_step_details:(delete_step_details_ : delete_step_details option)
    ?tag_step_details:(tag_step_details_ : tag_step_details option)
    ?decrypt_step_details:(decrypt_step_details_ : decrypt_step_details option) () =
  ({
     type_ = type__;
     copy_step_details = copy_step_details_;
     custom_step_details = custom_step_details_;
     delete_step_details = delete_step_details_;
     tag_step_details = tag_step_details_;
     decrypt_step_details = decrypt_step_details_;
   }
    : workflow_step)

let make_create_workflow_request ?description:(description_ : workflow_description option)
    ?on_exception_steps:(on_exception_steps_ : workflow_steps option) ?tags:(tags_ : tags option)
    ~steps:(steps_ : workflow_steps) () =
  ({
     description = description_;
     steps = steps_;
     on_exception_steps = on_exception_steps_;
     tags = tags_;
   }
    : create_workflow_request)

let make_custom_http_header ?key:(key_ : custom_http_header_key_type option)
    ?value:(value_ : custom_http_header_value_type option) () =
  ({ key = key_; value = value_ } : custom_http_header)

let make_delete_access_request ~server_id:(server_id_ : server_id)
    ~external_id:(external_id_ : external_id) () =
  ({ server_id = server_id_; external_id = external_id_ } : delete_access_request)

let make_delete_agreement_request ~agreement_id:(agreement_id_ : agreement_id)
    ~server_id:(server_id_ : server_id) () =
  ({ agreement_id = agreement_id_; server_id = server_id_ } : delete_agreement_request)

let make_delete_certificate_request ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : delete_certificate_request)

let make_delete_connector_request ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : delete_connector_request)

let make_delete_host_key_request ~server_id:(server_id_ : server_id)
    ~host_key_id:(host_key_id_ : host_key_id) () =
  ({ server_id = server_id_; host_key_id = host_key_id_ } : delete_host_key_request)

let make_delete_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : delete_profile_request)

let make_delete_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : delete_server_request)

let make_delete_ssh_public_key_request ~server_id:(server_id_ : server_id)
    ~ssh_public_key_id:(ssh_public_key_id_ : ssh_public_key_id) ~user_name:(user_name_ : user_name)
    () =
  ({ server_id = server_id_; ssh_public_key_id = ssh_public_key_id_; user_name = user_name_ }
    : delete_ssh_public_key_request)

let make_delete_user_request ~server_id:(server_id_ : server_id) ~user_name:(user_name_ : user_name)
    () =
  ({ server_id = server_id_; user_name = user_name_ } : delete_user_request)

let make_delete_web_app_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : delete_web_app_request)

let make_delete_web_app_customization_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : delete_web_app_customization_request)

let make_delete_workflow_request ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_ } : delete_workflow_request)

let make_described_access ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?policy:(policy_ : policy option) ?posix_profile:(posix_profile_ : posix_profile option)
    ?role:(role_ : role option) ?external_id:(external_id_ : external_id option) () =
  ({
     home_directory = home_directory_;
     home_directory_mappings = home_directory_mappings_;
     home_directory_type = home_directory_type_;
     policy = policy_;
     posix_profile = posix_profile_;
     role = role_;
     external_id = external_id_;
   }
    : described_access)

let make_describe_access_response ~server_id:(server_id_ : server_id)
    ~access:(access_ : described_access) () =
  ({ server_id = server_id_; access = access_ } : describe_access_response)

let make_describe_access_request ~server_id:(server_id_ : server_id)
    ~external_id:(external_id_ : external_id) () =
  ({ server_id = server_id_; external_id = external_id_ } : describe_access_request)

let make_described_agreement ?agreement_id:(agreement_id_ : agreement_id option)
    ?description:(description_ : description option)
    ?status:(status_ : agreement_status_type option) ?server_id:(server_id_ : server_id option)
    ?local_profile_id:(local_profile_id_ : profile_id option)
    ?partner_profile_id:(partner_profile_id_ : profile_id option)
    ?base_directory:(base_directory_ : home_directory option)
    ?access_role:(access_role_ : role option) ?tags:(tags_ : tags option)
    ?preserve_filename:(preserve_filename_ : preserve_filename_type option)
    ?enforce_message_signing:(enforce_message_signing_ : enforce_message_signing_type option)
    ?custom_directories:(custom_directories_ : custom_directories_type option) ~arn:(arn_ : arn) ()
    =
  ({
     arn = arn_;
     agreement_id = agreement_id_;
     description = description_;
     status = status_;
     server_id = server_id_;
     local_profile_id = local_profile_id_;
     partner_profile_id = partner_profile_id_;
     base_directory = base_directory_;
     access_role = access_role_;
     tags = tags_;
     preserve_filename = preserve_filename_;
     enforce_message_signing = enforce_message_signing_;
     custom_directories = custom_directories_;
   }
    : described_agreement)

let make_describe_agreement_response ~agreement:(agreement_ : described_agreement) () =
  ({ agreement = agreement_ } : describe_agreement_response)

let make_describe_agreement_request ~agreement_id:(agreement_id_ : agreement_id)
    ~server_id:(server_id_ : server_id) () =
  ({ agreement_id = agreement_id_; server_id = server_id_ } : describe_agreement_request)

let make_described_certificate ?certificate_id:(certificate_id_ : certificate_id option)
    ?usage:(usage_ : certificate_usage_type option)
    ?status:(status_ : certificate_status_type option)
    ?certificate:(certificate_ : certificate_body_type option)
    ?certificate_chain:(certificate_chain_ : certificate_chain_type option)
    ?active_date:(active_date_ : cert_date option)
    ?inactive_date:(inactive_date_ : cert_date option) ?serial:(serial_ : cert_serial option)
    ?not_before_date:(not_before_date_ : cert_date option)
    ?not_after_date:(not_after_date_ : cert_date option) ?type_:(type__ : certificate_type option)
    ?description:(description_ : description option) ?tags:(tags_ : tags option) ~arn:(arn_ : arn)
    () =
  ({
     arn = arn_;
     certificate_id = certificate_id_;
     usage = usage_;
     status = status_;
     certificate = certificate_;
     certificate_chain = certificate_chain_;
     active_date = active_date_;
     inactive_date = inactive_date_;
     serial = serial_;
     not_before_date = not_before_date_;
     not_after_date = not_after_date_;
     type_ = type__;
     description = description_;
     tags = tags_;
   }
    : described_certificate)

let make_describe_certificate_response ~certificate:(certificate_ : described_certificate) () =
  ({ certificate = certificate_ } : describe_certificate_response)

let make_describe_certificate_request ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : describe_certificate_request)

let make_described_connector_vpc_lattice_egress_config
    ?port_number:(port_number_ : sftp_port option)
    ~resource_configuration_arn:
      (resource_configuration_arn_ : vpc_lattice_resource_configuration_arn) () =
  ({ resource_configuration_arn = resource_configuration_arn_; port_number = port_number_ }
    : described_connector_vpc_lattice_egress_config)

let make_described_connector ?connector_id:(connector_id_ : connector_id option)
    ?url:(url_ : url option) ?as2_config:(as2_config_ : as2_connector_config option)
    ?access_role:(access_role_ : role option) ?logging_role:(logging_role_ : role option)
    ?tags:(tags_ : tags option) ?sftp_config:(sftp_config_ : sftp_connector_config option)
    ?service_managed_egress_ip_addresses:
      (service_managed_egress_ip_addresses_ : service_managed_egress_ip_addresses option)
    ?security_policy_name:(security_policy_name_ : connector_security_policy_name option)
    ?egress_config:(egress_config_ : described_connector_egress_config option)
    ?error_message:(error_message_ : connector_error_message option)
    ?ip_address_type:(ip_address_type_ : connectors_ip_address_type option) ~arn:(arn_ : arn)
    ~egress_type:(egress_type_ : connector_egress_type) ~status:(status_ : connector_status) () =
  ({
     arn = arn_;
     connector_id = connector_id_;
     url = url_;
     as2_config = as2_config_;
     access_role = access_role_;
     logging_role = logging_role_;
     tags = tags_;
     sftp_config = sftp_config_;
     service_managed_egress_ip_addresses = service_managed_egress_ip_addresses_;
     security_policy_name = security_policy_name_;
     egress_config = egress_config_;
     egress_type = egress_type_;
     error_message = error_message_;
     status = status_;
     ip_address_type = ip_address_type_;
   }
    : described_connector)

let make_describe_connector_response ~connector:(connector_ : described_connector) () =
  ({ connector = connector_ } : describe_connector_response)

let make_describe_connector_request ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : describe_connector_request)

let make_execution_error ~type_:(type__ : execution_error_type)
    ~message:(message_ : execution_error_message) () =
  ({ type_ = type__; message = message_ } : execution_error)

let make_execution_results ?steps:(steps_ : execution_step_results option)
    ?on_exception_steps:(on_exception_steps_ : execution_step_results option) () =
  ({ steps = steps_; on_exception_steps = on_exception_steps_ } : execution_results)

let make_logging_configuration ?logging_role:(logging_role_ : role option)
    ?log_group_name:(log_group_name_ : log_group_name option) () =
  ({ logging_role = logging_role_; log_group_name = log_group_name_ } : logging_configuration)

let make_user_details ?session_id:(session_id_ : session_id option)
    ~user_name:(user_name_ : user_name) ~server_id:(server_id_ : server_id) () =
  ({ user_name = user_name_; server_id = server_id_; session_id = session_id_ } : user_details)

let make_service_metadata ~user_details:(user_details_ : user_details) () =
  ({ user_details = user_details_ } : service_metadata)

let make_s3_file_location ?bucket:(bucket_ : s3_bucket option) ?key:(key_ : s3_key option)
    ?version_id:(version_id_ : s3_version_id option) ?etag:(etag_ : s3_etag option) () =
  ({ bucket = bucket_; key = key_; version_id = version_id_; etag = etag_ } : s3_file_location)

let make_file_location ?s3_file_location:(s3_file_location_ : s3_file_location option)
    ?efs_file_location:(efs_file_location_ : efs_file_location option) () =
  ({ s3_file_location = s3_file_location_; efs_file_location = efs_file_location_ } : file_location)

let make_described_execution ?execution_id:(execution_id_ : execution_id option)
    ?initial_file_location:(initial_file_location_ : file_location option)
    ?service_metadata:(service_metadata_ : service_metadata option)
    ?execution_role:(execution_role_ : role option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?posix_profile:(posix_profile_ : posix_profile option)
    ?status:(status_ : execution_status option) ?results:(results_ : execution_results option) () =
  ({
     execution_id = execution_id_;
     initial_file_location = initial_file_location_;
     service_metadata = service_metadata_;
     execution_role = execution_role_;
     logging_configuration = logging_configuration_;
     posix_profile = posix_profile_;
     status = status_;
     results = results_;
   }
    : described_execution)

let make_describe_execution_response ~workflow_id:(workflow_id_ : workflow_id)
    ~execution:(execution_ : described_execution) () =
  ({ workflow_id = workflow_id_; execution = execution_ } : describe_execution_response)

let make_describe_execution_request ~execution_id:(execution_id_ : execution_id)
    ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ execution_id = execution_id_; workflow_id = workflow_id_ } : describe_execution_request)

let make_described_host_key ?host_key_id:(host_key_id_ : host_key_id option)
    ?host_key_fingerprint:(host_key_fingerprint_ : host_key_fingerprint option)
    ?description:(description_ : host_key_description option) ?type_:(type__ : host_key_type option)
    ?date_imported:(date_imported_ : date_imported option) ?tags:(tags_ : tags option)
    ~arn:(arn_ : arn) () =
  ({
     arn = arn_;
     host_key_id = host_key_id_;
     host_key_fingerprint = host_key_fingerprint_;
     description = description_;
     type_ = type__;
     date_imported = date_imported_;
     tags = tags_;
   }
    : described_host_key)

let make_describe_host_key_response ~host_key:(host_key_ : described_host_key) () =
  ({ host_key = host_key_ } : describe_host_key_response)

let make_describe_host_key_request ~server_id:(server_id_ : server_id)
    ~host_key_id:(host_key_id_ : host_key_id) () =
  ({ server_id = server_id_; host_key_id = host_key_id_ } : describe_host_key_request)

let make_described_profile ?profile_id:(profile_id_ : profile_id option)
    ?profile_type:(profile_type_ : profile_type option) ?as2_id:(as2_id_ : as2_id option)
    ?certificate_ids:(certificate_ids_ : certificate_ids option) ?tags:(tags_ : tags option)
    ~arn:(arn_ : arn) () =
  ({
     arn = arn_;
     profile_id = profile_id_;
     profile_type = profile_type_;
     as2_id = as2_id_;
     certificate_ids = certificate_ids_;
     tags = tags_;
   }
    : described_profile)

let make_describe_profile_response ~profile:(profile_ : described_profile) () =
  ({ profile = profile_ } : describe_profile_response)

let make_describe_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : describe_profile_request)

let make_described_security_policy ?fips:(fips_ : fips option)
    ?ssh_ciphers:(ssh_ciphers_ : security_policy_options option)
    ?ssh_kexs:(ssh_kexs_ : security_policy_options option)
    ?ssh_macs:(ssh_macs_ : security_policy_options option)
    ?tls_ciphers:(tls_ciphers_ : security_policy_options option)
    ?ssh_host_key_algorithms:(ssh_host_key_algorithms_ : security_policy_options option)
    ?type_:(type__ : security_policy_resource_type option)
    ?protocols:(protocols_ : security_policy_protocols option)
    ~security_policy_name:(security_policy_name_ : security_policy_name) () =
  ({
     fips = fips_;
     security_policy_name = security_policy_name_;
     ssh_ciphers = ssh_ciphers_;
     ssh_kexs = ssh_kexs_;
     ssh_macs = ssh_macs_;
     tls_ciphers = tls_ciphers_;
     ssh_host_key_algorithms = ssh_host_key_algorithms_;
     type_ = type__;
     protocols = protocols_;
   }
    : described_security_policy)

let make_describe_security_policy_response
    ~security_policy:(security_policy_ : described_security_policy) () =
  ({ security_policy = security_policy_ } : describe_security_policy_response)

let make_describe_security_policy_request
    ~security_policy_name:(security_policy_name_ : security_policy_name) () =
  ({ security_policy_name = security_policy_name_ } : describe_security_policy_request)

let make_described_server ?certificate:(certificate_ : certificate option)
    ?protocol_details:(protocol_details_ : protocol_details option)
    ?domain:(domain_ : domain option)
    ?endpoint_details:(endpoint_details_ : endpoint_details option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?host_key_fingerprint:(host_key_fingerprint_ : host_key_fingerprint option)
    ?identity_provider_details:(identity_provider_details_ : identity_provider_details option)
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ?logging_role:(logging_role_ : nullable_role option)
    ?post_authentication_login_banner:
      (post_authentication_login_banner_ : post_authentication_login_banner option)
    ?pre_authentication_login_banner:
      (pre_authentication_login_banner_ : pre_authentication_login_banner option)
    ?protocols:(protocols_ : protocols option)
    ?security_policy_name:(security_policy_name_ : security_policy_name option)
    ?server_id:(server_id_ : server_id option) ?state:(state_ : state option)
    ?tags:(tags_ : tags option) ?user_count:(user_count_ : user_count option)
    ?workflow_details:(workflow_details_ : workflow_details option)
    ?structured_log_destinations:(structured_log_destinations_ : structured_log_destinations option)
    ?s3_storage_options:(s3_storage_options_ : s3_storage_options option)
    ?as2_service_managed_egress_ip_addresses:
      (as2_service_managed_egress_ip_addresses_ : service_managed_egress_ip_addresses option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option) ~arn:(arn_ : arn) () =
  ({
     arn = arn_;
     certificate = certificate_;
     protocol_details = protocol_details_;
     domain = domain_;
     endpoint_details = endpoint_details_;
     endpoint_type = endpoint_type_;
     host_key_fingerprint = host_key_fingerprint_;
     identity_provider_details = identity_provider_details_;
     identity_provider_type = identity_provider_type_;
     logging_role = logging_role_;
     post_authentication_login_banner = post_authentication_login_banner_;
     pre_authentication_login_banner = pre_authentication_login_banner_;
     protocols = protocols_;
     security_policy_name = security_policy_name_;
     server_id = server_id_;
     state = state_;
     tags = tags_;
     user_count = user_count_;
     workflow_details = workflow_details_;
     structured_log_destinations = structured_log_destinations_;
     s3_storage_options = s3_storage_options_;
     as2_service_managed_egress_ip_addresses = as2_service_managed_egress_ip_addresses_;
     ip_address_type = ip_address_type_;
   }
    : described_server)

let make_describe_server_response ~server:(server_ : described_server) () =
  ({ server = server_ } : describe_server_response)

let make_describe_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : describe_server_request)

let make_ssh_public_key ~date_imported:(date_imported_ : date_imported)
    ~ssh_public_key_body:(ssh_public_key_body_ : ssh_public_key_body)
    ~ssh_public_key_id:(ssh_public_key_id_ : ssh_public_key_id) () =
  ({
     date_imported = date_imported_;
     ssh_public_key_body = ssh_public_key_body_;
     ssh_public_key_id = ssh_public_key_id_;
   }
    : ssh_public_key)

let make_described_user ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?policy:(policy_ : policy option) ?posix_profile:(posix_profile_ : posix_profile option)
    ?role:(role_ : role option) ?ssh_public_keys:(ssh_public_keys_ : ssh_public_keys option)
    ?tags:(tags_ : tags option) ?user_name:(user_name_ : user_name option) ~arn:(arn_ : arn) () =
  ({
     arn = arn_;
     home_directory = home_directory_;
     home_directory_mappings = home_directory_mappings_;
     home_directory_type = home_directory_type_;
     policy = policy_;
     posix_profile = posix_profile_;
     role = role_;
     ssh_public_keys = ssh_public_keys_;
     tags = tags_;
     user_name = user_name_;
   }
    : described_user)

let make_describe_user_response ~server_id:(server_id_ : server_id) ~user:(user_ : described_user)
    () =
  ({ server_id = server_id_; user = user_ } : describe_user_response)

let make_describe_user_request ~server_id:(server_id_ : server_id)
    ~user_name:(user_name_ : user_name) () =
  ({ server_id = server_id_; user_name = user_name_ } : describe_user_request)

let make_described_web_app_vpc_config ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    () =
  ({ subnet_ids = subnet_ids_; vpc_id = vpc_id_; vpc_endpoint_id = vpc_endpoint_id_ }
    : described_web_app_vpc_config)

let make_described_identity_center_config
    ?application_arn:(application_arn_ : identity_center_application_arn option)
    ?instance_arn:(instance_arn_ : identity_center_instance_arn option) ?role:(role_ : role option)
    () =
  ({ application_arn = application_arn_; instance_arn = instance_arn_; role = role_ }
    : described_identity_center_config)

let make_described_web_app
    ?described_identity_provider_details:
      (described_identity_provider_details_ : described_web_app_identity_provider_details option)
    ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ?web_app_endpoint:(web_app_endpoint_ : web_app_endpoint option)
    ?web_app_units:(web_app_units_ : web_app_units option) ?tags:(tags_ : tags option)
    ?web_app_endpoint_policy:(web_app_endpoint_policy_ : web_app_endpoint_policy option)
    ?endpoint_type:(endpoint_type_ : web_app_endpoint_type option)
    ?described_endpoint_details:
      (described_endpoint_details_ : described_web_app_endpoint_details option) ~arn:(arn_ : arn)
    ~web_app_id:(web_app_id_ : web_app_id) () =
  ({
     arn = arn_;
     web_app_id = web_app_id_;
     described_identity_provider_details = described_identity_provider_details_;
     access_endpoint = access_endpoint_;
     web_app_endpoint = web_app_endpoint_;
     web_app_units = web_app_units_;
     tags = tags_;
     web_app_endpoint_policy = web_app_endpoint_policy_;
     endpoint_type = endpoint_type_;
     described_endpoint_details = described_endpoint_details_;
   }
    : described_web_app)

let make_describe_web_app_response ~web_app:(web_app_ : described_web_app) () =
  ({ web_app = web_app_ } : describe_web_app_response)

let make_describe_web_app_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : describe_web_app_request)

let make_described_web_app_customization ?title:(title_ : web_app_title option)
    ?logo_file:(logo_file_ : web_app_logo_file option)
    ?favicon_file:(favicon_file_ : web_app_favicon_file option) ~arn:(arn_ : arn)
    ~web_app_id:(web_app_id_ : web_app_id) () =
  ({
     arn = arn_;
     web_app_id = web_app_id_;
     title = title_;
     logo_file = logo_file_;
     favicon_file = favicon_file_;
   }
    : described_web_app_customization)

let make_describe_web_app_customization_response
    ~web_app_customization:(web_app_customization_ : described_web_app_customization) () =
  ({ web_app_customization = web_app_customization_ } : describe_web_app_customization_response)

let make_describe_web_app_customization_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : describe_web_app_customization_request)

let make_described_workflow ?description:(description_ : workflow_description option)
    ?steps:(steps_ : workflow_steps option)
    ?on_exception_steps:(on_exception_steps_ : workflow_steps option)
    ?workflow_id:(workflow_id_ : workflow_id option) ?tags:(tags_ : tags option) ~arn:(arn_ : arn)
    () =
  ({
     arn = arn_;
     description = description_;
     steps = steps_;
     on_exception_steps = on_exception_steps_;
     workflow_id = workflow_id_;
     tags = tags_;
   }
    : described_workflow)

let make_describe_workflow_response ~workflow:(workflow_ : described_workflow) () =
  ({ workflow = workflow_ } : describe_workflow_response)

let make_describe_workflow_request ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_ } : describe_workflow_request)

let make_import_certificate_response ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : import_certificate_response)

let make_import_certificate_request
    ?certificate_chain:(certificate_chain_ : certificate_chain_type option)
    ?private_key:(private_key_ : private_key_type option)
    ?active_date:(active_date_ : cert_date option)
    ?inactive_date:(inactive_date_ : cert_date option)
    ?description:(description_ : description option) ?tags:(tags_ : tags option)
    ~usage:(usage_ : certificate_usage_type) ~certificate:(certificate_ : certificate_body_type) ()
    =
  ({
     usage = usage_;
     certificate = certificate_;
     certificate_chain = certificate_chain_;
     private_key = private_key_;
     active_date = active_date_;
     inactive_date = inactive_date_;
     description = description_;
     tags = tags_;
   }
    : import_certificate_request)

let make_import_host_key_response ~server_id:(server_id_ : server_id)
    ~host_key_id:(host_key_id_ : host_key_id) () =
  ({ server_id = server_id_; host_key_id = host_key_id_ } : import_host_key_response)

let make_import_host_key_request ?description:(description_ : host_key_description option)
    ?tags:(tags_ : tags option) ~server_id:(server_id_ : server_id)
    ~host_key_body:(host_key_body_ : host_key) () =
  ({
     server_id = server_id_;
     host_key_body = host_key_body_;
     description = description_;
     tags = tags_;
   }
    : import_host_key_request)

let make_import_ssh_public_key_response ~server_id:(server_id_ : server_id)
    ~ssh_public_key_id:(ssh_public_key_id_ : ssh_public_key_id) ~user_name:(user_name_ : user_name)
    () =
  ({ server_id = server_id_; ssh_public_key_id = ssh_public_key_id_; user_name = user_name_ }
    : import_ssh_public_key_response)

let make_import_ssh_public_key_request ~server_id:(server_id_ : server_id)
    ~ssh_public_key_body:(ssh_public_key_body_ : ssh_public_key_body)
    ~user_name:(user_name_ : user_name) () =
  ({ server_id = server_id_; ssh_public_key_body = ssh_public_key_body_; user_name = user_name_ }
    : import_ssh_public_key_request)

let make_listed_access ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?role:(role_ : role option) ?external_id:(external_id_ : external_id option) () =
  ({
     home_directory = home_directory_;
     home_directory_type = home_directory_type_;
     role = role_;
     external_id = external_id_;
   }
    : listed_access)

let make_list_accesses_response ?next_token:(next_token_ : next_token option)
    ~server_id:(server_id_ : server_id) ~accesses:(accesses_ : listed_accesses) () =
  ({ next_token = next_token_; server_id = server_id_; accesses = accesses_ }
    : list_accesses_response)

let make_list_accesses_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~server_id:(server_id_ : server_id) () =
  ({ max_results = max_results_; next_token = next_token_; server_id = server_id_ }
    : list_accesses_request)

let make_listed_agreement ?arn:(arn_ : arn option)
    ?agreement_id:(agreement_id_ : agreement_id option)
    ?description:(description_ : description option)
    ?status:(status_ : agreement_status_type option) ?server_id:(server_id_ : server_id option)
    ?local_profile_id:(local_profile_id_ : profile_id option)
    ?partner_profile_id:(partner_profile_id_ : profile_id option) () =
  ({
     arn = arn_;
     agreement_id = agreement_id_;
     description = description_;
     status = status_;
     server_id = server_id_;
     local_profile_id = local_profile_id_;
     partner_profile_id = partner_profile_id_;
   }
    : listed_agreement)

let make_list_agreements_response ?next_token:(next_token_ : next_token option)
    ~agreements:(agreements_ : listed_agreements) () =
  ({ next_token = next_token_; agreements = agreements_ } : list_agreements_response)

let make_list_agreements_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~server_id:(server_id_ : server_id) () =
  ({ max_results = max_results_; next_token = next_token_; server_id = server_id_ }
    : list_agreements_request)

let make_listed_certificate ?arn:(arn_ : arn option)
    ?certificate_id:(certificate_id_ : certificate_id option)
    ?usage:(usage_ : certificate_usage_type option)
    ?status:(status_ : certificate_status_type option)
    ?active_date:(active_date_ : cert_date option)
    ?inactive_date:(inactive_date_ : cert_date option) ?type_:(type__ : certificate_type option)
    ?description:(description_ : description option) () =
  ({
     arn = arn_;
     certificate_id = certificate_id_;
     usage = usage_;
     status = status_;
     active_date = active_date_;
     inactive_date = inactive_date_;
     type_ = type__;
     description = description_;
   }
    : listed_certificate)

let make_list_certificates_response ?next_token:(next_token_ : next_token option)
    ~certificates:(certificates_ : listed_certificates) () =
  ({ next_token = next_token_; certificates = certificates_ } : list_certificates_response)

let make_list_certificates_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_certificates_request)

let make_listed_connector ?arn:(arn_ : arn option)
    ?connector_id:(connector_id_ : connector_id option) ?url:(url_ : url option) () =
  ({ arn = arn_; connector_id = connector_id_; url = url_ } : listed_connector)

let make_list_connectors_response ?next_token:(next_token_ : next_token option)
    ~connectors:(connectors_ : listed_connectors) () =
  ({ next_token = next_token_; connectors = connectors_ } : list_connectors_response)

let make_list_connectors_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_connectors_request)

let make_listed_execution ?execution_id:(execution_id_ : execution_id option)
    ?initial_file_location:(initial_file_location_ : file_location option)
    ?service_metadata:(service_metadata_ : service_metadata option)
    ?status:(status_ : execution_status option) () =
  ({
     execution_id = execution_id_;
     initial_file_location = initial_file_location_;
     service_metadata = service_metadata_;
     status = status_;
   }
    : listed_execution)

let make_list_executions_response ?next_token:(next_token_ : next_token option)
    ~workflow_id:(workflow_id_ : workflow_id) ~executions:(executions_ : listed_executions) () =
  ({ next_token = next_token_; workflow_id = workflow_id_; executions = executions_ }
    : list_executions_response)

let make_list_executions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ max_results = max_results_; next_token = next_token_; workflow_id = workflow_id_ }
    : list_executions_request)

let make_list_file_transfer_results_response ?next_token:(next_token_ : next_token option)
    ~file_transfer_results:(file_transfer_results_ : connector_file_transfer_results) () =
  ({ file_transfer_results = file_transfer_results_; next_token = next_token_ }
    : list_file_transfer_results_response)

let make_list_file_transfer_results_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~connector_id:(connector_id_ : connector_id)
    ~transfer_id:(transfer_id_ : transfer_id) () =
  ({
     connector_id = connector_id_;
     transfer_id = transfer_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_file_transfer_results_request)

let make_listed_host_key ?host_key_id:(host_key_id_ : host_key_id option)
    ?fingerprint:(fingerprint_ : host_key_fingerprint option)
    ?description:(description_ : host_key_description option) ?type_:(type__ : host_key_type option)
    ?date_imported:(date_imported_ : date_imported option) ~arn:(arn_ : arn) () =
  ({
     arn = arn_;
     host_key_id = host_key_id_;
     fingerprint = fingerprint_;
     description = description_;
     type_ = type__;
     date_imported = date_imported_;
   }
    : listed_host_key)

let make_list_host_keys_response ?next_token:(next_token_ : next_token option)
    ~server_id:(server_id_ : server_id) ~host_keys:(host_keys_ : listed_host_keys) () =
  ({ next_token = next_token_; server_id = server_id_; host_keys = host_keys_ }
    : list_host_keys_response)

let make_list_host_keys_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~server_id:(server_id_ : server_id) () =
  ({ max_results = max_results_; next_token = next_token_; server_id = server_id_ }
    : list_host_keys_request)

let make_listed_profile ?arn:(arn_ : arn option) ?profile_id:(profile_id_ : profile_id option)
    ?as2_id:(as2_id_ : as2_id option) ?profile_type:(profile_type_ : profile_type option) () =
  ({ arn = arn_; profile_id = profile_id_; as2_id = as2_id_; profile_type = profile_type_ }
    : listed_profile)

let make_list_profiles_response ?next_token:(next_token_ : next_token option)
    ~profiles:(profiles_ : listed_profiles) () =
  ({ next_token = next_token_; profiles = profiles_ } : list_profiles_response)

let make_list_profiles_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?profile_type:(profile_type_ : profile_type option) () =
  ({ max_results = max_results_; next_token = next_token_; profile_type = profile_type_ }
    : list_profiles_request)

let make_list_security_policies_response ?next_token:(next_token_ : next_token option)
    ~security_policy_names:(security_policy_names_ : security_policy_names) () =
  ({ next_token = next_token_; security_policy_names = security_policy_names_ }
    : list_security_policies_response)

let make_list_security_policies_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_security_policies_request)

let make_listed_server ?domain:(domain_ : domain option)
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?logging_role:(logging_role_ : role option) ?server_id:(server_id_ : server_id option)
    ?state:(state_ : state option) ?user_count:(user_count_ : user_count option) ~arn:(arn_ : arn)
    () =
  ({
     arn = arn_;
     domain = domain_;
     identity_provider_type = identity_provider_type_;
     endpoint_type = endpoint_type_;
     logging_role = logging_role_;
     server_id = server_id_;
     state = state_;
     user_count = user_count_;
   }
    : listed_server)

let make_list_servers_response ?next_token:(next_token_ : next_token option)
    ~servers:(servers_ : listed_servers) () =
  ({ next_token = next_token_; servers = servers_ } : list_servers_response)

let make_list_servers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_servers_request)

let make_list_tags_for_resource_response ?arn:(arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?tags:(tags_ : tags option) () =
  ({ arn = arn_; next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~arn:(arn_ : arn) () =
  ({ arn = arn_; max_results = max_results_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_listed_user ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?role:(role_ : role option)
    ?ssh_public_key_count:(ssh_public_key_count_ : ssh_public_key_count option)
    ?user_name:(user_name_ : user_name option) ~arn:(arn_ : arn) () =
  ({
     arn = arn_;
     home_directory = home_directory_;
     home_directory_type = home_directory_type_;
     role = role_;
     ssh_public_key_count = ssh_public_key_count_;
     user_name = user_name_;
   }
    : listed_user)

let make_list_users_response ?next_token:(next_token_ : next_token option)
    ~server_id:(server_id_ : server_id) ~users:(users_ : listed_users) () =
  ({ next_token = next_token_; server_id = server_id_; users = users_ } : list_users_response)

let make_list_users_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~server_id:(server_id_ : server_id) () =
  ({ max_results = max_results_; next_token = next_token_; server_id = server_id_ }
    : list_users_request)

let make_listed_web_app ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ?web_app_endpoint:(web_app_endpoint_ : web_app_endpoint option)
    ?endpoint_type:(endpoint_type_ : web_app_endpoint_type option) ~arn:(arn_ : arn)
    ~web_app_id:(web_app_id_ : web_app_id) () =
  ({
     arn = arn_;
     web_app_id = web_app_id_;
     access_endpoint = access_endpoint_;
     web_app_endpoint = web_app_endpoint_;
     endpoint_type = endpoint_type_;
   }
    : listed_web_app)

let make_list_web_apps_response ?next_token:(next_token_ : next_token option)
    ~web_apps:(web_apps_ : listed_web_apps) () =
  ({ next_token = next_token_; web_apps = web_apps_ } : list_web_apps_response)

let make_list_web_apps_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_web_apps_request)

let make_listed_workflow ?workflow_id:(workflow_id_ : workflow_id option)
    ?description:(description_ : workflow_description option) ?arn:(arn_ : arn option) () =
  ({ workflow_id = workflow_id_; description = description_; arn = arn_ } : listed_workflow)

let make_list_workflows_response ?next_token:(next_token_ : next_token option)
    ~workflows:(workflows_ : listed_workflows) () =
  ({ next_token = next_token_; workflows = workflows_ } : list_workflows_response)

let make_list_workflows_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_workflows_request)

let make_send_workflow_step_state_response () = (() : unit)

let make_send_workflow_step_state_request ~workflow_id:(workflow_id_ : workflow_id)
    ~execution_id:(execution_id_ : execution_id) ~token:(token_ : callback_token)
    ~status:(status_ : custom_step_status) () =
  ({ workflow_id = workflow_id_; execution_id = execution_id_; token = token_; status = status_ }
    : send_workflow_step_state_request)

let make_sftp_connector_connection_details ?host_key:(host_key_ : sftp_connector_host_key option) ()
    =
  ({ host_key = host_key_ } : sftp_connector_connection_details)

let make_start_directory_listing_response ~listing_id:(listing_id_ : listing_id)
    ~output_file_name:(output_file_name_ : output_file_name) () =
  ({ listing_id = listing_id_; output_file_name = output_file_name_ }
    : start_directory_listing_response)

let make_start_directory_listing_request ?max_items:(max_items_ : max_items option)
    ~connector_id:(connector_id_ : connector_id)
    ~remote_directory_path:(remote_directory_path_ : file_path)
    ~output_directory_path:(output_directory_path_ : file_path) () =
  ({
     connector_id = connector_id_;
     remote_directory_path = remote_directory_path_;
     max_items = max_items_;
     output_directory_path = output_directory_path_;
   }
    : start_directory_listing_request)

let make_start_file_transfer_response ~transfer_id:(transfer_id_ : transfer_id) () =
  ({ transfer_id = transfer_id_ } : start_file_transfer_response)

let make_start_file_transfer_request ?send_file_paths:(send_file_paths_ : file_paths option)
    ?retrieve_file_paths:(retrieve_file_paths_ : file_paths option)
    ?local_directory_path:(local_directory_path_ : file_path option)
    ?remote_directory_path:(remote_directory_path_ : file_path option)
    ?custom_http_headers:(custom_http_headers_ : custom_http_headers option)
    ~connector_id:(connector_id_ : connector_id) () =
  ({
     connector_id = connector_id_;
     send_file_paths = send_file_paths_;
     retrieve_file_paths = retrieve_file_paths_;
     local_directory_path = local_directory_path_;
     remote_directory_path = remote_directory_path_;
     custom_http_headers = custom_http_headers_;
   }
    : start_file_transfer_request)

let make_start_remote_delete_response ~delete_id:(delete_id_ : delete_id) () =
  ({ delete_id = delete_id_ } : start_remote_delete_response)

let make_start_remote_delete_request ~connector_id:(connector_id_ : connector_id)
    ~delete_path:(delete_path_ : file_path) () =
  ({ connector_id = connector_id_; delete_path = delete_path_ } : start_remote_delete_request)

let make_start_remote_move_response ~move_id:(move_id_ : move_id) () =
  ({ move_id = move_id_ } : start_remote_move_response)

let make_start_remote_move_request ~connector_id:(connector_id_ : connector_id)
    ~source_path:(source_path_ : file_path) ~target_path:(target_path_ : file_path) () =
  ({ connector_id = connector_id_; source_path = source_path_; target_path = target_path_ }
    : start_remote_move_request)

let make_start_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : start_server_request)

let make_stop_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : stop_server_request)

let make_tag_resource_request ~arn:(arn_ : arn) ~tags:(tags_ : tags) () =
  ({ arn = arn_; tags = tags_ } : tag_resource_request)

let make_test_connection_response ?connector_id:(connector_id_ : connector_id option)
    ?status:(status_ : status option) ?status_message:(status_message_ : message option)
    ?sftp_connection_details:(sftp_connection_details_ : sftp_connector_connection_details option)
    () =
  ({
     connector_id = connector_id_;
     status = status_;
     status_message = status_message_;
     sftp_connection_details = sftp_connection_details_;
   }
    : test_connection_response)

let make_test_connection_request ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : test_connection_request)

let make_test_identity_provider_response ?response:(response_ : response option)
    ?message:(message_ : message option) ~status_code:(status_code_ : status_code) ~url:(url_ : url)
    () =
  ({ response = response_; status_code = status_code_; message = message_; url = url_ }
    : test_identity_provider_response)

let make_test_identity_provider_request ?server_protocol:(server_protocol_ : protocol option)
    ?source_ip:(source_ip_ : source_ip option)
    ?user_password:(user_password_ : user_password option) ~server_id:(server_id_ : server_id)
    ~user_name:(user_name_ : user_name) () =
  ({
     server_id = server_id_;
     server_protocol = server_protocol_;
     source_ip = source_ip_;
     user_name = user_name_;
     user_password = user_password_;
   }
    : test_identity_provider_request)

let make_update_host_key_response ~server_id:(server_id_ : server_id)
    ~host_key_id:(host_key_id_ : host_key_id) () =
  ({ server_id = server_id_; host_key_id = host_key_id_ } : update_host_key_response)

let make_update_host_key_request ~server_id:(server_id_ : server_id)
    ~host_key_id:(host_key_id_ : host_key_id) ~description:(description_ : host_key_description) ()
    =
  ({ server_id = server_id_; host_key_id = host_key_id_; description = description_ }
    : update_host_key_request)

let make_update_access_response ~server_id:(server_id_ : server_id)
    ~external_id:(external_id_ : external_id) () =
  ({ server_id = server_id_; external_id = external_id_ } : update_access_response)

let make_update_access_request ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?policy:(policy_ : policy option) ?posix_profile:(posix_profile_ : posix_profile option)
    ?role:(role_ : role option) ~server_id:(server_id_ : server_id)
    ~external_id:(external_id_ : external_id) () =
  ({
     home_directory = home_directory_;
     home_directory_type = home_directory_type_;
     home_directory_mappings = home_directory_mappings_;
     policy = policy_;
     posix_profile = posix_profile_;
     role = role_;
     server_id = server_id_;
     external_id = external_id_;
   }
    : update_access_request)

let make_untag_resource_request ~arn:(arn_ : arn) ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ arn = arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_update_agreement_response ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ agreement_id = agreement_id_ } : update_agreement_response)

let make_update_agreement_request ?description:(description_ : description option)
    ?status:(status_ : agreement_status_type option)
    ?local_profile_id:(local_profile_id_ : profile_id option)
    ?partner_profile_id:(partner_profile_id_ : profile_id option)
    ?base_directory:(base_directory_ : home_directory option)
    ?access_role:(access_role_ : role option)
    ?preserve_filename:(preserve_filename_ : preserve_filename_type option)
    ?enforce_message_signing:(enforce_message_signing_ : enforce_message_signing_type option)
    ?custom_directories:(custom_directories_ : custom_directories_type option)
    ~agreement_id:(agreement_id_ : agreement_id) ~server_id:(server_id_ : server_id) () =
  ({
     agreement_id = agreement_id_;
     server_id = server_id_;
     description = description_;
     status = status_;
     local_profile_id = local_profile_id_;
     partner_profile_id = partner_profile_id_;
     base_directory = base_directory_;
     access_role = access_role_;
     preserve_filename = preserve_filename_;
     enforce_message_signing = enforce_message_signing_;
     custom_directories = custom_directories_;
   }
    : update_agreement_request)

let make_update_certificate_response ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : update_certificate_response)

let make_update_certificate_request ?active_date:(active_date_ : cert_date option)
    ?inactive_date:(inactive_date_ : cert_date option)
    ?description:(description_ : description option)
    ~certificate_id:(certificate_id_ : certificate_id) () =
  ({
     certificate_id = certificate_id_;
     active_date = active_date_;
     inactive_date = inactive_date_;
     description = description_;
   }
    : update_certificate_request)

let make_update_connector_response ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : update_connector_response)

let make_update_connector_vpc_lattice_egress_config
    ?resource_configuration_arn:
      (resource_configuration_arn_ : vpc_lattice_resource_configuration_arn option)
    ?port_number:(port_number_ : sftp_port option) () =
  ({ resource_configuration_arn = resource_configuration_arn_; port_number = port_number_ }
    : update_connector_vpc_lattice_egress_config)

let make_update_connector_request ?url:(url_ : url option)
    ?as2_config:(as2_config_ : as2_connector_config option)
    ?access_role:(access_role_ : role option) ?logging_role:(logging_role_ : role option)
    ?sftp_config:(sftp_config_ : sftp_connector_config option)
    ?security_policy_name:(security_policy_name_ : connector_security_policy_name option)
    ?egress_config:(egress_config_ : update_connector_egress_config option)
    ?ip_address_type:(ip_address_type_ : connectors_ip_address_type option)
    ~connector_id:(connector_id_ : connector_id) () =
  ({
     connector_id = connector_id_;
     url = url_;
     as2_config = as2_config_;
     access_role = access_role_;
     logging_role = logging_role_;
     sftp_config = sftp_config_;
     security_policy_name = security_policy_name_;
     egress_config = egress_config_;
     ip_address_type = ip_address_type_;
   }
    : update_connector_request)

let make_update_profile_response ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : update_profile_response)

let make_update_profile_request ?certificate_ids:(certificate_ids_ : certificate_ids option)
    ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_; certificate_ids = certificate_ids_ } : update_profile_request)

let make_update_server_response ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : update_server_response)

let make_update_server_request ?certificate:(certificate_ : certificate option)
    ?protocol_details:(protocol_details_ : protocol_details option)
    ?endpoint_details:(endpoint_details_ : endpoint_details option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option) ?host_key:(host_key_ : host_key option)
    ?identity_provider_details:(identity_provider_details_ : identity_provider_details option)
    ?logging_role:(logging_role_ : nullable_role option)
    ?post_authentication_login_banner:
      (post_authentication_login_banner_ : post_authentication_login_banner option)
    ?pre_authentication_login_banner:
      (pre_authentication_login_banner_ : pre_authentication_login_banner option)
    ?protocols:(protocols_ : protocols option)
    ?security_policy_name:(security_policy_name_ : security_policy_name option)
    ?workflow_details:(workflow_details_ : workflow_details option)
    ?structured_log_destinations:(structured_log_destinations_ : structured_log_destinations option)
    ?s3_storage_options:(s3_storage_options_ : s3_storage_options option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ~server_id:(server_id_ : server_id) () =
  ({
     certificate = certificate_;
     protocol_details = protocol_details_;
     endpoint_details = endpoint_details_;
     endpoint_type = endpoint_type_;
     host_key = host_key_;
     identity_provider_details = identity_provider_details_;
     logging_role = logging_role_;
     post_authentication_login_banner = post_authentication_login_banner_;
     pre_authentication_login_banner = pre_authentication_login_banner_;
     protocols = protocols_;
     security_policy_name = security_policy_name_;
     server_id = server_id_;
     workflow_details = workflow_details_;
     structured_log_destinations = structured_log_destinations_;
     s3_storage_options = s3_storage_options_;
     ip_address_type = ip_address_type_;
     identity_provider_type = identity_provider_type_;
   }
    : update_server_request)

let make_update_user_response ~server_id:(server_id_ : server_id)
    ~user_name:(user_name_ : user_name) () =
  ({ server_id = server_id_; user_name = user_name_ } : update_user_response)

let make_update_user_request ?home_directory:(home_directory_ : home_directory option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?policy:(policy_ : policy option) ?posix_profile:(posix_profile_ : posix_profile option)
    ?role:(role_ : role option) ~server_id:(server_id_ : server_id)
    ~user_name:(user_name_ : user_name) () =
  ({
     home_directory = home_directory_;
     home_directory_type = home_directory_type_;
     home_directory_mappings = home_directory_mappings_;
     policy = policy_;
     posix_profile = posix_profile_;
     role = role_;
     server_id = server_id_;
     user_name = user_name_;
   }
    : update_user_request)

let make_update_web_app_response ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : update_web_app_response)

let make_update_web_app_vpc_config ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?ip_address_type:(ip_address_type_ : web_app_vpc_endpoint_ip_address_type option) () =
  ({ subnet_ids = subnet_ids_; ip_address_type = ip_address_type_ } : update_web_app_vpc_config)

let make_update_web_app_identity_center_config ?role:(role_ : role option) () =
  ({ role = role_ } : update_web_app_identity_center_config)

let make_update_web_app_request
    ?identity_provider_details:
      (identity_provider_details_ : update_web_app_identity_provider_details option)
    ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ?web_app_units:(web_app_units_ : web_app_units option)
    ?endpoint_details:(endpoint_details_ : update_web_app_endpoint_details option)
    ~web_app_id:(web_app_id_ : web_app_id) () =
  ({
     web_app_id = web_app_id_;
     identity_provider_details = identity_provider_details_;
     access_endpoint = access_endpoint_;
     web_app_units = web_app_units_;
     endpoint_details = endpoint_details_;
   }
    : update_web_app_request)

let make_update_web_app_customization_response ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : update_web_app_customization_response)

let make_update_web_app_customization_request ?title:(title_ : web_app_title option)
    ?logo_file:(logo_file_ : web_app_logo_file option)
    ?favicon_file:(favicon_file_ : web_app_favicon_file option)
    ~web_app_id:(web_app_id_ : web_app_id) () =
  ({
     web_app_id = web_app_id_;
     title = title_;
     logo_file = logo_file_;
     favicon_file = favicon_file_;
   }
    : update_web_app_customization_request)
