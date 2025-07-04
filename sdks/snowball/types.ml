open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "snowball";
      endpointPrefix = "snowball";
      version = "2016-06-30";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec wireless_connection =
  {
  is_wifi_enabled: bool option
    [@ocaml.doc "Enables the Wi-Fi adapter on an Snowcone device.\n"]}
[@@ocaml.doc "Configures the wireless connection on an Snowcone device.\n"]
type nonrec update_long_term_pricing_request =
  {
  is_long_term_pricing_auto_renew: bool option
    [@ocaml.doc
      "If set to [true], specifies that the current long-term pricing type for the device should be automatically renewed before the long-term pricing contract expires.\n"];
  replacement_job: string option
    [@ocaml.doc
      "Specifies that a device that is ordered with long-term pricing should be replaced with a new device.\n"];
  long_term_pricing_id: string
    [@ocaml.doc "The ID of the long-term pricing type for the device.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_resource_exception =
  {
  resource_type: string option
    [@ocaml.doc "The provided resource value is invalid.\n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified resource can't be found. Check the information you provided in your last request, and try again.\n"]
type nonrec shipment_state =
  | RETURNED [@ocaml.doc ""]
  | RECEIVED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_job_shipment_state_request =
  {
  shipment_state: shipment_state
    [@ocaml.doc
      "The state of a device when it is being shipped. \n\n Set to [RECEIVED] when the device arrives at your location.\n \n  Set to [RETURNED] when you have returned the device to Amazon Web Services.\n  "];
  job_id: string
    [@ocaml.doc
      "The job ID of the job whose shipment date you want to update, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec invalid_job_state_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The action can't be performed because the job's current state doesn't allow that action to be performed.\n"]
type nonrec job_state =
  | PENDING [@ocaml.doc ""]
  | LISTING [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | WITH_AWS [@ocaml.doc ""]
  | WITH_AWS_SORTING_FACILITY [@ocaml.doc ""]
  | IN_TRANSIT_TO_AWS [@ocaml.doc ""]
  | WITH_CUSTOMER [@ocaml.doc ""]
  | IN_TRANSIT_TO_CUSTOMER [@ocaml.doc ""]
  | PREPARING_SHIPMENT [@ocaml.doc ""]
  | PREPARING_APPLIANCE [@ocaml.doc ""]
  | NEW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec notification =
  {
  device_pickup_sns_topic_ar_n: string option
    [@ocaml.doc
      "Used to send SNS notifications for the person picking up the device (identified during job creation).\n"];
  notify_all: bool option
    [@ocaml.doc
      "Any change in job state will trigger a notification for this job.\n"];
  job_states_to_notify: job_state list option
    [@ocaml.doc
      "The list of job states that will trigger a notification for this job.\n"];
  sns_topic_ar_n: string option
    [@ocaml.doc
      "The new SNS [TopicArn] that you want to associate with this job. You can create Amazon Resource Names (ARNs) for topics by using the {{:https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html}CreateTopic} Amazon SNS API action.\n\n You can subscribe email addresses to an Amazon SNS topic through the Amazon Web Services Management Console, or by using the {{:https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html}Subscribe} Amazon Simple Notification Service (Amazon SNS) API action.\n "]}
[@@ocaml.doc
  "The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The [Notification] object is returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type.\n\n When the notification settings are defined during job creation, you can choose to notify based on a specific set of job states using the [JobStatesToNotify] array of strings, or you can specify that you want to have Amazon SNS notifications sent out for all job states with [NotifyAll] set to true.\n "]
type nonrec key_range =
  {
  end_marker: string option
    [@ocaml.doc
      "The key that ends an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.\n"];
  begin_marker: string option
    [@ocaml.doc
      "The key that starts an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.\n"]}
[@@ocaml.doc
  "Contains a key range. For export jobs, a [S3Resource] object can have an optional [KeyRange] value. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.\n"]
type nonrec device_service_name =
  | S3_ON_DEVICE_SERVICE [@ocaml.doc ""]
  | NFS_ON_DEVICE_SERVICE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec transfer_option =
  | LOCAL_USE [@ocaml.doc ""]
  | EXPORT [@ocaml.doc ""]
  | IMPORT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec target_on_device_service =
  {
  transfer_option: transfer_option option
    [@ocaml.doc
      "Specifies whether the data is being imported or exported. You can import or export the data, or use it locally on the device.\n"];
  service_name: device_service_name option
    [@ocaml.doc
      "Specifies the name of the service on the Snow Family device that your transferred data will be exported from or imported into.\n"]}
[@@ocaml.doc
  "An object that represents the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System).\n"]
type nonrec s3_resource =
  {
  target_on_device_services: target_on_device_service list option
    [@ocaml.doc
      "Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System).\n"];
  key_range: key_range option
    [@ocaml.doc
      "For export jobs, you can provide an optional [KeyRange] within a specific Amazon S3 bucket. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.\n"];
  bucket_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of an Amazon S3 bucket.\n"]}
[@@ocaml.doc
  "Each [S3Resource] object represents an Amazon S3 bucket that your transferred data will be exported from or imported into. For export jobs, this object can have an optional [KeyRange] value. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.\n"]
type nonrec event_trigger_definition =
  {
  event_resource_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an Lambda function's event trigger associated with this job.\n"]}
[@@ocaml.doc
  "The container for the [EventTriggerDefinition$EventResourceARN].\n"]
type nonrec lambda_resource =
  {
  event_triggers: event_trigger_definition list option
    [@ocaml.doc
      "The array of ARNs for [S3Resource] objects to trigger the [LambdaResource] objects associated with this job.\n"];
  lambda_arn: string option
    [@ocaml.doc
      "An Amazon Resource Name (ARN) that represents an Lambda function to be triggered by PUT object actions on the associated local Amazon S3 resource.\n"]}
[@@ocaml.doc "Identifies \n"]
type nonrec ec2_ami_resource =
  {
  snowball_ami_id: string option
    [@ocaml.doc "The ID of the AMI on the Snow device.\n"];
  ami_id: string [@ocaml.doc "The ID of the AMI in Amazon EC2.\n"]}[@@ocaml.doc
                                                                    "A JSON-formatted object that contains the IDs for an Amazon Machine Image (AMI), including the Amazon EC2-compatible AMI ID and the Snow device AMI ID. Each AMI has these two IDs to simplify identifying the AMI in both the Amazon Web Services Cloud and on the device.\n"]
type nonrec job_resource =
  {
  ec2_ami_resources: ec2_ami_resource list option
    [@ocaml.doc
      "The Amazon Machine Images (AMIs) associated with this job.\n"];
  lambda_resources: lambda_resource list option
    [@ocaml.doc "The Python-language Lambda functions for this job.\n"];
  s3_resources: s3_resource list option
    [@ocaml.doc "An array of [S3Resource] objects.\n"]}[@@ocaml.doc
                                                         "Contains an array of Amazon Web Services resource objects. Each object represents an Amazon S3 bucket, an Lambda function, or an Amazon Machine Image (AMI) based on Amazon EC2 that is associated with a particular job.\n"]
type nonrec storage_unit =
  | TB [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec nfs_on_device_service_configuration =
  {
  storage_unit: storage_unit option
    [@ocaml.doc
      "The scale unit of the NFS storage on the device.\n\n Valid values: TB.\n "];
  storage_limit: int option
    [@ocaml.doc "The maximum NFS storage for one Snow Family device.\n"]}
[@@ocaml.doc
  "An object that represents the metadata and configuration settings for the NFS (Network File System) service on an Amazon Web Services Snow Family device.\n"]
type nonrec tgw_on_device_service_configuration =
  {
  storage_unit: storage_unit option
    [@ocaml.doc "The scale unit of the virtual tapes on the device.\n"];
  storage_limit: int option
    [@ocaml.doc
      "The maximum number of virtual tapes to store on one Snow Family device. Due to physical resource limitations, this value must be set to 80 for Snowball Edge.\n"]}
[@@ocaml.doc
  "An object that represents the metadata and configuration settings for the Storage Gateway service Tape Gateway type on an Amazon Web Services Snow Family device.\n"]
type nonrec eks_on_device_service_configuration =
  {
  eks_anywhere_version: string option
    [@ocaml.doc
      "The optional version of EKS Anywhere on the Snow Family device.\n"];
  kubernetes_version: string option
    [@ocaml.doc
      "The Kubernetes version for EKS Anywhere on the Snow Family device.\n"]}
[@@ocaml.doc
  "An object representing the metadata and configuration settings of EKS Anywhere on the Snow Family device.\n"]
type nonrec s3_on_device_service_configuration =
  {
  fault_tolerance: int option
    [@ocaml.doc
      ">Fault tolerance level of the cluster. This indicates the number of nodes that can go down without degrading the performance of the cluster. This additional input helps when the specified [StorageLimit] matches more than one Amazon S3 compatible storage on Snow family devices service configuration.\n"];
  service_size: int option
    [@ocaml.doc
      "Applicable when creating a cluster. Specifies how many nodes are needed for Amazon S3 compatible storage on Snow family devices. If specified, the other input can be omitted.\n"];
  storage_unit: storage_unit option
    [@ocaml.doc "Storage unit. Currently the only supported unit is TB.\n"];
  storage_limit: float option
    [@ocaml.doc
      "If the specified storage limit value matches storage limit of one of the defined configurations, that configuration will be used. If the specified storage limit value does not match any defined configuration, the request will fail. If more than one configuration has the same storage limit as specified, the other input need to be provided.\n"]}
[@@ocaml.doc
  "Amazon S3 compatible storage on Snow family devices configuration items.\n"]
type nonrec on_device_service_configuration =
  {
  s3_on_device_service: s3_on_device_service_configuration option
    [@ocaml.doc
      "Configuration for Amazon S3 compatible storage on Snow family devices.\n"];
  eks_on_device_service: eks_on_device_service_configuration option
    [@ocaml.doc
      "The configuration of EKS Anywhere on the Snow Family device.\n"];
  tgw_on_device_service: tgw_on_device_service_configuration option
    [@ocaml.doc
      "Represents the Storage Gateway service Tape Gateway type on a Snow Family device.\n"];
  nfs_on_device_service: nfs_on_device_service_configuration option
    [@ocaml.doc
      "Represents the NFS (Network File System) service on a Snow Family device.\n"]}
[@@ocaml.doc
  "An object that represents the metadata and configuration settings for services on an Amazon Web Services Snow Family device.\n"]
type nonrec shipping_option =
  | STANDARD [@ocaml.doc ""]
  | EXPRESS [@ocaml.doc ""]
  | NEXT_DAY [@ocaml.doc ""]
  | SECOND_DAY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec snowball_capacity =
  | T13 [@ocaml.doc ""]
  | T240 [@ocaml.doc ""]
  | NO_PREFERENCE [@ocaml.doc ""]
  | T32 [@ocaml.doc ""]
  | T14 [@ocaml.doc ""]
  | T8 [@ocaml.doc ""]
  | T98 [@ocaml.doc ""]
  | T42 [@ocaml.doc ""]
  | T100 [@ocaml.doc ""]
  | T80 [@ocaml.doc ""]
  | T50 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec pickup_details =
  {
  device_pickup_id: string option
    [@ocaml.doc "The unique ID for a device that will be picked up.\n"];
  identification_issuing_org: string option
    [@ocaml.doc
      "Organization that issued the credential identifying the person picking up the device.\n"];
  identification_expiration_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Expiration date of the credential identifying the person picking up the device.\n"];
  identification_number: string option
    [@ocaml.doc
      "The number on the credential identifying the person picking up the device.\n"];
  email: string option
    [@ocaml.doc "The email address of the person picking up the device.\n"];
  phone_number: string option
    [@ocaml.doc "The phone number of the person picking up the device.\n"];
  name: string option
    [@ocaml.doc "The name of the person picking up the device.\n"]}[@@ocaml.doc
                                                                    "Information identifying the person picking up the device.\n"]
type nonrec update_job_request =
  {
  pickup_details: pickup_details option [@ocaml.doc ""];
  forwarding_address_id: string option
    [@ocaml.doc
      "The updated ID for the forwarding address for a job. This field is not supported in most regions.\n"];
  snowball_capacity_preference: snowball_capacity option
    [@ocaml.doc
      "The updated [SnowballCapacityPreference] of this job's [JobMetadata] object. The 50 TB Snowballs are only available in the US regions.\n\n For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n "];
  description: string option
    [@ocaml.doc
      "The updated description of this job's [JobMetadata] object.\n"];
  shipping_option: shipping_option option
    [@ocaml.doc
      "The updated shipping option value of this job's [ShippingDetails] object.\n"];
  address_id: string option
    [@ocaml.doc "The ID of the updated [Address] object.\n"];
  on_device_service_configuration: on_device_service_configuration option
    [@ocaml.doc
      "Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System) and the Amazon Web Services Storage Gateway service Tape Gateway type.\n"];
  resources: job_resource option
    [@ocaml.doc
      "The updated [JobResource] object, or the updated [JobResource] object. \n"];
  notification: notification option
    [@ocaml.doc "The new or updated [Notification] object.\n"];
  role_ar_n: string option
    [@ocaml.doc
      "The new role Amazon Resource Name (ARN) that you want to associate with this job. To create a role ARN, use the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole}Identity and Access Management (IAM) API action.\n"];
  job_id: string
    [@ocaml.doc
      "The job ID of the job that you want to update, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec kms_request_failed_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The provided Key Management Service key lacks the permissions to perform the specified [CreateJob] or [UpdateJob] action.\n"]
type nonrec invalid_input_combination_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Job or cluster creation failed. One or more inputs were invalid. Confirm that the [CreateClusterRequest$SnowballType] value supports your [CreateJobRequest$JobType], and try again.\n"]
type nonrec ec2_request_failed_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Your user lacks the necessary Amazon EC2 permissions to perform the attempted action.\n"]
type nonrec cluster_limit_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Job creation failed. Currently, clusters support five nodes. If you have fewer than five nodes for your cluster and you have more nodes to create for this cluster, try again and create jobs until your cluster has exactly five nodes.\n"]
type nonrec update_cluster_request =
  {
  forwarding_address_id: string option
    [@ocaml.doc
      "The updated ID for the forwarding address for a cluster. This field is not supported in most regions.\n"];
  notification: notification option
    [@ocaml.doc "The new or updated [Notification] object.\n"];
  shipping_option: shipping_option option
    [@ocaml.doc
      "The updated shipping option value of this cluster's [ShippingDetails] object.\n"];
  address_id: string option
    [@ocaml.doc "The ID of the updated [Address] object.\n"];
  on_device_service_configuration: on_device_service_configuration option
    [@ocaml.doc
      "Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family device clusters support Amazon S3 and NFS (Network File System).\n"];
  resources: job_resource option
    [@ocaml.doc
      "The updated arrays of [JobResource] objects that can include updated [S3Resource] objects or [LambdaResource] objects.\n"];
  description: string option
    [@ocaml.doc "The updated description of this cluster.\n"];
  role_ar_n: string option
    [@ocaml.doc
      "The new role Amazon Resource Name (ARN) that you want to associate with this cluster. To create a role ARN, use the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management (IAM).\n"];
  cluster_id: string
    [@ocaml.doc
      "The cluster ID of the cluster that you want to update, for example [CID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec unsupported_address_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The address is either outside the serviceable area for your region, or an error occurred. Check the address with your region's carrier and try again. If the issue persists, contact Amazon Web Services Support.\n"]
type nonrec ind_tax_documents =
  {
  gsti_n: string option
    [@ocaml.doc
      "The Goods and Services Tax (GST) documents required in Amazon Web Services Region in India.\n"]}
[@@ocaml.doc
  "The tax documents required in Amazon Web Services Region in India.\n"]
type nonrec tax_documents = {
  in_d: ind_tax_documents option [@ocaml.doc ""]}[@@ocaml.doc
                                                   "The tax documents required in your Amazon Web Services Region.\n"]
type nonrec snowcone_device_configuration =
  {
  wireless_connection: wireless_connection option
    [@ocaml.doc
      "Configures the wireless connection for the Snowcone device.\n"]}
[@@ocaml.doc "Specifies the device configuration for an Snowcone job.\n"]
type nonrec snowball_type =
  | RACK_5U_C [@ocaml.doc ""]
  | V3_5S [@ocaml.doc ""]
  | V3_5C [@ocaml.doc ""]
  | SNC1_SSD [@ocaml.doc ""]
  | SNC1_HDD [@ocaml.doc ""]
  | EDGE_S [@ocaml.doc ""]
  | EDGE_CG [@ocaml.doc ""]
  | EDGE_C [@ocaml.doc ""]
  | EDGE [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec shipping_label_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec shipment =
  {
  tracking_number: string option
    [@ocaml.doc
      "The tracking number for this job. Using this tracking number with your region's carrier's website, you can track a Snow device as the carrier transports it.\n\n For India, the carrier is Amazon Logistics. For all other regions, UPS is the carrier.\n "];
  status: string option [@ocaml.doc "Status information for a shipment.\n"]}
[@@ocaml.doc
  "The [Status] and [TrackingNumber] information for an inbound or outbound shipment.\n"]
type nonrec shipping_details =
  {
  outbound_shipment: shipment option
    [@ocaml.doc
      "The [Status] and [TrackingNumber] values for a Snow device being delivered to the address that you specified for a particular job.\n"];
  inbound_shipment: shipment option
    [@ocaml.doc
      "The [Status] and [TrackingNumber] values for a Snow device being returned to Amazon Web Services for a particular job.\n"];
  shipping_option: shipping_option option
    [@ocaml.doc
      "The shipping speed for a particular job. This speed doesn't dictate how soon you'll get the Snow device from the job's creation date. This speed represents how quickly it moves to its destination while in transit. Regional shipping speeds are as follows:\n\n {ul\n       {-  In Australia, you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day.\n           \n            }\n       {-  In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.\n           \n            }\n       {-  In India, Snow devices are delivered in one to seven days.\n           \n            }\n       {-  In the United States of America (US), you have access to one-day shipping and two-day shipping.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.\n"]
type nonrec service_version =
  {
  version: string option
    [@ocaml.doc "The version number of the requested service.\n"]}[@@ocaml.doc
                                                                    "The version of the requested service.\n"]
type nonrec service_name =
  | EKS_ANYWHERE [@ocaml.doc ""]
  | KUBERNETES [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec return_shipping_label_already_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You get this exception if you call [CreateReturnShippingLabel] and a valid return shipping label already exists. In this case, use [DescribeReturnShippingLabel] to get the URL.\n"]
type nonrec remote_management =
  | NOT_INSTALLED [@ocaml.doc ""]
  | INSTALLED_AUTOSTART [@ocaml.doc ""]
  | INSTALLED_ONLY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec long_term_pricing_type =
  | ONE_MONTH [@ocaml.doc ""]
  | THREE_YEAR [@ocaml.doc ""]
  | ONE_YEAR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec long_term_pricing_list_entry =
  {
  job_ids: string list option
    [@ocaml.doc
      "The IDs of the jobs that are associated with a long-term pricing type.\n"];
  snowball_type: snowball_type option
    [@ocaml.doc
      "The type of Snow Family devices associated with this long-term pricing job.\n"];
  long_term_pricing_status: string option
    [@ocaml.doc "The status of the long-term pricing type.\n"];
  is_long_term_pricing_auto_renew: bool option
    [@ocaml.doc
      "If set to [true], specifies that the current long-term pricing type for the device should be automatically renewed before the long-term pricing contract expires.\n"];
  replacement_job: string option
    [@ocaml.doc
      "A new device that replaces a device that is ordered with long-term pricing.\n"];
  current_active_job: string option
    [@ocaml.doc
      "The current active jobs on the device the long-term pricing type.\n"];
  long_term_pricing_type: long_term_pricing_type option
    [@ocaml.doc
      "The type of long-term pricing that was selected for the device.\n"];
  long_term_pricing_start_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The start date of the long-term pricing contract.\n"];
  long_term_pricing_end_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The end date the long-term pricing contract.\n"];
  long_term_pricing_id: string option
    [@ocaml.doc "The ID of the long-term pricing type for the device.\n"]}
[@@ocaml.doc
  "Each [LongTermPricingListEntry] object contains information about a long-term pricing type.\n"]
type nonrec dependent_service =
  {
  service_version: service_version option
    [@ocaml.doc "The version of the dependent service.\n"];
  service_name: service_name option
    [@ocaml.doc "The name of the dependent service.\n"]}[@@ocaml.doc
                                                          "The name and version of the service dependant on the requested service.\n"]
type nonrec list_service_versions_result =
  {
  next_token: string option
    [@ocaml.doc
      "Because HTTP requests are stateless, this is the starting point of the next list of returned [ListServiceVersionsResult] results.\n"];
  dependent_services: dependent_service list option
    [@ocaml.doc
      "A list of names and versions of dependant services of the service for which the system provided supported versions.\n"];
  service_name: service_name
    [@ocaml.doc
      "The name of the service for which the system provided supported versions.\n"];
  service_versions: service_version list
    [@ocaml.doc "A list of supported versions.\n"]}[@@ocaml.doc ""]
type nonrec list_service_versions_request =
  {
  next_token: string option
    [@ocaml.doc
      "Because HTTP requests are stateless, this is the starting point for the next list of returned [ListServiceVersionsRequest] versions.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of [ListServiceVersions] objects to return.\n"];
  dependent_services: dependent_service list option
    [@ocaml.doc
      "A list of names and versions of dependant services of the requested service.\n"];
  service_name: service_name
    [@ocaml.doc
      "The name of the service for which you're requesting supported versions.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_next_token_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The [NextToken] string was altered unexpectedly, and the operation has stopped. Run the operation without changing the [NextToken] string, and try again.\n"]
type nonrec address_type =
  | AWS_SHIP [@ocaml.doc ""]
  | CUST_PICKUP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec address =
  {
  type_: address_type option
    [@ocaml.doc
      "Differentiates between delivery address and pickup address in the customer account. Provided at job creation.\n"];
  is_restricted: bool option
    [@ocaml.doc
      "If the address you are creating is a primary address, then set this option to true. This field is not supported in most regions.\n"];
  phone_number: string option
    [@ocaml.doc
      "The phone number associated with an address that a Snow device is to be delivered to.\n"];
  postal_code: string option
    [@ocaml.doc
      "The postal code in an address that a Snow device is to be delivered to.\n"];
  country: string option
    [@ocaml.doc
      "The country in an address that a Snow device is to be delivered to.\n"];
  landmark: string option
    [@ocaml.doc "This field is no longer used and the value is ignored.\n"];
  prefecture_or_district: string option
    [@ocaml.doc "This field is no longer used and the value is ignored.\n"];
  state_or_province: string option
    [@ocaml.doc
      "The state or province in an address that a Snow device is to be delivered to.\n"];
  city: string option
    [@ocaml.doc
      "The city in an address that a Snow device is to be delivered to.\n"];
  street3: string option
    [@ocaml.doc
      "The third line in a street address that a Snow device is to be delivered to.\n"];
  street2: string option
    [@ocaml.doc
      "The second line in a street address that a Snow device is to be delivered to.\n"];
  street1: string option
    [@ocaml.doc
      "The first line in a street address that a Snow device is to be delivered to.\n"];
  company: string option
    [@ocaml.doc
      "The name of the company to receive a Snow device at an address.\n"];
  name: string option
    [@ocaml.doc
      "The name of a person to receive a Snow device at an address.\n"];
  address_id: string option [@ocaml.doc "The unique ID for an address.\n"]}
[@@ocaml.doc
  "The address that you want the Snow device(s) associated with a specific job to be shipped to. Addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. Although no individual elements of the [Address] are required, if the address is invalid or unsupported, then an exception is thrown.\n"]
type nonrec list_pickup_locations_result =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. To identify what object comes \"next\" in the list of [ListPickupLocationsResult] objects, you have the option of specifying [NextToken] as the starting point for your returned list.\n"];
  addresses: address list option
    [@ocaml.doc "Information about the address of pickup locations.\n"]}
[@@ocaml.doc ""]
type nonrec list_pickup_locations_request =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. To identify what object comes \"next\" in the list of [ListPickupLocationsRequest] objects, you have the option of specifying [NextToken] as the starting point for your returned list.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of locations to list per page.\n"]}
[@@ocaml.doc ""]
type nonrec list_long_term_pricing_result =
  {
  next_token: string option
    [@ocaml.doc
      "Because HTTP requests are stateless, this is the starting point for your next list of returned [ListLongTermPricing] list.\n"];
  long_term_pricing_entries: long_term_pricing_list_entry list option
    [@ocaml.doc
      "Each [LongTermPricingEntry] object contains a status, ID, and other information about the [LongTermPricing] type. \n"]}
[@@ocaml.doc ""]
type nonrec list_long_term_pricing_request =
  {
  next_token: string option
    [@ocaml.doc
      "Because HTTP requests are stateless, this is the starting point for your next list of [ListLongTermPricing] to return.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of [ListLongTermPricing] objects to return.\n"]}
[@@ocaml.doc ""]
type nonrec job_type =
  | LOCAL_USE [@ocaml.doc ""]
  | EXPORT [@ocaml.doc ""]
  | IMPORT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec job_list_entry =
  {
  description: string option
    [@ocaml.doc
      "The optional description of this specific job, for example [Important Photos\n        2016-08-11].\n"];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation date for this job.\n"];
  snowball_type: snowball_type option
    [@ocaml.doc "The type of device used with this job.\n"];
  job_type: job_type option [@ocaml.doc "The type of job.\n"];
  is_master: bool option
    [@ocaml.doc
      "A value that indicates that this job is a main job. A main job represents a successful request to create an export job. Main jobs aren't associated with any Snowballs. Instead, each main job will have at least one job part, and each job part is associated with a Snowball. It might take some time before the job parts associated with a particular main job are listed, because they are created after the main job is created.\n"];
  job_state: job_state option [@ocaml.doc "The current state of this job.\n"];
  job_id: string option
    [@ocaml.doc
      "The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc
  "Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of an export job.\n"]
type nonrec list_jobs_result =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. If you use this automatically generated [NextToken] value in your next [ListJobs] call, your returned [JobListEntry] objects will start from this point in the array.\n"];
  job_list_entries: job_list_entry list option
    [@ocaml.doc
      "Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. \n"]}
[@@ocaml.doc ""]
type nonrec list_jobs_request =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. To identify what object comes \"next\" in the list of [JobListEntry] objects, you have the option of specifying [NextToken] as the starting point for your returned list.\n"];
  max_results: int option
    [@ocaml.doc "The number of [JobListEntry] objects to return.\n"]}
[@@ocaml.doc ""]
type nonrec compatible_image =
  {
  name: string option
    [@ocaml.doc "The optional name of a compatible image.\n"];
  ami_id: string option
    [@ocaml.doc "The unique identifier for an individual Snow device AMI.\n"]}
[@@ocaml.doc
  "A JSON-formatted object that describes a compatible Amazon Machine Image (AMI), including the ID and name for a Snow device AMI. This AMI is compatible with the device's physical hardware requirements, and it should be able to be run in an SBE1 instance on the device.\n"]
type nonrec list_compatible_images_result =
  {
  next_token: string option
    [@ocaml.doc
      "Because HTTP requests are stateless, this is the starting point for your next list of returned images.\n"];
  compatible_images: compatible_image list option
    [@ocaml.doc
      "A JSON-formatted object that describes a compatible AMI, including the ID and name for a Snow device AMI.\n"]}
[@@ocaml.doc ""]
type nonrec list_compatible_images_request =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. To identify what object comes \"next\" in the list of compatible images, you can specify a value for [NextToken] as the starting point for your list of returned images.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results for the list of compatible images. Currently, a Snowball Edge device can store 10 AMIs.\n"]}
[@@ocaml.doc ""]
type nonrec cluster_state =
  | CANCELLED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_USE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | AWAITING_QUORUM [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cluster_list_entry =
  {
  description: string option
    [@ocaml.doc
      "Defines an optional description of the cluster, for example [Environmental Data\n        Cluster-01].\n"];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation date for this cluster.\n"];
  cluster_state: cluster_state option
    [@ocaml.doc
      "The current state of this cluster. For information about the state of a specific node, see [JobListEntry$JobState].\n"];
  cluster_id: string option
    [@ocaml.doc
      "The 39-character ID for the cluster that you want to list, for example [CID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc
  "Contains a cluster's state, a cluster's ID, and other important information.\n"]
type nonrec list_clusters_result =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. If you use the automatically generated [NextToken] value in your next [ClusterListEntry] call, your list of returned clusters will start from this point in the array.\n"];
  cluster_list_entries: cluster_list_entry list option
    [@ocaml.doc
      "Each [ClusterListEntry] object contains a cluster's state, a cluster's ID, and other important status information.\n"]}
[@@ocaml.doc ""]
type nonrec list_clusters_request =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. To identify what object comes \"next\" in the list of [ClusterListEntry] objects, you have the option of specifying [NextToken] as the starting point for your returned list.\n"];
  max_results: int option
    [@ocaml.doc "The number of [ClusterListEntry] objects to return.\n"]}
[@@ocaml.doc ""]
type nonrec list_cluster_jobs_result =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. If you use the automatically generated [NextToken] value in your next [ListClusterJobsResult] call, your list of returned jobs will start from this point in the array.\n"];
  job_list_entries: job_list_entry list option
    [@ocaml.doc
      "Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. \n"]}
[@@ocaml.doc ""]
type nonrec list_cluster_jobs_request =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. To identify what object comes \"next\" in the list of [JobListEntry] objects, you have the option of specifying [NextToken] as the starting point for your returned list.\n"];
  max_results: int option
    [@ocaml.doc "The number of [JobListEntry] objects to return.\n"];
  cluster_id: string
    [@ocaml.doc
      "The 39-character ID for the cluster that you want to list, for example [CID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec data_transfer =
  {
  total_objects: int option
    [@ocaml.doc
      "The total number of objects for a transfer between a Snow device and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.\n"];
  total_bytes: int option
    [@ocaml.doc
      "The total bytes of data for a transfer between a Snow device and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.\n"];
  objects_transferred: int option
    [@ocaml.doc
      "The number of objects transferred between a Snow device and Amazon S3.\n"];
  bytes_transferred: int option
    [@ocaml.doc
      "The number of bytes transferred between a Snow device and Amazon S3.\n"]}
[@@ocaml.doc
  "Defines the real-time status of a Snow device's data transfer while the device is at Amazon Web Services. This data is only available while a job has a [JobState] value of [InProgress], for both import and export jobs.\n"]
type nonrec job_logs =
  {
  job_failure_log_ur_i: string option
    [@ocaml.doc
      "A link to an Amazon S3 presigned URL where the job failure log is located.\n"];
  job_success_log_ur_i: string option
    [@ocaml.doc
      "A link to an Amazon S3 presigned URL where the job success log is located.\n"];
  job_completion_report_ur_i: string option
    [@ocaml.doc
      "A link to an Amazon S3 presigned URL where the job completion report is located.\n"]}
[@@ocaml.doc
  "Contains job logs. Whenever a Snow device is used to import data into or export data out of Amazon S3, you'll have the option of downloading a PDF job report. Job logs are returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type. The job logs can be accessed for up to 60 minutes after this request has been made. To access any of the job logs after 60 minutes have passed, you'll have to make another call to the [DescribeJob] action.\n\n For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snow device for your job part is being delivered to you.\n \n  The job report provides you insight into the state of your Amazon S3 data transfer. The report includes details about your job or job part for your records.\n  \n   For deeper visibility into the status of your transferred objects, you can look at the two associated logs: a success log and a failure log. The logs are saved in comma-separated value (CSV) format, and the name of each log includes the ID of the job or job part that the log describes.\n   "]
type nonrec device_configuration =
  {
  snowcone_device_configuration: snowcone_device_configuration option
    [@ocaml.doc
      "Returns information about the device configuration for an Snowcone job.\n"]}
[@@ocaml.doc "The container for [SnowconeDeviceConfiguration]. \n"]
type nonrec impact_level =
  | IL99 [@ocaml.doc ""]
  | IL6 [@ocaml.doc ""]
  | IL5 [@ocaml.doc ""]
  | IL4 [@ocaml.doc ""]
  | IL2 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec job_metadata =
  {
  snowball_id: string option
    [@ocaml.doc "Unique ID associated with a device.\n"];
  pickup_details: pickup_details option
    [@ocaml.doc
      "Information identifying the person picking up the device.\n"];
  impact_level: impact_level option
    [@ocaml.doc
      "The highest impact level of data that will be stored or processed on the device, provided at job creation.\n"];
  on_device_service_configuration: on_device_service_configuration option
    [@ocaml.doc
      "Represents metadata and configuration settings for services on an Amazon Web Services Snow Family device.\n"];
  long_term_pricing_id: string option
    [@ocaml.doc "The ID of the long-term pricing type for the device.\n"];
  remote_management: remote_management option
    [@ocaml.doc
      "Allows you to securely operate and manage Snowcone devices remotely from outside of your internal network. When set to [INSTALLED_AUTOSTART], remote management will automatically be available when the device arrives at your location. Otherwise, you need to use the Snowball Client to manage the device.\n"];
  device_configuration: device_configuration option [@ocaml.doc ""];
  tax_documents: tax_documents option
    [@ocaml.doc
      "The metadata associated with the tax documents required in your Amazon Web Services Region.\n"];
  forwarding_address_id: string option
    [@ocaml.doc
      "The ID of the address that you want a job shipped to, after it will be shipped to its primary address. This field is not supported in most regions.\n"];
  cluster_id: string option
    [@ocaml.doc
      "The 39-character ID for the cluster, for example [CID123e4567-e89b-12d3-a456-426655440000].\n"];
  job_log_info: job_logs option
    [@ocaml.doc
      "Links to Amazon S3 presigned URLs for the job report and logs. For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snow device for your job part is being delivered to you.\n"];
  data_transfer_progress: data_transfer option
    [@ocaml.doc
      "A value that defines the real-time status of a Snow device's data transfer while the device is at Amazon Web Services. This data is only available while a job has a [JobState] value of [InProgress], for both import and export jobs.\n"];
  notification: notification option
    [@ocaml.doc
      "The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The [Notification] object is returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type.\n"];
  snowball_capacity_preference: snowball_capacity option
    [@ocaml.doc
      "The Snow device capacity preference for this job, specified at job creation. In US regions, you can choose between 50 TB and 80 TB Snowballs. All other regions use 80 TB capacity Snowballs.\n\n For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n "];
  shipping_details: shipping_details option
    [@ocaml.doc
      "A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.\n"];
  address_id: string option
    [@ocaml.doc
      "The ID for the address that you want the Snow device shipped to.\n"];
  role_ar_n: string option
    [@ocaml.doc
      "The role ARN associated with this job. This ARN was created using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management.\n"];
  kms_key_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Key Management Service (KMS) key associated with this job. This ARN was created using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} API action in KMS.\n"];
  description: string option
    [@ocaml.doc "The description of the job, provided at job creation.\n"];
  resources: job_resource option
    [@ocaml.doc
      "An array of [S3Resource] objects. Each [S3Resource] object represents an Amazon S3 bucket that your transferred data will be exported from or imported into.\n"];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation date for this job.\n"];
  snowball_type: snowball_type option
    [@ocaml.doc "The type of device used with this job.\n"];
  job_type: job_type option [@ocaml.doc "The type of job.\n"];
  job_state: job_state option
    [@ocaml.doc "The current status of the jobs.\n"];
  job_id: string option
    [@ocaml.doc
      "The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc
  "Contains information about a specific job including shipping information, job status, and other important metadata. This information is returned as a part of the response syntax of the [DescribeJob] action.\n"]
type nonrec invalid_address_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The address provided was invalid. Check the address with your region's carrier, and try again.\n"]
type nonrec get_software_updates_result =
  {
  updates_ur_i: string option
    [@ocaml.doc
      "The Amazon S3 presigned URL for the update file associated with the specified [JobId] value. The software update will be available for 2 days after this request is made. To access an update after the 2 days have passed, you'll have to make another call to [GetSoftwareUpdates].\n"]}
[@@ocaml.doc ""]
type nonrec get_software_updates_request =
  {
  job_id: string
    [@ocaml.doc
      "The ID for a job that you want to get the software update file for, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec get_snowball_usage_result =
  {
  snowballs_in_use: int option
    [@ocaml.doc
      "The number of Snow devices that this account is currently using.\n"];
  snowball_limit: int option
    [@ocaml.doc
      "The service limit for number of Snow devices this account can have at once. The default service limit is 1 (one).\n"]}
[@@ocaml.doc ""]
type nonrec get_job_unlock_code_result =
  {
  unlock_code: string option
    [@ocaml.doc
      "The [UnlockCode] value for the specified job. The [UnlockCode] value can be accessed for up to 360 days after the job has been created.\n"]}
[@@ocaml.doc ""]
type nonrec get_job_unlock_code_request =
  {
  job_id: string
    [@ocaml.doc
      "The ID for the job that you want to get the [UnlockCode] value for, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec get_job_manifest_result =
  {
  manifest_ur_i: string option
    [@ocaml.doc
      "The Amazon S3 presigned URL for the manifest file associated with the specified [JobId] value.\n"]}
[@@ocaml.doc ""]
type nonrec get_job_manifest_request =
  {
  job_id: string
    [@ocaml.doc
      "The ID for a job that you want to get the manifest file for, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec describe_return_shipping_label_result =
  {
  return_shipping_label_ur_i: string option
    [@ocaml.doc
      "The pre-signed Amazon S3 URI used to download the return shipping label.\n"];
  expiration_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The expiration date of the current return shipping label.\n"];
  status: shipping_label_status option
    [@ocaml.doc
      "The status information of the task on a Snow device that is being returned to Amazon Web Services.\n"]}
[@@ocaml.doc ""]
type nonrec describe_return_shipping_label_request =
  {
  job_id: string
    [@ocaml.doc
      "The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec conflict_exception =
  {
  message: string option [@ocaml.doc ""];
  conflict_resource: string option
    [@ocaml.doc
      "You get this resource when you call [CreateReturnShippingLabel] more than once when other requests are not completed. .\n"]}
[@@ocaml.doc
  "You get this exception when you call [CreateReturnShippingLabel] more than once when other requests are not completed.\n"]
type nonrec describe_job_result =
  {
  sub_job_metadata: job_metadata list option
    [@ocaml.doc
      "Information about a specific job part (in the case of an export job), including shipping information, job status, and other important metadata.\n"];
  job_metadata: job_metadata option
    [@ocaml.doc
      "Information about a specific job, including shipping information, job status, and other important metadata.\n"]}
[@@ocaml.doc ""]
type nonrec describe_job_request =
  {
  job_id: string
    [@ocaml.doc
      "The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec cluster_metadata =
  {
  on_device_service_configuration: on_device_service_configuration option
    [@ocaml.doc
      "Represents metadata and configuration settings for services on an Amazon Web Services Snow Family device.\n"];
  tax_documents: tax_documents option
    [@ocaml.doc
      "The tax documents required in your Amazon Web Services Region.\n"];
  forwarding_address_id: string option
    [@ocaml.doc
      "The ID of the address that you want a cluster shipped to, after it will be shipped to its primary address. This field is not supported in most regions.\n"];
  notification: notification option
    [@ocaml.doc
      "The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.\n"];
  shipping_option: shipping_option option
    [@ocaml.doc
      "The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows:\n\n {ul\n       {-  In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.\n           \n            }\n       {-  In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.\n           \n            }\n       {-  In India, Snow devices are delivered in one to seven days.\n           \n            }\n       {-  In the US, you have access to one-day shipping and two-day shipping.\n           \n            }\n       }\n  "];
  address_id: string option
    [@ocaml.doc "The automatically generated ID for a specific address.\n"];
  resources: job_resource option
    [@ocaml.doc
      "The arrays of [JobResource] objects that can include updated [S3Resource] objects or [LambdaResource] objects.\n"];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation date for this cluster.\n"];
  snowball_type: snowball_type option
    [@ocaml.doc
      "The type of Snowcone device to use for this cluster. \n\n  For cluster jobs, Amazon Web Services Snow Family currently supports only the [EDGE] device type.\n  \n   "];
  job_type: job_type option
    [@ocaml.doc
      "The type of job for this cluster. Currently, the only job type supported for clusters is [LOCAL_USE].\n"];
  cluster_state: cluster_state option
    [@ocaml.doc "The current status of the cluster.\n"];
  role_ar_n: string option
    [@ocaml.doc
      "The role ARN associated with this cluster. This ARN was created using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management (IAM).\n"];
  kms_key_ar_n: string option
    [@ocaml.doc
      "The [KmsKeyARN] Amazon Resource Name (ARN) associated with this cluster. This ARN was created using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} API action in Key Management Service (KMS.\n"];
  description: string option
    [@ocaml.doc "The optional description of the cluster.\n"];
  cluster_id: string option
    [@ocaml.doc "The automatically generated ID for a cluster.\n"]}[@@ocaml.doc
                                                                    "Contains metadata about a specific cluster.\n"]
type nonrec describe_cluster_result =
  {
  cluster_metadata: cluster_metadata option
    [@ocaml.doc
      "Information about a specific cluster, including shipping information, cluster status, and other important metadata.\n"]}
[@@ocaml.doc ""]
type nonrec describe_cluster_request =
  {
  cluster_id: string
    [@ocaml.doc "The automatically generated ID for a cluster.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_addresses_result =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. If you use the automatically generated [NextToken] value in your next [DescribeAddresses] call, your list of returned addresses will start from this point in the array.\n"];
  addresses: address list option
    [@ocaml.doc
      "The Snow device shipping addresses that were created for this account.\n"]}
[@@ocaml.doc ""]
type nonrec describe_addresses_request =
  {
  next_token: string option
    [@ocaml.doc
      "HTTP requests are stateless. To identify what object comes \"next\" in the list of [ADDRESS] objects, you have the option of specifying a value for [NextToken] as the starting point for your list of returned addresses.\n"];
  max_results: int option
    [@ocaml.doc "The number of [ADDRESS] objects to return.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_address_result =
  {
  address: address option
    [@ocaml.doc
      "The address that you want the Snow device(s) associated with a specific job to be shipped to.\n"]}
[@@ocaml.doc ""]
type nonrec describe_address_request =
  {
  address_id: string
    [@ocaml.doc "The automatically generated ID for a specific address.\n"]}
[@@ocaml.doc ""]
type nonrec create_return_shipping_label_result =
  {
  status: shipping_label_status option
    [@ocaml.doc
      "The status information of the task on a Snow device that is being returned to Amazon Web Services.\n"]}
[@@ocaml.doc ""]
type nonrec create_return_shipping_label_request =
  {
  shipping_option: shipping_option option
    [@ocaml.doc
      "The shipping speed for a particular job. This speed doesn't dictate how soon the device is returned to Amazon Web Services. This speed represents how quickly it moves to its destination while in transit. Regional shipping speeds are as follows:\n"];
  job_id: string
    [@ocaml.doc
      "The ID for a job that you want to create the return shipping label for; for example, [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec create_long_term_pricing_result =
  {
  long_term_pricing_id: string option
    [@ocaml.doc "The ID of the long-term pricing type for the device.\n"]}
[@@ocaml.doc ""]
type nonrec create_long_term_pricing_request =
  {
  snowball_type: snowball_type
    [@ocaml.doc
      "The type of Snow Family devices to use for the long-term pricing job.\n"];
  is_long_term_pricing_auto_renew: bool option
    [@ocaml.doc
      "Specifies whether the current long-term pricing type for the device should be renewed.\n"];
  long_term_pricing_type: long_term_pricing_type
    [@ocaml.doc
      "The type of long-term pricing option you want for the device, either 1-year or 3-year long-term pricing.\n"]}
[@@ocaml.doc ""]
type nonrec create_job_result =
  {
  job_id: string option
    [@ocaml.doc
      "The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec create_job_request =
  {
  pickup_details: pickup_details option
    [@ocaml.doc
      "Information identifying the person picking up the device.\n"];
  impact_level: impact_level option
    [@ocaml.doc
      "The highest impact level of data that will be stored or processed on the device, provided at job creation.\n"];
  long_term_pricing_id: string option
    [@ocaml.doc "The ID of the long-term pricing type for the device.\n"];
  remote_management: remote_management option
    [@ocaml.doc
      "Allows you to securely operate and manage Snowcone devices remotely from outside of your internal network. When set to [INSTALLED_AUTOSTART], remote management will automatically be available when the device arrives at your location. Otherwise, you need to use the Snowball Edge client to manage the device. When set to [NOT_INSTALLED], remote management will not be available on the device. \n"];
  device_configuration: device_configuration option
    [@ocaml.doc
      "Defines the device configuration for an Snowcone job.\n\n For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n "];
  tax_documents: tax_documents option
    [@ocaml.doc
      "The tax documents required in your Amazon Web Services Region.\n"];
  forwarding_address_id: string option
    [@ocaml.doc
      "The forwarding address ID for a job. This field is not supported in most Regions.\n"];
  snowball_type: snowball_type option
    [@ocaml.doc
      "The type of Snow Family devices to use for this job. \n\n  For cluster jobs, Amazon Web Services Snow Family currently supports only the [EDGE] device type.\n  \n    The type of Amazon Web Services Snow device to use for this job. Currently, the only supported device type for cluster jobs is [EDGE].\n    \n     For more information, see {{:https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html}Snowball Edge Device Options} in the Snowball Edge Developer Guide.\n     \n      For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n      "];
  cluster_id: string option
    [@ocaml.doc
      "The ID of a cluster. If you're creating a job for a node in a cluster, you need to provide only this [clusterId] value. The other job attributes are inherited from the cluster.\n"];
  notification: notification option
    [@ocaml.doc
      "Defines the Amazon Simple Notification Service (Amazon SNS) notification settings for this job.\n"];
  shipping_option: shipping_option option
    [@ocaml.doc
      "The shipping speed for this job. This speed doesn't dictate how soon you'll get the Snow device, rather it represents how quickly the Snow device moves to its destination while in transit. Regional shipping speeds are as follows:\n\n {ul\n       {-  In Australia, you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day.\n           \n            }\n       {-  In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.\n           \n            }\n       {-  In India, Snow devices are delivered in one to seven days.\n           \n            }\n       {-  In the US, you have access to one-day shipping and two-day shipping.\n           \n            }\n       }\n  "];
  snowball_capacity_preference: snowball_capacity option
    [@ocaml.doc
      "If your job is being created in one of the US regions, you have the option of specifying what size Snow device you'd like for this job. In all other regions, Snowballs come with 80 TB in storage capacity.\n\n For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n "];
  role_ar_n: string option
    [@ocaml.doc
      "The [RoleARN] that you want to associate with this job. [RoleArn]s are created using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} Identity and Access Management (IAM) API action.\n"];
  kms_key_ar_n: string option
    [@ocaml.doc
      "The [KmsKeyARN] that you want to associate with this job. [KmsKeyARN]s are created using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} Key Management Service (KMS) API action.\n"];
  address_id: string option
    [@ocaml.doc
      "The ID for the address that you want the Snow device shipped to.\n"];
  description: string option
    [@ocaml.doc
      "Defines an optional description of this specific job, for example [Important\n        Photos 2016-08-11].\n"];
  on_device_service_configuration: on_device_service_configuration option
    [@ocaml.doc
      "Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System) and the Amazon Web Services Storage Gateway service Tape Gateway type.\n"];
  resources: job_resource option
    [@ocaml.doc
      "Defines the Amazon S3 buckets associated with this job.\n\n With [IMPORT] jobs, you specify the bucket or buckets that your transferred data will be imported into.\n \n  With [EXPORT] jobs, you specify the bucket or buckets that your transferred data will be exported from. Optionally, you can also specify a [KeyRange] value. If you choose to export a range, you define the length of the range by providing either an inclusive [BeginMarker] value, an inclusive [EndMarker] value, or both. Ranges are UTF-8 binary sorted.\n  "];
  job_type: job_type option
    [@ocaml.doc "Defines the type of job that you're creating. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_cluster_result =
  {
  job_list_entries: job_list_entry list option
    [@ocaml.doc
      "List of jobs created for this cluster. For syntax, see {{:http://amazonaws.com/snowball/latest/api-reference/API_ListJobs.html#API_ListJobs_ResponseSyntax}ListJobsResult$JobListEntries} in this guide.\n"];
  cluster_id: string option
    [@ocaml.doc "The automatically generated ID for a cluster.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_cluster_request =
  {
  snowball_capacity_preference: snowball_capacity option
    [@ocaml.doc
      "If your job is being created in one of the US regions, you have the option of specifying what size Snow device you'd like for this job. In all other regions, Snowballs come with 80 TB in storage capacity.\n\n For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n "];
  long_term_pricing_ids: string list option
    [@ocaml.doc
      "Lists long-term pricing id that will be used to associate with jobs automatically created for the new cluster.\n"];
  force_create_jobs: bool option
    [@ocaml.doc
      "Force to create cluster when user attempts to overprovision or underprovision a cluster. A cluster is overprovisioned or underprovisioned if the initial size of the cluster is more (overprovisioned) or less (underprovisioned) than what needed to meet capacity requirement specified with [OnDeviceServiceConfiguration].\n"];
  initial_cluster_size: int option
    [@ocaml.doc
      "If provided, each job will be automatically created and associated with the new cluster. If not provided, will be treated as 0.\n"];
  remote_management: remote_management option
    [@ocaml.doc
      "Allows you to securely operate and manage Snow devices in a cluster remotely from outside of your internal network. When set to [INSTALLED_AUTOSTART], remote management will automatically be available when the device arrives at your location. Otherwise, you need to use the Snowball Client to manage the device.\n"];
  tax_documents: tax_documents option
    [@ocaml.doc
      "The tax documents required in your Amazon Web Services Region.\n"];
  forwarding_address_id: string option
    [@ocaml.doc
      "The forwarding address ID for a cluster. This field is not supported in most regions.\n"];
  notification: notification option
    [@ocaml.doc
      "The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.\n"];
  shipping_option: shipping_option
    [@ocaml.doc
      "The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each Snowball Edge device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows: \n\n {ul\n       {-  In Australia, you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day.\n           \n            }\n       {-  In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.\n           \n            }\n       {-  In India, Snow devices are delivered in one to seven days.\n           \n            }\n       {-  In the United States of America (US), you have access to one-day shipping and two-day shipping.\n           \n            }\n       }\n   {ul\n         {-  In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.\n             \n              }\n         {-  In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.\n             \n              }\n         {-  In India, Snow devices are delivered in one to seven days.\n             \n              }\n         {-  In the US, you have access to one-day shipping and two-day shipping.\n             \n              }\n         }\n  "];
  snowball_type: snowball_type
    [@ocaml.doc
      "The type of Snow Family devices to use for this cluster. \n\n  For cluster jobs, Amazon Web Services Snow Family currently supports only the [EDGE] device type.\n  \n    For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n    "];
  role_ar_n: string option
    [@ocaml.doc
      "The [RoleARN] that you want to associate with this cluster. [RoleArn] values are created by using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management (IAM).\n"];
  kms_key_ar_n: string option
    [@ocaml.doc
      "The [KmsKeyARN] value that you want to associate with this cluster. [KmsKeyARN] values are created by using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} API action in Key Management Service (KMS). \n"];
  address_id: string
    [@ocaml.doc
      "The ID for the address that you want the cluster shipped to.\n"];
  description: string option
    [@ocaml.doc
      "An optional description of this specific cluster, for example [Environmental Data\n        Cluster-01].\n"];
  on_device_service_configuration: on_device_service_configuration option
    [@ocaml.doc
      "Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family device clusters support Amazon S3 and NFS (Network File System).\n"];
  resources: job_resource option
    [@ocaml.doc
      "The resources associated with the cluster job. These resources include Amazon S3 buckets and optional Lambda functions written in the Python language. \n"];
  job_type: job_type
    [@ocaml.doc
      "The type of job for this cluster. Currently, the only job type supported for clusters is [LOCAL_USE].\n\n For more information, see \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.\n "]}
[@@ocaml.doc ""]
type nonrec create_address_result =
  {
  address_id: string option
    [@ocaml.doc
      "The automatically generated ID for a specific address. You'll use this ID when you create a job to specify which address you want the Snow device for that job shipped to.\n"]}
[@@ocaml.doc ""]
type nonrec create_address_request =
  {
  address: address
    [@ocaml.doc "The address that you want the Snow device shipped to.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_job_request =
  {
  job_id: string
    [@ocaml.doc
      "The 39-character job ID for the job that you want to cancel, for example [JID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]
type nonrec cancel_cluster_request =
  {
  cluster_id: string
    [@ocaml.doc
      "The 39-character ID for the cluster that you want to cancel, for example [CID123e4567-e89b-12d3-a456-426655440000].\n"]}
[@@ocaml.doc ""]