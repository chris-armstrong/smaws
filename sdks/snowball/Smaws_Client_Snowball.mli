(** 
    Snowball client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_wireless_connection :
  ?is_wifi_enabled:boolean_ -> unit -> wireless_connection
val make_update_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:java_boolean ->
    ?replacement_job:job_id ->
      long_term_pricing_id:long_term_pricing_id ->
        unit -> update_long_term_pricing_request
val make_update_job_shipment_state_request :
  shipment_state:shipment_state ->
    job_id:job_id -> unit -> update_job_shipment_state_request
val make_notification :
  ?device_pickup_sns_topic_ar_n:sns_topic_ar_n ->
    ?notify_all:boolean_ ->
      ?job_states_to_notify:job_state_list ->
        ?sns_topic_ar_n:sns_topic_ar_n -> unit -> notification
val make_key_range :
  ?end_marker:string_ -> ?begin_marker:string_ -> unit -> key_range
val make_target_on_device_service :
  ?transfer_option:transfer_option ->
    ?service_name:device_service_name -> unit -> target_on_device_service
val make_s3_resource :
  ?target_on_device_services:target_on_device_service_list ->
    ?key_range:key_range -> ?bucket_arn:resource_ar_n -> unit -> s3_resource
val make_event_trigger_definition :
  ?event_resource_ar_n:resource_ar_n -> unit -> event_trigger_definition
val make_lambda_resource :
  ?event_triggers:event_trigger_definition_list ->
    ?lambda_arn:resource_ar_n -> unit -> lambda_resource
val make_ec2_ami_resource :
  ?snowball_ami_id:string_ -> ami_id:ami_id -> unit -> ec2_ami_resource
val make_job_resource :
  ?ec2_ami_resources:ec2_ami_resource_list ->
    ?lambda_resources:lambda_resource_list ->
      ?s3_resources:s3_resource_list -> unit -> job_resource
val make_nfs_on_device_service_configuration :
  ?storage_unit:storage_unit ->
    ?storage_limit:storage_limit ->
      unit -> nfs_on_device_service_configuration
val make_tgw_on_device_service_configuration :
  ?storage_unit:storage_unit ->
    ?storage_limit:storage_limit ->
      unit -> tgw_on_device_service_configuration
val make_eks_on_device_service_configuration :
  ?eks_anywhere_version:string_ ->
    ?kubernetes_version:string_ ->
      unit -> eks_on_device_service_configuration
val make_s3_on_device_service_configuration :
  ?fault_tolerance:node_fault_tolerance ->
    ?service_size:service_size ->
      ?storage_unit:storage_unit ->
        ?storage_limit:s3_storage_limit ->
          unit -> s3_on_device_service_configuration
val make_on_device_service_configuration :
  ?s3_on_device_service:s3_on_device_service_configuration ->
    ?eks_on_device_service:eks_on_device_service_configuration ->
      ?tgw_on_device_service:tgw_on_device_service_configuration ->
        ?nfs_on_device_service:nfs_on_device_service_configuration ->
          unit -> on_device_service_configuration
val make_pickup_details :
  ?device_pickup_id:device_pickup_id ->
    ?identification_issuing_org:string_ ->
      ?identification_expiration_date:timestamp ->
        ?identification_number:string_ ->
          ?email:email ->
            ?phone_number:phone_number ->
              ?name:string_ -> unit -> pickup_details
val make_update_job_request :
  ?pickup_details:pickup_details ->
    ?forwarding_address_id:address_id ->
      ?snowball_capacity_preference:snowball_capacity ->
        ?description:string_ ->
          ?shipping_option:shipping_option ->
            ?address_id:address_id ->
              ?on_device_service_configuration:on_device_service_configuration
                ->
                ?resources:job_resource ->
                  ?notification:notification ->
                    ?role_ar_n:role_ar_n ->
                      job_id:job_id -> unit -> update_job_request
val make_update_cluster_request :
  ?forwarding_address_id:address_id ->
    ?notification:notification ->
      ?shipping_option:shipping_option ->
        ?address_id:address_id ->
          ?on_device_service_configuration:on_device_service_configuration ->
            ?resources:job_resource ->
              ?description:string_ ->
                ?role_ar_n:role_ar_n ->
                  cluster_id:cluster_id -> unit -> update_cluster_request
val make_ind_tax_documents : ?gsti_n:gsti_n -> unit -> ind_tax_documents
val make_tax_documents : ?in_d:ind_tax_documents -> unit -> tax_documents
val make_snowcone_device_configuration :
  ?wireless_connection:wireless_connection ->
    unit -> snowcone_device_configuration
val make_shipment :
  ?tracking_number:string_ -> ?status:string_ -> unit -> shipment
val make_shipping_details :
  ?outbound_shipment:shipment ->
    ?inbound_shipment:shipment ->
      ?shipping_option:shipping_option -> unit -> shipping_details
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
                      unit -> long_term_pricing_list_entry
val make_dependent_service :
  ?service_version:service_version ->
    ?service_name:service_name -> unit -> dependent_service
val make_list_service_versions_request :
  ?next_token:string_ ->
    ?max_results:list_limit ->
      ?dependent_services:dependent_service_list ->
        service_name:service_name -> unit -> list_service_versions_request
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
                              ?address_id:address_id -> unit -> address
val make_list_pickup_locations_request :
  ?next_token:string_ ->
    ?max_results:list_limit -> unit -> list_pickup_locations_request
val make_list_long_term_pricing_request :
  ?next_token:string_ ->
    ?max_results:list_limit -> unit -> list_long_term_pricing_request
val make_job_list_entry :
  ?description:string_ ->
    ?creation_date:timestamp ->
      ?snowball_type:snowball_type ->
        ?job_type:job_type ->
          ?is_master:boolean_ ->
            ?job_state:job_state -> ?job_id:string_ -> unit -> job_list_entry
val make_list_jobs_request :
  ?next_token:string_ -> ?max_results:list_limit -> unit -> list_jobs_request
val make_compatible_image :
  ?name:string_ -> ?ami_id:string_ -> unit -> compatible_image
val make_list_compatible_images_request :
  ?next_token:string_ ->
    ?max_results:list_limit -> unit -> list_compatible_images_request
val make_cluster_list_entry :
  ?description:string_ ->
    ?creation_date:timestamp ->
      ?cluster_state:cluster_state ->
        ?cluster_id:string_ -> unit -> cluster_list_entry
val make_list_clusters_request :
  ?next_token:string_ ->
    ?max_results:list_limit -> unit -> list_clusters_request
val make_list_cluster_jobs_request :
  ?next_token:string_ ->
    ?max_results:list_limit ->
      cluster_id:cluster_id -> unit -> list_cluster_jobs_request
val make_data_transfer :
  ?total_objects:long ->
    ?total_bytes:long ->
      ?objects_transferred:long ->
        ?bytes_transferred:long -> unit -> data_transfer
val make_job_logs :
  ?job_failure_log_ur_i:string_ ->
    ?job_success_log_ur_i:string_ ->
      ?job_completion_report_ur_i:string_ -> unit -> job_logs
val make_device_configuration :
  ?snowcone_device_configuration:snowcone_device_configuration ->
    unit -> device_configuration
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
                            ?snowball_capacity_preference:snowball_capacity
                              ->
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
                                                    unit -> job_metadata
val make_get_software_updates_request :
  job_id:job_id -> unit -> get_software_updates_request
val make_get_snowball_usage_request : unit -> unit
val make_get_job_unlock_code_request :
  job_id:job_id -> unit -> get_job_unlock_code_request
val make_get_job_manifest_request :
  job_id:job_id -> unit -> get_job_manifest_request
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
                              ?cluster_id:string_ -> unit -> cluster_metadata
val make_describe_cluster_request :
  cluster_id:cluster_id -> unit -> describe_cluster_request
val make_describe_addresses_request :
  ?next_token:string_ ->
    ?max_results:list_limit -> unit -> describe_addresses_request
val make_describe_address_request :
  address_id:address_id -> unit -> describe_address_request
val make_create_return_shipping_label_request :
  ?shipping_option:shipping_option ->
    job_id:job_id -> unit -> create_return_shipping_label_request
val make_create_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:java_boolean ->
    snowball_type:snowball_type ->
      long_term_pricing_type:long_term_pricing_type ->
        unit -> create_long_term_pricing_request
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
                                  ?on_device_service_configuration:on_device_service_configuration
                                    ->
                                    ?resources:job_resource ->
                                      ?job_type:job_type ->
                                        unit -> create_job_request
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
                        ?on_device_service_configuration:on_device_service_configuration
                          ->
                          ?resources:job_resource ->
                            shipping_option:shipping_option ->
                              snowball_type:snowball_type ->
                                address_id:address_id ->
                                  job_type:job_type ->
                                    unit -> create_cluster_request
val make_create_address_request :
  address:address -> unit -> create_address_request
val make_cancel_job_request : job_id:job_id -> unit -> cancel_job_request
val make_cancel_cluster_request :
  cluster_id:cluster_id -> unit -> cancel_cluster_request
(** {1:operations Operations} *)

module CancelCluster :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_cluster_request ->
        (cancel_cluster_result,
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
        (cancel_job_result,
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
      get_snowball_usage_request ->
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
        (update_cluster_result,
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
        (update_job_result,
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
        (update_job_shipment_state_result,
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
        (update_long_term_pricing_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidResourceException of invalid_resource_exception ]) result
end[@@ocaml.doc "Updates the long-term pricing type.\n"](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
