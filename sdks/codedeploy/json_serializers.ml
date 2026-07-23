open Smaws_Lib.Json.SerializeHelpers
open Types

let message_to_yojson = string_to_yojson

let tag_required_exception_to_yojson (x : tag_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_limit_exceeded_exception_to_yojson (x : tag_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_instance_name_exception_to_yojson (x : invalid_instance_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_not_registered_exception_to_yojson (x : instance_not_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_name_required_exception_to_yojson (x : instance_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_limit_exceeded_exception_to_yojson (x : instance_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_name_to_yojson = string_to_yojson
let instance_name_list_to_yojson tree = list_to_yojson instance_name_to_yojson tree
let value_to_yojson = string_to_yojson
let key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson key_to_yojson x.key);
      ("Value", option_to_yojson value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let add_tags_to_on_premises_instances_input_to_yojson (x : add_tags_to_on_premises_instances_input)
    =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("instanceNames", Some (instance_name_list_to_yojson x.instance_names));
    ]

let additional_deployment_status_info_to_yojson = string_to_yojson
let alarm_name_to_yojson = string_to_yojson

let alarm_to_yojson (x : alarm) =
  assoc_to_yojson [ ("name", option_to_yojson alarm_name_to_yojson x.name) ]

let alarm_list_to_yojson tree = list_to_yojson alarm_to_yojson tree
let boolean__to_yojson = bool_to_yojson

let alarm_configuration_to_yojson (x : alarm_configuration) =
  assoc_to_yojson
    [
      ("enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("ignorePollAlarmFailure", option_to_yojson boolean__to_yojson x.ignore_poll_alarm_failure);
      ("alarms", option_to_yojson alarm_list_to_yojson x.alarms);
    ]

let alarms_limit_exceeded_exception_to_yojson (x : alarms_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let raw_string_sha256_to_yojson = string_to_yojson
let raw_string_content_to_yojson = string_to_yojson

let app_spec_content_to_yojson (x : app_spec_content) =
  assoc_to_yojson
    [
      ("content", option_to_yojson raw_string_content_to_yojson x.content);
      ("sha256", option_to_yojson raw_string_sha256_to_yojson x.sha256);
    ]

let application_already_exists_exception_to_yojson (x : application_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let application_does_not_exist_exception_to_yojson (x : application_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let application_id_to_yojson = string_to_yojson

let compute_platform_to_yojson (x : compute_platform) =
  match x with SERVER -> `String "Server" | LAMBDA -> `String "Lambda" | ECS -> `String "ECS"

let git_hub_account_token_name_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let application_name_to_yojson = string_to_yojson

let application_info_to_yojson (x : application_info) =
  assoc_to_yojson
    [
      ("applicationId", option_to_yojson application_id_to_yojson x.application_id);
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("linkedToGitHub", option_to_yojson boolean__to_yojson x.linked_to_git_hub);
      ( "gitHubAccountName",
        option_to_yojson git_hub_account_token_name_to_yojson x.git_hub_account_name );
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
    ]

let application_limit_exceeded_exception_to_yojson (x : application_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let application_name_required_exception_to_yojson (x : application_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let application_revision_sort_by_to_yojson (x : application_revision_sort_by) =
  match x with
  | RegisterTime -> `String "registerTime"
  | FirstUsedTime -> `String "firstUsedTime"
  | LastUsedTime -> `String "lastUsedTime"

let applications_info_list_to_yojson tree = list_to_yojson application_info_to_yojson tree
let applications_list_to_yojson tree = list_to_yojson application_name_to_yojson tree
let arn_to_yojson = string_to_yojson

let arn_not_supported_exception_to_yojson (x : arn_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let auto_rollback_event_to_yojson (x : auto_rollback_event) =
  match x with
  | DEPLOYMENT_FAILURE -> `String "DEPLOYMENT_FAILURE"
  | DEPLOYMENT_STOP_ON_ALARM -> `String "DEPLOYMENT_STOP_ON_ALARM"
  | DEPLOYMENT_STOP_ON_REQUEST -> `String "DEPLOYMENT_STOP_ON_REQUEST"

let auto_rollback_events_list_to_yojson tree = list_to_yojson auto_rollback_event_to_yojson tree

let auto_rollback_configuration_to_yojson (x : auto_rollback_configuration) =
  assoc_to_yojson
    [
      ("enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("events", option_to_yojson auto_rollback_events_list_to_yojson x.events);
    ]

let auto_scaling_group_hook_to_yojson = string_to_yojson
let auto_scaling_group_name_to_yojson = string_to_yojson

let auto_scaling_group_to_yojson (x : auto_scaling_group) =
  assoc_to_yojson
    [
      ("name", option_to_yojson auto_scaling_group_name_to_yojson x.name);
      ("hook", option_to_yojson auto_scaling_group_hook_to_yojson x.hook);
      ("terminationHook", option_to_yojson auto_scaling_group_hook_to_yojson x.termination_hook);
    ]

let auto_scaling_group_list_to_yojson tree = list_to_yojson auto_scaling_group_to_yojson tree

let auto_scaling_group_name_list_to_yojson tree =
  list_to_yojson auto_scaling_group_name_to_yojson tree

let revision_required_exception_to_yojson (x : revision_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_revision_exception_to_yojson (x : invalid_revision_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_application_name_exception_to_yojson (x : invalid_application_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let batch_limit_exceeded_exception_to_yojson (x : batch_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_name_to_yojson = string_to_yojson
let deployment_groups_list_to_yojson tree = list_to_yojson deployment_group_name_to_yojson tree
let description_to_yojson = string_to_yojson

let generic_revision_info_to_yojson (x : generic_revision_info) =
  assoc_to_yojson
    [
      ("description", option_to_yojson description_to_yojson x.description);
      ("deploymentGroups", option_to_yojson deployment_groups_list_to_yojson x.deployment_groups);
      ("firstUsedTime", option_to_yojson timestamp_to_yojson x.first_used_time);
      ("lastUsedTime", option_to_yojson timestamp_to_yojson x.last_used_time);
      ("registerTime", option_to_yojson timestamp_to_yojson x.register_time);
    ]

let raw_string_to_yojson (x : raw_string) =
  assoc_to_yojson
    [
      ("content", option_to_yojson raw_string_content_to_yojson x.content);
      ("sha256", option_to_yojson raw_string_sha256_to_yojson x.sha256);
    ]

let commit_id_to_yojson = string_to_yojson
let repository_to_yojson = string_to_yojson

let git_hub_location_to_yojson (x : git_hub_location) =
  assoc_to_yojson
    [
      ("repository", option_to_yojson repository_to_yojson x.repository);
      ("commitId", option_to_yojson commit_id_to_yojson x.commit_id);
    ]

let e_tag_to_yojson = string_to_yojson
let version_id_to_yojson = string_to_yojson

let bundle_type_to_yojson (x : bundle_type) =
  match x with
  | Tar -> `String "tar"
  | TarGZip -> `String "tgz"
  | Zip -> `String "zip"
  | YAML -> `String "YAML"
  | JSON -> `String "JSON"

let s3_key_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
      ("key", option_to_yojson s3_key_to_yojson x.key);
      ("bundleType", option_to_yojson bundle_type_to_yojson x.bundle_type);
      ("version", option_to_yojson version_id_to_yojson x.version);
      ("eTag", option_to_yojson e_tag_to_yojson x.e_tag);
    ]

let revision_location_type_to_yojson (x : revision_location_type) =
  match x with
  | S3 -> `String "S3"
  | GitHub -> `String "GitHub"
  | String -> `String "String"
  | AppSpecContent -> `String "AppSpecContent"

let revision_location_to_yojson (x : revision_location) =
  assoc_to_yojson
    [
      ("revisionType", option_to_yojson revision_location_type_to_yojson x.revision_type);
      ("s3Location", option_to_yojson s3_location_to_yojson x.s3_location);
      ("gitHubLocation", option_to_yojson git_hub_location_to_yojson x.git_hub_location);
      ("string", option_to_yojson raw_string_to_yojson x.string_);
      ("appSpecContent", option_to_yojson app_spec_content_to_yojson x.app_spec_content);
    ]

let revision_info_to_yojson (x : revision_info) =
  assoc_to_yojson
    [
      ("revisionLocation", option_to_yojson revision_location_to_yojson x.revision_location);
      ( "genericRevisionInfo",
        option_to_yojson generic_revision_info_to_yojson x.generic_revision_info );
    ]

let revision_info_list_to_yojson tree = list_to_yojson revision_info_to_yojson tree
let error_message_to_yojson = string_to_yojson

let batch_get_application_revisions_output_to_yojson (x : batch_get_application_revisions_output) =
  assoc_to_yojson
    [
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("revisions", option_to_yojson revision_info_list_to_yojson x.revisions);
    ]

let revision_location_list_to_yojson tree = list_to_yojson revision_location_to_yojson tree

let batch_get_application_revisions_input_to_yojson (x : batch_get_application_revisions_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("revisions", Some (revision_location_list_to_yojson x.revisions));
    ]

let batch_get_applications_output_to_yojson (x : batch_get_applications_output) =
  assoc_to_yojson
    [ ("applicationsInfo", option_to_yojson applications_info_list_to_yojson x.applications_info) ]

let batch_get_applications_input_to_yojson (x : batch_get_applications_input) =
  assoc_to_yojson [ ("applicationNames", Some (applications_list_to_yojson x.application_names)) ]

let invalid_deployment_group_name_exception_to_yojson (x : invalid_deployment_group_name_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_name_required_exception_to_yojson
    (x : deployment_group_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_config_does_not_exist_exception_to_yojson
    (x : deployment_config_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let ecs_cluster_name_to_yojson = string_to_yojson
let ecs_service_name_to_yojson = string_to_yojson

let ecs_service_to_yojson (x : ecs_service) =
  assoc_to_yojson
    [
      ("serviceName", option_to_yojson ecs_service_name_to_yojson x.service_name);
      ("clusterName", option_to_yojson ecs_cluster_name_to_yojson x.cluster_name);
    ]

let ecs_service_list_to_yojson tree = list_to_yojson ecs_service_to_yojson tree

let tag_filter_type_to_yojson (x : tag_filter_type) =
  match x with
  | KEY_ONLY -> `String "KEY_ONLY"
  | VALUE_ONLY -> `String "VALUE_ONLY"
  | KEY_AND_VALUE -> `String "KEY_AND_VALUE"

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson key_to_yojson x.key);
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Type", option_to_yojson tag_filter_type_to_yojson x.type_);
    ]

let tag_filter_list_to_yojson tree = list_to_yojson tag_filter_to_yojson tree
let on_premises_tag_set_list_to_yojson tree = list_to_yojson tag_filter_list_to_yojson tree

let on_premises_tag_set_to_yojson (x : on_premises_tag_set) =
  assoc_to_yojson
    [
      ( "onPremisesTagSetList",
        option_to_yojson on_premises_tag_set_list_to_yojson x.on_premises_tag_set_list );
    ]

let ec2_tag_filter_type_to_yojson (x : ec2_tag_filter_type) =
  match x with
  | KEY_ONLY -> `String "KEY_ONLY"
  | VALUE_ONLY -> `String "VALUE_ONLY"
  | KEY_AND_VALUE -> `String "KEY_AND_VALUE"

let ec2_tag_filter_to_yojson (x : ec2_tag_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson key_to_yojson x.key);
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Type", option_to_yojson ec2_tag_filter_type_to_yojson x.type_);
    ]

let ec2_tag_filter_list_to_yojson tree = list_to_yojson ec2_tag_filter_to_yojson tree
let ec2_tag_set_list_to_yojson tree = list_to_yojson ec2_tag_filter_list_to_yojson tree

let ec2_tag_set_to_yojson (x : ec2_tag_set) =
  assoc_to_yojson
    [ ("ec2TagSetList", option_to_yojson ec2_tag_set_list_to_yojson x.ec2_tag_set_list) ]

let deployment_status_to_yojson (x : deployment_status) =
  match x with
  | CREATED -> `String "Created"
  | QUEUED -> `String "Queued"
  | IN_PROGRESS -> `String "InProgress"
  | BAKING -> `String "Baking"
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"
  | STOPPED -> `String "Stopped"
  | READY -> `String "Ready"

let deployment_id_to_yojson = string_to_yojson

let last_deployment_info_to_yojson (x : last_deployment_info) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("status", option_to_yojson deployment_status_to_yojson x.status);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
    ]

let listener_arn_to_yojson = string_to_yojson
let listener_arn_list_to_yojson tree = list_to_yojson listener_arn_to_yojson tree

let traffic_route_to_yojson (x : traffic_route) =
  assoc_to_yojson [ ("listenerArns", option_to_yojson listener_arn_list_to_yojson x.listener_arns) ]

let target_group_name_to_yojson = string_to_yojson

let target_group_info_to_yojson (x : target_group_info) =
  assoc_to_yojson [ ("name", option_to_yojson target_group_name_to_yojson x.name) ]

let target_group_info_list_to_yojson tree = list_to_yojson target_group_info_to_yojson tree

let target_group_pair_info_to_yojson (x : target_group_pair_info) =
  assoc_to_yojson
    [
      ("targetGroups", option_to_yojson target_group_info_list_to_yojson x.target_groups);
      ("prodTrafficRoute", option_to_yojson traffic_route_to_yojson x.prod_traffic_route);
      ("testTrafficRoute", option_to_yojson traffic_route_to_yojson x.test_traffic_route);
    ]

let target_group_pair_info_list_to_yojson tree =
  list_to_yojson target_group_pair_info_to_yojson tree

let elb_name_to_yojson = string_to_yojson

let elb_info_to_yojson (x : elb_info) =
  assoc_to_yojson [ ("name", option_to_yojson elb_name_to_yojson x.name) ]

let elb_info_list_to_yojson tree = list_to_yojson elb_info_to_yojson tree

let load_balancer_info_to_yojson (x : load_balancer_info) =
  assoc_to_yojson
    [
      ("elbInfoList", option_to_yojson elb_info_list_to_yojson x.elb_info_list);
      ( "targetGroupInfoList",
        option_to_yojson target_group_info_list_to_yojson x.target_group_info_list );
      ( "targetGroupPairInfoList",
        option_to_yojson target_group_pair_info_list_to_yojson x.target_group_pair_info_list );
    ]

let green_fleet_provisioning_action_to_yojson (x : green_fleet_provisioning_action) =
  match x with
  | DISCOVER_EXISTING -> `String "DISCOVER_EXISTING"
  | COPY_AUTO_SCALING_GROUP -> `String "COPY_AUTO_SCALING_GROUP"

let green_fleet_provisioning_option_to_yojson (x : green_fleet_provisioning_option) =
  assoc_to_yojson
    [ ("action", option_to_yojson green_fleet_provisioning_action_to_yojson x.action) ]

let duration_to_yojson = int_to_yojson

let deployment_ready_action_to_yojson (x : deployment_ready_action) =
  match x with
  | CONTINUE_DEPLOYMENT -> `String "CONTINUE_DEPLOYMENT"
  | STOP_DEPLOYMENT -> `String "STOP_DEPLOYMENT"

let deployment_ready_option_to_yojson (x : deployment_ready_option) =
  assoc_to_yojson
    [
      ("actionOnTimeout", option_to_yojson deployment_ready_action_to_yojson x.action_on_timeout);
      ("waitTimeInMinutes", option_to_yojson duration_to_yojson x.wait_time_in_minutes);
    ]

let instance_action_to_yojson (x : instance_action) =
  match x with TERMINATE -> `String "TERMINATE" | KEEP_ALIVE -> `String "KEEP_ALIVE"

let blue_instance_termination_option_to_yojson (x : blue_instance_termination_option) =
  assoc_to_yojson
    [
      ("action", option_to_yojson instance_action_to_yojson x.action);
      ( "terminationWaitTimeInMinutes",
        option_to_yojson duration_to_yojson x.termination_wait_time_in_minutes );
    ]

let blue_green_deployment_configuration_to_yojson (x : blue_green_deployment_configuration) =
  assoc_to_yojson
    [
      ( "terminateBlueInstancesOnDeploymentSuccess",
        option_to_yojson blue_instance_termination_option_to_yojson
          x.terminate_blue_instances_on_deployment_success );
      ( "deploymentReadyOption",
        option_to_yojson deployment_ready_option_to_yojson x.deployment_ready_option );
      ( "greenFleetProvisioningOption",
        option_to_yojson green_fleet_provisioning_option_to_yojson x.green_fleet_provisioning_option
      );
    ]

let outdated_instances_strategy_to_yojson (x : outdated_instances_strategy) =
  match x with Update -> `String "UPDATE" | Ignore -> `String "IGNORE"

let deployment_option_to_yojson (x : deployment_option) =
  match x with
  | WITH_TRAFFIC_CONTROL -> `String "WITH_TRAFFIC_CONTROL"
  | WITHOUT_TRAFFIC_CONTROL -> `String "WITHOUT_TRAFFIC_CONTROL"

let deployment_type_to_yojson (x : deployment_type) =
  match x with IN_PLACE -> `String "IN_PLACE" | BLUE_GREEN -> `String "BLUE_GREEN"

let deployment_style_to_yojson (x : deployment_style) =
  assoc_to_yojson
    [
      ("deploymentType", option_to_yojson deployment_type_to_yojson x.deployment_type);
      ("deploymentOption", option_to_yojson deployment_option_to_yojson x.deployment_option);
    ]

let trigger_event_type_to_yojson (x : trigger_event_type) =
  match x with
  | DEPLOYMENT_START -> `String "DeploymentStart"
  | DEPLOYMENT_SUCCESS -> `String "DeploymentSuccess"
  | DEPLOYMENT_FAILURE -> `String "DeploymentFailure"
  | DEPLOYMENT_STOP -> `String "DeploymentStop"
  | DEPLOYMENT_ROLLBACK -> `String "DeploymentRollback"
  | DEPLOYMENT_READY -> `String "DeploymentReady"
  | INSTANCE_START -> `String "InstanceStart"
  | INSTANCE_SUCCESS -> `String "InstanceSuccess"
  | INSTANCE_FAILURE -> `String "InstanceFailure"
  | INSTANCE_READY -> `String "InstanceReady"

let trigger_event_type_list_to_yojson tree = list_to_yojson trigger_event_type_to_yojson tree
let trigger_target_arn_to_yojson = string_to_yojson
let trigger_name_to_yojson = string_to_yojson

let trigger_config_to_yojson (x : trigger_config) =
  assoc_to_yojson
    [
      ("triggerName", option_to_yojson trigger_name_to_yojson x.trigger_name);
      ("triggerTargetArn", option_to_yojson trigger_target_arn_to_yojson x.trigger_target_arn);
      ("triggerEvents", option_to_yojson trigger_event_type_list_to_yojson x.trigger_events);
    ]

let trigger_config_list_to_yojson tree = list_to_yojson trigger_config_to_yojson tree
let role_to_yojson = string_to_yojson
let deployment_config_name_to_yojson = string_to_yojson
let deployment_group_id_to_yojson = string_to_yojson

let deployment_group_info_to_yojson (x : deployment_group_info) =
  assoc_to_yojson
    [
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ("deploymentGroupId", option_to_yojson deployment_group_id_to_yojson x.deployment_group_id);
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("ec2TagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.ec2_tag_filters);
      ( "onPremisesInstanceTagFilters",
        option_to_yojson tag_filter_list_to_yojson x.on_premises_instance_tag_filters );
      ("autoScalingGroups", option_to_yojson auto_scaling_group_list_to_yojson x.auto_scaling_groups);
      ("serviceRoleArn", option_to_yojson role_to_yojson x.service_role_arn);
      ("targetRevision", option_to_yojson revision_location_to_yojson x.target_revision);
      ( "triggerConfigurations",
        option_to_yojson trigger_config_list_to_yojson x.trigger_configurations );
      ("alarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ( "outdatedInstancesStrategy",
        option_to_yojson outdated_instances_strategy_to_yojson x.outdated_instances_strategy );
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ( "lastSuccessfulDeployment",
        option_to_yojson last_deployment_info_to_yojson x.last_successful_deployment );
      ( "lastAttemptedDeployment",
        option_to_yojson last_deployment_info_to_yojson x.last_attempted_deployment );
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
      ("onPremisesTagSet", option_to_yojson on_premises_tag_set_to_yojson x.on_premises_tag_set);
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ("ecsServices", option_to_yojson ecs_service_list_to_yojson x.ecs_services);
      ("terminationHookEnabled", option_to_yojson boolean__to_yojson x.termination_hook_enabled);
    ]

let deployment_group_info_list_to_yojson tree = list_to_yojson deployment_group_info_to_yojson tree

let batch_get_deployment_groups_output_to_yojson (x : batch_get_deployment_groups_output) =
  assoc_to_yojson
    [
      ( "deploymentGroupsInfo",
        option_to_yojson deployment_group_info_list_to_yojson x.deployment_groups_info );
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let batch_get_deployment_groups_input_to_yojson (x : batch_get_deployment_groups_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("deploymentGroupNames", Some (deployment_groups_list_to_yojson x.deployment_group_names));
    ]

let invalid_deployment_id_exception_to_yojson (x : invalid_deployment_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_compute_platform_exception_to_yojson (x : invalid_compute_platform_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_id_required_exception_to_yojson (x : instance_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_id_required_exception_to_yojson (x : deployment_id_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_does_not_exist_exception_to_yojson (x : deployment_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_type_to_yojson (x : instance_type) =
  match x with BLUE -> `String "Blue" | GREEN -> `String "Green"

let lifecycle_event_status_to_yojson (x : lifecycle_event_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"
  | SKIPPED -> `String "Skipped"
  | UNKNOWN -> `String "Unknown"

let log_tail_to_yojson = string_to_yojson
let lifecycle_message_to_yojson = string_to_yojson
let script_name_to_yojson = string_to_yojson

let lifecycle_error_code_to_yojson (x : lifecycle_error_code) =
  match x with
  | SUCCESS -> `String "Success"
  | SCRIPT_MISSING -> `String "ScriptMissing"
  | SCRIPT_NOT_EXECUTABLE -> `String "ScriptNotExecutable"
  | SCRIPT_TIMED_OUT -> `String "ScriptTimedOut"
  | SCRIPT_FAILED -> `String "ScriptFailed"
  | UNKNOWN_ERROR -> `String "UnknownError"

let diagnostics_to_yojson (x : diagnostics) =
  assoc_to_yojson
    [
      ("errorCode", option_to_yojson lifecycle_error_code_to_yojson x.error_code);
      ("scriptName", option_to_yojson script_name_to_yojson x.script_name);
      ("message", option_to_yojson lifecycle_message_to_yojson x.message);
      ("logTail", option_to_yojson log_tail_to_yojson x.log_tail);
    ]

let lifecycle_event_name_to_yojson = string_to_yojson

let lifecycle_event_to_yojson (x : lifecycle_event) =
  assoc_to_yojson
    [
      ("lifecycleEventName", option_to_yojson lifecycle_event_name_to_yojson x.lifecycle_event_name);
      ("diagnostics", option_to_yojson diagnostics_to_yojson x.diagnostics);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("status", option_to_yojson lifecycle_event_status_to_yojson x.status);
    ]

let lifecycle_event_list_to_yojson tree = list_to_yojson lifecycle_event_to_yojson tree

let instance_status_to_yojson (x : instance_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"
  | SKIPPED -> `String "Skipped"
  | UNKNOWN -> `String "Unknown"
  | READY -> `String "Ready"

let instance_id_to_yojson = string_to_yojson

let instance_summary_to_yojson (x : instance_summary) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("instanceId", option_to_yojson instance_id_to_yojson x.instance_id);
      ("status", option_to_yojson instance_status_to_yojson x.status);
      ("lastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("instanceType", option_to_yojson instance_type_to_yojson x.instance_type);
    ]

let instance_summary_list_to_yojson tree = list_to_yojson instance_summary_to_yojson tree

let batch_get_deployment_instances_output_to_yojson (x : batch_get_deployment_instances_output) =
  assoc_to_yojson
    [
      ("instancesSummary", option_to_yojson instance_summary_list_to_yojson x.instances_summary);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let instances_list_to_yojson tree = list_to_yojson instance_id_to_yojson tree

let batch_get_deployment_instances_input_to_yojson (x : batch_get_deployment_instances_input) =
  assoc_to_yojson
    [
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
      ("instanceIds", Some (instances_list_to_yojson x.instance_ids));
    ]

let invalid_deployment_target_id_exception_to_yojson (x : invalid_deployment_target_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_does_not_exist_exception_to_yojson (x : instance_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_target_list_size_exceeded_exception_to_yojson
    (x : deployment_target_list_size_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_target_id_required_exception_to_yojson (x : deployment_target_id_required_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_target_does_not_exist_exception_to_yojson
    (x : deployment_target_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_not_started_exception_to_yojson (x : deployment_not_started_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let traffic_weight_to_yojson = double_to_yojson
let cloud_formation_resource_type_to_yojson = string_to_yojson

let target_status_to_yojson (x : target_status) =
  match x with
  | PENDING -> `String "Pending"
  | IN_PROGRESS -> `String "InProgress"
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"
  | SKIPPED -> `String "Skipped"
  | UNKNOWN -> `String "Unknown"
  | READY -> `String "Ready"

let time_to_yojson = timestamp_epoch_seconds_to_yojson
let target_id_to_yojson = string_to_yojson

let cloud_formation_target_to_yojson (x : cloud_formation_target) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("resourceType", option_to_yojson cloud_formation_resource_type_to_yojson x.resource_type);
      ("targetVersionWeight", option_to_yojson traffic_weight_to_yojson x.target_version_weight);
    ]

let target_label_to_yojson (x : target_label) =
  match x with BLUE -> `String "Blue" | GREEN -> `String "Green"

let ecs_task_set_status_to_yojson = string_to_yojson
let ecs_task_set_count_to_yojson = long_to_yojson
let ecs_task_set_identifier_to_yojson = string_to_yojson

let ecs_task_set_to_yojson (x : ecs_task_set) =
  assoc_to_yojson
    [
      ("identifer", option_to_yojson ecs_task_set_identifier_to_yojson x.identifer);
      ("desiredCount", option_to_yojson ecs_task_set_count_to_yojson x.desired_count);
      ("pendingCount", option_to_yojson ecs_task_set_count_to_yojson x.pending_count);
      ("runningCount", option_to_yojson ecs_task_set_count_to_yojson x.running_count);
      ("status", option_to_yojson ecs_task_set_status_to_yojson x.status);
      ("trafficWeight", option_to_yojson traffic_weight_to_yojson x.traffic_weight);
      ("targetGroup", option_to_yojson target_group_info_to_yojson x.target_group);
      ("taskSetLabel", option_to_yojson target_label_to_yojson x.task_set_label);
    ]

let ecs_task_set_list_to_yojson tree = list_to_yojson ecs_task_set_to_yojson tree
let target_arn_to_yojson = string_to_yojson

let ecs_target_to_yojson (x : ecs_target) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("taskSetsInfo", option_to_yojson ecs_task_set_list_to_yojson x.task_sets_info);
    ]

let version_to_yojson = string_to_yojson
let lambda_function_alias_to_yojson = string_to_yojson
let lambda_function_name_to_yojson = string_to_yojson

let lambda_function_info_to_yojson (x : lambda_function_info) =
  assoc_to_yojson
    [
      ("functionName", option_to_yojson lambda_function_name_to_yojson x.function_name);
      ("functionAlias", option_to_yojson lambda_function_alias_to_yojson x.function_alias);
      ("currentVersion", option_to_yojson version_to_yojson x.current_version);
      ("targetVersion", option_to_yojson version_to_yojson x.target_version);
      ("targetVersionWeight", option_to_yojson traffic_weight_to_yojson x.target_version_weight);
    ]

let lambda_target_to_yojson (x : lambda_target) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("lambdaFunctionInfo", option_to_yojson lambda_function_info_to_yojson x.lambda_function_info);
    ]

let instance_target_to_yojson (x : instance_target) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("targetId", option_to_yojson target_id_to_yojson x.target_id);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("status", option_to_yojson target_status_to_yojson x.status);
      ("lastUpdatedAt", option_to_yojson time_to_yojson x.last_updated_at);
      ("lifecycleEvents", option_to_yojson lifecycle_event_list_to_yojson x.lifecycle_events);
      ("instanceLabel", option_to_yojson target_label_to_yojson x.instance_label);
    ]

let deployment_target_type_to_yojson (x : deployment_target_type) =
  match x with
  | INSTANCE_TARGET -> `String "InstanceTarget"
  | LAMBDA_TARGET -> `String "LambdaTarget"
  | ECS_TARGET -> `String "ECSTarget"
  | CLOUDFORMATION_TARGET -> `String "CloudFormationTarget"

let deployment_target_to_yojson (x : deployment_target) =
  assoc_to_yojson
    [
      ( "deploymentTargetType",
        option_to_yojson deployment_target_type_to_yojson x.deployment_target_type );
      ("instanceTarget", option_to_yojson instance_target_to_yojson x.instance_target);
      ("lambdaTarget", option_to_yojson lambda_target_to_yojson x.lambda_target);
      ("ecsTarget", option_to_yojson ecs_target_to_yojson x.ecs_target);
      ( "cloudFormationTarget",
        option_to_yojson cloud_formation_target_to_yojson x.cloud_formation_target );
    ]

let deployment_target_list_to_yojson tree = list_to_yojson deployment_target_to_yojson tree

let batch_get_deployment_targets_output_to_yojson (x : batch_get_deployment_targets_output) =
  assoc_to_yojson
    [
      ("deploymentTargets", option_to_yojson deployment_target_list_to_yojson x.deployment_targets);
    ]

let target_id_list_to_yojson tree = list_to_yojson target_id_to_yojson tree

let batch_get_deployment_targets_input_to_yojson (x : batch_get_deployment_targets_input) =
  assoc_to_yojson
    [
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
      ("targetIds", Some (target_id_list_to_yojson x.target_ids));
    ]

let deployments_list_to_yojson tree = list_to_yojson deployment_id_to_yojson tree

let related_deployments_to_yojson (x : related_deployments) =
  assoc_to_yojson
    [
      ( "autoUpdateOutdatedInstancesRootDeploymentId",
        option_to_yojson deployment_id_to_yojson x.auto_update_outdated_instances_root_deployment_id
      );
      ( "autoUpdateOutdatedInstancesDeploymentIds",
        option_to_yojson deployments_list_to_yojson x.auto_update_outdated_instances_deployment_ids
      );
    ]

let external_id_to_yojson = string_to_yojson
let deployment_status_message_list_to_yojson tree = list_to_yojson error_message_to_yojson tree

let file_exists_behavior_to_yojson (x : file_exists_behavior) =
  match x with
  | DISALLOW -> `String "DISALLOW"
  | OVERWRITE -> `String "OVERWRITE"
  | RETAIN -> `String "RETAIN"

let target_instances_to_yojson (x : target_instances) =
  assoc_to_yojson
    [
      ("tagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.tag_filters);
      ( "autoScalingGroups",
        option_to_yojson auto_scaling_group_name_list_to_yojson x.auto_scaling_groups );
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
    ]

let rollback_info_to_yojson (x : rollback_info) =
  assoc_to_yojson
    [
      ("rollbackDeploymentId", option_to_yojson deployment_id_to_yojson x.rollback_deployment_id);
      ( "rollbackTriggeringDeploymentId",
        option_to_yojson deployment_id_to_yojson x.rollback_triggering_deployment_id );
      ("rollbackMessage", option_to_yojson description_to_yojson x.rollback_message);
    ]

let deployment_creator_to_yojson (x : deployment_creator) =
  match x with
  | User -> `String "user"
  | Autoscaling -> `String "autoscaling"
  | CodeDeployRollback -> `String "codeDeployRollback"
  | CodeDeploy -> `String "CodeDeploy"
  | CodeDeployAutoUpdate -> `String "CodeDeployAutoUpdate"
  | CloudFormation -> `String "CloudFormation"
  | CloudFormationRollback -> `String "CloudFormationRollback"
  | AutoscalingTermination -> `String "autoscalingTermination"

let instance_count_to_yojson = long_to_yojson

let deployment_overview_to_yojson (x : deployment_overview) =
  assoc_to_yojson
    [
      ("Pending", option_to_yojson instance_count_to_yojson x.pending);
      ("InProgress", option_to_yojson instance_count_to_yojson x.in_progress);
      ("Succeeded", option_to_yojson instance_count_to_yojson x.succeeded);
      ("Failed", option_to_yojson instance_count_to_yojson x.failed);
      ("Skipped", option_to_yojson instance_count_to_yojson x.skipped);
      ("Ready", option_to_yojson instance_count_to_yojson x.ready);
    ]

let error_code_to_yojson (x : error_code) =
  match x with
  | AGENT_ISSUE -> `String "AGENT_ISSUE"
  | ALARM_ACTIVE -> `String "ALARM_ACTIVE"
  | APPLICATION_MISSING -> `String "APPLICATION_MISSING"
  | AUTOSCALING_VALIDATION_ERROR -> `String "AUTOSCALING_VALIDATION_ERROR"
  | AUTO_SCALING_CONFIGURATION -> `String "AUTO_SCALING_CONFIGURATION"
  | AUTO_SCALING_IAM_ROLE_PERMISSIONS -> `String "AUTO_SCALING_IAM_ROLE_PERMISSIONS"
  | CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND -> `String "CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND"
  | CUSTOMER_APPLICATION_UNHEALTHY -> `String "CUSTOMER_APPLICATION_UNHEALTHY"
  | DEPLOYMENT_GROUP_MISSING -> `String "DEPLOYMENT_GROUP_MISSING"
  | ECS_UPDATE_ERROR -> `String "ECS_UPDATE_ERROR"
  | ELASTIC_LOAD_BALANCING_INVALID -> `String "ELASTIC_LOAD_BALANCING_INVALID"
  | ELB_INVALID_INSTANCE -> `String "ELB_INVALID_INSTANCE"
  | HEALTH_CONSTRAINTS -> `String "HEALTH_CONSTRAINTS"
  | HEALTH_CONSTRAINTS_INVALID -> `String "HEALTH_CONSTRAINTS_INVALID"
  | HOOK_EXECUTION_FAILURE -> `String "HOOK_EXECUTION_FAILURE"
  | IAM_ROLE_MISSING -> `String "IAM_ROLE_MISSING"
  | IAM_ROLE_PERMISSIONS -> `String "IAM_ROLE_PERMISSIONS"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | INVALID_ECS_SERVICE -> `String "INVALID_ECS_SERVICE"
  | INVALID_LAMBDA_CONFIGURATION -> `String "INVALID_LAMBDA_CONFIGURATION"
  | INVALID_LAMBDA_FUNCTION -> `String "INVALID_LAMBDA_FUNCTION"
  | INVALID_REVISION -> `String "INVALID_REVISION"
  | MANUAL_STOP -> `String "MANUAL_STOP"
  | MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION ->
      `String "MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION"
  | MISSING_ELB_INFORMATION -> `String "MISSING_ELB_INFORMATION"
  | MISSING_GITHUB_TOKEN -> `String "MISSING_GITHUB_TOKEN"
  | NO_EC2_SUBSCRIPTION -> `String "NO_EC2_SUBSCRIPTION"
  | NO_INSTANCES -> `String "NO_INSTANCES"
  | OVER_MAX_INSTANCES -> `String "OVER_MAX_INSTANCES"
  | RESOURCE_LIMIT_EXCEEDED -> `String "RESOURCE_LIMIT_EXCEEDED"
  | REVISION_MISSING -> `String "REVISION_MISSING"
  | THROTTLED -> `String "THROTTLED"
  | TIMEOUT -> `String "TIMEOUT"
  | CLOUDFORMATION_STACK_FAILURE -> `String "CLOUDFORMATION_STACK_FAILURE"

let error_information_to_yojson (x : error_information) =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let deployment_info_to_yojson (x : deployment_info) =
  assoc_to_yojson
    [
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("previousRevision", option_to_yojson revision_location_to_yojson x.previous_revision);
      ("revision", option_to_yojson revision_location_to_yojson x.revision);
      ("status", option_to_yojson deployment_status_to_yojson x.status);
      ("errorInformation", option_to_yojson error_information_to_yojson x.error_information);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("completeTime", option_to_yojson timestamp_to_yojson x.complete_time);
      ("deploymentOverview", option_to_yojson deployment_overview_to_yojson x.deployment_overview);
      ("description", option_to_yojson description_to_yojson x.description);
      ("creator", option_to_yojson deployment_creator_to_yojson x.creator);
      ( "ignoreApplicationStopFailures",
        option_to_yojson boolean__to_yojson x.ignore_application_stop_failures );
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ( "updateOutdatedInstancesOnly",
        option_to_yojson boolean__to_yojson x.update_outdated_instances_only );
      ("rollbackInfo", option_to_yojson rollback_info_to_yojson x.rollback_info);
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ("targetInstances", option_to_yojson target_instances_to_yojson x.target_instances);
      ( "instanceTerminationWaitTimeStarted",
        option_to_yojson boolean__to_yojson x.instance_termination_wait_time_started );
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ( "additionalDeploymentStatusInfo",
        option_to_yojson additional_deployment_status_info_to_yojson
          x.additional_deployment_status_info );
      ("fileExistsBehavior", option_to_yojson file_exists_behavior_to_yojson x.file_exists_behavior);
      ( "deploymentStatusMessages",
        option_to_yojson deployment_status_message_list_to_yojson x.deployment_status_messages );
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ("externalId", option_to_yojson external_id_to_yojson x.external_id);
      ("relatedDeployments", option_to_yojson related_deployments_to_yojson x.related_deployments);
      ( "overrideAlarmConfiguration",
        option_to_yojson alarm_configuration_to_yojson x.override_alarm_configuration );
    ]

let deployments_info_list_to_yojson tree = list_to_yojson deployment_info_to_yojson tree

let batch_get_deployments_output_to_yojson (x : batch_get_deployments_output) =
  assoc_to_yojson
    [ ("deploymentsInfo", option_to_yojson deployments_info_list_to_yojson x.deployments_info) ]

let batch_get_deployments_input_to_yojson (x : batch_get_deployments_input) =
  assoc_to_yojson [ ("deploymentIds", Some (deployments_list_to_yojson x.deployment_ids)) ]

let instance_arn_to_yojson = string_to_yojson
let iam_user_arn_to_yojson = string_to_yojson
let iam_session_arn_to_yojson = string_to_yojson

let instance_info_to_yojson (x : instance_info) =
  assoc_to_yojson
    [
      ("instanceName", option_to_yojson instance_name_to_yojson x.instance_name);
      ("iamSessionArn", option_to_yojson iam_session_arn_to_yojson x.iam_session_arn);
      ("iamUserArn", option_to_yojson iam_user_arn_to_yojson x.iam_user_arn);
      ("instanceArn", option_to_yojson instance_arn_to_yojson x.instance_arn);
      ("registerTime", option_to_yojson timestamp_to_yojson x.register_time);
      ("deregisterTime", option_to_yojson timestamp_to_yojson x.deregister_time);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let instance_info_list_to_yojson tree = list_to_yojson instance_info_to_yojson tree

let batch_get_on_premises_instances_output_to_yojson (x : batch_get_on_premises_instances_output) =
  assoc_to_yojson
    [ ("instanceInfos", option_to_yojson instance_info_list_to_yojson x.instance_infos) ]

let batch_get_on_premises_instances_input_to_yojson (x : batch_get_on_premises_instances_input) =
  assoc_to_yojson [ ("instanceNames", Some (instance_name_list_to_yojson x.instance_names)) ]

let bucket_name_filter_required_exception_to_yojson (x : bucket_name_filter_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let trigger_targets_limit_exceeded_exception_to_yojson
    (x : trigger_targets_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_set_list_limit_exceeded_exception_to_yojson (x : tag_set_list_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let lifecycle_hook_limit_exceeded_exception_to_yojson (x : lifecycle_hook_limit_exceeded_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_trigger_config_exception_to_yojson (x : invalid_trigger_config_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_traffic_routing_configuration_exception_to_yojson
    (x : invalid_traffic_routing_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_target_group_pair_exception_to_yojson (x : invalid_target_group_pair_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_role_exception_to_yojson (x : invalid_role_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_on_premises_tag_combination_exception_to_yojson
    (x : invalid_on_premises_tag_combination_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_load_balancer_info_exception_to_yojson (x : invalid_load_balancer_info_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ecs_service_exception_to_yojson (x : invalid_ecs_service_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ec2_tag_exception_to_yojson (x : invalid_ec2_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ec2_tag_combination_exception_to_yojson (x : invalid_ec2_tag_combination_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_style_exception_to_yojson (x : invalid_deployment_style_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_config_name_exception_to_yojson
    (x : invalid_deployment_config_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_blue_green_deployment_configuration_exception_to_yojson
    (x : invalid_blue_green_deployment_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_auto_scaling_group_exception_to_yojson (x : invalid_auto_scaling_group_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_auto_rollback_config_exception_to_yojson (x : invalid_auto_rollback_config_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_alarm_config_exception_to_yojson (x : invalid_alarm_config_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let ecs_service_mapping_limit_exceeded_exception_to_yojson
    (x : ecs_service_mapping_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_does_not_exist_exception_to_yojson
    (x : deployment_group_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_already_exists_exception_to_yojson
    (x : deployment_group_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_deployment_group_output_to_yojson (x : update_deployment_group_output) =
  assoc_to_yojson
    [
      ( "hooksNotCleanedUp",
        option_to_yojson auto_scaling_group_list_to_yojson x.hooks_not_cleaned_up );
    ]

let nullable_boolean_to_yojson = bool_to_yojson

let update_deployment_group_input_to_yojson (x : update_deployment_group_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ( "currentDeploymentGroupName",
        Some (deployment_group_name_to_yojson x.current_deployment_group_name) );
      ( "newDeploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.new_deployment_group_name );
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("ec2TagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.ec2_tag_filters);
      ( "onPremisesInstanceTagFilters",
        option_to_yojson tag_filter_list_to_yojson x.on_premises_instance_tag_filters );
      ( "autoScalingGroups",
        option_to_yojson auto_scaling_group_name_list_to_yojson x.auto_scaling_groups );
      ("serviceRoleArn", option_to_yojson role_to_yojson x.service_role_arn);
      ( "triggerConfigurations",
        option_to_yojson trigger_config_list_to_yojson x.trigger_configurations );
      ("alarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ( "outdatedInstancesStrategy",
        option_to_yojson outdated_instances_strategy_to_yojson x.outdated_instances_strategy );
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
      ("ecsServices", option_to_yojson ecs_service_list_to_yojson x.ecs_services);
      ("onPremisesTagSet", option_to_yojson on_premises_tag_set_to_yojson x.on_premises_tag_set);
      ( "terminationHookEnabled",
        option_to_yojson nullable_boolean_to_yojson x.termination_hook_enabled );
    ]

let update_application_input_to_yojson (x : update_application_input) =
  assoc_to_yojson
    [
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ("newApplicationName", option_to_yojson application_name_to_yojson x.new_application_name);
    ]

let resource_arn_required_exception_to_yojson (x : resource_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_tags_to_add_exception_to_yojson (x : invalid_tags_to_add_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_arn_exception_to_yojson (x : invalid_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let untag_resource_output_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_output_to_yojson = unit_to_yojson

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let unsupported_action_for_deployment_type_exception_to_yojson
    (x : unsupported_action_for_deployment_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_already_completed_exception_to_yojson (x : deployment_already_completed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let stop_status_to_yojson (x : stop_status) =
  match x with PENDING -> `String "Pending" | SUCCEEDED -> `String "Succeeded"

let stop_deployment_output_to_yojson (x : stop_deployment_output) =
  assoc_to_yojson
    [
      ("status", option_to_yojson stop_status_to_yojson x.status);
      ("statusMessage", option_to_yojson message_to_yojson x.status_message);
    ]

let stop_deployment_input_to_yojson (x : stop_deployment_input) =
  assoc_to_yojson
    [
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
      ("autoRollbackEnabled", option_to_yojson nullable_boolean_to_yojson x.auto_rollback_enabled);
    ]

let skip_wait_time_for_instance_termination_input_to_yojson
    (x : skip_wait_time_for_instance_termination_input) =
  assoc_to_yojson [ ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id) ]

let remove_tags_from_on_premises_instances_input_to_yojson
    (x : remove_tags_from_on_premises_instances_input) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("instanceNames", Some (instance_name_list_to_yojson x.instance_names));
    ]

let multiple_iam_arns_provided_exception_to_yojson (x : multiple_iam_arns_provided_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_iam_user_arn_exception_to_yojson (x : invalid_iam_user_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_iam_session_arn_exception_to_yojson (x : invalid_iam_session_arn_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let instance_name_already_registered_exception_to_yojson
    (x : instance_name_already_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_user_arn_required_exception_to_yojson (x : iam_user_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_user_arn_already_registered_exception_to_yojson
    (x : iam_user_arn_already_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_session_arn_already_registered_exception_to_yojson
    (x : iam_session_arn_already_registered_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let iam_arn_required_exception_to_yojson (x : iam_arn_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let register_on_premises_instance_input_to_yojson (x : register_on_premises_instance_input) =
  assoc_to_yojson
    [
      ("instanceName", Some (instance_name_to_yojson x.instance_name));
      ("iamSessionArn", option_to_yojson iam_session_arn_to_yojson x.iam_session_arn);
      ("iamUserArn", option_to_yojson iam_user_arn_to_yojson x.iam_user_arn);
    ]

let description_too_long_exception_to_yojson (x : description_too_long_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let register_application_revision_input_to_yojson (x : register_application_revision_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("revision", Some (revision_location_to_yojson x.revision));
    ]

let lifecycle_event_already_completed_exception_to_yojson
    (x : lifecycle_event_already_completed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_lifecycle_event_hook_execution_status_exception_to_yojson
    (x : invalid_lifecycle_event_hook_execution_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_lifecycle_event_hook_execution_id_exception_to_yojson
    (x : invalid_lifecycle_event_hook_execution_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let lifecycle_event_hook_execution_id_to_yojson = string_to_yojson

let put_lifecycle_event_hook_execution_status_output_to_yojson
    (x : put_lifecycle_event_hook_execution_status_output) =
  assoc_to_yojson
    [
      ( "lifecycleEventHookExecutionId",
        option_to_yojson lifecycle_event_hook_execution_id_to_yojson
          x.lifecycle_event_hook_execution_id );
    ]

let put_lifecycle_event_hook_execution_status_input_to_yojson
    (x : put_lifecycle_event_hook_execution_status_input) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ( "lifecycleEventHookExecutionId",
        option_to_yojson lifecycle_event_hook_execution_id_to_yojson
          x.lifecycle_event_hook_execution_id );
      ("status", option_to_yojson lifecycle_event_status_to_yojson x.status);
    ]

let next_token_to_yojson = string_to_yojson

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invalid_tag_filter_exception_to_yojson (x : invalid_tag_filter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_registration_status_exception_to_yojson (x : invalid_registration_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_on_premises_instances_output_to_yojson (x : list_on_premises_instances_output) =
  assoc_to_yojson
    [
      ("instanceNames", option_to_yojson instance_name_list_to_yojson x.instance_names);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let registration_status_to_yojson (x : registration_status) =
  match x with Registered -> `String "Registered" | Deregistered -> `String "Deregistered"

let list_on_premises_instances_input_to_yojson (x : list_on_premises_instances_input) =
  assoc_to_yojson
    [
      ("registrationStatus", option_to_yojson registration_status_to_yojson x.registration_status);
      ("tagFilters", option_to_yojson tag_filter_list_to_yojson x.tag_filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_validation_exception_to_yojson (x : resource_validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let git_hub_account_token_name_list_to_yojson tree =
  list_to_yojson git_hub_account_token_name_to_yojson tree

let list_git_hub_account_token_names_output_to_yojson (x : list_git_hub_account_token_names_output)
    =
  assoc_to_yojson
    [
      ("tokenNameList", option_to_yojson git_hub_account_token_name_list_to_yojson x.token_name_list);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_git_hub_account_token_names_input_to_yojson (x : list_git_hub_account_token_names_input) =
  assoc_to_yojson [ ("nextToken", option_to_yojson next_token_to_yojson x.next_token) ]

let invalid_target_filter_name_exception_to_yojson (x : invalid_target_filter_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_instance_type_exception_to_yojson (x : invalid_instance_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_instance_status_exception_to_yojson (x : invalid_instance_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_instance_type_exception_to_yojson
    (x : invalid_deployment_instance_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_deployment_targets_output_to_yojson (x : list_deployment_targets_output) =
  assoc_to_yojson
    [
      ("targetIds", option_to_yojson target_id_list_to_yojson x.target_ids);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let target_filter_name_to_yojson (x : target_filter_name) =
  match x with
  | TARGET_STATUS -> `String "TargetStatus"
  | SERVER_INSTANCE_LABEL -> `String "ServerInstanceLabel"

let target_filters_to_yojson tree =
  map_to_yojson target_filter_name_to_yojson filter_value_list_to_yojson tree

let list_deployment_targets_input_to_yojson (x : list_deployment_targets_input) =
  assoc_to_yojson
    [
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("targetFilters", option_to_yojson target_filters_to_yojson x.target_filters);
    ]

let invalid_time_range_exception_to_yojson (x : invalid_time_range_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_external_id_exception_to_yojson (x : invalid_external_id_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployment_status_exception_to_yojson (x : invalid_deployment_status_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_deployments_output_to_yojson (x : list_deployments_output) =
  assoc_to_yojson
    [
      ("deployments", option_to_yojson deployments_list_to_yojson x.deployments);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ("start", option_to_yojson timestamp_to_yojson x.start);
      ("end", option_to_yojson timestamp_to_yojson x.end_);
    ]

let deployment_status_list_to_yojson tree = list_to_yojson deployment_status_to_yojson tree

let list_deployments_input_to_yojson (x : list_deployments_input) =
  assoc_to_yojson
    [
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ("externalId", option_to_yojson external_id_to_yojson x.external_id);
      ( "includeOnlyStatuses",
        option_to_yojson deployment_status_list_to_yojson x.include_only_statuses );
      ("createTimeRange", option_to_yojson time_range_to_yojson x.create_time_range);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_deployment_instances_output_to_yojson (x : list_deployment_instances_output) =
  assoc_to_yojson
    [
      ("instancesList", option_to_yojson instances_list_to_yojson x.instances_list);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let instance_type_list_to_yojson tree = list_to_yojson instance_type_to_yojson tree
let instance_status_list_to_yojson tree = list_to_yojson instance_status_to_yojson tree

let list_deployment_instances_input_to_yojson (x : list_deployment_instances_input) =
  assoc_to_yojson
    [
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "instanceStatusFilter",
        option_to_yojson instance_status_list_to_yojson x.instance_status_filter );
      ("instanceTypeFilter", option_to_yojson instance_type_list_to_yojson x.instance_type_filter);
    ]

let list_deployment_groups_output_to_yojson (x : list_deployment_groups_output) =
  assoc_to_yojson
    [
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ("deploymentGroups", option_to_yojson deployment_groups_list_to_yojson x.deployment_groups);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_deployment_groups_input_to_yojson (x : list_deployment_groups_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let deployment_configs_list_to_yojson tree = list_to_yojson deployment_config_name_to_yojson tree

let list_deployment_configs_output_to_yojson (x : list_deployment_configs_output) =
  assoc_to_yojson
    [
      ( "deploymentConfigsList",
        option_to_yojson deployment_configs_list_to_yojson x.deployment_configs_list );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_deployment_configs_input_to_yojson (x : list_deployment_configs_input) =
  assoc_to_yojson [ ("nextToken", option_to_yojson next_token_to_yojson x.next_token) ]

let list_applications_output_to_yojson (x : list_applications_output) =
  assoc_to_yojson
    [
      ("applications", option_to_yojson applications_list_to_yojson x.applications);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_applications_input_to_yojson (x : list_applications_input) =
  assoc_to_yojson [ ("nextToken", option_to_yojson next_token_to_yojson x.next_token) ]

let invalid_sort_order_exception_to_yojson (x : invalid_sort_order_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_sort_by_exception_to_yojson (x : invalid_sort_by_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_key_prefix_filter_exception_to_yojson (x : invalid_key_prefix_filter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_deployed_state_filter_exception_to_yojson (x : invalid_deployed_state_filter_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_bucket_name_filter_exception_to_yojson (x : invalid_bucket_name_filter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let list_application_revisions_output_to_yojson (x : list_application_revisions_output) =
  assoc_to_yojson
    [
      ("revisions", option_to_yojson revision_location_list_to_yojson x.revisions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_state_filter_action_to_yojson (x : list_state_filter_action) =
  match x with
  | Include -> `String "include"
  | Exclude -> `String "exclude"
  | Ignore -> `String "ignore"

let sort_order_to_yojson (x : sort_order) =
  match x with Ascending -> `String "ascending" | Descending -> `String "descending"

let list_application_revisions_input_to_yojson (x : list_application_revisions_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("sortBy", option_to_yojson application_revision_sort_by_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("s3Bucket", option_to_yojson s3_bucket_to_yojson x.s3_bucket);
      ("s3KeyPrefix", option_to_yojson s3_key_to_yojson x.s3_key_prefix);
      ("deployed", option_to_yojson list_state_filter_action_to_yojson x.deployed);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_on_premises_instance_output_to_yojson (x : get_on_premises_instance_output) =
  assoc_to_yojson [ ("instanceInfo", option_to_yojson instance_info_to_yojson x.instance_info) ]

let get_on_premises_instance_input_to_yojson (x : get_on_premises_instance_input) =
  assoc_to_yojson [ ("instanceName", Some (instance_name_to_yojson x.instance_name)) ]

let get_deployment_target_output_to_yojson (x : get_deployment_target_output) =
  assoc_to_yojson
    [ ("deploymentTarget", option_to_yojson deployment_target_to_yojson x.deployment_target) ]

let get_deployment_target_input_to_yojson (x : get_deployment_target_input) =
  assoc_to_yojson
    [
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
      ("targetId", Some (target_id_to_yojson x.target_id));
    ]

let get_deployment_instance_output_to_yojson (x : get_deployment_instance_output) =
  assoc_to_yojson
    [ ("instanceSummary", option_to_yojson instance_summary_to_yojson x.instance_summary) ]

let get_deployment_instance_input_to_yojson (x : get_deployment_instance_input) =
  assoc_to_yojson
    [
      ("deploymentId", Some (deployment_id_to_yojson x.deployment_id));
      ("instanceId", Some (instance_id_to_yojson x.instance_id));
    ]

let get_deployment_group_output_to_yojson (x : get_deployment_group_output) =
  assoc_to_yojson
    [
      ( "deploymentGroupInfo",
        option_to_yojson deployment_group_info_to_yojson x.deployment_group_info );
    ]

let get_deployment_group_input_to_yojson (x : get_deployment_group_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("deploymentGroupName", Some (deployment_group_name_to_yojson x.deployment_group_name));
    ]

let deployment_config_name_required_exception_to_yojson
    (x : deployment_config_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let minimum_healthy_hosts_per_zone_value_to_yojson = int_to_yojson

let minimum_healthy_hosts_per_zone_type_to_yojson (x : minimum_healthy_hosts_per_zone_type) =
  match x with HOST_COUNT -> `String "HOST_COUNT" | FLEET_PERCENT -> `String "FLEET_PERCENT"

let minimum_healthy_hosts_per_zone_to_yojson (x : minimum_healthy_hosts_per_zone) =
  assoc_to_yojson
    [
      ("type", option_to_yojson minimum_healthy_hosts_per_zone_type_to_yojson x.type_);
      ("value", option_to_yojson minimum_healthy_hosts_per_zone_value_to_yojson x.value);
    ]

let wait_time_in_seconds_to_yojson = long_to_yojson

let zonal_config_to_yojson (x : zonal_config) =
  assoc_to_yojson
    [
      ( "firstZoneMonitorDurationInSeconds",
        option_to_yojson wait_time_in_seconds_to_yojson x.first_zone_monitor_duration_in_seconds );
      ( "monitorDurationInSeconds",
        option_to_yojson wait_time_in_seconds_to_yojson x.monitor_duration_in_seconds );
      ( "minimumHealthyHostsPerZone",
        option_to_yojson minimum_healthy_hosts_per_zone_to_yojson x.minimum_healthy_hosts_per_zone
      );
    ]

let wait_time_in_mins_to_yojson = int_to_yojson
let percentage_to_yojson = int_to_yojson

let time_based_linear_to_yojson (x : time_based_linear) =
  assoc_to_yojson
    [
      ("linearPercentage", option_to_yojson percentage_to_yojson x.linear_percentage);
      ("linearInterval", option_to_yojson wait_time_in_mins_to_yojson x.linear_interval);
    ]

let time_based_canary_to_yojson (x : time_based_canary) =
  assoc_to_yojson
    [
      ("canaryPercentage", option_to_yojson percentage_to_yojson x.canary_percentage);
      ("canaryInterval", option_to_yojson wait_time_in_mins_to_yojson x.canary_interval);
    ]

let traffic_routing_type_to_yojson (x : traffic_routing_type) =
  match x with
  | TimeBasedCanary -> `String "TimeBasedCanary"
  | TimeBasedLinear -> `String "TimeBasedLinear"
  | AllAtOnce -> `String "AllAtOnce"

let traffic_routing_config_to_yojson (x : traffic_routing_config) =
  assoc_to_yojson
    [
      ("type", option_to_yojson traffic_routing_type_to_yojson x.type_);
      ("timeBasedCanary", option_to_yojson time_based_canary_to_yojson x.time_based_canary);
      ("timeBasedLinear", option_to_yojson time_based_linear_to_yojson x.time_based_linear);
    ]

let minimum_healthy_hosts_value_to_yojson = int_to_yojson

let minimum_healthy_hosts_type_to_yojson (x : minimum_healthy_hosts_type) =
  match x with HOST_COUNT -> `String "HOST_COUNT" | FLEET_PERCENT -> `String "FLEET_PERCENT"

let minimum_healthy_hosts_to_yojson (x : minimum_healthy_hosts) =
  assoc_to_yojson
    [
      ("type", option_to_yojson minimum_healthy_hosts_type_to_yojson x.type_);
      ("value", option_to_yojson minimum_healthy_hosts_value_to_yojson x.value);
    ]

let deployment_config_id_to_yojson = string_to_yojson

let deployment_config_info_to_yojson (x : deployment_config_info) =
  assoc_to_yojson
    [
      ("deploymentConfigId", option_to_yojson deployment_config_id_to_yojson x.deployment_config_id);
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ( "minimumHealthyHosts",
        option_to_yojson minimum_healthy_hosts_to_yojson x.minimum_healthy_hosts );
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ( "trafficRoutingConfig",
        option_to_yojson traffic_routing_config_to_yojson x.traffic_routing_config );
      ("zonalConfig", option_to_yojson zonal_config_to_yojson x.zonal_config);
    ]

let get_deployment_config_output_to_yojson (x : get_deployment_config_output) =
  assoc_to_yojson
    [
      ( "deploymentConfigInfo",
        option_to_yojson deployment_config_info_to_yojson x.deployment_config_info );
    ]

let get_deployment_config_input_to_yojson (x : get_deployment_config_input) =
  assoc_to_yojson
    [ ("deploymentConfigName", Some (deployment_config_name_to_yojson x.deployment_config_name)) ]

let get_deployment_output_to_yojson (x : get_deployment_output) =
  assoc_to_yojson
    [ ("deploymentInfo", option_to_yojson deployment_info_to_yojson x.deployment_info) ]

let get_deployment_input_to_yojson (x : get_deployment_input) =
  assoc_to_yojson [ ("deploymentId", Some (deployment_id_to_yojson x.deployment_id)) ]

let revision_does_not_exist_exception_to_yojson (x : revision_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_application_revision_output_to_yojson (x : get_application_revision_output) =
  assoc_to_yojson
    [
      ("applicationName", option_to_yojson application_name_to_yojson x.application_name);
      ("revision", option_to_yojson revision_location_to_yojson x.revision);
      ("revisionInfo", option_to_yojson generic_revision_info_to_yojson x.revision_info);
    ]

let get_application_revision_input_to_yojson (x : get_application_revision_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("revision", Some (revision_location_to_yojson x.revision));
    ]

let get_application_output_to_yojson (x : get_application_output) =
  assoc_to_yojson [ ("application", option_to_yojson application_info_to_yojson x.application) ]

let get_application_input_to_yojson (x : get_application_input) =
  assoc_to_yojson [ ("applicationName", Some (application_name_to_yojson x.application_name)) ]

let deregister_on_premises_instance_input_to_yojson (x : deregister_on_premises_instance_input) =
  assoc_to_yojson [ ("instanceName", Some (instance_name_to_yojson x.instance_name)) ]

let delete_resources_by_external_id_output_to_yojson = unit_to_yojson

let delete_resources_by_external_id_input_to_yojson (x : delete_resources_by_external_id_input) =
  assoc_to_yojson [ ("externalId", option_to_yojson external_id_to_yojson x.external_id) ]

let invalid_git_hub_account_token_name_exception_to_yojson
    (x : invalid_git_hub_account_token_name_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let git_hub_account_token_name_required_exception_to_yojson
    (x : git_hub_account_token_name_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let git_hub_account_token_does_not_exist_exception_to_yojson
    (x : git_hub_account_token_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let delete_git_hub_account_token_output_to_yojson (x : delete_git_hub_account_token_output) =
  assoc_to_yojson
    [ ("tokenName", option_to_yojson git_hub_account_token_name_to_yojson x.token_name) ]

let delete_git_hub_account_token_input_to_yojson (x : delete_git_hub_account_token_input) =
  assoc_to_yojson
    [ ("tokenName", option_to_yojson git_hub_account_token_name_to_yojson x.token_name) ]

let delete_deployment_group_output_to_yojson (x : delete_deployment_group_output) =
  assoc_to_yojson
    [
      ( "hooksNotCleanedUp",
        option_to_yojson auto_scaling_group_list_to_yojson x.hooks_not_cleaned_up );
    ]

let delete_deployment_group_input_to_yojson (x : delete_deployment_group_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("deploymentGroupName", Some (deployment_group_name_to_yojson x.deployment_group_name));
    ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_config_in_use_exception_to_yojson (x : deployment_config_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let delete_deployment_config_input_to_yojson (x : delete_deployment_config_input) =
  assoc_to_yojson
    [ ("deploymentConfigName", Some (deployment_config_name_to_yojson x.deployment_config_name)) ]

let delete_application_input_to_yojson (x : delete_application_input) =
  assoc_to_yojson [ ("applicationName", Some (application_name_to_yojson x.application_name)) ]

let role_required_exception_to_yojson (x : role_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_group_limit_exceeded_exception_to_yojson
    (x : deployment_group_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_deployment_group_output_to_yojson (x : create_deployment_group_output) =
  assoc_to_yojson
    [ ("deploymentGroupId", option_to_yojson deployment_group_id_to_yojson x.deployment_group_id) ]

let create_deployment_group_input_to_yojson (x : create_deployment_group_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("deploymentGroupName", Some (deployment_group_name_to_yojson x.deployment_group_name));
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("ec2TagFilters", option_to_yojson ec2_tag_filter_list_to_yojson x.ec2_tag_filters);
      ( "onPremisesInstanceTagFilters",
        option_to_yojson tag_filter_list_to_yojson x.on_premises_instance_tag_filters );
      ( "autoScalingGroups",
        option_to_yojson auto_scaling_group_name_list_to_yojson x.auto_scaling_groups );
      ("serviceRoleArn", Some (role_to_yojson x.service_role_arn));
      ( "triggerConfigurations",
        option_to_yojson trigger_config_list_to_yojson x.trigger_configurations );
      ("alarmConfiguration", option_to_yojson alarm_configuration_to_yojson x.alarm_configuration);
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ( "outdatedInstancesStrategy",
        option_to_yojson outdated_instances_strategy_to_yojson x.outdated_instances_strategy );
      ("deploymentStyle", option_to_yojson deployment_style_to_yojson x.deployment_style);
      ( "blueGreenDeploymentConfiguration",
        option_to_yojson blue_green_deployment_configuration_to_yojson
          x.blue_green_deployment_configuration );
      ("loadBalancerInfo", option_to_yojson load_balancer_info_to_yojson x.load_balancer_info);
      ("ec2TagSet", option_to_yojson ec2_tag_set_to_yojson x.ec2_tag_set);
      ("ecsServices", option_to_yojson ecs_service_list_to_yojson x.ecs_services);
      ("onPremisesTagSet", option_to_yojson on_premises_tag_set_to_yojson x.on_premises_tag_set);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "terminationHookEnabled",
        option_to_yojson nullable_boolean_to_yojson x.termination_hook_enabled );
    ]

let invalid_zonal_deployment_configuration_exception_to_yojson
    (x : invalid_zonal_deployment_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_minimum_healthy_host_value_exception_to_yojson
    (x : invalid_minimum_healthy_host_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_config_limit_exceeded_exception_to_yojson
    (x : deployment_config_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_config_already_exists_exception_to_yojson
    (x : deployment_config_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_deployment_config_output_to_yojson (x : create_deployment_config_output) =
  assoc_to_yojson
    [
      ("deploymentConfigId", option_to_yojson deployment_config_id_to_yojson x.deployment_config_id);
    ]

let create_deployment_config_input_to_yojson (x : create_deployment_config_input) =
  assoc_to_yojson
    [
      ("deploymentConfigName", Some (deployment_config_name_to_yojson x.deployment_config_name));
      ( "minimumHealthyHosts",
        option_to_yojson minimum_healthy_hosts_to_yojson x.minimum_healthy_hosts );
      ( "trafficRoutingConfig",
        option_to_yojson traffic_routing_config_to_yojson x.traffic_routing_config );
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ("zonalConfig", option_to_yojson zonal_config_to_yojson x.zonal_config);
    ]

let invalid_update_outdated_instances_only_value_exception_to_yojson
    (x : invalid_update_outdated_instances_only_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_target_instances_exception_to_yojson (x : invalid_target_instances_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_ignore_application_stop_failures_value_exception_to_yojson
    (x : invalid_ignore_application_stop_failures_value_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_git_hub_account_token_exception_to_yojson (x : invalid_git_hub_account_token_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_file_exists_behavior_exception_to_yojson (x : invalid_file_exists_behavior_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_limit_exceeded_exception_to_yojson (x : deployment_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_deployment_output_to_yojson (x : create_deployment_output) =
  assoc_to_yojson [ ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id) ]

let create_deployment_input_to_yojson (x : create_deployment_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ( "deploymentGroupName",
        option_to_yojson deployment_group_name_to_yojson x.deployment_group_name );
      ("revision", option_to_yojson revision_location_to_yojson x.revision);
      ( "deploymentConfigName",
        option_to_yojson deployment_config_name_to_yojson x.deployment_config_name );
      ("description", option_to_yojson description_to_yojson x.description);
      ( "ignoreApplicationStopFailures",
        option_to_yojson boolean__to_yojson x.ignore_application_stop_failures );
      ("targetInstances", option_to_yojson target_instances_to_yojson x.target_instances);
      ( "autoRollbackConfiguration",
        option_to_yojson auto_rollback_configuration_to_yojson x.auto_rollback_configuration );
      ( "updateOutdatedInstancesOnly",
        option_to_yojson boolean__to_yojson x.update_outdated_instances_only );
      ("fileExistsBehavior", option_to_yojson file_exists_behavior_to_yojson x.file_exists_behavior);
      ( "overrideAlarmConfiguration",
        option_to_yojson alarm_configuration_to_yojson x.override_alarm_configuration );
    ]

let create_application_output_to_yojson (x : create_application_output) =
  assoc_to_yojson [ ("applicationId", option_to_yojson application_id_to_yojson x.application_id) ]

let create_application_input_to_yojson (x : create_application_input) =
  assoc_to_yojson
    [
      ("applicationName", Some (application_name_to_yojson x.application_name));
      ("computePlatform", option_to_yojson compute_platform_to_yojson x.compute_platform);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let invalid_deployment_wait_type_exception_to_yojson (x : invalid_deployment_wait_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_is_not_in_ready_state_exception_to_yojson
    (x : deployment_is_not_in_ready_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let deployment_wait_type_to_yojson (x : deployment_wait_type) =
  match x with READY_WAIT -> `String "READY_WAIT" | TERMINATION_WAIT -> `String "TERMINATION_WAIT"

let continue_deployment_input_to_yojson (x : continue_deployment_input) =
  assoc_to_yojson
    [
      ("deploymentId", option_to_yojson deployment_id_to_yojson x.deployment_id);
      ("deploymentWaitType", option_to_yojson deployment_wait_type_to_yojson x.deployment_wait_type);
    ]
