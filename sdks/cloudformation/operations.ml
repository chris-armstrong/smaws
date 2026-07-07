open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module ActivateOrganizationsAccess = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationNotFoundException _ -> "com.amazonaws.cloudformation#OperationNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_found_exception_of_xml
        with
        | Ok s -> `OperationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : activate_organizations_access_input) =
    let fields = activate_organizations_access_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ActivateOrganizationsAccess"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:activate_organizations_access_output_of_xml ~error_deserializer

  let request_with_metadata context (request : activate_organizations_access_input) =
    let fields = activate_organizations_access_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ActivateOrganizationsAccess"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:activate_organizations_access_output_of_xml ~error_deserializer
end

module ActivateType = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : activate_type_input) =
    let fields = activate_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ActivateType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:activate_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : activate_type_input) =
    let fields = activate_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ActivateType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:activate_type_output_of_xml ~error_deserializer
end

module BatchDescribeTypeConfigurations = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeConfigurationNotFoundException _ ->
        "com.amazonaws.cloudformation#TypeConfigurationNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeConfigurationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_configuration_not_found_exception_of_xml
        with
        | Ok s -> `TypeConfigurationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : batch_describe_type_configurations_input) =
    let fields = batch_describe_type_configurations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"BatchDescribeTypeConfigurations"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:batch_describe_type_configurations_output_of_xml ~error_deserializer

  let request_with_metadata context (request : batch_describe_type_configurations_input) =
    let fields = batch_describe_type_configurations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"BatchDescribeTypeConfigurations"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:batch_describe_type_configurations_output_of_xml ~error_deserializer
end

module CancelUpdateStack = struct
  let error_to_string = function
    | `TokenAlreadyExistsException _ -> "com.amazonaws.cloudformation#TokenAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TokenAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:token_already_exists_exception_of_xml
        with
        | Ok s -> `TokenAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : cancel_update_stack_input) =
    let fields = cancel_update_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CancelUpdateStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : cancel_update_stack_input) =
    let fields = cancel_update_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CancelUpdateStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module ContinueUpdateRollback = struct
  let error_to_string = function
    | `TokenAlreadyExistsException _ -> "com.amazonaws.cloudformation#TokenAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TokenAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:token_already_exists_exception_of_xml
        with
        | Ok s -> `TokenAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : continue_update_rollback_input) =
    let fields = continue_update_rollback_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ContinueUpdateRollback"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:continue_update_rollback_output_of_xml ~error_deserializer

  let request_with_metadata context (request : continue_update_rollback_input) =
    let fields = continue_update_rollback_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ContinueUpdateRollback"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:continue_update_rollback_output_of_xml ~error_deserializer
end

module CreateChangeSet = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudformation#AlreadyExistsException"
    | `InsufficientCapabilitiesException _ ->
        "com.amazonaws.cloudformation#InsufficientCapabilitiesException"
    | `LimitExceededException _ -> "com.amazonaws.cloudformation#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCapabilitiesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_capabilities_exception_of_xml
        with
        | Ok s -> `InsufficientCapabilitiesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_change_set_input) =
    let fields = create_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_change_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_change_set_input) =
    let fields = create_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_change_set_output_of_xml ~error_deserializer
end

module CreateGeneratedTemplate = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudformation#AlreadyExistsException"
    | `ConcurrentResourcesLimitExceededException _ ->
        "com.amazonaws.cloudformation#ConcurrentResourcesLimitExceededException"
    | `LimitExceededException _ -> "com.amazonaws.cloudformation#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConcurrentResourcesLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_resources_limit_exceeded_exception_of_xml
        with
        | Ok s -> `ConcurrentResourcesLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_generated_template_input) =
    let fields = create_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_generated_template_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_generated_template_input) =
    let fields = create_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_generated_template_output_of_xml ~error_deserializer
end

module CreateStack = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudformation#AlreadyExistsException"
    | `InsufficientCapabilitiesException _ ->
        "com.amazonaws.cloudformation#InsufficientCapabilitiesException"
    | `LimitExceededException _ -> "com.amazonaws.cloudformation#LimitExceededException"
    | `TokenAlreadyExistsException _ -> "com.amazonaws.cloudformation#TokenAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCapabilitiesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_capabilities_exception_of_xml
        with
        | Ok s -> `InsufficientCapabilitiesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TokenAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:token_already_exists_exception_of_xml
        with
        | Ok s -> `TokenAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_stack_input) =
    let fields = create_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_stack_input) =
    let fields = create_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_output_of_xml ~error_deserializer
end

module CreateStackInstances = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.cloudformation#LimitExceededException"
    | `OperationIdAlreadyExistsException _ ->
        "com.amazonaws.cloudformation#OperationIdAlreadyExistsException"
    | `OperationInProgressException _ -> "com.amazonaws.cloudformation#OperationInProgressException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | `StaleRequestException _ -> "com.amazonaws.cloudformation#StaleRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationIdAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_id_already_exists_exception_of_xml
        with
        | Ok s -> `OperationIdAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleRequestException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_request_exception_of_xml
        with
        | Ok s -> `StaleRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_stack_instances_input) =
    let fields = create_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_instances_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_stack_instances_input) =
    let fields = create_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_instances_output_of_xml ~error_deserializer
end

module CreateStackRefactor = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_stack_refactor_input) =
    let fields = create_stack_refactor_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateStackRefactor"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_refactor_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_stack_refactor_input) =
    let fields = create_stack_refactor_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateStackRefactor"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_refactor_output_of_xml ~error_deserializer
end

module CreateStackSet = struct
  let error_to_string = function
    | `CreatedButModifiedException _ -> "com.amazonaws.cloudformation#CreatedButModifiedException"
    | `LimitExceededException _ -> "com.amazonaws.cloudformation#LimitExceededException"
    | `NameAlreadyExistsException _ -> "com.amazonaws.cloudformation#NameAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CreatedButModifiedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:created_but_modified_exception_of_xml
        with
        | Ok s -> `CreatedButModifiedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NameAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:name_already_exists_exception_of_xml
        with
        | Ok s -> `NameAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_stack_set_input) =
    let fields = create_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_stack_set_input) =
    let fields = create_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:create_stack_set_output_of_xml ~error_deserializer
end

module DeactivateOrganizationsAccess = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationNotFoundException _ -> "com.amazonaws.cloudformation#OperationNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_found_exception_of_xml
        with
        | Ok s -> `OperationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deactivate_organizations_access_input) =
    let fields = deactivate_organizations_access_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeactivateOrganizationsAccess"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:deactivate_organizations_access_output_of_xml ~error_deserializer

  let request_with_metadata context (request : deactivate_organizations_access_input) =
    let fields = deactivate_organizations_access_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeactivateOrganizationsAccess"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:deactivate_organizations_access_output_of_xml ~error_deserializer
end

module DeactivateType = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deactivate_type_input) =
    let fields = deactivate_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeactivateType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:deactivate_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : deactivate_type_input) =
    let fields = deactivate_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeactivateType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:deactivate_type_output_of_xml ~error_deserializer
end

module DeleteChangeSet = struct
  let error_to_string = function
    | `InvalidChangeSetStatusException _ ->
        "com.amazonaws.cloudformation#InvalidChangeSetStatusException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidChangeSetStatus" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_change_set_status_exception_of_xml
        with
        | Ok s -> `InvalidChangeSetStatusException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_change_set_input) =
    let fields = delete_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:delete_change_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_change_set_input) =
    let fields = delete_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:delete_change_set_output_of_xml ~error_deserializer
end

module DeleteGeneratedTemplate = struct
  let error_to_string = function
    | `ConcurrentResourcesLimitExceededException _ ->
        "com.amazonaws.cloudformation#ConcurrentResourcesLimitExceededException"
    | `GeneratedTemplateNotFoundException _ ->
        "com.amazonaws.cloudformation#GeneratedTemplateNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentResourcesLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_resources_limit_exceeded_exception_of_xml
        with
        | Ok s -> `ConcurrentResourcesLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GeneratedTemplateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:generated_template_not_found_exception_of_xml
        with
        | Ok s -> `GeneratedTemplateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_generated_template_input) =
    let fields = delete_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_generated_template_input) =
    let fields = delete_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteStack = struct
  let error_to_string = function
    | `TokenAlreadyExistsException _ -> "com.amazonaws.cloudformation#TokenAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TokenAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:token_already_exists_exception_of_xml
        with
        | Ok s -> `TokenAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_stack_input) =
    let fields = delete_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_stack_input) =
    let fields = delete_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteStackInstances = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationIdAlreadyExistsException _ ->
        "com.amazonaws.cloudformation#OperationIdAlreadyExistsException"
    | `OperationInProgressException _ -> "com.amazonaws.cloudformation#OperationInProgressException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | `StaleRequestException _ -> "com.amazonaws.cloudformation#StaleRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationIdAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_id_already_exists_exception_of_xml
        with
        | Ok s -> `OperationIdAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleRequestException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_request_exception_of_xml
        with
        | Ok s -> `StaleRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_stack_instances_input) =
    let fields = delete_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:delete_stack_instances_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_stack_instances_input) =
    let fields = delete_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:delete_stack_instances_output_of_xml ~error_deserializer
end

module DeleteStackSet = struct
  let error_to_string = function
    | `OperationInProgressException _ -> "com.amazonaws.cloudformation#OperationInProgressException"
    | `StackSetNotEmptyException _ -> "com.amazonaws.cloudformation#StackSetNotEmptyException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationInProgressException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotEmptyException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_empty_exception_of_xml
        with
        | Ok s -> `StackSetNotEmptyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_stack_set_input) =
    let fields = delete_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:delete_stack_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_stack_set_input) =
    let fields = delete_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:delete_stack_set_output_of_xml ~error_deserializer
end

module DeregisterType = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deregister_type_input) =
    let fields = deregister_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeregisterType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:deregister_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : deregister_type_input) =
    let fields = deregister_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeregisterType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:deregister_type_output_of_xml ~error_deserializer
end

module DescribeAccountLimits = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_account_limits_input) =
    let fields = describe_account_limits_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_account_limits_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_account_limits_input) =
    let fields = describe_account_limits_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_account_limits_output_of_xml ~error_deserializer
end

module DescribeChangeSet = struct
  let error_to_string = function
    | `ChangeSetNotFoundException _ -> "com.amazonaws.cloudformation#ChangeSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ChangeSetNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:change_set_not_found_exception_of_xml
        with
        | Ok s -> `ChangeSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_change_set_input) =
    let fields = describe_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_change_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_change_set_input) =
    let fields = describe_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_change_set_output_of_xml ~error_deserializer
end

module DescribeChangeSetHooks = struct
  let error_to_string = function
    | `ChangeSetNotFoundException _ -> "com.amazonaws.cloudformation#ChangeSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ChangeSetNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:change_set_not_found_exception_of_xml
        with
        | Ok s -> `ChangeSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_change_set_hooks_input) =
    let fields = describe_change_set_hooks_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeChangeSetHooks"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_change_set_hooks_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_change_set_hooks_input) =
    let fields = describe_change_set_hooks_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeChangeSetHooks"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_change_set_hooks_output_of_xml ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_events_input) =
    let fields = describe_events_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEvents"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_events_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_events_input) =
    let fields = describe_events_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEvents"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_events_output_of_xml ~error_deserializer
end

module DescribeGeneratedTemplate = struct
  let error_to_string = function
    | `GeneratedTemplateNotFoundException _ ->
        "com.amazonaws.cloudformation#GeneratedTemplateNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GeneratedTemplateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:generated_template_not_found_exception_of_xml
        with
        | Ok s -> `GeneratedTemplateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_generated_template_input) =
    let fields = describe_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_generated_template_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_generated_template_input) =
    let fields = describe_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_generated_template_output_of_xml ~error_deserializer
end

module DescribeOrganizationsAccess = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationNotFoundException _ -> "com.amazonaws.cloudformation#OperationNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_found_exception_of_xml
        with
        | Ok s -> `OperationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_organizations_access_input) =
    let fields = describe_organizations_access_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeOrganizationsAccess"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_organizations_access_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_organizations_access_input) =
    let fields = describe_organizations_access_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeOrganizationsAccess"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_organizations_access_output_of_xml ~error_deserializer
end

module DescribePublisher = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_publisher_input) =
    let fields = describe_publisher_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribePublisher"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_publisher_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_publisher_input) =
    let fields = describe_publisher_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribePublisher"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_publisher_output_of_xml ~error_deserializer
end

module DescribeResourceScan = struct
  let error_to_string = function
    | `ResourceScanNotFoundException _ ->
        "com.amazonaws.cloudformation#ResourceScanNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceScanNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_scan_not_found_exception_of_xml
        with
        | Ok s -> `ResourceScanNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_resource_scan_input) =
    let fields = describe_resource_scan_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeResourceScan"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_resource_scan_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_resource_scan_input) =
    let fields = describe_resource_scan_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeResourceScan"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_resource_scan_output_of_xml ~error_deserializer
end

module DescribeStackDriftDetectionStatus = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_drift_detection_status_input) =
    let fields = describe_stack_drift_detection_status_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackDriftDetectionStatus"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_drift_detection_status_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_drift_detection_status_input) =
    let fields = describe_stack_drift_detection_status_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackDriftDetectionStatus"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_drift_detection_status_output_of_xml ~error_deserializer
end

module DescribeStackEvents = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_events_input) =
    let fields = describe_stack_events_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackEvents"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_events_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_events_input) =
    let fields = describe_stack_events_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackEvents"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_events_output_of_xml ~error_deserializer
end

module DescribeStackInstance = struct
  let error_to_string = function
    | `StackInstanceNotFoundException _ ->
        "com.amazonaws.cloudformation#StackInstanceNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "StackInstanceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_instance_not_found_exception_of_xml
        with
        | Ok s -> `StackInstanceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_instance_input) =
    let fields = describe_stack_instance_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackInstance"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_instance_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_instance_input) =
    let fields = describe_stack_instance_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackInstance"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_instance_output_of_xml ~error_deserializer
end

module DescribeStackRefactor = struct
  let error_to_string = function
    | `StackRefactorNotFoundException _ ->
        "com.amazonaws.cloudformation#StackRefactorNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "StackRefactorNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_refactor_not_found_exception_of_xml
        with
        | Ok s -> `StackRefactorNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_refactor_input) =
    let fields = describe_stack_refactor_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackRefactor"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_refactor_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_refactor_input) =
    let fields = describe_stack_refactor_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackRefactor"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_refactor_output_of_xml ~error_deserializer
end

module DescribeStackResource = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_resource_input) =
    let fields = describe_stack_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackResource"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_resource_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_resource_input) =
    let fields = describe_stack_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackResource"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_resource_output_of_xml ~error_deserializer
end

module DescribeStackResourceDrifts = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_resource_drifts_input) =
    let fields = describe_stack_resource_drifts_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackResourceDrifts"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_resource_drifts_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_resource_drifts_input) =
    let fields = describe_stack_resource_drifts_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackResourceDrifts"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_resource_drifts_output_of_xml ~error_deserializer
end

module DescribeStackResources = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_resources_input) =
    let fields = describe_stack_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_resources_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_resources_input) =
    let fields = describe_stack_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_resources_output_of_xml ~error_deserializer
end

module DescribeStackSet = struct
  let error_to_string = function
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_set_input) =
    let fields = describe_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_set_input) =
    let fields = describe_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_set_output_of_xml ~error_deserializer
end

module DescribeStackSetOperation = struct
  let error_to_string = function
    | `OperationNotFoundException _ -> "com.amazonaws.cloudformation#OperationNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_found_exception_of_xml
        with
        | Ok s -> `OperationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stack_set_operation_input) =
    let fields = describe_stack_set_operation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStackSetOperation"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_set_operation_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stack_set_operation_input) =
    let fields = describe_stack_set_operation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStackSetOperation"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stack_set_operation_output_of_xml ~error_deserializer
end

module DescribeStacks = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_stacks_input) =
    let fields = describe_stacks_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeStacks"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stacks_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_stacks_input) =
    let fields = describe_stacks_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeStacks"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_stacks_output_of_xml ~error_deserializer
end

module DescribeType = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_type_input) =
    let fields = describe_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_type_input) =
    let fields = describe_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_type_output_of_xml ~error_deserializer
end

module DescribeTypeRegistration = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_type_registration_input) =
    let fields = describe_type_registration_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTypeRegistration"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_type_registration_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_type_registration_input) =
    let fields = describe_type_registration_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTypeRegistration"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:describe_type_registration_output_of_xml ~error_deserializer
end

module DetectStackDrift = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detect_stack_drift_input) =
    let fields = detect_stack_drift_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetectStackDrift"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:detect_stack_drift_output_of_xml ~error_deserializer

  let request_with_metadata context (request : detect_stack_drift_input) =
    let fields = detect_stack_drift_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetectStackDrift"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:detect_stack_drift_output_of_xml ~error_deserializer
end

module DetectStackResourceDrift = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detect_stack_resource_drift_input) =
    let fields = detect_stack_resource_drift_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetectStackResourceDrift"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:detect_stack_resource_drift_output_of_xml ~error_deserializer

  let request_with_metadata context (request : detect_stack_resource_drift_input) =
    let fields = detect_stack_resource_drift_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetectStackResourceDrift"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:detect_stack_resource_drift_output_of_xml ~error_deserializer
end

module DetectStackSetDrift = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationInProgressException _ -> "com.amazonaws.cloudformation#OperationInProgressException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detect_stack_set_drift_input) =
    let fields = detect_stack_set_drift_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetectStackSetDrift"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:detect_stack_set_drift_output_of_xml ~error_deserializer

  let request_with_metadata context (request : detect_stack_set_drift_input) =
    let fields = detect_stack_set_drift_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetectStackSetDrift"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:detect_stack_set_drift_output_of_xml ~error_deserializer
end

module EstimateTemplateCost = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : estimate_template_cost_input) =
    let fields = estimate_template_cost_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EstimateTemplateCost"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:estimate_template_cost_output_of_xml ~error_deserializer

  let request_with_metadata context (request : estimate_template_cost_input) =
    let fields = estimate_template_cost_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EstimateTemplateCost"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:estimate_template_cost_output_of_xml ~error_deserializer
end

module ExecuteChangeSet = struct
  let error_to_string = function
    | `ChangeSetNotFoundException _ -> "com.amazonaws.cloudformation#ChangeSetNotFoundException"
    | `InsufficientCapabilitiesException _ ->
        "com.amazonaws.cloudformation#InsufficientCapabilitiesException"
    | `InvalidChangeSetStatusException _ ->
        "com.amazonaws.cloudformation#InvalidChangeSetStatusException"
    | `TokenAlreadyExistsException _ -> "com.amazonaws.cloudformation#TokenAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ChangeSetNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:change_set_not_found_exception_of_xml
        with
        | Ok s -> `ChangeSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCapabilitiesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_capabilities_exception_of_xml
        with
        | Ok s -> `InsufficientCapabilitiesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidChangeSetStatus" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_change_set_status_exception_of_xml
        with
        | Ok s -> `InvalidChangeSetStatusException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TokenAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:token_already_exists_exception_of_xml
        with
        | Ok s -> `TokenAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : execute_change_set_input) =
    let fields = execute_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ExecuteChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:execute_change_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : execute_change_set_input) =
    let fields = execute_change_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ExecuteChangeSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:execute_change_set_output_of_xml ~error_deserializer
end

module ExecuteStackRefactor = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : execute_stack_refactor_input) =
    let fields = execute_stack_refactor_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ExecuteStackRefactor"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : execute_stack_refactor_input) =
    let fields = execute_stack_refactor_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ExecuteStackRefactor"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module GetGeneratedTemplate = struct
  let error_to_string = function
    | `GeneratedTemplateNotFoundException _ ->
        "com.amazonaws.cloudformation#GeneratedTemplateNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "GeneratedTemplateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:generated_template_not_found_exception_of_xml
        with
        | Ok s -> `GeneratedTemplateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_generated_template_input) =
    let fields = get_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_generated_template_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_generated_template_input) =
    let fields = get_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_generated_template_output_of_xml ~error_deserializer
end

module GetHookResult = struct
  let error_to_string = function
    | `HookResultNotFoundException _ -> "com.amazonaws.cloudformation#HookResultNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HookResultNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hook_result_not_found_exception_of_xml
        with
        | Ok s -> `HookResultNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_hook_result_input) =
    let fields = get_hook_result_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetHookResult"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_hook_result_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_hook_result_input) =
    let fields = get_hook_result_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetHookResult"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_hook_result_output_of_xml ~error_deserializer
end

module GetStackPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_stack_policy_input) =
    let fields = get_stack_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetStackPolicy"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_stack_policy_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_stack_policy_input) =
    let fields = get_stack_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetStackPolicy"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_stack_policy_output_of_xml ~error_deserializer
end

module GetTemplate = struct
  let error_to_string = function
    | `ChangeSetNotFoundException _ -> "com.amazonaws.cloudformation#ChangeSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ChangeSetNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:change_set_not_found_exception_of_xml
        with
        | Ok s -> `ChangeSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_template_input) =
    let fields = get_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_template_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_template_input) =
    let fields = get_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_template_output_of_xml ~error_deserializer
end

module GetTemplateSummary = struct
  let error_to_string = function
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_template_summary_input) =
    let fields = get_template_summary_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetTemplateSummary"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_template_summary_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_template_summary_input) =
    let fields = get_template_summary_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetTemplateSummary"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:get_template_summary_output_of_xml ~error_deserializer
end

module ImportStacksToStackSet = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `LimitExceededException _ -> "com.amazonaws.cloudformation#LimitExceededException"
    | `OperationIdAlreadyExistsException _ ->
        "com.amazonaws.cloudformation#OperationIdAlreadyExistsException"
    | `OperationInProgressException _ -> "com.amazonaws.cloudformation#OperationInProgressException"
    | `StackNotFoundException _ -> "com.amazonaws.cloudformation#StackNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | `StaleRequestException _ -> "com.amazonaws.cloudformation#StaleRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationIdAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_id_already_exists_exception_of_xml
        with
        | Ok s -> `OperationIdAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_not_found_exception_of_xml
        with
        | Ok s -> `StackNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleRequestException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_request_exception_of_xml
        with
        | Ok s -> `StaleRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : import_stacks_to_stack_set_input) =
    let fields = import_stacks_to_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ImportStacksToStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:import_stacks_to_stack_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : import_stacks_to_stack_set_input) =
    let fields = import_stacks_to_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ImportStacksToStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:import_stacks_to_stack_set_output_of_xml ~error_deserializer
end

module ListChangeSets = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_change_sets_input) =
    let fields = list_change_sets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListChangeSets"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_change_sets_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_change_sets_input) =
    let fields = list_change_sets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListChangeSets"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_change_sets_output_of_xml ~error_deserializer
end

module ListExports = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_exports_input) =
    let fields = list_exports_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListExports"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_exports_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_exports_input) =
    let fields = list_exports_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListExports"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_exports_output_of_xml ~error_deserializer
end

module ListGeneratedTemplates = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_generated_templates_input) =
    let fields = list_generated_templates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListGeneratedTemplates"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_generated_templates_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_generated_templates_input) =
    let fields = list_generated_templates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListGeneratedTemplates"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_generated_templates_output_of_xml ~error_deserializer
end

module ListHookResults = struct
  let error_to_string = function
    | `HookResultNotFoundException _ -> "com.amazonaws.cloudformation#HookResultNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HookResultNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:hook_result_not_found_exception_of_xml
        with
        | Ok s -> `HookResultNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_hook_results_input) =
    let fields = list_hook_results_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListHookResults"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_hook_results_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_hook_results_input) =
    let fields = list_hook_results_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListHookResults"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_hook_results_output_of_xml ~error_deserializer
end

module ListImports = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_imports_input) =
    let fields = list_imports_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListImports"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_imports_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_imports_input) =
    let fields = list_imports_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListImports"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_imports_output_of_xml ~error_deserializer
end

module ListResourceScanRelatedResources = struct
  let error_to_string = function
    | `ResourceScanInProgressException _ ->
        "com.amazonaws.cloudformation#ResourceScanInProgressException"
    | `ResourceScanNotFoundException _ ->
        "com.amazonaws.cloudformation#ResourceScanNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceScanInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_scan_in_progress_exception_of_xml
        with
        | Ok s -> `ResourceScanInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceScanNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_scan_not_found_exception_of_xml
        with
        | Ok s -> `ResourceScanNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_resource_scan_related_resources_input) =
    let fields = list_resource_scan_related_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListResourceScanRelatedResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_resource_scan_related_resources_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_resource_scan_related_resources_input) =
    let fields = list_resource_scan_related_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListResourceScanRelatedResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_resource_scan_related_resources_output_of_xml ~error_deserializer
end

module ListResourceScanResources = struct
  let error_to_string = function
    | `ResourceScanInProgressException _ ->
        "com.amazonaws.cloudformation#ResourceScanInProgressException"
    | `ResourceScanNotFoundException _ ->
        "com.amazonaws.cloudformation#ResourceScanNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceScanInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_scan_in_progress_exception_of_xml
        with
        | Ok s -> `ResourceScanInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceScanNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_scan_not_found_exception_of_xml
        with
        | Ok s -> `ResourceScanNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_resource_scan_resources_input) =
    let fields = list_resource_scan_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListResourceScanResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_resource_scan_resources_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_resource_scan_resources_input) =
    let fields = list_resource_scan_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListResourceScanResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_resource_scan_resources_output_of_xml ~error_deserializer
end

module ListResourceScans = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_resource_scans_input) =
    let fields = list_resource_scans_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListResourceScans"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_resource_scans_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_resource_scans_input) =
    let fields = list_resource_scans_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListResourceScans"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_resource_scans_output_of_xml ~error_deserializer
end

module ListStackInstanceResourceDrifts = struct
  let error_to_string = function
    | `OperationNotFoundException _ -> "com.amazonaws.cloudformation#OperationNotFoundException"
    | `StackInstanceNotFoundException _ ->
        "com.amazonaws.cloudformation#StackInstanceNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_found_exception_of_xml
        with
        | Ok s -> `OperationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackInstanceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_instance_not_found_exception_of_xml
        with
        | Ok s -> `StackInstanceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_instance_resource_drifts_input) =
    let fields = list_stack_instance_resource_drifts_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackInstanceResourceDrifts"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_instance_resource_drifts_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_instance_resource_drifts_input) =
    let fields = list_stack_instance_resource_drifts_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackInstanceResourceDrifts"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_instance_resource_drifts_output_of_xml ~error_deserializer
end

module ListStackInstances = struct
  let error_to_string = function
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_instances_input) =
    let fields = list_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_instances_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_instances_input) =
    let fields = list_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_instances_output_of_xml ~error_deserializer
end

module ListStackRefactorActions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_refactor_actions_input) =
    let fields = list_stack_refactor_actions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackRefactorActions"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_refactor_actions_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_refactor_actions_input) =
    let fields = list_stack_refactor_actions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackRefactorActions"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_refactor_actions_output_of_xml ~error_deserializer
end

module ListStackRefactors = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_refactors_input) =
    let fields = list_stack_refactors_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackRefactors"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_refactors_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_refactors_input) =
    let fields = list_stack_refactors_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackRefactors"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_refactors_output_of_xml ~error_deserializer
end

module ListStackResources = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_resources_input) =
    let fields = list_stack_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_resources_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_resources_input) =
    let fields = list_stack_resources_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackResources"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_resources_output_of_xml ~error_deserializer
end

module ListStackSetAutoDeploymentTargets = struct
  let error_to_string = function
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_set_auto_deployment_targets_input) =
    let fields = list_stack_set_auto_deployment_targets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackSetAutoDeploymentTargets"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_set_auto_deployment_targets_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_set_auto_deployment_targets_input) =
    let fields = list_stack_set_auto_deployment_targets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackSetAutoDeploymentTargets"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_set_auto_deployment_targets_output_of_xml ~error_deserializer
end

module ListStackSetOperationResults = struct
  let error_to_string = function
    | `OperationNotFoundException _ -> "com.amazonaws.cloudformation#OperationNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_found_exception_of_xml
        with
        | Ok s -> `OperationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_set_operation_results_input) =
    let fields = list_stack_set_operation_results_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackSetOperationResults"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_set_operation_results_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_set_operation_results_input) =
    let fields = list_stack_set_operation_results_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackSetOperationResults"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_set_operation_results_output_of_xml ~error_deserializer
end

module ListStackSetOperations = struct
  let error_to_string = function
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_set_operations_input) =
    let fields = list_stack_set_operations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackSetOperations"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_set_operations_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_set_operations_input) =
    let fields = list_stack_set_operations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackSetOperations"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_set_operations_output_of_xml ~error_deserializer
end

module ListStackSets = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stack_sets_input) =
    let fields = list_stack_sets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStackSets"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_sets_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stack_sets_input) =
    let fields = list_stack_sets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStackSets"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stack_sets_output_of_xml ~error_deserializer
end

module ListStacks = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_stacks_input) =
    let fields = list_stacks_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListStacks"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stacks_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_stacks_input) =
    let fields = list_stacks_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListStacks"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_stacks_output_of_xml ~error_deserializer
end

module ListTypeRegistrations = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_type_registrations_input) =
    let fields = list_type_registrations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTypeRegistrations"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_type_registrations_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_type_registrations_input) =
    let fields = list_type_registrations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTypeRegistrations"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_type_registrations_output_of_xml ~error_deserializer
end

module ListTypeVersions = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_type_versions_input) =
    let fields = list_type_versions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTypeVersions"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_type_versions_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_type_versions_input) =
    let fields = list_type_versions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTypeVersions"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_type_versions_output_of_xml ~error_deserializer
end

module ListTypes = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_types_input) =
    let fields = list_types_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTypes"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_types_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_types_input) =
    let fields = list_types_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTypes"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:list_types_output_of_xml ~error_deserializer
end

module PublishType = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : publish_type_input) =
    let fields = publish_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PublishType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:publish_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : publish_type_input) =
    let fields = publish_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PublishType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:publish_type_output_of_xml ~error_deserializer
end

module RecordHandlerProgress = struct
  let error_to_string = function
    | `InvalidStateTransitionException _ ->
        "com.amazonaws.cloudformation#InvalidStateTransitionException"
    | `OperationStatusCheckFailedException _ ->
        "com.amazonaws.cloudformation#OperationStatusCheckFailedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidStateTransition" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_state_transition_exception_of_xml
        with
        | Ok s -> `InvalidStateTransitionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConditionalCheckFailed" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_status_check_failed_exception_of_xml
        with
        | Ok s -> `OperationStatusCheckFailedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : record_handler_progress_input) =
    let fields = record_handler_progress_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RecordHandlerProgress"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:record_handler_progress_output_of_xml ~error_deserializer

  let request_with_metadata context (request : record_handler_progress_input) =
    let fields = record_handler_progress_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RecordHandlerProgress"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:record_handler_progress_output_of_xml ~error_deserializer
end

module RegisterPublisher = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : register_publisher_input) =
    let fields = register_publisher_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RegisterPublisher"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:register_publisher_output_of_xml ~error_deserializer

  let request_with_metadata context (request : register_publisher_input) =
    let fields = register_publisher_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RegisterPublisher"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:register_publisher_output_of_xml ~error_deserializer
end

module RegisterType = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : register_type_input) =
    let fields = register_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RegisterType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:register_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : register_type_input) =
    let fields = register_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RegisterType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:register_type_output_of_xml ~error_deserializer
end

module RollbackStack = struct
  let error_to_string = function
    | `TokenAlreadyExistsException _ -> "com.amazonaws.cloudformation#TokenAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TokenAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:token_already_exists_exception_of_xml
        with
        | Ok s -> `TokenAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : rollback_stack_input) =
    let fields = rollback_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RollbackStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:rollback_stack_output_of_xml ~error_deserializer

  let request_with_metadata context (request : rollback_stack_input) =
    let fields = rollback_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RollbackStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:rollback_stack_output_of_xml ~error_deserializer
end

module SetStackPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_stack_policy_input) =
    let fields = set_stack_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetStackPolicy"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_stack_policy_input) =
    let fields = set_stack_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetStackPolicy"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetTypeConfiguration = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_type_configuration_input) =
    let fields = set_type_configuration_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetTypeConfiguration"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:set_type_configuration_output_of_xml ~error_deserializer

  let request_with_metadata context (request : set_type_configuration_input) =
    let fields = set_type_configuration_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetTypeConfiguration"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:set_type_configuration_output_of_xml ~error_deserializer
end

module SetTypeDefaultVersion = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_type_default_version_input) =
    let fields = set_type_default_version_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetTypeDefaultVersion"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:set_type_default_version_output_of_xml ~error_deserializer

  let request_with_metadata context (request : set_type_default_version_input) =
    let fields = set_type_default_version_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetTypeDefaultVersion"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:set_type_default_version_output_of_xml ~error_deserializer
end

module SignalResource = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : signal_resource_input) =
    let fields = signal_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SignalResource"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : signal_resource_input) =
    let fields = signal_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SignalResource"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module StartResourceScan = struct
  let error_to_string = function
    | `ResourceScanInProgressException _ ->
        "com.amazonaws.cloudformation#ResourceScanInProgressException"
    | `ResourceScanLimitExceededException _ ->
        "com.amazonaws.cloudformation#ResourceScanLimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceScanInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_scan_in_progress_exception_of_xml
        with
        | Ok s -> `ResourceScanInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceScanLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_scan_limit_exceeded_exception_of_xml
        with
        | Ok s -> `ResourceScanLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_resource_scan_input) =
    let fields = start_resource_scan_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartResourceScan"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:start_resource_scan_output_of_xml ~error_deserializer

  let request_with_metadata context (request : start_resource_scan_input) =
    let fields = start_resource_scan_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartResourceScan"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:start_resource_scan_output_of_xml ~error_deserializer
end

module StopStackSetOperation = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationNotFoundException _ -> "com.amazonaws.cloudformation#OperationNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_found_exception_of_xml
        with
        | Ok s -> `OperationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : stop_stack_set_operation_input) =
    let fields = stop_stack_set_operation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StopStackSetOperation"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:stop_stack_set_operation_output_of_xml ~error_deserializer

  let request_with_metadata context (request : stop_stack_set_operation_input) =
    let fields = stop_stack_set_operation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StopStackSetOperation"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:stop_stack_set_operation_output_of_xml ~error_deserializer
end

module TestType = struct
  let error_to_string = function
    | `CFNRegistryException _ -> "com.amazonaws.cloudformation#CFNRegistryException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudformation#TypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CFNRegistryException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:cfn_registry_exception_of_xml
        with
        | Ok s -> `CFNRegistryException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TypeNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:type_not_found_exception_of_xml
        with
        | Ok s -> `TypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : test_type_input) =
    let fields = test_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TestType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:test_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : test_type_input) =
    let fields = test_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TestType"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:test_type_output_of_xml ~error_deserializer
end

module UpdateGeneratedTemplate = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudformation#AlreadyExistsException"
    | `GeneratedTemplateNotFoundException _ ->
        "com.amazonaws.cloudformation#GeneratedTemplateNotFoundException"
    | `LimitExceededException _ -> "com.amazonaws.cloudformation#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:already_exists_exception_of_xml
        with
        | Ok s -> `AlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "GeneratedTemplateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:generated_template_not_found_exception_of_xml
        with
        | Ok s -> `GeneratedTemplateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_generated_template_input) =
    let fields = update_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_generated_template_output_of_xml ~error_deserializer

  let request_with_metadata context (request : update_generated_template_input) =
    let fields = update_generated_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateGeneratedTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_generated_template_output_of_xml ~error_deserializer
end

module UpdateStack = struct
  let error_to_string = function
    | `InsufficientCapabilitiesException _ ->
        "com.amazonaws.cloudformation#InsufficientCapabilitiesException"
    | `TokenAlreadyExistsException _ -> "com.amazonaws.cloudformation#TokenAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientCapabilitiesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_capabilities_exception_of_xml
        with
        | Ok s -> `InsufficientCapabilitiesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TokenAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:token_already_exists_exception_of_xml
        with
        | Ok s -> `TokenAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_stack_input) =
    let fields = update_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_stack_output_of_xml ~error_deserializer

  let request_with_metadata context (request : update_stack_input) =
    let fields = update_stack_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateStack"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_stack_output_of_xml ~error_deserializer
end

module UpdateStackInstances = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationIdAlreadyExistsException _ ->
        "com.amazonaws.cloudformation#OperationIdAlreadyExistsException"
    | `OperationInProgressException _ -> "com.amazonaws.cloudformation#OperationInProgressException"
    | `StackInstanceNotFoundException _ ->
        "com.amazonaws.cloudformation#StackInstanceNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | `StaleRequestException _ -> "com.amazonaws.cloudformation#StaleRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationIdAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_id_already_exists_exception_of_xml
        with
        | Ok s -> `OperationIdAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackInstanceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_instance_not_found_exception_of_xml
        with
        | Ok s -> `StackInstanceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleRequestException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_request_exception_of_xml
        with
        | Ok s -> `StaleRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_stack_instances_input) =
    let fields = update_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_stack_instances_output_of_xml ~error_deserializer

  let request_with_metadata context (request : update_stack_instances_input) =
    let fields = update_stack_instances_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateStackInstances"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_stack_instances_output_of_xml ~error_deserializer
end

module UpdateStackSet = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudformation#InvalidOperationException"
    | `OperationIdAlreadyExistsException _ ->
        "com.amazonaws.cloudformation#OperationIdAlreadyExistsException"
    | `OperationInProgressException _ -> "com.amazonaws.cloudformation#OperationInProgressException"
    | `StackInstanceNotFoundException _ ->
        "com.amazonaws.cloudformation#StackInstanceNotFoundException"
    | `StackSetNotFoundException _ -> "com.amazonaws.cloudformation#StackSetNotFoundException"
    | `StaleRequestException _ -> "com.amazonaws.cloudformation#StaleRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidOperationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_operation_exception_of_xml
        with
        | Ok s -> `InvalidOperationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationIdAlreadyExistsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_id_already_exists_exception_of_xml
        with
        | Ok s -> `OperationIdAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackInstanceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_instance_not_found_exception_of_xml
        with
        | Ok s -> `StackInstanceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StackSetNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stack_set_not_found_exception_of_xml
        with
        | Ok s -> `StackSetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "StaleRequestException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:stale_request_exception_of_xml
        with
        | Ok s -> `StaleRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_stack_set_input) =
    let fields = update_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_stack_set_output_of_xml ~error_deserializer

  let request_with_metadata context (request : update_stack_set_input) =
    let fields = update_stack_set_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateStackSet"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_stack_set_output_of_xml ~error_deserializer
end

module UpdateTerminationProtection = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_termination_protection_input) =
    let fields = update_termination_protection_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateTerminationProtection"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_termination_protection_output_of_xml ~error_deserializer

  let request_with_metadata context (request : update_termination_protection_input) =
    let fields = update_termination_protection_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateTerminationProtection"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:update_termination_protection_output_of_xml ~error_deserializer
end

module ValidateTemplate = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : validate_template_input) =
    let fields = validate_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ValidateTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:validate_template_output_of_xml ~error_deserializer

  let request_with_metadata context (request : validate_template_input) =
    let fields = validate_template_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ValidateTemplate"
      ~xmlNamespace:"http://cloudformation.amazonaws.com/doc/2010-05-15/" ~service ~context ~fields
      ~output_deserializer:validate_template_output_of_xml ~error_deserializer
end
