open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AcceptDelegationRequest = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : accept_delegation_request_request) =
    let fields = accept_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AcceptDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : accept_delegation_request_request) =
    let fields = accept_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AcceptDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AddClientIDToOpenIDConnectProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_client_id_to_open_id_connect_provider_request) =
    let fields = add_client_id_to_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddClientIDToOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : add_client_id_to_open_id_connect_provider_request) =
    let fields = add_client_id_to_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddClientIDToOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AddRoleToInstanceProfile = struct
  let error_to_string = function
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_role_to_instance_profile_request) =
    let fields = add_role_to_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddRoleToInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : add_role_to_instance_profile_request) =
    let fields = add_role_to_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddRoleToInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AddUserToGroup = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_user_to_group_request) =
    let fields = add_user_to_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddUserToGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : add_user_to_group_request) =
    let fields = add_user_to_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddUserToGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AssociateDelegationRequest = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : associate_delegation_request_request) =
    let fields = associate_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AssociateDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : associate_delegation_request_request) =
    let fields = associate_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AssociateDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AttachGroupPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PolicyNotAttachableException _ -> "com.amazonaws.iam#PolicyNotAttachableException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyNotAttachable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_attachable_exception_of_xml
        with
        | Ok s -> `PolicyNotAttachableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_group_policy_request) =
    let fields = attach_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : attach_group_policy_request) =
    let fields = attach_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AttachRolePolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PolicyNotAttachableException _ -> "com.amazonaws.iam#PolicyNotAttachableException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyNotAttachable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_attachable_exception_of_xml
        with
        | Ok s -> `PolicyNotAttachableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_role_policy_request) =
    let fields = attach_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : attach_role_policy_request) =
    let fields = attach_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module AttachUserPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PolicyNotAttachableException _ -> "com.amazonaws.iam#PolicyNotAttachableException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyNotAttachable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_attachable_exception_of_xml
        with
        | Ok s -> `PolicyNotAttachableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_user_policy_request) =
    let fields = attach_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : attach_user_policy_request) =
    let fields = attach_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module ChangePassword = struct
  let error_to_string = function
    | `EntityTemporarilyUnmodifiableException _ ->
        "com.amazonaws.iam#EntityTemporarilyUnmodifiableException"
    | `InvalidUserTypeException _ -> "com.amazonaws.iam#InvalidUserTypeException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PasswordPolicyViolationException _ -> "com.amazonaws.iam#PasswordPolicyViolationException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityTemporarilyUnmodifiable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_temporarily_unmodifiable_exception_of_xml
        with
        | Ok s -> `EntityTemporarilyUnmodifiableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidUserType" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_user_type_exception_of_xml
        with
        | Ok s -> `InvalidUserTypeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PasswordPolicyViolation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:password_policy_violation_exception_of_xml
        with
        | Ok s -> `PasswordPolicyViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : change_password_request) =
    let fields = change_password_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ChangePassword"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : change_password_request) =
    let fields = change_password_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ChangePassword"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module CreateAccessKey = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_access_key_request) =
    let fields = create_access_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateAccessKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_access_key_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_access_key_request) =
    let fields = create_access_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateAccessKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_access_key_response_of_xml ~error_deserializer
end

module CreateAccountAlias = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_account_alias_request) =
    let fields = create_account_alias_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateAccountAlias"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : create_account_alias_request) =
    let fields = create_account_alias_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateAccountAlias"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module CreateDelegationRequest = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_delegation_request_request) =
    let fields = create_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_delegation_request_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_delegation_request_request) =
    let fields = create_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_delegation_request_response_of_xml ~error_deserializer
end

module CreateGroup = struct
  let error_to_string = function
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_group_request) =
    let fields = create_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_group_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_group_request) =
    let fields = create_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_group_response_of_xml ~error_deserializer
end

module CreateInstanceProfile = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_instance_profile_request) =
    let fields = create_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_instance_profile_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_instance_profile_request) =
    let fields = create_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_instance_profile_response_of_xml ~error_deserializer
end

module CreateLoginProfile = struct
  let error_to_string = function
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PasswordPolicyViolationException _ -> "com.amazonaws.iam#PasswordPolicyViolationException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PasswordPolicyViolation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:password_policy_violation_exception_of_xml
        with
        | Ok s -> `PasswordPolicyViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_login_profile_request) =
    let fields = create_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_login_profile_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_login_profile_request) =
    let fields = create_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_login_profile_response_of_xml ~error_deserializer
end

module CreateOpenIDConnectProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `OpenIdIdpCommunicationErrorException _ ->
        "com.amazonaws.iam#OpenIdIdpCommunicationErrorException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OpenIdIdpCommunicationError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:open_id_idp_communication_error_exception_of_xml
        with
        | Ok s -> `OpenIdIdpCommunicationErrorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_open_id_connect_provider_request) =
    let fields = create_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_open_id_connect_provider_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_open_id_connect_provider_request) =
    let fields = create_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_open_id_connect_provider_response_of_xml ~error_deserializer
end

module CreatePolicy = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_policy_request) =
    let fields = create_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreatePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_policy_request) =
    let fields = create_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreatePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_policy_response_of_xml ~error_deserializer
end

module CreatePolicyVersion = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_policy_version_request) =
    let fields = create_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreatePolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_policy_version_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_policy_version_request) =
    let fields = create_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreatePolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_policy_version_response_of_xml ~error_deserializer
end

module CreateRole = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_role_request) =
    let fields = create_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_role_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_role_request) =
    let fields = create_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_role_response_of_xml ~error_deserializer
end

module CreateSAMLProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_saml_provider_request) =
    let fields = create_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_saml_provider_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_saml_provider_request) =
    let fields = create_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_saml_provider_response_of_xml ~error_deserializer
end

module CreateServiceLinkedRole = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_service_linked_role_request) =
    let fields = create_service_linked_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateServiceLinkedRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_service_linked_role_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_service_linked_role_request) =
    let fields = create_service_linked_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateServiceLinkedRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_service_linked_role_response_of_xml ~error_deserializer
end

module CreateServiceSpecificCredential = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceNotSupportedException _ -> "com.amazonaws.iam#ServiceNotSupportedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotSupportedService" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_not_supported_exception_of_xml
        with
        | Ok s -> `ServiceNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_service_specific_credential_request) =
    let fields = create_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_service_specific_credential_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_service_specific_credential_request) =
    let fields = create_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_service_specific_credential_response_of_xml ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_user_request) =
    let fields = create_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_user_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_user_request) =
    let fields = create_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_user_response_of_xml ~error_deserializer
end

module CreateVirtualMFADevice = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_virtual_mfa_device_request) =
    let fields = create_virtual_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateVirtualMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_virtual_mfa_device_response_of_xml ~error_deserializer

  let request_with_metadata context (request : create_virtual_mfa_device_request) =
    let fields = create_virtual_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateVirtualMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:create_virtual_mfa_device_response_of_xml ~error_deserializer
end

module DeactivateMFADevice = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityTemporarilyUnmodifiableException _ ->
        "com.amazonaws.iam#EntityTemporarilyUnmodifiableException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityTemporarilyUnmodifiable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_temporarily_unmodifiable_exception_of_xml
        with
        | Ok s -> `EntityTemporarilyUnmodifiableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deactivate_mfa_device_request) =
    let fields = deactivate_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeactivateMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : deactivate_mfa_device_request) =
    let fields = deactivate_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeactivateMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteAccessKey = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_access_key_request) =
    let fields = delete_access_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAccessKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_access_key_request) =
    let fields = delete_access_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAccessKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteAccountAlias = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_account_alias_request) =
    let fields = delete_account_alias_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAccountAlias"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_account_alias_request) =
    let fields = delete_account_alias_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAccountAlias"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteAccountPasswordPolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAccountPasswordPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAccountPasswordPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteGroup = struct
  let error_to_string = function
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_group_request) =
    let fields = delete_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_group_request) =
    let fields = delete_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteGroupPolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_group_policy_request) =
    let fields = delete_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_group_policy_request) =
    let fields = delete_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteInstanceProfile = struct
  let error_to_string = function
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_instance_profile_request) =
    let fields = delete_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_instance_profile_request) =
    let fields = delete_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteLoginProfile = struct
  let error_to_string = function
    | `EntityTemporarilyUnmodifiableException _ ->
        "com.amazonaws.iam#EntityTemporarilyUnmodifiableException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityTemporarilyUnmodifiable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_temporarily_unmodifiable_exception_of_xml
        with
        | Ok s -> `EntityTemporarilyUnmodifiableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_login_profile_request) =
    let fields = delete_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_login_profile_request) =
    let fields = delete_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteOpenIDConnectProvider = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_open_id_connect_provider_request) =
    let fields = delete_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_open_id_connect_provider_request) =
    let fields = delete_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeletePolicy = struct
  let error_to_string = function
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_policy_request) =
    let fields = delete_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeletePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_policy_request) =
    let fields = delete_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeletePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeletePolicyVersion = struct
  let error_to_string = function
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_policy_version_request) =
    let fields = delete_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeletePolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_policy_version_request) =
    let fields = delete_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeletePolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteRole = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_role_request) =
    let fields = delete_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_role_request) =
    let fields = delete_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteRolePermissionsBoundary = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_role_permissions_boundary_request) =
    let fields = delete_role_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteRolePermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_role_permissions_boundary_request) =
    let fields = delete_role_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteRolePermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteRolePolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_role_policy_request) =
    let fields = delete_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_role_policy_request) =
    let fields = delete_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteSAMLProvider = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_saml_provider_request) =
    let fields = delete_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_saml_provider_request) =
    let fields = delete_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteServerCertificate = struct
  let error_to_string = function
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_server_certificate_request) =
    let fields = delete_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_server_certificate_request) =
    let fields = delete_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteServiceLinkedRole = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_service_linked_role_request) =
    let fields = delete_service_linked_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteServiceLinkedRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:delete_service_linked_role_response_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_service_linked_role_request) =
    let fields = delete_service_linked_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteServiceLinkedRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:delete_service_linked_role_response_of_xml ~error_deserializer
end

module DeleteServiceSpecificCredential = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_service_specific_credential_request) =
    let fields = delete_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_service_specific_credential_request) =
    let fields = delete_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteSigningCertificate = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_signing_certificate_request) =
    let fields = delete_signing_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSigningCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_signing_certificate_request) =
    let fields = delete_signing_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSigningCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteSSHPublicKey = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_ssh_public_key_request) =
    let fields = delete_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_ssh_public_key_request) =
    let fields = delete_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_user_request) =
    let fields = delete_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_user_request) =
    let fields = delete_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteUserPermissionsBoundary = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_user_permissions_boundary_request) =
    let fields = delete_user_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteUserPermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_user_permissions_boundary_request) =
    let fields = delete_user_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteUserPermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteUserPolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_user_policy_request) =
    let fields = delete_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_user_policy_request) =
    let fields = delete_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteVirtualMFADevice = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `DeleteConflictException _ -> "com.amazonaws.iam#DeleteConflictException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DeleteConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_conflict_exception_of_xml
        with
        | Ok s -> `DeleteConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_virtual_mfa_device_request) =
    let fields = delete_virtual_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteVirtualMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_virtual_mfa_device_request) =
    let fields = delete_virtual_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteVirtualMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DetachGroupPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_group_policy_request) =
    let fields = detach_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : detach_group_policy_request) =
    let fields = detach_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DetachRolePolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_role_policy_request) =
    let fields = detach_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : detach_role_policy_request) =
    let fields = detach_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DetachUserPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_user_policy_request) =
    let fields = detach_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : detach_user_policy_request) =
    let fields = detach_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DisableOrganizationsRootCredentialsManagement = struct
  let error_to_string = function
    | `AccountNotManagementOrDelegatedAdministratorException _ ->
        "com.amazonaws.iam#AccountNotManagementOrDelegatedAdministratorException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.iam#OrganizationNotFoundException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.iam#OrganizationNotInAllFeaturesModeException"
    | `ServiceAccessNotEnabledException _ -> "com.amazonaws.iam#ServiceAccessNotEnabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountNotManagementOrDelegatedAdministratorException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_not_management_or_delegated_administrator_exception_of_xml
        with
        | Ok s -> `AccountNotManagementOrDelegatedAdministratorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_found_exception_of_xml
        with
        | Ok s -> `OrganizationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotInAllFeaturesModeException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_in_all_features_mode_exception_of_xml
        with
        | Ok s -> `OrganizationNotInAllFeaturesModeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceAccessNotEnabledException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_access_not_enabled_exception_of_xml
        with
        | Ok s -> `ServiceAccessNotEnabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_organizations_root_credentials_management_request) =
    let fields = disable_organizations_root_credentials_management_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableOrganizationsRootCredentialsManagement"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:disable_organizations_root_credentials_management_response_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : disable_organizations_root_credentials_management_request) =
    let fields = disable_organizations_root_credentials_management_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DisableOrganizationsRootCredentialsManagement"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:disable_organizations_root_credentials_management_response_of_xml
      ~error_deserializer
end

module DisableOrganizationsRootSessions = struct
  let error_to_string = function
    | `AccountNotManagementOrDelegatedAdministratorException _ ->
        "com.amazonaws.iam#AccountNotManagementOrDelegatedAdministratorException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.iam#OrganizationNotFoundException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.iam#OrganizationNotInAllFeaturesModeException"
    | `ServiceAccessNotEnabledException _ -> "com.amazonaws.iam#ServiceAccessNotEnabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountNotManagementOrDelegatedAdministratorException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_not_management_or_delegated_administrator_exception_of_xml
        with
        | Ok s -> `AccountNotManagementOrDelegatedAdministratorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_found_exception_of_xml
        with
        | Ok s -> `OrganizationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotInAllFeaturesModeException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_in_all_features_mode_exception_of_xml
        with
        | Ok s -> `OrganizationNotInAllFeaturesModeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceAccessNotEnabledException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_access_not_enabled_exception_of_xml
        with
        | Ok s -> `ServiceAccessNotEnabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_organizations_root_sessions_request) =
    let fields = disable_organizations_root_sessions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableOrganizationsRootSessions"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:disable_organizations_root_sessions_response_of_xml ~error_deserializer

  let request_with_metadata context (request : disable_organizations_root_sessions_request) =
    let fields = disable_organizations_root_sessions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisableOrganizationsRootSessions"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:disable_organizations_root_sessions_response_of_xml ~error_deserializer
end

module DisableOutboundWebIdentityFederation = struct
  let error_to_string = function
    | `FeatureDisabledException _ -> "com.amazonaws.iam#FeatureDisabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "FeatureDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:feature_disabled_exception_of_xml
        with
        | Ok s -> `FeatureDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableOutboundWebIdentityFederation"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DisableOutboundWebIdentityFederation"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module EnableMFADevice = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `EntityTemporarilyUnmodifiableException _ ->
        "com.amazonaws.iam#EntityTemporarilyUnmodifiableException"
    | `InvalidAuthenticationCodeException _ ->
        "com.amazonaws.iam#InvalidAuthenticationCodeException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityTemporarilyUnmodifiable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_temporarily_unmodifiable_exception_of_xml
        with
        | Ok s -> `EntityTemporarilyUnmodifiableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthenticationCode" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authentication_code_exception_of_xml
        with
        | Ok s -> `InvalidAuthenticationCodeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_mfa_device_request) =
    let fields = enable_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : enable_mfa_device_request) =
    let fields = enable_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module EnableOrganizationsRootCredentialsManagement = struct
  let error_to_string = function
    | `AccountNotManagementOrDelegatedAdministratorException _ ->
        "com.amazonaws.iam#AccountNotManagementOrDelegatedAdministratorException"
    | `CallerIsNotManagementAccountException _ ->
        "com.amazonaws.iam#CallerIsNotManagementAccountException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.iam#OrganizationNotFoundException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.iam#OrganizationNotInAllFeaturesModeException"
    | `ServiceAccessNotEnabledException _ -> "com.amazonaws.iam#ServiceAccessNotEnabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountNotManagementOrDelegatedAdministratorException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_not_management_or_delegated_administrator_exception_of_xml
        with
        | Ok s -> `AccountNotManagementOrDelegatedAdministratorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CallerIsNotManagementAccountException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:caller_is_not_management_account_exception_of_xml
        with
        | Ok s -> `CallerIsNotManagementAccountException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_found_exception_of_xml
        with
        | Ok s -> `OrganizationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotInAllFeaturesModeException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_in_all_features_mode_exception_of_xml
        with
        | Ok s -> `OrganizationNotInAllFeaturesModeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceAccessNotEnabledException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_access_not_enabled_exception_of_xml
        with
        | Ok s -> `ServiceAccessNotEnabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_organizations_root_credentials_management_request) =
    let fields = enable_organizations_root_credentials_management_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableOrganizationsRootCredentialsManagement"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:enable_organizations_root_credentials_management_response_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : enable_organizations_root_credentials_management_request) =
    let fields = enable_organizations_root_credentials_management_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"EnableOrganizationsRootCredentialsManagement"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:enable_organizations_root_credentials_management_response_of_xml
      ~error_deserializer
end

module EnableOrganizationsRootSessions = struct
  let error_to_string = function
    | `AccountNotManagementOrDelegatedAdministratorException _ ->
        "com.amazonaws.iam#AccountNotManagementOrDelegatedAdministratorException"
    | `CallerIsNotManagementAccountException _ ->
        "com.amazonaws.iam#CallerIsNotManagementAccountException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.iam#OrganizationNotFoundException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.iam#OrganizationNotInAllFeaturesModeException"
    | `ServiceAccessNotEnabledException _ -> "com.amazonaws.iam#ServiceAccessNotEnabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountNotManagementOrDelegatedAdministratorException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_not_management_or_delegated_administrator_exception_of_xml
        with
        | Ok s -> `AccountNotManagementOrDelegatedAdministratorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CallerIsNotManagementAccountException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:caller_is_not_management_account_exception_of_xml
        with
        | Ok s -> `CallerIsNotManagementAccountException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_found_exception_of_xml
        with
        | Ok s -> `OrganizationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotInAllFeaturesModeException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_in_all_features_mode_exception_of_xml
        with
        | Ok s -> `OrganizationNotInAllFeaturesModeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceAccessNotEnabledException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_access_not_enabled_exception_of_xml
        with
        | Ok s -> `ServiceAccessNotEnabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_organizations_root_sessions_request) =
    let fields = enable_organizations_root_sessions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableOrganizationsRootSessions"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:enable_organizations_root_sessions_response_of_xml ~error_deserializer

  let request_with_metadata context (request : enable_organizations_root_sessions_request) =
    let fields = enable_organizations_root_sessions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableOrganizationsRootSessions"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:enable_organizations_root_sessions_response_of_xml ~error_deserializer
end

module EnableOutboundWebIdentityFederation = struct
  let error_to_string = function
    | `FeatureEnabledException _ -> "com.amazonaws.iam#FeatureEnabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "FeatureEnabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:feature_enabled_exception_of_xml
        with
        | Ok s -> `FeatureEnabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableOutboundWebIdentityFederation"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:enable_outbound_web_identity_federation_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableOutboundWebIdentityFederation"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:enable_outbound_web_identity_federation_response_of_xml
      ~error_deserializer
end

module GenerateCredentialReport = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GenerateCredentialReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:generate_credential_report_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GenerateCredentialReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:generate_credential_report_response_of_xml ~error_deserializer
end

module GenerateOrganizationsAccessReport = struct
  let error_to_string = function
    | `ReportGenerationLimitExceededException _ ->
        "com.amazonaws.iam#ReportGenerationLimitExceededException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ReportGenerationLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:report_generation_limit_exceeded_exception_of_xml
        with
        | Ok s -> `ReportGenerationLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : generate_organizations_access_report_request) =
    let fields = generate_organizations_access_report_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GenerateOrganizationsAccessReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:generate_organizations_access_report_response_of_xml ~error_deserializer

  let request_with_metadata context (request : generate_organizations_access_report_request) =
    let fields = generate_organizations_access_report_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GenerateOrganizationsAccessReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:generate_organizations_access_report_response_of_xml ~error_deserializer
end

module GenerateServiceLastAccessedDetails = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : generate_service_last_accessed_details_request) =
    let fields = generate_service_last_accessed_details_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GenerateServiceLastAccessedDetails"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:generate_service_last_accessed_details_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : generate_service_last_accessed_details_request) =
    let fields = generate_service_last_accessed_details_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GenerateServiceLastAccessedDetails"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:generate_service_last_accessed_details_response_of_xml
      ~error_deserializer
end

module GetAccessKeyLastUsed = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_access_key_last_used_request) =
    let fields = get_access_key_last_used_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetAccessKeyLastUsed"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_access_key_last_used_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_access_key_last_used_request) =
    let fields = get_access_key_last_used_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetAccessKeyLastUsed"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_access_key_last_used_response_of_xml ~error_deserializer
end

module GetAccountAuthorizationDetails = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_account_authorization_details_request) =
    let fields = get_account_authorization_details_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetAccountAuthorizationDetails"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_account_authorization_details_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_account_authorization_details_request) =
    let fields = get_account_authorization_details_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetAccountAuthorizationDetails"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_account_authorization_details_response_of_xml ~error_deserializer
end

module GetAccountPasswordPolicy = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetAccountPasswordPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_account_password_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetAccountPasswordPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_account_password_policy_response_of_xml ~error_deserializer
end

module GetAccountSummary = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetAccountSummary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_account_summary_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetAccountSummary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_account_summary_response_of_xml ~error_deserializer
end

module GetContextKeysForCustomPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_context_keys_for_custom_policy_request) =
    let fields = get_context_keys_for_custom_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetContextKeysForCustomPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_context_keys_for_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_context_keys_for_custom_policy_request) =
    let fields = get_context_keys_for_custom_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetContextKeysForCustomPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_context_keys_for_policy_response_of_xml ~error_deserializer
end

module GetContextKeysForPrincipalPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_context_keys_for_principal_policy_request) =
    let fields = get_context_keys_for_principal_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetContextKeysForPrincipalPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_context_keys_for_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_context_keys_for_principal_policy_request) =
    let fields = get_context_keys_for_principal_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetContextKeysForPrincipalPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_context_keys_for_policy_response_of_xml ~error_deserializer
end

module GetCredentialReport = struct
  let error_to_string = function
    | `CredentialReportExpiredException _ -> "com.amazonaws.iam#CredentialReportExpiredException"
    | `CredentialReportNotPresentException _ ->
        "com.amazonaws.iam#CredentialReportNotPresentException"
    | `CredentialReportNotReadyException _ -> "com.amazonaws.iam#CredentialReportNotReadyException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ReportExpired" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:credential_report_expired_exception_of_xml
        with
        | Ok s -> `CredentialReportExpiredException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReportNotPresent" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:credential_report_not_present_exception_of_xml
        with
        | Ok s -> `CredentialReportNotPresentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ReportInProgress" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:credential_report_not_ready_exception_of_xml
        with
        | Ok s -> `CredentialReportNotReadyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetCredentialReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_credential_report_response_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetCredentialReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_credential_report_response_of_xml ~error_deserializer
end

module GetDelegationRequest = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_delegation_request_request) =
    let fields = get_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_delegation_request_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_delegation_request_request) =
    let fields = get_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_delegation_request_response_of_xml ~error_deserializer
end

module GetGroup = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_group_request) =
    let fields = get_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_group_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_group_request) =
    let fields = get_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_group_response_of_xml ~error_deserializer
end

module GetGroupPolicy = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_group_policy_request) =
    let fields = get_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_group_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_group_policy_request) =
    let fields = get_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_group_policy_response_of_xml ~error_deserializer
end

module GetHumanReadableSummary = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_human_readable_summary_request) =
    let fields = get_human_readable_summary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetHumanReadableSummary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_human_readable_summary_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_human_readable_summary_request) =
    let fields = get_human_readable_summary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetHumanReadableSummary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_human_readable_summary_response_of_xml ~error_deserializer
end

module GetInstanceProfile = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_instance_profile_request) =
    let fields = get_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_instance_profile_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_instance_profile_request) =
    let fields = get_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_instance_profile_response_of_xml ~error_deserializer
end

module GetLoginProfile = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_login_profile_request) =
    let fields = get_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_login_profile_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_login_profile_request) =
    let fields = get_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_login_profile_response_of_xml ~error_deserializer
end

module GetMFADevice = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_mfa_device_request) =
    let fields = get_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_mfa_device_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_mfa_device_request) =
    let fields = get_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_mfa_device_response_of_xml ~error_deserializer
end

module GetOpenIDConnectProvider = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_open_id_connect_provider_request) =
    let fields = get_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_open_id_connect_provider_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_open_id_connect_provider_request) =
    let fields = get_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_open_id_connect_provider_response_of_xml ~error_deserializer
end

module GetOrganizationsAccessReport = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_organizations_access_report_request) =
    let fields = get_organizations_access_report_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetOrganizationsAccessReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_organizations_access_report_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_organizations_access_report_request) =
    let fields = get_organizations_access_report_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetOrganizationsAccessReport"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_organizations_access_report_response_of_xml ~error_deserializer
end

module GetOutboundWebIdentityFederationInfo = struct
  let error_to_string = function
    | `FeatureDisabledException _ -> "com.amazonaws.iam#FeatureDisabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "FeatureDisabled" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:feature_disabled_exception_of_xml
        with
        | Ok s -> `FeatureDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetOutboundWebIdentityFederationInfo"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_outbound_web_identity_federation_info_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"GetOutboundWebIdentityFederationInfo"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_outbound_web_identity_federation_info_response_of_xml
      ~error_deserializer
end

module GetPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_policy_request) =
    let fields = get_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_policy_request) =
    let fields = get_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_policy_response_of_xml ~error_deserializer
end

module GetPolicyVersion = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_policy_version_request) =
    let fields = get_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetPolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_policy_version_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_policy_version_request) =
    let fields = get_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetPolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_policy_version_response_of_xml ~error_deserializer
end

module GetRole = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_role_request) =
    let fields = get_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_role_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_role_request) =
    let fields = get_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_role_response_of_xml ~error_deserializer
end

module GetRolePolicy = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_role_policy_request) =
    let fields = get_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_role_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_role_policy_request) =
    let fields = get_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_role_policy_response_of_xml ~error_deserializer
end

module GetSAMLProvider = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_saml_provider_request) =
    let fields = get_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_saml_provider_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_saml_provider_request) =
    let fields = get_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_saml_provider_response_of_xml ~error_deserializer
end

module GetServerCertificate = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_server_certificate_request) =
    let fields = get_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_server_certificate_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_server_certificate_request) =
    let fields = get_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_server_certificate_response_of_xml ~error_deserializer
end

module GetServiceLastAccessedDetails = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_service_last_accessed_details_request) =
    let fields = get_service_last_accessed_details_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetServiceLastAccessedDetails"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_service_last_accessed_details_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_service_last_accessed_details_request) =
    let fields = get_service_last_accessed_details_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetServiceLastAccessedDetails"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_service_last_accessed_details_response_of_xml ~error_deserializer
end

module GetServiceLastAccessedDetailsWithEntities = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_service_last_accessed_details_with_entities_request) =
    let fields = get_service_last_accessed_details_with_entities_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetServiceLastAccessedDetailsWithEntities"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_service_last_accessed_details_with_entities_response_of_xml
      ~error_deserializer

  let request_with_metadata context
      (request : get_service_last_accessed_details_with_entities_request) =
    let fields = get_service_last_accessed_details_with_entities_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"GetServiceLastAccessedDetailsWithEntities"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_service_last_accessed_details_with_entities_response_of_xml
      ~error_deserializer
end

module GetServiceLinkedRoleDeletionStatus = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_service_linked_role_deletion_status_request) =
    let fields = get_service_linked_role_deletion_status_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetServiceLinkedRoleDeletionStatus"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_service_linked_role_deletion_status_response_of_xml
      ~error_deserializer

  let request_with_metadata context (request : get_service_linked_role_deletion_status_request) =
    let fields = get_service_linked_role_deletion_status_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetServiceLinkedRoleDeletionStatus"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_service_linked_role_deletion_status_response_of_xml
      ~error_deserializer
end

module GetSSHPublicKey = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `UnrecognizedPublicKeyEncodingException _ ->
        "com.amazonaws.iam#UnrecognizedPublicKeyEncodingException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnrecognizedPublicKeyEncoding" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unrecognized_public_key_encoding_exception_of_xml
        with
        | Ok s -> `UnrecognizedPublicKeyEncodingException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_ssh_public_key_request) =
    let fields = get_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_ssh_public_key_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_ssh_public_key_request) =
    let fields = get_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_ssh_public_key_response_of_xml ~error_deserializer
end

module GetUser = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_user_request) =
    let fields = get_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_user_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_user_request) =
    let fields = get_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_user_response_of_xml ~error_deserializer
end

module GetUserPolicy = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_user_policy_request) =
    let fields = get_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_user_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : get_user_policy_request) =
    let fields = get_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:get_user_policy_response_of_xml ~error_deserializer
end

module ListAccessKeys = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_access_keys_request) =
    let fields = list_access_keys_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAccessKeys"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_access_keys_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_access_keys_request) =
    let fields = list_access_keys_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAccessKeys"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_access_keys_response_of_xml ~error_deserializer
end

module ListAccountAliases = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_account_aliases_request) =
    let fields = list_account_aliases_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAccountAliases"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_account_aliases_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_account_aliases_request) =
    let fields = list_account_aliases_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAccountAliases"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_account_aliases_response_of_xml ~error_deserializer
end

module ListAttachedGroupPolicies = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_attached_group_policies_request) =
    let fields = list_attached_group_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAttachedGroupPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_attached_group_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_attached_group_policies_request) =
    let fields = list_attached_group_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAttachedGroupPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_attached_group_policies_response_of_xml ~error_deserializer
end

module ListAttachedRolePolicies = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_attached_role_policies_request) =
    let fields = list_attached_role_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAttachedRolePolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_attached_role_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_attached_role_policies_request) =
    let fields = list_attached_role_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAttachedRolePolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_attached_role_policies_response_of_xml ~error_deserializer
end

module ListAttachedUserPolicies = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_attached_user_policies_request) =
    let fields = list_attached_user_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAttachedUserPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_attached_user_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_attached_user_policies_request) =
    let fields = list_attached_user_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAttachedUserPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_attached_user_policies_response_of_xml ~error_deserializer
end

module ListDelegationRequests = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_delegation_requests_request) =
    let fields = list_delegation_requests_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListDelegationRequests"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_delegation_requests_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_delegation_requests_request) =
    let fields = list_delegation_requests_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListDelegationRequests"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_delegation_requests_response_of_xml ~error_deserializer
end

module ListEntitiesForPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_entities_for_policy_request) =
    let fields = list_entities_for_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListEntitiesForPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_entities_for_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_entities_for_policy_request) =
    let fields = list_entities_for_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListEntitiesForPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_entities_for_policy_response_of_xml ~error_deserializer
end

module ListGroupPolicies = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_group_policies_request) =
    let fields = list_group_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListGroupPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_group_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_group_policies_request) =
    let fields = list_group_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListGroupPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_group_policies_response_of_xml ~error_deserializer
end

module ListGroups = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_groups_request) =
    let fields = list_groups_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListGroups"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_groups_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_groups_request) =
    let fields = list_groups_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListGroups"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_groups_response_of_xml ~error_deserializer
end

module ListGroupsForUser = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_groups_for_user_request) =
    let fields = list_groups_for_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListGroupsForUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_groups_for_user_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_groups_for_user_request) =
    let fields = list_groups_for_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListGroupsForUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_groups_for_user_response_of_xml ~error_deserializer
end

module ListInstanceProfiles = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_instance_profiles_request) =
    let fields = list_instance_profiles_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListInstanceProfiles"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_instance_profiles_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_instance_profiles_request) =
    let fields = list_instance_profiles_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListInstanceProfiles"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_instance_profiles_response_of_xml ~error_deserializer
end

module ListInstanceProfilesForRole = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_instance_profiles_for_role_request) =
    let fields = list_instance_profiles_for_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListInstanceProfilesForRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_instance_profiles_for_role_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_instance_profiles_for_role_request) =
    let fields = list_instance_profiles_for_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListInstanceProfilesForRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_instance_profiles_for_role_response_of_xml ~error_deserializer
end

module ListInstanceProfileTags = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_instance_profile_tags_request) =
    let fields = list_instance_profile_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListInstanceProfileTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_instance_profile_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_instance_profile_tags_request) =
    let fields = list_instance_profile_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListInstanceProfileTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_instance_profile_tags_response_of_xml ~error_deserializer
end

module ListMFADevices = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_mfa_devices_request) =
    let fields = list_mfa_devices_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListMFADevices"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_mfa_devices_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_mfa_devices_request) =
    let fields = list_mfa_devices_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListMFADevices"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_mfa_devices_response_of_xml ~error_deserializer
end

module ListMFADeviceTags = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_mfa_device_tags_request) =
    let fields = list_mfa_device_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListMFADeviceTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_mfa_device_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_mfa_device_tags_request) =
    let fields = list_mfa_device_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListMFADeviceTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_mfa_device_tags_response_of_xml ~error_deserializer
end

module ListOpenIDConnectProviders = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_open_id_connect_providers_request) =
    let fields = list_open_id_connect_providers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListOpenIDConnectProviders"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_open_id_connect_providers_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_open_id_connect_providers_request) =
    let fields = list_open_id_connect_providers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListOpenIDConnectProviders"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_open_id_connect_providers_response_of_xml ~error_deserializer
end

module ListOpenIDConnectProviderTags = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_open_id_connect_provider_tags_request) =
    let fields = list_open_id_connect_provider_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListOpenIDConnectProviderTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_open_id_connect_provider_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_open_id_connect_provider_tags_request) =
    let fields = list_open_id_connect_provider_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListOpenIDConnectProviderTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_open_id_connect_provider_tags_response_of_xml ~error_deserializer
end

module ListOrganizationsFeatures = struct
  let error_to_string = function
    | `AccountNotManagementOrDelegatedAdministratorException _ ->
        "com.amazonaws.iam#AccountNotManagementOrDelegatedAdministratorException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.iam#OrganizationNotFoundException"
    | `OrganizationNotInAllFeaturesModeException _ ->
        "com.amazonaws.iam#OrganizationNotInAllFeaturesModeException"
    | `ServiceAccessNotEnabledException _ -> "com.amazonaws.iam#ServiceAccessNotEnabledException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AccountNotManagementOrDelegatedAdministratorException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:account_not_management_or_delegated_administrator_exception_of_xml
        with
        | Ok s -> `AccountNotManagementOrDelegatedAdministratorException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_found_exception_of_xml
        with
        | Ok s -> `OrganizationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OrganizationNotInAllFeaturesModeException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:organization_not_in_all_features_mode_exception_of_xml
        with
        | Ok s -> `OrganizationNotInAllFeaturesModeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceAccessNotEnabledException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_access_not_enabled_exception_of_xml
        with
        | Ok s -> `ServiceAccessNotEnabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_organizations_features_request) =
    let fields = list_organizations_features_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListOrganizationsFeatures"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_organizations_features_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_organizations_features_request) =
    let fields = list_organizations_features_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListOrganizationsFeatures"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_organizations_features_response_of_xml ~error_deserializer
end

module ListPolicies = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_policies_request) =
    let fields = list_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_policies_request) =
    let fields = list_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policies_response_of_xml ~error_deserializer
end

module ListPoliciesGrantingServiceAccess = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_policies_granting_service_access_request) =
    let fields = list_policies_granting_service_access_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPoliciesGrantingServiceAccess"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policies_granting_service_access_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_policies_granting_service_access_request) =
    let fields = list_policies_granting_service_access_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPoliciesGrantingServiceAccess"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policies_granting_service_access_response_of_xml ~error_deserializer
end

module ListPolicyTags = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_policy_tags_request) =
    let fields = list_policy_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPolicyTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policy_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_policy_tags_request) =
    let fields = list_policy_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPolicyTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policy_tags_response_of_xml ~error_deserializer
end

module ListPolicyVersions = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_policy_versions_request) =
    let fields = list_policy_versions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPolicyVersions"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policy_versions_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_policy_versions_request) =
    let fields = list_policy_versions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPolicyVersions"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_policy_versions_response_of_xml ~error_deserializer
end

module ListRolePolicies = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_role_policies_request) =
    let fields = list_role_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListRolePolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_role_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_role_policies_request) =
    let fields = list_role_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListRolePolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_role_policies_response_of_xml ~error_deserializer
end

module ListRoles = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_roles_request) =
    let fields = list_roles_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListRoles"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_roles_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_roles_request) =
    let fields = list_roles_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListRoles"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_roles_response_of_xml ~error_deserializer
end

module ListRoleTags = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_role_tags_request) =
    let fields = list_role_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListRoleTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_role_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_role_tags_request) =
    let fields = list_role_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListRoleTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_role_tags_response_of_xml ~error_deserializer
end

module ListSAMLProviders = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_saml_providers_request) =
    let fields = list_saml_providers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListSAMLProviders"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_saml_providers_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_saml_providers_request) =
    let fields = list_saml_providers_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListSAMLProviders"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_saml_providers_response_of_xml ~error_deserializer
end

module ListSAMLProviderTags = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_saml_provider_tags_request) =
    let fields = list_saml_provider_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListSAMLProviderTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_saml_provider_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_saml_provider_tags_request) =
    let fields = list_saml_provider_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListSAMLProviderTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_saml_provider_tags_response_of_xml ~error_deserializer
end

module ListServerCertificates = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_server_certificates_request) =
    let fields = list_server_certificates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListServerCertificates"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_server_certificates_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_server_certificates_request) =
    let fields = list_server_certificates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListServerCertificates"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_server_certificates_response_of_xml ~error_deserializer
end

module ListServerCertificateTags = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_server_certificate_tags_request) =
    let fields = list_server_certificate_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListServerCertificateTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_server_certificate_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_server_certificate_tags_request) =
    let fields = list_server_certificate_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListServerCertificateTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_server_certificate_tags_response_of_xml ~error_deserializer
end

module ListServiceSpecificCredentials = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceNotSupportedException _ -> "com.amazonaws.iam#ServiceNotSupportedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NotSupportedService" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_not_supported_exception_of_xml
        with
        | Ok s -> `ServiceNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_service_specific_credentials_request) =
    let fields = list_service_specific_credentials_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListServiceSpecificCredentials"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_service_specific_credentials_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_service_specific_credentials_request) =
    let fields = list_service_specific_credentials_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListServiceSpecificCredentials"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_service_specific_credentials_response_of_xml ~error_deserializer
end

module ListSigningCertificates = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_signing_certificates_request) =
    let fields = list_signing_certificates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListSigningCertificates"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_signing_certificates_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_signing_certificates_request) =
    let fields = list_signing_certificates_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListSigningCertificates"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_signing_certificates_response_of_xml ~error_deserializer
end

module ListSSHPublicKeys = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_ssh_public_keys_request) =
    let fields = list_ssh_public_keys_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListSSHPublicKeys"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_ssh_public_keys_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_ssh_public_keys_request) =
    let fields = list_ssh_public_keys_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListSSHPublicKeys"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_ssh_public_keys_response_of_xml ~error_deserializer
end

module ListUserPolicies = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_user_policies_request) =
    let fields = list_user_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListUserPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_user_policies_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_user_policies_request) =
    let fields = list_user_policies_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListUserPolicies"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_user_policies_response_of_xml ~error_deserializer
end

module ListUsers = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_users_request) =
    let fields = list_users_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListUsers"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_users_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_users_request) =
    let fields = list_users_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListUsers"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_users_response_of_xml ~error_deserializer
end

module ListUserTags = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_user_tags_request) =
    let fields = list_user_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListUserTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_user_tags_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_user_tags_request) =
    let fields = list_user_tags_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListUserTags"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_user_tags_response_of_xml ~error_deserializer
end

module ListVirtualMFADevices = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_virtual_mfa_devices_request) =
    let fields = list_virtual_mfa_devices_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListVirtualMFADevices"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_virtual_mfa_devices_response_of_xml ~error_deserializer

  let request_with_metadata context (request : list_virtual_mfa_devices_request) =
    let fields = list_virtual_mfa_devices_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListVirtualMFADevices"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:list_virtual_mfa_devices_response_of_xml ~error_deserializer
end

module PutGroupPolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_group_policy_request) =
    let fields = put_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_group_policy_request) =
    let fields = put_group_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutGroupPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutRolePermissionsBoundary = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PolicyNotAttachableException _ -> "com.amazonaws.iam#PolicyNotAttachableException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyNotAttachable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_attachable_exception_of_xml
        with
        | Ok s -> `PolicyNotAttachableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_role_permissions_boundary_request) =
    let fields = put_role_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutRolePermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_role_permissions_boundary_request) =
    let fields = put_role_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutRolePermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutRolePolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_role_policy_request) =
    let fields = put_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_role_policy_request) =
    let fields = put_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutUserPermissionsBoundary = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PolicyNotAttachableException _ -> "com.amazonaws.iam#PolicyNotAttachableException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyNotAttachable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_attachable_exception_of_xml
        with
        | Ok s -> `PolicyNotAttachableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_user_permissions_boundary_request) =
    let fields = put_user_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutUserPermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_user_permissions_boundary_request) =
    let fields = put_user_permissions_boundary_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutUserPermissionsBoundary"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutUserPolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_user_policy_request) =
    let fields = put_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_user_policy_request) =
    let fields = put_user_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutUserPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RejectDelegationRequest = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reject_delegation_request_request) =
    let fields = reject_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RejectDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : reject_delegation_request_request) =
    let fields = reject_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RejectDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RemoveClientIDFromOpenIDConnectProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_client_id_from_open_id_connect_provider_request) =
    let fields = remove_client_id_from_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveClientIDFromOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context
      (request : remove_client_id_from_open_id_connect_provider_request) =
    let fields = remove_client_id_from_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"RemoveClientIDFromOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RemoveRoleFromInstanceProfile = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_role_from_instance_profile_request) =
    let fields = remove_role_from_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveRoleFromInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : remove_role_from_instance_profile_request) =
    let fields = remove_role_from_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveRoleFromInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module RemoveUserFromGroup = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_user_from_group_request) =
    let fields = remove_user_from_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveUserFromGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : remove_user_from_group_request) =
    let fields = remove_user_from_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveUserFromGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module ResetServiceSpecificCredential = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : reset_service_specific_credential_request) =
    let fields = reset_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResetServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:reset_service_specific_credential_response_of_xml ~error_deserializer

  let request_with_metadata context (request : reset_service_specific_credential_request) =
    let fields = reset_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResetServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:reset_service_specific_credential_response_of_xml ~error_deserializer
end

module ResyncMFADevice = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidAuthenticationCodeException _ ->
        "com.amazonaws.iam#InvalidAuthenticationCodeException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidAuthenticationCode" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_authentication_code_exception_of_xml
        with
        | Ok s -> `InvalidAuthenticationCodeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : resync_mfa_device_request) =
    let fields = resync_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ResyncMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : resync_mfa_device_request) =
    let fields = resync_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ResyncMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SendDelegationToken = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : send_delegation_token_request) =
    let fields = send_delegation_token_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SendDelegationToken"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : send_delegation_token_request) =
    let fields = send_delegation_token_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SendDelegationToken"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetDefaultPolicyVersion = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_default_policy_version_request) =
    let fields = set_default_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetDefaultPolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_default_policy_version_request) =
    let fields = set_default_policy_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetDefaultPolicyVersion"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SetSecurityTokenServicePreferences = struct
  let error_to_string = function
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_security_token_service_preferences_request) =
    let fields = set_security_token_service_preferences_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetSecurityTokenServicePreferences"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_security_token_service_preferences_request) =
    let fields = set_security_token_service_preferences_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetSecurityTokenServicePreferences"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module SimulateCustomPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `PolicyEvaluationException _ -> "com.amazonaws.iam#PolicyEvaluationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyEvaluation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_evaluation_exception_of_xml
        with
        | Ok s -> `PolicyEvaluationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : simulate_custom_policy_request) =
    let fields = simulate_custom_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SimulateCustomPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:simulate_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : simulate_custom_policy_request) =
    let fields = simulate_custom_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SimulateCustomPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:simulate_policy_response_of_xml ~error_deserializer
end

module SimulatePrincipalPolicy = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PolicyEvaluationException _ -> "com.amazonaws.iam#PolicyEvaluationException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyEvaluation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_evaluation_exception_of_xml
        with
        | Ok s -> `PolicyEvaluationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : simulate_principal_policy_request) =
    let fields = simulate_principal_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SimulatePrincipalPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:simulate_policy_response_of_xml ~error_deserializer

  let request_with_metadata context (request : simulate_principal_policy_request) =
    let fields = simulate_principal_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SimulatePrincipalPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:simulate_policy_response_of_xml ~error_deserializer
end

module TagInstanceProfile = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_instance_profile_request) =
    let fields = tag_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_instance_profile_request) =
    let fields = tag_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TagMFADevice = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_mfa_device_request) =
    let fields = tag_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_mfa_device_request) =
    let fields = tag_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TagOpenIDConnectProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_open_id_connect_provider_request) =
    let fields = tag_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_open_id_connect_provider_request) =
    let fields = tag_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TagPolicy = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_policy_request) =
    let fields = tag_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_policy_request) =
    let fields = tag_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TagRole = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_role_request) =
    let fields = tag_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_role_request) =
    let fields = tag_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TagSAMLProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_saml_provider_request) =
    let fields = tag_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_saml_provider_request) =
    let fields = tag_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TagServerCertificate = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_server_certificate_request) =
    let fields = tag_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_server_certificate_request) =
    let fields = tag_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module TagUser = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_user_request) =
    let fields = tag_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : tag_user_request) =
    let fields = tag_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagInstanceProfile = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_instance_profile_request) =
    let fields = untag_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_instance_profile_request) =
    let fields = untag_instance_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagInstanceProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagMFADevice = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_mfa_device_request) =
    let fields = untag_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_mfa_device_request) =
    let fields = untag_mfa_device_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagMFADevice"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagOpenIDConnectProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_open_id_connect_provider_request) =
    let fields = untag_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_open_id_connect_provider_request) =
    let fields = untag_open_id_connect_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagOpenIDConnectProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagPolicy = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_policy_request) =
    let fields = untag_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_policy_request) =
    let fields = untag_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagRole = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_role_request) =
    let fields = untag_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_role_request) =
    let fields = untag_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagSAMLProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_saml_provider_request) =
    let fields = untag_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_saml_provider_request) =
    let fields = untag_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagServerCertificate = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_server_certificate_request) =
    let fields = untag_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_server_certificate_request) =
    let fields = untag_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UntagUser = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_user_request) =
    let fields = untag_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : untag_user_request) =
    let fields = untag_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateAccessKey = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_access_key_request) =
    let fields = update_access_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateAccessKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_access_key_request) =
    let fields = update_access_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateAccessKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateAccountPasswordPolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_account_password_policy_request) =
    let fields = update_account_password_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateAccountPasswordPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_account_password_policy_request) =
    let fields = update_account_password_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateAccountPasswordPolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateAssumeRolePolicy = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedPolicyDocumentException _ -> "com.amazonaws.iam#MalformedPolicyDocumentException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedPolicyDocument" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_policy_document_exception_of_xml
        with
        | Ok s -> `MalformedPolicyDocumentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_assume_role_policy_request) =
    let fields = update_assume_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateAssumeRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_assume_role_policy_request) =
    let fields = update_assume_role_policy_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateAssumeRolePolicy"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateDelegationRequest = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_delegation_request_request) =
    let fields = update_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_delegation_request_request) =
    let fields = update_delegation_request_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateDelegationRequest"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateGroup = struct
  let error_to_string = function
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_group_request) =
    let fields = update_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_group_request) =
    let fields = update_group_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateGroup"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateLoginProfile = struct
  let error_to_string = function
    | `EntityTemporarilyUnmodifiableException _ ->
        "com.amazonaws.iam#EntityTemporarilyUnmodifiableException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `PasswordPolicyViolationException _ -> "com.amazonaws.iam#PasswordPolicyViolationException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityTemporarilyUnmodifiable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_temporarily_unmodifiable_exception_of_xml
        with
        | Ok s -> `EntityTemporarilyUnmodifiableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PasswordPolicyViolation" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:password_policy_violation_exception_of_xml
        with
        | Ok s -> `PasswordPolicyViolationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_login_profile_request) =
    let fields = update_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_login_profile_request) =
    let fields = update_login_profile_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateLoginProfile"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateOpenIDConnectProviderThumbprint = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_open_id_connect_provider_thumbprint_request) =
    let fields = update_open_id_connect_provider_thumbprint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateOpenIDConnectProviderThumbprint"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_open_id_connect_provider_thumbprint_request) =
    let fields = update_open_id_connect_provider_thumbprint_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"UpdateOpenIDConnectProviderThumbprint"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateRole = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_role_request) =
    let fields = update_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:update_role_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_role_request) =
    let fields = update_role_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateRole"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:update_role_response_of_xml ~error_deserializer
end

module UpdateRoleDescription = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.iam#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnmodifiableEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unmodifiable_entity_exception_of_xml
        with
        | Ok s -> `UnmodifiableEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_role_description_request) =
    let fields = update_role_description_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateRoleDescription"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:update_role_description_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_role_description_request) =
    let fields = update_role_description_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateRoleDescription"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:update_role_description_response_of_xml ~error_deserializer
end

module UpdateSAMLProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_saml_provider_request) =
    let fields = update_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:update_saml_provider_response_of_xml ~error_deserializer

  let request_with_metadata context (request : update_saml_provider_request) =
    let fields = update_saml_provider_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateSAMLProvider"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:update_saml_provider_response_of_xml ~error_deserializer
end

module UpdateServerCertificate = struct
  let error_to_string = function
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_server_certificate_request) =
    let fields = update_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_server_certificate_request) =
    let fields = update_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateServiceSpecificCredential = struct
  let error_to_string = function
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_service_specific_credential_request) =
    let fields = update_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_service_specific_credential_request) =
    let fields = update_service_specific_credential_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateServiceSpecificCredential"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateSigningCertificate = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_signing_certificate_request) =
    let fields = update_signing_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateSigningCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_signing_certificate_request) =
    let fields = update_signing_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateSigningCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateSSHPublicKey = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_ssh_public_key_request) =
    let fields = update_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_ssh_public_key_request) =
    let fields = update_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UpdateUser = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `EntityTemporarilyUnmodifiableException _ ->
        "com.amazonaws.iam#EntityTemporarilyUnmodifiableException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityTemporarilyUnmodifiable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_temporarily_unmodifiable_exception_of_xml
        with
        | Ok s -> `EntityTemporarilyUnmodifiableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_user_request) =
    let fields = update_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : update_user_request) =
    let fields = update_user_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateUser"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module UploadServerCertificate = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.iam#InvalidInputException"
    | `KeyPairMismatchException _ -> "com.amazonaws.iam#KeyPairMismatchException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedCertificateException _ -> "com.amazonaws.iam#MalformedCertificateException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_input_exception_of_xml
        with
        | Ok s -> `InvalidInputException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KeyPairMismatch" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:key_pair_mismatch_exception_of_xml
        with
        | Ok s -> `KeyPairMismatchException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedCertificate" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_certificate_exception_of_xml
        with
        | Ok s -> `MalformedCertificateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : upload_server_certificate_request) =
    let fields = upload_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UploadServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:upload_server_certificate_response_of_xml ~error_deserializer

  let request_with_metadata context (request : upload_server_certificate_request) =
    let fields = upload_server_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UploadServerCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:upload_server_certificate_response_of_xml ~error_deserializer
end

module UploadSigningCertificate = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.iam#ConcurrentModificationException"
    | `DuplicateCertificateException _ -> "com.amazonaws.iam#DuplicateCertificateException"
    | `EntityAlreadyExistsException _ -> "com.amazonaws.iam#EntityAlreadyExistsException"
    | `InvalidCertificateException _ -> "com.amazonaws.iam#InvalidCertificateException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `MalformedCertificateException _ -> "com.amazonaws.iam#MalformedCertificateException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `ServiceFailureException _ -> "com.amazonaws.iam#ServiceFailureException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModification" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateCertificate" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_certificate_exception_of_xml
        with
        | Ok s -> `DuplicateCertificateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "EntityAlreadyExists" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:entity_already_exists_exception_of_xml
        with
        | Ok s -> `EntityAlreadyExistsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCertificate" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_certificate_exception_of_xml
        with
        | Ok s -> `InvalidCertificateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MalformedCertificate" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:malformed_certificate_exception_of_xml
        with
        | Ok s -> `MalformedCertificateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ServiceFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:service_failure_exception_of_xml
        with
        | Ok s -> `ServiceFailureException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : upload_signing_certificate_request) =
    let fields = upload_signing_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UploadSigningCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:upload_signing_certificate_response_of_xml ~error_deserializer

  let request_with_metadata context (request : upload_signing_certificate_request) =
    let fields = upload_signing_certificate_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UploadSigningCertificate"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:upload_signing_certificate_response_of_xml ~error_deserializer
end

module UploadSSHPublicKey = struct
  let error_to_string = function
    | `DuplicateSSHPublicKeyException _ -> "com.amazonaws.iam#DuplicateSSHPublicKeyException"
    | `InvalidPublicKeyException _ -> "com.amazonaws.iam#InvalidPublicKeyException"
    | `LimitExceededException _ -> "com.amazonaws.iam#LimitExceededException"
    | `NoSuchEntityException _ -> "com.amazonaws.iam#NoSuchEntityException"
    | `UnrecognizedPublicKeyEncodingException _ ->
        "com.amazonaws.iam#UnrecognizedPublicKeyEncodingException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DuplicateSSHPublicKey" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_ssh_public_key_exception_of_xml
        with
        | Ok s -> `DuplicateSSHPublicKeyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidPublicKey" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_public_key_exception_of_xml
        with
        | Ok s -> `InvalidPublicKeyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "NoSuchEntity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:no_such_entity_exception_of_xml
        with
        | Ok s -> `NoSuchEntityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnrecognizedPublicKeyEncoding" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unrecognized_public_key_encoding_exception_of_xml
        with
        | Ok s -> `UnrecognizedPublicKeyEncodingException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : upload_ssh_public_key_request) =
    let fields = upload_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UploadSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:upload_ssh_public_key_response_of_xml ~error_deserializer

  let request_with_metadata context (request : upload_ssh_public_key_request) =
    let fields = upload_ssh_public_key_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UploadSSHPublicKey"
      ~xmlNamespace:"https://iam.amazonaws.com/doc/2010-05-08/" ~service ~context ~fields
      ~output_deserializer:upload_ssh_public_key_response_of_xml ~error_deserializer
end
