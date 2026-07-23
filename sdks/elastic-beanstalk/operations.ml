open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AbortEnvironmentUpdate = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : abort_environment_update_message) =
    let fields = abort_environment_update_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AbortEnvironmentUpdate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : abort_environment_update_message) =
    let fields = abort_environment_update_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AbortEnvironmentUpdate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module ApplyEnvironmentManagedAction = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | `ManagedActionInvalidStateException _ ->
        "com.amazonaws.elasticbeanstalk#ManagedActionInvalidStateException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ManagedActionInvalidStateException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:managed_action_invalid_state_exception_of_xml
        with
        | Ok s -> `ManagedActionInvalidStateException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : apply_environment_managed_action_request) =
    let fields = apply_environment_managed_action_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ApplyEnvironmentManagedAction"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:apply_environment_managed_action_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : apply_environment_managed_action_request) =
    let fields = apply_environment_managed_action_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ApplyEnvironmentManagedAction"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:apply_environment_managed_action_result_of_xml
      ~error_deserializer
end

module AssociateEnvironmentOperationsRole = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : associate_environment_operations_role_message) =
    let fields = associate_environment_operations_role_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AssociateEnvironmentOperationsRole"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : associate_environment_operations_role_message) =
    let fields = associate_environment_operations_role_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AssociateEnvironmentOperationsRole"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module CheckDNSAvailability = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : check_dns_availability_message) =
    let fields = check_dns_availability_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CheckDNSAvailability"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:check_dns_availability_result_message_of_xml ~error_deserializer

  let request_with_metadata context (request : check_dns_availability_message) =
    let fields = check_dns_availability_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CheckDNSAvailability"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:check_dns_availability_result_message_of_xml ~error_deserializer
end

module ComposeEnvironments = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `TooManyEnvironmentsException _ ->
        "com.amazonaws.elasticbeanstalk#TooManyEnvironmentsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyEnvironmentsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_environments_exception_of_xml
        with
        | Ok s -> `TooManyEnvironmentsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : compose_environments_message) =
    let fields = compose_environments_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ComposeEnvironments"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_descriptions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : compose_environments_message) =
    let fields = compose_environments_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ComposeEnvironments"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_descriptions_message_of_xml ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `TooManyApplicationsException _ ->
        "com.amazonaws.elasticbeanstalk#TooManyApplicationsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TooManyApplicationsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_applications_exception_of_xml
        with
        | Ok s -> `TooManyApplicationsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_application_message) =
    let fields = create_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateApplication"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_description_message_of_xml ~error_deserializer

  let request_with_metadata context (request : create_application_message) =
    let fields = create_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateApplication"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_description_message_of_xml ~error_deserializer
end

module CreateApplicationVersion = struct
  let error_to_string = function
    | `CodeBuildNotInServiceRegionException _ ->
        "com.amazonaws.elasticbeanstalk#CodeBuildNotInServiceRegionException"
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `S3LocationNotInServiceRegionException _ ->
        "com.amazonaws.elasticbeanstalk#S3LocationNotInServiceRegionException"
    | `TooManyApplicationsException _ ->
        "com.amazonaws.elasticbeanstalk#TooManyApplicationsException"
    | `TooManyApplicationVersionsException _ ->
        "com.amazonaws.elasticbeanstalk#TooManyApplicationVersionsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CodeBuildNotInServiceRegionException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:code_build_not_in_service_region_exception_of_xml
        with
        | Ok s -> `CodeBuildNotInServiceRegionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "S3LocationNotInServiceRegionException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:s3_location_not_in_service_region_exception_of_xml
        with
        | Ok s -> `S3LocationNotInServiceRegionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyApplicationsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_applications_exception_of_xml
        with
        | Ok s -> `TooManyApplicationsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyApplicationVersionsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_application_versions_exception_of_xml
        with
        | Ok s -> `TooManyApplicationVersionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_application_version_message) =
    let fields = create_application_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateApplicationVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_version_description_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : create_application_version_message) =
    let fields = create_application_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateApplicationVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_version_description_message_of_xml
      ~error_deserializer
end

module CreateConfigurationTemplate = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `TooManyBucketsException _ -> "com.amazonaws.elasticbeanstalk#TooManyBucketsException"
    | `TooManyConfigurationTemplatesException _ ->
        "com.amazonaws.elasticbeanstalk#TooManyConfigurationTemplatesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyBucketsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_buckets_exception_of_xml
        with
        | Ok s -> `TooManyBucketsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyConfigurationTemplatesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_configuration_templates_exception_of_xml
        with
        | Ok s -> `TooManyConfigurationTemplatesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_configuration_template_message) =
    let fields = create_configuration_template_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateConfigurationTemplate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_description_of_xml ~error_deserializer

  let request_with_metadata context (request : create_configuration_template_message) =
    let fields = create_configuration_template_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateConfigurationTemplate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_description_of_xml ~error_deserializer
end

module CreateEnvironment = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `TooManyEnvironmentsException _ ->
        "com.amazonaws.elasticbeanstalk#TooManyEnvironmentsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyEnvironmentsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_environments_exception_of_xml
        with
        | Ok s -> `TooManyEnvironmentsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_environment_message) =
    let fields = create_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_description_of_xml ~error_deserializer

  let request_with_metadata context (request : create_environment_message) =
    let fields = create_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_description_of_xml ~error_deserializer
end

module CreatePlatformVersion = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `TooManyPlatformsException _ -> "com.amazonaws.elasticbeanstalk#TooManyPlatformsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyPlatformsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_platforms_exception_of_xml
        with
        | Ok s -> `TooManyPlatformsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_platform_version_request) =
    let fields = create_platform_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreatePlatformVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:create_platform_version_result_of_xml ~error_deserializer

  let request_with_metadata context (request : create_platform_version_request) =
    let fields = create_platform_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreatePlatformVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:create_platform_version_result_of_xml ~error_deserializer
end

module CreateStorageLocation = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `S3SubscriptionRequiredException _ ->
        "com.amazonaws.elasticbeanstalk#S3SubscriptionRequiredException"
    | `TooManyBucketsException _ -> "com.amazonaws.elasticbeanstalk#TooManyBucketsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "S3SubscriptionRequiredException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:s3_subscription_required_exception_of_xml
        with
        | Ok s -> `S3SubscriptionRequiredException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyBucketsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_buckets_exception_of_xml
        with
        | Ok s -> `TooManyBucketsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateStorageLocation"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:create_storage_location_result_message_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateStorageLocation"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:create_storage_location_result_message_of_xml ~error_deserializer
end

module DeleteApplication = struct
  let error_to_string = function
    | `OperationInProgressException _ ->
        "com.amazonaws.elasticbeanstalk#OperationInProgressException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationInProgressFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_application_message) =
    let fields = delete_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteApplication"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : delete_application_message) =
    let fields = delete_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteApplication"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module DeleteApplicationVersion = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `OperationInProgressException _ ->
        "com.amazonaws.elasticbeanstalk#OperationInProgressException"
    | `S3LocationNotInServiceRegionException _ ->
        "com.amazonaws.elasticbeanstalk#S3LocationNotInServiceRegionException"
    | `SourceBundleDeletionException _ ->
        "com.amazonaws.elasticbeanstalk#SourceBundleDeletionException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "S3LocationNotInServiceRegionException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:s3_location_not_in_service_region_exception_of_xml
        with
        | Ok s -> `S3LocationNotInServiceRegionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SourceBundleDeletionFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:source_bundle_deletion_exception_of_xml
        with
        | Ok s -> `SourceBundleDeletionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_application_version_message) =
    let fields = delete_application_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteApplicationVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : delete_application_version_message) =
    let fields = delete_application_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteApplicationVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module DeleteConfigurationTemplate = struct
  let error_to_string = function
    | `OperationInProgressException _ ->
        "com.amazonaws.elasticbeanstalk#OperationInProgressException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationInProgressFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_configuration_template_message) =
    let fields = delete_configuration_template_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteConfigurationTemplate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : delete_configuration_template_message) =
    let fields = delete_configuration_template_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteConfigurationTemplate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module DeleteEnvironmentConfiguration = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_environment_configuration_message) =
    let fields = delete_environment_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteEnvironmentConfiguration"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : delete_environment_configuration_message) =
    let fields = delete_environment_configuration_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteEnvironmentConfiguration"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module DeletePlatformVersion = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `OperationInProgressException _ ->
        "com.amazonaws.elasticbeanstalk#OperationInProgressException"
    | `PlatformVersionStillReferencedException _ ->
        "com.amazonaws.elasticbeanstalk#PlatformVersionStillReferencedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PlatformVersionStillReferencedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:platform_version_still_referenced_exception_of_xml
        with
        | Ok s -> `PlatformVersionStillReferencedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_platform_version_request) =
    let fields = delete_platform_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeletePlatformVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_platform_version_result_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_platform_version_request) =
    let fields = delete_platform_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeletePlatformVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_platform_version_result_of_xml ~error_deserializer
end

module DescribeAccountAttributes = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAccountAttributes"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_account_attributes_result_of_xml ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAccountAttributes"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_account_attributes_result_of_xml ~error_deserializer
end

module DescribeApplications = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_applications_message) =
    let fields = describe_applications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeApplications"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_descriptions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_applications_message) =
    let fields = describe_applications_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeApplications"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_descriptions_message_of_xml ~error_deserializer
end

module DescribeApplicationVersions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_application_versions_message) =
    let fields = describe_application_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeApplicationVersions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_version_descriptions_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_application_versions_message) =
    let fields = describe_application_versions_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeApplicationVersions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_version_descriptions_message_of_xml
      ~error_deserializer
end

module DescribeConfigurationOptions = struct
  let error_to_string = function
    | `TooManyBucketsException _ -> "com.amazonaws.elasticbeanstalk#TooManyBucketsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TooManyBucketsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_buckets_exception_of_xml
        with
        | Ok s -> `TooManyBucketsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_configuration_options_message) =
    let fields = describe_configuration_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeConfigurationOptions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_options_description_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_configuration_options_message) =
    let fields = describe_configuration_options_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeConfigurationOptions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_options_description_of_xml ~error_deserializer
end

module DescribeConfigurationSettings = struct
  let error_to_string = function
    | `TooManyBucketsException _ -> "com.amazonaws.elasticbeanstalk#TooManyBucketsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TooManyBucketsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_buckets_exception_of_xml
        with
        | Ok s -> `TooManyBucketsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_configuration_settings_message) =
    let fields = describe_configuration_settings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeConfigurationSettings"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_descriptions_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_configuration_settings_message) =
    let fields = describe_configuration_settings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeConfigurationSettings"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_descriptions_of_xml ~error_deserializer
end

module DescribeEnvironmentHealth = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.elasticbeanstalk#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRequestException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_request_exception_of_xml
        with
        | Ok s -> `InvalidRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_environment_health_request) =
    let fields = describe_environment_health_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEnvironmentHealth"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_environment_health_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_environment_health_request) =
    let fields = describe_environment_health_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEnvironmentHealth"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_environment_health_result_of_xml ~error_deserializer
end

module DescribeEnvironmentManagedActionHistory = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_environment_managed_action_history_request) =
    let fields = describe_environment_managed_action_history_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEnvironmentManagedActionHistory"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_environment_managed_action_history_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_environment_managed_action_history_request)
      =
    let fields = describe_environment_managed_action_history_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DescribeEnvironmentManagedActionHistory"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_environment_managed_action_history_result_of_xml
      ~error_deserializer
end

module DescribeEnvironmentManagedActions = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_environment_managed_actions_request) =
    let fields = describe_environment_managed_actions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEnvironmentManagedActions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_environment_managed_actions_result_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_environment_managed_actions_request) =
    let fields = describe_environment_managed_actions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEnvironmentManagedActions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_environment_managed_actions_result_of_xml
      ~error_deserializer
end

module DescribeEnvironmentResources = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_environment_resources_message) =
    let fields = describe_environment_resources_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEnvironmentResources"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_resource_descriptions_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_environment_resources_message) =
    let fields = describe_environment_resources_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEnvironmentResources"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_resource_descriptions_message_of_xml
      ~error_deserializer
end

module DescribeEnvironments = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_environments_message) =
    let fields = describe_environments_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEnvironments"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_descriptions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_environments_message) =
    let fields = describe_environments_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEnvironments"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_descriptions_message_of_xml ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeEvents"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:event_descriptions_message_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_events_message) =
    let fields = describe_events_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeEvents"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:event_descriptions_message_of_xml ~error_deserializer
end

module DescribeInstancesHealth = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | `InvalidRequestException _ -> "com.amazonaws.elasticbeanstalk#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidRequestException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_request_exception_of_xml
        with
        | Ok s -> `InvalidRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_instances_health_request) =
    let fields = describe_instances_health_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeInstancesHealth"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_instances_health_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_instances_health_request) =
    let fields = describe_instances_health_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeInstancesHealth"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_instances_health_result_of_xml ~error_deserializer
end

module DescribePlatformVersion = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_platform_version_request) =
    let fields = describe_platform_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribePlatformVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_platform_version_result_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_platform_version_request) =
    let fields = describe_platform_version_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribePlatformVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_platform_version_result_of_xml ~error_deserializer
end

module DisassociateEnvironmentOperationsRole = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disassociate_environment_operations_role_message) =
    let fields = disassociate_environment_operations_role_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisassociateEnvironmentOperationsRole"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : disassociate_environment_operations_role_message) =
    let fields = disassociate_environment_operations_role_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DisassociateEnvironmentOperationsRole"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module ListAvailableSolutionStacks = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAvailableSolutionStacks"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:list_available_solution_stacks_result_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let fields = Smaws_Lib.Smithy_api.Query_serializers.unit__to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAvailableSolutionStacks"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:list_available_solution_stacks_result_message_of_xml
      ~error_deserializer
end

module ListPlatformBranches = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_platform_branches_request) =
    let fields = list_platform_branches_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPlatformBranches"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:list_platform_branches_result_of_xml ~error_deserializer

  let request_with_metadata context (request : list_platform_branches_request) =
    let fields = list_platform_branches_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPlatformBranches"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:list_platform_branches_result_of_xml ~error_deserializer
end

module ListPlatformVersions = struct
  let error_to_string = function
    | `ElasticBeanstalkServiceException _ ->
        "com.amazonaws.elasticbeanstalk#ElasticBeanstalkServiceException"
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ElasticBeanstalkServiceException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:elastic_beanstalk_service_exception_of_xml
        with
        | Ok s -> `ElasticBeanstalkServiceException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_platform_versions_request) =
    let fields = list_platform_versions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListPlatformVersions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:list_platform_versions_result_of_xml ~error_deserializer

  let request_with_metadata context (request : list_platform_versions_request) =
    let fields = list_platform_versions_request_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListPlatformVersions"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:list_platform_versions_result_of_xml ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.elasticbeanstalk#ResourceNotFoundException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.elasticbeanstalk#ResourceTypeNotSupportedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceTypeNotSupportedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_type_not_supported_exception_of_xml
        with
        | Ok s -> `ResourceTypeNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_tags_for_resource_message) =
    let fields = list_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTagsForResource"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:resource_tags_description_message_of_xml ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_message) =
    let fields = list_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTagsForResource"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:resource_tags_description_message_of_xml ~error_deserializer
end

module RebuildEnvironment = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : rebuild_environment_message) =
    let fields = rebuild_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RebuildEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : rebuild_environment_message) =
    let fields = rebuild_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RebuildEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module RequestEnvironmentInfo = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : request_environment_info_message) =
    let fields = request_environment_info_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RequestEnvironmentInfo"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : request_environment_info_message) =
    let fields = request_environment_info_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RequestEnvironmentInfo"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module RestartAppServer = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : restart_app_server_message) =
    let fields = restart_app_server_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RestartAppServer"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : restart_app_server_message) =
    let fields = restart_app_server_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RestartAppServer"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module RetrieveEnvironmentInfo = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : retrieve_environment_info_message) =
    let fields = retrieve_environment_info_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RetrieveEnvironmentInfo"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:retrieve_environment_info_result_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : retrieve_environment_info_message) =
    let fields = retrieve_environment_info_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RetrieveEnvironmentInfo"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:retrieve_environment_info_result_message_of_xml
      ~error_deserializer
end

module SwapEnvironmentCNAMEs = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : swap_environment_cnam_es_message) =
    let fields = swap_environment_cnam_es_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SwapEnvironmentCNAMEs"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : swap_environment_cnam_es_message) =
    let fields = swap_environment_cnam_es_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SwapEnvironmentCNAMEs"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module TerminateEnvironment = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : terminate_environment_message) =
    let fields = terminate_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TerminateEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_description_of_xml ~error_deserializer

  let request_with_metadata context (request : terminate_environment_message) =
    let fields = terminate_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TerminateEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_description_of_xml ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_application_message) =
    let fields = update_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateApplication"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_description_message_of_xml ~error_deserializer

  let request_with_metadata context (request : update_application_message) =
    let fields = update_application_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateApplication"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_description_message_of_xml ~error_deserializer
end

module UpdateApplicationResourceLifecycle = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_application_resource_lifecycle_message) =
    let fields = update_application_resource_lifecycle_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateApplicationResourceLifecycle"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_resource_lifecycle_description_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : update_application_resource_lifecycle_message) =
    let fields = update_application_resource_lifecycle_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateApplicationResourceLifecycle"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_resource_lifecycle_description_message_of_xml
      ~error_deserializer
end

module UpdateApplicationVersion = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_application_version_message) =
    let fields = update_application_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateApplicationVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_version_description_message_of_xml
      ~error_deserializer

  let request_with_metadata context (request : update_application_version_message) =
    let fields = update_application_version_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateApplicationVersion"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:application_version_description_message_of_xml
      ~error_deserializer
end

module UpdateConfigurationTemplate = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `TooManyBucketsException _ -> "com.amazonaws.elasticbeanstalk#TooManyBucketsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyBucketsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_buckets_exception_of_xml
        with
        | Ok s -> `TooManyBucketsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_configuration_template_message) =
    let fields = update_configuration_template_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateConfigurationTemplate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_description_of_xml ~error_deserializer

  let request_with_metadata context (request : update_configuration_template_message) =
    let fields = update_configuration_template_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateConfigurationTemplate"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_description_of_xml ~error_deserializer
end

module UpdateEnvironment = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `TooManyBucketsException _ -> "com.amazonaws.elasticbeanstalk#TooManyBucketsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyBucketsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_buckets_exception_of_xml
        with
        | Ok s -> `TooManyBucketsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_environment_message) =
    let fields = update_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_description_of_xml ~error_deserializer

  let request_with_metadata context (request : update_environment_message) =
    let fields = update_environment_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateEnvironment"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:environment_description_of_xml ~error_deserializer
end

module UpdateTagsForResource = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `OperationInProgressException _ ->
        "com.amazonaws.elasticbeanstalk#OperationInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.elasticbeanstalk#ResourceNotFoundException"
    | `ResourceTypeNotSupportedException _ ->
        "com.amazonaws.elasticbeanstalk#ResourceTypeNotSupportedException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticbeanstalk#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationInProgressFailure" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_in_progress_exception_of_xml
        with
        | Ok s -> `OperationInProgressException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceTypeNotSupportedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_type_not_supported_exception_of_xml
        with
        | Ok s -> `ResourceTypeNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTagsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : update_tags_for_resource_message) =
    let fields = update_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UpdateTagsForResource"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer

  let request_with_metadata context (request : update_tags_for_resource_message) =
    let fields = update_tags_for_resource_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UpdateTagsForResource"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml
      ~error_deserializer
end

module ValidateConfigurationSettings = struct
  let error_to_string = function
    | `InsufficientPrivilegesException _ ->
        "com.amazonaws.elasticbeanstalk#InsufficientPrivilegesException"
    | `TooManyBucketsException _ -> "com.amazonaws.elasticbeanstalk#TooManyBucketsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InsufficientPrivilegesException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_privileges_exception_of_xml
        with
        | Ok s -> `InsufficientPrivilegesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyBucketsException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_buckets_exception_of_xml
        with
        | Ok s -> `TooManyBucketsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : validate_configuration_settings_message) =
    let fields = validate_configuration_settings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ValidateConfigurationSettings"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_validation_messages_of_xml
      ~error_deserializer

  let request_with_metadata context (request : validate_configuration_settings_message) =
    let fields = validate_configuration_settings_message_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ValidateConfigurationSettings"
      ~xmlNamespace:"http://elasticbeanstalk.amazonaws.com/docs/2010-12-01/" ~service ~context
      ~fields ~output_deserializer:configuration_settings_validation_messages_of_xml
      ~error_deserializer
end
