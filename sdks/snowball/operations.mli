open Types
module CancelCluster :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_cluster_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `KMSRequestFailedException of kms_request_failed_exception ])
          result
end[@@ocaml.doc
     "Cancels a cluster job. You can only cancel a cluster job while it's in the [AwaitingQuorum] status. You'll have at least an hour after creating a cluster job to cancel it.\n"]
module CancelJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_job_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `KMSRequestFailedException of kms_request_failed_exception ])
          result
end[@@ocaml.doc
     "Cancels the specified job. You can only cancel a job before its [JobState] value changes to [PreparingAppliance]. Requesting the [ListJobs] or [DescribeJob] action returns a job's [JobState] as part of the response element data returned.\n"]
module CreateAddress :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_address_request ->
        (create_address_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidAddressException of invalid_address_exception 
          | `UnsupportedAddressException of unsupported_address_exception ])
          result
end[@@ocaml.doc
     "Creates an address for a Snow device to be shipped to. In most regions, addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown. If providing an address as a JSON file through the [cli-input-json] option, include the full file path. For example, [--cli-input-json file://create-address.json].\n"]
module CreateCluster :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_cluster_request ->
        (create_cluster_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `Ec2RequestFailedException of ec2_request_failed_exception 
          | `InvalidInputCombinationException of
              invalid_input_combination_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `KMSRequestFailedException of kms_request_failed_exception ])
          result
end[@@ocaml.doc
     "Creates an empty cluster. Each cluster supports five nodes. You use the [CreateJob] action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.\n"]
module CreateJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_job_request ->
        (create_job_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ClusterLimitExceededException of
              cluster_limit_exceeded_exception 
          | `Ec2RequestFailedException of ec2_request_failed_exception 
          | `InvalidInputCombinationException of
              invalid_input_combination_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `KMSRequestFailedException of kms_request_failed_exception ])
          result
end[@@ocaml.doc
     "Creates a job to import or export data between Amazon S3 and your on-premises data center. Your Amazon Web Services account must have the right trust policies and permissions in place to create a job for a Snow device. If you're creating a job for a node in a cluster, you only need to provide the [clusterId] value; the other job attributes are inherited from the cluster. \n\n  Only the Snowball; Edge device type is supported when ordering clustered jobs.\n  \n   The device capacity is optional.\n   \n    Availability of device types differ by Amazon Web Services Region. For more information about Region availability, see {{:https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/?p=ngi&loc=4}Amazon Web Services Regional Services}.\n    \n      \n      \n        {b Snow Family devices and their capacities.} \n       \n        {ul\n              {-  Device type: {b SNC1_SSD} \n                  \n                   {ul\n                         {-  Capacity: T14\n                             \n                              }\n                         {-  Description: Snowcone \n                             \n                              }\n                         \n               }\n                \n                \n                 }\n              {-  Device type: {b SNC1_HDD} \n                  \n                   {ul\n                         {-  Capacity: T8\n                             \n                              }\n                         {-  Description: Snowcone \n                             \n                              }\n                         \n               }\n                \n                \n                 }\n              {-  Device type: {b EDGE_S} \n                  \n                   {ul\n                         {-  Capacity: T98\n                             \n                              }\n                         {-  Description: Snowball Edge Storage Optimized for data transfer only \n                             \n                              }\n                         \n               }\n                \n                \n                 }\n              {-  Device type: {b EDGE_CG} \n                  \n                   {ul\n                         {-  Capacity: T42\n                             \n                              }\n                         {-  Description: Snowball Edge Compute Optimized with GPU\n                             \n                              }\n                         \n               }\n                \n                \n                 }\n              {-  Device type: {b EDGE_C} \n                  \n                   {ul\n                         {-  Capacity: T42\n                             \n                              }\n                         {-  Description: Snowball Edge Compute Optimized without GPU\n                             \n                              }\n                         \n               }\n                \n                \n                 }\n              {-  Device type: {b EDGE} \n                  \n                   {ul\n                         {-  Capacity: T100\n                             \n                              }\n                         {-  Description: Snowball Edge Storage Optimized with EC2 Compute\n                             \n                              }\n                         \n               }\n                 This device is replaced with T98.\n                 \n                   \n                   \n                    }\n              {-  Device type: {b STANDARD} \n                  \n                   {ul\n                         {-  Capacity: T50\n                             \n                              }\n                         {-  Description: Original Snowball device\n                             \n                               This device is only available in the Ningxia, Beijing, and Singapore Amazon Web Services Region \n                               \n                                 }\n                         \n               }\n                \n                \n                 }\n              {-  Device type: {b STANDARD} \n                  \n                   {ul\n                         {-  Capacity: T80\n                             \n                              }\n                         {-  Description: Original Snowball device\n                             \n                               This device is only available in the Ningxia, Beijing, and Singapore Amazon Web Services Region. \n                               \n                                 }\n                         \n               }\n                \n                \n                 }\n              {-  Snow Family device type: {b RACK_5U_C} \n                  \n                   {ul\n                         {-  Capacity: T13 \n                             \n                              }\n                         {-  Description: Snowblade.\n                             \n                              }\n                         \n               }\n                }\n              {-  Device type: {b V3_5S} \n                  \n                   {ul\n                         {-  Capacity: T240\n                             \n                              }\n                         {-  Description: Snowball Edge Storage Optimized 210TB\n                             \n                              }\n                         \n               }\n                }\n              }\n  "]
module CreateLongTermPricing :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_long_term_pricing_request ->
        (create_long_term_pricing_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Creates a job with the long-term usage option for a device. The long-term usage is a 1-year or 3-year long-term pricing type for the device. You are billed upfront, and Amazon Web Services provides discounts for long-term pricing. \n"]
module CreateReturnShippingLabel :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_return_shipping_label_request ->
        (create_return_shipping_label_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidInputCombinationException of
              invalid_input_combination_exception 
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `ReturnShippingLabelAlreadyExistsException of
              return_shipping_label_already_exists_exception ])
          result
end[@@ocaml.doc
     "Creates a shipping label that will be used to return the Snow device to Amazon Web Services.\n"]
module DescribeAddress :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_address_request ->
        (describe_address_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Takes an [AddressId] and returns specific details about that address in the form of an [Address] object.\n"]
module DescribeAddresses :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_addresses_request ->
        (describe_addresses_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Returns a specified number of [ADDRESS] objects. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.\n"]
module DescribeCluster :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_cluster_request ->
        (describe_cluster_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Returns information about a specific cluster including shipping information, cluster status, and other important metadata.\n"]
module DescribeJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_job_request ->
        (describe_job_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Returns information about a specific job including shipping information, job status, and other important metadata. \n"]
module DescribeReturnShippingLabel :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_return_shipping_label_request ->
        (describe_return_shipping_label_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Information on the shipping label of a Snow device that is being returned to Amazon Web Services.\n"]
module GetJobManifest :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_manifest_request ->
        (get_job_manifest_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified [JobId] value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you'll have to make another call to the [GetJobManifest] action.\n\n The manifest is an encrypted file that you can download after your job enters the [WithCustomer] status. This is the only valid status for calling this API as the manifest and [UnlockCode] code value are used for securing your device and should only be used when you have the device. The manifest is decrypted by using the [UnlockCode] code value, when you pass both values to the Snow device through the Snowball client when the client is started for the first time. \n \n  As a best practice, we recommend that you don't save a copy of an [UnlockCode] value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snow device associated with that job.\n  \n   The credentials of a given job, including its manifest file and unlock code, expire 360 days after the job is created.\n   "]
module GetJobUnlockCode :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_unlock_code_request ->
        (get_job_unlock_code_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Returns the [UnlockCode] code value for the specified job. A particular [UnlockCode] value can be accessed for up to 360 days after the associated job has been created.\n\n The [UnlockCode] value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snow device through the Snowball client when the client is started for the first time. The only valid status for calling this API is [WithCustomer] as the manifest and [Unlock] code values are used for securing your device and should only be used when you have the device.\n \n  As a best practice, we recommend that you don't save a copy of the [UnlockCode] in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snow device associated with that job.\n  "]
module GetSnowballUsage :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_snowball_usage_result, [> Smaws_Lib.Protocols.AwsJson.error])
          result
end[@@ocaml.doc
     "Returns information about the Snow Family service limit for your account, and also the number of Snow devices your account has in use.\n\n The default service limit for the number of Snow devices that you can have at one time is 1. If you want to increase your service limit, contact Amazon Web Services Support.\n "]
module GetSoftwareUpdates :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_software_updates_request ->
        (get_software_updates_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Returns an Amazon S3 presigned URL for an update file associated with a specified [JobId].\n"]
module ListClusterJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_cluster_jobs_request ->
        (list_cluster_jobs_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Returns an array of [JobListEntry] objects of the specified length. Each [JobListEntry] object is for a job in the specified cluster and contains a job's state, a job's ID, and other information.\n"]
module ListClusters :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_clusters_request ->
        (list_clusters_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception ])
          result
end[@@ocaml.doc
     "Returns an array of [ClusterListEntry] objects of the specified length. Each [ClusterListEntry] object contains a cluster's state, a cluster's ID, and other important status information.\n"]
module ListCompatibleImages :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_compatible_images_request ->
        (list_compatible_images_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `Ec2RequestFailedException of ec2_request_failed_exception 
          | `InvalidNextTokenException of invalid_next_token_exception ])
          result
end[@@ocaml.doc
     "This action returns a list of the different Amazon EC2-compatible Amazon Machine Images (AMIs) that are owned by your Amazon Web Services accountthat would be supported for use on a Snow device. Currently, supported AMIs are based on the Amazon Linux-2, Ubuntu 20.04 LTS - Focal, or Ubuntu 22.04 LTS - Jammy images, available on the Amazon Web Services Marketplace. Ubuntu 16.04 LTS - Xenial (HVM) images are no longer supported in the Market, but still supported for use on devices through Amazon EC2 VM Import/Export and running locally in AMIs.\n"]
module ListJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_jobs_request ->
        (list_jobs_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception ])
          result
end[@@ocaml.doc
     "Returns an array of [JobListEntry] objects of the specified length. Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.\n"]
module ListLongTermPricing :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_long_term_pricing_request ->
        (list_long_term_pricing_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc "Lists all long-term pricing types.\n"]
module ListPickupLocations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_pickup_locations_request ->
        (list_pickup_locations_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "A list of locations from which the customer can choose to pickup a device.\n"]
module ListServiceVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_versions_request ->
        (list_service_versions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Lists all supported versions for Snow on-device services. Returns an array of [ServiceVersion] object containing the supported versions for a particular service.\n"]
module UpdateCluster :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_cluster_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `Ec2RequestFailedException of ec2_request_failed_exception 
          | `InvalidInputCombinationException of
              invalid_input_combination_exception 
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `KMSRequestFailedException of kms_request_failed_exception ])
          result
end[@@ocaml.doc
     "While a cluster's [ClusterState] value is in the [AwaitingQuorum] state, you can update some of the information associated with a cluster. Once the cluster changes to a different job state, usually 60 minutes after the cluster being created, this action is no longer available.\n"]
module UpdateJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ClusterLimitExceededException of
              cluster_limit_exceeded_exception 
          | `Ec2RequestFailedException of ec2_request_failed_exception 
          | `InvalidInputCombinationException of
              invalid_input_combination_exception 
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `KMSRequestFailedException of kms_request_failed_exception ])
          result
end[@@ocaml.doc
     "While a job's [JobState] value is [New], you can update some of the information associated with a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.\n"]
module UpdateJobShipmentState :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_shipment_state_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidJobStateException of invalid_job_state_exception 
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc
     "Updates the state when a shipment state changes to a different state.\n"]
module UpdateLongTermPricing :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_long_term_pricing_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc "Updates the long-term pricing type.\n"]