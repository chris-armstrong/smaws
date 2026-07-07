open Types
open Service_metadata

module AddAssociation = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_association_request) =
    let input = Json_serializers.add_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.AddAssociation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_association_request) =
    let input = Json_serializers.add_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.AddAssociation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_association_response_of_yojson ~error_deserializer
end

module AddTags = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.AddTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.AddTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.add_tags_output_of_yojson
      ~error_deserializer
end

module AssociateTrialComponent = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_trial_component_request) =
    let input = Json_serializers.associate_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.AssociateTrialComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_trial_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_trial_component_request) =
    let input = Json_serializers.associate_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.AssociateTrialComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_trial_component_response_of_yojson
      ~error_deserializer
end

module AttachClusterNodeVolume = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_cluster_node_volume_request) =
    let input = Json_serializers.attach_cluster_node_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.AttachClusterNodeVolume" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.attach_cluster_node_volume_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : attach_cluster_node_volume_request) =
    let input = Json_serializers.attach_cluster_node_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.AttachClusterNodeVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.attach_cluster_node_volume_response_of_yojson
      ~error_deserializer
end

module BatchAddClusterNodes = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_add_cluster_nodes_request) =
    let input = Json_serializers.batch_add_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.BatchAddClusterNodes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_add_cluster_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_add_cluster_nodes_request) =
    let input = Json_serializers.batch_add_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.BatchAddClusterNodes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_add_cluster_nodes_response_of_yojson
      ~error_deserializer
end

module BatchDeleteClusterNodes = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_cluster_nodes_request) =
    let input = Json_serializers.batch_delete_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.BatchDeleteClusterNodes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_cluster_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_cluster_nodes_request) =
    let input = Json_serializers.batch_delete_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.BatchDeleteClusterNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_cluster_nodes_response_of_yojson
      ~error_deserializer
end

module BatchDescribeModelPackage = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_describe_model_package_input) =
    let input = Json_serializers.batch_describe_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.BatchDescribeModelPackage" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_describe_model_package_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_describe_model_package_input) =
    let input = Json_serializers.batch_describe_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.BatchDescribeModelPackage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_describe_model_package_output_of_yojson
      ~error_deserializer
end

module BatchRebootClusterNodes = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_reboot_cluster_nodes_request) =
    let input = Json_serializers.batch_reboot_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.BatchRebootClusterNodes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_reboot_cluster_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_reboot_cluster_nodes_request) =
    let input = Json_serializers.batch_reboot_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.BatchRebootClusterNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_reboot_cluster_nodes_response_of_yojson
      ~error_deserializer
end

module BatchReplaceClusterNodes = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_replace_cluster_nodes_request) =
    let input = Json_serializers.batch_replace_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.BatchReplaceClusterNodes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_replace_cluster_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_replace_cluster_nodes_request) =
    let input = Json_serializers.batch_replace_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.BatchReplaceClusterNodes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_replace_cluster_nodes_response_of_yojson
      ~error_deserializer
end

module CreateAction = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_action_request) =
    let input = Json_serializers.create_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAction" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_action_request) =
    let input = Json_serializers.create_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateAction" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_action_response_of_yojson
      ~error_deserializer
end

module CreateAIBenchmarkJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ai_benchmark_job_request) =
    let input = Json_serializers.create_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAIBenchmarkJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_ai_benchmark_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ai_benchmark_job_request) =
    let input = Json_serializers.create_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateAIBenchmarkJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ai_benchmark_job_response_of_yojson
      ~error_deserializer
end

module CreateAIRecommendationJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ai_recommendation_job_request) =
    let input = Json_serializers.create_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAIRecommendationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_ai_recommendation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ai_recommendation_job_request) =
    let input = Json_serializers.create_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateAIRecommendationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ai_recommendation_job_response_of_yojson
      ~error_deserializer
end

module CreateAIWorkloadConfig = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ai_workload_config_request) =
    let input = Json_serializers.create_ai_workload_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAIWorkloadConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_ai_workload_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ai_workload_config_request) =
    let input = Json_serializers.create_ai_workload_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateAIWorkloadConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ai_workload_config_response_of_yojson
      ~error_deserializer
end

module CreateAlgorithm = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_algorithm_input) =
    let input = Json_serializers.create_algorithm_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAlgorithm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_algorithm_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_algorithm_input) =
    let input = Json_serializers.create_algorithm_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateAlgorithm"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_algorithm_output_of_yojson ~error_deserializer
end

module CreateApp = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_app_request) =
    let input = Json_serializers.create_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateApp" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_app_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_app_request) =
    let input = Json_serializers.create_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateApp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_app_response_of_yojson
      ~error_deserializer
end

module CreateAppImageConfig = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_app_image_config_request) =
    let input = Json_serializers.create_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAppImageConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_app_image_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_app_image_config_request) =
    let input = Json_serializers.create_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateAppImageConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_app_image_config_response_of_yojson
      ~error_deserializer
end

module CreateArtifact = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_artifact_request) =
    let input = Json_serializers.create_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateArtifact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_artifact_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_artifact_request) =
    let input = Json_serializers.create_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateArtifact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_artifact_response_of_yojson ~error_deserializer
end

module CreateAutoMLJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_auto_ml_job_request) =
    let input = Json_serializers.create_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAutoMLJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_auto_ml_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_auto_ml_job_request) =
    let input = Json_serializers.create_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateAutoMLJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_auto_ml_job_response_of_yojson
      ~error_deserializer
end

module CreateAutoMLJobV2 = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_auto_ml_job_v2_request) =
    let input = Json_serializers.create_auto_ml_job_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateAutoMLJobV2" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_auto_ml_job_v2_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_auto_ml_job_v2_request) =
    let input = Json_serializers.create_auto_ml_job_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateAutoMLJobV2"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_auto_ml_job_v2_response_of_yojson
      ~error_deserializer
end

module CreateCluster = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson
      ~error_deserializer
end

module CreateClusterSchedulerConfig = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cluster_scheduler_config_request) =
    let input = Json_serializers.create_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateClusterSchedulerConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_scheduler_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cluster_scheduler_config_request) =
    let input = Json_serializers.create_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateClusterSchedulerConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_scheduler_config_response_of_yojson
      ~error_deserializer
end

module CreateCodeRepository = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_code_repository_input) =
    let input = Json_serializers.create_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateCodeRepository" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_code_repository_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_code_repository_input) =
    let input = Json_serializers.create_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateCodeRepository"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_code_repository_output_of_yojson
      ~error_deserializer
end

module CreateCompilationJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_compilation_job_request) =
    let input = Json_serializers.create_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateCompilationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_compilation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_compilation_job_request) =
    let input = Json_serializers.create_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateCompilationJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_compilation_job_response_of_yojson
      ~error_deserializer
end

module CreateComputeQuota = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_compute_quota_request) =
    let input = Json_serializers.create_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateComputeQuota" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_compute_quota_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_compute_quota_request) =
    let input = Json_serializers.create_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateComputeQuota"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_compute_quota_response_of_yojson
      ~error_deserializer
end

module CreateContext = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_context_request) =
    let input = Json_serializers.create_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateContext" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_context_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_context_request) =
    let input = Json_serializers.create_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateContext" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_context_response_of_yojson
      ~error_deserializer
end

module CreateDataQualityJobDefinition = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_quality_job_definition_request) =
    let input = Json_serializers.create_data_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateDataQualityJobDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_quality_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_quality_job_definition_request) =
    let input = Json_serializers.create_data_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateDataQualityJobDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_quality_job_definition_response_of_yojson
      ~error_deserializer
end

module CreateDeviceFleet = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_device_fleet_request) =
    let input = Json_serializers.create_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateDeviceFleet" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_device_fleet_request) =
    let input = Json_serializers.create_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateDeviceFleet"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateDomain = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_domain_request) =
    let input = Json_serializers.create_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateDomain" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_domain_request) =
    let input = Json_serializers.create_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_domain_response_of_yojson
      ~error_deserializer
end

module CreateEdgeDeploymentPlan = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_edge_deployment_plan_request) =
    let input = Json_serializers.create_edge_deployment_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateEdgeDeploymentPlan" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_edge_deployment_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_edge_deployment_plan_request) =
    let input = Json_serializers.create_edge_deployment_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateEdgeDeploymentPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_edge_deployment_plan_response_of_yojson
      ~error_deserializer
end

module CreateEdgeDeploymentStage = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_edge_deployment_stage_request) =
    let input = Json_serializers.create_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateEdgeDeploymentStage" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_edge_deployment_stage_request) =
    let input = Json_serializers.create_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateEdgeDeploymentStage" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateEdgePackagingJob = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_edge_packaging_job_request) =
    let input = Json_serializers.create_edge_packaging_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateEdgePackagingJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_edge_packaging_job_request) =
    let input = Json_serializers.create_edge_packaging_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateEdgePackagingJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateEndpoint = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_endpoint_input) =
    let input = Json_serializers.create_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_endpoint_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_endpoint_input) =
    let input = Json_serializers.create_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_output_of_yojson ~error_deserializer
end

module CreateEndpointConfig = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_endpoint_config_input) =
    let input = Json_serializers.create_endpoint_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateEndpointConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_endpoint_config_input) =
    let input = Json_serializers.create_endpoint_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateEndpointConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_config_output_of_yojson
      ~error_deserializer
end

module CreateExperiment = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_experiment_request) =
    let input = Json_serializers.create_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateExperiment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_experiment_request) =
    let input = Json_serializers.create_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateExperiment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_experiment_response_of_yojson
      ~error_deserializer
end

module CreateFeatureGroup = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_feature_group_request) =
    let input = Json_serializers.create_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateFeatureGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_feature_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_feature_group_request) =
    let input = Json_serializers.create_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateFeatureGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_feature_group_response_of_yojson
      ~error_deserializer
end

module CreateFlowDefinition = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_flow_definition_request) =
    let input = Json_serializers.create_flow_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateFlowDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_flow_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_flow_definition_request) =
    let input = Json_serializers.create_flow_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateFlowDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_flow_definition_response_of_yojson
      ~error_deserializer
end

module CreateHub = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hub_request) =
    let input = Json_serializers.create_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateHub" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hub_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_hub_request) =
    let input = Json_serializers.create_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateHub" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_hub_response_of_yojson
      ~error_deserializer
end

module CreateHubContentPresignedUrls = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hub_content_presigned_urls_request) =
    let input = Json_serializers.create_hub_content_presigned_urls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateHubContentPresignedUrls"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hub_content_presigned_urls_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hub_content_presigned_urls_request) =
    let input = Json_serializers.create_hub_content_presigned_urls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateHubContentPresignedUrls" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hub_content_presigned_urls_response_of_yojson
      ~error_deserializer
end

module CreateHubContentReference = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hub_content_reference_request) =
    let input = Json_serializers.create_hub_content_reference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateHubContentReference" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_hub_content_reference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hub_content_reference_request) =
    let input = Json_serializers.create_hub_content_reference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateHubContentReference" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hub_content_reference_response_of_yojson
      ~error_deserializer
end

module CreateHumanTaskUi = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_human_task_ui_request) =
    let input = Json_serializers.create_human_task_ui_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateHumanTaskUi" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_human_task_ui_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_human_task_ui_request) =
    let input = Json_serializers.create_human_task_ui_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateHumanTaskUi"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_human_task_ui_response_of_yojson
      ~error_deserializer
end

module CreateHyperParameterTuningJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.create_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateHyperParameterTuningJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hyper_parameter_tuning_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.create_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateHyperParameterTuningJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hyper_parameter_tuning_job_response_of_yojson
      ~error_deserializer
end

module CreateImage = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_image_request) =
    let input = Json_serializers.create_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_image_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_image_request) =
    let input = Json_serializers.create_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_image_response_of_yojson
      ~error_deserializer
end

module CreateImageVersion = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_image_version_request) =
    let input = Json_serializers.create_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateImageVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_image_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_image_version_request) =
    let input = Json_serializers.create_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateImageVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_image_version_response_of_yojson
      ~error_deserializer
end

module CreateInferenceComponent = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_inference_component_input) =
    let input = Json_serializers.create_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateInferenceComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_inference_component_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_inference_component_input) =
    let input = Json_serializers.create_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateInferenceComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_inference_component_output_of_yojson
      ~error_deserializer
end

module CreateInferenceExperiment = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_inference_experiment_request) =
    let input = Json_serializers.create_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateInferenceExperiment" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_inference_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_inference_experiment_request) =
    let input = Json_serializers.create_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateInferenceExperiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_inference_experiment_response_of_yojson
      ~error_deserializer
end

module CreateInferenceRecommendationsJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_inference_recommendations_job_request) =
    let input = Json_serializers.create_inference_recommendations_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateInferenceRecommendationsJob"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_inference_recommendations_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_inference_recommendations_job_request) =
    let input = Json_serializers.create_inference_recommendations_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateInferenceRecommendationsJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_inference_recommendations_job_response_of_yojson
      ~error_deserializer
end

module CreateJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_job_request) =
    let input = Json_serializers.create_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_job_request) =
    let input = Json_serializers.create_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_job_response_of_yojson
      ~error_deserializer
end

module CreateLabelingJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_labeling_job_request) =
    let input = Json_serializers.create_labeling_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateLabelingJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_labeling_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_labeling_job_request) =
    let input = Json_serializers.create_labeling_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateLabelingJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_labeling_job_response_of_yojson
      ~error_deserializer
end

module CreateMlflowApp = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_mlflow_app_request) =
    let input = Json_serializers.create_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateMlflowApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_mlflow_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_mlflow_app_request) =
    let input = Json_serializers.create_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateMlflowApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_mlflow_app_response_of_yojson
      ~error_deserializer
end

module CreateMlflowTrackingServer = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_mlflow_tracking_server_request) =
    let input = Json_serializers.create_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateMlflowTrackingServer" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_mlflow_tracking_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_mlflow_tracking_server_request) =
    let input = Json_serializers.create_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateMlflowTrackingServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_mlflow_tracking_server_response_of_yojson
      ~error_deserializer
end

module CreateModel = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_input) =
    let input = Json_serializers.create_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_model_input) =
    let input = Json_serializers.create_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_model_output_of_yojson
      ~error_deserializer
end

module CreateModelBiasJobDefinition = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_bias_job_definition_request) =
    let input = Json_serializers.create_model_bias_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateModelBiasJobDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_bias_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_bias_job_definition_request) =
    let input = Json_serializers.create_model_bias_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateModelBiasJobDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_bias_job_definition_response_of_yojson
      ~error_deserializer
end

module CreateModelCard = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_card_request) =
    let input = Json_serializers.create_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateModelCard" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_model_card_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_card_request) =
    let input = Json_serializers.create_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateModelCard"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_card_response_of_yojson
      ~error_deserializer
end

module CreateModelCardExportJob = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_card_export_job_request) =
    let input = Json_serializers.create_model_card_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateModelCardExportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_model_card_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_card_export_job_request) =
    let input = Json_serializers.create_model_card_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateModelCardExportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_card_export_job_response_of_yojson
      ~error_deserializer
end

module CreateModelExplainabilityJobDefinition = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_explainability_job_definition_request) =
    let input =
      Json_serializers.create_model_explainability_job_definition_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.CreateModelExplainabilityJobDefinition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_model_explainability_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_explainability_job_definition_request) =
    let input =
      Json_serializers.create_model_explainability_job_definition_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateModelExplainabilityJobDefinition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_model_explainability_job_definition_response_of_yojson
      ~error_deserializer
end

module CreateModelPackage = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_package_input) =
    let input = Json_serializers.create_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateModelPackage" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_model_package_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_package_input) =
    let input = Json_serializers.create_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateModelPackage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_package_output_of_yojson
      ~error_deserializer
end

module CreateModelPackageGroup = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_package_group_input) =
    let input = Json_serializers.create_model_package_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateModelPackageGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_model_package_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_package_group_input) =
    let input = Json_serializers.create_model_package_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateModelPackageGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_package_group_output_of_yojson
      ~error_deserializer
end

module CreateModelQualityJobDefinition = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_model_quality_job_definition_request) =
    let input = Json_serializers.create_model_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateModelQualityJobDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_quality_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_quality_job_definition_request) =
    let input = Json_serializers.create_model_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateModelQualityJobDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_quality_job_definition_response_of_yojson
      ~error_deserializer
end

module CreateMonitoringSchedule = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_monitoring_schedule_request) =
    let input = Json_serializers.create_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateMonitoringSchedule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_monitoring_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_monitoring_schedule_request) =
    let input = Json_serializers.create_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateMonitoringSchedule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_monitoring_schedule_response_of_yojson
      ~error_deserializer
end

module CreateNotebookInstance = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_notebook_instance_input) =
    let input = Json_serializers.create_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateNotebookInstance" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_notebook_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_notebook_instance_input) =
    let input = Json_serializers.create_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateNotebookInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_notebook_instance_output_of_yojson
      ~error_deserializer
end

module CreateNotebookInstanceLifecycleConfig = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.create_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.CreateNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_notebook_instance_lifecycle_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.create_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_notebook_instance_lifecycle_config_output_of_yojson
      ~error_deserializer
end

module CreateOptimizationJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_optimization_job_request) =
    let input = Json_serializers.create_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateOptimizationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_optimization_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_optimization_job_request) =
    let input = Json_serializers.create_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateOptimizationJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_optimization_job_response_of_yojson
      ~error_deserializer
end

module CreatePartnerApp = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_partner_app_request) =
    let input = Json_serializers.create_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreatePartnerApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_partner_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_partner_app_request) =
    let input = Json_serializers.create_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreatePartnerApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_partner_app_response_of_yojson
      ~error_deserializer
end

module CreatePartnerAppPresignedUrl = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_partner_app_presigned_url_request) =
    let input = Json_serializers.create_partner_app_presigned_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreatePartnerAppPresignedUrl"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_partner_app_presigned_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_partner_app_presigned_url_request) =
    let input = Json_serializers.create_partner_app_presigned_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreatePartnerAppPresignedUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_partner_app_presigned_url_response_of_yojson
      ~error_deserializer
end

module CreatePipeline = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_pipeline_request) =
    let input = Json_serializers.create_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreatePipeline" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_pipeline_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_pipeline_request) =
    let input = Json_serializers.create_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreatePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_pipeline_response_of_yojson ~error_deserializer
end

module CreatePresignedDomainUrl = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_presigned_domain_url_request) =
    let input = Json_serializers.create_presigned_domain_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreatePresignedDomainUrl" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_presigned_domain_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_presigned_domain_url_request) =
    let input = Json_serializers.create_presigned_domain_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreatePresignedDomainUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_presigned_domain_url_response_of_yojson
      ~error_deserializer
end

module CreatePresignedMlflowAppUrl = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_presigned_mlflow_app_url_request) =
    let input = Json_serializers.create_presigned_mlflow_app_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreatePresignedMlflowAppUrl" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_presigned_mlflow_app_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_presigned_mlflow_app_url_request) =
    let input = Json_serializers.create_presigned_mlflow_app_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreatePresignedMlflowAppUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_presigned_mlflow_app_url_response_of_yojson
      ~error_deserializer
end

module CreatePresignedMlflowTrackingServerUrl = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_presigned_mlflow_tracking_server_url_request) =
    let input =
      Json_serializers.create_presigned_mlflow_tracking_server_url_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.CreatePresignedMlflowTrackingServerUrl" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_presigned_mlflow_tracking_server_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_presigned_mlflow_tracking_server_url_request)
      =
    let input =
      Json_serializers.create_presigned_mlflow_tracking_server_url_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreatePresignedMlflowTrackingServerUrl" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_presigned_mlflow_tracking_server_url_response_of_yojson
      ~error_deserializer
end

module CreatePresignedNotebookInstanceUrl = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_presigned_notebook_instance_url_input) =
    let input = Json_serializers.create_presigned_notebook_instance_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreatePresignedNotebookInstanceUrl"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_presigned_notebook_instance_url_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_presigned_notebook_instance_url_input) =
    let input = Json_serializers.create_presigned_notebook_instance_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreatePresignedNotebookInstanceUrl" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_presigned_notebook_instance_url_output_of_yojson
      ~error_deserializer
end

module CreateProcessingJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_processing_job_request) =
    let input = Json_serializers.create_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateProcessingJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_processing_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_processing_job_request) =
    let input = Json_serializers.create_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateProcessingJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_processing_job_response_of_yojson
      ~error_deserializer
end

module CreateProject = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_project_input) =
    let input = Json_serializers.create_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateProject" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_project_input) =
    let input = Json_serializers.create_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_project_output_of_yojson
      ~error_deserializer
end

module CreateSpace = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_space_request) =
    let input = Json_serializers.create_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateSpace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_space_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_space_request) =
    let input = Json_serializers.create_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateSpace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_space_response_of_yojson
      ~error_deserializer
end

module CreateStudioLifecycleConfig = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_studio_lifecycle_config_request) =
    let input = Json_serializers.create_studio_lifecycle_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateStudioLifecycleConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_studio_lifecycle_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_studio_lifecycle_config_request) =
    let input = Json_serializers.create_studio_lifecycle_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.CreateStudioLifecycleConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_studio_lifecycle_config_response_of_yojson
      ~error_deserializer
end

module CreateTrainingJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_training_job_request) =
    let input = Json_serializers.create_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateTrainingJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_training_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_training_job_request) =
    let input = Json_serializers.create_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateTrainingJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_training_job_response_of_yojson
      ~error_deserializer
end

module CreateTrainingPlan = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_training_plan_request) =
    let input = Json_serializers.create_training_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateTrainingPlan" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_training_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_training_plan_request) =
    let input = Json_serializers.create_training_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateTrainingPlan"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_training_plan_response_of_yojson
      ~error_deserializer
end

module CreateTransformJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_transform_job_request) =
    let input = Json_serializers.create_transform_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateTransformJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_transform_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_transform_job_request) =
    let input = Json_serializers.create_transform_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateTransformJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_transform_job_response_of_yojson
      ~error_deserializer
end

module CreateTrial = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_trial_request) =
    let input = Json_serializers.create_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateTrial" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_trial_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_trial_request) =
    let input = Json_serializers.create_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateTrial" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_trial_response_of_yojson
      ~error_deserializer
end

module CreateTrialComponent = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_trial_component_request) =
    let input = Json_serializers.create_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateTrialComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_trial_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_trial_component_request) =
    let input = Json_serializers.create_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateTrialComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_trial_component_response_of_yojson
      ~error_deserializer
end

module CreateUserProfile = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_profile_request) =
    let input = Json_serializers.create_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateUserProfile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_user_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_profile_request) =
    let input = Json_serializers.create_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateUserProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_profile_response_of_yojson
      ~error_deserializer
end

module CreateWorkforce = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workforce_request) =
    let input = Json_serializers.create_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateWorkforce" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_workforce_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workforce_request) =
    let input = Json_serializers.create_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateWorkforce"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workforce_response_of_yojson
      ~error_deserializer
end

module CreateWorkteam = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workteam_request) =
    let input = Json_serializers.create_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.CreateWorkteam" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_workteam_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workteam_request) =
    let input = Json_serializers.create_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.CreateWorkteam"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workteam_response_of_yojson ~error_deserializer
end

module DeleteAction = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_action_request) =
    let input = Json_serializers.delete_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteAction" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_action_request) =
    let input = Json_serializers.delete_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteAction" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_action_response_of_yojson
      ~error_deserializer
end

module DeleteAIBenchmarkJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ai_benchmark_job_request) =
    let input = Json_serializers.delete_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteAIBenchmarkJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_ai_benchmark_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ai_benchmark_job_request) =
    let input = Json_serializers.delete_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteAIBenchmarkJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ai_benchmark_job_response_of_yojson
      ~error_deserializer
end

module DeleteAIRecommendationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ai_recommendation_job_request) =
    let input = Json_serializers.delete_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteAIRecommendationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_ai_recommendation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ai_recommendation_job_request) =
    let input = Json_serializers.delete_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteAIRecommendationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ai_recommendation_job_response_of_yojson
      ~error_deserializer
end

module DeleteAIWorkloadConfig = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ai_workload_config_request) =
    let input = Json_serializers.delete_ai_workload_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteAIWorkloadConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_ai_workload_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ai_workload_config_request) =
    let input = Json_serializers.delete_ai_workload_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteAIWorkloadConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ai_workload_config_response_of_yojson
      ~error_deserializer
end

module DeleteAlgorithm = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_algorithm_input) =
    let input = Json_serializers.delete_algorithm_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteAlgorithm" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_algorithm_input) =
    let input = Json_serializers.delete_algorithm_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteAlgorithm"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteApp = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_app_request) =
    let input = Json_serializers.delete_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteApp" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_app_request) =
    let input = Json_serializers.delete_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteApp" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteAppImageConfig = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_app_image_config_request) =
    let input = Json_serializers.delete_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteAppImageConfig" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_app_image_config_request) =
    let input = Json_serializers.delete_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteAppImageConfig"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteArtifact = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_artifact_request) =
    let input = Json_serializers.delete_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteArtifact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_artifact_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_artifact_request) =
    let input = Json_serializers.delete_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteArtifact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_artifact_response_of_yojson ~error_deserializer
end

module DeleteAssociation = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_association_request) =
    let input = Json_serializers.delete_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteAssociation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_association_request) =
    let input = Json_serializers.delete_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteAssociation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_association_response_of_yojson
      ~error_deserializer
end

module DeleteCluster = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson
      ~error_deserializer
end

module DeleteClusterSchedulerConfig = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cluster_scheduler_config_request) =
    let input = Json_serializers.delete_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteClusterSchedulerConfig"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cluster_scheduler_config_request) =
    let input = Json_serializers.delete_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteClusterSchedulerConfig" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCodeRepository = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_code_repository_input) =
    let input = Json_serializers.delete_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteCodeRepository" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_code_repository_input) =
    let input = Json_serializers.delete_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteCodeRepository"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCompilationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_compilation_job_request) =
    let input = Json_serializers.delete_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteCompilationJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_compilation_job_request) =
    let input = Json_serializers.delete_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteCompilationJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteComputeQuota = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_compute_quota_request) =
    let input = Json_serializers.delete_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteComputeQuota" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_compute_quota_request) =
    let input = Json_serializers.delete_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteComputeQuota"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteContext = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_context_request) =
    let input = Json_serializers.delete_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteContext" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_context_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_context_request) =
    let input = Json_serializers.delete_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteContext" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_context_response_of_yojson
      ~error_deserializer
end

module DeleteDataQualityJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_data_quality_job_definition_request) =
    let input = Json_serializers.delete_data_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteDataQualityJobDefinition"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_quality_job_definition_request) =
    let input = Json_serializers.delete_data_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteDataQualityJobDefinition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDeviceFleet = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_device_fleet_request) =
    let input = Json_serializers.delete_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteDeviceFleet" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_device_fleet_request) =
    let input = Json_serializers.delete_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteDeviceFleet"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDomain = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_domain_request) =
    let input = Json_serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteDomain" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_domain_request) =
    let input = Json_serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteDomain" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteEdgeDeploymentPlan = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_edge_deployment_plan_request) =
    let input = Json_serializers.delete_edge_deployment_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteEdgeDeploymentPlan" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_edge_deployment_plan_request) =
    let input = Json_serializers.delete_edge_deployment_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteEdgeDeploymentPlan" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteEdgeDeploymentStage = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_edge_deployment_stage_request) =
    let input = Json_serializers.delete_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteEdgeDeploymentStage" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_edge_deployment_stage_request) =
    let input = Json_serializers.delete_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteEdgeDeploymentStage" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteEndpoint = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_endpoint_input) =
    let input = Json_serializers.delete_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteEndpoint" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_input) =
    let input = Json_serializers.delete_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteEndpoint"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteEndpointConfig = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_endpoint_config_input) =
    let input = Json_serializers.delete_endpoint_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteEndpointConfig" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_config_input) =
    let input = Json_serializers.delete_endpoint_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteEndpointConfig"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteExperiment = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_experiment_request) =
    let input = Json_serializers.delete_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteExperiment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_experiment_request) =
    let input = Json_serializers.delete_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteExperiment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_experiment_response_of_yojson
      ~error_deserializer
end

module DeleteFeatureGroup = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_feature_group_request) =
    let input = Json_serializers.delete_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteFeatureGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_feature_group_request) =
    let input = Json_serializers.delete_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteFeatureGroup"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteFlowDefinition = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_flow_definition_request) =
    let input = Json_serializers.delete_flow_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteFlowDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_flow_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_flow_definition_request) =
    let input = Json_serializers.delete_flow_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteFlowDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_flow_definition_response_of_yojson
      ~error_deserializer
end

module DeleteHub = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hub_request) =
    let input = Json_serializers.delete_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteHub" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hub_request) =
    let input = Json_serializers.delete_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteHub" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteHubContent = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hub_content_request) =
    let input = Json_serializers.delete_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteHubContent" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hub_content_request) =
    let input = Json_serializers.delete_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteHubContent"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteHubContentReference = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hub_content_reference_request) =
    let input = Json_serializers.delete_hub_content_reference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteHubContentReference" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hub_content_reference_request) =
    let input = Json_serializers.delete_hub_content_reference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteHubContentReference" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteHumanTaskUi = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_human_task_ui_request) =
    let input = Json_serializers.delete_human_task_ui_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteHumanTaskUi" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_human_task_ui_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_human_task_ui_request) =
    let input = Json_serializers.delete_human_task_ui_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteHumanTaskUi"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_human_task_ui_response_of_yojson
      ~error_deserializer
end

module DeleteHyperParameterTuningJob = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.delete_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteHyperParameterTuningJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.delete_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteHyperParameterTuningJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteImage = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_image_request) =
    let input = Json_serializers.delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_image_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_image_request) =
    let input = Json_serializers.delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_image_response_of_yojson
      ~error_deserializer
end

module DeleteImageVersion = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_image_version_request) =
    let input = Json_serializers.delete_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteImageVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_image_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_image_version_request) =
    let input = Json_serializers.delete_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteImageVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_image_version_response_of_yojson
      ~error_deserializer
end

module DeleteInferenceComponent = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_inference_component_input) =
    let input = Json_serializers.delete_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteInferenceComponent" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_inference_component_input) =
    let input = Json_serializers.delete_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteInferenceComponent" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteInferenceExperiment = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_inference_experiment_request) =
    let input = Json_serializers.delete_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteInferenceExperiment" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_inference_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_inference_experiment_request) =
    let input = Json_serializers.delete_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteInferenceExperiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_inference_experiment_response_of_yojson
      ~error_deserializer
end

module DeleteJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_job_request) =
    let input = Json_serializers.delete_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_job_request) =
    let input = Json_serializers.delete_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_job_response_of_yojson
      ~error_deserializer
end

module DeleteMlflowApp = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_mlflow_app_request) =
    let input = Json_serializers.delete_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteMlflowApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_mlflow_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_mlflow_app_request) =
    let input = Json_serializers.delete_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteMlflowApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_mlflow_app_response_of_yojson
      ~error_deserializer
end

module DeleteMlflowTrackingServer = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_mlflow_tracking_server_request) =
    let input = Json_serializers.delete_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteMlflowTrackingServer" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_mlflow_tracking_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_mlflow_tracking_server_request) =
    let input = Json_serializers.delete_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteMlflowTrackingServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_mlflow_tracking_server_response_of_yojson
      ~error_deserializer
end

module DeleteModel = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_input) =
    let input = Json_serializers.delete_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteModel" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_input) =
    let input = Json_serializers.delete_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteModel" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModelBiasJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_bias_job_definition_request) =
    let input = Json_serializers.delete_model_bias_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteModelBiasJobDefinition"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_bias_job_definition_request) =
    let input = Json_serializers.delete_model_bias_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteModelBiasJobDefinition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModelCard = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_card_request) =
    let input = Json_serializers.delete_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteModelCard" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_card_request) =
    let input = Json_serializers.delete_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteModelCard"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModelExplainabilityJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_explainability_job_definition_request) =
    let input =
      Json_serializers.delete_model_explainability_job_definition_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.DeleteModelExplainabilityJobDefinition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_explainability_job_definition_request) =
    let input =
      Json_serializers.delete_model_explainability_job_definition_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteModelExplainabilityJobDefinition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModelPackage = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_package_input) =
    let input = Json_serializers.delete_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteModelPackage" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_package_input) =
    let input = Json_serializers.delete_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteModelPackage"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModelPackageGroup = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_package_group_input) =
    let input = Json_serializers.delete_model_package_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteModelPackageGroup" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_package_group_input) =
    let input = Json_serializers.delete_model_package_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteModelPackageGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModelPackageGroupPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_package_group_policy_input) =
    let input = Json_serializers.delete_model_package_group_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteModelPackageGroupPolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_package_group_policy_input) =
    let input = Json_serializers.delete_model_package_group_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteModelPackageGroupPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModelQualityJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_quality_job_definition_request) =
    let input = Json_serializers.delete_model_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteModelQualityJobDefinition"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_quality_job_definition_request) =
    let input = Json_serializers.delete_model_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteModelQualityJobDefinition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMonitoringSchedule = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_monitoring_schedule_request) =
    let input = Json_serializers.delete_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteMonitoringSchedule" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_monitoring_schedule_request) =
    let input = Json_serializers.delete_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteMonitoringSchedule" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteNotebookInstance = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_notebook_instance_input) =
    let input = Json_serializers.delete_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteNotebookInstance" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_notebook_instance_input) =
    let input = Json_serializers.delete_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteNotebookInstance"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteNotebookInstanceLifecycleConfig = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.delete_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.DeleteNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.delete_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteOptimizationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_optimization_job_request) =
    let input = Json_serializers.delete_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteOptimizationJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_optimization_job_request) =
    let input = Json_serializers.delete_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteOptimizationJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePartnerApp = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_partner_app_request) =
    let input = Json_serializers.delete_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeletePartnerApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_partner_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_partner_app_request) =
    let input = Json_serializers.delete_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeletePartnerApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_partner_app_response_of_yojson
      ~error_deserializer
end

module DeletePipeline = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_pipeline_request) =
    let input = Json_serializers.delete_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeletePipeline" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_pipeline_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_pipeline_request) =
    let input = Json_serializers.delete_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeletePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_pipeline_response_of_yojson ~error_deserializer
end

module DeleteProcessingJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_processing_job_request) =
    let input = Json_serializers.delete_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteProcessingJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_processing_job_request) =
    let input = Json_serializers.delete_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteProcessingJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteProject = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_project_input) =
    let input = Json_serializers.delete_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteProject" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_project_input) =
    let input = Json_serializers.delete_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteProject" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSpace = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_space_request) =
    let input = Json_serializers.delete_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteSpace" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_space_request) =
    let input = Json_serializers.delete_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteSpace" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteStudioLifecycleConfig = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_studio_lifecycle_config_request) =
    let input = Json_serializers.delete_studio_lifecycle_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteStudioLifecycleConfig" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_studio_lifecycle_config_request) =
    let input = Json_serializers.delete_studio_lifecycle_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DeleteStudioLifecycleConfig" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteTags = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tags_input) =
    let input = Json_serializers.delete_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_tags_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_tags_input) =
    let input = Json_serializers.delete_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_tags_output_of_yojson
      ~error_deserializer
end

module DeleteTrainingJob = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_training_job_request) =
    let input = Json_serializers.delete_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteTrainingJob" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_training_job_request) =
    let input = Json_serializers.delete_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteTrainingJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteTrial = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_trial_request) =
    let input = Json_serializers.delete_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteTrial" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_trial_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_trial_request) =
    let input = Json_serializers.delete_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteTrial" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_trial_response_of_yojson
      ~error_deserializer
end

module DeleteTrialComponent = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_trial_component_request) =
    let input = Json_serializers.delete_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteTrialComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_trial_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_trial_component_request) =
    let input = Json_serializers.delete_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteTrialComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_trial_component_response_of_yojson
      ~error_deserializer
end

module DeleteUserProfile = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_profile_request) =
    let input = Json_serializers.delete_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteUserProfile" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_profile_request) =
    let input = Json_serializers.delete_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteUserProfile"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWorkforce = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workforce_request) =
    let input = Json_serializers.delete_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteWorkforce" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_workforce_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workforce_request) =
    let input = Json_serializers.delete_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteWorkforce"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workforce_response_of_yojson
      ~error_deserializer
end

module DeleteWorkteam = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workteam_request) =
    let input = Json_serializers.delete_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeleteWorkteam" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_workteam_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workteam_request) =
    let input = Json_serializers.delete_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeleteWorkteam"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workteam_response_of_yojson ~error_deserializer
end

module DeregisterDevices = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_devices_request) =
    let input = Json_serializers.deregister_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DeregisterDevices" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_devices_request) =
    let input = Json_serializers.deregister_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DeregisterDevices"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeAction = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_action_request) =
    let input = Json_serializers.describe_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAction" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_action_request) =
    let input = Json_serializers.describe_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_action_response_of_yojson ~error_deserializer
end

module DescribeAIBenchmarkJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ai_benchmark_job_request) =
    let input = Json_serializers.describe_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAIBenchmarkJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_ai_benchmark_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_ai_benchmark_job_request) =
    let input = Json_serializers.describe_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeAIBenchmarkJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_ai_benchmark_job_response_of_yojson
      ~error_deserializer
end

module DescribeAIRecommendationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ai_recommendation_job_request) =
    let input = Json_serializers.describe_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAIRecommendationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_ai_recommendation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_ai_recommendation_job_request) =
    let input = Json_serializers.describe_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeAIRecommendationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_ai_recommendation_job_response_of_yojson
      ~error_deserializer
end

module DescribeAIWorkloadConfig = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ai_workload_config_request) =
    let input = Json_serializers.describe_ai_workload_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAIWorkloadConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_ai_workload_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_ai_workload_config_request) =
    let input = Json_serializers.describe_ai_workload_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeAIWorkloadConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_ai_workload_config_response_of_yojson
      ~error_deserializer
end

module DescribeAlgorithm = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_algorithm_input) =
    let input = Json_serializers.describe_algorithm_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAlgorithm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_algorithm_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_algorithm_input) =
    let input = Json_serializers.describe_algorithm_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeAlgorithm"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_algorithm_output_of_yojson
      ~error_deserializer
end

module DescribeApp = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_app_request) =
    let input = Json_serializers.describe_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeApp" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_app_request) =
    let input = Json_serializers.describe_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeApp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_app_response_of_yojson
      ~error_deserializer
end

module DescribeAppImageConfig = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_app_image_config_request) =
    let input = Json_serializers.describe_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAppImageConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_image_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_app_image_config_request) =
    let input = Json_serializers.describe_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeAppImageConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_app_image_config_response_of_yojson
      ~error_deserializer
end

module DescribeArtifact = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_artifact_request) =
    let input = Json_serializers.describe_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeArtifact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_artifact_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_artifact_request) =
    let input = Json_serializers.describe_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeArtifact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_artifact_response_of_yojson
      ~error_deserializer
end

module DescribeAutoMLJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_auto_ml_job_request) =
    let input = Json_serializers.describe_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAutoMLJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_auto_ml_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_auto_ml_job_request) =
    let input = Json_serializers.describe_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeAutoMLJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_auto_ml_job_response_of_yojson
      ~error_deserializer
end

module DescribeAutoMLJobV2 = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_auto_ml_job_v2_request) =
    let input = Json_serializers.describe_auto_ml_job_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeAutoMLJobV2" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_auto_ml_job_v2_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_auto_ml_job_v2_request) =
    let input = Json_serializers.describe_auto_ml_job_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeAutoMLJobV2"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_auto_ml_job_v2_response_of_yojson
      ~error_deserializer
end

module DescribeCluster = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cluster_request) =
    let input = Json_serializers.describe_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cluster_request) =
    let input = Json_serializers.describe_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_response_of_yojson
      ~error_deserializer
end

module DescribeClusterEvent = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cluster_event_request) =
    let input = Json_serializers.describe_cluster_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeClusterEvent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_event_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cluster_event_request) =
    let input = Json_serializers.describe_cluster_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeClusterEvent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_event_response_of_yojson
      ~error_deserializer
end

module DescribeClusterNode = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cluster_node_request) =
    let input = Json_serializers.describe_cluster_node_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeClusterNode" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_node_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cluster_node_request) =
    let input = Json_serializers.describe_cluster_node_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeClusterNode"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_node_response_of_yojson
      ~error_deserializer
end

module DescribeClusterSchedulerConfig = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cluster_scheduler_config_request) =
    let input = Json_serializers.describe_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeClusterSchedulerConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_scheduler_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cluster_scheduler_config_request) =
    let input = Json_serializers.describe_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeClusterSchedulerConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_scheduler_config_response_of_yojson
      ~error_deserializer
end

module DescribeCodeRepository = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_code_repository_input) =
    let input = Json_serializers.describe_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeCodeRepository" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_code_repository_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_code_repository_input) =
    let input = Json_serializers.describe_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeCodeRepository"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_code_repository_output_of_yojson
      ~error_deserializer
end

module DescribeCompilationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_compilation_job_request) =
    let input = Json_serializers.describe_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeCompilationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_compilation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_compilation_job_request) =
    let input = Json_serializers.describe_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeCompilationJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_compilation_job_response_of_yojson
      ~error_deserializer
end

module DescribeComputeQuota = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_compute_quota_request) =
    let input = Json_serializers.describe_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeComputeQuota" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_compute_quota_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_compute_quota_request) =
    let input = Json_serializers.describe_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeComputeQuota"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_compute_quota_response_of_yojson
      ~error_deserializer
end

module DescribeContext = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_context_request) =
    let input = Json_serializers.describe_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeContext" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_context_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_context_request) =
    let input = Json_serializers.describe_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeContext"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_context_response_of_yojson
      ~error_deserializer
end

module DescribeDataQualityJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_data_quality_job_definition_request) =
    let input = Json_serializers.describe_data_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeDataQualityJobDefinition"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_data_quality_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_quality_job_definition_request) =
    let input = Json_serializers.describe_data_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeDataQualityJobDefinition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_data_quality_job_definition_response_of_yojson
      ~error_deserializer
end

module DescribeDevice = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_device_request) =
    let input = Json_serializers.describe_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeDevice" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_device_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_device_request) =
    let input = Json_serializers.describe_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeDevice"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_device_response_of_yojson ~error_deserializer
end

module DescribeDeviceFleet = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_device_fleet_request) =
    let input = Json_serializers.describe_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeDeviceFleet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_device_fleet_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_device_fleet_request) =
    let input = Json_serializers.describe_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeDeviceFleet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_device_fleet_response_of_yojson
      ~error_deserializer
end

module DescribeDomain = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_domain_request) =
    let input = Json_serializers.describe_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeDomain" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_domain_request) =
    let input = Json_serializers.describe_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeDomain"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_domain_response_of_yojson ~error_deserializer
end

module DescribeEdgeDeploymentPlan = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_edge_deployment_plan_request) =
    let input = Json_serializers.describe_edge_deployment_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeEdgeDeploymentPlan" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_edge_deployment_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_edge_deployment_plan_request) =
    let input = Json_serializers.describe_edge_deployment_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeEdgeDeploymentPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_edge_deployment_plan_response_of_yojson
      ~error_deserializer
end

module DescribeEdgePackagingJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_edge_packaging_job_request) =
    let input = Json_serializers.describe_edge_packaging_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeEdgePackagingJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_edge_packaging_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_edge_packaging_job_request) =
    let input = Json_serializers.describe_edge_packaging_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeEdgePackagingJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_edge_packaging_job_response_of_yojson
      ~error_deserializer
end

module DescribeEndpoint = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoint_input) =
    let input = Json_serializers.describe_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_endpoint_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_input) =
    let input = Json_serializers.describe_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_output_of_yojson ~error_deserializer
end

module DescribeEndpointConfig = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoint_config_input) =
    let input = Json_serializers.describe_endpoint_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeEndpointConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_config_input) =
    let input = Json_serializers.describe_endpoint_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeEndpointConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_config_output_of_yojson
      ~error_deserializer
end

module DescribeExperiment = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_experiment_request) =
    let input = Json_serializers.describe_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeExperiment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_experiment_request) =
    let input = Json_serializers.describe_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeExperiment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_experiment_response_of_yojson
      ~error_deserializer
end

module DescribeFeatureGroup = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_feature_group_request) =
    let input = Json_serializers.describe_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeFeatureGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_feature_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_feature_group_request) =
    let input = Json_serializers.describe_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeFeatureGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_feature_group_response_of_yojson
      ~error_deserializer
end

module DescribeFeatureMetadata = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_feature_metadata_request) =
    let input = Json_serializers.describe_feature_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeFeatureMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_feature_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_feature_metadata_request) =
    let input = Json_serializers.describe_feature_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeFeatureMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_feature_metadata_response_of_yojson
      ~error_deserializer
end

module DescribeFlowDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_flow_definition_request) =
    let input = Json_serializers.describe_flow_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeFlowDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_flow_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_flow_definition_request) =
    let input = Json_serializers.describe_flow_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeFlowDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_flow_definition_response_of_yojson
      ~error_deserializer
end

module DescribeHub = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_hub_request) =
    let input = Json_serializers.describe_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeHub" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_hub_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_hub_request) =
    let input = Json_serializers.describe_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeHub" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_hub_response_of_yojson
      ~error_deserializer
end

module DescribeHubContent = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_hub_content_request) =
    let input = Json_serializers.describe_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeHubContent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_hub_content_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_hub_content_request) =
    let input = Json_serializers.describe_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeHubContent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_hub_content_response_of_yojson
      ~error_deserializer
end

module DescribeHumanTaskUi = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_human_task_ui_request) =
    let input = Json_serializers.describe_human_task_ui_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeHumanTaskUi" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_human_task_ui_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_human_task_ui_request) =
    let input = Json_serializers.describe_human_task_ui_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeHumanTaskUi"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_human_task_ui_response_of_yojson
      ~error_deserializer
end

module DescribeHyperParameterTuningJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.describe_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeHyperParameterTuningJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_hyper_parameter_tuning_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.describe_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeHyperParameterTuningJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_hyper_parameter_tuning_job_response_of_yojson
      ~error_deserializer
end

module DescribeImage = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_request) =
    let input = Json_serializers.describe_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeImage" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_request) =
    let input = Json_serializers.describe_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_image_response_of_yojson
      ~error_deserializer
end

module DescribeImageVersion = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_version_request) =
    let input = Json_serializers.describe_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeImageVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_version_request) =
    let input = Json_serializers.describe_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeImageVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_version_response_of_yojson
      ~error_deserializer
end

module DescribeInferenceComponent = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_inference_component_input) =
    let input = Json_serializers.describe_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeInferenceComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_inference_component_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_inference_component_input) =
    let input = Json_serializers.describe_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeInferenceComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_inference_component_output_of_yojson
      ~error_deserializer
end

module DescribeInferenceExperiment = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_inference_experiment_request) =
    let input = Json_serializers.describe_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeInferenceExperiment" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_inference_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_inference_experiment_request) =
    let input = Json_serializers.describe_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeInferenceExperiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_inference_experiment_response_of_yojson
      ~error_deserializer
end

module DescribeInferenceRecommendationsJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_inference_recommendations_job_request) =
    let input = Json_serializers.describe_inference_recommendations_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeInferenceRecommendationsJob"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_inference_recommendations_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_inference_recommendations_job_request) =
    let input = Json_serializers.describe_inference_recommendations_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeInferenceRecommendationsJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_inference_recommendations_job_response_of_yojson
      ~error_deserializer
end

module DescribeJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_job_request) =
    let input = Json_serializers.describe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_job_request) =
    let input = Json_serializers.describe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_job_response_of_yojson
      ~error_deserializer
end

module DescribeJobSchemaVersion = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_job_schema_version_request) =
    let input = Json_serializers.describe_job_schema_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeJobSchemaVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_job_schema_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_job_schema_version_request) =
    let input = Json_serializers.describe_job_schema_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeJobSchemaVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_job_schema_version_response_of_yojson
      ~error_deserializer
end

module DescribeLabelingJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_labeling_job_request) =
    let input = Json_serializers.describe_labeling_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeLabelingJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_labeling_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_labeling_job_request) =
    let input = Json_serializers.describe_labeling_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeLabelingJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_labeling_job_response_of_yojson
      ~error_deserializer
end

module DescribeLineageGroup = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_lineage_group_request) =
    let input = Json_serializers.describe_lineage_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeLineageGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_lineage_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_lineage_group_request) =
    let input = Json_serializers.describe_lineage_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeLineageGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_lineage_group_response_of_yojson
      ~error_deserializer
end

module DescribeMlflowApp = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_mlflow_app_request) =
    let input = Json_serializers.describe_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeMlflowApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_mlflow_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_mlflow_app_request) =
    let input = Json_serializers.describe_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeMlflowApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_mlflow_app_response_of_yojson
      ~error_deserializer
end

module DescribeMlflowTrackingServer = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_mlflow_tracking_server_request) =
    let input = Json_serializers.describe_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeMlflowTrackingServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_mlflow_tracking_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_mlflow_tracking_server_request) =
    let input = Json_serializers.describe_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeMlflowTrackingServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_mlflow_tracking_server_response_of_yojson
      ~error_deserializer
end

module DescribeModel = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_input) =
    let input = Json_serializers.describe_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeModel" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_model_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_input) =
    let input = Json_serializers.describe_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_model_output_of_yojson
      ~error_deserializer
end

module DescribeModelBiasJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_bias_job_definition_request) =
    let input = Json_serializers.describe_model_bias_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeModelBiasJobDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_bias_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_bias_job_definition_request) =
    let input = Json_serializers.describe_model_bias_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeModelBiasJobDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_bias_job_definition_response_of_yojson
      ~error_deserializer
end

module DescribeModelCard = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_card_request) =
    let input = Json_serializers.describe_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeModelCard" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_model_card_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_card_request) =
    let input = Json_serializers.describe_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeModelCard"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_card_response_of_yojson
      ~error_deserializer
end

module DescribeModelCardExportJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_card_export_job_request) =
    let input = Json_serializers.describe_model_card_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeModelCardExportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_card_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_card_export_job_request) =
    let input = Json_serializers.describe_model_card_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeModelCardExportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_card_export_job_response_of_yojson
      ~error_deserializer
end

module DescribeModelExplainabilityJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_explainability_job_definition_request) =
    let input =
      Json_serializers.describe_model_explainability_job_definition_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.DescribeModelExplainabilityJobDefinition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_model_explainability_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_explainability_job_definition_request)
      =
    let input =
      Json_serializers.describe_model_explainability_job_definition_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeModelExplainabilityJobDefinition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_model_explainability_job_definition_response_of_yojson
      ~error_deserializer
end

module DescribeModelPackage = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_package_input) =
    let input = Json_serializers.describe_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeModelPackage" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_package_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_package_input) =
    let input = Json_serializers.describe_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeModelPackage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_package_output_of_yojson
      ~error_deserializer
end

module DescribeModelPackageGroup = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_package_group_input) =
    let input = Json_serializers.describe_model_package_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeModelPackageGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_package_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_package_group_input) =
    let input = Json_serializers.describe_model_package_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeModelPackageGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_package_group_output_of_yojson
      ~error_deserializer
end

module DescribeModelQualityJobDefinition = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_model_quality_job_definition_request) =
    let input = Json_serializers.describe_model_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeModelQualityJobDefinition"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_model_quality_job_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_quality_job_definition_request) =
    let input = Json_serializers.describe_model_quality_job_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeModelQualityJobDefinition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_model_quality_job_definition_response_of_yojson
      ~error_deserializer
end

module DescribeMonitoringSchedule = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_monitoring_schedule_request) =
    let input = Json_serializers.describe_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeMonitoringSchedule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_monitoring_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_monitoring_schedule_request) =
    let input = Json_serializers.describe_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeMonitoringSchedule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_monitoring_schedule_response_of_yojson
      ~error_deserializer
end

module DescribeNotebookInstance = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_notebook_instance_input) =
    let input = Json_serializers.describe_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeNotebookInstance" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_notebook_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_notebook_instance_input) =
    let input = Json_serializers.describe_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeNotebookInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notebook_instance_output_of_yojson
      ~error_deserializer
end

module DescribeNotebookInstanceLifecycleConfig = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.describe_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.DescribeNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_notebook_instance_lifecycle_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.describe_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_notebook_instance_lifecycle_config_output_of_yojson
      ~error_deserializer
end

module DescribeOptimizationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_optimization_job_request) =
    let input = Json_serializers.describe_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeOptimizationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_optimization_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_optimization_job_request) =
    let input = Json_serializers.describe_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeOptimizationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_optimization_job_response_of_yojson
      ~error_deserializer
end

module DescribePartnerApp = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_partner_app_request) =
    let input = Json_serializers.describe_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribePartnerApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_partner_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_partner_app_request) =
    let input = Json_serializers.describe_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribePartnerApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_partner_app_response_of_yojson
      ~error_deserializer
end

module DescribePipeline = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pipeline_request) =
    let input = Json_serializers.describe_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribePipeline" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_pipeline_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pipeline_request) =
    let input = Json_serializers.describe_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pipeline_response_of_yojson
      ~error_deserializer
end

module DescribePipelineDefinitionForExecution = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pipeline_definition_for_execution_request) =
    let input =
      Json_serializers.describe_pipeline_definition_for_execution_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.DescribePipelineDefinitionForExecution" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_pipeline_definition_for_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pipeline_definition_for_execution_request) =
    let input =
      Json_serializers.describe_pipeline_definition_for_execution_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribePipelineDefinitionForExecution" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_pipeline_definition_for_execution_response_of_yojson
      ~error_deserializer
end

module DescribePipelineExecution = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pipeline_execution_request) =
    let input = Json_serializers.describe_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribePipelineExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_pipeline_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pipeline_execution_request) =
    let input = Json_serializers.describe_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribePipelineExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pipeline_execution_response_of_yojson
      ~error_deserializer
end

module DescribeProcessingJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_processing_job_request) =
    let input = Json_serializers.describe_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeProcessingJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_processing_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_processing_job_request) =
    let input = Json_serializers.describe_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeProcessingJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_processing_job_response_of_yojson
      ~error_deserializer
end

module DescribeProject = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_project_input) =
    let input = Json_serializers.describe_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeProject" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_project_input) =
    let input = Json_serializers.describe_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_project_output_of_yojson ~error_deserializer
end

module DescribeReservedCapacity = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_reserved_capacity_request) =
    let input = Json_serializers.describe_reserved_capacity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeReservedCapacity" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_reserved_capacity_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_reserved_capacity_request) =
    let input = Json_serializers.describe_reserved_capacity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeReservedCapacity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_reserved_capacity_response_of_yojson
      ~error_deserializer
end

module DescribeSpace = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_space_request) =
    let input = Json_serializers.describe_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeSpace" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_space_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_space_request) =
    let input = Json_serializers.describe_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeSpace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_space_response_of_yojson
      ~error_deserializer
end

module DescribeStudioLifecycleConfig = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_studio_lifecycle_config_request) =
    let input = Json_serializers.describe_studio_lifecycle_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeStudioLifecycleConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_studio_lifecycle_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_studio_lifecycle_config_request) =
    let input = Json_serializers.describe_studio_lifecycle_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeStudioLifecycleConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_studio_lifecycle_config_response_of_yojson
      ~error_deserializer
end

module DescribeSubscribedWorkteam = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_subscribed_workteam_request) =
    let input = Json_serializers.describe_subscribed_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeSubscribedWorkteam" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_subscribed_workteam_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_subscribed_workteam_request) =
    let input = Json_serializers.describe_subscribed_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeSubscribedWorkteam" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_subscribed_workteam_response_of_yojson
      ~error_deserializer
end

module DescribeTrainingJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_training_job_request) =
    let input = Json_serializers.describe_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeTrainingJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_training_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_training_job_request) =
    let input = Json_serializers.describe_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeTrainingJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_training_job_response_of_yojson
      ~error_deserializer
end

module DescribeTrainingPlan = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_training_plan_request) =
    let input = Json_serializers.describe_training_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeTrainingPlan" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_training_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_training_plan_request) =
    let input = Json_serializers.describe_training_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeTrainingPlan"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_training_plan_response_of_yojson
      ~error_deserializer
end

module DescribeTrainingPlanExtensionHistory = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_training_plan_extension_history_request) =
    let input =
      Json_serializers.describe_training_plan_extension_history_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeTrainingPlanExtensionHistory"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_training_plan_extension_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_training_plan_extension_history_request) =
    let input =
      Json_serializers.describe_training_plan_extension_history_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DescribeTrainingPlanExtensionHistory" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_training_plan_extension_history_response_of_yojson
      ~error_deserializer
end

module DescribeTransformJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_transform_job_request) =
    let input = Json_serializers.describe_transform_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeTransformJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_transform_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_transform_job_request) =
    let input = Json_serializers.describe_transform_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeTransformJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_transform_job_response_of_yojson
      ~error_deserializer
end

module DescribeTrial = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trial_request) =
    let input = Json_serializers.describe_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeTrial" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_trial_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_trial_request) =
    let input = Json_serializers.describe_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeTrial" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_trial_response_of_yojson
      ~error_deserializer
end

module DescribeTrialComponent = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trial_component_request) =
    let input = Json_serializers.describe_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeTrialComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_trial_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_trial_component_request) =
    let input = Json_serializers.describe_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeTrialComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_trial_component_response_of_yojson
      ~error_deserializer
end

module DescribeUserProfile = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_profile_request) =
    let input = Json_serializers.describe_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeUserProfile" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_profile_request) =
    let input = Json_serializers.describe_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeUserProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_profile_response_of_yojson
      ~error_deserializer
end

module DescribeWorkforce = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workforce_request) =
    let input = Json_serializers.describe_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeWorkforce" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_workforce_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workforce_request) =
    let input = Json_serializers.describe_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeWorkforce"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workforce_response_of_yojson
      ~error_deserializer
end

module DescribeWorkteam = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workteam_request) =
    let input = Json_serializers.describe_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DescribeWorkteam" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_workteam_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workteam_request) =
    let input = Json_serializers.describe_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.DescribeWorkteam"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workteam_response_of_yojson
      ~error_deserializer
end

module DetachClusterNodeVolume = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_cluster_node_volume_request) =
    let input = Json_serializers.detach_cluster_node_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DetachClusterNodeVolume" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.detach_cluster_node_volume_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detach_cluster_node_volume_request) =
    let input = Json_serializers.detach_cluster_node_volume_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DetachClusterNodeVolume" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detach_cluster_node_volume_response_of_yojson
      ~error_deserializer
end

module DisableSagemakerServicecatalogPortfolio = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_sagemaker_servicecatalog_portfolio_input) =
    let input =
      Json_serializers.disable_sagemaker_servicecatalog_portfolio_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.DisableSagemakerServicecatalogPortfolio" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disable_sagemaker_servicecatalog_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_sagemaker_servicecatalog_portfolio_input) =
    let input =
      Json_serializers.disable_sagemaker_servicecatalog_portfolio_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DisableSagemakerServicecatalogPortfolio" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disable_sagemaker_servicecatalog_portfolio_output_of_yojson
      ~error_deserializer
end

module DisassociateTrialComponent = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_trial_component_request) =
    let input = Json_serializers.disassociate_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.DisassociateTrialComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_trial_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_trial_component_request) =
    let input = Json_serializers.disassociate_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.DisassociateTrialComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_trial_component_response_of_yojson
      ~error_deserializer
end

module EnableSagemakerServicecatalogPortfolio = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_sagemaker_servicecatalog_portfolio_input) =
    let input =
      Json_serializers.enable_sagemaker_servicecatalog_portfolio_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.EnableSagemakerServicecatalogPortfolio" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.enable_sagemaker_servicecatalog_portfolio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_sagemaker_servicecatalog_portfolio_input) =
    let input =
      Json_serializers.enable_sagemaker_servicecatalog_portfolio_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.EnableSagemakerServicecatalogPortfolio" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.enable_sagemaker_servicecatalog_portfolio_output_of_yojson
      ~error_deserializer
end

module ExtendTrainingPlan = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : extend_training_plan_request) =
    let input = Json_serializers.extend_training_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ExtendTrainingPlan" ~service ~context
      ~input ~output_deserializer:Json_deserializers.extend_training_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : extend_training_plan_request) =
    let input = Json_serializers.extend_training_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ExtendTrainingPlan"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.extend_training_plan_response_of_yojson
      ~error_deserializer
end

module GetDeviceFleetReport = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_device_fleet_report_request) =
    let input = Json_serializers.get_device_fleet_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.GetDeviceFleetReport" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_device_fleet_report_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_device_fleet_report_request) =
    let input = Json_serializers.get_device_fleet_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.GetDeviceFleetReport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_device_fleet_report_response_of_yojson
      ~error_deserializer
end

module GetLineageGroupPolicy = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_lineage_group_policy_request) =
    let input = Json_serializers.get_lineage_group_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.GetLineageGroupPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_lineage_group_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lineage_group_policy_request) =
    let input = Json_serializers.get_lineage_group_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.GetLineageGroupPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lineage_group_policy_response_of_yojson
      ~error_deserializer
end

module GetModelPackageGroupPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_model_package_group_policy_input) =
    let input = Json_serializers.get_model_package_group_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.GetModelPackageGroupPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_model_package_group_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_model_package_group_policy_input) =
    let input = Json_serializers.get_model_package_group_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.GetModelPackageGroupPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_model_package_group_policy_output_of_yojson
      ~error_deserializer
end

module GetSagemakerServicecatalogPortfolioStatus = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_sagemaker_servicecatalog_portfolio_status_input) =
    let input =
      Json_serializers.get_sagemaker_servicecatalog_portfolio_status_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.GetSagemakerServicecatalogPortfolioStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_sagemaker_servicecatalog_portfolio_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_sagemaker_servicecatalog_portfolio_status_input)
      =
    let input =
      Json_serializers.get_sagemaker_servicecatalog_portfolio_status_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.GetSagemakerServicecatalogPortfolioStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_sagemaker_servicecatalog_portfolio_status_output_of_yojson
      ~error_deserializer
end

module GetScalingConfigurationRecommendation = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_scaling_configuration_recommendation_request) =
    let input =
      Json_serializers.get_scaling_configuration_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.GetScalingConfigurationRecommendation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_scaling_configuration_recommendation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_scaling_configuration_recommendation_request) =
    let input =
      Json_serializers.get_scaling_configuration_recommendation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.GetScalingConfigurationRecommendation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_scaling_configuration_recommendation_response_of_yojson
      ~error_deserializer
end

module GetSearchSuggestions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_search_suggestions_request) =
    let input = Json_serializers.get_search_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.GetSearchSuggestions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_search_suggestions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_search_suggestions_request) =
    let input = Json_serializers.get_search_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.GetSearchSuggestions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_search_suggestions_response_of_yojson
      ~error_deserializer
end

module ImportHubContent = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_hub_content_request) =
    let input = Json_serializers.import_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ImportHubContent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.import_hub_content_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_hub_content_request) =
    let input = Json_serializers.import_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ImportHubContent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_hub_content_response_of_yojson
      ~error_deserializer
end

module ListActions = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_actions_request) =
    let input = Json_serializers.list_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListActions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_actions_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_actions_request) =
    let input = Json_serializers.list_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListActions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_actions_response_of_yojson
      ~error_deserializer
end

module ListAIBenchmarkJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ai_benchmark_jobs_request) =
    let input = Json_serializers.list_ai_benchmark_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAIBenchmarkJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_ai_benchmark_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_ai_benchmark_jobs_request) =
    let input = Json_serializers.list_ai_benchmark_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListAIBenchmarkJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_ai_benchmark_jobs_response_of_yojson
      ~error_deserializer
end

module ListAIRecommendationJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ai_recommendation_jobs_request) =
    let input = Json_serializers.list_ai_recommendation_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAIRecommendationJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_ai_recommendation_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_ai_recommendation_jobs_request) =
    let input = Json_serializers.list_ai_recommendation_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListAIRecommendationJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_ai_recommendation_jobs_response_of_yojson
      ~error_deserializer
end

module ListAIWorkloadConfigs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ai_workload_configs_request) =
    let input = Json_serializers.list_ai_workload_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAIWorkloadConfigs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_ai_workload_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_ai_workload_configs_request) =
    let input = Json_serializers.list_ai_workload_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListAIWorkloadConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_ai_workload_configs_response_of_yojson
      ~error_deserializer
end

module ListAlgorithms = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_algorithms_input) =
    let input = Json_serializers.list_algorithms_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAlgorithms" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_algorithms_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_algorithms_input) =
    let input = Json_serializers.list_algorithms_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListAlgorithms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_algorithms_output_of_yojson ~error_deserializer
end

module ListAliases = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aliases_request) =
    let input = Json_serializers.list_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aliases_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_aliases_request) =
    let input = Json_serializers.list_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListAliases" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_aliases_response_of_yojson
      ~error_deserializer
end

module ListAppImageConfigs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_app_image_configs_request) =
    let input = Json_serializers.list_app_image_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAppImageConfigs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_app_image_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_app_image_configs_request) =
    let input = Json_serializers.list_app_image_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListAppImageConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_app_image_configs_response_of_yojson
      ~error_deserializer
end

module ListApps = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_apps_request) =
    let input = Json_serializers.list_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListApps" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_apps_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_apps_request) =
    let input = Json_serializers.list_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListApps" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_apps_response_of_yojson
      ~error_deserializer
end

module ListArtifacts = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_artifacts_request) =
    let input = Json_serializers.list_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListArtifacts" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_artifacts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_artifacts_request) =
    let input = Json_serializers.list_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListArtifacts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_artifacts_response_of_yojson
      ~error_deserializer
end

module ListAssociations = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_associations_request) =
    let input = Json_serializers.list_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAssociations" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_associations_request) =
    let input = Json_serializers.list_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListAssociations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_associations_response_of_yojson
      ~error_deserializer
end

module ListAutoMLJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_auto_ml_jobs_request) =
    let input = Json_serializers.list_auto_ml_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListAutoMLJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_auto_ml_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_auto_ml_jobs_request) =
    let input = Json_serializers.list_auto_ml_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListAutoMLJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_auto_ml_jobs_response_of_yojson
      ~error_deserializer
end

module ListCandidatesForAutoMLJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_candidates_for_auto_ml_job_request) =
    let input = Json_serializers.list_candidates_for_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListCandidatesForAutoMLJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_candidates_for_auto_ml_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_candidates_for_auto_ml_job_request) =
    let input = Json_serializers.list_candidates_for_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListCandidatesForAutoMLJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_candidates_for_auto_ml_job_response_of_yojson
      ~error_deserializer
end

module ListClusterEvents = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cluster_events_request) =
    let input = Json_serializers.list_cluster_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListClusterEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_cluster_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cluster_events_request) =
    let input = Json_serializers.list_cluster_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListClusterEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cluster_events_response_of_yojson
      ~error_deserializer
end

module ListClusterNodes = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cluster_nodes_request) =
    let input = Json_serializers.list_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListClusterNodes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_cluster_nodes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cluster_nodes_request) =
    let input = Json_serializers.list_cluster_nodes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListClusterNodes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cluster_nodes_response_of_yojson
      ~error_deserializer
end

module ListClusters = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_clusters_request) =
    let input = Json_serializers.list_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListClusters" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_clusters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_clusters_request) =
    let input = Json_serializers.list_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListClusters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_clusters_response_of_yojson
      ~error_deserializer
end

module ListClusterSchedulerConfigs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cluster_scheduler_configs_request) =
    let input = Json_serializers.list_cluster_scheduler_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListClusterSchedulerConfigs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_cluster_scheduler_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cluster_scheduler_configs_request) =
    let input = Json_serializers.list_cluster_scheduler_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListClusterSchedulerConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cluster_scheduler_configs_response_of_yojson
      ~error_deserializer
end

module ListCodeRepositories = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_code_repositories_input) =
    let input = Json_serializers.list_code_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListCodeRepositories" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_code_repositories_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_code_repositories_input) =
    let input = Json_serializers.list_code_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListCodeRepositories"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_code_repositories_output_of_yojson
      ~error_deserializer
end

module ListCompilationJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_compilation_jobs_request) =
    let input = Json_serializers.list_compilation_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListCompilationJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_compilation_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_compilation_jobs_request) =
    let input = Json_serializers.list_compilation_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListCompilationJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_compilation_jobs_response_of_yojson
      ~error_deserializer
end

module ListComputeQuotas = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_compute_quotas_request) =
    let input = Json_serializers.list_compute_quotas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListComputeQuotas" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_compute_quotas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_compute_quotas_request) =
    let input = Json_serializers.list_compute_quotas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListComputeQuotas"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_compute_quotas_response_of_yojson
      ~error_deserializer
end

module ListContexts = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_contexts_request) =
    let input = Json_serializers.list_contexts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListContexts" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_contexts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_contexts_request) =
    let input = Json_serializers.list_contexts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListContexts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_contexts_response_of_yojson
      ~error_deserializer
end

module ListDataQualityJobDefinitions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_quality_job_definitions_request) =
    let input = Json_serializers.list_data_quality_job_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListDataQualityJobDefinitions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_job_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_quality_job_definitions_request) =
    let input = Json_serializers.list_data_quality_job_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListDataQualityJobDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_job_definitions_response_of_yojson
      ~error_deserializer
end

module ListDeviceFleets = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_device_fleets_request) =
    let input = Json_serializers.list_device_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListDeviceFleets" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_device_fleets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_device_fleets_request) =
    let input = Json_serializers.list_device_fleets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListDeviceFleets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_device_fleets_response_of_yojson
      ~error_deserializer
end

module ListDevices = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_devices_request) =
    let input = Json_serializers.list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListDevices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_devices_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_devices_request) =
    let input = Json_serializers.list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListDevices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_devices_response_of_yojson
      ~error_deserializer
end

module ListDomains = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_domains_request) =
    let input = Json_serializers.list_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListDomains" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_domains_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_domains_request) =
    let input = Json_serializers.list_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListDomains" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_domains_response_of_yojson
      ~error_deserializer
end

module ListEdgeDeploymentPlans = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_edge_deployment_plans_request) =
    let input = Json_serializers.list_edge_deployment_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListEdgeDeploymentPlans" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_edge_deployment_plans_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_edge_deployment_plans_request) =
    let input = Json_serializers.list_edge_deployment_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListEdgeDeploymentPlans" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_edge_deployment_plans_response_of_yojson
      ~error_deserializer
end

module ListEdgePackagingJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_edge_packaging_jobs_request) =
    let input = Json_serializers.list_edge_packaging_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListEdgePackagingJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_edge_packaging_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_edge_packaging_jobs_request) =
    let input = Json_serializers.list_edge_packaging_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListEdgePackagingJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_edge_packaging_jobs_response_of_yojson
      ~error_deserializer
end

module ListEndpointConfigs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_endpoint_configs_input) =
    let input = Json_serializers.list_endpoint_configs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListEndpointConfigs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_endpoint_configs_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_endpoint_configs_input) =
    let input = Json_serializers.list_endpoint_configs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListEndpointConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_endpoint_configs_output_of_yojson
      ~error_deserializer
end

module ListEndpoints = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_endpoints_input) =
    let input = Json_serializers.list_endpoints_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListEndpoints" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_endpoints_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_endpoints_input) =
    let input = Json_serializers.list_endpoints_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListEndpoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_endpoints_output_of_yojson
      ~error_deserializer
end

module ListExperiments = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_experiments_request) =
    let input = Json_serializers.list_experiments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListExperiments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_experiments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_experiments_request) =
    let input = Json_serializers.list_experiments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListExperiments"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_experiments_response_of_yojson
      ~error_deserializer
end

module ListFeatureGroups = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_feature_groups_request) =
    let input = Json_serializers.list_feature_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListFeatureGroups" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_feature_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_feature_groups_request) =
    let input = Json_serializers.list_feature_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListFeatureGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_feature_groups_response_of_yojson
      ~error_deserializer
end

module ListFlowDefinitions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_flow_definitions_request) =
    let input = Json_serializers.list_flow_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListFlowDefinitions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_flow_definitions_request) =
    let input = Json_serializers.list_flow_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListFlowDefinitions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flow_definitions_response_of_yojson
      ~error_deserializer
end

module ListHubContents = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hub_contents_request) =
    let input = Json_serializers.list_hub_contents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListHubContents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_hub_contents_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_hub_contents_request) =
    let input = Json_serializers.list_hub_contents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListHubContents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_hub_contents_response_of_yojson
      ~error_deserializer
end

module ListHubContentVersions = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hub_content_versions_request) =
    let input = Json_serializers.list_hub_content_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListHubContentVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_hub_content_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_hub_content_versions_request) =
    let input = Json_serializers.list_hub_content_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListHubContentVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_hub_content_versions_response_of_yojson
      ~error_deserializer
end

module ListHubs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hubs_request) =
    let input = Json_serializers.list_hubs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListHubs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_hubs_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_hubs_request) =
    let input = Json_serializers.list_hubs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListHubs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_hubs_response_of_yojson
      ~error_deserializer
end

module ListHumanTaskUis = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_human_task_uis_request) =
    let input = Json_serializers.list_human_task_uis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListHumanTaskUis" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_human_task_uis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_human_task_uis_request) =
    let input = Json_serializers.list_human_task_uis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListHumanTaskUis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_human_task_uis_response_of_yojson
      ~error_deserializer
end

module ListHyperParameterTuningJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hyper_parameter_tuning_jobs_request) =
    let input = Json_serializers.list_hyper_parameter_tuning_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListHyperParameterTuningJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_hyper_parameter_tuning_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_hyper_parameter_tuning_jobs_request) =
    let input = Json_serializers.list_hyper_parameter_tuning_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListHyperParameterTuningJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_hyper_parameter_tuning_jobs_response_of_yojson
      ~error_deserializer
end

module ListImages = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_images_request) =
    let input = Json_serializers.list_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_images_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_images_request) =
    let input = Json_serializers.list_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListImages" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_images_response_of_yojson
      ~error_deserializer
end

module ListImageVersions = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_image_versions_request) =
    let input = Json_serializers.list_image_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListImageVersions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_image_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_image_versions_request) =
    let input = Json_serializers.list_image_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListImageVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_image_versions_response_of_yojson
      ~error_deserializer
end

module ListInferenceComponents = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_inference_components_input) =
    let input = Json_serializers.list_inference_components_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListInferenceComponents" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_components_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inference_components_input) =
    let input = Json_serializers.list_inference_components_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListInferenceComponents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_components_output_of_yojson
      ~error_deserializer
end

module ListInferenceExperiments = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_inference_experiments_request) =
    let input = Json_serializers.list_inference_experiments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListInferenceExperiments" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_experiments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inference_experiments_request) =
    let input = Json_serializers.list_inference_experiments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListInferenceExperiments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_experiments_response_of_yojson
      ~error_deserializer
end

module ListInferenceRecommendationsJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_inference_recommendations_jobs_request) =
    let input = Json_serializers.list_inference_recommendations_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListInferenceRecommendationsJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_recommendations_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inference_recommendations_jobs_request) =
    let input = Json_serializers.list_inference_recommendations_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListInferenceRecommendationsJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_recommendations_jobs_response_of_yojson
      ~error_deserializer
end

module ListInferenceRecommendationsJobSteps = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_inference_recommendations_job_steps_request) =
    let input =
      Json_serializers.list_inference_recommendations_job_steps_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListInferenceRecommendationsJobSteps"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_inference_recommendations_job_steps_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inference_recommendations_job_steps_request) =
    let input =
      Json_serializers.list_inference_recommendations_job_steps_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListInferenceRecommendationsJobSteps" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_inference_recommendations_job_steps_response_of_yojson
      ~error_deserializer
end

module ListJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_jobs_request) =
    let input = Json_serializers.list_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_jobs_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_jobs_request) =
    let input = Json_serializers.list_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListJobs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_jobs_response_of_yojson
      ~error_deserializer
end

module ListJobSchemaVersions = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_job_schema_versions_request) =
    let input = Json_serializers.list_job_schema_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListJobSchemaVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_job_schema_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_job_schema_versions_request) =
    let input = Json_serializers.list_job_schema_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListJobSchemaVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_job_schema_versions_response_of_yojson
      ~error_deserializer
end

module ListLabelingJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_labeling_jobs_request) =
    let input = Json_serializers.list_labeling_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListLabelingJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_labeling_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_labeling_jobs_request) =
    let input = Json_serializers.list_labeling_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListLabelingJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_labeling_jobs_response_of_yojson
      ~error_deserializer
end

module ListLabelingJobsForWorkteam = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_labeling_jobs_for_workteam_request) =
    let input = Json_serializers.list_labeling_jobs_for_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListLabelingJobsForWorkteam" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_labeling_jobs_for_workteam_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_labeling_jobs_for_workteam_request) =
    let input = Json_serializers.list_labeling_jobs_for_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListLabelingJobsForWorkteam" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_labeling_jobs_for_workteam_response_of_yojson
      ~error_deserializer
end

module ListLineageGroups = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_lineage_groups_request) =
    let input = Json_serializers.list_lineage_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListLineageGroups" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_lineage_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_lineage_groups_request) =
    let input = Json_serializers.list_lineage_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListLineageGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_lineage_groups_response_of_yojson
      ~error_deserializer
end

module ListMlflowApps = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mlflow_apps_request) =
    let input = Json_serializers.list_mlflow_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListMlflowApps" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_mlflow_apps_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_mlflow_apps_request) =
    let input = Json_serializers.list_mlflow_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListMlflowApps"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_mlflow_apps_response_of_yojson
      ~error_deserializer
end

module ListMlflowTrackingServers = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mlflow_tracking_servers_request) =
    let input = Json_serializers.list_mlflow_tracking_servers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListMlflowTrackingServers" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_mlflow_tracking_servers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_mlflow_tracking_servers_request) =
    let input = Json_serializers.list_mlflow_tracking_servers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListMlflowTrackingServers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_mlflow_tracking_servers_response_of_yojson
      ~error_deserializer
end

module ListModelBiasJobDefinitions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_bias_job_definitions_request) =
    let input = Json_serializers.list_model_bias_job_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelBiasJobDefinitions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_model_bias_job_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_bias_job_definitions_request) =
    let input = Json_serializers.list_model_bias_job_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListModelBiasJobDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_bias_job_definitions_response_of_yojson
      ~error_deserializer
end

module ListModelCardExportJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_card_export_jobs_request) =
    let input = Json_serializers.list_model_card_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelCardExportJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_model_card_export_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_card_export_jobs_request) =
    let input = Json_serializers.list_model_card_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListModelCardExportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_card_export_jobs_response_of_yojson
      ~error_deserializer
end

module ListModelCards = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_cards_request) =
    let input = Json_serializers.list_model_cards_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelCards" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_model_cards_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_cards_request) =
    let input = Json_serializers.list_model_cards_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListModelCards"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_cards_response_of_yojson
      ~error_deserializer
end

module ListModelCardVersions = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_card_versions_request) =
    let input = Json_serializers.list_model_card_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelCardVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_model_card_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_card_versions_request) =
    let input = Json_serializers.list_model_card_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListModelCardVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_card_versions_response_of_yojson
      ~error_deserializer
end

module ListModelExplainabilityJobDefinitions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_explainability_job_definitions_request) =
    let input =
      Json_serializers.list_model_explainability_job_definitions_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.ListModelExplainabilityJobDefinitions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_model_explainability_job_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_explainability_job_definitions_request) =
    let input =
      Json_serializers.list_model_explainability_job_definitions_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListModelExplainabilityJobDefinitions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_model_explainability_job_definitions_response_of_yojson
      ~error_deserializer
end

module ListModelMetadata = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_metadata_request) =
    let input = Json_serializers.list_model_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelMetadata" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_model_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_metadata_request) =
    let input = Json_serializers.list_model_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListModelMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_metadata_response_of_yojson
      ~error_deserializer
end

module ListModelPackageGroups = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_package_groups_input) =
    let input = Json_serializers.list_model_package_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelPackageGroups" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_model_package_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_package_groups_input) =
    let input = Json_serializers.list_model_package_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListModelPackageGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_package_groups_output_of_yojson
      ~error_deserializer
end

module ListModelPackages = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_packages_input) =
    let input = Json_serializers.list_model_packages_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelPackages" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_model_packages_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_packages_input) =
    let input = Json_serializers.list_model_packages_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListModelPackages"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_packages_output_of_yojson
      ~error_deserializer
end

module ListModelQualityJobDefinitions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_model_quality_job_definitions_request) =
    let input = Json_serializers.list_model_quality_job_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModelQualityJobDefinitions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_quality_job_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_quality_job_definitions_request) =
    let input = Json_serializers.list_model_quality_job_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListModelQualityJobDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_quality_job_definitions_response_of_yojson
      ~error_deserializer
end

module ListModels = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_models_input) =
    let input = Json_serializers.list_models_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListModels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_models_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_models_input) =
    let input = Json_serializers.list_models_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListModels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_models_output_of_yojson
      ~error_deserializer
end

module ListMonitoringAlertHistory = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_monitoring_alert_history_request) =
    let input = Json_serializers.list_monitoring_alert_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListMonitoringAlertHistory" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_alert_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_monitoring_alert_history_request) =
    let input = Json_serializers.list_monitoring_alert_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListMonitoringAlertHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_alert_history_response_of_yojson
      ~error_deserializer
end

module ListMonitoringAlerts = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_monitoring_alerts_request) =
    let input = Json_serializers.list_monitoring_alerts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListMonitoringAlerts" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_alerts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_monitoring_alerts_request) =
    let input = Json_serializers.list_monitoring_alerts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListMonitoringAlerts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_alerts_response_of_yojson
      ~error_deserializer
end

module ListMonitoringExecutions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_monitoring_executions_request) =
    let input = Json_serializers.list_monitoring_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListMonitoringExecutions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_monitoring_executions_request) =
    let input = Json_serializers.list_monitoring_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListMonitoringExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_executions_response_of_yojson
      ~error_deserializer
end

module ListMonitoringSchedules = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_monitoring_schedules_request) =
    let input = Json_serializers.list_monitoring_schedules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListMonitoringSchedules" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_schedules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_monitoring_schedules_request) =
    let input = Json_serializers.list_monitoring_schedules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListMonitoringSchedules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_monitoring_schedules_response_of_yojson
      ~error_deserializer
end

module ListNotebookInstanceLifecycleConfigs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_notebook_instance_lifecycle_configs_input) =
    let input = Json_serializers.list_notebook_instance_lifecycle_configs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListNotebookInstanceLifecycleConfigs"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_notebook_instance_lifecycle_configs_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_notebook_instance_lifecycle_configs_input) =
    let input = Json_serializers.list_notebook_instance_lifecycle_configs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListNotebookInstanceLifecycleConfigs" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_notebook_instance_lifecycle_configs_output_of_yojson
      ~error_deserializer
end

module ListNotebookInstances = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_notebook_instances_input) =
    let input = Json_serializers.list_notebook_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListNotebookInstances" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_notebook_instances_input) =
    let input = Json_serializers.list_notebook_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListNotebookInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_instances_output_of_yojson
      ~error_deserializer
end

module ListOptimizationJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_optimization_jobs_request) =
    let input = Json_serializers.list_optimization_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListOptimizationJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_optimization_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_optimization_jobs_request) =
    let input = Json_serializers.list_optimization_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListOptimizationJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_optimization_jobs_response_of_yojson
      ~error_deserializer
end

module ListPartnerApps = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_partner_apps_request) =
    let input = Json_serializers.list_partner_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListPartnerApps" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_partner_apps_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_partner_apps_request) =
    let input = Json_serializers.list_partner_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListPartnerApps"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_partner_apps_response_of_yojson
      ~error_deserializer
end

module ListPipelineExecutions = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipeline_executions_request) =
    let input = Json_serializers.list_pipeline_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListPipelineExecutions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipeline_executions_request) =
    let input = Json_serializers.list_pipeline_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListPipelineExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_executions_response_of_yojson
      ~error_deserializer
end

module ListPipelineExecutionSteps = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipeline_execution_steps_request) =
    let input = Json_serializers.list_pipeline_execution_steps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListPipelineExecutionSteps" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_execution_steps_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipeline_execution_steps_request) =
    let input = Json_serializers.list_pipeline_execution_steps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListPipelineExecutionSteps" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_execution_steps_response_of_yojson
      ~error_deserializer
end

module ListPipelineParametersForExecution = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipeline_parameters_for_execution_request) =
    let input = Json_serializers.list_pipeline_parameters_for_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListPipelineParametersForExecution"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_pipeline_parameters_for_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipeline_parameters_for_execution_request) =
    let input = Json_serializers.list_pipeline_parameters_for_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListPipelineParametersForExecution" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_pipeline_parameters_for_execution_response_of_yojson
      ~error_deserializer
end

module ListPipelines = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipelines_request) =
    let input = Json_serializers.list_pipelines_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListPipelines" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_pipelines_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipelines_request) =
    let input = Json_serializers.list_pipelines_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListPipelines" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_pipelines_response_of_yojson
      ~error_deserializer
end

module ListPipelineVersions = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipeline_versions_request) =
    let input = Json_serializers.list_pipeline_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListPipelineVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipeline_versions_request) =
    let input = Json_serializers.list_pipeline_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListPipelineVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_versions_response_of_yojson
      ~error_deserializer
end

module ListProcessingJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_processing_jobs_request) =
    let input = Json_serializers.list_processing_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListProcessingJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_processing_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_processing_jobs_request) =
    let input = Json_serializers.list_processing_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListProcessingJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_processing_jobs_response_of_yojson
      ~error_deserializer
end

module ListProjects = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_projects_input) =
    let input = Json_serializers.list_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListProjects" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_projects_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_projects_input) =
    let input = Json_serializers.list_projects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListProjects" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_projects_output_of_yojson
      ~error_deserializer
end

module ListResourceCatalogs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_catalogs_request) =
    let input = Json_serializers.list_resource_catalogs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListResourceCatalogs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_catalogs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resource_catalogs_request) =
    let input = Json_serializers.list_resource_catalogs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListResourceCatalogs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_catalogs_response_of_yojson
      ~error_deserializer
end

module ListSpaces = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_spaces_request) =
    let input = Json_serializers.list_spaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListSpaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_spaces_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_spaces_request) =
    let input = Json_serializers.list_spaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListSpaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_spaces_response_of_yojson
      ~error_deserializer
end

module ListStageDevices = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_stage_devices_request) =
    let input = Json_serializers.list_stage_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListStageDevices" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_stage_devices_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_stage_devices_request) =
    let input = Json_serializers.list_stage_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListStageDevices"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_stage_devices_response_of_yojson
      ~error_deserializer
end

module ListStudioLifecycleConfigs = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_studio_lifecycle_configs_request) =
    let input = Json_serializers.list_studio_lifecycle_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListStudioLifecycleConfigs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_studio_lifecycle_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_studio_lifecycle_configs_request) =
    let input = Json_serializers.list_studio_lifecycle_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListStudioLifecycleConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_studio_lifecycle_configs_response_of_yojson
      ~error_deserializer
end

module ListSubscribedWorkteams = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_subscribed_workteams_request) =
    let input = Json_serializers.list_subscribed_workteams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListSubscribedWorkteams" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_subscribed_workteams_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_subscribed_workteams_request) =
    let input = Json_serializers.list_subscribed_workteams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListSubscribedWorkteams" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_subscribed_workteams_response_of_yojson
      ~error_deserializer
end

module ListTags = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_input) =
    let input = Json_serializers.list_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_tags_input) =
    let input = Json_serializers.list_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tags_output_of_yojson
      ~error_deserializer
end

module ListTrainingJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_training_jobs_request) =
    let input = Json_serializers.list_training_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListTrainingJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_training_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_training_jobs_request) =
    let input = Json_serializers.list_training_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListTrainingJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_training_jobs_response_of_yojson
      ~error_deserializer
end

module ListTrainingJobsForHyperParameterTuningJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_training_jobs_for_hyper_parameter_tuning_job_request) =
    let input =
      Json_serializers.list_training_jobs_for_hyper_parameter_tuning_job_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.ListTrainingJobsForHyperParameterTuningJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_training_jobs_for_hyper_parameter_tuning_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_training_jobs_for_hyper_parameter_tuning_job_request) =
    let input =
      Json_serializers.list_training_jobs_for_hyper_parameter_tuning_job_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListTrainingJobsForHyperParameterTuningJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_training_jobs_for_hyper_parameter_tuning_job_response_of_yojson
      ~error_deserializer
end

module ListTrainingPlans = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_training_plans_request) =
    let input = Json_serializers.list_training_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListTrainingPlans" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_training_plans_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_training_plans_request) =
    let input = Json_serializers.list_training_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListTrainingPlans"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_training_plans_response_of_yojson
      ~error_deserializer
end

module ListTransformJobs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_transform_jobs_request) =
    let input = Json_serializers.list_transform_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListTransformJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_transform_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_transform_jobs_request) =
    let input = Json_serializers.list_transform_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListTransformJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_transform_jobs_response_of_yojson
      ~error_deserializer
end

module ListTrialComponents = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_trial_components_request) =
    let input = Json_serializers.list_trial_components_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListTrialComponents" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_trial_components_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_trial_components_request) =
    let input = Json_serializers.list_trial_components_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListTrialComponents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_trial_components_response_of_yojson
      ~error_deserializer
end

module ListTrials = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_trials_request) =
    let input = Json_serializers.list_trials_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListTrials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_trials_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_trials_request) =
    let input = Json_serializers.list_trials_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListTrials" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_trials_response_of_yojson
      ~error_deserializer
end

module ListUltraServersByReservedCapacity = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ultra_servers_by_reserved_capacity_request) =
    let input =
      Json_serializers.list_ultra_servers_by_reserved_capacity_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListUltraServersByReservedCapacity"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_ultra_servers_by_reserved_capacity_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_ultra_servers_by_reserved_capacity_request) =
    let input =
      Json_serializers.list_ultra_servers_by_reserved_capacity_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.ListUltraServersByReservedCapacity" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_ultra_servers_by_reserved_capacity_response_of_yojson
      ~error_deserializer
end

module ListUserProfiles = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_user_profiles_request) =
    let input = Json_serializers.list_user_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListUserProfiles" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_user_profiles_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_user_profiles_request) =
    let input = Json_serializers.list_user_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListUserProfiles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_profiles_response_of_yojson
      ~error_deserializer
end

module ListWorkforces = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workforces_request) =
    let input = Json_serializers.list_workforces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListWorkforces" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_workforces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workforces_request) =
    let input = Json_serializers.list_workforces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListWorkforces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workforces_response_of_yojson ~error_deserializer
end

module ListWorkteams = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workteams_request) =
    let input = Json_serializers.list_workteams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.ListWorkteams" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_workteams_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workteams_request) =
    let input = Json_serializers.list_workteams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.ListWorkteams" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_workteams_response_of_yojson
      ~error_deserializer
end

module PutModelPackageGroupPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_model_package_group_policy_input) =
    let input = Json_serializers.put_model_package_group_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.PutModelPackageGroupPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_model_package_group_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_model_package_group_policy_input) =
    let input = Json_serializers.put_model_package_group_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.PutModelPackageGroupPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_model_package_group_policy_output_of_yojson
      ~error_deserializer
end

module QueryLineage = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : query_lineage_request) =
    let input = Json_serializers.query_lineage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.QueryLineage" ~service ~context
      ~input ~output_deserializer:Json_deserializers.query_lineage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : query_lineage_request) =
    let input = Json_serializers.query_lineage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.QueryLineage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.query_lineage_response_of_yojson
      ~error_deserializer
end

module RegisterDevices = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_devices_request) =
    let input = Json_serializers.register_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.RegisterDevices" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_devices_request) =
    let input = Json_serializers.register_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.RegisterDevices"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RenderUiTemplate = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : render_ui_template_request) =
    let input = Json_serializers.render_ui_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.RenderUiTemplate" ~service ~context
      ~input ~output_deserializer:Json_deserializers.render_ui_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : render_ui_template_request) =
    let input = Json_serializers.render_ui_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.RenderUiTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.render_ui_template_response_of_yojson
      ~error_deserializer
end

module RetryPipelineExecution = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : retry_pipeline_execution_request) =
    let input = Json_serializers.retry_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.RetryPipelineExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.retry_pipeline_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : retry_pipeline_execution_request) =
    let input = Json_serializers.retry_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.RetryPipelineExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.retry_pipeline_execution_response_of_yojson
      ~error_deserializer
end

module Search = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_request) =
    let input = Json_serializers.search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.Search" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : search_request) =
    let input = Json_serializers.search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.Search" ~service
      ~context ~input ~output_deserializer:Json_deserializers.search_response_of_yojson
      ~error_deserializer
end

module SearchTrainingPlanOfferings = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_training_plan_offerings_request) =
    let input = Json_serializers.search_training_plan_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.SearchTrainingPlanOfferings" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.search_training_plan_offerings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_training_plan_offerings_request) =
    let input = Json_serializers.search_training_plan_offerings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.SearchTrainingPlanOfferings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_training_plan_offerings_response_of_yojson
      ~error_deserializer
end

module SendPipelineExecutionStepFailure = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_pipeline_execution_step_failure_request) =
    let input = Json_serializers.send_pipeline_execution_step_failure_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.SendPipelineExecutionStepFailure"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.send_pipeline_execution_step_failure_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_pipeline_execution_step_failure_request) =
    let input = Json_serializers.send_pipeline_execution_step_failure_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.SendPipelineExecutionStepFailure" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.send_pipeline_execution_step_failure_response_of_yojson
      ~error_deserializer
end

module SendPipelineExecutionStepSuccess = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_pipeline_execution_step_success_request) =
    let input = Json_serializers.send_pipeline_execution_step_success_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.SendPipelineExecutionStepSuccess"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.send_pipeline_execution_step_success_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_pipeline_execution_step_success_request) =
    let input = Json_serializers.send_pipeline_execution_step_success_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.SendPipelineExecutionStepSuccess" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.send_pipeline_execution_step_success_response_of_yojson
      ~error_deserializer
end

module StartClusterHealthCheck = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_cluster_health_check_request) =
    let input = Json_serializers.start_cluster_health_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartClusterHealthCheck" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_cluster_health_check_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_cluster_health_check_request) =
    let input = Json_serializers.start_cluster_health_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StartClusterHealthCheck" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_cluster_health_check_response_of_yojson
      ~error_deserializer
end

module StartEdgeDeploymentStage = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_edge_deployment_stage_request) =
    let input = Json_serializers.start_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartEdgeDeploymentStage" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_edge_deployment_stage_request) =
    let input = Json_serializers.start_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StartEdgeDeploymentStage" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartInferenceExperiment = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_inference_experiment_request) =
    let input = Json_serializers.start_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartInferenceExperiment" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_inference_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_inference_experiment_request) =
    let input = Json_serializers.start_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StartInferenceExperiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_inference_experiment_response_of_yojson
      ~error_deserializer
end

module StartMlflowTrackingServer = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_mlflow_tracking_server_request) =
    let input = Json_serializers.start_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartMlflowTrackingServer" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_mlflow_tracking_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_mlflow_tracking_server_request) =
    let input = Json_serializers.start_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StartMlflowTrackingServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_mlflow_tracking_server_response_of_yojson
      ~error_deserializer
end

module StartMonitoringSchedule = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_monitoring_schedule_request) =
    let input = Json_serializers.start_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartMonitoringSchedule" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_monitoring_schedule_request) =
    let input = Json_serializers.start_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StartMonitoringSchedule" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartNotebookInstance = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_notebook_instance_input) =
    let input = Json_serializers.start_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartNotebookInstance" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_notebook_instance_input) =
    let input = Json_serializers.start_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StartNotebookInstance"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartPipelineExecution = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_pipeline_execution_request) =
    let input = Json_serializers.start_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartPipelineExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_pipeline_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_pipeline_execution_request) =
    let input = Json_serializers.start_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StartPipelineExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_pipeline_execution_response_of_yojson
      ~error_deserializer
end

module StartSession = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_session_request) =
    let input = Json_serializers.start_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StartSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_session_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_session_request) =
    let input = Json_serializers.start_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StartSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_session_response_of_yojson
      ~error_deserializer
end

module StopAIBenchmarkJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_ai_benchmark_job_request) =
    let input = Json_serializers.stop_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopAIBenchmarkJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_ai_benchmark_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_ai_benchmark_job_request) =
    let input = Json_serializers.stop_ai_benchmark_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopAIBenchmarkJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_ai_benchmark_job_response_of_yojson
      ~error_deserializer
end

module StopAIRecommendationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_ai_recommendation_job_request) =
    let input = Json_serializers.stop_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopAIRecommendationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_ai_recommendation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_ai_recommendation_job_request) =
    let input = Json_serializers.stop_ai_recommendation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StopAIRecommendationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_ai_recommendation_job_response_of_yojson
      ~error_deserializer
end

module StopAutoMLJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_auto_ml_job_request) =
    let input = Json_serializers.stop_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopAutoMLJob" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_auto_ml_job_request) =
    let input = Json_serializers.stop_auto_ml_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopAutoMLJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopCompilationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_compilation_job_request) =
    let input = Json_serializers.stop_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopCompilationJob" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_compilation_job_request) =
    let input = Json_serializers.stop_compilation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopCompilationJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopEdgeDeploymentStage = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_edge_deployment_stage_request) =
    let input = Json_serializers.stop_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopEdgeDeploymentStage" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_edge_deployment_stage_request) =
    let input = Json_serializers.stop_edge_deployment_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StopEdgeDeploymentStage" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopEdgePackagingJob = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_edge_packaging_job_request) =
    let input = Json_serializers.stop_edge_packaging_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopEdgePackagingJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_edge_packaging_job_request) =
    let input = Json_serializers.stop_edge_packaging_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopEdgePackagingJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopHyperParameterTuningJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.stop_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopHyperParameterTuningJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_hyper_parameter_tuning_job_request) =
    let input = Json_serializers.stop_hyper_parameter_tuning_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StopHyperParameterTuningJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopInferenceExperiment = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_inference_experiment_request) =
    let input = Json_serializers.stop_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopInferenceExperiment" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_inference_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_inference_experiment_request) =
    let input = Json_serializers.stop_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StopInferenceExperiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_inference_experiment_response_of_yojson
      ~error_deserializer
end

module StopInferenceRecommendationsJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_inference_recommendations_job_request) =
    let input = Json_serializers.stop_inference_recommendations_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopInferenceRecommendationsJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_inference_recommendations_job_request) =
    let input = Json_serializers.stop_inference_recommendations_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StopInferenceRecommendationsJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_job_request) =
    let input = Json_serializers.stop_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_job_request) =
    let input = Json_serializers.stop_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_job_response_of_yojson
      ~error_deserializer
end

module StopLabelingJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_labeling_job_request) =
    let input = Json_serializers.stop_labeling_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopLabelingJob" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_labeling_job_request) =
    let input = Json_serializers.stop_labeling_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopLabelingJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopMlflowTrackingServer = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_mlflow_tracking_server_request) =
    let input = Json_serializers.stop_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopMlflowTrackingServer" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_mlflow_tracking_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_mlflow_tracking_server_request) =
    let input = Json_serializers.stop_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.StopMlflowTrackingServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_mlflow_tracking_server_response_of_yojson
      ~error_deserializer
end

module StopMonitoringSchedule = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_monitoring_schedule_request) =
    let input = Json_serializers.stop_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopMonitoringSchedule" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_monitoring_schedule_request) =
    let input = Json_serializers.stop_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopMonitoringSchedule"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopNotebookInstance = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_notebook_instance_input) =
    let input = Json_serializers.stop_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopNotebookInstance" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_notebook_instance_input) =
    let input = Json_serializers.stop_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopNotebookInstance"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopOptimizationJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_optimization_job_request) =
    let input = Json_serializers.stop_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopOptimizationJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_optimization_job_request) =
    let input = Json_serializers.stop_optimization_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopOptimizationJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopPipelineExecution = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_pipeline_execution_request) =
    let input = Json_serializers.stop_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopPipelineExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_pipeline_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_pipeline_execution_request) =
    let input = Json_serializers.stop_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopPipelineExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_pipeline_execution_response_of_yojson
      ~error_deserializer
end

module StopProcessingJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_processing_job_request) =
    let input = Json_serializers.stop_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopProcessingJob" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_processing_job_request) =
    let input = Json_serializers.stop_processing_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopProcessingJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopTrainingJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_training_job_request) =
    let input = Json_serializers.stop_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopTrainingJob" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_training_job_request) =
    let input = Json_serializers.stop_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopTrainingJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopTransformJob = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_transform_job_request) =
    let input = Json_serializers.stop_transform_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.StopTransformJob" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_transform_job_request) =
    let input = Json_serializers.stop_transform_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.StopTransformJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateAction = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_action_request) =
    let input = Json_serializers.update_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateAction" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_action_request) =
    let input = Json_serializers.update_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateAction" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_action_response_of_yojson
      ~error_deserializer
end

module UpdateAppImageConfig = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_app_image_config_request) =
    let input = Json_serializers.update_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateAppImageConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_app_image_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_app_image_config_request) =
    let input = Json_serializers.update_app_image_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateAppImageConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_app_image_config_response_of_yojson
      ~error_deserializer
end

module UpdateArtifact = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_artifact_request) =
    let input = Json_serializers.update_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateArtifact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_artifact_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_artifact_request) =
    let input = Json_serializers.update_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateArtifact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_artifact_response_of_yojson ~error_deserializer
end

module UpdateCluster = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateCluster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson
      ~error_deserializer
end

module UpdateClusterSchedulerConfig = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cluster_scheduler_config_request) =
    let input = Json_serializers.update_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateClusterSchedulerConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_scheduler_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cluster_scheduler_config_request) =
    let input = Json_serializers.update_cluster_scheduler_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateClusterSchedulerConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_scheduler_config_response_of_yojson
      ~error_deserializer
end

module UpdateClusterSoftware = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cluster_software_request) =
    let input = Json_serializers.update_cluster_software_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateClusterSoftware" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_software_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cluster_software_request) =
    let input = Json_serializers.update_cluster_software_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateClusterSoftware"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_software_response_of_yojson
      ~error_deserializer
end

module UpdateCodeRepository = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_code_repository_input) =
    let input = Json_serializers.update_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateCodeRepository" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_code_repository_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_code_repository_input) =
    let input = Json_serializers.update_code_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateCodeRepository"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_code_repository_output_of_yojson
      ~error_deserializer
end

module UpdateComputeQuota = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_compute_quota_request) =
    let input = Json_serializers.update_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateComputeQuota" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_compute_quota_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_compute_quota_request) =
    let input = Json_serializers.update_compute_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateComputeQuota"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_compute_quota_response_of_yojson
      ~error_deserializer
end

module UpdateContext = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_context_request) =
    let input = Json_serializers.update_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateContext" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_context_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_context_request) =
    let input = Json_serializers.update_context_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateContext" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_context_response_of_yojson
      ~error_deserializer
end

module UpdateDeviceFleet = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_device_fleet_request) =
    let input = Json_serializers.update_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateDeviceFleet" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_device_fleet_request) =
    let input = Json_serializers.update_device_fleet_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateDeviceFleet"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateDevices = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_devices_request) =
    let input = Json_serializers.update_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateDevices" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_devices_request) =
    let input = Json_serializers.update_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateDevices" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateDomain = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_domain_request) =
    let input = Json_serializers.update_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateDomain" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_domain_request) =
    let input = Json_serializers.update_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_domain_response_of_yojson
      ~error_deserializer
end

module UpdateEndpoint = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_endpoint_input) =
    let input = Json_serializers.update_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_endpoint_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_endpoint_input) =
    let input = Json_serializers.update_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_endpoint_output_of_yojson ~error_deserializer
end

module UpdateEndpointWeightsAndCapacities = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_endpoint_weights_and_capacities_input) =
    let input = Json_serializers.update_endpoint_weights_and_capacities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateEndpointWeightsAndCapacities"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_endpoint_weights_and_capacities_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_endpoint_weights_and_capacities_input) =
    let input = Json_serializers.update_endpoint_weights_and_capacities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateEndpointWeightsAndCapacities" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_endpoint_weights_and_capacities_output_of_yojson
      ~error_deserializer
end

module UpdateExperiment = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_experiment_request) =
    let input = Json_serializers.update_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateExperiment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_experiment_request) =
    let input = Json_serializers.update_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateExperiment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_experiment_response_of_yojson
      ~error_deserializer
end

module UpdateFeatureGroup = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_feature_group_request) =
    let input = Json_serializers.update_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateFeatureGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_feature_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_feature_group_request) =
    let input = Json_serializers.update_feature_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateFeatureGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_feature_group_response_of_yojson
      ~error_deserializer
end

module UpdateFeatureMetadata = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_feature_metadata_request) =
    let input = Json_serializers.update_feature_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateFeatureMetadata" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_feature_metadata_request) =
    let input = Json_serializers.update_feature_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateFeatureMetadata"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateHub = struct
  let error_to_string = function
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_hub_request) =
    let input = Json_serializers.update_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateHub" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_hub_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_hub_request) =
    let input = Json_serializers.update_hub_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateHub" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_hub_response_of_yojson
      ~error_deserializer
end

module UpdateHubContent = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_hub_content_request) =
    let input = Json_serializers.update_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateHubContent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_hub_content_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_hub_content_request) =
    let input = Json_serializers.update_hub_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateHubContent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_hub_content_response_of_yojson
      ~error_deserializer
end

module UpdateHubContentReference = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_hub_content_reference_request) =
    let input = Json_serializers.update_hub_content_reference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateHubContentReference" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_hub_content_reference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_hub_content_reference_request) =
    let input = Json_serializers.update_hub_content_reference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateHubContentReference" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_hub_content_reference_response_of_yojson
      ~error_deserializer
end

module UpdateImage = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_image_request) =
    let input = Json_serializers.update_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_image_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_image_request) =
    let input = Json_serializers.update_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_image_response_of_yojson
      ~error_deserializer
end

module UpdateImageVersion = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_image_version_request) =
    let input = Json_serializers.update_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateImageVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_image_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_image_version_request) =
    let input = Json_serializers.update_image_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateImageVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_image_version_response_of_yojson
      ~error_deserializer
end

module UpdateInferenceComponent = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_inference_component_input) =
    let input = Json_serializers.update_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateInferenceComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_inference_component_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_inference_component_input) =
    let input = Json_serializers.update_inference_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateInferenceComponent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_inference_component_output_of_yojson
      ~error_deserializer
end

module UpdateInferenceComponentRuntimeConfig = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_inference_component_runtime_config_input) =
    let input =
      Json_serializers.update_inference_component_runtime_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.UpdateInferenceComponentRuntimeConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_inference_component_runtime_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_inference_component_runtime_config_input) =
    let input =
      Json_serializers.update_inference_component_runtime_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateInferenceComponentRuntimeConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_inference_component_runtime_config_output_of_yojson
      ~error_deserializer
end

module UpdateInferenceExperiment = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_inference_experiment_request) =
    let input = Json_serializers.update_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateInferenceExperiment" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_inference_experiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_inference_experiment_request) =
    let input = Json_serializers.update_inference_experiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateInferenceExperiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_inference_experiment_response_of_yojson
      ~error_deserializer
end

module UpdateMlflowApp = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_mlflow_app_request) =
    let input = Json_serializers.update_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateMlflowApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_mlflow_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_mlflow_app_request) =
    let input = Json_serializers.update_mlflow_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateMlflowApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_mlflow_app_response_of_yojson
      ~error_deserializer
end

module UpdateMlflowTrackingServer = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_mlflow_tracking_server_request) =
    let input = Json_serializers.update_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateMlflowTrackingServer" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_mlflow_tracking_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_mlflow_tracking_server_request) =
    let input = Json_serializers.update_mlflow_tracking_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateMlflowTrackingServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_mlflow_tracking_server_response_of_yojson
      ~error_deserializer
end

module UpdateModelCard = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_model_card_request) =
    let input = Json_serializers.update_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateModelCard" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_model_card_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_model_card_request) =
    let input = Json_serializers.update_model_card_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateModelCard"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_card_response_of_yojson
      ~error_deserializer
end

module UpdateModelPackage = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_model_package_input) =
    let input = Json_serializers.update_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateModelPackage" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_model_package_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_model_package_input) =
    let input = Json_serializers.update_model_package_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateModelPackage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_package_output_of_yojson
      ~error_deserializer
end

module UpdateMonitoringAlert = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_monitoring_alert_request) =
    let input = Json_serializers.update_monitoring_alert_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateMonitoringAlert" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_monitoring_alert_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_monitoring_alert_request) =
    let input = Json_serializers.update_monitoring_alert_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateMonitoringAlert"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_monitoring_alert_response_of_yojson
      ~error_deserializer
end

module UpdateMonitoringSchedule = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_monitoring_schedule_request) =
    let input = Json_serializers.update_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateMonitoringSchedule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_monitoring_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_monitoring_schedule_request) =
    let input = Json_serializers.update_monitoring_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateMonitoringSchedule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_monitoring_schedule_response_of_yojson
      ~error_deserializer
end

module UpdateNotebookInstance = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_notebook_instance_input) =
    let input = Json_serializers.update_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateNotebookInstance" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_notebook_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_notebook_instance_input) =
    let input = Json_serializers.update_notebook_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateNotebookInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_notebook_instance_output_of_yojson
      ~error_deserializer
end

module UpdateNotebookInstanceLifecycleConfig = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.update_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SageMaker.UpdateNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_notebook_instance_lifecycle_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_notebook_instance_lifecycle_config_input) =
    let input =
      Json_serializers.update_notebook_instance_lifecycle_config_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdateNotebookInstanceLifecycleConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_notebook_instance_lifecycle_config_output_of_yojson
      ~error_deserializer
end

module UpdatePartnerApp = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_partner_app_request) =
    let input = Json_serializers.update_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdatePartnerApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_partner_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_partner_app_request) =
    let input = Json_serializers.update_partner_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdatePartnerApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_partner_app_response_of_yojson
      ~error_deserializer
end

module UpdatePipeline = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pipeline_request) =
    let input = Json_serializers.update_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdatePipeline" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_pipeline_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pipeline_request) =
    let input = Json_serializers.update_pipeline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdatePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pipeline_response_of_yojson ~error_deserializer
end

module UpdatePipelineExecution = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pipeline_execution_request) =
    let input = Json_serializers.update_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdatePipelineExecution" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_pipeline_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pipeline_execution_request) =
    let input = Json_serializers.update_pipeline_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SageMaker.UpdatePipelineExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pipeline_execution_response_of_yojson
      ~error_deserializer
end

module UpdatePipelineVersion = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pipeline_version_request) =
    let input = Json_serializers.update_pipeline_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdatePipelineVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_pipeline_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pipeline_version_request) =
    let input = Json_serializers.update_pipeline_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdatePipelineVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pipeline_version_response_of_yojson
      ~error_deserializer
end

module UpdateProject = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_project_input) =
    let input = Json_serializers.update_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateProject" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_project_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_project_input) =
    let input = Json_serializers.update_project_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_project_output_of_yojson
      ~error_deserializer
end

module UpdateSpace = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_space_request) =
    let input = Json_serializers.update_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateSpace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_space_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_space_request) =
    let input = Json_serializers.update_space_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateSpace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_space_response_of_yojson
      ~error_deserializer
end

module UpdateTrainingJob = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_training_job_request) =
    let input = Json_serializers.update_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateTrainingJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_training_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_training_job_request) =
    let input = Json_serializers.update_training_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateTrainingJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_training_job_response_of_yojson
      ~error_deserializer
end

module UpdateTrial = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_trial_request) =
    let input = Json_serializers.update_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateTrial" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_trial_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_trial_request) =
    let input = Json_serializers.update_trial_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateTrial" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_trial_response_of_yojson
      ~error_deserializer
end

module UpdateTrialComponent = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_trial_component_request) =
    let input = Json_serializers.update_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateTrialComponent" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_trial_component_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_trial_component_request) =
    let input = Json_serializers.update_trial_component_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateTrialComponent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_trial_component_response_of_yojson
      ~error_deserializer
end

module UpdateUserProfile = struct
  let error_to_string = function
    | `ResourceInUse _ -> "com.amazonaws.sagemaker#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | `ResourceNotFound _ -> "com.amazonaws.sagemaker#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_profile_request) =
    let input = Json_serializers.update_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateUserProfile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_user_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_profile_request) =
    let input = Json_serializers.update_user_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateUserProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_profile_response_of_yojson
      ~error_deserializer
end

module UpdateWorkforce = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sagemaker#ConflictException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workforce_request) =
    let input = Json_serializers.update_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateWorkforce" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_workforce_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workforce_request) =
    let input = Json_serializers.update_workforce_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateWorkforce"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workforce_response_of_yojson
      ~error_deserializer
end

module UpdateWorkteam = struct
  let error_to_string = function
    | `ResourceLimitExceeded _ -> "com.amazonaws.sagemaker#ResourceLimitExceeded"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workteam_request) =
    let input = Json_serializers.update_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SageMaker.UpdateWorkteam" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_workteam_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workteam_request) =
    let input = Json_serializers.update_workteam_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SageMaker.UpdateWorkteam"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workteam_response_of_yojson ~error_deserializer
end
