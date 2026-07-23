open Smaws_Lib.Json.SerializeHelpers
open Types

let duration_to_yojson = string_to_yojson

let execution_action_to_yojson (x : execution_action) =
  match x with
  | ACTIVATE -> `String "activate"
  | DEACTIVATE -> `String "deactivate"
  | POST_RECOVERY -> `String "postRecovery"

let execution_state_to_yojson (x : execution_state) =
  match x with
  | IN_PROGRESS -> `String "inProgress"
  | PAUSED_BY_FAILED_STEP -> `String "pausedByFailedStep"
  | PAUSED_BY_OPERATOR -> `String "pausedByOperator"
  | COMPLETED -> `String "completed"
  | COMPLETED_WITH_EXCEPTIONS -> `String "completedWithExceptions"
  | CANCELLED -> `String "canceled"
  | PLAN_EXECUTION_TIMED_OUT -> `String "planExecutionTimedOut"
  | PENDING_MANUAL_APPROVAL -> `String "pendingManualApproval"
  | FAILED -> `String "failed"
  | PENDING -> `String "pending"
  | COMPLETED_MONITORING_APPLICATION_HEALTH -> `String "completedMonitoringApplicationHealth"

let execution_mode_to_yojson (x : execution_mode) =
  match x with GRACEFUL -> `String "graceful" | UNGRACEFUL -> `String "ungraceful"

let execution_id_to_yojson = string_to_yojson
let plan_arn_to_yojson = string_to_yojson

let abbreviated_execution_to_yojson (x : abbreviated_execution) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("comment", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.comment);
      ( "startTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_time)
      );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ("mode", Some (execution_mode_to_yojson x.mode));
      ("executionState", Some (execution_state_to_yojson x.execution_state));
      ("executionAction", Some (execution_action_to_yojson x.execution_action));
      ( "executionRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.execution_region) );
      ( "recoveryExecutionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recovery_execution_id );
      ("actualRecoveryTime", option_to_yojson duration_to_yojson x.actual_recovery_time);
    ]

let abbreviated_executions_list_to_yojson tree = list_to_yojson abbreviated_execution_to_yojson tree
let region_to_yojson = string_to_yojson

let recovery_approach_to_yojson (x : recovery_approach) =
  match x with ACTIVE_ACTIVE -> `String "activeActive" | ACTIVE_PASSIVE -> `String "activePassive"

let region_list_to_yojson tree = list_to_yojson region_to_yojson tree
let plan_name_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson

let abbreviated_plan_to_yojson (x : abbreviated_plan) =
  assoc_to_yojson
    [
      ("arn", Some (plan_arn_to_yojson x.arn));
      ("owner", Some (account_id_to_yojson x.owner));
      ("name", Some (plan_name_to_yojson x.name));
      ("regions", Some (region_list_to_yojson x.regions));
      ("recoveryApproach", Some (recovery_approach_to_yojson x.recovery_approach));
      ("primaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "executionRole",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.execution_role );
      ("activePlanExecution", option_to_yojson execution_id_to_yojson x.active_plan_execution);
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let alarm_condition_to_yojson (x : alarm_condition) =
  match x with RED -> `String "red" | GREEN -> `String "green"

let alarm_type_to_yojson (x : alarm_type) =
  match x with APPLICATION_HEALTH -> `String "applicationHealth" | TRIGGER -> `String "trigger"

let approval_to_yojson (x : approval) =
  match x with APPROVE -> `String "approve" | DECLINE -> `String "decline"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let approve_plan_execution_step_response_to_yojson = unit_to_yojson
let execution_comment_to_yojson = string_to_yojson
let step_name_to_yojson = string_to_yojson

let approve_plan_execution_step_request_to_yojson (x : approve_plan_execution_step_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("stepName", Some (step_name_to_yojson x.step_name));
      ("approval", Some (approval_to_yojson x.approval));
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
    ]

let update_plan_execution_step_response_to_yojson = unit_to_yojson

let update_plan_execution_step_action_to_yojson (x : update_plan_execution_step_action) =
  match x with SWITCH_TO_UNGRACEFUL -> `String "switchToUngraceful" | SKIP -> `String "skip"

let update_plan_execution_step_request_to_yojson (x : update_plan_execution_step_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("comment", Some (execution_comment_to_yojson x.comment));
      ("stepName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.step_name));
      ("actionToTake", Some (update_plan_execution_step_action_to_yojson x.action_to_take));
    ]

let illegal_state_exception_to_yojson (x : illegal_state_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let update_plan_execution_response_to_yojson = unit_to_yojson

let update_plan_execution_action_to_yojson (x : update_plan_execution_action) =
  match x with
  | SWITCH_TO_GRACEFUL -> `String "switchToGraceful"
  | SWITCH_TO_UNGRACEFUL -> `String "switchToUngraceful"
  | PAUSE -> `String "pause"
  | RESUME -> `String "resume"

let update_plan_execution_request_to_yojson (x : update_plan_execution_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("action", Some (update_plan_execution_action_to_yojson x.action));
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
    ]

let illegal_argument_exception_to_yojson (x : illegal_argument_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let start_plan_execution_response_to_yojson (x : start_plan_execution_response) =
  assoc_to_yojson
    [
      ("executionId", option_to_yojson execution_id_to_yojson x.execution_id);
      ("plan", option_to_yojson plan_arn_to_yojson x.plan);
      ( "planVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.plan_version );
      ( "activateRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.activate_region
      );
      ( "deactivateRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.deactivate_region
      );
    ]

let recovery_execution_id_to_yojson = string_to_yojson

let start_plan_execution_request_to_yojson (x : start_plan_execution_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ( "targetRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.target_region) );
      ("action", Some (execution_action_to_yojson x.action));
      ("mode", option_to_yojson execution_mode_to_yojson x.mode);
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
      ( "latestVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.latest_version );
      ( "recoveryExecutionId",
        option_to_yojson recovery_execution_id_to_yojson x.recovery_execution_id );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let next_token_to_yojson = string_to_yojson

let route53_health_check_status_to_yojson (x : route53_health_check_status) =
  match x with
  | HEALTHY -> `String "healthy"
  | UNHEALTHY -> `String "unhealthy"
  | UNKNOWN -> `String "unknown"

let route53_health_check_id_to_yojson = string_to_yojson
let route53_record_name_to_yojson = string_to_yojson
let route53_hosted_zone_id_to_yojson = string_to_yojson

let route53_health_check_to_yojson (x : route53_health_check) =
  assoc_to_yojson
    [
      ("hostedZoneId", Some (route53_hosted_zone_id_to_yojson x.hosted_zone_id));
      ("recordName", Some (route53_record_name_to_yojson x.record_name));
      ("healthCheckId", option_to_yojson route53_health_check_id_to_yojson x.health_check_id);
      ("status", option_to_yojson route53_health_check_status_to_yojson x.status);
      ("region", Some (region_to_yojson x.region));
    ]

let route53_health_check_list_to_yojson tree = list_to_yojson route53_health_check_to_yojson tree

let list_route53_health_checks_in_region_response_to_yojson
    (x : list_route53_health_checks_in_region_response) =
  assoc_to_yojson
    [
      ("healthChecks", option_to_yojson route53_health_check_list_to_yojson x.health_checks);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_route53_health_checks_in_region_request_to_yojson
    (x : list_route53_health_checks_in_region_request) =
  assoc_to_yojson
    [
      ("arn", Some (plan_arn_to_yojson x.arn));
      ("hostedZoneId", option_to_yojson route53_hosted_zone_id_to_yojson x.hosted_zone_id);
      ("recordName", option_to_yojson route53_record_name_to_yojson x.record_name);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_route53_health_checks_response_to_yojson (x : list_route53_health_checks_response) =
  assoc_to_yojson
    [
      ("healthChecks", option_to_yojson route53_health_check_list_to_yojson x.health_checks);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_route53_health_checks_request_to_yojson (x : list_route53_health_checks_request) =
  assoc_to_yojson
    [
      ("arn", Some (plan_arn_to_yojson x.arn));
      ("hostedZoneId", option_to_yojson route53_hosted_zone_id_to_yojson x.hosted_zone_id);
      ("recordName", option_to_yojson route53_record_name_to_yojson x.record_name);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let plan_list_to_yojson tree = list_to_yojson abbreviated_plan_to_yojson tree

let list_plans_in_region_response_to_yojson (x : list_plans_in_region_response) =
  assoc_to_yojson
    [
      ("plans", option_to_yojson plan_list_to_yojson x.plans);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_plans_in_region_request_to_yojson (x : list_plans_in_region_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_plan_executions_response_to_yojson (x : list_plan_executions_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson abbreviated_executions_list_to_yojson x.items);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_executions_max_results_to_yojson = int_to_yojson

let list_plan_executions_request_to_yojson (x : list_plan_executions_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("maxResults", option_to_yojson list_executions_max_results_to_yojson x.max_results);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("state", option_to_yojson execution_state_to_yojson x.state);
    ]

let resources_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let execution_block_type_to_yojson (x : execution_block_type) =
  match x with
  | CUSTOM_ACTION_LAMBDA -> `String "CustomActionLambda"
  | EXECUTION_APPROVAL -> `String "ManualApproval"
  | AURORA -> `String "AuroraGlobalDatabase"
  | EC2_ASG -> `String "EC2AutoScaling"
  | ROUTING_CONTROL -> `String "ARCRoutingControl"
  | REGION_SWITCH -> `String "ARCRegionSwitchPlan"
  | PARALLEL -> `String "Parallel"
  | ECS -> `String "ECSServiceScaling"
  | EKS_RESOURCE_SCALING -> `String "EKSResourceScaling"
  | ROUTE53_HEALTH_CHECK -> `String "Route53HealthCheck"
  | DOCUMENTDB -> `String "DocumentDb"
  | RDS_PROMOTE_READ_REPLICA -> `String "RdsPromoteReadReplica"
  | RDS_CREATE_CROSS_REGION_REPLICA -> `String "RdsCreateCrossRegionReplica"
  | LAMBDA_EVENT_SOURCE_MAPPING -> `String "LambdaEventSourceMapping"
  | AURORA_SERVERLESS_SCALING -> `String "AuroraServerlessScaling"
  | AURORA_PROVISIONED_SCALING -> `String "AuroraProvisionedScaling"
  | NEPTUNE -> `String "NeptuneGlobalDatabase"

let execution_event_type_to_yojson (x : execution_event_type) =
  match x with
  | UNKNOWN -> `String "unknown"
  | EXECUTION_PENDING -> `String "executionPending"
  | EXECUTION_STARTED -> `String "executionStarted"
  | EXECUTION_SUCCEEDED -> `String "executionSucceeded"
  | EXECUTION_FAILED -> `String "executionFailed"
  | EXECUTION_PAUSING -> `String "executionPausing"
  | EXECUTION_PAUSED -> `String "executionPaused"
  | EXECUTION_CANCELING -> `String "executionCanceling"
  | EXECUTION_CANCELED -> `String "executionCanceled"
  | EXECUTION_PENDING_APPROVAL -> `String "executionPendingApproval"
  | EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL -> `String "executionBehaviorChangedToUngraceful"
  | EXECUTION_BEHAVIOR_CHANGED_TO_GRACEFUL -> `String "executionBehaviorChangedToGraceful"
  | EXECUTION_PENDING_CHILD_PLAN_MANUAL_APPROVAL ->
      `String "executionPendingChildPlanManualApproval"
  | EXECUTION_SUCCESS_MONITORING_APPLICATION_HEALTH ->
      `String "executionSuccessMonitoringApplicationHealth"
  | STEP_STARTED -> `String "stepStarted"
  | STEP_UPDATE -> `String "stepUpdate"
  | STEP_SUCCEEDED -> `String "stepSucceeded"
  | STEP_FAILED -> `String "stepFailed"
  | STEP_SKIPPED -> `String "stepSkipped"
  | STEP_PAUSED_BY_ERROR -> `String "stepPausedByError"
  | STEP_PAUSED_BY_OPERATOR -> `String "stepPausedByOperator"
  | STEP_CANCELED -> `String "stepCanceled"
  | STEP_PENDING_APPROVAL -> `String "stepPendingApproval"
  | STEP_EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL ->
      `String "stepExecutionBehaviorChangedToUngraceful"
  | STEP_PENDING_APPLICATION_HEALTH_MONITOR -> `String "stepPendingApplicationHealthMonitor"
  | PLAN_EVALUATION_WARNING -> `String "planEvaluationWarning"

let execution_event_to_yojson (x : execution_event) =
  assoc_to_yojson
    [
      ( "timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.timestamp );
      ("type", option_to_yojson execution_event_type_to_yojson x.type_);
      ("stepName", option_to_yojson step_name_to_yojson x.step_name);
      ("executionBlockType", option_to_yojson execution_block_type_to_yojson x.execution_block_type);
      ("resources", option_to_yojson resources_to_yojson x.resources);
      ("error", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("eventId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_id));
      ( "previousEventId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.previous_event_id
      );
    ]

let execution_event_list_to_yojson tree = list_to_yojson execution_event_to_yojson tree

let list_plan_execution_events_response_to_yojson (x : list_plan_execution_events_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson execution_event_list_to_yojson x.items);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_execution_events_max_results_to_yojson = int_to_yojson

let list_plan_execution_events_request_to_yojson (x : list_plan_execution_events_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("maxResults", option_to_yojson list_execution_events_max_results_to_yojson x.max_results);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("name", option_to_yojson step_name_to_yojson x.name);
    ]

let s3_report_output_configuration_to_yojson (x : s3_report_output_configuration) =
  assoc_to_yojson
    [
      ( "bucketPath",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bucket_path );
      ("bucketOwner", option_to_yojson account_id_to_yojson x.bucket_owner);
    ]

let report_output_configuration_to_yojson (x : report_output_configuration) =
  match x with
  | S3Configuration arg ->
      assoc_to_yojson [ ("s3Configuration", Some (s3_report_output_configuration_to_yojson arg)) ]

let report_output_list_to_yojson tree = list_to_yojson report_output_configuration_to_yojson tree

let report_configuration_to_yojson (x : report_configuration) =
  assoc_to_yojson
    [ ("reportOutput", option_to_yojson report_output_list_to_yojson x.report_output) ]

let trigger_condition_to_yojson (x : trigger_condition) =
  assoc_to_yojson
    [
      ( "associatedAlarmName",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.associated_alarm_name) );
      ("condition", Some (alarm_condition_to_yojson x.condition));
    ]

let trigger_condition_list_to_yojson tree = list_to_yojson trigger_condition_to_yojson tree

let workflow_target_action_to_yojson (x : workflow_target_action) =
  match x with
  | ACTIVATE -> `String "activate"
  | DEACTIVATE -> `String "deactivate"
  | POST_RECOVERY -> `String "postRecovery"

let trigger_to_yojson (x : trigger) =
  assoc_to_yojson
    [
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("targetRegion", Some (region_to_yojson x.target_region));
      ("action", Some (workflow_target_action_to_yojson x.action));
      ("conditions", Some (trigger_condition_list_to_yojson x.conditions));
      ( "minDelayMinutesBetweenExecutions",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
             x.min_delay_minutes_between_executions) );
    ]

let trigger_list_to_yojson tree = list_to_yojson trigger_to_yojson tree
let iam_role_arn_to_yojson = string_to_yojson

let associated_alarm_to_yojson (x : associated_alarm) =
  assoc_to_yojson
    [
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ( "resourceIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_identifier) );
      ("alarmType", Some (alarm_type_to_yojson x.alarm_type));
    ]

let associated_alarm_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson associated_alarm_to_yojson
    tree

let neptune_cluster_arn_to_yojson = string_to_yojson

let region_neptune_cluster_arn_map_to_yojson tree =
  map_to_yojson region_to_yojson neptune_cluster_arn_to_yojson tree

let neptune_global_cluster_identifier_to_yojson = string_to_yojson

let neptune_ungraceful_behavior_to_yojson (x : neptune_ungraceful_behavior) =
  match x with FAILOVER -> `String "failover"

let neptune_ungraceful_to_yojson (x : neptune_ungraceful) =
  assoc_to_yojson
    [ ("ungraceful", option_to_yojson neptune_ungraceful_behavior_to_yojson x.ungraceful) ]

let neptune_default_behavior_to_yojson (x : neptune_default_behavior) =
  match x with SWITCHOVER_ONLY -> `String "switchoverOnly" | FAILOVER -> `String "failover"

let neptune_global_database_configuration_to_yojson (x : neptune_global_database_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("behavior", Some (neptune_default_behavior_to_yojson x.behavior));
      ("ungraceful", option_to_yojson neptune_ungraceful_to_yojson x.ungraceful);
      ( "globalClusterIdentifier",
        Some (neptune_global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ( "regionDatabaseClusterArns",
        Some (region_neptune_cluster_arn_map_to_yojson x.region_database_cluster_arns) );
    ]

let aurora_instance_arn_to_yojson = string_to_yojson

let region_aurora_instance_arn_map_to_yojson tree =
  map_to_yojson region_to_yojson aurora_instance_arn_to_yojson tree

let aurora_cluster_arn_to_yojson = string_to_yojson

let region_aurora_cluster_map_to_yojson tree =
  map_to_yojson region_to_yojson aurora_cluster_arn_to_yojson tree

let global_cluster_identifier_to_yojson = string_to_yojson

let aurora_provisioned_scaling_configuration_to_yojson
    (x : aurora_provisioned_scaling_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ( "globalClusterIdentifier",
        Some (global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ( "regionDatabaseClusterArns",
        Some (region_aurora_cluster_map_to_yojson x.region_database_cluster_arns) );
      ("instanceArns", Some (region_aurora_instance_arn_map_to_yojson x.instance_arns));
    ]

let aurora_serverless_scaling_configuration_to_yojson (x : aurora_serverless_scaling_configuration)
    =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ( "globalClusterIdentifier",
        Some (global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ( "regionDatabaseClusterArns",
        Some (region_aurora_cluster_map_to_yojson x.region_database_cluster_arns) );
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
    ]

let lambda_event_source_mapping_ungraceful_behavior_to_yojson
    (x : lambda_event_source_mapping_ungraceful_behavior) =
  match x with SKIP -> `String "skip"

let lambda_event_source_mapping_ungraceful_to_yojson (x : lambda_event_source_mapping_ungraceful) =
  assoc_to_yojson
    [
      ( "behavior",
        option_to_yojson lambda_event_source_mapping_ungraceful_behavior_to_yojson x.behavior );
    ]

let event_source_mapping_arn_to_yojson = string_to_yojson

let event_source_mapping_to_yojson (x : event_source_mapping) =
  assoc_to_yojson
    [
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("arn", Some (event_source_mapping_arn_to_yojson x.arn));
    ]

let region_event_source_mapping_map_to_yojson tree =
  map_to_yojson region_to_yojson event_source_mapping_to_yojson tree

let event_source_mapping_action_to_yojson (x : event_source_mapping_action) =
  match x with ENABLE -> `String "enable" | DISABLE -> `String "disable"

let lambda_event_source_mapping_configuration_to_yojson
    (x : lambda_event_source_mapping_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("action", Some (event_source_mapping_action_to_yojson x.action));
      ( "regionEventSourceMappings",
        Some (region_event_source_mapping_map_to_yojson x.region_event_source_mappings) );
      ("ungraceful", option_to_yojson lambda_event_source_mapping_ungraceful_to_yojson x.ungraceful);
    ]

let rds_db_instance_arn_to_yojson = string_to_yojson

let rds_db_instance_arn_map_to_yojson tree =
  map_to_yojson region_to_yojson rds_db_instance_arn_to_yojson tree

let rds_create_cross_region_replica_configuration_to_yojson
    (x : rds_create_cross_region_replica_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("dbInstanceArnMap", Some (rds_db_instance_arn_map_to_yojson x.db_instance_arn_map));
    ]

let rds_promote_read_replica_configuration_to_yojson (x : rds_promote_read_replica_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("dbInstanceArnMap", Some (rds_db_instance_arn_map_to_yojson x.db_instance_arn_map));
    ]

let document_db_cluster_arn_to_yojson = string_to_yojson
let document_db_cluster_arns_to_yojson tree = list_to_yojson document_db_cluster_arn_to_yojson tree
let document_db_global_cluster_identifier_to_yojson = string_to_yojson

let document_db_ungraceful_behavior_to_yojson (x : document_db_ungraceful_behavior) =
  match x with FAILOVER -> `String "failover"

let document_db_ungraceful_to_yojson (x : document_db_ungraceful) =
  assoc_to_yojson
    [ ("ungraceful", option_to_yojson document_db_ungraceful_behavior_to_yojson x.ungraceful) ]

let document_db_default_behavior_to_yojson (x : document_db_default_behavior) =
  match x with SWITCHOVER_ONLY -> `String "switchoverOnly" | FAILOVER -> `String "failover"

let document_db_configuration_to_yojson (x : document_db_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("behavior", Some (document_db_default_behavior_to_yojson x.behavior));
      ("ungraceful", option_to_yojson document_db_ungraceful_to_yojson x.ungraceful);
      ( "globalClusterIdentifier",
        Some (document_db_global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ("databaseClusterArns", Some (document_db_cluster_arns_to_yojson x.database_cluster_arns));
    ]

let route53_resource_record_set_identifier_to_yojson = string_to_yojson

let route53_resource_record_set_to_yojson (x : route53_resource_record_set) =
  assoc_to_yojson
    [
      ( "recordSetIdentifier",
        option_to_yojson route53_resource_record_set_identifier_to_yojson x.record_set_identifier );
      ("region", option_to_yojson region_to_yojson x.region);
    ]

let route53_resource_record_set_list_to_yojson tree =
  list_to_yojson route53_resource_record_set_to_yojson tree

let route53_health_check_configuration_to_yojson (x : route53_health_check_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("hostedZoneId", Some (route53_hosted_zone_id_to_yojson x.hosted_zone_id));
      ("recordName", Some (route53_record_name_to_yojson x.record_name));
      ("recordSets", option_to_yojson route53_resource_record_set_list_to_yojson x.record_sets);
    ]

let eks_capacity_monitoring_approach_to_yojson (x : eks_capacity_monitoring_approach) =
  match x with SAMPLED_MAX_IN_LAST_24_HOURS -> `String "sampledMaxInLast24Hours"

let eks_resource_scaling_ungraceful_to_yojson (x : eks_resource_scaling_ungraceful) =
  assoc_to_yojson
    [
      ( "minimumSuccessPercentage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.minimum_success_percentage)
      );
    ]

let eks_cluster_arn_to_yojson = string_to_yojson

let eks_cluster_to_yojson (x : eks_cluster) =
  assoc_to_yojson
    [
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("clusterArn", Some (eks_cluster_arn_to_yojson x.cluster_arn));
    ]

let eks_clusters_to_yojson tree = list_to_yojson eks_cluster_to_yojson tree
let kubernetes_namespace_to_yojson = string_to_yojson

let kubernetes_scaling_resource_to_yojson (x : kubernetes_scaling_resource) =
  assoc_to_yojson
    [
      ("namespace", Some (kubernetes_namespace_to_yojson x.namespace));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ( "hpaName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hpa_name );
    ]

let regional_scaling_resource_to_yojson tree =
  map_to_yojson region_to_yojson kubernetes_scaling_resource_to_yojson tree

let kubernetes_scaling_application_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    regional_scaling_resource_to_yojson tree

let kubernetes_scaling_apps_to_yojson tree =
  list_to_yojson kubernetes_scaling_application_to_yojson tree

let kubernetes_resource_type_to_yojson (x : kubernetes_resource_type) =
  assoc_to_yojson
    [
      ("apiVersion", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.api_version));
      ("kind", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kind));
    ]

let eks_resource_scaling_configuration_to_yojson (x : eks_resource_scaling_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ( "kubernetesResourceType",
        Some (kubernetes_resource_type_to_yojson x.kubernetes_resource_type) );
      ("scalingResources", option_to_yojson kubernetes_scaling_apps_to_yojson x.scaling_resources);
      ("eksClusters", option_to_yojson eks_clusters_to_yojson x.eks_clusters);
      ("ungraceful", option_to_yojson eks_resource_scaling_ungraceful_to_yojson x.ungraceful);
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
      ( "capacityMonitoringApproach",
        option_to_yojson eks_capacity_monitoring_approach_to_yojson x.capacity_monitoring_approach
      );
    ]

let ecs_capacity_monitoring_approach_to_yojson (x : ecs_capacity_monitoring_approach) =
  match x with
  | SAMPLED_MAX_IN_LAST_24_HOURS -> `String "sampledMaxInLast24Hours"
  | CONTAINER_INSIGHTS_MAX_IN_LAST_24_HOURS -> `String "containerInsightsMaxInLast24Hours"

let ecs_ungraceful_to_yojson (x : ecs_ungraceful) =
  assoc_to_yojson
    [
      ( "minimumSuccessPercentage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.minimum_success_percentage)
      );
    ]

let ecs_service_arn_to_yojson = string_to_yojson
let ecs_cluster_arn_to_yojson = string_to_yojson

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("clusterArn", option_to_yojson ecs_cluster_arn_to_yojson x.cluster_arn);
      ("serviceArn", option_to_yojson ecs_service_arn_to_yojson x.service_arn);
    ]

let service_list_to_yojson tree = list_to_yojson service_to_yojson tree

let ecs_capacity_increase_configuration_to_yojson (x : ecs_capacity_increase_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("services", Some (service_list_to_yojson x.services));
      ("ungraceful", option_to_yojson ecs_ungraceful_to_yojson x.ungraceful);
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
      ( "capacityMonitoringApproach",
        option_to_yojson ecs_capacity_monitoring_approach_to_yojson x.capacity_monitoring_approach
      );
    ]

let region_switch_plan_configuration_to_yojson (x : region_switch_plan_configuration) =
  assoc_to_yojson
    [
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("arn", Some (plan_arn_to_yojson x.arn));
    ]

let aurora_cluster_arns_to_yojson tree = list_to_yojson aurora_cluster_arn_to_yojson tree

let global_aurora_ungraceful_behavior_to_yojson (x : global_aurora_ungraceful_behavior) =
  match x with FAILOVER -> `String "failover"

let global_aurora_ungraceful_to_yojson (x : global_aurora_ungraceful) =
  assoc_to_yojson
    [ ("ungraceful", option_to_yojson global_aurora_ungraceful_behavior_to_yojson x.ungraceful) ]

let global_aurora_default_behavior_to_yojson (x : global_aurora_default_behavior) =
  match x with SWITCHOVER_ONLY -> `String "switchoverOnly" | FAILOVER -> `String "failover"

let global_aurora_configuration_to_yojson (x : global_aurora_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("behavior", Some (global_aurora_default_behavior_to_yojson x.behavior));
      ("ungraceful", option_to_yojson global_aurora_ungraceful_to_yojson x.ungraceful);
      ( "globalClusterIdentifier",
        Some (global_cluster_identifier_to_yojson x.global_cluster_identifier) );
      ("databaseClusterArns", Some (aurora_cluster_arns_to_yojson x.database_cluster_arns));
    ]

let routing_control_state_change_to_yojson (x : routing_control_state_change) =
  match x with ON -> `String "On" | OFF -> `String "Off"

let routing_control_arn_to_yojson = string_to_yojson

let arc_routing_control_state_to_yojson (x : arc_routing_control_state) =
  assoc_to_yojson
    [
      ("routingControlArn", Some (routing_control_arn_to_yojson x.routing_control_arn));
      ("state", Some (routing_control_state_change_to_yojson x.state));
    ]

let arc_routing_control_states_to_yojson tree =
  list_to_yojson arc_routing_control_state_to_yojson tree

let region_and_routing_controls_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    arc_routing_control_states_to_yojson tree

let arc_routing_control_configuration_to_yojson (x : arc_routing_control_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ( "regionAndRoutingControls",
        Some (region_and_routing_controls_to_yojson x.region_and_routing_controls) );
    ]

let role_arn_to_yojson = string_to_yojson

let execution_approval_configuration_to_yojson (x : execution_approval_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("approvalRole", Some (role_arn_to_yojson x.approval_role));
    ]

let ec2_asg_capacity_monitoring_approach_to_yojson (x : ec2_asg_capacity_monitoring_approach) =
  match x with
  | SAMPLED_MAX_IN_LAST_24_HOURS -> `String "sampledMaxInLast24Hours"
  | AUTOSCALING_MAX_IN_LAST_24_HOURS -> `String "autoscalingMaxInLast24Hours"

let ec2_ungraceful_to_yojson (x : ec2_ungraceful) =
  assoc_to_yojson
    [
      ( "minimumSuccessPercentage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.minimum_success_percentage)
      );
    ]

let asg_arn_to_yojson = string_to_yojson

let asg_to_yojson (x : asg) =
  assoc_to_yojson
    [
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("arn", option_to_yojson asg_arn_to_yojson x.arn);
    ]

let asg_list_to_yojson tree = list_to_yojson asg_to_yojson tree

let ec2_asg_capacity_increase_configuration_to_yojson (x : ec2_asg_capacity_increase_configuration)
    =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("asgs", Some (asg_list_to_yojson x.asgs));
      ("ungraceful", option_to_yojson ec2_ungraceful_to_yojson x.ungraceful);
      ( "targetPercent",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.target_percent );
      ( "capacityMonitoringApproach",
        option_to_yojson ec2_asg_capacity_monitoring_approach_to_yojson
          x.capacity_monitoring_approach );
    ]

let lambda_ungraceful_behavior_to_yojson (x : lambda_ungraceful_behavior) =
  match x with SKIP -> `String "skip"

let lambda_ungraceful_to_yojson (x : lambda_ungraceful) =
  assoc_to_yojson [ ("behavior", option_to_yojson lambda_ungraceful_behavior_to_yojson x.behavior) ]

let region_to_run_in_to_yojson (x : region_to_run_in) =
  match x with
  | ACTIVATING_REGION -> `String "activatingRegion"
  | DEACTIVATING_REGION -> `String "deactivatingRegion"
  | ACTIVE_REGION -> `String "activeRegion"
  | INACTIVE_REGION -> `String "inactiveRegion"

let lambda_arn_to_yojson = string_to_yojson

let lambdas_to_yojson (x : lambdas) =
  assoc_to_yojson
    [
      ("crossAccountRole", option_to_yojson iam_role_arn_to_yojson x.cross_account_role);
      ( "externalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.external_id );
      ("arn", option_to_yojson lambda_arn_to_yojson x.arn);
    ]

let lambda_list_to_yojson tree = list_to_yojson lambdas_to_yojson tree

let custom_action_lambda_configuration_to_yojson (x : custom_action_lambda_configuration) =
  assoc_to_yojson
    [
      ( "timeoutMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout_minutes
      );
      ("lambdas", Some (lambda_list_to_yojson x.lambdas));
      ( "retryIntervalMinutes",
        Some (Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.retry_interval_minutes) );
      ("regionToRun", Some (region_to_run_in_to_yojson x.region_to_run));
      ("ungraceful", option_to_yojson lambda_ungraceful_to_yojson x.ungraceful);
    ]

let rec steps_to_yojson tree = list_to_yojson step_to_yojson tree

and step_to_yojson (x : step) =
  assoc_to_yojson
    [
      ("name", Some (step_name_to_yojson x.name));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "executionBlockConfiguration",
        Some (execution_block_configuration_to_yojson x.execution_block_configuration) );
      ("executionBlockType", Some (execution_block_type_to_yojson x.execution_block_type));
    ]

and parallel_execution_block_configuration_to_yojson (x : parallel_execution_block_configuration) =
  assoc_to_yojson [ ("steps", Some (steps_to_yojson x.steps)) ]

and execution_block_configuration_to_yojson (x : execution_block_configuration) =
  match x with
  | CustomActionLambdaConfig arg ->
      assoc_to_yojson
        [ ("customActionLambdaConfig", Some (custom_action_lambda_configuration_to_yojson arg)) ]
  | Ec2AsgCapacityIncreaseConfig arg ->
      assoc_to_yojson
        [
          ( "ec2AsgCapacityIncreaseConfig",
            Some (ec2_asg_capacity_increase_configuration_to_yojson arg) );
        ]
  | ExecutionApprovalConfig arg ->
      assoc_to_yojson
        [ ("executionApprovalConfig", Some (execution_approval_configuration_to_yojson arg)) ]
  | ArcRoutingControlConfig arg ->
      assoc_to_yojson
        [ ("arcRoutingControlConfig", Some (arc_routing_control_configuration_to_yojson arg)) ]
  | GlobalAuroraConfig arg ->
      assoc_to_yojson [ ("globalAuroraConfig", Some (global_aurora_configuration_to_yojson arg)) ]
  | ParallelConfig arg ->
      assoc_to_yojson
        [ ("parallelConfig", Some (parallel_execution_block_configuration_to_yojson arg)) ]
  | RegionSwitchPlanConfig arg ->
      assoc_to_yojson
        [ ("regionSwitchPlanConfig", Some (region_switch_plan_configuration_to_yojson arg)) ]
  | EcsCapacityIncreaseConfig arg ->
      assoc_to_yojson
        [ ("ecsCapacityIncreaseConfig", Some (ecs_capacity_increase_configuration_to_yojson arg)) ]
  | EksResourceScalingConfig arg ->
      assoc_to_yojson
        [ ("eksResourceScalingConfig", Some (eks_resource_scaling_configuration_to_yojson arg)) ]
  | Route53HealthCheckConfig arg ->
      assoc_to_yojson
        [ ("route53HealthCheckConfig", Some (route53_health_check_configuration_to_yojson arg)) ]
  | DocumentDbConfig arg ->
      assoc_to_yojson [ ("documentDbConfig", Some (document_db_configuration_to_yojson arg)) ]
  | RdsPromoteReadReplicaConfig arg ->
      assoc_to_yojson
        [
          ( "rdsPromoteReadReplicaConfig",
            Some (rds_promote_read_replica_configuration_to_yojson arg) );
        ]
  | RdsCreateCrossRegionReadReplicaConfig arg ->
      assoc_to_yojson
        [
          ( "rdsCreateCrossRegionReadReplicaConfig",
            Some (rds_create_cross_region_replica_configuration_to_yojson arg) );
        ]
  | LambdaEventSourceMappingConfig arg ->
      assoc_to_yojson
        [
          ( "lambdaEventSourceMappingConfig",
            Some (lambda_event_source_mapping_configuration_to_yojson arg) );
        ]
  | AuroraServerlessScalingConfig arg ->
      assoc_to_yojson
        [
          ( "auroraServerlessScalingConfig",
            Some (aurora_serverless_scaling_configuration_to_yojson arg) );
        ]
  | AuroraProvisionedScalingConfig arg ->
      assoc_to_yojson
        [
          ( "auroraProvisionedScalingConfig",
            Some (aurora_provisioned_scaling_configuration_to_yojson arg) );
        ]
  | NeptuneGlobalDatabaseConfig arg ->
      assoc_to_yojson
        [
          ("neptuneGlobalDatabaseConfig", Some (neptune_global_database_configuration_to_yojson arg));
        ]

let workflow_to_yojson (x : workflow) =
  assoc_to_yojson
    [
      ("steps", option_to_yojson steps_to_yojson x.steps);
      ("workflowTargetAction", Some (workflow_target_action_to_yojson x.workflow_target_action));
      ("workflowTargetRegion", option_to_yojson region_to_yojson x.workflow_target_region);
      ( "workflowDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.workflow_description );
    ]

let workflow_list_to_yojson tree = list_to_yojson workflow_to_yojson tree

let plan_to_yojson (x : plan) =
  assoc_to_yojson
    [
      ("arn", Some (plan_arn_to_yojson x.arn));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("workflows", Some (workflow_list_to_yojson x.workflows));
      ("executionRole", Some (iam_role_arn_to_yojson x.execution_role));
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
      ("associatedAlarms", option_to_yojson associated_alarm_map_to_yojson x.associated_alarms);
      ("triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("reportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
      ("name", Some (plan_name_to_yojson x.name));
      ("regions", Some (region_list_to_yojson x.regions));
      ("recoveryApproach", Some (recovery_approach_to_yojson x.recovery_approach));
      ("primaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ("owner", Some (account_id_to_yojson x.owner));
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let get_plan_in_region_response_to_yojson (x : get_plan_in_region_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let get_plan_in_region_request_to_yojson (x : get_plan_in_region_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let failed_report_error_code_to_yojson (x : failed_report_error_code) =
  match x with
  | INSUFFICIENT_PERMISSIONS -> `String "insufficientPermissions"
  | INVALID_RESOURCE -> `String "invalidResource"
  | CONFIGURATION_ERROR -> `String "configurationError"

let failed_report_output_to_yojson (x : failed_report_output) =
  assoc_to_yojson
    [
      ("errorCode", option_to_yojson failed_report_error_code_to_yojson x.error_code);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
    ]

let s3_report_output_to_yojson (x : s3_report_output) =
  assoc_to_yojson
    [
      ( "s3ObjectKey",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.s3_object_key );
    ]

let report_output_to_yojson (x : report_output) =
  match x with
  | S3ReportOutput arg ->
      assoc_to_yojson [ ("s3ReportOutput", Some (s3_report_output_to_yojson arg)) ]
  | FailedReportOutput arg ->
      assoc_to_yojson [ ("failedReportOutput", Some (failed_report_output_to_yojson arg)) ]

let generated_report_to_yojson (x : generated_report) =
  assoc_to_yojson
    [
      ( "reportGenerationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.report_generation_time );
      ("reportOutput", option_to_yojson report_output_to_yojson x.report_output);
    ]

let generated_report_details_to_yojson tree = list_to_yojson generated_report_to_yojson tree

let step_status_to_yojson (x : step_status) =
  match x with
  | NOT_STARTED -> `String "notStarted"
  | RUNNING -> `String "running"
  | FAILED -> `String "failed"
  | COMPLETED -> `String "completed"
  | CANCELLED -> `String "canceled"
  | SKIPPED -> `String "skipped"
  | PENDING_APPROVAL -> `String "pendingApproval"

let step_state_to_yojson (x : step_state) =
  assoc_to_yojson
    [
      ("name", option_to_yojson step_name_to_yojson x.name);
      ("status", option_to_yojson step_status_to_yojson x.status);
      ( "startTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ("stepMode", option_to_yojson execution_mode_to_yojson x.step_mode);
    ]

let step_states_to_yojson tree = list_to_yojson step_state_to_yojson tree

let get_plan_execution_response_to_yojson (x : get_plan_execution_response) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("version", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version);
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("comment", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.comment);
      ( "startTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_time)
      );
      ( "endTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time );
      ("mode", Some (execution_mode_to_yojson x.mode));
      ("executionState", Some (execution_state_to_yojson x.execution_state));
      ("executionAction", Some (execution_action_to_yojson x.execution_action));
      ( "executionRegion",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.execution_region) );
      ( "recoveryExecutionId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recovery_execution_id );
      ("stepStates", option_to_yojson step_states_to_yojson x.step_states);
      ("plan", option_to_yojson plan_to_yojson x.plan);
      ("actualRecoveryTime", option_to_yojson duration_to_yojson x.actual_recovery_time);
      ( "generatedReportDetails",
        option_to_yojson generated_report_details_to_yojson x.generated_report_details );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let get_plan_execution_step_states_max_results_to_yojson = int_to_yojson

let get_plan_execution_request_to_yojson (x : get_plan_execution_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ( "maxResults",
        option_to_yojson get_plan_execution_step_states_max_results_to_yojson x.max_results );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let resource_warning_status_to_yojson (x : resource_warning_status) =
  match x with ACTIVE -> `String "active" | RESOLVED -> `String "resolved"

let resource_arn_to_yojson = string_to_yojson

let minimal_workflow_to_yojson (x : minimal_workflow) =
  assoc_to_yojson
    [
      ("action", option_to_yojson execution_action_to_yojson x.action);
      ("name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
    ]

let resource_warning_to_yojson (x : resource_warning) =
  assoc_to_yojson
    [
      ("workflow", option_to_yojson minimal_workflow_to_yojson x.workflow);
      ("version", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.version));
      ("stepName", option_to_yojson step_name_to_yojson x.step_name);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("warningStatus", Some (resource_warning_status_to_yojson x.warning_status));
      ( "warningUpdatedTime",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.warning_updated_time) );
      ( "warningMessage",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.warning_message) );
    ]

let plan_warnings_to_yojson tree = list_to_yojson resource_warning_to_yojson tree

let evaluation_status_to_yojson (x : evaluation_status) =
  match x with
  | PASSED -> `String "passed"
  | ACTION_REQUIRED -> `String "actionRequired"
  | PENDING_EVALUATION -> `String "pendingEvaluation"
  | UNKNOWN -> `String "unknown"

let get_plan_evaluation_status_response_to_yojson (x : get_plan_evaluation_status_response) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ( "lastEvaluationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_evaluation_time );
      ( "lastEvaluatedVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_evaluated_version );
      ("region", option_to_yojson region_to_yojson x.region);
      ("evaluationState", option_to_yojson evaluation_status_to_yojson x.evaluation_state);
      ("warnings", option_to_yojson plan_warnings_to_yojson x.warnings);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_plan_evaluation_status_request_to_yojson (x : get_plan_evaluation_status_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let cancel_plan_execution_response_to_yojson = unit_to_yojson

let cancel_plan_execution_request_to_yojson (x : cancel_plan_execution_request) =
  assoc_to_yojson
    [
      ("planArn", Some (plan_arn_to_yojson x.plan_arn));
      ("executionId", Some (execution_id_to_yojson x.execution_id));
      ("comment", option_to_yojson execution_comment_to_yojson x.comment);
    ]

let create_plan_response_to_yojson (x : create_plan_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let create_plan_request_to_yojson (x : create_plan_request) =
  assoc_to_yojson
    [
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("workflows", Some (workflow_list_to_yojson x.workflows));
      ("executionRole", Some (iam_role_arn_to_yojson x.execution_role));
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
      ("associatedAlarms", option_to_yojson associated_alarm_map_to_yojson x.associated_alarms);
      ("triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("reportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
      ("name", Some (plan_name_to_yojson x.name));
      ("regions", Some (region_list_to_yojson x.regions));
      ("recoveryApproach", Some (recovery_approach_to_yojson x.recovery_approach));
      ("primaryRegion", option_to_yojson region_to_yojson x.primary_region);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let delete_plan_response_to_yojson = unit_to_yojson

let delete_plan_request_to_yojson (x : delete_plan_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let get_plan_response_to_yojson (x : get_plan_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let get_plan_request_to_yojson (x : get_plan_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let list_plans_response_to_yojson (x : list_plans_response) =
  assoc_to_yojson
    [
      ("plans", option_to_yojson plan_list_to_yojson x.plans);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_plans_request_to_yojson (x : list_plans_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson tags_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("arn", Some (plan_arn_to_yojson x.arn)) ]

let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("arn", Some (plan_arn_to_yojson x.arn)); ("tags", Some (tags_to_yojson x.tags)) ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("arn", Some (plan_arn_to_yojson x.arn));
      ("resourceTagKeys", Some (tag_keys_to_yojson x.resource_tag_keys));
    ]

let update_plan_response_to_yojson (x : update_plan_response) =
  assoc_to_yojson [ ("plan", option_to_yojson plan_to_yojson x.plan) ]

let update_plan_request_to_yojson (x : update_plan_request) =
  assoc_to_yojson
    [
      ("arn", Some (plan_arn_to_yojson x.arn));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("workflows", Some (workflow_list_to_yojson x.workflows));
      ("executionRole", Some (iam_role_arn_to_yojson x.execution_role));
      ( "recoveryTimeObjectiveMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recovery_time_objective_minutes );
      ("associatedAlarms", option_to_yojson associated_alarm_map_to_yojson x.associated_alarms);
      ("triggers", option_to_yojson trigger_list_to_yojson x.triggers);
      ("reportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
    ]
