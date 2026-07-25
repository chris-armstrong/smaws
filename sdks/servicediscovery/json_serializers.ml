open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_account_id_to_yojson = string_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson
let attr_key_to_yojson = string_to_yojson
let attr_value_to_yojson = string_to_yojson
let attributes_to_yojson tree = map_to_yojson attr_key_to_yojson attr_value_to_yojson tree
let code_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ResourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let resource_limit_exceeded_to_yojson (x : resource_limit_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_id_to_yojson = string_to_yojson

let namespace_already_exists_to_yojson (x : namespace_already_exists) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("CreatorRequestId", option_to_yojson resource_id_to_yojson x.creator_request_id);
      ("NamespaceId", option_to_yojson resource_id_to_yojson x.namespace_id);
    ]

let invalid_input_to_yojson (x : invalid_input) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let operation_id_to_yojson = string_to_yojson

let duplicate_request_to_yojson (x : duplicate_request) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("DuplicateOperationId", option_to_yojson operation_id_to_yojson x.duplicate_operation_id);
    ]

let create_http_namespace_response_to_yojson (x : create_http_namespace_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let resource_description_to_yojson = string_to_yojson
let namespace_name_http_to_yojson = string_to_yojson

let create_http_namespace_request_to_yojson (x : create_http_namespace_request) =
  assoc_to_yojson
    [
      ("Name", Some (namespace_name_http_to_yojson x.name));
      ( "CreatorRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.creator_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_private_dns_namespace_response_to_yojson (x : create_private_dns_namespace_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let record_tt_l_to_yojson = long_to_yojson
let so_a_to_yojson (x : so_a) = assoc_to_yojson [ ("TTL", Some (record_tt_l_to_yojson x.tt_l)) ]

let private_dns_properties_mutable_to_yojson (x : private_dns_properties_mutable) =
  assoc_to_yojson [ ("SOA", Some (so_a_to_yojson x.so_a)) ]

let private_dns_namespace_properties_to_yojson (x : private_dns_namespace_properties) =
  assoc_to_yojson
    [ ("DnsProperties", Some (private_dns_properties_mutable_to_yojson x.dns_properties)) ]

let namespace_name_private_to_yojson = string_to_yojson

let create_private_dns_namespace_request_to_yojson (x : create_private_dns_namespace_request) =
  assoc_to_yojson
    [
      ("Name", Some (namespace_name_private_to_yojson x.name));
      ( "CreatorRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.creator_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("Vpc", Some (resource_id_to_yojson x.vpc));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Properties", option_to_yojson private_dns_namespace_properties_to_yojson x.properties);
    ]

let create_public_dns_namespace_response_to_yojson (x : create_public_dns_namespace_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let public_dns_properties_mutable_to_yojson (x : public_dns_properties_mutable) =
  assoc_to_yojson [ ("SOA", Some (so_a_to_yojson x.so_a)) ]

let public_dns_namespace_properties_to_yojson (x : public_dns_namespace_properties) =
  assoc_to_yojson
    [ ("DnsProperties", Some (public_dns_properties_mutable_to_yojson x.dns_properties)) ]

let namespace_name_public_to_yojson = string_to_yojson

let create_public_dns_namespace_request_to_yojson (x : create_public_dns_namespace_request) =
  assoc_to_yojson
    [
      ("Name", Some (namespace_name_public_to_yojson x.name));
      ( "CreatorRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.creator_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Properties", option_to_yojson public_dns_namespace_properties_to_yojson x.properties);
    ]

let service_already_exists_to_yojson (x : service_already_exists) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("CreatorRequestId", option_to_yojson resource_id_to_yojson x.creator_request_id);
      ("ServiceId", option_to_yojson resource_id_to_yojson x.service_id);
      ("ServiceArn", option_to_yojson arn_to_yojson x.service_arn);
    ]

let namespace_not_found_to_yojson (x : namespace_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let failure_threshold_to_yojson = int_to_yojson

let health_check_custom_config_to_yojson (x : health_check_custom_config) =
  assoc_to_yojson
    [ ("FailureThreshold", option_to_yojson failure_threshold_to_yojson x.failure_threshold) ]

let resource_path_to_yojson = string_to_yojson

let health_check_type_to_yojson (x : health_check_type) =
  match x with HTTP -> `String "HTTP" | HTTPS -> `String "HTTPS" | TCP -> `String "TCP"

let health_check_config_to_yojson (x : health_check_config) =
  assoc_to_yojson
    [
      ("Type", Some (health_check_type_to_yojson x.type_));
      ("ResourcePath", option_to_yojson resource_path_to_yojson x.resource_path);
      ("FailureThreshold", option_to_yojson failure_threshold_to_yojson x.failure_threshold);
    ]

let service_type_to_yojson (x : service_type) =
  match x with HTTP -> `String "HTTP" | DNS_HTTP -> `String "DNS_HTTP" | DNS -> `String "DNS"

let record_type_to_yojson (x : record_type) =
  match x with
  | SRV -> `String "SRV"
  | A -> `String "A"
  | AAAA -> `String "AAAA"
  | CNAME -> `String "CNAME"

let dns_record_to_yojson (x : dns_record) =
  assoc_to_yojson
    [ ("Type", Some (record_type_to_yojson x.type_)); ("TTL", Some (record_tt_l_to_yojson x.tt_l)) ]

let dns_record_list_to_yojson tree = list_to_yojson dns_record_to_yojson tree

let routing_policy_to_yojson (x : routing_policy) =
  match x with MULTIVALUE -> `String "MULTIVALUE" | WEIGHTED -> `String "WEIGHTED"

let dns_config_to_yojson (x : dns_config) =
  assoc_to_yojson
    [
      ("NamespaceId", option_to_yojson resource_id_to_yojson x.namespace_id);
      ("RoutingPolicy", option_to_yojson routing_policy_to_yojson x.routing_policy);
      ("DnsRecords", Some (dns_record_list_to_yojson x.dns_records));
    ]

let resource_count_to_yojson = int_to_yojson
let service_name_to_yojson = string_to_yojson

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("ResourceOwner", option_to_yojson aws_account_id_to_yojson x.resource_owner);
      ("Name", option_to_yojson service_name_to_yojson x.name);
      ("NamespaceId", option_to_yojson resource_id_to_yojson x.namespace_id);
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("InstanceCount", option_to_yojson resource_count_to_yojson x.instance_count);
      ("DnsConfig", option_to_yojson dns_config_to_yojson x.dns_config);
      ("Type", option_to_yojson service_type_to_yojson x.type_);
      ("HealthCheckConfig", option_to_yojson health_check_config_to_yojson x.health_check_config);
      ( "HealthCheckCustomConfig",
        option_to_yojson health_check_custom_config_to_yojson x.health_check_custom_config );
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ("CreatorRequestId", option_to_yojson resource_id_to_yojson x.creator_request_id);
      ("CreatedByAccount", option_to_yojson aws_account_id_to_yojson x.created_by_account);
    ]

let create_service_response_to_yojson (x : create_service_response) =
  assoc_to_yojson [ ("Service", option_to_yojson service_to_yojson x.service) ]

let service_type_option_to_yojson (x : service_type_option) = match x with HTTP -> `String "HTTP"

let create_service_request_to_yojson (x : create_service_request) =
  assoc_to_yojson
    [
      ("Name", Some (service_name_to_yojson x.name));
      ("NamespaceId", option_to_yojson arn_to_yojson x.namespace_id);
      ( "CreatorRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.creator_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("DnsConfig", option_to_yojson dns_config_to_yojson x.dns_config);
      ("HealthCheckConfig", option_to_yojson health_check_config_to_yojson x.health_check_config);
      ( "HealthCheckCustomConfig",
        option_to_yojson health_check_custom_config_to_yojson x.health_check_custom_config );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Type", option_to_yojson service_type_option_to_yojson x.type_);
    ]

let custom_health_not_found_to_yojson (x : custom_health_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let custom_health_status_to_yojson (x : custom_health_status) =
  match x with HEALTHY -> `String "HEALTHY" | UNHEALTHY -> `String "UNHEALTHY"

let resource_in_use_to_yojson (x : resource_in_use) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_namespace_response_to_yojson (x : delete_namespace_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let delete_namespace_request_to_yojson (x : delete_namespace_request) =
  assoc_to_yojson [ ("Id", Some (arn_to_yojson x.id)) ]

let service_not_found_to_yojson (x : service_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_service_response_to_yojson = unit_to_yojson

let delete_service_request_to_yojson (x : delete_service_request) =
  assoc_to_yojson [ ("Id", Some (arn_to_yojson x.id)) ]

let delete_service_attributes_response_to_yojson = unit_to_yojson
let service_attribute_key_to_yojson = string_to_yojson
let service_attribute_key_list_to_yojson tree = list_to_yojson service_attribute_key_to_yojson tree

let delete_service_attributes_request_to_yojson (x : delete_service_attributes_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("Attributes", Some (service_attribute_key_list_to_yojson x.attributes));
    ]

let instance_not_found_to_yojson (x : instance_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let deregister_instance_response_to_yojson (x : deregister_instance_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let deregister_instance_request_to_yojson (x : deregister_instance_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("InstanceId", Some (resource_id_to_yojson x.instance_id));
    ]

let request_limit_exceeded_to_yojson (x : request_limit_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let revision_to_yojson = long_to_yojson

let health_status_to_yojson (x : health_status) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | UNHEALTHY -> `String "UNHEALTHY"
  | UNKNOWN -> `String "UNKNOWN"

let http_instance_summary_to_yojson (x : http_instance_summary) =
  assoc_to_yojson
    [
      ("InstanceId", option_to_yojson resource_id_to_yojson x.instance_id);
      ("NamespaceName", option_to_yojson namespace_name_http_to_yojson x.namespace_name);
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("HealthStatus", option_to_yojson health_status_to_yojson x.health_status);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
    ]

let http_instance_summary_list_to_yojson tree = list_to_yojson http_instance_summary_to_yojson tree

let discover_instances_response_to_yojson (x : discover_instances_response) =
  assoc_to_yojson
    [
      ("Instances", option_to_yojson http_instance_summary_list_to_yojson x.instances);
      ("InstancesRevision", option_to_yojson revision_to_yojson x.instances_revision);
    ]

let health_status_filter_to_yojson (x : health_status_filter) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | UNHEALTHY -> `String "UNHEALTHY"
  | ALL -> `String "ALL"
  | HEALTHY_OR_ELSE_ALL -> `String "HEALTHY_OR_ELSE_ALL"

let discover_max_results_to_yojson = int_to_yojson
let namespace_name_to_yojson = string_to_yojson

let discover_instances_request_to_yojson (x : discover_instances_request) =
  assoc_to_yojson
    [
      ("NamespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("ServiceName", Some (service_name_to_yojson x.service_name));
      ("MaxResults", option_to_yojson discover_max_results_to_yojson x.max_results);
      ("QueryParameters", option_to_yojson attributes_to_yojson x.query_parameters);
      ("OptionalParameters", option_to_yojson attributes_to_yojson x.optional_parameters);
      ("HealthStatus", option_to_yojson health_status_filter_to_yojson x.health_status);
      ("OwnerAccount", option_to_yojson aws_account_id_to_yojson x.owner_account);
    ]

let discover_instances_revision_response_to_yojson (x : discover_instances_revision_response) =
  assoc_to_yojson
    [ ("InstancesRevision", option_to_yojson revision_to_yojson x.instances_revision) ]

let discover_instances_revision_request_to_yojson (x : discover_instances_revision_request) =
  assoc_to_yojson
    [
      ("NamespaceName", Some (namespace_name_to_yojson x.namespace_name));
      ("ServiceName", Some (service_name_to_yojson x.service_name));
      ("OwnerAccount", option_to_yojson aws_account_id_to_yojson x.owner_account);
    ]

let dns_config_change_to_yojson (x : dns_config_change) =
  assoc_to_yojson [ ("DnsRecords", Some (dns_record_list_to_yojson x.dns_records)) ]

let dns_properties_to_yojson (x : dns_properties) =
  assoc_to_yojson
    [
      ("HostedZoneId", option_to_yojson resource_id_to_yojson x.hosted_zone_id);
      ("SOA", option_to_yojson so_a_to_yojson x.so_a);
    ]

let filter_condition_to_yojson (x : filter_condition) =
  match x with
  | EQ -> `String "EQ"
  | IN -> `String "IN"
  | BETWEEN -> `String "BETWEEN"
  | BEGINS_WITH -> `String "BEGINS_WITH"

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let instance_to_yojson (x : instance) =
  assoc_to_yojson
    [
      ("Id", Some (resource_id_to_yojson x.id));
      ("CreatorRequestId", option_to_yojson resource_id_to_yojson x.creator_request_id);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("CreatedByAccount", option_to_yojson aws_account_id_to_yojson x.created_by_account);
    ]

let get_instance_response_to_yojson (x : get_instance_response) =
  assoc_to_yojson
    [
      ("ResourceOwner", option_to_yojson aws_account_id_to_yojson x.resource_owner);
      ("Instance", option_to_yojson instance_to_yojson x.instance);
    ]

let get_instance_request_to_yojson (x : get_instance_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("InstanceId", Some (resource_id_to_yojson x.instance_id));
    ]

let next_token_to_yojson = string_to_yojson

let instance_health_status_map_to_yojson tree =
  map_to_yojson resource_id_to_yojson health_status_to_yojson tree

let get_instances_health_status_response_to_yojson (x : get_instances_health_status_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson instance_health_status_map_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let instance_id_list_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let get_instances_health_status_request_to_yojson (x : get_instances_health_status_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("Instances", option_to_yojson instance_id_list_to_yojson x.instances);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let http_properties_to_yojson (x : http_properties) =
  assoc_to_yojson [ ("HttpName", option_to_yojson namespace_name_to_yojson x.http_name) ]

let namespace_properties_to_yojson (x : namespace_properties) =
  assoc_to_yojson
    [
      ("DnsProperties", option_to_yojson dns_properties_to_yojson x.dns_properties);
      ("HttpProperties", option_to_yojson http_properties_to_yojson x.http_properties);
    ]

let namespace_type_to_yojson (x : namespace_type) =
  match x with
  | DNS_PUBLIC -> `String "DNS_PUBLIC"
  | DNS_PRIVATE -> `String "DNS_PRIVATE"
  | HTTP -> `String "HTTP"

let namespace_to_yojson (x : namespace) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("ResourceOwner", option_to_yojson aws_account_id_to_yojson x.resource_owner);
      ("Name", option_to_yojson namespace_name_to_yojson x.name);
      ("Type", option_to_yojson namespace_type_to_yojson x.type_);
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("ServiceCount", option_to_yojson resource_count_to_yojson x.service_count);
      ("Properties", option_to_yojson namespace_properties_to_yojson x.properties);
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ("CreatorRequestId", option_to_yojson resource_id_to_yojson x.creator_request_id);
    ]

let get_namespace_response_to_yojson (x : get_namespace_response) =
  assoc_to_yojson [ ("Namespace", option_to_yojson namespace_to_yojson x.namespace) ]

let get_namespace_request_to_yojson (x : get_namespace_request) =
  assoc_to_yojson [ ("Id", Some (arn_to_yojson x.id)) ]

let operation_not_found_to_yojson (x : operation_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let operation_target_type_to_yojson (x : operation_target_type) =
  match x with
  | NAMESPACE -> `String "NAMESPACE"
  | SERVICE -> `String "SERVICE"
  | INSTANCE -> `String "INSTANCE"

let operation_targets_map_to_yojson tree =
  map_to_yojson operation_target_type_to_yojson resource_id_to_yojson tree

let message_to_yojson = string_to_yojson

let operation_status_to_yojson (x : operation_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | PENDING -> `String "PENDING"
  | SUCCESS -> `String "SUCCESS"
  | FAIL -> `String "FAIL"

let operation_type_to_yojson (x : operation_type) =
  match x with
  | CREATE_NAMESPACE -> `String "CREATE_NAMESPACE"
  | DELETE_NAMESPACE -> `String "DELETE_NAMESPACE"
  | UPDATE_NAMESPACE -> `String "UPDATE_NAMESPACE"
  | UPDATE_SERVICE -> `String "UPDATE_SERVICE"
  | REGISTER_INSTANCE -> `String "REGISTER_INSTANCE"
  | DEREGISTER_INSTANCE -> `String "DEREGISTER_INSTANCE"

let operation_to_yojson (x : operation) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson operation_id_to_yojson x.id);
      ("OwnerAccount", option_to_yojson aws_account_id_to_yojson x.owner_account);
      ("Type", option_to_yojson operation_type_to_yojson x.type_);
      ("Status", option_to_yojson operation_status_to_yojson x.status);
      ("ErrorMessage", option_to_yojson message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson code_to_yojson x.error_code);
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ("UpdateDate", option_to_yojson timestamp_to_yojson x.update_date);
      ("Targets", option_to_yojson operation_targets_map_to_yojson x.targets);
    ]

let get_operation_response_to_yojson (x : get_operation_response) =
  assoc_to_yojson [ ("Operation", option_to_yojson operation_to_yojson x.operation) ]

let get_operation_request_to_yojson (x : get_operation_request) =
  assoc_to_yojson
    [
      ("OperationId", Some (operation_id_to_yojson x.operation_id));
      ("OwnerAccount", option_to_yojson aws_account_id_to_yojson x.owner_account);
    ]

let get_service_response_to_yojson (x : get_service_response) =
  assoc_to_yojson [ ("Service", option_to_yojson service_to_yojson x.service) ]

let get_service_request_to_yojson (x : get_service_request) =
  assoc_to_yojson [ ("Id", Some (arn_to_yojson x.id)) ]

let service_attribute_value_to_yojson = string_to_yojson

let service_attributes_map_to_yojson tree =
  map_to_yojson service_attribute_key_to_yojson service_attribute_value_to_yojson tree

let service_attributes_to_yojson (x : service_attributes) =
  assoc_to_yojson
    [
      ("ServiceArn", option_to_yojson arn_to_yojson x.service_arn);
      ("ResourceOwner", option_to_yojson aws_account_id_to_yojson x.resource_owner);
      ("Attributes", option_to_yojson service_attributes_map_to_yojson x.attributes);
    ]

let get_service_attributes_response_to_yojson (x : get_service_attributes_response) =
  assoc_to_yojson
    [ ("ServiceAttributes", option_to_yojson service_attributes_to_yojson x.service_attributes) ]

let get_service_attributes_request_to_yojson (x : get_service_attributes_request) =
  assoc_to_yojson [ ("ServiceId", Some (arn_to_yojson x.service_id)) ]

let http_namespace_change_to_yojson (x : http_namespace_change) =
  assoc_to_yojson [ ("Description", Some (resource_description_to_yojson x.description)) ]

let instance_id_to_yojson = string_to_yojson

let instance_summary_to_yojson (x : instance_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("CreatedByAccount", option_to_yojson aws_account_id_to_yojson x.created_by_account);
    ]

let instance_summary_list_to_yojson tree = list_to_yojson instance_summary_to_yojson tree

let list_instances_response_to_yojson (x : list_instances_response) =
  assoc_to_yojson
    [
      ("ResourceOwner", option_to_yojson aws_account_id_to_yojson x.resource_owner);
      ("Instances", option_to_yojson instance_summary_list_to_yojson x.instances);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_instances_request_to_yojson (x : list_instances_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let namespace_summary_to_yojson (x : namespace_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("ResourceOwner", option_to_yojson aws_account_id_to_yojson x.resource_owner);
      ("Name", option_to_yojson namespace_name_to_yojson x.name);
      ("Type", option_to_yojson namespace_type_to_yojson x.type_);
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("ServiceCount", option_to_yojson resource_count_to_yojson x.service_count);
      ("Properties", option_to_yojson namespace_properties_to_yojson x.properties);
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
    ]

let namespace_summaries_list_to_yojson tree = list_to_yojson namespace_summary_to_yojson tree

let list_namespaces_response_to_yojson (x : list_namespaces_response) =
  assoc_to_yojson
    [
      ("Namespaces", option_to_yojson namespace_summaries_list_to_yojson x.namespaces);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let namespace_filter_name_to_yojson (x : namespace_filter_name) =
  match x with
  | TYPE -> `String "TYPE"
  | NAME -> `String "NAME"
  | HTTP_NAME -> `String "HTTP_NAME"
  | RESOURCE_OWNER -> `String "RESOURCE_OWNER"

let namespace_filter_to_yojson (x : namespace_filter) =
  assoc_to_yojson
    [
      ("Name", Some (namespace_filter_name_to_yojson x.name));
      ("Values", Some (filter_values_to_yojson x.values));
      ("Condition", option_to_yojson filter_condition_to_yojson x.condition);
    ]

let namespace_filters_to_yojson tree = list_to_yojson namespace_filter_to_yojson tree

let list_namespaces_request_to_yojson (x : list_namespaces_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson namespace_filters_to_yojson x.filters);
    ]

let operation_summary_to_yojson (x : operation_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson operation_id_to_yojson x.id);
      ("Status", option_to_yojson operation_status_to_yojson x.status);
    ]

let operation_summary_list_to_yojson tree = list_to_yojson operation_summary_to_yojson tree

let list_operations_response_to_yojson (x : list_operations_response) =
  assoc_to_yojson
    [
      ("Operations", option_to_yojson operation_summary_list_to_yojson x.operations);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let operation_filter_name_to_yojson (x : operation_filter_name) =
  match x with
  | NAMESPACE_ID -> `String "NAMESPACE_ID"
  | SERVICE_ID -> `String "SERVICE_ID"
  | STATUS -> `String "STATUS"
  | TYPE -> `String "TYPE"
  | UPDATE_DATE -> `String "UPDATE_DATE"

let operation_filter_to_yojson (x : operation_filter) =
  assoc_to_yojson
    [
      ("Name", Some (operation_filter_name_to_yojson x.name));
      ("Values", Some (filter_values_to_yojson x.values));
      ("Condition", option_to_yojson filter_condition_to_yojson x.condition);
    ]

let operation_filters_to_yojson tree = list_to_yojson operation_filter_to_yojson tree

let list_operations_request_to_yojson (x : list_operations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson operation_filters_to_yojson x.filters);
    ]

let service_summary_to_yojson (x : service_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson resource_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("ResourceOwner", option_to_yojson aws_account_id_to_yojson x.resource_owner);
      ("Name", option_to_yojson service_name_to_yojson x.name);
      ("Type", option_to_yojson service_type_to_yojson x.type_);
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("InstanceCount", option_to_yojson resource_count_to_yojson x.instance_count);
      ("DnsConfig", option_to_yojson dns_config_to_yojson x.dns_config);
      ("HealthCheckConfig", option_to_yojson health_check_config_to_yojson x.health_check_config);
      ( "HealthCheckCustomConfig",
        option_to_yojson health_check_custom_config_to_yojson x.health_check_custom_config );
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ("CreatedByAccount", option_to_yojson aws_account_id_to_yojson x.created_by_account);
    ]

let service_summaries_list_to_yojson tree = list_to_yojson service_summary_to_yojson tree

let list_services_response_to_yojson (x : list_services_response) =
  assoc_to_yojson
    [
      ("Services", option_to_yojson service_summaries_list_to_yojson x.services);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let service_filter_name_to_yojson (x : service_filter_name) =
  match x with NAMESPACE_ID -> `String "NAMESPACE_ID" | RESOURCE_OWNER -> `String "RESOURCE_OWNER"

let service_filter_to_yojson (x : service_filter) =
  assoc_to_yojson
    [
      ("Name", Some (service_filter_name_to_yojson x.name));
      ("Values", Some (filter_values_to_yojson x.values));
      ("Condition", option_to_yojson filter_condition_to_yojson x.condition);
    ]

let service_filters_to_yojson tree = list_to_yojson service_filter_to_yojson tree

let list_services_request_to_yojson (x : list_services_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson service_filters_to_yojson x.filters);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let soa_change_to_yojson (x : soa_change) =
  assoc_to_yojson [ ("TTL", Some (record_tt_l_to_yojson x.tt_l)) ]

let private_dns_properties_mutable_change_to_yojson (x : private_dns_properties_mutable_change) =
  assoc_to_yojson [ ("SOA", Some (soa_change_to_yojson x.so_a)) ]

let private_dns_namespace_properties_change_to_yojson (x : private_dns_namespace_properties_change)
    =
  assoc_to_yojson
    [ ("DnsProperties", Some (private_dns_properties_mutable_change_to_yojson x.dns_properties)) ]

let private_dns_namespace_change_to_yojson (x : private_dns_namespace_change) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("Properties", option_to_yojson private_dns_namespace_properties_change_to_yojson x.properties);
    ]

let public_dns_properties_mutable_change_to_yojson (x : public_dns_properties_mutable_change) =
  assoc_to_yojson [ ("SOA", Some (soa_change_to_yojson x.so_a)) ]

let public_dns_namespace_properties_change_to_yojson (x : public_dns_namespace_properties_change) =
  assoc_to_yojson
    [ ("DnsProperties", Some (public_dns_properties_mutable_change_to_yojson x.dns_properties)) ]

let public_dns_namespace_change_to_yojson (x : public_dns_namespace_change) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("Properties", option_to_yojson public_dns_namespace_properties_change_to_yojson x.properties);
    ]

let register_instance_response_to_yojson (x : register_instance_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let register_instance_request_to_yojson (x : register_instance_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("InstanceId", Some (instance_id_to_yojson x.instance_id));
      ( "CreatorRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.creator_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Attributes", Some (attributes_to_yojson x.attributes));
    ]

let service_attributes_limit_exceeded_exception_to_yojson
    (x : service_attributes_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_service_attributes_response_to_yojson = unit_to_yojson

let update_service_attributes_request_to_yojson (x : update_service_attributes_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("Attributes", Some (service_attributes_map_to_yojson x.attributes));
    ]

let update_service_response_to_yojson (x : update_service_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let service_change_to_yojson (x : service_change) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson resource_description_to_yojson x.description);
      ("DnsConfig", option_to_yojson dns_config_change_to_yojson x.dns_config);
      ("HealthCheckConfig", option_to_yojson health_check_config_to_yojson x.health_check_config);
    ]

let update_service_request_to_yojson (x : update_service_request) =
  assoc_to_yojson
    [ ("Id", Some (arn_to_yojson x.id)); ("Service", Some (service_change_to_yojson x.service)) ]

let update_public_dns_namespace_response_to_yojson (x : update_public_dns_namespace_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let update_public_dns_namespace_request_to_yojson (x : update_public_dns_namespace_request) =
  assoc_to_yojson
    [
      ("Id", Some (arn_to_yojson x.id));
      ( "UpdaterRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.updater_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Namespace", Some (public_dns_namespace_change_to_yojson x.namespace));
    ]

let update_private_dns_namespace_response_to_yojson (x : update_private_dns_namespace_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let update_private_dns_namespace_request_to_yojson (x : update_private_dns_namespace_request) =
  assoc_to_yojson
    [
      ("Id", Some (arn_to_yojson x.id));
      ( "UpdaterRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.updater_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Namespace", Some (private_dns_namespace_change_to_yojson x.namespace));
    ]

let update_instance_custom_health_status_request_to_yojson
    (x : update_instance_custom_health_status_request) =
  assoc_to_yojson
    [
      ("ServiceId", Some (arn_to_yojson x.service_id));
      ("InstanceId", Some (resource_id_to_yojson x.instance_id));
      ("Status", Some (custom_health_status_to_yojson x.status));
    ]

let update_http_namespace_response_to_yojson (x : update_http_namespace_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let update_http_namespace_request_to_yojson (x : update_http_namespace_request) =
  assoc_to_yojson
    [
      ("Id", Some (arn_to_yojson x.id));
      ( "UpdaterRequestId",
        Some
          (resource_id_to_yojson
             (Option.value x.updater_request_id ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Namespace", Some (http_namespace_change_to_yojson x.namespace));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]
