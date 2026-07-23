open Smaws_Lib.Json.DeserializeHelpers
open Types

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let generic_string_of_yojson = string_of_yojson

let accelerator_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key generic_string_of_yojson "Message") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
   }
    : accelerator_event)

let accelerator_events_of_yojson tree path = list_of_yojson accelerator_event_of_yojson tree path

let accelerator_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEPLOYED" -> DEPLOYED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceleratorStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceleratorStatus")
     : accelerator_status)
    : accelerator_status)

let ip_address_family_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPv4" -> IPv4
    | `String "IPv6" -> IPv6
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpAddressFamily" value)
    | _ -> raise (deserialize_wrong_type_error path "IpAddressFamily")
     : ip_address_family)
    : ip_address_family)

let ip_address_of_yojson = string_of_yojson
let ip_addresses_of_yojson tree path = list_of_yojson ip_address_of_yojson tree path

let ip_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_family = option_of_yojson (value_for_key generic_string_of_yojson "IpFamily") _list path;
     ip_addresses = option_of_yojson (value_for_key ip_addresses_of_yojson "IpAddresses") _list path;
     ip_address_family =
       option_of_yojson (value_for_key ip_address_family_of_yojson "IpAddressFamily") _list path;
   }
    : ip_set)

let ip_sets_of_yojson tree path = list_of_yojson ip_set_of_yojson tree path
let generic_boolean_of_yojson = bool_of_yojson

let ip_address_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV4" -> IPV4
    | `String "DUAL_STACK" -> DUAL_STACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "IpAddressType")
     : ip_address_type)
    : ip_address_type)

let accelerator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AcceleratorArn") _list path;
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     enabled = option_of_yojson (value_for_key generic_boolean_of_yojson "Enabled") _list path;
     ip_sets = option_of_yojson (value_for_key ip_sets_of_yojson "IpSets") _list path;
     dns_name = option_of_yojson (value_for_key generic_string_of_yojson "DnsName") _list path;
     status = option_of_yojson (value_for_key accelerator_status_of_yojson "Status") _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     dual_stack_dns_name =
       option_of_yojson (value_for_key generic_string_of_yojson "DualStackDnsName") _list path;
     events = option_of_yojson (value_for_key accelerator_events_of_yojson "Events") _list path;
   }
    : accelerator)

let accelerator_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_logs_enabled =
       option_of_yojson (value_for_key generic_boolean_of_yojson "FlowLogsEnabled") _list path;
     flow_logs_s3_bucket =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Bucket") _list path;
     flow_logs_s3_prefix =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Prefix") _list path;
   }
    : accelerator_attributes)

let error_message_of_yojson = string_of_yojson

let accelerator_not_disabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : accelerator_not_disabled_exception)

let accelerator_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : accelerator_not_found_exception)

let accelerators_of_yojson tree path = list_of_yojson accelerator_of_yojson tree path

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let invalid_argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_argument_exception)

let internal_service_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_service_error_exception)

let endpoint_group_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : endpoint_group_not_found_exception)

let endpoint_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : endpoint_already_exists_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : conflict_exception)

let custom_routing_endpoint_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
   }
    : custom_routing_endpoint_description)

let custom_routing_endpoint_descriptions_of_yojson tree path =
  list_of_yojson custom_routing_endpoint_description_of_yojson tree path

let add_custom_routing_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_descriptions =
       option_of_yojson
         (value_for_key custom_routing_endpoint_descriptions_of_yojson "EndpointDescriptions")
         _list path;
     endpoint_group_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupArn") _list path;
   }
    : add_custom_routing_endpoints_response)

let custom_routing_endpoint_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
     attachment_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AttachmentArn") _list path;
   }
    : custom_routing_endpoint_configuration)

let custom_routing_endpoint_configurations_of_yojson tree path =
  list_of_yojson custom_routing_endpoint_configuration_of_yojson tree path

let add_custom_routing_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_configurations =
       value_for_key custom_routing_endpoint_configurations_of_yojson "EndpointConfigurations" _list
         path;
     endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path;
   }
    : add_custom_routing_endpoints_request)

let transaction_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : transaction_in_progress_exception)

let health_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "INITIAL" -> INITIAL
    | `String "HEALTHY" -> HEALTHY
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthState" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthState")
     : health_state)
    : health_state)

let endpoint_weight_of_yojson = int_of_yojson

let endpoint_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
     weight = option_of_yojson (value_for_key endpoint_weight_of_yojson "Weight") _list path;
     health_state = option_of_yojson (value_for_key health_state_of_yojson "HealthState") _list path;
     health_reason =
       option_of_yojson (value_for_key generic_string_of_yojson "HealthReason") _list path;
     client_ip_preservation_enabled =
       option_of_yojson
         (value_for_key generic_boolean_of_yojson "ClientIPPreservationEnabled")
         _list path;
   }
    : endpoint_description)

let endpoint_descriptions_of_yojson tree path =
  list_of_yojson endpoint_description_of_yojson tree path

let add_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_descriptions =
       option_of_yojson
         (value_for_key endpoint_descriptions_of_yojson "EndpointDescriptions")
         _list path;
     endpoint_group_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupArn") _list path;
   }
    : add_endpoints_response)

let endpoint_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
     weight = option_of_yojson (value_for_key endpoint_weight_of_yojson "Weight") _list path;
     client_ip_preservation_enabled =
       option_of_yojson
         (value_for_key generic_boolean_of_yojson "ClientIPPreservationEnabled")
         _list path;
     attachment_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AttachmentArn") _list path;
   }
    : endpoint_configuration)

let endpoint_configurations_of_yojson tree path =
  list_of_yojson endpoint_configuration_of_yojson tree path

let add_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_configurations =
       value_for_key endpoint_configurations_of_yojson "EndpointConfigurations" _list path;
     endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path;
   }
    : add_endpoints_request)

let incorrect_cidr_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : incorrect_cidr_state_exception)

let byoip_cidr_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : byoip_cidr_not_found_exception)

let byoip_cidr_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key generic_string_of_yojson "Message") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "Timestamp") _list path;
   }
    : byoip_cidr_event)

let byoip_cidr_events_of_yojson tree path = list_of_yojson byoip_cidr_event_of_yojson tree path

let byoip_cidr_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_PROVISIONING" -> PENDING_PROVISIONING
    | `String "READY" -> READY
    | `String "PENDING_ADVERTISING" -> PENDING_ADVERTISING
    | `String "ADVERTISING" -> ADVERTISING
    | `String "PENDING_WITHDRAWING" -> PENDING_WITHDRAWING
    | `String "PENDING_DEPROVISIONING" -> PENDING_DEPROVISIONING
    | `String "DEPROVISIONED" -> DEPROVISIONED
    | `String "FAILED_PROVISION" -> FAILED_PROVISION
    | `String "FAILED_ADVERTISING" -> FAILED_ADVERTISING
    | `String "FAILED_WITHDRAW" -> FAILED_WITHDRAW
    | `String "FAILED_DEPROVISION" -> FAILED_DEPROVISION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ByoipCidrState" value)
    | _ -> raise (deserialize_wrong_type_error path "ByoipCidrState")
     : byoip_cidr_state)
    : byoip_cidr_state)

let byoip_cidr_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cidr = option_of_yojson (value_for_key generic_string_of_yojson "Cidr") _list path;
     state = option_of_yojson (value_for_key byoip_cidr_state_of_yojson "State") _list path;
     events = option_of_yojson (value_for_key byoip_cidr_events_of_yojson "Events") _list path;
   }
    : byoip_cidr)

let advertise_byoip_cidr_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ byoip_cidr = option_of_yojson (value_for_key byoip_cidr_of_yojson "ByoipCidr") _list path }
    : advertise_byoip_cidr_response)

let advertise_byoip_cidr_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cidr = value_for_key generic_string_of_yojson "Cidr" _list path }
    : advertise_byoip_cidr_request)

let port_number_of_yojson = int_of_yojson
let destination_ports_of_yojson tree path = list_of_yojson port_number_of_yojson tree path
let destination_addresses_of_yojson tree path = list_of_yojson ip_address_of_yojson tree path

let allow_custom_routing_traffic_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path;
     endpoint_id = value_for_key generic_string_of_yojson "EndpointId" _list path;
     destination_addresses =
       option_of_yojson
         (value_for_key destination_addresses_of_yojson "DestinationAddresses")
         _list path;
     destination_ports =
       option_of_yojson (value_for_key destination_ports_of_yojson "DestinationPorts") _list path;
     allow_all_traffic_to_endpoint =
       option_of_yojson
         (value_for_key generic_boolean_of_yojson "AllowAllTrafficToEndpoint")
         _list path;
   }
    : allow_custom_routing_traffic_request)

let associated_endpoint_group_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : associated_endpoint_group_found_exception)

let associated_listener_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : associated_listener_found_exception)

let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
     cidr = option_of_yojson (value_for_key generic_string_of_yojson "Cidr") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
   }
    : resource)

let resources_of_yojson tree path = list_of_yojson resource_of_yojson tree path
let principal_of_yojson = string_of_yojson
let principals_of_yojson tree path = list_of_yojson principal_of_yojson tree path
let attachment_name_of_yojson = string_of_yojson

let attachment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AttachmentArn") _list path;
     name = option_of_yojson (value_for_key attachment_name_of_yojson "Name") _list path;
     principals = option_of_yojson (value_for_key principals_of_yojson "Principals") _list path;
     resources = option_of_yojson (value_for_key resources_of_yojson "Resources") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
   }
    : attachment)

let attachment_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : attachment_not_found_exception)

let attachments_of_yojson tree path = list_of_yojson attachment_of_yojson tree path
let aws_account_id_of_yojson = string_of_yojson
let aws_account_ids_of_yojson tree path = list_of_yojson aws_account_id_of_yojson tree path
let byoip_cidrs_of_yojson tree path = list_of_yojson byoip_cidr_of_yojson tree path

let cidr_authorization_context_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key generic_string_of_yojson "Message" _list path;
     signature = value_for_key generic_string_of_yojson "Signature" _list path;
   }
    : cidr_authorization_context)

let client_affinity_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "SOURCE_IP" -> SOURCE_IP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClientAffinity" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientAffinity")
     : client_affinity)
    : client_affinity)

let create_accelerator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator = option_of_yojson (value_for_key accelerator_of_yojson "Accelerator") _list path }
    : create_accelerator_response)

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
let idempotency_token_of_yojson = string_of_yojson

let create_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key generic_string_of_yojson "Name" _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     ip_addresses = option_of_yojson (value_for_key ip_addresses_of_yojson "IpAddresses") _list path;
     enabled = option_of_yojson (value_for_key generic_boolean_of_yojson "Enabled") _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_accelerator_request)

let create_cross_account_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_attachment =
       option_of_yojson (value_for_key attachment_of_yojson "CrossAccountAttachment") _list path;
   }
    : create_cross_account_attachment_response)

let create_cross_account_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key attachment_name_of_yojson "Name" _list path;
     principals = option_of_yojson (value_for_key principals_of_yojson "Principals") _list path;
     resources = option_of_yojson (value_for_key resources_of_yojson "Resources") _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_cross_account_attachment_request)

let custom_routing_accelerator_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEPLOYED" -> DEPLOYED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomRoutingAcceleratorStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomRoutingAcceleratorStatus")
     : custom_routing_accelerator_status)
    : custom_routing_accelerator_status)

let custom_routing_accelerator_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AcceleratorArn") _list path;
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     enabled = option_of_yojson (value_for_key generic_boolean_of_yojson "Enabled") _list path;
     ip_sets = option_of_yojson (value_for_key ip_sets_of_yojson "IpSets") _list path;
     dns_name = option_of_yojson (value_for_key generic_string_of_yojson "DnsName") _list path;
     status =
       option_of_yojson
         (value_for_key custom_routing_accelerator_status_of_yojson "Status")
         _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
   }
    : custom_routing_accelerator)

let create_custom_routing_accelerator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator =
       option_of_yojson
         (value_for_key custom_routing_accelerator_of_yojson "Accelerator")
         _list path;
   }
    : create_custom_routing_accelerator_response)

let create_custom_routing_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key generic_string_of_yojson "Name" _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     ip_addresses = option_of_yojson (value_for_key ip_addresses_of_yojson "IpAddresses") _list path;
     enabled = option_of_yojson (value_for_key generic_boolean_of_yojson "Enabled") _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_custom_routing_accelerator_request)

let listener_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : listener_not_found_exception)

let invalid_port_range_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_port_range_exception)

let endpoint_group_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : endpoint_group_already_exists_exception)

let protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "TCP" -> TCP
    | `String "UDP" -> UDP
    | `String value -> raise (deserialize_unknown_enum_value_error path "Protocol" value)
    | _ -> raise (deserialize_wrong_type_error path "Protocol")
     : protocol)
    : protocol)

let protocols_of_yojson tree path = list_of_yojson protocol_of_yojson tree path

let custom_routing_destination_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = option_of_yojson (value_for_key port_number_of_yojson "FromPort") _list path;
     to_port = option_of_yojson (value_for_key port_number_of_yojson "ToPort") _list path;
     protocols = option_of_yojson (value_for_key protocols_of_yojson "Protocols") _list path;
   }
    : custom_routing_destination_description)

let custom_routing_destination_descriptions_of_yojson tree path =
  list_of_yojson custom_routing_destination_description_of_yojson tree path

let custom_routing_endpoint_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupArn") _list path;
     endpoint_group_region =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupRegion") _list path;
     destination_descriptions =
       option_of_yojson
         (value_for_key custom_routing_destination_descriptions_of_yojson "DestinationDescriptions")
         _list path;
     endpoint_descriptions =
       option_of_yojson
         (value_for_key custom_routing_endpoint_descriptions_of_yojson "EndpointDescriptions")
         _list path;
   }
    : custom_routing_endpoint_group)

let create_custom_routing_endpoint_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group =
       option_of_yojson
         (value_for_key custom_routing_endpoint_group_of_yojson "EndpointGroup")
         _list path;
   }
    : create_custom_routing_endpoint_group_response)

let custom_routing_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "TCP" -> TCP
    | `String "UDP" -> UDP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomRoutingProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomRoutingProtocol")
     : custom_routing_protocol)
    : custom_routing_protocol)

let custom_routing_protocols_of_yojson tree path =
  list_of_yojson custom_routing_protocol_of_yojson tree path

let custom_routing_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = value_for_key port_number_of_yojson "FromPort" _list path;
     to_port = value_for_key port_number_of_yojson "ToPort" _list path;
     protocols = value_for_key custom_routing_protocols_of_yojson "Protocols" _list path;
   }
    : custom_routing_destination_configuration)

let custom_routing_destination_configurations_of_yojson tree path =
  list_of_yojson custom_routing_destination_configuration_of_yojson tree path

let create_custom_routing_endpoint_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path;
     endpoint_group_region = value_for_key generic_string_of_yojson "EndpointGroupRegion" _list path;
     destination_configurations =
       value_for_key custom_routing_destination_configurations_of_yojson "DestinationConfigurations"
         _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
   }
    : create_custom_routing_endpoint_group_request)

let port_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     from_port = option_of_yojson (value_for_key port_number_of_yojson "FromPort") _list path;
     to_port = option_of_yojson (value_for_key port_number_of_yojson "ToPort") _list path;
   }
    : port_range)

let port_ranges_of_yojson tree path = list_of_yojson port_range_of_yojson tree path

let custom_routing_listener_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "ListenerArn") _list path;
     port_ranges = option_of_yojson (value_for_key port_ranges_of_yojson "PortRanges") _list path;
   }
    : custom_routing_listener)

let create_custom_routing_listener_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener =
       option_of_yojson (value_for_key custom_routing_listener_of_yojson "Listener") _list path;
   }
    : create_custom_routing_listener_response)

let create_custom_routing_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     port_ranges = value_for_key port_ranges_of_yojson "PortRanges" _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
   }
    : create_custom_routing_listener_request)

let port_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_port =
       option_of_yojson (value_for_key port_number_of_yojson "ListenerPort") _list path;
     endpoint_port =
       option_of_yojson (value_for_key port_number_of_yojson "EndpointPort") _list path;
   }
    : port_override)

let port_overrides_of_yojson tree path = list_of_yojson port_override_of_yojson tree path
let threshold_count_of_yojson = int_of_yojson
let health_check_interval_seconds_of_yojson = int_of_yojson
let health_check_path_of_yojson = string_of_yojson

let health_check_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "TCP" -> TCP
    | `String "HTTP" -> HTTP
    | `String "HTTPS" -> HTTPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthCheckProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthCheckProtocol")
     : health_check_protocol)
    : health_check_protocol)

let health_check_port_of_yojson = int_of_yojson
let traffic_dial_percentage_of_yojson = float_of_yojson

let endpoint_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupArn") _list path;
     endpoint_group_region =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupRegion") _list path;
     endpoint_descriptions =
       option_of_yojson
         (value_for_key endpoint_descriptions_of_yojson "EndpointDescriptions")
         _list path;
     traffic_dial_percentage =
       option_of_yojson
         (value_for_key traffic_dial_percentage_of_yojson "TrafficDialPercentage")
         _list path;
     health_check_port =
       option_of_yojson (value_for_key health_check_port_of_yojson "HealthCheckPort") _list path;
     health_check_protocol =
       option_of_yojson
         (value_for_key health_check_protocol_of_yojson "HealthCheckProtocol")
         _list path;
     health_check_path =
       option_of_yojson (value_for_key health_check_path_of_yojson "HealthCheckPath") _list path;
     health_check_interval_seconds =
       option_of_yojson
         (value_for_key health_check_interval_seconds_of_yojson "HealthCheckIntervalSeconds")
         _list path;
     threshold_count =
       option_of_yojson (value_for_key threshold_count_of_yojson "ThresholdCount") _list path;
     port_overrides =
       option_of_yojson (value_for_key port_overrides_of_yojson "PortOverrides") _list path;
   }
    : endpoint_group)

let create_endpoint_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group =
       option_of_yojson (value_for_key endpoint_group_of_yojson "EndpointGroup") _list path;
   }
    : create_endpoint_group_response)

let create_endpoint_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path;
     endpoint_group_region = value_for_key generic_string_of_yojson "EndpointGroupRegion" _list path;
     endpoint_configurations =
       option_of_yojson
         (value_for_key endpoint_configurations_of_yojson "EndpointConfigurations")
         _list path;
     traffic_dial_percentage =
       option_of_yojson
         (value_for_key traffic_dial_percentage_of_yojson "TrafficDialPercentage")
         _list path;
     health_check_port =
       option_of_yojson (value_for_key health_check_port_of_yojson "HealthCheckPort") _list path;
     health_check_protocol =
       option_of_yojson
         (value_for_key health_check_protocol_of_yojson "HealthCheckProtocol")
         _list path;
     health_check_path =
       option_of_yojson (value_for_key health_check_path_of_yojson "HealthCheckPath") _list path;
     health_check_interval_seconds =
       option_of_yojson
         (value_for_key health_check_interval_seconds_of_yojson "HealthCheckIntervalSeconds")
         _list path;
     threshold_count =
       option_of_yojson (value_for_key threshold_count_of_yojson "ThresholdCount") _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
     port_overrides =
       option_of_yojson (value_for_key port_overrides_of_yojson "PortOverrides") _list path;
   }
    : create_endpoint_group_request)

let listener_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "ListenerArn") _list path;
     port_ranges = option_of_yojson (value_for_key port_ranges_of_yojson "PortRanges") _list path;
     protocol = option_of_yojson (value_for_key protocol_of_yojson "Protocol") _list path;
     client_affinity =
       option_of_yojson (value_for_key client_affinity_of_yojson "ClientAffinity") _list path;
   }
    : listener)

let create_listener_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ listener = option_of_yojson (value_for_key listener_of_yojson "Listener") _list path }
    : create_listener_response)

let create_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     port_ranges = value_for_key port_ranges_of_yojson "PortRanges" _list path;
     protocol = value_for_key protocol_of_yojson "Protocol" _list path;
     client_affinity =
       option_of_yojson (value_for_key client_affinity_of_yojson "ClientAffinity") _list path;
     idempotency_token = value_for_key idempotency_token_of_yojson "IdempotencyToken" _list path;
   }
    : create_listener_request)

let cross_account_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
     cidr = option_of_yojson (value_for_key generic_string_of_yojson "Cidr") _list path;
     attachment_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AttachmentArn") _list path;
   }
    : cross_account_resource)

let cross_account_resources_of_yojson tree path =
  list_of_yojson cross_account_resource_of_yojson tree path

let custom_routing_accelerator_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flow_logs_enabled =
       option_of_yojson (value_for_key generic_boolean_of_yojson "FlowLogsEnabled") _list path;
     flow_logs_s3_bucket =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Bucket") _list path;
     flow_logs_s3_prefix =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Prefix") _list path;
   }
    : custom_routing_accelerator_attributes)

let custom_routing_accelerators_of_yojson tree path =
  list_of_yojson custom_routing_accelerator_of_yojson tree path

let custom_routing_destination_traffic_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "DENY" -> DENY
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CustomRoutingDestinationTrafficState" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomRoutingDestinationTrafficState")
     : custom_routing_destination_traffic_state)
    : custom_routing_destination_traffic_state)

let custom_routing_endpoint_groups_of_yojson tree path =
  list_of_yojson custom_routing_endpoint_group_of_yojson tree path

let custom_routing_listeners_of_yojson tree path =
  list_of_yojson custom_routing_listener_of_yojson tree path

let delete_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path }
    : delete_accelerator_request)

let delete_cross_account_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attachment_arn = value_for_key generic_string_of_yojson "AttachmentArn" _list path }
    : delete_cross_account_attachment_request)

let delete_custom_routing_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path }
    : delete_custom_routing_accelerator_request)

let delete_custom_routing_endpoint_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path }
    : delete_custom_routing_endpoint_group_request)

let delete_custom_routing_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path }
    : delete_custom_routing_listener_request)

let delete_endpoint_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path }
    : delete_endpoint_group_request)

let delete_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path }
    : delete_listener_request)

let deny_custom_routing_traffic_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path;
     endpoint_id = value_for_key generic_string_of_yojson "EndpointId" _list path;
     destination_addresses =
       option_of_yojson
         (value_for_key destination_addresses_of_yojson "DestinationAddresses")
         _list path;
     destination_ports =
       option_of_yojson (value_for_key destination_ports_of_yojson "DestinationPorts") _list path;
     deny_all_traffic_to_endpoint =
       option_of_yojson
         (value_for_key generic_boolean_of_yojson "DenyAllTrafficToEndpoint")
         _list path;
   }
    : deny_custom_routing_traffic_request)

let deprovision_byoip_cidr_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ byoip_cidr = option_of_yojson (value_for_key byoip_cidr_of_yojson "ByoipCidr") _list path }
    : deprovision_byoip_cidr_response)

let deprovision_byoip_cidr_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cidr = value_for_key generic_string_of_yojson "Cidr" _list path }
    : deprovision_byoip_cidr_request)

let describe_accelerator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator = option_of_yojson (value_for_key accelerator_of_yojson "Accelerator") _list path }
    : describe_accelerator_response)

let describe_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path }
    : describe_accelerator_request)

let describe_accelerator_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_attributes =
       option_of_yojson
         (value_for_key accelerator_attributes_of_yojson "AcceleratorAttributes")
         _list path;
   }
    : describe_accelerator_attributes_response)

let describe_accelerator_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path }
    : describe_accelerator_attributes_request)

let describe_cross_account_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_attachment =
       option_of_yojson (value_for_key attachment_of_yojson "CrossAccountAttachment") _list path;
   }
    : describe_cross_account_attachment_response)

let describe_cross_account_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attachment_arn = value_for_key generic_string_of_yojson "AttachmentArn" _list path }
    : describe_cross_account_attachment_request)

let describe_custom_routing_accelerator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator =
       option_of_yojson
         (value_for_key custom_routing_accelerator_of_yojson "Accelerator")
         _list path;
   }
    : describe_custom_routing_accelerator_response)

let describe_custom_routing_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path }
    : describe_custom_routing_accelerator_request)

let describe_custom_routing_accelerator_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_attributes =
       option_of_yojson
         (value_for_key custom_routing_accelerator_attributes_of_yojson "AcceleratorAttributes")
         _list path;
   }
    : describe_custom_routing_accelerator_attributes_response)

let describe_custom_routing_accelerator_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path }
    : describe_custom_routing_accelerator_attributes_request)

let describe_custom_routing_endpoint_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group =
       option_of_yojson
         (value_for_key custom_routing_endpoint_group_of_yojson "EndpointGroup")
         _list path;
   }
    : describe_custom_routing_endpoint_group_response)

let describe_custom_routing_endpoint_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path }
    : describe_custom_routing_endpoint_group_request)

let describe_custom_routing_listener_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener =
       option_of_yojson (value_for_key custom_routing_listener_of_yojson "Listener") _list path;
   }
    : describe_custom_routing_listener_response)

let describe_custom_routing_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path }
    : describe_custom_routing_listener_request)

let describe_endpoint_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group =
       option_of_yojson (value_for_key endpoint_group_of_yojson "EndpointGroup") _list path;
   }
    : describe_endpoint_group_response)

let describe_endpoint_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path }
    : describe_endpoint_group_request)

let describe_listener_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ listener = option_of_yojson (value_for_key listener_of_yojson "Listener") _list path }
    : describe_listener_response)

let describe_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path }
    : describe_listener_request)

let socket_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_address = option_of_yojson (value_for_key generic_string_of_yojson "IpAddress") _list path;
     port = option_of_yojson (value_for_key port_number_of_yojson "Port") _list path;
   }
    : socket_address)

let socket_addresses_of_yojson tree path = list_of_yojson socket_address_of_yojson tree path

let destination_port_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AcceleratorArn") _list path;
     accelerator_socket_addresses =
       option_of_yojson
         (value_for_key socket_addresses_of_yojson "AcceleratorSocketAddresses")
         _list path;
     endpoint_group_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupArn") _list path;
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
     endpoint_group_region =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupRegion") _list path;
     destination_socket_address =
       option_of_yojson
         (value_for_key socket_address_of_yojson "DestinationSocketAddress")
         _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     destination_traffic_state =
       option_of_yojson
         (value_for_key custom_routing_destination_traffic_state_of_yojson "DestinationTrafficState")
         _list path;
   }
    : destination_port_mapping)

let destination_port_mappings_of_yojson tree path =
  list_of_yojson destination_port_mapping_of_yojson tree path

let endpoint_groups_of_yojson tree path = list_of_yojson endpoint_group_of_yojson tree path

let endpoint_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = value_for_key generic_string_of_yojson "EndpointId" _list path;
     client_ip_preservation_enabled =
       option_of_yojson
         (value_for_key generic_boolean_of_yojson "ClientIPPreservationEnabled")
         _list path;
   }
    : endpoint_identifier)

let endpoint_identifiers_of_yojson tree path =
  list_of_yojson endpoint_identifier_of_yojson tree path

let endpoint_ids_of_yojson tree path = list_of_yojson generic_string_of_yojson tree path

let endpoint_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : endpoint_not_found_exception)

let withdraw_byoip_cidr_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ byoip_cidr = option_of_yojson (value_for_key byoip_cidr_of_yojson "ByoipCidr") _list path }
    : withdraw_byoip_cidr_response)

let withdraw_byoip_cidr_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cidr = value_for_key generic_string_of_yojson "Cidr" _list path }
    : withdraw_byoip_cidr_request)

let update_listener_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ listener = option_of_yojson (value_for_key listener_of_yojson "Listener") _list path }
    : update_listener_response)

let update_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path;
     port_ranges = option_of_yojson (value_for_key port_ranges_of_yojson "PortRanges") _list path;
     protocol = option_of_yojson (value_for_key protocol_of_yojson "Protocol") _list path;
     client_affinity =
       option_of_yojson (value_for_key client_affinity_of_yojson "ClientAffinity") _list path;
   }
    : update_listener_request)

let update_endpoint_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group =
       option_of_yojson (value_for_key endpoint_group_of_yojson "EndpointGroup") _list path;
   }
    : update_endpoint_group_response)

let update_endpoint_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path;
     endpoint_configurations =
       option_of_yojson
         (value_for_key endpoint_configurations_of_yojson "EndpointConfigurations")
         _list path;
     traffic_dial_percentage =
       option_of_yojson
         (value_for_key traffic_dial_percentage_of_yojson "TrafficDialPercentage")
         _list path;
     health_check_port =
       option_of_yojson (value_for_key health_check_port_of_yojson "HealthCheckPort") _list path;
     health_check_protocol =
       option_of_yojson
         (value_for_key health_check_protocol_of_yojson "HealthCheckProtocol")
         _list path;
     health_check_path =
       option_of_yojson (value_for_key health_check_path_of_yojson "HealthCheckPath") _list path;
     health_check_interval_seconds =
       option_of_yojson
         (value_for_key health_check_interval_seconds_of_yojson "HealthCheckIntervalSeconds")
         _list path;
     threshold_count =
       option_of_yojson (value_for_key threshold_count_of_yojson "ThresholdCount") _list path;
     port_overrides =
       option_of_yojson (value_for_key port_overrides_of_yojson "PortOverrides") _list path;
   }
    : update_endpoint_group_request)

let update_custom_routing_listener_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener =
       option_of_yojson (value_for_key custom_routing_listener_of_yojson "Listener") _list path;
   }
    : update_custom_routing_listener_response)

let update_custom_routing_listener_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path;
     port_ranges = value_for_key port_ranges_of_yojson "PortRanges" _list path;
   }
    : update_custom_routing_listener_request)

let update_custom_routing_accelerator_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_attributes =
       option_of_yojson
         (value_for_key custom_routing_accelerator_attributes_of_yojson "AcceleratorAttributes")
         _list path;
   }
    : update_custom_routing_accelerator_attributes_response)

let update_custom_routing_accelerator_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     flow_logs_enabled =
       option_of_yojson (value_for_key generic_boolean_of_yojson "FlowLogsEnabled") _list path;
     flow_logs_s3_bucket =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Bucket") _list path;
     flow_logs_s3_prefix =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Prefix") _list path;
   }
    : update_custom_routing_accelerator_attributes_request)

let update_custom_routing_accelerator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator =
       option_of_yojson
         (value_for_key custom_routing_accelerator_of_yojson "Accelerator")
         _list path;
   }
    : update_custom_routing_accelerator_response)

let update_custom_routing_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     ip_addresses = option_of_yojson (value_for_key ip_addresses_of_yojson "IpAddresses") _list path;
     enabled = option_of_yojson (value_for_key generic_boolean_of_yojson "Enabled") _list path;
   }
    : update_custom_routing_accelerator_request)

let update_cross_account_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_attachment =
       option_of_yojson (value_for_key attachment_of_yojson "CrossAccountAttachment") _list path;
   }
    : update_cross_account_attachment_response)

let update_cross_account_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_arn = value_for_key generic_string_of_yojson "AttachmentArn" _list path;
     name = option_of_yojson (value_for_key attachment_name_of_yojson "Name") _list path;
     add_principals =
       option_of_yojson (value_for_key principals_of_yojson "AddPrincipals") _list path;
     remove_principals =
       option_of_yojson (value_for_key principals_of_yojson "RemovePrincipals") _list path;
     add_resources = option_of_yojson (value_for_key resources_of_yojson "AddResources") _list path;
     remove_resources =
       option_of_yojson (value_for_key resources_of_yojson "RemoveResources") _list path;
   }
    : update_cross_account_attachment_request)

let update_accelerator_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_attributes =
       option_of_yojson
         (value_for_key accelerator_attributes_of_yojson "AcceleratorAttributes")
         _list path;
   }
    : update_accelerator_attributes_response)

let update_accelerator_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     flow_logs_enabled =
       option_of_yojson (value_for_key generic_boolean_of_yojson "FlowLogsEnabled") _list path;
     flow_logs_s3_bucket =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Bucket") _list path;
     flow_logs_s3_prefix =
       option_of_yojson (value_for_key generic_string_of_yojson "FlowLogsS3Prefix") _list path;
   }
    : update_accelerator_attributes_request)

let update_accelerator_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ accelerator = option_of_yojson (value_for_key accelerator_of_yojson "Accelerator") _list path }
    : update_accelerator_response)

let update_accelerator_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
     ip_address_type =
       option_of_yojson (value_for_key ip_address_type_of_yojson "IpAddressType") _list path;
     ip_addresses = option_of_yojson (value_for_key ip_addresses_of_yojson "IpAddresses") _list path;
     enabled = option_of_yojson (value_for_key generic_boolean_of_yojson "Enabled") _list path;
   }
    : update_accelerator_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let resource_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tags_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let remove_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_identifiers =
       value_for_key endpoint_identifiers_of_yojson "EndpointIdentifiers" _list path;
     endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path;
   }
    : remove_endpoints_request)

let remove_custom_routing_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_ids = value_for_key endpoint_ids_of_yojson "EndpointIds" _list path;
     endpoint_group_arn = value_for_key generic_string_of_yojson "EndpointGroupArn" _list path;
   }
    : remove_custom_routing_endpoints_request)

let provision_byoip_cidr_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ byoip_cidr = option_of_yojson (value_for_key byoip_cidr_of_yojson "ByoipCidr") _list path }
    : provision_byoip_cidr_response)

let provision_byoip_cidr_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cidr = value_for_key generic_string_of_yojson "Cidr" _list path;
     cidr_authorization_context =
       value_for_key cidr_authorization_context_of_yojson "CidrAuthorizationContext" _list path;
   }
    : provision_byoip_cidr_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let listeners_of_yojson tree path = list_of_yojson listener_of_yojson tree path

let list_listeners_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listeners = option_of_yojson (value_for_key listeners_of_yojson "Listeners") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_listeners_response)

let max_results_of_yojson = int_of_yojson

let list_listeners_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_listeners_request)

let list_endpoint_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_groups =
       option_of_yojson (value_for_key endpoint_groups_of_yojson "EndpointGroups") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_endpoint_groups_response)

let list_endpoint_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_endpoint_groups_request)

let list_custom_routing_port_mappings_by_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_port_mappings =
       option_of_yojson
         (value_for_key destination_port_mappings_of_yojson "DestinationPortMappings")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_port_mappings_by_destination_response)

let port_mappings_max_results_of_yojson = int_of_yojson

let list_custom_routing_port_mappings_by_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_id = value_for_key generic_string_of_yojson "EndpointId" _list path;
     destination_address = value_for_key generic_string_of_yojson "DestinationAddress" _list path;
     max_results =
       option_of_yojson (value_for_key port_mappings_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_port_mappings_by_destination_request)

let port_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_port =
       option_of_yojson (value_for_key port_number_of_yojson "AcceleratorPort") _list path;
     endpoint_group_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupArn") _list path;
     endpoint_id = option_of_yojson (value_for_key generic_string_of_yojson "EndpointId") _list path;
     destination_socket_address =
       option_of_yojson
         (value_for_key socket_address_of_yojson "DestinationSocketAddress")
         _list path;
     protocols =
       option_of_yojson (value_for_key custom_routing_protocols_of_yojson "Protocols") _list path;
     destination_traffic_state =
       option_of_yojson
         (value_for_key custom_routing_destination_traffic_state_of_yojson "DestinationTrafficState")
         _list path;
   }
    : port_mapping)

let port_mappings_of_yojson tree path = list_of_yojson port_mapping_of_yojson tree path

let list_custom_routing_port_mappings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port_mappings =
       option_of_yojson (value_for_key port_mappings_of_yojson "PortMappings") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_port_mappings_response)

let list_custom_routing_port_mappings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     endpoint_group_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "EndpointGroupArn") _list path;
     max_results =
       option_of_yojson (value_for_key port_mappings_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_port_mappings_request)

let list_custom_routing_listeners_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listeners =
       option_of_yojson (value_for_key custom_routing_listeners_of_yojson "Listeners") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_listeners_response)

let list_custom_routing_listeners_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn = value_for_key generic_string_of_yojson "AcceleratorArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_listeners_request)

let list_custom_routing_endpoint_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_groups =
       option_of_yojson
         (value_for_key custom_routing_endpoint_groups_of_yojson "EndpointGroups")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_endpoint_groups_response)

let list_custom_routing_endpoint_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arn = value_for_key generic_string_of_yojson "ListenerArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_endpoint_groups_request)

let list_custom_routing_accelerators_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerators =
       option_of_yojson
         (value_for_key custom_routing_accelerators_of_yojson "Accelerators")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_accelerators_response)

let list_custom_routing_accelerators_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_custom_routing_accelerators_request)

let list_cross_account_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_resources =
       option_of_yojson
         (value_for_key cross_account_resources_of_yojson "CrossAccountResources")
         _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_cross_account_resources_response)

let list_cross_account_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerator_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "AcceleratorArn") _list path;
     resource_owner_aws_account_id =
       value_for_key aws_account_id_of_yojson "ResourceOwnerAwsAccountId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_cross_account_resources_request)

let list_cross_account_resource_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_owner_aws_account_ids =
       option_of_yojson
         (value_for_key aws_account_ids_of_yojson "ResourceOwnerAwsAccountIds")
         _list path;
   }
    : list_cross_account_resource_accounts_response)

let list_cross_account_resource_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let list_cross_account_attachments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_attachments =
       option_of_yojson (value_for_key attachments_of_yojson "CrossAccountAttachments") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_cross_account_attachments_response)

let list_cross_account_attachments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_cross_account_attachments_request)

let list_byoip_cidrs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byoip_cidrs = option_of_yojson (value_for_key byoip_cidrs_of_yojson "ByoipCidrs") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_byoip_cidrs_response)

let list_byoip_cidrs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_byoip_cidrs_request)

let list_accelerators_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accelerators =
       option_of_yojson (value_for_key accelerators_of_yojson "Accelerators") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_accelerators_response)

let list_accelerators_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
   }
    : list_accelerators_request)
