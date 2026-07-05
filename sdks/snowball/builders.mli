open Types

val make_wireless_connection : ?is_wifi_enabled:boolean_ -> unit -> wireless_connection

val make_update_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:java_boolean ->
  ?replacement_job:job_id ->
  long_term_pricing_id:long_term_pricing_id ->
  unit ->
  update_long_term_pricing_request

val make_update_job_shipment_state_request :
  shipment_state:shipment_state -> job_id:job_id -> unit -> update_job_shipment_state_request

val make_notification :
  ?device_pickup_sns_topic_ar_n:sns_topic_ar_n ->
  ?notify_all:boolean_ ->
  ?job_states_to_notify:job_state_list ->
  ?sns_topic_ar_n:sns_topic_ar_n ->
  unit ->
  notification

val make_key_range : ?end_marker:string_ -> ?begin_marker:string_ -> unit -> key_range

val make_target_on_device_service :
  ?transfer_option:transfer_option ->
  ?service_name:device_service_name ->
  unit ->
  target_on_device_service

val make_s3_resource :
  ?target_on_device_services:target_on_device_service_list ->
  ?key_range:key_range ->
  ?bucket_arn:resource_ar_n ->
  unit ->
  s3_resource

val make_event_trigger_definition :
  ?event_resource_ar_n:resource_ar_n -> unit -> event_trigger_definition

val make_lambda_resource :
  ?event_triggers:event_trigger_definition_list ->
  ?lambda_arn:resource_ar_n ->
  unit ->
  lambda_resource

val make_ec2_ami_resource : ?snowball_ami_id:string_ -> ami_id:ami_id -> unit -> ec2_ami_resource

val make_job_resource :
  ?ec2_ami_resources:ec2_ami_resource_list ->
  ?lambda_resources:lambda_resource_list ->
  ?s3_resources:s3_resource_list ->
  unit ->
  job_resource

val make_nfs_on_device_service_configuration :
  ?storage_unit:storage_unit ->
  ?storage_limit:storage_limit ->
  unit ->
  nfs_on_device_service_configuration

val make_tgw_on_device_service_configuration :
  ?storage_unit:storage_unit ->
  ?storage_limit:storage_limit ->
  unit ->
  tgw_on_device_service_configuration

val make_eks_on_device_service_configuration :
  ?eks_anywhere_version:string_ ->
  ?kubernetes_version:string_ ->
  unit ->
  eks_on_device_service_configuration

val make_s3_on_device_service_configuration :
  ?fault_tolerance:node_fault_tolerance ->
  ?service_size:service_size ->
  ?storage_unit:storage_unit ->
  ?storage_limit:s3_storage_limit ->
  unit ->
  s3_on_device_service_configuration

val make_on_device_service_configuration :
  ?s3_on_device_service:s3_on_device_service_configuration ->
  ?eks_on_device_service:eks_on_device_service_configuration ->
  ?tgw_on_device_service:tgw_on_device_service_configuration ->
  ?nfs_on_device_service:nfs_on_device_service_configuration ->
  unit ->
  on_device_service_configuration

val make_pickup_details :
  ?device_pickup_id:device_pickup_id ->
  ?identification_issuing_org:string_ ->
  ?identification_expiration_date:timestamp ->
  ?identification_number:string_ ->
  ?email:email ->
  ?phone_number:phone_number ->
  ?name:string_ ->
  unit ->
  pickup_details

val make_update_job_request :
  ?pickup_details:pickup_details ->
  ?forwarding_address_id:address_id ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?description:string_ ->
  ?shipping_option:shipping_option ->
  ?address_id:address_id ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?notification:notification ->
  ?role_ar_n:role_ar_n ->
  job_id:job_id ->
  unit ->
  update_job_request

val make_update_cluster_request :
  ?forwarding_address_id:address_id ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?address_id:address_id ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?description:string_ ->
  ?role_ar_n:role_ar_n ->
  cluster_id:cluster_id ->
  unit ->
  update_cluster_request

val make_ind_tax_documents : ?gsti_n:gsti_n -> unit -> ind_tax_documents
val make_tax_documents : ?in_d:ind_tax_documents -> unit -> tax_documents

val make_snowcone_device_configuration :
  ?wireless_connection:wireless_connection -> unit -> snowcone_device_configuration

val make_shipment : ?tracking_number:string_ -> ?status:string_ -> unit -> shipment

val make_shipping_details :
  ?outbound_shipment:shipment ->
  ?inbound_shipment:shipment ->
  ?shipping_option:shipping_option ->
  unit ->
  shipping_details

val make_service_version : ?version:string_ -> unit -> service_version

val make_long_term_pricing_list_entry :
  ?job_ids:long_term_pricing_associated_job_id_list ->
  ?snowball_type:snowball_type ->
  ?long_term_pricing_status:string_ ->
  ?is_long_term_pricing_auto_renew:java_boolean ->
  ?replacement_job:job_id ->
  ?current_active_job:job_id ->
  ?long_term_pricing_type:long_term_pricing_type ->
  ?long_term_pricing_start_date:timestamp ->
  ?long_term_pricing_end_date:timestamp ->
  ?long_term_pricing_id:long_term_pricing_id ->
  unit ->
  long_term_pricing_list_entry

val make_dependent_service :
  ?service_version:service_version -> ?service_name:service_name -> unit -> dependent_service

val make_list_service_versions_request :
  ?next_token:string_ ->
  ?max_results:list_limit ->
  ?dependent_services:dependent_service_list ->
  service_name:service_name ->
  unit ->
  list_service_versions_request

val make_address :
  ?type_:address_type ->
  ?is_restricted:boolean_ ->
  ?phone_number:string_ ->
  ?postal_code:string_ ->
  ?country:string_ ->
  ?landmark:string_ ->
  ?prefecture_or_district:string_ ->
  ?state_or_province:string_ ->
  ?city:string_ ->
  ?street3:string_ ->
  ?street2:string_ ->
  ?street1:string_ ->
  ?company:string_ ->
  ?name:string_ ->
  ?address_id:address_id ->
  unit ->
  address

val make_list_pickup_locations_request :
  ?next_token:string_ -> ?max_results:list_limit -> unit -> list_pickup_locations_request

val make_list_long_term_pricing_request :
  ?next_token:string_ -> ?max_results:list_limit -> unit -> list_long_term_pricing_request

val make_job_list_entry :
  ?description:string_ ->
  ?creation_date:timestamp ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?is_master:boolean_ ->
  ?job_state:job_state ->
  ?job_id:string_ ->
  unit ->
  job_list_entry

val make_list_jobs_request :
  ?next_token:string_ -> ?max_results:list_limit -> unit -> list_jobs_request

val make_compatible_image : ?name:string_ -> ?ami_id:string_ -> unit -> compatible_image

val make_list_compatible_images_request :
  ?next_token:string_ -> ?max_results:list_limit -> unit -> list_compatible_images_request

val make_cluster_list_entry :
  ?description:string_ ->
  ?creation_date:timestamp ->
  ?cluster_state:cluster_state ->
  ?cluster_id:string_ ->
  unit ->
  cluster_list_entry

val make_list_clusters_request :
  ?next_token:string_ -> ?max_results:list_limit -> unit -> list_clusters_request

val make_list_cluster_jobs_request :
  ?next_token:string_ ->
  ?max_results:list_limit ->
  cluster_id:cluster_id ->
  unit ->
  list_cluster_jobs_request

val make_data_transfer :
  ?total_objects:long ->
  ?total_bytes:long ->
  ?objects_transferred:long ->
  ?bytes_transferred:long ->
  unit ->
  data_transfer

val make_job_logs :
  ?job_failure_log_ur_i:string_ ->
  ?job_success_log_ur_i:string_ ->
  ?job_completion_report_ur_i:string_ ->
  unit ->
  job_logs

val make_device_configuration :
  ?snowcone_device_configuration:snowcone_device_configuration -> unit -> device_configuration

val make_job_metadata :
  ?snowball_id:string_ ->
  ?pickup_details:pickup_details ->
  ?impact_level:impact_level ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?long_term_pricing_id:long_term_pricing_id ->
  ?remote_management:remote_management ->
  ?device_configuration:device_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:address_id ->
  ?cluster_id:string_ ->
  ?job_log_info:job_logs ->
  ?data_transfer_progress:data_transfer ->
  ?notification:notification ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?shipping_details:shipping_details ->
  ?address_id:address_id ->
  ?role_ar_n:role_ar_n ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?description:string_ ->
  ?resources:job_resource ->
  ?creation_date:timestamp ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?job_state:job_state ->
  ?job_id:string_ ->
  unit ->
  job_metadata

val make_get_software_updates_request : job_id:job_id -> unit -> get_software_updates_request
val make_get_snowball_usage_request : unit -> unit
val make_get_job_unlock_code_request : job_id:job_id -> unit -> get_job_unlock_code_request
val make_get_job_manifest_request : job_id:job_id -> unit -> get_job_manifest_request

val make_describe_return_shipping_label_request :
  job_id:job_id -> unit -> describe_return_shipping_label_request

val make_describe_job_request : job_id:job_id -> unit -> describe_job_request

val make_cluster_metadata :
  ?on_device_service_configuration:on_device_service_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:address_id ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?address_id:address_id ->
  ?resources:job_resource ->
  ?creation_date:timestamp ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?cluster_state:cluster_state ->
  ?role_ar_n:role_ar_n ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?description:string_ ->
  ?cluster_id:string_ ->
  unit ->
  cluster_metadata

val make_describe_cluster_request : cluster_id:cluster_id -> unit -> describe_cluster_request

val make_describe_addresses_request :
  ?next_token:string_ -> ?max_results:list_limit -> unit -> describe_addresses_request

val make_describe_address_request : address_id:address_id -> unit -> describe_address_request

val make_create_return_shipping_label_request :
  ?shipping_option:shipping_option -> job_id:job_id -> unit -> create_return_shipping_label_request

val make_create_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:java_boolean ->
  snowball_type:snowball_type ->
  long_term_pricing_type:long_term_pricing_type ->
  unit ->
  create_long_term_pricing_request

val make_create_job_request :
  ?pickup_details:pickup_details ->
  ?impact_level:impact_level ->
  ?long_term_pricing_id:long_term_pricing_id ->
  ?remote_management:remote_management ->
  ?device_configuration:device_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:address_id ->
  ?snowball_type:snowball_type ->
  ?cluster_id:cluster_id ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?role_ar_n:role_ar_n ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?address_id:address_id ->
  ?description:string_ ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?job_type:job_type ->
  unit ->
  create_job_request

val make_create_cluster_request :
  ?snowball_capacity_preference:snowball_capacity ->
  ?long_term_pricing_ids:long_term_pricing_id_list ->
  ?force_create_jobs:boolean_ ->
  ?initial_cluster_size:initial_cluster_size ->
  ?remote_management:remote_management ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:address_id ->
  ?notification:notification ->
  ?role_ar_n:role_ar_n ->
  ?kms_key_ar_n:kms_key_ar_n ->
  ?description:string_ ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  shipping_option:shipping_option ->
  snowball_type:snowball_type ->
  address_id:address_id ->
  job_type:job_type ->
  unit ->
  create_cluster_request

val make_create_address_request : address:address -> unit -> create_address_request
val make_cancel_job_request : job_id:job_id -> unit -> cancel_job_request
val make_cancel_cluster_request : cluster_id:cluster_id -> unit -> cancel_cluster_request
