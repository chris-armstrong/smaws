open Types
open Service_metadata
module CountClosedWorkflowExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : count_closed_workflow_executions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.count_closed_workflow_executions_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceCountClosedWorkflowExecutions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:workflow_execution_count_of_yojson
            ~error_deserializer
  end
module CountOpenWorkflowExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : count_open_workflow_executions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.count_open_workflow_executions_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceCountOpenWorkflowExecutions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:workflow_execution_count_of_yojson
            ~error_deserializer
  end
module CountPendingActivityTasks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : count_pending_activity_tasks_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.count_pending_activity_tasks_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceCountPendingActivityTasks"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:pending_task_count_of_yojson
            ~error_deserializer
  end
module CountPendingDecisionTasks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : count_pending_decision_tasks_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.count_pending_decision_tasks_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceCountPendingDecisionTasks"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:pending_task_count_of_yojson
            ~error_deserializer
  end
module DeleteActivityType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeNotDeprecatedFault") ->
              `TypeNotDeprecatedFault
                (type_not_deprecated_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_activity_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_activity_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDeleteActivityType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteWorkflowType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeNotDeprecatedFault") ->
              `TypeNotDeprecatedFault
                (type_not_deprecated_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_workflow_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_workflow_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDeleteWorkflowType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeprecateActivityType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeDeprecatedFault") ->
              `TypeDeprecatedFault
                (type_deprecated_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deprecate_activity_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deprecate_activity_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDeprecateActivityType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeprecateDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DomainDeprecatedFault") ->
              `DomainDeprecatedFault
                (domain_deprecated_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deprecate_domain_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.deprecate_domain_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDeprecateDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeprecateWorkflowType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeDeprecatedFault") ->
              `TypeDeprecatedFault
                (type_deprecated_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deprecate_workflow_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deprecate_workflow_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDeprecateWorkflowType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DescribeActivityType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_activity_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_activity_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDescribeActivityType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:activity_type_detail_of_yojson
            ~error_deserializer
  end
module DescribeDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_domain_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_domain_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDescribeDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:domain_detail_of_yojson ~error_deserializer
  end
module DescribeWorkflowExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_workflow_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_workflow_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDescribeWorkflowExecution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:workflow_execution_detail_of_yojson
            ~error_deserializer
  end
module DescribeWorkflowType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_workflow_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_workflow_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceDescribeWorkflowType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:workflow_type_detail_of_yojson
            ~error_deserializer
  end
module GetWorkflowExecutionHistory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_workflow_execution_history_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_workflow_execution_history_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceGetWorkflowExecutionHistory"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:history_of_yojson ~error_deserializer
  end
module ListActivityTypes =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_activity_types_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_activity_types_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceListActivityTypes" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:activity_type_infos_of_yojson
            ~error_deserializer
  end
module ListClosedWorkflowExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_closed_workflow_executions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_closed_workflow_executions_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceListClosedWorkflowExecutions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:workflow_execution_infos_of_yojson
            ~error_deserializer
  end
module ListDomains =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_domains_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_domains_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceListDomains" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:domain_infos_of_yojson ~error_deserializer
  end
module ListOpenWorkflowExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_open_workflow_executions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_open_workflow_executions_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceListOpenWorkflowExecutions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:workflow_execution_infos_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_output_of_yojson
            ~error_deserializer
  end
module ListWorkflowTypes =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_workflow_types_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_workflow_types_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceListWorkflowTypes" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:workflow_type_infos_of_yojson
            ~error_deserializer
  end
module PollForActivityTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : poll_for_activity_task_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.poll_for_activity_task_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServicePollForActivityTask" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:activity_task_of_yojson ~error_deserializer
  end
module PollForDecisionTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : poll_for_decision_task_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.poll_for_decision_task_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServicePollForDecisionTask" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:decision_task_of_yojson ~error_deserializer
  end
module RecordActivityTaskHeartbeat =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : record_activity_task_heartbeat_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.record_activity_task_heartbeat_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRecordActivityTaskHeartbeat"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:activity_task_status_of_yojson
            ~error_deserializer
  end
module RegisterActivityType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeAlreadyExistsFault") ->
              `TypeAlreadyExistsFault
                (type_already_exists_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_activity_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_activity_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRegisterActivityType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RegisterDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DomainAlreadyExistsFault") ->
              `DomainAlreadyExistsFault
                (domain_already_exists_fault_of_yojson tree path)
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TooManyTagsFault") ->
              `TooManyTagsFault (too_many_tags_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_domain_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.register_domain_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRegisterDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RegisterWorkflowType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeAlreadyExistsFault") ->
              `TypeAlreadyExistsFault
                (type_already_exists_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_workflow_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_workflow_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRegisterWorkflowType" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RequestCancelWorkflowExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : request_cancel_workflow_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.request_cancel_workflow_execution_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRequestCancelWorkflowExecution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RespondActivityTaskCanceled =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : respond_activity_task_canceled_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.respond_activity_task_canceled_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRespondActivityTaskCanceled"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RespondActivityTaskCompleted =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : respond_activity_task_completed_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.respond_activity_task_completed_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRespondActivityTaskCompleted"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RespondActivityTaskFailed =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : respond_activity_task_failed_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.respond_activity_task_failed_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRespondActivityTaskFailed"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RespondDecisionTaskCompleted =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : respond_decision_task_completed_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.respond_decision_task_completed_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceRespondDecisionTaskCompleted"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module SignalWorkflowExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : signal_workflow_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.signal_workflow_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceSignalWorkflowExecution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module StartWorkflowExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DefaultUndefinedFault") ->
              `DefaultUndefinedFault
                (default_undefined_fault_of_yojson tree path)
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeDeprecatedFault") ->
              `TypeDeprecatedFault
                (type_deprecated_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | (_, "WorkflowExecutionAlreadyStartedFault") ->
              `WorkflowExecutionAlreadyStartedFault
                (workflow_execution_already_started_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_workflow_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_workflow_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceStartWorkflowExecution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:run_of_yojson ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TooManyTagsFault") ->
              `TooManyTagsFault (too_many_tags_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module TerminateWorkflowExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : terminate_workflow_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.terminate_workflow_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceTerminateWorkflowExecution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UndeprecateActivityType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeAlreadyExistsFault") ->
              `TypeAlreadyExistsFault
                (type_already_exists_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : undeprecate_activity_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.undeprecate_activity_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceUndeprecateActivityType"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UndeprecateDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DomainAlreadyExistsFault") ->
              `DomainAlreadyExistsFault
                (domain_already_exists_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : undeprecate_domain_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.undeprecate_domain_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceUndeprecateDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UndeprecateWorkflowType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "TypeAlreadyExistsFault") ->
              `TypeAlreadyExistsFault
                (type_already_exists_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : undeprecate_workflow_type_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.undeprecate_workflow_type_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceUndeprecateWorkflowType"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededFault") ->
              `LimitExceededFault (limit_exceeded_fault_of_yojson tree path)
          | (_, "OperationNotPermittedFault") ->
              `OperationNotPermittedFault
                (operation_not_permitted_fault_of_yojson tree path)
          | (_, "UnknownResourceFault") ->
              `UnknownResourceFault
                (unknown_resource_fault_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"SimpleWorkflowServiceUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end