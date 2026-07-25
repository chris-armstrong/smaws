open Smaws_Lib.Json.SerializeHelpers
open Types

let request_id_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let ad_assessment_limit_exceeded_exception_to_yojson (x : ad_assessment_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let service_exception_to_yojson (x : service_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let entity_does_not_exist_exception_to_yojson (x : entity_does_not_exist_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let directory_already_shared_exception_to_yojson (x : directory_already_shared_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let client_exception_to_yojson (x : client_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let last_updated_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let created_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let notes_to_yojson = string_to_yojson

let share_status_to_yojson (x : share_status) =
  match x with
  | SHARED -> `String "Shared"
  | PENDING_ACCEPTANCE -> `String "PendingAcceptance"
  | REJECTED -> `String "Rejected"
  | REJECTING -> `String "Rejecting"
  | REJECT_FAILED -> `String "RejectFailed"
  | SHARING -> `String "Sharing"
  | SHARE_FAILED -> `String "ShareFailed"
  | DELETED -> `String "Deleted"
  | DELETING -> `String "Deleting"

let directory_id_to_yojson = string_to_yojson
let customer_id_to_yojson = string_to_yojson

let share_method_to_yojson (x : share_method) =
  match x with ORGANIZATIONS -> `String "ORGANIZATIONS" | HANDSHAKE -> `String "HANDSHAKE"

let shared_directory_to_yojson (x : shared_directory) =
  assoc_to_yojson
    [
      ("OwnerAccountId", option_to_yojson customer_id_to_yojson x.owner_account_id);
      ("OwnerDirectoryId", option_to_yojson directory_id_to_yojson x.owner_directory_id);
      ("ShareMethod", option_to_yojson share_method_to_yojson x.share_method);
      ("SharedAccountId", option_to_yojson customer_id_to_yojson x.shared_account_id);
      ("SharedDirectoryId", option_to_yojson directory_id_to_yojson x.shared_directory_id);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("ShareNotes", option_to_yojson notes_to_yojson x.share_notes);
      ("CreatedDateTime", option_to_yojson created_date_time_to_yojson x.created_date_time);
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
    ]

let accept_shared_directory_result_to_yojson (x : accept_shared_directory_result) =
  assoc_to_yojson
    [ ("SharedDirectory", option_to_yojson shared_directory_to_yojson x.shared_directory) ]

let accept_shared_directory_request_to_yojson (x : accept_shared_directory_request) =
  assoc_to_yojson [ ("SharedDirectoryId", Some (directory_id_to_yojson x.shared_directory_id)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let access_url_to_yojson = string_to_yojson

let ip_route_limit_exceeded_exception_to_yojson (x : ip_route_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let entity_already_exists_exception_to_yojson (x : entity_already_exists_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let directory_unavailable_exception_to_yojson (x : directory_unavailable_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let add_ip_routes_result_to_yojson = unit_to_yojson
let update_security_group_for_directory_controllers_to_yojson = bool_to_yojson
let description_to_yojson = string_to_yojson
let cidr_ipv6_to_yojson = string_to_yojson
let cidr_ip_to_yojson = string_to_yojson

let ip_route_to_yojson (x : ip_route) =
  assoc_to_yojson
    [
      ("CidrIp", option_to_yojson cidr_ip_to_yojson x.cidr_ip);
      ("CidrIpv6", option_to_yojson cidr_ipv6_to_yojson x.cidr_ipv6);
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let ip_routes_to_yojson tree = list_to_yojson ip_route_to_yojson tree

let add_ip_routes_request_to_yojson (x : add_ip_routes_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("IpRoutes", Some (ip_routes_to_yojson x.ip_routes));
      ( "UpdateSecurityGroupForDirectoryControllers",
        option_to_yojson update_security_group_for_directory_controllers_to_yojson
          x.update_security_group_for_directory_controllers );
    ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let region_limit_exceeded_exception_to_yojson (x : region_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let directory_does_not_exist_exception_to_yojson (x : directory_does_not_exist_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let directory_already_in_region_exception_to_yojson (x : directory_already_in_region_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let add_region_result_to_yojson = unit_to_yojson
let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let vpc_id_to_yojson = string_to_yojson

let directory_vpc_settings_to_yojson (x : directory_vpc_settings) =
  assoc_to_yojson
    [
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
    ]

let region_name_to_yojson = string_to_yojson

let add_region_request_to_yojson (x : add_region_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RegionName", Some (region_name_to_yojson x.region_name));
      ("VPCSettings", Some (directory_vpc_settings_to_yojson x.vpc_settings));
    ]

let tag_limit_exceeded_exception_to_yojson (x : tag_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let add_tags_to_resource_result_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let resource_id_to_yojson = string_to_yojson

let add_tags_to_resource_request_to_yojson (x : add_tags_to_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let added_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let additional_regions_to_yojson tree = list_to_yojson region_name_to_yojson tree
let alias_name_to_yojson = string_to_yojson
let assessment_version_to_yojson = string_to_yojson
let assessment_report_type_to_yojson = string_to_yojson
let assessment_instance_id_to_yojson = string_to_yojson
let assessment_instance_ids_to_yojson tree = list_to_yojson assessment_instance_id_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let ip_addr_to_yojson = string_to_yojson
let customer_dns_ips_to_yojson tree = list_to_yojson ip_addr_to_yojson tree
let assessment_status_reason_to_yojson = string_to_yojson
let assessment_status_code_to_yojson = string_to_yojson
let assessment_status_to_yojson = string_to_yojson
let last_update_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let assessment_start_time_to_yojson = timestamp_epoch_seconds_to_yojson
let directory_name_to_yojson = string_to_yojson
let assessment_id_to_yojson = string_to_yojson

let assessment_to_yojson (x : assessment) =
  assoc_to_yojson
    [
      ("AssessmentId", option_to_yojson assessment_id_to_yojson x.assessment_id);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("DnsName", option_to_yojson directory_name_to_yojson x.dns_name);
      ("StartTime", option_to_yojson assessment_start_time_to_yojson x.start_time);
      ( "LastUpdateDateTime",
        option_to_yojson last_update_date_time_to_yojson x.last_update_date_time );
      ("Status", option_to_yojson assessment_status_to_yojson x.status);
      ("StatusCode", option_to_yojson assessment_status_code_to_yojson x.status_code);
      ("StatusReason", option_to_yojson assessment_status_reason_to_yojson x.status_reason);
      ("CustomerDnsIps", option_to_yojson customer_dns_ips_to_yojson x.customer_dns_ips);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ( "SelfManagedInstanceIds",
        option_to_yojson assessment_instance_ids_to_yojson x.self_managed_instance_ids );
      ("ReportType", option_to_yojson assessment_report_type_to_yojson x.report_type);
      ("Version", option_to_yojson assessment_version_to_yojson x.version);
    ]

let assessment_configuration_to_yojson (x : assessment_configuration) =
  assoc_to_yojson
    [
      ("CustomerDnsIps", Some (customer_dns_ips_to_yojson x.customer_dns_ips));
      ("DnsName", Some (directory_name_to_yojson x.dns_name));
      ("VpcSettings", Some (directory_vpc_settings_to_yojson x.vpc_settings));
      ("InstanceIds", Some (assessment_instance_ids_to_yojson x.instance_ids));
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
    ]

let assessment_limit_to_yojson = int_to_yojson
let assessment_validation_time_stamp_to_yojson = timestamp_epoch_seconds_to_yojson
let assessment_validation_status_reason_to_yojson = string_to_yojson
let assessment_validation_status_code_to_yojson = string_to_yojson
let assessment_validation_status_to_yojson = string_to_yojson
let assessment_validation_name_to_yojson = string_to_yojson
let assessment_validation_category_to_yojson = string_to_yojson

let assessment_validation_to_yojson (x : assessment_validation) =
  assoc_to_yojson
    [
      ("Category", option_to_yojson assessment_validation_category_to_yojson x.category);
      ("Name", option_to_yojson assessment_validation_name_to_yojson x.name);
      ("Status", option_to_yojson assessment_validation_status_to_yojson x.status);
      ("StatusCode", option_to_yojson assessment_validation_status_code_to_yojson x.status_code);
      ( "StatusReason",
        option_to_yojson assessment_validation_status_reason_to_yojson x.status_reason );
      ("StartTime", option_to_yojson assessment_validation_time_stamp_to_yojson x.start_time);
      ( "LastUpdateDateTime",
        option_to_yojson assessment_validation_time_stamp_to_yojson x.last_update_date_time );
    ]

let assessment_validations_to_yojson tree = list_to_yojson assessment_validation_to_yojson tree

let assessment_report_to_yojson (x : assessment_report) =
  assoc_to_yojson
    [
      ("DomainControllerIp", option_to_yojson ip_addr_to_yojson x.domain_controller_ip);
      ("Validations", option_to_yojson assessment_validations_to_yojson x.validations);
    ]

let assessment_reports_to_yojson tree = list_to_yojson assessment_report_to_yojson tree

let assessment_summary_to_yojson (x : assessment_summary) =
  assoc_to_yojson
    [
      ("AssessmentId", option_to_yojson assessment_id_to_yojson x.assessment_id);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("DnsName", option_to_yojson directory_name_to_yojson x.dns_name);
      ("StartTime", option_to_yojson assessment_start_time_to_yojson x.start_time);
      ( "LastUpdateDateTime",
        option_to_yojson last_update_date_time_to_yojson x.last_update_date_time );
      ("Status", option_to_yojson assessment_status_to_yojson x.status);
      ("CustomerDnsIps", option_to_yojson customer_dns_ips_to_yojson x.customer_dns_ips);
      ("ReportType", option_to_yojson assessment_report_type_to_yojson x.report_type);
    ]

let assessments_to_yojson tree = list_to_yojson assessment_summary_to_yojson tree
let attribute_value_to_yojson = string_to_yojson
let attribute_name_to_yojson = string_to_yojson

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson attribute_name_to_yojson x.name);
      ("Value", option_to_yojson attribute_value_to_yojson x.value);
    ]

let attributes_to_yojson tree = list_to_yojson attribute_to_yojson tree

let authentication_failed_exception_to_yojson (x : authentication_failed_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let availability_zone_to_yojson = string_to_yojson
let availability_zones_to_yojson tree = list_to_yojson availability_zone_to_yojson tree

let ca_enrollment_policy_status_to_yojson (x : ca_enrollment_policy_status) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | SUCCESS -> `String "Success"
  | FAILED -> `String "Failed"
  | DISABLING -> `String "Disabling"
  | DISABLED -> `String "Disabled"
  | IMPAIRED -> `String "Impaired"

let ca_enrollment_policy_status_reason_to_yojson = string_to_yojson
let cancel_schema_extension_result_to_yojson = unit_to_yojson
let schema_extension_id_to_yojson = string_to_yojson

let cancel_schema_extension_request_to_yojson (x : cancel_schema_extension_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("SchemaExtensionId", Some (schema_extension_id_to_yojson x.schema_extension_id));
    ]

let ocsp_url_to_yojson = string_to_yojson

let client_cert_auth_settings_to_yojson (x : client_cert_auth_settings) =
  assoc_to_yojson [ ("OCSPUrl", option_to_yojson ocsp_url_to_yojson x.ocsp_url) ]

let certificate_type_to_yojson (x : certificate_type) =
  match x with
  | CLIENT_CERT_AUTH -> `String "ClientCertAuth"
  | CLIENT_LDAPS -> `String "ClientLDAPS"

let certificate_expiry_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let certificate_registered_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let certificate_c_n_to_yojson = string_to_yojson
let certificate_state_reason_to_yojson = string_to_yojson

let certificate_state_to_yojson (x : certificate_state) =
  match x with
  | REGISTERING -> `String "Registering"
  | REGISTERED -> `String "Registered"
  | REGISTER_FAILED -> `String "RegisterFailed"
  | DEREGISTERING -> `String "Deregistering"
  | DEREGISTERED -> `String "Deregistered"
  | DEREGISTER_FAILED -> `String "DeregisterFailed"

let certificate_id_to_yojson = string_to_yojson

let certificate_to_yojson (x : certificate) =
  assoc_to_yojson
    [
      ("CertificateId", option_to_yojson certificate_id_to_yojson x.certificate_id);
      ("State", option_to_yojson certificate_state_to_yojson x.state);
      ("StateReason", option_to_yojson certificate_state_reason_to_yojson x.state_reason);
      ("CommonName", option_to_yojson certificate_c_n_to_yojson x.common_name);
      ( "RegisteredDateTime",
        option_to_yojson certificate_registered_date_time_to_yojson x.registered_date_time );
      ("ExpiryDateTime", option_to_yojson certificate_expiry_date_time_to_yojson x.expiry_date_time);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ( "ClientCertAuthSettings",
        option_to_yojson client_cert_auth_settings_to_yojson x.client_cert_auth_settings );
    ]

let certificate_already_exists_exception_to_yojson (x : certificate_already_exists_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let certificate_data_to_yojson = string_to_yojson

let certificate_does_not_exist_exception_to_yojson (x : certificate_does_not_exist_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let certificate_in_use_exception_to_yojson (x : certificate_in_use_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let certificate_info_to_yojson (x : certificate_info) =
  assoc_to_yojson
    [
      ("CertificateId", option_to_yojson certificate_id_to_yojson x.certificate_id);
      ("CommonName", option_to_yojson certificate_c_n_to_yojson x.common_name);
      ("State", option_to_yojson certificate_state_to_yojson x.state);
      ("ExpiryDateTime", option_to_yojson certificate_expiry_date_time_to_yojson x.expiry_date_time);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
    ]

let certificate_limit_exceeded_exception_to_yojson (x : certificate_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let certificates_info_to_yojson tree = list_to_yojson certificate_info_to_yojson tree
let cidr_ips_to_yojson tree = list_to_yojson cidr_ip_to_yojson tree
let cidr_ipv6s_to_yojson tree = list_to_yojson cidr_ipv6_to_yojson tree

let client_authentication_status_to_yojson (x : client_authentication_status) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let client_authentication_type_to_yojson (x : client_authentication_type) =
  match x with
  | SMART_CARD -> `String "SmartCard"
  | SMART_CARD_OR_PASSWORD -> `String "SmartCardOrPassword"

let client_authentication_setting_info_to_yojson (x : client_authentication_setting_info) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson client_authentication_type_to_yojson x.type_);
      ("Status", option_to_yojson client_authentication_status_to_yojson x.status);
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
    ]

let client_authentication_settings_info_to_yojson tree =
  list_to_yojson client_authentication_setting_info_to_yojson tree

let cloud_only_directories_limit_reached_to_yojson = bool_to_yojson
let computer_name_to_yojson = string_to_yojson
let si_d_to_yojson = string_to_yojson

let computer_to_yojson (x : computer) =
  assoc_to_yojson
    [
      ("ComputerId", option_to_yojson si_d_to_yojson x.computer_id);
      ("ComputerName", option_to_yojson computer_name_to_yojson x.computer_name);
      ("ComputerAttributes", option_to_yojson attributes_to_yojson x.computer_attributes);
    ]

let computer_password_to_yojson = string_to_yojson
let replication_scope_to_yojson (x : replication_scope) = match x with Domain -> `String "Domain"
let ipv6_addr_to_yojson = string_to_yojson
let dns_ipv6_addrs_to_yojson tree = list_to_yojson ipv6_addr_to_yojson tree
let dns_ip_addrs_to_yojson tree = list_to_yojson ip_addr_to_yojson tree
let remote_domain_name_to_yojson = string_to_yojson

let conditional_forwarder_to_yojson (x : conditional_forwarder) =
  assoc_to_yojson
    [
      ("RemoteDomainName", option_to_yojson remote_domain_name_to_yojson x.remote_domain_name);
      ("DnsIpAddrs", option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs);
      ("DnsIpv6Addrs", option_to_yojson dns_ipv6_addrs_to_yojson x.dns_ipv6_addrs);
      ("ReplicationScope", option_to_yojson replication_scope_to_yojson x.replication_scope);
    ]

let conditional_forwarders_to_yojson tree = list_to_yojson conditional_forwarder_to_yojson tree

let directory_limit_exceeded_exception_to_yojson (x : directory_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let connect_directory_result_to_yojson (x : connect_directory_result) =
  assoc_to_yojson [ ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id) ]

let network_type_to_yojson (x : network_type) =
  match x with
  | DUAL_STACK -> `String "Dual-stack"
  | IPV4_ONLY -> `String "IPv4"
  | IPV6_ONLY -> `String "IPv6"

let user_name_to_yojson = string_to_yojson

let directory_connect_settings_to_yojson (x : directory_connect_settings) =
  assoc_to_yojson
    [
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("CustomerDnsIps", option_to_yojson dns_ip_addrs_to_yojson x.customer_dns_ips);
      ("CustomerDnsIpsV6", option_to_yojson dns_ipv6_addrs_to_yojson x.customer_dns_ips_v6);
      ("CustomerUserName", Some (user_name_to_yojson x.customer_user_name));
    ]

let directory_size_to_yojson (x : directory_size) =
  match x with SMALL -> `String "Small" | LARGE -> `String "Large"

let connect_password_to_yojson = string_to_yojson
let directory_short_name_to_yojson = string_to_yojson

let connect_directory_request_to_yojson (x : connect_directory_request) =
  assoc_to_yojson
    [
      ("Name", Some (directory_name_to_yojson x.name));
      ("ShortName", option_to_yojson directory_short_name_to_yojson x.short_name);
      ("Password", Some (connect_password_to_yojson x.password));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Size", Some (directory_size_to_yojson x.size));
      ("ConnectSettings", Some (directory_connect_settings_to_yojson x.connect_settings));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let connected_directories_limit_reached_to_yojson = bool_to_yojson

let create_alias_result_to_yojson (x : create_alias_result) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("Alias", option_to_yojson alias_name_to_yojson x.alias);
    ]

let create_alias_request_to_yojson (x : create_alias_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Alias", Some (alias_name_to_yojson x.alias));
    ]

let create_computer_result_to_yojson (x : create_computer_result) =
  assoc_to_yojson [ ("Computer", option_to_yojson computer_to_yojson x.computer) ]

let organizational_unit_d_n_to_yojson = string_to_yojson

let create_computer_request_to_yojson (x : create_computer_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("ComputerName", Some (computer_name_to_yojson x.computer_name));
      ("Password", Some (computer_password_to_yojson x.password));
      ( "OrganizationalUnitDistinguishedName",
        option_to_yojson organizational_unit_d_n_to_yojson x.organizational_unit_distinguished_name
      );
      ("ComputerAttributes", option_to_yojson attributes_to_yojson x.computer_attributes);
    ]

let create_conditional_forwarder_result_to_yojson = unit_to_yojson

let create_conditional_forwarder_request_to_yojson (x : create_conditional_forwarder_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RemoteDomainName", Some (remote_domain_name_to_yojson x.remote_domain_name));
      ("DnsIpAddrs", option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs);
      ("DnsIpv6Addrs", option_to_yojson dns_ipv6_addrs_to_yojson x.dns_ipv6_addrs);
    ]

let create_directory_result_to_yojson (x : create_directory_result) =
  assoc_to_yojson [ ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id) ]

let password_to_yojson = string_to_yojson

let create_directory_request_to_yojson (x : create_directory_request) =
  assoc_to_yojson
    [
      ("Name", Some (directory_name_to_yojson x.name));
      ("ShortName", option_to_yojson directory_short_name_to_yojson x.short_name);
      ("Password", Some (password_to_yojson x.password));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Size", Some (directory_size_to_yojson x.size));
      ("VpcSettings", option_to_yojson directory_vpc_settings_to_yojson x.vpc_settings);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let create_hybrid_ad_result_to_yojson (x : create_hybrid_ad_result) =
  assoc_to_yojson [ ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id) ]

let secret_arn_to_yojson = string_to_yojson

let create_hybrid_ad_request_to_yojson (x : create_hybrid_ad_request) =
  assoc_to_yojson
    [
      ("SecretArn", Some (secret_arn_to_yojson x.secret_arn));
      ("AssessmentId", Some (assessment_id_to_yojson x.assessment_id));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let insufficient_permissions_exception_to_yojson (x : insufficient_permissions_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let create_log_subscription_result_to_yojson = unit_to_yojson
let log_group_name_to_yojson = string_to_yojson

let create_log_subscription_request_to_yojson (x : create_log_subscription_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("LogGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let create_microsoft_ad_result_to_yojson (x : create_microsoft_ad_result) =
  assoc_to_yojson [ ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id) ]

let directory_edition_to_yojson (x : directory_edition) =
  match x with
  | ENTERPRISE -> `String "Enterprise"
  | STANDARD -> `String "Standard"
  | HYBRID -> `String "Hybrid"

let create_microsoft_ad_request_to_yojson (x : create_microsoft_ad_request) =
  assoc_to_yojson
    [
      ("Name", Some (directory_name_to_yojson x.name));
      ("ShortName", option_to_yojson directory_short_name_to_yojson x.short_name);
      ("Password", Some (password_to_yojson x.password));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("VpcSettings", Some (directory_vpc_settings_to_yojson x.vpc_settings));
      ("Edition", option_to_yojson directory_edition_to_yojson x.edition);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let snapshot_limit_exceeded_exception_to_yojson (x : snapshot_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let snapshot_id_to_yojson = string_to_yojson

let create_snapshot_result_to_yojson (x : create_snapshot_result) =
  assoc_to_yojson [ ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id) ]

let snapshot_name_to_yojson = string_to_yojson

let create_snapshot_request_to_yojson (x : create_snapshot_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Name", option_to_yojson snapshot_name_to_yojson x.name);
    ]

let create_snapshot_before_schema_extension_to_yojson = bool_to_yojson
let create_snapshot_before_update_to_yojson = bool_to_yojson
let trust_id_to_yojson = string_to_yojson

let create_trust_result_to_yojson (x : create_trust_result) =
  assoc_to_yojson [ ("TrustId", option_to_yojson trust_id_to_yojson x.trust_id) ]

let selective_auth_to_yojson (x : selective_auth) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let trust_type_to_yojson (x : trust_type) =
  match x with FOREST -> `String "Forest" | EXTERNAL -> `String "External"

let trust_direction_to_yojson (x : trust_direction) =
  match x with
  | ONE_WAY_OUTGOING -> `String "One-Way: Outgoing"
  | ONE_WAY_INCOMING -> `String "One-Way: Incoming"
  | TWO_WAY -> `String "Two-Way"

let trust_password_to_yojson = string_to_yojson

let create_trust_request_to_yojson (x : create_trust_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RemoteDomainName", Some (remote_domain_name_to_yojson x.remote_domain_name));
      ("TrustPassword", Some (trust_password_to_yojson x.trust_password));
      ("TrustDirection", Some (trust_direction_to_yojson x.trust_direction));
      ("TrustType", option_to_yojson trust_type_to_yojson x.trust_type);
      ( "ConditionalForwarderIpAddrs",
        option_to_yojson dns_ip_addrs_to_yojson x.conditional_forwarder_ip_addrs );
      ( "ConditionalForwarderIpv6Addrs",
        option_to_yojson dns_ipv6_addrs_to_yojson x.conditional_forwarder_ipv6_addrs );
      ("SelectiveAuth", option_to_yojson selective_auth_to_yojson x.selective_auth);
    ]

let customer_user_name_to_yojson = string_to_yojson

let data_access_status_to_yojson (x : data_access_status) =
  match x with
  | DISABLED -> `String "Disabled"
  | DISABLING -> `String "Disabling"
  | ENABLED -> `String "Enabled"
  | ENABLING -> `String "Enabling"
  | FAILED -> `String "Failed"

let delete_ad_assessment_result_to_yojson (x : delete_ad_assessment_result) =
  assoc_to_yojson [ ("AssessmentId", option_to_yojson assessment_id_to_yojson x.assessment_id) ]

let delete_ad_assessment_request_to_yojson (x : delete_ad_assessment_request) =
  assoc_to_yojson [ ("AssessmentId", Some (assessment_id_to_yojson x.assessment_id)) ]

let delete_associated_conditional_forwarder_to_yojson = bool_to_yojson
let delete_conditional_forwarder_result_to_yojson = unit_to_yojson

let delete_conditional_forwarder_request_to_yojson (x : delete_conditional_forwarder_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RemoteDomainName", Some (remote_domain_name_to_yojson x.remote_domain_name));
    ]

let delete_directory_result_to_yojson (x : delete_directory_result) =
  assoc_to_yojson [ ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id) ]

let delete_directory_request_to_yojson (x : delete_directory_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let delete_log_subscription_result_to_yojson = unit_to_yojson

let delete_log_subscription_request_to_yojson (x : delete_log_subscription_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let delete_snapshot_result_to_yojson (x : delete_snapshot_result) =
  assoc_to_yojson [ ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id) ]

let delete_snapshot_request_to_yojson (x : delete_snapshot_request) =
  assoc_to_yojson [ ("SnapshotId", Some (snapshot_id_to_yojson x.snapshot_id)) ]

let delete_trust_result_to_yojson (x : delete_trust_result) =
  assoc_to_yojson [ ("TrustId", option_to_yojson trust_id_to_yojson x.trust_id) ]

let delete_trust_request_to_yojson (x : delete_trust_request) =
  assoc_to_yojson
    [
      ("TrustId", Some (trust_id_to_yojson x.trust_id));
      ( "DeleteAssociatedConditionalForwarder",
        option_to_yojson delete_associated_conditional_forwarder_to_yojson
          x.delete_associated_conditional_forwarder );
    ]

let deregister_certificate_result_to_yojson = unit_to_yojson

let deregister_certificate_request_to_yojson (x : deregister_certificate_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("CertificateId", Some (certificate_id_to_yojson x.certificate_id));
    ]

let deregister_event_topic_result_to_yojson = unit_to_yojson
let topic_name_to_yojson = string_to_yojson

let deregister_event_topic_request_to_yojson (x : deregister_event_topic_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("TopicName", Some (topic_name_to_yojson x.topic_name));
    ]

let describe_ad_assessment_result_to_yojson (x : describe_ad_assessment_result) =
  assoc_to_yojson
    [
      ("Assessment", option_to_yojson assessment_to_yojson x.assessment);
      ("AssessmentReports", option_to_yojson assessment_reports_to_yojson x.assessment_reports);
    ]

let describe_ad_assessment_request_to_yojson (x : describe_ad_assessment_request) =
  assoc_to_yojson [ ("AssessmentId", Some (assessment_id_to_yojson x.assessment_id)) ]

let pca_connector_arn_to_yojson = string_to_yojson

let describe_ca_enrollment_policy_result_to_yojson (x : describe_ca_enrollment_policy_result) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("PcaConnectorArn", option_to_yojson pca_connector_arn_to_yojson x.pca_connector_arn);
      ( "CaEnrollmentPolicyStatus",
        option_to_yojson ca_enrollment_policy_status_to_yojson x.ca_enrollment_policy_status );
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
      ( "CaEnrollmentPolicyStatusReason",
        option_to_yojson ca_enrollment_policy_status_reason_to_yojson
          x.ca_enrollment_policy_status_reason );
    ]

let describe_ca_enrollment_policy_request_to_yojson (x : describe_ca_enrollment_policy_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let describe_certificate_result_to_yojson (x : describe_certificate_result) =
  assoc_to_yojson [ ("Certificate", option_to_yojson certificate_to_yojson x.certificate) ]

let describe_certificate_request_to_yojson (x : describe_certificate_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("CertificateId", Some (certificate_id_to_yojson x.certificate_id));
    ]

let next_token_to_yojson = string_to_yojson

let describe_client_authentication_settings_result_to_yojson
    (x : describe_client_authentication_settings_result) =
  assoc_to_yojson
    [
      ( "ClientAuthenticationSettingsInfo",
        option_to_yojson client_authentication_settings_info_to_yojson
          x.client_authentication_settings_info );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let page_limit_to_yojson = int_to_yojson

let describe_client_authentication_settings_request_to_yojson
    (x : describe_client_authentication_settings_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Type", option_to_yojson client_authentication_type_to_yojson x.type_);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
    ]

let describe_conditional_forwarders_result_to_yojson (x : describe_conditional_forwarders_result) =
  assoc_to_yojson
    [
      ( "ConditionalForwarders",
        option_to_yojson conditional_forwarders_to_yojson x.conditional_forwarders );
    ]

let remote_domain_names_to_yojson tree = list_to_yojson remote_domain_name_to_yojson tree

let describe_conditional_forwarders_request_to_yojson (x : describe_conditional_forwarders_request)
    =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RemoteDomainNames", option_to_yojson remote_domain_names_to_yojson x.remote_domain_names);
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let ip_addrs_to_yojson tree = list_to_yojson ip_addr_to_yojson tree

let hybrid_settings_description_to_yojson (x : hybrid_settings_description) =
  assoc_to_yojson
    [
      ("SelfManagedDnsIpAddrs", option_to_yojson ip_addrs_to_yojson x.self_managed_dns_ip_addrs);
      ( "SelfManagedInstanceIds",
        option_to_yojson assessment_instance_ids_to_yojson x.self_managed_instance_ids );
    ]

let os_version_to_yojson (x : os_version) =
  match x with VERSION_2012 -> `String "SERVER_2012" | VERSION_2019 -> `String "SERVER_2019"

let regions_info_to_yojson (x : regions_info) =
  assoc_to_yojson
    [
      ("PrimaryRegion", option_to_yojson region_name_to_yojson x.primary_region);
      ("AdditionalRegions", option_to_yojson additional_regions_to_yojson x.additional_regions);
    ]

let radius_status_to_yojson (x : radius_status) =
  match x with
  | CREATING -> `String "Creating"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"

let use_same_username_to_yojson = bool_to_yojson
let radius_display_label_to_yojson = string_to_yojson

let radius_authentication_protocol_to_yojson (x : radius_authentication_protocol) =
  match x with
  | PAP -> `String "PAP"
  | CHAP -> `String "CHAP"
  | MSCHAPV1 -> `String "MS-CHAPv1"
  | MSCHAPV2 -> `String "MS-CHAPv2"

let radius_shared_secret_to_yojson = string_to_yojson
let radius_retries_to_yojson = int_to_yojson
let radius_timeout_to_yojson = int_to_yojson
let port_number_to_yojson = int_to_yojson
let server_to_yojson = string_to_yojson
let servers_to_yojson tree = list_to_yojson server_to_yojson tree

let radius_settings_to_yojson (x : radius_settings) =
  assoc_to_yojson
    [
      ("RadiusServers", option_to_yojson servers_to_yojson x.radius_servers);
      ("RadiusServersIpv6", option_to_yojson servers_to_yojson x.radius_servers_ipv6);
      ("RadiusPort", option_to_yojson port_number_to_yojson x.radius_port);
      ("RadiusTimeout", option_to_yojson radius_timeout_to_yojson x.radius_timeout);
      ("RadiusRetries", option_to_yojson radius_retries_to_yojson x.radius_retries);
      ("SharedSecret", option_to_yojson radius_shared_secret_to_yojson x.shared_secret);
      ( "AuthenticationProtocol",
        option_to_yojson radius_authentication_protocol_to_yojson x.authentication_protocol );
      ("DisplayLabel", option_to_yojson radius_display_label_to_yojson x.display_label);
      ("UseSameUsername", option_to_yojson use_same_username_to_yojson x.use_same_username);
    ]

let directory_vpc_settings_description_to_yojson (x : directory_vpc_settings_description) =
  assoc_to_yojson
    [
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("SecurityGroupId", option_to_yojson security_group_id_to_yojson x.security_group_id);
      ("AvailabilityZones", option_to_yojson availability_zones_to_yojson x.availability_zones);
    ]

let owner_directory_description_to_yojson (x : owner_directory_description) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("AccountId", option_to_yojson customer_id_to_yojson x.account_id);
      ("DnsIpAddrs", option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs);
      ("DnsIpv6Addrs", option_to_yojson dns_ipv6_addrs_to_yojson x.dns_ipv6_addrs);
      ("VpcSettings", option_to_yojson directory_vpc_settings_description_to_yojson x.vpc_settings);
      ("RadiusSettings", option_to_yojson radius_settings_to_yojson x.radius_settings);
      ("RadiusStatus", option_to_yojson radius_status_to_yojson x.radius_status);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let desired_number_of_domain_controllers_to_yojson = int_to_yojson
let sso_enabled_to_yojson = bool_to_yojson
let stage_reason_to_yojson = string_to_yojson
let ip_v6_addrs_to_yojson tree = list_to_yojson ipv6_addr_to_yojson tree

let directory_connect_settings_description_to_yojson (x : directory_connect_settings_description) =
  assoc_to_yojson
    [
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("CustomerUserName", option_to_yojson user_name_to_yojson x.customer_user_name);
      ("SecurityGroupId", option_to_yojson security_group_id_to_yojson x.security_group_id);
      ("AvailabilityZones", option_to_yojson availability_zones_to_yojson x.availability_zones);
      ("ConnectIps", option_to_yojson ip_addrs_to_yojson x.connect_ips);
      ("ConnectIpsV6", option_to_yojson ip_v6_addrs_to_yojson x.connect_ips_v6);
    ]

let directory_type_to_yojson (x : directory_type) =
  match x with
  | SIMPLE_AD -> `String "SimpleAD"
  | AD_CONNECTOR -> `String "ADConnector"
  | MICROSOFT_AD -> `String "MicrosoftAD"
  | SHARED_MICROSOFT_AD -> `String "SharedMicrosoftAD"

let launch_time_to_yojson = timestamp_epoch_seconds_to_yojson

let directory_stage_to_yojson (x : directory_stage) =
  match x with
  | REQUESTED -> `String "Requested"
  | CREATING -> `String "Creating"
  | CREATED -> `String "Created"
  | ACTIVE -> `String "Active"
  | INOPERABLE -> `String "Inoperable"
  | IMPAIRED -> `String "Impaired"
  | RESTORING -> `String "Restoring"
  | RESTOREFAILED -> `String "RestoreFailed"
  | DELETING -> `String "Deleting"
  | DELETED -> `String "Deleted"
  | FAILED -> `String "Failed"
  | UPDATING -> `String "Updating"

let directory_description_to_yojson (x : directory_description) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("Name", option_to_yojson directory_name_to_yojson x.name);
      ("ShortName", option_to_yojson directory_short_name_to_yojson x.short_name);
      ("Size", option_to_yojson directory_size_to_yojson x.size);
      ("Edition", option_to_yojson directory_edition_to_yojson x.edition);
      ("Alias", option_to_yojson alias_name_to_yojson x.alias);
      ("AccessUrl", option_to_yojson access_url_to_yojson x.access_url);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DnsIpAddrs", option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs);
      ("DnsIpv6Addrs", option_to_yojson dns_ipv6_addrs_to_yojson x.dns_ipv6_addrs);
      ("Stage", option_to_yojson directory_stage_to_yojson x.stage);
      ("ShareStatus", option_to_yojson share_status_to_yojson x.share_status);
      ("ShareMethod", option_to_yojson share_method_to_yojson x.share_method);
      ("ShareNotes", option_to_yojson notes_to_yojson x.share_notes);
      ("LaunchTime", option_to_yojson launch_time_to_yojson x.launch_time);
      ( "StageLastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.stage_last_updated_date_time );
      ("Type", option_to_yojson directory_type_to_yojson x.type_);
      ("VpcSettings", option_to_yojson directory_vpc_settings_description_to_yojson x.vpc_settings);
      ( "ConnectSettings",
        option_to_yojson directory_connect_settings_description_to_yojson x.connect_settings );
      ("RadiusSettings", option_to_yojson radius_settings_to_yojson x.radius_settings);
      ("RadiusStatus", option_to_yojson radius_status_to_yojson x.radius_status);
      ("StageReason", option_to_yojson stage_reason_to_yojson x.stage_reason);
      ("SsoEnabled", option_to_yojson sso_enabled_to_yojson x.sso_enabled);
      ( "DesiredNumberOfDomainControllers",
        option_to_yojson desired_number_of_domain_controllers_to_yojson
          x.desired_number_of_domain_controllers );
      ( "OwnerDirectoryDescription",
        option_to_yojson owner_directory_description_to_yojson x.owner_directory_description );
      ("RegionsInfo", option_to_yojson regions_info_to_yojson x.regions_info);
      ("OsVersion", option_to_yojson os_version_to_yojson x.os_version);
      ("HybridSettings", option_to_yojson hybrid_settings_description_to_yojson x.hybrid_settings);
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
    ]

let directory_descriptions_to_yojson tree = list_to_yojson directory_description_to_yojson tree

let describe_directories_result_to_yojson (x : describe_directories_result) =
  assoc_to_yojson
    [
      ( "DirectoryDescriptions",
        option_to_yojson directory_descriptions_to_yojson x.directory_descriptions );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let limit_to_yojson = int_to_yojson
let directory_ids_to_yojson tree = list_to_yojson directory_id_to_yojson tree

let describe_directories_request_to_yojson (x : describe_directories_request) =
  assoc_to_yojson
    [
      ("DirectoryIds", option_to_yojson directory_ids_to_yojson x.directory_ids);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let describe_directory_data_access_result_to_yojson (x : describe_directory_data_access_result) =
  assoc_to_yojson
    [ ("DataAccessStatus", option_to_yojson data_access_status_to_yojson x.data_access_status) ]

let describe_directory_data_access_request_to_yojson (x : describe_directory_data_access_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let domain_controller_status_reason_to_yojson = string_to_yojson

let domain_controller_status_to_yojson (x : domain_controller_status) =
  match x with
  | CREATING -> `String "Creating"
  | ACTIVE -> `String "Active"
  | IMPAIRED -> `String "Impaired"
  | RESTORING -> `String "Restoring"
  | DELETING -> `String "Deleting"
  | DELETED -> `String "Deleted"
  | FAILED -> `String "Failed"
  | UPDATING -> `String "Updating"

let domain_controller_id_to_yojson = string_to_yojson

let domain_controller_to_yojson (x : domain_controller) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("DomainControllerId", option_to_yojson domain_controller_id_to_yojson x.domain_controller_id);
      ("DnsIpAddr", option_to_yojson ip_addr_to_yojson x.dns_ip_addr);
      ("DnsIpv6Addr", option_to_yojson ipv6_addr_to_yojson x.dns_ipv6_addr);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("Status", option_to_yojson domain_controller_status_to_yojson x.status);
      ("StatusReason", option_to_yojson domain_controller_status_reason_to_yojson x.status_reason);
      ("LaunchTime", option_to_yojson launch_time_to_yojson x.launch_time);
      ( "StatusLastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.status_last_updated_date_time );
    ]

let domain_controllers_to_yojson tree = list_to_yojson domain_controller_to_yojson tree

let describe_domain_controllers_result_to_yojson (x : describe_domain_controllers_result) =
  assoc_to_yojson
    [
      ("DomainControllers", option_to_yojson domain_controllers_to_yojson x.domain_controllers);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let domain_controller_ids_to_yojson tree = list_to_yojson domain_controller_id_to_yojson tree

let describe_domain_controllers_request_to_yojson (x : describe_domain_controllers_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ( "DomainControllerIds",
        option_to_yojson domain_controller_ids_to_yojson x.domain_controller_ids );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let topic_status_to_yojson (x : topic_status) =
  match x with
  | REGISTERED -> `String "Registered"
  | TOPIC_NOT_FOUND -> `String "Topic not found"
  | FAILED -> `String "Failed"
  | DELETED -> `String "Deleted"

let topic_arn_to_yojson = string_to_yojson

let event_topic_to_yojson (x : event_topic) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("TopicName", option_to_yojson topic_name_to_yojson x.topic_name);
      ("TopicArn", option_to_yojson topic_arn_to_yojson x.topic_arn);
      ("CreatedDateTime", option_to_yojson created_date_time_to_yojson x.created_date_time);
      ("Status", option_to_yojson topic_status_to_yojson x.status);
    ]

let event_topics_to_yojson tree = list_to_yojson event_topic_to_yojson tree

let describe_event_topics_result_to_yojson (x : describe_event_topics_result) =
  assoc_to_yojson [ ("EventTopics", option_to_yojson event_topics_to_yojson x.event_topics) ]

let topic_names_to_yojson tree = list_to_yojson topic_name_to_yojson tree

let describe_event_topics_request_to_yojson (x : describe_event_topics_request) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("TopicNames", option_to_yojson topic_names_to_yojson x.topic_names);
    ]

let start_date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let hybrid_update_value_to_yojson (x : hybrid_update_value) =
  assoc_to_yojson
    [
      ("InstanceIds", option_to_yojson assessment_instance_ids_to_yojson x.instance_ids);
      ("DnsIps", option_to_yojson customer_dns_ips_to_yojson x.dns_ips);
    ]

let initiated_by_to_yojson = string_to_yojson
let update_status_reason_to_yojson = string_to_yojson

let update_status_to_yojson (x : update_status) =
  match x with
  | UPDATED -> `String "Updated"
  | UPDATING -> `String "Updating"
  | UPDATE_FAILED -> `String "UpdateFailed"

let hybrid_update_info_entry_to_yojson (x : hybrid_update_info_entry) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson update_status_to_yojson x.status);
      ("StatusReason", option_to_yojson update_status_reason_to_yojson x.status_reason);
      ("InitiatedBy", option_to_yojson initiated_by_to_yojson x.initiated_by);
      ("NewValue", option_to_yojson hybrid_update_value_to_yojson x.new_value);
      ("PreviousValue", option_to_yojson hybrid_update_value_to_yojson x.previous_value);
      ("StartTime", option_to_yojson start_date_time_to_yojson x.start_time);
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
      ("AssessmentId", option_to_yojson assessment_id_to_yojson x.assessment_id);
    ]

let hybrid_update_info_entries_to_yojson tree =
  list_to_yojson hybrid_update_info_entry_to_yojson tree

let hybrid_update_activities_to_yojson (x : hybrid_update_activities) =
  assoc_to_yojson
    [
      ( "SelfManagedInstances",
        option_to_yojson hybrid_update_info_entries_to_yojson x.self_managed_instances );
      ( "HybridAdministratorAccount",
        option_to_yojson hybrid_update_info_entries_to_yojson x.hybrid_administrator_account );
    ]

let describe_hybrid_ad_update_result_to_yojson (x : describe_hybrid_ad_update_result) =
  assoc_to_yojson
    [
      ("UpdateActivities", option_to_yojson hybrid_update_activities_to_yojson x.update_activities);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let hybrid_update_type_to_yojson (x : hybrid_update_type) =
  match x with
  | SELF_MANAGED_INSTANCES -> `String "SelfManagedInstances"
  | HYBRID_ADMINISTRATOR_ACCOUNT -> `String "HybridAdministratorAccount"

let describe_hybrid_ad_update_request_to_yojson (x : describe_hybrid_ad_update_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UpdateType", option_to_yojson hybrid_update_type_to_yojson x.update_type);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ldaps_status_reason_to_yojson = string_to_yojson

let ldaps_status_to_yojson (x : ldaps_status) =
  match x with
  | ENABLING -> `String "Enabling"
  | ENABLED -> `String "Enabled"
  | ENABLE_FAILED -> `String "EnableFailed"
  | DISABLED -> `String "Disabled"

let ldaps_setting_info_to_yojson (x : ldaps_setting_info) =
  assoc_to_yojson
    [
      ("LDAPSStatus", option_to_yojson ldaps_status_to_yojson x.ldaps_status);
      ("LDAPSStatusReason", option_to_yojson ldaps_status_reason_to_yojson x.ldaps_status_reason);
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
    ]

let ldaps_settings_info_to_yojson tree = list_to_yojson ldaps_setting_info_to_yojson tree

let describe_ldaps_settings_result_to_yojson (x : describe_ldaps_settings_result) =
  assoc_to_yojson
    [
      ("LDAPSSettingsInfo", option_to_yojson ldaps_settings_info_to_yojson x.ldaps_settings_info);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ldaps_type_to_yojson (x : ldaps_type) = match x with CLIENT -> `String "Client"

let describe_ldaps_settings_request_to_yojson (x : describe_ldaps_settings_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Type", option_to_yojson ldaps_type_to_yojson x.type_);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
    ]

let state_last_updated_date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let region_type_to_yojson (x : region_type) =
  match x with PRIMARY -> `String "Primary" | ADDITIONAL -> `String "Additional"

let region_description_to_yojson (x : region_description) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ("RegionType", option_to_yojson region_type_to_yojson x.region_type);
      ("Status", option_to_yojson directory_stage_to_yojson x.status);
      ("VpcSettings", option_to_yojson directory_vpc_settings_to_yojson x.vpc_settings);
      ( "DesiredNumberOfDomainControllers",
        option_to_yojson desired_number_of_domain_controllers_to_yojson
          x.desired_number_of_domain_controllers );
      ("LaunchTime", option_to_yojson launch_time_to_yojson x.launch_time);
      ( "StatusLastUpdatedDateTime",
        option_to_yojson state_last_updated_date_time_to_yojson x.status_last_updated_date_time );
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
    ]

let regions_description_to_yojson tree = list_to_yojson region_description_to_yojson tree

let describe_regions_result_to_yojson (x : describe_regions_result) =
  assoc_to_yojson
    [
      ("RegionsDescription", option_to_yojson regions_description_to_yojson x.regions_description);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_regions_request_to_yojson (x : describe_regions_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let directory_configuration_setting_data_type_to_yojson = string_to_yojson

let directory_configuration_setting_last_requested_date_time_to_yojson =
  timestamp_epoch_seconds_to_yojson

let directory_configuration_setting_last_updated_date_time_to_yojson =
  timestamp_epoch_seconds_to_yojson

let directory_configuration_setting_request_status_message_to_yojson = string_to_yojson

let directory_configuration_status_to_yojson (x : directory_configuration_status) =
  match x with
  | REQUESTED -> `String "Requested"
  | UPDATING -> `String "Updating"
  | UPDATED -> `String "Updated"
  | FAILED -> `String "Failed"
  | DEFAULT -> `String "Default"

let directory_configuration_setting_request_detailed_status_to_yojson tree =
  map_to_yojson region_name_to_yojson directory_configuration_status_to_yojson tree

let directory_configuration_setting_value_to_yojson = string_to_yojson
let directory_configuration_setting_allowed_values_to_yojson = string_to_yojson
let directory_configuration_setting_name_to_yojson = string_to_yojson
let directory_configuration_setting_type_to_yojson = string_to_yojson

let setting_entry_to_yojson (x : setting_entry) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson directory_configuration_setting_type_to_yojson x.type_);
      ("Name", option_to_yojson directory_configuration_setting_name_to_yojson x.name);
      ( "AllowedValues",
        option_to_yojson directory_configuration_setting_allowed_values_to_yojson x.allowed_values
      );
      ( "AppliedValue",
        option_to_yojson directory_configuration_setting_value_to_yojson x.applied_value );
      ( "RequestedValue",
        option_to_yojson directory_configuration_setting_value_to_yojson x.requested_value );
      ("RequestStatus", option_to_yojson directory_configuration_status_to_yojson x.request_status);
      ( "RequestDetailedStatus",
        option_to_yojson directory_configuration_setting_request_detailed_status_to_yojson
          x.request_detailed_status );
      ( "RequestStatusMessage",
        option_to_yojson directory_configuration_setting_request_status_message_to_yojson
          x.request_status_message );
      ( "LastUpdatedDateTime",
        option_to_yojson directory_configuration_setting_last_updated_date_time_to_yojson
          x.last_updated_date_time );
      ( "LastRequestedDateTime",
        option_to_yojson directory_configuration_setting_last_requested_date_time_to_yojson
          x.last_requested_date_time );
      ("DataType", option_to_yojson directory_configuration_setting_data_type_to_yojson x.data_type);
    ]

let setting_entries_to_yojson tree = list_to_yojson setting_entry_to_yojson tree

let describe_settings_result_to_yojson (x : describe_settings_result) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("SettingEntries", option_to_yojson setting_entries_to_yojson x.setting_entries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_settings_request_to_yojson (x : describe_settings_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Status", option_to_yojson directory_configuration_status_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let shared_directories_to_yojson tree = list_to_yojson shared_directory_to_yojson tree

let describe_shared_directories_result_to_yojson (x : describe_shared_directories_result) =
  assoc_to_yojson
    [
      ("SharedDirectories", option_to_yojson shared_directories_to_yojson x.shared_directories);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_shared_directories_request_to_yojson (x : describe_shared_directories_request) =
  assoc_to_yojson
    [
      ("OwnerDirectoryId", Some (directory_id_to_yojson x.owner_directory_id));
      ("SharedDirectoryIds", option_to_yojson directory_ids_to_yojson x.shared_directory_ids);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let start_time_to_yojson = timestamp_epoch_seconds_to_yojson

let snapshot_status_to_yojson (x : snapshot_status) =
  match x with
  | CREATING -> `String "Creating"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"

let snapshot_type_to_yojson (x : snapshot_type) =
  match x with AUTO -> `String "Auto" | MANUAL -> `String "Manual"

let snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("Type", option_to_yojson snapshot_type_to_yojson x.type_);
      ("Name", option_to_yojson snapshot_name_to_yojson x.name);
      ("Status", option_to_yojson snapshot_status_to_yojson x.status);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
    ]

let snapshots_to_yojson tree = list_to_yojson snapshot_to_yojson tree

let describe_snapshots_result_to_yojson (x : describe_snapshots_result) =
  assoc_to_yojson
    [
      ("Snapshots", option_to_yojson snapshots_to_yojson x.snapshots);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let snapshot_ids_to_yojson tree = list_to_yojson snapshot_id_to_yojson tree

let describe_snapshots_request_to_yojson (x : describe_snapshots_request) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("SnapshotIds", option_to_yojson snapshot_ids_to_yojson x.snapshot_ids);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let trust_state_reason_to_yojson = string_to_yojson

let trust_state_to_yojson (x : trust_state) =
  match x with
  | CREATING -> `String "Creating"
  | CREATED -> `String "Created"
  | VERIFYING -> `String "Verifying"
  | VERIFY_FAILED -> `String "VerifyFailed"
  | VERIFIED -> `String "Verified"
  | UPDATING -> `String "Updating"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATED -> `String "Updated"
  | DELETING -> `String "Deleting"
  | DELETED -> `String "Deleted"
  | FAILED -> `String "Failed"

let trust_to_yojson (x : trust) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("TrustId", option_to_yojson trust_id_to_yojson x.trust_id);
      ("RemoteDomainName", option_to_yojson remote_domain_name_to_yojson x.remote_domain_name);
      ("TrustType", option_to_yojson trust_type_to_yojson x.trust_type);
      ("TrustDirection", option_to_yojson trust_direction_to_yojson x.trust_direction);
      ("TrustState", option_to_yojson trust_state_to_yojson x.trust_state);
      ("CreatedDateTime", option_to_yojson created_date_time_to_yojson x.created_date_time);
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
      ( "StateLastUpdatedDateTime",
        option_to_yojson state_last_updated_date_time_to_yojson x.state_last_updated_date_time );
      ("TrustStateReason", option_to_yojson trust_state_reason_to_yojson x.trust_state_reason);
      ("SelectiveAuth", option_to_yojson selective_auth_to_yojson x.selective_auth);
    ]

let trusts_to_yojson tree = list_to_yojson trust_to_yojson tree

let describe_trusts_result_to_yojson (x : describe_trusts_result) =
  assoc_to_yojson
    [
      ("Trusts", option_to_yojson trusts_to_yojson x.trusts);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let trust_ids_to_yojson tree = list_to_yojson trust_id_to_yojson tree

let describe_trusts_request_to_yojson (x : describe_trusts_request) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("TrustIds", option_to_yojson trust_ids_to_yojson x.trust_ids);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let os_update_settings_to_yojson (x : os_update_settings) =
  assoc_to_yojson [ ("OSVersion", option_to_yojson os_version_to_yojson x.os_version) ]

let update_value_to_yojson (x : update_value) =
  assoc_to_yojson
    [ ("OSUpdateSettings", option_to_yojson os_update_settings_to_yojson x.os_update_settings) ]

let update_info_entry_to_yojson (x : update_info_entry) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson region_name_to_yojson x.region);
      ("Status", option_to_yojson update_status_to_yojson x.status);
      ("StatusReason", option_to_yojson update_status_reason_to_yojson x.status_reason);
      ("InitiatedBy", option_to_yojson initiated_by_to_yojson x.initiated_by);
      ("NewValue", option_to_yojson update_value_to_yojson x.new_value);
      ("PreviousValue", option_to_yojson update_value_to_yojson x.previous_value);
      ("StartTime", option_to_yojson start_date_time_to_yojson x.start_time);
      ( "LastUpdatedDateTime",
        option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time );
    ]

let update_activities_to_yojson tree = list_to_yojson update_info_entry_to_yojson tree

let describe_update_directory_result_to_yojson (x : describe_update_directory_result) =
  assoc_to_yojson
    [
      ("UpdateActivities", option_to_yojson update_activities_to_yojson x.update_activities);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let update_type_to_yojson (x : update_type) =
  match x with OS -> `String "OS" | NETWORK -> `String "NETWORK" | SIZE -> `String "SIZE"

let describe_update_directory_request_to_yojson (x : describe_update_directory_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UpdateType", Some (update_type_to_yojson x.update_type));
      ("RegionName", option_to_yojson region_name_to_yojson x.region_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let directory_in_desired_state_exception_to_yojson (x : directory_in_desired_state_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let directory_limits_to_yojson (x : directory_limits) =
  assoc_to_yojson
    [
      ("CloudOnlyDirectoriesLimit", option_to_yojson limit_to_yojson x.cloud_only_directories_limit);
      ( "CloudOnlyDirectoriesCurrentCount",
        option_to_yojson limit_to_yojson x.cloud_only_directories_current_count );
      ( "CloudOnlyDirectoriesLimitReached",
        option_to_yojson cloud_only_directories_limit_reached_to_yojson
          x.cloud_only_directories_limit_reached );
      ("CloudOnlyMicrosoftADLimit", option_to_yojson limit_to_yojson x.cloud_only_microsoft_ad_limit);
      ( "CloudOnlyMicrosoftADCurrentCount",
        option_to_yojson limit_to_yojson x.cloud_only_microsoft_ad_current_count );
      ( "CloudOnlyMicrosoftADLimitReached",
        option_to_yojson cloud_only_directories_limit_reached_to_yojson
          x.cloud_only_microsoft_ad_limit_reached );
      ("ConnectedDirectoriesLimit", option_to_yojson limit_to_yojson x.connected_directories_limit);
      ( "ConnectedDirectoriesCurrentCount",
        option_to_yojson limit_to_yojson x.connected_directories_current_count );
      ( "ConnectedDirectoriesLimitReached",
        option_to_yojson connected_directories_limit_reached_to_yojson
          x.connected_directories_limit_reached );
    ]

let directory_not_shared_exception_to_yojson (x : directory_not_shared_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let verify_trust_result_to_yojson (x : verify_trust_result) =
  assoc_to_yojson [ ("TrustId", option_to_yojson trust_id_to_yojson x.trust_id) ]

let verify_trust_request_to_yojson (x : verify_trust_request) =
  assoc_to_yojson [ ("TrustId", Some (trust_id_to_yojson x.trust_id)) ]

let update_trust_result_to_yojson (x : update_trust_result) =
  assoc_to_yojson
    [
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("TrustId", option_to_yojson trust_id_to_yojson x.trust_id);
    ]

let update_trust_request_to_yojson (x : update_trust_request) =
  assoc_to_yojson
    [
      ("TrustId", Some (trust_id_to_yojson x.trust_id));
      ("SelectiveAuth", option_to_yojson selective_auth_to_yojson x.selective_auth);
    ]

let unsupported_settings_exception_to_yojson (x : unsupported_settings_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let incompatible_settings_exception_to_yojson (x : incompatible_settings_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let update_settings_result_to_yojson (x : update_settings_result) =
  assoc_to_yojson [ ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id) ]

let setting_to_yojson (x : setting) =
  assoc_to_yojson
    [
      ("Name", Some (directory_configuration_setting_name_to_yojson x.name));
      ("Value", Some (directory_configuration_setting_value_to_yojson x.value));
    ]

let settings_to_yojson tree = list_to_yojson setting_to_yojson tree

let update_settings_request_to_yojson (x : update_settings_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Settings", Some (settings_to_yojson x.settings));
    ]

let update_radius_result_to_yojson = unit_to_yojson

let update_radius_request_to_yojson (x : update_radius_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RadiusSettings", Some (radius_settings_to_yojson x.radius_settings));
    ]

let domain_controller_limit_exceeded_exception_to_yojson
    (x : domain_controller_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let update_number_of_domain_controllers_result_to_yojson = unit_to_yojson

let update_number_of_domain_controllers_request_to_yojson
    (x : update_number_of_domain_controllers_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("DesiredNumber", Some (desired_number_of_domain_controllers_to_yojson x.desired_number));
    ]

let update_hybrid_ad_result_to_yojson (x : update_hybrid_ad_result) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("AssessmentId", option_to_yojson assessment_id_to_yojson x.assessment_id);
    ]

let hybrid_customer_instances_settings_to_yojson (x : hybrid_customer_instances_settings) =
  assoc_to_yojson
    [
      ("CustomerDnsIps", Some (customer_dns_ips_to_yojson x.customer_dns_ips));
      ("InstanceIds", Some (assessment_instance_ids_to_yojson x.instance_ids));
    ]

let hybrid_administrator_account_update_to_yojson (x : hybrid_administrator_account_update) =
  assoc_to_yojson [ ("SecretArn", Some (secret_arn_to_yojson x.secret_arn)) ]

let update_hybrid_ad_request_to_yojson (x : update_hybrid_ad_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ( "HybridAdministratorAccountUpdate",
        option_to_yojson hybrid_administrator_account_update_to_yojson
          x.hybrid_administrator_account_update );
      ( "SelfManagedInstancesSettings",
        option_to_yojson hybrid_customer_instances_settings_to_yojson
          x.self_managed_instances_settings );
    ]

let update_directory_setup_result_to_yojson = unit_to_yojson

let network_update_settings_to_yojson (x : network_update_settings) =
  assoc_to_yojson
    [
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("CustomerDnsIpsV6", option_to_yojson dns_ipv6_addrs_to_yojson x.customer_dns_ips_v6);
    ]

let directory_size_update_settings_to_yojson (x : directory_size_update_settings) =
  assoc_to_yojson [ ("DirectorySize", option_to_yojson directory_size_to_yojson x.directory_size) ]

let update_directory_setup_request_to_yojson (x : update_directory_setup_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UpdateType", Some (update_type_to_yojson x.update_type));
      ("OSUpdateSettings", option_to_yojson os_update_settings_to_yojson x.os_update_settings);
      ( "DirectorySizeUpdateSettings",
        option_to_yojson directory_size_update_settings_to_yojson x.directory_size_update_settings
      );
      ( "NetworkUpdateSettings",
        option_to_yojson network_update_settings_to_yojson x.network_update_settings );
      ( "CreateSnapshotBeforeUpdate",
        option_to_yojson create_snapshot_before_update_to_yojson x.create_snapshot_before_update );
    ]

let update_conditional_forwarder_result_to_yojson = unit_to_yojson

let update_conditional_forwarder_request_to_yojson (x : update_conditional_forwarder_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RemoteDomainName", Some (remote_domain_name_to_yojson x.remote_domain_name));
      ("DnsIpAddrs", option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs);
      ("DnsIpv6Addrs", option_to_yojson dns_ipv6_addrs_to_yojson x.dns_ipv6_addrs);
    ]

let invalid_target_exception_to_yojson (x : invalid_target_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let unshare_directory_result_to_yojson (x : unshare_directory_result) =
  assoc_to_yojson
    [ ("SharedDirectoryId", option_to_yojson directory_id_to_yojson x.shared_directory_id) ]

let target_type_to_yojson (x : target_type) = match x with ACCOUNT -> `String "ACCOUNT"
let target_id_to_yojson = string_to_yojson

let unshare_target_to_yojson (x : unshare_target) =
  assoc_to_yojson
    [ ("Id", Some (target_id_to_yojson x.id)); ("Type", Some (target_type_to_yojson x.type_)) ]

let unshare_directory_request_to_yojson (x : unshare_directory_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UnshareTarget", Some (unshare_target_to_yojson x.unshare_target));
    ]

let start_schema_extension_result_to_yojson (x : start_schema_extension_result) =
  assoc_to_yojson
    [ ("SchemaExtensionId", option_to_yojson schema_extension_id_to_yojson x.schema_extension_id) ]

let ldif_content_to_yojson = string_to_yojson

let start_schema_extension_request_to_yojson (x : start_schema_extension_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ( "CreateSnapshotBeforeSchemaExtension",
        Some
          (create_snapshot_before_schema_extension_to_yojson
             x.create_snapshot_before_schema_extension) );
      ("LdifContent", Some (ldif_content_to_yojson x.ldif_content));
      ("Description", Some (description_to_yojson x.description));
    ]

let start_ad_assessment_result_to_yojson (x : start_ad_assessment_result) =
  assoc_to_yojson [ ("AssessmentId", option_to_yojson assessment_id_to_yojson x.assessment_id) ]

let start_ad_assessment_request_to_yojson (x : start_ad_assessment_request) =
  assoc_to_yojson
    [
      ( "AssessmentConfiguration",
        option_to_yojson assessment_configuration_to_yojson x.assessment_configuration );
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
    ]

let share_limit_exceeded_exception_to_yojson (x : share_limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let organizations_exception_to_yojson (x : organizations_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let share_directory_result_to_yojson (x : share_directory_result) =
  assoc_to_yojson
    [ ("SharedDirectoryId", option_to_yojson directory_id_to_yojson x.shared_directory_id) ]

let share_target_to_yojson (x : share_target) =
  assoc_to_yojson
    [ ("Id", Some (target_id_to_yojson x.id)); ("Type", Some (target_type_to_yojson x.type_)) ]

let share_directory_request_to_yojson (x : share_directory_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("ShareNotes", option_to_yojson notes_to_yojson x.share_notes);
      ("ShareTarget", Some (share_target_to_yojson x.share_target));
      ("ShareMethod", Some (share_method_to_yojson x.share_method));
    ]

let restore_from_snapshot_result_to_yojson = unit_to_yojson

let restore_from_snapshot_request_to_yojson (x : restore_from_snapshot_request) =
  assoc_to_yojson [ ("SnapshotId", Some (snapshot_id_to_yojson x.snapshot_id)) ]

let user_does_not_exist_exception_to_yojson (x : user_does_not_exist_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let invalid_password_exception_to_yojson (x : invalid_password_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let reset_user_password_result_to_yojson = unit_to_yojson
let user_password_to_yojson = string_to_yojson

let reset_user_password_request_to_yojson (x : reset_user_password_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UserName", Some (customer_user_name_to_yojson x.user_name));
      ("NewPassword", Some (user_password_to_yojson x.new_password));
    ]

let remove_tags_from_resource_result_to_yojson = unit_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let remove_tags_from_resource_request_to_yojson (x : remove_tags_from_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let remove_region_result_to_yojson = unit_to_yojson

let remove_region_request_to_yojson (x : remove_region_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let remove_ip_routes_result_to_yojson = unit_to_yojson

let remove_ip_routes_request_to_yojson (x : remove_ip_routes_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("CidrIps", option_to_yojson cidr_ips_to_yojson x.cidr_ips);
      ("CidrIpv6s", option_to_yojson cidr_ipv6s_to_yojson x.cidr_ipv6s);
    ]

let reject_shared_directory_result_to_yojson (x : reject_shared_directory_result) =
  assoc_to_yojson
    [ ("SharedDirectoryId", option_to_yojson directory_id_to_yojson x.shared_directory_id) ]

let reject_shared_directory_request_to_yojson (x : reject_shared_directory_request) =
  assoc_to_yojson [ ("SharedDirectoryId", Some (directory_id_to_yojson x.shared_directory_id)) ]

let register_event_topic_result_to_yojson = unit_to_yojson

let register_event_topic_request_to_yojson (x : register_event_topic_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("TopicName", Some (topic_name_to_yojson x.topic_name));
    ]

let invalid_certificate_exception_to_yojson (x : invalid_certificate_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let register_certificate_result_to_yojson (x : register_certificate_result) =
  assoc_to_yojson [ ("CertificateId", option_to_yojson certificate_id_to_yojson x.certificate_id) ]

let register_certificate_request_to_yojson (x : register_certificate_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("CertificateData", Some (certificate_data_to_yojson x.certificate_data));
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ( "ClientCertAuthSettings",
        option_to_yojson client_cert_auth_settings_to_yojson x.client_cert_auth_settings );
    ]

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_to_yojson x.resource_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let end_date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let schema_extension_status_reason_to_yojson = string_to_yojson

let schema_extension_status_to_yojson (x : schema_extension_status) =
  match x with
  | INITIALIZING -> `String "Initializing"
  | CREATING_SNAPSHOT -> `String "CreatingSnapshot"
  | UPDATING_SCHEMA -> `String "UpdatingSchema"
  | REPLICATING -> `String "Replicating"
  | CANCEL_IN_PROGRESS -> `String "CancelInProgress"
  | ROLLBACK_IN_PROGRESS -> `String "RollbackInProgress"
  | CANCELLED -> `String "Cancelled"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"

let schema_extension_info_to_yojson (x : schema_extension_info) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("SchemaExtensionId", option_to_yojson schema_extension_id_to_yojson x.schema_extension_id);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "SchemaExtensionStatus",
        option_to_yojson schema_extension_status_to_yojson x.schema_extension_status );
      ( "SchemaExtensionStatusReason",
        option_to_yojson schema_extension_status_reason_to_yojson x.schema_extension_status_reason
      );
      ("StartDateTime", option_to_yojson start_date_time_to_yojson x.start_date_time);
      ("EndDateTime", option_to_yojson end_date_time_to_yojson x.end_date_time);
    ]

let schema_extensions_info_to_yojson tree = list_to_yojson schema_extension_info_to_yojson tree

let list_schema_extensions_result_to_yojson (x : list_schema_extensions_result) =
  assoc_to_yojson
    [
      ( "SchemaExtensionsInfo",
        option_to_yojson schema_extensions_info_to_yojson x.schema_extensions_info );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_schema_extensions_request_to_yojson (x : list_schema_extensions_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let subscription_created_date_time_to_yojson = timestamp_epoch_seconds_to_yojson

let log_subscription_to_yojson (x : log_subscription) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("LogGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ( "SubscriptionCreatedDateTime",
        option_to_yojson subscription_created_date_time_to_yojson x.subscription_created_date_time
      );
    ]

let log_subscriptions_to_yojson tree = list_to_yojson log_subscription_to_yojson tree

let list_log_subscriptions_result_to_yojson (x : list_log_subscriptions_result) =
  assoc_to_yojson
    [
      ("LogSubscriptions", option_to_yojson log_subscriptions_to_yojson x.log_subscriptions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_log_subscriptions_request_to_yojson (x : list_log_subscriptions_request) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let ip_route_status_reason_to_yojson = string_to_yojson

let ip_route_status_msg_to_yojson (x : ip_route_status_msg) =
  match x with
  | ADDING -> `String "Adding"
  | ADDED -> `String "Added"
  | REMOVING -> `String "Removing"
  | REMOVED -> `String "Removed"
  | ADD_FAILED -> `String "AddFailed"
  | REMOVE_FAILED -> `String "RemoveFailed"

let ip_route_info_to_yojson (x : ip_route_info) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("CidrIp", option_to_yojson cidr_ip_to_yojson x.cidr_ip);
      ("CidrIpv6", option_to_yojson cidr_ipv6_to_yojson x.cidr_ipv6);
      ("IpRouteStatusMsg", option_to_yojson ip_route_status_msg_to_yojson x.ip_route_status_msg);
      ("AddedDateTime", option_to_yojson added_date_time_to_yojson x.added_date_time);
      ( "IpRouteStatusReason",
        option_to_yojson ip_route_status_reason_to_yojson x.ip_route_status_reason );
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let ip_routes_info_to_yojson tree = list_to_yojson ip_route_info_to_yojson tree

let list_ip_routes_result_to_yojson (x : list_ip_routes_result) =
  assoc_to_yojson
    [
      ("IpRoutesInfo", option_to_yojson ip_routes_info_to_yojson x.ip_routes_info);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_ip_routes_request_to_yojson (x : list_ip_routes_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let list_certificates_result_to_yojson (x : list_certificates_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("CertificatesInfo", option_to_yojson certificates_info_to_yojson x.certificates_info);
    ]

let list_certificates_request_to_yojson (x : list_certificates_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
    ]

let list_ad_assessments_result_to_yojson (x : list_ad_assessments_result) =
  assoc_to_yojson
    [
      ("Assessments", option_to_yojson assessments_to_yojson x.assessments);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_ad_assessments_request_to_yojson (x : list_ad_assessments_request) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Limit", option_to_yojson assessment_limit_to_yojson x.limit);
    ]

let manual_snapshots_limit_reached_to_yojson = bool_to_yojson

let snapshot_limits_to_yojson (x : snapshot_limits) =
  assoc_to_yojson
    [
      ("ManualSnapshotsLimit", option_to_yojson limit_to_yojson x.manual_snapshots_limit);
      ( "ManualSnapshotsCurrentCount",
        option_to_yojson limit_to_yojson x.manual_snapshots_current_count );
      ( "ManualSnapshotsLimitReached",
        option_to_yojson manual_snapshots_limit_reached_to_yojson x.manual_snapshots_limit_reached
      );
    ]

let get_snapshot_limits_result_to_yojson (x : get_snapshot_limits_result) =
  assoc_to_yojson
    [ ("SnapshotLimits", option_to_yojson snapshot_limits_to_yojson x.snapshot_limits) ]

let get_snapshot_limits_request_to_yojson (x : get_snapshot_limits_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let get_directory_limits_result_to_yojson (x : get_directory_limits_result) =
  assoc_to_yojson
    [ ("DirectoryLimits", option_to_yojson directory_limits_to_yojson x.directory_limits) ]

let get_directory_limits_request_to_yojson = unit_to_yojson
let enable_sso_result_to_yojson = unit_to_yojson

let enable_sso_request_to_yojson (x : enable_sso_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("Password", option_to_yojson connect_password_to_yojson x.password);
    ]

let enable_radius_result_to_yojson = unit_to_yojson

let enable_radius_request_to_yojson (x : enable_radius_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("RadiusSettings", Some (radius_settings_to_yojson x.radius_settings));
    ]

let no_available_certificate_exception_to_yojson (x : no_available_certificate_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let invalid_ldaps_status_exception_to_yojson (x : invalid_ldaps_status_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let enable_ldaps_result_to_yojson = unit_to_yojson

let enable_ldaps_request_to_yojson (x : enable_ldaps_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Type", Some (ldaps_type_to_yojson x.type_));
    ]

let enable_directory_data_access_result_to_yojson = unit_to_yojson

let enable_directory_data_access_request_to_yojson (x : enable_directory_data_access_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let invalid_client_auth_status_exception_to_yojson (x : invalid_client_auth_status_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let enable_client_authentication_result_to_yojson = unit_to_yojson

let enable_client_authentication_request_to_yojson (x : enable_client_authentication_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Type", Some (client_authentication_type_to_yojson x.type_));
    ]

let enable_already_in_progress_exception_to_yojson (x : enable_already_in_progress_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let enable_ca_enrollment_policy_result_to_yojson = unit_to_yojson

let enable_ca_enrollment_policy_request_to_yojson (x : enable_ca_enrollment_policy_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("PcaConnectorArn", Some (pca_connector_arn_to_yojson x.pca_connector_arn));
    ]

let disable_sso_result_to_yojson = unit_to_yojson

let disable_sso_request_to_yojson (x : disable_sso_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("Password", option_to_yojson connect_password_to_yojson x.password);
    ]

let disable_radius_result_to_yojson = unit_to_yojson

let disable_radius_request_to_yojson (x : disable_radius_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let disable_ldaps_result_to_yojson = unit_to_yojson

let disable_ldaps_request_to_yojson (x : disable_ldaps_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Type", Some (ldaps_type_to_yojson x.type_));
    ]

let disable_directory_data_access_result_to_yojson = unit_to_yojson

let disable_directory_data_access_request_to_yojson (x : disable_directory_data_access_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let disable_client_authentication_result_to_yojson = unit_to_yojson

let disable_client_authentication_request_to_yojson (x : disable_client_authentication_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Type", Some (client_authentication_type_to_yojson x.type_));
    ]

let disable_already_in_progress_exception_to_yojson (x : disable_already_in_progress_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let disable_ca_enrollment_policy_result_to_yojson = unit_to_yojson

let disable_ca_enrollment_policy_request_to_yojson (x : disable_ca_enrollment_policy_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]
