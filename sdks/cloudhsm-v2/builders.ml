open Types

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_key_list:(tag_key_list_ : tag_key_list)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ tag_key_list = tag_key_list_; resource_id = resource_id_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tag_list:(tag_list_ : tag_list)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ tag_list = tag_list_; resource_id = resource_id_ } : tag_resource_request)

let make_backup ?mode:(mode_ : cluster_mode option) ?hsm_type:(hsm_type_ : hsm_type option)
    ?tag_list:(tag_list_ : tag_list option) ?delete_timestamp:(delete_timestamp_ : timestamp option)
    ?source_cluster:(source_cluster_ : cluster_id option)
    ?source_backup:(source_backup_ : backup_id option)
    ?source_region:(source_region_ : region option)
    ?never_expires:(never_expires_ : boolean_ option)
    ?copy_timestamp:(copy_timestamp_ : timestamp option)
    ?create_timestamp:(create_timestamp_ : timestamp option)
    ?cluster_id:(cluster_id_ : cluster_id option)
    ?backup_state:(backup_state_ : backup_state option)
    ?backup_arn:(backup_arn_ : backup_arn option) ~backup_id:(backup_id_ : backup_id) () =
  ({
     mode = mode_;
     hsm_type = hsm_type_;
     tag_list = tag_list_;
     delete_timestamp = delete_timestamp_;
     source_cluster = source_cluster_;
     source_backup = source_backup_;
     source_region = source_region_;
     never_expires = never_expires_;
     copy_timestamp = copy_timestamp_;
     create_timestamp = create_timestamp_;
     cluster_id = cluster_id_;
     backup_state = backup_state_;
     backup_arn = backup_arn_;
     backup_id = backup_id_;
   }
    : backup)

let make_restore_backup_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : restore_backup_response)

let make_restore_backup_request ~backup_id:(backup_id_ : backup_id) () =
  ({ backup_id = backup_id_ } : restore_backup_request)

let make_put_resource_policy_response ?policy:(policy_ : resource_policy option)
    ?resource_arn:(resource_arn_ : cloud_hsm_arn option) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_response)

let make_put_resource_policy_request ?policy:(policy_ : resource_policy option)
    ?resource_arn:(resource_arn_ : cloud_hsm_arn option) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_request)

let make_backup_retention_policy ?value:(value_ : backup_retention_value option)
    ?type_:(type__ : backup_retention_type option) () =
  ({ value = value_; type_ = type__ } : backup_retention_policy)

let make_hsm ?state_message:(state_message_ : string_ option) ?state:(state_ : hsm_state option)
    ?hsm_type:(hsm_type_ : hsm_type option) ?eni_ip_v6:(eni_ip_v6_ : ip_v6_address option)
    ?eni_ip:(eni_ip_ : ip_address option) ?eni_id:(eni_id_ : eni_id option)
    ?subnet_id:(subnet_id_ : subnet_id option) ?cluster_id:(cluster_id_ : cluster_id option)
    ?availability_zone:(availability_zone_ : external_az option) ~hsm_id:(hsm_id_ : hsm_id) () =
  ({
     state_message = state_message_;
     state = state_;
     hsm_type = hsm_type_;
     hsm_id = hsm_id_;
     eni_ip_v6 = eni_ip_v6_;
     eni_ip = eni_ip_;
     eni_id = eni_id_;
     subnet_id = subnet_id_;
     cluster_id = cluster_id_;
     availability_zone = availability_zone_;
   }
    : hsm)

let make_certificates ?cluster_certificate:(cluster_certificate_ : cert option)
    ?manufacturer_hardware_certificate:(manufacturer_hardware_certificate_ : cert option)
    ?aws_hardware_certificate:(aws_hardware_certificate_ : cert option)
    ?hsm_certificate:(hsm_certificate_ : cert option) ?cluster_csr:(cluster_csr_ : cert option) () =
  ({
     cluster_certificate = cluster_certificate_;
     manufacturer_hardware_certificate = manufacturer_hardware_certificate_;
     aws_hardware_certificate = aws_hardware_certificate_;
     hsm_certificate = hsm_certificate_;
     cluster_csr = cluster_csr_;
   }
    : certificates)

let make_cluster ?mode:(mode_ : cluster_mode option) ?tag_list:(tag_list_ : tag_list option)
    ?certificates:(certificates_ : certificates option)
    ?network_type:(network_type_ : network_type option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?subnet_mapping:(subnet_mapping_ : external_subnet_mapping option)
    ?state_message:(state_message_ : state_message option) ?state:(state_ : cluster_state option)
    ?source_backup_id:(source_backup_id_ : backup_id option)
    ?security_group:(security_group_ : security_group option)
    ?pre_co_password:(pre_co_password_ : pre_co_password option)
    ?hsm_type_rollback_expiration:(hsm_type_rollback_expiration_ : timestamp option)
    ?hsm_type:(hsm_type_ : hsm_type option) ?hsms:(hsms_ : hsms option)
    ?create_timestamp:(create_timestamp_ : timestamp option)
    ?cluster_id:(cluster_id_ : cluster_id option)
    ?backup_retention_policy:(backup_retention_policy_ : backup_retention_policy option)
    ?backup_policy:(backup_policy_ : backup_policy option) () =
  ({
     mode = mode_;
     tag_list = tag_list_;
     certificates = certificates_;
     network_type = network_type_;
     vpc_id = vpc_id_;
     subnet_mapping = subnet_mapping_;
     state_message = state_message_;
     state = state_;
     source_backup_id = source_backup_id_;
     security_group = security_group_;
     pre_co_password = pre_co_password_;
     hsm_type_rollback_expiration = hsm_type_rollback_expiration_;
     hsm_type = hsm_type_;
     hsms = hsms_;
     create_timestamp = create_timestamp_;
     cluster_id = cluster_id_;
     backup_retention_policy = backup_retention_policy_;
     backup_policy = backup_policy_;
   }
    : cluster)

let make_modify_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : modify_cluster_response)

let make_modify_cluster_request
    ?backup_retention_policy:(backup_retention_policy_ : backup_retention_policy option)
    ?hsm_type:(hsm_type_ : hsm_type option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     cluster_id = cluster_id_;
     backup_retention_policy = backup_retention_policy_;
     hsm_type = hsm_type_;
   }
    : modify_cluster_request)

let make_modify_backup_attributes_response ?backup:(backup_ : backup option) () =
  ({ backup = backup_ } : modify_backup_attributes_response)

let make_modify_backup_attributes_request ~never_expires:(never_expires_ : boolean_)
    ~backup_id:(backup_id_ : backup_id) () =
  ({ never_expires = never_expires_; backup_id = backup_id_ } : modify_backup_attributes_request)

let make_list_tags_response ?next_token:(next_token_ : next_token option)
    ~tag_list:(tag_list_ : tag_list) () =
  ({ next_token = next_token_; tag_list = tag_list_ } : list_tags_response)

let make_list_tags_request ?max_results:(max_results_ : max_size option)
    ?next_token:(next_token_ : next_token option) ~resource_id:(resource_id_ : resource_id) () =
  ({ max_results = max_results_; next_token = next_token_; resource_id = resource_id_ }
    : list_tags_request)

let make_initialize_cluster_response ?state_message:(state_message_ : state_message option)
    ?state:(state_ : cluster_state option) () =
  ({ state_message = state_message_; state = state_ } : initialize_cluster_response)

let make_initialize_cluster_request ~trust_anchor:(trust_anchor_ : cert)
    ~signed_cert:(signed_cert_ : cert) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ trust_anchor = trust_anchor_; signed_cert = signed_cert_; cluster_id = cluster_id_ }
    : initialize_cluster_request)

let make_get_resource_policy_response ?policy:(policy_ : resource_policy option) () =
  ({ policy = policy_ } : get_resource_policy_response)

let make_get_resource_policy_request ?resource_arn:(resource_arn_ : cloud_hsm_arn option) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_destination_backup ?source_cluster:(source_cluster_ : cluster_id option)
    ?source_backup:(source_backup_ : backup_id option)
    ?source_region:(source_region_ : region option)
    ?create_timestamp:(create_timestamp_ : timestamp option) () =
  ({
     source_cluster = source_cluster_;
     source_backup = source_backup_;
     source_region = source_region_;
     create_timestamp = create_timestamp_;
   }
    : destination_backup)

let make_describe_clusters_response ?next_token:(next_token_ : next_token option)
    ?clusters:(clusters_ : clusters option) () =
  ({ next_token = next_token_; clusters = clusters_ } : describe_clusters_response)

let make_describe_clusters_request ?max_results:(max_results_ : clusters_max_size option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : describe_clusters_request)

let make_describe_backups_response ?next_token:(next_token_ : next_token option)
    ?backups:(backups_ : backups option) () =
  ({ next_token = next_token_; backups = backups_ } : describe_backups_response)

let make_describe_backups_request ?sort_ascending:(sort_ascending_ : boolean_ option)
    ?shared:(shared_ : boolean_ option) ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : backups_max_size option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     sort_ascending = sort_ascending_;
     shared = shared_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_backups_request)

let make_delete_resource_policy_response ?policy:(policy_ : resource_policy option)
    ?resource_arn:(resource_arn_ : cloud_hsm_arn option) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : delete_resource_policy_response)

let make_delete_resource_policy_request ?resource_arn:(resource_arn_ : cloud_hsm_arn option) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_hsm_response ?hsm_id:(hsm_id_ : hsm_id option) () =
  ({ hsm_id = hsm_id_ } : delete_hsm_response)

let make_delete_hsm_request ?eni_ip:(eni_ip_ : ip_address option) ?eni_id:(eni_id_ : eni_id option)
    ?hsm_id:(hsm_id_ : hsm_id option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ eni_ip = eni_ip_; eni_id = eni_id_; hsm_id = hsm_id_; cluster_id = cluster_id_ }
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
    ~availability_zone:(availability_zone_ : external_az) ~cluster_id:(cluster_id_ : cluster_id) ()
    =
  ({ ip_address = ip_address_; availability_zone = availability_zone_; cluster_id = cluster_id_ }
    : create_hsm_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_create_cluster_request ?mode:(mode_ : cluster_mode option)
    ?tag_list:(tag_list_ : tag_list option) ?network_type:(network_type_ : network_type option)
    ?source_backup_id:(source_backup_id_ : backup_arn option)
    ?backup_retention_policy:(backup_retention_policy_ : backup_retention_policy option)
    ~subnet_ids:(subnet_ids_ : subnet_ids) ~hsm_type:(hsm_type_ : hsm_type) () =
  ({
     mode = mode_;
     tag_list = tag_list_;
     network_type = network_type_;
     subnet_ids = subnet_ids_;
     source_backup_id = source_backup_id_;
     hsm_type = hsm_type_;
     backup_retention_policy = backup_retention_policy_;
   }
    : create_cluster_request)

let make_copy_backup_to_region_response
    ?destination_backup:(destination_backup_ : destination_backup option) () =
  ({ destination_backup = destination_backup_ } : copy_backup_to_region_response)

let make_copy_backup_to_region_request ?tag_list:(tag_list_ : tag_list option)
    ~backup_id:(backup_id_ : backup_id) ~destination_region:(destination_region_ : region) () =
  ({ tag_list = tag_list_; backup_id = backup_id_; destination_region = destination_region_ }
    : copy_backup_to_region_request)
