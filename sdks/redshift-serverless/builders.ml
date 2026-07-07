open Types

let make_config_parameter ?parameter_value:(parameter_value_ : parameter_value option)
    ?parameter_key:(parameter_key_ : parameter_key option) () =
  ({ parameter_value = parameter_value_; parameter_key = parameter_key_ } : config_parameter)

let make_network_interface ?ipv6_address:(ipv6_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone:(availability_zone_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?private_ip_address:(private_ip_address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?subnet_id:(subnet_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?network_interface_id:(network_interface_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     ipv6_address = ipv6_address_;
     availability_zone = availability_zone_;
     private_ip_address = private_ip_address_;
     subnet_id = subnet_id_;
     network_interface_id = network_interface_id_;
   }
    : network_interface)

let make_vpc_endpoint ?network_interfaces:(network_interfaces_ : network_interface_list option)
    ?vpc_id:(vpc_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     network_interfaces = network_interfaces_;
     vpc_id = vpc_id_;
     vpc_endpoint_id = vpc_endpoint_id_;
   }
    : vpc_endpoint)

let make_endpoint ?vpc_endpoints:(vpc_endpoints_ : vpc_endpoint_list option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?address:(address_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ vpc_endpoints = vpc_endpoints_; port = port_; address = address_ } : endpoint)

let make_performance_target ?level:(level_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?status:(status_ : performance_target_status option) () =
  ({ level = level_; status = status_ } : performance_target)

let make_workgroup
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?pending_track_name:(pending_track_name_ : track_name option)
    ?track_name:(track_name_ : track_name option)
    ?price_performance_target:(price_performance_target_ : performance_target option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?cross_account_vpcs:(cross_account_vpcs_ : vpc_ids option)
    ?max_capacity:(max_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?patch_version:(patch_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_version:(workgroup_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?creation_date:(creation_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?endpoint:(endpoint_ : endpoint option) ?status:(status_ : workgroup_status option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?config_parameters:(config_parameters_ : config_parameter_list option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?base_capacity:(base_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?workgroup_arn:(workgroup_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_id:(workgroup_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
     pending_track_name = pending_track_name_;
     track_name = track_name_;
     price_performance_target = price_performance_target_;
     ip_address_type = ip_address_type_;
     cross_account_vpcs = cross_account_vpcs_;
     max_capacity = max_capacity_;
     patch_version = patch_version_;
     workgroup_version = workgroup_version_;
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_name = custom_domain_name_;
     port = port_;
     creation_date = creation_date_;
     publicly_accessible = publicly_accessible_;
     endpoint = endpoint_;
     status = status_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     config_parameters = config_parameters_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     base_capacity = base_capacity_;
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
     workgroup_arn = workgroup_arn_;
     workgroup_id = workgroup_id_;
   }
    : workgroup)

let make_vpc_security_group_membership ?status:(status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vpc_security_group_id:(vpc_security_group_id_ : vpc_security_group_id option) () =
  ({ status = status_; vpc_security_group_id = vpc_security_group_id_ }
    : vpc_security_group_membership)

let make_usage_limit ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ?period:(period_ : usage_limit_period option)
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.long option)
    ?usage_type:(usage_type_ : usage_limit_usage_type option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_limit_arn:(usage_limit_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     breach_action = breach_action_;
     period = period_;
     amount = amount_;
     usage_type = usage_type_;
     resource_arn = resource_arn_;
     usage_limit_arn = usage_limit_arn_;
     usage_limit_id = usage_limit_id_;
   }
    : usage_limit)

let make_update_workgroup_response ~workgroup:(workgroup_ : workgroup) () =
  ({ workgroup = workgroup_ } : update_workgroup_response)

let make_update_workgroup_request
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?track_name:(track_name_ : track_name option)
    ?price_performance_target:(price_performance_target_ : performance_target option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?max_capacity:(max_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?config_parameters:(config_parameters_ : config_parameter_list option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?base_capacity:(base_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
     track_name = track_name_;
     price_performance_target = price_performance_target_;
     ip_address_type = ip_address_type_;
     max_capacity = max_capacity_;
     port = port_;
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     publicly_accessible = publicly_accessible_;
     config_parameters = config_parameters_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     base_capacity = base_capacity_;
     workgroup_name = workgroup_name_;
   }
    : update_workgroup_request)

let make_update_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : update_usage_limit_response)

let make_update_usage_limit_request
    ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.long option)
    ~usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ breach_action = breach_action_; amount = amount_; usage_limit_id = usage_limit_id_ }
    : update_usage_limit_request)

let make_update_target
    ?workgroup_version:(workgroup_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?track_name:(track_name_ : track_name option) () =
  ({ workgroup_version = workgroup_version_; track_name = track_name_ } : update_target)

let make_snapshot
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ?admin_password_secret_arn:
      (admin_password_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?accounts_with_provisioned_restore_access:
      (accounts_with_provisioned_restore_access_ : account_id_list option)
    ?accounts_with_restore_access:(accounts_with_restore_access_ : account_id_list option)
    ?snapshot_arn:(snapshot_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_retention_start_time:
      (snapshot_retention_start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?snapshot_remaining_days:(snapshot_remaining_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?snapshot_retention_period:
      (snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?elapsed_time_in_seconds:(elapsed_time_in_seconds_ : Smaws_Lib.Smithy_api.Types.long option)
    ?estimated_seconds_to_completion:
      (estimated_seconds_to_completion_ : Smaws_Lib.Smithy_api.Types.long option)
    ?current_backup_rate_in_mega_bytes_per_second:
      (current_backup_rate_in_mega_bytes_per_second_ : Smaws_Lib.Smithy_api.Types.double option)
    ?backup_progress_in_mega_bytes:
      (backup_progress_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?actual_incremental_backup_size_in_mega_bytes:
      (actual_incremental_backup_size_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?total_backup_size_in_mega_bytes:
      (total_backup_size_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?status:(status_ : snapshot_status option)
    ?admin_username:(admin_username_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_create_time:(snapshot_create_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
     admin_password_secret_arn = admin_password_secret_arn_;
     accounts_with_provisioned_restore_access = accounts_with_provisioned_restore_access_;
     accounts_with_restore_access = accounts_with_restore_access_;
     snapshot_arn = snapshot_arn_;
     snapshot_retention_start_time = snapshot_retention_start_time_;
     snapshot_remaining_days = snapshot_remaining_days_;
     snapshot_retention_period = snapshot_retention_period_;
     elapsed_time_in_seconds = elapsed_time_in_seconds_;
     estimated_seconds_to_completion = estimated_seconds_to_completion_;
     current_backup_rate_in_mega_bytes_per_second = current_backup_rate_in_mega_bytes_per_second_;
     backup_progress_in_mega_bytes = backup_progress_in_mega_bytes_;
     actual_incremental_backup_size_in_mega_bytes = actual_incremental_backup_size_in_mega_bytes_;
     total_backup_size_in_mega_bytes = total_backup_size_in_mega_bytes_;
     owner_account = owner_account_;
     kms_key_id = kms_key_id_;
     status = status_;
     admin_username = admin_username_;
     snapshot_create_time = snapshot_create_time_;
     snapshot_name = snapshot_name_;
     namespace_arn = namespace_arn_;
     namespace_name = namespace_name_;
   }
    : snapshot)

let make_update_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : update_snapshot_response)

let make_update_snapshot_request
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ retention_period = retention_period_; snapshot_name = snapshot_name_ }
    : update_snapshot_request)

let make_snapshot_copy_configuration
    ?destination_kms_key_id:(destination_kms_key_id_ : kms_key_id option)
    ?snapshot_retention_period:
      (snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?destination_region:(destination_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?snapshot_copy_configuration_arn:
      (snapshot_copy_configuration_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_copy_configuration_id:
      (snapshot_copy_configuration_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     destination_kms_key_id = destination_kms_key_id_;
     snapshot_retention_period = snapshot_retention_period_;
     destination_region = destination_region_;
     namespace_name = namespace_name_;
     snapshot_copy_configuration_arn = snapshot_copy_configuration_arn_;
     snapshot_copy_configuration_id = snapshot_copy_configuration_id_;
   }
    : snapshot_copy_configuration)

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
     snapshot_retention_period = snapshot_retention_period_;
     snapshot_copy_configuration_id = snapshot_copy_configuration_id_;
   }
    : update_snapshot_copy_configuration_request)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_create_snapshot_schedule_action_parameters ?tags:(tags_ : tag_list option)
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~snapshot_name_prefix:(snapshot_name_prefix_ : snapshot_name_prefix)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     tags = tags_;
     retention_period = retention_period_;
     snapshot_name_prefix = snapshot_name_prefix_;
     namespace_name = namespace_name_;
   }
    : create_snapshot_schedule_action_parameters)

let make_scheduled_action_response
    ?scheduled_action_uuid:(scheduled_action_uuid_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?target_action:(target_action_ : target_action option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?state:(state_ : state option) ?role_arn:(role_arn_ : iam_role_arn option)
    ?next_invocations:(next_invocations_ : next_invocations_list option)
    ?scheduled_action_description:
      (scheduled_action_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?schedule:(schedule_ : schedule option)
    ?scheduled_action_name:(scheduled_action_name_ : scheduled_action_name option) () =
  ({
     scheduled_action_uuid = scheduled_action_uuid_;
     namespace_name = namespace_name_;
     target_action = target_action_;
     end_time = end_time_;
     start_time = start_time_;
     state = state_;
     role_arn = role_arn_;
     next_invocations = next_invocations_;
     scheduled_action_description = scheduled_action_description_;
     schedule = schedule_;
     scheduled_action_name = scheduled_action_name_;
   }
    : scheduled_action_response)

let make_update_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : update_scheduled_action_response)

let make_update_scheduled_action_request
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?scheduled_action_description:
      (scheduled_action_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?role_arn:(role_arn_ : iam_role_arn option) ?schedule:(schedule_ : schedule option)
    ?target_action:(target_action_ : target_action option)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     scheduled_action_description = scheduled_action_description_;
     enabled = enabled_;
     role_arn = role_arn_;
     schedule = schedule_;
     target_action = target_action_;
     scheduled_action_name = scheduled_action_name_;
   }
    : update_scheduled_action_request)

let make_namespace ?catalog_arn:(catalog_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lakehouse_registration_status:
      (lakehouse_registration_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ?admin_password_secret_arn:
      (admin_password_secret_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?creation_date:(creation_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : namespace_status option) ?log_exports:(log_exports_ : log_export_list option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?default_iam_role_arn:(default_iam_role_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?admin_username:(admin_username_ : db_user option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?namespace_id:(namespace_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     catalog_arn = catalog_arn_;
     lakehouse_registration_status = lakehouse_registration_status_;
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
     admin_password_secret_arn = admin_password_secret_arn_;
     creation_date = creation_date_;
     status = status_;
     log_exports = log_exports_;
     iam_roles = iam_roles_;
     default_iam_role_arn = default_iam_role_arn_;
     kms_key_id = kms_key_id_;
     db_name = db_name_;
     admin_username = admin_username_;
     namespace_name = namespace_name_;
     namespace_id = namespace_id_;
     namespace_arn = namespace_arn_;
   }
    : namespace)

let make_update_namespace_response ~namespace:(namespace_ : namespace) () =
  ({ namespace = namespace_ } : update_namespace_response)

let make_update_namespace_request
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ?manage_admin_password:(manage_admin_password_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?log_exports:(log_exports_ : log_export_list option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?default_iam_role_arn:(default_iam_role_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?admin_username:(admin_username_ : db_user option)
    ?admin_user_password:(admin_user_password_ : db_password option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
     manage_admin_password = manage_admin_password_;
     log_exports = log_exports_;
     iam_roles = iam_roles_;
     default_iam_role_arn = default_iam_role_arn_;
     kms_key_id = kms_key_id_;
     admin_username = admin_username_;
     admin_user_password = admin_user_password_;
     namespace_name = namespace_name_;
   }
    : update_namespace_request)

let make_update_lakehouse_configuration_response
    ?catalog_arn:(catalog_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lakehouse_registration_status:
      (lakehouse_registration_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lakehouse_idc_application_arn:
      (lakehouse_idc_application_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : namespace_name option) () =
  ({
     catalog_arn = catalog_arn_;
     lakehouse_registration_status = lakehouse_registration_status_;
     lakehouse_idc_application_arn = lakehouse_idc_application_arn_;
     namespace_name = namespace_name_;
   }
    : update_lakehouse_configuration_response)

let make_update_lakehouse_configuration_request
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?lakehouse_idc_application_arn:
      (lakehouse_idc_application_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lakehouse_idc_registration:(lakehouse_idc_registration_ : lakehouse_idc_registration option)
    ?catalog_name:(catalog_name_ : catalog_name_string option)
    ?lakehouse_registration:(lakehouse_registration_ : lakehouse_registration option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     dry_run = dry_run_;
     lakehouse_idc_application_arn = lakehouse_idc_application_arn_;
     lakehouse_idc_registration = lakehouse_idc_registration_;
     catalog_name = catalog_name_;
     lakehouse_registration = lakehouse_registration_;
     namespace_name = namespace_name_;
   }
    : update_lakehouse_configuration_request)

let make_endpoint_access ?endpoint_arn:(endpoint_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?vpc_endpoint:(vpc_endpoint_ : vpc_endpoint option)
    ?vpc_security_groups:(vpc_security_groups_ : vpc_security_group_membership_list option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?address:(address_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?endpoint_create_time:(endpoint_create_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?endpoint_status:(endpoint_status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     endpoint_arn = endpoint_arn_;
     vpc_endpoint = vpc_endpoint_;
     vpc_security_groups = vpc_security_groups_;
     subnet_ids = subnet_ids_;
     address = address_;
     port = port_;
     endpoint_create_time = endpoint_create_time_;
     workgroup_name = workgroup_name_;
     endpoint_status = endpoint_status_;
     endpoint_name = endpoint_name_;
   }
    : endpoint_access)

let make_update_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : update_endpoint_access_response)

let make_update_endpoint_access_request
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ vpc_security_group_ids = vpc_security_group_ids_; endpoint_name = endpoint_name_ }
    : update_endpoint_access_request)

let make_update_custom_domain_association_response
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option) () =
  ({
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     workgroup_name = workgroup_name_;
     custom_domain_name = custom_domain_name_;
   }
    : update_custom_domain_association_response)

let make_update_custom_domain_association_request
    ~custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string)
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_name = custom_domain_name_;
     workgroup_name = workgroup_name_;
   }
    : update_custom_domain_association_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_serverless_track ?update_targets:(update_targets_ : update_targets_list option)
    ?workgroup_version:(workgroup_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?track_name:(track_name_ : track_name option) () =
  ({
     update_targets = update_targets_;
     workgroup_version = workgroup_version_;
     track_name = track_name_;
   }
    : serverless_track)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_table_restore_status
    ?recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?new_table_name:(new_table_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_schema_name:(target_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_database_name:(target_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_table_name:(source_table_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_schema_name:(source_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_database_name:(source_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?total_data_in_mega_bytes:(total_data_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?progress_in_mega_bytes:(progress_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.long option)
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?request_time:(request_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?table_restore_request_id:
      (table_restore_request_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     recovery_point_id = recovery_point_id_;
     new_table_name = new_table_name_;
     target_schema_name = target_schema_name_;
     target_database_name = target_database_name_;
     source_table_name = source_table_name_;
     source_schema_name = source_schema_name_;
     source_database_name = source_database_name_;
     total_data_in_mega_bytes = total_data_in_mega_bytes_;
     progress_in_mega_bytes = progress_in_mega_bytes_;
     snapshot_name = snapshot_name_;
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
     request_time = request_time_;
     message = message_;
     status = status_;
     table_restore_request_id = table_restore_request_id_;
   }
    : table_restore_status)

let make_scheduled_action_association
    ?scheduled_action_name:(scheduled_action_name_ : scheduled_action_name option)
    ?namespace_name:(namespace_name_ : namespace_name option) () =
  ({ scheduled_action_name = scheduled_action_name_; namespace_name = namespace_name_ }
    : scheduled_action_association)

let make_restore_table_from_snapshot_response
    ?table_restore_status:(table_restore_status_ : table_restore_status option) () =
  ({ table_restore_status = table_restore_status_ } : restore_table_from_snapshot_response)

let make_restore_table_from_snapshot_request
    ?activate_case_sensitive_identifier:
      (activate_case_sensitive_identifier_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?target_schema_name:(target_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_database_name:(target_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_schema_name:(source_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~new_table_name:(new_table_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_table_name:(source_table_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_database_name:(source_database_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     activate_case_sensitive_identifier = activate_case_sensitive_identifier_;
     new_table_name = new_table_name_;
     target_schema_name = target_schema_name_;
     target_database_name = target_database_name_;
     source_table_name = source_table_name_;
     source_schema_name = source_schema_name_;
     source_database_name = source_database_name_;
     snapshot_name = snapshot_name_;
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
   }
    : restore_table_from_snapshot_request)

let make_restore_table_from_recovery_point_response
    ?table_restore_status:(table_restore_status_ : table_restore_status option) () =
  ({ table_restore_status = table_restore_status_ } : restore_table_from_recovery_point_response)

let make_restore_table_from_recovery_point_request
    ?activate_case_sensitive_identifier:
      (activate_case_sensitive_identifier_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?target_schema_name:(target_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_database_name:(target_database_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source_schema_name:(source_schema_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~new_table_name:(new_table_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_table_name:(source_table_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~source_database_name:(source_database_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     activate_case_sensitive_identifier = activate_case_sensitive_identifier_;
     new_table_name = new_table_name_;
     target_schema_name = target_schema_name_;
     target_database_name = target_database_name_;
     source_table_name = source_table_name_;
     source_schema_name = source_schema_name_;
     source_database_name = source_database_name_;
     recovery_point_id = recovery_point_id_;
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
   }
    : restore_table_from_recovery_point_request)

let make_restore_from_snapshot_response ?namespace:(namespace_ : namespace option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ namespace = namespace_; owner_account = owner_account_; snapshot_name = snapshot_name_ }
    : restore_from_snapshot_response)

let make_restore_from_snapshot_request
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ?manage_admin_password:(manage_admin_password_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_arn:(snapshot_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workgroup_name:(workgroup_name_ : workgroup_name)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
     manage_admin_password = manage_admin_password_;
     owner_account = owner_account_;
     snapshot_arn = snapshot_arn_;
     snapshot_name = snapshot_name_;
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
   }
    : restore_from_snapshot_request)

let make_restore_from_recovery_point_response ?namespace:(namespace_ : namespace option)
    ?recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ namespace = namespace_; recovery_point_id = recovery_point_id_ }
    : restore_from_recovery_point_response)

let make_restore_from_recovery_point_request ~workgroup_name:(workgroup_name_ : workgroup_name)
    ~namespace_name:(namespace_name_ : namespace_name)
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
     recovery_point_id = recovery_point_id_;
   }
    : restore_from_recovery_point_request)

let make_resource_policy ?policy:(policy_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : resource_policy)

let make_reservation_offering ?offering_type:(offering_type_ : offering_type option)
    ?currency_code:(currency_code_ : currency_code option)
    ?hourly_charge:(hourly_charge_ : charge option)
    ?upfront_charge:(upfront_charge_ : charge option) ?duration:(duration_ : duration option)
    ?offering_id:(offering_id_ : offering_id option) () =
  ({
     offering_type = offering_type_;
     currency_code = currency_code_;
     hourly_charge = hourly_charge_;
     upfront_charge = upfront_charge_;
     duration = duration_;
     offering_id = offering_id_;
   }
    : reservation_offering)

let make_reservation ?status:(status_ : status option)
    ?offering:(offering_ : reservation_offering option) ?capacity:(capacity_ : capacity option)
    ?end_date:(end_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_date:(start_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?reservation_arn:(reservation_arn_ : reservation_arn option)
    ?reservation_id:(reservation_id_ : reservation_id option) () =
  ({
     status = status_;
     offering = offering_;
     capacity = capacity_;
     end_date = end_date_;
     start_date = start_date_;
     reservation_arn = reservation_arn_;
     reservation_id = reservation_id_;
   }
    : reservation)

let make_put_resource_policy_response ?resource_policy:(resource_policy_ : resource_policy option)
    () =
  ({ resource_policy = resource_policy_ } : put_resource_policy_response)

let make_put_resource_policy_request ~policy:(policy_ : Smaws_Lib.Smithy_api.Types.string_)
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_request)

let make_list_tracks_response ?next_token:(next_token_ : pagination_token option)
    ?tracks:(tracks_ : track_list option) () =
  ({ next_token = next_token_; tracks = tracks_ } : list_tracks_response)

let make_list_tracks_request ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_tracks_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_association ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option) () =
  ({
     workgroup_name = workgroup_name_;
     custom_domain_name = custom_domain_name_;
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
   }
    : association)

let make_list_custom_domain_associations_response
    ?associations:(associations_ : association_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ associations = associations_; next_token = next_token_ }
    : list_custom_domain_associations_response)

let make_list_custom_domain_associations_request
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_name = custom_domain_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_custom_domain_associations_request)

let make_get_track_response ?track:(track_ : serverless_track option) () =
  ({ track = track_ } : get_track_response)

let make_get_track_request ~track_name:(track_name_ : track_name) () =
  ({ track_name = track_name_ } : get_track_request)

let make_get_resource_policy_response ?resource_policy:(resource_policy_ : resource_policy option)
    () =
  ({ resource_policy = resource_policy_ } : get_resource_policy_response)

let make_get_resource_policy_request
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_get_identity_center_auth_token_response
    ?expiration_time:(expiration_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?token:(token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ expiration_time = expiration_time_; token = token_ } : get_identity_center_auth_token_response)

let make_get_identity_center_auth_token_request
    ~workgroup_names:(workgroup_names_ : workgroup_name_list) () =
  ({ workgroup_names = workgroup_names_ } : get_identity_center_auth_token_request)

let make_get_custom_domain_association_response
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option) () =
  ({
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     workgroup_name = workgroup_name_;
     custom_domain_name = custom_domain_name_;
   }
    : get_custom_domain_association_response)

let make_get_custom_domain_association_request ~workgroup_name:(workgroup_name_ : workgroup_name)
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name) () =
  ({ workgroup_name = workgroup_name_; custom_domain_name = custom_domain_name_ }
    : get_custom_domain_association_request)

let make_get_credentials_response
    ?next_refresh_time:(next_refresh_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?expiration:(expiration_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?db_password:(db_password_ : db_password option) ?db_user:(db_user_ : db_user option) () =
  ({
     next_refresh_time = next_refresh_time_;
     expiration = expiration_;
     db_password = db_password_;
     db_user = db_user_;
   }
    : get_credentials_response)

let make_get_credentials_request
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?duration_seconds:(duration_seconds_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?db_name:(db_name_ : db_name option) () =
  ({
     custom_domain_name = custom_domain_name_;
     workgroup_name = workgroup_name_;
     duration_seconds = duration_seconds_;
     db_name = db_name_;
   }
    : get_credentials_request)

let make_delete_resource_policy_response () = (() : unit)

let make_delete_resource_policy_request
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_custom_domain_association_response () = (() : unit)

let make_delete_custom_domain_association_request
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({ custom_domain_name = custom_domain_name_; workgroup_name = workgroup_name_ }
    : delete_custom_domain_association_request)

let make_create_custom_domain_association_response
    ?custom_domain_certificate_expiry_time:
      (custom_domain_certificate_expiry_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?custom_domain_name:(custom_domain_name_ : custom_domain_name option) () =
  ({
     custom_domain_certificate_expiry_time = custom_domain_certificate_expiry_time_;
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     workgroup_name = workgroup_name_;
     custom_domain_name = custom_domain_name_;
   }
    : create_custom_domain_association_response)

let make_create_custom_domain_association_request
    ~custom_domain_certificate_arn:
      (custom_domain_certificate_arn_ : custom_domain_certificate_arn_string)
    ~custom_domain_name:(custom_domain_name_ : custom_domain_name)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({
     custom_domain_certificate_arn = custom_domain_certificate_arn_;
     custom_domain_name = custom_domain_name_;
     workgroup_name = workgroup_name_;
   }
    : create_custom_domain_association_request)

let make_recovery_point ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : workgroup_name option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?total_size_in_mega_bytes:(total_size_in_mega_bytes_ : Smaws_Lib.Smithy_api.Types.double option)
    ?recovery_point_create_time:
      (recovery_point_create_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     namespace_arn = namespace_arn_;
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
     total_size_in_mega_bytes = total_size_in_mega_bytes_;
     recovery_point_create_time = recovery_point_create_time_;
     recovery_point_id = recovery_point_id_;
   }
    : recovery_point)

let make_managed_workgroup_list_item
    ?creation_date:(creation_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : managed_workgroup_status option)
    ?source_arn:(source_arn_ : source_arn option)
    ?managed_workgroup_id:(managed_workgroup_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?managed_workgroup_name:(managed_workgroup_name_ : managed_workgroup_name option) () =
  ({
     creation_date = creation_date_;
     status = status_;
     source_arn = source_arn_;
     managed_workgroup_id = managed_workgroup_id_;
     managed_workgroup_name = managed_workgroup_name_;
   }
    : managed_workgroup_list_item)

let make_list_workgroups_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workgroups:(workgroups_ : workgroup_list) () =
  ({ workgroups = workgroups_; next_token = next_token_ } : list_workgroups_response)

let make_list_workgroups_request ?owner_account:(owner_account_ : owner_account option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ owner_account = owner_account_; max_results = max_results_; next_token = next_token_ }
    : list_workgroups_request)

let make_list_usage_limits_response ?next_token:(next_token_ : pagination_token option)
    ?usage_limits:(usage_limits_ : usage_limits option) () =
  ({ next_token = next_token_; usage_limits = usage_limits_ } : list_usage_limits_response)

let make_list_usage_limits_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option)
    ?usage_type:(usage_type_ : usage_limit_usage_type option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     usage_type = usage_type_;
     resource_arn = resource_arn_;
   }
    : list_usage_limits_request)

let make_list_table_restore_status_response
    ?table_restore_statuses:(table_restore_statuses_ : table_restore_status_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ table_restore_statuses = table_restore_statuses_; next_token = next_token_ }
    : list_table_restore_status_response)

let make_list_table_restore_status_request
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     workgroup_name = workgroup_name_;
     namespace_name = namespace_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_table_restore_status_request)

let make_list_snapshots_response ?snapshots:(snapshots_ : snapshot_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ snapshots = snapshots_; next_token = next_token_ } : list_snapshots_response)

let make_list_snapshots_request ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     owner_account = owner_account_;
     namespace_arn = namespace_arn_;
     namespace_name = namespace_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_snapshots_request)

let make_list_snapshot_copy_configurations_response
    ?next_token:(next_token_ : pagination_token option)
    ~snapshot_copy_configurations:(snapshot_copy_configurations_ : snapshot_copy_configurations) ()
    =
  ({ snapshot_copy_configurations = snapshot_copy_configurations_; next_token = next_token_ }
    : list_snapshot_copy_configurations_response)

let make_list_snapshot_copy_configurations_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option)
    ?namespace_name:(namespace_name_ : namespace_name option) () =
  ({ max_results = max_results_; next_token = next_token_; namespace_name = namespace_name_ }
    : list_snapshot_copy_configurations_request)

let make_list_scheduled_actions_response
    ?scheduled_actions:(scheduled_actions_ : scheduled_actions_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ scheduled_actions = scheduled_actions_; next_token = next_token_ }
    : list_scheduled_actions_response)

let make_list_scheduled_actions_request ?namespace_name:(namespace_name_ : namespace_name option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ namespace_name = namespace_name_; max_results = max_results_; next_token = next_token_ }
    : list_scheduled_actions_request)

let make_list_reservations_response ?next_token:(next_token_ : pagination_token option)
    ~reservations_list:(reservations_list_ : reservations_list) () =
  ({ next_token = next_token_; reservations_list = reservations_list_ }
    : list_reservations_response)

let make_list_reservations_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_reservations_request)

let make_list_reservation_offerings_response ?next_token:(next_token_ : pagination_token option)
    ~reservation_offerings_list:(reservation_offerings_list_ : reservation_offerings_list) () =
  ({ next_token = next_token_; reservation_offerings_list = reservation_offerings_list_ }
    : list_reservation_offerings_response)

let make_list_reservation_offerings_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_reservation_offerings_request)

let make_list_recovery_points_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recovery_points:(recovery_points_ : recovery_point_list option) () =
  ({ next_token = next_token_; recovery_points = recovery_points_ } : list_recovery_points_response)

let make_list_recovery_points_request
    ?namespace_arn:(namespace_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     namespace_arn = namespace_arn_;
     namespace_name = namespace_name_;
     end_time = end_time_;
     start_time = start_time_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_recovery_points_request)

let make_list_namespaces_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~namespaces:(namespaces_ : namespace_list) () =
  ({ namespaces = namespaces_; next_token = next_token_ } : list_namespaces_response)

let make_list_namespaces_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_namespaces_request)

let make_list_managed_workgroups_response
    ?managed_workgroups:(managed_workgroups_ : managed_workgroups option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ managed_workgroups = managed_workgroups_; next_token = next_token_ }
    : list_managed_workgroups_response)

let make_list_managed_workgroups_request
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : pagination_token option)
    ?source_arn:(source_arn_ : source_arn option) () =
  ({ max_results = max_results_; next_token = next_token_; source_arn = source_arn_ }
    : list_managed_workgroups_request)

let make_list_endpoint_access_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~endpoints:(endpoints_ : endpoint_access_list) () =
  ({ endpoints = endpoints_; next_token = next_token_ } : list_endpoint_access_response)

let make_list_endpoint_access_request ?owner_account:(owner_account_ : owner_account option)
    ?vpc_id:(vpc_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     owner_account = owner_account_;
     vpc_id = vpc_id_;
     workgroup_name = workgroup_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_endpoint_access_request)

let make_get_workgroup_response ~workgroup:(workgroup_ : workgroup) () =
  ({ workgroup = workgroup_ } : get_workgroup_response)

let make_get_workgroup_request ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({ workgroup_name = workgroup_name_ } : get_workgroup_request)

let make_get_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : get_usage_limit_response)

let make_get_usage_limit_request
    ~usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ usage_limit_id = usage_limit_id_ } : get_usage_limit_request)

let make_get_table_restore_status_response
    ?table_restore_status:(table_restore_status_ : table_restore_status option) () =
  ({ table_restore_status = table_restore_status_ } : get_table_restore_status_response)

let make_get_table_restore_status_request
    ~table_restore_request_id:(table_restore_request_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ table_restore_request_id = table_restore_request_id_ } : get_table_restore_status_request)

let make_get_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : get_snapshot_response)

let make_get_snapshot_request
    ?snapshot_arn:(snapshot_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?owner_account:(owner_account_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ snapshot_arn = snapshot_arn_; owner_account = owner_account_; snapshot_name = snapshot_name_ }
    : get_snapshot_request)

let make_get_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : get_scheduled_action_response)

let make_get_scheduled_action_request
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({ scheduled_action_name = scheduled_action_name_ } : get_scheduled_action_request)

let make_get_reservation_response ~reservation:(reservation_ : reservation) () =
  ({ reservation = reservation_ } : get_reservation_response)

let make_get_reservation_request ~reservation_id:(reservation_id_ : reservation_id) () =
  ({ reservation_id = reservation_id_ } : get_reservation_request)

let make_get_reservation_offering_response
    ~reservation_offering:(reservation_offering_ : reservation_offering) () =
  ({ reservation_offering = reservation_offering_ } : get_reservation_offering_response)

let make_get_reservation_offering_request ~offering_id:(offering_id_ : offering_id) () =
  ({ offering_id = offering_id_ } : get_reservation_offering_request)

let make_get_recovery_point_response ?recovery_point:(recovery_point_ : recovery_point option) () =
  ({ recovery_point = recovery_point_ } : get_recovery_point_response)

let make_get_recovery_point_request
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ recovery_point_id = recovery_point_id_ } : get_recovery_point_request)

let make_get_namespace_response ~namespace:(namespace_ : namespace) () =
  ({ namespace = namespace_ } : get_namespace_response)

let make_get_namespace_request ~namespace_name:(namespace_name_ : namespace_name) () =
  ({ namespace_name = namespace_name_ } : get_namespace_request)

let make_get_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : get_endpoint_access_response)

let make_get_endpoint_access_request
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ endpoint_name = endpoint_name_ } : get_endpoint_access_request)

let make_delete_workgroup_response ~workgroup:(workgroup_ : workgroup) () =
  ({ workgroup = workgroup_ } : delete_workgroup_response)

let make_delete_workgroup_request ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({ workgroup_name = workgroup_name_ } : delete_workgroup_request)

let make_delete_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : delete_usage_limit_response)

let make_delete_usage_limit_request
    ~usage_limit_id:(usage_limit_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ usage_limit_id = usage_limit_id_ } : delete_usage_limit_request)

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

let make_delete_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : delete_scheduled_action_response)

let make_delete_scheduled_action_request
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({ scheduled_action_name = scheduled_action_name_ } : delete_scheduled_action_request)

let make_delete_namespace_response ~namespace:(namespace_ : namespace) () =
  ({ namespace = namespace_ } : delete_namespace_response)

let make_delete_namespace_request
    ?final_snapshot_retention_period:
      (final_snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?final_snapshot_name:(final_snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     final_snapshot_retention_period = final_snapshot_retention_period_;
     final_snapshot_name = final_snapshot_name_;
     namespace_name = namespace_name_;
   }
    : delete_namespace_request)

let make_delete_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : delete_endpoint_access_response)

let make_delete_endpoint_access_request
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ endpoint_name = endpoint_name_ } : delete_endpoint_access_request)

let make_create_workgroup_response ?workgroup:(workgroup_ : workgroup option) () =
  ({ workgroup = workgroup_ } : create_workgroup_response)

let make_create_workgroup_request
    ?extra_compute_for_automatic_optimization:
      (extra_compute_for_automatic_optimization_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?track_name:(track_name_ : track_name option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?price_performance_target:(price_performance_target_ : performance_target option)
    ?max_capacity:(max_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?port:(port_ : Smaws_Lib.Smithy_api.Types.integer option) ?tags:(tags_ : tag_list option)
    ?publicly_accessible:(publicly_accessible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?config_parameters:(config_parameters_ : config_parameter_list option)
    ?enhanced_vpc_routing:(enhanced_vpc_routing_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?base_capacity:(base_capacity_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~namespace_name:(namespace_name_ : namespace_name)
    ~workgroup_name:(workgroup_name_ : workgroup_name) () =
  ({
     extra_compute_for_automatic_optimization = extra_compute_for_automatic_optimization_;
     track_name = track_name_;
     ip_address_type = ip_address_type_;
     price_performance_target = price_performance_target_;
     max_capacity = max_capacity_;
     port = port_;
     tags = tags_;
     publicly_accessible = publicly_accessible_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
     config_parameters = config_parameters_;
     enhanced_vpc_routing = enhanced_vpc_routing_;
     base_capacity = base_capacity_;
     namespace_name = namespace_name_;
     workgroup_name = workgroup_name_;
   }
    : create_workgroup_request)

let make_create_usage_limit_response ?usage_limit:(usage_limit_ : usage_limit option) () =
  ({ usage_limit = usage_limit_ } : create_usage_limit_response)

let make_create_usage_limit_request
    ?breach_action:(breach_action_ : usage_limit_breach_action option)
    ?period:(period_ : usage_limit_period option)
    ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.long)
    ~usage_type:(usage_type_ : usage_limit_usage_type)
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     breach_action = breach_action_;
     period = period_;
     amount = amount_;
     usage_type = usage_type_;
     resource_arn = resource_arn_;
   }
    : create_usage_limit_request)

let make_create_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : create_snapshot_response)

let make_create_snapshot_request ?tags:(tags_ : tag_list option)
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~namespace_name:(namespace_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     tags = tags_;
     retention_period = retention_period_;
     snapshot_name = snapshot_name_;
     namespace_name = namespace_name_;
   }
    : create_snapshot_request)

let make_create_snapshot_copy_configuration_response
    ~snapshot_copy_configuration:(snapshot_copy_configuration_ : snapshot_copy_configuration) () =
  ({ snapshot_copy_configuration = snapshot_copy_configuration_ }
    : create_snapshot_copy_configuration_response)

let make_create_snapshot_copy_configuration_request
    ?destination_kms_key_id:(destination_kms_key_id_ : kms_key_id option)
    ?snapshot_retention_period:
      (snapshot_retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~destination_region:(destination_region_ : Smaws_Lib.Smithy_api.Types.string_)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     destination_kms_key_id = destination_kms_key_id_;
     snapshot_retention_period = snapshot_retention_period_;
     destination_region = destination_region_;
     namespace_name = namespace_name_;
   }
    : create_snapshot_copy_configuration_request)

let make_create_scheduled_action_response
    ?scheduled_action:(scheduled_action_ : scheduled_action_response option) () =
  ({ scheduled_action = scheduled_action_ } : create_scheduled_action_response)

let make_create_scheduled_action_request
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?scheduled_action_description:
      (scheduled_action_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~namespace_name:(namespace_name_ : namespace_name) ~role_arn:(role_arn_ : iam_role_arn)
    ~schedule:(schedule_ : schedule) ~target_action:(target_action_ : target_action)
    ~scheduled_action_name:(scheduled_action_name_ : scheduled_action_name) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     scheduled_action_description = scheduled_action_description_;
     enabled = enabled_;
     namespace_name = namespace_name_;
     role_arn = role_arn_;
     schedule = schedule_;
     target_action = target_action_;
     scheduled_action_name = scheduled_action_name_;
   }
    : create_scheduled_action_request)

let make_create_reservation_response ?reservation:(reservation_ : reservation option) () =
  ({ reservation = reservation_ } : create_reservation_response)

let make_create_reservation_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~offering_id:(offering_id_ : offering_id) ~capacity:(capacity_ : capacity) () =
  ({ client_token = client_token_; offering_id = offering_id_; capacity = capacity_ }
    : create_reservation_request)

let make_create_namespace_response ?namespace:(namespace_ : namespace option) () =
  ({ namespace = namespace_ } : create_namespace_response)

let make_create_namespace_request
    ?redshift_idc_application_arn:
      (redshift_idc_application_arn_ : redshift_idc_application_arn option)
    ?admin_password_secret_kms_key_id:(admin_password_secret_kms_key_id_ : kms_key_id option)
    ?manage_admin_password:(manage_admin_password_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tags:(tags_ : tag_list option) ?log_exports:(log_exports_ : log_export_list option)
    ?iam_roles:(iam_roles_ : iam_role_arn_list option)
    ?default_iam_role_arn:(default_iam_role_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?kms_key_id:(kms_key_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?db_name:(db_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?admin_user_password:(admin_user_password_ : db_password option)
    ?admin_username:(admin_username_ : db_user option)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({
     redshift_idc_application_arn = redshift_idc_application_arn_;
     admin_password_secret_kms_key_id = admin_password_secret_kms_key_id_;
     manage_admin_password = manage_admin_password_;
     tags = tags_;
     log_exports = log_exports_;
     iam_roles = iam_roles_;
     default_iam_role_arn = default_iam_role_arn_;
     kms_key_id = kms_key_id_;
     db_name = db_name_;
     admin_user_password = admin_user_password_;
     admin_username = admin_username_;
     namespace_name = namespace_name_;
   }
    : create_namespace_request)

let make_create_endpoint_access_response ?endpoint:(endpoint_ : endpoint_access option) () =
  ({ endpoint = endpoint_ } : create_endpoint_access_response)

let make_create_endpoint_access_request ?owner_account:(owner_account_ : owner_account option)
    ?vpc_security_group_ids:(vpc_security_group_ids_ : vpc_security_group_id_list option)
    ~workgroup_name:(workgroup_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~endpoint_name:(endpoint_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     owner_account = owner_account_;
     vpc_security_group_ids = vpc_security_group_ids_;
     workgroup_name = workgroup_name_;
     subnet_ids = subnet_ids_;
     endpoint_name = endpoint_name_;
   }
    : create_endpoint_access_request)

let make_convert_recovery_point_to_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : convert_recovery_point_to_snapshot_response)

let make_convert_recovery_point_to_snapshot_request ?tags:(tags_ : tag_list option)
    ?retention_period:(retention_period_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~snapshot_name:(snapshot_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~recovery_point_id:(recovery_point_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     tags = tags_;
     retention_period = retention_period_;
     snapshot_name = snapshot_name_;
     recovery_point_id = recovery_point_id_;
   }
    : convert_recovery_point_to_snapshot_request)
