open Types

let make_recurring_charge ?recurring_charge_amount:(recurring_charge_amount_ : double option)
    ?recurring_charge_frequency:(recurring_charge_frequency_ : string_ option) () =
  ({
     recurring_charge_amount = recurring_charge_amount_;
     recurring_charge_frequency = recurring_charge_frequency_;
   }
    : recurring_charge)

let make_reserved_node ?reserved_node_id:(reserved_node_id_ : string_ option)
    ?reserved_node_offering_id:(reserved_node_offering_id_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?start_time:(start_time_ : t_stamp option)
    ?duration:(duration_ : integer option) ?fixed_price:(fixed_price_ : double option)
    ?usage_price:(usage_price_ : double option) ?currency_code:(currency_code_ : string_ option)
    ?node_count:(node_count_ : integer option) ?state:(state_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?reserved_node_offering_type:(reserved_node_offering_type_ : reserved_node_offering_type option)
    () =
  ({
     reserved_node_id = reserved_node_id_;
     reserved_node_offering_id = reserved_node_offering_id_;
     node_type = node_type_;
     start_time = start_time_;
     duration = duration_;
     fixed_price = fixed_price_;
     usage_price = usage_price_;
     currency_code = currency_code_;
     node_count = node_count_;
     state = state_;
     offering_type = offering_type_;
     recurring_charges = recurring_charges_;
     reserved_node_offering_type = reserved_node_offering_type_;
   }
    : reserved_node)

let make_accept_reserved_node_exchange_output_message
    ?exchanged_reserved_node:(exchanged_reserved_node_ : reserved_node option) () =
  ({ exchanged_reserved_node = exchanged_reserved_node_ }
    : accept_reserved_node_exchange_output_message)

let make_accept_reserved_node_exchange_input_message ~reserved_node_id:(reserved_node_id_ : string_)
    ~target_reserved_node_offering_id:(target_reserved_node_offering_id_ : string_) () =
  ({
     reserved_node_id = reserved_node_id_;
     target_reserved_node_offering_id = target_reserved_node_offering_id_;
   }
    : accept_reserved_node_exchange_input_message)

let make_attribute_value_target ?attribute_value:(attribute_value_ : string_ option) () =
  ({ attribute_value = attribute_value_ } : attribute_value_target)

let make_account_attribute ?attribute_name:(attribute_name_ : string_ option)
    ?attribute_values:(attribute_values_ : attribute_value_list option) () =
  ({ attribute_name = attribute_name_; attribute_values = attribute_values_ } : account_attribute)

let make_account_attribute_list ?account_attributes:(account_attributes_ : attribute_list option) ()
    =
  ({ account_attributes = account_attributes_ } : account_attribute_list)

let make_account_with_restore_access ?account_id:(account_id_ : string_ option)
    ?account_alias:(account_alias_ : string_ option) () =
  ({ account_id = account_id_; account_alias = account_alias_ } : account_with_restore_access)

let make_partner_integration_output_message
    ?database_name:(database_name_ : partner_integration_database_name option)
    ?partner_name:(partner_name_ : partner_integration_partner_name option) () =
  ({ database_name = database_name_; partner_name = partner_name_ }
    : partner_integration_output_message)

let make_partner_integration_input_message
    ~account_id:(account_id_ : partner_integration_account_id)
    ~cluster_identifier:(cluster_identifier_ : partner_integration_cluster_identifier)
    ~database_name:(database_name_ : partner_integration_database_name)
    ~partner_name:(partner_name_ : partner_integration_partner_name) () =
  ({
     account_id = account_id_;
     cluster_identifier = cluster_identifier_;
     database_name = database_name_;
     partner_name = partner_name_;
   }
    : partner_integration_input_message)

let make_aqua_configuration ?aqua_status:(aqua_status_ : aqua_status option)
    ?aqua_configuration_status:(aqua_configuration_status_ : aqua_configuration_status option) () =
  ({ aqua_status = aqua_status_; aqua_configuration_status = aqua_configuration_status_ }
    : aqua_configuration)

let make_data_share_association ?consumer_identifier:(consumer_identifier_ : string_ option)
    ?status:(status_ : data_share_status option)
    ?consumer_region:(consumer_region_ : string_ option)
    ?created_date:(created_date_ : t_stamp option)
    ?status_change_date:(status_change_date_ : t_stamp option)
    ?producer_allowed_writes:(producer_allowed_writes_ : boolean_optional option)
    ?consumer_accepted_writes:(consumer_accepted_writes_ : boolean_optional option) () =
  ({
     consumer_identifier = consumer_identifier_;
     status = status_;
     consumer_region = consumer_region_;
     created_date = created_date_;
     status_change_date = status_change_date_;
     producer_allowed_writes = producer_allowed_writes_;
     consumer_accepted_writes = consumer_accepted_writes_;
   }
    : data_share_association)

let make_data_share ?data_share_arn:(data_share_arn_ : string_ option)
    ?producer_arn:(producer_arn_ : string_ option)
    ?allow_publicly_accessible_consumers:(allow_publicly_accessible_consumers_ : boolean_ option)
    ?data_share_associations:(data_share_associations_ : data_share_association_list option)
    ?managed_by:(managed_by_ : string_ option)
    ?data_share_type:(data_share_type_ : data_share_type option) () =
  ({
     data_share_arn = data_share_arn_;
     producer_arn = producer_arn_;
     allow_publicly_accessible_consumers = allow_publicly_accessible_consumers_;
     data_share_associations = data_share_associations_;
     managed_by = managed_by_;
     data_share_type = data_share_type_;
   }
    : data_share)

let make_associate_data_share_consumer_message
    ?associate_entire_account:(associate_entire_account_ : boolean_optional option)
    ?consumer_arn:(consumer_arn_ : string_ option)
    ?consumer_region:(consumer_region_ : string_ option)
    ?allow_writes:(allow_writes_ : boolean_optional option)
    ~data_share_arn:(data_share_arn_ : string_) () =
  ({
     data_share_arn = data_share_arn_;
     associate_entire_account = associate_entire_account_;
     consumer_arn = consumer_arn_;
     consumer_region = consumer_region_;
     allow_writes = allow_writes_;
   }
    : associate_data_share_consumer_message)

let make_cluster_associated_to_schedule ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?schedule_association_state:(schedule_association_state_ : schedule_state option) () =
  ({
     cluster_identifier = cluster_identifier_;
     schedule_association_state = schedule_association_state_;
   }
    : cluster_associated_to_schedule)

let make_certificate_association ?custom_domain_name:(custom_domain_name_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option) () =
  ({ custom_domain_name = custom_domain_name_; cluster_identifier = cluster_identifier_ }
    : certificate_association)

let make_association
    ?custom_domain_certificate_arn:(custom_domain_certificate_arn_ : string_ option)
    ?custom_domain_certificate_expiry_date:(custom_domain_certificate_expiry_date_ : t_stamp option)
    ?certificate_associations:(certificate_associations_ : certificate_association_list option) () =
  ({
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_certificate_expiry_date = custom_domain_certificate_expiry_date_;
     certificate_associations = certificate_associations_;
   }
    : association)

let make_authentication_profile
    ?authentication_profile_name:
      (authentication_profile_name_ : authentication_profile_name_string option)
    ?authentication_profile_content:(authentication_profile_content_ : string_ option) () =
  ({
     authentication_profile_name = authentication_profile_name_;
     authentication_profile_content = authentication_profile_content_;
   }
    : authentication_profile)

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_ip_range ?status:(status_ : string_ option) ?cidri_p:(cidri_p_ : string_ option)
    ?tags:(tags_ : tag_list option) () =
  ({ status = status_; cidri_p = cidri_p_; tags = tags_ } : ip_range)

let make_ec2_security_group ?status:(status_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ?tags:(tags_ : tag_list option) () =
  ({
     status = status_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
     tags = tags_;
   }
    : ec2_security_group)

let make_cluster_security_group
    ?cluster_security_group_name:(cluster_security_group_name_ : string_ option)
    ?description:(description_ : string_ option)
    ?ec2_security_groups:(ec2_security_groups_ : ec2_security_group_list option)
    ?ip_ranges:(ip_ranges_ : ip_range_list option) ?tags:(tags_ : tag_list option) () =
  ({
     cluster_security_group_name = cluster_security_group_name_;
     description = description_;
     ec2_security_groups = ec2_security_groups_;
     ip_ranges = ip_ranges_;
     tags = tags_;
   }
    : cluster_security_group)

let make_authorize_cluster_security_group_ingress_message ?cidri_p:(cidri_p_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ~cluster_security_group_name:(cluster_security_group_name_ : string_) () =
  ({
     cluster_security_group_name = cluster_security_group_name_;
     cidri_p = cidri_p_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : authorize_cluster_security_group_ingress_message)

let make_authorize_data_share_message ?allow_writes:(allow_writes_ : boolean_optional option)
    ~data_share_arn:(data_share_arn_ : string_)
    ~consumer_identifier:(consumer_identifier_ : string_) () =
  ({
     data_share_arn = data_share_arn_;
     consumer_identifier = consumer_identifier_;
     allow_writes = allow_writes_;
   }
    : authorize_data_share_message)

let make_endpoint_authorization ?grantor:(grantor_ : string_ option)
    ?grantee:(grantee_ : string_ option) ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?authorize_time:(authorize_time_ : t_stamp option)
    ?cluster_status:(cluster_status_ : string_ option)
    ?status:(status_ : authorization_status option)
    ?allowed_all_vp_cs:(allowed_all_vp_cs_ : boolean_ option)
    ?allowed_vp_cs:(allowed_vp_cs_ : vpc_identifier_list option)
    ?endpoint_count:(endpoint_count_ : integer option) () =
  ({
     grantor = grantor_;
     grantee = grantee_;
     cluster_identifier = cluster_identifier_;
     authorize_time = authorize_time_;
     cluster_status = cluster_status_;
     status = status_;
     allowed_all_vp_cs = allowed_all_vp_cs_;
     allowed_vp_cs = allowed_vp_cs_;
     endpoint_count = endpoint_count_;
   }
    : endpoint_authorization)

let make_authorize_endpoint_access_message
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?vpc_ids:(vpc_ids_ : vpc_identifier_list option) ~account:(account_ : string_) () =
  ({ cluster_identifier = cluster_identifier_; account = account_; vpc_ids = vpc_ids_ }
    : authorize_endpoint_access_message)

let make_snapshot ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : t_stamp option)
    ?status:(status_ : string_ option) ?port:(port_ : integer option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?master_username:(master_username_ : string_ option)
    ?cluster_version:(cluster_version_ : string_ option)
    ?engine_full_version:(engine_full_version_ : string_ option)
    ?snapshot_type:(snapshot_type_ : string_ option) ?node_type:(node_type_ : string_ option)
    ?number_of_nodes:(number_of_nodes_ : integer option) ?db_name:(db_name_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?encrypted:(encrypted_ : boolean_ option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?encrypted_with_hs_m:(encrypted_with_hs_m_ : boolean_ option)
    ?accounts_with_restore_access:
      (accounts_with_restore_access_ : accounts_with_restore_access_list option)
    ?owner_account:(owner_account_ : string_ option)
    ?total_backup_size_in_mega_bytes:(total_backup_size_in_mega_bytes_ : double option)
    ?actual_incremental_backup_size_in_mega_bytes:
      (actual_incremental_backup_size_in_mega_bytes_ : double option)
    ?backup_progress_in_mega_bytes:(backup_progress_in_mega_bytes_ : double option)
    ?current_backup_rate_in_mega_bytes_per_second:
      (current_backup_rate_in_mega_bytes_per_second_ : double option)
    ?estimated_seconds_to_completion:(estimated_seconds_to_completion_ : long option)
    ?elapsed_time_in_seconds:(elapsed_time_in_seconds_ : long option)
    ?source_region:(source_region_ : string_ option) ?tags:(tags_ : tag_list option)
    ?restorable_node_types:(restorable_node_types_ : restorable_node_type_list option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : boolean_ option)
    ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ?manual_snapshot_remaining_days:(manual_snapshot_remaining_days_ : integer_optional option)
    ?snapshot_retention_start_time:(snapshot_retention_start_time_ : t_stamp option)
    ?master_password_secret_arn:(master_password_secret_arn_ : string_ option)
    ?master_password_secret_kms_key_id:(master_password_secret_kms_key_id_ : string_ option)
    ?snapshot_arn:(snapshot_arn_ : string_ option) () =
  ({
     snapshot_identifier = snapshot_identifier_;
     cluster_identifier = cluster_identifier_;
     snapshot_create_time = snapshot_create_time_;
     status = status_;
     port = port_;
     availability_zone = availability_zone_;
     cluster_create_time = cluster_create_time_;
     master_username = master_username_;
     cluster_version = cluster_version_;
     engine_full_version = engine_full_version_;
     snapshot_type = snapshot_type_;
     node_type = node_type_;
     number_of_nodes = number_of_nodes_;
     db_name = db_name_;
     vpc_id = vpc_id_;
     encrypted = encrypted_;
     kms_key_id = kms_key_id_;
     encrypted_with_hs_m = encrypted_with_hs_m_;
     accounts_with_restore_access = accounts_with_restore_access_;
     owner_account = owner_account_;
     total_backup_size_in_mega_bytes = total_backup_size_in_mega_bytes_;
     actual_incremental_backup_size_in_mega_bytes = actual_incremental_backup_size_in_mega_bytes_;
     backup_progress_in_mega_bytes = backup_progress_in_mega_bytes_;
     current_backup_rate_in_mega_bytes_per_second = current_backup_rate_in_mega_bytes_per_second_;
     estimated_seconds_to_completion = estimated_seconds_to_completion_;
     elapsed_time_in_seconds = elapsed_time_in_seconds_;
     source_region = source_region_;
     tags = tags_;
     restorable_node_types = restorable_node_types_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     maintenance_track_name = maintenance_track_name_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     manual_snapshot_remaining_days = manual_snapshot_remaining_days_;
     snapshot_retention_start_time = snapshot_retention_start_time_;
     master_password_secret_arn = master_password_secret_arn_;
     master_password_secret_kms_key_id = master_password_secret_kms_key_id_;
     snapshot_arn = snapshot_arn_;
   }
    : snapshot)

let make_authorize_snapshot_access_message
    ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?snapshot_arn:(snapshot_arn_ : string_ option)
    ?snapshot_cluster_identifier:(snapshot_cluster_identifier_ : string_ option)
    ~account_with_restore_access:(account_with_restore_access_ : string_) () =
  ({
     snapshot_identifier = snapshot_identifier_;
     snapshot_arn = snapshot_arn_;
     snapshot_cluster_identifier = snapshot_cluster_identifier_;
     account_with_restore_access = account_with_restore_access_;
   }
    : authorize_snapshot_access_message)

let make_authorized_token_issuer
    ?trusted_token_issuer_arn:(trusted_token_issuer_arn_ : string_ option)
    ?authorized_audiences_list:(authorized_audiences_list_ : authorized_audience_list option) () =
  ({
     trusted_token_issuer_arn = trusted_token_issuer_arn_;
     authorized_audiences_list = authorized_audiences_list_;
   }
    : authorized_token_issuer)

let make_supported_platform ?name:(name_ : string_ option) () =
  ({ name = name_ } : supported_platform)

let make_availability_zone ?name:(name_ : string_ option)
    ?supported_platforms:(supported_platforms_ : supported_platforms_list option) () =
  ({ name = name_; supported_platforms = supported_platforms_ } : availability_zone)

let make_snapshot_error_message ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?snapshot_cluster_identifier:(snapshot_cluster_identifier_ : string_ option)
    ?failure_code:(failure_code_ : string_ option)
    ?failure_reason:(failure_reason_ : string_ option) () =
  ({
     snapshot_identifier = snapshot_identifier_;
     snapshot_cluster_identifier = snapshot_cluster_identifier_;
     failure_code = failure_code_;
     failure_reason = failure_reason_;
   }
    : snapshot_error_message)

let make_delete_cluster_snapshot_message
    ?snapshot_cluster_identifier:(snapshot_cluster_identifier_ : string_ option)
    ~snapshot_identifier:(snapshot_identifier_ : string_) () =
  ({
     snapshot_identifier = snapshot_identifier_;
     snapshot_cluster_identifier = snapshot_cluster_identifier_;
   }
    : delete_cluster_snapshot_message)

let make_batch_delete_cluster_snapshots_request
    ~identifiers:(identifiers_ : delete_cluster_snapshot_message_list) () =
  ({ identifiers = identifiers_ } : batch_delete_cluster_snapshots_request)

let make_batch_modify_cluster_snapshots_output_message
    ?resources:(resources_ : snapshot_identifier_list option)
    ?errors:(errors_ : batch_snapshot_operation_errors option) () =
  ({ resources = resources_; errors = errors_ } : batch_modify_cluster_snapshots_output_message)

let make_batch_modify_cluster_snapshots_message
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ?force:(force_ : boolean_ option)
    ~snapshot_identifier_list:(snapshot_identifier_list_ : snapshot_identifier_list) () =
  ({
     snapshot_identifier_list = snapshot_identifier_list_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     force = force_;
   }
    : batch_modify_cluster_snapshots_message)

let make_resize_progress_message ?target_node_type:(target_node_type_ : string_ option)
    ?target_number_of_nodes:(target_number_of_nodes_ : integer_optional option)
    ?target_cluster_type:(target_cluster_type_ : string_ option) ?status:(status_ : string_ option)
    ?import_tables_completed:(import_tables_completed_ : import_tables_completed option)
    ?import_tables_in_progress:(import_tables_in_progress_ : import_tables_in_progress option)
    ?import_tables_not_started:(import_tables_not_started_ : import_tables_not_started option)
    ?avg_resize_rate_in_mega_bytes_per_second:
      (avg_resize_rate_in_mega_bytes_per_second_ : double_optional option)
    ?total_resize_data_in_mega_bytes:(total_resize_data_in_mega_bytes_ : long_optional option)
    ?progress_in_mega_bytes:(progress_in_mega_bytes_ : long_optional option)
    ?elapsed_time_in_seconds:(elapsed_time_in_seconds_ : long_optional option)
    ?estimated_time_to_completion_in_seconds:
      (estimated_time_to_completion_in_seconds_ : long_optional option)
    ?resize_type:(resize_type_ : string_ option) ?message:(message_ : string_ option)
    ?target_encryption_type:(target_encryption_type_ : string_ option)
    ?data_transfer_progress_percent:(data_transfer_progress_percent_ : double_optional option) () =
  ({
     target_node_type = target_node_type_;
     target_number_of_nodes = target_number_of_nodes_;
     target_cluster_type = target_cluster_type_;
     status = status_;
     import_tables_completed = import_tables_completed_;
     import_tables_in_progress = import_tables_in_progress_;
     import_tables_not_started = import_tables_not_started_;
     avg_resize_rate_in_mega_bytes_per_second = avg_resize_rate_in_mega_bytes_per_second_;
     total_resize_data_in_mega_bytes = total_resize_data_in_mega_bytes_;
     progress_in_mega_bytes = progress_in_mega_bytes_;
     elapsed_time_in_seconds = elapsed_time_in_seconds_;
     estimated_time_to_completion_in_seconds = estimated_time_to_completion_in_seconds_;
     resize_type = resize_type_;
     message = message_;
     target_encryption_type = target_encryption_type_;
     data_transfer_progress_percent = data_transfer_progress_percent_;
   }
    : resize_progress_message)

let make_cancel_resize_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : cancel_resize_message)

let make_cluster_node ?node_role:(node_role_ : string_ option)
    ?private_ip_address:(private_ip_address_ : string_ option)
    ?public_ip_address:(public_ip_address_ : string_ option) () =
  ({
     node_role = node_role_;
     private_ip_address = private_ip_address_;
     public_ip_address = public_ip_address_;
   }
    : cluster_node)

let make_secondary_cluster_info ?availability_zone:(availability_zone_ : string_ option)
    ?cluster_nodes:(cluster_nodes_ : cluster_nodes_list option) () =
  ({ availability_zone = availability_zone_; cluster_nodes = cluster_nodes_ }
    : secondary_cluster_info)

let make_reserved_node_exchange_status
    ?reserved_node_exchange_request_id:(reserved_node_exchange_request_id_ : string_ option)
    ?status:(status_ : reserved_node_exchange_status_type option)
    ?request_time:(request_time_ : t_stamp option)
    ?source_reserved_node_id:(source_reserved_node_id_ : string_ option)
    ?source_reserved_node_type:(source_reserved_node_type_ : string_ option)
    ?source_reserved_node_count:(source_reserved_node_count_ : integer option)
    ?target_reserved_node_offering_id:(target_reserved_node_offering_id_ : string_ option)
    ?target_reserved_node_type:(target_reserved_node_type_ : string_ option)
    ?target_reserved_node_count:(target_reserved_node_count_ : integer option) () =
  ({
     reserved_node_exchange_request_id = reserved_node_exchange_request_id_;
     status = status_;
     request_time = request_time_;
     source_reserved_node_id = source_reserved_node_id_;
     source_reserved_node_type = source_reserved_node_type_;
     source_reserved_node_count = source_reserved_node_count_;
     target_reserved_node_offering_id = target_reserved_node_offering_id_;
     target_reserved_node_type = target_reserved_node_type_;
     target_reserved_node_count = target_reserved_node_count_;
   }
    : reserved_node_exchange_status)

let make_resize_info ?resize_type:(resize_type_ : string_ option)
    ?allow_cancel_resize:(allow_cancel_resize_ : boolean_ option) () =
  ({ resize_type = resize_type_; allow_cancel_resize = allow_cancel_resize_ } : resize_info)

let make_deferred_maintenance_window
    ?defer_maintenance_identifier:(defer_maintenance_identifier_ : string_ option)
    ?defer_maintenance_start_time:(defer_maintenance_start_time_ : t_stamp option)
    ?defer_maintenance_end_time:(defer_maintenance_end_time_ : t_stamp option) () =
  ({
     defer_maintenance_identifier = defer_maintenance_identifier_;
     defer_maintenance_start_time = defer_maintenance_start_time_;
     defer_maintenance_end_time = defer_maintenance_end_time_;
   }
    : deferred_maintenance_window)

let make_cluster_iam_role ?iam_role_arn:(iam_role_arn_ : string_ option)
    ?apply_status:(apply_status_ : string_ option) () =
  ({ iam_role_arn = iam_role_arn_; apply_status = apply_status_ } : cluster_iam_role)

let make_elastic_ip_status ?elastic_ip:(elastic_ip_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ elastic_ip = elastic_ip_; status = status_ } : elastic_ip_status)

let make_cluster_snapshot_copy_status ?destination_region:(destination_region_ : string_ option)
    ?retention_period:(retention_period_ : long option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer option)
    ?snapshot_copy_grant_name:(snapshot_copy_grant_name_ : string_ option) () =
  ({
     destination_region = destination_region_;
     retention_period = retention_period_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     snapshot_copy_grant_name = snapshot_copy_grant_name_;
   }
    : cluster_snapshot_copy_status)

let make_hsm_status
    ?hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_ option)
    ?hsm_configuration_identifier:(hsm_configuration_identifier_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({
     hsm_client_certificate_identifier = hsm_client_certificate_identifier_;
     hsm_configuration_identifier = hsm_configuration_identifier_;
     status = status_;
   }
    : hsm_status)

let make_data_transfer_progress ?status:(status_ : string_ option)
    ?current_rate_in_mega_bytes_per_second:
      (current_rate_in_mega_bytes_per_second_ : double_optional option)
    ?total_data_in_mega_bytes:(total_data_in_mega_bytes_ : long option)
    ?data_transferred_in_mega_bytes:(data_transferred_in_mega_bytes_ : long option)
    ?estimated_time_to_completion_in_seconds:
      (estimated_time_to_completion_in_seconds_ : long_optional option)
    ?elapsed_time_in_seconds:(elapsed_time_in_seconds_ : long_optional option) () =
  ({
     status = status_;
     current_rate_in_mega_bytes_per_second = current_rate_in_mega_bytes_per_second_;
     total_data_in_mega_bytes = total_data_in_mega_bytes_;
     data_transferred_in_mega_bytes = data_transferred_in_mega_bytes_;
     estimated_time_to_completion_in_seconds = estimated_time_to_completion_in_seconds_;
     elapsed_time_in_seconds = elapsed_time_in_seconds_;
   }
    : data_transfer_progress)

let make_restore_status ?status:(status_ : string_ option)
    ?current_restore_rate_in_mega_bytes_per_second:
      (current_restore_rate_in_mega_bytes_per_second_ : double option)
    ?snapshot_size_in_mega_bytes:(snapshot_size_in_mega_bytes_ : long option)
    ?progress_in_mega_bytes:(progress_in_mega_bytes_ : long option)
    ?elapsed_time_in_seconds:(elapsed_time_in_seconds_ : long option)
    ?estimated_time_to_completion_in_seconds:
      (estimated_time_to_completion_in_seconds_ : long option) () =
  ({
     status = status_;
     current_restore_rate_in_mega_bytes_per_second = current_restore_rate_in_mega_bytes_per_second_;
     snapshot_size_in_mega_bytes = snapshot_size_in_mega_bytes_;
     progress_in_mega_bytes = progress_in_mega_bytes_;
     elapsed_time_in_seconds = elapsed_time_in_seconds_;
     estimated_time_to_completion_in_seconds = estimated_time_to_completion_in_seconds_;
   }
    : restore_status)

let make_pending_modified_values
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?node_type:(node_type_ : string_ option)
    ?number_of_nodes:(number_of_nodes_ : integer_optional option)
    ?cluster_type:(cluster_type_ : string_ option)
    ?cluster_version:(cluster_version_ : string_ option)
    ?automated_snapshot_retention_period:
      (automated_snapshot_retention_period_ : integer_optional option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : boolean_optional option)
    ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?encryption_type:(encryption_type_ : string_ option) () =
  ({
     master_user_password = master_user_password_;
     node_type = node_type_;
     number_of_nodes = number_of_nodes_;
     cluster_type = cluster_type_;
     cluster_version = cluster_version_;
     automated_snapshot_retention_period = automated_snapshot_retention_period_;
     cluster_identifier = cluster_identifier_;
     publicly_accessible = publicly_accessible_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     maintenance_track_name = maintenance_track_name_;
     encryption_type = encryption_type_;
   }
    : pending_modified_values)

let make_cluster_parameter_status ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_apply_status:(parameter_apply_status_ : string_ option)
    ?parameter_apply_error_description:(parameter_apply_error_description_ : string_ option) () =
  ({
     parameter_name = parameter_name_;
     parameter_apply_status = parameter_apply_status_;
     parameter_apply_error_description = parameter_apply_error_description_;
   }
    : cluster_parameter_status)

let make_cluster_parameter_group_status
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?parameter_apply_status:(parameter_apply_status_ : string_ option)
    ?cluster_parameter_status_list:
      (cluster_parameter_status_list_ : cluster_parameter_status_list option) () =
  ({
     parameter_group_name = parameter_group_name_;
     parameter_apply_status = parameter_apply_status_;
     cluster_parameter_status_list = cluster_parameter_status_list_;
   }
    : cluster_parameter_group_status)

let make_vpc_security_group_membership
    ?vpc_security_group_id:(vpc_security_group_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ vpc_security_group_id = vpc_security_group_id_; status = status_ }
    : vpc_security_group_membership)

let make_cluster_security_group_membership
    ?cluster_security_group_name:(cluster_security_group_name_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ cluster_security_group_name = cluster_security_group_name_; status = status_ }
    : cluster_security_group_membership)

let make_network_interface ?network_interface_id:(network_interface_id_ : string_ option)
    ?subnet_id:(subnet_id_ : string_ option)
    ?private_ip_address:(private_ip_address_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?ipv6_address:(ipv6_address_ : string_ option) () =
  ({
     network_interface_id = network_interface_id_;
     subnet_id = subnet_id_;
     private_ip_address = private_ip_address_;
     availability_zone = availability_zone_;
     ipv6_address = ipv6_address_;
   }
    : network_interface)

let make_vpc_endpoint ?vpc_endpoint_id:(vpc_endpoint_id_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option)
    ?network_interfaces:(network_interfaces_ : network_interface_list option) () =
  ({
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_id = vpc_id_;
     network_interfaces = network_interfaces_;
   }
    : vpc_endpoint)

let make_endpoint ?address:(address_ : string_ option) ?port:(port_ : integer option)
    ?vpc_endpoints:(vpc_endpoints_ : vpc_endpoints_list option) () =
  ({ address = address_; port = port_; vpc_endpoints = vpc_endpoints_ } : endpoint)

let make_cluster ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?cluster_status:(cluster_status_ : string_ option)
    ?cluster_availability_status:(cluster_availability_status_ : string_ option)
    ?modify_status:(modify_status_ : string_ option)
    ?master_username:(master_username_ : string_ option) ?db_name:(db_name_ : string_ option)
    ?endpoint:(endpoint_ : endpoint option)
    ?cluster_create_time:(cluster_create_time_ : t_stamp option)
    ?automated_snapshot_retention_period:(automated_snapshot_retention_period_ : integer option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer option)
    ?cluster_security_groups:
      (cluster_security_groups_ : cluster_security_group_membership_list option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?cluster_parameter_groups:
      (cluster_parameter_groups_ : cluster_parameter_group_status_list option)
    ?cluster_subnet_group_name:(cluster_subnet_group_name_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?availability_zone:(availability_zone_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?pending_modified_values:(pending_modified_values_ : pending_modified_values option)
    ?cluster_version:(cluster_version_ : string_ option)
    ?allow_version_upgrade:(allow_version_upgrade_ : boolean_ option)
    ?number_of_nodes:(number_of_nodes_ : integer option)
    ?publicly_accessible:(publicly_accessible_ : boolean_ option)
    ?encrypted:(encrypted_ : boolean_ option)
    ?restore_status:(restore_status_ : restore_status option)
    ?data_transfer_progress:(data_transfer_progress_ : data_transfer_progress option)
    ?hsm_status:(hsm_status_ : hsm_status option)
    ?cluster_snapshot_copy_status:
      (cluster_snapshot_copy_status_ : cluster_snapshot_copy_status option)
    ?cluster_public_key:(cluster_public_key_ : string_ option)
    ?cluster_nodes:(cluster_nodes_ : cluster_nodes_list option)
    ?elastic_ip_status:(elastic_ip_status_ : elastic_ip_status option)
    ?cluster_revision_number:(cluster_revision_number_ : string_ option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : boolean_ option)
    ?iam_roles:(iam_roles_ : cluster_iam_role_list option)
    ?pending_actions:(pending_actions_ : pending_actions_list option)
    ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?elastic_resize_number_of_node_options:(elastic_resize_number_of_node_options_ : string_ option)
    ?deferred_maintenance_windows:
      (deferred_maintenance_windows_ : deferred_maintenance_windows_list option)
    ?snapshot_schedule_identifier:(snapshot_schedule_identifier_ : string_ option)
    ?snapshot_schedule_state:(snapshot_schedule_state_ : schedule_state option)
    ?expected_next_snapshot_schedule_time:(expected_next_snapshot_schedule_time_ : t_stamp option)
    ?expected_next_snapshot_schedule_time_status:
      (expected_next_snapshot_schedule_time_status_ : string_ option)
    ?next_maintenance_window_start_time:(next_maintenance_window_start_time_ : t_stamp option)
    ?resize_info:(resize_info_ : resize_info option)
    ?availability_zone_relocation_status:(availability_zone_relocation_status_ : string_ option)
    ?cluster_namespace_arn:(cluster_namespace_arn_ : string_ option)
    ?total_storage_capacity_in_mega_bytes:
      (total_storage_capacity_in_mega_bytes_ : long_optional option)
    ?aqua_configuration:(aqua_configuration_ : aqua_configuration option)
    ?default_iam_role_arn:(default_iam_role_arn_ : string_ option)
    ?reserved_node_exchange_status:
      (reserved_node_exchange_status_ : reserved_node_exchange_status option)
    ?custom_domain_name:(custom_domain_name_ : string_ option)
    ?custom_domain_certificate_arn:(custom_domain_certificate_arn_ : string_ option)
    ?custom_domain_certificate_expiry_date:(custom_domain_certificate_expiry_date_ : t_stamp option)
    ?master_password_secret_arn:(master_password_secret_arn_ : string_ option)
    ?master_password_secret_kms_key_id:(master_password_secret_kms_key_id_ : string_ option)
    ?ip_address_type:(ip_address_type_ : string_ option) ?multi_a_z:(multi_a_z_ : string_ option)
    ?multi_az_secondary:(multi_az_secondary_ : secondary_cluster_info option)
    ?lakehouse_registration_status:(lakehouse_registration_status_ : string_ option)
    ?catalog_arn:(catalog_arn_ : string_ option)
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : string_ option) () =
  ({
     cluster_identifier = cluster_identifier_;
     node_type = node_type_;
     cluster_status = cluster_status_;
     cluster_availability_status = cluster_availability_status_;
     modify_status = modify_status_;
     master_username = master_username_;
     db_name = db_name_;
     endpoint = endpoint_;
     cluster_create_time = cluster_create_time_;
     automated_snapshot_retention_period = automated_snapshot_retention_period_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     cluster_security_groups = cluster_security_groups_;
     vpc_security_groups = vpc_security_groups_;
     cluster_parameter_groups = cluster_parameter_groups_;
     cluster_subnet_group_name = cluster_subnet_group_name_;
     vpc_id = vpc_id_;
     availability_zone = availability_zone_;
     preferred_maintenance_window = preferred_maintenance_window_;
     pending_modified_values = pending_modified_values_;
     cluster_version = cluster_version_;
     allow_version_upgrade = allow_version_upgrade_;
     number_of_nodes = number_of_nodes_;
     publicly_accessible = publicly_accessible_;
     encrypted = encrypted_;
     restore_status = restore_status_;
     data_transfer_progress = data_transfer_progress_;
     hsm_status = hsm_status_;
     cluster_snapshot_copy_status = cluster_snapshot_copy_status_;
     cluster_public_key = cluster_public_key_;
     cluster_nodes = cluster_nodes_;
     elastic_ip_status = elastic_ip_status_;
     cluster_revision_number = cluster_revision_number_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     iam_roles = iam_roles_;
     pending_actions = pending_actions_;
     maintenance_track_name = maintenance_track_name_;
     elastic_resize_number_of_node_options = elastic_resize_number_of_node_options_;
     deferred_maintenance_windows = deferred_maintenance_windows_;
     snapshot_schedule_identifier = snapshot_schedule_identifier_;
     snapshot_schedule_state = snapshot_schedule_state_;
     expected_next_snapshot_schedule_time = expected_next_snapshot_schedule_time_;
     expected_next_snapshot_schedule_time_status = expected_next_snapshot_schedule_time_status_;
     next_maintenance_window_start_time = next_maintenance_window_start_time_;
     resize_info = resize_info_;
     availability_zone_relocation_status = availability_zone_relocation_status_;
     cluster_namespace_arn = cluster_namespace_arn_;
     total_storage_capacity_in_mega_bytes = total_storage_capacity_in_mega_bytes_;
     aqua_configuration = aqua_configuration_;
     default_iam_role_arn = default_iam_role_arn_;
     reserved_node_exchange_status = reserved_node_exchange_status_;
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_certificate_expiry_date = custom_domain_certificate_expiry_date_;
     master_password_secret_arn = master_password_secret_arn_;
     master_password_secret_kms_key_id = master_password_secret_kms_key_id_;
     ip_address_type = ip_address_type_;
     multi_a_z = multi_a_z_;
     multi_az_secondary = multi_az_secondary_;
     lakehouse_registration_status = lakehouse_registration_status_;
     catalog_arn = catalog_arn_;
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
   }
    : cluster)

let make_cluster_credentials ?db_user:(db_user_ : string_ option)
    ?db_password:(db_password_ : sensitive_string option) ?expiration:(expiration_ : t_stamp option)
    () =
  ({ db_user = db_user_; db_password = db_password_; expiration = expiration_ }
    : cluster_credentials)

let make_revision_target ?database_revision:(database_revision_ : string_ option)
    ?description:(description_ : string_ option)
    ?database_revision_release_date:(database_revision_release_date_ : t_stamp option) () =
  ({
     database_revision = database_revision_;
     description = description_;
     database_revision_release_date = database_revision_release_date_;
   }
    : revision_target)

let make_cluster_db_revision ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?current_database_revision:(current_database_revision_ : string_ option)
    ?database_revision_release_date:(database_revision_release_date_ : t_stamp option)
    ?revision_targets:(revision_targets_ : revision_targets_list option) () =
  ({
     cluster_identifier = cluster_identifier_;
     current_database_revision = current_database_revision_;
     database_revision_release_date = database_revision_release_date_;
     revision_targets = revision_targets_;
   }
    : cluster_db_revision)

let make_cluster_db_revisions_message ?marker:(marker_ : string_ option)
    ?cluster_db_revisions:(cluster_db_revisions_ : cluster_db_revisions_list option) () =
  ({ marker = marker_; cluster_db_revisions = cluster_db_revisions_ }
    : cluster_db_revisions_message)

let make_cluster_extended_credentials ?db_user:(db_user_ : string_ option)
    ?db_password:(db_password_ : sensitive_string option) ?expiration:(expiration_ : t_stamp option)
    ?next_refresh_time:(next_refresh_time_ : t_stamp option) () =
  ({
     db_user = db_user_;
     db_password = db_password_;
     expiration = expiration_;
     next_refresh_time = next_refresh_time_;
   }
    : cluster_extended_credentials)

let make_cluster_parameter_group ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?parameter_group_family:(parameter_group_family_ : string_ option)
    ?description:(description_ : string_ option) ?tags:(tags_ : tag_list option) () =
  ({
     parameter_group_name = parameter_group_name_;
     parameter_group_family = parameter_group_family_;
     description = description_;
     tags = tags_;
   }
    : cluster_parameter_group)

let make_parameter ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option)
    ?description:(description_ : string_ option) ?source:(source_ : string_ option)
    ?data_type:(data_type_ : string_ option) ?allowed_values:(allowed_values_ : string_ option)
    ?apply_type:(apply_type_ : parameter_apply_type option)
    ?is_modifiable:(is_modifiable_ : boolean_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option) () =
  ({
     parameter_name = parameter_name_;
     parameter_value = parameter_value_;
     description = description_;
     source = source_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     apply_type = apply_type_;
     is_modifiable = is_modifiable_;
     minimum_engine_version = minimum_engine_version_;
   }
    : parameter)

let make_cluster_parameter_group_details ?parameters:(parameters_ : parameters_list option)
    ?marker:(marker_ : string_ option) () =
  ({ parameters = parameters_; marker = marker_ } : cluster_parameter_group_details)

let make_cluster_parameter_group_name_message
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?parameter_group_status:(parameter_group_status_ : string_ option) () =
  ({
     parameter_group_name = parameter_group_name_;
     parameter_group_status = parameter_group_status_;
   }
    : cluster_parameter_group_name_message)

let make_cluster_parameter_groups_message ?marker:(marker_ : string_ option)
    ?parameter_groups:(parameter_groups_ : parameter_group_list option) () =
  ({ marker = marker_; parameter_groups = parameter_groups_ } : cluster_parameter_groups_message)

let make_cluster_security_group_message ?marker:(marker_ : string_ option)
    ?cluster_security_groups:(cluster_security_groups_ : cluster_security_groups option) () =
  ({ marker = marker_; cluster_security_groups = cluster_security_groups_ }
    : cluster_security_group_message)

let make_subnet ?subnet_identifier:(subnet_identifier_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : availability_zone option)
    ?subnet_status:(subnet_status_ : string_ option) () =
  ({
     subnet_identifier = subnet_identifier_;
     subnet_availability_zone = subnet_availability_zone_;
     subnet_status = subnet_status_;
   }
    : subnet)

let make_cluster_subnet_group
    ?cluster_subnet_group_name:(cluster_subnet_group_name_ : string_ option)
    ?description:(description_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?subnet_group_status:(subnet_group_status_ : string_ option)
    ?subnets:(subnets_ : subnet_list option) ?tags:(tags_ : tag_list option)
    ?supported_cluster_ip_address_types:
      (supported_cluster_ip_address_types_ : value_string_list option) () =
  ({
     cluster_subnet_group_name = cluster_subnet_group_name_;
     description = description_;
     vpc_id = vpc_id_;
     subnet_group_status = subnet_group_status_;
     subnets = subnets_;
     tags = tags_;
     supported_cluster_ip_address_types = supported_cluster_ip_address_types_;
   }
    : cluster_subnet_group)

let make_cluster_subnet_group_message ?marker:(marker_ : string_ option)
    ?cluster_subnet_groups:(cluster_subnet_groups_ : cluster_subnet_groups option) () =
  ({ marker = marker_; cluster_subnet_groups = cluster_subnet_groups_ }
    : cluster_subnet_group_message)

let make_cluster_version ?cluster_version:(cluster_version_ : string_ option)
    ?cluster_parameter_group_family:(cluster_parameter_group_family_ : string_ option)
    ?description:(description_ : string_ option) () =
  ({
     cluster_version = cluster_version_;
     cluster_parameter_group_family = cluster_parameter_group_family_;
     description = description_;
   }
    : cluster_version)

let make_cluster_versions_message ?marker:(marker_ : string_ option)
    ?cluster_versions:(cluster_versions_ : cluster_version_list option) () =
  ({ marker = marker_; cluster_versions = cluster_versions_ } : cluster_versions_message)

let make_clusters_message ?marker:(marker_ : string_ option)
    ?clusters:(clusters_ : cluster_list option) () =
  ({ marker = marker_; clusters = clusters_ } : clusters_message)

let make_connect ~authorization:(authorization_ : service_authorization) () =
  ({ authorization = authorization_ } : connect)

let make_copy_cluster_snapshot_message
    ?source_snapshot_cluster_identifier:(source_snapshot_cluster_identifier_ : string_ option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ~source_snapshot_identifier:(source_snapshot_identifier_ : string_)
    ~target_snapshot_identifier:(target_snapshot_identifier_ : string_) () =
  ({
     source_snapshot_identifier = source_snapshot_identifier_;
     source_snapshot_cluster_identifier = source_snapshot_cluster_identifier_;
     target_snapshot_identifier = target_snapshot_identifier_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
   }
    : copy_cluster_snapshot_message)

let make_create_authentication_profile_message
    ~authentication_profile_name:(authentication_profile_name_ : authentication_profile_name_string)
    ~authentication_profile_content:(authentication_profile_content_ : string_) () =
  ({
     authentication_profile_name = authentication_profile_name_;
     authentication_profile_content = authentication_profile_content_;
   }
    : create_authentication_profile_message)

let make_create_cluster_message ?db_name:(db_name_ : string_ option)
    ?cluster_type:(cluster_type_ : string_ option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?cluster_security_groups:(cluster_security_groups_ : cluster_security_group_name_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?cluster_subnet_group_name:(cluster_subnet_group_name_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?cluster_parameter_group_name:(cluster_parameter_group_name_ : string_ option)
    ?automated_snapshot_retention_period:
      (automated_snapshot_retention_period_ : integer_optional option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ?port:(port_ : integer_optional option) ?cluster_version:(cluster_version_ : string_ option)
    ?allow_version_upgrade:(allow_version_upgrade_ : boolean_optional option)
    ?number_of_nodes:(number_of_nodes_ : integer_optional option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?encrypted:(encrypted_ : boolean_optional option)
    ?hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_ option)
    ?hsm_configuration_identifier:(hsm_configuration_identifier_ : string_ option)
    ?elastic_ip:(elastic_ip_ : string_ option) ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : boolean_optional option)
    ?additional_info:(additional_info_ : string_ option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?snapshot_schedule_identifier:(snapshot_schedule_identifier_ : string_ option)
    ?availability_zone_relocation:(availability_zone_relocation_ : boolean_optional option)
    ?aqua_configuration_status:(aqua_configuration_status_ : aqua_configuration_status option)
    ?default_iam_role_arn:(default_iam_role_arn_ : string_ option)
    ?load_sample_data:(load_sample_data_ : string_ option)
    ?manage_master_password:(manage_master_password_ : boolean_optional option)
    ?master_password_secret_kms_key_id:(master_password_secret_kms_key_id_ : string_ option)
    ?ip_address_type:(ip_address_type_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?redshift_idc_application_arn:(redshift_idc_application_arn_ : string_ option)
    ?catalog_name:(catalog_name_ : catalog_name_string option)
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : boolean_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_) ~node_type:(node_type_ : string_)
    ~master_username:(master_username_ : string_) () =
  ({
     db_name = db_name_;
     cluster_identifier = cluster_identifier_;
     cluster_type = cluster_type_;
     node_type = node_type_;
     master_username = master_username_;
     master_user_password = master_user_password_;
     cluster_security_groups = cluster_security_groups_;
     vpc_security_group_ids = vpc_security_group_ids_;
     cluster_subnet_group_name = cluster_subnet_group_name_;
     availability_zone = availability_zone_;
     preferred_maintenance_window = preferred_maintenance_window_;
     cluster_parameter_group_name = cluster_parameter_group_name_;
     automated_snapshot_retention_period = automated_snapshot_retention_period_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     port = port_;
     cluster_version = cluster_version_;
     allow_version_upgrade = allow_version_upgrade_;
     number_of_nodes = number_of_nodes_;
     publicly_accessible = publicly_accessible_;
     encrypted = encrypted_;
     hsm_client_certificate_identifier = hsm_client_certificate_identifier_;
     hsm_configuration_identifier = hsm_configuration_identifier_;
     elastic_ip = elastic_ip_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     additional_info = additional_info_;
     iam_roles = iam_roles_;
     maintenance_track_name = maintenance_track_name_;
     snapshot_schedule_identifier = snapshot_schedule_identifier_;
     availability_zone_relocation = availability_zone_relocation_;
     aqua_configuration_status = aqua_configuration_status_;
     default_iam_role_arn = default_iam_role_arn_;
     load_sample_data = load_sample_data_;
     manage_master_password = manage_master_password_;
     master_password_secret_kms_key_id = master_password_secret_kms_key_id_;
     ip_address_type = ip_address_type_;
     multi_a_z = multi_a_z_;
     redshift_idc_application_arn = redshift_idc_application_arn_;
     catalog_name = catalog_name_;
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
   }
    : create_cluster_message)

let make_create_cluster_parameter_group_message ?tags:(tags_ : tag_list option)
    ~parameter_group_name:(parameter_group_name_ : string_)
    ~parameter_group_family:(parameter_group_family_ : string_)
    ~description:(description_ : string_) () =
  ({
     parameter_group_name = parameter_group_name_;
     parameter_group_family = parameter_group_family_;
     description = description_;
     tags = tags_;
   }
    : create_cluster_parameter_group_message)

let make_create_cluster_security_group_message ?tags:(tags_ : tag_list option)
    ~cluster_security_group_name:(cluster_security_group_name_ : string_)
    ~description:(description_ : string_) () =
  ({
     cluster_security_group_name = cluster_security_group_name_;
     description = description_;
     tags = tags_;
   }
    : create_cluster_security_group_message)

let make_create_cluster_snapshot_message
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ?tags:(tags_ : tag_list option) ~snapshot_identifier:(snapshot_identifier_ : string_)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     snapshot_identifier = snapshot_identifier_;
     cluster_identifier = cluster_identifier_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     tags = tags_;
   }
    : create_cluster_snapshot_message)

let make_create_cluster_subnet_group_message ?tags:(tags_ : tag_list option)
    ~cluster_subnet_group_name:(cluster_subnet_group_name_ : string_)
    ~description:(description_ : string_) ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     cluster_subnet_group_name = cluster_subnet_group_name_;
     description = description_;
     subnet_ids = subnet_ids_;
     tags = tags_;
   }
    : create_cluster_subnet_group_message)

let make_create_custom_domain_association_message
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name_string)
    ~custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     cluster_identifier = cluster_identifier_;
   }
    : create_custom_domain_association_message)

let make_endpoint_access ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?resource_owner:(resource_owner_ : string_ option)
    ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?endpoint_status:(endpoint_status_ : string_ option)
    ?endpoint_name:(endpoint_name_ : string_ option)
    ?endpoint_create_time:(endpoint_create_time_ : t_stamp option) ?port:(port_ : integer option)
    ?address:(address_ : string_ option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?vpc_endpoint:(vpc_endpoint_ : vpc_endpoint option) () =
  ({
     cluster_identifier = cluster_identifier_;
     resource_owner = resource_owner_;
     subnet_group_name = subnet_group_name_;
     endpoint_status = endpoint_status_;
     endpoint_name = endpoint_name_;
     endpoint_create_time = endpoint_create_time_;
     port = port_;
     address = address_;
     vpc_security_groups = vpc_security_groups_;
     vpc_endpoint = vpc_endpoint_;
   }
    : endpoint_access)

let make_create_endpoint_access_message ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?resource_owner:(resource_owner_ : string_ option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ~endpoint_name:(endpoint_name_ : string_) ~subnet_group_name:(subnet_group_name_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     resource_owner = resource_owner_;
     endpoint_name = endpoint_name_;
     subnet_group_name = subnet_group_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
   }
    : create_endpoint_access_message)

let make_event_subscription ?customer_aws_id:(customer_aws_id_ : string_ option)
    ?cust_subscription_id:(cust_subscription_id_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option) ?status:(status_ : string_ option)
    ?subscription_creation_time:(subscription_creation_time_ : t_stamp option)
    ?source_type:(source_type_ : string_ option)
    ?source_ids_list:(source_ids_list_ : source_ids_list option)
    ?event_categories_list:(event_categories_list_ : event_categories_list option)
    ?severity:(severity_ : string_ option) ?enabled:(enabled_ : boolean_ option)
    ?tags:(tags_ : tag_list option) () =
  ({
     customer_aws_id = customer_aws_id_;
     cust_subscription_id = cust_subscription_id_;
     sns_topic_arn = sns_topic_arn_;
     status = status_;
     subscription_creation_time = subscription_creation_time_;
     source_type = source_type_;
     source_ids_list = source_ids_list_;
     event_categories_list = event_categories_list_;
     severity = severity_;
     enabled = enabled_;
     tags = tags_;
   }
    : event_subscription)

let make_create_event_subscription_message ?source_type:(source_type_ : string_ option)
    ?source_ids:(source_ids_ : source_ids_list option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?severity:(severity_ : string_ option) ?enabled:(enabled_ : boolean_optional option)
    ?tags:(tags_ : tag_list option) ~subscription_name:(subscription_name_ : string_)
    ~sns_topic_arn:(sns_topic_arn_ : string_) () =
  ({
     subscription_name = subscription_name_;
     sns_topic_arn = sns_topic_arn_;
     source_type = source_type_;
     source_ids = source_ids_;
     event_categories = event_categories_;
     severity = severity_;
     enabled = enabled_;
     tags = tags_;
   }
    : create_event_subscription_message)

let make_hsm_client_certificate
    ?hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_ option)
    ?hsm_client_certificate_public_key:(hsm_client_certificate_public_key_ : string_ option)
    ?tags:(tags_ : tag_list option) () =
  ({
     hsm_client_certificate_identifier = hsm_client_certificate_identifier_;
     hsm_client_certificate_public_key = hsm_client_certificate_public_key_;
     tags = tags_;
   }
    : hsm_client_certificate)

let make_create_hsm_client_certificate_message ?tags:(tags_ : tag_list option)
    ~hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_) () =
  ({ hsm_client_certificate_identifier = hsm_client_certificate_identifier_; tags = tags_ }
    : create_hsm_client_certificate_message)

let make_hsm_configuration
    ?hsm_configuration_identifier:(hsm_configuration_identifier_ : string_ option)
    ?description:(description_ : string_ option) ?hsm_ip_address:(hsm_ip_address_ : string_ option)
    ?hsm_partition_name:(hsm_partition_name_ : string_ option) ?tags:(tags_ : tag_list option) () =
  ({
     hsm_configuration_identifier = hsm_configuration_identifier_;
     description = description_;
     hsm_ip_address = hsm_ip_address_;
     hsm_partition_name = hsm_partition_name_;
     tags = tags_;
   }
    : hsm_configuration)

let make_create_hsm_configuration_message ?tags:(tags_ : tag_list option)
    ~hsm_configuration_identifier:(hsm_configuration_identifier_ : string_)
    ~description:(description_ : string_) ~hsm_ip_address:(hsm_ip_address_ : string_)
    ~hsm_partition_name:(hsm_partition_name_ : string_)
    ~hsm_partition_password:(hsm_partition_password_ : string_)
    ~hsm_server_public_certificate:(hsm_server_public_certificate_ : string_) () =
  ({
     hsm_configuration_identifier = hsm_configuration_identifier_;
     description = description_;
     hsm_ip_address = hsm_ip_address_;
     hsm_partition_name = hsm_partition_name_;
     hsm_partition_password = hsm_partition_password_;
     hsm_server_public_certificate = hsm_server_public_certificate_;
     tags = tags_;
   }
    : create_hsm_configuration_message)

let make_integration_error ?error_message:(error_message_ : string_ option)
    ~error_code:(error_code_ : string_) () =
  ({ error_code = error_code_; error_message = error_message_ } : integration_error)

let make_integration ?integration_arn:(integration_arn_ : integration_arn option)
    ?integration_name:(integration_name_ : integration_name option)
    ?source_arn:(source_arn_ : source_arn option) ?target_arn:(target_arn_ : target_arn option)
    ?status:(status_ : zero_etl_integration_status option)
    ?errors:(errors_ : integration_error_list option) ?create_time:(create_time_ : t_stamp option)
    ?description:(description_ : description option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?additional_encryption_context:(additional_encryption_context_ : encryption_context_map option)
    ?tags:(tags_ : tag_list option) () =
  ({
     integration_arn = integration_arn_;
     integration_name = integration_name_;
     source_arn = source_arn_;
     target_arn = target_arn_;
     status = status_;
     errors = errors_;
     create_time = create_time_;
     description = description_;
     kms_key_id = kms_key_id_;
     additional_encryption_context = additional_encryption_context_;
     tags = tags_;
   }
    : integration)

let make_create_integration_message ?kms_key_id:(kms_key_id_ : string_ option)
    ?tag_list:(tag_list_ : tag_list option)
    ?additional_encryption_context:(additional_encryption_context_ : encryption_context_map option)
    ?description:(description_ : integration_description option)
    ~source_arn:(source_arn_ : source_arn) ~target_arn:(target_arn_ : target_arn)
    ~integration_name:(integration_name_ : integration_name) () =
  ({
     source_arn = source_arn_;
     target_arn = target_arn_;
     integration_name = integration_name_;
     kms_key_id = kms_key_id_;
     tag_list = tag_list_;
     additional_encryption_context = additional_encryption_context_;
     description = description_;
   }
    : create_integration_message)

let make_read_write_access ~authorization:(authorization_ : service_authorization) () =
  ({ authorization = authorization_ } : read_write_access)

let make_lake_formation_query ~authorization:(authorization_ : service_authorization) () =
  ({ authorization = authorization_ } : lake_formation_query)

let make_redshift_idc_application ?idc_instance_arn:(idc_instance_arn_ : string_ option)
    ?redshift_idc_application_name:
      (redshift_idc_application_name_ : redshift_idc_application_name option)
    ?redshift_idc_application_arn:(redshift_idc_application_arn_ : string_ option)
    ?identity_namespace:(identity_namespace_ : identity_namespace_string option)
    ?idc_display_name:(idc_display_name_ : idc_display_name_string option)
    ?iam_role_arn:(iam_role_arn_ : string_ option)
    ?idc_managed_application_arn:(idc_managed_application_arn_ : string_ option)
    ?idc_onboard_status:(idc_onboard_status_ : string_ option)
    ?authorized_token_issuer_list:
      (authorized_token_issuer_list_ : authorized_token_issuer_list option)
    ?service_integrations:(service_integrations_ : service_integration_list option)
    ?application_type:(application_type_ : application_type option) ?tags:(tags_ : tag_list option)
    ?sso_tag_keys:(sso_tag_keys_ : tag_key_list option) () =
  ({
     idc_instance_arn = idc_instance_arn_;
     redshift_idc_application_name = redshift_idc_application_name_;
     redshift_idc_application_arn = redshift_idc_application_arn_;
     identity_namespace = identity_namespace_;
     idc_display_name = idc_display_name_;
     iam_role_arn = iam_role_arn_;
     idc_managed_application_arn = idc_managed_application_arn_;
     idc_onboard_status = idc_onboard_status_;
     authorized_token_issuer_list = authorized_token_issuer_list_;
     service_integrations = service_integrations_;
     application_type = application_type_;
     tags = tags_;
     sso_tag_keys = sso_tag_keys_;
   }
    : redshift_idc_application)

let make_create_redshift_idc_application_message
    ?identity_namespace:(identity_namespace_ : identity_namespace_string option)
    ?authorized_token_issuer_list:
      (authorized_token_issuer_list_ : authorized_token_issuer_list option)
    ?service_integrations:(service_integrations_ : service_integration_list option)
    ?application_type:(application_type_ : application_type option) ?tags:(tags_ : tag_list option)
    ?sso_tag_keys:(sso_tag_keys_ : tag_key_list option)
    ~idc_instance_arn:(idc_instance_arn_ : string_)
    ~redshift_idc_application_name:(redshift_idc_application_name_ : redshift_idc_application_name)
    ~idc_display_name:(idc_display_name_ : idc_display_name_string)
    ~iam_role_arn:(iam_role_arn_ : string_) () =
  ({
     idc_instance_arn = idc_instance_arn_;
     redshift_idc_application_name = redshift_idc_application_name_;
     identity_namespace = identity_namespace_;
     idc_display_name = idc_display_name_;
     iam_role_arn = iam_role_arn_;
     authorized_token_issuer_list = authorized_token_issuer_list_;
     service_integrations = service_integrations_;
     application_type = application_type_;
     tags = tags_;
     sso_tag_keys = sso_tag_keys_;
   }
    : create_redshift_idc_application_message)

let make_resume_cluster_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : resume_cluster_message)

let make_pause_cluster_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : pause_cluster_message)

let make_resize_cluster_message ?cluster_type:(cluster_type_ : string_ option)
    ?node_type:(node_type_ : string_ option)
    ?number_of_nodes:(number_of_nodes_ : integer_optional option)
    ?classic:(classic_ : boolean_optional option)
    ?reserved_node_id:(reserved_node_id_ : string_ option)
    ?target_reserved_node_offering_id:(target_reserved_node_offering_id_ : string_ option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     cluster_type = cluster_type_;
     node_type = node_type_;
     number_of_nodes = number_of_nodes_;
     classic = classic_;
     reserved_node_id = reserved_node_id_;
     target_reserved_node_offering_id = target_reserved_node_offering_id_;
   }
    : resize_cluster_message)

let make_scheduled_action_type ?resize_cluster:(resize_cluster_ : resize_cluster_message option)
    ?pause_cluster:(pause_cluster_ : pause_cluster_message option)
    ?resume_cluster:(resume_cluster_ : resume_cluster_message option) () =
  ({
     resize_cluster = resize_cluster_;
     pause_cluster = pause_cluster_;
     resume_cluster = resume_cluster_;
   }
    : scheduled_action_type)

let make_scheduled_action ?scheduled_action_name:(scheduled_action_name_ : string_ option)
    ?target_action:(target_action_ : scheduled_action_type option)
    ?schedule:(schedule_ : string_ option) ?iam_role:(iam_role_ : string_ option)
    ?scheduled_action_description:(scheduled_action_description_ : string_ option)
    ?state:(state_ : scheduled_action_state option)
    ?next_invocations:(next_invocations_ : scheduled_action_time_list option)
    ?start_time:(start_time_ : t_stamp option) ?end_time:(end_time_ : t_stamp option) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     target_action = target_action_;
     schedule = schedule_;
     iam_role = iam_role_;
     scheduled_action_description = scheduled_action_description_;
     state = state_;
     next_invocations = next_invocations_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : scheduled_action)

let make_create_scheduled_action_message
    ?scheduled_action_description:(scheduled_action_description_ : string_ option)
    ?start_time:(start_time_ : t_stamp option) ?end_time:(end_time_ : t_stamp option)
    ?enable:(enable_ : boolean_optional option)
    ~scheduled_action_name:(scheduled_action_name_ : string_)
    ~target_action:(target_action_ : scheduled_action_type) ~schedule:(schedule_ : string_)
    ~iam_role:(iam_role_ : string_) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     target_action = target_action_;
     schedule = schedule_;
     iam_role = iam_role_;
     scheduled_action_description = scheduled_action_description_;
     start_time = start_time_;
     end_time = end_time_;
     enable = enable_;
   }
    : create_scheduled_action_message)

let make_snapshot_copy_grant ?snapshot_copy_grant_name:(snapshot_copy_grant_name_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tags:(tags_ : tag_list option) () =
  ({ snapshot_copy_grant_name = snapshot_copy_grant_name_; kms_key_id = kms_key_id_; tags = tags_ }
    : snapshot_copy_grant)

let make_create_snapshot_copy_grant_message ?kms_key_id:(kms_key_id_ : string_ option)
    ?tags:(tags_ : tag_list option) ~snapshot_copy_grant_name:(snapshot_copy_grant_name_ : string_)
    () =
  ({ snapshot_copy_grant_name = snapshot_copy_grant_name_; kms_key_id = kms_key_id_; tags = tags_ }
    : create_snapshot_copy_grant_message)

let make_snapshot_schedule
    ?schedule_definitions:(schedule_definitions_ : schedule_definition_list option)
    ?schedule_identifier:(schedule_identifier_ : string_ option)
    ?schedule_description:(schedule_description_ : string_ option) ?tags:(tags_ : tag_list option)
    ?next_invocations:(next_invocations_ : scheduled_snapshot_time_list option)
    ?associated_cluster_count:(associated_cluster_count_ : integer_optional option)
    ?associated_clusters:(associated_clusters_ : associated_cluster_list option) () =
  ({
     schedule_definitions = schedule_definitions_;
     schedule_identifier = schedule_identifier_;
     schedule_description = schedule_description_;
     tags = tags_;
     next_invocations = next_invocations_;
     associated_cluster_count = associated_cluster_count_;
     associated_clusters = associated_clusters_;
   }
    : snapshot_schedule)

let make_create_snapshot_schedule_message
    ?schedule_definitions:(schedule_definitions_ : schedule_definition_list option)
    ?schedule_identifier:(schedule_identifier_ : string_ option)
    ?schedule_description:(schedule_description_ : string_ option) ?tags:(tags_ : tag_list option)
    ?dry_run:(dry_run_ : boolean_optional option)
    ?next_invocations:(next_invocations_ : integer_optional option) () =
  ({
     schedule_definitions = schedule_definitions_;
     schedule_identifier = schedule_identifier_;
     schedule_description = schedule_description_;
     tags = tags_;
     dry_run = dry_run_;
     next_invocations = next_invocations_;
   }
    : create_snapshot_schedule_message)

let make_create_tags_message ~resource_name:(resource_name_ : string_) ~tags:(tags_ : tag_list) () =
  ({ resource_name = resource_name_; tags = tags_ } : create_tags_message)

let make_usage_limit ?usage_limit_id:(usage_limit_id_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?feature_type:(feature_type_ : usage_limit_feature_type option)
    ?limit_type:(limit_type_ : usage_limit_limit_type option) ?amount:(amount_ : long option)
    ?period:(period_ : usage_limit_period option)
    ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ?tags:(tags_ : tag_list option) () =
  ({
     usage_limit_id = usage_limit_id_;
     cluster_identifier = cluster_identifier_;
     feature_type = feature_type_;
     limit_type = limit_type_;
     amount = amount_;
     period = period_;
     breach_action = breach_action_;
     tags = tags_;
   }
    : usage_limit)

let make_create_usage_limit_message ?period:(period_ : usage_limit_period option)
    ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ?tags:(tags_ : tag_list option) ~cluster_identifier:(cluster_identifier_ : string_)
    ~feature_type:(feature_type_ : usage_limit_feature_type)
    ~limit_type:(limit_type_ : usage_limit_limit_type) ~amount:(amount_ : long) () =
  ({
     cluster_identifier = cluster_identifier_;
     feature_type = feature_type_;
     limit_type = limit_type_;
     amount = amount_;
     period = period_;
     breach_action = breach_action_;
     tags = tags_;
   }
    : create_usage_limit_message)

let make_custom_domain_associations_message ?marker:(marker_ : string_ option)
    ?associations:(associations_ : association_list option) () =
  ({ marker = marker_; associations = associations_ } : custom_domain_associations_message)

let make_customer_storage_message
    ?total_backup_size_in_mega_bytes:(total_backup_size_in_mega_bytes_ : double option)
    ?total_provisioned_storage_in_mega_bytes:
      (total_provisioned_storage_in_mega_bytes_ : double option) () =
  ({
     total_backup_size_in_mega_bytes = total_backup_size_in_mega_bytes_;
     total_provisioned_storage_in_mega_bytes = total_provisioned_storage_in_mega_bytes_;
   }
    : customer_storage_message)

let make_deauthorize_data_share_message ~data_share_arn:(data_share_arn_ : string_)
    ~consumer_identifier:(consumer_identifier_ : string_) () =
  ({ data_share_arn = data_share_arn_; consumer_identifier = consumer_identifier_ }
    : deauthorize_data_share_message)

let make_default_cluster_parameters
    ?parameter_group_family:(parameter_group_family_ : string_ option)
    ?marker:(marker_ : string_ option) ?parameters:(parameters_ : parameters_list option) () =
  ({ parameter_group_family = parameter_group_family_; marker = marker_; parameters = parameters_ }
    : default_cluster_parameters)

let make_delete_authentication_profile_message
    ~authentication_profile_name:(authentication_profile_name_ : authentication_profile_name_string)
    () =
  ({ authentication_profile_name = authentication_profile_name_ }
    : delete_authentication_profile_message)

let make_delete_cluster_message
    ?skip_final_cluster_snapshot:(skip_final_cluster_snapshot_ : boolean_ option)
    ?final_cluster_snapshot_identifier:(final_cluster_snapshot_identifier_ : string_ option)
    ?final_cluster_snapshot_retention_period:
      (final_cluster_snapshot_retention_period_ : integer_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     skip_final_cluster_snapshot = skip_final_cluster_snapshot_;
     final_cluster_snapshot_identifier = final_cluster_snapshot_identifier_;
     final_cluster_snapshot_retention_period = final_cluster_snapshot_retention_period_;
   }
    : delete_cluster_message)

let make_delete_cluster_parameter_group_message
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({ parameter_group_name = parameter_group_name_ } : delete_cluster_parameter_group_message)

let make_delete_cluster_security_group_message
    ~cluster_security_group_name:(cluster_security_group_name_ : string_) () =
  ({ cluster_security_group_name = cluster_security_group_name_ }
    : delete_cluster_security_group_message)

let make_delete_cluster_subnet_group_message
    ~cluster_subnet_group_name:(cluster_subnet_group_name_ : string_) () =
  ({ cluster_subnet_group_name = cluster_subnet_group_name_ } : delete_cluster_subnet_group_message)

let make_delete_custom_domain_association_message
    ~cluster_identifier:(cluster_identifier_ : string_)
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name_string) () =
  ({ cluster_identifier = cluster_identifier_; custom_domain_name = custom_domain_name_ }
    : delete_custom_domain_association_message)

let make_delete_endpoint_access_message ~endpoint_name:(endpoint_name_ : string_) () =
  ({ endpoint_name = endpoint_name_ } : delete_endpoint_access_message)

let make_delete_event_subscription_message ~subscription_name:(subscription_name_ : string_) () =
  ({ subscription_name = subscription_name_ } : delete_event_subscription_message)

let make_delete_hsm_client_certificate_message
    ~hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_) () =
  ({ hsm_client_certificate_identifier = hsm_client_certificate_identifier_ }
    : delete_hsm_client_certificate_message)

let make_delete_hsm_configuration_message
    ~hsm_configuration_identifier:(hsm_configuration_identifier_ : string_) () =
  ({ hsm_configuration_identifier = hsm_configuration_identifier_ }
    : delete_hsm_configuration_message)

let make_delete_integration_message ~integration_arn:(integration_arn_ : integration_arn) () =
  ({ integration_arn = integration_arn_ } : delete_integration_message)

let make_delete_redshift_idc_application_message
    ~redshift_idc_application_arn:(redshift_idc_application_arn_ : string_) () =
  ({ redshift_idc_application_arn = redshift_idc_application_arn_ }
    : delete_redshift_idc_application_message)

let make_delete_resource_policy_message ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_message)

let make_delete_scheduled_action_message ~scheduled_action_name:(scheduled_action_name_ : string_)
    () =
  ({ scheduled_action_name = scheduled_action_name_ } : delete_scheduled_action_message)

let make_delete_snapshot_copy_grant_message
    ~snapshot_copy_grant_name:(snapshot_copy_grant_name_ : string_) () =
  ({ snapshot_copy_grant_name = snapshot_copy_grant_name_ } : delete_snapshot_copy_grant_message)

let make_delete_snapshot_schedule_message ~schedule_identifier:(schedule_identifier_ : string_) () =
  ({ schedule_identifier = schedule_identifier_ } : delete_snapshot_schedule_message)

let make_delete_tags_message ~resource_name:(resource_name_ : string_)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_name = resource_name_; tag_keys = tag_keys_ } : delete_tags_message)

let make_delete_usage_limit_message ~usage_limit_id:(usage_limit_id_ : string_) () =
  ({ usage_limit_id = usage_limit_id_ } : delete_usage_limit_message)

let make_deregister_namespace_output_message
    ?status:(status_ : namespace_registration_status option) () =
  ({ status = status_ } : deregister_namespace_output_message)

let make_provisioned_identifier ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : provisioned_identifier)

let make_serverless_identifier ~namespace_identifier:(namespace_identifier_ : string_)
    ~workgroup_identifier:(workgroup_identifier_ : string_) () =
  ({ namespace_identifier = namespace_identifier_; workgroup_identifier = workgroup_identifier_ }
    : serverless_identifier)

let make_deregister_namespace_input_message
    ~namespace_identifier:(namespace_identifier_ : namespace_identifier_union)
    ~consumer_identifiers:(consumer_identifiers_ : consumer_identifier_list) () =
  ({ namespace_identifier = namespace_identifier_; consumer_identifiers = consumer_identifiers_ }
    : deregister_namespace_input_message)

let make_describe_account_attributes_message
    ?attribute_names:(attribute_names_ : attribute_name_list option) () =
  ({ attribute_names = attribute_names_ } : describe_account_attributes_message)

let make_describe_authentication_profiles_message
    ?authentication_profile_name:
      (authentication_profile_name_ : authentication_profile_name_string option) () =
  ({ authentication_profile_name = authentication_profile_name_ }
    : describe_authentication_profiles_message)

let make_describe_cluster_db_revisions_message
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ cluster_identifier = cluster_identifier_; max_records = max_records_; marker = marker_ }
    : describe_cluster_db_revisions_message)

let make_describe_cluster_parameter_groups_message
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     parameter_group_name = parameter_group_name_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_cluster_parameter_groups_message)

let make_describe_cluster_parameters_message ?source:(source_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     parameter_group_name = parameter_group_name_;
     source = source_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_cluster_parameters_message)

let make_describe_cluster_security_groups_message
    ?cluster_security_group_name:(cluster_security_group_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     cluster_security_group_name = cluster_security_group_name_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_cluster_security_groups_message)

let make_snapshot_message ?marker:(marker_ : string_ option)
    ?snapshots:(snapshots_ : snapshot_list option) () =
  ({ marker = marker_; snapshots = snapshots_ } : snapshot_message)

let make_snapshot_sorting_entity ?sort_order:(sort_order_ : sort_by_order option)
    ~attribute:(attribute_ : snapshot_attribute_to_sort_by) () =
  ({ attribute = attribute_; sort_order = sort_order_ } : snapshot_sorting_entity)

let make_describe_cluster_snapshots_message
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?snapshot_arn:(snapshot_arn_ : string_ option) ?snapshot_type:(snapshot_type_ : string_ option)
    ?start_time:(start_time_ : t_stamp option) ?end_time:(end_time_ : t_stamp option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?owner_account:(owner_account_ : string_ option) ?tag_keys:(tag_keys_ : tag_key_list option)
    ?tag_values:(tag_values_ : tag_value_list option)
    ?cluster_exists:(cluster_exists_ : boolean_optional option)
    ?sorting_entities:(sorting_entities_ : snapshot_sorting_entity_list option) () =
  ({
     cluster_identifier = cluster_identifier_;
     snapshot_identifier = snapshot_identifier_;
     snapshot_arn = snapshot_arn_;
     snapshot_type = snapshot_type_;
     start_time = start_time_;
     end_time = end_time_;
     max_records = max_records_;
     marker = marker_;
     owner_account = owner_account_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
     cluster_exists = cluster_exists_;
     sorting_entities = sorting_entities_;
   }
    : describe_cluster_snapshots_message)

let make_describe_cluster_subnet_groups_message
    ?cluster_subnet_group_name:(cluster_subnet_group_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     cluster_subnet_group_name = cluster_subnet_group_name_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_cluster_subnet_groups_message)

let make_supported_operation ?operation_name:(operation_name_ : string_ option) () =
  ({ operation_name = operation_name_ } : supported_operation)

let make_update_target ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?database_version:(database_version_ : string_ option)
    ?supported_operations:(supported_operations_ : supported_operation_list option) () =
  ({
     maintenance_track_name = maintenance_track_name_;
     database_version = database_version_;
     supported_operations = supported_operations_;
   }
    : update_target)

let make_maintenance_track ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?database_version:(database_version_ : string_ option)
    ?update_targets:(update_targets_ : eligible_tracks_to_update_list option) () =
  ({
     maintenance_track_name = maintenance_track_name_;
     database_version = database_version_;
     update_targets = update_targets_;
   }
    : maintenance_track)

let make_track_list_message ?maintenance_tracks:(maintenance_tracks_ : track_list option)
    ?marker:(marker_ : string_ option) () =
  ({ maintenance_tracks = maintenance_tracks_; marker = marker_ } : track_list_message)

let make_describe_cluster_tracks_message
    ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     maintenance_track_name = maintenance_track_name_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_cluster_tracks_message)

let make_describe_cluster_versions_message ?cluster_version:(cluster_version_ : string_ option)
    ?cluster_parameter_group_family:(cluster_parameter_group_family_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cluster_version = cluster_version_;
     cluster_parameter_group_family = cluster_parameter_group_family_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_cluster_versions_message)

let make_describe_clusters_message ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     cluster_identifier = cluster_identifier_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_clusters_message)

let make_describe_custom_domain_associations_message
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name_string option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_custom_domain_associations_message)

let make_describe_data_shares_message ?data_share_arn:(data_share_arn_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ data_share_arn = data_share_arn_; max_records = max_records_; marker = marker_ }
    : describe_data_shares_message)

let make_describe_data_shares_for_consumer_message ?consumer_arn:(consumer_arn_ : string_ option)
    ?status:(status_ : data_share_status_for_consumer option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ consumer_arn = consumer_arn_; status = status_; max_records = max_records_; marker = marker_ }
    : describe_data_shares_for_consumer_message)

let make_describe_data_shares_for_producer_message ?producer_arn:(producer_arn_ : string_ option)
    ?status:(status_ : data_share_status_for_producer option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ producer_arn = producer_arn_; status = status_; max_records = max_records_; marker = marker_ }
    : describe_data_shares_for_producer_message)

let make_describe_default_cluster_parameters_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~parameter_group_family:(parameter_group_family_ : string_) () =
  ({
     parameter_group_family = parameter_group_family_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_default_cluster_parameters_message)

let make_endpoint_access_list
    ?endpoint_access_list:(endpoint_access_list_ : endpoint_accesses option)
    ?marker:(marker_ : string_ option) () =
  ({ endpoint_access_list = endpoint_access_list_; marker = marker_ } : endpoint_access_list)

let make_describe_endpoint_access_message ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?resource_owner:(resource_owner_ : string_ option)
    ?endpoint_name:(endpoint_name_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cluster_identifier = cluster_identifier_;
     resource_owner = resource_owner_;
     endpoint_name = endpoint_name_;
     vpc_id = vpc_id_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_endpoint_access_message)

let make_endpoint_authorization_list
    ?endpoint_authorization_list:(endpoint_authorization_list_ : endpoint_authorizations option)
    ?marker:(marker_ : string_ option) () =
  ({ endpoint_authorization_list = endpoint_authorization_list_; marker = marker_ }
    : endpoint_authorization_list)

let make_describe_endpoint_authorization_message
    ?cluster_identifier:(cluster_identifier_ : string_ option) ?account:(account_ : string_ option)
    ?grantee:(grantee_ : boolean_optional option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cluster_identifier = cluster_identifier_;
     account = account_;
     grantee = grantee_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_endpoint_authorization_message)

let make_event_info_map ?event_id:(event_id_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?event_description:(event_description_ : string_ option) ?severity:(severity_ : string_ option)
    () =
  ({
     event_id = event_id_;
     event_categories = event_categories_;
     event_description = event_description_;
     severity = severity_;
   }
    : event_info_map)

let make_event_categories_map ?source_type:(source_type_ : string_ option)
    ?events:(events_ : event_info_map_list option) () =
  ({ source_type = source_type_; events = events_ } : event_categories_map)

let make_event_categories_message
    ?event_categories_map_list:(event_categories_map_list_ : event_categories_map_list option) () =
  ({ event_categories_map_list = event_categories_map_list_ } : event_categories_message)

let make_describe_event_categories_message ?source_type:(source_type_ : string_ option) () =
  ({ source_type = source_type_ } : describe_event_categories_message)

let make_event_subscriptions_message ?marker:(marker_ : string_ option)
    ?event_subscriptions_list:(event_subscriptions_list_ : event_subscriptions_list option) () =
  ({ marker = marker_; event_subscriptions_list = event_subscriptions_list_ }
    : event_subscriptions_message)

let make_describe_event_subscriptions_message
    ?subscription_name:(subscription_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     subscription_name = subscription_name_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_event_subscriptions_message)

let make_event ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?message:(message_ : string_ option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?severity:(severity_ : string_ option) ?date:(date_ : t_stamp option)
    ?event_id:(event_id_ : string_ option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     message = message_;
     event_categories = event_categories_;
     severity = severity_;
     date = date_;
     event_id = event_id_;
   }
    : event)

let make_events_message ?marker:(marker_ : string_ option) ?events:(events_ : event_list option) ()
    =
  ({ marker = marker_; events = events_ } : events_message)

let make_describe_events_message ?source_identifier:(source_identifier_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?start_time:(start_time_ : t_stamp option)
    ?end_time:(end_time_ : t_stamp option) ?duration:(duration_ : integer_optional option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     source_identifier = source_identifier_;
     source_type = source_type_;
     start_time = start_time_;
     end_time = end_time_;
     duration = duration_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_events_message)

let make_hsm_client_certificate_message ?marker:(marker_ : string_ option)
    ?hsm_client_certificates:(hsm_client_certificates_ : hsm_client_certificate_list option) () =
  ({ marker = marker_; hsm_client_certificates = hsm_client_certificates_ }
    : hsm_client_certificate_message)

let make_describe_hsm_client_certificates_message
    ?hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     hsm_client_certificate_identifier = hsm_client_certificate_identifier_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_hsm_client_certificates_message)

let make_hsm_configuration_message ?marker:(marker_ : string_ option)
    ?hsm_configurations:(hsm_configurations_ : hsm_configuration_list option) () =
  ({ marker = marker_; hsm_configurations = hsm_configurations_ } : hsm_configuration_message)

let make_describe_hsm_configurations_message
    ?hsm_configuration_identifier:(hsm_configuration_identifier_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     hsm_configuration_identifier = hsm_configuration_identifier_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_hsm_configurations_message)

let make_inbound_integration ?integration_arn:(integration_arn_ : inbound_integration_arn option)
    ?source_arn:(source_arn_ : string_ option) ?target_arn:(target_arn_ : target_arn option)
    ?status:(status_ : zero_etl_integration_status option)
    ?errors:(errors_ : integration_error_list option) ?create_time:(create_time_ : t_stamp option)
    () =
  ({
     integration_arn = integration_arn_;
     source_arn = source_arn_;
     target_arn = target_arn_;
     status = status_;
     errors = errors_;
     create_time = create_time_;
   }
    : inbound_integration)

let make_inbound_integrations_message ?marker:(marker_ : string_ option)
    ?inbound_integrations:(inbound_integrations_ : inbound_integration_list option) () =
  ({ marker = marker_; inbound_integrations = inbound_integrations_ }
    : inbound_integrations_message)

let make_describe_inbound_integrations_message
    ?integration_arn:(integration_arn_ : inbound_integration_arn option)
    ?target_arn:(target_arn_ : target_arn option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     integration_arn = integration_arn_;
     target_arn = target_arn_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_inbound_integrations_message)

let make_integrations_message ?marker:(marker_ : string_ option)
    ?integrations:(integrations_ : integration_list option) () =
  ({ marker = marker_; integrations = integrations_ } : integrations_message)

let make_describe_integrations_filter ~name:(name_ : describe_integrations_filter_name)
    ~values:(values_ : describe_integrations_filter_value_list) () =
  ({ name = name_; values = values_ } : describe_integrations_filter)

let make_describe_integrations_message ?integration_arn:(integration_arn_ : integration_arn option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?filters:(filters_ : describe_integrations_filter_list option) () =
  ({
     integration_arn = integration_arn_;
     max_records = max_records_;
     marker = marker_;
     filters = filters_;
   }
    : describe_integrations_message)

let make_logging_status ?logging_enabled:(logging_enabled_ : boolean_ option)
    ?bucket_name:(bucket_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : s3_key_prefix_value option)
    ?last_successful_delivery_time:(last_successful_delivery_time_ : t_stamp option)
    ?last_failure_time:(last_failure_time_ : t_stamp option)
    ?last_failure_message:(last_failure_message_ : string_ option)
    ?log_destination_type:(log_destination_type_ : log_destination_type option)
    ?log_exports:(log_exports_ : log_type_list option) () =
  ({
     logging_enabled = logging_enabled_;
     bucket_name = bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     last_successful_delivery_time = last_successful_delivery_time_;
     last_failure_time = last_failure_time_;
     last_failure_message = last_failure_message_;
     log_destination_type = log_destination_type_;
     log_exports = log_exports_;
   }
    : logging_status)

let make_describe_logging_status_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : describe_logging_status_message)

let make_node_configuration_option ?node_type:(node_type_ : string_ option)
    ?number_of_nodes:(number_of_nodes_ : integer option)
    ?estimated_disk_utilization_percent:
      (estimated_disk_utilization_percent_ : double_optional option) ?mode:(mode_ : mode option) ()
    =
  ({
     node_type = node_type_;
     number_of_nodes = number_of_nodes_;
     estimated_disk_utilization_percent = estimated_disk_utilization_percent_;
     mode = mode_;
   }
    : node_configuration_option)

let make_node_configuration_options_message
    ?node_configuration_option_list:
      (node_configuration_option_list_ : node_configuration_option_list option)
    ?marker:(marker_ : string_ option) () =
  ({ node_configuration_option_list = node_configuration_option_list_; marker = marker_ }
    : node_configuration_options_message)

let make_node_configuration_options_filter
    ?name:(name_ : node_configuration_options_filter_name option)
    ?operator:(operator_ : operator_type option) ?values:(values_ : value_string_list option) () =
  ({ name = name_; operator = operator_; values = values_ } : node_configuration_options_filter)

let make_describe_node_configuration_options_message
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?snapshot_arn:(snapshot_arn_ : string_ option) ?owner_account:(owner_account_ : string_ option)
    ?filters:(filters_ : node_configuration_options_filter_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option)
    ~action_type:(action_type_ : action_type) () =
  ({
     action_type = action_type_;
     cluster_identifier = cluster_identifier_;
     snapshot_identifier = snapshot_identifier_;
     snapshot_arn = snapshot_arn_;
     owner_account = owner_account_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_node_configuration_options_message)

let make_orderable_cluster_option ?cluster_version:(cluster_version_ : string_ option)
    ?cluster_type:(cluster_type_ : string_ option) ?node_type:(node_type_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zone_list option) () =
  ({
     cluster_version = cluster_version_;
     cluster_type = cluster_type_;
     node_type = node_type_;
     availability_zones = availability_zones_;
   }
    : orderable_cluster_option)

let make_orderable_cluster_options_message
    ?orderable_cluster_options:(orderable_cluster_options_ : orderable_cluster_options_list option)
    ?marker:(marker_ : string_ option) () =
  ({ orderable_cluster_options = orderable_cluster_options_; marker = marker_ }
    : orderable_cluster_options_message)

let make_describe_orderable_cluster_options_message
    ?cluster_version:(cluster_version_ : string_ option) ?node_type:(node_type_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cluster_version = cluster_version_;
     node_type = node_type_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_orderable_cluster_options_message)

let make_partner_integration_info
    ?database_name:(database_name_ : partner_integration_database_name option)
    ?partner_name:(partner_name_ : partner_integration_partner_name option)
    ?status:(status_ : partner_integration_status option)
    ?status_message:(status_message_ : partner_integration_status_message option)
    ?created_at:(created_at_ : t_stamp option) ?updated_at:(updated_at_ : t_stamp option) () =
  ({
     database_name = database_name_;
     partner_name = partner_name_;
     status = status_;
     status_message = status_message_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : partner_integration_info)

let make_describe_partners_output_message
    ?partner_integration_info_list:
      (partner_integration_info_list_ : partner_integration_info_list option) () =
  ({ partner_integration_info_list = partner_integration_info_list_ }
    : describe_partners_output_message)

let make_describe_partners_input_message
    ?database_name:(database_name_ : partner_integration_database_name option)
    ?partner_name:(partner_name_ : partner_integration_partner_name option)
    ~account_id:(account_id_ : partner_integration_account_id)
    ~cluster_identifier:(cluster_identifier_ : partner_integration_cluster_identifier) () =
  ({
     account_id = account_id_;
     cluster_identifier = cluster_identifier_;
     database_name = database_name_;
     partner_name = partner_name_;
   }
    : describe_partners_input_message)

let make_describe_redshift_idc_applications_message
    ?redshift_idc_application_arn:(redshift_idc_application_arn_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     redshift_idc_application_arn = redshift_idc_application_arn_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_redshift_idc_applications_message)

let make_describe_reserved_node_exchange_status_output_message
    ?reserved_node_exchange_status_details:
      (reserved_node_exchange_status_details_ : reserved_node_exchange_status_list option)
    ?marker:(marker_ : string_ option) () =
  ({
     reserved_node_exchange_status_details = reserved_node_exchange_status_details_;
     marker = marker_;
   }
    : describe_reserved_node_exchange_status_output_message)

let make_describe_reserved_node_exchange_status_input_message
    ?reserved_node_id:(reserved_node_id_ : string_ option)
    ?reserved_node_exchange_request_id:(reserved_node_exchange_request_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     reserved_node_id = reserved_node_id_;
     reserved_node_exchange_request_id = reserved_node_exchange_request_id_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_reserved_node_exchange_status_input_message)

let make_reserved_node_offering
    ?reserved_node_offering_id:(reserved_node_offering_id_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?duration:(duration_ : integer option)
    ?fixed_price:(fixed_price_ : double option) ?usage_price:(usage_price_ : double option)
    ?currency_code:(currency_code_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?reserved_node_offering_type:(reserved_node_offering_type_ : reserved_node_offering_type option)
    () =
  ({
     reserved_node_offering_id = reserved_node_offering_id_;
     node_type = node_type_;
     duration = duration_;
     fixed_price = fixed_price_;
     usage_price = usage_price_;
     currency_code = currency_code_;
     offering_type = offering_type_;
     recurring_charges = recurring_charges_;
     reserved_node_offering_type = reserved_node_offering_type_;
   }
    : reserved_node_offering)

let make_reserved_node_offerings_message ?marker:(marker_ : string_ option)
    ?reserved_node_offerings:(reserved_node_offerings_ : reserved_node_offering_list option) () =
  ({ marker = marker_; reserved_node_offerings = reserved_node_offerings_ }
    : reserved_node_offerings_message)

let make_describe_reserved_node_offerings_message
    ?reserved_node_offering_id:(reserved_node_offering_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     reserved_node_offering_id = reserved_node_offering_id_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_reserved_node_offerings_message)

let make_reserved_nodes_message ?marker:(marker_ : string_ option)
    ?reserved_nodes:(reserved_nodes_ : reserved_node_list option) () =
  ({ marker = marker_; reserved_nodes = reserved_nodes_ } : reserved_nodes_message)

let make_describe_reserved_nodes_message ?reserved_node_id:(reserved_node_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({ reserved_node_id = reserved_node_id_; max_records = max_records_; marker = marker_ }
    : describe_reserved_nodes_message)

let make_describe_resize_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : describe_resize_message)

let make_scheduled_actions_message ?marker:(marker_ : string_ option)
    ?scheduled_actions:(scheduled_actions_ : scheduled_action_list option) () =
  ({ marker = marker_; scheduled_actions = scheduled_actions_ } : scheduled_actions_message)

let make_scheduled_action_filter ~name:(name_ : scheduled_action_filter_name)
    ~values:(values_ : value_string_list) () =
  ({ name = name_; values = values_ } : scheduled_action_filter)

let make_describe_scheduled_actions_message
    ?scheduled_action_name:(scheduled_action_name_ : string_ option)
    ?target_action_type:(target_action_type_ : scheduled_action_type_values option)
    ?start_time:(start_time_ : t_stamp option) ?end_time:(end_time_ : t_stamp option)
    ?active:(active_ : boolean_optional option)
    ?filters:(filters_ : scheduled_action_filter_list option) ?marker:(marker_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     target_action_type = target_action_type_;
     start_time = start_time_;
     end_time = end_time_;
     active = active_;
     filters = filters_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_scheduled_actions_message)

let make_snapshot_copy_grant_message ?marker:(marker_ : string_ option)
    ?snapshot_copy_grants:(snapshot_copy_grants_ : snapshot_copy_grant_list option) () =
  ({ marker = marker_; snapshot_copy_grants = snapshot_copy_grants_ } : snapshot_copy_grant_message)

let make_describe_snapshot_copy_grants_message
    ?snapshot_copy_grant_name:(snapshot_copy_grant_name_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     snapshot_copy_grant_name = snapshot_copy_grant_name_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_snapshot_copy_grants_message)

let make_describe_snapshot_schedules_output_message
    ?snapshot_schedules:(snapshot_schedules_ : snapshot_schedule_list option)
    ?marker:(marker_ : string_ option) () =
  ({ snapshot_schedules = snapshot_schedules_; marker = marker_ }
    : describe_snapshot_schedules_output_message)

let make_describe_snapshot_schedules_message
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?schedule_identifier:(schedule_identifier_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option)
    ?marker:(marker_ : string_ option) ?max_records:(max_records_ : integer_optional option) () =
  ({
     cluster_identifier = cluster_identifier_;
     schedule_identifier = schedule_identifier_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
     marker = marker_;
     max_records = max_records_;
   }
    : describe_snapshot_schedules_message)

let make_table_restore_status ?table_restore_request_id:(table_restore_request_id_ : string_ option)
    ?status:(status_ : table_restore_status_type option) ?message:(message_ : string_ option)
    ?request_time:(request_time_ : t_stamp option)
    ?progress_in_mega_bytes:(progress_in_mega_bytes_ : long_optional option)
    ?total_data_in_mega_bytes:(total_data_in_mega_bytes_ : long_optional option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?source_database_name:(source_database_name_ : string_ option)
    ?source_schema_name:(source_schema_name_ : string_ option)
    ?source_table_name:(source_table_name_ : string_ option)
    ?target_database_name:(target_database_name_ : string_ option)
    ?target_schema_name:(target_schema_name_ : string_ option)
    ?new_table_name:(new_table_name_ : string_ option) () =
  ({
     table_restore_request_id = table_restore_request_id_;
     status = status_;
     message = message_;
     request_time = request_time_;
     progress_in_mega_bytes = progress_in_mega_bytes_;
     total_data_in_mega_bytes = total_data_in_mega_bytes_;
     cluster_identifier = cluster_identifier_;
     snapshot_identifier = snapshot_identifier_;
     source_database_name = source_database_name_;
     source_schema_name = source_schema_name_;
     source_table_name = source_table_name_;
     target_database_name = target_database_name_;
     target_schema_name = target_schema_name_;
     new_table_name = new_table_name_;
   }
    : table_restore_status)

let make_table_restore_status_message
    ?table_restore_status_details:(table_restore_status_details_ : table_restore_status_list option)
    ?marker:(marker_ : string_ option) () =
  ({ table_restore_status_details = table_restore_status_details_; marker = marker_ }
    : table_restore_status_message)

let make_describe_table_restore_status_message
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?table_restore_request_id:(table_restore_request_id_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cluster_identifier = cluster_identifier_;
     table_restore_request_id = table_restore_request_id_;
     max_records = max_records_;
     marker = marker_;
   }
    : describe_table_restore_status_message)

let make_tagged_resource ?tag:(tag_ : tag option) ?resource_name:(resource_name_ : string_ option)
    ?resource_type:(resource_type_ : string_ option) () =
  ({ tag = tag_; resource_name = resource_name_; resource_type = resource_type_ } : tagged_resource)

let make_tagged_resource_list_message
    ?tagged_resources:(tagged_resources_ : tagged_resource_list option)
    ?marker:(marker_ : string_ option) () =
  ({ tagged_resources = tagged_resources_; marker = marker_ } : tagged_resource_list_message)

let make_describe_tags_message ?resource_name:(resource_name_ : string_ option)
    ?resource_type:(resource_type_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     resource_name = resource_name_;
     resource_type = resource_type_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_tags_message)

let make_usage_limit_list ?usage_limits:(usage_limits_ : usage_limits option)
    ?marker:(marker_ : string_ option) () =
  ({ usage_limits = usage_limits_; marker = marker_ } : usage_limit_list)

let make_describe_usage_limits_message ?usage_limit_id:(usage_limit_id_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?feature_type:(feature_type_ : usage_limit_feature_type option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ?tag_keys:(tag_keys_ : tag_key_list option) ?tag_values:(tag_values_ : tag_value_list option) ()
    =
  ({
     usage_limit_id = usage_limit_id_;
     cluster_identifier = cluster_identifier_;
     feature_type = feature_type_;
     max_records = max_records_;
     marker = marker_;
     tag_keys = tag_keys_;
     tag_values = tag_values_;
   }
    : describe_usage_limits_message)

let make_disable_logging_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : disable_logging_message)

let make_disable_snapshot_copy_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : disable_snapshot_copy_message)

let make_disassociate_data_share_consumer_message
    ?disassociate_entire_account:(disassociate_entire_account_ : boolean_optional option)
    ?consumer_arn:(consumer_arn_ : string_ option)
    ?consumer_region:(consumer_region_ : string_ option) ~data_share_arn:(data_share_arn_ : string_)
    () =
  ({
     data_share_arn = data_share_arn_;
     disassociate_entire_account = disassociate_entire_account_;
     consumer_arn = consumer_arn_;
     consumer_region = consumer_region_;
   }
    : disassociate_data_share_consumer_message)

let make_enable_logging_message ?bucket_name:(bucket_name_ : string_ option)
    ?s3_key_prefix:(s3_key_prefix_ : s3_key_prefix_value option)
    ?log_destination_type:(log_destination_type_ : log_destination_type option)
    ?log_exports:(log_exports_ : log_type_list option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     bucket_name = bucket_name_;
     s3_key_prefix = s3_key_prefix_;
     log_destination_type = log_destination_type_;
     log_exports = log_exports_;
   }
    : enable_logging_message)

let make_enable_snapshot_copy_message
    ?retention_period:(retention_period_ : integer_optional option)
    ?snapshot_copy_grant_name:(snapshot_copy_grant_name_ : string_ option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_)
    ~destination_region:(destination_region_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     destination_region = destination_region_;
     retention_period = retention_period_;
     snapshot_copy_grant_name = snapshot_copy_grant_name_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
   }
    : enable_snapshot_copy_message)

let make_failover_primary_compute_input_message ~cluster_identifier:(cluster_identifier_ : string_)
    () =
  ({ cluster_identifier = cluster_identifier_ } : failover_primary_compute_input_message)

let make_get_cluster_credentials_message ?db_name:(db_name_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?duration_seconds:(duration_seconds_ : integer_optional option)
    ?auto_create:(auto_create_ : boolean_optional option)
    ?db_groups:(db_groups_ : db_group_list option)
    ?custom_domain_name:(custom_domain_name_ : string_ option) ~db_user:(db_user_ : string_) () =
  ({
     db_user = db_user_;
     db_name = db_name_;
     cluster_identifier = cluster_identifier_;
     duration_seconds = duration_seconds_;
     auto_create = auto_create_;
     db_groups = db_groups_;
     custom_domain_name = custom_domain_name_;
   }
    : get_cluster_credentials_message)

let make_get_cluster_credentials_with_iam_message ?db_name:(db_name_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?duration_seconds:(duration_seconds_ : integer_optional option)
    ?custom_domain_name:(custom_domain_name_ : string_ option) () =
  ({
     db_name = db_name_;
     cluster_identifier = cluster_identifier_;
     duration_seconds = duration_seconds_;
     custom_domain_name = custom_domain_name_;
   }
    : get_cluster_credentials_with_iam_message)

let make_get_identity_center_auth_token_response ?token:(token_ : sensitive_string option)
    ?expiration_time:(expiration_time_ : t_stamp option) () =
  ({ token = token_; expiration_time = expiration_time_ } : get_identity_center_auth_token_response)

let make_get_identity_center_auth_token_request
    ~cluster_ids:(cluster_ids_ : cluster_identifier_list) () =
  ({ cluster_ids = cluster_ids_ } : get_identity_center_auth_token_request)

let make_reserved_node_configuration_option
    ?source_reserved_node:(source_reserved_node_ : reserved_node option)
    ?target_reserved_node_count:(target_reserved_node_count_ : integer option)
    ?target_reserved_node_offering:(target_reserved_node_offering_ : reserved_node_offering option)
    () =
  ({
     source_reserved_node = source_reserved_node_;
     target_reserved_node_count = target_reserved_node_count_;
     target_reserved_node_offering = target_reserved_node_offering_;
   }
    : reserved_node_configuration_option)

let make_get_reserved_node_exchange_configuration_options_output_message
    ?marker:(marker_ : string_ option)
    ?reserved_node_configuration_option_list:
      (reserved_node_configuration_option_list_ : reserved_node_configuration_option_list option) ()
    =
  ({
     marker = marker_;
     reserved_node_configuration_option_list = reserved_node_configuration_option_list_;
   }
    : get_reserved_node_exchange_configuration_options_output_message)

let make_get_reserved_node_exchange_configuration_options_input_message
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~action_type:(action_type_ : reserved_node_exchange_action_type) () =
  ({
     action_type = action_type_;
     cluster_identifier = cluster_identifier_;
     snapshot_identifier = snapshot_identifier_;
     max_records = max_records_;
     marker = marker_;
   }
    : get_reserved_node_exchange_configuration_options_input_message)

let make_get_reserved_node_exchange_offerings_output_message ?marker:(marker_ : string_ option)
    ?reserved_node_offerings:(reserved_node_offerings_ : reserved_node_offering_list option) () =
  ({ marker = marker_; reserved_node_offerings = reserved_node_offerings_ }
    : get_reserved_node_exchange_offerings_output_message)

let make_get_reserved_node_exchange_offerings_input_message
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option)
    ~reserved_node_id:(reserved_node_id_ : string_) () =
  ({ reserved_node_id = reserved_node_id_; max_records = max_records_; marker = marker_ }
    : get_reserved_node_exchange_offerings_input_message)

let make_resource_policy ?resource_arn:(resource_arn_ : string_ option)
    ?policy:(policy_ : string_ option) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : resource_policy)

let make_get_resource_policy_message ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_message)

let make_lakehouse_configuration ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?lakehouse_idc_application_arn:(lakehouse_idc_application_arn_ : string_ option)
    ?lakehouse_registration_status:(lakehouse_registration_status_ : string_ option)
    ?catalog_arn:(catalog_arn_ : string_ option) () =
  ({
     cluster_identifier = cluster_identifier_;
     lakehouse_idc_application_arn = lakehouse_idc_application_arn_;
     lakehouse_registration_status = lakehouse_registration_status_;
     catalog_arn = catalog_arn_;
   }
    : lakehouse_configuration)

let make_reference_link ?text:(text_ : string_ option) ?link:(link_ : string_ option) () =
  ({ text = text_; link = link_ } : reference_link)

let make_recommended_action ?text:(text_ : string_ option) ?database:(database_ : string_ option)
    ?command:(command_ : string_ option) ?type_:(type__ : recommended_action_type option) () =
  ({ text = text_; database = database_; command = command_; type_ = type__ } : recommended_action)

let make_recommendation ?id:(id_ : string_ option)
    ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?namespace_arn:(namespace_arn_ : string_ option) ?created_at:(created_at_ : t_stamp option)
    ?recommendation_type:(recommendation_type_ : string_ option) ?title:(title_ : string_ option)
    ?description:(description_ : string_ option) ?observation:(observation_ : string_ option)
    ?impact_ranking:(impact_ranking_ : impact_ranking_type option)
    ?recommendation_text:(recommendation_text_ : string_ option)
    ?recommended_actions:(recommended_actions_ : recommended_action_list option)
    ?reference_links:(reference_links_ : reference_link_list option) () =
  ({
     id = id_;
     cluster_identifier = cluster_identifier_;
     namespace_arn = namespace_arn_;
     created_at = created_at_;
     recommendation_type = recommendation_type_;
     title = title_;
     description = description_;
     observation = observation_;
     impact_ranking = impact_ranking_;
     recommendation_text = recommendation_text_;
     recommended_actions = recommended_actions_;
     reference_links = reference_links_;
   }
    : recommendation)

let make_list_recommendations_message ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?namespace_arn:(namespace_arn_ : string_ option)
    ?max_records:(max_records_ : integer_optional option) ?marker:(marker_ : string_ option) () =
  ({
     cluster_identifier = cluster_identifier_;
     namespace_arn = namespace_arn_;
     max_records = max_records_;
     marker = marker_;
   }
    : list_recommendations_message)

let make_modify_aqua_output_message
    ?aqua_configuration:(aqua_configuration_ : aqua_configuration option) () =
  ({ aqua_configuration = aqua_configuration_ } : modify_aqua_output_message)

let make_modify_aqua_input_message
    ?aqua_configuration_status:(aqua_configuration_status_ : aqua_configuration_status option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     aqua_configuration_status = aqua_configuration_status_;
   }
    : modify_aqua_input_message)

let make_modify_authentication_profile_message
    ~authentication_profile_name:(authentication_profile_name_ : authentication_profile_name_string)
    ~authentication_profile_content:(authentication_profile_content_ : string_) () =
  ({
     authentication_profile_name = authentication_profile_name_;
     authentication_profile_content = authentication_profile_content_;
   }
    : modify_authentication_profile_message)

let make_modify_cluster_message ?cluster_type:(cluster_type_ : string_ option)
    ?node_type:(node_type_ : string_ option)
    ?number_of_nodes:(number_of_nodes_ : integer_optional option)
    ?cluster_security_groups:(cluster_security_groups_ : cluster_security_group_name_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?master_user_password:(master_user_password_ : sensitive_string option)
    ?cluster_parameter_group_name:(cluster_parameter_group_name_ : string_ option)
    ?automated_snapshot_retention_period:
      (automated_snapshot_retention_period_ : integer_optional option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?cluster_version:(cluster_version_ : string_ option)
    ?allow_version_upgrade:(allow_version_upgrade_ : boolean_optional option)
    ?hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_ option)
    ?hsm_configuration_identifier:(hsm_configuration_identifier_ : string_ option)
    ?new_cluster_identifier:(new_cluster_identifier_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?elastic_ip:(elastic_ip_ : string_ option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : boolean_optional option)
    ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?encrypted:(encrypted_ : boolean_optional option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?availability_zone_relocation:(availability_zone_relocation_ : boolean_optional option)
    ?availability_zone:(availability_zone_ : string_ option) ?port:(port_ : integer_optional option)
    ?manage_master_password:(manage_master_password_ : boolean_optional option)
    ?master_password_secret_kms_key_id:(master_password_secret_kms_key_id_ : string_ option)
    ?ip_address_type:(ip_address_type_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : boolean_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     cluster_type = cluster_type_;
     node_type = node_type_;
     number_of_nodes = number_of_nodes_;
     cluster_security_groups = cluster_security_groups_;
     vpc_security_group_ids = vpc_security_group_ids_;
     master_user_password = master_user_password_;
     cluster_parameter_group_name = cluster_parameter_group_name_;
     automated_snapshot_retention_period = automated_snapshot_retention_period_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     preferred_maintenance_window = preferred_maintenance_window_;
     cluster_version = cluster_version_;
     allow_version_upgrade = allow_version_upgrade_;
     hsm_client_certificate_identifier = hsm_client_certificate_identifier_;
     hsm_configuration_identifier = hsm_configuration_identifier_;
     new_cluster_identifier = new_cluster_identifier_;
     publicly_accessible = publicly_accessible_;
     elastic_ip = elastic_ip_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     maintenance_track_name = maintenance_track_name_;
     encrypted = encrypted_;
     kms_key_id = kms_key_id_;
     availability_zone_relocation = availability_zone_relocation_;
     availability_zone = availability_zone_;
     port = port_;
     manage_master_password = manage_master_password_;
     master_password_secret_kms_key_id = master_password_secret_kms_key_id_;
     ip_address_type = ip_address_type_;
     multi_a_z = multi_a_z_;
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
   }
    : modify_cluster_message)

let make_modify_cluster_db_revision_message ~cluster_identifier:(cluster_identifier_ : string_)
    ~revision_target:(revision_target_ : string_) () =
  ({ cluster_identifier = cluster_identifier_; revision_target = revision_target_ }
    : modify_cluster_db_revision_message)

let make_modify_cluster_iam_roles_message ?add_iam_roles:(add_iam_roles_ : iam_role_arn_list option)
    ?remove_iam_roles:(remove_iam_roles_ : iam_role_arn_list option)
    ?default_iam_role_arn:(default_iam_role_arn_ : string_ option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     add_iam_roles = add_iam_roles_;
     remove_iam_roles = remove_iam_roles_;
     default_iam_role_arn = default_iam_role_arn_;
   }
    : modify_cluster_iam_roles_message)

let make_modify_cluster_maintenance_message
    ?defer_maintenance:(defer_maintenance_ : boolean_optional option)
    ?defer_maintenance_identifier:(defer_maintenance_identifier_ : string_ option)
    ?defer_maintenance_start_time:(defer_maintenance_start_time_ : t_stamp option)
    ?defer_maintenance_end_time:(defer_maintenance_end_time_ : t_stamp option)
    ?defer_maintenance_duration:(defer_maintenance_duration_ : integer_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     defer_maintenance = defer_maintenance_;
     defer_maintenance_identifier = defer_maintenance_identifier_;
     defer_maintenance_start_time = defer_maintenance_start_time_;
     defer_maintenance_end_time = defer_maintenance_end_time_;
     defer_maintenance_duration = defer_maintenance_duration_;
   }
    : modify_cluster_maintenance_message)

let make_modify_cluster_parameter_group_message
    ~parameter_group_name:(parameter_group_name_ : string_)
    ~parameters:(parameters_ : parameters_list) () =
  ({ parameter_group_name = parameter_group_name_; parameters = parameters_ }
    : modify_cluster_parameter_group_message)

let make_modify_cluster_snapshot_message
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ?force:(force_ : boolean_ option) ~snapshot_identifier:(snapshot_identifier_ : string_) () =
  ({
     snapshot_identifier = snapshot_identifier_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     force = force_;
   }
    : modify_cluster_snapshot_message)

let make_modify_cluster_snapshot_schedule_message
    ?schedule_identifier:(schedule_identifier_ : string_ option)
    ?disassociate_schedule:(disassociate_schedule_ : boolean_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     schedule_identifier = schedule_identifier_;
     disassociate_schedule = disassociate_schedule_;
   }
    : modify_cluster_snapshot_schedule_message)

let make_modify_cluster_subnet_group_message ?description:(description_ : string_ option)
    ~cluster_subnet_group_name:(cluster_subnet_group_name_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     cluster_subnet_group_name = cluster_subnet_group_name_;
     description = description_;
     subnet_ids = subnet_ids_;
   }
    : modify_cluster_subnet_group_message)

let make_modify_custom_domain_association_message
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name_string)
    ~custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     cluster_identifier = cluster_identifier_;
   }
    : modify_custom_domain_association_message)

let make_modify_endpoint_access_message
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ~endpoint_name:(endpoint_name_ : string_) () =
  ({ endpoint_name = endpoint_name_; vpc_security_group_ids = vpc_security_group_ids_ }
    : modify_endpoint_access_message)

let make_modify_event_subscription_message ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?source_type:(source_type_ : string_ option) ?source_ids:(source_ids_ : source_ids_list option)
    ?event_categories:(event_categories_ : event_categories_list option)
    ?severity:(severity_ : string_ option) ?enabled:(enabled_ : boolean_optional option)
    ~subscription_name:(subscription_name_ : string_) () =
  ({
     subscription_name = subscription_name_;
     sns_topic_arn = sns_topic_arn_;
     source_type = source_type_;
     source_ids = source_ids_;
     event_categories = event_categories_;
     severity = severity_;
     enabled = enabled_;
   }
    : modify_event_subscription_message)

let make_modify_integration_message ?description:(description_ : integration_description option)
    ?integration_name:(integration_name_ : integration_name option)
    ~integration_arn:(integration_arn_ : integration_arn) () =
  ({
     integration_arn = integration_arn_;
     description = description_;
     integration_name = integration_name_;
   }
    : modify_integration_message)

let make_modify_lakehouse_configuration_message
    ?lakehouse_registration:(lakehouse_registration_ : lakehouse_registration option)
    ?catalog_name:(catalog_name_ : catalog_name_string option)
    ?lakehouse_idc_registration:(lakehouse_idc_registration_ : lakehouse_idc_registration option)
    ?lakehouse_idc_application_arn:(lakehouse_idc_application_arn_ : string_ option)
    ?dry_run:(dry_run_ : boolean_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     lakehouse_registration = lakehouse_registration_;
     catalog_name = catalog_name_;
     lakehouse_idc_registration = lakehouse_idc_registration_;
     lakehouse_idc_application_arn = lakehouse_idc_application_arn_;
     dry_run = dry_run_;
   }
    : modify_lakehouse_configuration_message)

let make_modify_redshift_idc_application_message
    ?identity_namespace:(identity_namespace_ : identity_namespace_string option)
    ?iam_role_arn:(iam_role_arn_ : string_ option)
    ?idc_display_name:(idc_display_name_ : idc_display_name_string option)
    ?authorized_token_issuer_list:
      (authorized_token_issuer_list_ : authorized_token_issuer_list option)
    ?service_integrations:(service_integrations_ : service_integration_list option)
    ~redshift_idc_application_arn:(redshift_idc_application_arn_ : string_) () =
  ({
     redshift_idc_application_arn = redshift_idc_application_arn_;
     identity_namespace = identity_namespace_;
     iam_role_arn = iam_role_arn_;
     idc_display_name = idc_display_name_;
     authorized_token_issuer_list = authorized_token_issuer_list_;
     service_integrations = service_integrations_;
   }
    : modify_redshift_idc_application_message)

let make_modify_scheduled_action_message
    ?target_action:(target_action_ : scheduled_action_type option)
    ?schedule:(schedule_ : string_ option) ?iam_role:(iam_role_ : string_ option)
    ?scheduled_action_description:(scheduled_action_description_ : string_ option)
    ?start_time:(start_time_ : t_stamp option) ?end_time:(end_time_ : t_stamp option)
    ?enable:(enable_ : boolean_optional option)
    ~scheduled_action_name:(scheduled_action_name_ : string_) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     target_action = target_action_;
     schedule = schedule_;
     iam_role = iam_role_;
     scheduled_action_description = scheduled_action_description_;
     start_time = start_time_;
     end_time = end_time_;
     enable = enable_;
   }
    : modify_scheduled_action_message)

let make_modify_snapshot_copy_retention_period_message ?manual:(manual_ : boolean_ option)
    ~cluster_identifier:(cluster_identifier_ : string_)
    ~retention_period:(retention_period_ : integer) () =
  ({
     cluster_identifier = cluster_identifier_;
     retention_period = retention_period_;
     manual = manual_;
   }
    : modify_snapshot_copy_retention_period_message)

let make_modify_snapshot_schedule_message ~schedule_identifier:(schedule_identifier_ : string_)
    ~schedule_definitions:(schedule_definitions_ : schedule_definition_list) () =
  ({ schedule_identifier = schedule_identifier_; schedule_definitions = schedule_definitions_ }
    : modify_snapshot_schedule_message)

let make_modify_usage_limit_message ?amount:(amount_ : long_optional option)
    ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ~usage_limit_id:(usage_limit_id_ : string_) () =
  ({ usage_limit_id = usage_limit_id_; amount = amount_; breach_action = breach_action_ }
    : modify_usage_limit_message)

let make_purchase_reserved_node_offering_message ?node_count:(node_count_ : integer_optional option)
    ~reserved_node_offering_id:(reserved_node_offering_id_ : string_) () =
  ({ reserved_node_offering_id = reserved_node_offering_id_; node_count = node_count_ }
    : purchase_reserved_node_offering_message)

let make_put_resource_policy_message ~resource_arn:(resource_arn_ : string_)
    ~policy:(policy_ : string_) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_message)

let make_reboot_cluster_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : reboot_cluster_message)

let make_update_partner_status_input_message
    ?status_message:(status_message_ : partner_integration_status_message option)
    ~account_id:(account_id_ : partner_integration_account_id)
    ~cluster_identifier:(cluster_identifier_ : partner_integration_cluster_identifier)
    ~database_name:(database_name_ : partner_integration_database_name)
    ~partner_name:(partner_name_ : partner_integration_partner_name)
    ~status:(status_ : partner_integration_status) () =
  ({
     account_id = account_id_;
     cluster_identifier = cluster_identifier_;
     database_name = database_name_;
     partner_name = partner_name_;
     status = status_;
     status_message = status_message_;
   }
    : update_partner_status_input_message)

let make_rotate_encryption_key_message ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({ cluster_identifier = cluster_identifier_ } : rotate_encryption_key_message)

let make_revoke_snapshot_access_message ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?snapshot_arn:(snapshot_arn_ : string_ option)
    ?snapshot_cluster_identifier:(snapshot_cluster_identifier_ : string_ option)
    ~account_with_restore_access:(account_with_restore_access_ : string_) () =
  ({
     snapshot_identifier = snapshot_identifier_;
     snapshot_arn = snapshot_arn_;
     snapshot_cluster_identifier = snapshot_cluster_identifier_;
     account_with_restore_access = account_with_restore_access_;
   }
    : revoke_snapshot_access_message)

let make_revoke_endpoint_access_message ?cluster_identifier:(cluster_identifier_ : string_ option)
    ?account:(account_ : string_ option) ?vpc_ids:(vpc_ids_ : vpc_identifier_list option)
    ?force:(force_ : boolean_ option) () =
  ({
     cluster_identifier = cluster_identifier_;
     account = account_;
     vpc_ids = vpc_ids_;
     force = force_;
   }
    : revoke_endpoint_access_message)

let make_revoke_cluster_security_group_ingress_message ?cidri_p:(cidri_p_ : string_ option)
    ?ec2_security_group_name:(ec2_security_group_name_ : string_ option)
    ?ec2_security_group_owner_id:(ec2_security_group_owner_id_ : string_ option)
    ~cluster_security_group_name:(cluster_security_group_name_ : string_) () =
  ({
     cluster_security_group_name = cluster_security_group_name_;
     cidri_p = cidri_p_;
     ec2_security_group_name = ec2_security_group_name_;
     ec2_security_group_owner_id = ec2_security_group_owner_id_;
   }
    : revoke_cluster_security_group_ingress_message)

let make_restore_table_from_cluster_snapshot_message
    ?source_schema_name:(source_schema_name_ : string_ option)
    ?target_database_name:(target_database_name_ : string_ option)
    ?target_schema_name:(target_schema_name_ : string_ option)
    ?enable_case_sensitive_identifier:(enable_case_sensitive_identifier_ : boolean_optional option)
    ~cluster_identifier:(cluster_identifier_ : string_)
    ~snapshot_identifier:(snapshot_identifier_ : string_)
    ~source_database_name:(source_database_name_ : string_)
    ~source_table_name:(source_table_name_ : string_) ~new_table_name:(new_table_name_ : string_) ()
    =
  ({
     cluster_identifier = cluster_identifier_;
     snapshot_identifier = snapshot_identifier_;
     source_database_name = source_database_name_;
     source_schema_name = source_schema_name_;
     source_table_name = source_table_name_;
     target_database_name = target_database_name_;
     target_schema_name = target_schema_name_;
     new_table_name = new_table_name_;
     enable_case_sensitive_identifier = enable_case_sensitive_identifier_;
   }
    : restore_table_from_cluster_snapshot_message)

let make_restore_from_cluster_snapshot_message
    ?snapshot_identifier:(snapshot_identifier_ : string_ option)
    ?snapshot_arn:(snapshot_arn_ : string_ option)
    ?snapshot_cluster_identifier:(snapshot_cluster_identifier_ : string_ option)
    ?port:(port_ : integer_optional option) ?availability_zone:(availability_zone_ : string_ option)
    ?allow_version_upgrade:(allow_version_upgrade_ : boolean_optional option)
    ?cluster_subnet_group_name:(cluster_subnet_group_name_ : string_ option)
    ?publicly_accessible:(publicly_accessible_ : boolean_optional option)
    ?owner_account:(owner_account_ : string_ option)
    ?hsm_client_certificate_identifier:(hsm_client_certificate_identifier_ : string_ option)
    ?hsm_configuration_identifier:(hsm_configuration_identifier_ : string_ option)
    ?elastic_ip:(elastic_ip_ : string_ option)
    ?cluster_parameter_group_name:(cluster_parameter_group_name_ : string_ option)
    ?cluster_security_groups:(cluster_security_groups_ : cluster_security_group_name_list option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?automated_snapshot_retention_period:
      (automated_snapshot_retention_period_ : integer_optional option)
    ?manual_snapshot_retention_period:(manual_snapshot_retention_period_ : integer_optional option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?node_type:(node_type_ : string_ option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : boolean_optional option)
    ?additional_info:(additional_info_ : string_ option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?maintenance_track_name:(maintenance_track_name_ : string_ option)
    ?snapshot_schedule_identifier:(snapshot_schedule_identifier_ : string_ option)
    ?number_of_nodes:(number_of_nodes_ : integer_optional option)
    ?availability_zone_relocation:(availability_zone_relocation_ : boolean_optional option)
    ?aqua_configuration_status:(aqua_configuration_status_ : aqua_configuration_status option)
    ?default_iam_role_arn:(default_iam_role_arn_ : string_ option)
    ?reserved_node_id:(reserved_node_id_ : string_ option)
    ?target_reserved_node_offering_id:(target_reserved_node_offering_id_ : string_ option)
    ?encrypted:(encrypted_ : boolean_optional option)
    ?manage_master_password:(manage_master_password_ : boolean_optional option)
    ?master_password_secret_kms_key_id:(master_password_secret_kms_key_id_ : string_ option)
    ?ip_address_type:(ip_address_type_ : string_ option)
    ?multi_a_z:(multi_a_z_ : boolean_optional option)
    ?catalog_name:(catalog_name_ : catalog_name_string option)
    ?redshift_idc_application_arn:(redshift_idc_application_arn_ : string_ option)
    ~cluster_identifier:(cluster_identifier_ : string_) () =
  ({
     cluster_identifier = cluster_identifier_;
     snapshot_identifier = snapshot_identifier_;
     snapshot_arn = snapshot_arn_;
     snapshot_cluster_identifier = snapshot_cluster_identifier_;
     port = port_;
     availability_zone = availability_zone_;
     allow_version_upgrade = allow_version_upgrade_;
     cluster_subnet_group_name = cluster_subnet_group_name_;
     publicly_accessible = publicly_accessible_;
     owner_account = owner_account_;
     hsm_client_certificate_identifier = hsm_client_certificate_identifier_;
     hsm_configuration_identifier = hsm_configuration_identifier_;
     elastic_ip = elastic_ip_;
     cluster_parameter_group_name = cluster_parameter_group_name_;
     cluster_security_groups = cluster_security_groups_;
     vpc_security_group_ids = vpc_security_group_ids_;
     preferred_maintenance_window = preferred_maintenance_window_;
     automated_snapshot_retention_period = automated_snapshot_retention_period_;
     manual_snapshot_retention_period = manual_snapshot_retention_period_;
     kms_key_id = kms_key_id_;
     node_type = node_type_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     additional_info = additional_info_;
     iam_roles = iam_roles_;
     maintenance_track_name = maintenance_track_name_;
     snapshot_schedule_identifier = snapshot_schedule_identifier_;
     number_of_nodes = number_of_nodes_;
     availability_zone_relocation = availability_zone_relocation_;
     aqua_configuration_status = aqua_configuration_status_;
     default_iam_role_arn = default_iam_role_arn_;
     reserved_node_id = reserved_node_id_;
     target_reserved_node_offering_id = target_reserved_node_offering_id_;
     encrypted = encrypted_;
     manage_master_password = manage_master_password_;
     master_password_secret_kms_key_id = master_password_secret_kms_key_id_;
     ip_address_type = ip_address_type_;
     multi_a_z = multi_a_z_;
     catalog_name = catalog_name_;
     redshift_idc_application_arn = redshift_idc_application_arn_;
   }
    : restore_from_cluster_snapshot_message)

let make_reset_cluster_parameter_group_message
    ?reset_all_parameters:(reset_all_parameters_ : boolean_ option)
    ?parameters:(parameters_ : parameters_list option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     parameter_group_name = parameter_group_name_;
     reset_all_parameters = reset_all_parameters_;
     parameters = parameters_;
   }
    : reset_cluster_parameter_group_message)

let make_reject_data_share_message ~data_share_arn:(data_share_arn_ : string_) () =
  ({ data_share_arn = data_share_arn_ } : reject_data_share_message)

let make_register_namespace_output_message ?status:(status_ : namespace_registration_status option)
    () =
  ({ status = status_ } : register_namespace_output_message)

let make_register_namespace_input_message
    ~namespace_identifier:(namespace_identifier_ : namespace_identifier_union)
    ~consumer_identifiers:(consumer_identifiers_ : consumer_identifier_list) () =
  ({ namespace_identifier = namespace_identifier_; consumer_identifiers = consumer_identifiers_ }
    : register_namespace_input_message)
