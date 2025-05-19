(** 
    Snowball client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
  cluster_id: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_wireless_connection :
  ?is_wifi_enabled:bool -> unit -> wireless_connection
val make_update_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:bool ->
    ?replacement_job:string ->
      long_term_pricing_id:string -> unit -> update_long_term_pricing_request
val make_update_job_shipment_state_request :
  shipment_state:shipment_state ->
    job_id:string -> unit -> update_job_shipment_state_request
val make_notification :
  ?device_pickup_sns_topic_ar_n:string ->
    ?notify_all:bool ->
      ?job_states_to_notify:job_state list ->
        ?sns_topic_ar_n:string -> unit -> notification
val make_key_range :
  ?end_marker:string -> ?begin_marker:string -> unit -> key_range
val make_target_on_device_service :
  ?transfer_option:transfer_option ->
    ?service_name:device_service_name -> unit -> target_on_device_service
val make_s3_resource :
  ?target_on_device_services:target_on_device_service list ->
    ?key_range:key_range -> ?bucket_arn:string -> unit -> s3_resource
val make_event_trigger_definition :
  ?event_resource_ar_n:string -> unit -> event_trigger_definition
val make_lambda_resource :
  ?event_triggers:event_trigger_definition list ->
    ?lambda_arn:string -> unit -> lambda_resource
val make_ec2_ami_resource :
  ?snowball_ami_id:string -> ami_id:string -> unit -> ec2_ami_resource
val make_job_resource :
  ?ec2_ami_resources:ec2_ami_resource list ->
    ?lambda_resources:lambda_resource list ->
      ?s3_resources:s3_resource list -> unit -> job_resource
val make_nfs_on_device_service_configuration :
  ?storage_unit:storage_unit ->
    ?storage_limit:int -> unit -> nfs_on_device_service_configuration
val make_tgw_on_device_service_configuration :
  ?storage_unit:storage_unit ->
    ?storage_limit:int -> unit -> tgw_on_device_service_configuration
val make_eks_on_device_service_configuration :
  ?eks_anywhere_version:string ->
    ?kubernetes_version:string -> unit -> eks_on_device_service_configuration
val make_s3_on_device_service_configuration :
  ?fault_tolerance:int ->
    ?service_size:int ->
      ?storage_unit:storage_unit ->
        ?storage_limit:float -> unit -> s3_on_device_service_configuration
val make_on_device_service_configuration :
  ?s3_on_device_service:s3_on_device_service_configuration ->
    ?eks_on_device_service:eks_on_device_service_configuration ->
      ?tgw_on_device_service:tgw_on_device_service_configuration ->
        ?nfs_on_device_service:nfs_on_device_service_configuration ->
          unit -> on_device_service_configuration
val make_pickup_details :
  ?device_pickup_id:string ->
    ?identification_issuing_org:string ->
      ?identification_expiration_date:CoreTypes.Timestamp.t ->
        ?identification_number:string ->
          ?email:string ->
            ?phone_number:string -> ?name:string -> unit -> pickup_details
val make_update_job_request :
  ?pickup_details:pickup_details ->
    ?forwarding_address_id:string ->
      ?snowball_capacity_preference:snowball_capacity ->
        ?description:string ->
          ?shipping_option:shipping_option ->
            ?address_id:string ->
              ?on_device_service_configuration:on_device_service_configuration
                ->
                ?resources:job_resource ->
                  ?notification:notification ->
                    ?role_ar_n:string ->
                      job_id:string -> unit -> update_job_request
val make_update_cluster_request :
  ?forwarding_address_id:string ->
    ?notification:notification ->
      ?shipping_option:shipping_option ->
        ?address_id:string ->
          ?on_device_service_configuration:on_device_service_configuration ->
            ?resources:job_resource ->
              ?description:string ->
                ?role_ar_n:string ->
                  cluster_id:string -> unit -> update_cluster_request
val make_ind_tax_documents : ?gsti_n:string -> unit -> ind_tax_documents
val make_tax_documents : ?in_d:ind_tax_documents -> unit -> tax_documents
val make_snowcone_device_configuration :
  ?wireless_connection:wireless_connection ->
    unit -> snowcone_device_configuration
val make_shipment :
  ?tracking_number:string -> ?status:string -> unit -> shipment
val make_shipping_details :
  ?outbound_shipment:shipment ->
    ?inbound_shipment:shipment ->
      ?shipping_option:shipping_option -> unit -> shipping_details
val make_service_version : ?version:string -> unit -> service_version
val make_long_term_pricing_list_entry :
  ?job_ids:string list ->
    ?snowball_type:snowball_type ->
      ?long_term_pricing_status:string ->
        ?is_long_term_pricing_auto_renew:bool ->
          ?replacement_job:string ->
            ?current_active_job:string ->
              ?long_term_pricing_type:long_term_pricing_type ->
                ?long_term_pricing_start_date:CoreTypes.Timestamp.t ->
                  ?long_term_pricing_end_date:CoreTypes.Timestamp.t ->
                    ?long_term_pricing_id:string ->
                      unit -> long_term_pricing_list_entry
val make_dependent_service :
  ?service_version:service_version ->
    ?service_name:service_name -> unit -> dependent_service
val make_list_service_versions_request :
  ?next_token:string ->
    ?max_results:int ->
      ?dependent_services:dependent_service list ->
        service_name:service_name -> unit -> list_service_versions_request
val make_address :
  ?type_:address_type ->
    ?is_restricted:bool ->
      ?phone_number:string ->
        ?postal_code:string ->
          ?country:string ->
            ?landmark:string ->
              ?prefecture_or_district:string ->
                ?state_or_province:string ->
                  ?city:string ->
                    ?street3:string ->
                      ?street2:string ->
                        ?street1:string ->
                          ?company:string ->
                            ?name:string ->
                              ?address_id:string -> unit -> address
val make_list_pickup_locations_request :
  ?next_token:string ->
    ?max_results:int -> unit -> list_pickup_locations_request
val make_list_long_term_pricing_request :
  ?next_token:string ->
    ?max_results:int -> unit -> list_long_term_pricing_request
val make_job_list_entry :
  ?description:string ->
    ?creation_date:CoreTypes.Timestamp.t ->
      ?snowball_type:snowball_type ->
        ?job_type:job_type ->
          ?is_master:bool ->
            ?job_state:job_state -> ?job_id:string -> unit -> job_list_entry
val make_list_jobs_request :
  ?next_token:string -> ?max_results:int -> unit -> list_jobs_request
val make_compatible_image :
  ?name:string -> ?ami_id:string -> unit -> compatible_image
val make_list_compatible_images_request :
  ?next_token:string ->
    ?max_results:int -> unit -> list_compatible_images_request
val make_cluster_list_entry :
  ?description:string ->
    ?creation_date:CoreTypes.Timestamp.t ->
      ?cluster_state:cluster_state ->
        ?cluster_id:string -> unit -> cluster_list_entry
val make_list_clusters_request :
  ?next_token:string -> ?max_results:int -> unit -> list_clusters_request
val make_list_cluster_jobs_request :
  ?next_token:string ->
    ?max_results:int ->
      cluster_id:string -> unit -> list_cluster_jobs_request
val make_data_transfer :
  ?total_objects:int ->
    ?total_bytes:int ->
      ?objects_transferred:int ->
        ?bytes_transferred:int -> unit -> data_transfer
val make_job_logs :
  ?job_failure_log_ur_i:string ->
    ?job_success_log_ur_i:string ->
      ?job_completion_report_ur_i:string -> unit -> job_logs
val make_device_configuration :
  ?snowcone_device_configuration:snowcone_device_configuration ->
    unit -> device_configuration
val make_job_metadata :
  ?snowball_id:string ->
    ?pickup_details:pickup_details ->
      ?impact_level:impact_level ->
        ?on_device_service_configuration:on_device_service_configuration ->
          ?long_term_pricing_id:string ->
            ?remote_management:remote_management ->
              ?device_configuration:device_configuration ->
                ?tax_documents:tax_documents ->
                  ?forwarding_address_id:string ->
                    ?cluster_id:string ->
                      ?job_log_info:job_logs ->
                        ?data_transfer_progress:data_transfer ->
                          ?notification:notification ->
                            ?snowball_capacity_preference:snowball_capacity
                              ->
                              ?shipping_details:shipping_details ->
                                ?address_id:string ->
                                  ?role_ar_n:string ->
                                    ?kms_key_ar_n:string ->
                                      ?description:string ->
                                        ?resources:job_resource ->
                                          ?creation_date:CoreTypes.Timestamp.t
                                            ->
                                            ?snowball_type:snowball_type ->
                                              ?job_type:job_type ->
                                                ?job_state:job_state ->
                                                  ?job_id:string ->
                                                    unit -> job_metadata
val make_get_software_updates_request :
  job_id:string -> unit -> get_software_updates_request
val make_get_snowball_usage_request : unit -> get_snowball_usage_request
val make_get_job_unlock_code_request :
  job_id:string -> unit -> get_job_unlock_code_request
val make_get_job_manifest_request :
  job_id:string -> unit -> get_job_manifest_request
val make_describe_return_shipping_label_request :
  job_id:string -> unit -> describe_return_shipping_label_request
val make_describe_job_request : job_id:string -> unit -> describe_job_request
val make_cluster_metadata :
  ?on_device_service_configuration:on_device_service_configuration ->
    ?tax_documents:tax_documents ->
      ?forwarding_address_id:string ->
        ?notification:notification ->
          ?shipping_option:shipping_option ->
            ?address_id:string ->
              ?resources:job_resource ->
                ?creation_date:CoreTypes.Timestamp.t ->
                  ?snowball_type:snowball_type ->
                    ?job_type:job_type ->
                      ?cluster_state:cluster_state ->
                        ?role_ar_n:string ->
                          ?kms_key_ar_n:string ->
                            ?description:string ->
                              ?cluster_id:string -> unit -> cluster_metadata
val make_describe_cluster_request :
  cluster_id:string -> unit -> describe_cluster_request
val make_describe_addresses_request :
  ?next_token:string ->
    ?max_results:int -> unit -> describe_addresses_request
val make_describe_address_request :
  address_id:string -> unit -> describe_address_request
val make_create_return_shipping_label_request :
  ?shipping_option:shipping_option ->
    job_id:string -> unit -> create_return_shipping_label_request
val make_create_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:bool ->
    snowball_type:snowball_type ->
      long_term_pricing_type:long_term_pricing_type ->
        unit -> create_long_term_pricing_request
val make_create_job_request :
  ?pickup_details:pickup_details ->
    ?impact_level:impact_level ->
      ?long_term_pricing_id:string ->
        ?remote_management:remote_management ->
          ?device_configuration:device_configuration ->
            ?tax_documents:tax_documents ->
              ?forwarding_address_id:string ->
                ?snowball_type:snowball_type ->
                  ?cluster_id:string ->
                    ?notification:notification ->
                      ?shipping_option:shipping_option ->
                        ?snowball_capacity_preference:snowball_capacity ->
                          ?role_ar_n:string ->
                            ?kms_key_ar_n:string ->
                              ?address_id:string ->
                                ?description:string ->
                                  ?on_device_service_configuration:on_device_service_configuration
                                    ->
                                    ?resources:job_resource ->
                                      ?job_type:job_type ->
                                        unit -> create_job_request
val make_create_cluster_request :
  ?snowball_capacity_preference:snowball_capacity ->
    ?long_term_pricing_ids:string list ->
      ?force_create_jobs:bool ->
        ?initial_cluster_size:int ->
          ?remote_management:remote_management ->
            ?tax_documents:tax_documents ->
              ?forwarding_address_id:string ->
                ?notification:notification ->
                  ?role_ar_n:string ->
                    ?kms_key_ar_n:string ->
                      ?description:string ->
                        ?on_device_service_configuration:on_device_service_configuration
                          ->
                          ?resources:job_resource ->
                            shipping_option:shipping_option ->
                              snowball_type:snowball_type ->
                                address_id:string ->
                                  job_type:job_type ->
                                    unit -> create_cluster_request
val make_create_address_request :
  address:address -> unit -> create_address_request
val make_cancel_job_request : job_id:string -> unit -> cancel_job_request
val make_cancel_cluster_request :
  cluster_id:string -> unit -> cancel_cluster_request(** {1:operations Operations} *)

module CancelCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_cluster_request ->
        (cancel_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
  (** Cancels a cluster job. You can only cancel a cluster job while it's in the [AwaitingQuorum] status. You'll have at least an hour after creating a cluster job to cancel it.
 *)

  
end

module CancelJob : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_job_request ->
        (cancel_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
  (** Cancels the specified job. You can only cancel a job before its [JobState] value changes to [PreparingAppliance]. Requesting the [ListJobs] or [DescribeJob] action returns a job's [JobState] as part of the response element data returned.
 *)

  
end

module CreateAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      create_address_request ->
        (create_address_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddressException of invalid_address_exception
            | `UnsupportedAddressException of unsupported_address_exception
            
        ]
      ) result
  (** Creates an address for a Snow device to be shipped to. In most regions, addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown. If providing an address as a JSON file through the [cli-input-json] option, include the full file path. For example, [--cli-input-json file://create-address.json].
 *)

  
end

module CreateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      create_cluster_request ->
        (create_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
  (** Creates an empty cluster. Each cluster supports five nodes. You use the [CreateJob] action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.
 *)

  
end

module CreateJob : sig
  val request :
    Smaws_Lib.Context.t ->
      create_job_request ->
        (create_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterLimitExceededException of cluster_limit_exceeded_exception
            | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
  (** Creates a job to import or export data between Amazon S3 and your on-premises data center. Your Amazon Web Services account must have the right trust policies and permissions in place to create a job for a Snow device. If you're creating a job for a node in a cluster, you only need to provide the [clusterId] value; the other job attributes are inherited from the cluster. 

  Only the Snowball; Edge device type is supported when ordering clustered jobs.
  
   The device capacity is optional.
   
    Availability of device types differ by Amazon Web Services Region. For more information about Region availability, see {{:https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/?p=ngi&loc=4}Amazon Web Services Regional Services}.
    
      
      
        {b Snow Family devices and their capacities.} 
       
        {ul
              {-  Device type: {b SNC1_SSD} 
                  
                   {ul
                         {-  Capacity: T14
                             
                              }
                         {-  Description: Snowcone 
                             
                              }
                         
               }
                
                
                 }
              {-  Device type: {b SNC1_HDD} 
                  
                   {ul
                         {-  Capacity: T8
                             
                              }
                         {-  Description: Snowcone 
                             
                              }
                         
               }
                
                
                 }
              {-  Device type: {b EDGE_S} 
                  
                   {ul
                         {-  Capacity: T98
                             
                              }
                         {-  Description: Snowball Edge Storage Optimized for data transfer only 
                             
                              }
                         
               }
                
                
                 }
              {-  Device type: {b EDGE_CG} 
                  
                   {ul
                         {-  Capacity: T42
                             
                              }
                         {-  Description: Snowball Edge Compute Optimized with GPU
                             
                              }
                         
               }
                
                
                 }
              {-  Device type: {b EDGE_C} 
                  
                   {ul
                         {-  Capacity: T42
                             
                              }
                         {-  Description: Snowball Edge Compute Optimized without GPU
                             
                              }
                         
               }
                
                
                 }
              {-  Device type: {b EDGE} 
                  
                   {ul
                         {-  Capacity: T100
                             
                              }
                         {-  Description: Snowball Edge Storage Optimized with EC2 Compute
                             
                              }
                         
               }
                 This device is replaced with T98.
                 
                   
                   
                    }
              {-  Device type: {b STANDARD} 
                  
                   {ul
                         {-  Capacity: T50
                             
                              }
                         {-  Description: Original Snowball device
                             
                               This device is only available in the Ningxia, Beijing, and Singapore Amazon Web Services Region 
                               
                                 }
                         
               }
                
                
                 }
              {-  Device type: {b STANDARD} 
                  
                   {ul
                         {-  Capacity: T80
                             
                              }
                         {-  Description: Original Snowball device
                             
                               This device is only available in the Ningxia, Beijing, and Singapore Amazon Web Services Region. 
                               
                                 }
                         
               }
                
                
                 }
              {-  Snow Family device type: {b RACK_5U_C} 
                  
                   {ul
                         {-  Capacity: T13 
                             
                              }
                         {-  Description: Snowblade.
                             
                              }
                         
               }
                }
              {-  Device type: {b V3_5S} 
                  
                   {ul
                         {-  Capacity: T240
                             
                              }
                         {-  Description: Snowball Edge Storage Optimized 210TB
                             
                              }
                         
               }
                }
              }
   *)

  
end

module CreateLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      create_long_term_pricing_request ->
        (create_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Creates a job with the long-term usage option for a device. The long-term usage is a 1-year or 3-year long-term pricing type for the device. You are billed upfront, and Amazon Web Services provides discounts for long-term pricing. 
 *)

  
end

module CreateReturnShippingLabel : sig
  val request :
    Smaws_Lib.Context.t ->
      create_return_shipping_label_request ->
        (create_return_shipping_label_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ReturnShippingLabelAlreadyExistsException of return_shipping_label_already_exists_exception
            
        ]
      ) result
  (** Creates a shipping label that will be used to return the Snow device to Amazon Web Services.
 *)

  
end

module DescribeAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_address_request ->
        (describe_address_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Takes an [AddressId] and returns specific details about that address in the form of an [Address] object.
 *)

  
end

module DescribeAddresses : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_addresses_request ->
        (describe_addresses_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Returns a specified number of [ADDRESS] objects. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.
 *)

  
end

module DescribeCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_cluster_request ->
        (describe_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Returns information about a specific cluster including shipping information, cluster status, and other important metadata.
 *)

  
end

module DescribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_job_request ->
        (describe_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Returns information about a specific job including shipping information, job status, and other important metadata. 
 *)

  
end

module DescribeReturnShippingLabel : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_return_shipping_label_request ->
        (describe_return_shipping_label_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Information on the shipping label of a Snow device that is being returned to Amazon Web Services.
 *)

  
end

module GetJobManifest : sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_manifest_request ->
        (get_job_manifest_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified [JobId] value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you'll have to make another call to the [GetJobManifest] action.

 The manifest is an encrypted file that you can download after your job enters the [WithCustomer] status. This is the only valid status for calling this API as the manifest and [UnlockCode] code value are used for securing your device and should only be used when you have the device. The manifest is decrypted by using the [UnlockCode] code value, when you pass both values to the Snow device through the Snowball client when the client is started for the first time. 
 
  As a best practice, we recommend that you don't save a copy of an [UnlockCode] value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snow device associated with that job.
  
   The credentials of a given job, including its manifest file and unlock code, expire 360 days after the job is created.
    *)

  
end

module GetJobUnlockCode : sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_unlock_code_request ->
        (get_job_unlock_code_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Returns the [UnlockCode] code value for the specified job. A particular [UnlockCode] value can be accessed for up to 360 days after the associated job has been created.

 The [UnlockCode] value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snow device through the Snowball client when the client is started for the first time. The only valid status for calling this API is [WithCustomer] as the manifest and [Unlock] code values are used for securing your device and should only be used when you have the device.
 
  As a best practice, we recommend that you don't save a copy of the [UnlockCode] in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snow device associated with that job.
   *)

  
end

module GetSnowballUsage : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snowball_usage_request ->
        (get_snowball_usage_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** Returns information about the Snow Family service limit for your account, and also the number of Snow devices your account has in use.

 The default service limit for the number of Snow devices that you can have at one time is 1. If you want to increase your service limit, contact Amazon Web Services Support.
  *)

  
end

module GetSoftwareUpdates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_software_updates_request ->
        (get_software_updates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Returns an Amazon S3 presigned URL for an update file associated with a specified [JobId].
 *)

  
end

module ListClusterJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_cluster_jobs_request ->
        (list_cluster_jobs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Returns an array of [JobListEntry] objects of the specified length. Each [JobListEntry] object is for a job in the specified cluster and contains a job's state, a job's ID, and other information.
 *)

  
end

module ListClusters : sig
  val request :
    Smaws_Lib.Context.t ->
      list_clusters_request ->
        (list_clusters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
  (** Returns an array of [ClusterListEntry] objects of the specified length. Each [ClusterListEntry] object contains a cluster's state, a cluster's ID, and other important status information.
 *)

  
end

module ListCompatibleImages : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compatible_images_request ->
        (list_compatible_images_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
  (** This action returns a list of the different Amazon EC2-compatible Amazon Machine Images (AMIs) that are owned by your Amazon Web Services accountthat would be supported for use on a Snow device. Currently, supported AMIs are based on the Amazon Linux-2, Ubuntu 20.04 LTS - Focal, or Ubuntu 22.04 LTS - Jammy images, available on the Amazon Web Services Marketplace. Ubuntu 16.04 LTS - Xenial (HVM) images are no longer supported in the Market, but still supported for use on devices through Amazon EC2 VM Import/Export and running locally in AMIs.
 *)

  
end

module ListJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_jobs_request ->
        (list_jobs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
  (** Returns an array of [JobListEntry] objects of the specified length. Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.
 *)

  
end

module ListLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      list_long_term_pricing_request ->
        (list_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Lists all long-term pricing types.
 *)

  
end

module ListPickupLocations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_pickup_locations_request ->
        (list_pickup_locations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** A list of locations from which the customer can choose to pickup a device.
 *)

  
end

module ListServiceVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_versions_request ->
        (list_service_versions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Lists all supported versions for Snow on-device services. Returns an array of [ServiceVersion] object containing the supported versions for a particular service.
 *)

  
end

module UpdateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      update_cluster_request ->
        (update_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
  (** While a cluster's [ClusterState] value is in the [AwaitingQuorum] state, you can update some of the information associated with a cluster. Once the cluster changes to a different job state, usually 60 minutes after the cluster being created, this action is no longer available.
 *)

  
end

module UpdateJob : sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_request ->
        (update_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterLimitExceededException of cluster_limit_exceeded_exception
            | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
  (** While a job's [JobState] value is [New], you can update some of the information associated with a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.
 *)

  
end

module UpdateJobShipmentState : sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_shipment_state_request ->
        (update_job_shipment_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Updates the state when a shipment state changes to a different state.
 *)

  
end

module UpdateLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      update_long_term_pricing_request ->
        (update_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
  (** Updates the long-term pricing type.
 *)

  
end

