open Types

let make_update_service_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_service_response)

let make_dns_record ~tt_l:(tt_l_ : record_tt_l) ~type_:(type__ : record_type) () =
  ({ tt_l = tt_l_; type_ = type__ } : dns_record)

let make_dns_config_change ~dns_records:(dns_records_ : dns_record_list) () =
  ({ dns_records = dns_records_ } : dns_config_change)

let make_health_check_config ?failure_threshold:(failure_threshold_ : failure_threshold option)
    ?resource_path:(resource_path_ : resource_path option) ~type_:(type__ : health_check_type) () =
  ({ failure_threshold = failure_threshold_; resource_path = resource_path_; type_ = type__ }
    : health_check_config)

let make_service_change ?health_check_config:(health_check_config_ : health_check_config option)
    ?dns_config:(dns_config_ : dns_config_change option)
    ?description:(description_ : resource_description option) () =
  ({
     health_check_config = health_check_config_;
     dns_config = dns_config_;
     description = description_;
   }
    : service_change)

let make_update_service_request ~service:(service_ : service_change) ~id:(id_ : resource_id) () =
  ({ service = service_; id = id_ } : update_service_request)

let make_update_service_attributes_response () = (() : unit)

let make_update_service_attributes_request ~attributes:(attributes_ : service_attributes_map)
    ~service_id:(service_id_ : resource_id) () =
  ({ attributes = attributes_; service_id = service_id_ } : update_service_attributes_request)

let make_update_public_dns_namespace_response ?operation_id:(operation_id_ : operation_id option) ()
    =
  ({ operation_id = operation_id_ } : update_public_dns_namespace_response)

let make_soa_change ~tt_l:(tt_l_ : record_tt_l) () = ({ tt_l = tt_l_ } : soa_change)

let make_public_dns_properties_mutable_change ~so_a:(so_a_ : soa_change) () =
  ({ so_a = so_a_ } : public_dns_properties_mutable_change)

let make_public_dns_namespace_properties_change
    ~dns_properties:(dns_properties_ : public_dns_properties_mutable_change) () =
  ({ dns_properties = dns_properties_ } : public_dns_namespace_properties_change)

let make_public_dns_namespace_change
    ?properties:(properties_ : public_dns_namespace_properties_change option)
    ?description:(description_ : resource_description option) () =
  ({ properties = properties_; description = description_ } : public_dns_namespace_change)

let make_update_public_dns_namespace_request
    ?updater_request_id:(updater_request_id_ : resource_id option)
    ~namespace:(namespace_ : public_dns_namespace_change) ~id:(id_ : resource_id) () =
  ({ namespace = namespace_; updater_request_id = updater_request_id_; id = id_ }
    : update_public_dns_namespace_request)

let make_update_private_dns_namespace_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : update_private_dns_namespace_response)

let make_private_dns_properties_mutable_change ~so_a:(so_a_ : soa_change) () =
  ({ so_a = so_a_ } : private_dns_properties_mutable_change)

let make_private_dns_namespace_properties_change
    ~dns_properties:(dns_properties_ : private_dns_properties_mutable_change) () =
  ({ dns_properties = dns_properties_ } : private_dns_namespace_properties_change)

let make_private_dns_namespace_change
    ?properties:(properties_ : private_dns_namespace_properties_change option)
    ?description:(description_ : resource_description option) () =
  ({ properties = properties_; description = description_ } : private_dns_namespace_change)

let make_update_private_dns_namespace_request
    ?updater_request_id:(updater_request_id_ : resource_id option)
    ~namespace:(namespace_ : private_dns_namespace_change) ~id:(id_ : resource_id) () =
  ({ namespace = namespace_; updater_request_id = updater_request_id_; id = id_ }
    : update_private_dns_namespace_request)

let make_update_instance_custom_health_status_request ~status:(status_ : custom_health_status)
    ~instance_id:(instance_id_ : resource_id) ~service_id:(service_id_ : resource_id) () =
  ({ status = status_; instance_id = instance_id_; service_id = service_id_ }
    : update_instance_custom_health_status_request)

let make_update_http_namespace_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_http_namespace_response)

let make_http_namespace_change ~description:(description_ : resource_description) () =
  ({ description = description_ } : http_namespace_change)

let make_update_http_namespace_request
    ?updater_request_id:(updater_request_id_ : resource_id option)
    ~namespace:(namespace_ : http_namespace_change) ~id:(id_ : resource_id) () =
  ({ namespace = namespace_; updater_request_id = updater_request_id_; id = id_ }
    : update_http_namespace_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_dns_config ?routing_policy:(routing_policy_ : routing_policy option)
    ?namespace_id:(namespace_id_ : resource_id option) ~dns_records:(dns_records_ : dns_record_list)
    () =
  ({ dns_records = dns_records_; routing_policy = routing_policy_; namespace_id = namespace_id_ }
    : dns_config)

let make_health_check_custom_config
    ?failure_threshold:(failure_threshold_ : failure_threshold option) () =
  ({ failure_threshold = failure_threshold_ } : health_check_custom_config)

let make_service_summary ?create_date:(create_date_ : timestamp option)
    ?health_check_custom_config:(health_check_custom_config_ : health_check_custom_config option)
    ?health_check_config:(health_check_config_ : health_check_config option)
    ?dns_config:(dns_config_ : dns_config option)
    ?instance_count:(instance_count_ : resource_count option)
    ?description:(description_ : resource_description option) ?type_:(type__ : service_type option)
    ?name:(name_ : service_name option) ?arn:(arn_ : arn option) ?id:(id_ : resource_id option) () =
  ({
     create_date = create_date_;
     health_check_custom_config = health_check_custom_config_;
     health_check_config = health_check_config_;
     dns_config = dns_config_;
     instance_count = instance_count_;
     description = description_;
     type_ = type__;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : service_summary)

let make_service_filter ?condition:(condition_ : filter_condition option)
    ~values:(values_ : filter_values) ~name:(name_ : service_filter_name) () =
  ({ condition = condition_; values = values_; name = name_ } : service_filter)

let make_service_attributes ?attributes:(attributes_ : service_attributes_map option)
    ?service_arn:(service_arn_ : arn option) () =
  ({ attributes = attributes_; service_arn = service_arn_ } : service_attributes)

let make_service ?creator_request_id:(creator_request_id_ : resource_id option)
    ?create_date:(create_date_ : timestamp option)
    ?health_check_custom_config:(health_check_custom_config_ : health_check_custom_config option)
    ?health_check_config:(health_check_config_ : health_check_config option)
    ?type_:(type__ : service_type option) ?dns_config:(dns_config_ : dns_config option)
    ?instance_count:(instance_count_ : resource_count option)
    ?description:(description_ : resource_description option)
    ?namespace_id:(namespace_id_ : resource_id option) ?name:(name_ : service_name option)
    ?arn:(arn_ : arn option) ?id:(id_ : resource_id option) () =
  ({
     creator_request_id = creator_request_id_;
     create_date = create_date_;
     health_check_custom_config = health_check_custom_config_;
     health_check_config = health_check_config_;
     type_ = type__;
     dns_config = dns_config_;
     instance_count = instance_count_;
     description = description_;
     namespace_id = namespace_id_;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : service)

let make_so_a ~tt_l:(tt_l_ : record_tt_l) () = ({ tt_l = tt_l_ } : so_a)

let make_register_instance_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : register_instance_response)

let make_register_instance_request ?creator_request_id:(creator_request_id_ : resource_id option)
    ~attributes:(attributes_ : attributes) ~instance_id:(instance_id_ : instance_id)
    ~service_id:(service_id_ : resource_id) () =
  ({
     attributes = attributes_;
     creator_request_id = creator_request_id_;
     instance_id = instance_id_;
     service_id = service_id_;
   }
    : register_instance_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_services_response ?next_token:(next_token_ : next_token option)
    ?services:(services_ : service_summaries_list option) () =
  ({ next_token = next_token_; services = services_ } : list_services_response)

let make_list_services_request ?filters:(filters_ : service_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_services_request)

let make_operation_summary ?status:(status_ : operation_status option)
    ?id:(id_ : operation_id option) () =
  ({ status = status_; id = id_ } : operation_summary)

let make_list_operations_response ?next_token:(next_token_ : next_token option)
    ?operations:(operations_ : operation_summary_list option) () =
  ({ next_token = next_token_; operations = operations_ } : list_operations_response)

let make_operation_filter ?condition:(condition_ : filter_condition option)
    ~values:(values_ : filter_values) ~name:(name_ : operation_filter_name) () =
  ({ condition = condition_; values = values_; name = name_ } : operation_filter)

let make_list_operations_request ?filters:(filters_ : operation_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_operations_request)

let make_dns_properties ?so_a:(so_a_ : so_a option)
    ?hosted_zone_id:(hosted_zone_id_ : resource_id option) () =
  ({ so_a = so_a_; hosted_zone_id = hosted_zone_id_ } : dns_properties)

let make_http_properties ?http_name:(http_name_ : namespace_name option) () =
  ({ http_name = http_name_ } : http_properties)

let make_namespace_properties ?http_properties:(http_properties_ : http_properties option)
    ?dns_properties:(dns_properties_ : dns_properties option) () =
  ({ http_properties = http_properties_; dns_properties = dns_properties_ } : namespace_properties)

let make_namespace_summary ?create_date:(create_date_ : timestamp option)
    ?properties:(properties_ : namespace_properties option)
    ?service_count:(service_count_ : resource_count option)
    ?description:(description_ : resource_description option)
    ?type_:(type__ : namespace_type option) ?name:(name_ : namespace_name option)
    ?arn:(arn_ : arn option) ?id:(id_ : resource_id option) () =
  ({
     create_date = create_date_;
     properties = properties_;
     service_count = service_count_;
     description = description_;
     type_ = type__;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : namespace_summary)

let make_list_namespaces_response ?next_token:(next_token_ : next_token option)
    ?namespaces:(namespaces_ : namespace_summaries_list option) () =
  ({ next_token = next_token_; namespaces = namespaces_ } : list_namespaces_response)

let make_namespace_filter ?condition:(condition_ : filter_condition option)
    ~values:(values_ : filter_values) ~name:(name_ : namespace_filter_name) () =
  ({ condition = condition_; values = values_; name = name_ } : namespace_filter)

let make_list_namespaces_request ?filters:(filters_ : namespace_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_namespaces_request)

let make_instance_summary ?attributes:(attributes_ : attributes option)
    ?id:(id_ : resource_id option) () =
  ({ attributes = attributes_; id = id_ } : instance_summary)

let make_list_instances_response ?next_token:(next_token_ : next_token option)
    ?instances:(instances_ : instance_summary_list option) () =
  ({ next_token = next_token_; instances = instances_ } : list_instances_response)

let make_list_instances_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~service_id:(service_id_ : resource_id) () =
  ({ max_results = max_results_; next_token = next_token_; service_id = service_id_ }
    : list_instances_request)

let make_get_service_attributes_response
    ?service_attributes:(service_attributes_ : service_attributes option) () =
  ({ service_attributes = service_attributes_ } : get_service_attributes_response)

let make_get_service_attributes_request ~service_id:(service_id_ : resource_id) () =
  ({ service_id = service_id_ } : get_service_attributes_request)

let make_get_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : get_service_response)

let make_get_service_request ~id:(id_ : resource_id) () = ({ id = id_ } : get_service_request)

let make_operation ?targets:(targets_ : operation_targets_map option)
    ?update_date:(update_date_ : timestamp option) ?create_date:(create_date_ : timestamp option)
    ?error_code:(error_code_ : code option) ?error_message:(error_message_ : message option)
    ?status:(status_ : operation_status option) ?type_:(type__ : operation_type option)
    ?id:(id_ : operation_id option) () =
  ({
     targets = targets_;
     update_date = update_date_;
     create_date = create_date_;
     error_code = error_code_;
     error_message = error_message_;
     status = status_;
     type_ = type__;
     id = id_;
   }
    : operation)

let make_get_operation_response ?operation:(operation_ : operation option) () =
  ({ operation = operation_ } : get_operation_response)

let make_get_operation_request ~operation_id:(operation_id_ : resource_id) () =
  ({ operation_id = operation_id_ } : get_operation_request)

let make_namespace ?creator_request_id:(creator_request_id_ : resource_id option)
    ?create_date:(create_date_ : timestamp option)
    ?properties:(properties_ : namespace_properties option)
    ?service_count:(service_count_ : resource_count option)
    ?description:(description_ : resource_description option)
    ?type_:(type__ : namespace_type option) ?name:(name_ : namespace_name option)
    ?arn:(arn_ : arn option) ?id:(id_ : resource_id option) () =
  ({
     creator_request_id = creator_request_id_;
     create_date = create_date_;
     properties = properties_;
     service_count = service_count_;
     description = description_;
     type_ = type__;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : namespace)

let make_get_namespace_response ?namespace:(namespace_ : namespace option) () =
  ({ namespace = namespace_ } : get_namespace_response)

let make_get_namespace_request ~id:(id_ : resource_id) () = ({ id = id_ } : get_namespace_request)

let make_get_instances_health_status_response ?next_token:(next_token_ : next_token option)
    ?status:(status_ : instance_health_status_map option) () =
  ({ next_token = next_token_; status = status_ } : get_instances_health_status_response)

let make_get_instances_health_status_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?instances:(instances_ : instance_id_list option) ~service_id:(service_id_ : resource_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     instances = instances_;
     service_id = service_id_;
   }
    : get_instances_health_status_request)

let make_instance ?attributes:(attributes_ : attributes option)
    ?creator_request_id:(creator_request_id_ : resource_id option) ~id:(id_ : resource_id) () =
  ({ attributes = attributes_; creator_request_id = creator_request_id_; id = id_ } : instance)

let make_get_instance_response ?instance:(instance_ : instance option) () =
  ({ instance = instance_ } : get_instance_response)

let make_get_instance_request ~instance_id:(instance_id_ : resource_id)
    ~service_id:(service_id_ : resource_id) () =
  ({ instance_id = instance_id_; service_id = service_id_ } : get_instance_request)

let make_discover_instances_revision_response
    ?instances_revision:(instances_revision_ : revision option) () =
  ({ instances_revision = instances_revision_ } : discover_instances_revision_response)

let make_discover_instances_revision_request ~service_name:(service_name_ : service_name)
    ~namespace_name:(namespace_name_ : namespace_name) () =
  ({ service_name = service_name_; namespace_name = namespace_name_ }
    : discover_instances_revision_request)

let make_http_instance_summary ?attributes:(attributes_ : attributes option)
    ?health_status:(health_status_ : health_status option)
    ?service_name:(service_name_ : service_name option)
    ?namespace_name:(namespace_name_ : namespace_name_http option)
    ?instance_id:(instance_id_ : resource_id option) () =
  ({
     attributes = attributes_;
     health_status = health_status_;
     service_name = service_name_;
     namespace_name = namespace_name_;
     instance_id = instance_id_;
   }
    : http_instance_summary)

let make_discover_instances_response ?instances_revision:(instances_revision_ : revision option)
    ?instances:(instances_ : http_instance_summary_list option) () =
  ({ instances_revision = instances_revision_; instances = instances_ }
    : discover_instances_response)

let make_discover_instances_request ?health_status:(health_status_ : health_status_filter option)
    ?optional_parameters:(optional_parameters_ : attributes option)
    ?query_parameters:(query_parameters_ : attributes option)
    ?max_results:(max_results_ : discover_max_results option)
    ~service_name:(service_name_ : service_name) ~namespace_name:(namespace_name_ : namespace_name)
    () =
  ({
     health_status = health_status_;
     optional_parameters = optional_parameters_;
     query_parameters = query_parameters_;
     max_results = max_results_;
     service_name = service_name_;
     namespace_name = namespace_name_;
   }
    : discover_instances_request)

let make_deregister_instance_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : deregister_instance_response)

let make_deregister_instance_request ~instance_id:(instance_id_ : resource_id)
    ~service_id:(service_id_ : resource_id) () =
  ({ instance_id = instance_id_; service_id = service_id_ } : deregister_instance_request)

let make_delete_service_attributes_response () = (() : unit)

let make_delete_service_attributes_request ~attributes:(attributes_ : service_attribute_key_list)
    ~service_id:(service_id_ : resource_id) () =
  ({ attributes = attributes_; service_id = service_id_ } : delete_service_attributes_request)

let make_delete_service_response () = (() : unit)
let make_delete_service_request ~id:(id_ : resource_id) () = ({ id = id_ } : delete_service_request)

let make_delete_namespace_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : delete_namespace_response)

let make_delete_namespace_request ~id:(id_ : resource_id) () =
  ({ id = id_ } : delete_namespace_request)

let make_create_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : create_service_response)

let make_create_service_request ?type_:(type__ : service_type_option option)
    ?tags:(tags_ : tag_list option)
    ?health_check_custom_config:(health_check_custom_config_ : health_check_custom_config option)
    ?health_check_config:(health_check_config_ : health_check_config option)
    ?dns_config:(dns_config_ : dns_config option)
    ?description:(description_ : resource_description option)
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ?namespace_id:(namespace_id_ : resource_id option) ~name:(name_ : service_name) () =
  ({
     type_ = type__;
     tags = tags_;
     health_check_custom_config = health_check_custom_config_;
     health_check_config = health_check_config_;
     dns_config = dns_config_;
     description = description_;
     creator_request_id = creator_request_id_;
     namespace_id = namespace_id_;
     name = name_;
   }
    : create_service_request)

let make_create_public_dns_namespace_response ?operation_id:(operation_id_ : operation_id option) ()
    =
  ({ operation_id = operation_id_ } : create_public_dns_namespace_response)

let make_public_dns_properties_mutable ~so_a:(so_a_ : so_a) () =
  ({ so_a = so_a_ } : public_dns_properties_mutable)

let make_public_dns_namespace_properties
    ~dns_properties:(dns_properties_ : public_dns_properties_mutable) () =
  ({ dns_properties = dns_properties_ } : public_dns_namespace_properties)

let make_create_public_dns_namespace_request
    ?properties:(properties_ : public_dns_namespace_properties option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : resource_description option)
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ~name:(name_ : namespace_name_public) () =
  ({
     properties = properties_;
     tags = tags_;
     description = description_;
     creator_request_id = creator_request_id_;
     name = name_;
   }
    : create_public_dns_namespace_request)

let make_create_private_dns_namespace_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : create_private_dns_namespace_response)

let make_private_dns_properties_mutable ~so_a:(so_a_ : so_a) () =
  ({ so_a = so_a_ } : private_dns_properties_mutable)

let make_private_dns_namespace_properties
    ~dns_properties:(dns_properties_ : private_dns_properties_mutable) () =
  ({ dns_properties = dns_properties_ } : private_dns_namespace_properties)

let make_create_private_dns_namespace_request
    ?properties:(properties_ : private_dns_namespace_properties option)
    ?tags:(tags_ : tag_list option) ?description:(description_ : resource_description option)
    ?creator_request_id:(creator_request_id_ : resource_id option) ~vpc:(vpc_ : resource_id)
    ~name:(name_ : namespace_name_private) () =
  ({
     properties = properties_;
     tags = tags_;
     vpc = vpc_;
     description = description_;
     creator_request_id = creator_request_id_;
     name = name_;
   }
    : create_private_dns_namespace_request)

let make_create_http_namespace_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : create_http_namespace_response)

let make_create_http_namespace_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : resource_description option)
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ~name:(name_ : namespace_name_http) () =
  ({
     tags = tags_;
     description = description_;
     creator_request_id = creator_request_id_;
     name = name_;
   }
    : create_http_namespace_request)
