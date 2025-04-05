open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "snowball";
      endpointPrefix = "snowball";
      version = "2016-06-30";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec wireless_connection = {
  is_wifi_enabled: bool option }
type nonrec update_long_term_pricing_result = unit
type nonrec update_long_term_pricing_request =
  {
  is_long_term_pricing_auto_renew: bool option ;
  replacement_job: string option ;
  long_term_pricing_id: string }
type nonrec invalid_resource_exception =
  {
  resource_type: string option ;
  message: string option }
type nonrec update_job_shipment_state_result = unit
type nonrec shipment_state =
  | RETURNED 
  | RECEIVED 
type nonrec update_job_shipment_state_request =
  {
  shipment_state: shipment_state ;
  job_id: string }
type nonrec invalid_job_state_exception = {
  message: string option }
type nonrec update_job_result = unit
type nonrec job_state =
  | PENDING 
  | LISTING 
  | CANCELLED 
  | COMPLETE 
  | IN_PROGRESS 
  | WITH_AWS 
  | WITH_AWS_SORTING_FACILITY 
  | IN_TRANSIT_TO_AWS 
  | WITH_CUSTOMER 
  | IN_TRANSIT_TO_CUSTOMER 
  | PREPARING_SHIPMENT 
  | PREPARING_APPLIANCE 
  | NEW 
type nonrec notification =
  {
  device_pickup_sns_topic_ar_n: string option ;
  notify_all: bool option ;
  job_states_to_notify: job_state list option ;
  sns_topic_ar_n: string option }
type nonrec key_range =
  {
  end_marker: string option ;
  begin_marker: string option }
type nonrec device_service_name =
  | S3_ON_DEVICE_SERVICE 
  | NFS_ON_DEVICE_SERVICE 
type nonrec transfer_option =
  | LOCAL_USE 
  | EXPORT 
  | IMPORT 
type nonrec target_on_device_service =
  {
  transfer_option: transfer_option option ;
  service_name: device_service_name option }
type nonrec s3_resource =
  {
  target_on_device_services: target_on_device_service list option ;
  key_range: key_range option ;
  bucket_arn: string option }
type nonrec event_trigger_definition = {
  event_resource_ar_n: string option }
type nonrec lambda_resource =
  {
  event_triggers: event_trigger_definition list option ;
  lambda_arn: string option }
type nonrec ec2_ami_resource =
  {
  snowball_ami_id: string option ;
  ami_id: string }
type nonrec job_resource =
  {
  ec2_ami_resources: ec2_ami_resource list option ;
  lambda_resources: lambda_resource list option ;
  s3_resources: s3_resource list option }
type nonrec storage_unit =
  | TB 
type nonrec nfs_on_device_service_configuration =
  {
  storage_unit: storage_unit option ;
  storage_limit: int option }
type nonrec tgw_on_device_service_configuration =
  {
  storage_unit: storage_unit option ;
  storage_limit: int option }
type nonrec eks_on_device_service_configuration =
  {
  eks_anywhere_version: string option ;
  kubernetes_version: string option }
type nonrec s3_on_device_service_configuration =
  {
  fault_tolerance: int option ;
  service_size: int option ;
  storage_unit: storage_unit option ;
  storage_limit: float option }
type nonrec on_device_service_configuration =
  {
  s3_on_device_service: s3_on_device_service_configuration option ;
  eks_on_device_service: eks_on_device_service_configuration option ;
  tgw_on_device_service: tgw_on_device_service_configuration option ;
  nfs_on_device_service: nfs_on_device_service_configuration option }
type nonrec shipping_option =
  | STANDARD 
  | EXPRESS 
  | NEXT_DAY 
  | SECOND_DAY 
type nonrec snowball_capacity =
  | T13 
  | T240 
  | NO_PREFERENCE 
  | T32 
  | T14 
  | T8 
  | T98 
  | T42 
  | T100 
  | T80 
  | T50 
type nonrec pickup_details =
  {
  device_pickup_id: string option ;
  identification_issuing_org: string option ;
  identification_expiration_date: CoreTypes.Timestamp.t option ;
  identification_number: string option ;
  email: string option ;
  phone_number: string option ;
  name: string option }
type nonrec update_job_request =
  {
  pickup_details: pickup_details option ;
  forwarding_address_id: string option ;
  snowball_capacity_preference: snowball_capacity option ;
  description: string option ;
  shipping_option: shipping_option option ;
  address_id: string option ;
  on_device_service_configuration: on_device_service_configuration option ;
  resources: job_resource option ;
  notification: notification option ;
  role_ar_n: string option ;
  job_id: string }
type nonrec kms_request_failed_exception = {
  message: string option }
type nonrec invalid_input_combination_exception = {
  message: string option }
type nonrec ec2_request_failed_exception = {
  message: string option }
type nonrec cluster_limit_exceeded_exception = {
  message: string option }
type nonrec update_cluster_result = unit
type nonrec update_cluster_request =
  {
  forwarding_address_id: string option ;
  notification: notification option ;
  shipping_option: shipping_option option ;
  address_id: string option ;
  on_device_service_configuration: on_device_service_configuration option ;
  resources: job_resource option ;
  description: string option ;
  role_ar_n: string option ;
  cluster_id: string }
type nonrec unsupported_address_exception = {
  message: string option }
type nonrec ind_tax_documents = {
  gsti_n: string option }
type nonrec tax_documents = {
  in_d: ind_tax_documents option }
type nonrec snowcone_device_configuration =
  {
  wireless_connection: wireless_connection option }
type nonrec snowball_type =
  | RACK_5U_C 
  | V3_5S 
  | V3_5C 
  | SNC1_SSD 
  | SNC1_HDD 
  | EDGE_S 
  | EDGE_CG 
  | EDGE_C 
  | EDGE 
  | STANDARD 
type nonrec shipping_label_status =
  | FAILED 
  | SUCCEEDED 
  | TIMED_OUT 
  | IN_PROGRESS 
type nonrec shipment =
  {
  tracking_number: string option ;
  status: string option }
type nonrec shipping_details =
  {
  outbound_shipment: shipment option ;
  inbound_shipment: shipment option ;
  shipping_option: shipping_option option }
type nonrec service_version = {
  version: string option }
type nonrec service_name =
  | EKS_ANYWHERE 
  | KUBERNETES 
type nonrec return_shipping_label_already_exists_exception =
  {
  message: string option }
type nonrec remote_management =
  | NOT_INSTALLED 
  | INSTALLED_AUTOSTART 
  | INSTALLED_ONLY 
type nonrec long_term_pricing_type =
  | ONE_MONTH 
  | THREE_YEAR 
  | ONE_YEAR 
type nonrec long_term_pricing_list_entry =
  {
  job_ids: string list option ;
  snowball_type: snowball_type option ;
  long_term_pricing_status: string option ;
  is_long_term_pricing_auto_renew: bool option ;
  replacement_job: string option ;
  current_active_job: string option ;
  long_term_pricing_type: long_term_pricing_type option ;
  long_term_pricing_start_date: CoreTypes.Timestamp.t option ;
  long_term_pricing_end_date: CoreTypes.Timestamp.t option ;
  long_term_pricing_id: string option }
type nonrec dependent_service =
  {
  service_version: service_version option ;
  service_name: service_name option }
type nonrec list_service_versions_result =
  {
  next_token: string option ;
  dependent_services: dependent_service list option ;
  service_name: service_name ;
  service_versions: service_version list }
type nonrec list_service_versions_request =
  {
  next_token: string option ;
  max_results: int option ;
  dependent_services: dependent_service list option ;
  service_name: service_name }
type nonrec invalid_next_token_exception = {
  message: string option }
type nonrec address_type =
  | AWS_SHIP 
  | CUST_PICKUP 
type nonrec address =
  {
  type_: address_type option ;
  is_restricted: bool option ;
  phone_number: string option ;
  postal_code: string option ;
  country: string option ;
  landmark: string option ;
  prefecture_or_district: string option ;
  state_or_province: string option ;
  city: string option ;
  street3: string option ;
  street2: string option ;
  street1: string option ;
  company: string option ;
  name: string option ;
  address_id: string option }
type nonrec list_pickup_locations_result =
  {
  next_token: string option ;
  addresses: address list option }
type nonrec list_pickup_locations_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec list_long_term_pricing_result =
  {
  next_token: string option ;
  long_term_pricing_entries: long_term_pricing_list_entry list option }
type nonrec list_long_term_pricing_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec job_type =
  | LOCAL_USE 
  | EXPORT 
  | IMPORT 
type nonrec job_list_entry =
  {
  description: string option ;
  creation_date: CoreTypes.Timestamp.t option ;
  snowball_type: snowball_type option ;
  job_type: job_type option ;
  is_master: bool option ;
  job_state: job_state option ;
  job_id: string option }
type nonrec list_jobs_result =
  {
  next_token: string option ;
  job_list_entries: job_list_entry list option }
type nonrec list_jobs_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec compatible_image = {
  name: string option ;
  ami_id: string option }
type nonrec list_compatible_images_result =
  {
  next_token: string option ;
  compatible_images: compatible_image list option }
type nonrec list_compatible_images_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec cluster_state =
  | CANCELLED 
  | COMPLETE 
  | IN_USE 
  | PENDING 
  | AWAITING_QUORUM 
type nonrec cluster_list_entry =
  {
  description: string option ;
  creation_date: CoreTypes.Timestamp.t option ;
  cluster_state: cluster_state option ;
  cluster_id: string option }
type nonrec list_clusters_result =
  {
  next_token: string option ;
  cluster_list_entries: cluster_list_entry list option }
type nonrec list_clusters_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec list_cluster_jobs_result =
  {
  next_token: string option ;
  job_list_entries: job_list_entry list option }
type nonrec list_cluster_jobs_request =
  {
  next_token: string option ;
  max_results: int option ;
  cluster_id: string }
type nonrec data_transfer =
  {
  total_objects: int option ;
  total_bytes: int option ;
  objects_transferred: int option ;
  bytes_transferred: int option }
type nonrec job_logs =
  {
  job_failure_log_ur_i: string option ;
  job_success_log_ur_i: string option ;
  job_completion_report_ur_i: string option }
type nonrec device_configuration =
  {
  snowcone_device_configuration: snowcone_device_configuration option }
type nonrec impact_level =
  | IL99 
  | IL6 
  | IL5 
  | IL4 
  | IL2 
type nonrec job_metadata =
  {
  snowball_id: string option ;
  pickup_details: pickup_details option ;
  impact_level: impact_level option ;
  on_device_service_configuration: on_device_service_configuration option ;
  long_term_pricing_id: string option ;
  remote_management: remote_management option ;
  device_configuration: device_configuration option ;
  tax_documents: tax_documents option ;
  forwarding_address_id: string option ;
  cluster_id: string option ;
  job_log_info: job_logs option ;
  data_transfer_progress: data_transfer option ;
  notification: notification option ;
  snowball_capacity_preference: snowball_capacity option ;
  shipping_details: shipping_details option ;
  address_id: string option ;
  role_ar_n: string option ;
  kms_key_ar_n: string option ;
  description: string option ;
  resources: job_resource option ;
  creation_date: CoreTypes.Timestamp.t option ;
  snowball_type: snowball_type option ;
  job_type: job_type option ;
  job_state: job_state option ;
  job_id: string option }
type nonrec invalid_address_exception = {
  message: string option }
type nonrec get_software_updates_result = {
  updates_ur_i: string option }
type nonrec get_software_updates_request = {
  job_id: string }
type nonrec get_snowball_usage_result =
  {
  snowballs_in_use: int option ;
  snowball_limit: int option }
type nonrec get_snowball_usage_request = unit
type nonrec get_job_unlock_code_result = {
  unlock_code: string option }
type nonrec get_job_unlock_code_request = {
  job_id: string }
type nonrec get_job_manifest_result = {
  manifest_ur_i: string option }
type nonrec get_job_manifest_request = {
  job_id: string }
type nonrec describe_return_shipping_label_result =
  {
  return_shipping_label_ur_i: string option ;
  expiration_date: CoreTypes.Timestamp.t option ;
  status: shipping_label_status option }
type nonrec describe_return_shipping_label_request = {
  job_id: string }
type nonrec conflict_exception =
  {
  message: string option ;
  conflict_resource: string option }
type nonrec describe_job_result =
  {
  sub_job_metadata: job_metadata list option ;
  job_metadata: job_metadata option }
type nonrec describe_job_request = {
  job_id: string }
type nonrec cluster_metadata =
  {
  on_device_service_configuration: on_device_service_configuration option ;
  tax_documents: tax_documents option ;
  forwarding_address_id: string option ;
  notification: notification option ;
  shipping_option: shipping_option option ;
  address_id: string option ;
  resources: job_resource option ;
  creation_date: CoreTypes.Timestamp.t option ;
  snowball_type: snowball_type option ;
  job_type: job_type option ;
  cluster_state: cluster_state option ;
  role_ar_n: string option ;
  kms_key_ar_n: string option ;
  description: string option ;
  cluster_id: string option }
type nonrec describe_cluster_result =
  {
  cluster_metadata: cluster_metadata option }
type nonrec describe_cluster_request = {
  cluster_id: string }
type nonrec describe_addresses_result =
  {
  next_token: string option ;
  addresses: address list option }
type nonrec describe_addresses_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec describe_address_result = {
  address: address option }
type nonrec describe_address_request = {
  address_id: string }
type nonrec create_return_shipping_label_result =
  {
  status: shipping_label_status option }
type nonrec create_return_shipping_label_request =
  {
  shipping_option: shipping_option option ;
  job_id: string }
type nonrec create_long_term_pricing_result =
  {
  long_term_pricing_id: string option }
type nonrec create_long_term_pricing_request =
  {
  snowball_type: snowball_type ;
  is_long_term_pricing_auto_renew: bool option ;
  long_term_pricing_type: long_term_pricing_type }
type nonrec create_job_result = {
  job_id: string option }
type nonrec create_job_request =
  {
  pickup_details: pickup_details option ;
  impact_level: impact_level option ;
  long_term_pricing_id: string option ;
  remote_management: remote_management option ;
  device_configuration: device_configuration option ;
  tax_documents: tax_documents option ;
  forwarding_address_id: string option ;
  snowball_type: snowball_type option ;
  cluster_id: string option ;
  notification: notification option ;
  shipping_option: shipping_option option ;
  snowball_capacity_preference: snowball_capacity option ;
  role_ar_n: string option ;
  kms_key_ar_n: string option ;
  address_id: string option ;
  description: string option ;
  on_device_service_configuration: on_device_service_configuration option ;
  resources: job_resource option ;
  job_type: job_type option }
type nonrec create_cluster_result =
  {
  job_list_entries: job_list_entry list option ;
  cluster_id: string option }
type nonrec create_cluster_request =
  {
  snowball_capacity_preference: snowball_capacity option ;
  long_term_pricing_ids: string list option ;
  force_create_jobs: bool option ;
  initial_cluster_size: int option ;
  remote_management: remote_management option ;
  tax_documents: tax_documents option ;
  forwarding_address_id: string option ;
  notification: notification option ;
  shipping_option: shipping_option ;
  snowball_type: snowball_type ;
  role_ar_n: string option ;
  kms_key_ar_n: string option ;
  address_id: string ;
  description: string option ;
  on_device_service_configuration: on_device_service_configuration option ;
  resources: job_resource option ;
  job_type: job_type }
type nonrec create_address_result = {
  address_id: string option }
type nonrec create_address_request = {
  address: address }
type nonrec cancel_job_result = unit
type nonrec cancel_job_request = {
  job_id: string }
type nonrec cancel_cluster_result = unit
type nonrec cancel_cluster_request = {
  cluster_id: string }