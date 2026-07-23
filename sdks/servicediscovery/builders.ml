open Types

let make_create_http_namespace_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : create_http_namespace_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_http_namespace_request
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ?description:(description_ : resource_description option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : namespace_name_http) () =
  ({
     name = name_;
     creator_request_id = creator_request_id_;
     description = description_;
     tags = tags_;
   }
    : create_http_namespace_request)

let make_create_private_dns_namespace_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : create_private_dns_namespace_response)

let make_so_a ~tt_l:(tt_l_ : record_tt_l) () = ({ tt_l = tt_l_ } : so_a)

let make_private_dns_properties_mutable ~so_a:(so_a_ : so_a) () =
  ({ so_a = so_a_ } : private_dns_properties_mutable)

let make_private_dns_namespace_properties
    ~dns_properties:(dns_properties_ : private_dns_properties_mutable) () =
  ({ dns_properties = dns_properties_ } : private_dns_namespace_properties)

let make_create_private_dns_namespace_request
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ?description:(description_ : resource_description option) ?tags:(tags_ : tag_list option)
    ?properties:(properties_ : private_dns_namespace_properties option)
    ~name:(name_ : namespace_name_private) ~vpc:(vpc_ : resource_id) () =
  ({
     name = name_;
     creator_request_id = creator_request_id_;
     description = description_;
     vpc = vpc_;
     tags = tags_;
     properties = properties_;
   }
    : create_private_dns_namespace_request)

let make_create_public_dns_namespace_response ?operation_id:(operation_id_ : operation_id option) ()
    =
  ({ operation_id = operation_id_ } : create_public_dns_namespace_response)

let make_public_dns_properties_mutable ~so_a:(so_a_ : so_a) () =
  ({ so_a = so_a_ } : public_dns_properties_mutable)

let make_public_dns_namespace_properties
    ~dns_properties:(dns_properties_ : public_dns_properties_mutable) () =
  ({ dns_properties = dns_properties_ } : public_dns_namespace_properties)

let make_create_public_dns_namespace_request
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ?description:(description_ : resource_description option) ?tags:(tags_ : tag_list option)
    ?properties:(properties_ : public_dns_namespace_properties option)
    ~name:(name_ : namespace_name_public) () =
  ({
     name = name_;
     creator_request_id = creator_request_id_;
     description = description_;
     tags = tags_;
     properties = properties_;
   }
    : create_public_dns_namespace_request)

let make_health_check_custom_config
    ?failure_threshold:(failure_threshold_ : failure_threshold option) () =
  ({ failure_threshold = failure_threshold_ } : health_check_custom_config)

let make_health_check_config ?resource_path:(resource_path_ : resource_path option)
    ?failure_threshold:(failure_threshold_ : failure_threshold option)
    ~type_:(type__ : health_check_type) () =
  ({ type_ = type__; resource_path = resource_path_; failure_threshold = failure_threshold_ }
    : health_check_config)

let make_dns_record ~type_:(type__ : record_type) ~tt_l:(tt_l_ : record_tt_l) () =
  ({ type_ = type__; tt_l = tt_l_ } : dns_record)

let make_dns_config ?namespace_id:(namespace_id_ : resource_id option)
    ?routing_policy:(routing_policy_ : routing_policy option)
    ~dns_records:(dns_records_ : dns_record_list) () =
  ({ namespace_id = namespace_id_; routing_policy = routing_policy_; dns_records = dns_records_ }
    : dns_config)

let make_service ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?resource_owner:(resource_owner_ : aws_account_id option) ?name:(name_ : service_name option)
    ?namespace_id:(namespace_id_ : resource_id option)
    ?description:(description_ : resource_description option)
    ?instance_count:(instance_count_ : resource_count option)
    ?dns_config:(dns_config_ : dns_config option) ?type_:(type__ : service_type option)
    ?health_check_config:(health_check_config_ : health_check_config option)
    ?health_check_custom_config:(health_check_custom_config_ : health_check_custom_config option)
    ?create_date:(create_date_ : timestamp option)
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ?created_by_account:(created_by_account_ : aws_account_id option) () =
  ({
     id = id_;
     arn = arn_;
     resource_owner = resource_owner_;
     name = name_;
     namespace_id = namespace_id_;
     description = description_;
     instance_count = instance_count_;
     dns_config = dns_config_;
     type_ = type__;
     health_check_config = health_check_config_;
     health_check_custom_config = health_check_custom_config_;
     create_date = create_date_;
     creator_request_id = creator_request_id_;
     created_by_account = created_by_account_;
   }
    : service)

let make_create_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : create_service_response)

let make_create_service_request ?namespace_id:(namespace_id_ : arn option)
    ?creator_request_id:(creator_request_id_ : resource_id option)
    ?description:(description_ : resource_description option)
    ?dns_config:(dns_config_ : dns_config option)
    ?health_check_config:(health_check_config_ : health_check_config option)
    ?health_check_custom_config:(health_check_custom_config_ : health_check_custom_config option)
    ?tags:(tags_ : tag_list option) ?type_:(type__ : service_type_option option)
    ~name:(name_ : service_name) () =
  ({
     name = name_;
     namespace_id = namespace_id_;
     creator_request_id = creator_request_id_;
     description = description_;
     dns_config = dns_config_;
     health_check_config = health_check_config_;
     health_check_custom_config = health_check_custom_config_;
     tags = tags_;
     type_ = type__;
   }
    : create_service_request)

let make_delete_namespace_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : delete_namespace_response)

let make_delete_namespace_request ~id:(id_ : arn) () = ({ id = id_ } : delete_namespace_request)
let make_delete_service_response () = (() : unit)
let make_delete_service_request ~id:(id_ : arn) () = ({ id = id_ } : delete_service_request)
let make_delete_service_attributes_response () = (() : unit)

let make_delete_service_attributes_request ~service_id:(service_id_ : arn)
    ~attributes:(attributes_ : service_attribute_key_list) () =
  ({ service_id = service_id_; attributes = attributes_ } : delete_service_attributes_request)

let make_deregister_instance_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : deregister_instance_response)

let make_deregister_instance_request ~service_id:(service_id_ : arn)
    ~instance_id:(instance_id_ : resource_id) () =
  ({ service_id = service_id_; instance_id = instance_id_ } : deregister_instance_request)

let make_http_instance_summary ?instance_id:(instance_id_ : resource_id option)
    ?namespace_name:(namespace_name_ : namespace_name_http option)
    ?service_name:(service_name_ : service_name option)
    ?health_status:(health_status_ : health_status option)
    ?attributes:(attributes_ : attributes option) () =
  ({
     instance_id = instance_id_;
     namespace_name = namespace_name_;
     service_name = service_name_;
     health_status = health_status_;
     attributes = attributes_;
   }
    : http_instance_summary)

let make_discover_instances_response ?instances:(instances_ : http_instance_summary_list option)
    ?instances_revision:(instances_revision_ : revision option) () =
  ({ instances = instances_; instances_revision = instances_revision_ }
    : discover_instances_response)

let make_discover_instances_request ?max_results:(max_results_ : discover_max_results option)
    ?query_parameters:(query_parameters_ : attributes option)
    ?optional_parameters:(optional_parameters_ : attributes option)
    ?health_status:(health_status_ : health_status_filter option)
    ?owner_account:(owner_account_ : aws_account_id option)
    ~namespace_name:(namespace_name_ : namespace_name) ~service_name:(service_name_ : service_name)
    () =
  ({
     namespace_name = namespace_name_;
     service_name = service_name_;
     max_results = max_results_;
     query_parameters = query_parameters_;
     optional_parameters = optional_parameters_;
     health_status = health_status_;
     owner_account = owner_account_;
   }
    : discover_instances_request)

let make_discover_instances_revision_response
    ?instances_revision:(instances_revision_ : revision option) () =
  ({ instances_revision = instances_revision_ } : discover_instances_revision_response)

let make_discover_instances_revision_request ?owner_account:(owner_account_ : aws_account_id option)
    ~namespace_name:(namespace_name_ : namespace_name) ~service_name:(service_name_ : service_name)
    () =
  ({
     namespace_name = namespace_name_;
     service_name = service_name_;
     owner_account = owner_account_;
   }
    : discover_instances_revision_request)

let make_dns_config_change ~dns_records:(dns_records_ : dns_record_list) () =
  ({ dns_records = dns_records_ } : dns_config_change)

let make_dns_properties ?hosted_zone_id:(hosted_zone_id_ : resource_id option)
    ?so_a:(so_a_ : so_a option) () =
  ({ hosted_zone_id = hosted_zone_id_; so_a = so_a_ } : dns_properties)

let make_instance ?creator_request_id:(creator_request_id_ : resource_id option)
    ?attributes:(attributes_ : attributes option)
    ?created_by_account:(created_by_account_ : aws_account_id option) ~id:(id_ : resource_id) () =
  ({
     id = id_;
     creator_request_id = creator_request_id_;
     attributes = attributes_;
     created_by_account = created_by_account_;
   }
    : instance)

let make_get_instance_response ?resource_owner:(resource_owner_ : aws_account_id option)
    ?instance:(instance_ : instance option) () =
  ({ resource_owner = resource_owner_; instance = instance_ } : get_instance_response)

let make_get_instance_request ~service_id:(service_id_ : arn)
    ~instance_id:(instance_id_ : resource_id) () =
  ({ service_id = service_id_; instance_id = instance_id_ } : get_instance_request)

let make_get_instances_health_status_response ?status:(status_ : instance_health_status_map option)
    ?next_token:(next_token_ : next_token option) () =
  ({ status = status_; next_token = next_token_ } : get_instances_health_status_response)

let make_get_instances_health_status_request ?instances:(instances_ : instance_id_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~service_id:(service_id_ : arn) () =
  ({
     service_id = service_id_;
     instances = instances_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : get_instances_health_status_request)

let make_http_properties ?http_name:(http_name_ : namespace_name option) () =
  ({ http_name = http_name_ } : http_properties)

let make_namespace_properties ?dns_properties:(dns_properties_ : dns_properties option)
    ?http_properties:(http_properties_ : http_properties option) () =
  ({ dns_properties = dns_properties_; http_properties = http_properties_ } : namespace_properties)

let make_namespace ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?resource_owner:(resource_owner_ : aws_account_id option) ?name:(name_ : namespace_name option)
    ?type_:(type__ : namespace_type option)
    ?description:(description_ : resource_description option)
    ?service_count:(service_count_ : resource_count option)
    ?properties:(properties_ : namespace_properties option)
    ?create_date:(create_date_ : timestamp option)
    ?creator_request_id:(creator_request_id_ : resource_id option) () =
  ({
     id = id_;
     arn = arn_;
     resource_owner = resource_owner_;
     name = name_;
     type_ = type__;
     description = description_;
     service_count = service_count_;
     properties = properties_;
     create_date = create_date_;
     creator_request_id = creator_request_id_;
   }
    : namespace)

let make_get_namespace_response ?namespace:(namespace_ : namespace option) () =
  ({ namespace = namespace_ } : get_namespace_response)

let make_get_namespace_request ~id:(id_ : arn) () = ({ id = id_ } : get_namespace_request)

let make_operation ?id:(id_ : operation_id option)
    ?owner_account:(owner_account_ : aws_account_id option) ?type_:(type__ : operation_type option)
    ?status:(status_ : operation_status option) ?error_message:(error_message_ : message option)
    ?error_code:(error_code_ : code option) ?create_date:(create_date_ : timestamp option)
    ?update_date:(update_date_ : timestamp option)
    ?targets:(targets_ : operation_targets_map option) () =
  ({
     id = id_;
     owner_account = owner_account_;
     type_ = type__;
     status = status_;
     error_message = error_message_;
     error_code = error_code_;
     create_date = create_date_;
     update_date = update_date_;
     targets = targets_;
   }
    : operation)

let make_get_operation_response ?operation:(operation_ : operation option) () =
  ({ operation = operation_ } : get_operation_response)

let make_get_operation_request ?owner_account:(owner_account_ : aws_account_id option)
    ~operation_id:(operation_id_ : operation_id) () =
  ({ operation_id = operation_id_; owner_account = owner_account_ } : get_operation_request)

let make_get_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : get_service_response)

let make_get_service_request ~id:(id_ : arn) () = ({ id = id_ } : get_service_request)

let make_service_attributes ?service_arn:(service_arn_ : arn option)
    ?resource_owner:(resource_owner_ : aws_account_id option)
    ?attributes:(attributes_ : service_attributes_map option) () =
  ({ service_arn = service_arn_; resource_owner = resource_owner_; attributes = attributes_ }
    : service_attributes)

let make_get_service_attributes_response
    ?service_attributes:(service_attributes_ : service_attributes option) () =
  ({ service_attributes = service_attributes_ } : get_service_attributes_response)

let make_get_service_attributes_request ~service_id:(service_id_ : arn) () =
  ({ service_id = service_id_ } : get_service_attributes_request)

let make_http_namespace_change ~description:(description_ : resource_description) () =
  ({ description = description_ } : http_namespace_change)

let make_instance_summary ?id:(id_ : resource_id option)
    ?attributes:(attributes_ : attributes option)
    ?created_by_account:(created_by_account_ : aws_account_id option) () =
  ({ id = id_; attributes = attributes_; created_by_account = created_by_account_ }
    : instance_summary)

let make_list_instances_response ?resource_owner:(resource_owner_ : aws_account_id option)
    ?instances:(instances_ : instance_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resource_owner = resource_owner_; instances = instances_; next_token = next_token_ }
    : list_instances_response)

let make_list_instances_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~service_id:(service_id_ : arn) () =
  ({ service_id = service_id_; next_token = next_token_; max_results = max_results_ }
    : list_instances_request)

let make_namespace_summary ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?resource_owner:(resource_owner_ : aws_account_id option) ?name:(name_ : namespace_name option)
    ?type_:(type__ : namespace_type option)
    ?description:(description_ : resource_description option)
    ?service_count:(service_count_ : resource_count option)
    ?properties:(properties_ : namespace_properties option)
    ?create_date:(create_date_ : timestamp option) () =
  ({
     id = id_;
     arn = arn_;
     resource_owner = resource_owner_;
     name = name_;
     type_ = type__;
     description = description_;
     service_count = service_count_;
     properties = properties_;
     create_date = create_date_;
   }
    : namespace_summary)

let make_list_namespaces_response ?namespaces:(namespaces_ : namespace_summaries_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ namespaces = namespaces_; next_token = next_token_ } : list_namespaces_response)

let make_namespace_filter ?condition:(condition_ : filter_condition option)
    ~name:(name_ : namespace_filter_name) ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_; condition = condition_ } : namespace_filter)

let make_list_namespaces_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : namespace_filters option)
    () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_namespaces_request)

let make_operation_summary ?id:(id_ : operation_id option)
    ?status:(status_ : operation_status option) () =
  ({ id = id_; status = status_ } : operation_summary)

let make_list_operations_response ?operations:(operations_ : operation_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ operations = operations_; next_token = next_token_ } : list_operations_response)

let make_operation_filter ?condition:(condition_ : filter_condition option)
    ~name:(name_ : operation_filter_name) ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_; condition = condition_ } : operation_filter)

let make_list_operations_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : operation_filters option)
    () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_operations_request)

let make_service_summary ?id:(id_ : resource_id option) ?arn:(arn_ : arn option)
    ?resource_owner:(resource_owner_ : aws_account_id option) ?name:(name_ : service_name option)
    ?type_:(type__ : service_type option) ?description:(description_ : resource_description option)
    ?instance_count:(instance_count_ : resource_count option)
    ?dns_config:(dns_config_ : dns_config option)
    ?health_check_config:(health_check_config_ : health_check_config option)
    ?health_check_custom_config:(health_check_custom_config_ : health_check_custom_config option)
    ?create_date:(create_date_ : timestamp option)
    ?created_by_account:(created_by_account_ : aws_account_id option) () =
  ({
     id = id_;
     arn = arn_;
     resource_owner = resource_owner_;
     name = name_;
     type_ = type__;
     description = description_;
     instance_count = instance_count_;
     dns_config = dns_config_;
     health_check_config = health_check_config_;
     health_check_custom_config = health_check_custom_config_;
     create_date = create_date_;
     created_by_account = created_by_account_;
   }
    : service_summary)

let make_list_services_response ?services:(services_ : service_summaries_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ services = services_; next_token = next_token_ } : list_services_response)

let make_service_filter ?condition:(condition_ : filter_condition option)
    ~name:(name_ : service_filter_name) ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_; condition = condition_ } : service_filter)

let make_list_services_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : service_filters option) ()
    =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_services_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_soa_change ~tt_l:(tt_l_ : record_tt_l) () = ({ tt_l = tt_l_ } : soa_change)

let make_private_dns_properties_mutable_change ~so_a:(so_a_ : soa_change) () =
  ({ so_a = so_a_ } : private_dns_properties_mutable_change)

let make_private_dns_namespace_properties_change
    ~dns_properties:(dns_properties_ : private_dns_properties_mutable_change) () =
  ({ dns_properties = dns_properties_ } : private_dns_namespace_properties_change)

let make_private_dns_namespace_change ?description:(description_ : resource_description option)
    ?properties:(properties_ : private_dns_namespace_properties_change option) () =
  ({ description = description_; properties = properties_ } : private_dns_namespace_change)

let make_public_dns_properties_mutable_change ~so_a:(so_a_ : soa_change) () =
  ({ so_a = so_a_ } : public_dns_properties_mutable_change)

let make_public_dns_namespace_properties_change
    ~dns_properties:(dns_properties_ : public_dns_properties_mutable_change) () =
  ({ dns_properties = dns_properties_ } : public_dns_namespace_properties_change)

let make_public_dns_namespace_change ?description:(description_ : resource_description option)
    ?properties:(properties_ : public_dns_namespace_properties_change option) () =
  ({ description = description_; properties = properties_ } : public_dns_namespace_change)

let make_register_instance_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : register_instance_response)

let make_register_instance_request ?creator_request_id:(creator_request_id_ : resource_id option)
    ~service_id:(service_id_ : arn) ~instance_id:(instance_id_ : instance_id)
    ~attributes:(attributes_ : attributes) () =
  ({
     service_id = service_id_;
     instance_id = instance_id_;
     creator_request_id = creator_request_id_;
     attributes = attributes_;
   }
    : register_instance_request)

let make_update_service_attributes_response () = (() : unit)

let make_update_service_attributes_request ~service_id:(service_id_ : arn)
    ~attributes:(attributes_ : service_attributes_map) () =
  ({ service_id = service_id_; attributes = attributes_ } : update_service_attributes_request)

let make_update_service_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_service_response)

let make_service_change ?description:(description_ : resource_description option)
    ?dns_config:(dns_config_ : dns_config_change option)
    ?health_check_config:(health_check_config_ : health_check_config option) () =
  ({
     description = description_;
     dns_config = dns_config_;
     health_check_config = health_check_config_;
   }
    : service_change)

let make_update_service_request ~id:(id_ : arn) ~service:(service_ : service_change) () =
  ({ id = id_; service = service_ } : update_service_request)

let make_update_public_dns_namespace_response ?operation_id:(operation_id_ : operation_id option) ()
    =
  ({ operation_id = operation_id_ } : update_public_dns_namespace_response)

let make_update_public_dns_namespace_request
    ?updater_request_id:(updater_request_id_ : resource_id option) ~id:(id_ : arn)
    ~namespace:(namespace_ : public_dns_namespace_change) () =
  ({ id = id_; updater_request_id = updater_request_id_; namespace = namespace_ }
    : update_public_dns_namespace_request)

let make_update_private_dns_namespace_response ?operation_id:(operation_id_ : operation_id option)
    () =
  ({ operation_id = operation_id_ } : update_private_dns_namespace_response)

let make_update_private_dns_namespace_request
    ?updater_request_id:(updater_request_id_ : resource_id option) ~id:(id_ : arn)
    ~namespace:(namespace_ : private_dns_namespace_change) () =
  ({ id = id_; updater_request_id = updater_request_id_; namespace = namespace_ }
    : update_private_dns_namespace_request)

let make_update_instance_custom_health_status_request ~service_id:(service_id_ : arn)
    ~instance_id:(instance_id_ : resource_id) ~status:(status_ : custom_health_status) () =
  ({ service_id = service_id_; instance_id = instance_id_; status = status_ }
    : update_instance_custom_health_status_request)

let make_update_http_namespace_response ?operation_id:(operation_id_ : operation_id option) () =
  ({ operation_id = operation_id_ } : update_http_namespace_response)

let make_update_http_namespace_request
    ?updater_request_id:(updater_request_id_ : resource_id option) ~id:(id_ : arn)
    ~namespace:(namespace_ : http_namespace_change) () =
  ({ id = id_; updater_request_id = updater_request_id_; namespace = namespace_ }
    : update_http_namespace_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)
