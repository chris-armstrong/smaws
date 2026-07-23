open Types

let make_update_long_term_pricing_request ?replacement_job:(replacement_job_ : job_id option)
    ?is_long_term_pricing_auto_renew:(is_long_term_pricing_auto_renew_ : java_boolean option)
    ~long_term_pricing_id:(long_term_pricing_id_ : long_term_pricing_id) () =
  ({
     long_term_pricing_id = long_term_pricing_id_;
     replacement_job = replacement_job_;
     is_long_term_pricing_auto_renew = is_long_term_pricing_auto_renew_;
   }
    : update_long_term_pricing_request)

let make_update_job_shipment_state_request ~job_id:(job_id_ : job_id)
    ~shipment_state:(shipment_state_ : shipment_state) () =
  ({ job_id = job_id_; shipment_state = shipment_state_ } : update_job_shipment_state_request)

let make_pickup_details ?name:(name_ : string_ option)
    ?phone_number:(phone_number_ : phone_number option) ?email:(email_ : email option)
    ?identification_number:(identification_number_ : string_ option)
    ?identification_expiration_date:(identification_expiration_date_ : timestamp option)
    ?identification_issuing_org:(identification_issuing_org_ : string_ option)
    ?device_pickup_id:(device_pickup_id_ : device_pickup_id option) () =
  ({
     name = name_;
     phone_number = phone_number_;
     email = email_;
     identification_number = identification_number_;
     identification_expiration_date = identification_expiration_date_;
     identification_issuing_org = identification_issuing_org_;
     device_pickup_id = device_pickup_id_;
   }
    : pickup_details)

let make_s3_on_device_service_configuration
    ?storage_limit:(storage_limit_ : s3_storage_limit option)
    ?storage_unit:(storage_unit_ : storage_unit option)
    ?service_size:(service_size_ : service_size option)
    ?fault_tolerance:(fault_tolerance_ : node_fault_tolerance option) () =
  ({
     storage_limit = storage_limit_;
     storage_unit = storage_unit_;
     service_size = service_size_;
     fault_tolerance = fault_tolerance_;
   }
    : s3_on_device_service_configuration)

let make_eks_on_device_service_configuration
    ?kubernetes_version:(kubernetes_version_ : string_ option)
    ?eks_anywhere_version:(eks_anywhere_version_ : string_ option) () =
  ({ kubernetes_version = kubernetes_version_; eks_anywhere_version = eks_anywhere_version_ }
    : eks_on_device_service_configuration)

let make_tgw_on_device_service_configuration ?storage_limit:(storage_limit_ : storage_limit option)
    ?storage_unit:(storage_unit_ : storage_unit option) () =
  ({ storage_limit = storage_limit_; storage_unit = storage_unit_ }
    : tgw_on_device_service_configuration)

let make_nfs_on_device_service_configuration ?storage_limit:(storage_limit_ : storage_limit option)
    ?storage_unit:(storage_unit_ : storage_unit option) () =
  ({ storage_limit = storage_limit_; storage_unit = storage_unit_ }
    : nfs_on_device_service_configuration)

let make_on_device_service_configuration
    ?nfs_on_device_service:(nfs_on_device_service_ : nfs_on_device_service_configuration option)
    ?tgw_on_device_service:(tgw_on_device_service_ : tgw_on_device_service_configuration option)
    ?eks_on_device_service:(eks_on_device_service_ : eks_on_device_service_configuration option)
    ?s3_on_device_service:(s3_on_device_service_ : s3_on_device_service_configuration option) () =
  ({
     nfs_on_device_service = nfs_on_device_service_;
     tgw_on_device_service = tgw_on_device_service_;
     eks_on_device_service = eks_on_device_service_;
     s3_on_device_service = s3_on_device_service_;
   }
    : on_device_service_configuration)

let make_ec2_ami_resource ?snowball_ami_id:(snowball_ami_id_ : string_ option)
    ~ami_id:(ami_id_ : ami_id) () =
  ({ ami_id = ami_id_; snowball_ami_id = snowball_ami_id_ } : ec2_ami_resource)

let make_event_trigger_definition ?event_resource_ar_n:(event_resource_ar_n_ : resource_ar_n option)
    () =
  ({ event_resource_ar_n = event_resource_ar_n_ } : event_trigger_definition)

let make_lambda_resource ?lambda_arn:(lambda_arn_ : resource_ar_n option)
    ?event_triggers:(event_triggers_ : event_trigger_definition_list option) () =
  ({ lambda_arn = lambda_arn_; event_triggers = event_triggers_ } : lambda_resource)

let make_target_on_device_service ?service_name:(service_name_ : device_service_name option)
    ?transfer_option:(transfer_option_ : transfer_option option) () =
  ({ service_name = service_name_; transfer_option = transfer_option_ } : target_on_device_service)

let make_key_range ?begin_marker:(begin_marker_ : string_ option)
    ?end_marker:(end_marker_ : string_ option) () =
  ({ begin_marker = begin_marker_; end_marker = end_marker_ } : key_range)

let make_s3_resource ?bucket_arn:(bucket_arn_ : resource_ar_n option)
    ?key_range:(key_range_ : key_range option)
    ?target_on_device_services:(target_on_device_services_ : target_on_device_service_list option)
    () =
  ({
     bucket_arn = bucket_arn_;
     key_range = key_range_;
     target_on_device_services = target_on_device_services_;
   }
    : s3_resource)

let make_job_resource ?s3_resources:(s3_resources_ : s3_resource_list option)
    ?lambda_resources:(lambda_resources_ : lambda_resource_list option)
    ?ec2_ami_resources:(ec2_ami_resources_ : ec2_ami_resource_list option) () =
  ({
     s3_resources = s3_resources_;
     lambda_resources = lambda_resources_;
     ec2_ami_resources = ec2_ami_resources_;
   }
    : job_resource)

let make_notification ?sns_topic_ar_n:(sns_topic_ar_n_ : sns_topic_ar_n option)
    ?job_states_to_notify:(job_states_to_notify_ : job_state_list option)
    ?notify_all:(notify_all_ : boolean_ option)
    ?device_pickup_sns_topic_ar_n:(device_pickup_sns_topic_ar_n_ : sns_topic_ar_n option) () =
  ({
     sns_topic_ar_n = sns_topic_ar_n_;
     job_states_to_notify = job_states_to_notify_;
     notify_all = notify_all_;
     device_pickup_sns_topic_ar_n = device_pickup_sns_topic_ar_n_;
   }
    : notification)

let make_update_job_request ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?notification:(notification_ : notification option)
    ?resources:(resources_ : job_resource option)
    ?on_device_service_configuration:
      (on_device_service_configuration_ : on_device_service_configuration option)
    ?address_id:(address_id_ : address_id option)
    ?shipping_option:(shipping_option_ : shipping_option option)
    ?description:(description_ : string_ option)
    ?snowball_capacity_preference:(snowball_capacity_preference_ : snowball_capacity option)
    ?forwarding_address_id:(forwarding_address_id_ : address_id option)
    ?pickup_details:(pickup_details_ : pickup_details option) ~job_id:(job_id_ : job_id) () =
  ({
     job_id = job_id_;
     role_ar_n = role_ar_n_;
     notification = notification_;
     resources = resources_;
     on_device_service_configuration = on_device_service_configuration_;
     address_id = address_id_;
     shipping_option = shipping_option_;
     description = description_;
     snowball_capacity_preference = snowball_capacity_preference_;
     forwarding_address_id = forwarding_address_id_;
     pickup_details = pickup_details_;
   }
    : update_job_request)

let make_update_cluster_request ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?description:(description_ : string_ option) ?resources:(resources_ : job_resource option)
    ?on_device_service_configuration:
      (on_device_service_configuration_ : on_device_service_configuration option)
    ?address_id:(address_id_ : address_id option)
    ?shipping_option:(shipping_option_ : shipping_option option)
    ?notification:(notification_ : notification option)
    ?forwarding_address_id:(forwarding_address_id_ : address_id option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     cluster_id = cluster_id_;
     role_ar_n = role_ar_n_;
     description = description_;
     resources = resources_;
     on_device_service_configuration = on_device_service_configuration_;
     address_id = address_id_;
     shipping_option = shipping_option_;
     notification = notification_;
     forwarding_address_id = forwarding_address_id_;
   }
    : update_cluster_request)

let make_service_version ?version:(version_ : string_ option) () =
  ({ version = version_ } : service_version)

let make_dependent_service ?service_name:(service_name_ : service_name option)
    ?service_version:(service_version_ : service_version option) () =
  ({ service_name = service_name_; service_version = service_version_ } : dependent_service)

let make_list_service_versions_request
    ?dependent_services:(dependent_services_ : dependent_service_list option)
    ?max_results:(max_results_ : list_limit option) ?next_token:(next_token_ : string_ option)
    ~service_name:(service_name_ : service_name) () =
  ({
     service_name = service_name_;
     dependent_services = dependent_services_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_service_versions_request)

let make_address ?address_id:(address_id_ : address_id option) ?name:(name_ : string_ option)
    ?company:(company_ : string_ option) ?street1:(street1_ : string_ option)
    ?street2:(street2_ : string_ option) ?street3:(street3_ : string_ option)
    ?city:(city_ : string_ option) ?state_or_province:(state_or_province_ : string_ option)
    ?prefecture_or_district:(prefecture_or_district_ : string_ option)
    ?landmark:(landmark_ : string_ option) ?country:(country_ : string_ option)
    ?postal_code:(postal_code_ : string_ option) ?phone_number:(phone_number_ : string_ option)
    ?is_restricted:(is_restricted_ : boolean_ option) ?type_:(type__ : address_type option) () =
  ({
     address_id = address_id_;
     name = name_;
     company = company_;
     street1 = street1_;
     street2 = street2_;
     street3 = street3_;
     city = city_;
     state_or_province = state_or_province_;
     prefecture_or_district = prefecture_or_district_;
     landmark = landmark_;
     country = country_;
     postal_code = postal_code_;
     phone_number = phone_number_;
     is_restricted = is_restricted_;
     type_ = type__;
   }
    : address)

let make_list_pickup_locations_request ?max_results:(max_results_ : list_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_pickup_locations_request)

let make_long_term_pricing_list_entry
    ?long_term_pricing_id:(long_term_pricing_id_ : long_term_pricing_id option)
    ?long_term_pricing_end_date:(long_term_pricing_end_date_ : timestamp option)
    ?long_term_pricing_start_date:(long_term_pricing_start_date_ : timestamp option)
    ?long_term_pricing_type:(long_term_pricing_type_ : long_term_pricing_type option)
    ?current_active_job:(current_active_job_ : job_id option)
    ?replacement_job:(replacement_job_ : job_id option)
    ?is_long_term_pricing_auto_renew:(is_long_term_pricing_auto_renew_ : java_boolean option)
    ?long_term_pricing_status:(long_term_pricing_status_ : string_ option)
    ?snowball_type:(snowball_type_ : snowball_type option)
    ?job_ids:(job_ids_ : long_term_pricing_associated_job_id_list option) () =
  ({
     long_term_pricing_id = long_term_pricing_id_;
     long_term_pricing_end_date = long_term_pricing_end_date_;
     long_term_pricing_start_date = long_term_pricing_start_date_;
     long_term_pricing_type = long_term_pricing_type_;
     current_active_job = current_active_job_;
     replacement_job = replacement_job_;
     is_long_term_pricing_auto_renew = is_long_term_pricing_auto_renew_;
     long_term_pricing_status = long_term_pricing_status_;
     snowball_type = snowball_type_;
     job_ids = job_ids_;
   }
    : long_term_pricing_list_entry)

let make_list_long_term_pricing_request ?max_results:(max_results_ : list_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_long_term_pricing_request)

let make_job_list_entry ?job_id:(job_id_ : string_ option)
    ?job_state:(job_state_ : job_state option) ?is_master:(is_master_ : boolean_ option)
    ?job_type:(job_type_ : job_type option) ?snowball_type:(snowball_type_ : snowball_type option)
    ?creation_date:(creation_date_ : timestamp option) ?description:(description_ : string_ option)
    () =
  ({
     job_id = job_id_;
     job_state = job_state_;
     is_master = is_master_;
     job_type = job_type_;
     snowball_type = snowball_type_;
     creation_date = creation_date_;
     description = description_;
   }
    : job_list_entry)

let make_list_jobs_request ?max_results:(max_results_ : list_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_jobs_request)

let make_compatible_image ?ami_id:(ami_id_ : string_ option) ?name:(name_ : string_ option) () =
  ({ ami_id = ami_id_; name = name_ } : compatible_image)

let make_list_compatible_images_request ?max_results:(max_results_ : list_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_compatible_images_request)

let make_cluster_list_entry ?cluster_id:(cluster_id_ : string_ option)
    ?cluster_state:(cluster_state_ : cluster_state option)
    ?creation_date:(creation_date_ : timestamp option) ?description:(description_ : string_ option)
    () =
  ({
     cluster_id = cluster_id_;
     cluster_state = cluster_state_;
     creation_date = creation_date_;
     description = description_;
   }
    : cluster_list_entry)

let make_list_clusters_request ?max_results:(max_results_ : list_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_clusters_request)

let make_list_cluster_jobs_request ?max_results:(max_results_ : list_limit option)
    ?next_token:(next_token_ : string_ option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_; max_results = max_results_; next_token = next_token_ }
    : list_cluster_jobs_request)

let make_get_software_updates_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_software_updates_request)

let make_get_snowball_usage_request () = (() : unit)

let make_get_job_unlock_code_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_job_unlock_code_request)

let make_get_job_manifest_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_job_manifest_request)

let make_describe_return_shipping_label_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_return_shipping_label_request)

let make_wireless_connection ?is_wifi_enabled:(is_wifi_enabled_ : boolean_ option) () =
  ({ is_wifi_enabled = is_wifi_enabled_ } : wireless_connection)

let make_snowcone_device_configuration
    ?wireless_connection:(wireless_connection_ : wireless_connection option) () =
  ({ wireless_connection = wireless_connection_ } : snowcone_device_configuration)

let make_device_configuration
    ?snowcone_device_configuration:
      (snowcone_device_configuration_ : snowcone_device_configuration option) () =
  ({ snowcone_device_configuration = snowcone_device_configuration_ } : device_configuration)

let make_ind_tax_documents ?gsti_n:(gsti_n_ : gsti_n option) () =
  ({ gsti_n = gsti_n_ } : ind_tax_documents)

let make_tax_documents ?in_d:(in_d_ : ind_tax_documents option) () =
  ({ in_d = in_d_ } : tax_documents)

let make_job_logs ?job_completion_report_ur_i:(job_completion_report_ur_i_ : string_ option)
    ?job_success_log_ur_i:(job_success_log_ur_i_ : string_ option)
    ?job_failure_log_ur_i:(job_failure_log_ur_i_ : string_ option) () =
  ({
     job_completion_report_ur_i = job_completion_report_ur_i_;
     job_success_log_ur_i = job_success_log_ur_i_;
     job_failure_log_ur_i = job_failure_log_ur_i_;
   }
    : job_logs)

let make_data_transfer ?bytes_transferred:(bytes_transferred_ : long option)
    ?objects_transferred:(objects_transferred_ : long option)
    ?total_bytes:(total_bytes_ : long option) ?total_objects:(total_objects_ : long option) () =
  ({
     bytes_transferred = bytes_transferred_;
     objects_transferred = objects_transferred_;
     total_bytes = total_bytes_;
     total_objects = total_objects_;
   }
    : data_transfer)

let make_shipment ?status:(status_ : string_ option)
    ?tracking_number:(tracking_number_ : string_ option) () =
  ({ status = status_; tracking_number = tracking_number_ } : shipment)

let make_shipping_details ?shipping_option:(shipping_option_ : shipping_option option)
    ?inbound_shipment:(inbound_shipment_ : shipment option)
    ?outbound_shipment:(outbound_shipment_ : shipment option) () =
  ({
     shipping_option = shipping_option_;
     inbound_shipment = inbound_shipment_;
     outbound_shipment = outbound_shipment_;
   }
    : shipping_details)

let make_job_metadata ?job_id:(job_id_ : string_ option) ?job_state:(job_state_ : job_state option)
    ?job_type:(job_type_ : job_type option) ?snowball_type:(snowball_type_ : snowball_type option)
    ?creation_date:(creation_date_ : timestamp option) ?resources:(resources_ : job_resource option)
    ?description:(description_ : string_ option) ?kms_key_ar_n:(kms_key_ar_n_ : kms_key_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?address_id:(address_id_ : address_id option)
    ?shipping_details:(shipping_details_ : shipping_details option)
    ?snowball_capacity_preference:(snowball_capacity_preference_ : snowball_capacity option)
    ?notification:(notification_ : notification option)
    ?data_transfer_progress:(data_transfer_progress_ : data_transfer option)
    ?job_log_info:(job_log_info_ : job_logs option) ?cluster_id:(cluster_id_ : string_ option)
    ?forwarding_address_id:(forwarding_address_id_ : address_id option)
    ?tax_documents:(tax_documents_ : tax_documents option)
    ?device_configuration:(device_configuration_ : device_configuration option)
    ?remote_management:(remote_management_ : remote_management option)
    ?long_term_pricing_id:(long_term_pricing_id_ : long_term_pricing_id option)
    ?on_device_service_configuration:
      (on_device_service_configuration_ : on_device_service_configuration option)
    ?impact_level:(impact_level_ : impact_level option)
    ?pickup_details:(pickup_details_ : pickup_details option)
    ?snowball_id:(snowball_id_ : string_ option) () =
  ({
     job_id = job_id_;
     job_state = job_state_;
     job_type = job_type_;
     snowball_type = snowball_type_;
     creation_date = creation_date_;
     resources = resources_;
     description = description_;
     kms_key_ar_n = kms_key_ar_n_;
     role_ar_n = role_ar_n_;
     address_id = address_id_;
     shipping_details = shipping_details_;
     snowball_capacity_preference = snowball_capacity_preference_;
     notification = notification_;
     data_transfer_progress = data_transfer_progress_;
     job_log_info = job_log_info_;
     cluster_id = cluster_id_;
     forwarding_address_id = forwarding_address_id_;
     tax_documents = tax_documents_;
     device_configuration = device_configuration_;
     remote_management = remote_management_;
     long_term_pricing_id = long_term_pricing_id_;
     on_device_service_configuration = on_device_service_configuration_;
     impact_level = impact_level_;
     pickup_details = pickup_details_;
     snowball_id = snowball_id_;
   }
    : job_metadata)

let make_describe_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_job_request)

let make_cluster_metadata ?cluster_id:(cluster_id_ : string_ option)
    ?description:(description_ : string_ option) ?kms_key_ar_n:(kms_key_ar_n_ : kms_key_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?cluster_state:(cluster_state_ : cluster_state option) ?job_type:(job_type_ : job_type option)
    ?snowball_type:(snowball_type_ : snowball_type option)
    ?creation_date:(creation_date_ : timestamp option) ?resources:(resources_ : job_resource option)
    ?address_id:(address_id_ : address_id option)
    ?shipping_option:(shipping_option_ : shipping_option option)
    ?notification:(notification_ : notification option)
    ?forwarding_address_id:(forwarding_address_id_ : address_id option)
    ?tax_documents:(tax_documents_ : tax_documents option)
    ?on_device_service_configuration:
      (on_device_service_configuration_ : on_device_service_configuration option) () =
  ({
     cluster_id = cluster_id_;
     description = description_;
     kms_key_ar_n = kms_key_ar_n_;
     role_ar_n = role_ar_n_;
     cluster_state = cluster_state_;
     job_type = job_type_;
     snowball_type = snowball_type_;
     creation_date = creation_date_;
     resources = resources_;
     address_id = address_id_;
     shipping_option = shipping_option_;
     notification = notification_;
     forwarding_address_id = forwarding_address_id_;
     tax_documents = tax_documents_;
     on_device_service_configuration = on_device_service_configuration_;
   }
    : cluster_metadata)

let make_describe_cluster_request ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : describe_cluster_request)

let make_describe_addresses_request ?max_results:(max_results_ : list_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_addresses_request)

let make_describe_address_request ~address_id:(address_id_ : address_id) () =
  ({ address_id = address_id_ } : describe_address_request)

let make_create_return_shipping_label_request
    ?shipping_option:(shipping_option_ : shipping_option option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; shipping_option = shipping_option_ } : create_return_shipping_label_request)

let make_create_long_term_pricing_request
    ?is_long_term_pricing_auto_renew:(is_long_term_pricing_auto_renew_ : java_boolean option)
    ~long_term_pricing_type:(long_term_pricing_type_ : long_term_pricing_type)
    ~snowball_type:(snowball_type_ : snowball_type) () =
  ({
     long_term_pricing_type = long_term_pricing_type_;
     is_long_term_pricing_auto_renew = is_long_term_pricing_auto_renew_;
     snowball_type = snowball_type_;
   }
    : create_long_term_pricing_request)

let make_create_job_request ?job_type:(job_type_ : job_type option)
    ?resources:(resources_ : job_resource option)
    ?on_device_service_configuration:
      (on_device_service_configuration_ : on_device_service_configuration option)
    ?description:(description_ : string_ option) ?address_id:(address_id_ : address_id option)
    ?kms_key_ar_n:(kms_key_ar_n_ : kms_key_ar_n option) ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?snowball_capacity_preference:(snowball_capacity_preference_ : snowball_capacity option)
    ?shipping_option:(shipping_option_ : shipping_option option)
    ?notification:(notification_ : notification option)
    ?cluster_id:(cluster_id_ : cluster_id option)
    ?snowball_type:(snowball_type_ : snowball_type option)
    ?forwarding_address_id:(forwarding_address_id_ : address_id option)
    ?tax_documents:(tax_documents_ : tax_documents option)
    ?device_configuration:(device_configuration_ : device_configuration option)
    ?remote_management:(remote_management_ : remote_management option)
    ?long_term_pricing_id:(long_term_pricing_id_ : long_term_pricing_id option)
    ?impact_level:(impact_level_ : impact_level option)
    ?pickup_details:(pickup_details_ : pickup_details option) () =
  ({
     job_type = job_type_;
     resources = resources_;
     on_device_service_configuration = on_device_service_configuration_;
     description = description_;
     address_id = address_id_;
     kms_key_ar_n = kms_key_ar_n_;
     role_ar_n = role_ar_n_;
     snowball_capacity_preference = snowball_capacity_preference_;
     shipping_option = shipping_option_;
     notification = notification_;
     cluster_id = cluster_id_;
     snowball_type = snowball_type_;
     forwarding_address_id = forwarding_address_id_;
     tax_documents = tax_documents_;
     device_configuration = device_configuration_;
     remote_management = remote_management_;
     long_term_pricing_id = long_term_pricing_id_;
     impact_level = impact_level_;
     pickup_details = pickup_details_;
   }
    : create_job_request)

let make_create_cluster_request ?resources:(resources_ : job_resource option)
    ?on_device_service_configuration:
      (on_device_service_configuration_ : on_device_service_configuration option)
    ?description:(description_ : string_ option) ?kms_key_ar_n:(kms_key_ar_n_ : kms_key_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?notification:(notification_ : notification option)
    ?forwarding_address_id:(forwarding_address_id_ : address_id option)
    ?tax_documents:(tax_documents_ : tax_documents option)
    ?remote_management:(remote_management_ : remote_management option)
    ?initial_cluster_size:(initial_cluster_size_ : initial_cluster_size option)
    ?force_create_jobs:(force_create_jobs_ : boolean_ option)
    ?long_term_pricing_ids:(long_term_pricing_ids_ : long_term_pricing_id_list option)
    ?snowball_capacity_preference:(snowball_capacity_preference_ : snowball_capacity option)
    ~job_type:(job_type_ : job_type) ~address_id:(address_id_ : address_id)
    ~snowball_type:(snowball_type_ : snowball_type)
    ~shipping_option:(shipping_option_ : shipping_option) () =
  ({
     job_type = job_type_;
     resources = resources_;
     on_device_service_configuration = on_device_service_configuration_;
     description = description_;
     address_id = address_id_;
     kms_key_ar_n = kms_key_ar_n_;
     role_ar_n = role_ar_n_;
     snowball_type = snowball_type_;
     shipping_option = shipping_option_;
     notification = notification_;
     forwarding_address_id = forwarding_address_id_;
     tax_documents = tax_documents_;
     remote_management = remote_management_;
     initial_cluster_size = initial_cluster_size_;
     force_create_jobs = force_create_jobs_;
     long_term_pricing_ids = long_term_pricing_ids_;
     snowball_capacity_preference = snowball_capacity_preference_;
   }
    : create_cluster_request)

let make_create_address_request ~address:(address_ : address) () =
  ({ address = address_ } : create_address_request)

let make_cancel_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : cancel_job_request)

let make_cancel_cluster_request ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : cancel_cluster_request)
