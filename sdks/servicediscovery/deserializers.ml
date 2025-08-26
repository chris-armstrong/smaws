open Smaws_Lib.Json.DeserializeHelpers
open Types
let operation_id_of_yojson = string_of_yojson
let update_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : update_service_response)
let resource_id_of_yojson = string_of_yojson
let resource_description_of_yojson = string_of_yojson
let base_unit_of_yojson = unit_of_yojson
let record_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CNAME" -> CNAME
    | `String "AAAA" -> AAAA
    | `String "A" -> A
    | `String "SRV" -> SRV
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecordType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordType") : record_type) : 
  record_type)
let record_tt_l_of_yojson = long_of_yojson
let dns_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tt_l = (value_for_key record_tt_l_of_yojson "TTL" _list path);
     type_ = (value_for_key record_type_of_yojson "Type" _list path)
   } : dns_record)
let dns_record_list_of_yojson tree path =
  list_of_yojson dns_record_of_yojson tree path
let dns_config_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_records =
       (value_for_key dns_record_list_of_yojson "DnsRecords" _list path)
   } : dns_config_change)
let health_check_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TCP" -> TCP
    | `String "HTTPS" -> HTTPS
    | `String "HTTP" -> HTTP
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "HealthCheckType" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthCheckType") : 
     health_check_type) : health_check_type)
let resource_path_of_yojson = string_of_yojson
let failure_threshold_of_yojson = int_of_yojson
let health_check_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_threshold =
       (option_of_yojson
          (value_for_key failure_threshold_of_yojson "FailureThreshold")
          _list path);
     resource_path =
       (option_of_yojson
          (value_for_key resource_path_of_yojson "ResourcePath") _list path);
     type_ = (value_for_key health_check_type_of_yojson "Type" _list path)
   } : health_check_config)
let service_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_check_config =
       (option_of_yojson
          (value_for_key health_check_config_of_yojson "HealthCheckConfig")
          _list path);
     dns_config =
       (option_of_yojson
          (value_for_key dns_config_change_of_yojson "DnsConfig") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path)
   } : service_change)
let update_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service = (value_for_key service_change_of_yojson "Service" _list path);
     id = (value_for_key resource_id_of_yojson "Id" _list path)
   } : update_service_request)
let update_service_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let service_attribute_value_of_yojson = string_of_yojson
let service_attribute_key_of_yojson = string_of_yojson
let service_attributes_map_of_yojson tree path =
  map_of_yojson service_attribute_key_of_yojson
    service_attribute_value_of_yojson tree path
let update_service_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (value_for_key service_attributes_map_of_yojson "Attributes" _list
          path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : update_service_attributes_request)
let error_message_of_yojson = string_of_yojson
let service_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : service_not_found)
let service_attributes_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : service_attributes_limit_exceeded_exception)
let invalid_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : invalid_input)
let duplicate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duplicate_operation_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "DuplicateOperationId") _list
          path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : duplicate_request)
let update_public_dns_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : update_public_dns_namespace_response)
let soa_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tt_l = (value_for_key record_tt_l_of_yojson "TTL" _list path) } : 
    soa_change)
let public_dns_properties_mutable_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ so_a = (value_for_key soa_change_of_yojson "SOA" _list path) } : 
    public_dns_properties_mutable_change)
let public_dns_namespace_properties_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_properties =
       (value_for_key public_dns_properties_mutable_change_of_yojson
          "DnsProperties" _list path)
   } : public_dns_namespace_properties_change)
let public_dns_namespace_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       (option_of_yojson
          (value_for_key public_dns_namespace_properties_change_of_yojson
             "Properties") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path)
   } : public_dns_namespace_change)
let update_public_dns_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace =
       (value_for_key public_dns_namespace_change_of_yojson "Namespace" _list
          path);
     updater_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "UpdaterRequestId") _list path);
     id = (value_for_key resource_id_of_yojson "Id" _list path)
   } : update_public_dns_namespace_request)
let resource_in_use_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_in_use)
let namespace_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : namespace_not_found)
let update_private_dns_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : update_private_dns_namespace_response)
let private_dns_properties_mutable_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ so_a = (value_for_key soa_change_of_yojson "SOA" _list path) } : 
    private_dns_properties_mutable_change)
let private_dns_namespace_properties_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_properties =
       (value_for_key private_dns_properties_mutable_change_of_yojson
          "DnsProperties" _list path)
   } : private_dns_namespace_properties_change)
let private_dns_namespace_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       (option_of_yojson
          (value_for_key private_dns_namespace_properties_change_of_yojson
             "Properties") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path)
   } : private_dns_namespace_change)
let update_private_dns_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace =
       (value_for_key private_dns_namespace_change_of_yojson "Namespace"
          _list path);
     updater_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "UpdaterRequestId") _list path);
     id = (value_for_key resource_id_of_yojson "Id" _list path)
   } : update_private_dns_namespace_request)
let custom_health_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CustomHealthStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "CustomHealthStatus") : 
     custom_health_status) : custom_health_status)
let update_instance_custom_health_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (value_for_key custom_health_status_of_yojson "Status" _list path);
     instance_id =
       (value_for_key resource_id_of_yojson "InstanceId" _list path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : update_instance_custom_health_status_request)
let instance_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : instance_not_found)
let custom_health_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : custom_health_not_found)
let update_http_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : update_http_namespace_response)
let http_namespace_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (value_for_key resource_description_of_yojson "Description" _list path)
   } : http_namespace_change)
let update_http_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace =
       (value_for_key http_namespace_change_of_yojson "Namespace" _list path);
     updater_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "UpdaterRequestId") _list path);
     id = (value_for_key resource_id_of_yojson "Id" _list path)
   } : update_http_namespace_request)
let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path =
  list_of_yojson tag_key_of_yojson tree path
let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_key_list_of_yojson "TagKeys" _list path);
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : untag_resource_request)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_not_found_exception)
let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       (option_of_yojson
          (value_for_key amazon_resource_name_of_yojson "ResourceName") _list
          path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : too_many_tags_exception)
let timestamp__of_yojson = timestamp_epoch_seconds_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = (value_for_key tag_value_of_yojson "Value" _list path);
     key = (value_for_key tag_key_of_yojson "Key" _list path)
   } : tag)
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_list_of_yojson "Tags" _list path);
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : tag_resource_request)
let service_type_option_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HTTP" -> HTTP
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ServiceTypeOption"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceTypeOption") : 
     service_type_option) : service_type_option)
let service_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DNS" -> DNS
    | `String "DNS_HTTP" -> DNS_HTTP
    | `String "HTTP" -> HTTP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceType") : 
     service_type) : service_type)
let arn_of_yojson = string_of_yojson
let service_name_of_yojson = string_of_yojson
let resource_count_of_yojson = int_of_yojson
let routing_policy_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "WEIGHTED" -> WEIGHTED
    | `String "MULTIVALUE" -> MULTIVALUE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "RoutingPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "RoutingPolicy") : 
     routing_policy) : routing_policy)
let dns_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_records =
       (value_for_key dns_record_list_of_yojson "DnsRecords" _list path);
     routing_policy =
       (option_of_yojson
          (value_for_key routing_policy_of_yojson "RoutingPolicy") _list path);
     namespace_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "NamespaceId")
          _list path)
   } : dns_config)
let health_check_custom_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_threshold =
       (option_of_yojson
          (value_for_key failure_threshold_of_yojson "FailureThreshold")
          _list path)
   } : health_check_custom_config)
let service_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_date =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreateDate")
          _list path);
     health_check_custom_config =
       (option_of_yojson
          (value_for_key health_check_custom_config_of_yojson
             "HealthCheckCustomConfig") _list path);
     health_check_config =
       (option_of_yojson
          (value_for_key health_check_config_of_yojson "HealthCheckConfig")
          _list path);
     dns_config =
       (option_of_yojson (value_for_key dns_config_of_yojson "DnsConfig")
          _list path);
     instance_count =
       (option_of_yojson
          (value_for_key resource_count_of_yojson "InstanceCount") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     type_ =
       (option_of_yojson (value_for_key service_type_of_yojson "Type") _list
          path);
     name =
       (option_of_yojson (value_for_key service_name_of_yojson "Name") _list
          path);
     arn = (option_of_yojson (value_for_key arn_of_yojson "Arn") _list path);
     id =
       (option_of_yojson (value_for_key resource_id_of_yojson "Id") _list
          path)
   } : service_summary)
let service_summaries_list_of_yojson tree path =
  list_of_yojson service_summary_of_yojson tree path
let service_filter_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NAMESPACE_ID" -> NAMESPACE_ID
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ServiceFilterName"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceFilterName") : 
     service_filter_name) : service_filter_name)
let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path =
  list_of_yojson filter_value_of_yojson tree path
let filter_condition_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "BEGINS_WITH" -> BEGINS_WITH
    | `String "BETWEEN" -> BETWEEN
    | `String "IN" -> IN
    | `String "EQ" -> EQ
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "FilterCondition" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterCondition") : 
     filter_condition) : filter_condition)
let service_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition =
       (option_of_yojson
          (value_for_key filter_condition_of_yojson "Condition") _list path);
     values = (value_for_key filter_values_of_yojson "Values" _list path);
     name = (value_for_key service_filter_name_of_yojson "Name" _list path)
   } : service_filter)
let service_filters_of_yojson tree path =
  list_of_yojson service_filter_of_yojson tree path
let service_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (option_of_yojson
          (value_for_key service_attributes_map_of_yojson "Attributes") _list
          path);
     service_arn =
       (option_of_yojson (value_for_key arn_of_yojson "ServiceArn") _list
          path)
   } : service_attributes)
let service_attribute_key_list_of_yojson tree path =
  list_of_yojson service_attribute_key_of_yojson tree path
let service_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "ServiceId")
          _list path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : service_already_exists)
let service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     create_date =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreateDate")
          _list path);
     health_check_custom_config =
       (option_of_yojson
          (value_for_key health_check_custom_config_of_yojson
             "HealthCheckCustomConfig") _list path);
     health_check_config =
       (option_of_yojson
          (value_for_key health_check_config_of_yojson "HealthCheckConfig")
          _list path);
     type_ =
       (option_of_yojson (value_for_key service_type_of_yojson "Type") _list
          path);
     dns_config =
       (option_of_yojson (value_for_key dns_config_of_yojson "DnsConfig")
          _list path);
     instance_count =
       (option_of_yojson
          (value_for_key resource_count_of_yojson "InstanceCount") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     namespace_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "NamespaceId")
          _list path);
     name =
       (option_of_yojson (value_for_key service_name_of_yojson "Name") _list
          path);
     arn = (option_of_yojson (value_for_key arn_of_yojson "Arn") _list path);
     id =
       (option_of_yojson (value_for_key resource_id_of_yojson "Id") _list
          path)
   } : service)
let so_a_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tt_l = (value_for_key record_tt_l_of_yojson "TTL" _list path) } : 
    so_a)
let resource_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : resource_limit_exceeded)
let register_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : register_instance_response)
let instance_id_of_yojson = string_of_yojson
let attr_value_of_yojson = string_of_yojson
let attr_key_of_yojson = string_of_yojson
let attributes_of_yojson tree path =
  map_of_yojson attr_key_of_yojson attr_value_of_yojson tree path
let register_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (value_for_key attributes_of_yojson "Attributes" _list path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     instance_id =
       (value_for_key instance_id_of_yojson "InstanceId" _list path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : register_instance_request)
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path)
   } : list_tags_for_resource_response)
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : list_tags_for_resource_request)
let next_token_of_yojson = string_of_yojson
let list_services_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     services =
       (option_of_yojson
          (value_for_key service_summaries_list_of_yojson "Services") _list
          path)
   } : list_services_response)
let max_results_of_yojson = int_of_yojson
let list_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       (option_of_yojson (value_for_key service_filters_of_yojson "Filters")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_services_request)
let operation_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAIL" -> FAIL
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING" -> PENDING
    | `String "SUBMITTED" -> SUBMITTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus") : 
     operation_status) : operation_status)
let operation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (option_of_yojson (value_for_key operation_status_of_yojson "Status")
          _list path);
     id =
       (option_of_yojson (value_for_key operation_id_of_yojson "Id") _list
          path)
   } : operation_summary)
let operation_summary_list_of_yojson tree path =
  list_of_yojson operation_summary_of_yojson tree path
let list_operations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     operations =
       (option_of_yojson
          (value_for_key operation_summary_list_of_yojson "Operations") _list
          path)
   } : list_operations_response)
let operation_filter_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UPDATE_DATE" -> UPDATE_DATE
    | `String "TYPE" -> TYPE
    | `String "STATUS" -> STATUS
    | `String "SERVICE_ID" -> SERVICE_ID
    | `String "NAMESPACE_ID" -> NAMESPACE_ID
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OperationFilterName"
             value)
    | _ -> raise (deserialize_wrong_type_error path "OperationFilterName") : 
     operation_filter_name) : operation_filter_name)
let operation_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition =
       (option_of_yojson
          (value_for_key filter_condition_of_yojson "Condition") _list path);
     values = (value_for_key filter_values_of_yojson "Values" _list path);
     name = (value_for_key operation_filter_name_of_yojson "Name" _list path)
   } : operation_filter)
let operation_filters_of_yojson tree path =
  list_of_yojson operation_filter_of_yojson tree path
let list_operations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       (option_of_yojson
          (value_for_key operation_filters_of_yojson "Filters") _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_operations_request)
let namespace_name_of_yojson = string_of_yojson
let namespace_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HTTP" -> HTTP
    | `String "DNS_PRIVATE" -> DNS_PRIVATE
    | `String "DNS_PUBLIC" -> DNS_PUBLIC
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "NamespaceType" value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceType") : 
     namespace_type) : namespace_type)
let dns_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     so_a =
       (option_of_yojson (value_for_key so_a_of_yojson "SOA") _list path);
     hosted_zone_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "HostedZoneId")
          _list path)
   } : dns_properties)
let http_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     http_name =
       (option_of_yojson (value_for_key namespace_name_of_yojson "HttpName")
          _list path)
   } : http_properties)
let namespace_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     http_properties =
       (option_of_yojson
          (value_for_key http_properties_of_yojson "HttpProperties") _list
          path);
     dns_properties =
       (option_of_yojson
          (value_for_key dns_properties_of_yojson "DnsProperties") _list path)
   } : namespace_properties)
let namespace_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_date =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreateDate")
          _list path);
     properties =
       (option_of_yojson
          (value_for_key namespace_properties_of_yojson "Properties") _list
          path);
     service_count =
       (option_of_yojson
          (value_for_key resource_count_of_yojson "ServiceCount") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     type_ =
       (option_of_yojson (value_for_key namespace_type_of_yojson "Type")
          _list path);
     name =
       (option_of_yojson (value_for_key namespace_name_of_yojson "Name")
          _list path);
     arn = (option_of_yojson (value_for_key arn_of_yojson "Arn") _list path);
     id =
       (option_of_yojson (value_for_key resource_id_of_yojson "Id") _list
          path)
   } : namespace_summary)
let namespace_summaries_list_of_yojson tree path =
  list_of_yojson namespace_summary_of_yojson tree path
let list_namespaces_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     namespaces =
       (option_of_yojson
          (value_for_key namespace_summaries_list_of_yojson "Namespaces")
          _list path)
   } : list_namespaces_response)
let namespace_filter_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HTTP_NAME" -> HTTP_NAME
    | `String "NAME" -> NAME
    | `String "TYPE" -> TYPE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "NamespaceFilterName"
             value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceFilterName") : 
     namespace_filter_name) : namespace_filter_name)
let namespace_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     condition =
       (option_of_yojson
          (value_for_key filter_condition_of_yojson "Condition") _list path);
     values = (value_for_key filter_values_of_yojson "Values" _list path);
     name = (value_for_key namespace_filter_name_of_yojson "Name" _list path)
   } : namespace_filter)
let namespace_filters_of_yojson tree path =
  list_of_yojson namespace_filter_of_yojson tree path
let list_namespaces_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       (option_of_yojson
          (value_for_key namespace_filters_of_yojson "Filters") _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_namespaces_request)
let instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (option_of_yojson (value_for_key attributes_of_yojson "Attributes")
          _list path);
     id =
       (option_of_yojson (value_for_key resource_id_of_yojson "Id") _list
          path)
   } : instance_summary)
let instance_summary_list_of_yojson tree path =
  list_of_yojson instance_summary_of_yojson tree path
let list_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     instances =
       (option_of_yojson
          (value_for_key instance_summary_list_of_yojson "Instances") _list
          path)
   } : list_instances_response)
let list_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : list_instances_request)
let get_service_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_attributes =
       (option_of_yojson
          (value_for_key service_attributes_of_yojson "ServiceAttributes")
          _list path)
   } : get_service_attributes_response)
let get_service_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : get_service_attributes_request)
let get_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service =
       (option_of_yojson (value_for_key service_of_yojson "Service") _list
          path)
   } : get_service_response)
let get_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key resource_id_of_yojson "Id" _list path) } : get_service_request)
let operation_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : operation_not_found)
let operation_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DEREGISTER_INSTANCE" -> DEREGISTER_INSTANCE
    | `String "REGISTER_INSTANCE" -> REGISTER_INSTANCE
    | `String "UPDATE_SERVICE" -> UPDATE_SERVICE
    | `String "UPDATE_NAMESPACE" -> UPDATE_NAMESPACE
    | `String "DELETE_NAMESPACE" -> DELETE_NAMESPACE
    | `String "CREATE_NAMESPACE" -> CREATE_NAMESPACE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType") : 
     operation_type) : operation_type)
let message_of_yojson = string_of_yojson
let code_of_yojson = string_of_yojson
let operation_target_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "INSTANCE" -> INSTANCE
    | `String "SERVICE" -> SERVICE
    | `String "NAMESPACE" -> NAMESPACE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "OperationTargetType"
             value)
    | _ -> raise (deserialize_wrong_type_error path "OperationTargetType") : 
     operation_target_type) : operation_target_type)
let operation_targets_map_of_yojson tree path =
  map_of_yojson operation_target_type_of_yojson resource_id_of_yojson tree
    path
let operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targets =
       (option_of_yojson
          (value_for_key operation_targets_map_of_yojson "Targets") _list
          path);
     update_date =
       (option_of_yojson (value_for_key timestamp__of_yojson "UpdateDate")
          _list path);
     create_date =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreateDate")
          _list path);
     error_code =
       (option_of_yojson (value_for_key code_of_yojson "ErrorCode") _list
          path);
     error_message =
       (option_of_yojson (value_for_key message_of_yojson "ErrorMessage")
          _list path);
     status =
       (option_of_yojson (value_for_key operation_status_of_yojson "Status")
          _list path);
     type_ =
       (option_of_yojson (value_for_key operation_type_of_yojson "Type")
          _list path);
     id =
       (option_of_yojson (value_for_key operation_id_of_yojson "Id") _list
          path)
   } : operation)
let get_operation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation =
       (option_of_yojson (value_for_key operation_of_yojson "Operation")
          _list path)
   } : get_operation_response)
let get_operation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (value_for_key resource_id_of_yojson "OperationId" _list path)
   } : get_operation_request)
let namespace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     create_date =
       (option_of_yojson (value_for_key timestamp__of_yojson "CreateDate")
          _list path);
     properties =
       (option_of_yojson
          (value_for_key namespace_properties_of_yojson "Properties") _list
          path);
     service_count =
       (option_of_yojson
          (value_for_key resource_count_of_yojson "ServiceCount") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     type_ =
       (option_of_yojson (value_for_key namespace_type_of_yojson "Type")
          _list path);
     name =
       (option_of_yojson (value_for_key namespace_name_of_yojson "Name")
          _list path);
     arn = (option_of_yojson (value_for_key arn_of_yojson "Arn") _list path);
     id =
       (option_of_yojson (value_for_key resource_id_of_yojson "Id") _list
          path)
   } : namespace)
let get_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace =
       (option_of_yojson (value_for_key namespace_of_yojson "Namespace")
          _list path)
   } : get_namespace_response)
let get_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key resource_id_of_yojson "Id" _list path) } : get_namespace_request)
let health_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "HealthStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatus") : 
     health_status) : health_status)
let instance_health_status_map_of_yojson tree path =
  map_of_yojson resource_id_of_yojson health_status_of_yojson tree path
let get_instances_health_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     status =
       (option_of_yojson
          (value_for_key instance_health_status_map_of_yojson "Status") _list
          path)
   } : get_instances_health_status_response)
let instance_id_list_of_yojson tree path =
  list_of_yojson resource_id_of_yojson tree path
let get_instances_health_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     instances =
       (option_of_yojson
          (value_for_key instance_id_list_of_yojson "Instances") _list path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : get_instances_health_status_request)
let instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (option_of_yojson (value_for_key attributes_of_yojson "Attributes")
          _list path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     id = (value_for_key resource_id_of_yojson "Id" _list path)
   } : instance)
let get_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance =
       (option_of_yojson (value_for_key instance_of_yojson "Instance") _list
          path)
   } : get_instance_response)
let get_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id =
       (value_for_key resource_id_of_yojson "InstanceId" _list path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : get_instance_request)
let request_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : request_limit_exceeded)
let revision_of_yojson = long_of_yojson
let discover_instances_revision_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instances_revision =
       (option_of_yojson
          (value_for_key revision_of_yojson "InstancesRevision") _list path)
   } : discover_instances_revision_response)
let discover_instances_revision_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name =
       (value_for_key service_name_of_yojson "ServiceName" _list path);
     namespace_name =
       (value_for_key namespace_name_of_yojson "NamespaceName" _list path)
   } : discover_instances_revision_request)
let namespace_name_http_of_yojson = string_of_yojson
let http_instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (option_of_yojson (value_for_key attributes_of_yojson "Attributes")
          _list path);
     health_status =
       (option_of_yojson
          (value_for_key health_status_of_yojson "HealthStatus") _list path);
     service_name =
       (option_of_yojson (value_for_key service_name_of_yojson "ServiceName")
          _list path);
     namespace_name =
       (option_of_yojson
          (value_for_key namespace_name_http_of_yojson "NamespaceName") _list
          path);
     instance_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "InstanceId")
          _list path)
   } : http_instance_summary)
let http_instance_summary_list_of_yojson tree path =
  list_of_yojson http_instance_summary_of_yojson tree path
let discover_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instances_revision =
       (option_of_yojson
          (value_for_key revision_of_yojson "InstancesRevision") _list path);
     instances =
       (option_of_yojson
          (value_for_key http_instance_summary_list_of_yojson "Instances")
          _list path)
   } : discover_instances_response)
let discover_max_results_of_yojson = int_of_yojson
let health_status_filter_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "HEALTHY_OR_ELSE_ALL" -> HEALTHY_OR_ELSE_ALL
    | `String "ALL" -> ALL
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "HealthStatusFilter"
             value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusFilter") : 
     health_status_filter) : health_status_filter)
let discover_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_status =
       (option_of_yojson
          (value_for_key health_status_filter_of_yojson "HealthStatus") _list
          path);
     optional_parameters =
       (option_of_yojson
          (value_for_key attributes_of_yojson "OptionalParameters") _list
          path);
     query_parameters =
       (option_of_yojson
          (value_for_key attributes_of_yojson "QueryParameters") _list path);
     max_results =
       (option_of_yojson
          (value_for_key discover_max_results_of_yojson "MaxResults") _list
          path);
     service_name =
       (value_for_key service_name_of_yojson "ServiceName" _list path);
     namespace_name =
       (value_for_key namespace_name_of_yojson "NamespaceName" _list path)
   } : discover_instances_request)
let deregister_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : deregister_instance_response)
let deregister_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id =
       (value_for_key resource_id_of_yojson "InstanceId" _list path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : deregister_instance_request)
let delete_service_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_service_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       (value_for_key service_attribute_key_list_of_yojson "Attributes" _list
          path);
     service_id =
       (value_for_key resource_id_of_yojson "ServiceId" _list path)
   } : delete_service_attributes_request)
let delete_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key resource_id_of_yojson "Id" _list path) } : delete_service_request)
let delete_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : delete_namespace_response)
let delete_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = (value_for_key resource_id_of_yojson "Id" _list path) } : delete_namespace_request)
let create_service_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service =
       (option_of_yojson (value_for_key service_of_yojson "Service") _list
          path)
   } : create_service_response)
let create_service_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (option_of_yojson (value_for_key service_type_option_of_yojson "Type")
          _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     health_check_custom_config =
       (option_of_yojson
          (value_for_key health_check_custom_config_of_yojson
             "HealthCheckCustomConfig") _list path);
     health_check_config =
       (option_of_yojson
          (value_for_key health_check_config_of_yojson "HealthCheckConfig")
          _list path);
     dns_config =
       (option_of_yojson (value_for_key dns_config_of_yojson "DnsConfig")
          _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     namespace_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "NamespaceId")
          _list path);
     name = (value_for_key service_name_of_yojson "Name" _list path)
   } : create_service_request)
let namespace_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "NamespaceId")
          _list path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "Message")
          _list path)
   } : namespace_already_exists)
let create_public_dns_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : create_public_dns_namespace_response)
let namespace_name_public_of_yojson = string_of_yojson
let public_dns_properties_mutable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ so_a = (value_for_key so_a_of_yojson "SOA" _list path) } : public_dns_properties_mutable)
let public_dns_namespace_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_properties =
       (value_for_key public_dns_properties_mutable_of_yojson "DnsProperties"
          _list path)
   } : public_dns_namespace_properties)
let create_public_dns_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       (option_of_yojson
          (value_for_key public_dns_namespace_properties_of_yojson
             "Properties") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     name = (value_for_key namespace_name_public_of_yojson "Name" _list path)
   } : create_public_dns_namespace_request)
let create_private_dns_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : create_private_dns_namespace_response)
let namespace_name_private_of_yojson = string_of_yojson
let private_dns_properties_mutable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ so_a = (value_for_key so_a_of_yojson "SOA" _list path) } : private_dns_properties_mutable)
let private_dns_namespace_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_properties =
       (value_for_key private_dns_properties_mutable_of_yojson
          "DnsProperties" _list path)
   } : private_dns_namespace_properties)
let create_private_dns_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       (option_of_yojson
          (value_for_key private_dns_namespace_properties_of_yojson
             "Properties") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     vpc = (value_for_key resource_id_of_yojson "Vpc" _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     name =
       (value_for_key namespace_name_private_of_yojson "Name" _list path)
   } : create_private_dns_namespace_request)
let create_http_namespace_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operation_id =
       (option_of_yojson (value_for_key operation_id_of_yojson "OperationId")
          _list path)
   } : create_http_namespace_response)
let create_http_namespace_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     creator_request_id =
       (option_of_yojson
          (value_for_key resource_id_of_yojson "CreatorRequestId") _list path);
     name = (value_for_key namespace_name_http_of_yojson "Name" _list path)
   } : create_http_namespace_request)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson
let base_float_of_yojson = float_of_yojson
let base_double_of_yojson = double_of_yojson
let base_short_of_yojson = short_of_yojson
let base_blob_of_yojson = blob_of_yojson
let base_byte_of_yojson = byte_of_yojson