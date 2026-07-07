open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AttachInstances = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_instances_query) =
    let fields = attach_instances_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : attach_instances_query) =
    let fields = attach_instances_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AttachLoadBalancers = struct
  let error_to_string = function
    | `InstanceRefreshInProgressFault _ ->
        "com.amazonaws.autoscaling#InstanceRefreshInProgressFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InstanceRefreshInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_refresh_in_progress_fault_of_xml
        with
        | Ok s -> `InstanceRefreshInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_load_balancers_type) =
    let fields = attach_load_balancers_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachLoadBalancers"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:attach_load_balancers_result_type_of_xml ~error_deserializer

  let request_with_metadata context (request : attach_load_balancers_type) =
    let fields = attach_load_balancers_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachLoadBalancers"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:attach_load_balancers_result_type_of_xml ~error_deserializer
end

module AttachLoadBalancerTargetGroups = struct
  let error_to_string = function
    | `InstanceRefreshInProgressFault _ ->
        "com.amazonaws.autoscaling#InstanceRefreshInProgressFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InstanceRefreshInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_refresh_in_progress_fault_of_xml
        with
        | Ok s -> `InstanceRefreshInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_load_balancer_target_groups_type) =
    let fields = attach_load_balancer_target_groups_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachLoadBalancerTargetGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:attach_load_balancer_target_groups_result_type_of_xml ~error_deserializer

  let request_with_metadata context (request : attach_load_balancer_target_groups_type) =
    let fields = attach_load_balancer_target_groups_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachLoadBalancerTargetGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:attach_load_balancer_target_groups_result_type_of_xml ~error_deserializer
end

module AttachTrafficSources = struct
  let error_to_string = function
    | `InstanceRefreshInProgressFault _ ->
        "com.amazonaws.autoscaling#InstanceRefreshInProgressFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InstanceRefreshInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_refresh_in_progress_fault_of_xml
        with
        | Ok s -> `InstanceRefreshInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_traffic_sources_type) =
    let fields = attach_traffic_sources_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachTrafficSources"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:attach_traffic_sources_result_type_of_xml ~error_deserializer

  let request_with_metadata context (request : attach_traffic_sources_type) =
    let fields = attach_traffic_sources_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachTrafficSources"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:attach_traffic_sources_result_type_of_xml ~error_deserializer
end

module BatchDeleteScheduledAction = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : batch_delete_scheduled_action_type) =
    let fields = batch_delete_scheduled_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BatchDeleteScheduledAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:batch_delete_scheduled_action_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : batch_delete_scheduled_action_type) =
    let fields = batch_delete_scheduled_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BatchDeleteScheduledAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:batch_delete_scheduled_action_answer_of_xml ~error_deserializer
end

module BatchPutScheduledUpdateGroupAction = struct
  let error_to_string = function
    | `AlreadyExistsFault _ -> "com.amazonaws.autoscaling#AlreadyExistsFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_fault_of_xml
        with
        | Ok s -> `AlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : batch_put_scheduled_update_group_action_type) =
    let fields = batch_put_scheduled_update_group_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BatchPutScheduledUpdateGroupAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:batch_put_scheduled_update_group_action_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : batch_put_scheduled_update_group_action_type) =
    let fields = batch_put_scheduled_update_group_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BatchPutScheduledUpdateGroupAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:batch_put_scheduled_update_group_action_answer_of_xml ~error_deserializer
end

module CancelInstanceRefresh = struct
  let error_to_string = function
    | `ActiveInstanceRefreshNotFoundFault _ ->
        "com.amazonaws.autoscaling#ActiveInstanceRefreshNotFoundFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ActiveInstanceRefreshNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:active_instance_refresh_not_found_fault_of_xml
        with
        | Ok s -> `ActiveInstanceRefreshNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : cancel_instance_refresh_type) =
    let fields = cancel_instance_refresh_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CancelInstanceRefresh"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:cancel_instance_refresh_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : cancel_instance_refresh_type) =
    let fields = cancel_instance_refresh_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CancelInstanceRefresh"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:cancel_instance_refresh_answer_of_xml ~error_deserializer
end

module CompleteLifecycleAction = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : complete_lifecycle_action_type) =
    let fields = complete_lifecycle_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CompleteLifecycleAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:complete_lifecycle_action_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : complete_lifecycle_action_type) =
    let fields = complete_lifecycle_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CompleteLifecycleAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:complete_lifecycle_action_answer_of_xml ~error_deserializer
end

module CreateAutoScalingGroup = struct
  let error_to_string = function
    | `AlreadyExistsFault _ -> "com.amazonaws.autoscaling#AlreadyExistsFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_fault_of_xml
        with
        | Ok s -> `AlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_auto_scaling_group_type) =
    let fields = create_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : create_auto_scaling_group_type) =
    let fields = create_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module CreateLaunchConfiguration = struct
  let error_to_string = function
    | `AlreadyExistsFault _ -> "com.amazonaws.autoscaling#AlreadyExistsFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_fault_of_xml
        with
        | Ok s -> `AlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_launch_configuration_type) =
    let fields = create_launch_configuration_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateLaunchConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : create_launch_configuration_type) =
    let fields = create_launch_configuration_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateLaunchConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module CreateOrUpdateTags = struct
  let error_to_string = function
    | `AlreadyExistsFault _ -> "com.amazonaws.autoscaling#AlreadyExistsFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ResourceInUseFault _ -> "com.amazonaws.autoscaling#ResourceInUseFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_fault_of_xml
        with
        | Ok s -> `AlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_fault_of_xml
        with
        | Ok s -> `ResourceInUseFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_or_update_tags_type) =
    let fields = create_or_update_tags_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateOrUpdateTags"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : create_or_update_tags_type) =
    let fields = create_or_update_tags_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateOrUpdateTags"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteAutoScalingGroup = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ResourceInUseFault _ -> "com.amazonaws.autoscaling#ResourceInUseFault"
    | `ScalingActivityInProgressFault _ ->
        "com.amazonaws.autoscaling#ScalingActivityInProgressFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_fault_of_xml
        with
        | Ok s -> `ResourceInUseFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScalingActivityInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scaling_activity_in_progress_fault_of_xml
        with
        | Ok s -> `ScalingActivityInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_auto_scaling_group_type) =
    let fields = delete_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_auto_scaling_group_type) =
    let fields = delete_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteLaunchConfiguration = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ResourceInUseFault _ -> "com.amazonaws.autoscaling#ResourceInUseFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_fault_of_xml
        with
        | Ok s -> `ResourceInUseFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : launch_configuration_name_type) =
    let fields = launch_configuration_name_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteLaunchConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : launch_configuration_name_type) =
    let fields = launch_configuration_name_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteLaunchConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteLifecycleHook = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_lifecycle_hook_type) =
    let fields = delete_lifecycle_hook_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteLifecycleHook"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_lifecycle_hook_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_lifecycle_hook_type) =
    let fields = delete_lifecycle_hook_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteLifecycleHook"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_lifecycle_hook_answer_of_xml ~error_deserializer
end

module DeleteNotificationConfiguration = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_notification_configuration_type) =
    let fields = delete_notification_configuration_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteNotificationConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_notification_configuration_type) =
    let fields = delete_notification_configuration_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteNotificationConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeletePolicy = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_policy_type) =
    let fields = delete_policy_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeletePolicy"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_policy_type) =
    let fields = delete_policy_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeletePolicy"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteScheduledAction = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_scheduled_action_type) =
    let fields = delete_scheduled_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteScheduledAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_scheduled_action_type) =
    let fields = delete_scheduled_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteScheduledAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteTags = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ResourceInUseFault _ -> "com.amazonaws.autoscaling#ResourceInUseFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_fault_of_xml
        with
        | Ok s -> `ResourceInUseFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_tags_type) =
    let fields = delete_tags_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteTags"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_tags_type) =
    let fields = delete_tags_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteTags"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteWarmPool = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ResourceInUseFault _ -> "com.amazonaws.autoscaling#ResourceInUseFault"
    | `ScalingActivityInProgressFault _ ->
        "com.amazonaws.autoscaling#ScalingActivityInProgressFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_fault_of_xml
        with
        | Ok s -> `ResourceInUseFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScalingActivityInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scaling_activity_in_progress_fault_of_xml
        with
        | Ok s -> `ScalingActivityInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_warm_pool_type) =
    let fields = delete_warm_pool_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteWarmPool"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_warm_pool_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_warm_pool_type) =
    let fields = delete_warm_pool_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteWarmPool"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:delete_warm_pool_answer_of_xml ~error_deserializer
end

module DescribeAccountLimits = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_account_limits_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_account_limits_answer_of_xml ~error_deserializer
end

module DescribeAdjustmentTypes = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAdjustmentTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_adjustment_types_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAdjustmentTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_adjustment_types_answer_of_xml ~error_deserializer
end

module DescribeAutoScalingGroups = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : auto_scaling_group_names_type) =
    let fields = auto_scaling_group_names_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAutoScalingGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:auto_scaling_groups_type_of_xml ~error_deserializer

  let request_with_metadata context (request : auto_scaling_group_names_type) =
    let fields = auto_scaling_group_names_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAutoScalingGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:auto_scaling_groups_type_of_xml ~error_deserializer
end

module DescribeAutoScalingInstances = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_auto_scaling_instances_type) =
    let fields = describe_auto_scaling_instances_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAutoScalingInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:auto_scaling_instances_type_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_auto_scaling_instances_type) =
    let fields = describe_auto_scaling_instances_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAutoScalingInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:auto_scaling_instances_type_of_xml ~error_deserializer
end

module DescribeAutoScalingNotificationTypes = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAutoScalingNotificationTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_auto_scaling_notification_types_answer_of_xml
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DescribeAutoScalingNotificationTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_auto_scaling_notification_types_answer_of_xml
      ~error_deserializer
end

module DescribeInstanceRefreshes = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_instance_refreshes_type) =
    let fields = describe_instance_refreshes_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeInstanceRefreshes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_instance_refreshes_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_instance_refreshes_type) =
    let fields = describe_instance_refreshes_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeInstanceRefreshes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_instance_refreshes_answer_of_xml ~error_deserializer
end

module DescribeLaunchConfigurations = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : launch_configuration_names_type) =
    let fields = launch_configuration_names_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLaunchConfigurations"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:launch_configurations_type_of_xml ~error_deserializer

  let request_with_metadata context (request : launch_configuration_names_type) =
    let fields = launch_configuration_names_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLaunchConfigurations"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:launch_configurations_type_of_xml ~error_deserializer
end

module DescribeLifecycleHookTypes = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLifecycleHookTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_lifecycle_hook_types_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLifecycleHookTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_lifecycle_hook_types_answer_of_xml ~error_deserializer
end

module DescribeLifecycleHooks = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_lifecycle_hooks_type) =
    let fields = describe_lifecycle_hooks_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLifecycleHooks"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_lifecycle_hooks_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_lifecycle_hooks_type) =
    let fields = describe_lifecycle_hooks_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLifecycleHooks"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_lifecycle_hooks_answer_of_xml ~error_deserializer
end

module DescribeLoadBalancerTargetGroups = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_load_balancer_target_groups_request) =
    let fields = describe_load_balancer_target_groups_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancerTargetGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_load_balancer_target_groups_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_load_balancer_target_groups_request) =
    let fields = describe_load_balancer_target_groups_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancerTargetGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_load_balancer_target_groups_response_of_xml ~error_deserializer
end

module DescribeLoadBalancers = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_load_balancers_request) =
    let fields = describe_load_balancers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancers"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_load_balancers_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_load_balancers_request) =
    let fields = describe_load_balancers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancers"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_load_balancers_response_of_xml ~error_deserializer
end

module DescribeMetricCollectionTypes = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeMetricCollectionTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_metric_collection_types_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeMetricCollectionTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_metric_collection_types_answer_of_xml ~error_deserializer
end

module DescribeNotificationConfigurations = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_notification_configurations_type) =
    let fields = describe_notification_configurations_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeNotificationConfigurations"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_notification_configurations_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_notification_configurations_type) =
    let fields = describe_notification_configurations_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeNotificationConfigurations"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_notification_configurations_answer_of_xml ~error_deserializer
end

module DescribePolicies = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_policies_type) =
    let fields = describe_policies_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribePolicies"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:policies_type_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_policies_type) =
    let fields = describe_policies_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribePolicies"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:policies_type_of_xml ~error_deserializer
end

module DescribeScalingActivities = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_scaling_activities_type) =
    let fields = describe_scaling_activities_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeScalingActivities"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:activities_type_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_scaling_activities_type) =
    let fields = describe_scaling_activities_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeScalingActivities"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:activities_type_of_xml ~error_deserializer
end

module DescribeScalingProcessTypes = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeScalingProcessTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:processes_type_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeScalingProcessTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:processes_type_of_xml ~error_deserializer
end

module DescribeScheduledActions = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_scheduled_actions_type) =
    let fields = describe_scheduled_actions_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeScheduledActions"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_actions_type_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_scheduled_actions_type) =
    let fields = describe_scheduled_actions_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeScheduledActions"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:scheduled_actions_type_of_xml ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_tags_type) =
    let fields = describe_tags_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTags"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:tags_type_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_tags_type) =
    let fields = describe_tags_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTags"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:tags_type_of_xml ~error_deserializer
end

module DescribeTerminationPolicyTypes = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTerminationPolicyTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_termination_policy_types_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTerminationPolicyTypes"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_termination_policy_types_answer_of_xml ~error_deserializer
end

module DescribeTrafficSources = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_traffic_sources_request) =
    let fields = describe_traffic_sources_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTrafficSources"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_traffic_sources_response_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_traffic_sources_request) =
    let fields = describe_traffic_sources_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTrafficSources"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_traffic_sources_response_of_xml ~error_deserializer
end

module DescribeWarmPool = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.autoscaling#InvalidNextToken"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_warm_pool_type) =
    let fields = describe_warm_pool_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeWarmPool"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_warm_pool_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_warm_pool_type) =
    let fields = describe_warm_pool_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeWarmPool"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:describe_warm_pool_answer_of_xml ~error_deserializer
end

module DetachInstances = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_instances_query) =
    let fields = detach_instances_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_instances_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : detach_instances_query) =
    let fields = detach_instances_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_instances_answer_of_xml ~error_deserializer
end

module DetachLoadBalancerTargetGroups = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_load_balancer_target_groups_type) =
    let fields = detach_load_balancer_target_groups_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachLoadBalancerTargetGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_load_balancer_target_groups_result_type_of_xml ~error_deserializer

  let request_with_metadata context (request : detach_load_balancer_target_groups_type) =
    let fields = detach_load_balancer_target_groups_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachLoadBalancerTargetGroups"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_load_balancer_target_groups_result_type_of_xml ~error_deserializer
end

module DetachLoadBalancers = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_load_balancers_type) =
    let fields = detach_load_balancers_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachLoadBalancers"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_load_balancers_result_type_of_xml ~error_deserializer

  let request_with_metadata context (request : detach_load_balancers_type) =
    let fields = detach_load_balancers_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachLoadBalancers"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_load_balancers_result_type_of_xml ~error_deserializer
end

module DetachTrafficSources = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_traffic_sources_type) =
    let fields = detach_traffic_sources_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachTrafficSources"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_traffic_sources_result_type_of_xml ~error_deserializer

  let request_with_metadata context (request : detach_traffic_sources_type) =
    let fields = detach_traffic_sources_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachTrafficSources"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:detach_traffic_sources_result_type_of_xml ~error_deserializer
end

module DisableMetricsCollection = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_metrics_collection_query) =
    let fields = disable_metrics_collection_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableMetricsCollection"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : disable_metrics_collection_query) =
    let fields = disable_metrics_collection_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisableMetricsCollection"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module EnableMetricsCollection = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_metrics_collection_query) =
    let fields = enable_metrics_collection_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableMetricsCollection"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : enable_metrics_collection_query) =
    let fields = enable_metrics_collection_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableMetricsCollection"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module EnterStandby = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enter_standby_query) =
    let fields = enter_standby_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnterStandby"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:enter_standby_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : enter_standby_query) =
    let fields = enter_standby_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnterStandby"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:enter_standby_answer_of_xml ~error_deserializer
end

module ExecutePolicy = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ScalingActivityInProgressFault _ ->
        "com.amazonaws.autoscaling#ScalingActivityInProgressFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScalingActivityInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scaling_activity_in_progress_fault_of_xml
        with
        | Ok s -> `ScalingActivityInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : execute_policy_type) =
    let fields = execute_policy_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ExecutePolicy"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : execute_policy_type) =
    let fields = execute_policy_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ExecutePolicy"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module ExitStandby = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : exit_standby_query) =
    let fields = exit_standby_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ExitStandby"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:exit_standby_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : exit_standby_query) =
    let fields = exit_standby_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ExitStandby"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:exit_standby_answer_of_xml ~error_deserializer
end

module GetPredictiveScalingForecast = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_predictive_scaling_forecast_type) =
    let fields = get_predictive_scaling_forecast_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetPredictiveScalingForecast"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:get_predictive_scaling_forecast_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : get_predictive_scaling_forecast_type) =
    let fields = get_predictive_scaling_forecast_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetPredictiveScalingForecast"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:get_predictive_scaling_forecast_answer_of_xml ~error_deserializer
end

module LaunchInstances = struct
  let error_to_string = function
    | `IdempotentParameterMismatchError _ ->
        "com.amazonaws.autoscaling#IdempotentParameterMismatchError"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "IdempotentParameterMismatch" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:idempotent_parameter_mismatch_error_of_xml
        with
        | Ok s -> `IdempotentParameterMismatchError s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : launch_instances_request) =
    let fields = launch_instances_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"LaunchInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:launch_instances_result_of_xml ~error_deserializer

  let request_with_metadata context (request : launch_instances_request) =
    let fields = launch_instances_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"LaunchInstances"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:launch_instances_result_of_xml ~error_deserializer
end

module PutLifecycleHook = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_lifecycle_hook_type) =
    let fields = put_lifecycle_hook_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutLifecycleHook"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:put_lifecycle_hook_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : put_lifecycle_hook_type) =
    let fields = put_lifecycle_hook_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutLifecycleHook"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:put_lifecycle_hook_answer_of_xml ~error_deserializer
end

module PutNotificationConfiguration = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_notification_configuration_type) =
    let fields = put_notification_configuration_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutNotificationConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_notification_configuration_type) =
    let fields = put_notification_configuration_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutNotificationConfiguration"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutScalingPolicy = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_scaling_policy_type) =
    let fields = put_scaling_policy_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutScalingPolicy"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:policy_arn_type_of_xml ~error_deserializer

  let request_with_metadata context (request : put_scaling_policy_type) =
    let fields = put_scaling_policy_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutScalingPolicy"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:policy_arn_type_of_xml ~error_deserializer
end

module PutScheduledUpdateGroupAction = struct
  let error_to_string = function
    | `AlreadyExistsFault _ -> "com.amazonaws.autoscaling#AlreadyExistsFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_fault_of_xml
        with
        | Ok s -> `AlreadyExistsFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_scheduled_update_group_action_type) =
    let fields = put_scheduled_update_group_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutScheduledUpdateGroupAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_scheduled_update_group_action_type) =
    let fields = put_scheduled_update_group_action_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutScheduledUpdateGroupAction"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutWarmPool = struct
  let error_to_string = function
    | `InstanceRefreshInProgressFault _ ->
        "com.amazonaws.autoscaling#InstanceRefreshInProgressFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InstanceRefreshInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_refresh_in_progress_fault_of_xml
        with
        | Ok s -> `InstanceRefreshInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_warm_pool_type) =
    let fields = put_warm_pool_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutWarmPool"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:put_warm_pool_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : put_warm_pool_type) =
    let fields = put_warm_pool_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutWarmPool"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:put_warm_pool_answer_of_xml ~error_deserializer
end

module RecordLifecycleActionHeartbeat = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : record_lifecycle_action_heartbeat_type) =
    let fields = record_lifecycle_action_heartbeat_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RecordLifecycleActionHeartbeat"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:record_lifecycle_action_heartbeat_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : record_lifecycle_action_heartbeat_type) =
    let fields = record_lifecycle_action_heartbeat_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RecordLifecycleActionHeartbeat"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:record_lifecycle_action_heartbeat_answer_of_xml ~error_deserializer
end

module ResumeProcesses = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ResourceInUseFault _ -> "com.amazonaws.autoscaling#ResourceInUseFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_fault_of_xml
        with
        | Ok s -> `ResourceInUseFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : scaling_process_query) =
    let fields = scaling_process_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResumeProcesses"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : scaling_process_query) =
    let fields = scaling_process_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResumeProcesses"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RollbackInstanceRefresh = struct
  let error_to_string = function
    | `ActiveInstanceRefreshNotFoundFault _ ->
        "com.amazonaws.autoscaling#ActiveInstanceRefreshNotFoundFault"
    | `IrreversibleInstanceRefreshFault _ ->
        "com.amazonaws.autoscaling#IrreversibleInstanceRefreshFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ActiveInstanceRefreshNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:active_instance_refresh_not_found_fault_of_xml
        with
        | Ok s -> `ActiveInstanceRefreshNotFoundFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IrreversibleInstanceRefresh" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:irreversible_instance_refresh_fault_of_xml
        with
        | Ok s -> `IrreversibleInstanceRefreshFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : rollback_instance_refresh_type) =
    let fields = rollback_instance_refresh_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RollbackInstanceRefresh"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:rollback_instance_refresh_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : rollback_instance_refresh_type) =
    let fields = rollback_instance_refresh_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RollbackInstanceRefresh"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:rollback_instance_refresh_answer_of_xml ~error_deserializer
end

module SetDesiredCapacity = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ScalingActivityInProgressFault _ ->
        "com.amazonaws.autoscaling#ScalingActivityInProgressFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScalingActivityInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scaling_activity_in_progress_fault_of_xml
        with
        | Ok s -> `ScalingActivityInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_desired_capacity_type) =
    let fields = set_desired_capacity_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetDesiredCapacity"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_desired_capacity_type) =
    let fields = set_desired_capacity_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetDesiredCapacity"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetInstanceHealth = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_instance_health_query) =
    let fields = set_instance_health_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetInstanceHealth"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_instance_health_query) =
    let fields = set_instance_health_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetInstanceHealth"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetInstanceProtection = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_instance_protection_query) =
    let fields = set_instance_protection_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetInstanceProtection"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:set_instance_protection_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : set_instance_protection_query) =
    let fields = set_instance_protection_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetInstanceProtection"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:set_instance_protection_answer_of_xml ~error_deserializer
end

module StartInstanceRefresh = struct
  let error_to_string = function
    | `InstanceRefreshInProgressFault _ ->
        "com.amazonaws.autoscaling#InstanceRefreshInProgressFault"
    | `LimitExceededFault _ -> "com.amazonaws.autoscaling#LimitExceededFault"
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InstanceRefreshInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:instance_refresh_in_progress_fault_of_xml
        with
        | Ok s -> `InstanceRefreshInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_instance_refresh_type) =
    let fields = start_instance_refresh_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartInstanceRefresh"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:start_instance_refresh_answer_of_xml ~error_deserializer

  let request_with_metadata context (request : start_instance_refresh_type) =
    let fields = start_instance_refresh_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartInstanceRefresh"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:start_instance_refresh_answer_of_xml ~error_deserializer
end

module SuspendProcesses = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ResourceInUseFault _ -> "com.amazonaws.autoscaling#ResourceInUseFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_fault_of_xml
        with
        | Ok s -> `ResourceInUseFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : scaling_process_query) =
    let fields = scaling_process_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SuspendProcesses"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : scaling_process_query) =
    let fields = scaling_process_query_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SuspendProcesses"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TerminateInstanceInAutoScalingGroup = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ScalingActivityInProgressFault _ ->
        "com.amazonaws.autoscaling#ScalingActivityInProgressFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScalingActivityInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scaling_activity_in_progress_fault_of_xml
        with
        | Ok s -> `ScalingActivityInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : terminate_instance_in_auto_scaling_group_type) =
    let fields = terminate_instance_in_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TerminateInstanceInAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:activity_type_of_xml ~error_deserializer

  let request_with_metadata context (request : terminate_instance_in_auto_scaling_group_type) =
    let fields = terminate_instance_in_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TerminateInstanceInAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:activity_type_of_xml ~error_deserializer
end

module UpdateAutoScalingGroup = struct
  let error_to_string = function
    | `ResourceContentionFault _ -> "com.amazonaws.autoscaling#ResourceContentionFault"
    | `ScalingActivityInProgressFault _ ->
        "com.amazonaws.autoscaling#ScalingActivityInProgressFault"
    | `ServiceLinkedRoleFailure _ -> "com.amazonaws.autoscaling#ServiceLinkedRoleFailure"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceContention" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_contention_fault_of_xml
        with
        | Ok s -> `ResourceContentionFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ScalingActivityInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:scaling_activity_in_progress_fault_of_xml
        with
        | Ok s -> `ScalingActivityInProgressFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceLinkedRoleFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_linked_role_failure_of_xml
        with
        | Ok s -> `ServiceLinkedRoleFailure s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_auto_scaling_group_type) =
    let fields = update_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_auto_scaling_group_type) =
    let fields = update_auto_scaling_group_type_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateAutoScalingGroup"
      ~xmlNamespace:"http://autoscaling.amazonaws.com/doc/2011-01-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end
