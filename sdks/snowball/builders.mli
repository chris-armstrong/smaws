open Types

val make_update_long_term_pricing_request :
  ?replacement_job:job_id ->
  ?is_long_term_pricing_auto_renew:java_boolean ->
  long_term_pricing_id:long_term_pricing_id ->
  unit ->
  update_long_term_pricing_request

val make_update_job_shipment_state_request :
  job_id:job_id -> shipment_state:shipment_state -> unit -> update_job_shipment_state_request

val make_pickup_details :
  ?name:string_ ->
  ?phone_number:phone_number ->
  ?email:email ->
  ?identification_number:string_ ->
  ?identification_expiration_date:timestamp ->
  ?identification_issuing_org:string_ ->
  ?device_pickup_id:device_pickup_id ->
  unit ->
  pickup_details

val make_s3_on_device_service_configuration :
  ?storage_limit:s3_storage_limit ->
  ?storage_unit:storage_unit ->
  ?service_size:service_size ->
  ?fault_tolerance:node_fault_tolerance ->
  unit ->
  s3_on_device_service_configuration

val make_eks_on_device_service_configuration :
  ?kubernetes_version:string_ ->
  ?eks_anywhere_version:string_ ->
  unit ->
  eks_on_device_service_configuration

val make_tgw_on_device_service_configuration :
  ?storage_limit:storage_limit ->
  ?storage_unit:storage_unit ->
  unit ->
  tgw_on_device_service_configuration

val make_nfs_on_device_service_configuration :
  ?storage_limit:storage_limit ->
  ?storage_unit:storage_unit ->
  unit ->
  nfs_on_device_service_configuration

val make_on_device_service_configuration :
  ?nfs_on_device_service:nfs_on_device_service_configuration ->
  ?tgw_on_device_service:tgw_on_device_service_configuration ->
  ?eks_on_device_service:eks_on_device_service_configuration ->
  ?s3_on_device_service:s3_on_device_service_configuration ->
  unit ->
  on_device_service_configuration

val make_ec2_ami_resource : ?snowball_ami_id:string_ -> ami_id:ami_id -> unit -> ec2_ami_resource

val make_event_trigger_definition :
  ?event_resource_ar_n:resource_ar_n -> unit -> event_trigger_definition

val make_lambda_resource :
  ?lambda_arn:resource_ar_n ->
  ?event_triggers:event_trigger_definition_list ->
  unit ->
  lambda_resource

val make_target_on_device_service :
  ?service_name:device_service_name ->
  ?transfer_option:transfer_option ->
  unit ->
  target_on_device_service

val make_key_range : ?begin_marker:string_ -> ?end_marker:string_ -> unit -> key_range

val make_s3_resource :
  ?bucket_arn:resource_ar_n ->
  ?key_range:key_range ->
  ?target_on_device_services:target_on_device_service_list ->
  unit ->
  s3_resource

val make_job_resource :
  ?s3_resources:s3_resource_list ->
  ?lambda_resources:lambda_resource_list ->
  ?ec2_ami_resources:ec2_ami_resource_list ->
  unit ->
  job_resource

val make_notification :
  ?sns_topic_ar_n:sns_topic_ar_n ->
  ?job_states_to_notify:job_state_list ->
  ?notify_all:boolean_ ->
  ?device_pickup_sns_topic_ar_n:sns_topic_ar_n ->
  unit ->
  notification

val make_update_job_request :
  ?role_ar_n:role_ar_n ->
  ?notification:notification ->
  ?resources:job_resource ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?address_id:address_id ->
  ?shipping_option:shipping_option ->
  ?description:string_ ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?forwarding_address_id:address_id ->
  ?pickup_details:pickup_details ->
  job_id:job_id ->
  unit ->
  update_job_request

val make_update_cluster_request :
  ?role_ar_n:role_ar_n ->
  ?description:string_ ->
  ?resources:job_resource ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?address_id:address_id ->
  ?shipping_option:shipping_option ->
  ?notification:notification ->
  ?forwarding_address_id:address_id ->
  cluster_id:cluster_id ->
  unit ->
  update_cluster_request

val make_service_version : ?version:string_ -> unit -> service_version

val make_dependent_service :
  ?service_name:service_name -> ?service_version:service_version -> unit -> dependent_service

val make_list_service_versions_request :
  ?dependent_services:dependent_service_list ->
  ?max_results:list_limit ->
  ?next_token:string_ ->
  service_name:service_name ->
  unit ->
  list_service_versions_request

val make_address :
  ?address_id:address_id ->
  ?name:string_ ->
  ?company:string_ ->
  ?street1:string_ ->
  ?street2:string_ ->
  ?street3:string_ ->
  ?city:string_ ->
  ?state_or_province:string_ ->
  ?prefecture_or_district:string_ ->
  ?landmark:string_ ->
  ?country:string_ ->
  ?postal_code:string_ ->
  ?phone_number:string_ ->
  ?is_restricted:boolean_ ->
  ?type_:address_type ->
  unit ->
  address

val make_list_pickup_locations_request :
  ?max_results:list_limit -> ?next_token:string_ -> unit -> list_pickup_locations_request

val make_long_term_pricing_list_entry :
  ?long_term_pricing_id:long_term_pricing_id ->
  ?long_term_pricing_end_date:timestamp ->
  ?long_term_pricing_start_date:timestamp ->
  ?long_term_pricing_type:long_term_pricing_type ->
  ?current_active_job:job_id ->
  ?replacement_job:job_id ->
  ?is_long_term_pricing_auto_renew:java_boolean ->
  ?long_term_pricing_status:string_ ->
  ?snowball_type:snowball_type ->
  ?job_ids:long_term_pricing_associated_job_id_list ->
  unit ->
  long_term_pricing_list_entry

val make_list_long_term_pricing_request :
  ?max_results:list_limit -> ?next_token:string_ -> unit -> list_long_term_pricing_request

val make_job_list_entry :
  ?job_id:string_ ->
  ?job_state:job_state ->
  ?is_master:boolean_ ->
  ?job_type:job_type ->
  ?snowball_type:snowball_type ->
  ?creation_date:timestamp ->
  ?description:string_ ->
  unit ->
  job_list_entry

val make_list_jobs_request :
  ?max_results:list_limit -> ?next_token:string_ -> unit -> list_jobs_request

val make_compatible_image : ?ami_id:string_ -> ?name:string_ -> unit -> compatible_image

val make_list_compatible_images_request :
  ?max_results:list_limit -> ?next_token:string_ -> unit -> list_compatible_images_request

val make_cluster_list_entry :
  ?cluster_id:string_ ->
  ?cluster_state:cluster_state ->
  ?creation_date:timestamp ->
  ?description:string_ ->
  unit ->
  cluster_list_entry

val make_list_clusters_request :
  ?max_results:list_limit -> ?next_token:string_ -> unit -> list_clusters_request

val make_list_cluster_jobs_request :
  ?max_results:list_limit ->
  ?next_token:string_ ->
  cluster_id:cluster_id ->
  unit ->
  list_cluster_jobs_request

val make_get_software_updates_request : job_id:job_id -> unit -> get_software_updates_request
val make_get_snowball_usage_request : unit -> unit
val make_get_job_unlock_code_request : job_id:job_id -> unit -> get_job_unlock_code_request
val make_get_job_manifest_request : job_id:job_id -> unit -> get_job_manifest_request

val make_describe_return_shipping_label_request :
  job_id:job_id -> unit -> describe_return_shipping_label_request

val make_wireless_connection : ?is_wifi_enabled:boolean_ -> unit -> wireless_connection

val make_snowcone_device_configuration :
  ?wireless_connection:wireless_connection -> unit -> snowcone_device_configuration

val make_device_configuration :
  ?snowcone_device_configuration:snowcone_device_configuration -> unit -> device_configuration

val make_ind_tax_documents : ?gsti_n:gsti_n -> unit -> ind_tax_documents
val make_tax_documents : ?in_d:ind_tax_documents -> unit -> tax_documents

val make_job_logs :
  ?job_completion_report_ur_i:string_ ->
  ?job_success_log_ur_i:string_ ->
  ?job_failure_log_ur_i:string_ ->
  unit ->
  job_logs

val make_data_transfer :
  ?bytes_transferred:long ->
  ?objects_transferred:long ->
  ?total_bytes:long ->
  ?total_objects:long ->
  unit ->
  data_transfer

val make_shipment : ?status:string_ -> ?tracking_number:string_ -> unit -> shipment

val make_shipping_details :
  ?shipping_option:shipping_option ->
  ?inbound_shipment:shipment ->
  ?outbound_shipment:shipment ->
  unit ->
  shipping_details

val make_job_metadata :
  ?job_id:string_ ->
  ?job_state:job_state ->
  ?job_type:job_type ->
  ?snowball_type:snowball_type ->
  ?creation_date:timestamp ->
  ?resources:job_resource ->
  ?description:string_ ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?role_ar_n:role_ar_n ->
  ?address_id:address_id ->
  ?shipping_details:shipping_details ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?notification:notification ->
  ?data_transfer_progress:data_transfer ->
  ?job_log_info:job_logs ->
  ?cluster_id:string_ ->
  ?forwarding_address_id:address_id ->
  ?tax_documents:tax_documents ->
  ?device_configuration:device_configuration ->
  ?remote_management:remote_management ->
  ?long_term_pricing_id:long_term_pricing_id ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?impact_level:impact_level ->
  ?pickup_details:pickup_details ->
  ?snowball_id:string_ ->
  unit ->
  job_metadata

val make_describe_job_request : job_id:job_id -> unit -> describe_job_request

val make_cluster_metadata :
  ?cluster_id:string_ ->
  ?description:string_ ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?role_ar_n:role_ar_n ->
  ?cluster_state:cluster_state ->
  ?job_type:job_type ->
  ?snowball_type:snowball_type ->
  ?creation_date:timestamp ->
  ?resources:job_resource ->
  ?address_id:address_id ->
  ?shipping_option:shipping_option ->
  ?notification:notification ->
  ?forwarding_address_id:address_id ->
  ?tax_documents:tax_documents ->
  ?on_device_service_configuration:on_device_service_configuration ->
  unit ->
  cluster_metadata

val make_describe_cluster_request : cluster_id:cluster_id -> unit -> describe_cluster_request

val make_describe_addresses_request :
  ?max_results:list_limit -> ?next_token:string_ -> unit -> describe_addresses_request

val make_describe_address_request : address_id:address_id -> unit -> describe_address_request

val make_create_return_shipping_label_request :
  ?shipping_option:shipping_option -> job_id:job_id -> unit -> create_return_shipping_label_request

val make_create_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:java_boolean ->
  long_term_pricing_type:long_term_pricing_type ->
  snowball_type:snowball_type ->
  unit ->
  create_long_term_pricing_request

val make_create_job_request :
  ?job_type:job_type ->
  ?resources:job_resource ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?description:string_ ->
  ?address_id:address_id ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?role_ar_n:role_ar_n ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?shipping_option:shipping_option ->
  ?notification:notification ->
  ?cluster_id:cluster_id ->
  ?snowball_type:snowball_type ->
  ?forwarding_address_id:address_id ->
  ?tax_documents:tax_documents ->
  ?device_configuration:device_configuration ->
  ?remote_management:remote_management ->
  ?long_term_pricing_id:long_term_pricing_id ->
  ?impact_level:impact_level ->
  ?pickup_details:pickup_details ->
  unit ->
  create_job_request

val make_create_cluster_request :
  ?resources:job_resource ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?description:string_ ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?role_ar_n:role_ar_n ->
  ?notification:notification ->
  ?forwarding_address_id:address_id ->
  ?tax_documents:tax_documents ->
  ?remote_management:remote_management ->
  ?initial_cluster_size:initial_cluster_size ->
  ?force_create_jobs:boolean_ ->
  ?long_term_pricing_ids:long_term_pricing_id_list ->
  ?snowball_capacity_preference:snowball_capacity ->
  job_type:job_type ->
  address_id:address_id ->
  snowball_type:snowball_type ->
  shipping_option:shipping_option ->
  unit ->
  create_cluster_request

val make_create_address_request : address:address -> unit -> create_address_request
val make_cancel_job_request : job_id:job_id -> unit -> cancel_job_request
val make_cancel_cluster_request : cluster_id:cluster_id -> unit -> cancel_cluster_request
