open Smaws_Lib.Json.DeserializeHelpers
open Types

let request_id_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson

let ad_assessment_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : ad_assessment_limit_exceeded_exception)

let service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : service_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : invalid_parameter_exception)

let entity_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : entity_does_not_exist_exception)

let directory_already_shared_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : directory_already_shared_exception)

let client_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : client_exception)

let last_updated_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let created_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let notes_of_yojson = string_of_yojson

let share_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Shared" -> SHARED
    | `String "PendingAcceptance" -> PENDING_ACCEPTANCE
    | `String "Rejected" -> REJECTED
    | `String "Rejecting" -> REJECTING
    | `String "RejectFailed" -> REJECT_FAILED
    | `String "Sharing" -> SHARING
    | `String "ShareFailed" -> SHARE_FAILED
    | `String "Deleted" -> DELETED
    | `String "Deleting" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShareStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareStatus")
     : share_status)
    : share_status)

let directory_id_of_yojson = string_of_yojson
let customer_id_of_yojson = string_of_yojson

let share_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "ORGANIZATIONS" -> ORGANIZATIONS
    | `String "HANDSHAKE" -> HANDSHAKE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShareMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareMethod")
     : share_method)
    : share_method)

let shared_directory_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_account_id =
       option_of_yojson (value_for_key customer_id_of_yojson "OwnerAccountId") _list path;
     owner_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "OwnerDirectoryId") _list path;
     share_method = option_of_yojson (value_for_key share_method_of_yojson "ShareMethod") _list path;
     shared_account_id =
       option_of_yojson (value_for_key customer_id_of_yojson "SharedAccountId") _list path;
     shared_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "SharedDirectoryId") _list path;
     share_status = option_of_yojson (value_for_key share_status_of_yojson "ShareStatus") _list path;
     share_notes = option_of_yojson (value_for_key notes_of_yojson "ShareNotes") _list path;
     created_date_time =
       option_of_yojson (value_for_key created_date_time_of_yojson "CreatedDateTime") _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
   }
    : shared_directory)

let accept_shared_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory =
       option_of_yojson (value_for_key shared_directory_of_yojson "SharedDirectory") _list path;
   }
    : accept_shared_directory_result)

let accept_shared_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ shared_directory_id = value_for_key directory_id_of_yojson "SharedDirectoryId" _list path }
    : accept_shared_directory_request)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : access_denied_exception)

let access_url_of_yojson = string_of_yojson

let ip_route_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : ip_route_limit_exceeded_exception)

let entity_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : entity_already_exists_exception)

let directory_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : directory_unavailable_exception)

let add_ip_routes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_security_group_for_directory_controllers_of_yojson = bool_of_yojson
let description_of_yojson = string_of_yojson
let cidr_ipv6_of_yojson = string_of_yojson
let cidr_ip_of_yojson = string_of_yojson

let ip_route_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cidr_ip = option_of_yojson (value_for_key cidr_ip_of_yojson "CidrIp") _list path;
     cidr_ipv6 = option_of_yojson (value_for_key cidr_ipv6_of_yojson "CidrIpv6") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
   }
    : ip_route)

let ip_routes_of_yojson tree path = list_of_yojson ip_route_of_yojson tree path

let add_ip_routes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     ip_routes = value_for_key ip_routes_of_yojson "IpRoutes" _list path;
     update_security_group_for_directory_controllers =
       option_of_yojson
         (value_for_key update_security_group_for_directory_controllers_of_yojson
            "UpdateSecurityGroupForDirectoryControllers")
         _list path;
   }
    : add_ip_routes_request)

let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : unsupported_operation_exception)

let region_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : region_limit_exceeded_exception)

let directory_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : directory_does_not_exist_exception)

let directory_already_in_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : directory_already_in_region_exception)

let add_region_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let subnet_id_of_yojson = string_of_yojson
let subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path
let vpc_id_of_yojson = string_of_yojson

let directory_vpc_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = value_for_key vpc_id_of_yojson "VpcId" _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "SubnetIds" _list path;
   }
    : directory_vpc_settings)

let region_name_of_yojson = string_of_yojson

let add_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     vpc_settings = value_for_key directory_vpc_settings_of_yojson "VPCSettings" _list path;
   }
    : add_region_request)

let tag_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : tag_limit_exceeded_exception)

let add_tags_to_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let resource_id_of_yojson = string_of_yojson

let add_tags_to_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     tags = value_for_key tags_of_yojson "Tags" _list path;
   }
    : add_tags_to_resource_request)

let added_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let additional_regions_of_yojson tree path = list_of_yojson region_name_of_yojson tree path
let alias_name_of_yojson = string_of_yojson
let assessment_version_of_yojson = string_of_yojson
let assessment_report_type_of_yojson = string_of_yojson
let assessment_instance_id_of_yojson = string_of_yojson

let assessment_instance_ids_of_yojson tree path =
  list_of_yojson assessment_instance_id_of_yojson tree path

let security_group_id_of_yojson = string_of_yojson
let security_group_ids_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path
let ip_addr_of_yojson = string_of_yojson
let customer_dns_ips_of_yojson tree path = list_of_yojson ip_addr_of_yojson tree path
let assessment_status_reason_of_yojson = string_of_yojson
let assessment_status_code_of_yojson = string_of_yojson
let assessment_status_of_yojson = string_of_yojson
let last_update_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let assessment_start_time_of_yojson = timestamp_epoch_seconds_of_yojson
let directory_name_of_yojson = string_of_yojson
let assessment_id_of_yojson = string_of_yojson

let assessment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_id =
       option_of_yojson (value_for_key assessment_id_of_yojson "AssessmentId") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     dns_name = option_of_yojson (value_for_key directory_name_of_yojson "DnsName") _list path;
     start_time =
       option_of_yojson (value_for_key assessment_start_time_of_yojson "StartTime") _list path;
     last_update_date_time =
       option_of_yojson
         (value_for_key last_update_date_time_of_yojson "LastUpdateDateTime")
         _list path;
     status = option_of_yojson (value_for_key assessment_status_of_yojson "Status") _list path;
     status_code =
       option_of_yojson (value_for_key assessment_status_code_of_yojson "StatusCode") _list path;
     status_reason =
       option_of_yojson (value_for_key assessment_status_reason_of_yojson "StatusReason") _list path;
     customer_dns_ips =
       option_of_yojson (value_for_key customer_dns_ips_of_yojson "CustomerDnsIps") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     self_managed_instance_ids =
       option_of_yojson
         (value_for_key assessment_instance_ids_of_yojson "SelfManagedInstanceIds")
         _list path;
     report_type =
       option_of_yojson (value_for_key assessment_report_type_of_yojson "ReportType") _list path;
     version = option_of_yojson (value_for_key assessment_version_of_yojson "Version") _list path;
   }
    : assessment)

let assessment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_dns_ips = value_for_key customer_dns_ips_of_yojson "CustomerDnsIps" _list path;
     dns_name = value_for_key directory_name_of_yojson "DnsName" _list path;
     vpc_settings = value_for_key directory_vpc_settings_of_yojson "VpcSettings" _list path;
     instance_ids = value_for_key assessment_instance_ids_of_yojson "InstanceIds" _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
   }
    : assessment_configuration)

let assessment_limit_of_yojson = int_of_yojson
let assessment_validation_time_stamp_of_yojson = timestamp_epoch_seconds_of_yojson
let assessment_validation_status_reason_of_yojson = string_of_yojson
let assessment_validation_status_code_of_yojson = string_of_yojson
let assessment_validation_status_of_yojson = string_of_yojson
let assessment_validation_name_of_yojson = string_of_yojson
let assessment_validation_category_of_yojson = string_of_yojson

let assessment_validation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category =
       option_of_yojson
         (value_for_key assessment_validation_category_of_yojson "Category")
         _list path;
     name = option_of_yojson (value_for_key assessment_validation_name_of_yojson "Name") _list path;
     status =
       option_of_yojson (value_for_key assessment_validation_status_of_yojson "Status") _list path;
     status_code =
       option_of_yojson
         (value_for_key assessment_validation_status_code_of_yojson "StatusCode")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key assessment_validation_status_reason_of_yojson "StatusReason")
         _list path;
     start_time =
       option_of_yojson
         (value_for_key assessment_validation_time_stamp_of_yojson "StartTime")
         _list path;
     last_update_date_time =
       option_of_yojson
         (value_for_key assessment_validation_time_stamp_of_yojson "LastUpdateDateTime")
         _list path;
   }
    : assessment_validation)

let assessment_validations_of_yojson tree path =
  list_of_yojson assessment_validation_of_yojson tree path

let assessment_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_controller_ip =
       option_of_yojson (value_for_key ip_addr_of_yojson "DomainControllerIp") _list path;
     validations =
       option_of_yojson (value_for_key assessment_validations_of_yojson "Validations") _list path;
   }
    : assessment_report)

let assessment_reports_of_yojson tree path = list_of_yojson assessment_report_of_yojson tree path

let assessment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_id =
       option_of_yojson (value_for_key assessment_id_of_yojson "AssessmentId") _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     dns_name = option_of_yojson (value_for_key directory_name_of_yojson "DnsName") _list path;
     start_time =
       option_of_yojson (value_for_key assessment_start_time_of_yojson "StartTime") _list path;
     last_update_date_time =
       option_of_yojson
         (value_for_key last_update_date_time_of_yojson "LastUpdateDateTime")
         _list path;
     status = option_of_yojson (value_for_key assessment_status_of_yojson "Status") _list path;
     customer_dns_ips =
       option_of_yojson (value_for_key customer_dns_ips_of_yojson "CustomerDnsIps") _list path;
     report_type =
       option_of_yojson (value_for_key assessment_report_type_of_yojson "ReportType") _list path;
   }
    : assessment_summary)

let assessments_of_yojson tree path = list_of_yojson assessment_summary_of_yojson tree path
let attribute_value_of_yojson = string_of_yojson
let attribute_name_of_yojson = string_of_yojson

let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key attribute_name_of_yojson "Name") _list path;
     value = option_of_yojson (value_for_key attribute_value_of_yojson "Value") _list path;
   }
    : attribute)

let attributes_of_yojson tree path = list_of_yojson attribute_of_yojson tree path

let authentication_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : authentication_failed_exception)

let availability_zone_of_yojson = string_of_yojson
let availability_zones_of_yojson tree path = list_of_yojson availability_zone_of_yojson tree path

let ca_enrollment_policy_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "InProgress" -> IN_PROGRESS
    | `String "Success" -> SUCCESS
    | `String "Failed" -> FAILED
    | `String "Disabling" -> DISABLING
    | `String "Disabled" -> DISABLED
    | `String "Impaired" -> IMPAIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CaEnrollmentPolicyStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CaEnrollmentPolicyStatus")
     : ca_enrollment_policy_status)
    : ca_enrollment_policy_status)

let ca_enrollment_policy_status_reason_of_yojson = string_of_yojson

let cancel_schema_extension_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let schema_extension_id_of_yojson = string_of_yojson

let cancel_schema_extension_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     schema_extension_id =
       value_for_key schema_extension_id_of_yojson "SchemaExtensionId" _list path;
   }
    : cancel_schema_extension_request)

let ocsp_url_of_yojson = string_of_yojson

let client_cert_auth_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ocsp_url = option_of_yojson (value_for_key ocsp_url_of_yojson "OCSPUrl") _list path }
    : client_cert_auth_settings)

let certificate_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ClientCertAuth" -> CLIENT_CERT_AUTH
    | `String "ClientLDAPS" -> CLIENT_LDAPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType")
     : certificate_type)
    : certificate_type)

let certificate_expiry_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let certificate_registered_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let certificate_c_n_of_yojson = string_of_yojson
let certificate_state_reason_of_yojson = string_of_yojson

let certificate_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Registering" -> REGISTERING
    | `String "Registered" -> REGISTERED
    | `String "RegisterFailed" -> REGISTER_FAILED
    | `String "Deregistering" -> DEREGISTERING
    | `String "Deregistered" -> DEREGISTERED
    | `String "DeregisterFailed" -> DEREGISTER_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateState" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateState")
     : certificate_state)
    : certificate_state)

let certificate_id_of_yojson = string_of_yojson

let certificate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_id =
       option_of_yojson (value_for_key certificate_id_of_yojson "CertificateId") _list path;
     state = option_of_yojson (value_for_key certificate_state_of_yojson "State") _list path;
     state_reason =
       option_of_yojson (value_for_key certificate_state_reason_of_yojson "StateReason") _list path;
     common_name =
       option_of_yojson (value_for_key certificate_c_n_of_yojson "CommonName") _list path;
     registered_date_time =
       option_of_yojson
         (value_for_key certificate_registered_date_time_of_yojson "RegisteredDateTime")
         _list path;
     expiry_date_time =
       option_of_yojson
         (value_for_key certificate_expiry_date_time_of_yojson "ExpiryDateTime")
         _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     client_cert_auth_settings =
       option_of_yojson
         (value_for_key client_cert_auth_settings_of_yojson "ClientCertAuthSettings")
         _list path;
   }
    : certificate)

let certificate_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : certificate_already_exists_exception)

let certificate_data_of_yojson = string_of_yojson

let certificate_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : certificate_does_not_exist_exception)

let certificate_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : certificate_in_use_exception)

let certificate_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_id =
       option_of_yojson (value_for_key certificate_id_of_yojson "CertificateId") _list path;
     common_name =
       option_of_yojson (value_for_key certificate_c_n_of_yojson "CommonName") _list path;
     state = option_of_yojson (value_for_key certificate_state_of_yojson "State") _list path;
     expiry_date_time =
       option_of_yojson
         (value_for_key certificate_expiry_date_time_of_yojson "ExpiryDateTime")
         _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
   }
    : certificate_info)

let certificate_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : certificate_limit_exceeded_exception)

let certificates_info_of_yojson tree path = list_of_yojson certificate_info_of_yojson tree path
let cidr_ips_of_yojson tree path = list_of_yojson cidr_ip_of_yojson tree path
let cidr_ipv6s_of_yojson tree path = list_of_yojson cidr_ipv6_of_yojson tree path

let client_authentication_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Enabled" -> ENABLED
    | `String "Disabled" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ClientAuthenticationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientAuthenticationStatus")
     : client_authentication_status)
    : client_authentication_status)

let client_authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SmartCard" -> SMART_CARD
    | `String "SmartCardOrPassword" -> SMART_CARD_OR_PASSWORD
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ClientAuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientAuthenticationType")
     : client_authentication_type)
    : client_authentication_type)

let client_authentication_setting_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key client_authentication_type_of_yojson "Type") _list path;
     status =
       option_of_yojson (value_for_key client_authentication_status_of_yojson "Status") _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
   }
    : client_authentication_setting_info)

let client_authentication_settings_info_of_yojson tree path =
  list_of_yojson client_authentication_setting_info_of_yojson tree path

let cloud_only_directories_limit_reached_of_yojson = bool_of_yojson
let computer_name_of_yojson = string_of_yojson
let si_d_of_yojson = string_of_yojson

let computer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     computer_id = option_of_yojson (value_for_key si_d_of_yojson "ComputerId") _list path;
     computer_name =
       option_of_yojson (value_for_key computer_name_of_yojson "ComputerName") _list path;
     computer_attributes =
       option_of_yojson (value_for_key attributes_of_yojson "ComputerAttributes") _list path;
   }
    : computer)

let computer_password_of_yojson = string_of_yojson

let replication_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "Domain" -> Domain
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicationScope" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicationScope")
     : replication_scope)
    : replication_scope)

let ipv6_addr_of_yojson = string_of_yojson
let dns_ipv6_addrs_of_yojson tree path = list_of_yojson ipv6_addr_of_yojson tree path
let dns_ip_addrs_of_yojson tree path = list_of_yojson ip_addr_of_yojson tree path
let remote_domain_name_of_yojson = string_of_yojson

let conditional_forwarder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     remote_domain_name =
       option_of_yojson (value_for_key remote_domain_name_of_yojson "RemoteDomainName") _list path;
     dns_ip_addrs = option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs") _list path;
     dns_ipv6_addrs =
       option_of_yojson (value_for_key dns_ipv6_addrs_of_yojson "DnsIpv6Addrs") _list path;
     replication_scope =
       option_of_yojson (value_for_key replication_scope_of_yojson "ReplicationScope") _list path;
   }
    : conditional_forwarder)

let conditional_forwarders_of_yojson tree path =
  list_of_yojson conditional_forwarder_of_yojson tree path

let directory_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : directory_limit_exceeded_exception)

let connect_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : connect_directory_result)

let network_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Dual-stack" -> DUAL_STACK
    | `String "IPv4" -> IPV4_ONLY
    | `String "IPv6" -> IPV6_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkType")
     : network_type)
    : network_type)

let user_name_of_yojson = string_of_yojson

let directory_connect_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = value_for_key vpc_id_of_yojson "VpcId" _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "SubnetIds" _list path;
     customer_dns_ips =
       option_of_yojson (value_for_key dns_ip_addrs_of_yojson "CustomerDnsIps") _list path;
     customer_dns_ips_v6 =
       option_of_yojson (value_for_key dns_ipv6_addrs_of_yojson "CustomerDnsIpsV6") _list path;
     customer_user_name = value_for_key user_name_of_yojson "CustomerUserName" _list path;
   }
    : directory_connect_settings)

let directory_size_of_yojson (tree : t) path =
  ((match tree with
    | `String "Small" -> SMALL
    | `String "Large" -> LARGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectorySize" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectorySize")
     : directory_size)
    : directory_size)

let connect_password_of_yojson = string_of_yojson
let directory_short_name_of_yojson = string_of_yojson

let connect_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key directory_name_of_yojson "Name" _list path;
     short_name =
       option_of_yojson (value_for_key directory_short_name_of_yojson "ShortName") _list path;
     password = value_for_key connect_password_of_yojson "Password" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     size = value_for_key directory_size_of_yojson "Size" _list path;
     connect_settings =
       value_for_key directory_connect_settings_of_yojson "ConnectSettings" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : connect_directory_request)

let connected_directories_limit_reached_of_yojson = bool_of_yojson

let create_alias_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     alias = option_of_yojson (value_for_key alias_name_of_yojson "Alias") _list path;
   }
    : create_alias_result)

let create_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     alias = value_for_key alias_name_of_yojson "Alias" _list path;
   }
    : create_alias_request)

let create_computer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ computer = option_of_yojson (value_for_key computer_of_yojson "Computer") _list path }
    : create_computer_result)

let organizational_unit_d_n_of_yojson = string_of_yojson

let create_computer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     computer_name = value_for_key computer_name_of_yojson "ComputerName" _list path;
     password = value_for_key computer_password_of_yojson "Password" _list path;
     organizational_unit_distinguished_name =
       option_of_yojson
         (value_for_key organizational_unit_d_n_of_yojson "OrganizationalUnitDistinguishedName")
         _list path;
     computer_attributes =
       option_of_yojson (value_for_key attributes_of_yojson "ComputerAttributes") _list path;
   }
    : create_computer_request)

let create_conditional_forwarder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_conditional_forwarder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     remote_domain_name = value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list path;
     dns_ip_addrs = option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs") _list path;
     dns_ipv6_addrs =
       option_of_yojson (value_for_key dns_ipv6_addrs_of_yojson "DnsIpv6Addrs") _list path;
   }
    : create_conditional_forwarder_request)

let create_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : create_directory_result)

let password_of_yojson = string_of_yojson

let create_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key directory_name_of_yojson "Name" _list path;
     short_name =
       option_of_yojson (value_for_key directory_short_name_of_yojson "ShortName") _list path;
     password = value_for_key password_of_yojson "Password" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     size = value_for_key directory_size_of_yojson "Size" _list path;
     vpc_settings =
       option_of_yojson (value_for_key directory_vpc_settings_of_yojson "VpcSettings") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : create_directory_request)

let create_hybrid_ad_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : create_hybrid_ad_result)

let secret_arn_of_yojson = string_of_yojson

let create_hybrid_ad_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_arn = value_for_key secret_arn_of_yojson "SecretArn" _list path;
     assessment_id = value_for_key assessment_id_of_yojson "AssessmentId" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_hybrid_ad_request)

let insufficient_permissions_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : insufficient_permissions_exception)

let create_log_subscription_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let log_group_name_of_yojson = string_of_yojson

let create_log_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "LogGroupName" _list path;
   }
    : create_log_subscription_request)

let create_microsoft_ad_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : create_microsoft_ad_result)

let directory_edition_of_yojson (tree : t) path =
  ((match tree with
    | `String "Enterprise" -> ENTERPRISE
    | `String "Standard" -> STANDARD
    | `String "Hybrid" -> HYBRID
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectoryEdition" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryEdition")
     : directory_edition)
    : directory_edition)

let create_microsoft_ad_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key directory_name_of_yojson "Name" _list path;
     short_name =
       option_of_yojson (value_for_key directory_short_name_of_yojson "ShortName") _list path;
     password = value_for_key password_of_yojson "Password" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     vpc_settings = value_for_key directory_vpc_settings_of_yojson "VpcSettings" _list path;
     edition = option_of_yojson (value_for_key directory_edition_of_yojson "Edition") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : create_microsoft_ad_request)

let snapshot_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : snapshot_limit_exceeded_exception)

let snapshot_id_of_yojson = string_of_yojson

let create_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path }
    : create_snapshot_result)

let snapshot_name_of_yojson = string_of_yojson

let create_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     name = option_of_yojson (value_for_key snapshot_name_of_yojson "Name") _list path;
   }
    : create_snapshot_request)

let create_snapshot_before_schema_extension_of_yojson = bool_of_yojson
let create_snapshot_before_update_of_yojson = bool_of_yojson
let trust_id_of_yojson = string_of_yojson

let create_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trust_id = option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list path }
    : create_trust_result)

let selective_auth_of_yojson (tree : t) path =
  ((match tree with
    | `String "Enabled" -> ENABLED
    | `String "Disabled" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SelectiveAuth" value)
    | _ -> raise (deserialize_wrong_type_error path "SelectiveAuth")
     : selective_auth)
    : selective_auth)

let trust_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Forest" -> FOREST
    | `String "External" -> EXTERNAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrustType" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustType")
     : trust_type)
    : trust_type)

let trust_direction_of_yojson (tree : t) path =
  ((match tree with
    | `String "One-Way: Outgoing" -> ONE_WAY_OUTGOING
    | `String "One-Way: Incoming" -> ONE_WAY_INCOMING
    | `String "Two-Way" -> TWO_WAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrustDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustDirection")
     : trust_direction)
    : trust_direction)

let trust_password_of_yojson = string_of_yojson

let create_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     remote_domain_name = value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list path;
     trust_password = value_for_key trust_password_of_yojson "TrustPassword" _list path;
     trust_direction = value_for_key trust_direction_of_yojson "TrustDirection" _list path;
     trust_type = option_of_yojson (value_for_key trust_type_of_yojson "TrustType") _list path;
     conditional_forwarder_ip_addrs =
       option_of_yojson
         (value_for_key dns_ip_addrs_of_yojson "ConditionalForwarderIpAddrs")
         _list path;
     conditional_forwarder_ipv6_addrs =
       option_of_yojson
         (value_for_key dns_ipv6_addrs_of_yojson "ConditionalForwarderIpv6Addrs")
         _list path;
     selective_auth =
       option_of_yojson (value_for_key selective_auth_of_yojson "SelectiveAuth") _list path;
   }
    : create_trust_request)

let customer_user_name_of_yojson = string_of_yojson

let data_access_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Disabled" -> DISABLED
    | `String "Disabling" -> DISABLING
    | `String "Enabled" -> ENABLED
    | `String "Enabling" -> ENABLING
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataAccessStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataAccessStatus")
     : data_access_status)
    : data_access_status)

let delete_ad_assessment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_id =
       option_of_yojson (value_for_key assessment_id_of_yojson "AssessmentId") _list path;
   }
    : delete_ad_assessment_result)

let delete_ad_assessment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_id = value_for_key assessment_id_of_yojson "AssessmentId" _list path }
    : delete_ad_assessment_request)

let delete_associated_conditional_forwarder_of_yojson = bool_of_yojson

let delete_conditional_forwarder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_conditional_forwarder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     remote_domain_name = value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list path;
   }
    : delete_conditional_forwarder_request)

let delete_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : delete_directory_result)

let delete_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : delete_directory_request)

let delete_log_subscription_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_log_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : delete_log_subscription_request)

let delete_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path }
    : delete_snapshot_result)

let delete_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot_id = value_for_key snapshot_id_of_yojson "SnapshotId" _list path }
    : delete_snapshot_request)

let delete_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trust_id = option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list path }
    : delete_trust_result)

let delete_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trust_id = value_for_key trust_id_of_yojson "TrustId" _list path;
     delete_associated_conditional_forwarder =
       option_of_yojson
         (value_for_key delete_associated_conditional_forwarder_of_yojson
            "DeleteAssociatedConditionalForwarder")
         _list path;
   }
    : delete_trust_request)

let deregister_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deregister_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     certificate_id = value_for_key certificate_id_of_yojson "CertificateId" _list path;
   }
    : deregister_certificate_request)

let deregister_event_topic_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let topic_name_of_yojson = string_of_yojson

let deregister_event_topic_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     topic_name = value_for_key topic_name_of_yojson "TopicName" _list path;
   }
    : deregister_event_topic_request)

let describe_ad_assessment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment = option_of_yojson (value_for_key assessment_of_yojson "Assessment") _list path;
     assessment_reports =
       option_of_yojson (value_for_key assessment_reports_of_yojson "AssessmentReports") _list path;
   }
    : describe_ad_assessment_result)

let describe_ad_assessment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_id = value_for_key assessment_id_of_yojson "AssessmentId" _list path }
    : describe_ad_assessment_request)

let pca_connector_arn_of_yojson = string_of_yojson

let describe_ca_enrollment_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     pca_connector_arn =
       option_of_yojson (value_for_key pca_connector_arn_of_yojson "PcaConnectorArn") _list path;
     ca_enrollment_policy_status =
       option_of_yojson
         (value_for_key ca_enrollment_policy_status_of_yojson "CaEnrollmentPolicyStatus")
         _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
     ca_enrollment_policy_status_reason =
       option_of_yojson
         (value_for_key ca_enrollment_policy_status_reason_of_yojson
            "CaEnrollmentPolicyStatusReason")
         _list path;
   }
    : describe_ca_enrollment_policy_result)

let describe_ca_enrollment_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : describe_ca_enrollment_policy_request)

let describe_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate = option_of_yojson (value_for_key certificate_of_yojson "Certificate") _list path }
    : describe_certificate_result)

let describe_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     certificate_id = value_for_key certificate_id_of_yojson "CertificateId" _list path;
   }
    : describe_certificate_request)

let next_token_of_yojson = string_of_yojson

let describe_client_authentication_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_authentication_settings_info =
       option_of_yojson
         (value_for_key client_authentication_settings_info_of_yojson
            "ClientAuthenticationSettingsInfo")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_client_authentication_settings_result)

let page_limit_of_yojson = int_of_yojson

let describe_client_authentication_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     type_ = option_of_yojson (value_for_key client_authentication_type_of_yojson "Type") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list path;
   }
    : describe_client_authentication_settings_request)

let describe_conditional_forwarders_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     conditional_forwarders =
       option_of_yojson
         (value_for_key conditional_forwarders_of_yojson "ConditionalForwarders")
         _list path;
   }
    : describe_conditional_forwarders_result)

let remote_domain_names_of_yojson tree path = list_of_yojson remote_domain_name_of_yojson tree path

let describe_conditional_forwarders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     remote_domain_names =
       option_of_yojson (value_for_key remote_domain_names_of_yojson "RemoteDomainNames") _list path;
   }
    : describe_conditional_forwarders_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : invalid_next_token_exception)

let ip_addrs_of_yojson tree path = list_of_yojson ip_addr_of_yojson tree path

let hybrid_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     self_managed_dns_ip_addrs =
       option_of_yojson (value_for_key ip_addrs_of_yojson "SelfManagedDnsIpAddrs") _list path;
     self_managed_instance_ids =
       option_of_yojson
         (value_for_key assessment_instance_ids_of_yojson "SelfManagedInstanceIds")
         _list path;
   }
    : hybrid_settings_description)

let os_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVER_2012" -> VERSION_2012
    | `String "SERVER_2019" -> VERSION_2019
    | `String value -> raise (deserialize_unknown_enum_value_error path "OSVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "OSVersion")
     : os_version)
    : os_version)

let regions_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     primary_region =
       option_of_yojson (value_for_key region_name_of_yojson "PrimaryRegion") _list path;
     additional_regions =
       option_of_yojson (value_for_key additional_regions_of_yojson "AdditionalRegions") _list path;
   }
    : regions_info)

let radius_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Creating" -> CREATING
    | `String "Completed" -> COMPLETED
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RadiusStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RadiusStatus")
     : radius_status)
    : radius_status)

let use_same_username_of_yojson = bool_of_yojson
let radius_display_label_of_yojson = string_of_yojson

let radius_authentication_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "PAP" -> PAP
    | `String "CHAP" -> CHAP
    | `String "MS-CHAPv1" -> MSCHAPV1
    | `String "MS-CHAPv2" -> MSCHAPV2
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RadiusAuthenticationProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "RadiusAuthenticationProtocol")
     : radius_authentication_protocol)
    : radius_authentication_protocol)

let radius_shared_secret_of_yojson = string_of_yojson
let radius_retries_of_yojson = int_of_yojson
let radius_timeout_of_yojson = int_of_yojson
let port_number_of_yojson = int_of_yojson
let server_of_yojson = string_of_yojson
let servers_of_yojson tree path = list_of_yojson server_of_yojson tree path

let radius_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     radius_servers = option_of_yojson (value_for_key servers_of_yojson "RadiusServers") _list path;
     radius_servers_ipv6 =
       option_of_yojson (value_for_key servers_of_yojson "RadiusServersIpv6") _list path;
     radius_port = option_of_yojson (value_for_key port_number_of_yojson "RadiusPort") _list path;
     radius_timeout =
       option_of_yojson (value_for_key radius_timeout_of_yojson "RadiusTimeout") _list path;
     radius_retries =
       option_of_yojson (value_for_key radius_retries_of_yojson "RadiusRetries") _list path;
     shared_secret =
       option_of_yojson (value_for_key radius_shared_secret_of_yojson "SharedSecret") _list path;
     authentication_protocol =
       option_of_yojson
         (value_for_key radius_authentication_protocol_of_yojson "AuthenticationProtocol")
         _list path;
     display_label =
       option_of_yojson (value_for_key radius_display_label_of_yojson "DisplayLabel") _list path;
     use_same_username =
       option_of_yojson (value_for_key use_same_username_of_yojson "UseSameUsername") _list path;
   }
    : radius_settings)

let directory_vpc_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     security_group_id =
       option_of_yojson (value_for_key security_group_id_of_yojson "SecurityGroupId") _list path;
     availability_zones =
       option_of_yojson (value_for_key availability_zones_of_yojson "AvailabilityZones") _list path;
   }
    : directory_vpc_settings_description)

let owner_directory_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     account_id = option_of_yojson (value_for_key customer_id_of_yojson "AccountId") _list path;
     dns_ip_addrs = option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs") _list path;
     dns_ipv6_addrs =
       option_of_yojson (value_for_key dns_ipv6_addrs_of_yojson "DnsIpv6Addrs") _list path;
     vpc_settings =
       option_of_yojson
         (value_for_key directory_vpc_settings_description_of_yojson "VpcSettings")
         _list path;
     radius_settings =
       option_of_yojson (value_for_key radius_settings_of_yojson "RadiusSettings") _list path;
     radius_status =
       option_of_yojson (value_for_key radius_status_of_yojson "RadiusStatus") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : owner_directory_description)

let desired_number_of_domain_controllers_of_yojson = int_of_yojson
let sso_enabled_of_yojson = bool_of_yojson
let stage_reason_of_yojson = string_of_yojson
let ip_v6_addrs_of_yojson tree path = list_of_yojson ipv6_addr_of_yojson tree path

let directory_connect_settings_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     customer_user_name =
       option_of_yojson (value_for_key user_name_of_yojson "CustomerUserName") _list path;
     security_group_id =
       option_of_yojson (value_for_key security_group_id_of_yojson "SecurityGroupId") _list path;
     availability_zones =
       option_of_yojson (value_for_key availability_zones_of_yojson "AvailabilityZones") _list path;
     connect_ips = option_of_yojson (value_for_key ip_addrs_of_yojson "ConnectIps") _list path;
     connect_ips_v6 =
       option_of_yojson (value_for_key ip_v6_addrs_of_yojson "ConnectIpsV6") _list path;
   }
    : directory_connect_settings_description)

let directory_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SimpleAD" -> SIMPLE_AD
    | `String "ADConnector" -> AD_CONNECTOR
    | `String "MicrosoftAD" -> MICROSOFT_AD
    | `String "SharedMicrosoftAD" -> SHARED_MICROSOFT_AD
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectoryType" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryType")
     : directory_type)
    : directory_type)

let launch_time_of_yojson = timestamp_epoch_seconds_of_yojson

let directory_stage_of_yojson (tree : t) path =
  ((match tree with
    | `String "Requested" -> REQUESTED
    | `String "Creating" -> CREATING
    | `String "Created" -> CREATED
    | `String "Active" -> ACTIVE
    | `String "Inoperable" -> INOPERABLE
    | `String "Impaired" -> IMPAIRED
    | `String "Restoring" -> RESTORING
    | `String "RestoreFailed" -> RESTOREFAILED
    | `String "Deleting" -> DELETING
    | `String "Deleted" -> DELETED
    | `String "Failed" -> FAILED
    | `String "Updating" -> UPDATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectoryStage" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryStage")
     : directory_stage)
    : directory_stage)

let directory_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     name = option_of_yojson (value_for_key directory_name_of_yojson "Name") _list path;
     short_name =
       option_of_yojson (value_for_key directory_short_name_of_yojson "ShortName") _list path;
     size = option_of_yojson (value_for_key directory_size_of_yojson "Size") _list path;
     edition = option_of_yojson (value_for_key directory_edition_of_yojson "Edition") _list path;
     alias = option_of_yojson (value_for_key alias_name_of_yojson "Alias") _list path;
     access_url = option_of_yojson (value_for_key access_url_of_yojson "AccessUrl") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     dns_ip_addrs = option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs") _list path;
     dns_ipv6_addrs =
       option_of_yojson (value_for_key dns_ipv6_addrs_of_yojson "DnsIpv6Addrs") _list path;
     stage = option_of_yojson (value_for_key directory_stage_of_yojson "Stage") _list path;
     share_status = option_of_yojson (value_for_key share_status_of_yojson "ShareStatus") _list path;
     share_method = option_of_yojson (value_for_key share_method_of_yojson "ShareMethod") _list path;
     share_notes = option_of_yojson (value_for_key notes_of_yojson "ShareNotes") _list path;
     launch_time = option_of_yojson (value_for_key launch_time_of_yojson "LaunchTime") _list path;
     stage_last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "StageLastUpdatedDateTime")
         _list path;
     type_ = option_of_yojson (value_for_key directory_type_of_yojson "Type") _list path;
     vpc_settings =
       option_of_yojson
         (value_for_key directory_vpc_settings_description_of_yojson "VpcSettings")
         _list path;
     connect_settings =
       option_of_yojson
         (value_for_key directory_connect_settings_description_of_yojson "ConnectSettings")
         _list path;
     radius_settings =
       option_of_yojson (value_for_key radius_settings_of_yojson "RadiusSettings") _list path;
     radius_status =
       option_of_yojson (value_for_key radius_status_of_yojson "RadiusStatus") _list path;
     stage_reason = option_of_yojson (value_for_key stage_reason_of_yojson "StageReason") _list path;
     sso_enabled = option_of_yojson (value_for_key sso_enabled_of_yojson "SsoEnabled") _list path;
     desired_number_of_domain_controllers =
       option_of_yojson
         (value_for_key desired_number_of_domain_controllers_of_yojson
            "DesiredNumberOfDomainControllers")
         _list path;
     owner_directory_description =
       option_of_yojson
         (value_for_key owner_directory_description_of_yojson "OwnerDirectoryDescription")
         _list path;
     regions_info = option_of_yojson (value_for_key regions_info_of_yojson "RegionsInfo") _list path;
     os_version = option_of_yojson (value_for_key os_version_of_yojson "OsVersion") _list path;
     hybrid_settings =
       option_of_yojson
         (value_for_key hybrid_settings_description_of_yojson "HybridSettings")
         _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : directory_description)

let directory_descriptions_of_yojson tree path =
  list_of_yojson directory_description_of_yojson tree path

let describe_directories_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_descriptions =
       option_of_yojson
         (value_for_key directory_descriptions_of_yojson "DirectoryDescriptions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_directories_result)

let limit_of_yojson = int_of_yojson
let directory_ids_of_yojson tree path = list_of_yojson directory_id_of_yojson tree path

let describe_directories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_ids =
       option_of_yojson (value_for_key directory_ids_of_yojson "DirectoryIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : describe_directories_request)

let describe_directory_data_access_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_access_status =
       option_of_yojson (value_for_key data_access_status_of_yojson "DataAccessStatus") _list path;
   }
    : describe_directory_data_access_result)

let describe_directory_data_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : describe_directory_data_access_request)

let domain_controller_status_reason_of_yojson = string_of_yojson

let domain_controller_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Creating" -> CREATING
    | `String "Active" -> ACTIVE
    | `String "Impaired" -> IMPAIRED
    | `String "Restoring" -> RESTORING
    | `String "Deleting" -> DELETING
    | `String "Deleted" -> DELETED
    | `String "Failed" -> FAILED
    | `String "Updating" -> UPDATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DomainControllerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainControllerStatus")
     : domain_controller_status)
    : domain_controller_status)

let domain_controller_id_of_yojson = string_of_yojson

let domain_controller_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     domain_controller_id =
       option_of_yojson
         (value_for_key domain_controller_id_of_yojson "DomainControllerId")
         _list path;
     dns_ip_addr = option_of_yojson (value_for_key ip_addr_of_yojson "DnsIpAddr") _list path;
     dns_ipv6_addr = option_of_yojson (value_for_key ipv6_addr_of_yojson "DnsIpv6Addr") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     status =
       option_of_yojson (value_for_key domain_controller_status_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson
         (value_for_key domain_controller_status_reason_of_yojson "StatusReason")
         _list path;
     launch_time = option_of_yojson (value_for_key launch_time_of_yojson "LaunchTime") _list path;
     status_last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "StatusLastUpdatedDateTime")
         _list path;
   }
    : domain_controller)

let domain_controllers_of_yojson tree path = list_of_yojson domain_controller_of_yojson tree path

let describe_domain_controllers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_controllers =
       option_of_yojson (value_for_key domain_controllers_of_yojson "DomainControllers") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_domain_controllers_result)

let domain_controller_ids_of_yojson tree path =
  list_of_yojson domain_controller_id_of_yojson tree path

let describe_domain_controllers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     domain_controller_ids =
       option_of_yojson
         (value_for_key domain_controller_ids_of_yojson "DomainControllerIds")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : describe_domain_controllers_request)

let topic_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Registered" -> REGISTERED
    | `String "Topic not found" -> TOPIC_NOT_FOUND
    | `String "Failed" -> FAILED
    | `String "Deleted" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TopicStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TopicStatus")
     : topic_status)
    : topic_status)

let topic_arn_of_yojson = string_of_yojson

let event_topic_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     topic_name = option_of_yojson (value_for_key topic_name_of_yojson "TopicName") _list path;
     topic_arn = option_of_yojson (value_for_key topic_arn_of_yojson "TopicArn") _list path;
     created_date_time =
       option_of_yojson (value_for_key created_date_time_of_yojson "CreatedDateTime") _list path;
     status = option_of_yojson (value_for_key topic_status_of_yojson "Status") _list path;
   }
    : event_topic)

let event_topics_of_yojson tree path = list_of_yojson event_topic_of_yojson tree path

let describe_event_topics_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_topics = option_of_yojson (value_for_key event_topics_of_yojson "EventTopics") _list path;
   }
    : describe_event_topics_result)

let topic_names_of_yojson tree path = list_of_yojson topic_name_of_yojson tree path

let describe_event_topics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     topic_names = option_of_yojson (value_for_key topic_names_of_yojson "TopicNames") _list path;
   }
    : describe_event_topics_request)

let start_date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let hybrid_update_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_ids =
       option_of_yojson (value_for_key assessment_instance_ids_of_yojson "InstanceIds") _list path;
     dns_ips = option_of_yojson (value_for_key customer_dns_ips_of_yojson "DnsIps") _list path;
   }
    : hybrid_update_value)

let initiated_by_of_yojson = string_of_yojson
let update_status_reason_of_yojson = string_of_yojson

let update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Updated" -> UPDATED
    | `String "Updating" -> UPDATING
    | `String "UpdateFailed" -> UPDATE_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateStatus")
     : update_status)
    : update_status)

let hybrid_update_info_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key update_status_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson (value_for_key update_status_reason_of_yojson "StatusReason") _list path;
     initiated_by = option_of_yojson (value_for_key initiated_by_of_yojson "InitiatedBy") _list path;
     new_value =
       option_of_yojson (value_for_key hybrid_update_value_of_yojson "NewValue") _list path;
     previous_value =
       option_of_yojson (value_for_key hybrid_update_value_of_yojson "PreviousValue") _list path;
     start_time = option_of_yojson (value_for_key start_date_time_of_yojson "StartTime") _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
     assessment_id =
       option_of_yojson (value_for_key assessment_id_of_yojson "AssessmentId") _list path;
   }
    : hybrid_update_info_entry)

let hybrid_update_info_entries_of_yojson tree path =
  list_of_yojson hybrid_update_info_entry_of_yojson tree path

let hybrid_update_activities_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     self_managed_instances =
       option_of_yojson
         (value_for_key hybrid_update_info_entries_of_yojson "SelfManagedInstances")
         _list path;
     hybrid_administrator_account =
       option_of_yojson
         (value_for_key hybrid_update_info_entries_of_yojson "HybridAdministratorAccount")
         _list path;
   }
    : hybrid_update_activities)

let describe_hybrid_ad_update_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_activities =
       option_of_yojson
         (value_for_key hybrid_update_activities_of_yojson "UpdateActivities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_hybrid_ad_update_result)

let hybrid_update_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SelfManagedInstances" -> SELF_MANAGED_INSTANCES
    | `String "HybridAdministratorAccount" -> HYBRID_ADMINISTRATOR_ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "HybridUpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "HybridUpdateType")
     : hybrid_update_type)
    : hybrid_update_type)

let describe_hybrid_ad_update_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     update_type =
       option_of_yojson (value_for_key hybrid_update_type_of_yojson "UpdateType") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_hybrid_ad_update_request)

let ldaps_status_reason_of_yojson = string_of_yojson

let ldaps_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Enabling" -> ENABLING
    | `String "Enabled" -> ENABLED
    | `String "EnableFailed" -> ENABLE_FAILED
    | `String "Disabled" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LDAPSStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LDAPSStatus")
     : ldaps_status)
    : ldaps_status)

let ldaps_setting_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ldaps_status = option_of_yojson (value_for_key ldaps_status_of_yojson "LDAPSStatus") _list path;
     ldaps_status_reason =
       option_of_yojson (value_for_key ldaps_status_reason_of_yojson "LDAPSStatusReason") _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
   }
    : ldaps_setting_info)

let ldaps_settings_info_of_yojson tree path = list_of_yojson ldaps_setting_info_of_yojson tree path

let describe_ldaps_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ldaps_settings_info =
       option_of_yojson (value_for_key ldaps_settings_info_of_yojson "LDAPSSettingsInfo") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_ldaps_settings_result)

let ldaps_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Client" -> CLIENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "LDAPSType" value)
    | _ -> raise (deserialize_wrong_type_error path "LDAPSType")
     : ldaps_type)
    : ldaps_type)

let describe_ldaps_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     type_ = option_of_yojson (value_for_key ldaps_type_of_yojson "Type") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list path;
   }
    : describe_ldaps_settings_request)

let state_last_updated_date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let region_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Primary" -> PRIMARY
    | `String "Additional" -> ADDITIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RegionType")
     : region_type)
    : region_type)

let region_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
     region_type = option_of_yojson (value_for_key region_type_of_yojson "RegionType") _list path;
     status = option_of_yojson (value_for_key directory_stage_of_yojson "Status") _list path;
     vpc_settings =
       option_of_yojson (value_for_key directory_vpc_settings_of_yojson "VpcSettings") _list path;
     desired_number_of_domain_controllers =
       option_of_yojson
         (value_for_key desired_number_of_domain_controllers_of_yojson
            "DesiredNumberOfDomainControllers")
         _list path;
     launch_time = option_of_yojson (value_for_key launch_time_of_yojson "LaunchTime") _list path;
     status_last_updated_date_time =
       option_of_yojson
         (value_for_key state_last_updated_date_time_of_yojson "StatusLastUpdatedDateTime")
         _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
   }
    : region_description)

let regions_description_of_yojson tree path = list_of_yojson region_description_of_yojson tree path

let describe_regions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regions_description =
       option_of_yojson
         (value_for_key regions_description_of_yojson "RegionsDescription")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_regions_result)

let describe_regions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_regions_request)

let directory_configuration_setting_data_type_of_yojson = string_of_yojson

let directory_configuration_setting_last_requested_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson

let directory_configuration_setting_last_updated_date_time_of_yojson =
  timestamp_epoch_seconds_of_yojson

let directory_configuration_setting_request_status_message_of_yojson = string_of_yojson

let directory_configuration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Requested" -> REQUESTED
    | `String "Updating" -> UPDATING
    | `String "Updated" -> UPDATED
    | `String "Failed" -> FAILED
    | `String "Default" -> DEFAULT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DirectoryConfigurationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryConfigurationStatus")
     : directory_configuration_status)
    : directory_configuration_status)

let directory_configuration_setting_request_detailed_status_of_yojson tree path =
  map_of_yojson region_name_of_yojson directory_configuration_status_of_yojson tree path

let directory_configuration_setting_value_of_yojson = string_of_yojson
let directory_configuration_setting_allowed_values_of_yojson = string_of_yojson
let directory_configuration_setting_name_of_yojson = string_of_yojson
let directory_configuration_setting_type_of_yojson = string_of_yojson

let setting_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key directory_configuration_setting_type_of_yojson "Type")
         _list path;
     name =
       option_of_yojson
         (value_for_key directory_configuration_setting_name_of_yojson "Name")
         _list path;
     allowed_values =
       option_of_yojson
         (value_for_key directory_configuration_setting_allowed_values_of_yojson "AllowedValues")
         _list path;
     applied_value =
       option_of_yojson
         (value_for_key directory_configuration_setting_value_of_yojson "AppliedValue")
         _list path;
     requested_value =
       option_of_yojson
         (value_for_key directory_configuration_setting_value_of_yojson "RequestedValue")
         _list path;
     request_status =
       option_of_yojson
         (value_for_key directory_configuration_status_of_yojson "RequestStatus")
         _list path;
     request_detailed_status =
       option_of_yojson
         (value_for_key directory_configuration_setting_request_detailed_status_of_yojson
            "RequestDetailedStatus")
         _list path;
     request_status_message =
       option_of_yojson
         (value_for_key directory_configuration_setting_request_status_message_of_yojson
            "RequestStatusMessage")
         _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key directory_configuration_setting_last_updated_date_time_of_yojson
            "LastUpdatedDateTime")
         _list path;
     last_requested_date_time =
       option_of_yojson
         (value_for_key directory_configuration_setting_last_requested_date_time_of_yojson
            "LastRequestedDateTime")
         _list path;
     data_type =
       option_of_yojson
         (value_for_key directory_configuration_setting_data_type_of_yojson "DataType")
         _list path;
   }
    : setting_entry)

let setting_entries_of_yojson tree path = list_of_yojson setting_entry_of_yojson tree path

let describe_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     setting_entries =
       option_of_yojson (value_for_key setting_entries_of_yojson "SettingEntries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_settings_result)

let describe_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     status =
       option_of_yojson (value_for_key directory_configuration_status_of_yojson "Status") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_settings_request)

let shared_directories_of_yojson tree path = list_of_yojson shared_directory_of_yojson tree path

let describe_shared_directories_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directories =
       option_of_yojson (value_for_key shared_directories_of_yojson "SharedDirectories") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_shared_directories_result)

let describe_shared_directories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_directory_id = value_for_key directory_id_of_yojson "OwnerDirectoryId" _list path;
     shared_directory_ids =
       option_of_yojson (value_for_key directory_ids_of_yojson "SharedDirectoryIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : describe_shared_directories_request)

let start_time_of_yojson = timestamp_epoch_seconds_of_yojson

let snapshot_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Creating" -> CREATING
    | `String "Completed" -> COMPLETED
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotStatus")
     : snapshot_status)
    : snapshot_status)

let snapshot_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Auto" -> AUTO
    | `String "Manual" -> MANUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotType" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotType")
     : snapshot_type)
    : snapshot_type)

let snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     type_ = option_of_yojson (value_for_key snapshot_type_of_yojson "Type") _list path;
     name = option_of_yojson (value_for_key snapshot_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key snapshot_status_of_yojson "Status") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "StartTime") _list path;
   }
    : snapshot)

let snapshots_of_yojson tree path = list_of_yojson snapshot_of_yojson tree path

let describe_snapshots_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshots = option_of_yojson (value_for_key snapshots_of_yojson "Snapshots") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_snapshots_result)

let snapshot_ids_of_yojson tree path = list_of_yojson snapshot_id_of_yojson tree path

let describe_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     snapshot_ids = option_of_yojson (value_for_key snapshot_ids_of_yojson "SnapshotIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : describe_snapshots_request)

let trust_state_reason_of_yojson = string_of_yojson

let trust_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Creating" -> CREATING
    | `String "Created" -> CREATED
    | `String "Verifying" -> VERIFYING
    | `String "VerifyFailed" -> VERIFY_FAILED
    | `String "Verified" -> VERIFIED
    | `String "Updating" -> UPDATING
    | `String "UpdateFailed" -> UPDATE_FAILED
    | `String "Updated" -> UPDATED
    | `String "Deleting" -> DELETING
    | `String "Deleted" -> DELETED
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrustState" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustState")
     : trust_state)
    : trust_state)

let trust_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     trust_id = option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list path;
     remote_domain_name =
       option_of_yojson (value_for_key remote_domain_name_of_yojson "RemoteDomainName") _list path;
     trust_type = option_of_yojson (value_for_key trust_type_of_yojson "TrustType") _list path;
     trust_direction =
       option_of_yojson (value_for_key trust_direction_of_yojson "TrustDirection") _list path;
     trust_state = option_of_yojson (value_for_key trust_state_of_yojson "TrustState") _list path;
     created_date_time =
       option_of_yojson (value_for_key created_date_time_of_yojson "CreatedDateTime") _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
     state_last_updated_date_time =
       option_of_yojson
         (value_for_key state_last_updated_date_time_of_yojson "StateLastUpdatedDateTime")
         _list path;
     trust_state_reason =
       option_of_yojson (value_for_key trust_state_reason_of_yojson "TrustStateReason") _list path;
     selective_auth =
       option_of_yojson (value_for_key selective_auth_of_yojson "SelectiveAuth") _list path;
   }
    : trust)

let trusts_of_yojson tree path = list_of_yojson trust_of_yojson tree path

let describe_trusts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trusts = option_of_yojson (value_for_key trusts_of_yojson "Trusts") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_trusts_result)

let trust_ids_of_yojson tree path = list_of_yojson trust_id_of_yojson tree path

let describe_trusts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     trust_ids = option_of_yojson (value_for_key trust_ids_of_yojson "TrustIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : describe_trusts_request)

let os_update_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ os_version = option_of_yojson (value_for_key os_version_of_yojson "OSVersion") _list path }
    : os_update_settings)

let update_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     os_update_settings =
       option_of_yojson (value_for_key os_update_settings_of_yojson "OSUpdateSettings") _list path;
   }
    : update_value)

let update_info_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = option_of_yojson (value_for_key region_name_of_yojson "Region") _list path;
     status = option_of_yojson (value_for_key update_status_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson (value_for_key update_status_reason_of_yojson "StatusReason") _list path;
     initiated_by = option_of_yojson (value_for_key initiated_by_of_yojson "InitiatedBy") _list path;
     new_value = option_of_yojson (value_for_key update_value_of_yojson "NewValue") _list path;
     previous_value =
       option_of_yojson (value_for_key update_value_of_yojson "PreviousValue") _list path;
     start_time = option_of_yojson (value_for_key start_date_time_of_yojson "StartTime") _list path;
     last_updated_date_time =
       option_of_yojson
         (value_for_key last_updated_date_time_of_yojson "LastUpdatedDateTime")
         _list path;
   }
    : update_info_entry)

let update_activities_of_yojson tree path = list_of_yojson update_info_entry_of_yojson tree path

let describe_update_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_activities =
       option_of_yojson (value_for_key update_activities_of_yojson "UpdateActivities") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_update_directory_result)

let update_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OS" -> OS
    | `String "NETWORK" -> NETWORK
    | `String "SIZE" -> SIZE
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateType")
     : update_type)
    : update_type)

let describe_update_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     update_type = value_for_key update_type_of_yojson "UpdateType" _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_update_directory_request)

let directory_in_desired_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : directory_in_desired_state_exception)

let directory_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_only_directories_limit =
       option_of_yojson (value_for_key limit_of_yojson "CloudOnlyDirectoriesLimit") _list path;
     cloud_only_directories_current_count =
       option_of_yojson
         (value_for_key limit_of_yojson "CloudOnlyDirectoriesCurrentCount")
         _list path;
     cloud_only_directories_limit_reached =
       option_of_yojson
         (value_for_key cloud_only_directories_limit_reached_of_yojson
            "CloudOnlyDirectoriesLimitReached")
         _list path;
     cloud_only_microsoft_ad_limit =
       option_of_yojson (value_for_key limit_of_yojson "CloudOnlyMicrosoftADLimit") _list path;
     cloud_only_microsoft_ad_current_count =
       option_of_yojson
         (value_for_key limit_of_yojson "CloudOnlyMicrosoftADCurrentCount")
         _list path;
     cloud_only_microsoft_ad_limit_reached =
       option_of_yojson
         (value_for_key cloud_only_directories_limit_reached_of_yojson
            "CloudOnlyMicrosoftADLimitReached")
         _list path;
     connected_directories_limit =
       option_of_yojson (value_for_key limit_of_yojson "ConnectedDirectoriesLimit") _list path;
     connected_directories_current_count =
       option_of_yojson
         (value_for_key limit_of_yojson "ConnectedDirectoriesCurrentCount")
         _list path;
     connected_directories_limit_reached =
       option_of_yojson
         (value_for_key connected_directories_limit_reached_of_yojson
            "ConnectedDirectoriesLimitReached")
         _list path;
   }
    : directory_limits)

let directory_not_shared_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : directory_not_shared_exception)

let verify_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trust_id = option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list path }
    : verify_trust_result)

let verify_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ trust_id = value_for_key trust_id_of_yojson "TrustId" _list path } : verify_trust_request)

let update_trust_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     trust_id = option_of_yojson (value_for_key trust_id_of_yojson "TrustId") _list path;
   }
    : update_trust_result)

let update_trust_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trust_id = value_for_key trust_id_of_yojson "TrustId" _list path;
     selective_auth =
       option_of_yojson (value_for_key selective_auth_of_yojson "SelectiveAuth") _list path;
   }
    : update_trust_request)

let unsupported_settings_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : unsupported_settings_exception)

let incompatible_settings_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : incompatible_settings_exception)

let update_settings_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : update_settings_result)

let setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key directory_configuration_setting_name_of_yojson "Name" _list path;
     value = value_for_key directory_configuration_setting_value_of_yojson "Value" _list path;
   }
    : setting)

let settings_of_yojson tree path = list_of_yojson setting_of_yojson tree path

let update_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     settings = value_for_key settings_of_yojson "Settings" _list path;
   }
    : update_settings_request)

let update_radius_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_radius_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     radius_settings = value_for_key radius_settings_of_yojson "RadiusSettings" _list path;
   }
    : update_radius_request)

let domain_controller_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : domain_controller_limit_exceeded_exception)

let update_number_of_domain_controllers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_number_of_domain_controllers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     desired_number =
       value_for_key desired_number_of_domain_controllers_of_yojson "DesiredNumber" _list path;
   }
    : update_number_of_domain_controllers_request)

let update_hybrid_ad_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     assessment_id =
       option_of_yojson (value_for_key assessment_id_of_yojson "AssessmentId") _list path;
   }
    : update_hybrid_ad_result)

let hybrid_customer_instances_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_dns_ips = value_for_key customer_dns_ips_of_yojson "CustomerDnsIps" _list path;
     instance_ids = value_for_key assessment_instance_ids_of_yojson "InstanceIds" _list path;
   }
    : hybrid_customer_instances_settings)

let hybrid_administrator_account_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_arn = value_for_key secret_arn_of_yojson "SecretArn" _list path }
    : hybrid_administrator_account_update)

let update_hybrid_ad_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     hybrid_administrator_account_update =
       option_of_yojson
         (value_for_key hybrid_administrator_account_update_of_yojson
            "HybridAdministratorAccountUpdate")
         _list path;
     self_managed_instances_settings =
       option_of_yojson
         (value_for_key hybrid_customer_instances_settings_of_yojson "SelfManagedInstancesSettings")
         _list path;
   }
    : update_hybrid_ad_request)

let update_directory_setup_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let network_update_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
     customer_dns_ips_v6 =
       option_of_yojson (value_for_key dns_ipv6_addrs_of_yojson "CustomerDnsIpsV6") _list path;
   }
    : network_update_settings)

let directory_size_update_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_size =
       option_of_yojson (value_for_key directory_size_of_yojson "DirectorySize") _list path;
   }
    : directory_size_update_settings)

let update_directory_setup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     update_type = value_for_key update_type_of_yojson "UpdateType" _list path;
     os_update_settings =
       option_of_yojson (value_for_key os_update_settings_of_yojson "OSUpdateSettings") _list path;
     directory_size_update_settings =
       option_of_yojson
         (value_for_key directory_size_update_settings_of_yojson "DirectorySizeUpdateSettings")
         _list path;
     network_update_settings =
       option_of_yojson
         (value_for_key network_update_settings_of_yojson "NetworkUpdateSettings")
         _list path;
     create_snapshot_before_update =
       option_of_yojson
         (value_for_key create_snapshot_before_update_of_yojson "CreateSnapshotBeforeUpdate")
         _list path;
   }
    : update_directory_setup_request)

let update_conditional_forwarder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_conditional_forwarder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     remote_domain_name = value_for_key remote_domain_name_of_yojson "RemoteDomainName" _list path;
     dns_ip_addrs = option_of_yojson (value_for_key dns_ip_addrs_of_yojson "DnsIpAddrs") _list path;
     dns_ipv6_addrs =
       option_of_yojson (value_for_key dns_ipv6_addrs_of_yojson "DnsIpv6Addrs") _list path;
   }
    : update_conditional_forwarder_request)

let invalid_target_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : invalid_target_exception)

let unshare_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "SharedDirectoryId") _list path;
   }
    : unshare_directory_result)

let target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")
     : target_type)
    : target_type)

let target_id_of_yojson = string_of_yojson

let unshare_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key target_id_of_yojson "Id" _list path;
     type_ = value_for_key target_type_of_yojson "Type" _list path;
   }
    : unshare_target)

let unshare_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     unshare_target = value_for_key unshare_target_of_yojson "UnshareTarget" _list path;
   }
    : unshare_directory_request)

let start_schema_extension_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_extension_id =
       option_of_yojson (value_for_key schema_extension_id_of_yojson "SchemaExtensionId") _list path;
   }
    : start_schema_extension_result)

let ldif_content_of_yojson = string_of_yojson

let start_schema_extension_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     create_snapshot_before_schema_extension =
       value_for_key create_snapshot_before_schema_extension_of_yojson
         "CreateSnapshotBeforeSchemaExtension" _list path;
     ldif_content = value_for_key ldif_content_of_yojson "LdifContent" _list path;
     description = value_for_key description_of_yojson "Description" _list path;
   }
    : start_schema_extension_request)

let start_ad_assessment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_id =
       option_of_yojson (value_for_key assessment_id_of_yojson "AssessmentId") _list path;
   }
    : start_ad_assessment_result)

let start_ad_assessment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_configuration =
       option_of_yojson
         (value_for_key assessment_configuration_of_yojson "AssessmentConfiguration")
         _list path;
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
   }
    : start_ad_assessment_request)

let share_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : share_limit_exceeded_exception)

let organizations_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : organizations_exception)

let share_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "SharedDirectoryId") _list path;
   }
    : share_directory_result)

let share_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key target_id_of_yojson "Id" _list path;
     type_ = value_for_key target_type_of_yojson "Type" _list path;
   }
    : share_target)

let share_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     share_notes = option_of_yojson (value_for_key notes_of_yojson "ShareNotes") _list path;
     share_target = value_for_key share_target_of_yojson "ShareTarget" _list path;
     share_method = value_for_key share_method_of_yojson "ShareMethod" _list path;
   }
    : share_directory_request)

let restore_from_snapshot_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let restore_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot_id = value_for_key snapshot_id_of_yojson "SnapshotId" _list path }
    : restore_from_snapshot_request)

let user_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : user_does_not_exist_exception)

let invalid_password_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : invalid_password_exception)

let reset_user_password_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let user_password_of_yojson = string_of_yojson

let reset_user_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     user_name = value_for_key customer_user_name_of_yojson "UserName" _list path;
     new_password = value_for_key user_password_of_yojson "NewPassword" _list path;
   }
    : reset_user_password_request)

let remove_tags_from_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let remove_tags_from_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
   }
    : remove_tags_from_resource_request)

let remove_region_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : remove_region_request)

let remove_ip_routes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let remove_ip_routes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     cidr_ips = option_of_yojson (value_for_key cidr_ips_of_yojson "CidrIps") _list path;
     cidr_ipv6s = option_of_yojson (value_for_key cidr_ipv6s_of_yojson "CidrIpv6s") _list path;
   }
    : remove_ip_routes_request)

let reject_shared_directory_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "SharedDirectoryId") _list path;
   }
    : reject_shared_directory_result)

let reject_shared_directory_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ shared_directory_id = value_for_key directory_id_of_yojson "SharedDirectoryId" _list path }
    : reject_shared_directory_request)

let register_event_topic_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let register_event_topic_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     topic_name = value_for_key topic_name_of_yojson "TopicName" _list path;
   }
    : register_event_topic_request)

let invalid_certificate_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : invalid_certificate_exception)

let register_certificate_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_id =
       option_of_yojson (value_for_key certificate_id_of_yojson "CertificateId") _list path;
   }
    : register_certificate_result)

let register_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     certificate_data = value_for_key certificate_data_of_yojson "CertificateData" _list path;
     type_ = option_of_yojson (value_for_key certificate_type_of_yojson "Type") _list path;
     client_cert_auth_settings =
       option_of_yojson
         (value_for_key client_cert_auth_settings_of_yojson "ClientCertAuthSettings")
         _list path;
   }
    : register_certificate_request)

let list_tags_for_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_result)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key resource_id_of_yojson "ResourceId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : list_tags_for_resource_request)

let end_date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let schema_extension_status_reason_of_yojson = string_of_yojson

let schema_extension_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Initializing" -> INITIALIZING
    | `String "CreatingSnapshot" -> CREATING_SNAPSHOT
    | `String "UpdatingSchema" -> UPDATING_SCHEMA
    | `String "Replicating" -> REPLICATING
    | `String "CancelInProgress" -> CANCEL_IN_PROGRESS
    | `String "RollbackInProgress" -> ROLLBACK_IN_PROGRESS
    | `String "Cancelled" -> CANCELLED
    | `String "Failed" -> FAILED
    | `String "Completed" -> COMPLETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SchemaExtensionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SchemaExtensionStatus")
     : schema_extension_status)
    : schema_extension_status)

let schema_extension_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     schema_extension_id =
       option_of_yojson (value_for_key schema_extension_id_of_yojson "SchemaExtensionId") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     schema_extension_status =
       option_of_yojson
         (value_for_key schema_extension_status_of_yojson "SchemaExtensionStatus")
         _list path;
     schema_extension_status_reason =
       option_of_yojson
         (value_for_key schema_extension_status_reason_of_yojson "SchemaExtensionStatusReason")
         _list path;
     start_date_time =
       option_of_yojson (value_for_key start_date_time_of_yojson "StartDateTime") _list path;
     end_date_time =
       option_of_yojson (value_for_key end_date_time_of_yojson "EndDateTime") _list path;
   }
    : schema_extension_info)

let schema_extensions_info_of_yojson tree path =
  list_of_yojson schema_extension_info_of_yojson tree path

let list_schema_extensions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_extensions_info =
       option_of_yojson
         (value_for_key schema_extensions_info_of_yojson "SchemaExtensionsInfo")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_schema_extensions_result)

let list_schema_extensions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : list_schema_extensions_request)

let subscription_created_date_time_of_yojson = timestamp_epoch_seconds_of_yojson

let log_subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "LogGroupName") _list path;
     subscription_created_date_time =
       option_of_yojson
         (value_for_key subscription_created_date_time_of_yojson "SubscriptionCreatedDateTime")
         _list path;
   }
    : log_subscription)

let log_subscriptions_of_yojson tree path = list_of_yojson log_subscription_of_yojson tree path

let list_log_subscriptions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_subscriptions =
       option_of_yojson (value_for_key log_subscriptions_of_yojson "LogSubscriptions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_log_subscriptions_result)

let list_log_subscriptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : list_log_subscriptions_request)

let ip_route_status_reason_of_yojson = string_of_yojson

let ip_route_status_msg_of_yojson (tree : t) path =
  ((match tree with
    | `String "Adding" -> ADDING
    | `String "Added" -> ADDED
    | `String "Removing" -> REMOVING
    | `String "Removed" -> REMOVED
    | `String "AddFailed" -> ADD_FAILED
    | `String "RemoveFailed" -> REMOVE_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpRouteStatusMsg" value)
    | _ -> raise (deserialize_wrong_type_error path "IpRouteStatusMsg")
     : ip_route_status_msg)
    : ip_route_status_msg)

let ip_route_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     cidr_ip = option_of_yojson (value_for_key cidr_ip_of_yojson "CidrIp") _list path;
     cidr_ipv6 = option_of_yojson (value_for_key cidr_ipv6_of_yojson "CidrIpv6") _list path;
     ip_route_status_msg =
       option_of_yojson (value_for_key ip_route_status_msg_of_yojson "IpRouteStatusMsg") _list path;
     added_date_time =
       option_of_yojson (value_for_key added_date_time_of_yojson "AddedDateTime") _list path;
     ip_route_status_reason =
       option_of_yojson
         (value_for_key ip_route_status_reason_of_yojson "IpRouteStatusReason")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
   }
    : ip_route_info)

let ip_routes_info_of_yojson tree path = list_of_yojson ip_route_info_of_yojson tree path

let list_ip_routes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_routes_info =
       option_of_yojson (value_for_key ip_routes_info_of_yojson "IpRoutesInfo") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_ip_routes_result)

let list_ip_routes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : list_ip_routes_request)

let list_certificates_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     certificates_info =
       option_of_yojson (value_for_key certificates_info_of_yojson "CertificatesInfo") _list path;
   }
    : list_certificates_result)

let list_certificates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list path;
   }
    : list_certificates_request)

let list_ad_assessments_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessments = option_of_yojson (value_for_key assessments_of_yojson "Assessments") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_ad_assessments_result)

let list_ad_assessments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key assessment_limit_of_yojson "Limit") _list path;
   }
    : list_ad_assessments_request)

let manual_snapshots_limit_reached_of_yojson = bool_of_yojson

let snapshot_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     manual_snapshots_limit =
       option_of_yojson (value_for_key limit_of_yojson "ManualSnapshotsLimit") _list path;
     manual_snapshots_current_count =
       option_of_yojson (value_for_key limit_of_yojson "ManualSnapshotsCurrentCount") _list path;
     manual_snapshots_limit_reached =
       option_of_yojson
         (value_for_key manual_snapshots_limit_reached_of_yojson "ManualSnapshotsLimitReached")
         _list path;
   }
    : snapshot_limits)

let get_snapshot_limits_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_limits =
       option_of_yojson (value_for_key snapshot_limits_of_yojson "SnapshotLimits") _list path;
   }
    : get_snapshot_limits_result)

let get_snapshot_limits_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : get_snapshot_limits_request)

let get_directory_limits_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_limits =
       option_of_yojson (value_for_key directory_limits_of_yojson "DirectoryLimits") _list path;
   }
    : get_directory_limits_result)

let get_directory_limits_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_sso_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_sso_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     password = option_of_yojson (value_for_key connect_password_of_yojson "Password") _list path;
   }
    : enable_sso_request)

let enable_radius_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_radius_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     radius_settings = value_for_key radius_settings_of_yojson "RadiusSettings" _list path;
   }
    : enable_radius_request)

let no_available_certificate_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : no_available_certificate_exception)

let invalid_ldaps_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : invalid_ldaps_status_exception)

let enable_ldaps_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_ldaps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     type_ = value_for_key ldaps_type_of_yojson "Type" _list path;
   }
    : enable_ldaps_request)

let enable_directory_data_access_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_directory_data_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : enable_directory_data_access_request)

let invalid_client_auth_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : invalid_client_auth_status_exception)

let enable_client_authentication_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_client_authentication_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     type_ = value_for_key client_authentication_type_of_yojson "Type" _list path;
   }
    : enable_client_authentication_request)

let enable_already_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : enable_already_in_progress_exception)

let enable_ca_enrollment_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_ca_enrollment_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     pca_connector_arn = value_for_key pca_connector_arn_of_yojson "PcaConnectorArn" _list path;
   }
    : enable_ca_enrollment_policy_request)

let disable_sso_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_sso_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     password = option_of_yojson (value_for_key connect_password_of_yojson "Password") _list path;
   }
    : disable_sso_request)

let disable_radius_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_radius_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : disable_radius_request)

let disable_ldaps_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_ldaps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     type_ = value_for_key ldaps_type_of_yojson "Type" _list path;
   }
    : disable_ldaps_request)

let disable_directory_data_access_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_directory_data_access_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : disable_directory_data_access_request)

let disable_client_authentication_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_client_authentication_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path;
     type_ = value_for_key client_authentication_type_of_yojson "Type" _list path;
   }
    : disable_client_authentication_request)

let disable_already_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : disable_already_in_progress_exception)

let disable_ca_enrollment_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_ca_enrollment_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_id = value_for_key directory_id_of_yojson "DirectoryId" _list path }
    : disable_ca_enrollment_policy_request)
