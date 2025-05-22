open Smaws_Lib
open Types
let make_wireless_connection
  ?is_wifi_enabled:(is_wifi_enabled_ : bool option)  () =
  ({ is_wifi_enabled = is_wifi_enabled_ } : wireless_connection)
let make_update_long_term_pricing_request
  ?is_long_term_pricing_auto_renew:(is_long_term_pricing_auto_renew_ :
                                     bool option)
   ?replacement_job:(replacement_job_ : string option) 
  ~long_term_pricing_id:(long_term_pricing_id_ : string)  () =
  ({
     is_long_term_pricing_auto_renew = is_long_term_pricing_auto_renew_;
     replacement_job = replacement_job_;
     long_term_pricing_id = long_term_pricing_id_
   } : update_long_term_pricing_request)
let make_update_job_shipment_state_request
  ~shipment_state:(shipment_state_ : shipment_state) 
  ~job_id:(job_id_ : string)  () =
  ({ shipment_state = shipment_state_; job_id = job_id_ } : update_job_shipment_state_request)
let make_notification
  ?device_pickup_sns_topic_ar_n:(device_pickup_sns_topic_ar_n_ :
                                  string option)
   ?notify_all:(notify_all_ : bool option) 
  ?job_states_to_notify:(job_states_to_notify_ : job_state list option) 
  ?sns_topic_ar_n:(sns_topic_ar_n_ : string option)  () =
  ({
     device_pickup_sns_topic_ar_n = device_pickup_sns_topic_ar_n_;
     notify_all = notify_all_;
     job_states_to_notify = job_states_to_notify_;
     sns_topic_ar_n = sns_topic_ar_n_
   } : notification)
let make_key_range ?end_marker:(end_marker_ : string option) 
  ?begin_marker:(begin_marker_ : string option)  () =
  ({ end_marker = end_marker_; begin_marker = begin_marker_ } : key_range)
let make_target_on_device_service
  ?transfer_option:(transfer_option_ : transfer_option option) 
  ?service_name:(service_name_ : device_service_name option)  () =
  ({ transfer_option = transfer_option_; service_name = service_name_ } : 
  target_on_device_service)
let make_s3_resource
  ?target_on_device_services:(target_on_device_services_ :
                               target_on_device_service list option)
   ?key_range:(key_range_ : key_range option) 
  ?bucket_arn:(bucket_arn_ : string option)  () =
  ({
     target_on_device_services = target_on_device_services_;
     key_range = key_range_;
     bucket_arn = bucket_arn_
   } : s3_resource)
let make_event_trigger_definition
  ?event_resource_ar_n:(event_resource_ar_n_ : string option)  () =
  ({ event_resource_ar_n = event_resource_ar_n_ } : event_trigger_definition)
let make_lambda_resource
  ?event_triggers:(event_triggers_ : event_trigger_definition list option) 
  ?lambda_arn:(lambda_arn_ : string option)  () =
  ({ event_triggers = event_triggers_; lambda_arn = lambda_arn_ } : lambda_resource)
let make_ec2_ami_resource ?snowball_ami_id:(snowball_ami_id_ : string option)
   ~ami_id:(ami_id_ : string)  () =
  ({ snowball_ami_id = snowball_ami_id_; ami_id = ami_id_ } : ec2_ami_resource)
let make_job_resource
  ?ec2_ami_resources:(ec2_ami_resources_ : ec2_ami_resource list option) 
  ?lambda_resources:(lambda_resources_ : lambda_resource list option) 
  ?s3_resources:(s3_resources_ : s3_resource list option)  () =
  ({
     ec2_ami_resources = ec2_ami_resources_;
     lambda_resources = lambda_resources_;
     s3_resources = s3_resources_
   } : job_resource)
let make_nfs_on_device_service_configuration
  ?storage_unit:(storage_unit_ : storage_unit option) 
  ?storage_limit:(storage_limit_ : int option)  () =
  ({ storage_unit = storage_unit_; storage_limit = storage_limit_ } : 
  nfs_on_device_service_configuration)
let make_tgw_on_device_service_configuration
  ?storage_unit:(storage_unit_ : storage_unit option) 
  ?storage_limit:(storage_limit_ : int option)  () =
  ({ storage_unit = storage_unit_; storage_limit = storage_limit_ } : 
  tgw_on_device_service_configuration)
let make_eks_on_device_service_configuration
  ?eks_anywhere_version:(eks_anywhere_version_ : string option) 
  ?kubernetes_version:(kubernetes_version_ : string option)  () =
  ({
     eks_anywhere_version = eks_anywhere_version_;
     kubernetes_version = kubernetes_version_
   } : eks_on_device_service_configuration)
let make_s3_on_device_service_configuration
  ?fault_tolerance:(fault_tolerance_ : int option) 
  ?service_size:(service_size_ : int option) 
  ?storage_unit:(storage_unit_ : storage_unit option) 
  ?storage_limit:(storage_limit_ : float option)  () =
  ({
     fault_tolerance = fault_tolerance_;
     service_size = service_size_;
     storage_unit = storage_unit_;
     storage_limit = storage_limit_
   } : s3_on_device_service_configuration)
let make_on_device_service_configuration
  ?s3_on_device_service:(s3_on_device_service_ :
                          s3_on_device_service_configuration option)
   ?eks_on_device_service:(eks_on_device_service_ :
                            eks_on_device_service_configuration option)
   ?tgw_on_device_service:(tgw_on_device_service_ :
                            tgw_on_device_service_configuration option)
   ?nfs_on_device_service:(nfs_on_device_service_ :
                            nfs_on_device_service_configuration option)
   () =
  ({
     s3_on_device_service = s3_on_device_service_;
     eks_on_device_service = eks_on_device_service_;
     tgw_on_device_service = tgw_on_device_service_;
     nfs_on_device_service = nfs_on_device_service_
   } : on_device_service_configuration)
let make_pickup_details ?device_pickup_id:(device_pickup_id_ : string option)
   ?identification_issuing_org:(identification_issuing_org_ : string option) 
  ?identification_expiration_date:(identification_expiration_date_ :
                                    CoreTypes.Timestamp.t option)
   ?identification_number:(identification_number_ : string option) 
  ?email:(email_ : string option) 
  ?phone_number:(phone_number_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     device_pickup_id = device_pickup_id_;
     identification_issuing_org = identification_issuing_org_;
     identification_expiration_date = identification_expiration_date_;
     identification_number = identification_number_;
     email = email_;
     phone_number = phone_number_;
     name = name_
   } : pickup_details)
let make_update_job_request
  ?pickup_details:(pickup_details_ : pickup_details option) 
  ?forwarding_address_id:(forwarding_address_id_ : string option) 
  ?snowball_capacity_preference:(snowball_capacity_preference_ :
                                  snowball_capacity option)
   ?description:(description_ : string option) 
  ?shipping_option:(shipping_option_ : shipping_option option) 
  ?address_id:(address_id_ : string option) 
  ?on_device_service_configuration:(on_device_service_configuration_ :
                                     on_device_service_configuration option)
   ?resources:(resources_ : job_resource option) 
  ?notification:(notification_ : notification option) 
  ?role_ar_n:(role_ar_n_ : string option)  ~job_id:(job_id_ : string)  () =
  ({
     pickup_details = pickup_details_;
     forwarding_address_id = forwarding_address_id_;
     snowball_capacity_preference = snowball_capacity_preference_;
     description = description_;
     shipping_option = shipping_option_;
     address_id = address_id_;
     on_device_service_configuration = on_device_service_configuration_;
     resources = resources_;
     notification = notification_;
     role_ar_n = role_ar_n_;
     job_id = job_id_
   } : update_job_request)
let make_update_cluster_request
  ?forwarding_address_id:(forwarding_address_id_ : string option) 
  ?notification:(notification_ : notification option) 
  ?shipping_option:(shipping_option_ : shipping_option option) 
  ?address_id:(address_id_ : string option) 
  ?on_device_service_configuration:(on_device_service_configuration_ :
                                     on_device_service_configuration option)
   ?resources:(resources_ : job_resource option) 
  ?description:(description_ : string option) 
  ?role_ar_n:(role_ar_n_ : string option)  ~cluster_id:(cluster_id_ : string)
   () =
  ({
     forwarding_address_id = forwarding_address_id_;
     notification = notification_;
     shipping_option = shipping_option_;
     address_id = address_id_;
     on_device_service_configuration = on_device_service_configuration_;
     resources = resources_;
     description = description_;
     role_ar_n = role_ar_n_;
     cluster_id = cluster_id_
   } : update_cluster_request)
let make_ind_tax_documents ?gsti_n:(gsti_n_ : string option)  () =
  ({ gsti_n = gsti_n_ } : ind_tax_documents)
let make_tax_documents ?in_d:(in_d_ : ind_tax_documents option)  () =
  ({ in_d = in_d_ } : tax_documents)
let make_snowcone_device_configuration
  ?wireless_connection:(wireless_connection_ : wireless_connection option) 
  () =
  ({ wireless_connection = wireless_connection_ } : snowcone_device_configuration)
let make_shipment ?tracking_number:(tracking_number_ : string option) 
  ?status:(status_ : string option)  () =
  ({ tracking_number = tracking_number_; status = status_ } : shipment)
let make_shipping_details
  ?outbound_shipment:(outbound_shipment_ : shipment option) 
  ?inbound_shipment:(inbound_shipment_ : shipment option) 
  ?shipping_option:(shipping_option_ : shipping_option option)  () =
  ({
     outbound_shipment = outbound_shipment_;
     inbound_shipment = inbound_shipment_;
     shipping_option = shipping_option_
   } : shipping_details)
let make_service_version ?version:(version_ : string option)  () =
  ({ version = version_ } : service_version)
let make_long_term_pricing_list_entry
  ?job_ids:(job_ids_ : string list option) 
  ?snowball_type:(snowball_type_ : snowball_type option) 
  ?long_term_pricing_status:(long_term_pricing_status_ : string option) 
  ?is_long_term_pricing_auto_renew:(is_long_term_pricing_auto_renew_ :
                                     bool option)
   ?replacement_job:(replacement_job_ : string option) 
  ?current_active_job:(current_active_job_ : string option) 
  ?long_term_pricing_type:(long_term_pricing_type_ :
                            long_term_pricing_type option)
   ?long_term_pricing_start_date:(long_term_pricing_start_date_ :
                                   CoreTypes.Timestamp.t option)
   ?long_term_pricing_end_date:(long_term_pricing_end_date_ :
                                 CoreTypes.Timestamp.t option)
   ?long_term_pricing_id:(long_term_pricing_id_ : string option)  () =
  ({
     job_ids = job_ids_;
     snowball_type = snowball_type_;
     long_term_pricing_status = long_term_pricing_status_;
     is_long_term_pricing_auto_renew = is_long_term_pricing_auto_renew_;
     replacement_job = replacement_job_;
     current_active_job = current_active_job_;
     long_term_pricing_type = long_term_pricing_type_;
     long_term_pricing_start_date = long_term_pricing_start_date_;
     long_term_pricing_end_date = long_term_pricing_end_date_;
     long_term_pricing_id = long_term_pricing_id_
   } : long_term_pricing_list_entry)
let make_dependent_service
  ?service_version:(service_version_ : service_version option) 
  ?service_name:(service_name_ : service_name option)  () =
  ({ service_version = service_version_; service_name = service_name_ } : 
  dependent_service)
let make_list_service_versions_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?dependent_services:(dependent_services_ : dependent_service list option) 
  ~service_name:(service_name_ : service_name)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     dependent_services = dependent_services_;
     service_name = service_name_
   } : list_service_versions_request)
let make_address ?type_:(type__ : address_type option) 
  ?is_restricted:(is_restricted_ : bool option) 
  ?phone_number:(phone_number_ : string option) 
  ?postal_code:(postal_code_ : string option) 
  ?country:(country_ : string option)  ?landmark:(landmark_ : string option) 
  ?prefecture_or_district:(prefecture_or_district_ : string option) 
  ?state_or_province:(state_or_province_ : string option) 
  ?city:(city_ : string option)  ?street3:(street3_ : string option) 
  ?street2:(street2_ : string option)  ?street1:(street1_ : string option) 
  ?company:(company_ : string option)  ?name:(name_ : string option) 
  ?address_id:(address_id_ : string option)  () =
  ({
     type_ = type__;
     is_restricted = is_restricted_;
     phone_number = phone_number_;
     postal_code = postal_code_;
     country = country_;
     landmark = landmark_;
     prefecture_or_district = prefecture_or_district_;
     state_or_province = state_or_province_;
     city = city_;
     street3 = street3_;
     street2 = street2_;
     street1 = street1_;
     company = company_;
     name = name_;
     address_id = address_id_
   } : address)
let make_list_pickup_locations_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_pickup_locations_request)
let make_list_long_term_pricing_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_long_term_pricing_request)
let make_job_list_entry ?description:(description_ : string option) 
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option) 
  ?snowball_type:(snowball_type_ : snowball_type option) 
  ?job_type:(job_type_ : job_type option) 
  ?is_master:(is_master_ : bool option) 
  ?job_state:(job_state_ : job_state option) 
  ?job_id:(job_id_ : string option)  () =
  ({
     description = description_;
     creation_date = creation_date_;
     snowball_type = snowball_type_;
     job_type = job_type_;
     is_master = is_master_;
     job_state = job_state_;
     job_id = job_id_
   } : job_list_entry)
let make_list_jobs_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_jobs_request)
let make_compatible_image ?name:(name_ : string option) 
  ?ami_id:(ami_id_ : string option)  () =
  ({ name = name_; ami_id = ami_id_ } : compatible_image)
let make_list_compatible_images_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_compatible_images_request)
let make_cluster_list_entry ?description:(description_ : string option) 
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option) 
  ?cluster_state:(cluster_state_ : cluster_state option) 
  ?cluster_id:(cluster_id_ : string option)  () =
  ({
     description = description_;
     creation_date = creation_date_;
     cluster_state = cluster_state_;
     cluster_id = cluster_id_
   } : cluster_list_entry)
let make_list_clusters_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_clusters_request)
let make_list_cluster_jobs_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~cluster_id:(cluster_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     cluster_id = cluster_id_
   } : list_cluster_jobs_request)
let make_data_transfer ?total_objects:(total_objects_ : int option) 
  ?total_bytes:(total_bytes_ : int option) 
  ?objects_transferred:(objects_transferred_ : int option) 
  ?bytes_transferred:(bytes_transferred_ : int option)  () =
  ({
     total_objects = total_objects_;
     total_bytes = total_bytes_;
     objects_transferred = objects_transferred_;
     bytes_transferred = bytes_transferred_
   } : data_transfer)
let make_job_logs
  ?job_failure_log_ur_i:(job_failure_log_ur_i_ : string option) 
  ?job_success_log_ur_i:(job_success_log_ur_i_ : string option) 
  ?job_completion_report_ur_i:(job_completion_report_ur_i_ : string option) 
  () =
  ({
     job_failure_log_ur_i = job_failure_log_ur_i_;
     job_success_log_ur_i = job_success_log_ur_i_;
     job_completion_report_ur_i = job_completion_report_ur_i_
   } : job_logs)
let make_device_configuration
  ?snowcone_device_configuration:(snowcone_device_configuration_ :
                                   snowcone_device_configuration option)
   () =
  ({ snowcone_device_configuration = snowcone_device_configuration_ } : 
  device_configuration)
let make_job_metadata ?snowball_id:(snowball_id_ : string option) 
  ?pickup_details:(pickup_details_ : pickup_details option) 
  ?impact_level:(impact_level_ : impact_level option) 
  ?on_device_service_configuration:(on_device_service_configuration_ :
                                     on_device_service_configuration option)
   ?long_term_pricing_id:(long_term_pricing_id_ : string option) 
  ?remote_management:(remote_management_ : remote_management option) 
  ?device_configuration:(device_configuration_ : device_configuration option)
   ?tax_documents:(tax_documents_ : tax_documents option) 
  ?forwarding_address_id:(forwarding_address_id_ : string option) 
  ?cluster_id:(cluster_id_ : string option) 
  ?job_log_info:(job_log_info_ : job_logs option) 
  ?data_transfer_progress:(data_transfer_progress_ : data_transfer option) 
  ?notification:(notification_ : notification option) 
  ?snowball_capacity_preference:(snowball_capacity_preference_ :
                                  snowball_capacity option)
   ?shipping_details:(shipping_details_ : shipping_details option) 
  ?address_id:(address_id_ : string option) 
  ?role_ar_n:(role_ar_n_ : string option) 
  ?kms_key_ar_n:(kms_key_ar_n_ : string option) 
  ?description:(description_ : string option) 
  ?resources:(resources_ : job_resource option) 
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option) 
  ?snowball_type:(snowball_type_ : snowball_type option) 
  ?job_type:(job_type_ : job_type option) 
  ?job_state:(job_state_ : job_state option) 
  ?job_id:(job_id_ : string option)  () =
  ({
     snowball_id = snowball_id_;
     pickup_details = pickup_details_;
     impact_level = impact_level_;
     on_device_service_configuration = on_device_service_configuration_;
     long_term_pricing_id = long_term_pricing_id_;
     remote_management = remote_management_;
     device_configuration = device_configuration_;
     tax_documents = tax_documents_;
     forwarding_address_id = forwarding_address_id_;
     cluster_id = cluster_id_;
     job_log_info = job_log_info_;
     data_transfer_progress = data_transfer_progress_;
     notification = notification_;
     snowball_capacity_preference = snowball_capacity_preference_;
     shipping_details = shipping_details_;
     address_id = address_id_;
     role_ar_n = role_ar_n_;
     kms_key_ar_n = kms_key_ar_n_;
     description = description_;
     resources = resources_;
     creation_date = creation_date_;
     snowball_type = snowball_type_;
     job_type = job_type_;
     job_state = job_state_;
     job_id = job_id_
   } : job_metadata)
let make_get_software_updates_request ~job_id:(job_id_ : string)  () =
  ({ job_id = job_id_ } : get_software_updates_request)
let make_get_snowball_usage_request () = (() : unit)
let make_get_job_unlock_code_request ~job_id:(job_id_ : string)  () =
  ({ job_id = job_id_ } : get_job_unlock_code_request)
let make_get_job_manifest_request ~job_id:(job_id_ : string)  () =
  ({ job_id = job_id_ } : get_job_manifest_request)
let make_describe_return_shipping_label_request ~job_id:(job_id_ : string) 
  () = ({ job_id = job_id_ } : describe_return_shipping_label_request)
let make_describe_job_request ~job_id:(job_id_ : string)  () =
  ({ job_id = job_id_ } : describe_job_request)
let make_cluster_metadata
  ?on_device_service_configuration:(on_device_service_configuration_ :
                                     on_device_service_configuration option)
   ?tax_documents:(tax_documents_ : tax_documents option) 
  ?forwarding_address_id:(forwarding_address_id_ : string option) 
  ?notification:(notification_ : notification option) 
  ?shipping_option:(shipping_option_ : shipping_option option) 
  ?address_id:(address_id_ : string option) 
  ?resources:(resources_ : job_resource option) 
  ?creation_date:(creation_date_ : CoreTypes.Timestamp.t option) 
  ?snowball_type:(snowball_type_ : snowball_type option) 
  ?job_type:(job_type_ : job_type option) 
  ?cluster_state:(cluster_state_ : cluster_state option) 
  ?role_ar_n:(role_ar_n_ : string option) 
  ?kms_key_ar_n:(kms_key_ar_n_ : string option) 
  ?description:(description_ : string option) 
  ?cluster_id:(cluster_id_ : string option)  () =
  ({
     on_device_service_configuration = on_device_service_configuration_;
     tax_documents = tax_documents_;
     forwarding_address_id = forwarding_address_id_;
     notification = notification_;
     shipping_option = shipping_option_;
     address_id = address_id_;
     resources = resources_;
     creation_date = creation_date_;
     snowball_type = snowball_type_;
     job_type = job_type_;
     cluster_state = cluster_state_;
     role_ar_n = role_ar_n_;
     kms_key_ar_n = kms_key_ar_n_;
     description = description_;
     cluster_id = cluster_id_
   } : cluster_metadata)
let make_describe_cluster_request ~cluster_id:(cluster_id_ : string)  () =
  ({ cluster_id = cluster_id_ } : describe_cluster_request)
let make_describe_addresses_request ?next_token:(next_token_ : string option)
   ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_addresses_request)
let make_describe_address_request ~address_id:(address_id_ : string)  () =
  ({ address_id = address_id_ } : describe_address_request)
let make_create_return_shipping_label_request
  ?shipping_option:(shipping_option_ : shipping_option option) 
  ~job_id:(job_id_ : string)  () =
  ({ shipping_option = shipping_option_; job_id = job_id_ } : create_return_shipping_label_request)
let make_create_long_term_pricing_request
  ?is_long_term_pricing_auto_renew:(is_long_term_pricing_auto_renew_ :
                                     bool option)
   ~snowball_type:(snowball_type_ : snowball_type) 
  ~long_term_pricing_type:(long_term_pricing_type_ : long_term_pricing_type) 
  () =
  ({
     snowball_type = snowball_type_;
     is_long_term_pricing_auto_renew = is_long_term_pricing_auto_renew_;
     long_term_pricing_type = long_term_pricing_type_
   } : create_long_term_pricing_request)
let make_create_job_request
  ?pickup_details:(pickup_details_ : pickup_details option) 
  ?impact_level:(impact_level_ : impact_level option) 
  ?long_term_pricing_id:(long_term_pricing_id_ : string option) 
  ?remote_management:(remote_management_ : remote_management option) 
  ?device_configuration:(device_configuration_ : device_configuration option)
   ?tax_documents:(tax_documents_ : tax_documents option) 
  ?forwarding_address_id:(forwarding_address_id_ : string option) 
  ?snowball_type:(snowball_type_ : snowball_type option) 
  ?cluster_id:(cluster_id_ : string option) 
  ?notification:(notification_ : notification option) 
  ?shipping_option:(shipping_option_ : shipping_option option) 
  ?snowball_capacity_preference:(snowball_capacity_preference_ :
                                  snowball_capacity option)
   ?role_ar_n:(role_ar_n_ : string option) 
  ?kms_key_ar_n:(kms_key_ar_n_ : string option) 
  ?address_id:(address_id_ : string option) 
  ?description:(description_ : string option) 
  ?on_device_service_configuration:(on_device_service_configuration_ :
                                     on_device_service_configuration option)
   ?resources:(resources_ : job_resource option) 
  ?job_type:(job_type_ : job_type option)  () =
  ({
     pickup_details = pickup_details_;
     impact_level = impact_level_;
     long_term_pricing_id = long_term_pricing_id_;
     remote_management = remote_management_;
     device_configuration = device_configuration_;
     tax_documents = tax_documents_;
     forwarding_address_id = forwarding_address_id_;
     snowball_type = snowball_type_;
     cluster_id = cluster_id_;
     notification = notification_;
     shipping_option = shipping_option_;
     snowball_capacity_preference = snowball_capacity_preference_;
     role_ar_n = role_ar_n_;
     kms_key_ar_n = kms_key_ar_n_;
     address_id = address_id_;
     description = description_;
     on_device_service_configuration = on_device_service_configuration_;
     resources = resources_;
     job_type = job_type_
   } : create_job_request)
let make_create_cluster_request
  ?snowball_capacity_preference:(snowball_capacity_preference_ :
                                  snowball_capacity option)
   ?long_term_pricing_ids:(long_term_pricing_ids_ : string list option) 
  ?force_create_jobs:(force_create_jobs_ : bool option) 
  ?initial_cluster_size:(initial_cluster_size_ : int option) 
  ?remote_management:(remote_management_ : remote_management option) 
  ?tax_documents:(tax_documents_ : tax_documents option) 
  ?forwarding_address_id:(forwarding_address_id_ : string option) 
  ?notification:(notification_ : notification option) 
  ?role_ar_n:(role_ar_n_ : string option) 
  ?kms_key_ar_n:(kms_key_ar_n_ : string option) 
  ?description:(description_ : string option) 
  ?on_device_service_configuration:(on_device_service_configuration_ :
                                     on_device_service_configuration option)
   ?resources:(resources_ : job_resource option) 
  ~shipping_option:(shipping_option_ : shipping_option) 
  ~snowball_type:(snowball_type_ : snowball_type) 
  ~address_id:(address_id_ : string)  ~job_type:(job_type_ : job_type)  () =
  ({
     snowball_capacity_preference = snowball_capacity_preference_;
     long_term_pricing_ids = long_term_pricing_ids_;
     force_create_jobs = force_create_jobs_;
     initial_cluster_size = initial_cluster_size_;
     remote_management = remote_management_;
     tax_documents = tax_documents_;
     forwarding_address_id = forwarding_address_id_;
     notification = notification_;
     shipping_option = shipping_option_;
     snowball_type = snowball_type_;
     role_ar_n = role_ar_n_;
     kms_key_ar_n = kms_key_ar_n_;
     address_id = address_id_;
     description = description_;
     on_device_service_configuration = on_device_service_configuration_;
     resources = resources_;
     job_type = job_type_
   } : create_cluster_request)
let make_create_address_request ~address:(address_ : address)  () =
  ({ address = address_ } : create_address_request)
let make_cancel_job_request ~job_id:(job_id_ : string)  () =
  ({ job_id = job_id_ } : cancel_job_request)
let make_cancel_cluster_request ~cluster_id:(cluster_id_ : string)  () =
  ({ cluster_id = cluster_id_ } : cancel_cluster_request)