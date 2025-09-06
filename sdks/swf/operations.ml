open Types
open Service_metadata

module CountClosedWorkflowExecutions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : count_closed_workflow_executions_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.count_closed_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceCountClosedWorkflowExecutions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.workflow_execution_count_of_yojson ~error_deserializer
end

module CountOpenWorkflowExecutions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : count_open_workflow_executions_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.count_open_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceCountOpenWorkflowExecutions" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.workflow_execution_count_of_yojson ~error_deserializer
end

module CountPendingActivityTasks = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : count_pending_activity_tasks_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.count_pending_activity_tasks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceCountPendingActivityTasks"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.pending_task_count_of_yojson ~error_deserializer
end

module CountPendingDecisionTasks = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : count_pending_decision_tasks_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.count_pending_decision_tasks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceCountPendingDecisionTasks"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.pending_task_count_of_yojson ~error_deserializer
end

module DeleteActivityType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeNotDeprecatedFault" ->
          `TypeNotDeprecatedFault (Json_deserializers.type_not_deprecated_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_activity_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDeleteActivityType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWorkflowType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeNotDeprecatedFault" ->
          `TypeNotDeprecatedFault (Json_deserializers.type_not_deprecated_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workflow_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDeleteWorkflowType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeprecateActivityType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeDeprecatedFault" ->
          `TypeDeprecatedFault (Json_deserializers.type_deprecated_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deprecate_activity_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.deprecate_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDeprecateActivityType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeprecateDomain = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DomainDeprecatedFault" ->
          `DomainDeprecatedFault (Json_deserializers.domain_deprecated_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deprecate_domain_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.deprecate_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDeprecateDomain" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeprecateWorkflowType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeDeprecatedFault" ->
          `TypeDeprecatedFault (Json_deserializers.type_deprecated_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deprecate_workflow_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.deprecate_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDeprecateWorkflowType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeActivityType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_activity_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDescribeActivityType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.activity_type_detail_of_yojson ~error_deserializer
end

module DescribeDomain = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_domain_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDescribeDomain" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.domain_detail_of_yojson ~error_deserializer
end

module DescribeWorkflowExecution = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workflow_execution_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDescribeWorkflowExecution"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.workflow_execution_detail_of_yojson
      ~error_deserializer
end

module DescribeWorkflowType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workflow_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceDescribeWorkflowType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.workflow_type_detail_of_yojson ~error_deserializer
end

module GetWorkflowExecutionHistory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_workflow_execution_history_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_workflow_execution_history_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceGetWorkflowExecutionHistory" ~service ~config:context.config
      ~http:context.http ~input ~output_deserializer:Json_deserializers.history_of_yojson
      ~error_deserializer
end

module ListActivityTypes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_activity_types_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_activity_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceListActivityTypes"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.activity_type_infos_of_yojson ~error_deserializer
end

module ListClosedWorkflowExecutions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_closed_workflow_executions_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_closed_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceListClosedWorkflowExecutions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.workflow_execution_infos_of_yojson ~error_deserializer
end

module ListDomains = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_domains_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_domains_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceListDomains" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.domain_infos_of_yojson ~error_deserializer
end

module ListOpenWorkflowExecutions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_open_workflow_executions_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_open_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceListOpenWorkflowExecutions" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.workflow_execution_infos_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceListTagsForResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListWorkflowTypes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workflow_types_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_workflow_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceListWorkflowTypes"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.workflow_type_infos_of_yojson ~error_deserializer
end

module PollForActivityTask = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : poll_for_activity_task_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.poll_for_activity_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServicePollForActivityTask"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.activity_task_of_yojson ~error_deserializer
end

module PollForDecisionTask = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : poll_for_decision_task_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.poll_for_decision_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServicePollForDecisionTask"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.decision_task_of_yojson ~error_deserializer
end

module RecordActivityTaskHeartbeat = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : record_activity_task_heartbeat_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.record_activity_task_heartbeat_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceRecordActivityTaskHeartbeat" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.activity_task_status_of_yojson ~error_deserializer
end

module RegisterActivityType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeAlreadyExistsFault" ->
          `TypeAlreadyExistsFault (Json_deserializers.type_already_exists_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_activity_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceRegisterActivityType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RegisterDomain = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DomainAlreadyExistsFault" ->
          `DomainAlreadyExistsFault
            (Json_deserializers.domain_already_exists_fault_of_yojson tree path)
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TooManyTagsFault" ->
          `TooManyTagsFault (Json_deserializers.too_many_tags_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_domain_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceRegisterDomain" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RegisterWorkflowType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeAlreadyExistsFault" ->
          `TypeAlreadyExistsFault (Json_deserializers.type_already_exists_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_workflow_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceRegisterWorkflowType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RequestCancelWorkflowExecution = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : request_cancel_workflow_execution_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.request_cancel_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceRequestCancelWorkflowExecution" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondActivityTaskCanceled = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : respond_activity_task_canceled_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.respond_activity_task_canceled_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceRespondActivityTaskCanceled" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondActivityTaskCompleted = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : respond_activity_task_completed_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.respond_activity_task_completed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceRespondActivityTaskCompleted" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondActivityTaskFailed = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : respond_activity_task_failed_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.respond_activity_task_failed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceRespondActivityTaskFailed"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondDecisionTaskCompleted = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : respond_decision_task_completed_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.respond_decision_task_completed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceRespondDecisionTaskCompleted" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SignalWorkflowExecution = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : signal_workflow_execution_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.signal_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceSignalWorkflowExecution"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartWorkflowExecution = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DefaultUndefinedFault" ->
          `DefaultUndefinedFault (Json_deserializers.default_undefined_fault_of_yojson tree path)
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeDeprecatedFault" ->
          `TypeDeprecatedFault (Json_deserializers.type_deprecated_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _, "WorkflowExecutionAlreadyStartedFault" ->
          `WorkflowExecutionAlreadyStartedFault
            (Json_deserializers.workflow_execution_already_started_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_workflow_execution_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceStartWorkflowExecution"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.run_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TooManyTagsFault" ->
          `TooManyTagsFault (Json_deserializers.too_many_tags_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceTagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TerminateWorkflowExecution = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_workflow_execution_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.terminate_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowServiceTerminateWorkflowExecution" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UndeprecateActivityType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeAlreadyExistsFault" ->
          `TypeAlreadyExistsFault (Json_deserializers.type_already_exists_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : undeprecate_activity_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.undeprecate_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceUndeprecateActivityType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UndeprecateDomain = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DomainAlreadyExistsFault" ->
          `DomainAlreadyExistsFault
            (Json_deserializers.domain_already_exists_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : undeprecate_domain_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.undeprecate_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceUndeprecateDomain"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UndeprecateWorkflowType = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "TypeAlreadyExistsFault" ->
          `TypeAlreadyExistsFault (Json_deserializers.type_already_exists_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : undeprecate_workflow_type_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.undeprecate_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceUndeprecateWorkflowType"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededFault" ->
          `LimitExceededFault (Json_deserializers.limit_exceeded_fault_of_yojson tree path)
      | _, "OperationNotPermittedFault" ->
          `OperationNotPermittedFault
            (Json_deserializers.operation_not_permitted_fault_of_yojson tree path)
      | _, "UnknownResourceFault" ->
          `UnknownResourceFault (Json_deserializers.unknown_resource_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowServiceUntagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
