open Types

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_backup ?backup_arn:(backup_arn_ : backup_arn option)
    ?backup_state:(backup_state_ : backup_state option)
    ?cluster_id:(cluster_id_ : cluster_id option)
    ?create_timestamp:(create_timestamp_ : timestamp option)
    ?copy_timestamp:(copy_timestamp_ : timestamp option)
    ?never_expires:(never_expires_ : boolean_ option)
    ?source_region:(source_region_ : region option)
    ?source_backup:(source_backup_ : backup_id option)
    ?source_cluster:(source_cluster_ : cluster_id option)
    ?delete_timestamp:(delete_timestamp_ : timestamp option) ?tag_list:(tag_list_ : tag_list option)
    ?hsm_type:(hsm_type_ : hsm_type option) ?mode:(mode_ : cluster_mode option)
    ~backup_id:(backup_id_ : backup_id) () =
  ({
     backup_id = backup_id_;
     backup_arn = backup_arn_;
     backup_state = backup_state_;
     cluster_id = cluster_id_;
     create_timestamp = create_timestamp_;
     copy_timestamp = copy_timestamp_;
     never_expires = never_expires_;
     source_region = source_region_;
     source_backup = source_backup_;
     source_cluster = source_cluster_;
     delete_timestamp = delete_timestamp_;
     tag_list = tag_list_;
     hsm_type = hsm_type_;
     mode = mode_;
   }
    : backup)

let make_backup_retention_policy ?type_:(type__ : backup_retention_type option)
    ?value:(value_ : backup_retention_value option) () =
  ({ type_ = type__; value = value_ } : backup_retention_policy)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_id:(resource_id_ : resource_id)
    ~tag_key_list:(tag_key_list_ : tag_key_list) () =
  ({ resource_id = resource_id_; tag_key_list = tag_key_list_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_id:(resource_id_ : resource_id)
    ~tag_list:(tag_list_ : tag_list) () =
  ({ resource_id = resource_id_; tag_list = tag_list_ } : tag_resource_request)

let make_restore_backup_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : restore_backup_response)

let make_restore_backup_request ~backup_id:(backup_id_ : backup_id) () =
  ({ backup_id = backup_id_ } : restore_backup_request)

let make_put_resource_policy_response ?resource_arn:(resource_arn_ : cloud_hsm_arn option)
    ?policy:(policy_ : resource_policy option) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_response)

let make_put_resource_policy_request ?resource_arn:(resource_arn_ : cloud_hsm_arn option)
    ?policy:(policy_ : resource_policy option) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_request)

let make_certificates ?cluster_csr:(cluster_csr_ : cert option)
    ?hsm_certificate:(hsm_certificate_ : cert option)
    ?aws_hardware_certificate:(aws_hardware_certificate_ : cert option)
    ?manufacturer_hardware_certificate:(manufacturer_hardware_certificate_ : cert option)
    ?cluster_certificate:(cluster_certificate_ : cert option) () =
  ({
     cluster_csr = cluster_csr_;
     hsm_certificate = hsm_certificate_;
     aws_hardware_certificate = aws_hardware_certificate_;
     manufacturer_hardware_certificate = manufacturer_hardware_certificate_;
     cluster_certificate = cluster_certificate_;
   }
    : certificates)

let make_hsm ?availability_zone:(availability_zone_ : external_az option)
    ?cluster_id:(cluster_id_ : cluster_id option) ?subnet_id:(subnet_id_ : subnet_id option)
    ?eni_id:(eni_id_ : eni_id option) ?eni_ip:(eni_ip_ : ip_address option)
    ?eni_ip_v6:(eni_ip_v6_ : ip_v6_address option) ?hsm_type:(hsm_type_ : hsm_type option)
    ?state:(state_ : hsm_state option) ?state_message:(state_message_ : string_ option)
    ~hsm_id:(hsm_id_ : hsm_id) () =
  ({
     availability_zone = availability_zone_;
     cluster_id = cluster_id_;
     subnet_id = subnet_id_;
     eni_id = eni_id_;
     eni_ip = eni_ip_;
     eni_ip_v6 = eni_ip_v6_;
     hsm_id = hsm_id_;
     hsm_type = hsm_type_;
     state = state_;
     state_message = state_message_;
   }
    : hsm)

let make_cluster ?backup_policy:(backup_policy_ : backup_policy option)
    ?backup_retention_policy:(backup_retention_policy_ : backup_retention_policy option)
    ?cluster_id:(cluster_id_ : cluster_id option)
    ?create_timestamp:(create_timestamp_ : timestamp option) ?hsms:(hsms_ : hsms option)
    ?hsm_type:(hsm_type_ : hsm_type option)
    ?hsm_type_rollback_expiration:(hsm_type_rollback_expiration_ : timestamp option)
    ?pre_co_password:(pre_co_password_ : pre_co_password option)
    ?security_group:(security_group_ : security_group option)
    ?source_backup_id:(source_backup_id_ : backup_id option) ?state:(state_ : cluster_state option)
    ?state_message:(state_message_ : state_message option)
    ?subnet_mapping:(subnet_mapping_ : external_subnet_mapping option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?network_type:(network_type_ : network_type option)
    ?certificates:(certificates_ : certificates option) ?tag_list:(tag_list_ : tag_list option)
    ?mode:(mode_ : cluster_mode option) () =
  ({
     backup_policy = backup_policy_;
     backup_retention_policy = backup_retention_policy_;
     cluster_id = cluster_id_;
     create_timestamp = create_timestamp_;
     hsms = hsms_;
     hsm_type = hsm_type_;
     hsm_type_rollback_expiration = hsm_type_rollback_expiration_;
     pre_co_password = pre_co_password_;
     security_group = security_group_;
     source_backup_id = source_backup_id_;
     state = state_;
     state_message = state_message_;
     subnet_mapping = subnet_mapping_;
     vpc_id = vpc_id_;
     network_type = network_type_;
     certificates = certificates_;
     tag_list = tag_list_;
     mode = mode_;
   }
    : cluster)

let make_modify_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : modify_cluster_response)

let make_modify_cluster_request ?hsm_type:(hsm_type_ : hsm_type option)
    ?backup_retention_policy:(backup_retention_policy_ : backup_retention_policy option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     hsm_type = hsm_type_;
     backup_retention_policy = backup_retention_policy_;
     cluster_id = cluster_id_;
   }
    : modify_cluster_request)

let make_modify_backup_attributes_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : modify_backup_attributes_response)

let make_modify_backup_attributes_request ~backup_id:(backup_id_ : backup_id)
    ~never_expires:(never_expires_ : boolean_) () =
  ({ backup_id = backup_id_; never_expires = never_expires_ } : modify_backup_attributes_request)

let make_list_tags_response ?next_token:(next_token_ : next_token option)
    ~tag_list:(tag_list_ : tag_list) () =
  ({ tag_list = tag_list_; next_token = next_token_ } : list_tags_response)

let make_list_tags_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_size option) ~resource_id:(resource_id_ : resource_id) () =
  ({ resource_id = resource_id_; next_token = next_token_; max_results = max_results_ }
    : list_tags_request)

let make_initialize_cluster_response ?state:(state_ : cluster_state option)
    ?state_message:(state_message_ : state_message option) () =
  ({ state = state_; state_message = state_message_ } : initialize_cluster_response)

let make_initialize_cluster_request ~cluster_id:(cluster_id_ : cluster_id)
    ~signed_cert:(signed_cert_ : cert) ~trust_anchor:(trust_anchor_ : cert) () =
  ({ cluster_id = cluster_id_; signed_cert = signed_cert_; trust_anchor = trust_anchor_ }
    : initialize_cluster_request)

let make_get_resource_policy_response ?policy:(policy_ : resource_policy option) () =
  ({ policy = policy_ } : get_resource_policy_response)

let make_get_resource_policy_request ?resource_arn:(resource_arn_ : cloud_hsm_arn option) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_describe_clusters_response ?clusters:(clusters_ : clusters option)
    ?next_token:(next_token_ : next_token option) () =
  ({ clusters = clusters_; next_token = next_token_ } : describe_clusters_response)

let make_describe_clusters_request ?filters:(filters_ : filters option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : clusters_max_size option) () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : describe_clusters_request)

let make_describe_backups_response ?backups:(backups_ : backups option)
    ?next_token:(next_token_ : next_token option) () =
  ({ backups = backups_; next_token = next_token_ } : describe_backups_response)

let make_describe_backups_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : backups_max_size option) ?filters:(filters_ : filters option)
    ?shared:(shared_ : boolean_ option) ?sort_ascending:(sort_ascending_ : boolean_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     shared = shared_;
     sort_ascending = sort_ascending_;
   }
    : describe_backups_request)

let make_delete_resource_policy_response ?resource_arn:(resource_arn_ : cloud_hsm_arn option)
    ?policy:(policy_ : resource_policy option) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : delete_resource_policy_response)

let make_delete_resource_policy_request ?resource_arn:(resource_arn_ : cloud_hsm_arn option) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_hsm_response ?hsm_id:(hsm_id_ : hsm_id option) () =
  ({ hsm_id = hsm_id_ } : delete_hsm_response)

let make_delete_hsm_request ?hsm_id:(hsm_id_ : hsm_id option) ?eni_id:(eni_id_ : eni_id option)
    ?eni_ip:(eni_ip_ : ip_address option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_; hsm_id = hsm_id_; eni_id = eni_id_; eni_ip = eni_ip_ }
    : delete_hsm_request)

let make_delete_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : delete_cluster_response)

let make_delete_cluster_request ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : delete_cluster_request)

let make_delete_backup_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : delete_backup_response)

let make_delete_backup_request ~backup_id:(backup_id_ : backup_id) () =
  ({ backup_id = backup_id_ } : delete_backup_request)

let make_create_hsm_response ?hsm:(hsm_ : hsm option) () = ({ hsm = hsm_ } : create_hsm_response)

let make_create_hsm_request ?ip_address:(ip_address_ : ip_address option)
    ~cluster_id:(cluster_id_ : cluster_id) ~availability_zone:(availability_zone_ : external_az) ()
    =
  ({ cluster_id = cluster_id_; availability_zone = availability_zone_; ip_address = ip_address_ }
    : create_hsm_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_create_cluster_request
    ?backup_retention_policy:(backup_retention_policy_ : backup_retention_policy option)
    ?source_backup_id:(source_backup_id_ : backup_arn option)
    ?network_type:(network_type_ : network_type option) ?tag_list:(tag_list_ : tag_list option)
    ?mode:(mode_ : cluster_mode option) ~hsm_type:(hsm_type_ : hsm_type)
    ~subnet_ids:(subnet_ids_ : subnet_ids) () =
  ({
     backup_retention_policy = backup_retention_policy_;
     hsm_type = hsm_type_;
     source_backup_id = source_backup_id_;
     subnet_ids = subnet_ids_;
     network_type = network_type_;
     tag_list = tag_list_;
     mode = mode_;
   }
    : create_cluster_request)

let make_destination_backup ?create_timestamp:(create_timestamp_ : timestamp option)
    ?source_region:(source_region_ : region option)
    ?source_backup:(source_backup_ : backup_id option)
    ?source_cluster:(source_cluster_ : cluster_id option) () =
  ({
     create_timestamp = create_timestamp_;
     source_region = source_region_;
     source_backup = source_backup_;
     source_cluster = source_cluster_;
   }
    : destination_backup)

let make_copy_backup_to_region_response
    ?destination_backup:(destination_backup_ : destination_backup option) () =
  ({ destination_backup = destination_backup_ } : copy_backup_to_region_response)

let make_copy_backup_to_region_request ?tag_list:(tag_list_ : tag_list option)
    ~destination_region:(destination_region_ : region) ~backup_id:(backup_id_ : backup_id) () =
  ({ destination_region = destination_region_; backup_id = backup_id_; tag_list = tag_list_ }
    : copy_backup_to_region_request)
