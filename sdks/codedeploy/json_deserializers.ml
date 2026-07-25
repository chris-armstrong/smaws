open Smaws_Lib.Json.DeserializeHelpers
open Types

let message_of_yojson = string_of_yojson

let tag_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tag_required_exception)

let tag_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tag_limit_exceeded_exception)

let invalid_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_tag_exception)

let invalid_instance_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_instance_name_exception)

let instance_not_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : instance_not_registered_exception)

let instance_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : instance_name_required_exception)

let instance_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : instance_limit_exceeded_exception)

let instance_name_of_yojson = string_of_yojson
let instance_name_list_of_yojson tree path = list_of_yojson instance_name_of_yojson tree path
let value_of_yojson = string_of_yojson
let key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let add_tags_to_on_premises_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     instance_names = value_for_key instance_name_list_of_yojson "instanceNames" _list path;
   }
    : add_tags_to_on_premises_instances_input)

let additional_deployment_status_info_of_yojson = string_of_yojson
let alarm_name_of_yojson = string_of_yojson

let alarm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key alarm_name_of_yojson "name") _list path } : alarm)

let alarm_list_of_yojson tree path = list_of_yojson alarm_of_yojson tree path
let boolean__of_yojson = bool_of_yojson

let alarm_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key boolean__of_yojson "enabled") _list path;
     ignore_poll_alarm_failure =
       option_of_yojson (value_for_key boolean__of_yojson "ignorePollAlarmFailure") _list path;
     alarms = option_of_yojson (value_for_key alarm_list_of_yojson "alarms") _list path;
   }
    : alarm_configuration)

let alarms_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : alarms_limit_exceeded_exception)

let raw_string_sha256_of_yojson = string_of_yojson
let raw_string_content_of_yojson = string_of_yojson

let app_spec_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = option_of_yojson (value_for_key raw_string_content_of_yojson "content") _list path;
     sha256 = option_of_yojson (value_for_key raw_string_sha256_of_yojson "sha256") _list path;
   }
    : app_spec_content)

let application_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : application_already_exists_exception)

let application_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : application_does_not_exist_exception)

let application_id_of_yojson = string_of_yojson

let compute_platform_of_yojson (tree : t) path =
  ((match tree with
    | `String "Server" -> SERVER
    | `String "Lambda" -> LAMBDA
    | `String "ECS" -> ECS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputePlatform" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputePlatform")
     : compute_platform)
    : compute_platform)

let git_hub_account_token_name_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let application_name_of_yojson = string_of_yojson

let application_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_id =
       option_of_yojson (value_for_key application_id_of_yojson "applicationId") _list path;
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "createTime") _list path;
     linked_to_git_hub =
       option_of_yojson (value_for_key boolean__of_yojson "linkedToGitHub") _list path;
     git_hub_account_name =
       option_of_yojson
         (value_for_key git_hub_account_token_name_of_yojson "gitHubAccountName")
         _list path;
     compute_platform =
       option_of_yojson (value_for_key compute_platform_of_yojson "computePlatform") _list path;
   }
    : application_info)

let application_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : application_limit_exceeded_exception)

let application_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : application_name_required_exception)

let application_revision_sort_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "registerTime" -> RegisterTime
    | `String "firstUsedTime" -> FirstUsedTime
    | `String "lastUsedTime" -> LastUsedTime
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ApplicationRevisionSortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationRevisionSortBy")
     : application_revision_sort_by)
    : application_revision_sort_by)

let applications_info_list_of_yojson tree path = list_of_yojson application_info_of_yojson tree path
let applications_list_of_yojson tree path = list_of_yojson application_name_of_yojson tree path
let arn_of_yojson = string_of_yojson

let arn_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : arn_not_supported_exception)

let auto_rollback_event_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEPLOYMENT_FAILURE" -> DEPLOYMENT_FAILURE
    | `String "DEPLOYMENT_STOP_ON_ALARM" -> DEPLOYMENT_STOP_ON_ALARM
    | `String "DEPLOYMENT_STOP_ON_REQUEST" -> DEPLOYMENT_STOP_ON_REQUEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoRollbackEvent" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoRollbackEvent")
     : auto_rollback_event)
    : auto_rollback_event)

let auto_rollback_events_list_of_yojson tree path =
  list_of_yojson auto_rollback_event_of_yojson tree path

let auto_rollback_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = option_of_yojson (value_for_key boolean__of_yojson "enabled") _list path;
     events =
       option_of_yojson (value_for_key auto_rollback_events_list_of_yojson "events") _list path;
   }
    : auto_rollback_configuration)

let auto_scaling_group_hook_of_yojson = string_of_yojson
let auto_scaling_group_name_of_yojson = string_of_yojson

let auto_scaling_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key auto_scaling_group_name_of_yojson "name") _list path;
     hook = option_of_yojson (value_for_key auto_scaling_group_hook_of_yojson "hook") _list path;
     termination_hook =
       option_of_yojson
         (value_for_key auto_scaling_group_hook_of_yojson "terminationHook")
         _list path;
   }
    : auto_scaling_group)

let auto_scaling_group_list_of_yojson tree path =
  list_of_yojson auto_scaling_group_of_yojson tree path

let auto_scaling_group_name_list_of_yojson tree path =
  list_of_yojson auto_scaling_group_name_of_yojson tree path

let revision_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : revision_required_exception)

let invalid_revision_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_revision_exception)

let invalid_application_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_application_name_exception)

let batch_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : batch_limit_exceeded_exception)

let deployment_group_name_of_yojson = string_of_yojson

let deployment_groups_list_of_yojson tree path =
  list_of_yojson deployment_group_name_of_yojson tree path

let description_of_yojson = string_of_yojson

let generic_revision_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     deployment_groups =
       option_of_yojson
         (value_for_key deployment_groups_list_of_yojson "deploymentGroups")
         _list path;
     first_used_time =
       option_of_yojson (value_for_key timestamp_of_yojson "firstUsedTime") _list path;
     last_used_time = option_of_yojson (value_for_key timestamp_of_yojson "lastUsedTime") _list path;
     register_time = option_of_yojson (value_for_key timestamp_of_yojson "registerTime") _list path;
   }
    : generic_revision_info)

let raw_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = option_of_yojson (value_for_key raw_string_content_of_yojson "content") _list path;
     sha256 = option_of_yojson (value_for_key raw_string_sha256_of_yojson "sha256") _list path;
   }
    : raw_string)

let commit_id_of_yojson = string_of_yojson
let repository_of_yojson = string_of_yojson

let git_hub_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     repository = option_of_yojson (value_for_key repository_of_yojson "repository") _list path;
     commit_id = option_of_yojson (value_for_key commit_id_of_yojson "commitId") _list path;
   }
    : git_hub_location)

let e_tag_of_yojson = string_of_yojson
let version_id_of_yojson = string_of_yojson

let bundle_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "tar" -> Tar
    | `String "tgz" -> TarGZip
    | `String "zip" -> Zip
    | `String "YAML" -> YAML
    | `String "JSON" -> JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "BundleType" value)
    | _ -> raise (deserialize_wrong_type_error path "BundleType")
     : bundle_type)
    : bundle_type)

let s3_key_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let s3_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "bucket") _list path;
     key = option_of_yojson (value_for_key s3_key_of_yojson "key") _list path;
     bundle_type = option_of_yojson (value_for_key bundle_type_of_yojson "bundleType") _list path;
     version = option_of_yojson (value_for_key version_id_of_yojson "version") _list path;
     e_tag = option_of_yojson (value_for_key e_tag_of_yojson "eTag") _list path;
   }
    : s3_location)

let revision_location_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "S3" -> S3
    | `String "GitHub" -> GitHub
    | `String "String" -> String
    | `String "AppSpecContent" -> AppSpecContent
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RevisionLocationType" value)
    | _ -> raise (deserialize_wrong_type_error path "RevisionLocationType")
     : revision_location_type)
    : revision_location_type)

let revision_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_type =
       option_of_yojson (value_for_key revision_location_type_of_yojson "revisionType") _list path;
     s3_location = option_of_yojson (value_for_key s3_location_of_yojson "s3Location") _list path;
     git_hub_location =
       option_of_yojson (value_for_key git_hub_location_of_yojson "gitHubLocation") _list path;
     string_ = option_of_yojson (value_for_key raw_string_of_yojson "string") _list path;
     app_spec_content =
       option_of_yojson (value_for_key app_spec_content_of_yojson "appSpecContent") _list path;
   }
    : revision_location)

let revision_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_location =
       option_of_yojson (value_for_key revision_location_of_yojson "revisionLocation") _list path;
     generic_revision_info =
       option_of_yojson
         (value_for_key generic_revision_info_of_yojson "genericRevisionInfo")
         _list path;
   }
    : revision_info)

let revision_info_list_of_yojson tree path = list_of_yojson revision_info_of_yojson tree path
let error_message_of_yojson = string_of_yojson

let batch_get_application_revisions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     revisions =
       option_of_yojson (value_for_key revision_info_list_of_yojson "revisions") _list path;
   }
    : batch_get_application_revisions_output)

let revision_location_list_of_yojson tree path =
  list_of_yojson revision_location_of_yojson tree path

let batch_get_application_revisions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     revisions = value_for_key revision_location_list_of_yojson "revisions" _list path;
   }
    : batch_get_application_revisions_input)

let batch_get_applications_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     applications_info =
       option_of_yojson
         (value_for_key applications_info_list_of_yojson "applicationsInfo")
         _list path;
   }
    : batch_get_applications_output)

let batch_get_applications_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_names = value_for_key applications_list_of_yojson "applicationNames" _list path }
    : batch_get_applications_input)

let invalid_deployment_group_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_group_name_exception)

let deployment_group_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_group_name_required_exception)

let deployment_config_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_config_does_not_exist_exception)

let ecs_cluster_name_of_yojson = string_of_yojson
let ecs_service_name_of_yojson = string_of_yojson

let ecs_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name =
       option_of_yojson (value_for_key ecs_service_name_of_yojson "serviceName") _list path;
     cluster_name =
       option_of_yojson (value_for_key ecs_cluster_name_of_yojson "clusterName") _list path;
   }
    : ecs_service)

let ecs_service_list_of_yojson tree path = list_of_yojson ecs_service_of_yojson tree path

let tag_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEY_ONLY" -> KEY_ONLY
    | `String "VALUE_ONLY" -> VALUE_ONLY
    | `String "KEY_AND_VALUE" -> KEY_AND_VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TagFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "TagFilterType")
     : tag_filter_type)
    : tag_filter_type)

let tag_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key tag_filter_type_of_yojson "Type") _list path;
   }
    : tag_filter)

let tag_filter_list_of_yojson tree path = list_of_yojson tag_filter_of_yojson tree path

let on_premises_tag_set_list_of_yojson tree path =
  list_of_yojson tag_filter_list_of_yojson tree path

let on_premises_tag_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_premises_tag_set_list =
       option_of_yojson
         (value_for_key on_premises_tag_set_list_of_yojson "onPremisesTagSetList")
         _list path;
   }
    : on_premises_tag_set)

let ec2_tag_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEY_ONLY" -> KEY_ONLY
    | `String "VALUE_ONLY" -> VALUE_ONLY
    | `String "KEY_AND_VALUE" -> KEY_AND_VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EC2TagFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "EC2TagFilterType")
     : ec2_tag_filter_type)
    : ec2_tag_filter_type)

let ec2_tag_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key ec2_tag_filter_type_of_yojson "Type") _list path;
   }
    : ec2_tag_filter)

let ec2_tag_filter_list_of_yojson tree path = list_of_yojson ec2_tag_filter_of_yojson tree path
let ec2_tag_set_list_of_yojson tree path = list_of_yojson ec2_tag_filter_list_of_yojson tree path

let ec2_tag_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_tag_set_list =
       option_of_yojson (value_for_key ec2_tag_set_list_of_yojson "ec2TagSetList") _list path;
   }
    : ec2_tag_set)

let deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Created" -> CREATED
    | `String "Queued" -> QUEUED
    | `String "InProgress" -> IN_PROGRESS
    | `String "Baking" -> BAKING
    | `String "Succeeded" -> SUCCEEDED
    | `String "Failed" -> FAILED
    | `String "Stopped" -> STOPPED
    | `String "Ready" -> READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentStatus")
     : deployment_status)
    : deployment_status)

let deployment_id_of_yojson = string_of_yojson

let last_deployment_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     status = option_of_yojson (value_for_key deployment_status_of_yojson "status") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "createTime") _list path;
   }
    : last_deployment_info)

let listener_arn_of_yojson = string_of_yojson
let listener_arn_list_of_yojson tree path = list_of_yojson listener_arn_of_yojson tree path

let traffic_route_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     listener_arns =
       option_of_yojson (value_for_key listener_arn_list_of_yojson "listenerArns") _list path;
   }
    : traffic_route)

let target_group_name_of_yojson = string_of_yojson

let target_group_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key target_group_name_of_yojson "name") _list path }
    : target_group_info)

let target_group_info_list_of_yojson tree path =
  list_of_yojson target_group_info_of_yojson tree path

let target_group_pair_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_groups =
       option_of_yojson (value_for_key target_group_info_list_of_yojson "targetGroups") _list path;
     prod_traffic_route =
       option_of_yojson (value_for_key traffic_route_of_yojson "prodTrafficRoute") _list path;
     test_traffic_route =
       option_of_yojson (value_for_key traffic_route_of_yojson "testTrafficRoute") _list path;
   }
    : target_group_pair_info)

let target_group_pair_info_list_of_yojson tree path =
  list_of_yojson target_group_pair_info_of_yojson tree path

let elb_name_of_yojson = string_of_yojson

let elb_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = option_of_yojson (value_for_key elb_name_of_yojson "name") _list path } : elb_info)

let elb_info_list_of_yojson tree path = list_of_yojson elb_info_of_yojson tree path

let load_balancer_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     elb_info_list =
       option_of_yojson (value_for_key elb_info_list_of_yojson "elbInfoList") _list path;
     target_group_info_list =
       option_of_yojson
         (value_for_key target_group_info_list_of_yojson "targetGroupInfoList")
         _list path;
     target_group_pair_info_list =
       option_of_yojson
         (value_for_key target_group_pair_info_list_of_yojson "targetGroupPairInfoList")
         _list path;
   }
    : load_balancer_info)

let green_fleet_provisioning_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISCOVER_EXISTING" -> DISCOVER_EXISTING
    | `String "COPY_AUTO_SCALING_GROUP" -> COPY_AUTO_SCALING_GROUP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GreenFleetProvisioningAction" value)
    | _ -> raise (deserialize_wrong_type_error path "GreenFleetProvisioningAction")
     : green_fleet_provisioning_action)
    : green_fleet_provisioning_action)

let green_fleet_provisioning_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action =
       option_of_yojson
         (value_for_key green_fleet_provisioning_action_of_yojson "action")
         _list path;
   }
    : green_fleet_provisioning_option)

let duration_of_yojson = int_of_yojson

let deployment_ready_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTINUE_DEPLOYMENT" -> CONTINUE_DEPLOYMENT
    | `String "STOP_DEPLOYMENT" -> STOP_DEPLOYMENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentReadyAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentReadyAction")
     : deployment_ready_action)
    : deployment_ready_action)

let deployment_ready_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action_on_timeout =
       option_of_yojson
         (value_for_key deployment_ready_action_of_yojson "actionOnTimeout")
         _list path;
     wait_time_in_minutes =
       option_of_yojson (value_for_key duration_of_yojson "waitTimeInMinutes") _list path;
   }
    : deployment_ready_option)

let instance_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATE" -> TERMINATE
    | `String "KEEP_ALIVE" -> KEEP_ALIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceAction" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceAction")
     : instance_action)
    : instance_action)

let blue_instance_termination_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key instance_action_of_yojson "action") _list path;
     termination_wait_time_in_minutes =
       option_of_yojson (value_for_key duration_of_yojson "terminationWaitTimeInMinutes") _list path;
   }
    : blue_instance_termination_option)

let blue_green_deployment_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     terminate_blue_instances_on_deployment_success =
       option_of_yojson
         (value_for_key blue_instance_termination_option_of_yojson
            "terminateBlueInstancesOnDeploymentSuccess")
         _list path;
     deployment_ready_option =
       option_of_yojson
         (value_for_key deployment_ready_option_of_yojson "deploymentReadyOption")
         _list path;
     green_fleet_provisioning_option =
       option_of_yojson
         (value_for_key green_fleet_provisioning_option_of_yojson "greenFleetProvisioningOption")
         _list path;
   }
    : blue_green_deployment_configuration)

let outdated_instances_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE" -> Update
    | `String "IGNORE" -> Ignore
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OutdatedInstancesStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "OutdatedInstancesStrategy")
     : outdated_instances_strategy)
    : outdated_instances_strategy)

let deployment_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "WITH_TRAFFIC_CONTROL" -> WITH_TRAFFIC_CONTROL
    | `String "WITHOUT_TRAFFIC_CONTROL" -> WITHOUT_TRAFFIC_CONTROL
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentOption" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentOption")
     : deployment_option)
    : deployment_option)

let deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PLACE" -> IN_PLACE
    | `String "BLUE_GREEN" -> BLUE_GREEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentType")
     : deployment_type)
    : deployment_type)

let deployment_style_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_type =
       option_of_yojson (value_for_key deployment_type_of_yojson "deploymentType") _list path;
     deployment_option =
       option_of_yojson (value_for_key deployment_option_of_yojson "deploymentOption") _list path;
   }
    : deployment_style)

let trigger_event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DeploymentStart" -> DEPLOYMENT_START
    | `String "DeploymentSuccess" -> DEPLOYMENT_SUCCESS
    | `String "DeploymentFailure" -> DEPLOYMENT_FAILURE
    | `String "DeploymentStop" -> DEPLOYMENT_STOP
    | `String "DeploymentRollback" -> DEPLOYMENT_ROLLBACK
    | `String "DeploymentReady" -> DEPLOYMENT_READY
    | `String "InstanceStart" -> INSTANCE_START
    | `String "InstanceSuccess" -> INSTANCE_SUCCESS
    | `String "InstanceFailure" -> INSTANCE_FAILURE
    | `String "InstanceReady" -> INSTANCE_READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TriggerEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerEventType")
     : trigger_event_type)
    : trigger_event_type)

let trigger_event_type_list_of_yojson tree path =
  list_of_yojson trigger_event_type_of_yojson tree path

let trigger_target_arn_of_yojson = string_of_yojson
let trigger_name_of_yojson = string_of_yojson

let trigger_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trigger_name = option_of_yojson (value_for_key trigger_name_of_yojson "triggerName") _list path;
     trigger_target_arn =
       option_of_yojson (value_for_key trigger_target_arn_of_yojson "triggerTargetArn") _list path;
     trigger_events =
       option_of_yojson (value_for_key trigger_event_type_list_of_yojson "triggerEvents") _list path;
   }
    : trigger_config)

let trigger_config_list_of_yojson tree path = list_of_yojson trigger_config_of_yojson tree path
let role_of_yojson = string_of_yojson
let deployment_config_name_of_yojson = string_of_yojson
let deployment_group_id_of_yojson = string_of_yojson

let deployment_group_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     deployment_group_id =
       option_of_yojson (value_for_key deployment_group_id_of_yojson "deploymentGroupId") _list path;
     deployment_group_name =
       option_of_yojson
         (value_for_key deployment_group_name_of_yojson "deploymentGroupName")
         _list path;
     deployment_config_name =
       option_of_yojson
         (value_for_key deployment_config_name_of_yojson "deploymentConfigName")
         _list path;
     ec2_tag_filters =
       option_of_yojson (value_for_key ec2_tag_filter_list_of_yojson "ec2TagFilters") _list path;
     on_premises_instance_tag_filters =
       option_of_yojson
         (value_for_key tag_filter_list_of_yojson "onPremisesInstanceTagFilters")
         _list path;
     auto_scaling_groups =
       option_of_yojson
         (value_for_key auto_scaling_group_list_of_yojson "autoScalingGroups")
         _list path;
     service_role_arn = option_of_yojson (value_for_key role_of_yojson "serviceRoleArn") _list path;
     target_revision =
       option_of_yojson (value_for_key revision_location_of_yojson "targetRevision") _list path;
     trigger_configurations =
       option_of_yojson
         (value_for_key trigger_config_list_of_yojson "triggerConfigurations")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "alarmConfiguration")
         _list path;
     auto_rollback_configuration =
       option_of_yojson
         (value_for_key auto_rollback_configuration_of_yojson "autoRollbackConfiguration")
         _list path;
     deployment_style =
       option_of_yojson (value_for_key deployment_style_of_yojson "deploymentStyle") _list path;
     outdated_instances_strategy =
       option_of_yojson
         (value_for_key outdated_instances_strategy_of_yojson "outdatedInstancesStrategy")
         _list path;
     blue_green_deployment_configuration =
       option_of_yojson
         (value_for_key blue_green_deployment_configuration_of_yojson
            "blueGreenDeploymentConfiguration")
         _list path;
     load_balancer_info =
       option_of_yojson (value_for_key load_balancer_info_of_yojson "loadBalancerInfo") _list path;
     last_successful_deployment =
       option_of_yojson
         (value_for_key last_deployment_info_of_yojson "lastSuccessfulDeployment")
         _list path;
     last_attempted_deployment =
       option_of_yojson
         (value_for_key last_deployment_info_of_yojson "lastAttemptedDeployment")
         _list path;
     ec2_tag_set = option_of_yojson (value_for_key ec2_tag_set_of_yojson "ec2TagSet") _list path;
     on_premises_tag_set =
       option_of_yojson (value_for_key on_premises_tag_set_of_yojson "onPremisesTagSet") _list path;
     compute_platform =
       option_of_yojson (value_for_key compute_platform_of_yojson "computePlatform") _list path;
     ecs_services =
       option_of_yojson (value_for_key ecs_service_list_of_yojson "ecsServices") _list path;
     termination_hook_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "terminationHookEnabled") _list path;
   }
    : deployment_group_info)

let deployment_group_info_list_of_yojson tree path =
  list_of_yojson deployment_group_info_of_yojson tree path

let batch_get_deployment_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_groups_info =
       option_of_yojson
         (value_for_key deployment_group_info_list_of_yojson "deploymentGroupsInfo")
         _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : batch_get_deployment_groups_output)

let batch_get_deployment_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     deployment_group_names =
       value_for_key deployment_groups_list_of_yojson "deploymentGroupNames" _list path;
   }
    : batch_get_deployment_groups_input)

let invalid_deployment_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_id_exception)

let invalid_compute_platform_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_compute_platform_exception)

let instance_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : instance_id_required_exception)

let deployment_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_id_required_exception)

let deployment_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_does_not_exist_exception)

let instance_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Blue" -> BLUE
    | `String "Green" -> GREEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceType")
     : instance_type)
    : instance_type)

let lifecycle_event_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> IN_PROGRESS
    | `String "Succeeded" -> SUCCEEDED
    | `String "Failed" -> FAILED
    | `String "Skipped" -> SKIPPED
    | `String "Unknown" -> UNKNOWN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LifecycleEventStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LifecycleEventStatus")
     : lifecycle_event_status)
    : lifecycle_event_status)

let log_tail_of_yojson = string_of_yojson
let lifecycle_message_of_yojson = string_of_yojson
let script_name_of_yojson = string_of_yojson

let lifecycle_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "Success" -> SUCCESS
    | `String "ScriptMissing" -> SCRIPT_MISSING
    | `String "ScriptNotExecutable" -> SCRIPT_NOT_EXECUTABLE
    | `String "ScriptTimedOut" -> SCRIPT_TIMED_OUT
    | `String "ScriptFailed" -> SCRIPT_FAILED
    | `String "UnknownError" -> UNKNOWN_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "LifecycleErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LifecycleErrorCode")
     : lifecycle_error_code)
    : lifecycle_error_code)

let diagnostics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson (value_for_key lifecycle_error_code_of_yojson "errorCode") _list path;
     script_name = option_of_yojson (value_for_key script_name_of_yojson "scriptName") _list path;
     message = option_of_yojson (value_for_key lifecycle_message_of_yojson "message") _list path;
     log_tail = option_of_yojson (value_for_key log_tail_of_yojson "logTail") _list path;
   }
    : diagnostics)

let lifecycle_event_name_of_yojson = string_of_yojson

let lifecycle_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle_event_name =
       option_of_yojson
         (value_for_key lifecycle_event_name_of_yojson "lifecycleEventName")
         _list path;
     diagnostics = option_of_yojson (value_for_key diagnostics_of_yojson "diagnostics") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     status = option_of_yojson (value_for_key lifecycle_event_status_of_yojson "status") _list path;
   }
    : lifecycle_event)

let lifecycle_event_list_of_yojson tree path = list_of_yojson lifecycle_event_of_yojson tree path

let instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> IN_PROGRESS
    | `String "Succeeded" -> SUCCEEDED
    | `String "Failed" -> FAILED
    | `String "Skipped" -> SKIPPED
    | `String "Unknown" -> UNKNOWN
    | `String "Ready" -> READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceStatus")
     : instance_status)
    : instance_status)

let instance_id_of_yojson = string_of_yojson

let instance_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     instance_id = option_of_yojson (value_for_key instance_id_of_yojson "instanceId") _list path;
     status = option_of_yojson (value_for_key instance_status_of_yojson "status") _list path;
     last_updated_at =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedAt") _list path;
     lifecycle_events =
       option_of_yojson (value_for_key lifecycle_event_list_of_yojson "lifecycleEvents") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "instanceType") _list path;
   }
    : instance_summary)

let instance_summary_list_of_yojson tree path = list_of_yojson instance_summary_of_yojson tree path

let batch_get_deployment_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instances_summary =
       option_of_yojson
         (value_for_key instance_summary_list_of_yojson "instancesSummary")
         _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
   }
    : batch_get_deployment_instances_output)

let instances_list_of_yojson tree path = list_of_yojson instance_id_of_yojson tree path

let batch_get_deployment_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path;
     instance_ids = value_for_key instances_list_of_yojson "instanceIds" _list path;
   }
    : batch_get_deployment_instances_input)

let invalid_deployment_target_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_target_id_exception)

let instance_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : instance_does_not_exist_exception)

let deployment_target_list_size_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_target_list_size_exceeded_exception)

let deployment_target_id_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_target_id_required_exception)

let deployment_target_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_target_does_not_exist_exception)

let deployment_not_started_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_not_started_exception)

let traffic_weight_of_yojson = double_of_yojson
let cloud_formation_resource_type_of_yojson = string_of_yojson

let target_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "InProgress" -> IN_PROGRESS
    | `String "Succeeded" -> SUCCEEDED
    | `String "Failed" -> FAILED
    | `String "Skipped" -> SKIPPED
    | `String "Unknown" -> UNKNOWN
    | `String "Ready" -> READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetStatus")
     : target_status)
    : target_status)

let time_of_yojson = timestamp_epoch_seconds_of_yojson
let target_id_of_yojson = string_of_yojson

let cloud_formation_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "targetId") _list path;
     last_updated_at = option_of_yojson (value_for_key time_of_yojson "lastUpdatedAt") _list path;
     lifecycle_events =
       option_of_yojson (value_for_key lifecycle_event_list_of_yojson "lifecycleEvents") _list path;
     status = option_of_yojson (value_for_key target_status_of_yojson "status") _list path;
     resource_type =
       option_of_yojson
         (value_for_key cloud_formation_resource_type_of_yojson "resourceType")
         _list path;
     target_version_weight =
       option_of_yojson (value_for_key traffic_weight_of_yojson "targetVersionWeight") _list path;
   }
    : cloud_formation_target)

let target_label_of_yojson (tree : t) path =
  ((match tree with
    | `String "Blue" -> BLUE
    | `String "Green" -> GREEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetLabel" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetLabel")
     : target_label)
    : target_label)

let ecs_task_set_status_of_yojson = string_of_yojson
let ecs_task_set_count_of_yojson = long_of_yojson
let ecs_task_set_identifier_of_yojson = string_of_yojson

let ecs_task_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifer =
       option_of_yojson (value_for_key ecs_task_set_identifier_of_yojson "identifer") _list path;
     desired_count =
       option_of_yojson (value_for_key ecs_task_set_count_of_yojson "desiredCount") _list path;
     pending_count =
       option_of_yojson (value_for_key ecs_task_set_count_of_yojson "pendingCount") _list path;
     running_count =
       option_of_yojson (value_for_key ecs_task_set_count_of_yojson "runningCount") _list path;
     status = option_of_yojson (value_for_key ecs_task_set_status_of_yojson "status") _list path;
     traffic_weight =
       option_of_yojson (value_for_key traffic_weight_of_yojson "trafficWeight") _list path;
     target_group =
       option_of_yojson (value_for_key target_group_info_of_yojson "targetGroup") _list path;
     task_set_label =
       option_of_yojson (value_for_key target_label_of_yojson "taskSetLabel") _list path;
   }
    : ecs_task_set)

let ecs_task_set_list_of_yojson tree path = list_of_yojson ecs_task_set_of_yojson tree path
let target_arn_of_yojson = string_of_yojson

let ecs_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "targetId") _list path;
     target_arn = option_of_yojson (value_for_key target_arn_of_yojson "targetArn") _list path;
     last_updated_at = option_of_yojson (value_for_key time_of_yojson "lastUpdatedAt") _list path;
     lifecycle_events =
       option_of_yojson (value_for_key lifecycle_event_list_of_yojson "lifecycleEvents") _list path;
     status = option_of_yojson (value_for_key target_status_of_yojson "status") _list path;
     task_sets_info =
       option_of_yojson (value_for_key ecs_task_set_list_of_yojson "taskSetsInfo") _list path;
   }
    : ecs_target)

let version_of_yojson = string_of_yojson
let lambda_function_alias_of_yojson = string_of_yojson
let lambda_function_name_of_yojson = string_of_yojson

let lambda_function_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     function_name =
       option_of_yojson (value_for_key lambda_function_name_of_yojson "functionName") _list path;
     function_alias =
       option_of_yojson (value_for_key lambda_function_alias_of_yojson "functionAlias") _list path;
     current_version =
       option_of_yojson (value_for_key version_of_yojson "currentVersion") _list path;
     target_version = option_of_yojson (value_for_key version_of_yojson "targetVersion") _list path;
     target_version_weight =
       option_of_yojson (value_for_key traffic_weight_of_yojson "targetVersionWeight") _list path;
   }
    : lambda_function_info)

let lambda_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "targetId") _list path;
     target_arn = option_of_yojson (value_for_key target_arn_of_yojson "targetArn") _list path;
     status = option_of_yojson (value_for_key target_status_of_yojson "status") _list path;
     last_updated_at = option_of_yojson (value_for_key time_of_yojson "lastUpdatedAt") _list path;
     lifecycle_events =
       option_of_yojson (value_for_key lifecycle_event_list_of_yojson "lifecycleEvents") _list path;
     lambda_function_info =
       option_of_yojson
         (value_for_key lambda_function_info_of_yojson "lambdaFunctionInfo")
         _list path;
   }
    : lambda_target)

let instance_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "targetId") _list path;
     target_arn = option_of_yojson (value_for_key target_arn_of_yojson "targetArn") _list path;
     status = option_of_yojson (value_for_key target_status_of_yojson "status") _list path;
     last_updated_at = option_of_yojson (value_for_key time_of_yojson "lastUpdatedAt") _list path;
     lifecycle_events =
       option_of_yojson (value_for_key lifecycle_event_list_of_yojson "lifecycleEvents") _list path;
     instance_label =
       option_of_yojson (value_for_key target_label_of_yojson "instanceLabel") _list path;
   }
    : instance_target)

let deployment_target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "InstanceTarget" -> INSTANCE_TARGET
    | `String "LambdaTarget" -> LAMBDA_TARGET
    | `String "ECSTarget" -> ECS_TARGET
    | `String "CloudFormationTarget" -> CLOUDFORMATION_TARGET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeploymentTargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentTargetType")
     : deployment_target_type)
    : deployment_target_type)

let deployment_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_target_type =
       option_of_yojson
         (value_for_key deployment_target_type_of_yojson "deploymentTargetType")
         _list path;
     instance_target =
       option_of_yojson (value_for_key instance_target_of_yojson "instanceTarget") _list path;
     lambda_target =
       option_of_yojson (value_for_key lambda_target_of_yojson "lambdaTarget") _list path;
     ecs_target = option_of_yojson (value_for_key ecs_target_of_yojson "ecsTarget") _list path;
     cloud_formation_target =
       option_of_yojson
         (value_for_key cloud_formation_target_of_yojson "cloudFormationTarget")
         _list path;
   }
    : deployment_target)

let deployment_target_list_of_yojson tree path =
  list_of_yojson deployment_target_of_yojson tree path

let batch_get_deployment_targets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_targets =
       option_of_yojson
         (value_for_key deployment_target_list_of_yojson "deploymentTargets")
         _list path;
   }
    : batch_get_deployment_targets_output)

let target_id_list_of_yojson tree path = list_of_yojson target_id_of_yojson tree path

let batch_get_deployment_targets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path;
     target_ids = value_for_key target_id_list_of_yojson "targetIds" _list path;
   }
    : batch_get_deployment_targets_input)

let deployments_list_of_yojson tree path = list_of_yojson deployment_id_of_yojson tree path

let related_deployments_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_update_outdated_instances_root_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "autoUpdateOutdatedInstancesRootDeploymentId")
         _list path;
     auto_update_outdated_instances_deployment_ids =
       option_of_yojson
         (value_for_key deployments_list_of_yojson "autoUpdateOutdatedInstancesDeploymentIds")
         _list path;
   }
    : related_deployments)

let external_id_of_yojson = string_of_yojson

let deployment_status_message_list_of_yojson tree path =
  list_of_yojson error_message_of_yojson tree path

let file_exists_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISALLOW" -> DISALLOW
    | `String "OVERWRITE" -> OVERWRITE
    | `String "RETAIN" -> RETAIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileExistsBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "FileExistsBehavior")
     : file_exists_behavior)
    : file_exists_behavior)

let target_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_filters =
       option_of_yojson (value_for_key ec2_tag_filter_list_of_yojson "tagFilters") _list path;
     auto_scaling_groups =
       option_of_yojson
         (value_for_key auto_scaling_group_name_list_of_yojson "autoScalingGroups")
         _list path;
     ec2_tag_set = option_of_yojson (value_for_key ec2_tag_set_of_yojson "ec2TagSet") _list path;
   }
    : target_instances)

let rollback_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rollback_deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "rollbackDeploymentId") _list path;
     rollback_triggering_deployment_id =
       option_of_yojson
         (value_for_key deployment_id_of_yojson "rollbackTriggeringDeploymentId")
         _list path;
     rollback_message =
       option_of_yojson (value_for_key description_of_yojson "rollbackMessage") _list path;
   }
    : rollback_info)

let deployment_creator_of_yojson (tree : t) path =
  ((match tree with
    | `String "user" -> User
    | `String "autoscaling" -> Autoscaling
    | `String "codeDeployRollback" -> CodeDeployRollback
    | `String "CodeDeploy" -> CodeDeploy
    | `String "CodeDeployAutoUpdate" -> CodeDeployAutoUpdate
    | `String "CloudFormation" -> CloudFormation
    | `String "CloudFormationRollback" -> CloudFormationRollback
    | `String "autoscalingTermination" -> AutoscalingTermination
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentCreator" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentCreator")
     : deployment_creator)
    : deployment_creator)

let instance_count_of_yojson = long_of_yojson

let deployment_overview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pending = option_of_yojson (value_for_key instance_count_of_yojson "Pending") _list path;
     in_progress = option_of_yojson (value_for_key instance_count_of_yojson "InProgress") _list path;
     succeeded = option_of_yojson (value_for_key instance_count_of_yojson "Succeeded") _list path;
     failed = option_of_yojson (value_for_key instance_count_of_yojson "Failed") _list path;
     skipped = option_of_yojson (value_for_key instance_count_of_yojson "Skipped") _list path;
     ready = option_of_yojson (value_for_key instance_count_of_yojson "Ready") _list path;
   }
    : deployment_overview)

let error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "AGENT_ISSUE" -> AGENT_ISSUE
    | `String "ALARM_ACTIVE" -> ALARM_ACTIVE
    | `String "APPLICATION_MISSING" -> APPLICATION_MISSING
    | `String "AUTOSCALING_VALIDATION_ERROR" -> AUTOSCALING_VALIDATION_ERROR
    | `String "AUTO_SCALING_CONFIGURATION" -> AUTO_SCALING_CONFIGURATION
    | `String "AUTO_SCALING_IAM_ROLE_PERMISSIONS" -> AUTO_SCALING_IAM_ROLE_PERMISSIONS
    | `String "CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND" -> CODEDEPLOY_RESOURCE_CANNOT_BE_FOUND
    | `String "CUSTOMER_APPLICATION_UNHEALTHY" -> CUSTOMER_APPLICATION_UNHEALTHY
    | `String "DEPLOYMENT_GROUP_MISSING" -> DEPLOYMENT_GROUP_MISSING
    | `String "ECS_UPDATE_ERROR" -> ECS_UPDATE_ERROR
    | `String "ELASTIC_LOAD_BALANCING_INVALID" -> ELASTIC_LOAD_BALANCING_INVALID
    | `String "ELB_INVALID_INSTANCE" -> ELB_INVALID_INSTANCE
    | `String "HEALTH_CONSTRAINTS" -> HEALTH_CONSTRAINTS
    | `String "HEALTH_CONSTRAINTS_INVALID" -> HEALTH_CONSTRAINTS_INVALID
    | `String "HOOK_EXECUTION_FAILURE" -> HOOK_EXECUTION_FAILURE
    | `String "IAM_ROLE_MISSING" -> IAM_ROLE_MISSING
    | `String "IAM_ROLE_PERMISSIONS" -> IAM_ROLE_PERMISSIONS
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "INVALID_ECS_SERVICE" -> INVALID_ECS_SERVICE
    | `String "INVALID_LAMBDA_CONFIGURATION" -> INVALID_LAMBDA_CONFIGURATION
    | `String "INVALID_LAMBDA_FUNCTION" -> INVALID_LAMBDA_FUNCTION
    | `String "INVALID_REVISION" -> INVALID_REVISION
    | `String "MANUAL_STOP" -> MANUAL_STOP
    | `String "MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION" ->
        MISSING_BLUE_GREEN_DEPLOYMENT_CONFIGURATION
    | `String "MISSING_ELB_INFORMATION" -> MISSING_ELB_INFORMATION
    | `String "MISSING_GITHUB_TOKEN" -> MISSING_GITHUB_TOKEN
    | `String "NO_EC2_SUBSCRIPTION" -> NO_EC2_SUBSCRIPTION
    | `String "NO_INSTANCES" -> NO_INSTANCES
    | `String "OVER_MAX_INSTANCES" -> OVER_MAX_INSTANCES
    | `String "RESOURCE_LIMIT_EXCEEDED" -> RESOURCE_LIMIT_EXCEEDED
    | `String "REVISION_MISSING" -> REVISION_MISSING
    | `String "THROTTLED" -> THROTTLED
    | `String "TIMEOUT" -> TIMEOUT
    | `String "CLOUDFORMATION_STACK_FAILURE" -> CLOUDFORMATION_STACK_FAILURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ErrorCode")
     : error_code)
    : error_code)

let error_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
   }
    : error_information)

let deployment_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     deployment_group_name =
       option_of_yojson
         (value_for_key deployment_group_name_of_yojson "deploymentGroupName")
         _list path;
     deployment_config_name =
       option_of_yojson
         (value_for_key deployment_config_name_of_yojson "deploymentConfigName")
         _list path;
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     previous_revision =
       option_of_yojson (value_for_key revision_location_of_yojson "previousRevision") _list path;
     revision = option_of_yojson (value_for_key revision_location_of_yojson "revision") _list path;
     status = option_of_yojson (value_for_key deployment_status_of_yojson "status") _list path;
     error_information =
       option_of_yojson (value_for_key error_information_of_yojson "errorInformation") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "createTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     complete_time = option_of_yojson (value_for_key timestamp_of_yojson "completeTime") _list path;
     deployment_overview =
       option_of_yojson
         (value_for_key deployment_overview_of_yojson "deploymentOverview")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     creator = option_of_yojson (value_for_key deployment_creator_of_yojson "creator") _list path;
     ignore_application_stop_failures =
       option_of_yojson
         (value_for_key boolean__of_yojson "ignoreApplicationStopFailures")
         _list path;
     auto_rollback_configuration =
       option_of_yojson
         (value_for_key auto_rollback_configuration_of_yojson "autoRollbackConfiguration")
         _list path;
     update_outdated_instances_only =
       option_of_yojson (value_for_key boolean__of_yojson "updateOutdatedInstancesOnly") _list path;
     rollback_info =
       option_of_yojson (value_for_key rollback_info_of_yojson "rollbackInfo") _list path;
     deployment_style =
       option_of_yojson (value_for_key deployment_style_of_yojson "deploymentStyle") _list path;
     target_instances =
       option_of_yojson (value_for_key target_instances_of_yojson "targetInstances") _list path;
     instance_termination_wait_time_started =
       option_of_yojson
         (value_for_key boolean__of_yojson "instanceTerminationWaitTimeStarted")
         _list path;
     blue_green_deployment_configuration =
       option_of_yojson
         (value_for_key blue_green_deployment_configuration_of_yojson
            "blueGreenDeploymentConfiguration")
         _list path;
     load_balancer_info =
       option_of_yojson (value_for_key load_balancer_info_of_yojson "loadBalancerInfo") _list path;
     additional_deployment_status_info =
       option_of_yojson
         (value_for_key additional_deployment_status_info_of_yojson "additionalDeploymentStatusInfo")
         _list path;
     file_exists_behavior =
       option_of_yojson
         (value_for_key file_exists_behavior_of_yojson "fileExistsBehavior")
         _list path;
     deployment_status_messages =
       option_of_yojson
         (value_for_key deployment_status_message_list_of_yojson "deploymentStatusMessages")
         _list path;
     compute_platform =
       option_of_yojson (value_for_key compute_platform_of_yojson "computePlatform") _list path;
     external_id = option_of_yojson (value_for_key external_id_of_yojson "externalId") _list path;
     related_deployments =
       option_of_yojson
         (value_for_key related_deployments_of_yojson "relatedDeployments")
         _list path;
     override_alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "overrideAlarmConfiguration")
         _list path;
   }
    : deployment_info)

let deployments_info_list_of_yojson tree path = list_of_yojson deployment_info_of_yojson tree path

let batch_get_deployments_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployments_info =
       option_of_yojson (value_for_key deployments_info_list_of_yojson "deploymentsInfo") _list path;
   }
    : batch_get_deployments_output)

let batch_get_deployments_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ deployment_ids = value_for_key deployments_list_of_yojson "deploymentIds" _list path }
    : batch_get_deployments_input)

let instance_arn_of_yojson = string_of_yojson
let iam_user_arn_of_yojson = string_of_yojson
let iam_session_arn_of_yojson = string_of_yojson

let instance_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name =
       option_of_yojson (value_for_key instance_name_of_yojson "instanceName") _list path;
     iam_session_arn =
       option_of_yojson (value_for_key iam_session_arn_of_yojson "iamSessionArn") _list path;
     iam_user_arn = option_of_yojson (value_for_key iam_user_arn_of_yojson "iamUserArn") _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "instanceArn") _list path;
     register_time = option_of_yojson (value_for_key timestamp_of_yojson "registerTime") _list path;
     deregister_time =
       option_of_yojson (value_for_key timestamp_of_yojson "deregisterTime") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : instance_info)

let instance_info_list_of_yojson tree path = list_of_yojson instance_info_of_yojson tree path

let batch_get_on_premises_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_infos =
       option_of_yojson (value_for_key instance_info_list_of_yojson "instanceInfos") _list path;
   }
    : batch_get_on_premises_instances_output)

let batch_get_on_premises_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_names = value_for_key instance_name_list_of_yojson "instanceNames" _list path }
    : batch_get_on_premises_instances_input)

let bucket_name_filter_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : bucket_name_filter_required_exception)

let trigger_targets_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : trigger_targets_limit_exceeded_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : throttling_exception)

let tag_set_list_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : tag_set_list_limit_exceeded_exception)

let lifecycle_hook_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : lifecycle_hook_limit_exceeded_exception)

let invalid_trigger_config_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_trigger_config_exception)

let invalid_traffic_routing_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_traffic_routing_configuration_exception)

let invalid_target_group_pair_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_target_group_pair_exception)

let invalid_role_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_role_exception)

let invalid_on_premises_tag_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_on_premises_tag_combination_exception)

let invalid_load_balancer_info_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_load_balancer_info_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_input_exception)

let invalid_ecs_service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_ecs_service_exception)

let invalid_ec2_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_ec2_tag_exception)

let invalid_ec2_tag_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_ec2_tag_combination_exception)

let invalid_deployment_style_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_style_exception)

let invalid_deployment_config_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_config_name_exception)

let invalid_blue_green_deployment_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_blue_green_deployment_configuration_exception)

let invalid_auto_scaling_group_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_auto_scaling_group_exception)

let invalid_auto_rollback_config_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_auto_rollback_config_exception)

let invalid_alarm_config_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_alarm_config_exception)

let ecs_service_mapping_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : ecs_service_mapping_limit_exceeded_exception)

let deployment_group_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_group_does_not_exist_exception)

let deployment_group_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_group_already_exists_exception)

let update_deployment_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hooks_not_cleaned_up =
       option_of_yojson
         (value_for_key auto_scaling_group_list_of_yojson "hooksNotCleanedUp")
         _list path;
   }
    : update_deployment_group_output)

let nullable_boolean_of_yojson = bool_of_yojson

let update_deployment_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     current_deployment_group_name =
       value_for_key deployment_group_name_of_yojson "currentDeploymentGroupName" _list path;
     new_deployment_group_name =
       option_of_yojson
         (value_for_key deployment_group_name_of_yojson "newDeploymentGroupName")
         _list path;
     deployment_config_name =
       option_of_yojson
         (value_for_key deployment_config_name_of_yojson "deploymentConfigName")
         _list path;
     ec2_tag_filters =
       option_of_yojson (value_for_key ec2_tag_filter_list_of_yojson "ec2TagFilters") _list path;
     on_premises_instance_tag_filters =
       option_of_yojson
         (value_for_key tag_filter_list_of_yojson "onPremisesInstanceTagFilters")
         _list path;
     auto_scaling_groups =
       option_of_yojson
         (value_for_key auto_scaling_group_name_list_of_yojson "autoScalingGroups")
         _list path;
     service_role_arn = option_of_yojson (value_for_key role_of_yojson "serviceRoleArn") _list path;
     trigger_configurations =
       option_of_yojson
         (value_for_key trigger_config_list_of_yojson "triggerConfigurations")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "alarmConfiguration")
         _list path;
     auto_rollback_configuration =
       option_of_yojson
         (value_for_key auto_rollback_configuration_of_yojson "autoRollbackConfiguration")
         _list path;
     outdated_instances_strategy =
       option_of_yojson
         (value_for_key outdated_instances_strategy_of_yojson "outdatedInstancesStrategy")
         _list path;
     deployment_style =
       option_of_yojson (value_for_key deployment_style_of_yojson "deploymentStyle") _list path;
     blue_green_deployment_configuration =
       option_of_yojson
         (value_for_key blue_green_deployment_configuration_of_yojson
            "blueGreenDeploymentConfiguration")
         _list path;
     load_balancer_info =
       option_of_yojson (value_for_key load_balancer_info_of_yojson "loadBalancerInfo") _list path;
     ec2_tag_set = option_of_yojson (value_for_key ec2_tag_set_of_yojson "ec2TagSet") _list path;
     ecs_services =
       option_of_yojson (value_for_key ecs_service_list_of_yojson "ecsServices") _list path;
     on_premises_tag_set =
       option_of_yojson (value_for_key on_premises_tag_set_of_yojson "onPremisesTagSet") _list path;
     termination_hook_enabled =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "terminationHookEnabled")
         _list path;
   }
    : update_deployment_group_input)

let update_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     new_application_name =
       option_of_yojson (value_for_key application_name_of_yojson "newApplicationName") _list path;
   }
    : update_application_input)

let resource_arn_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_arn_required_exception)

let invalid_tags_to_add_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_tags_to_add_exception)

let invalid_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_arn_exception)

let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson key_of_yojson tree path

let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_input)

let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_input)

let unsupported_action_for_deployment_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : unsupported_action_for_deployment_type_exception)

let deployment_already_completed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_already_completed_exception)

let stop_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Pending" -> PENDING
    | `String "Succeeded" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StopStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StopStatus")
     : stop_status)
    : stop_status)

let stop_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key stop_status_of_yojson "status") _list path;
     status_message = option_of_yojson (value_for_key message_of_yojson "statusMessage") _list path;
   }
    : stop_deployment_output)

let stop_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path;
     auto_rollback_enabled =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "autoRollbackEnabled") _list path;
   }
    : stop_deployment_input)

let skip_wait_time_for_instance_termination_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
   }
    : skip_wait_time_for_instance_termination_input)

let remove_tags_from_on_premises_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     instance_names = value_for_key instance_name_list_of_yojson "instanceNames" _list path;
   }
    : remove_tags_from_on_premises_instances_input)

let multiple_iam_arns_provided_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : multiple_iam_arns_provided_exception)

let invalid_iam_user_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_iam_user_arn_exception)

let invalid_iam_session_arn_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_iam_session_arn_exception)

let instance_name_already_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : instance_name_already_registered_exception)

let iam_user_arn_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : iam_user_arn_required_exception)

let iam_user_arn_already_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : iam_user_arn_already_registered_exception)

let iam_session_arn_already_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : iam_session_arn_already_registered_exception)

let iam_arn_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : iam_arn_required_exception)

let register_on_premises_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_name = value_for_key instance_name_of_yojson "instanceName" _list path;
     iam_session_arn =
       option_of_yojson (value_for_key iam_session_arn_of_yojson "iamSessionArn") _list path;
     iam_user_arn = option_of_yojson (value_for_key iam_user_arn_of_yojson "iamUserArn") _list path;
   }
    : register_on_premises_instance_input)

let description_too_long_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : description_too_long_exception)

let register_application_revision_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     revision = value_for_key revision_location_of_yojson "revision" _list path;
   }
    : register_application_revision_input)

let lifecycle_event_already_completed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : lifecycle_event_already_completed_exception)

let invalid_lifecycle_event_hook_execution_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_lifecycle_event_hook_execution_status_exception)

let invalid_lifecycle_event_hook_execution_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_lifecycle_event_hook_execution_id_exception)

let lifecycle_event_hook_execution_id_of_yojson = string_of_yojson

let put_lifecycle_event_hook_execution_status_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle_event_hook_execution_id =
       option_of_yojson
         (value_for_key lifecycle_event_hook_execution_id_of_yojson "lifecycleEventHookExecutionId")
         _list path;
   }
    : put_lifecycle_event_hook_execution_status_output)

let put_lifecycle_event_hook_execution_status_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     lifecycle_event_hook_execution_id =
       option_of_yojson
         (value_for_key lifecycle_event_hook_execution_id_of_yojson "lifecycleEventHookExecutionId")
         _list path;
     status = option_of_yojson (value_for_key lifecycle_event_status_of_yojson "status") _list path;
   }
    : put_lifecycle_event_hook_execution_status_input)

let next_token_of_yojson = string_of_yojson

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_input)

let invalid_tag_filter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_tag_filter_exception)

let invalid_registration_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_registration_status_exception)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_next_token_exception)

let list_on_premises_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_names =
       option_of_yojson (value_for_key instance_name_list_of_yojson "instanceNames") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_on_premises_instances_output)

let registration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Registered" -> Registered
    | `String "Deregistered" -> Deregistered
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationStatus")
     : registration_status)
    : registration_status)

let list_on_premises_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_status =
       option_of_yojson
         (value_for_key registration_status_of_yojson "registrationStatus")
         _list path;
     tag_filters =
       option_of_yojson (value_for_key tag_filter_list_of_yojson "tagFilters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_on_premises_instances_input)

let resource_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_validation_exception)

let operation_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : operation_not_supported_exception)

let git_hub_account_token_name_list_of_yojson tree path =
  list_of_yojson git_hub_account_token_name_of_yojson tree path

let list_git_hub_account_token_names_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_name_list =
       option_of_yojson
         (value_for_key git_hub_account_token_name_list_of_yojson "tokenNameList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_git_hub_account_token_names_output)

let list_git_hub_account_token_names_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path }
    : list_git_hub_account_token_names_input)

let invalid_target_filter_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_target_filter_name_exception)

let invalid_instance_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_instance_type_exception)

let invalid_instance_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_instance_status_exception)

let invalid_deployment_instance_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_instance_type_exception)

let list_deployment_targets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_ids = option_of_yojson (value_for_key target_id_list_of_yojson "targetIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployment_targets_output)

let filter_value_of_yojson = string_of_yojson
let filter_value_list_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let target_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "TargetStatus" -> TARGET_STATUS
    | `String "ServerInstanceLabel" -> SERVER_INSTANCE_LABEL
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetFilterName")
     : target_filter_name)
    : target_filter_name)

let target_filters_of_yojson tree path =
  map_of_yojson target_filter_name_of_yojson filter_value_list_of_yojson tree path

let list_deployment_targets_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     target_filters =
       option_of_yojson (value_for_key target_filters_of_yojson "targetFilters") _list path;
   }
    : list_deployment_targets_input)

let invalid_time_range_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_time_range_exception)

let invalid_external_id_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_external_id_exception)

let invalid_deployment_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_status_exception)

let list_deployments_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployments =
       option_of_yojson (value_for_key deployments_list_of_yojson "deployments") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployments_output)

let time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start = option_of_yojson (value_for_key timestamp_of_yojson "start") _list path;
     end_ = option_of_yojson (value_for_key timestamp_of_yojson "end") _list path;
   }
    : time_range)

let deployment_status_list_of_yojson tree path =
  list_of_yojson deployment_status_of_yojson tree path

let list_deployments_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     deployment_group_name =
       option_of_yojson
         (value_for_key deployment_group_name_of_yojson "deploymentGroupName")
         _list path;
     external_id = option_of_yojson (value_for_key external_id_of_yojson "externalId") _list path;
     include_only_statuses =
       option_of_yojson
         (value_for_key deployment_status_list_of_yojson "includeOnlyStatuses")
         _list path;
     create_time_range =
       option_of_yojson (value_for_key time_range_of_yojson "createTimeRange") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployments_input)

let list_deployment_instances_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instances_list =
       option_of_yojson (value_for_key instances_list_of_yojson "instancesList") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployment_instances_output)

let instance_type_list_of_yojson tree path = list_of_yojson instance_type_of_yojson tree path
let instance_status_list_of_yojson tree path = list_of_yojson instance_status_of_yojson tree path

let list_deployment_instances_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     instance_status_filter =
       option_of_yojson
         (value_for_key instance_status_list_of_yojson "instanceStatusFilter")
         _list path;
     instance_type_filter =
       option_of_yojson (value_for_key instance_type_list_of_yojson "instanceTypeFilter") _list path;
   }
    : list_deployment_instances_input)

let list_deployment_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     deployment_groups =
       option_of_yojson
         (value_for_key deployment_groups_list_of_yojson "deploymentGroups")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployment_groups_output)

let list_deployment_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployment_groups_input)

let deployment_configs_list_of_yojson tree path =
  list_of_yojson deployment_config_name_of_yojson tree path

let list_deployment_configs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_configs_list =
       option_of_yojson
         (value_for_key deployment_configs_list_of_yojson "deploymentConfigsList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_deployment_configs_output)

let list_deployment_configs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path }
    : list_deployment_configs_input)

let list_applications_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     applications =
       option_of_yojson (value_for_key applications_list_of_yojson "applications") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_applications_output)

let list_applications_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path }
    : list_applications_input)

let invalid_sort_order_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_sort_order_exception)

let invalid_sort_by_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_sort_by_exception)

let invalid_key_prefix_filter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_key_prefix_filter_exception)

let invalid_deployed_state_filter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployed_state_filter_exception)

let invalid_bucket_name_filter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_bucket_name_filter_exception)

let list_application_revisions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revisions =
       option_of_yojson (value_for_key revision_location_list_of_yojson "revisions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_application_revisions_output)

let list_state_filter_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "include" -> Include
    | `String "exclude" -> Exclude
    | `String "ignore" -> Ignore
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListStateFilterAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ListStateFilterAction")
     : list_state_filter_action)
    : list_state_filter_action)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ascending" -> Ascending
    | `String "descending" -> Descending
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let list_application_revisions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     sort_by =
       option_of_yojson (value_for_key application_revision_sort_by_of_yojson "sortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "sortOrder") _list path;
     s3_bucket = option_of_yojson (value_for_key s3_bucket_of_yojson "s3Bucket") _list path;
     s3_key_prefix = option_of_yojson (value_for_key s3_key_of_yojson "s3KeyPrefix") _list path;
     deployed =
       option_of_yojson (value_for_key list_state_filter_action_of_yojson "deployed") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_application_revisions_input)

let get_on_premises_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_info =
       option_of_yojson (value_for_key instance_info_of_yojson "instanceInfo") _list path;
   }
    : get_on_premises_instance_output)

let get_on_premises_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key instance_name_of_yojson "instanceName" _list path }
    : get_on_premises_instance_input)

let get_deployment_target_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_target =
       option_of_yojson (value_for_key deployment_target_of_yojson "deploymentTarget") _list path;
   }
    : get_deployment_target_output)

let get_deployment_target_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path;
     target_id = value_for_key target_id_of_yojson "targetId" _list path;
   }
    : get_deployment_target_input)

let get_deployment_instance_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_summary =
       option_of_yojson (value_for_key instance_summary_of_yojson "instanceSummary") _list path;
   }
    : get_deployment_instance_output)

let get_deployment_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path;
     instance_id = value_for_key instance_id_of_yojson "instanceId" _list path;
   }
    : get_deployment_instance_input)

let get_deployment_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_group_info =
       option_of_yojson
         (value_for_key deployment_group_info_of_yojson "deploymentGroupInfo")
         _list path;
   }
    : get_deployment_group_output)

let get_deployment_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     deployment_group_name =
       value_for_key deployment_group_name_of_yojson "deploymentGroupName" _list path;
   }
    : get_deployment_group_input)

let deployment_config_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_config_name_required_exception)

let minimum_healthy_hosts_per_zone_value_of_yojson = int_of_yojson

let minimum_healthy_hosts_per_zone_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOST_COUNT" -> HOST_COUNT
    | `String "FLEET_PERCENT" -> FLEET_PERCENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MinimumHealthyHostsPerZoneType" value)
    | _ -> raise (deserialize_wrong_type_error path "MinimumHealthyHostsPerZoneType")
     : minimum_healthy_hosts_per_zone_type)
    : minimum_healthy_hosts_per_zone_type)

let minimum_healthy_hosts_per_zone_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key minimum_healthy_hosts_per_zone_type_of_yojson "type")
         _list path;
     value =
       option_of_yojson
         (value_for_key minimum_healthy_hosts_per_zone_value_of_yojson "value")
         _list path;
   }
    : minimum_healthy_hosts_per_zone)

let wait_time_in_seconds_of_yojson = long_of_yojson

let zonal_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     first_zone_monitor_duration_in_seconds =
       option_of_yojson
         (value_for_key wait_time_in_seconds_of_yojson "firstZoneMonitorDurationInSeconds")
         _list path;
     monitor_duration_in_seconds =
       option_of_yojson
         (value_for_key wait_time_in_seconds_of_yojson "monitorDurationInSeconds")
         _list path;
     minimum_healthy_hosts_per_zone =
       option_of_yojson
         (value_for_key minimum_healthy_hosts_per_zone_of_yojson "minimumHealthyHostsPerZone")
         _list path;
   }
    : zonal_config)

let wait_time_in_mins_of_yojson = int_of_yojson
let percentage_of_yojson = int_of_yojson

let time_based_linear_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     linear_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "linearPercentage") _list path;
     linear_interval =
       option_of_yojson (value_for_key wait_time_in_mins_of_yojson "linearInterval") _list path;
   }
    : time_based_linear)

let time_based_canary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     canary_percentage =
       option_of_yojson (value_for_key percentage_of_yojson "canaryPercentage") _list path;
     canary_interval =
       option_of_yojson (value_for_key wait_time_in_mins_of_yojson "canaryInterval") _list path;
   }
    : time_based_canary)

let traffic_routing_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TimeBasedCanary" -> TimeBasedCanary
    | `String "TimeBasedLinear" -> TimeBasedLinear
    | `String "AllAtOnce" -> AllAtOnce
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrafficRoutingType" value)
    | _ -> raise (deserialize_wrong_type_error path "TrafficRoutingType")
     : traffic_routing_type)
    : traffic_routing_type)

let traffic_routing_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key traffic_routing_type_of_yojson "type") _list path;
     time_based_canary =
       option_of_yojson (value_for_key time_based_canary_of_yojson "timeBasedCanary") _list path;
     time_based_linear =
       option_of_yojson (value_for_key time_based_linear_of_yojson "timeBasedLinear") _list path;
   }
    : traffic_routing_config)

let minimum_healthy_hosts_value_of_yojson = int_of_yojson

let minimum_healthy_hosts_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOST_COUNT" -> HOST_COUNT
    | `String "FLEET_PERCENT" -> FLEET_PERCENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MinimumHealthyHostsType" value)
    | _ -> raise (deserialize_wrong_type_error path "MinimumHealthyHostsType")
     : minimum_healthy_hosts_type)
    : minimum_healthy_hosts_type)

let minimum_healthy_hosts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key minimum_healthy_hosts_type_of_yojson "type") _list path;
     value =
       option_of_yojson (value_for_key minimum_healthy_hosts_value_of_yojson "value") _list path;
   }
    : minimum_healthy_hosts)

let deployment_config_id_of_yojson = string_of_yojson

let deployment_config_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_config_id =
       option_of_yojson
         (value_for_key deployment_config_id_of_yojson "deploymentConfigId")
         _list path;
     deployment_config_name =
       option_of_yojson
         (value_for_key deployment_config_name_of_yojson "deploymentConfigName")
         _list path;
     minimum_healthy_hosts =
       option_of_yojson
         (value_for_key minimum_healthy_hosts_of_yojson "minimumHealthyHosts")
         _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "createTime") _list path;
     compute_platform =
       option_of_yojson (value_for_key compute_platform_of_yojson "computePlatform") _list path;
     traffic_routing_config =
       option_of_yojson
         (value_for_key traffic_routing_config_of_yojson "trafficRoutingConfig")
         _list path;
     zonal_config = option_of_yojson (value_for_key zonal_config_of_yojson "zonalConfig") _list path;
   }
    : deployment_config_info)

let get_deployment_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_config_info =
       option_of_yojson
         (value_for_key deployment_config_info_of_yojson "deploymentConfigInfo")
         _list path;
   }
    : get_deployment_config_output)

let get_deployment_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_config_name =
       value_for_key deployment_config_name_of_yojson "deploymentConfigName" _list path;
   }
    : get_deployment_config_input)

let get_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_info =
       option_of_yojson (value_for_key deployment_info_of_yojson "deploymentInfo") _list path;
   }
    : get_deployment_output)

let get_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ deployment_id = value_for_key deployment_id_of_yojson "deploymentId" _list path }
    : get_deployment_input)

let revision_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : revision_does_not_exist_exception)

let get_application_revision_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       option_of_yojson (value_for_key application_name_of_yojson "applicationName") _list path;
     revision = option_of_yojson (value_for_key revision_location_of_yojson "revision") _list path;
     revision_info =
       option_of_yojson (value_for_key generic_revision_info_of_yojson "revisionInfo") _list path;
   }
    : get_application_revision_output)

let get_application_revision_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     revision = value_for_key revision_location_of_yojson "revision" _list path;
   }
    : get_application_revision_input)

let get_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application =
       option_of_yojson (value_for_key application_info_of_yojson "application") _list path;
   }
    : get_application_output)

let get_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_name = value_for_key application_name_of_yojson "applicationName" _list path }
    : get_application_input)

let deregister_on_premises_instance_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_name = value_for_key instance_name_of_yojson "instanceName" _list path }
    : deregister_on_premises_instance_input)

let delete_resources_by_external_id_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_resources_by_external_id_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ external_id = option_of_yojson (value_for_key external_id_of_yojson "externalId") _list path }
    : delete_resources_by_external_id_input)

let invalid_git_hub_account_token_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_git_hub_account_token_name_exception)

let git_hub_account_token_name_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : git_hub_account_token_name_required_exception)

let git_hub_account_token_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : git_hub_account_token_does_not_exist_exception)

let delete_git_hub_account_token_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_name =
       option_of_yojson (value_for_key git_hub_account_token_name_of_yojson "tokenName") _list path;
   }
    : delete_git_hub_account_token_output)

let delete_git_hub_account_token_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token_name =
       option_of_yojson (value_for_key git_hub_account_token_name_of_yojson "tokenName") _list path;
   }
    : delete_git_hub_account_token_input)

let delete_deployment_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hooks_not_cleaned_up =
       option_of_yojson
         (value_for_key auto_scaling_group_list_of_yojson "hooksNotCleanedUp")
         _list path;
   }
    : delete_deployment_group_output)

let delete_deployment_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     deployment_group_name =
       value_for_key deployment_group_name_of_yojson "deploymentGroupName" _list path;
   }
    : delete_deployment_group_input)

let invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_operation_exception)

let deployment_config_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_config_in_use_exception)

let delete_deployment_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_config_name =
       value_for_key deployment_config_name_of_yojson "deploymentConfigName" _list path;
   }
    : delete_deployment_config_input)

let delete_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_name = value_for_key application_name_of_yojson "applicationName" _list path }
    : delete_application_input)

let role_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : role_required_exception)

let deployment_group_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_group_limit_exceeded_exception)

let create_deployment_group_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_group_id =
       option_of_yojson (value_for_key deployment_group_id_of_yojson "deploymentGroupId") _list path;
   }
    : create_deployment_group_output)

let create_deployment_group_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     deployment_group_name =
       value_for_key deployment_group_name_of_yojson "deploymentGroupName" _list path;
     deployment_config_name =
       option_of_yojson
         (value_for_key deployment_config_name_of_yojson "deploymentConfigName")
         _list path;
     ec2_tag_filters =
       option_of_yojson (value_for_key ec2_tag_filter_list_of_yojson "ec2TagFilters") _list path;
     on_premises_instance_tag_filters =
       option_of_yojson
         (value_for_key tag_filter_list_of_yojson "onPremisesInstanceTagFilters")
         _list path;
     auto_scaling_groups =
       option_of_yojson
         (value_for_key auto_scaling_group_name_list_of_yojson "autoScalingGroups")
         _list path;
     service_role_arn = value_for_key role_of_yojson "serviceRoleArn" _list path;
     trigger_configurations =
       option_of_yojson
         (value_for_key trigger_config_list_of_yojson "triggerConfigurations")
         _list path;
     alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "alarmConfiguration")
         _list path;
     auto_rollback_configuration =
       option_of_yojson
         (value_for_key auto_rollback_configuration_of_yojson "autoRollbackConfiguration")
         _list path;
     outdated_instances_strategy =
       option_of_yojson
         (value_for_key outdated_instances_strategy_of_yojson "outdatedInstancesStrategy")
         _list path;
     deployment_style =
       option_of_yojson (value_for_key deployment_style_of_yojson "deploymentStyle") _list path;
     blue_green_deployment_configuration =
       option_of_yojson
         (value_for_key blue_green_deployment_configuration_of_yojson
            "blueGreenDeploymentConfiguration")
         _list path;
     load_balancer_info =
       option_of_yojson (value_for_key load_balancer_info_of_yojson "loadBalancerInfo") _list path;
     ec2_tag_set = option_of_yojson (value_for_key ec2_tag_set_of_yojson "ec2TagSet") _list path;
     ecs_services =
       option_of_yojson (value_for_key ecs_service_list_of_yojson "ecsServices") _list path;
     on_premises_tag_set =
       option_of_yojson (value_for_key on_premises_tag_set_of_yojson "onPremisesTagSet") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     termination_hook_enabled =
       option_of_yojson
         (value_for_key nullable_boolean_of_yojson "terminationHookEnabled")
         _list path;
   }
    : create_deployment_group_input)

let invalid_zonal_deployment_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_zonal_deployment_configuration_exception)

let invalid_minimum_healthy_host_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_minimum_healthy_host_value_exception)

let deployment_config_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_config_limit_exceeded_exception)

let deployment_config_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_config_already_exists_exception)

let create_deployment_config_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_config_id =
       option_of_yojson
         (value_for_key deployment_config_id_of_yojson "deploymentConfigId")
         _list path;
   }
    : create_deployment_config_output)

let create_deployment_config_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_config_name =
       value_for_key deployment_config_name_of_yojson "deploymentConfigName" _list path;
     minimum_healthy_hosts =
       option_of_yojson
         (value_for_key minimum_healthy_hosts_of_yojson "minimumHealthyHosts")
         _list path;
     traffic_routing_config =
       option_of_yojson
         (value_for_key traffic_routing_config_of_yojson "trafficRoutingConfig")
         _list path;
     compute_platform =
       option_of_yojson (value_for_key compute_platform_of_yojson "computePlatform") _list path;
     zonal_config = option_of_yojson (value_for_key zonal_config_of_yojson "zonalConfig") _list path;
   }
    : create_deployment_config_input)

let invalid_update_outdated_instances_only_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_update_outdated_instances_only_value_exception)

let invalid_target_instances_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_target_instances_exception)

let invalid_ignore_application_stop_failures_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_ignore_application_stop_failures_value_exception)

let invalid_git_hub_account_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_git_hub_account_token_exception)

let invalid_file_exists_behavior_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_file_exists_behavior_exception)

let deployment_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_limit_exceeded_exception)

let create_deployment_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
   }
    : create_deployment_output)

let create_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     deployment_group_name =
       option_of_yojson
         (value_for_key deployment_group_name_of_yojson "deploymentGroupName")
         _list path;
     revision = option_of_yojson (value_for_key revision_location_of_yojson "revision") _list path;
     deployment_config_name =
       option_of_yojson
         (value_for_key deployment_config_name_of_yojson "deploymentConfigName")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     ignore_application_stop_failures =
       option_of_yojson
         (value_for_key boolean__of_yojson "ignoreApplicationStopFailures")
         _list path;
     target_instances =
       option_of_yojson (value_for_key target_instances_of_yojson "targetInstances") _list path;
     auto_rollback_configuration =
       option_of_yojson
         (value_for_key auto_rollback_configuration_of_yojson "autoRollbackConfiguration")
         _list path;
     update_outdated_instances_only =
       option_of_yojson (value_for_key boolean__of_yojson "updateOutdatedInstancesOnly") _list path;
     file_exists_behavior =
       option_of_yojson
         (value_for_key file_exists_behavior_of_yojson "fileExistsBehavior")
         _list path;
     override_alarm_configuration =
       option_of_yojson
         (value_for_key alarm_configuration_of_yojson "overrideAlarmConfiguration")
         _list path;
   }
    : create_deployment_input)

let create_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_id =
       option_of_yojson (value_for_key application_id_of_yojson "applicationId") _list path;
   }
    : create_application_output)

let create_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name = value_for_key application_name_of_yojson "applicationName" _list path;
     compute_platform =
       option_of_yojson (value_for_key compute_platform_of_yojson "computePlatform") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_application_input)

let invalid_deployment_wait_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_deployment_wait_type_exception)

let deployment_is_not_in_ready_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : deployment_is_not_in_ready_state_exception)

let deployment_wait_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "READY_WAIT" -> READY_WAIT
    | `String "TERMINATION_WAIT" -> TERMINATION_WAIT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeploymentWaitType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeploymentWaitType")
     : deployment_wait_type)
    : deployment_wait_type)

let continue_deployment_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_id =
       option_of_yojson (value_for_key deployment_id_of_yojson "deploymentId") _list path;
     deployment_wait_type =
       option_of_yojson
         (value_for_key deployment_wait_type_of_yojson "deploymentWaitType")
         _list path;
   }
    : continue_deployment_input)
