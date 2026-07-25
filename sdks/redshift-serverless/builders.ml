open Types

let make_association
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option) () =
  ({
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
     custom_domain_name = custom_domain_name_;
     workgroup_name = workgroup_name_;
   }
    : association)

let make_config_parameter ?parameter_key:(parameter_key_ : parameter_key option)
    ?parameter_value:(parameter_value_ : parameter_value option) () =
  ({ parameter_key = parameter_key_; parameter_value = parameter_value_ } : config_parameter)

let make_snapshot ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?admin_username:(admin_username_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : snapshot_status option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_backup_size_in_mega_bytes:
      (total_backup_size_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?actual_incremental_backup_size_in_mega_bytes:
      (actual_incremental_backup_size_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?backup_progress_in_mega_bytes:
      (backup_progress_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?current_backup_rate_in_mega_bytes_per_second:
      (current_backup_rate_in_mega_bytes_per_second_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_seconds_to_completion:
      (estimated_seconds_to_completion_ : Smaws_Lib.Smithy_api.Types.long option)
    ?elapsed_time_in_seconds:(elapsed_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.long option)
    ?snapshot_retention_period:
      (snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?snapshot_remaining_days:(snapshot_remaining_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?snapshot_retention_start_time:
      (snapshot_retention_start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?snapshot_arn:(snapshot_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?accounts_with_restore_access:(accounts_with_restore_access_ : account_id_list option)
    ?accounts_with_provisioned_restore_access:
      (accounts_with_provisioned_restore_access_ : account_id_list option)
    ?admin_password_secret_arn:
      (admin_password_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option) () =
  ({
     namespace_name = namespace_name_;
     namespace_arn = namespace_arn_;
     snapshot_name = snapshot_name_;
     snapshot_create_time = snapshot_create_time_;
     admin_username = admin_username_;
     status = status_;
     kms_key_id = kms_key_id_;
     owner_account = owner_account_;
     total_backup_size_in_mega_bytes = total_backup_size_in_mega_bytes_;
     actual_incremental_backup_size_in_mega_bytes = actual_incremental_backup_size_in_mega_bytes_;
     backup_progress_in_mega_bytes = backup_progress_in_mega_bytes_;
     current_backup_rate_in_mega_bytes_per_second = current_backup_rate_in_mega_bytes_per_second_;
     estimated_seconds_to_completion = estimated_seconds_to_completion_;
     elapsed_time_in_seconds = elapsed_time_in_seconds_;
     snapshot_retention_period = snapshot_retention_period_;
     snapshot_remaining_days = snapshot_remaining_days_;
     snapshot_retention_start_time = snapshot_retention_start_time_;
     snapshot_arn = snapshot_arn_;
     accounts_with_restore_access = accounts_with_restore_access_;
     accounts_with_provisioned_restore_access = accounts_with_provisioned_restore_access_;
     admin_password_secret_arn = admin_password_secret_arn_;
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
   }
    : snapshot)

let make_convert_recovery_point_to_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : convert_recovery_point_to_snapshot_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_convert_recovery_point_to_snapshot_request
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?tags:(tags_ : tag_list option)
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     recovery_point_id = recovery_point_id_;
     snapshot_name = snapshot_name_;
     retention_period = retention_period_;
     tags = tags_;
   }
    : convert_recovery_point_to_snapshot_request)

let make_create_custom_domain_association_response
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     custom_domain_name = custom_domain_name_;
     workgroup_name = workgroup_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
   }
    : create_custom_domain_association_response)

let make_create_custom_domain_association_request ~workgroup_name:(workgroup_name_ : workgroup_name)
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name)
    ~custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string) () =
  ({
     workgroup_name = workgroup_name_;
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
   }
    : create_custom_domain_association_request)

let make_network_interface
    ?network_interface_id:(network_interface_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?subnet_id:(subnet_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_ip_address:(private_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ipv6_address:(ipv6_address_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     network_interface_id = network_interface_id_;
     subnet_id = subnet_id_;
     private_ip_address = private_ip_address_;
     availability_zone = availability_zone_;
     ipv6_address = ipv6_address_;
   }
    : network_interface)

let make_vpc_endpoint
    ?vpc_endpoint_id:(vpc_endpoint_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vpc_id:(vpc_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?network_interfaces:(network_interfaces_ : network_interface_list option) () =
  ({
     vpc_endpoint_id = vpc_endpoint_id_;
     vpc_id = vpc_id_;
     network_interfaces = network_interfaces_;
   }
    : vpc_endpoint)

let make_vpc_security_group_membership
    ?vpc_security_group_id:(vpc_security_group_id_ : vpc_security_group_id option)
    ?status:(status_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ vpc_security_group_id = vpc_security_group_id_; status = status_ }
    : vpc_security_group_membership)

let make_endpoint_access ?endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?endpoint_status:(endpoint_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?endpoint_create_time:(endpoint_create_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?address:(address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?vpc_endpoint:(vpc_endpoint_ : vpc_endpoint option)
    ?endpoint_arn:(endpoint_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_status = endpoint_status_;
     workgroup_name = workgroup_name_;
     endpoint_create_time = endpoint_create_time_;
     port = port_;
     address = address_;
     subnet_ids = subnet_ids_;
     vpc_security_groups = vpc_security_groups_;
     vpc_endpoint = vpc_endpoint_;
     endpoint_arn = endpoint_arn_;
   }
    : endpoint_access)

let make_create_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : create_endpoint_access_response)

let make_create_endpoint_access_request
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ?owner_account:(owner_account_ : owner_account option)
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     endpoint_name = endpoint_name_;
     subnet_ids = subnet_ids_;
     workgroup_name = workgroup_name_;
     vpc_security_group_ids = vpc_security_group_ids_;
     owner_account = owner_account_;
   }
    : create_endpoint_access_request)

let make_namespace ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_id:(namespace_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?admin_username:(admin_username_ : db_user option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_iam_role_arn:(default_iam_role_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?log_exports:(log_exports_ : log_export_list option) ?status:(status_ : namespace_status option)
    ?creation_date:(creation_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?admin_password_secret_arn:
      (admin_password_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ?lakehouse_registration_status:
      (lakehouse_registration_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?catalog_arn:(catalog_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     namespace_arn = namespace_arn_;
     namespace_id = namespace_id_;
     namespace_name = namespace_name_;
     admin_username = admin_username_;
     db_name = db_name_;
     kms_key_id = kms_key_id_;
     default_iam_role_arn = default_iam_role_arn_;
     iam_roles = iam_roles_;
     log_exports = log_exports_;
     status = status_;
     creation_date = creation_date_;
     admin_password_secret_arn = admin_password_secret_arn_;
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
     lakehouse_registration_status = lakehouse_registration_status_;
     catalog_arn = catalog_arn_;
   }
    : namespace)

let make_create_namespace_response ?namespace:(namespace_ : namespace option) () =
  ({ namespace = namespace_ } : create_namespace_response)

let make_create_namespace_request ?admin_username:(admin_username_ : db_user option)
    ?admin_user_password:(admin_user_password_ : db_password option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_iam_role_arn:(default_iam_role_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?log_exports:(log_exports_ : log_export_list option) ?tags:(tags_ : tag_list option)
    ?manage_admin_password:(manage_admin_password_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ?redshift_idc_application_arn:
      (redshift_idc_application_arn_ : redshift_idc_application_arn option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     namespace_name = namespace_name_;
     admin_username = admin_username_;
     admin_user_password = admin_user_password_;
     db_name = db_name_;
     kms_key_id = kms_key_id_;
     default_iam_role_arn = default_iam_role_arn_;
     iam_roles = iam_roles_;
     log_exports = log_exports_;
     tags = tags_;
     manage_admin_password = manage_admin_password_;
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
     redshift_idc_application_arn = redshift_idc_application_arn_;
   }
    : create_namespace_request)

let make_reservation_offering ?offering_id:(offering_id_ : offering_id option)
    ?duration:(duration_ : duration option) ?upfront_charge:(upfront_charge_ : charge option)
    ?hourly_charge:(hourly_charge_ : charge option)
    ?currency_code:(currency_code_ : currency_code option)
    ?offering_type:(offering_type_ : offering_type option) () =
  ({
     offering_id = offering_id_;
     duration = duration_;
     upfront_charge = upfront_charge_;
     hourly_charge = hourly_charge_;
     currency_code = currency_code_;
     offering_type = offering_type_;
   }
    : reservation_offering)

let make_reservation ?reservation_id:(reservation_id_ : reservation_id option)
    ?reservation_arn:(reservation_arn_ : reservation_arn option)
    ?start_date:(start_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_date:(end_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?capacity:(capacity_ : capacity option) ?offering:(offering_ : reservation_offering option)
    ?status:(status_ : status option) () =
  ({
     reservation_id = reservation_id_;
     reservation_arn = reservation_arn_;
     start_date = start_date_;
     end_date = end_date_;
     capacity = capacity_;
     offering = offering_;
     status = status_;
   }
    : reservation)

let make_create_reservation_response ?reservation:(reservation_ : reservation option) () =
  ({ reservation = reservation_ } : create_reservation_response)

let make_create_reservation_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~capacity:(capacity_ : capacity) ~offering_id:(offering_id_ : offering_id) () =
  ({ capacity = capacity_; offering_id = offering_id_; client_token = client_token_ }
    : create_reservation_request)

let make_create_snapshot_schedule_action_parameters
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?tags:(tags_ : tag_list option) ~namespace_name:(namespace_name_ : namespace_name)
    ~snapshot_name_prefix:(snapshot_name_prefix_ : snapshot_name_prefix) () =
  ({
     namespace_name = namespace_name_;
     snapshot_name_prefix = snapshot_name_prefix_;
     retention_period = retention_period_;
     tags = tags_;
   }
    : create_snapshot_schedule_action_parameters)

let make_scheduled_action_response
    ?scheduled_action_name:(scheduled_action_name_ : scheduled_action_name option)
    ?schedule:(schedule_ : schedule option)
    ?scheduled_action_description:
      (scheduled_action_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?next_invocations:(next_invocations_ : next_invocations_list option)
    ?role_arn:(role_arn_ : iam_role_arn option) ?state:(state_ : state option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?target_action:(target_action_ : target_action option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?scheduled_action_uuid:(scheduled_action_uuid_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     schedule = schedule_;
     scheduled_action_description = scheduled_action_description_;
     next_invocations = next_invocations_;
     role_arn = role_arn_;
     state = state_;
     start_time = start_time_;
     end_time = end_time_;
     target_action = target_action_;
     namespace_name = namespace_name_;
     scheduled_action_uuid = scheduled_action_uuid_;
   }
    : scheduled_action_response)

let make_create_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : create_scheduled_action_response)

let make_create_scheduled_action_request
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?scheduled_action_description:
      (scheduled_action_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name)
    ~target_action:(target_action_ : target_action) ~schedule:(schedule_ : schedule)
    ~role_arn:(role_arn_ : iam_role_arn) ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     target_action = target_action_;
     schedule = schedule_;
     role_arn = role_arn_;
     namespace_name = namespace_name_;
     enabled = enabled_;
     scheduled_action_description = scheduled_action_description_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : create_scheduled_action_request)

let make_create_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : create_snapshot_response)

let make_create_snapshot_request
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?tags:(tags_ : tag_list option)
    ~namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     namespace_name = namespace_name_;
     snapshot_name = snapshot_name_;
     retention_period = retention_period_;
     tags = tags_;
   }
    : create_snapshot_request)

let make_snapshot_copy_configuration
    ?snapshot_copy_configuration_id:
      (snapshot_copy_configuration_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_copy_configuration_arn:
      (snapshot_copy_configuration_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?destination_region:(destination_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_retention_period:
      (snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?destination_kms_key_id:(destination_kms_key_id_ : kms_key_id option) () =
  ({
     snapshot_copy_configuration_id = snapshot_copy_configuration_id_;
     snapshot_copy_configuration_arn = snapshot_copy_configuration_arn_;
     namespace_name = namespace_name_;
     destination_region = destination_region_;
     snapshot_retention_period = snapshot_retention_period_;
     destination_kms_key_id = destination_kms_key_id_;
   }
    : snapshot_copy_configuration)

let make_create_snapshot_copy_configuration_response
    ~snapshot_copy_configuration:(snapshot_copy_configuration_ : snapshot_copy_configuration) () =
  ({ snapshot_copy_configuration = snapshot_copy_configuration_ }
    : create_snapshot_copy_configuration_response)

let make_create_snapshot_copy_configuration_request
    ?snapshot_retention_period:
      (snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?destination_kms_key_id:(destination_kms_key_id_ : kms_key_id option)
    ~namespace_name:(namespace_name_ : namespace_name)
    ~destination_region:(destination_region_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     namespace_name = namespace_name_;
     destination_region = destination_region_;
     snapshot_retention_period = snapshot_retention_period_;
     destination_kms_key_id = destination_kms_key_id_;
   }
    : create_snapshot_copy_configuration_request)

let make_usage_limit ?usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_limit_arn:(usage_limit_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_type:(usage_type_ : usage_limit_usage_type option)
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.long option)
    ?period:(period_ : usage_limit_period option)
    ?breach_action:(breach_action_ : usage_limit_breach_action option) () =
  ({
     usage_limit_id = usage_limit_id_;
     usage_limit_arn = usage_limit_arn_;
     resource_arn = resource_arn_;
     usage_type = usage_type_;
     amount = amount_;
     period = period_;
     breach_action = breach_action_;
   }
    : usage_limit)

let make_create_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : create_usage_limit_response)

let make_create_usage_limit_request ?period:(period_ : usage_limit_period option)
    ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~usage_type:(usage_type_ : usage_limit_usage_type)
    ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.long) () =
  ({
     resource_arn = resource_arn_;
     usage_type = usage_type_;
     amount = amount_;
     period = period_;
     breach_action = breach_action_;
   }
    : create_usage_limit_request)

let make_performance_target ?status:(status_ : performance_target_status option)
    ?level:(level_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ status = status_; level = level_ } : performance_target)

let make_endpoint ?address:(address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?vpc_endpoints:(vpc_endpoints_ : vpc_endpoint_list option) () =
  ({ address = address_; port = port_; vpc_endpoints = vpc_endpoints_ } : endpoint)

let make_workgroup ?workgroup_id:(workgroup_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_arn:(workgroup_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?base_capacity:(base_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?config_parameters:(config_parameters_ : config_parameter_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option) ?status:(status_ : workgroup_status option)
    ?endpoint:(endpoint_ : endpoint option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?creation_date:(creation_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?workgroup_version:(workgroup_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?patch_version:(patch_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_capacity:(max_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_vpcs:(cross_account_vpcs_ : vpc_ids option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?price_performance_target:(price_performance_target_ : performance_target option)
    ?track_name:(track_name_ : track_name option)
    ?pending_track_name:(pending_track_name_ : track_name option)
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     workgroup_id = workgroup_id_;
     workgroup_arn = workgroup_arn_;
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
     base_capacity = base_capacity_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     config_parameters = config_parameters_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     status = status_;
     endpoint = endpoint_;
     publicly_accessible = publicly_accessible_;
     creation_date = creation_date_;
     port = port_;
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
     workgroup_version = workgroup_version_;
     patch_version = patch_version_;
     max_capacity = max_capacity_;
     cross_account_vpcs = cross_account_vpcs_;
     ip_address_type = ip_address_type_;
     price_performance_target = price_performance_target_;
     track_name = track_name_;
     pending_track_name = pending_track_name_;
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
   }
    : workgroup)

let make_create_workgroup_response ?workgroup:(workgroup_ : workgroup option) () =
  ({ workgroup = workgroup_ } : create_workgroup_response)

let make_create_workgroup_request
    ?base_capacity:(base_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?config_parameters:(config_parameters_ : config_parameter_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tags:(tags_ : tag_list option) ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_capacity:(max_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?price_performance_target:(price_performance_target_ : performance_target option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?track_name:(track_name_ : track_name option)
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~workgroup_name:(workgroup_name_ : workgroup_name)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
     base_capacity = base_capacity_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     config_parameters = config_parameters_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     publicly_accessible = publicly_accessible_;
     tags = tags_;
     port = port_;
     max_capacity = max_capacity_;
     price_performance_target = price_performance_target_;
     ip_address_type = ip_address_type_;
     track_name = track_name_;
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
   }
    : create_workgroup_request)

let make_delete_custom_domain_association_response () = (() : unit)

let make_delete_custom_domain_association_request ~workgroup_name:(workgroup_name_ : workgroup_name)
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name) () =
  ({ workgroup_name = workgroup_name_; custom_domain_name = custom_domain_name_ }
    : delete_custom_domain_association_request)

let make_delete_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : delete_endpoint_access_response)

let make_delete_endpoint_access_request
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ endpoint_name = endpoint_name_ } : delete_endpoint_access_request)

let make_delete_namespace_response ~namespace:(namespace_ : namespace) () =
  ({ namespace = namespace_ } : delete_namespace_response)

let make_delete_namespace_request
    ?final_snapshot_name:(final_snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?final_snapshot_retention_period:
      (final_snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     namespace_name = namespace_name_;
     final_snapshot_name = final_snapshot_name_;
     final_snapshot_retention_period = final_snapshot_retention_period_;
   }
    : delete_namespace_request)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : delete_scheduled_action_response)

let make_delete_scheduled_action_request
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({ scheduled_action_name = scheduled_action_name_ } : delete_scheduled_action_request)

let make_delete_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : delete_snapshot_response)

let make_delete_snapshot_request
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ snapshot_name = snapshot_name_ } : delete_snapshot_request)

let make_delete_snapshot_copy_configuration_response
    ~snapshot_copy_configuration:(snapshot_copy_configuration_ : snapshot_copy_configuration) () =
  ({ snapshot_copy_configuration = snapshot_copy_configuration_ }
    : delete_snapshot_copy_configuration_response)

let make_delete_snapshot_copy_configuration_request
    ~snapshot_copy_configuration_id:
      (snapshot_copy_configuration_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ snapshot_copy_configuration_id = snapshot_copy_configuration_id_ }
    : delete_snapshot_copy_configuration_request)

let make_delete_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : delete_usage_limit_response)

let make_delete_usage_limit_request
    ~usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ usage_limit_id = usage_limit_id_ } : delete_usage_limit_request)

let make_delete_workgroup_response ~workgroup:(workgroup_ : workgroup) () =
  ({ workgroup = workgroup_ } : delete_workgroup_response)

let make_delete_workgroup_request ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({ workgroup_name = workgroup_name_ } : delete_workgroup_request)

let make_get_credentials_response ?db_user:(db_user_ : db_user option)
    ?db_password:(db_password_ : db_password option)
    ?expiration:(expiration_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?next_refresh_time:(next_refresh_time_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     db_user = db_user_;
     db_password = db_password_;
     expiration = expiration_;
     next_refresh_time = next_refresh_time_;
   }
    : get_credentials_response)

let make_get_credentials_request ?db_name:(db_name_ : db_name option)
    ?duration_seconds:(duration_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option) () =
  ({
     db_name = db_name_;
     duration_seconds = duration_seconds_;
     workgroup_name = workgroup_name_;
     custom_domain_name = custom_domain_name_;
   }
    : get_credentials_request)

let make_get_custom_domain_association_response
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     custom_domain_name = custom_domain_name_;
     workgroup_name = workgroup_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
   }
    : get_custom_domain_association_response)

let make_get_custom_domain_association_request
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({ custom_domain_name = custom_domain_name_; workgroup_name = workgroup_name_ }
    : get_custom_domain_association_request)

let make_get_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : get_endpoint_access_response)

let make_get_endpoint_access_request
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ endpoint_name = endpoint_name_ } : get_endpoint_access_request)

let make_get_identity_center_auth_token_response
    ?token:(token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expiration_time:(expiration_time_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ token = token_; expiration_time = expiration_time_ } : get_identity_center_auth_token_response)

let make_get_identity_center_auth_token_request
    ~workgroup_names:(workgroup_names_ : workgroup_name_list) () =
  ({ workgroup_names = workgroup_names_ } : get_identity_center_auth_token_request)

let make_get_namespace_response ~namespace:(namespace_ : namespace) () =
  ({ namespace = namespace_ } : get_namespace_response)

let make_get_namespace_request ~namespace_name:(namespace_name_ : namespace_name) () =
  ({ namespace_name = namespace_name_ } : get_namespace_request)

let make_recovery_point
    ?recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recovery_point_create_time:
      (recovery_point_create_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?total_size_in_mega_bytes:(total_size_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     recovery_point_id = recovery_point_id_;
     recovery_point_create_time = recovery_point_create_time_;
     total_size_in_mega_bytes = total_size_in_mega_bytes_;
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
     namespace_arn = namespace_arn_;
   }
    : recovery_point)

let make_get_recovery_point_response ?recovery_point:(recovery_point_ : recovery_point option) () =
  ({ recovery_point = recovery_point_ } : get_recovery_point_response)

let make_get_recovery_point_request
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ recovery_point_id = recovery_point_id_ } : get_recovery_point_request)

let make_get_reservation_response ~reservation:(reservation_ : reservation) () =
  ({ reservation = reservation_ } : get_reservation_response)

let make_get_reservation_request ~reservation_id:(reservation_id_ : reservation_id) () =
  ({ reservation_id = reservation_id_ } : get_reservation_request)

let make_get_reservation_offering_response
    ~reservation_offering:(reservation_offering_ : reservation_offering) () =
  ({ reservation_offering = reservation_offering_ } : get_reservation_offering_response)

let make_get_reservation_offering_request ~offering_id:(offering_id_ : offering_id) () =
  ({ offering_id = offering_id_ } : get_reservation_offering_request)

let make_resource_policy ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?policy:(policy_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : resource_policy)

let make_get_resource_policy_response ?resource_policy:(resource_policy_ : resource_policy option)
    () =
  ({ resource_policy = resource_policy_ } : get_resource_policy_response)

let make_get_resource_policy_request
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_get_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : get_scheduled_action_response)

let make_get_scheduled_action_request
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({ scheduled_action_name = scheduled_action_name_ } : get_scheduled_action_request)

let make_get_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : get_snapshot_response)

let make_get_snapshot_request
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_arn:(snapshot_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ snapshot_name = snapshot_name_; owner_account = owner_account_; snapshot_arn = snapshot_arn_ }
    : get_snapshot_request)

let make_table_restore_status
    ?table_restore_request_id:
      (table_restore_request_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?request_time:(request_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?progress_in_mega_bytes:(progress_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?total_data_in_mega_bytes:(total_data_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?source_database_name:(source_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_schema_name:(source_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_table_name:(source_table_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_database_name:(target_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_schema_name:(target_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?new_table_name:(new_table_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     table_restore_request_id = table_restore_request_id_;
     status = status_;
     message = message_;
     request_time = request_time_;
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
     snapshot_name = snapshot_name_;
     progress_in_mega_bytes = progress_in_mega_bytes_;
     total_data_in_mega_bytes = total_data_in_mega_bytes_;
     source_database_name = source_database_name_;
     source_schema_name = source_schema_name_;
     source_table_name = source_table_name_;
     target_database_name = target_database_name_;
     target_schema_name = target_schema_name_;
     new_table_name = new_table_name_;
     recovery_point_id = recovery_point_id_;
   }
    : table_restore_status)

let make_get_table_restore_status_response
    ?table_restore_status:(table_restore_status_ : table_restore_status option) () =
  ({ table_restore_status = table_restore_status_ } : get_table_restore_status_response)

let make_get_table_restore_status_request
    ~table_restore_request_id:(table_restore_request_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ table_restore_request_id = table_restore_request_id_ } : get_table_restore_status_request)

let make_update_target ?track_name:(track_name_ : track_name option)
    ?workgroup_version:(workgroup_version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ track_name = track_name_; workgroup_version = workgroup_version_ } : update_target)

let make_serverless_track ?track_name:(track_name_ : track_name option)
    ?workgroup_version:(workgroup_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?update_targets:(update_targets_ : update_targets_list option) () =
  ({
     track_name = track_name_;
     workgroup_version = workgroup_version_;
     update_targets = update_targets_;
   }
    : serverless_track)

let make_get_track_response ?track:(track_ : serverless_track option) () =
  ({ track = track_ } : get_track_response)

let make_get_track_request ~track_name:(track_name_ : track_name) () =
  ({ track_name = track_name_ } : get_track_request)

let make_get_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : get_usage_limit_response)

let make_get_usage_limit_request
    ~usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ usage_limit_id = usage_limit_id_ } : get_usage_limit_request)

let make_get_workgroup_response ~workgroup:(workgroup_ : workgroup) () =
  ({ workgroup = workgroup_ } : get_workgroup_response)

let make_get_workgroup_request ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({ workgroup_name = workgroup_name_ } : get_workgroup_request)

let make_list_custom_domain_associations_response
    ?next_token:(next_token_ : pagination_token option)
    ?associations:(associations_ : association_list option) () =
  ({ next_token = next_token_; associations = associations_ }
    : list_custom_domain_associations_response)

let make_list_custom_domain_associations_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
   }
    : list_custom_domain_associations_request)

let make_list_endpoint_access_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~endpoints:(endpoints_ : endpoint_access_list) () =
  ({ next_token = next_token_; endpoints = endpoints_ } : list_endpoint_access_response)

let make_list_endpoint_access_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vpc_id:(vpc_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?owner_account:(owner_account_ : owner_account option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     workgroup_name = workgroup_name_;
     vpc_id = vpc_id_;
     owner_account = owner_account_;
   }
    : list_endpoint_access_request)

let make_managed_workgroup_list_item
    ?managed_workgroup_name:(managed_workgroup_name_ : managed_workgroup_name option)
    ?managed_workgroup_id:(managed_workgroup_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_arn:(source_arn_ : source_arn option)
    ?status:(status_ : managed_workgroup_status option)
    ?creation_date:(creation_date_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     managed_workgroup_name = managed_workgroup_name_;
     managed_workgroup_id = managed_workgroup_id_;
     source_arn = source_arn_;
     status = status_;
     creation_date = creation_date_;
   }
    : managed_workgroup_list_item)

let make_list_managed_workgroups_response ?next_token:(next_token_ : pagination_token option)
    ?managed_workgroups:(managed_workgroups_ : managed_workgroups option) () =
  ({ next_token = next_token_; managed_workgroups = managed_workgroups_ }
    : list_managed_workgroups_response)

let make_list_managed_workgroups_request ?source_arn:(source_arn_ : source_arn option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ source_arn = source_arn_; next_token = next_token_; max_results = max_results_ }
    : list_managed_workgroups_request)

let make_list_namespaces_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~namespaces:(namespaces_ : namespace_list) () =
  ({ next_token = next_token_; namespaces = namespaces_ } : list_namespaces_response)

let make_list_namespaces_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_namespaces_request)

let make_list_recovery_points_response
    ?recovery_points:(recovery_points_ : recovery_point_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ recovery_points = recovery_points_; next_token = next_token_ } : list_recovery_points_response)

let make_list_recovery_points_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     start_time = start_time_;
     end_time = end_time_;
     namespace_name = namespace_name_;
     namespace_arn = namespace_arn_;
   }
    : list_recovery_points_request)

let make_list_reservation_offerings_response ?next_token:(next_token_ : pagination_token option)
    ~reservation_offerings_list:(reservation_offerings_list_ : reservation_offerings_list) () =
  ({ reservation_offerings_list = reservation_offerings_list_; next_token = next_token_ }
    : list_reservation_offerings_response)

let make_list_reservation_offerings_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_reservation_offerings_request)

let make_list_reservations_response ?next_token:(next_token_ : pagination_token option)
    ~reservations_list:(reservations_list_ : reservations_list) () =
  ({ reservations_list = reservations_list_; next_token = next_token_ }
    : list_reservations_response)

let make_list_reservations_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_reservations_request)

let make_scheduled_action_association ?namespace_name:(namespace_name_ : namespace_name option)
    ?scheduled_action_name:(scheduled_action_name_ : scheduled_action_name option) () =
  ({ namespace_name = namespace_name_; scheduled_action_name = scheduled_action_name_ }
    : scheduled_action_association)

let make_list_scheduled_actions_response ?next_token:(next_token_ : pagination_token option)
    ?scheduled_actions:(scheduled_actions_ : scheduled_actions_list option) () =
  ({ next_token = next_token_; scheduled_actions = scheduled_actions_ }
    : list_scheduled_actions_response)

let make_list_scheduled_actions_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?namespace_name:(namespace_name_ : namespace_name option) () =
  ({ next_token = next_token_; max_results = max_results_; namespace_name = namespace_name_ }
    : list_scheduled_actions_request)

let make_list_snapshot_copy_configurations_response
    ?next_token:(next_token_ : pagination_token option)
    ~snapshot_copy_configurations:(snapshot_copy_configurations_ : snapshot_copy_configurations) ()
    =
  ({ next_token = next_token_; snapshot_copy_configurations = snapshot_copy_configurations_ }
    : list_snapshot_copy_configurations_response)

let make_list_snapshot_copy_configurations_request
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ namespace_name = namespace_name_; next_token = next_token_; max_results = max_results_ }
    : list_snapshot_copy_configurations_request)

let make_list_snapshots_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshots:(snapshots_ : snapshot_list option) () =
  ({ next_token = next_token_; snapshots = snapshots_ } : list_snapshots_response)

let make_list_snapshots_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     namespace_name = namespace_name_;
     namespace_arn = namespace_arn_;
     owner_account = owner_account_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : list_snapshots_request)

let make_list_table_restore_status_response ?next_token:(next_token_ : pagination_token option)
    ?table_restore_statuses:(table_restore_statuses_ : table_restore_status_list option) () =
  ({ next_token = next_token_; table_restore_statuses = table_restore_statuses_ }
    : list_table_restore_status_response)

let make_list_table_restore_status_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
   }
    : list_table_restore_status_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_tracks_response ?tracks:(tracks_ : track_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ tracks = tracks_; next_token = next_token_ } : list_tracks_response)

let make_list_tracks_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_tracks_request)

let make_list_usage_limits_response ?usage_limits:(usage_limits_ : usage_limits option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ usage_limits = usage_limits_; next_token = next_token_ } : list_usage_limits_response)

let make_list_usage_limits_request
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_type:(usage_type_ : usage_limit_usage_type option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     resource_arn = resource_arn_;
     usage_type = usage_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_usage_limits_request)

let make_list_workgroups_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workgroups:(workgroups_ : workgroup_list) () =
  ({ next_token = next_token_; workgroups = workgroups_ } : list_workgroups_response)

let make_list_workgroups_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?owner_account:(owner_account_ : owner_account option) () =
  ({ next_token = next_token_; max_results = max_results_; owner_account = owner_account_ }
    : list_workgroups_request)

let make_put_resource_policy_response ?resource_policy:(resource_policy_ : resource_policy option)
    () =
  ({ resource_policy = resource_policy_ } : put_resource_policy_response)

let make_put_resource_policy_request
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~policy:(policy_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_request)

let make_update_custom_domain_association_response
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     custom_domain_name = custom_domain_name_;
     workgroup_name = workgroup_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
   }
    : update_custom_domain_association_response)

let make_update_custom_domain_association_request ~workgroup_name:(workgroup_name_ : workgroup_name)
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name)
    ~custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string) () =
  ({
     workgroup_name = workgroup_name_;
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
   }
    : update_custom_domain_association_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_restore_from_recovery_point_response
    ?recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace:(namespace_ : namespace option) () =
  ({ recovery_point_id = recovery_point_id_; namespace = namespace_ }
    : restore_from_recovery_point_response)

let make_restore_from_recovery_point_request
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~namespace_name:(namespace_name_ : namespace_name)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({
     recovery_point_id = recovery_point_id_;
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
   }
    : restore_from_recovery_point_request)

let make_restore_from_snapshot_response
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace:(namespace_ : namespace option) () =
  ({ snapshot_name = snapshot_name_; owner_account = owner_account_; namespace = namespace_ }
    : restore_from_snapshot_response)

let make_restore_from_snapshot_request
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_arn:(snapshot_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?manage_admin_password:(manage_admin_password_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ~namespace_name:(namespace_name_ : namespace_name)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
     snapshot_name = snapshot_name_;
     snapshot_arn = snapshot_arn_;
     owner_account = owner_account_;
     manage_admin_password = manage_admin_password_;
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
   }
    : restore_from_snapshot_request)

let make_restore_table_from_recovery_point_response
    ?table_restore_status:(table_restore_status_ : table_restore_status option) () =
  ({ table_restore_status = table_restore_status_ } : restore_table_from_recovery_point_response)

let make_restore_table_from_recovery_point_request
    ?source_schema_name:(source_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_database_name:(target_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_schema_name:(target_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?activate_case_sensitive_identifier:
      (activate_case_sensitive_identifier_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_database_name:(source_database_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_table_name:(source_table_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~new_table_name:(new_table_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
     recovery_point_id = recovery_point_id_;
     source_database_name = source_database_name_;
     source_schema_name = source_schema_name_;
     source_table_name = source_table_name_;
     target_database_name = target_database_name_;
     target_schema_name = target_schema_name_;
     new_table_name = new_table_name_;
     activate_case_sensitive_identifier = activate_case_sensitive_identifier_;
   }
    : restore_table_from_recovery_point_request)

let make_restore_table_from_snapshot_response
    ?table_restore_status:(table_restore_status_ : table_restore_status option) () =
  ({ table_restore_status = table_restore_status_ } : restore_table_from_snapshot_response)

let make_restore_table_from_snapshot_request
    ?source_schema_name:(source_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_database_name:(target_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_schema_name:(target_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?activate_case_sensitive_identifier:
      (activate_case_sensitive_identifier_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_database_name:(source_database_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_table_name:(source_table_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~new_table_name:(new_table_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
     snapshot_name = snapshot_name_;
     source_database_name = source_database_name_;
     source_schema_name = source_schema_name_;
     source_table_name = source_table_name_;
     target_database_name = target_database_name_;
     target_schema_name = target_schema_name_;
     new_table_name = new_table_name_;
     activate_case_sensitive_identifier = activate_case_sensitive_identifier_;
   }
    : restore_table_from_snapshot_request)

let make_update_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : update_endpoint_access_response)

let make_update_endpoint_access_request
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ endpoint_name = endpoint_name_; vpc_security_group_ids = vpc_security_group_ids_ }
    : update_endpoint_access_request)

let make_update_lakehouse_configuration_response
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?lakehouse_idc_application_arn:
      (lakehouse_idc_application_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lakehouse_registration_status:
      (lakehouse_registration_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?catalog_arn:(catalog_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     namespace_name = namespace_name_;
     lakehouse_idc_application_arn = lakehouse_idc_application_arn_;
     lakehouse_registration_status = lakehouse_registration_status_;
     catalog_arn = catalog_arn_;
   }
    : update_lakehouse_configuration_response)

let make_update_lakehouse_configuration_request
    ?lakehouse_registration:(lakehouse_registration_ : lakehouse_registration option)
    ?catalog_name:(catalog_name_ : catalog_name_string option)
    ?lakehouse_idc_registration:(lakehouse_idc_registration_ : lakehouse_idc_registration option)
    ?lakehouse_idc_application_arn:
      (lakehouse_idc_application_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     namespace_name = namespace_name_;
     lakehouse_registration = lakehouse_registration_;
     catalog_name = catalog_name_;
     lakehouse_idc_registration = lakehouse_idc_registration_;
     lakehouse_idc_application_arn = lakehouse_idc_application_arn_;
     dry_run = dry_run_;
   }
    : update_lakehouse_configuration_request)

let make_update_namespace_response ~namespace:(namespace_ : namespace) () =
  ({ namespace = namespace_ } : update_namespace_response)

let make_update_namespace_request ?admin_user_password:(admin_user_password_ : db_password option)
    ?admin_username:(admin_username_ : db_user option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_iam_role_arn:(default_iam_role_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?log_exports:(log_exports_ : log_export_list option)
    ?manage_admin_password:(manage_admin_password_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     namespace_name = namespace_name_;
     admin_user_password = admin_user_password_;
     admin_username = admin_username_;
     kms_key_id = kms_key_id_;
     default_iam_role_arn = default_iam_role_arn_;
     iam_roles = iam_roles_;
     log_exports = log_exports_;
     manage_admin_password = manage_admin_password_;
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
   }
    : update_namespace_request)

let make_update_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : update_scheduled_action_response)

let make_update_scheduled_action_request ?target_action:(target_action_ : target_action option)
    ?schedule:(schedule_ : schedule option) ?role_arn:(role_arn_ : iam_role_arn option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?scheduled_action_description:
      (scheduled_action_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({
     scheduled_action_name = scheduled_action_name_;
     target_action = target_action_;
     schedule = schedule_;
     role_arn = role_arn_;
     enabled = enabled_;
     scheduled_action_description = scheduled_action_description_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : update_scheduled_action_request)

let make_update_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : update_snapshot_response)

let make_update_snapshot_request
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ snapshot_name = snapshot_name_; retention_period = retention_period_ }
    : update_snapshot_request)

let make_update_snapshot_copy_configuration_response
    ~snapshot_copy_configuration:(snapshot_copy_configuration_ : snapshot_copy_configuration) () =
  ({ snapshot_copy_configuration = snapshot_copy_configuration_ }
    : update_snapshot_copy_configuration_response)

let make_update_snapshot_copy_configuration_request
    ?snapshot_retention_period:
      (snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~snapshot_copy_configuration_id:
      (snapshot_copy_configuration_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     snapshot_copy_configuration_id = snapshot_copy_configuration_id_;
     snapshot_retention_period = snapshot_retention_period_;
   }
    : update_snapshot_copy_configuration_request)

let make_update_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : update_usage_limit_response)

let make_update_usage_limit_request ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.long option)
    ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ~usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ usage_limit_id = usage_limit_id_; amount = amount_; breach_action = breach_action_ }
    : update_usage_limit_request)

let make_update_workgroup_response ~workgroup:(workgroup_ : workgroup) () =
  ({ workgroup = workgroup_ } : update_workgroup_response)

let make_update_workgroup_request
    ?base_capacity:(base_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?config_parameters:(config_parameters_ : config_parameter_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_capacity:(max_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?price_performance_target:(price_performance_target_ : performance_target option)
    ?track_name:(track_name_ : track_name option)
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({
     workgroup_name = workgroup_name_;
     base_capacity = base_capacity_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     config_parameters = config_parameters_;
     publicly_accessible = publicly_accessible_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     port = port_;
     max_capacity = max_capacity_;
     ip_address_type = ip_address_type_;
     price_performance_target = price_performance_target_;
     track_name = track_name_;
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
   }
    : update_workgroup_request)
