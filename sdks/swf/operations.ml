open Types
open Service_metadata

module CountClosedWorkflowExecutions = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.count_closed_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.CountClosedWorkflowExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.workflow_execution_count_of_yojson ~error_deserializer
end

module CountOpenWorkflowExecutions = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.count_open_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.CountOpenWorkflowExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.workflow_execution_count_of_yojson ~error_deserializer
end

module CountPendingActivityTasks = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.count_pending_activity_tasks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.CountPendingActivityTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.pending_task_count_of_yojson ~error_deserializer
end

module CountPendingDecisionTasks = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.count_pending_decision_tasks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.CountPendingDecisionTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.pending_task_count_of_yojson ~error_deserializer
end

module DeleteActivityType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeNotDeprecatedFault _ -> "com.amazonaws.swf#TypeNotDeprecatedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.delete_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DeleteActivityType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWorkflowType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeNotDeprecatedFault _ -> "com.amazonaws.swf#TypeNotDeprecatedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.delete_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DeleteWorkflowType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeprecateActivityType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeDeprecatedFault _ -> "com.amazonaws.swf#TypeDeprecatedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.deprecate_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DeprecateActivityType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeprecateDomain = struct
  let error_to_string = function
    | `DomainDeprecatedFault _ -> "com.amazonaws.swf#DomainDeprecatedFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.deprecate_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DeprecateDomain" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeprecateWorkflowType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeDeprecatedFault _ -> "com.amazonaws.swf#TypeDeprecatedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.deprecate_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DeprecateWorkflowType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeActivityType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.describe_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DescribeActivityType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.activity_type_detail_of_yojson ~error_deserializer
end

module DescribeDomain = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.describe_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DescribeDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.domain_detail_of_yojson
      ~error_deserializer
end

module DescribeWorkflowExecution = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.describe_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.DescribeWorkflowExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.workflow_execution_detail_of_yojson
      ~error_deserializer
end

module DescribeWorkflowType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.describe_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.DescribeWorkflowType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.workflow_type_detail_of_yojson ~error_deserializer
end

module GetWorkflowExecutionHistory = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_workflow_execution_history_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.GetWorkflowExecutionHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.history_of_yojson ~error_deserializer
end

module ListActivityTypes = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_activity_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.ListActivityTypes"
      ~service ~context ~input ~output_deserializer:Json_deserializers.activity_type_infos_of_yojson
      ~error_deserializer
end

module ListClosedWorkflowExecutions = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_closed_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.ListClosedWorkflowExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.workflow_execution_infos_of_yojson ~error_deserializer
end

module ListDomains = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_domains_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.ListDomains" ~service
      ~context ~input ~output_deserializer:Json_deserializers.domain_infos_of_yojson
      ~error_deserializer
end

module ListOpenWorkflowExecutions = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_open_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.ListOpenWorkflowExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.workflow_execution_infos_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListWorkflowTypes = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_workflow_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.ListWorkflowTypes"
      ~service ~context ~input ~output_deserializer:Json_deserializers.workflow_type_infos_of_yojson
      ~error_deserializer
end

module PollForActivityTask = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.poll_for_activity_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.PollForActivityTask"
      ~service ~context ~input ~output_deserializer:Json_deserializers.activity_task_of_yojson
      ~error_deserializer
end

module PollForDecisionTask = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.poll_for_decision_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.PollForDecisionTask"
      ~service ~context ~input ~output_deserializer:Json_deserializers.decision_task_of_yojson
      ~error_deserializer
end

module RecordActivityTaskHeartbeat = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.record_activity_task_heartbeat_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.RecordActivityTaskHeartbeat" ~service ~context ~input
      ~output_deserializer:Json_deserializers.activity_task_status_of_yojson ~error_deserializer
end

module RegisterActivityType = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeAlreadyExistsFault _ -> "com.amazonaws.swf#TypeAlreadyExistsFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.register_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.RegisterActivityType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RegisterDomain = struct
  let error_to_string = function
    | `DomainAlreadyExistsFault _ -> "com.amazonaws.swf#DomainAlreadyExistsFault"
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TooManyTagsFault _ -> "com.amazonaws.swf#TooManyTagsFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.register_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.RegisterDomain" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RegisterWorkflowType = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeAlreadyExistsFault _ -> "com.amazonaws.swf#TypeAlreadyExistsFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.register_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.RegisterWorkflowType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RequestCancelWorkflowExecution = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.request_cancel_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.RequestCancelWorkflowExecution" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondActivityTaskCanceled = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.respond_activity_task_canceled_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.RespondActivityTaskCanceled" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondActivityTaskCompleted = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.respond_activity_task_completed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.RespondActivityTaskCompleted" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondActivityTaskFailed = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.respond_activity_task_failed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.RespondActivityTaskFailed" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RespondDecisionTaskCompleted = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.respond_decision_task_completed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.RespondDecisionTaskCompleted" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SignalWorkflowExecution = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.signal_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.SignalWorkflowExecution"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartWorkflowExecution = struct
  let error_to_string = function
    | `DefaultUndefinedFault _ -> "com.amazonaws.swf#DefaultUndefinedFault"
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeDeprecatedFault _ -> "com.amazonaws.swf#TypeDeprecatedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | `WorkflowExecutionAlreadyStartedFault _ ->
        "com.amazonaws.swf#WorkflowExecutionAlreadyStartedFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.start_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.StartWorkflowExecution"
      ~service ~context ~input ~output_deserializer:Json_deserializers.run_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TooManyTagsFault _ -> "com.amazonaws.swf#TooManyTagsFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.TagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TerminateWorkflowExecution = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.terminate_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SimpleWorkflowService.TerminateWorkflowExecution" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UndeprecateActivityType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeAlreadyExistsFault _ -> "com.amazonaws.swf#TypeAlreadyExistsFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.undeprecate_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.UndeprecateActivityType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UndeprecateDomain = struct
  let error_to_string = function
    | `DomainAlreadyExistsFault _ -> "com.amazonaws.swf#DomainAlreadyExistsFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.undeprecate_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.UndeprecateDomain"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UndeprecateWorkflowType = struct
  let error_to_string = function
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `TypeAlreadyExistsFault _ -> "com.amazonaws.swf#TypeAlreadyExistsFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.undeprecate_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.UndeprecateWorkflowType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.swf#LimitExceededFault"
    | `OperationNotPermittedFault _ -> "com.amazonaws.swf#OperationNotPermittedFault"
    | `UnknownResourceFault _ -> "com.amazonaws.swf#UnknownResourceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SimpleWorkflowService.UntagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
