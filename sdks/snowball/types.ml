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
  is_wifi_enabled: bool option }[@@ocaml.doc
                                  "Configures the wireless connection on an Snowcone device.\n"]
type nonrec update_long_term_pricing_result = unit
type nonrec update_long_term_pricing_request =
  {
  is_long_term_pricing_auto_renew: bool option ;
  replacement_job: string option ;
  long_term_pricing_id: string }[@@ocaml.doc ""]
type nonrec invalid_resource_exception =
  {
  resource_type: string option ;
  message: string option }[@@ocaml.doc
                            "The specified resource can't be found. Check the information you provided in your last request, and try again.\n"]
type nonrec update_job_shipment_state_result = unit
type nonrec shipment_state =
  | RETURNED 
  | RECEIVED [@@ocaml.doc ""]
type nonrec update_job_shipment_state_request =
  {
  shipment_state: shipment_state ;
  job_id: string }[@@ocaml.doc ""]
type nonrec invalid_job_state_exception = {
  message: string option }[@@ocaml.doc
                            "The action can't be performed because the job's current state doesn't allow that action to be performed.\n"]
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
  | NEW [@@ocaml.doc ""]
type nonrec notification =
  {
  device_pickup_sns_topic_ar_n: string option ;
  notify_all: bool option ;
  job_states_to_notify: job_state list option ;
  sns_topic_ar_n: string option }[@@ocaml.doc
                                   "The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The [Notification] object is returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type.\n\n When the notification settings are defined during job creation, you can choose to notify based on a specific set of job states using the [JobStatesToNotify] array of strings, or you can specify that you want to have Amazon SNS notifications sent out for all job states with [NotifyAll] set to true.\n "]
type nonrec key_range =
  {
  end_marker: string option ;
  begin_marker: string option }[@@ocaml.doc
                                 "Contains a key range. For export jobs, a [S3Resource] object can have an optional [KeyRange] value. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.\n"]
type nonrec device_service_name =
  | S3_ON_DEVICE_SERVICE 
  | NFS_ON_DEVICE_SERVICE [@@ocaml.doc ""]
type nonrec transfer_option =
  | LOCAL_USE 
  | EXPORT 
  | IMPORT [@@ocaml.doc ""]
type nonrec target_on_device_service =
  {
  transfer_option: transfer_option option ;
  service_name: device_service_name option }[@@ocaml.doc
                                              "An object that represents the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System).\n"]
type nonrec s3_resource =
  {
  target_on_device_services: target_on_device_service list option ;
  key_range: key_range option ;
  bucket_arn: string option }[@@ocaml.doc
                               "Each [S3Resource] object represents an Amazon S3 bucket that your transferred data will be exported from or imported into. For export jobs, this object can have an optional [KeyRange] value. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.\n"]
type nonrec event_trigger_definition = {
  event_resource_ar_n: string option }[@@ocaml.doc
                                        "The container for the [EventTriggerDefinition$EventResourceARN].\n"]
type nonrec lambda_resource =
  {
  event_triggers: event_trigger_definition list option ;
  lambda_arn: string option }[@@ocaml.doc "Identifies \n"]
type nonrec ec2_ami_resource =
  {
  snowball_ami_id: string option ;
  ami_id: string }[@@ocaml.doc
                    "A JSON-formatted object that contains the IDs for an Amazon Machine Image (AMI), including the Amazon EC2-compatible AMI ID and the Snow device AMI ID. Each AMI has these two IDs to simplify identifying the AMI in both the Amazon Web Services Cloud and on the device.\n"]
type nonrec job_resource =
  {
  ec2_ami_resources: ec2_ami_resource list option ;
  lambda_resources: lambda_resource list option ;
  s3_resources: s3_resource list option }[@@ocaml.doc
                                           "Contains an array of Amazon Web Services resource objects. Each object represents an Amazon S3 bucket, an Lambda function, or an Amazon Machine Image (AMI) based on Amazon EC2 that is associated with a particular job.\n"]
type nonrec storage_unit =
  | TB [@@ocaml.doc ""]
type nonrec nfs_on_device_service_configuration =
  {
  storage_unit: storage_unit option ;
  storage_limit: int option }[@@ocaml.doc
                               "An object that represents the metadata and configuration settings for the NFS (Network File System) service on an Amazon Web Services Snow Family device.\n"]
type nonrec tgw_on_device_service_configuration =
  {
  storage_unit: storage_unit option ;
  storage_limit: int option }[@@ocaml.doc
                               "An object that represents the metadata and configuration settings for the Storage Gateway service Tape Gateway type on an Amazon Web Services Snow Family device.\n"]
type nonrec eks_on_device_service_configuration =
  {
  eks_anywhere_version: string option ;
  kubernetes_version: string option }[@@ocaml.doc
                                       "An object representing the metadata and configuration settings of EKS Anywhere on the Snow Family device.\n"]
type nonrec s3_on_device_service_configuration =
  {
  fault_tolerance: int option ;
  service_size: int option ;
  storage_unit: storage_unit option ;
  storage_limit: float option }[@@ocaml.doc
                                 "Amazon S3 compatible storage on Snow family devices configuration items.\n"]
type nonrec on_device_service_configuration =
  {
  s3_on_device_service: s3_on_device_service_configuration option ;
  eks_on_device_service: eks_on_device_service_configuration option ;
  tgw_on_device_service: tgw_on_device_service_configuration option ;
  nfs_on_device_service: nfs_on_device_service_configuration option }
[@@ocaml.doc
  "An object that represents the metadata and configuration settings for services on an Amazon Web Services Snow Family device.\n"]
type nonrec shipping_option =
  | STANDARD 
  | EXPRESS 
  | NEXT_DAY 
  | SECOND_DAY [@@ocaml.doc ""]
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
  | T50 [@@ocaml.doc ""]
type nonrec pickup_details =
  {
  device_pickup_id: string option ;
  identification_issuing_org: string option ;
  identification_expiration_date: CoreTypes.Timestamp.t option ;
  identification_number: string option ;
  email: string option ;
  phone_number: string option ;
  name: string option }[@@ocaml.doc
                         "Information identifying the person picking up the device.\n"]
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
  job_id: string }[@@ocaml.doc ""]
type nonrec kms_request_failed_exception = {
  message: string option }[@@ocaml.doc
                            "The provided Key Management Service key lacks the permissions to perform the specified [CreateJob] or [UpdateJob] action.\n"]
type nonrec invalid_input_combination_exception = {
  message: string option }[@@ocaml.doc
                            "Job or cluster creation failed. One or more inputs were invalid. Confirm that the [CreateClusterRequest$SnowballType] value supports your [CreateJobRequest$JobType], and try again.\n"]
type nonrec ec2_request_failed_exception = {
  message: string option }[@@ocaml.doc
                            "Your user lacks the necessary Amazon EC2 permissions to perform the attempted action.\n"]
type nonrec cluster_limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "Job creation failed. Currently, clusters support five nodes. If you have fewer than five nodes for your cluster and you have more nodes to create for this cluster, try again and create jobs until your cluster has exactly five nodes.\n"]
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
  cluster_id: string }[@@ocaml.doc ""]
type nonrec unsupported_address_exception = {
  message: string option }[@@ocaml.doc
                            "The address is either outside the serviceable area for your region, or an error occurred. Check the address with your region's carrier and try again. If the issue persists, contact Amazon Web Services Support.\n"]
type nonrec ind_tax_documents = {
  gsti_n: string option }[@@ocaml.doc
                           "The tax documents required in Amazon Web Services Region in India.\n"]
type nonrec tax_documents = {
  in_d: ind_tax_documents option }[@@ocaml.doc
                                    "The tax documents required in your Amazon Web Services Region.\n"]
type nonrec snowcone_device_configuration =
  {
  wireless_connection: wireless_connection option }[@@ocaml.doc
                                                     "Specifies the device configuration for an Snowcone job.\n"]
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
  | STANDARD [@@ocaml.doc ""]
type nonrec shipping_label_status =
  | FAILED 
  | SUCCEEDED 
  | TIMED_OUT 
  | IN_PROGRESS [@@ocaml.doc ""]
type nonrec shipment =
  {
  tracking_number: string option ;
  status: string option }[@@ocaml.doc
                           "The [Status] and [TrackingNumber] information for an inbound or outbound shipment.\n"]
type nonrec shipping_details =
  {
  outbound_shipment: shipment option ;
  inbound_shipment: shipment option ;
  shipping_option: shipping_option option }[@@ocaml.doc
                                             "A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.\n"]
type nonrec service_version = {
  version: string option }[@@ocaml.doc
                            "The version of the requested service.\n"]
type nonrec service_name =
  | EKS_ANYWHERE 
  | KUBERNETES [@@ocaml.doc ""]
type nonrec return_shipping_label_already_exists_exception =
  {
  message: string option }[@@ocaml.doc
                            "You get this exception if you call [CreateReturnShippingLabel] and a valid return shipping label already exists. In this case, use [DescribeReturnShippingLabel] to get the URL.\n"]
type nonrec remote_management =
  | NOT_INSTALLED 
  | INSTALLED_AUTOSTART 
  | INSTALLED_ONLY [@@ocaml.doc ""]
type nonrec long_term_pricing_type =
  | ONE_MONTH 
  | THREE_YEAR 
  | ONE_YEAR [@@ocaml.doc ""]
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
  long_term_pricing_id: string option }[@@ocaml.doc
                                         "Each [LongTermPricingListEntry] object contains information about a long-term pricing type.\n"]
type nonrec dependent_service =
  {
  service_version: service_version option ;
  service_name: service_name option }[@@ocaml.doc
                                       "The name and version of the service dependant on the requested service.\n"]
type nonrec list_service_versions_result =
  {
  next_token: string option ;
  dependent_services: dependent_service list option ;
  service_name: service_name ;
  service_versions: service_version list }[@@ocaml.doc ""]
type nonrec list_service_versions_request =
  {
  next_token: string option ;
  max_results: int option ;
  dependent_services: dependent_service list option ;
  service_name: service_name }[@@ocaml.doc ""]
type nonrec invalid_next_token_exception = {
  message: string option }[@@ocaml.doc
                            "The [NextToken] string was altered unexpectedly, and the operation has stopped. Run the operation without changing the [NextToken] string, and try again.\n"]
type nonrec address_type =
  | AWS_SHIP 
  | CUST_PICKUP [@@ocaml.doc ""]
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
  address_id: string option }[@@ocaml.doc
                               "The address that you want the Snow device(s) associated with a specific job to be shipped to. Addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. Although no individual elements of the [Address] are required, if the address is invalid or unsupported, then an exception is thrown.\n"]
type nonrec list_pickup_locations_result =
  {
  next_token: string option ;
  addresses: address list option }[@@ocaml.doc ""]
type nonrec list_pickup_locations_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec list_long_term_pricing_result =
  {
  next_token: string option ;
  long_term_pricing_entries: long_term_pricing_list_entry list option }
[@@ocaml.doc ""]
type nonrec list_long_term_pricing_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec job_type =
  | LOCAL_USE 
  | EXPORT 
  | IMPORT [@@ocaml.doc ""]
type nonrec job_list_entry =
  {
  description: string option ;
  creation_date: CoreTypes.Timestamp.t option ;
  snowball_type: snowball_type option ;
  job_type: job_type option ;
  is_master: bool option ;
  job_state: job_state option ;
  job_id: string option }[@@ocaml.doc
                           "Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of an export job.\n"]
type nonrec list_jobs_result =
  {
  next_token: string option ;
  job_list_entries: job_list_entry list option }[@@ocaml.doc ""]
type nonrec list_jobs_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec compatible_image = {
  name: string option ;
  ami_id: string option }[@@ocaml.doc
                           "A JSON-formatted object that describes a compatible Amazon Machine Image (AMI), including the ID and name for a Snow device AMI. This AMI is compatible with the device's physical hardware requirements, and it should be able to be run in an SBE1 instance on the device.\n"]
type nonrec list_compatible_images_result =
  {
  next_token: string option ;
  compatible_images: compatible_image list option }[@@ocaml.doc ""]
type nonrec list_compatible_images_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec cluster_state =
  | CANCELLED 
  | COMPLETE 
  | IN_USE 
  | PENDING 
  | AWAITING_QUORUM [@@ocaml.doc ""]
type nonrec cluster_list_entry =
  {
  description: string option ;
  creation_date: CoreTypes.Timestamp.t option ;
  cluster_state: cluster_state option ;
  cluster_id: string option }[@@ocaml.doc
                               "Contains a cluster's state, a cluster's ID, and other important information.\n"]
type nonrec list_clusters_result =
  {
  next_token: string option ;
  cluster_list_entries: cluster_list_entry list option }[@@ocaml.doc ""]
type nonrec list_clusters_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec list_cluster_jobs_result =
  {
  next_token: string option ;
  job_list_entries: job_list_entry list option }[@@ocaml.doc ""]
type nonrec list_cluster_jobs_request =
  {
  next_token: string option ;
  max_results: int option ;
  cluster_id: string }[@@ocaml.doc ""]
type nonrec data_transfer =
  {
  total_objects: int option ;
  total_bytes: int option ;
  objects_transferred: int option ;
  bytes_transferred: int option }[@@ocaml.doc
                                   "Defines the real-time status of a Snow device's data transfer while the device is at Amazon Web Services. This data is only available while a job has a [JobState] value of [InProgress], for both import and export jobs.\n"]
type nonrec job_logs =
  {
  job_failure_log_ur_i: string option ;
  job_success_log_ur_i: string option ;
  job_completion_report_ur_i: string option }[@@ocaml.doc
                                               "Contains job logs. Whenever a Snow device is used to import data into or export data out of Amazon S3, you'll have the option of downloading a PDF job report. Job logs are returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type. The job logs can be accessed for up to 60 minutes after this request has been made. To access any of the job logs after 60 minutes have passed, you'll have to make another call to the [DescribeJob] action.\n\n For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snow device for your job part is being delivered to you.\n \n  The job report provides you insight into the state of your Amazon S3 data transfer. The report includes details about your job or job part for your records.\n  \n   For deeper visibility into the status of your transferred objects, you can look at the two associated logs: a success log and a failure log. The logs are saved in comma-separated value (CSV) format, and the name of each log includes the ID of the job or job part that the log describes.\n   "]
type nonrec device_configuration =
  {
  snowcone_device_configuration: snowcone_device_configuration option }
[@@ocaml.doc "The container for [SnowconeDeviceConfiguration]. \n"]
type nonrec impact_level =
  | IL99 
  | IL6 
  | IL5 
  | IL4 
  | IL2 [@@ocaml.doc ""]
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
  job_id: string option }[@@ocaml.doc
                           "Contains information about a specific job including shipping information, job status, and other important metadata. This information is returned as a part of the response syntax of the [DescribeJob] action.\n"]
type nonrec invalid_address_exception = {
  message: string option }[@@ocaml.doc
                            "The address provided was invalid. Check the address with your region's carrier, and try again.\n"]
type nonrec get_software_updates_result = {
  updates_ur_i: string option }[@@ocaml.doc ""]
type nonrec get_software_updates_request = {
  job_id: string }[@@ocaml.doc ""]
type nonrec get_snowball_usage_result =
  {
  snowballs_in_use: int option ;
  snowball_limit: int option }[@@ocaml.doc ""]
type nonrec get_snowball_usage_request = unit
type nonrec get_job_unlock_code_result = {
  unlock_code: string option }[@@ocaml.doc ""]
type nonrec get_job_unlock_code_request = {
  job_id: string }[@@ocaml.doc ""]
type nonrec get_job_manifest_result = {
  manifest_ur_i: string option }[@@ocaml.doc ""]
type nonrec get_job_manifest_request = {
  job_id: string }[@@ocaml.doc ""]
type nonrec describe_return_shipping_label_result =
  {
  return_shipping_label_ur_i: string option ;
  expiration_date: CoreTypes.Timestamp.t option ;
  status: shipping_label_status option }[@@ocaml.doc ""]
type nonrec describe_return_shipping_label_request = {
  job_id: string }[@@ocaml.doc ""]
type nonrec conflict_exception =
  {
  message: string option ;
  conflict_resource: string option }[@@ocaml.doc
                                      "You get this exception when you call [CreateReturnShippingLabel] more than once when other requests are not completed.\n"]
type nonrec describe_job_result =
  {
  sub_job_metadata: job_metadata list option ;
  job_metadata: job_metadata option }[@@ocaml.doc ""]
type nonrec describe_job_request = {
  job_id: string }[@@ocaml.doc ""]
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
  cluster_id: string option }[@@ocaml.doc
                               "Contains metadata about a specific cluster.\n"]
type nonrec describe_cluster_result =
  {
  cluster_metadata: cluster_metadata option }[@@ocaml.doc ""]
type nonrec describe_cluster_request = {
  cluster_id: string }[@@ocaml.doc ""]
type nonrec describe_addresses_result =
  {
  next_token: string option ;
  addresses: address list option }[@@ocaml.doc ""]
type nonrec describe_addresses_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec describe_address_result = {
  address: address option }[@@ocaml.doc ""]
type nonrec describe_address_request = {
  address_id: string }[@@ocaml.doc ""]
type nonrec create_return_shipping_label_result =
  {
  status: shipping_label_status option }[@@ocaml.doc ""]
type nonrec create_return_shipping_label_request =
  {
  shipping_option: shipping_option option ;
  job_id: string }[@@ocaml.doc ""]
type nonrec create_long_term_pricing_result =
  {
  long_term_pricing_id: string option }[@@ocaml.doc ""]
type nonrec create_long_term_pricing_request =
  {
  snowball_type: snowball_type ;
  is_long_term_pricing_auto_renew: bool option ;
  long_term_pricing_type: long_term_pricing_type }[@@ocaml.doc ""]
type nonrec create_job_result = {
  job_id: string option }[@@ocaml.doc ""]
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
  job_type: job_type option }[@@ocaml.doc ""]
type nonrec create_cluster_result =
  {
  job_list_entries: job_list_entry list option ;
  cluster_id: string option }[@@ocaml.doc ""]
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
  job_type: job_type }[@@ocaml.doc ""]
type nonrec create_address_result = {
  address_id: string option }[@@ocaml.doc ""]
type nonrec create_address_request = {
  address: address }[@@ocaml.doc ""]
type nonrec cancel_job_result = unit
type nonrec cancel_job_request = {
  job_id: string }[@@ocaml.doc ""]
type nonrec cancel_cluster_result = unit
type nonrec cancel_cluster_request = {
  cluster_id: string }[@@ocaml.doc ""]