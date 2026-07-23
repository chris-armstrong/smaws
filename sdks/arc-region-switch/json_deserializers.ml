open Smaws_Lib.Json.DeserializeHelpers
open Types

let duration_of_yojson = string_of_yojson

let execution_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "activate" -> ACTIVATE
    | `String "deactivate" -> DEACTIVATE
    | `String "postRecovery" -> POST_RECOVERY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionAction")
     : execution_action)
    : execution_action)

let execution_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "inProgress" -> IN_PROGRESS
    | `String "pausedByFailedStep" -> PAUSED_BY_FAILED_STEP
    | `String "pausedByOperator" -> PAUSED_BY_OPERATOR
    | `String "completed" -> COMPLETED
    | `String "completedWithExceptions" -> COMPLETED_WITH_EXCEPTIONS
    | `String "canceled" -> CANCELLED
    | `String "planExecutionTimedOut" -> PLAN_EXECUTION_TIMED_OUT
    | `String "pendingManualApproval" -> PENDING_MANUAL_APPROVAL
    | `String "failed" -> FAILED
    | `String "pending" -> PENDING
    | `String "completedMonitoringApplicationHealth" -> COMPLETED_MONITORING_APPLICATION_HEALTH
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionState" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionState")
     : execution_state)
    : execution_state)

let execution_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "graceful" -> GRACEFUL
    | `String "ungraceful" -> UNGRACEFUL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionMode")
     : execution_mode)
    : execution_mode)

let execution_id_of_yojson = string_of_yojson
let plan_arn_of_yojson = string_of_yojson

let abbreviated_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     comment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "comment")
         _list path;
     start_time =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "startTime" _list path;
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     mode = value_for_key execution_mode_of_yojson "mode" _list path;
     execution_state = value_for_key execution_state_of_yojson "executionState" _list path;
     execution_action = value_for_key execution_action_of_yojson "executionAction" _list path;
     execution_region =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "executionRegion"
         _list path;
     recovery_execution_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "recoveryExecutionId")
         _list path;
     actual_recovery_time =
       option_of_yojson (value_for_key duration_of_yojson "actualRecoveryTime") _list path;
   }
    : abbreviated_execution)

let abbreviated_executions_list_of_yojson tree path =
  list_of_yojson abbreviated_execution_of_yojson tree path

let region_of_yojson = string_of_yojson

let recovery_approach_of_yojson (tree : t) path =
  ((match tree with
    | `String "activeActive" -> ACTIVE_ACTIVE
    | `String "activePassive" -> ACTIVE_PASSIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecoveryApproach" value)
    | _ -> raise (deserialize_wrong_type_error path "RecoveryApproach")
     : recovery_approach)
    : recovery_approach)

let region_list_of_yojson tree path = list_of_yojson region_of_yojson tree path
let plan_name_of_yojson = string_of_yojson
let account_id_of_yojson = string_of_yojson

let abbreviated_plan_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
     owner = value_for_key account_id_of_yojson "owner" _list path;
     name = value_for_key plan_name_of_yojson "name" _list path;
     regions = value_for_key region_list_of_yojson "regions" _list path;
     recovery_approach = value_for_key recovery_approach_of_yojson "recoveryApproach" _list path;
     primary_region = option_of_yojson (value_for_key region_of_yojson "primaryRegion") _list path;
     version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     execution_role =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "executionRole")
         _list path;
     active_plan_execution =
       option_of_yojson (value_for_key execution_id_of_yojson "activePlanExecution") _list path;
     recovery_time_objective_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "recoveryTimeObjectiveMinutes")
         _list path;
   }
    : abbreviated_plan)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : access_denied_exception)

let alarm_condition_of_yojson (tree : t) path =
  ((match tree with
    | `String "red" -> RED
    | `String "green" -> GREEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "AlarmCondition" value)
    | _ -> raise (deserialize_wrong_type_error path "AlarmCondition")
     : alarm_condition)
    : alarm_condition)

let alarm_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "applicationHealth" -> APPLICATION_HEALTH
    | `String "trigger" -> TRIGGER
    | `String value -> raise (deserialize_unknown_enum_value_error path "AlarmType" value)
    | _ -> raise (deserialize_wrong_type_error path "AlarmType")
     : alarm_type)
    : alarm_type)

let approval_of_yojson (tree : t) path =
  ((match tree with
    | `String "approve" -> APPROVE
    | `String "decline" -> DECLINE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Approval" value)
    | _ -> raise (deserialize_wrong_type_error path "Approval")
     : approval)
    : approval)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let approve_plan_execution_step_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let execution_comment_of_yojson = string_of_yojson
let step_name_of_yojson = string_of_yojson

let approve_plan_execution_step_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     step_name = value_for_key step_name_of_yojson "stepName" _list path;
     approval = value_for_key approval_of_yojson "approval" _list path;
     comment = option_of_yojson (value_for_key execution_comment_of_yojson "comment") _list path;
   }
    : approve_plan_execution_step_request)

let update_plan_execution_step_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_plan_execution_step_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "switchToUngraceful" -> SWITCH_TO_UNGRACEFUL
    | `String "skip" -> SKIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdatePlanExecutionStepAction" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdatePlanExecutionStepAction")
     : update_plan_execution_step_action)
    : update_plan_execution_step_action)

let update_plan_execution_step_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     comment = value_for_key execution_comment_of_yojson "comment" _list path;
     step_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "stepName" _list path;
     action_to_take =
       value_for_key update_plan_execution_step_action_of_yojson "actionToTake" _list path;
   }
    : update_plan_execution_step_request)

let illegal_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : illegal_state_exception)

let update_plan_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_plan_execution_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "switchToGraceful" -> SWITCH_TO_GRACEFUL
    | `String "switchToUngraceful" -> SWITCH_TO_UNGRACEFUL
    | `String "pause" -> PAUSE
    | `String "resume" -> RESUME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdatePlanExecutionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdatePlanExecutionAction")
     : update_plan_execution_action)
    : update_plan_execution_action)

let update_plan_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     action = value_for_key update_plan_execution_action_of_yojson "action" _list path;
     comment = option_of_yojson (value_for_key execution_comment_of_yojson "comment") _list path;
   }
    : update_plan_execution_request)

let illegal_argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : illegal_argument_exception)

let start_plan_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_id = option_of_yojson (value_for_key execution_id_of_yojson "executionId") _list path;
     plan = option_of_yojson (value_for_key plan_arn_of_yojson "plan") _list path;
     plan_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "planVersion")
         _list path;
     activate_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "activateRegion")
         _list path;
     deactivate_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "deactivateRegion")
         _list path;
   }
    : start_plan_execution_response)

let recovery_execution_id_of_yojson = string_of_yojson

let start_plan_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     target_region =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "targetRegion" _list
         path;
     action = value_for_key execution_action_of_yojson "action" _list path;
     mode = option_of_yojson (value_for_key execution_mode_of_yojson "mode") _list path;
     comment = option_of_yojson (value_for_key execution_comment_of_yojson "comment") _list path;
     latest_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "latestVersion")
         _list path;
     recovery_execution_id =
       option_of_yojson
         (value_for_key recovery_execution_id_of_yojson "recoveryExecutionId")
         _list path;
   }
    : start_plan_execution_request)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let next_token_of_yojson = string_of_yojson

let route53_health_check_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "healthy" -> HEALTHY
    | `String "unhealthy" -> UNHEALTHY
    | `String "unknown" -> UNKNOWN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "Route53HealthCheckStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "Route53HealthCheckStatus")
     : route53_health_check_status)
    : route53_health_check_status)

let route53_health_check_id_of_yojson = string_of_yojson
let route53_record_name_of_yojson = string_of_yojson
let route53_hosted_zone_id_of_yojson = string_of_yojson

let route53_health_check_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hosted_zone_id = value_for_key route53_hosted_zone_id_of_yojson "hostedZoneId" _list path;
     record_name = value_for_key route53_record_name_of_yojson "recordName" _list path;
     health_check_id =
       option_of_yojson (value_for_key route53_health_check_id_of_yojson "healthCheckId") _list path;
     status =
       option_of_yojson (value_for_key route53_health_check_status_of_yojson "status") _list path;
     region = value_for_key region_of_yojson "region" _list path;
   }
    : route53_health_check)

let route53_health_check_list_of_yojson tree path =
  list_of_yojson route53_health_check_of_yojson tree path

let list_route53_health_checks_in_region_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_checks =
       option_of_yojson
         (value_for_key route53_health_check_list_of_yojson "healthChecks")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_route53_health_checks_in_region_response)

let max_results_of_yojson = int_of_yojson

let list_route53_health_checks_in_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
     hosted_zone_id =
       option_of_yojson (value_for_key route53_hosted_zone_id_of_yojson "hostedZoneId") _list path;
     record_name =
       option_of_yojson (value_for_key route53_record_name_of_yojson "recordName") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_route53_health_checks_in_region_request)

let list_route53_health_checks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_checks =
       option_of_yojson
         (value_for_key route53_health_check_list_of_yojson "healthChecks")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_route53_health_checks_response)

let list_route53_health_checks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
     hosted_zone_id =
       option_of_yojson (value_for_key route53_hosted_zone_id_of_yojson "hostedZoneId") _list path;
     record_name =
       option_of_yojson (value_for_key route53_record_name_of_yojson "recordName") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_route53_health_checks_request)

let plan_list_of_yojson tree path = list_of_yojson abbreviated_plan_of_yojson tree path

let list_plans_in_region_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plans = option_of_yojson (value_for_key plan_list_of_yojson "plans") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_plans_in_region_response)

let list_plans_in_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_plans_in_region_request)

let list_plan_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items =
       option_of_yojson (value_for_key abbreviated_executions_list_of_yojson "items") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_plan_executions_response)

let list_executions_max_results_of_yojson = int_of_yojson

let list_plan_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     max_results =
       option_of_yojson
         (value_for_key list_executions_max_results_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     state = option_of_yojson (value_for_key execution_state_of_yojson "state") _list path;
   }
    : list_plan_executions_request)

let resources_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let execution_block_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CustomActionLambda" -> CUSTOM_ACTION_LAMBDA
    | `String "ManualApproval" -> EXECUTION_APPROVAL
    | `String "AuroraGlobalDatabase" -> AURORA
    | `String "EC2AutoScaling" -> EC2_ASG
    | `String "ARCRoutingControl" -> ROUTING_CONTROL
    | `String "ARCRegionSwitchPlan" -> REGION_SWITCH
    | `String "Parallel" -> PARALLEL
    | `String "ECSServiceScaling" -> ECS
    | `String "EKSResourceScaling" -> EKS_RESOURCE_SCALING
    | `String "Route53HealthCheck" -> ROUTE53_HEALTH_CHECK
    | `String "DocumentDb" -> DOCUMENTDB
    | `String "RdsPromoteReadReplica" -> RDS_PROMOTE_READ_REPLICA
    | `String "RdsCreateCrossRegionReplica" -> RDS_CREATE_CROSS_REGION_REPLICA
    | `String "LambdaEventSourceMapping" -> LAMBDA_EVENT_SOURCE_MAPPING
    | `String "AuroraServerlessScaling" -> AURORA_SERVERLESS_SCALING
    | `String "AuroraProvisionedScaling" -> AURORA_PROVISIONED_SCALING
    | `String "NeptuneGlobalDatabase" -> NEPTUNE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionBlockType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionBlockType")
     : execution_block_type)
    : execution_block_type)

let execution_event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknown" -> UNKNOWN
    | `String "executionPending" -> EXECUTION_PENDING
    | `String "executionStarted" -> EXECUTION_STARTED
    | `String "executionSucceeded" -> EXECUTION_SUCCEEDED
    | `String "executionFailed" -> EXECUTION_FAILED
    | `String "executionPausing" -> EXECUTION_PAUSING
    | `String "executionPaused" -> EXECUTION_PAUSED
    | `String "executionCanceling" -> EXECUTION_CANCELING
    | `String "executionCanceled" -> EXECUTION_CANCELED
    | `String "executionPendingApproval" -> EXECUTION_PENDING_APPROVAL
    | `String "executionBehaviorChangedToUngraceful" -> EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL
    | `String "executionBehaviorChangedToGraceful" -> EXECUTION_BEHAVIOR_CHANGED_TO_GRACEFUL
    | `String "executionPendingChildPlanManualApproval" ->
        EXECUTION_PENDING_CHILD_PLAN_MANUAL_APPROVAL
    | `String "executionSuccessMonitoringApplicationHealth" ->
        EXECUTION_SUCCESS_MONITORING_APPLICATION_HEALTH
    | `String "stepStarted" -> STEP_STARTED
    | `String "stepUpdate" -> STEP_UPDATE
    | `String "stepSucceeded" -> STEP_SUCCEEDED
    | `String "stepFailed" -> STEP_FAILED
    | `String "stepSkipped" -> STEP_SKIPPED
    | `String "stepPausedByError" -> STEP_PAUSED_BY_ERROR
    | `String "stepPausedByOperator" -> STEP_PAUSED_BY_OPERATOR
    | `String "stepCanceled" -> STEP_CANCELED
    | `String "stepPendingApproval" -> STEP_PENDING_APPROVAL
    | `String "stepExecutionBehaviorChangedToUngraceful" ->
        STEP_EXECUTION_BEHAVIOR_CHANGED_TO_UNGRACEFUL
    | `String "stepPendingApplicationHealthMonitor" -> STEP_PENDING_APPLICATION_HEALTH_MONITOR
    | `String "planEvaluationWarning" -> PLAN_EVALUATION_WARNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionEventType")
     : execution_event_type)
    : execution_event_type)

let execution_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "timestamp")
         _list path;
     type_ = option_of_yojson (value_for_key execution_event_type_of_yojson "type") _list path;
     step_name = option_of_yojson (value_for_key step_name_of_yojson "stepName") _list path;
     execution_block_type =
       option_of_yojson
         (value_for_key execution_block_type_of_yojson "executionBlockType")
         _list path;
     resources = option_of_yojson (value_for_key resources_of_yojson "resources") _list path;
     error =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "error")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     event_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "eventId" _list path;
     previous_event_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "previousEventId")
         _list path;
   }
    : execution_event)

let execution_event_list_of_yojson tree path = list_of_yojson execution_event_of_yojson tree path

let list_plan_execution_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = option_of_yojson (value_for_key execution_event_list_of_yojson "items") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_plan_execution_events_response)

let list_execution_events_max_results_of_yojson = int_of_yojson

let list_plan_execution_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     max_results =
       option_of_yojson
         (value_for_key list_execution_events_max_results_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     name = option_of_yojson (value_for_key step_name_of_yojson "name") _list path;
   }
    : list_plan_execution_events_request)

let s3_report_output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_path =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "bucketPath")
         _list path;
     bucket_owner = option_of_yojson (value_for_key account_id_of_yojson "bucketOwner") _list path;
   }
    : s3_report_output_configuration)

let report_output_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "s3Configuration" -> S3Configuration (s3_report_output_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ReportOutputConfiguration" unknown)
    : report_output_configuration)

let report_output_list_of_yojson tree path =
  list_of_yojson report_output_configuration_of_yojson tree path

let report_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_output =
       option_of_yojson (value_for_key report_output_list_of_yojson "reportOutput") _list path;
   }
    : report_configuration)

let trigger_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associated_alarm_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "associatedAlarmName"
         _list path;
     condition = value_for_key alarm_condition_of_yojson "condition" _list path;
   }
    : trigger_condition)

let trigger_condition_list_of_yojson tree path =
  list_of_yojson trigger_condition_of_yojson tree path

let workflow_target_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "activate" -> ACTIVATE
    | `String "deactivate" -> DEACTIVATE
    | `String "postRecovery" -> POST_RECOVERY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkflowTargetAction" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowTargetAction")
     : workflow_target_action)
    : workflow_target_action)

let trigger_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     target_region = value_for_key region_of_yojson "targetRegion" _list path;
     action = value_for_key workflow_target_action_of_yojson "action" _list path;
     conditions = value_for_key trigger_condition_list_of_yojson "conditions" _list path;
     min_delay_minutes_between_executions =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "minDelayMinutesBetweenExecutions" _list path;
   }
    : trigger)

let trigger_list_of_yojson tree path = list_of_yojson trigger_of_yojson tree path
let iam_role_arn_of_yojson = string_of_yojson

let associated_alarm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     resource_identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceIdentifier"
         _list path;
     alarm_type = value_for_key alarm_type_of_yojson "alarmType" _list path;
   }
    : associated_alarm)

let associated_alarm_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson associated_alarm_of_yojson
    tree path

let neptune_cluster_arn_of_yojson = string_of_yojson

let region_neptune_cluster_arn_map_of_yojson tree path =
  map_of_yojson region_of_yojson neptune_cluster_arn_of_yojson tree path

let neptune_global_cluster_identifier_of_yojson = string_of_yojson

let neptune_ungraceful_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "failover" -> FAILOVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NeptuneUngracefulBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "NeptuneUngracefulBehavior")
     : neptune_ungraceful_behavior)
    : neptune_ungraceful_behavior)

let neptune_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ungraceful =
       option_of_yojson
         (value_for_key neptune_ungraceful_behavior_of_yojson "ungraceful")
         _list path;
   }
    : neptune_ungraceful)

let neptune_default_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "switchoverOnly" -> SWITCHOVER_ONLY
    | `String "failover" -> FAILOVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NeptuneDefaultBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "NeptuneDefaultBehavior")
     : neptune_default_behavior)
    : neptune_default_behavior)

let neptune_global_database_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     behavior = value_for_key neptune_default_behavior_of_yojson "behavior" _list path;
     ungraceful =
       option_of_yojson (value_for_key neptune_ungraceful_of_yojson "ungraceful") _list path;
     global_cluster_identifier =
       value_for_key neptune_global_cluster_identifier_of_yojson "globalClusterIdentifier" _list
         path;
     region_database_cluster_arns =
       value_for_key region_neptune_cluster_arn_map_of_yojson "regionDatabaseClusterArns" _list path;
   }
    : neptune_global_database_configuration)

let aurora_instance_arn_of_yojson = string_of_yojson

let region_aurora_instance_arn_map_of_yojson tree path =
  map_of_yojson region_of_yojson aurora_instance_arn_of_yojson tree path

let aurora_cluster_arn_of_yojson = string_of_yojson

let region_aurora_cluster_map_of_yojson tree path =
  map_of_yojson region_of_yojson aurora_cluster_arn_of_yojson tree path

let global_cluster_identifier_of_yojson = string_of_yojson

let aurora_provisioned_scaling_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     global_cluster_identifier =
       value_for_key global_cluster_identifier_of_yojson "globalClusterIdentifier" _list path;
     region_database_cluster_arns =
       value_for_key region_aurora_cluster_map_of_yojson "regionDatabaseClusterArns" _list path;
     instance_arns =
       value_for_key region_aurora_instance_arn_map_of_yojson "instanceArns" _list path;
   }
    : aurora_provisioned_scaling_configuration)

let aurora_serverless_scaling_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     global_cluster_identifier =
       value_for_key global_cluster_identifier_of_yojson "globalClusterIdentifier" _list path;
     region_database_cluster_arns =
       value_for_key region_aurora_cluster_map_of_yojson "regionDatabaseClusterArns" _list path;
     target_percent =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "targetPercent")
         _list path;
   }
    : aurora_serverless_scaling_configuration)

let lambda_event_source_mapping_ungraceful_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "skip" -> SKIP
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "LambdaEventSourceMappingUngracefulBehavior"
             value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaEventSourceMappingUngracefulBehavior")
     : lambda_event_source_mapping_ungraceful_behavior)
    : lambda_event_source_mapping_ungraceful_behavior)

let lambda_event_source_mapping_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     behavior =
       option_of_yojson
         (value_for_key lambda_event_source_mapping_ungraceful_behavior_of_yojson "behavior")
         _list path;
   }
    : lambda_event_source_mapping_ungraceful)

let event_source_mapping_arn_of_yojson = string_of_yojson

let event_source_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     arn = value_for_key event_source_mapping_arn_of_yojson "arn" _list path;
   }
    : event_source_mapping)

let region_event_source_mapping_map_of_yojson tree path =
  map_of_yojson region_of_yojson event_source_mapping_of_yojson tree path

let event_source_mapping_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "enable" -> ENABLE
    | `String "disable" -> DISABLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EventSourceMappingAction" value)
    | _ -> raise (deserialize_wrong_type_error path "EventSourceMappingAction")
     : event_source_mapping_action)
    : event_source_mapping_action)

let lambda_event_source_mapping_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     action = value_for_key event_source_mapping_action_of_yojson "action" _list path;
     region_event_source_mappings =
       value_for_key region_event_source_mapping_map_of_yojson "regionEventSourceMappings" _list
         path;
     ungraceful =
       option_of_yojson
         (value_for_key lambda_event_source_mapping_ungraceful_of_yojson "ungraceful")
         _list path;
   }
    : lambda_event_source_mapping_configuration)

let rds_db_instance_arn_of_yojson = string_of_yojson

let rds_db_instance_arn_map_of_yojson tree path =
  map_of_yojson region_of_yojson rds_db_instance_arn_of_yojson tree path

let rds_create_cross_region_replica_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     db_instance_arn_map =
       value_for_key rds_db_instance_arn_map_of_yojson "dbInstanceArnMap" _list path;
   }
    : rds_create_cross_region_replica_configuration)

let rds_promote_read_replica_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     db_instance_arn_map =
       value_for_key rds_db_instance_arn_map_of_yojson "dbInstanceArnMap" _list path;
   }
    : rds_promote_read_replica_configuration)

let document_db_cluster_arn_of_yojson = string_of_yojson

let document_db_cluster_arns_of_yojson tree path =
  list_of_yojson document_db_cluster_arn_of_yojson tree path

let document_db_global_cluster_identifier_of_yojson = string_of_yojson

let document_db_ungraceful_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "failover" -> FAILOVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentDbUngracefulBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentDbUngracefulBehavior")
     : document_db_ungraceful_behavior)
    : document_db_ungraceful_behavior)

let document_db_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ungraceful =
       option_of_yojson
         (value_for_key document_db_ungraceful_behavior_of_yojson "ungraceful")
         _list path;
   }
    : document_db_ungraceful)

let document_db_default_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "switchoverOnly" -> SWITCHOVER_ONLY
    | `String "failover" -> FAILOVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DocumentDbDefaultBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentDbDefaultBehavior")
     : document_db_default_behavior)
    : document_db_default_behavior)

let document_db_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     behavior = value_for_key document_db_default_behavior_of_yojson "behavior" _list path;
     ungraceful =
       option_of_yojson (value_for_key document_db_ungraceful_of_yojson "ungraceful") _list path;
     global_cluster_identifier =
       value_for_key document_db_global_cluster_identifier_of_yojson "globalClusterIdentifier" _list
         path;
     database_cluster_arns =
       value_for_key document_db_cluster_arns_of_yojson "databaseClusterArns" _list path;
   }
    : document_db_configuration)

let route53_resource_record_set_identifier_of_yojson = string_of_yojson

let route53_resource_record_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_set_identifier =
       option_of_yojson
         (value_for_key route53_resource_record_set_identifier_of_yojson "recordSetIdentifier")
         _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
   }
    : route53_resource_record_set)

let route53_resource_record_set_list_of_yojson tree path =
  list_of_yojson route53_resource_record_set_of_yojson tree path

let route53_health_check_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     hosted_zone_id = value_for_key route53_hosted_zone_id_of_yojson "hostedZoneId" _list path;
     record_name = value_for_key route53_record_name_of_yojson "recordName" _list path;
     record_sets =
       option_of_yojson
         (value_for_key route53_resource_record_set_list_of_yojson "recordSets")
         _list path;
   }
    : route53_health_check_configuration)

let eks_capacity_monitoring_approach_of_yojson (tree : t) path =
  ((match tree with
    | `String "sampledMaxInLast24Hours" -> SAMPLED_MAX_IN_LAST_24_HOURS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EksCapacityMonitoringApproach" value)
    | _ -> raise (deserialize_wrong_type_error path "EksCapacityMonitoringApproach")
     : eks_capacity_monitoring_approach)
    : eks_capacity_monitoring_approach)

let eks_resource_scaling_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_success_percentage =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "minimumSuccessPercentage" _list path;
   }
    : eks_resource_scaling_ungraceful)

let eks_cluster_arn_of_yojson = string_of_yojson

let eks_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     cluster_arn = value_for_key eks_cluster_arn_of_yojson "clusterArn" _list path;
   }
    : eks_cluster)

let eks_clusters_of_yojson tree path = list_of_yojson eks_cluster_of_yojson tree path
let kubernetes_namespace_of_yojson = string_of_yojson

let kubernetes_scaling_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     namespace = value_for_key kubernetes_namespace_of_yojson "namespace" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     hpa_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hpaName")
         _list path;
   }
    : kubernetes_scaling_resource)

let regional_scaling_resource_of_yojson tree path =
  map_of_yojson region_of_yojson kubernetes_scaling_resource_of_yojson tree path

let kubernetes_scaling_application_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    regional_scaling_resource_of_yojson tree path

let kubernetes_scaling_apps_of_yojson tree path =
  list_of_yojson kubernetes_scaling_application_of_yojson tree path

let kubernetes_resource_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     api_version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "apiVersion" _list
         path;
     kind =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kind" _list path;
   }
    : kubernetes_resource_type)

let eks_resource_scaling_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     kubernetes_resource_type =
       value_for_key kubernetes_resource_type_of_yojson "kubernetesResourceType" _list path;
     scaling_resources =
       option_of_yojson
         (value_for_key kubernetes_scaling_apps_of_yojson "scalingResources")
         _list path;
     eks_clusters = option_of_yojson (value_for_key eks_clusters_of_yojson "eksClusters") _list path;
     ungraceful =
       option_of_yojson
         (value_for_key eks_resource_scaling_ungraceful_of_yojson "ungraceful")
         _list path;
     target_percent =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "targetPercent")
         _list path;
     capacity_monitoring_approach =
       option_of_yojson
         (value_for_key eks_capacity_monitoring_approach_of_yojson "capacityMonitoringApproach")
         _list path;
   }
    : eks_resource_scaling_configuration)

let ecs_capacity_monitoring_approach_of_yojson (tree : t) path =
  ((match tree with
    | `String "sampledMaxInLast24Hours" -> SAMPLED_MAX_IN_LAST_24_HOURS
    | `String "containerInsightsMaxInLast24Hours" -> CONTAINER_INSIGHTS_MAX_IN_LAST_24_HOURS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EcsCapacityMonitoringApproach" value)
    | _ -> raise (deserialize_wrong_type_error path "EcsCapacityMonitoringApproach")
     : ecs_capacity_monitoring_approach)
    : ecs_capacity_monitoring_approach)

let ecs_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_success_percentage =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "minimumSuccessPercentage" _list path;
   }
    : ecs_ungraceful)

let ecs_service_arn_of_yojson = string_of_yojson
let ecs_cluster_arn_of_yojson = string_of_yojson

let service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     cluster_arn =
       option_of_yojson (value_for_key ecs_cluster_arn_of_yojson "clusterArn") _list path;
     service_arn =
       option_of_yojson (value_for_key ecs_service_arn_of_yojson "serviceArn") _list path;
   }
    : service)

let service_list_of_yojson tree path = list_of_yojson service_of_yojson tree path

let ecs_capacity_increase_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     services = value_for_key service_list_of_yojson "services" _list path;
     ungraceful = option_of_yojson (value_for_key ecs_ungraceful_of_yojson "ungraceful") _list path;
     target_percent =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "targetPercent")
         _list path;
     capacity_monitoring_approach =
       option_of_yojson
         (value_for_key ecs_capacity_monitoring_approach_of_yojson "capacityMonitoringApproach")
         _list path;
   }
    : ecs_capacity_increase_configuration)

let region_switch_plan_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
   }
    : region_switch_plan_configuration)

let aurora_cluster_arns_of_yojson tree path = list_of_yojson aurora_cluster_arn_of_yojson tree path

let global_aurora_ungraceful_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "failover" -> FAILOVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GlobalAuroraUngracefulBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "GlobalAuroraUngracefulBehavior")
     : global_aurora_ungraceful_behavior)
    : global_aurora_ungraceful_behavior)

let global_aurora_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ungraceful =
       option_of_yojson
         (value_for_key global_aurora_ungraceful_behavior_of_yojson "ungraceful")
         _list path;
   }
    : global_aurora_ungraceful)

let global_aurora_default_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "switchoverOnly" -> SWITCHOVER_ONLY
    | `String "failover" -> FAILOVER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GlobalAuroraDefaultBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "GlobalAuroraDefaultBehavior")
     : global_aurora_default_behavior)
    : global_aurora_default_behavior)

let global_aurora_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     behavior = value_for_key global_aurora_default_behavior_of_yojson "behavior" _list path;
     ungraceful =
       option_of_yojson (value_for_key global_aurora_ungraceful_of_yojson "ungraceful") _list path;
     global_cluster_identifier =
       value_for_key global_cluster_identifier_of_yojson "globalClusterIdentifier" _list path;
     database_cluster_arns =
       value_for_key aurora_cluster_arns_of_yojson "databaseClusterArns" _list path;
   }
    : global_aurora_configuration)

let routing_control_state_change_of_yojson (tree : t) path =
  ((match tree with
    | `String "On" -> ON
    | `String "Off" -> OFF
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RoutingControlStateChange" value)
    | _ -> raise (deserialize_wrong_type_error path "RoutingControlStateChange")
     : routing_control_state_change)
    : routing_control_state_change)

let routing_control_arn_of_yojson = string_of_yojson

let arc_routing_control_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing_control_arn =
       value_for_key routing_control_arn_of_yojson "routingControlArn" _list path;
     state = value_for_key routing_control_state_change_of_yojson "state" _list path;
   }
    : arc_routing_control_state)

let arc_routing_control_states_of_yojson tree path =
  list_of_yojson arc_routing_control_state_of_yojson tree path

let region_and_routing_controls_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    arc_routing_control_states_of_yojson tree path

let arc_routing_control_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     region_and_routing_controls =
       value_for_key region_and_routing_controls_of_yojson "regionAndRoutingControls" _list path;
   }
    : arc_routing_control_configuration)

let role_arn_of_yojson = string_of_yojson

let execution_approval_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     approval_role = value_for_key role_arn_of_yojson "approvalRole" _list path;
   }
    : execution_approval_configuration)

let ec2_asg_capacity_monitoring_approach_of_yojson (tree : t) path =
  ((match tree with
    | `String "sampledMaxInLast24Hours" -> SAMPLED_MAX_IN_LAST_24_HOURS
    | `String "autoscalingMaxInLast24Hours" -> AUTOSCALING_MAX_IN_LAST_24_HOURS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "Ec2AsgCapacityMonitoringApproach" value)
    | _ -> raise (deserialize_wrong_type_error path "Ec2AsgCapacityMonitoringApproach")
     : ec2_asg_capacity_monitoring_approach)
    : ec2_asg_capacity_monitoring_approach)

let ec2_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minimum_success_percentage =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "minimumSuccessPercentage" _list path;
   }
    : ec2_ungraceful)

let asg_arn_of_yojson = string_of_yojson

let asg_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     arn = option_of_yojson (value_for_key asg_arn_of_yojson "arn") _list path;
   }
    : asg)

let asg_list_of_yojson tree path = list_of_yojson asg_of_yojson tree path

let ec2_asg_capacity_increase_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     asgs = value_for_key asg_list_of_yojson "asgs" _list path;
     ungraceful = option_of_yojson (value_for_key ec2_ungraceful_of_yojson "ungraceful") _list path;
     target_percent =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "targetPercent")
         _list path;
     capacity_monitoring_approach =
       option_of_yojson
         (value_for_key ec2_asg_capacity_monitoring_approach_of_yojson "capacityMonitoringApproach")
         _list path;
   }
    : ec2_asg_capacity_increase_configuration)

let lambda_ungraceful_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "skip" -> SKIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LambdaUngracefulBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaUngracefulBehavior")
     : lambda_ungraceful_behavior)
    : lambda_ungraceful_behavior)

let lambda_ungraceful_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     behavior =
       option_of_yojson (value_for_key lambda_ungraceful_behavior_of_yojson "behavior") _list path;
   }
    : lambda_ungraceful)

let region_to_run_in_of_yojson (tree : t) path =
  ((match tree with
    | `String "activatingRegion" -> ACTIVATING_REGION
    | `String "deactivatingRegion" -> DEACTIVATING_REGION
    | `String "activeRegion" -> ACTIVE_REGION
    | `String "inactiveRegion" -> INACTIVE_REGION
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegionToRunIn" value)
    | _ -> raise (deserialize_wrong_type_error path "RegionToRunIn")
     : region_to_run_in)
    : region_to_run_in)

let lambda_arn_of_yojson = string_of_yojson

let lambdas_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cross_account_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "crossAccountRole") _list path;
     external_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "externalId")
         _list path;
     arn = option_of_yojson (value_for_key lambda_arn_of_yojson "arn") _list path;
   }
    : lambdas)

let lambda_list_of_yojson tree path = list_of_yojson lambdas_of_yojson tree path

let custom_action_lambda_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "timeoutMinutes")
         _list path;
     lambdas = value_for_key lambda_list_of_yojson "lambdas" _list path;
     retry_interval_minutes =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "retryIntervalMinutes"
         _list path;
     region_to_run = value_for_key region_to_run_in_of_yojson "regionToRun" _list path;
     ungraceful =
       option_of_yojson (value_for_key lambda_ungraceful_of_yojson "ungraceful") _list path;
   }
    : custom_action_lambda_configuration)

let rec steps_of_yojson tree path = list_of_yojson step_of_yojson tree path

and step_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key step_name_of_yojson "name" _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     execution_block_configuration =
       value_for_key execution_block_configuration_of_yojson "executionBlockConfiguration" _list
         path;
     execution_block_type =
       value_for_key execution_block_type_of_yojson "executionBlockType" _list path;
   }
    : step)

and parallel_execution_block_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ steps = value_for_key steps_of_yojson "steps" _list path }
    : parallel_execution_block_configuration)

and execution_block_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "customActionLambdaConfig" ->
       CustomActionLambdaConfig (custom_action_lambda_configuration_of_yojson value_ path)
   | "ec2AsgCapacityIncreaseConfig" ->
       Ec2AsgCapacityIncreaseConfig (ec2_asg_capacity_increase_configuration_of_yojson value_ path)
   | "executionApprovalConfig" ->
       ExecutionApprovalConfig (execution_approval_configuration_of_yojson value_ path)
   | "arcRoutingControlConfig" ->
       ArcRoutingControlConfig (arc_routing_control_configuration_of_yojson value_ path)
   | "globalAuroraConfig" -> GlobalAuroraConfig (global_aurora_configuration_of_yojson value_ path)
   | "parallelConfig" ->
       ParallelConfig (parallel_execution_block_configuration_of_yojson value_ path)
   | "regionSwitchPlanConfig" ->
       RegionSwitchPlanConfig (region_switch_plan_configuration_of_yojson value_ path)
   | "ecsCapacityIncreaseConfig" ->
       EcsCapacityIncreaseConfig (ecs_capacity_increase_configuration_of_yojson value_ path)
   | "eksResourceScalingConfig" ->
       EksResourceScalingConfig (eks_resource_scaling_configuration_of_yojson value_ path)
   | "route53HealthCheckConfig" ->
       Route53HealthCheckConfig (route53_health_check_configuration_of_yojson value_ path)
   | "documentDbConfig" -> DocumentDbConfig (document_db_configuration_of_yojson value_ path)
   | "rdsPromoteReadReplicaConfig" ->
       RdsPromoteReadReplicaConfig (rds_promote_read_replica_configuration_of_yojson value_ path)
   | "rdsCreateCrossRegionReadReplicaConfig" ->
       RdsCreateCrossRegionReadReplicaConfig
         (rds_create_cross_region_replica_configuration_of_yojson value_ path)
   | "lambdaEventSourceMappingConfig" ->
       LambdaEventSourceMappingConfig
         (lambda_event_source_mapping_configuration_of_yojson value_ path)
   | "auroraServerlessScalingConfig" ->
       AuroraServerlessScalingConfig (aurora_serverless_scaling_configuration_of_yojson value_ path)
   | "auroraProvisionedScalingConfig" ->
       AuroraProvisionedScalingConfig
         (aurora_provisioned_scaling_configuration_of_yojson value_ path)
   | "neptuneGlobalDatabaseConfig" ->
       NeptuneGlobalDatabaseConfig (neptune_global_database_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ExecutionBlockConfiguration" unknown)
    : execution_block_configuration)

let workflow_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     steps = option_of_yojson (value_for_key steps_of_yojson "steps") _list path;
     workflow_target_action =
       value_for_key workflow_target_action_of_yojson "workflowTargetAction" _list path;
     workflow_target_region =
       option_of_yojson (value_for_key region_of_yojson "workflowTargetRegion") _list path;
     workflow_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "workflowDescription")
         _list path;
   }
    : workflow)

let workflow_list_of_yojson tree path = list_of_yojson workflow_of_yojson tree path

let plan_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     workflows = value_for_key workflow_list_of_yojson "workflows" _list path;
     execution_role = value_for_key iam_role_arn_of_yojson "executionRole" _list path;
     recovery_time_objective_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "recoveryTimeObjectiveMinutes")
         _list path;
     associated_alarms =
       option_of_yojson (value_for_key associated_alarm_map_of_yojson "associatedAlarms") _list path;
     triggers = option_of_yojson (value_for_key trigger_list_of_yojson "triggers") _list path;
     report_configuration =
       option_of_yojson
         (value_for_key report_configuration_of_yojson "reportConfiguration")
         _list path;
     name = value_for_key plan_name_of_yojson "name" _list path;
     regions = value_for_key region_list_of_yojson "regions" _list path;
     recovery_approach = value_for_key recovery_approach_of_yojson "recoveryApproach" _list path;
     primary_region = option_of_yojson (value_for_key region_of_yojson "primaryRegion") _list path;
     owner = value_for_key account_id_of_yojson "owner" _list path;
     version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
   }
    : plan)

let get_plan_in_region_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ plan = option_of_yojson (value_for_key plan_of_yojson "plan") _list path }
    : get_plan_in_region_response)

let get_plan_in_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key plan_arn_of_yojson "arn" _list path } : get_plan_in_region_request)

let failed_report_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "insufficientPermissions" -> INSUFFICIENT_PERMISSIONS
    | `String "invalidResource" -> INVALID_RESOURCE
    | `String "configurationError" -> CONFIGURATION_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FailedReportErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FailedReportErrorCode")
     : failed_report_error_code)
    : failed_report_error_code)

let failed_report_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson (value_for_key failed_report_error_code_of_yojson "errorCode") _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
   }
    : failed_report_output)

let s3_report_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_object_key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "s3ObjectKey")
         _list path;
   }
    : s3_report_output)

let report_output_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "s3ReportOutput" -> S3ReportOutput (s3_report_output_of_yojson value_ path)
   | "failedReportOutput" -> FailedReportOutput (failed_report_output_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ReportOutput" unknown)
    : report_output)

let generated_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_generation_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "reportGenerationTime")
         _list path;
     report_output =
       option_of_yojson (value_for_key report_output_of_yojson "reportOutput") _list path;
   }
    : generated_report)

let generated_report_details_of_yojson tree path =
  list_of_yojson generated_report_of_yojson tree path

let step_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "notStarted" -> NOT_STARTED
    | `String "running" -> RUNNING
    | `String "failed" -> FAILED
    | `String "completed" -> COMPLETED
    | `String "canceled" -> CANCELLED
    | `String "skipped" -> SKIPPED
    | `String "pendingApproval" -> PENDING_APPROVAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "StepStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StepStatus")
     : step_status)
    : step_status)

let step_state_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key step_name_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key step_status_of_yojson "status") _list path;
     start_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTime")
         _list path;
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     step_mode = option_of_yojson (value_for_key execution_mode_of_yojson "stepMode") _list path;
   }
    : step_state)

let step_states_of_yojson tree path = list_of_yojson step_state_of_yojson tree path

let get_plan_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     comment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "comment")
         _list path;
     start_time =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "startTime" _list path;
     end_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTime")
         _list path;
     mode = value_for_key execution_mode_of_yojson "mode" _list path;
     execution_state = value_for_key execution_state_of_yojson "executionState" _list path;
     execution_action = value_for_key execution_action_of_yojson "executionAction" _list path;
     execution_region =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "executionRegion"
         _list path;
     recovery_execution_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "recoveryExecutionId")
         _list path;
     step_states = option_of_yojson (value_for_key step_states_of_yojson "stepStates") _list path;
     plan = option_of_yojson (value_for_key plan_of_yojson "plan") _list path;
     actual_recovery_time =
       option_of_yojson (value_for_key duration_of_yojson "actualRecoveryTime") _list path;
     generated_report_details =
       option_of_yojson
         (value_for_key generated_report_details_of_yojson "generatedReportDetails")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : get_plan_execution_response)

let get_plan_execution_step_states_max_results_of_yojson = int_of_yojson

let get_plan_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     max_results =
       option_of_yojson
         (value_for_key get_plan_execution_step_states_max_results_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : get_plan_execution_request)

let resource_warning_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "active" -> ACTIVE
    | `String "resolved" -> RESOLVED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceWarningStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceWarningStatus")
     : resource_warning_status)
    : resource_warning_status)

let resource_arn_of_yojson = string_of_yojson

let minimal_workflow_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key execution_action_of_yojson "action") _list path;
     name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name")
         _list path;
   }
    : minimal_workflow)

let resource_warning_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workflow = option_of_yojson (value_for_key minimal_workflow_of_yojson "workflow") _list path;
     version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "version" _list path;
     step_name = option_of_yojson (value_for_key step_name_of_yojson "stepName") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     warning_status = value_for_key resource_warning_status_of_yojson "warningStatus" _list path;
     warning_updated_time =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "warningUpdatedTime" _list path;
     warning_message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "warningMessage"
         _list path;
   }
    : resource_warning)

let plan_warnings_of_yojson tree path = list_of_yojson resource_warning_of_yojson tree path

let evaluation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "passed" -> PASSED
    | `String "actionRequired" -> ACTION_REQUIRED
    | `String "pendingEvaluation" -> PENDING_EVALUATION
    | `String "unknown" -> UNKNOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "EvaluationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EvaluationStatus")
     : evaluation_status)
    : evaluation_status)

let get_plan_evaluation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     last_evaluation_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastEvaluationTime")
         _list path;
     last_evaluated_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lastEvaluatedVersion")
         _list path;
     region = option_of_yojson (value_for_key region_of_yojson "region") _list path;
     evaluation_state =
       option_of_yojson (value_for_key evaluation_status_of_yojson "evaluationState") _list path;
     warnings = option_of_yojson (value_for_key plan_warnings_of_yojson "warnings") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_plan_evaluation_status_response)

let get_plan_evaluation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_plan_evaluation_status_request)

let cancel_plan_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_plan_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan_arn = value_for_key plan_arn_of_yojson "planArn" _list path;
     execution_id = value_for_key execution_id_of_yojson "executionId" _list path;
     comment = option_of_yojson (value_for_key execution_comment_of_yojson "comment") _list path;
   }
    : cancel_plan_execution_request)

let create_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ plan = option_of_yojson (value_for_key plan_of_yojson "plan") _list path }
    : create_plan_response)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tags_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let create_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     workflows = value_for_key workflow_list_of_yojson "workflows" _list path;
     execution_role = value_for_key iam_role_arn_of_yojson "executionRole" _list path;
     recovery_time_objective_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "recoveryTimeObjectiveMinutes")
         _list path;
     associated_alarms =
       option_of_yojson (value_for_key associated_alarm_map_of_yojson "associatedAlarms") _list path;
     triggers = option_of_yojson (value_for_key trigger_list_of_yojson "triggers") _list path;
     report_configuration =
       option_of_yojson
         (value_for_key report_configuration_of_yojson "reportConfiguration")
         _list path;
     name = value_for_key plan_name_of_yojson "name" _list path;
     regions = value_for_key region_list_of_yojson "regions" _list path;
     recovery_approach = value_for_key recovery_approach_of_yojson "recoveryApproach" _list path;
     primary_region = option_of_yojson (value_for_key region_of_yojson "primaryRegion") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_plan_request)

let delete_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key plan_arn_of_yojson "arn" _list path } : delete_plan_request)

let get_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ plan = option_of_yojson (value_for_key plan_of_yojson "plan") _list path } : get_plan_response)

let get_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key plan_arn_of_yojson "arn" _list path } : get_plan_request)

let list_plans_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plans = option_of_yojson (value_for_key plan_list_of_yojson "plans") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_plans_response)

let list_plans_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_plans_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_tags = option_of_yojson (value_for_key tags_of_yojson "resourceTags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key plan_arn_of_yojson "arn" _list path } : list_tags_for_resource_request)

let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
     tags = value_for_key tags_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
     resource_tag_keys = value_for_key tag_keys_of_yojson "resourceTagKeys" _list path;
   }
    : untag_resource_request)

let update_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ plan = option_of_yojson (value_for_key plan_of_yojson "plan") _list path }
    : update_plan_response)

let update_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key plan_arn_of_yojson "arn" _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     workflows = value_for_key workflow_list_of_yojson "workflows" _list path;
     execution_role = value_for_key iam_role_arn_of_yojson "executionRole" _list path;
     recovery_time_objective_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "recoveryTimeObjectiveMinutes")
         _list path;
     associated_alarms =
       option_of_yojson (value_for_key associated_alarm_map_of_yojson "associatedAlarms") _list path;
     triggers = option_of_yojson (value_for_key trigger_list_of_yojson "triggers") _list path;
     report_configuration =
       option_of_yojson
         (value_for_key report_configuration_of_yojson "reportConfiguration")
         _list path;
   }
    : update_plan_request)
