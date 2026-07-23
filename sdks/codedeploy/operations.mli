open Types

module ContinueDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `DeploymentIsNotInReadyStateException of deployment_is_not_in_ready_state_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidDeploymentStatusException of invalid_deployment_status_exception
    | `InvalidDeploymentWaitTypeException of invalid_deployment_wait_type_exception
    | `UnsupportedActionForDeploymentTypeException of
      unsupported_action_for_deployment_type_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    continue_deployment_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentIsNotInReadyStateException of deployment_is_not_in_ready_state_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentStatusException of invalid_deployment_status_exception
      | `InvalidDeploymentWaitTypeException of invalid_deployment_wait_type_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    continue_deployment_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentIsNotInReadyStateException of deployment_is_not_in_ready_state_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentStatusException of invalid_deployment_status_exception
      | `InvalidDeploymentWaitTypeException of invalid_deployment_wait_type_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a blue/green deployment, starts the process of rerouting traffic from instances in the \
   original environment to instances in the replacement environment without waiting for a \
   specified wait time to elapse. (Traffic rerouting, which is achieved by registering instances \
   in the replacement environment with the load balancer, can start as soon as all instances have \
   a status of Ready.) \n"]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationAlreadyExistsException of application_already_exists_exception
    | `ApplicationLimitExceededException of application_limit_exceeded_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidComputePlatformException of invalid_compute_platform_exception
    | `InvalidTagsToAddException of invalid_tags_to_add_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_input ->
    ( create_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationAlreadyExistsException of application_already_exists_exception
      | `ApplicationLimitExceededException of application_limit_exceeded_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_input ->
    ( create_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationAlreadyExistsException of application_already_exists_exception
      | `ApplicationLimitExceededException of application_limit_exceeded_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an application.\n"]

module CreateDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
    | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
    | `DeploymentLimitExceededException of deployment_limit_exceeded_exception
    | `DescriptionTooLongException of description_too_long_exception
    | `InvalidAlarmConfigException of invalid_alarm_config_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
    | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
    | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
    | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
    | `InvalidFileExistsBehaviorException of invalid_file_exists_behavior_exception
    | `InvalidGitHubAccountTokenException of invalid_git_hub_account_token_exception
    | `InvalidIgnoreApplicationStopFailuresValueException of
      invalid_ignore_application_stop_failures_value_exception
    | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
    | `InvalidRevisionException of invalid_revision_exception
    | `InvalidRoleException of invalid_role_exception
    | `InvalidTargetInstancesException of invalid_target_instances_exception
    | `InvalidTrafficRoutingConfigurationException of
      invalid_traffic_routing_configuration_exception
    | `InvalidUpdateOutdatedInstancesOnlyValueException of
      invalid_update_outdated_instances_only_value_exception
    | `RevisionDoesNotExistException of revision_does_not_exist_exception
    | `RevisionRequiredException of revision_required_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_deployment_input ->
    ( create_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `DeploymentLimitExceededException of deployment_limit_exceeded_exception
      | `DescriptionTooLongException of description_too_long_exception
      | `InvalidAlarmConfigException of invalid_alarm_config_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
      | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidFileExistsBehaviorException of invalid_file_exists_behavior_exception
      | `InvalidGitHubAccountTokenException of invalid_git_hub_account_token_exception
      | `InvalidIgnoreApplicationStopFailuresValueException of
        invalid_ignore_application_stop_failures_value_exception
      | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `InvalidRoleException of invalid_role_exception
      | `InvalidTargetInstancesException of invalid_target_instances_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidUpdateOutdatedInstancesOnlyValueException of
        invalid_update_outdated_instances_only_value_exception
      | `RevisionDoesNotExistException of revision_does_not_exist_exception
      | `RevisionRequiredException of revision_required_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_deployment_input ->
    ( create_deployment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `DeploymentLimitExceededException of deployment_limit_exceeded_exception
      | `DescriptionTooLongException of description_too_long_exception
      | `InvalidAlarmConfigException of invalid_alarm_config_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
      | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidFileExistsBehaviorException of invalid_file_exists_behavior_exception
      | `InvalidGitHubAccountTokenException of invalid_git_hub_account_token_exception
      | `InvalidIgnoreApplicationStopFailuresValueException of
        invalid_ignore_application_stop_failures_value_exception
      | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `InvalidRoleException of invalid_role_exception
      | `InvalidTargetInstancesException of invalid_target_instances_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidUpdateOutdatedInstancesOnlyValueException of
        invalid_update_outdated_instances_only_value_exception
      | `RevisionDoesNotExistException of revision_does_not_exist_exception
      | `RevisionRequiredException of revision_required_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deploys an application revision through the specified deployment group.\n"]

module CreateDeploymentConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentConfigAlreadyExistsException of deployment_config_already_exists_exception
    | `DeploymentConfigLimitExceededException of deployment_config_limit_exceeded_exception
    | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
    | `InvalidComputePlatformException of invalid_compute_platform_exception
    | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
    | `InvalidMinimumHealthyHostValueException of invalid_minimum_healthy_host_value_exception
    | `InvalidTrafficRoutingConfigurationException of
      invalid_traffic_routing_configuration_exception
    | `InvalidZonalDeploymentConfigurationException of
      invalid_zonal_deployment_configuration_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_deployment_config_input ->
    ( create_deployment_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentConfigAlreadyExistsException of deployment_config_already_exists_exception
      | `DeploymentConfigLimitExceededException of deployment_config_limit_exceeded_exception
      | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidMinimumHealthyHostValueException of invalid_minimum_healthy_host_value_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidZonalDeploymentConfigurationException of
        invalid_zonal_deployment_configuration_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_deployment_config_input ->
    ( create_deployment_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentConfigAlreadyExistsException of deployment_config_already_exists_exception
      | `DeploymentConfigLimitExceededException of deployment_config_limit_exceeded_exception
      | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidMinimumHealthyHostValueException of invalid_minimum_healthy_host_value_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidZonalDeploymentConfigurationException of
        invalid_zonal_deployment_configuration_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Creates a deployment configuration. \n"]

module CreateDeploymentGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentGroupAlreadyExistsException of deployment_group_already_exists_exception
    | `DeploymentGroupLimitExceededException of deployment_group_limit_exceeded_exception
    | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
    | `ECSServiceMappingLimitExceededException of ecs_service_mapping_limit_exceeded_exception
    | `InvalidAlarmConfigException of invalid_alarm_config_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
    | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
    | `InvalidBlueGreenDeploymentConfigurationException of
      invalid_blue_green_deployment_configuration_exception
    | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
    | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
    | `InvalidDeploymentStyleException of invalid_deployment_style_exception
    | `InvalidEC2TagCombinationException of invalid_ec2_tag_combination_exception
    | `InvalidEC2TagException of invalid_ec2_tag_exception
    | `InvalidECSServiceException of invalid_ecs_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
    | `InvalidOnPremisesTagCombinationException of invalid_on_premises_tag_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `InvalidTagException of invalid_tag_exception
    | `InvalidTagsToAddException of invalid_tags_to_add_exception
    | `InvalidTargetGroupPairException of invalid_target_group_pair_exception
    | `InvalidTrafficRoutingConfigurationException of
      invalid_traffic_routing_configuration_exception
    | `InvalidTriggerConfigException of invalid_trigger_config_exception
    | `LifecycleHookLimitExceededException of lifecycle_hook_limit_exceeded_exception
    | `RoleRequiredException of role_required_exception
    | `TagSetListLimitExceededException of tag_set_list_limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TriggerTargetsLimitExceededException of trigger_targets_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_deployment_group_input ->
    ( create_deployment_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupAlreadyExistsException of deployment_group_already_exists_exception
      | `DeploymentGroupLimitExceededException of deployment_group_limit_exceeded_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `ECSServiceMappingLimitExceededException of ecs_service_mapping_limit_exceeded_exception
      | `InvalidAlarmConfigException of invalid_alarm_config_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
      | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
      | `InvalidBlueGreenDeploymentConfigurationException of
        invalid_blue_green_deployment_configuration_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidDeploymentStyleException of invalid_deployment_style_exception
      | `InvalidEC2TagCombinationException of invalid_ec2_tag_combination_exception
      | `InvalidEC2TagException of invalid_ec2_tag_exception
      | `InvalidECSServiceException of invalid_ecs_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
      | `InvalidOnPremisesTagCombinationException of invalid_on_premises_tag_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception
      | `InvalidTargetGroupPairException of invalid_target_group_pair_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidTriggerConfigException of invalid_trigger_config_exception
      | `LifecycleHookLimitExceededException of lifecycle_hook_limit_exceeded_exception
      | `RoleRequiredException of role_required_exception
      | `TagSetListLimitExceededException of tag_set_list_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TriggerTargetsLimitExceededException of trigger_targets_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_deployment_group_input ->
    ( create_deployment_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupAlreadyExistsException of deployment_group_already_exists_exception
      | `DeploymentGroupLimitExceededException of deployment_group_limit_exceeded_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `ECSServiceMappingLimitExceededException of ecs_service_mapping_limit_exceeded_exception
      | `InvalidAlarmConfigException of invalid_alarm_config_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
      | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
      | `InvalidBlueGreenDeploymentConfigurationException of
        invalid_blue_green_deployment_configuration_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidDeploymentStyleException of invalid_deployment_style_exception
      | `InvalidEC2TagCombinationException of invalid_ec2_tag_combination_exception
      | `InvalidEC2TagException of invalid_ec2_tag_exception
      | `InvalidECSServiceException of invalid_ecs_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
      | `InvalidOnPremisesTagCombinationException of invalid_on_premises_tag_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception
      | `InvalidTargetGroupPairException of invalid_target_group_pair_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidTriggerConfigException of invalid_trigger_config_exception
      | `LifecycleHookLimitExceededException of lifecycle_hook_limit_exceeded_exception
      | `RoleRequiredException of role_required_exception
      | `TagSetListLimitExceededException of tag_set_list_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TriggerTargetsLimitExceededException of trigger_targets_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a deployment group to which application revisions are deployed.\n"]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationNameRequiredException of application_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidRoleException of invalid_role_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRoleException of invalid_role_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRoleException of invalid_role_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an application.\n"]

module DeleteDeploymentConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentConfigInUseException of deployment_config_in_use_exception
    | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
    | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
    | `InvalidOperationException of invalid_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_deployment_config_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentConfigInUseException of deployment_config_in_use_exception
      | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidOperationException of invalid_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_deployment_config_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentConfigInUseException of deployment_config_in_use_exception
      | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidOperationException of invalid_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a deployment configuration.\n\n\
  \  A deployment configuration cannot be deleted if it is currently in use. Predefined \
   configurations cannot be deleted.\n\
  \  \n\
  \   "]

module DeleteDeploymentGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationNameRequiredException of application_name_required_exception
    | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
    | `InvalidRoleException of invalid_role_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_deployment_group_input ->
    ( delete_deployment_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidRoleException of invalid_role_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_deployment_group_input ->
    ( delete_deployment_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidRoleException of invalid_role_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a deployment group.\n"]

module DeleteGitHubAccountToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `GitHubAccountTokenDoesNotExistException of git_hub_account_token_does_not_exist_exception
    | `GitHubAccountTokenNameRequiredException of git_hub_account_token_name_required_exception
    | `InvalidGitHubAccountTokenNameException of invalid_git_hub_account_token_name_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceValidationException of resource_validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_git_hub_account_token_input ->
    ( delete_git_hub_account_token_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GitHubAccountTokenDoesNotExistException of git_hub_account_token_does_not_exist_exception
      | `GitHubAccountTokenNameRequiredException of git_hub_account_token_name_required_exception
      | `InvalidGitHubAccountTokenNameException of invalid_git_hub_account_token_name_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceValidationException of resource_validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_git_hub_account_token_input ->
    ( delete_git_hub_account_token_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GitHubAccountTokenDoesNotExistException of git_hub_account_token_does_not_exist_exception
      | `GitHubAccountTokenNameRequiredException of git_hub_account_token_name_required_exception
      | `InvalidGitHubAccountTokenNameException of invalid_git_hub_account_token_name_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceValidationException of resource_validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a GitHub account connection.\n"]

module DeleteResourcesByExternalId : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resources_by_external_id_input ->
    (delete_resources_by_external_id_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resources_by_external_id_input ->
    ( delete_resources_by_external_id_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes resources linked to an external ID. This action only applies if you have configured \
   blue/green deployments through CloudFormation. \n\n\
  \  It is not necessary to call this action directly. CloudFormation calls it on your behalf when \
   it needs to delete stack resources. This action is offered publicly in case you need to delete \
   resources to comply with General Data Protection Regulation (GDPR) requirements.\n\
  \  \n\
  \   "]

module DeregisterOnPremisesInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InstanceNameRequiredException of instance_name_required_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_on_premises_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_on_premises_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deregisters an on-premises instance.\n"]

module GetApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_application_input ->
    ( get_application_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_application_input ->
    ( get_application_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an application.\n"]

module GetApplicationRevision : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidRevisionException of invalid_revision_exception
    | `RevisionDoesNotExistException of revision_does_not_exist_exception
    | `RevisionRequiredException of revision_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_application_revision_input ->
    ( get_application_revision_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `RevisionDoesNotExistException of revision_does_not_exist_exception
      | `RevisionRequiredException of revision_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_application_revision_input ->
    ( get_application_revision_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `RevisionDoesNotExistException of revision_does_not_exist_exception
      | `RevisionRequiredException of revision_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an application revision.\n"]

module GetDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_input ->
    ( get_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_input ->
    ( get_deployment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a deployment.\n\n\
  \   The [content] property of the [appSpecContent] object in the returned revision is always \
   null. Use [GetApplicationRevision] and the [sha256] property of the returned [appSpecContent] \
   object to get the content of the deployment\226\128\153s AppSpec file. \n\
  \  \n\
  \   "]

module GetDeploymentConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
    | `InvalidComputePlatformException of invalid_compute_platform_exception
    | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_config_input ->
    ( get_deployment_config_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_config_input ->
    ( get_deployment_config_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentConfigNameRequiredException of deployment_config_name_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a deployment configuration.\n"]

module GetDeploymentGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
    | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_group_input ->
    ( get_deployment_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_group_input ->
    ( get_deployment_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a deployment group.\n"]

module GetDeploymentInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `InstanceDoesNotExistException of instance_does_not_exist_exception
    | `InstanceIdRequiredException of instance_id_required_exception
    | `InvalidComputePlatformException of invalid_compute_platform_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_instance_input ->
    ( get_deployment_instance_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InstanceDoesNotExistException of instance_does_not_exist_exception
      | `InstanceIdRequiredException of instance_id_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_instance_input ->
    ( get_deployment_instance_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InstanceDoesNotExistException of instance_does_not_exist_exception
      | `InstanceIdRequiredException of instance_id_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an instance as part of a deployment.\n"]

module GetDeploymentTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `DeploymentNotStartedException of deployment_not_started_exception
    | `DeploymentTargetDoesNotExistException of deployment_target_does_not_exist_exception
    | `DeploymentTargetIdRequiredException of deployment_target_id_required_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidDeploymentTargetIdException of invalid_deployment_target_id_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_target_input ->
    ( get_deployment_target_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `DeploymentTargetDoesNotExistException of deployment_target_does_not_exist_exception
      | `DeploymentTargetIdRequiredException of deployment_target_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentTargetIdException of invalid_deployment_target_id_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_deployment_target_input ->
    ( get_deployment_target_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `DeploymentTargetDoesNotExistException of deployment_target_does_not_exist_exception
      | `DeploymentTargetIdRequiredException of deployment_target_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentTargetIdException of invalid_deployment_target_id_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns information about a deployment target. \n"]

module GetOnPremisesInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InstanceNameRequiredException of instance_name_required_exception
    | `InstanceNotRegisteredException of instance_not_registered_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_on_premises_instance_input ->
    ( get_on_premises_instance_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InstanceNotRegisteredException of instance_not_registered_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_on_premises_instance_input ->
    ( get_on_premises_instance_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InstanceNotRegisteredException of instance_not_registered_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Gets information about an on-premises instance. \n"]

module ListApplicationRevisions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `BucketNameFilterRequiredException of bucket_name_filter_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidBucketNameFilterException of invalid_bucket_name_filter_exception
    | `InvalidDeployedStateFilterException of invalid_deployed_state_filter_exception
    | `InvalidKeyPrefixFilterException of invalid_key_prefix_filter_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidSortByException of invalid_sort_by_exception
    | `InvalidSortOrderException of invalid_sort_order_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_revisions_input ->
    ( list_application_revisions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BucketNameFilterRequiredException of bucket_name_filter_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidBucketNameFilterException of invalid_bucket_name_filter_exception
      | `InvalidDeployedStateFilterException of invalid_deployed_state_filter_exception
      | `InvalidKeyPrefixFilterException of invalid_key_prefix_filter_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidSortByException of invalid_sort_by_exception
      | `InvalidSortOrderException of invalid_sort_order_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_revisions_input ->
    ( list_application_revisions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BucketNameFilterRequiredException of bucket_name_filter_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidBucketNameFilterException of invalid_bucket_name_filter_exception
      | `InvalidDeployedStateFilterException of invalid_deployed_state_filter_exception
      | `InvalidKeyPrefixFilterException of invalid_key_prefix_filter_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidSortByException of invalid_sort_by_exception
      | `InvalidSortOrderException of invalid_sort_order_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists information about revisions for an application.\n"]

module ListApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_applications_input ->
    ( list_applications_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_applications_input ->
    ( list_applications_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the applications registered with the user or Amazon Web Services account.\n"]

module ListDeploymentConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_configs_input ->
    ( list_deployment_configs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_configs_input ->
    ( list_deployment_configs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the deployment configurations with the user or Amazon Web Services account.\n"]

module ListDeploymentGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_groups_input ->
    ( list_deployment_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_groups_input ->
    ( list_deployment_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the deployment groups for an application registered with the Amazon Web Services user or \
   Amazon Web Services account.\n"]

module ListDeploymentInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `DeploymentNotStartedException of deployment_not_started_exception
    | `InvalidComputePlatformException of invalid_compute_platform_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidDeploymentInstanceTypeException of invalid_deployment_instance_type_exception
    | `InvalidInstanceStatusException of invalid_instance_status_exception
    | `InvalidInstanceTypeException of invalid_instance_type_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidTargetFilterNameException of invalid_target_filter_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_instances_input ->
    ( list_deployment_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentInstanceTypeException of invalid_deployment_instance_type_exception
      | `InvalidInstanceStatusException of invalid_instance_status_exception
      | `InvalidInstanceTypeException of invalid_instance_type_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTargetFilterNameException of invalid_target_filter_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_instances_input ->
    ( list_deployment_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentInstanceTypeException of invalid_deployment_instance_type_exception
      | `InvalidInstanceStatusException of invalid_instance_status_exception
      | `InvalidInstanceTypeException of invalid_instance_type_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTargetFilterNameException of invalid_target_filter_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  The newer [BatchGetDeploymentTargets] should be used instead because it works with all \
   compute types. [ListDeploymentInstances] throws an exception if it is used with a compute \
   platform other than EC2/On-premises or Lambda. \n\
  \ \n\
  \    Lists the instance for a deployment associated with the user or Amazon Web Services account. \n\
  \   "]

module ListDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
    | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
    | `InvalidDeploymentStatusException of invalid_deployment_status_exception
    | `InvalidExternalIdException of invalid_external_id_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidTimeRangeException of invalid_time_range_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deployments_input ->
    ( list_deployments_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidDeploymentStatusException of invalid_deployment_status_exception
      | `InvalidExternalIdException of invalid_external_id_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTimeRangeException of invalid_time_range_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_deployments_input ->
    ( list_deployments_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidDeploymentStatusException of invalid_deployment_status_exception
      | `InvalidExternalIdException of invalid_external_id_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTimeRangeException of invalid_time_range_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the deployments in a deployment group for an application registered with the user or \
   Amazon Web Services account.\n"]

module ListDeploymentTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `DeploymentNotStartedException of deployment_not_started_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidDeploymentInstanceTypeException of invalid_deployment_instance_type_exception
    | `InvalidInstanceStatusException of invalid_instance_status_exception
    | `InvalidInstanceTypeException of invalid_instance_type_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidTargetFilterNameException of invalid_target_filter_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_targets_input ->
    ( list_deployment_targets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentInstanceTypeException of invalid_deployment_instance_type_exception
      | `InvalidInstanceStatusException of invalid_instance_status_exception
      | `InvalidInstanceTypeException of invalid_instance_type_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTargetFilterNameException of invalid_target_filter_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_deployment_targets_input ->
    ( list_deployment_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentInstanceTypeException of invalid_deployment_instance_type_exception
      | `InvalidInstanceStatusException of invalid_instance_status_exception
      | `InvalidInstanceTypeException of invalid_instance_type_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTargetFilterNameException of invalid_target_filter_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns an array of target IDs that are associated a deployment. \n"]

module ListGitHubAccountTokenNames : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `ResourceValidationException of resource_validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_git_hub_account_token_names_input ->
    ( list_git_hub_account_token_names_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceValidationException of resource_validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_git_hub_account_token_names_input ->
    ( list_git_hub_account_token_names_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `ResourceValidationException of resource_validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the names of stored connections to GitHub accounts.\n"]

module ListOnPremisesInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidRegistrationStatusException of invalid_registration_status_exception
    | `InvalidTagFilterException of invalid_tag_filter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_on_premises_instances_input ->
    ( list_on_premises_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRegistrationStatusException of invalid_registration_status_exception
      | `InvalidTagFilterException of invalid_tag_filter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_on_premises_instances_input ->
    ( list_on_premises_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidRegistrationStatusException of invalid_registration_status_exception
      | `InvalidTagFilterException of invalid_tag_filter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of names for one or more on-premises instances.\n\n\
  \ Unless otherwise specified, both registered and deregistered on-premises instance names are \
   listed. To list only registered or deregistered on-premises instance names, use the \
   registration status parameter.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ArnNotSupportedException of arn_not_supported_exception
    | `InvalidArnException of invalid_arn_exception
    | `ResourceArnRequiredException of resource_arn_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArnNotSupportedException of arn_not_supported_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceArnRequiredException of resource_arn_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ArnNotSupportedException of arn_not_supported_exception
      | `InvalidArnException of invalid_arn_exception
      | `ResourceArnRequiredException of resource_arn_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns a list of tags for the resource identified by a specified Amazon Resource Name (ARN). \
   Tags are used to organize and categorize your CodeDeploy resources. \n"]

module PutLifecycleEventHookExecutionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidLifecycleEventHookExecutionIdException of
      invalid_lifecycle_event_hook_execution_id_exception
    | `InvalidLifecycleEventHookExecutionStatusException of
      invalid_lifecycle_event_hook_execution_status_exception
    | `LifecycleEventAlreadyCompletedException of lifecycle_event_already_completed_exception
    | `UnsupportedActionForDeploymentTypeException of
      unsupported_action_for_deployment_type_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_event_hook_execution_status_input ->
    ( put_lifecycle_event_hook_execution_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidLifecycleEventHookExecutionIdException of
        invalid_lifecycle_event_hook_execution_id_exception
      | `InvalidLifecycleEventHookExecutionStatusException of
        invalid_lifecycle_event_hook_execution_status_exception
      | `LifecycleEventAlreadyCompletedException of lifecycle_event_already_completed_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_event_hook_execution_status_input ->
    ( put_lifecycle_event_hook_execution_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidLifecycleEventHookExecutionIdException of
        invalid_lifecycle_event_hook_execution_id_exception
      | `InvalidLifecycleEventHookExecutionStatusException of
        invalid_lifecycle_event_hook_execution_status_exception
      | `LifecycleEventAlreadyCompletedException of lifecycle_event_already_completed_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Sets the result of a Lambda validation function. The function validates lifecycle hooks during \
   a deployment that uses the Lambda or Amazon ECS compute platform. For Lambda deployments, the \
   available lifecycle hooks are [BeforeAllowTraffic] and [AfterAllowTraffic]. For Amazon ECS \
   deployments, the available lifecycle hooks are [BeforeInstall], [AfterInstall], \
   [AfterAllowTestTraffic], [BeforeAllowTraffic], and [AfterAllowTraffic]. Lambda validation \
   functions return [Succeeded] or [Failed]. For more information, see \
   {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-lambda}AppSpec \
   'hooks' Section for an Lambda Deployment } and \
   {{:https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html#appspec-hooks-ecs}AppSpec \
   'hooks' Section for an Amazon ECS Deployment}.\n"]

module RegisterApplicationRevision : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `DescriptionTooLongException of description_too_long_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidRevisionException of invalid_revision_exception
    | `RevisionRequiredException of revision_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_application_revision_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DescriptionTooLongException of description_too_long_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `RevisionRequiredException of revision_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_application_revision_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DescriptionTooLongException of description_too_long_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `RevisionRequiredException of revision_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Registers with CodeDeploy a revision for the specified application.\n"]

module RegisterOnPremisesInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IamArnRequiredException of iam_arn_required_exception
    | `IamSessionArnAlreadyRegisteredException of iam_session_arn_already_registered_exception
    | `IamUserArnAlreadyRegisteredException of iam_user_arn_already_registered_exception
    | `IamUserArnRequiredException of iam_user_arn_required_exception
    | `InstanceNameAlreadyRegisteredException of instance_name_already_registered_exception
    | `InstanceNameRequiredException of instance_name_required_exception
    | `InvalidIamSessionArnException of invalid_iam_session_arn_exception
    | `InvalidIamUserArnException of invalid_iam_user_arn_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception
    | `MultipleIamArnsProvidedException of multiple_iam_arns_provided_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_on_premises_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IamArnRequiredException of iam_arn_required_exception
      | `IamSessionArnAlreadyRegisteredException of iam_session_arn_already_registered_exception
      | `IamUserArnAlreadyRegisteredException of iam_user_arn_already_registered_exception
      | `IamUserArnRequiredException of iam_user_arn_required_exception
      | `InstanceNameAlreadyRegisteredException of instance_name_already_registered_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InvalidIamSessionArnException of invalid_iam_session_arn_exception
      | `InvalidIamUserArnException of invalid_iam_user_arn_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception
      | `MultipleIamArnsProvidedException of multiple_iam_arns_provided_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_on_premises_instance_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IamArnRequiredException of iam_arn_required_exception
      | `IamSessionArnAlreadyRegisteredException of iam_session_arn_already_registered_exception
      | `IamUserArnAlreadyRegisteredException of iam_user_arn_already_registered_exception
      | `IamUserArnRequiredException of iam_user_arn_required_exception
      | `InstanceNameAlreadyRegisteredException of instance_name_already_registered_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InvalidIamSessionArnException of invalid_iam_session_arn_exception
      | `InvalidIamUserArnException of invalid_iam_user_arn_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception
      | `MultipleIamArnsProvidedException of multiple_iam_arns_provided_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers an on-premises instance.\n\n\
  \  Only one IAM ARN (an IAM session ARN or IAM user ARN) is supported in the request. You cannot \
   use both.\n\
  \  \n\
  \   "]

module RemoveTagsFromOnPremisesInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InstanceLimitExceededException of instance_limit_exceeded_exception
    | `InstanceNameRequiredException of instance_name_required_exception
    | `InstanceNotRegisteredException of instance_not_registered_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception
    | `InvalidTagException of invalid_tag_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception
    | `TagRequiredException of tag_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_on_premises_instances_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceLimitExceededException of instance_limit_exceeded_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InstanceNotRegisteredException of instance_not_registered_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception
      | `InvalidTagException of invalid_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagRequiredException of tag_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_on_premises_instances_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceLimitExceededException of instance_limit_exceeded_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InstanceNotRegisteredException of instance_not_registered_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception
      | `InvalidTagException of invalid_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagRequiredException of tag_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more tags from one or more on-premises instances.\n"]

module SkipWaitTimeForInstanceTermination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `DeploymentNotStartedException of deployment_not_started_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `UnsupportedActionForDeploymentTypeException of
      unsupported_action_for_deployment_type_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    skip_wait_time_for_instance_termination_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    skip_wait_time_for_instance_termination_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "In a blue/green deployment, overrides any specified wait time and starts terminating instances \
   immediately after the traffic routing is complete.\n"]

module StopDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `UnsupportedActionForDeploymentTypeException of
      unsupported_action_for_deployment_type_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_deployment_input ->
    ( stop_deployment_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_deployment_input ->
    ( stop_deployment_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentAlreadyCompletedException of deployment_already_completed_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `UnsupportedActionForDeploymentTypeException of
        unsupported_action_for_deployment_type_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Attempts to stop an ongoing deployment.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ArnNotSupportedException of arn_not_supported_exception
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidTagsToAddException of invalid_tags_to_add_exception
    | `ResourceArnRequiredException of resource_arn_required_exception
    | `TagRequiredException of tag_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ArnNotSupportedException of arn_not_supported_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagRequiredException of tag_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ArnNotSupportedException of arn_not_supported_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagRequiredException of tag_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Associates the list of tags in the input [Tags] parameter with the resource identified by the \
   [ResourceArn] input parameter. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ArnNotSupportedException of arn_not_supported_exception
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidTagsToAddException of invalid_tags_to_add_exception
    | `ResourceArnRequiredException of resource_arn_required_exception
    | `TagRequiredException of tag_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ArnNotSupportedException of arn_not_supported_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagRequiredException of tag_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ArnNotSupportedException of arn_not_supported_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsToAddException of invalid_tags_to_add_exception
      | `ResourceArnRequiredException of resource_arn_required_exception
      | `TagRequiredException of tag_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Disassociates a resource from a list of tags. The resource is identified by the [ResourceArn] \
   input parameter. The tags are identified by the list of keys in the [TagKeys] input parameter. \n"]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationAlreadyExistsException of application_already_exists_exception
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationAlreadyExistsException of application_already_exists_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationAlreadyExistsException of application_already_exists_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes the name of an application.\n"]

module UpdateDeploymentGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentGroupAlreadyExistsException of deployment_group_already_exists_exception
    | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
    | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
    | `ECSServiceMappingLimitExceededException of ecs_service_mapping_limit_exceeded_exception
    | `InvalidAlarmConfigException of invalid_alarm_config_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
    | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
    | `InvalidBlueGreenDeploymentConfigurationException of
      invalid_blue_green_deployment_configuration_exception
    | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
    | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
    | `InvalidDeploymentStyleException of invalid_deployment_style_exception
    | `InvalidEC2TagCombinationException of invalid_ec2_tag_combination_exception
    | `InvalidEC2TagException of invalid_ec2_tag_exception
    | `InvalidECSServiceException of invalid_ecs_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
    | `InvalidOnPremisesTagCombinationException of invalid_on_premises_tag_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `InvalidTagException of invalid_tag_exception
    | `InvalidTargetGroupPairException of invalid_target_group_pair_exception
    | `InvalidTrafficRoutingConfigurationException of
      invalid_traffic_routing_configuration_exception
    | `InvalidTriggerConfigException of invalid_trigger_config_exception
    | `LifecycleHookLimitExceededException of lifecycle_hook_limit_exceeded_exception
    | `TagSetListLimitExceededException of tag_set_list_limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TriggerTargetsLimitExceededException of trigger_targets_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_deployment_group_input ->
    ( update_deployment_group_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupAlreadyExistsException of deployment_group_already_exists_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `ECSServiceMappingLimitExceededException of ecs_service_mapping_limit_exceeded_exception
      | `InvalidAlarmConfigException of invalid_alarm_config_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
      | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
      | `InvalidBlueGreenDeploymentConfigurationException of
        invalid_blue_green_deployment_configuration_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidDeploymentStyleException of invalid_deployment_style_exception
      | `InvalidEC2TagCombinationException of invalid_ec2_tag_combination_exception
      | `InvalidEC2TagException of invalid_ec2_tag_exception
      | `InvalidECSServiceException of invalid_ecs_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
      | `InvalidOnPremisesTagCombinationException of invalid_on_premises_tag_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidTargetGroupPairException of invalid_target_group_pair_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidTriggerConfigException of invalid_trigger_config_exception
      | `LifecycleHookLimitExceededException of lifecycle_hook_limit_exceeded_exception
      | `TagSetListLimitExceededException of tag_set_list_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TriggerTargetsLimitExceededException of trigger_targets_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_deployment_group_input ->
    ( update_deployment_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlarmsLimitExceededException of alarms_limit_exceeded_exception
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupAlreadyExistsException of deployment_group_already_exists_exception
      | `DeploymentGroupDoesNotExistException of deployment_group_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `ECSServiceMappingLimitExceededException of ecs_service_mapping_limit_exceeded_exception
      | `InvalidAlarmConfigException of invalid_alarm_config_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidAutoRollbackConfigException of invalid_auto_rollback_config_exception
      | `InvalidAutoScalingGroupException of invalid_auto_scaling_group_exception
      | `InvalidBlueGreenDeploymentConfigurationException of
        invalid_blue_green_deployment_configuration_exception
      | `InvalidDeploymentConfigNameException of invalid_deployment_config_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception
      | `InvalidDeploymentStyleException of invalid_deployment_style_exception
      | `InvalidEC2TagCombinationException of invalid_ec2_tag_combination_exception
      | `InvalidEC2TagException of invalid_ec2_tag_exception
      | `InvalidECSServiceException of invalid_ecs_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidLoadBalancerInfoException of invalid_load_balancer_info_exception
      | `InvalidOnPremisesTagCombinationException of invalid_on_premises_tag_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidTargetGroupPairException of invalid_target_group_pair_exception
      | `InvalidTrafficRoutingConfigurationException of
        invalid_traffic_routing_configuration_exception
      | `InvalidTriggerConfigException of invalid_trigger_config_exception
      | `LifecycleHookLimitExceededException of lifecycle_hook_limit_exceeded_exception
      | `TagSetListLimitExceededException of tag_set_list_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TriggerTargetsLimitExceededException of trigger_targets_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Changes information about a deployment group.\n"]

module BatchGetOnPremisesInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchLimitExceededException of batch_limit_exceeded_exception
    | `InstanceNameRequiredException of instance_name_required_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_on_premises_instances_input ->
    ( batch_get_on_premises_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_on_premises_instances_input ->
    ( batch_get_on_premises_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about one or more on-premises instances. The maximum number of on-premises \
   instances that can be returned is 25.\n"]

module BatchGetDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchLimitExceededException of batch_limit_exceeded_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployments_input ->
    ( batch_get_deployments_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployments_input ->
    ( batch_get_deployments_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about one or more deployments. The maximum number of deployments that can be \
   returned is 25.\n"]

module BatchGetDeploymentTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `DeploymentNotStartedException of deployment_not_started_exception
    | `DeploymentTargetDoesNotExistException of deployment_target_does_not_exist_exception
    | `DeploymentTargetIdRequiredException of deployment_target_id_required_exception
    | `DeploymentTargetListSizeExceededException of deployment_target_list_size_exceeded_exception
    | `InstanceDoesNotExistException of instance_does_not_exist_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidDeploymentTargetIdException of invalid_deployment_target_id_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployment_targets_input ->
    ( batch_get_deployment_targets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `DeploymentTargetDoesNotExistException of deployment_target_does_not_exist_exception
      | `DeploymentTargetIdRequiredException of deployment_target_id_required_exception
      | `DeploymentTargetListSizeExceededException of deployment_target_list_size_exceeded_exception
      | `InstanceDoesNotExistException of instance_does_not_exist_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentTargetIdException of invalid_deployment_target_id_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployment_targets_input ->
    ( batch_get_deployment_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `DeploymentNotStartedException of deployment_not_started_exception
      | `DeploymentTargetDoesNotExistException of deployment_target_does_not_exist_exception
      | `DeploymentTargetIdRequiredException of deployment_target_id_required_exception
      | `DeploymentTargetListSizeExceededException of deployment_target_list_size_exceeded_exception
      | `InstanceDoesNotExistException of instance_does_not_exist_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidDeploymentTargetIdException of invalid_deployment_target_id_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns an array of one or more targets associated with a deployment. This method works with \
   all compute types and should be used instead of the deprecated [BatchGetDeploymentInstances]. \
   The maximum number of targets that can be returned is 25.\n\n\
  \  The type of targets returned depends on the deployment's compute platform or deployment \
   method: \n\
  \ \n\
  \  {ul\n\
  \        {-   {b EC2/On-premises}: Information about Amazon EC2 instance targets. \n\
  \            \n\
  \             }\n\
  \        {-   {b Lambda}: Information about Lambda functions targets. \n\
  \            \n\
  \             }\n\
  \        {-   {b Amazon ECS}: Information about Amazon ECS service targets. \n\
  \            \n\
  \             }\n\
  \        {-   {b CloudFormation}: Information about targets of blue/green deployments initiated \
   by a CloudFormation stack update.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module BatchGetDeploymentInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BatchLimitExceededException of batch_limit_exceeded_exception
    | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
    | `DeploymentIdRequiredException of deployment_id_required_exception
    | `InstanceIdRequiredException of instance_id_required_exception
    | `InvalidComputePlatformException of invalid_compute_platform_exception
    | `InvalidDeploymentIdException of invalid_deployment_id_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployment_instances_input ->
    ( batch_get_deployment_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InstanceIdRequiredException of instance_id_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployment_instances_input ->
    ( batch_get_deployment_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `DeploymentDoesNotExistException of deployment_does_not_exist_exception
      | `DeploymentIdRequiredException of deployment_id_required_exception
      | `InstanceIdRequiredException of instance_id_required_exception
      | `InvalidComputePlatformException of invalid_compute_platform_exception
      | `InvalidDeploymentIdException of invalid_deployment_id_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  This method works, but is deprecated. Use [BatchGetDeploymentTargets] instead. \n\
  \ \n\
  \    Returns an array of one or more instances associated with a deployment. This method works \
   with EC2/On-premises and Lambda compute platforms. The newer [BatchGetDeploymentTargets] works \
   with all compute platforms. The maximum number of instances that can be returned is 25.\n\
  \   "]

module BatchGetDeploymentGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `BatchLimitExceededException of batch_limit_exceeded_exception
    | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
    | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployment_groups_input ->
    ( batch_get_deployment_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_deployment_groups_input ->
    ( batch_get_deployment_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `DeploymentConfigDoesNotExistException of deployment_config_does_not_exist_exception
      | `DeploymentGroupNameRequiredException of deployment_group_name_required_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidDeploymentGroupNameException of invalid_deployment_group_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about one or more deployment groups.\n"]

module BatchGetApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `BatchLimitExceededException of batch_limit_exceeded_exception
    | `InvalidApplicationNameException of invalid_application_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_applications_input ->
    ( batch_get_applications_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `InvalidApplicationNameException of invalid_application_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_applications_input ->
    ( batch_get_applications_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `InvalidApplicationNameException of invalid_application_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about one or more applications. The maximum number of applications that can be \
   returned is 100.\n"]

module BatchGetApplicationRevisions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ApplicationDoesNotExistException of application_does_not_exist_exception
    | `ApplicationNameRequiredException of application_name_required_exception
    | `BatchLimitExceededException of batch_limit_exceeded_exception
    | `InvalidApplicationNameException of invalid_application_name_exception
    | `InvalidRevisionException of invalid_revision_exception
    | `RevisionRequiredException of revision_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_application_revisions_input ->
    ( batch_get_application_revisions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `RevisionRequiredException of revision_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_application_revisions_input ->
    ( batch_get_application_revisions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ApplicationDoesNotExistException of application_does_not_exist_exception
      | `ApplicationNameRequiredException of application_name_required_exception
      | `BatchLimitExceededException of batch_limit_exceeded_exception
      | `InvalidApplicationNameException of invalid_application_name_exception
      | `InvalidRevisionException of invalid_revision_exception
      | `RevisionRequiredException of revision_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about one or more application revisions. The maximum number of application \
   revisions that can be returned is 25.\n"]

module AddTagsToOnPremisesInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InstanceLimitExceededException of instance_limit_exceeded_exception
    | `InstanceNameRequiredException of instance_name_required_exception
    | `InstanceNotRegisteredException of instance_not_registered_exception
    | `InvalidInstanceNameException of invalid_instance_name_exception
    | `InvalidTagException of invalid_tag_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception
    | `TagRequiredException of tag_required_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_on_premises_instances_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceLimitExceededException of instance_limit_exceeded_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InstanceNotRegisteredException of instance_not_registered_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception
      | `InvalidTagException of invalid_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagRequiredException of tag_required_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_on_premises_instances_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceLimitExceededException of instance_limit_exceeded_exception
      | `InstanceNameRequiredException of instance_name_required_exception
      | `InstanceNotRegisteredException of instance_not_registered_exception
      | `InvalidInstanceNameException of invalid_instance_name_exception
      | `InvalidTagException of invalid_tag_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception
      | `TagRequiredException of tag_required_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds tags to on-premises instances.\n"]
