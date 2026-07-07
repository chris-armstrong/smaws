open Types

let make_s3_input_file_location ?key:(key_ : s3_key option) ?bucket:(bucket_ : s3_bucket option) ()
    =
  ({ key = key_; bucket = bucket_ } : s3_input_file_location)

let make_efs_file_location ?path:(path_ : efs_path option)
    ?file_system_id:(file_system_id_ : efs_file_system_id option) () =
  ({ path = path_; file_system_id = file_system_id_ } : efs_file_location)

let make_input_file_location ?efs_file_location:(efs_file_location_ : efs_file_location option)
    ?s3_file_location:(s3_file_location_ : s3_input_file_location option) () =
  ({ efs_file_location = efs_file_location_; s3_file_location = s3_file_location_ }
    : input_file_location)

let make_copy_step_details
    ?source_file_location:(source_file_location_ : source_file_location option)
    ?overwrite_existing:(overwrite_existing_ : overwrite_existing option)
    ?destination_file_location:(destination_file_location_ : input_file_location option)
    ?name:(name_ : workflow_step_name option) () =
  ({
     source_file_location = source_file_location_;
     overwrite_existing = overwrite_existing_;
     destination_file_location = destination_file_location_;
     name = name_;
   }
    : copy_step_details)

let make_custom_step_details
    ?source_file_location:(source_file_location_ : source_file_location option)
    ?timeout_seconds:(timeout_seconds_ : custom_step_timeout_seconds option)
    ?target:(target_ : custom_step_target option) ?name:(name_ : workflow_step_name option) () =
  ({
     source_file_location = source_file_location_;
     timeout_seconds = timeout_seconds_;
     target = target_;
     name = name_;
   }
    : custom_step_details)

let make_delete_step_details
    ?source_file_location:(source_file_location_ : source_file_location option)
    ?name:(name_ : workflow_step_name option) () =
  ({ source_file_location = source_file_location_; name = name_ } : delete_step_details)

let make_s3_tag ~value:(value_ : s3_tag_value) ~key:(key_ : s3_tag_key) () =
  ({ value = value_; key = key_ } : s3_tag)

let make_tag_step_details
    ?source_file_location:(source_file_location_ : source_file_location option)
    ?tags:(tags_ : s3_tags option) ?name:(name_ : workflow_step_name option) () =
  ({ source_file_location = source_file_location_; tags = tags_; name = name_ } : tag_step_details)

let make_decrypt_step_details ?overwrite_existing:(overwrite_existing_ : overwrite_existing option)
    ?source_file_location:(source_file_location_ : source_file_location option)
    ?name:(name_ : workflow_step_name option)
    ~destination_file_location:(destination_file_location_ : input_file_location)
    ~type_:(type__ : encryption_type) () =
  ({
     destination_file_location = destination_file_location_;
     overwrite_existing = overwrite_existing_;
     source_file_location = source_file_location_;
     type_ = type__;
     name = name_;
   }
    : decrypt_step_details)

let make_workflow_step ?decrypt_step_details:(decrypt_step_details_ : decrypt_step_details option)
    ?tag_step_details:(tag_step_details_ : tag_step_details option)
    ?delete_step_details:(delete_step_details_ : delete_step_details option)
    ?custom_step_details:(custom_step_details_ : custom_step_details option)
    ?copy_step_details:(copy_step_details_ : copy_step_details option)
    ?type_:(type__ : workflow_step_type option) () =
  ({
     decrypt_step_details = decrypt_step_details_;
     tag_step_details = tag_step_details_;
     delete_step_details = delete_step_details_;
     custom_step_details = custom_step_details_;
     copy_step_details = copy_step_details_;
     type_ = type__;
   }
    : workflow_step)

let make_workflow_detail ~execution_role:(execution_role_ : role)
    ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ execution_role = execution_role_; workflow_id = workflow_id_ } : workflow_detail)

let make_workflow_details
    ?on_partial_upload:(on_partial_upload_ : on_partial_upload_workflow_details option)
    ?on_upload:(on_upload_ : on_upload_workflow_details option) () =
  ({ on_partial_upload = on_partial_upload_; on_upload = on_upload_ } : workflow_details)

let make_web_app_vpc_config
    ?ip_address_type:(ip_address_type_ : web_app_vpc_endpoint_ip_address_type option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?subnet_ids:(subnet_ids_ : subnet_ids option) () =
  ({
     ip_address_type = ip_address_type_;
     security_group_ids = security_group_ids_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
   }
    : web_app_vpc_config)

let make_identity_center_config ?role:(role_ : role option)
    ?instance_arn:(instance_arn_ : identity_center_instance_arn option) () =
  ({ role = role_; instance_arn = instance_arn_ } : identity_center_config)

let make_user_details ?session_id:(session_id_ : session_id option)
    ~server_id:(server_id_ : server_id) ~user_name:(user_name_ : user_name) () =
  ({ session_id = session_id_; server_id = server_id_; user_name = user_name_ } : user_details)

let make_update_web_app_vpc_config
    ?ip_address_type:(ip_address_type_ : web_app_vpc_endpoint_ip_address_type option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option) () =
  ({ ip_address_type = ip_address_type_; subnet_ids = subnet_ids_ } : update_web_app_vpc_config)

let make_update_web_app_response ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : update_web_app_response)

let make_update_web_app_identity_center_config ?role:(role_ : role option) () =
  ({ role = role_ } : update_web_app_identity_center_config)

let make_update_web_app_request
    ?endpoint_details:(endpoint_details_ : update_web_app_endpoint_details option)
    ?web_app_units:(web_app_units_ : web_app_units option)
    ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ?identity_provider_details:
      (identity_provider_details_ : update_web_app_identity_provider_details option)
    ~web_app_id:(web_app_id_ : web_app_id) () =
  ({
     endpoint_details = endpoint_details_;
     web_app_units = web_app_units_;
     access_endpoint = access_endpoint_;
     identity_provider_details = identity_provider_details_;
     web_app_id = web_app_id_;
   }
    : update_web_app_request)

let make_update_web_app_customization_response ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : update_web_app_customization_response)

let make_update_web_app_customization_request
    ?favicon_file:(favicon_file_ : web_app_favicon_file option)
    ?logo_file:(logo_file_ : web_app_logo_file option) ?title:(title_ : web_app_title option)
    ~web_app_id:(web_app_id_ : web_app_id) () =
  ({
     favicon_file = favicon_file_;
     logo_file = logo_file_;
     title = title_;
     web_app_id = web_app_id_;
   }
    : update_web_app_customization_request)

let make_update_user_response ~user_name:(user_name_ : user_name)
    ~server_id:(server_id_ : server_id) () =
  ({ user_name = user_name_; server_id = server_id_ } : update_user_response)

let make_home_directory_map_entry ?type_:(type__ : map_type option) ~target:(target_ : map_target)
    ~entry:(entry_ : map_entry) () =
  ({ type_ = type__; target = target_; entry = entry_ } : home_directory_map_entry)

let make_posix_profile ?secondary_gids:(secondary_gids_ : secondary_gids option)
    ~gid:(gid_ : posix_id) ~uid:(uid_ : posix_id) () =
  ({ secondary_gids = secondary_gids_; gid = gid_; uid = uid_ } : posix_profile)

let make_update_user_request ?role:(role_ : role option)
    ?posix_profile:(posix_profile_ : posix_profile option) ?policy:(policy_ : policy option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory:(home_directory_ : home_directory option) ~user_name:(user_name_ : user_name)
    ~server_id:(server_id_ : server_id) () =
  ({
     user_name = user_name_;
     server_id = server_id_;
     role = role_;
     posix_profile = posix_profile_;
     policy = policy_;
     home_directory_mappings = home_directory_mappings_;
     home_directory_type = home_directory_type_;
     home_directory = home_directory_;
   }
    : update_user_request)

let make_update_server_response ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : update_server_response)

let make_protocol_details ?as2_transports:(as2_transports_ : as2_transports option)
    ?set_stat_option:(set_stat_option_ : set_stat_option option)
    ?tls_session_resumption_mode:(tls_session_resumption_mode_ : tls_session_resumption_mode option)
    ?passive_ip:(passive_ip_ : passive_ip option) () =
  ({
     as2_transports = as2_transports_;
     set_stat_option = set_stat_option_;
     tls_session_resumption_mode = tls_session_resumption_mode_;
     passive_ip = passive_ip_;
   }
    : protocol_details)

let make_endpoint_details ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?address_allocation_ids:(address_allocation_ids_ : address_allocation_ids option) () =
  ({
     security_group_ids = security_group_ids_;
     vpc_id = vpc_id_;
     vpc_endpoint_id = vpc_endpoint_id_;
     subnet_ids = subnet_ids_;
     address_allocation_ids = address_allocation_ids_;
   }
    : endpoint_details)

let make_identity_provider_details
    ?sftp_authentication_methods:(sftp_authentication_methods_ : sftp_authentication_methods option)
    ?\#function:(function_ : \#function option) ?directory_id:(directory_id_ : directory_id option)
    ?invocation_role:(invocation_role_ : role option) ?url:(url_ : url option) () =
  ({
     sftp_authentication_methods = sftp_authentication_methods_;
     \#function = function_;
     directory_id = directory_id_;
     invocation_role = invocation_role_;
     url = url_;
   }
    : identity_provider_details)

let make_s3_storage_options
    ?directory_listing_optimization:
      (directory_listing_optimization_ : directory_listing_optimization option) () =
  ({ directory_listing_optimization = directory_listing_optimization_ } : s3_storage_options)

let make_update_server_request
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?s3_storage_options:(s3_storage_options_ : s3_storage_options option)
    ?structured_log_destinations:(structured_log_destinations_ : structured_log_destinations option)
    ?workflow_details:(workflow_details_ : workflow_details option)
    ?security_policy_name:(security_policy_name_ : security_policy_name option)
    ?protocols:(protocols_ : protocols option)
    ?pre_authentication_login_banner:
      (pre_authentication_login_banner_ : pre_authentication_login_banner option)
    ?post_authentication_login_banner:
      (post_authentication_login_banner_ : post_authentication_login_banner option)
    ?logging_role:(logging_role_ : nullable_role option)
    ?identity_provider_details:(identity_provider_details_ : identity_provider_details option)
    ?host_key:(host_key_ : host_key option) ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?endpoint_details:(endpoint_details_ : endpoint_details option)
    ?protocol_details:(protocol_details_ : protocol_details option)
    ?certificate:(certificate_ : certificate option) ~server_id:(server_id_ : server_id) () =
  ({
     identity_provider_type = identity_provider_type_;
     ip_address_type = ip_address_type_;
     s3_storage_options = s3_storage_options_;
     structured_log_destinations = structured_log_destinations_;
     workflow_details = workflow_details_;
     server_id = server_id_;
     security_policy_name = security_policy_name_;
     protocols = protocols_;
     pre_authentication_login_banner = pre_authentication_login_banner_;
     post_authentication_login_banner = post_authentication_login_banner_;
     logging_role = logging_role_;
     identity_provider_details = identity_provider_details_;
     host_key = host_key_;
     endpoint_type = endpoint_type_;
     endpoint_details = endpoint_details_;
     protocol_details = protocol_details_;
     certificate = certificate_;
   }
    : update_server_request)

let make_update_profile_response ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : update_profile_response)

let make_update_profile_request ?certificate_ids:(certificate_ids_ : certificate_ids option)
    ~profile_id:(profile_id_ : profile_id) () =
  ({ certificate_ids = certificate_ids_; profile_id = profile_id_ } : update_profile_request)

let make_update_host_key_response ~host_key_id:(host_key_id_ : host_key_id)
    ~server_id:(server_id_ : server_id) () =
  ({ host_key_id = host_key_id_; server_id = server_id_ } : update_host_key_response)

let make_update_host_key_request ~description:(description_ : host_key_description)
    ~host_key_id:(host_key_id_ : host_key_id) ~server_id:(server_id_ : server_id) () =
  ({ description = description_; host_key_id = host_key_id_; server_id = server_id_ }
    : update_host_key_request)

let make_update_connector_vpc_lattice_egress_config ?port_number:(port_number_ : sftp_port option)
    ?resource_configuration_arn:
      (resource_configuration_arn_ : vpc_lattice_resource_configuration_arn option) () =
  ({ port_number = port_number_; resource_configuration_arn = resource_configuration_arn_ }
    : update_connector_vpc_lattice_egress_config)

let make_update_connector_response ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : update_connector_response)

let make_as2_async_mdn_connector_config ?server_ids:(server_ids_ : as2_async_mdn_server_ids option)
    ?url:(url_ : url option) () =
  ({ server_ids = server_ids_; url = url_ } : as2_async_mdn_connector_config)

let make_as2_connector_config
    ?async_mdn_config:(async_mdn_config_ : as2_async_mdn_connector_config option)
    ?preserve_content_type:(preserve_content_type_ : preserve_content_type option)
    ?basic_auth_secret_id:(basic_auth_secret_id_ : as2_connector_secret_id option)
    ?mdn_response:(mdn_response_ : mdn_response option)
    ?mdn_signing_algorithm:(mdn_signing_algorithm_ : mdn_signing_alg option)
    ?signing_algorithm:(signing_algorithm_ : signing_alg option)
    ?encryption_algorithm:(encryption_algorithm_ : encryption_alg option)
    ?compression:(compression_ : compression_enum option)
    ?message_subject:(message_subject_ : message_subject option)
    ?partner_profile_id:(partner_profile_id_ : profile_id option)
    ?local_profile_id:(local_profile_id_ : profile_id option) () =
  ({
     async_mdn_config = async_mdn_config_;
     preserve_content_type = preserve_content_type_;
     basic_auth_secret_id = basic_auth_secret_id_;
     mdn_response = mdn_response_;
     mdn_signing_algorithm = mdn_signing_algorithm_;
     signing_algorithm = signing_algorithm_;
     encryption_algorithm = encryption_algorithm_;
     compression = compression_;
     message_subject = message_subject_;
     partner_profile_id = partner_profile_id_;
     local_profile_id = local_profile_id_;
   }
    : as2_connector_config)

let make_sftp_connector_config
    ?max_concurrent_connections:(max_concurrent_connections_ : max_concurrent_connections option)
    ?trusted_host_keys:(trusted_host_keys_ : sftp_connector_trusted_host_key_list option)
    ?user_secret_id:(user_secret_id_ : secret_id option) () =
  ({
     max_concurrent_connections = max_concurrent_connections_;
     trusted_host_keys = trusted_host_keys_;
     user_secret_id = user_secret_id_;
   }
    : sftp_connector_config)

let make_update_connector_request
    ?ip_address_type:(ip_address_type_ : connectors_ip_address_type option)
    ?egress_config:(egress_config_ : update_connector_egress_config option)
    ?security_policy_name:(security_policy_name_ : connector_security_policy_name option)
    ?sftp_config:(sftp_config_ : sftp_connector_config option)
    ?logging_role:(logging_role_ : role option) ?access_role:(access_role_ : role option)
    ?as2_config:(as2_config_ : as2_connector_config option) ?url:(url_ : url option)
    ~connector_id:(connector_id_ : connector_id) () =
  ({
     ip_address_type = ip_address_type_;
     egress_config = egress_config_;
     security_policy_name = security_policy_name_;
     sftp_config = sftp_config_;
     logging_role = logging_role_;
     access_role = access_role_;
     as2_config = as2_config_;
     url = url_;
     connector_id = connector_id_;
   }
    : update_connector_request)

let make_update_certificate_response ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : update_certificate_response)

let make_update_certificate_request ?description:(description_ : description option)
    ?inactive_date:(inactive_date_ : cert_date option)
    ?active_date:(active_date_ : cert_date option)
    ~certificate_id:(certificate_id_ : certificate_id) () =
  ({
     description = description_;
     inactive_date = inactive_date_;
     active_date = active_date_;
     certificate_id = certificate_id_;
   }
    : update_certificate_request)

let make_update_agreement_response ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ agreement_id = agreement_id_ } : update_agreement_response)

let make_custom_directories_type
    ~temporary_files_directory:(temporary_files_directory_ : home_directory)
    ~status_files_directory:(status_files_directory_ : home_directory)
    ~payload_files_directory:(payload_files_directory_ : home_directory)
    ~mdn_files_directory:(mdn_files_directory_ : home_directory)
    ~failed_files_directory:(failed_files_directory_ : home_directory) () =
  ({
     temporary_files_directory = temporary_files_directory_;
     status_files_directory = status_files_directory_;
     payload_files_directory = payload_files_directory_;
     mdn_files_directory = mdn_files_directory_;
     failed_files_directory = failed_files_directory_;
   }
    : custom_directories_type)

let make_update_agreement_request
    ?custom_directories:(custom_directories_ : custom_directories_type option)
    ?enforce_message_signing:(enforce_message_signing_ : enforce_message_signing_type option)
    ?preserve_filename:(preserve_filename_ : preserve_filename_type option)
    ?access_role:(access_role_ : role option)
    ?base_directory:(base_directory_ : home_directory option)
    ?partner_profile_id:(partner_profile_id_ : profile_id option)
    ?local_profile_id:(local_profile_id_ : profile_id option)
    ?status:(status_ : agreement_status_type option)
    ?description:(description_ : description option) ~server_id:(server_id_ : server_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({
     custom_directories = custom_directories_;
     enforce_message_signing = enforce_message_signing_;
     preserve_filename = preserve_filename_;
     access_role = access_role_;
     base_directory = base_directory_;
     partner_profile_id = partner_profile_id_;
     local_profile_id = local_profile_id_;
     status = status_;
     description = description_;
     server_id = server_id_;
     agreement_id = agreement_id_;
   }
    : update_agreement_request)

let make_update_access_response ~external_id:(external_id_ : external_id)
    ~server_id:(server_id_ : server_id) () =
  ({ external_id = external_id_; server_id = server_id_ } : update_access_response)

let make_update_access_request ?role:(role_ : role option)
    ?posix_profile:(posix_profile_ : posix_profile option) ?policy:(policy_ : policy option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory:(home_directory_ : home_directory option)
    ~external_id:(external_id_ : external_id) ~server_id:(server_id_ : server_id) () =
  ({
     external_id = external_id_;
     server_id = server_id_;
     role = role_;
     posix_profile = posix_profile_;
     policy = policy_;
     home_directory_mappings = home_directory_mappings_;
     home_directory_type = home_directory_type_;
     home_directory = home_directory_;
   }
    : update_access_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys) ~arn:(arn_ : arn) () =
  ({ tag_keys = tag_keys_; arn = arn_ } : untag_resource_request)

let make_test_identity_provider_response ?message:(message_ : message option)
    ?response:(response_ : response option) ~url:(url_ : url)
    ~status_code:(status_code_ : status_code) () =
  ({ url = url_; message = message_; status_code = status_code_; response = response_ }
    : test_identity_provider_response)

let make_test_identity_provider_request ?user_password:(user_password_ : user_password option)
    ?source_ip:(source_ip_ : source_ip option) ?server_protocol:(server_protocol_ : protocol option)
    ~user_name:(user_name_ : user_name) ~server_id:(server_id_ : server_id) () =
  ({
     user_password = user_password_;
     user_name = user_name_;
     source_ip = source_ip_;
     server_protocol = server_protocol_;
     server_id = server_id_;
   }
    : test_identity_provider_request)

let make_sftp_connector_connection_details ?host_key:(host_key_ : sftp_connector_host_key option) ()
    =
  ({ host_key = host_key_ } : sftp_connector_connection_details)

let make_test_connection_response
    ?sftp_connection_details:(sftp_connection_details_ : sftp_connector_connection_details option)
    ?status_message:(status_message_ : message option) ?status:(status_ : status option)
    ?connector_id:(connector_id_ : connector_id option) () =
  ({
     sftp_connection_details = sftp_connection_details_;
     status_message = status_message_;
     status = status_;
     connector_id = connector_id_;
   }
    : test_connection_response)

let make_test_connection_request ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : test_connection_request)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tags) ~arn:(arn_ : arn) () =
  ({ tags = tags_; arn = arn_ } : tag_resource_request)

let make_stop_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : stop_server_request)

let make_start_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : start_server_request)

let make_start_remote_move_response ~move_id:(move_id_ : move_id) () =
  ({ move_id = move_id_ } : start_remote_move_response)

let make_start_remote_move_request ~target_path:(target_path_ : file_path)
    ~source_path:(source_path_ : file_path) ~connector_id:(connector_id_ : connector_id) () =
  ({ target_path = target_path_; source_path = source_path_; connector_id = connector_id_ }
    : start_remote_move_request)

let make_start_remote_delete_response ~delete_id:(delete_id_ : delete_id) () =
  ({ delete_id = delete_id_ } : start_remote_delete_response)

let make_start_remote_delete_request ~delete_path:(delete_path_ : file_path)
    ~connector_id:(connector_id_ : connector_id) () =
  ({ delete_path = delete_path_; connector_id = connector_id_ } : start_remote_delete_request)

let make_start_file_transfer_response ~transfer_id:(transfer_id_ : transfer_id) () =
  ({ transfer_id = transfer_id_ } : start_file_transfer_response)

let make_custom_http_header ?value:(value_ : custom_http_header_value_type option)
    ?key:(key_ : custom_http_header_key_type option) () =
  ({ value = value_; key = key_ } : custom_http_header)

let make_start_file_transfer_request
    ?custom_http_headers:(custom_http_headers_ : custom_http_headers option)
    ?remote_directory_path:(remote_directory_path_ : file_path option)
    ?local_directory_path:(local_directory_path_ : file_path option)
    ?retrieve_file_paths:(retrieve_file_paths_ : file_paths option)
    ?send_file_paths:(send_file_paths_ : file_paths option)
    ~connector_id:(connector_id_ : connector_id) () =
  ({
     custom_http_headers = custom_http_headers_;
     remote_directory_path = remote_directory_path_;
     local_directory_path = local_directory_path_;
     retrieve_file_paths = retrieve_file_paths_;
     send_file_paths = send_file_paths_;
     connector_id = connector_id_;
   }
    : start_file_transfer_request)

let make_start_directory_listing_response ~output_file_name:(output_file_name_ : output_file_name)
    ~listing_id:(listing_id_ : listing_id) () =
  ({ output_file_name = output_file_name_; listing_id = listing_id_ }
    : start_directory_listing_response)

let make_start_directory_listing_request ?max_items:(max_items_ : max_items option)
    ~output_directory_path:(output_directory_path_ : file_path)
    ~remote_directory_path:(remote_directory_path_ : file_path)
    ~connector_id:(connector_id_ : connector_id) () =
  ({
     output_directory_path = output_directory_path_;
     max_items = max_items_;
     remote_directory_path = remote_directory_path_;
     connector_id = connector_id_;
   }
    : start_directory_listing_request)

let make_send_workflow_step_state_response () = (() : unit)

let make_send_workflow_step_state_request ~status:(status_ : custom_step_status)
    ~token:(token_ : callback_token) ~execution_id:(execution_id_ : execution_id)
    ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ status = status_; token = token_; execution_id = execution_id_; workflow_id = workflow_id_ }
    : send_workflow_step_state_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option)
    ?next_token:(next_token_ : next_token option) ?arn:(arn_ : arn option) () =
  ({ tags = tags_; next_token = next_token_; arn = arn_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~arn:(arn_ : arn) () =
  ({ next_token = next_token_; max_results = max_results_; arn = arn_ }
    : list_tags_for_resource_request)

let make_list_security_policies_response ?next_token:(next_token_ : next_token option)
    ~security_policy_names:(security_policy_names_ : security_policy_names) () =
  ({ security_policy_names = security_policy_names_; next_token = next_token_ }
    : list_security_policies_response)

let make_list_security_policies_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_security_policies_request)

let make_listed_host_key ?date_imported:(date_imported_ : date_imported option)
    ?type_:(type__ : host_key_type option) ?description:(description_ : host_key_description option)
    ?fingerprint:(fingerprint_ : host_key_fingerprint option)
    ?host_key_id:(host_key_id_ : host_key_id option) ~arn:(arn_ : arn) () =
  ({
     date_imported = date_imported_;
     type_ = type__;
     description = description_;
     fingerprint = fingerprint_;
     host_key_id = host_key_id_;
     arn = arn_;
   }
    : listed_host_key)

let make_list_host_keys_response ?next_token:(next_token_ : next_token option)
    ~host_keys:(host_keys_ : listed_host_keys) ~server_id:(server_id_ : server_id) () =
  ({ host_keys = host_keys_; server_id = server_id_; next_token = next_token_ }
    : list_host_keys_response)

let make_list_host_keys_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_; next_token = next_token_; max_results = max_results_ }
    : list_host_keys_request)

let make_list_file_transfer_results_response ?next_token:(next_token_ : next_token option)
    ~file_transfer_results:(file_transfer_results_ : connector_file_transfer_results) () =
  ({ next_token = next_token_; file_transfer_results = file_transfer_results_ }
    : list_file_transfer_results_response)

let make_list_file_transfer_results_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~transfer_id:(transfer_id_ : transfer_id)
    ~connector_id:(connector_id_ : connector_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     transfer_id = transfer_id_;
     connector_id = connector_id_;
   }
    : list_file_transfer_results_request)

let make_s3_file_location ?etag:(etag_ : s3_etag option)
    ?version_id:(version_id_ : s3_version_id option) ?key:(key_ : s3_key option)
    ?bucket:(bucket_ : s3_bucket option) () =
  ({ etag = etag_; version_id = version_id_; key = key_; bucket = bucket_ } : s3_file_location)

let make_file_location ?efs_file_location:(efs_file_location_ : efs_file_location option)
    ?s3_file_location:(s3_file_location_ : s3_file_location option) () =
  ({ efs_file_location = efs_file_location_; s3_file_location = s3_file_location_ } : file_location)

let make_service_metadata ~user_details:(user_details_ : user_details) () =
  ({ user_details = user_details_ } : service_metadata)

let make_listed_execution ?status:(status_ : execution_status option)
    ?service_metadata:(service_metadata_ : service_metadata option)
    ?initial_file_location:(initial_file_location_ : file_location option)
    ?execution_id:(execution_id_ : execution_id option) () =
  ({
     status = status_;
     service_metadata = service_metadata_;
     initial_file_location = initial_file_location_;
     execution_id = execution_id_;
   }
    : listed_execution)

let make_list_executions_response ?next_token:(next_token_ : next_token option)
    ~executions:(executions_ : listed_executions) ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ executions = executions_; workflow_id = workflow_id_; next_token = next_token_ }
    : list_executions_response)

let make_list_executions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_; next_token = next_token_; max_results = max_results_ }
    : list_executions_request)

let make_listed_access ?external_id:(external_id_ : external_id option) ?role:(role_ : role option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory:(home_directory_ : home_directory option) () =
  ({
     external_id = external_id_;
     role = role_;
     home_directory_type = home_directory_type_;
     home_directory = home_directory_;
   }
    : listed_access)

let make_list_accesses_response ?next_token:(next_token_ : next_token option)
    ~accesses:(accesses_ : listed_accesses) ~server_id:(server_id_ : server_id) () =
  ({ accesses = accesses_; server_id = server_id_; next_token = next_token_ }
    : list_accesses_response)

let make_list_accesses_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_; next_token = next_token_; max_results = max_results_ }
    : list_accesses_request)

let make_import_ssh_public_key_response ~user_name:(user_name_ : user_name)
    ~ssh_public_key_id:(ssh_public_key_id_ : ssh_public_key_id) ~server_id:(server_id_ : server_id)
    () =
  ({ user_name = user_name_; ssh_public_key_id = ssh_public_key_id_; server_id = server_id_ }
    : import_ssh_public_key_response)

let make_import_ssh_public_key_request ~user_name:(user_name_ : user_name)
    ~ssh_public_key_body:(ssh_public_key_body_ : ssh_public_key_body)
    ~server_id:(server_id_ : server_id) () =
  ({ user_name = user_name_; ssh_public_key_body = ssh_public_key_body_; server_id = server_id_ }
    : import_ssh_public_key_request)

let make_import_host_key_response ~host_key_id:(host_key_id_ : host_key_id)
    ~server_id:(server_id_ : server_id) () =
  ({ host_key_id = host_key_id_; server_id = server_id_ } : import_host_key_response)

let make_import_host_key_request ?tags:(tags_ : tags option)
    ?description:(description_ : host_key_description option)
    ~host_key_body:(host_key_body_ : host_key) ~server_id:(server_id_ : server_id) () =
  ({
     tags = tags_;
     description = description_;
     host_key_body = host_key_body_;
     server_id = server_id_;
   }
    : import_host_key_request)

let make_described_security_policy ?protocols:(protocols_ : security_policy_protocols option)
    ?type_:(type__ : security_policy_resource_type option)
    ?ssh_host_key_algorithms:(ssh_host_key_algorithms_ : security_policy_options option)
    ?tls_ciphers:(tls_ciphers_ : security_policy_options option)
    ?ssh_macs:(ssh_macs_ : security_policy_options option)
    ?ssh_kexs:(ssh_kexs_ : security_policy_options option)
    ?ssh_ciphers:(ssh_ciphers_ : security_policy_options option) ?fips:(fips_ : fips option)
    ~security_policy_name:(security_policy_name_ : security_policy_name) () =
  ({
     protocols = protocols_;
     type_ = type__;
     ssh_host_key_algorithms = ssh_host_key_algorithms_;
     tls_ciphers = tls_ciphers_;
     ssh_macs = ssh_macs_;
     ssh_kexs = ssh_kexs_;
     ssh_ciphers = ssh_ciphers_;
     security_policy_name = security_policy_name_;
     fips = fips_;
   }
    : described_security_policy)

let make_describe_security_policy_response
    ~security_policy:(security_policy_ : described_security_policy) () =
  ({ security_policy = security_policy_ } : describe_security_policy_response)

let make_describe_security_policy_request
    ~security_policy_name:(security_policy_name_ : security_policy_name) () =
  ({ security_policy_name = security_policy_name_ } : describe_security_policy_request)

let make_described_host_key ?tags:(tags_ : tags option)
    ?date_imported:(date_imported_ : date_imported option) ?type_:(type__ : host_key_type option)
    ?description:(description_ : host_key_description option)
    ?host_key_fingerprint:(host_key_fingerprint_ : host_key_fingerprint option)
    ?host_key_id:(host_key_id_ : host_key_id option) ~arn:(arn_ : arn) () =
  ({
     tags = tags_;
     date_imported = date_imported_;
     type_ = type__;
     description = description_;
     host_key_fingerprint = host_key_fingerprint_;
     host_key_id = host_key_id_;
     arn = arn_;
   }
    : described_host_key)

let make_describe_host_key_response ~host_key:(host_key_ : described_host_key) () =
  ({ host_key = host_key_ } : describe_host_key_response)

let make_describe_host_key_request ~host_key_id:(host_key_id_ : host_key_id)
    ~server_id:(server_id_ : server_id) () =
  ({ host_key_id = host_key_id_; server_id = server_id_ } : describe_host_key_request)

let make_logging_configuration ?log_group_name:(log_group_name_ : log_group_name option)
    ?logging_role:(logging_role_ : role option) () =
  ({ log_group_name = log_group_name_; logging_role = logging_role_ } : logging_configuration)

let make_execution_error ~message:(message_ : execution_error_message)
    ~type_:(type__ : execution_error_type) () =
  ({ message = message_; type_ = type__ } : execution_error)

let make_execution_results ?on_exception_steps:(on_exception_steps_ : execution_step_results option)
    ?steps:(steps_ : execution_step_results option) () =
  ({ on_exception_steps = on_exception_steps_; steps = steps_ } : execution_results)

let make_described_execution ?results:(results_ : execution_results option)
    ?status:(status_ : execution_status option)
    ?posix_profile:(posix_profile_ : posix_profile option)
    ?logging_configuration:(logging_configuration_ : logging_configuration option)
    ?execution_role:(execution_role_ : role option)
    ?service_metadata:(service_metadata_ : service_metadata option)
    ?initial_file_location:(initial_file_location_ : file_location option)
    ?execution_id:(execution_id_ : execution_id option) () =
  ({
     results = results_;
     status = status_;
     posix_profile = posix_profile_;
     logging_configuration = logging_configuration_;
     execution_role = execution_role_;
     service_metadata = service_metadata_;
     initial_file_location = initial_file_location_;
     execution_id = execution_id_;
   }
    : described_execution)

let make_describe_execution_response ~execution:(execution_ : described_execution)
    ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ execution = execution_; workflow_id = workflow_id_ } : describe_execution_response)

let make_describe_execution_request ~workflow_id:(workflow_id_ : workflow_id)
    ~execution_id:(execution_id_ : execution_id) () =
  ({ workflow_id = workflow_id_; execution_id = execution_id_ } : describe_execution_request)

let make_described_access ?external_id:(external_id_ : external_id option)
    ?role:(role_ : role option) ?posix_profile:(posix_profile_ : posix_profile option)
    ?policy:(policy_ : policy option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory:(home_directory_ : home_directory option) () =
  ({
     external_id = external_id_;
     role = role_;
     posix_profile = posix_profile_;
     policy = policy_;
     home_directory_type = home_directory_type_;
     home_directory_mappings = home_directory_mappings_;
     home_directory = home_directory_;
   }
    : described_access)

let make_describe_access_response ~access:(access_ : described_access)
    ~server_id:(server_id_ : server_id) () =
  ({ access = access_; server_id = server_id_ } : describe_access_response)

let make_describe_access_request ~external_id:(external_id_ : external_id)
    ~server_id:(server_id_ : server_id) () =
  ({ external_id = external_id_; server_id = server_id_ } : describe_access_request)

let make_delete_ssh_public_key_request ~user_name:(user_name_ : user_name)
    ~ssh_public_key_id:(ssh_public_key_id_ : ssh_public_key_id) ~server_id:(server_id_ : server_id)
    () =
  ({ user_name = user_name_; ssh_public_key_id = ssh_public_key_id_; server_id = server_id_ }
    : delete_ssh_public_key_request)

let make_delete_host_key_request ~host_key_id:(host_key_id_ : host_key_id)
    ~server_id:(server_id_ : server_id) () =
  ({ host_key_id = host_key_id_; server_id = server_id_ } : delete_host_key_request)

let make_delete_access_request ~external_id:(external_id_ : external_id)
    ~server_id:(server_id_ : server_id) () =
  ({ external_id = external_id_; server_id = server_id_ } : delete_access_request)

let make_create_access_response ~external_id:(external_id_ : external_id)
    ~server_id:(server_id_ : server_id) () =
  ({ external_id = external_id_; server_id = server_id_ } : create_access_response)

let make_create_access_request ?posix_profile:(posix_profile_ : posix_profile option)
    ?policy:(policy_ : policy option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory:(home_directory_ : home_directory option)
    ~external_id:(external_id_ : external_id) ~server_id:(server_id_ : server_id)
    ~role:(role_ : role) () =
  ({
     external_id = external_id_;
     server_id = server_id_;
     role = role_;
     posix_profile = posix_profile_;
     policy = policy_;
     home_directory_mappings = home_directory_mappings_;
     home_directory_type = home_directory_type_;
     home_directory = home_directory_;
   }
    : create_access_request)

let make_ssh_public_key ~ssh_public_key_id:(ssh_public_key_id_ : ssh_public_key_id)
    ~ssh_public_key_body:(ssh_public_key_body_ : ssh_public_key_body)
    ~date_imported:(date_imported_ : date_imported) () =
  ({
     ssh_public_key_id = ssh_public_key_id_;
     ssh_public_key_body = ssh_public_key_body_;
     date_imported = date_imported_;
   }
    : ssh_public_key)

let make_listed_workflow ?arn:(arn_ : arn option)
    ?description:(description_ : workflow_description option)
    ?workflow_id:(workflow_id_ : workflow_id option) () =
  ({ arn = arn_; description = description_; workflow_id = workflow_id_ } : listed_workflow)

let make_listed_web_app ?endpoint_type:(endpoint_type_ : web_app_endpoint_type option)
    ?web_app_endpoint:(web_app_endpoint_ : web_app_endpoint option)
    ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ~web_app_id:(web_app_id_ : web_app_id) ~arn:(arn_ : arn) () =
  ({
     endpoint_type = endpoint_type_;
     web_app_endpoint = web_app_endpoint_;
     access_endpoint = access_endpoint_;
     web_app_id = web_app_id_;
     arn = arn_;
   }
    : listed_web_app)

let make_listed_user ?user_name:(user_name_ : user_name option)
    ?ssh_public_key_count:(ssh_public_key_count_ : ssh_public_key_count option)
    ?role:(role_ : role option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory:(home_directory_ : home_directory option) ~arn:(arn_ : arn) () =
  ({
     user_name = user_name_;
     ssh_public_key_count = ssh_public_key_count_;
     role = role_;
     home_directory_type = home_directory_type_;
     home_directory = home_directory_;
     arn = arn_;
   }
    : listed_user)

let make_listed_server ?user_count:(user_count_ : user_count option) ?state:(state_ : state option)
    ?server_id:(server_id_ : server_id option) ?logging_role:(logging_role_ : role option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ?domain:(domain_ : domain option) ~arn:(arn_ : arn) () =
  ({
     user_count = user_count_;
     state = state_;
     server_id = server_id_;
     logging_role = logging_role_;
     endpoint_type = endpoint_type_;
     identity_provider_type = identity_provider_type_;
     domain = domain_;
     arn = arn_;
   }
    : listed_server)

let make_listed_profile ?profile_type:(profile_type_ : profile_type option)
    ?as2_id:(as2_id_ : as2_id option) ?profile_id:(profile_id_ : profile_id option)
    ?arn:(arn_ : arn option) () =
  ({ profile_type = profile_type_; as2_id = as2_id_; profile_id = profile_id_; arn = arn_ }
    : listed_profile)

let make_listed_connector ?url:(url_ : url option)
    ?connector_id:(connector_id_ : connector_id option) ?arn:(arn_ : arn option) () =
  ({ url = url_; connector_id = connector_id_; arn = arn_ } : listed_connector)

let make_listed_certificate ?description:(description_ : description option)
    ?type_:(type__ : certificate_type option) ?inactive_date:(inactive_date_ : cert_date option)
    ?active_date:(active_date_ : cert_date option)
    ?status:(status_ : certificate_status_type option)
    ?usage:(usage_ : certificate_usage_type option)
    ?certificate_id:(certificate_id_ : certificate_id option) ?arn:(arn_ : arn option) () =
  ({
     description = description_;
     type_ = type__;
     inactive_date = inactive_date_;
     active_date = active_date_;
     status = status_;
     usage = usage_;
     certificate_id = certificate_id_;
     arn = arn_;
   }
    : listed_certificate)

let make_listed_agreement ?partner_profile_id:(partner_profile_id_ : profile_id option)
    ?local_profile_id:(local_profile_id_ : profile_id option)
    ?server_id:(server_id_ : server_id option) ?status:(status_ : agreement_status_type option)
    ?description:(description_ : description option)
    ?agreement_id:(agreement_id_ : agreement_id option) ?arn:(arn_ : arn option) () =
  ({
     partner_profile_id = partner_profile_id_;
     local_profile_id = local_profile_id_;
     server_id = server_id_;
     status = status_;
     description = description_;
     agreement_id = agreement_id_;
     arn = arn_;
   }
    : listed_agreement)

let make_list_workflows_response ?next_token:(next_token_ : next_token option)
    ~workflows:(workflows_ : listed_workflows) () =
  ({ workflows = workflows_; next_token = next_token_ } : list_workflows_response)

let make_list_workflows_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_workflows_request)

let make_list_web_apps_response ?next_token:(next_token_ : next_token option)
    ~web_apps:(web_apps_ : listed_web_apps) () =
  ({ web_apps = web_apps_; next_token = next_token_ } : list_web_apps_response)

let make_list_web_apps_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_web_apps_request)

let make_list_users_response ?next_token:(next_token_ : next_token option)
    ~users:(users_ : listed_users) ~server_id:(server_id_ : server_id) () =
  ({ users = users_; server_id = server_id_; next_token = next_token_ } : list_users_response)

let make_list_users_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_; next_token = next_token_; max_results = max_results_ }
    : list_users_request)

let make_list_servers_response ?next_token:(next_token_ : next_token option)
    ~servers:(servers_ : listed_servers) () =
  ({ servers = servers_; next_token = next_token_ } : list_servers_response)

let make_list_servers_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_servers_request)

let make_list_profiles_response ?next_token:(next_token_ : next_token option)
    ~profiles:(profiles_ : listed_profiles) () =
  ({ profiles = profiles_; next_token = next_token_ } : list_profiles_response)

let make_list_profiles_request ?profile_type:(profile_type_ : profile_type option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ profile_type = profile_type_; next_token = next_token_; max_results = max_results_ }
    : list_profiles_request)

let make_list_connectors_response ?next_token:(next_token_ : next_token option)
    ~connectors:(connectors_ : listed_connectors) () =
  ({ connectors = connectors_; next_token = next_token_ } : list_connectors_response)

let make_list_connectors_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_connectors_request)

let make_list_certificates_response ?next_token:(next_token_ : next_token option)
    ~certificates:(certificates_ : listed_certificates) () =
  ({ certificates = certificates_; next_token = next_token_ } : list_certificates_response)

let make_list_certificates_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_certificates_request)

let make_list_agreements_response ?next_token:(next_token_ : next_token option)
    ~agreements:(agreements_ : listed_agreements) () =
  ({ agreements = agreements_; next_token = next_token_ } : list_agreements_response)

let make_list_agreements_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_; next_token = next_token_; max_results = max_results_ }
    : list_agreements_request)

let make_import_certificate_response ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : import_certificate_response)

let make_import_certificate_request ?tags:(tags_ : tags option)
    ?description:(description_ : description option)
    ?inactive_date:(inactive_date_ : cert_date option)
    ?active_date:(active_date_ : cert_date option)
    ?private_key:(private_key_ : private_key_type option)
    ?certificate_chain:(certificate_chain_ : certificate_chain_type option)
    ~certificate:(certificate_ : certificate_body_type) ~usage:(usage_ : certificate_usage_type) ()
    =
  ({
     tags = tags_;
     description = description_;
     inactive_date = inactive_date_;
     active_date = active_date_;
     private_key = private_key_;
     certificate_chain = certificate_chain_;
     certificate = certificate_;
     usage = usage_;
   }
    : import_certificate_request)

let make_described_workflow ?tags:(tags_ : tags option)
    ?workflow_id:(workflow_id_ : workflow_id option)
    ?on_exception_steps:(on_exception_steps_ : workflow_steps option)
    ?steps:(steps_ : workflow_steps option)
    ?description:(description_ : workflow_description option) ~arn:(arn_ : arn) () =
  ({
     tags = tags_;
     workflow_id = workflow_id_;
     on_exception_steps = on_exception_steps_;
     steps = steps_;
     description = description_;
     arn = arn_;
   }
    : described_workflow)

let make_described_web_app_vpc_config ?vpc_endpoint_id:(vpc_endpoint_id_ : vpc_endpoint_id option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?subnet_ids:(subnet_ids_ : subnet_ids option) () =
  ({ vpc_endpoint_id = vpc_endpoint_id_; vpc_id = vpc_id_; subnet_ids = subnet_ids_ }
    : described_web_app_vpc_config)

let make_described_identity_center_config ?role:(role_ : role option)
    ?instance_arn:(instance_arn_ : identity_center_instance_arn option)
    ?application_arn:(application_arn_ : identity_center_application_arn option) () =
  ({ role = role_; instance_arn = instance_arn_; application_arn = application_arn_ }
    : described_identity_center_config)

let make_described_web_app_customization ?favicon_file:(favicon_file_ : web_app_favicon_file option)
    ?logo_file:(logo_file_ : web_app_logo_file option) ?title:(title_ : web_app_title option)
    ~web_app_id:(web_app_id_ : web_app_id) ~arn:(arn_ : arn) () =
  ({
     favicon_file = favicon_file_;
     logo_file = logo_file_;
     title = title_;
     web_app_id = web_app_id_;
     arn = arn_;
   }
    : described_web_app_customization)

let make_described_web_app
    ?described_endpoint_details:
      (described_endpoint_details_ : described_web_app_endpoint_details option)
    ?endpoint_type:(endpoint_type_ : web_app_endpoint_type option)
    ?web_app_endpoint_policy:(web_app_endpoint_policy_ : web_app_endpoint_policy option)
    ?tags:(tags_ : tags option) ?web_app_units:(web_app_units_ : web_app_units option)
    ?web_app_endpoint:(web_app_endpoint_ : web_app_endpoint option)
    ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ?described_identity_provider_details:
      (described_identity_provider_details_ : described_web_app_identity_provider_details option)
    ~web_app_id:(web_app_id_ : web_app_id) ~arn:(arn_ : arn) () =
  ({
     described_endpoint_details = described_endpoint_details_;
     endpoint_type = endpoint_type_;
     web_app_endpoint_policy = web_app_endpoint_policy_;
     tags = tags_;
     web_app_units = web_app_units_;
     web_app_endpoint = web_app_endpoint_;
     access_endpoint = access_endpoint_;
     described_identity_provider_details = described_identity_provider_details_;
     web_app_id = web_app_id_;
     arn = arn_;
   }
    : described_web_app)

let make_described_user ?user_name:(user_name_ : user_name option) ?tags:(tags_ : tags option)
    ?ssh_public_keys:(ssh_public_keys_ : ssh_public_keys option) ?role:(role_ : role option)
    ?posix_profile:(posix_profile_ : posix_profile option) ?policy:(policy_ : policy option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory:(home_directory_ : home_directory option) ~arn:(arn_ : arn) () =
  ({
     user_name = user_name_;
     tags = tags_;
     ssh_public_keys = ssh_public_keys_;
     role = role_;
     posix_profile = posix_profile_;
     policy = policy_;
     home_directory_type = home_directory_type_;
     home_directory_mappings = home_directory_mappings_;
     home_directory = home_directory_;
     arn = arn_;
   }
    : described_user)

let make_described_server ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?as2_service_managed_egress_ip_addresses:
      (as2_service_managed_egress_ip_addresses_ : service_managed_egress_ip_addresses option)
    ?s3_storage_options:(s3_storage_options_ : s3_storage_options option)
    ?structured_log_destinations:(structured_log_destinations_ : structured_log_destinations option)
    ?workflow_details:(workflow_details_ : workflow_details option)
    ?user_count:(user_count_ : user_count option) ?tags:(tags_ : tags option)
    ?state:(state_ : state option) ?server_id:(server_id_ : server_id option)
    ?security_policy_name:(security_policy_name_ : security_policy_name option)
    ?protocols:(protocols_ : protocols option)
    ?pre_authentication_login_banner:
      (pre_authentication_login_banner_ : pre_authentication_login_banner option)
    ?post_authentication_login_banner:
      (post_authentication_login_banner_ : post_authentication_login_banner option)
    ?logging_role:(logging_role_ : nullable_role option)
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ?identity_provider_details:(identity_provider_details_ : identity_provider_details option)
    ?host_key_fingerprint:(host_key_fingerprint_ : host_key_fingerprint option)
    ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?endpoint_details:(endpoint_details_ : endpoint_details option)
    ?domain:(domain_ : domain option)
    ?protocol_details:(protocol_details_ : protocol_details option)
    ?certificate:(certificate_ : certificate option) ~arn:(arn_ : arn) () =
  ({
     ip_address_type = ip_address_type_;
     as2_service_managed_egress_ip_addresses = as2_service_managed_egress_ip_addresses_;
     s3_storage_options = s3_storage_options_;
     structured_log_destinations = structured_log_destinations_;
     workflow_details = workflow_details_;
     user_count = user_count_;
     tags = tags_;
     state = state_;
     server_id = server_id_;
     security_policy_name = security_policy_name_;
     protocols = protocols_;
     pre_authentication_login_banner = pre_authentication_login_banner_;
     post_authentication_login_banner = post_authentication_login_banner_;
     logging_role = logging_role_;
     identity_provider_type = identity_provider_type_;
     identity_provider_details = identity_provider_details_;
     host_key_fingerprint = host_key_fingerprint_;
     endpoint_type = endpoint_type_;
     endpoint_details = endpoint_details_;
     domain = domain_;
     protocol_details = protocol_details_;
     certificate = certificate_;
     arn = arn_;
   }
    : described_server)

let make_described_profile ?tags:(tags_ : tags option)
    ?certificate_ids:(certificate_ids_ : certificate_ids option) ?as2_id:(as2_id_ : as2_id option)
    ?profile_type:(profile_type_ : profile_type option)
    ?profile_id:(profile_id_ : profile_id option) ~arn:(arn_ : arn) () =
  ({
     tags = tags_;
     certificate_ids = certificate_ids_;
     as2_id = as2_id_;
     profile_type = profile_type_;
     profile_id = profile_id_;
     arn = arn_;
   }
    : described_profile)

let make_described_connector_vpc_lattice_egress_config
    ?port_number:(port_number_ : sftp_port option)
    ~resource_configuration_arn:
      (resource_configuration_arn_ : vpc_lattice_resource_configuration_arn) () =
  ({ port_number = port_number_; resource_configuration_arn = resource_configuration_arn_ }
    : described_connector_vpc_lattice_egress_config)

let make_described_connector ?ip_address_type:(ip_address_type_ : connectors_ip_address_type option)
    ?error_message:(error_message_ : connector_error_message option)
    ?egress_config:(egress_config_ : described_connector_egress_config option)
    ?security_policy_name:(security_policy_name_ : connector_security_policy_name option)
    ?service_managed_egress_ip_addresses:
      (service_managed_egress_ip_addresses_ : service_managed_egress_ip_addresses option)
    ?sftp_config:(sftp_config_ : sftp_connector_config option) ?tags:(tags_ : tags option)
    ?logging_role:(logging_role_ : role option) ?access_role:(access_role_ : role option)
    ?as2_config:(as2_config_ : as2_connector_config option) ?url:(url_ : url option)
    ?connector_id:(connector_id_ : connector_id option) ~status:(status_ : connector_status)
    ~egress_type:(egress_type_ : connector_egress_type) ~arn:(arn_ : arn) () =
  ({
     ip_address_type = ip_address_type_;
     status = status_;
     error_message = error_message_;
     egress_type = egress_type_;
     egress_config = egress_config_;
     security_policy_name = security_policy_name_;
     service_managed_egress_ip_addresses = service_managed_egress_ip_addresses_;
     sftp_config = sftp_config_;
     tags = tags_;
     logging_role = logging_role_;
     access_role = access_role_;
     as2_config = as2_config_;
     url = url_;
     connector_id = connector_id_;
     arn = arn_;
   }
    : described_connector)

let make_described_certificate ?tags:(tags_ : tags option)
    ?description:(description_ : description option) ?type_:(type__ : certificate_type option)
    ?not_after_date:(not_after_date_ : cert_date option)
    ?not_before_date:(not_before_date_ : cert_date option) ?serial:(serial_ : cert_serial option)
    ?inactive_date:(inactive_date_ : cert_date option)
    ?active_date:(active_date_ : cert_date option)
    ?certificate_chain:(certificate_chain_ : certificate_chain_type option)
    ?certificate:(certificate_ : certificate_body_type option)
    ?status:(status_ : certificate_status_type option)
    ?usage:(usage_ : certificate_usage_type option)
    ?certificate_id:(certificate_id_ : certificate_id option) ~arn:(arn_ : arn) () =
  ({
     tags = tags_;
     description = description_;
     type_ = type__;
     not_after_date = not_after_date_;
     not_before_date = not_before_date_;
     serial = serial_;
     inactive_date = inactive_date_;
     active_date = active_date_;
     certificate_chain = certificate_chain_;
     certificate = certificate_;
     status = status_;
     usage = usage_;
     certificate_id = certificate_id_;
     arn = arn_;
   }
    : described_certificate)

let make_described_agreement
    ?custom_directories:(custom_directories_ : custom_directories_type option)
    ?enforce_message_signing:(enforce_message_signing_ : enforce_message_signing_type option)
    ?preserve_filename:(preserve_filename_ : preserve_filename_type option)
    ?tags:(tags_ : tags option) ?access_role:(access_role_ : role option)
    ?base_directory:(base_directory_ : home_directory option)
    ?partner_profile_id:(partner_profile_id_ : profile_id option)
    ?local_profile_id:(local_profile_id_ : profile_id option)
    ?server_id:(server_id_ : server_id option) ?status:(status_ : agreement_status_type option)
    ?description:(description_ : description option)
    ?agreement_id:(agreement_id_ : agreement_id option) ~arn:(arn_ : arn) () =
  ({
     custom_directories = custom_directories_;
     enforce_message_signing = enforce_message_signing_;
     preserve_filename = preserve_filename_;
     tags = tags_;
     access_role = access_role_;
     base_directory = base_directory_;
     partner_profile_id = partner_profile_id_;
     local_profile_id = local_profile_id_;
     server_id = server_id_;
     status = status_;
     description = description_;
     agreement_id = agreement_id_;
     arn = arn_;
   }
    : described_agreement)

let make_describe_workflow_response ~workflow:(workflow_ : described_workflow) () =
  ({ workflow = workflow_ } : describe_workflow_response)

let make_describe_workflow_request ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_ } : describe_workflow_request)

let make_describe_web_app_response ~web_app:(web_app_ : described_web_app) () =
  ({ web_app = web_app_ } : describe_web_app_response)

let make_describe_web_app_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : describe_web_app_request)

let make_describe_web_app_customization_response
    ~web_app_customization:(web_app_customization_ : described_web_app_customization) () =
  ({ web_app_customization = web_app_customization_ } : describe_web_app_customization_response)

let make_describe_web_app_customization_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : describe_web_app_customization_request)

let make_describe_user_response ~user:(user_ : described_user) ~server_id:(server_id_ : server_id)
    () =
  ({ user = user_; server_id = server_id_ } : describe_user_response)

let make_describe_user_request ~user_name:(user_name_ : user_name)
    ~server_id:(server_id_ : server_id) () =
  ({ user_name = user_name_; server_id = server_id_ } : describe_user_request)

let make_describe_server_response ~server:(server_ : described_server) () =
  ({ server = server_ } : describe_server_response)

let make_describe_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : describe_server_request)

let make_describe_profile_response ~profile:(profile_ : described_profile) () =
  ({ profile = profile_ } : describe_profile_response)

let make_describe_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : describe_profile_request)

let make_describe_connector_response ~connector:(connector_ : described_connector) () =
  ({ connector = connector_ } : describe_connector_response)

let make_describe_connector_request ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : describe_connector_request)

let make_describe_certificate_response ~certificate:(certificate_ : described_certificate) () =
  ({ certificate = certificate_ } : describe_certificate_response)

let make_describe_certificate_request ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : describe_certificate_request)

let make_describe_agreement_response ~agreement:(agreement_ : described_agreement) () =
  ({ agreement = agreement_ } : describe_agreement_response)

let make_describe_agreement_request ~server_id:(server_id_ : server_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ server_id = server_id_; agreement_id = agreement_id_ } : describe_agreement_request)

let make_delete_workflow_request ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_ } : delete_workflow_request)

let make_delete_web_app_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : delete_web_app_request)

let make_delete_web_app_customization_request ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : delete_web_app_customization_request)

let make_delete_user_request ~user_name:(user_name_ : user_name) ~server_id:(server_id_ : server_id)
    () =
  ({ user_name = user_name_; server_id = server_id_ } : delete_user_request)

let make_delete_server_request ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : delete_server_request)

let make_delete_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : delete_profile_request)

let make_delete_connector_request ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : delete_connector_request)

let make_delete_certificate_request ~certificate_id:(certificate_id_ : certificate_id) () =
  ({ certificate_id = certificate_id_ } : delete_certificate_request)

let make_delete_agreement_request ~server_id:(server_id_ : server_id)
    ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ server_id = server_id_; agreement_id = agreement_id_ } : delete_agreement_request)

let make_create_workflow_response ~workflow_id:(workflow_id_ : workflow_id) () =
  ({ workflow_id = workflow_id_ } : create_workflow_response)

let make_create_workflow_request ?tags:(tags_ : tags option)
    ?on_exception_steps:(on_exception_steps_ : workflow_steps option)
    ?description:(description_ : workflow_description option) ~steps:(steps_ : workflow_steps) () =
  ({
     tags = tags_;
     on_exception_steps = on_exception_steps_;
     steps = steps_;
     description = description_;
   }
    : create_workflow_request)

let make_create_web_app_response ~web_app_id:(web_app_id_ : web_app_id) () =
  ({ web_app_id = web_app_id_ } : create_web_app_response)

let make_create_web_app_request
    ?endpoint_details:(endpoint_details_ : web_app_endpoint_details option)
    ?web_app_endpoint_policy:(web_app_endpoint_policy_ : web_app_endpoint_policy option)
    ?tags:(tags_ : tags option) ?web_app_units:(web_app_units_ : web_app_units option)
    ?access_endpoint:(access_endpoint_ : web_app_access_endpoint option)
    ~identity_provider_details:(identity_provider_details_ : web_app_identity_provider_details) () =
  ({
     endpoint_details = endpoint_details_;
     web_app_endpoint_policy = web_app_endpoint_policy_;
     tags = tags_;
     web_app_units = web_app_units_;
     access_endpoint = access_endpoint_;
     identity_provider_details = identity_provider_details_;
   }
    : create_web_app_request)

let make_create_user_response ~user_name:(user_name_ : user_name)
    ~server_id:(server_id_ : server_id) () =
  ({ user_name = user_name_; server_id = server_id_ } : create_user_response)

let make_create_user_request ?tags:(tags_ : tags option)
    ?ssh_public_key_body:(ssh_public_key_body_ : ssh_public_key_body option)
    ?posix_profile:(posix_profile_ : posix_profile option) ?policy:(policy_ : policy option)
    ?home_directory_mappings:(home_directory_mappings_ : home_directory_mappings option)
    ?home_directory_type:(home_directory_type_ : home_directory_type option)
    ?home_directory:(home_directory_ : home_directory option) ~user_name:(user_name_ : user_name)
    ~server_id:(server_id_ : server_id) ~role:(role_ : role) () =
  ({
     user_name = user_name_;
     tags = tags_;
     ssh_public_key_body = ssh_public_key_body_;
     server_id = server_id_;
     role = role_;
     posix_profile = posix_profile_;
     policy = policy_;
     home_directory_mappings = home_directory_mappings_;
     home_directory_type = home_directory_type_;
     home_directory = home_directory_;
   }
    : create_user_request)

let make_create_server_response ~server_id:(server_id_ : server_id) () =
  ({ server_id = server_id_ } : create_server_response)

let make_create_server_request ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?s3_storage_options:(s3_storage_options_ : s3_storage_options option)
    ?structured_log_destinations:(structured_log_destinations_ : structured_log_destinations option)
    ?workflow_details:(workflow_details_ : workflow_details option) ?tags:(tags_ : tags option)
    ?security_policy_name:(security_policy_name_ : security_policy_name option)
    ?protocol_details:(protocol_details_ : protocol_details option)
    ?protocols:(protocols_ : protocols option)
    ?pre_authentication_login_banner:
      (pre_authentication_login_banner_ : pre_authentication_login_banner option)
    ?post_authentication_login_banner:
      (post_authentication_login_banner_ : post_authentication_login_banner option)
    ?logging_role:(logging_role_ : nullable_role option)
    ?identity_provider_type:(identity_provider_type_ : identity_provider_type option)
    ?identity_provider_details:(identity_provider_details_ : identity_provider_details option)
    ?host_key:(host_key_ : host_key option) ?endpoint_type:(endpoint_type_ : endpoint_type option)
    ?endpoint_details:(endpoint_details_ : endpoint_details option)
    ?domain:(domain_ : domain option) ?certificate:(certificate_ : certificate option) () =
  ({
     ip_address_type = ip_address_type_;
     s3_storage_options = s3_storage_options_;
     structured_log_destinations = structured_log_destinations_;
     workflow_details = workflow_details_;
     tags = tags_;
     security_policy_name = security_policy_name_;
     protocol_details = protocol_details_;
     protocols = protocols_;
     pre_authentication_login_banner = pre_authentication_login_banner_;
     post_authentication_login_banner = post_authentication_login_banner_;
     logging_role = logging_role_;
     identity_provider_type = identity_provider_type_;
     identity_provider_details = identity_provider_details_;
     host_key = host_key_;
     endpoint_type = endpoint_type_;
     endpoint_details = endpoint_details_;
     domain = domain_;
     certificate = certificate_;
   }
    : create_server_request)

let make_create_profile_response ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : create_profile_response)

let make_create_profile_request ?tags:(tags_ : tags option)
    ?certificate_ids:(certificate_ids_ : certificate_ids option)
    ~profile_type:(profile_type_ : profile_type) ~as2_id:(as2_id_ : as2_id) () =
  ({
     tags = tags_;
     certificate_ids = certificate_ids_;
     profile_type = profile_type_;
     as2_id = as2_id_;
   }
    : create_profile_request)

let make_create_connector_response ~connector_id:(connector_id_ : connector_id) () =
  ({ connector_id = connector_id_ } : create_connector_response)

let make_connector_vpc_lattice_egress_config ?port_number:(port_number_ : sftp_port option)
    ~resource_configuration_arn:
      (resource_configuration_arn_ : vpc_lattice_resource_configuration_arn) () =
  ({ port_number = port_number_; resource_configuration_arn = resource_configuration_arn_ }
    : connector_vpc_lattice_egress_config)

let make_create_connector_request
    ?ip_address_type:(ip_address_type_ : connectors_ip_address_type option)
    ?egress_config:(egress_config_ : connector_egress_config option)
    ?security_policy_name:(security_policy_name_ : connector_security_policy_name option)
    ?sftp_config:(sftp_config_ : sftp_connector_config option) ?tags:(tags_ : tags option)
    ?logging_role:(logging_role_ : role option)
    ?as2_config:(as2_config_ : as2_connector_config option) ?url:(url_ : url option)
    ~access_role:(access_role_ : role) () =
  ({
     ip_address_type = ip_address_type_;
     egress_config = egress_config_;
     security_policy_name = security_policy_name_;
     sftp_config = sftp_config_;
     tags = tags_;
     logging_role = logging_role_;
     access_role = access_role_;
     as2_config = as2_config_;
     url = url_;
   }
    : create_connector_request)

let make_create_agreement_response ~agreement_id:(agreement_id_ : agreement_id) () =
  ({ agreement_id = agreement_id_ } : create_agreement_response)

let make_create_agreement_request
    ?custom_directories:(custom_directories_ : custom_directories_type option)
    ?enforce_message_signing:(enforce_message_signing_ : enforce_message_signing_type option)
    ?preserve_filename:(preserve_filename_ : preserve_filename_type option)
    ?tags:(tags_ : tags option) ?status:(status_ : agreement_status_type option)
    ?base_directory:(base_directory_ : home_directory option)
    ?description:(description_ : description option) ~access_role:(access_role_ : role)
    ~partner_profile_id:(partner_profile_id_ : profile_id)
    ~local_profile_id:(local_profile_id_ : profile_id) ~server_id:(server_id_ : server_id) () =
  ({
     custom_directories = custom_directories_;
     enforce_message_signing = enforce_message_signing_;
     preserve_filename = preserve_filename_;
     tags = tags_;
     status = status_;
     access_role = access_role_;
     base_directory = base_directory_;
     partner_profile_id = partner_profile_id_;
     local_profile_id = local_profile_id_;
     server_id = server_id_;
     description = description_;
   }
    : create_agreement_request)
