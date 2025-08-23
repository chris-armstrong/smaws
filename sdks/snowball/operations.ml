open Types
open Service_metadata
module CancelCluster =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "KMSRequestFailedException") ->
              `KMSRequestFailedException
                (kms_request_failed_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_cluster_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.cancel_cluster_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceCancelCluster"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_cluster_result_of_yojson
            ~error_deserializer
  end
module CancelJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "KMSRequestFailedException") ->
              `KMSRequestFailedException
                (kms_request_failed_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.cancel_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceCancelJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_job_result_of_yojson
            ~error_deserializer
  end
module CreateAddress =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidAddressException") ->
              `InvalidAddressException
                (invalid_address_exception_of_yojson tree path)
          | (_, "UnsupportedAddressException") ->
              `UnsupportedAddressException
                (unsupported_address_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_address_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_address_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceCreateAddress"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_address_result_of_yojson
            ~error_deserializer
  end
module CreateCluster =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "Ec2RequestFailedException") ->
              `Ec2RequestFailedException
                (ec2_request_failed_exception_of_yojson tree path)
          | (_, "InvalidInputCombinationException") ->
              `InvalidInputCombinationException
                (invalid_input_combination_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "KMSRequestFailedException") ->
              `KMSRequestFailedException
                (kms_request_failed_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_cluster_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_cluster_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceCreateCluster"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_cluster_result_of_yojson
            ~error_deserializer
  end
module CreateJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ClusterLimitExceededException") ->
              `ClusterLimitExceededException
                (cluster_limit_exceeded_exception_of_yojson tree path)
          | (_, "Ec2RequestFailedException") ->
              `Ec2RequestFailedException
                (ec2_request_failed_exception_of_yojson tree path)
          | (_, "InvalidInputCombinationException") ->
              `InvalidInputCombinationException
                (invalid_input_combination_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "KMSRequestFailedException") ->
              `KMSRequestFailedException
                (kms_request_failed_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceCreateJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_job_result_of_yojson
            ~error_deserializer
  end
module CreateLongTermPricing =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_long_term_pricing_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_long_term_pricing_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceCreateLongTermPricing"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_long_term_pricing_result_of_yojson
            ~error_deserializer
  end
module CreateReturnShippingLabel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidInputCombinationException") ->
              `InvalidInputCombinationException
                (invalid_input_combination_exception_of_yojson tree path)
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "ReturnShippingLabelAlreadyExistsException") ->
              `ReturnShippingLabelAlreadyExistsException
                (return_shipping_label_already_exists_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_return_shipping_label_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_return_shipping_label_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceCreateReturnShippingLabel"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_return_shipping_label_result_of_yojson
            ~error_deserializer
  end
module DescribeAddress =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_address_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_address_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceDescribeAddress"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_address_result_of_yojson
            ~error_deserializer
  end
module DescribeAddresses =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_addresses_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_addresses_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceDescribeAddresses"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_addresses_result_of_yojson
            ~error_deserializer
  end
module DescribeCluster =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_cluster_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_cluster_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceDescribeCluster"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_cluster_result_of_yojson
            ~error_deserializer
  end
module DescribeJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceDescribeJob"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_job_result_of_yojson
            ~error_deserializer
  end
module DescribeReturnShippingLabel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_return_shipping_label_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_return_shipping_label_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceDescribeReturnShippingLabel"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_return_shipping_label_result_of_yojson
            ~error_deserializer
  end
module GetJobManifest =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_job_manifest_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_job_manifest_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceGetJobManifest"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_job_manifest_result_of_yojson
            ~error_deserializer
  end
module GetJobUnlockCode =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_job_unlock_code_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_job_unlock_code_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceGetJobUnlockCode"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_job_unlock_code_result_of_yojson
            ~error_deserializer
  end
module GetSnowballUsage =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_snowball_usage_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceGetSnowballUsage"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_snowball_usage_result_of_yojson
            ~error_deserializer
  end
module GetSoftwareUpdates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_software_updates_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_software_updates_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceGetSoftwareUpdates"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_software_updates_result_of_yojson
            ~error_deserializer
  end
module ListClusterJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_cluster_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_cluster_jobs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceListClusterJobs"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_cluster_jobs_result_of_yojson
            ~error_deserializer
  end
module ListClusters =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_clusters_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_clusters_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceListClusters"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_clusters_result_of_yojson
            ~error_deserializer
  end
module ListCompatibleImages =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "Ec2RequestFailedException") ->
              `Ec2RequestFailedException
                (ec2_request_failed_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_compatible_images_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_compatible_images_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceListCompatibleImages"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_compatible_images_result_of_yojson
            ~error_deserializer
  end
module ListJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_jobs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceListJobs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_jobs_result_of_yojson
            ~error_deserializer
  end
module ListLongTermPricing =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_long_term_pricing_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_long_term_pricing_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceListLongTermPricing"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_long_term_pricing_result_of_yojson
            ~error_deserializer
  end
module ListPickupLocations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_pickup_locations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_pickup_locations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceListPickupLocations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_pickup_locations_result_of_yojson
            ~error_deserializer
  end
module ListServiceVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_service_versions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_versions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceListServiceVersions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_versions_result_of_yojson
            ~error_deserializer
  end
module UpdateCluster =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "Ec2RequestFailedException") ->
              `Ec2RequestFailedException
                (ec2_request_failed_exception_of_yojson tree path)
          | (_, "InvalidInputCombinationException") ->
              `InvalidInputCombinationException
                (invalid_input_combination_exception_of_yojson tree path)
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "KMSRequestFailedException") ->
              `KMSRequestFailedException
                (kms_request_failed_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_cluster_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_cluster_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceUpdateCluster"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_cluster_result_of_yojson
            ~error_deserializer
  end
module UpdateJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ClusterLimitExceededException") ->
              `ClusterLimitExceededException
                (cluster_limit_exceeded_exception_of_yojson tree path)
          | (_, "Ec2RequestFailedException") ->
              `Ec2RequestFailedException
                (ec2_request_failed_exception_of_yojson tree path)
          | (_, "InvalidInputCombinationException") ->
              `InvalidInputCombinationException
                (invalid_input_combination_exception_of_yojson tree path)
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "KMSRequestFailedException") ->
              `KMSRequestFailedException
                (kms_request_failed_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceUpdateJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_job_result_of_yojson
            ~error_deserializer
  end
module UpdateJobShipmentState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidJobStateException") ->
              `InvalidJobStateException
                (invalid_job_state_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_job_shipment_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_job_shipment_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceUpdateJobShipmentState"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_job_shipment_state_result_of_yojson
            ~error_deserializer
  end
module UpdateLongTermPricing =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_long_term_pricing_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_long_term_pricing_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSIESnowballJobManagementServiceUpdateLongTermPricing"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_long_term_pricing_result_of_yojson
            ~error_deserializer
  end