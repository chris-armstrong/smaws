open Types
open Service_metadata

module AddTagsToOnPremisesInstances = struct
  let error_to_string = function
    | `InstanceLimitExceededException _ -> "com.amazonaws.codedeploy#InstanceLimitExceededException"
    | `InstanceNameRequiredException _ -> "com.amazonaws.codedeploy#InstanceNameRequiredException"
    | `InstanceNotRegisteredException _ -> "com.amazonaws.codedeploy#InstanceNotRegisteredException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | `InvalidTagException _ -> "com.amazonaws.codedeploy#InvalidTagException"
    | `TagLimitExceededException _ -> "com.amazonaws.codedeploy#TagLimitExceededException"
    | `TagRequiredException _ -> "com.amazonaws.codedeploy#TagRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InstanceLimitExceededException" ->
          `InstanceLimitExceededException
            (Json_deserializers.instance_limit_exceeded_exception_of_yojson tree path)
      | _, "InstanceNameRequiredException" ->
          `InstanceNameRequiredException
            (Json_deserializers.instance_name_required_exception_of_yojson tree path)
      | _, "InstanceNotRegisteredException" ->
          `InstanceNotRegisteredException
            (Json_deserializers.instance_not_registered_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "TagLimitExceededException" ->
          `TagLimitExceededException
            (Json_deserializers.tag_limit_exceeded_exception_of_yojson tree path)
      | _, "TagRequiredException" ->
          `TagRequiredException (Json_deserializers.tag_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_to_on_premises_instances_input) =
    let input = Json_serializers.add_tags_to_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.AddTagsToOnPremisesInstances" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_tags_to_on_premises_instances_input) =
    let input = Json_serializers.add_tags_to_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.AddTagsToOnPremisesInstances" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module BatchGetApplicationRevisions = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `BatchLimitExceededException _ -> "com.amazonaws.codedeploy#BatchLimitExceededException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidRevisionException _ -> "com.amazonaws.codedeploy#InvalidRevisionException"
    | `RevisionRequiredException _ -> "com.amazonaws.codedeploy#RevisionRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "BatchLimitExceededException" ->
          `BatchLimitExceededException
            (Json_deserializers.batch_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidRevisionException" ->
          `InvalidRevisionException
            (Json_deserializers.invalid_revision_exception_of_yojson tree path)
      | _, "RevisionRequiredException" ->
          `RevisionRequiredException
            (Json_deserializers.revision_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_application_revisions_input) =
    let input = Json_serializers.batch_get_application_revisions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.BatchGetApplicationRevisions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_application_revisions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_application_revisions_input) =
    let input = Json_serializers.batch_get_application_revisions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.BatchGetApplicationRevisions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_application_revisions_output_of_yojson
      ~error_deserializer
end

module BatchGetApplications = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `BatchLimitExceededException _ -> "com.amazonaws.codedeploy#BatchLimitExceededException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "BatchLimitExceededException" ->
          `BatchLimitExceededException
            (Json_deserializers.batch_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_applications_input) =
    let input = Json_serializers.batch_get_applications_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.BatchGetApplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_applications_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_applications_input) =
    let input = Json_serializers.batch_get_applications_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.BatchGetApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_applications_output_of_yojson
      ~error_deserializer
end

module BatchGetDeploymentGroups = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `BatchLimitExceededException _ -> "com.amazonaws.codedeploy#BatchLimitExceededException"
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentGroupNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidDeploymentGroupNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentGroupNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "BatchLimitExceededException" ->
          `BatchLimitExceededException
            (Json_deserializers.batch_limit_exceeded_exception_of_yojson tree path)
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupNameRequiredException" ->
          `DeploymentGroupNameRequiredException
            (Json_deserializers.deployment_group_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentGroupNameException" ->
          `InvalidDeploymentGroupNameException
            (Json_deserializers.invalid_deployment_group_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_deployment_groups_input) =
    let input = Json_serializers.batch_get_deployment_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.BatchGetDeploymentGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployment_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_deployment_groups_input) =
    let input = Json_serializers.batch_get_deployment_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.BatchGetDeploymentGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployment_groups_output_of_yojson
      ~error_deserializer
end

module BatchGetDeploymentInstances = struct
  let error_to_string = function
    | `BatchLimitExceededException _ -> "com.amazonaws.codedeploy#BatchLimitExceededException"
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `InstanceIdRequiredException _ -> "com.amazonaws.codedeploy#InstanceIdRequiredException"
    | `InvalidComputePlatformException _ ->
        "com.amazonaws.codedeploy#InvalidComputePlatformException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchLimitExceededException" ->
          `BatchLimitExceededException
            (Json_deserializers.batch_limit_exceeded_exception_of_yojson tree path)
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "InstanceIdRequiredException" ->
          `InstanceIdRequiredException
            (Json_deserializers.instance_id_required_exception_of_yojson tree path)
      | _, "InvalidComputePlatformException" ->
          `InvalidComputePlatformException
            (Json_deserializers.invalid_compute_platform_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_deployment_instances_input) =
    let input = Json_serializers.batch_get_deployment_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.BatchGetDeploymentInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployment_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_deployment_instances_input) =
    let input = Json_serializers.batch_get_deployment_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.BatchGetDeploymentInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployment_instances_output_of_yojson
      ~error_deserializer
end

module BatchGetDeployments = struct
  let error_to_string = function
    | `BatchLimitExceededException _ -> "com.amazonaws.codedeploy#BatchLimitExceededException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchLimitExceededException" ->
          `BatchLimitExceededException
            (Json_deserializers.batch_limit_exceeded_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_deployments_input) =
    let input = Json_serializers.batch_get_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.BatchGetDeployments"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployments_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_deployments_input) =
    let input = Json_serializers.batch_get_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.BatchGetDeployments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployments_output_of_yojson
      ~error_deserializer
end

module BatchGetDeploymentTargets = struct
  let error_to_string = function
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `DeploymentNotStartedException _ -> "com.amazonaws.codedeploy#DeploymentNotStartedException"
    | `DeploymentTargetDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentTargetDoesNotExistException"
    | `DeploymentTargetIdRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentTargetIdRequiredException"
    | `DeploymentTargetListSizeExceededException _ ->
        "com.amazonaws.codedeploy#DeploymentTargetListSizeExceededException"
    | `InstanceDoesNotExistException _ -> "com.amazonaws.codedeploy#InstanceDoesNotExistException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidDeploymentTargetIdException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentTargetIdException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "DeploymentNotStartedException" ->
          `DeploymentNotStartedException
            (Json_deserializers.deployment_not_started_exception_of_yojson tree path)
      | _, "DeploymentTargetDoesNotExistException" ->
          `DeploymentTargetDoesNotExistException
            (Json_deserializers.deployment_target_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentTargetIdRequiredException" ->
          `DeploymentTargetIdRequiredException
            (Json_deserializers.deployment_target_id_required_exception_of_yojson tree path)
      | _, "DeploymentTargetListSizeExceededException" ->
          `DeploymentTargetListSizeExceededException
            (Json_deserializers.deployment_target_list_size_exceeded_exception_of_yojson tree path)
      | _, "InstanceDoesNotExistException" ->
          `InstanceDoesNotExistException
            (Json_deserializers.instance_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidDeploymentTargetIdException" ->
          `InvalidDeploymentTargetIdException
            (Json_deserializers.invalid_deployment_target_id_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_deployment_targets_input) =
    let input = Json_serializers.batch_get_deployment_targets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.BatchGetDeploymentTargets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployment_targets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_deployment_targets_input) =
    let input = Json_serializers.batch_get_deployment_targets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.BatchGetDeploymentTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_deployment_targets_output_of_yojson
      ~error_deserializer
end

module BatchGetOnPremisesInstances = struct
  let error_to_string = function
    | `BatchLimitExceededException _ -> "com.amazonaws.codedeploy#BatchLimitExceededException"
    | `InstanceNameRequiredException _ -> "com.amazonaws.codedeploy#InstanceNameRequiredException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchLimitExceededException" ->
          `BatchLimitExceededException
            (Json_deserializers.batch_limit_exceeded_exception_of_yojson tree path)
      | _, "InstanceNameRequiredException" ->
          `InstanceNameRequiredException
            (Json_deserializers.instance_name_required_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_on_premises_instances_input) =
    let input = Json_serializers.batch_get_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.BatchGetOnPremisesInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_on_premises_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_on_premises_instances_input) =
    let input = Json_serializers.batch_get_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.BatchGetOnPremisesInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_on_premises_instances_output_of_yojson
      ~error_deserializer
end

module ContinueDeployment = struct
  let error_to_string = function
    | `DeploymentAlreadyCompletedException _ ->
        "com.amazonaws.codedeploy#DeploymentAlreadyCompletedException"
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `DeploymentIsNotInReadyStateException _ ->
        "com.amazonaws.codedeploy#DeploymentIsNotInReadyStateException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidDeploymentStatusException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentStatusException"
    | `InvalidDeploymentWaitTypeException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentWaitTypeException"
    | `UnsupportedActionForDeploymentTypeException _ ->
        "com.amazonaws.codedeploy#UnsupportedActionForDeploymentTypeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentAlreadyCompletedException" ->
          `DeploymentAlreadyCompletedException
            (Json_deserializers.deployment_already_completed_exception_of_yojson tree path)
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "DeploymentIsNotInReadyStateException" ->
          `DeploymentIsNotInReadyStateException
            (Json_deserializers.deployment_is_not_in_ready_state_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidDeploymentStatusException" ->
          `InvalidDeploymentStatusException
            (Json_deserializers.invalid_deployment_status_exception_of_yojson tree path)
      | _, "InvalidDeploymentWaitTypeException" ->
          `InvalidDeploymentWaitTypeException
            (Json_deserializers.invalid_deployment_wait_type_exception_of_yojson tree path)
      | _, "UnsupportedActionForDeploymentTypeException" ->
          `UnsupportedActionForDeploymentTypeException
            (Json_deserializers.unsupported_action_for_deployment_type_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : continue_deployment_input) =
    let input = Json_serializers.continue_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ContinueDeployment"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : continue_deployment_input) =
    let input = Json_serializers.continue_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ContinueDeployment" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `ApplicationAlreadyExistsException _ ->
        "com.amazonaws.codedeploy#ApplicationAlreadyExistsException"
    | `ApplicationLimitExceededException _ ->
        "com.amazonaws.codedeploy#ApplicationLimitExceededException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidComputePlatformException _ ->
        "com.amazonaws.codedeploy#InvalidComputePlatformException"
    | `InvalidTagsToAddException _ -> "com.amazonaws.codedeploy#InvalidTagsToAddException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationAlreadyExistsException" ->
          `ApplicationAlreadyExistsException
            (Json_deserializers.application_already_exists_exception_of_yojson tree path)
      | _, "ApplicationLimitExceededException" ->
          `ApplicationLimitExceededException
            (Json_deserializers.application_limit_exceeded_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidComputePlatformException" ->
          `InvalidComputePlatformException
            (Json_deserializers.invalid_compute_platform_exception_of_yojson tree path)
      | _, "InvalidTagsToAddException" ->
          `InvalidTagsToAddException
            (Json_deserializers.invalid_tags_to_add_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_input) =
    let input = Json_serializers.create_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.CreateApplication" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_application_input) =
    let input = Json_serializers.create_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.CreateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_output_of_yojson
      ~error_deserializer
end

module CreateDeployment = struct
  let error_to_string = function
    | `AlarmsLimitExceededException _ -> "com.amazonaws.codedeploy#AlarmsLimitExceededException"
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentGroupDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupDoesNotExistException"
    | `DeploymentGroupNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupNameRequiredException"
    | `DeploymentLimitExceededException _ ->
        "com.amazonaws.codedeploy#DeploymentLimitExceededException"
    | `DescriptionTooLongException _ -> "com.amazonaws.codedeploy#DescriptionTooLongException"
    | `InvalidAlarmConfigException _ -> "com.amazonaws.codedeploy#InvalidAlarmConfigException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidAutoRollbackConfigException _ ->
        "com.amazonaws.codedeploy#InvalidAutoRollbackConfigException"
    | `InvalidAutoScalingGroupException _ ->
        "com.amazonaws.codedeploy#InvalidAutoScalingGroupException"
    | `InvalidDeploymentConfigNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentConfigNameException"
    | `InvalidDeploymentGroupNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentGroupNameException"
    | `InvalidFileExistsBehaviorException _ ->
        "com.amazonaws.codedeploy#InvalidFileExistsBehaviorException"
    | `InvalidGitHubAccountTokenException _ ->
        "com.amazonaws.codedeploy#InvalidGitHubAccountTokenException"
    | `InvalidIgnoreApplicationStopFailuresValueException _ ->
        "com.amazonaws.codedeploy#InvalidIgnoreApplicationStopFailuresValueException"
    | `InvalidLoadBalancerInfoException _ ->
        "com.amazonaws.codedeploy#InvalidLoadBalancerInfoException"
    | `InvalidRevisionException _ -> "com.amazonaws.codedeploy#InvalidRevisionException"
    | `InvalidRoleException _ -> "com.amazonaws.codedeploy#InvalidRoleException"
    | `InvalidTargetInstancesException _ ->
        "com.amazonaws.codedeploy#InvalidTargetInstancesException"
    | `InvalidTrafficRoutingConfigurationException _ ->
        "com.amazonaws.codedeploy#InvalidTrafficRoutingConfigurationException"
    | `InvalidUpdateOutdatedInstancesOnlyValueException _ ->
        "com.amazonaws.codedeploy#InvalidUpdateOutdatedInstancesOnlyValueException"
    | `RevisionDoesNotExistException _ -> "com.amazonaws.codedeploy#RevisionDoesNotExistException"
    | `RevisionRequiredException _ -> "com.amazonaws.codedeploy#RevisionRequiredException"
    | `ThrottlingException _ -> "com.amazonaws.codedeploy#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlarmsLimitExceededException" ->
          `AlarmsLimitExceededException
            (Json_deserializers.alarms_limit_exceeded_exception_of_yojson tree path)
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupDoesNotExistException" ->
          `DeploymentGroupDoesNotExistException
            (Json_deserializers.deployment_group_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupNameRequiredException" ->
          `DeploymentGroupNameRequiredException
            (Json_deserializers.deployment_group_name_required_exception_of_yojson tree path)
      | _, "DeploymentLimitExceededException" ->
          `DeploymentLimitExceededException
            (Json_deserializers.deployment_limit_exceeded_exception_of_yojson tree path)
      | _, "DescriptionTooLongException" ->
          `DescriptionTooLongException
            (Json_deserializers.description_too_long_exception_of_yojson tree path)
      | _, "InvalidAlarmConfigException" ->
          `InvalidAlarmConfigException
            (Json_deserializers.invalid_alarm_config_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidAutoRollbackConfigException" ->
          `InvalidAutoRollbackConfigException
            (Json_deserializers.invalid_auto_rollback_config_exception_of_yojson tree path)
      | _, "InvalidAutoScalingGroupException" ->
          `InvalidAutoScalingGroupException
            (Json_deserializers.invalid_auto_scaling_group_exception_of_yojson tree path)
      | _, "InvalidDeploymentConfigNameException" ->
          `InvalidDeploymentConfigNameException
            (Json_deserializers.invalid_deployment_config_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentGroupNameException" ->
          `InvalidDeploymentGroupNameException
            (Json_deserializers.invalid_deployment_group_name_exception_of_yojson tree path)
      | _, "InvalidFileExistsBehaviorException" ->
          `InvalidFileExistsBehaviorException
            (Json_deserializers.invalid_file_exists_behavior_exception_of_yojson tree path)
      | _, "InvalidGitHubAccountTokenException" ->
          `InvalidGitHubAccountTokenException
            (Json_deserializers.invalid_git_hub_account_token_exception_of_yojson tree path)
      | _, "InvalidIgnoreApplicationStopFailuresValueException" ->
          `InvalidIgnoreApplicationStopFailuresValueException
            (Json_deserializers.invalid_ignore_application_stop_failures_value_exception_of_yojson
               tree path)
      | _, "InvalidLoadBalancerInfoException" ->
          `InvalidLoadBalancerInfoException
            (Json_deserializers.invalid_load_balancer_info_exception_of_yojson tree path)
      | _, "InvalidRevisionException" ->
          `InvalidRevisionException
            (Json_deserializers.invalid_revision_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "InvalidTargetInstancesException" ->
          `InvalidTargetInstancesException
            (Json_deserializers.invalid_target_instances_exception_of_yojson tree path)
      | _, "InvalidTrafficRoutingConfigurationException" ->
          `InvalidTrafficRoutingConfigurationException
            (Json_deserializers.invalid_traffic_routing_configuration_exception_of_yojson tree path)
      | _, "InvalidUpdateOutdatedInstancesOnlyValueException" ->
          `InvalidUpdateOutdatedInstancesOnlyValueException
            (Json_deserializers.invalid_update_outdated_instances_only_value_exception_of_yojson
               tree path)
      | _, "RevisionDoesNotExistException" ->
          `RevisionDoesNotExistException
            (Json_deserializers.revision_does_not_exist_exception_of_yojson tree path)
      | _, "RevisionRequiredException" ->
          `RevisionRequiredException
            (Json_deserializers.revision_required_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_deployment_input) =
    let input = Json_serializers.create_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.CreateDeployment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_deployment_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_deployment_input) =
    let input = Json_serializers.create_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.CreateDeployment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_deployment_output_of_yojson ~error_deserializer
end

module CreateDeploymentConfig = struct
  let error_to_string = function
    | `DeploymentConfigAlreadyExistsException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigAlreadyExistsException"
    | `DeploymentConfigLimitExceededException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigLimitExceededException"
    | `DeploymentConfigNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigNameRequiredException"
    | `InvalidComputePlatformException _ ->
        "com.amazonaws.codedeploy#InvalidComputePlatformException"
    | `InvalidDeploymentConfigNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentConfigNameException"
    | `InvalidMinimumHealthyHostValueException _ ->
        "com.amazonaws.codedeploy#InvalidMinimumHealthyHostValueException"
    | `InvalidTrafficRoutingConfigurationException _ ->
        "com.amazonaws.codedeploy#InvalidTrafficRoutingConfigurationException"
    | `InvalidZonalDeploymentConfigurationException _ ->
        "com.amazonaws.codedeploy#InvalidZonalDeploymentConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentConfigAlreadyExistsException" ->
          `DeploymentConfigAlreadyExistsException
            (Json_deserializers.deployment_config_already_exists_exception_of_yojson tree path)
      | _, "DeploymentConfigLimitExceededException" ->
          `DeploymentConfigLimitExceededException
            (Json_deserializers.deployment_config_limit_exceeded_exception_of_yojson tree path)
      | _, "DeploymentConfigNameRequiredException" ->
          `DeploymentConfigNameRequiredException
            (Json_deserializers.deployment_config_name_required_exception_of_yojson tree path)
      | _, "InvalidComputePlatformException" ->
          `InvalidComputePlatformException
            (Json_deserializers.invalid_compute_platform_exception_of_yojson tree path)
      | _, "InvalidDeploymentConfigNameException" ->
          `InvalidDeploymentConfigNameException
            (Json_deserializers.invalid_deployment_config_name_exception_of_yojson tree path)
      | _, "InvalidMinimumHealthyHostValueException" ->
          `InvalidMinimumHealthyHostValueException
            (Json_deserializers.invalid_minimum_healthy_host_value_exception_of_yojson tree path)
      | _, "InvalidTrafficRoutingConfigurationException" ->
          `InvalidTrafficRoutingConfigurationException
            (Json_deserializers.invalid_traffic_routing_configuration_exception_of_yojson tree path)
      | _, "InvalidZonalDeploymentConfigurationException" ->
          `InvalidZonalDeploymentConfigurationException
            (Json_deserializers.invalid_zonal_deployment_configuration_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_deployment_config_input) =
    let input = Json_serializers.create_deployment_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.CreateDeploymentConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_deployment_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_deployment_config_input) =
    let input = Json_serializers.create_deployment_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.CreateDeploymentConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_deployment_config_output_of_yojson
      ~error_deserializer
end

module CreateDeploymentGroup = struct
  let error_to_string = function
    | `AlarmsLimitExceededException _ -> "com.amazonaws.codedeploy#AlarmsLimitExceededException"
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentGroupAlreadyExistsException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupAlreadyExistsException"
    | `DeploymentGroupLimitExceededException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupLimitExceededException"
    | `DeploymentGroupNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupNameRequiredException"
    | `ECSServiceMappingLimitExceededException _ ->
        "com.amazonaws.codedeploy#ECSServiceMappingLimitExceededException"
    | `InvalidAlarmConfigException _ -> "com.amazonaws.codedeploy#InvalidAlarmConfigException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidAutoRollbackConfigException _ ->
        "com.amazonaws.codedeploy#InvalidAutoRollbackConfigException"
    | `InvalidAutoScalingGroupException _ ->
        "com.amazonaws.codedeploy#InvalidAutoScalingGroupException"
    | `InvalidBlueGreenDeploymentConfigurationException _ ->
        "com.amazonaws.codedeploy#InvalidBlueGreenDeploymentConfigurationException"
    | `InvalidDeploymentConfigNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentConfigNameException"
    | `InvalidDeploymentGroupNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentGroupNameException"
    | `InvalidDeploymentStyleException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentStyleException"
    | `InvalidEC2TagCombinationException _ ->
        "com.amazonaws.codedeploy#InvalidEC2TagCombinationException"
    | `InvalidEC2TagException _ -> "com.amazonaws.codedeploy#InvalidEC2TagException"
    | `InvalidECSServiceException _ -> "com.amazonaws.codedeploy#InvalidECSServiceException"
    | `InvalidInputException _ -> "com.amazonaws.codedeploy#InvalidInputException"
    | `InvalidLoadBalancerInfoException _ ->
        "com.amazonaws.codedeploy#InvalidLoadBalancerInfoException"
    | `InvalidOnPremisesTagCombinationException _ ->
        "com.amazonaws.codedeploy#InvalidOnPremisesTagCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.codedeploy#InvalidRoleException"
    | `InvalidTagException _ -> "com.amazonaws.codedeploy#InvalidTagException"
    | `InvalidTagsToAddException _ -> "com.amazonaws.codedeploy#InvalidTagsToAddException"
    | `InvalidTargetGroupPairException _ ->
        "com.amazonaws.codedeploy#InvalidTargetGroupPairException"
    | `InvalidTrafficRoutingConfigurationException _ ->
        "com.amazonaws.codedeploy#InvalidTrafficRoutingConfigurationException"
    | `InvalidTriggerConfigException _ -> "com.amazonaws.codedeploy#InvalidTriggerConfigException"
    | `LifecycleHookLimitExceededException _ ->
        "com.amazonaws.codedeploy#LifecycleHookLimitExceededException"
    | `RoleRequiredException _ -> "com.amazonaws.codedeploy#RoleRequiredException"
    | `TagSetListLimitExceededException _ ->
        "com.amazonaws.codedeploy#TagSetListLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.codedeploy#ThrottlingException"
    | `TriggerTargetsLimitExceededException _ ->
        "com.amazonaws.codedeploy#TriggerTargetsLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlarmsLimitExceededException" ->
          `AlarmsLimitExceededException
            (Json_deserializers.alarms_limit_exceeded_exception_of_yojson tree path)
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupAlreadyExistsException" ->
          `DeploymentGroupAlreadyExistsException
            (Json_deserializers.deployment_group_already_exists_exception_of_yojson tree path)
      | _, "DeploymentGroupLimitExceededException" ->
          `DeploymentGroupLimitExceededException
            (Json_deserializers.deployment_group_limit_exceeded_exception_of_yojson tree path)
      | _, "DeploymentGroupNameRequiredException" ->
          `DeploymentGroupNameRequiredException
            (Json_deserializers.deployment_group_name_required_exception_of_yojson tree path)
      | _, "ECSServiceMappingLimitExceededException" ->
          `ECSServiceMappingLimitExceededException
            (Json_deserializers.ecs_service_mapping_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidAlarmConfigException" ->
          `InvalidAlarmConfigException
            (Json_deserializers.invalid_alarm_config_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidAutoRollbackConfigException" ->
          `InvalidAutoRollbackConfigException
            (Json_deserializers.invalid_auto_rollback_config_exception_of_yojson tree path)
      | _, "InvalidAutoScalingGroupException" ->
          `InvalidAutoScalingGroupException
            (Json_deserializers.invalid_auto_scaling_group_exception_of_yojson tree path)
      | _, "InvalidBlueGreenDeploymentConfigurationException" ->
          `InvalidBlueGreenDeploymentConfigurationException
            (Json_deserializers.invalid_blue_green_deployment_configuration_exception_of_yojson tree
               path)
      | _, "InvalidDeploymentConfigNameException" ->
          `InvalidDeploymentConfigNameException
            (Json_deserializers.invalid_deployment_config_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentGroupNameException" ->
          `InvalidDeploymentGroupNameException
            (Json_deserializers.invalid_deployment_group_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentStyleException" ->
          `InvalidDeploymentStyleException
            (Json_deserializers.invalid_deployment_style_exception_of_yojson tree path)
      | _, "InvalidEC2TagCombinationException" ->
          `InvalidEC2TagCombinationException
            (Json_deserializers.invalid_ec2_tag_combination_exception_of_yojson tree path)
      | _, "InvalidEC2TagException" ->
          `InvalidEC2TagException (Json_deserializers.invalid_ec2_tag_exception_of_yojson tree path)
      | _, "InvalidECSServiceException" ->
          `InvalidECSServiceException
            (Json_deserializers.invalid_ecs_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidLoadBalancerInfoException" ->
          `InvalidLoadBalancerInfoException
            (Json_deserializers.invalid_load_balancer_info_exception_of_yojson tree path)
      | _, "InvalidOnPremisesTagCombinationException" ->
          `InvalidOnPremisesTagCombinationException
            (Json_deserializers.invalid_on_premises_tag_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "InvalidTagsToAddException" ->
          `InvalidTagsToAddException
            (Json_deserializers.invalid_tags_to_add_exception_of_yojson tree path)
      | _, "InvalidTargetGroupPairException" ->
          `InvalidTargetGroupPairException
            (Json_deserializers.invalid_target_group_pair_exception_of_yojson tree path)
      | _, "InvalidTrafficRoutingConfigurationException" ->
          `InvalidTrafficRoutingConfigurationException
            (Json_deserializers.invalid_traffic_routing_configuration_exception_of_yojson tree path)
      | _, "InvalidTriggerConfigException" ->
          `InvalidTriggerConfigException
            (Json_deserializers.invalid_trigger_config_exception_of_yojson tree path)
      | _, "LifecycleHookLimitExceededException" ->
          `LifecycleHookLimitExceededException
            (Json_deserializers.lifecycle_hook_limit_exceeded_exception_of_yojson tree path)
      | _, "RoleRequiredException" ->
          `RoleRequiredException (Json_deserializers.role_required_exception_of_yojson tree path)
      | _, "TagSetListLimitExceededException" ->
          `TagSetListLimitExceededException
            (Json_deserializers.tag_set_list_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TriggerTargetsLimitExceededException" ->
          `TriggerTargetsLimitExceededException
            (Json_deserializers.trigger_targets_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_deployment_group_input) =
    let input = Json_serializers.create_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.CreateDeploymentGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_deployment_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_deployment_group_input) =
    let input = Json_serializers.create_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.CreateDeploymentGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_deployment_group_output_of_yojson
      ~error_deserializer
end

module DeleteApplication = struct
  let error_to_string = function
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidRoleException _ -> "com.amazonaws.codedeploy#InvalidRoleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_input) =
    let input = Json_serializers.delete_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.DeleteApplication" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_input) =
    let input = Json_serializers.delete_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.DeleteApplication" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDeploymentConfig = struct
  let error_to_string = function
    | `DeploymentConfigInUseException _ -> "com.amazonaws.codedeploy#DeploymentConfigInUseException"
    | `DeploymentConfigNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigNameRequiredException"
    | `InvalidDeploymentConfigNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentConfigNameException"
    | `InvalidOperationException _ -> "com.amazonaws.codedeploy#InvalidOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentConfigInUseException" ->
          `DeploymentConfigInUseException
            (Json_deserializers.deployment_config_in_use_exception_of_yojson tree path)
      | _, "DeploymentConfigNameRequiredException" ->
          `DeploymentConfigNameRequiredException
            (Json_deserializers.deployment_config_name_required_exception_of_yojson tree path)
      | _, "InvalidDeploymentConfigNameException" ->
          `InvalidDeploymentConfigNameException
            (Json_deserializers.invalid_deployment_config_name_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_deployment_config_input) =
    let input = Json_serializers.delete_deployment_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.DeleteDeploymentConfig"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_deployment_config_input) =
    let input = Json_serializers.delete_deployment_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.DeleteDeploymentConfig" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDeploymentGroup = struct
  let error_to_string = function
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `DeploymentGroupNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidDeploymentGroupNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentGroupNameException"
    | `InvalidRoleException _ -> "com.amazonaws.codedeploy#InvalidRoleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "DeploymentGroupNameRequiredException" ->
          `DeploymentGroupNameRequiredException
            (Json_deserializers.deployment_group_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentGroupNameException" ->
          `InvalidDeploymentGroupNameException
            (Json_deserializers.invalid_deployment_group_name_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_deployment_group_input) =
    let input = Json_serializers.delete_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.DeleteDeploymentGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_deployment_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_deployment_group_input) =
    let input = Json_serializers.delete_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.DeleteDeploymentGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_deployment_group_output_of_yojson
      ~error_deserializer
end

module DeleteGitHubAccountToken = struct
  let error_to_string = function
    | `GitHubAccountTokenDoesNotExistException _ ->
        "com.amazonaws.codedeploy#GitHubAccountTokenDoesNotExistException"
    | `GitHubAccountTokenNameRequiredException _ ->
        "com.amazonaws.codedeploy#GitHubAccountTokenNameRequiredException"
    | `InvalidGitHubAccountTokenNameException _ ->
        "com.amazonaws.codedeploy#InvalidGitHubAccountTokenNameException"
    | `OperationNotSupportedException _ -> "com.amazonaws.codedeploy#OperationNotSupportedException"
    | `ResourceValidationException _ -> "com.amazonaws.codedeploy#ResourceValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "GitHubAccountTokenDoesNotExistException" ->
          `GitHubAccountTokenDoesNotExistException
            (Json_deserializers.git_hub_account_token_does_not_exist_exception_of_yojson tree path)
      | _, "GitHubAccountTokenNameRequiredException" ->
          `GitHubAccountTokenNameRequiredException
            (Json_deserializers.git_hub_account_token_name_required_exception_of_yojson tree path)
      | _, "InvalidGitHubAccountTokenNameException" ->
          `InvalidGitHubAccountTokenNameException
            (Json_deserializers.invalid_git_hub_account_token_name_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceValidationException" ->
          `ResourceValidationException
            (Json_deserializers.resource_validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_git_hub_account_token_input) =
    let input = Json_serializers.delete_git_hub_account_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.DeleteGitHubAccountToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_git_hub_account_token_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_git_hub_account_token_input) =
    let input = Json_serializers.delete_git_hub_account_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.DeleteGitHubAccountToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_git_hub_account_token_output_of_yojson
      ~error_deserializer
end

module DeleteResourcesByExternalId = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resources_by_external_id_input) =
    let input = Json_serializers.delete_resources_by_external_id_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.DeleteResourcesByExternalId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resources_by_external_id_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resources_by_external_id_input) =
    let input = Json_serializers.delete_resources_by_external_id_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.DeleteResourcesByExternalId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resources_by_external_id_output_of_yojson
      ~error_deserializer
end

module DeregisterOnPremisesInstance = struct
  let error_to_string = function
    | `InstanceNameRequiredException _ -> "com.amazonaws.codedeploy#InstanceNameRequiredException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InstanceNameRequiredException" ->
          `InstanceNameRequiredException
            (Json_deserializers.instance_name_required_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_on_premises_instance_input) =
    let input = Json_serializers.deregister_on_premises_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.DeregisterOnPremisesInstance" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_on_premises_instance_input) =
    let input = Json_serializers.deregister_on_premises_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.DeregisterOnPremisesInstance" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module GetApplication = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_application_input) =
    let input = Json_serializers.get_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetApplication" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_application_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_application_input) =
    let input = Json_serializers.get_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_application_output_of_yojson ~error_deserializer
end

module GetApplicationRevision = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidRevisionException _ -> "com.amazonaws.codedeploy#InvalidRevisionException"
    | `RevisionDoesNotExistException _ -> "com.amazonaws.codedeploy#RevisionDoesNotExistException"
    | `RevisionRequiredException _ -> "com.amazonaws.codedeploy#RevisionRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidRevisionException" ->
          `InvalidRevisionException
            (Json_deserializers.invalid_revision_exception_of_yojson tree path)
      | _, "RevisionDoesNotExistException" ->
          `RevisionDoesNotExistException
            (Json_deserializers.revision_does_not_exist_exception_of_yojson tree path)
      | _, "RevisionRequiredException" ->
          `RevisionRequiredException
            (Json_deserializers.revision_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_application_revision_input) =
    let input = Json_serializers.get_application_revision_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetApplicationRevision"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_application_revision_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_application_revision_input) =
    let input = Json_serializers.get_application_revision_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetApplicationRevision" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_application_revision_output_of_yojson
      ~error_deserializer
end

module GetDeployment = struct
  let error_to_string = function
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_deployment_input) =
    let input = Json_serializers.get_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetDeployment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_deployment_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_deployment_input) =
    let input = Json_serializers.get_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetDeployment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_output_of_yojson ~error_deserializer
end

module GetDeploymentConfig = struct
  let error_to_string = function
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentConfigNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigNameRequiredException"
    | `InvalidComputePlatformException _ ->
        "com.amazonaws.codedeploy#InvalidComputePlatformException"
    | `InvalidDeploymentConfigNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentConfigNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentConfigNameRequiredException" ->
          `DeploymentConfigNameRequiredException
            (Json_deserializers.deployment_config_name_required_exception_of_yojson tree path)
      | _, "InvalidComputePlatformException" ->
          `InvalidComputePlatformException
            (Json_deserializers.invalid_compute_platform_exception_of_yojson tree path)
      | _, "InvalidDeploymentConfigNameException" ->
          `InvalidDeploymentConfigNameException
            (Json_deserializers.invalid_deployment_config_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_deployment_config_input) =
    let input = Json_serializers.get_deployment_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetDeploymentConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_config_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_deployment_config_input) =
    let input = Json_serializers.get_deployment_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetDeploymentConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_config_output_of_yojson
      ~error_deserializer
end

module GetDeploymentGroup = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentGroupDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupDoesNotExistException"
    | `DeploymentGroupNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidDeploymentGroupNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentGroupNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupDoesNotExistException" ->
          `DeploymentGroupDoesNotExistException
            (Json_deserializers.deployment_group_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupNameRequiredException" ->
          `DeploymentGroupNameRequiredException
            (Json_deserializers.deployment_group_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentGroupNameException" ->
          `InvalidDeploymentGroupNameException
            (Json_deserializers.invalid_deployment_group_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_deployment_group_input) =
    let input = Json_serializers.get_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetDeploymentGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_deployment_group_input) =
    let input = Json_serializers.get_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetDeploymentGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_group_output_of_yojson
      ~error_deserializer
end

module GetDeploymentInstance = struct
  let error_to_string = function
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `InstanceDoesNotExistException _ -> "com.amazonaws.codedeploy#InstanceDoesNotExistException"
    | `InstanceIdRequiredException _ -> "com.amazonaws.codedeploy#InstanceIdRequiredException"
    | `InvalidComputePlatformException _ ->
        "com.amazonaws.codedeploy#InvalidComputePlatformException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "InstanceDoesNotExistException" ->
          `InstanceDoesNotExistException
            (Json_deserializers.instance_does_not_exist_exception_of_yojson tree path)
      | _, "InstanceIdRequiredException" ->
          `InstanceIdRequiredException
            (Json_deserializers.instance_id_required_exception_of_yojson tree path)
      | _, "InvalidComputePlatformException" ->
          `InvalidComputePlatformException
            (Json_deserializers.invalid_compute_platform_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_deployment_instance_input) =
    let input = Json_serializers.get_deployment_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetDeploymentInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_deployment_instance_input) =
    let input = Json_serializers.get_deployment_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetDeploymentInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_instance_output_of_yojson
      ~error_deserializer
end

module GetDeploymentTarget = struct
  let error_to_string = function
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `DeploymentNotStartedException _ -> "com.amazonaws.codedeploy#DeploymentNotStartedException"
    | `DeploymentTargetDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentTargetDoesNotExistException"
    | `DeploymentTargetIdRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentTargetIdRequiredException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidDeploymentTargetIdException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentTargetIdException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "DeploymentNotStartedException" ->
          `DeploymentNotStartedException
            (Json_deserializers.deployment_not_started_exception_of_yojson tree path)
      | _, "DeploymentTargetDoesNotExistException" ->
          `DeploymentTargetDoesNotExistException
            (Json_deserializers.deployment_target_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentTargetIdRequiredException" ->
          `DeploymentTargetIdRequiredException
            (Json_deserializers.deployment_target_id_required_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidDeploymentTargetIdException" ->
          `InvalidDeploymentTargetIdException
            (Json_deserializers.invalid_deployment_target_id_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_deployment_target_input) =
    let input = Json_serializers.get_deployment_target_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetDeploymentTarget"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_target_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_deployment_target_input) =
    let input = Json_serializers.get_deployment_target_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetDeploymentTarget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_deployment_target_output_of_yojson
      ~error_deserializer
end

module GetOnPremisesInstance = struct
  let error_to_string = function
    | `InstanceNameRequiredException _ -> "com.amazonaws.codedeploy#InstanceNameRequiredException"
    | `InstanceNotRegisteredException _ -> "com.amazonaws.codedeploy#InstanceNotRegisteredException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InstanceNameRequiredException" ->
          `InstanceNameRequiredException
            (Json_deserializers.instance_name_required_exception_of_yojson tree path)
      | _, "InstanceNotRegisteredException" ->
          `InstanceNotRegisteredException
            (Json_deserializers.instance_not_registered_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_on_premises_instance_input) =
    let input = Json_serializers.get_on_premises_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.GetOnPremisesInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_on_premises_instance_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_on_premises_instance_input) =
    let input = Json_serializers.get_on_premises_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.GetOnPremisesInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_on_premises_instance_output_of_yojson
      ~error_deserializer
end

module ListApplicationRevisions = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `BucketNameFilterRequiredException _ ->
        "com.amazonaws.codedeploy#BucketNameFilterRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidBucketNameFilterException _ ->
        "com.amazonaws.codedeploy#InvalidBucketNameFilterException"
    | `InvalidDeployedStateFilterException _ ->
        "com.amazonaws.codedeploy#InvalidDeployedStateFilterException"
    | `InvalidKeyPrefixFilterException _ ->
        "com.amazonaws.codedeploy#InvalidKeyPrefixFilterException"
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | `InvalidSortByException _ -> "com.amazonaws.codedeploy#InvalidSortByException"
    | `InvalidSortOrderException _ -> "com.amazonaws.codedeploy#InvalidSortOrderException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "BucketNameFilterRequiredException" ->
          `BucketNameFilterRequiredException
            (Json_deserializers.bucket_name_filter_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidBucketNameFilterException" ->
          `InvalidBucketNameFilterException
            (Json_deserializers.invalid_bucket_name_filter_exception_of_yojson tree path)
      | _, "InvalidDeployedStateFilterException" ->
          `InvalidDeployedStateFilterException
            (Json_deserializers.invalid_deployed_state_filter_exception_of_yojson tree path)
      | _, "InvalidKeyPrefixFilterException" ->
          `InvalidKeyPrefixFilterException
            (Json_deserializers.invalid_key_prefix_filter_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidSortByException" ->
          `InvalidSortByException (Json_deserializers.invalid_sort_by_exception_of_yojson tree path)
      | _, "InvalidSortOrderException" ->
          `InvalidSortOrderException
            (Json_deserializers.invalid_sort_order_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_application_revisions_input) =
    let input = Json_serializers.list_application_revisions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListApplicationRevisions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_revisions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_revisions_input) =
    let input = Json_serializers.list_application_revisions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListApplicationRevisions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_revisions_output_of_yojson
      ~error_deserializer
end

module ListApplications = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_applications_input) =
    let input = Json_serializers.list_applications_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListApplications" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_applications_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_applications_input) =
    let input = Json_serializers.list_applications_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_applications_output_of_yojson ~error_deserializer
end

module ListDeploymentConfigs = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_deployment_configs_input) =
    let input = Json_serializers.list_deployment_configs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListDeploymentConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_configs_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_deployment_configs_input) =
    let input = Json_serializers.list_deployment_configs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListDeploymentConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_configs_output_of_yojson
      ~error_deserializer
end

module ListDeploymentGroups = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_deployment_groups_input) =
    let input = Json_serializers.list_deployment_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListDeploymentGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_deployment_groups_input) =
    let input = Json_serializers.list_deployment_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListDeploymentGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_groups_output_of_yojson
      ~error_deserializer
end

module ListDeploymentInstances = struct
  let error_to_string = function
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `DeploymentNotStartedException _ -> "com.amazonaws.codedeploy#DeploymentNotStartedException"
    | `InvalidComputePlatformException _ ->
        "com.amazonaws.codedeploy#InvalidComputePlatformException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidDeploymentInstanceTypeException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentInstanceTypeException"
    | `InvalidInstanceStatusException _ -> "com.amazonaws.codedeploy#InvalidInstanceStatusException"
    | `InvalidInstanceTypeException _ -> "com.amazonaws.codedeploy#InvalidInstanceTypeException"
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | `InvalidTargetFilterNameException _ ->
        "com.amazonaws.codedeploy#InvalidTargetFilterNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "DeploymentNotStartedException" ->
          `DeploymentNotStartedException
            (Json_deserializers.deployment_not_started_exception_of_yojson tree path)
      | _, "InvalidComputePlatformException" ->
          `InvalidComputePlatformException
            (Json_deserializers.invalid_compute_platform_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidDeploymentInstanceTypeException" ->
          `InvalidDeploymentInstanceTypeException
            (Json_deserializers.invalid_deployment_instance_type_exception_of_yojson tree path)
      | _, "InvalidInstanceStatusException" ->
          `InvalidInstanceStatusException
            (Json_deserializers.invalid_instance_status_exception_of_yojson tree path)
      | _, "InvalidInstanceTypeException" ->
          `InvalidInstanceTypeException
            (Json_deserializers.invalid_instance_type_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidTargetFilterNameException" ->
          `InvalidTargetFilterNameException
            (Json_deserializers.invalid_target_filter_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_deployment_instances_input) =
    let input = Json_serializers.list_deployment_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListDeploymentInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_deployment_instances_input) =
    let input = Json_serializers.list_deployment_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListDeploymentInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_instances_output_of_yojson
      ~error_deserializer
end

module ListDeploymentTargets = struct
  let error_to_string = function
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `DeploymentNotStartedException _ -> "com.amazonaws.codedeploy#DeploymentNotStartedException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidDeploymentInstanceTypeException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentInstanceTypeException"
    | `InvalidInstanceStatusException _ -> "com.amazonaws.codedeploy#InvalidInstanceStatusException"
    | `InvalidInstanceTypeException _ -> "com.amazonaws.codedeploy#InvalidInstanceTypeException"
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | `InvalidTargetFilterNameException _ ->
        "com.amazonaws.codedeploy#InvalidTargetFilterNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "DeploymentNotStartedException" ->
          `DeploymentNotStartedException
            (Json_deserializers.deployment_not_started_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidDeploymentInstanceTypeException" ->
          `InvalidDeploymentInstanceTypeException
            (Json_deserializers.invalid_deployment_instance_type_exception_of_yojson tree path)
      | _, "InvalidInstanceStatusException" ->
          `InvalidInstanceStatusException
            (Json_deserializers.invalid_instance_status_exception_of_yojson tree path)
      | _, "InvalidInstanceTypeException" ->
          `InvalidInstanceTypeException
            (Json_deserializers.invalid_instance_type_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidTargetFilterNameException" ->
          `InvalidTargetFilterNameException
            (Json_deserializers.invalid_target_filter_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_deployment_targets_input) =
    let input = Json_serializers.list_deployment_targets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListDeploymentTargets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_targets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_deployment_targets_input) =
    let input = Json_serializers.list_deployment_targets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListDeploymentTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployment_targets_output_of_yojson
      ~error_deserializer
end

module ListDeployments = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `DeploymentGroupDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupDoesNotExistException"
    | `DeploymentGroupNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidDeploymentGroupNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentGroupNameException"
    | `InvalidDeploymentStatusException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentStatusException"
    | `InvalidExternalIdException _ -> "com.amazonaws.codedeploy#InvalidExternalIdException"
    | `InvalidInputException _ -> "com.amazonaws.codedeploy#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | `InvalidTimeRangeException _ -> "com.amazonaws.codedeploy#InvalidTimeRangeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "DeploymentGroupDoesNotExistException" ->
          `DeploymentGroupDoesNotExistException
            (Json_deserializers.deployment_group_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupNameRequiredException" ->
          `DeploymentGroupNameRequiredException
            (Json_deserializers.deployment_group_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentGroupNameException" ->
          `InvalidDeploymentGroupNameException
            (Json_deserializers.invalid_deployment_group_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentStatusException" ->
          `InvalidDeploymentStatusException
            (Json_deserializers.invalid_deployment_status_exception_of_yojson tree path)
      | _, "InvalidExternalIdException" ->
          `InvalidExternalIdException
            (Json_deserializers.invalid_external_id_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidTimeRangeException" ->
          `InvalidTimeRangeException
            (Json_deserializers.invalid_time_range_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_deployments_input) =
    let input = Json_serializers.list_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListDeployments" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_deployments_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_deployments_input) =
    let input = Json_serializers.list_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListDeployments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deployments_output_of_yojson ~error_deserializer
end

module ListGitHubAccountTokenNames = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | `OperationNotSupportedException _ -> "com.amazonaws.codedeploy#OperationNotSupportedException"
    | `ResourceValidationException _ -> "com.amazonaws.codedeploy#ResourceValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceValidationException" ->
          `ResourceValidationException
            (Json_deserializers.resource_validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_git_hub_account_token_names_input) =
    let input = Json_serializers.list_git_hub_account_token_names_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.ListGitHubAccountTokenNames" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_git_hub_account_token_names_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_git_hub_account_token_names_input) =
    let input = Json_serializers.list_git_hub_account_token_names_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListGitHubAccountTokenNames" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_git_hub_account_token_names_output_of_yojson
      ~error_deserializer
end

module ListOnPremisesInstances = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codedeploy#InvalidNextTokenException"
    | `InvalidRegistrationStatusException _ ->
        "com.amazonaws.codedeploy#InvalidRegistrationStatusException"
    | `InvalidTagFilterException _ -> "com.amazonaws.codedeploy#InvalidTagFilterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRegistrationStatusException" ->
          `InvalidRegistrationStatusException
            (Json_deserializers.invalid_registration_status_exception_of_yojson tree path)
      | _, "InvalidTagFilterException" ->
          `InvalidTagFilterException
            (Json_deserializers.invalid_tag_filter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_on_premises_instances_input) =
    let input = Json_serializers.list_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListOnPremisesInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_on_premises_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_on_premises_instances_input) =
    let input = Json_serializers.list_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListOnPremisesInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_on_premises_instances_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ArnNotSupportedException _ -> "com.amazonaws.codedeploy#ArnNotSupportedException"
    | `InvalidArnException _ -> "com.amazonaws.codedeploy#InvalidArnException"
    | `ResourceArnRequiredException _ -> "com.amazonaws.codedeploy#ResourceArnRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ArnNotSupportedException" ->
          `ArnNotSupportedException
            (Json_deserializers.arn_not_supported_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "ResourceArnRequiredException" ->
          `ResourceArnRequiredException
            (Json_deserializers.resource_arn_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module PutLifecycleEventHookExecutionStatus = struct
  let error_to_string = function
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `InvalidLifecycleEventHookExecutionIdException _ ->
        "com.amazonaws.codedeploy#InvalidLifecycleEventHookExecutionIdException"
    | `InvalidLifecycleEventHookExecutionStatusException _ ->
        "com.amazonaws.codedeploy#InvalidLifecycleEventHookExecutionStatusException"
    | `LifecycleEventAlreadyCompletedException _ ->
        "com.amazonaws.codedeploy#LifecycleEventAlreadyCompletedException"
    | `UnsupportedActionForDeploymentTypeException _ ->
        "com.amazonaws.codedeploy#UnsupportedActionForDeploymentTypeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "InvalidLifecycleEventHookExecutionIdException" ->
          `InvalidLifecycleEventHookExecutionIdException
            (Json_deserializers.invalid_lifecycle_event_hook_execution_id_exception_of_yojson tree
               path)
      | _, "InvalidLifecycleEventHookExecutionStatusException" ->
          `InvalidLifecycleEventHookExecutionStatusException
            (Json_deserializers.invalid_lifecycle_event_hook_execution_status_exception_of_yojson
               tree path)
      | _, "LifecycleEventAlreadyCompletedException" ->
          `LifecycleEventAlreadyCompletedException
            (Json_deserializers.lifecycle_event_already_completed_exception_of_yojson tree path)
      | _, "UnsupportedActionForDeploymentTypeException" ->
          `UnsupportedActionForDeploymentTypeException
            (Json_deserializers.unsupported_action_for_deployment_type_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_lifecycle_event_hook_execution_status_input) =
    let input =
      Json_serializers.put_lifecycle_event_hook_execution_status_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.PutLifecycleEventHookExecutionStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.put_lifecycle_event_hook_execution_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_lifecycle_event_hook_execution_status_input) =
    let input =
      Json_serializers.put_lifecycle_event_hook_execution_status_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.PutLifecycleEventHookExecutionStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.put_lifecycle_event_hook_execution_status_output_of_yojson
      ~error_deserializer
end

module RegisterApplicationRevision = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `DescriptionTooLongException _ -> "com.amazonaws.codedeploy#DescriptionTooLongException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidRevisionException _ -> "com.amazonaws.codedeploy#InvalidRevisionException"
    | `RevisionRequiredException _ -> "com.amazonaws.codedeploy#RevisionRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "DescriptionTooLongException" ->
          `DescriptionTooLongException
            (Json_deserializers.description_too_long_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidRevisionException" ->
          `InvalidRevisionException
            (Json_deserializers.invalid_revision_exception_of_yojson tree path)
      | _, "RevisionRequiredException" ->
          `RevisionRequiredException
            (Json_deserializers.revision_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_application_revision_input) =
    let input = Json_serializers.register_application_revision_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.RegisterApplicationRevision" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_application_revision_input) =
    let input = Json_serializers.register_application_revision_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.RegisterApplicationRevision" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RegisterOnPremisesInstance = struct
  let error_to_string = function
    | `IamArnRequiredException _ -> "com.amazonaws.codedeploy#IamArnRequiredException"
    | `IamSessionArnAlreadyRegisteredException _ ->
        "com.amazonaws.codedeploy#IamSessionArnAlreadyRegisteredException"
    | `IamUserArnAlreadyRegisteredException _ ->
        "com.amazonaws.codedeploy#IamUserArnAlreadyRegisteredException"
    | `IamUserArnRequiredException _ -> "com.amazonaws.codedeploy#IamUserArnRequiredException"
    | `InstanceNameAlreadyRegisteredException _ ->
        "com.amazonaws.codedeploy#InstanceNameAlreadyRegisteredException"
    | `InstanceNameRequiredException _ -> "com.amazonaws.codedeploy#InstanceNameRequiredException"
    | `InvalidIamSessionArnException _ -> "com.amazonaws.codedeploy#InvalidIamSessionArnException"
    | `InvalidIamUserArnException _ -> "com.amazonaws.codedeploy#InvalidIamUserArnException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | `MultipleIamArnsProvidedException _ ->
        "com.amazonaws.codedeploy#MultipleIamArnsProvidedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IamArnRequiredException" ->
          `IamArnRequiredException
            (Json_deserializers.iam_arn_required_exception_of_yojson tree path)
      | _, "IamSessionArnAlreadyRegisteredException" ->
          `IamSessionArnAlreadyRegisteredException
            (Json_deserializers.iam_session_arn_already_registered_exception_of_yojson tree path)
      | _, "IamUserArnAlreadyRegisteredException" ->
          `IamUserArnAlreadyRegisteredException
            (Json_deserializers.iam_user_arn_already_registered_exception_of_yojson tree path)
      | _, "IamUserArnRequiredException" ->
          `IamUserArnRequiredException
            (Json_deserializers.iam_user_arn_required_exception_of_yojson tree path)
      | _, "InstanceNameAlreadyRegisteredException" ->
          `InstanceNameAlreadyRegisteredException
            (Json_deserializers.instance_name_already_registered_exception_of_yojson tree path)
      | _, "InstanceNameRequiredException" ->
          `InstanceNameRequiredException
            (Json_deserializers.instance_name_required_exception_of_yojson tree path)
      | _, "InvalidIamSessionArnException" ->
          `InvalidIamSessionArnException
            (Json_deserializers.invalid_iam_session_arn_exception_of_yojson tree path)
      | _, "InvalidIamUserArnException" ->
          `InvalidIamUserArnException
            (Json_deserializers.invalid_iam_user_arn_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _, "MultipleIamArnsProvidedException" ->
          `MultipleIamArnsProvidedException
            (Json_deserializers.multiple_iam_arns_provided_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_on_premises_instance_input) =
    let input = Json_serializers.register_on_premises_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.RegisterOnPremisesInstance"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_on_premises_instance_input) =
    let input = Json_serializers.register_on_premises_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.RegisterOnPremisesInstance" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RemoveTagsFromOnPremisesInstances = struct
  let error_to_string = function
    | `InstanceLimitExceededException _ -> "com.amazonaws.codedeploy#InstanceLimitExceededException"
    | `InstanceNameRequiredException _ -> "com.amazonaws.codedeploy#InstanceNameRequiredException"
    | `InstanceNotRegisteredException _ -> "com.amazonaws.codedeploy#InstanceNotRegisteredException"
    | `InvalidInstanceNameException _ -> "com.amazonaws.codedeploy#InvalidInstanceNameException"
    | `InvalidTagException _ -> "com.amazonaws.codedeploy#InvalidTagException"
    | `TagLimitExceededException _ -> "com.amazonaws.codedeploy#TagLimitExceededException"
    | `TagRequiredException _ -> "com.amazonaws.codedeploy#TagRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InstanceLimitExceededException" ->
          `InstanceLimitExceededException
            (Json_deserializers.instance_limit_exceeded_exception_of_yojson tree path)
      | _, "InstanceNameRequiredException" ->
          `InstanceNameRequiredException
            (Json_deserializers.instance_name_required_exception_of_yojson tree path)
      | _, "InstanceNotRegisteredException" ->
          `InstanceNotRegisteredException
            (Json_deserializers.instance_not_registered_exception_of_yojson tree path)
      | _, "InvalidInstanceNameException" ->
          `InvalidInstanceNameException
            (Json_deserializers.invalid_instance_name_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "TagLimitExceededException" ->
          `TagLimitExceededException
            (Json_deserializers.tag_limit_exceeded_exception_of_yojson tree path)
      | _, "TagRequiredException" ->
          `TagRequiredException (Json_deserializers.tag_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_from_on_premises_instances_input) =
    let input = Json_serializers.remove_tags_from_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.RemoveTagsFromOnPremisesInstances" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_tags_from_on_premises_instances_input) =
    let input = Json_serializers.remove_tags_from_on_premises_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.RemoveTagsFromOnPremisesInstances" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SkipWaitTimeForInstanceTermination = struct
  let error_to_string = function
    | `DeploymentAlreadyCompletedException _ ->
        "com.amazonaws.codedeploy#DeploymentAlreadyCompletedException"
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `DeploymentNotStartedException _ -> "com.amazonaws.codedeploy#DeploymentNotStartedException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `UnsupportedActionForDeploymentTypeException _ ->
        "com.amazonaws.codedeploy#UnsupportedActionForDeploymentTypeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentAlreadyCompletedException" ->
          `DeploymentAlreadyCompletedException
            (Json_deserializers.deployment_already_completed_exception_of_yojson tree path)
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "DeploymentNotStartedException" ->
          `DeploymentNotStartedException
            (Json_deserializers.deployment_not_started_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "UnsupportedActionForDeploymentTypeException" ->
          `UnsupportedActionForDeploymentTypeException
            (Json_deserializers.unsupported_action_for_deployment_type_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : skip_wait_time_for_instance_termination_input) =
    let input = Json_serializers.skip_wait_time_for_instance_termination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeDeploy_20141006.SkipWaitTimeForInstanceTermination" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : skip_wait_time_for_instance_termination_input) =
    let input = Json_serializers.skip_wait_time_for_instance_termination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.SkipWaitTimeForInstanceTermination" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopDeployment = struct
  let error_to_string = function
    | `DeploymentAlreadyCompletedException _ ->
        "com.amazonaws.codedeploy#DeploymentAlreadyCompletedException"
    | `DeploymentDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentDoesNotExistException"
    | `DeploymentGroupDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupDoesNotExistException"
    | `DeploymentIdRequiredException _ -> "com.amazonaws.codedeploy#DeploymentIdRequiredException"
    | `InvalidDeploymentIdException _ -> "com.amazonaws.codedeploy#InvalidDeploymentIdException"
    | `UnsupportedActionForDeploymentTypeException _ ->
        "com.amazonaws.codedeploy#UnsupportedActionForDeploymentTypeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeploymentAlreadyCompletedException" ->
          `DeploymentAlreadyCompletedException
            (Json_deserializers.deployment_already_completed_exception_of_yojson tree path)
      | _, "DeploymentDoesNotExistException" ->
          `DeploymentDoesNotExistException
            (Json_deserializers.deployment_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupDoesNotExistException" ->
          `DeploymentGroupDoesNotExistException
            (Json_deserializers.deployment_group_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentIdRequiredException" ->
          `DeploymentIdRequiredException
            (Json_deserializers.deployment_id_required_exception_of_yojson tree path)
      | _, "InvalidDeploymentIdException" ->
          `InvalidDeploymentIdException
            (Json_deserializers.invalid_deployment_id_exception_of_yojson tree path)
      | _, "UnsupportedActionForDeploymentTypeException" ->
          `UnsupportedActionForDeploymentTypeException
            (Json_deserializers.unsupported_action_for_deployment_type_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_deployment_input) =
    let input = Json_serializers.stop_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.StopDeployment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_deployment_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_deployment_input) =
    let input = Json_serializers.stop_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.StopDeployment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_deployment_output_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ArnNotSupportedException _ -> "com.amazonaws.codedeploy#ArnNotSupportedException"
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentGroupDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupDoesNotExistException"
    | `InvalidArnException _ -> "com.amazonaws.codedeploy#InvalidArnException"
    | `InvalidTagsToAddException _ -> "com.amazonaws.codedeploy#InvalidTagsToAddException"
    | `ResourceArnRequiredException _ -> "com.amazonaws.codedeploy#ResourceArnRequiredException"
    | `TagRequiredException _ -> "com.amazonaws.codedeploy#TagRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ArnNotSupportedException" ->
          `ArnNotSupportedException
            (Json_deserializers.arn_not_supported_exception_of_yojson tree path)
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupDoesNotExistException" ->
          `DeploymentGroupDoesNotExistException
            (Json_deserializers.deployment_group_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidTagsToAddException" ->
          `InvalidTagsToAddException
            (Json_deserializers.invalid_tags_to_add_exception_of_yojson tree path)
      | _, "ResourceArnRequiredException" ->
          `ResourceArnRequiredException
            (Json_deserializers.resource_arn_required_exception_of_yojson tree path)
      | _, "TagRequiredException" ->
          `TagRequiredException (Json_deserializers.tag_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodeDeploy_20141006.TagResource"
      ~service ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ArnNotSupportedException _ -> "com.amazonaws.codedeploy#ArnNotSupportedException"
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentGroupDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupDoesNotExistException"
    | `InvalidArnException _ -> "com.amazonaws.codedeploy#InvalidArnException"
    | `InvalidTagsToAddException _ -> "com.amazonaws.codedeploy#InvalidTagsToAddException"
    | `ResourceArnRequiredException _ -> "com.amazonaws.codedeploy#ResourceArnRequiredException"
    | `TagRequiredException _ -> "com.amazonaws.codedeploy#TagRequiredException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ArnNotSupportedException" ->
          `ArnNotSupportedException
            (Json_deserializers.arn_not_supported_exception_of_yojson tree path)
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupDoesNotExistException" ->
          `DeploymentGroupDoesNotExistException
            (Json_deserializers.deployment_group_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidTagsToAddException" ->
          `InvalidTagsToAddException
            (Json_deserializers.invalid_tags_to_add_exception_of_yojson tree path)
      | _, "ResourceArnRequiredException" ->
          `ResourceArnRequiredException
            (Json_deserializers.resource_arn_required_exception_of_yojson tree path)
      | _, "TagRequiredException" ->
          `TagRequiredException (Json_deserializers.tag_required_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = function
    | `ApplicationAlreadyExistsException _ ->
        "com.amazonaws.codedeploy#ApplicationAlreadyExistsException"
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ApplicationAlreadyExistsException" ->
          `ApplicationAlreadyExistsException
            (Json_deserializers.application_already_exists_exception_of_yojson tree path)
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_application_input) =
    let input = Json_serializers.update_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.UpdateApplication" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_application_input) =
    let input = Json_serializers.update_application_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.UpdateApplication" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateDeploymentGroup = struct
  let error_to_string = function
    | `AlarmsLimitExceededException _ -> "com.amazonaws.codedeploy#AlarmsLimitExceededException"
    | `ApplicationDoesNotExistException _ ->
        "com.amazonaws.codedeploy#ApplicationDoesNotExistException"
    | `ApplicationNameRequiredException _ ->
        "com.amazonaws.codedeploy#ApplicationNameRequiredException"
    | `DeploymentConfigDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentConfigDoesNotExistException"
    | `DeploymentGroupAlreadyExistsException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupAlreadyExistsException"
    | `DeploymentGroupDoesNotExistException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupDoesNotExistException"
    | `DeploymentGroupNameRequiredException _ ->
        "com.amazonaws.codedeploy#DeploymentGroupNameRequiredException"
    | `ECSServiceMappingLimitExceededException _ ->
        "com.amazonaws.codedeploy#ECSServiceMappingLimitExceededException"
    | `InvalidAlarmConfigException _ -> "com.amazonaws.codedeploy#InvalidAlarmConfigException"
    | `InvalidApplicationNameException _ ->
        "com.amazonaws.codedeploy#InvalidApplicationNameException"
    | `InvalidAutoRollbackConfigException _ ->
        "com.amazonaws.codedeploy#InvalidAutoRollbackConfigException"
    | `InvalidAutoScalingGroupException _ ->
        "com.amazonaws.codedeploy#InvalidAutoScalingGroupException"
    | `InvalidBlueGreenDeploymentConfigurationException _ ->
        "com.amazonaws.codedeploy#InvalidBlueGreenDeploymentConfigurationException"
    | `InvalidDeploymentConfigNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentConfigNameException"
    | `InvalidDeploymentGroupNameException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentGroupNameException"
    | `InvalidDeploymentStyleException _ ->
        "com.amazonaws.codedeploy#InvalidDeploymentStyleException"
    | `InvalidEC2TagCombinationException _ ->
        "com.amazonaws.codedeploy#InvalidEC2TagCombinationException"
    | `InvalidEC2TagException _ -> "com.amazonaws.codedeploy#InvalidEC2TagException"
    | `InvalidECSServiceException _ -> "com.amazonaws.codedeploy#InvalidECSServiceException"
    | `InvalidInputException _ -> "com.amazonaws.codedeploy#InvalidInputException"
    | `InvalidLoadBalancerInfoException _ ->
        "com.amazonaws.codedeploy#InvalidLoadBalancerInfoException"
    | `InvalidOnPremisesTagCombinationException _ ->
        "com.amazonaws.codedeploy#InvalidOnPremisesTagCombinationException"
    | `InvalidRoleException _ -> "com.amazonaws.codedeploy#InvalidRoleException"
    | `InvalidTagException _ -> "com.amazonaws.codedeploy#InvalidTagException"
    | `InvalidTargetGroupPairException _ ->
        "com.amazonaws.codedeploy#InvalidTargetGroupPairException"
    | `InvalidTrafficRoutingConfigurationException _ ->
        "com.amazonaws.codedeploy#InvalidTrafficRoutingConfigurationException"
    | `InvalidTriggerConfigException _ -> "com.amazonaws.codedeploy#InvalidTriggerConfigException"
    | `LifecycleHookLimitExceededException _ ->
        "com.amazonaws.codedeploy#LifecycleHookLimitExceededException"
    | `TagSetListLimitExceededException _ ->
        "com.amazonaws.codedeploy#TagSetListLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.codedeploy#ThrottlingException"
    | `TriggerTargetsLimitExceededException _ ->
        "com.amazonaws.codedeploy#TriggerTargetsLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlarmsLimitExceededException" ->
          `AlarmsLimitExceededException
            (Json_deserializers.alarms_limit_exceeded_exception_of_yojson tree path)
      | _, "ApplicationDoesNotExistException" ->
          `ApplicationDoesNotExistException
            (Json_deserializers.application_does_not_exist_exception_of_yojson tree path)
      | _, "ApplicationNameRequiredException" ->
          `ApplicationNameRequiredException
            (Json_deserializers.application_name_required_exception_of_yojson tree path)
      | _, "DeploymentConfigDoesNotExistException" ->
          `DeploymentConfigDoesNotExistException
            (Json_deserializers.deployment_config_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupAlreadyExistsException" ->
          `DeploymentGroupAlreadyExistsException
            (Json_deserializers.deployment_group_already_exists_exception_of_yojson tree path)
      | _, "DeploymentGroupDoesNotExistException" ->
          `DeploymentGroupDoesNotExistException
            (Json_deserializers.deployment_group_does_not_exist_exception_of_yojson tree path)
      | _, "DeploymentGroupNameRequiredException" ->
          `DeploymentGroupNameRequiredException
            (Json_deserializers.deployment_group_name_required_exception_of_yojson tree path)
      | _, "ECSServiceMappingLimitExceededException" ->
          `ECSServiceMappingLimitExceededException
            (Json_deserializers.ecs_service_mapping_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidAlarmConfigException" ->
          `InvalidAlarmConfigException
            (Json_deserializers.invalid_alarm_config_exception_of_yojson tree path)
      | _, "InvalidApplicationNameException" ->
          `InvalidApplicationNameException
            (Json_deserializers.invalid_application_name_exception_of_yojson tree path)
      | _, "InvalidAutoRollbackConfigException" ->
          `InvalidAutoRollbackConfigException
            (Json_deserializers.invalid_auto_rollback_config_exception_of_yojson tree path)
      | _, "InvalidAutoScalingGroupException" ->
          `InvalidAutoScalingGroupException
            (Json_deserializers.invalid_auto_scaling_group_exception_of_yojson tree path)
      | _, "InvalidBlueGreenDeploymentConfigurationException" ->
          `InvalidBlueGreenDeploymentConfigurationException
            (Json_deserializers.invalid_blue_green_deployment_configuration_exception_of_yojson tree
               path)
      | _, "InvalidDeploymentConfigNameException" ->
          `InvalidDeploymentConfigNameException
            (Json_deserializers.invalid_deployment_config_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentGroupNameException" ->
          `InvalidDeploymentGroupNameException
            (Json_deserializers.invalid_deployment_group_name_exception_of_yojson tree path)
      | _, "InvalidDeploymentStyleException" ->
          `InvalidDeploymentStyleException
            (Json_deserializers.invalid_deployment_style_exception_of_yojson tree path)
      | _, "InvalidEC2TagCombinationException" ->
          `InvalidEC2TagCombinationException
            (Json_deserializers.invalid_ec2_tag_combination_exception_of_yojson tree path)
      | _, "InvalidEC2TagException" ->
          `InvalidEC2TagException (Json_deserializers.invalid_ec2_tag_exception_of_yojson tree path)
      | _, "InvalidECSServiceException" ->
          `InvalidECSServiceException
            (Json_deserializers.invalid_ecs_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidLoadBalancerInfoException" ->
          `InvalidLoadBalancerInfoException
            (Json_deserializers.invalid_load_balancer_info_exception_of_yojson tree path)
      | _, "InvalidOnPremisesTagCombinationException" ->
          `InvalidOnPremisesTagCombinationException
            (Json_deserializers.invalid_on_premises_tag_combination_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "InvalidTargetGroupPairException" ->
          `InvalidTargetGroupPairException
            (Json_deserializers.invalid_target_group_pair_exception_of_yojson tree path)
      | _, "InvalidTrafficRoutingConfigurationException" ->
          `InvalidTrafficRoutingConfigurationException
            (Json_deserializers.invalid_traffic_routing_configuration_exception_of_yojson tree path)
      | _, "InvalidTriggerConfigException" ->
          `InvalidTriggerConfigException
            (Json_deserializers.invalid_trigger_config_exception_of_yojson tree path)
      | _, "LifecycleHookLimitExceededException" ->
          `LifecycleHookLimitExceededException
            (Json_deserializers.lifecycle_hook_limit_exceeded_exception_of_yojson tree path)
      | _, "TagSetListLimitExceededException" ->
          `TagSetListLimitExceededException
            (Json_deserializers.tag_set_list_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TriggerTargetsLimitExceededException" ->
          `TriggerTargetsLimitExceededException
            (Json_deserializers.trigger_targets_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_deployment_group_input) =
    let input = Json_serializers.update_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeDeploy_20141006.UpdateDeploymentGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_deployment_group_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_deployment_group_input) =
    let input = Json_serializers.update_deployment_group_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodeDeploy_20141006.UpdateDeploymentGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_deployment_group_output_of_yojson
      ~error_deserializer
end
