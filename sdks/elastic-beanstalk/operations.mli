open Types

module AbortEnvironmentUpdate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    abort_environment_update_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    abort_environment_update_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels in-progress environment configuration update or application version deployment.\n"]

module ApplyEnvironmentManagedAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
    | `ManagedActionInvalidStateException of managed_action_invalid_state_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    apply_environment_managed_action_request ->
    ( apply_environment_managed_action_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `ManagedActionInvalidStateException of managed_action_invalid_state_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    apply_environment_managed_action_request ->
    ( apply_environment_managed_action_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `ManagedActionInvalidStateException of managed_action_invalid_state_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a scheduled managed action immediately. A managed action can be applied only if its \
   status is [Scheduled]. Get the status and action ID of a managed action with \
   [DescribeEnvironmentManagedActions].\n"]

module AssociateEnvironmentOperationsRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_environment_operations_role_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_environment_operations_role_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Add or change the operations role used by an environment. After this call is made, Elastic \
   Beanstalk uses the associated operations role for permissions to downstream services during \
   subsequent calls acting on this environment. For more information, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html}Operations \
   roles} in the {i AWS Elastic Beanstalk Developer Guide}.\n"]

module CheckDNSAvailability : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_dns_availability_message ->
    (check_dns_availability_result_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_dns_availability_message ->
    ( check_dns_availability_result_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Checks if the specified CNAME is available.\n"]

module ComposeEnvironments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `TooManyEnvironmentsException of too_many_environments_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    compose_environments_message ->
    ( environment_descriptions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyEnvironmentsException of too_many_environments_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    compose_environments_message ->
    ( environment_descriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyEnvironmentsException of too_many_environments_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create or update a group of environments that each run a separate component of a single \
   application. Takes a list of version labels that specify application source bundles for each of \
   the environments to create or update. The name of each environment and other required \
   information must be included in the source bundles in an environment manifest named [env.yaml]. \
   See \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/environment-mgmt-compose.html}Compose \
   Environments} for details.\n"]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TooManyApplicationsException of too_many_applications_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_message ->
    ( application_description_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TooManyApplicationsException of too_many_applications_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_message ->
    ( application_description_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TooManyApplicationsException of too_many_applications_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an application that has one configuration template named [default] and no application \
   versions.\n"]

module CreateApplicationVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CodeBuildNotInServiceRegionException of code_build_not_in_service_region_exception
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `S3LocationNotInServiceRegionException of s3_location_not_in_service_region_exception
    | `TooManyApplicationsException of too_many_applications_exception
    | `TooManyApplicationVersionsException of too_many_application_versions_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_version_message ->
    ( application_version_description_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CodeBuildNotInServiceRegionException of code_build_not_in_service_region_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `S3LocationNotInServiceRegionException of s3_location_not_in_service_region_exception
      | `TooManyApplicationsException of too_many_applications_exception
      | `TooManyApplicationVersionsException of too_many_application_versions_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_version_message ->
    ( application_version_description_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CodeBuildNotInServiceRegionException of code_build_not_in_service_region_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `S3LocationNotInServiceRegionException of s3_location_not_in_service_region_exception
      | `TooManyApplicationsException of too_many_applications_exception
      | `TooManyApplicationVersionsException of too_many_application_versions_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an application version for the specified application. You can create an application \
   version from a source bundle in Amazon S3, a commit in AWS CodeCommit, or the output of an AWS \
   CodeBuild build as follows:\n\n\
  \ Specify a commit in an AWS CodeCommit repository with [SourceBuildInformation].\n\
  \ \n\
  \  Specify a build in an AWS CodeBuild with [SourceBuildInformation] and [BuildConfiguration].\n\
  \  \n\
  \   Specify a source bundle in S3 with [SourceBundle] \n\
  \   \n\
  \    Omit both [SourceBuildInformation] and [SourceBundle] to use the default sample application.\n\
  \    \n\
  \      After you create an application version with a specified Amazon S3 bucket and key \
   location, you can't change that Amazon S3 location. If you change the Amazon S3 location, you \
   receive an exception when you attempt to launch an environment from the application version.\n\
  \      \n\
  \       "]

module CreateConfigurationTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `TooManyBucketsException of too_many_buckets_exception
    | `TooManyConfigurationTemplatesException of too_many_configuration_templates_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_template_message ->
    ( configuration_settings_description,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception
      | `TooManyConfigurationTemplatesException of too_many_configuration_templates_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_configuration_template_message ->
    ( configuration_settings_description Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception
      | `TooManyConfigurationTemplatesException of too_many_configuration_templates_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an AWS Elastic Beanstalk configuration template, associated with a specific Elastic \
   Beanstalk application. You define application configuration settings in a configuration \
   template. You can then use the configuration template to deploy different versions of the \
   application with the same configuration settings.\n\n\
  \ Templates aren't associated with any environment. The [EnvironmentName] response element is \
   always [null].\n\
  \ \n\
  \  Related Topics\n\
  \  \n\
  \   {ul\n\
  \         {-   [DescribeConfigurationOptions] \n\
  \             \n\
  \              }\n\
  \         {-   [DescribeConfigurationSettings] \n\
  \             \n\
  \              }\n\
  \         {-   [ListAvailableSolutionStacks] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module CreateEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `TooManyEnvironmentsException of too_many_environments_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_message ->
    ( environment_description,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyEnvironmentsException of too_many_environments_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_environment_message ->
    ( environment_description Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyEnvironmentsException of too_many_environments_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Launches an AWS Elastic Beanstalk environment for the specified application using the specified \
   configuration.\n"]

module CreatePlatformVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `TooManyPlatformsException of too_many_platforms_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_platform_version_request ->
    ( create_platform_version_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyPlatformsException of too_many_platforms_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_platform_version_request ->
    ( create_platform_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyPlatformsException of too_many_platforms_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Create a new version of your custom platform.\n"]

module CreateStorageLocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `S3SubscriptionRequiredException of s3_subscription_required_exception
    | `TooManyBucketsException of too_many_buckets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( create_storage_location_result_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `S3SubscriptionRequiredException of s3_subscription_required_exception
      | `TooManyBucketsException of too_many_buckets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( create_storage_location_result_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `S3SubscriptionRequiredException of s3_subscription_required_exception
      | `TooManyBucketsException of too_many_buckets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a bucket in Amazon S3 to store application versions, logs, and other files used by \
   Elastic Beanstalk environments. The Elastic Beanstalk console and EB CLI call this API the \
   first time you create an environment in a region. If the storage location already exists, \
   [CreateStorageLocation] still returns the bucket name but does not create a new bucket.\n"]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationInProgressException of operation_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationInProgressException of operation_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationInProgressException of operation_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified application along with all associated versions and configurations. The \
   application versions will not be deleted from your Amazon S3 bucket.\n\n\
  \  You cannot delete an application that has a running environment.\n\
  \  \n\
  \   "]

module DeleteApplicationVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `S3LocationNotInServiceRegionException of s3_location_not_in_service_region_exception
    | `SourceBundleDeletionException of source_bundle_deletion_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_version_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `S3LocationNotInServiceRegionException of s3_location_not_in_service_region_exception
      | `SourceBundleDeletionException of source_bundle_deletion_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_version_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `S3LocationNotInServiceRegionException of s3_location_not_in_service_region_exception
      | `SourceBundleDeletionException of source_bundle_deletion_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified version from the specified application.\n\n\
  \  You cannot delete an application version that is associated with a running environment.\n\
  \  \n\
  \   "]

module DeleteConfigurationTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationInProgressException of operation_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_template_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationInProgressException of operation_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_configuration_template_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationInProgressException of operation_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified configuration template.\n\n\
  \  When you launch an environment using a configuration template, the environment gets a copy of \
   the template. You can delete or modify the environment's copy of the template without affecting \
   the running environment.\n\
  \  \n\
  \   "]

module DeleteEnvironmentConfiguration : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_configuration_message ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_configuration_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the draft configuration associated with the running environment.\n\n\
  \ Updating a running environment with any configuration changes creates a draft configuration \
   set. You can get the draft configuration using [DescribeConfigurationSettings] while the update \
   is in progress or if the update fails. The [DeploymentStatus] for the draft configuration \
   indicates whether the deployment is in process or has failed. The draft configuration remains \
   in existence until it is deleted with this action.\n\
  \ "]

module DeletePlatformVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `PlatformVersionStillReferencedException of platform_version_still_referenced_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_platform_version_request ->
    ( delete_platform_version_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `PlatformVersionStillReferencedException of platform_version_still_referenced_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_platform_version_request ->
    ( delete_platform_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `PlatformVersionStillReferencedException of platform_version_still_referenced_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified version of a custom platform.\n"]

module DescribeAccountAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_account_attributes_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_account_attributes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns attributes related to AWS Elastic Beanstalk that are associated with the calling AWS \
   account.\n\n\
  \ The result currently has one set of attributes\226\128\148resource quotas.\n\
  \ "]

module DescribeApplications : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_message ->
    (application_descriptions_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_message ->
    ( application_descriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the descriptions of existing applications.\n"]

module DescribeApplicationVersions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_versions_message ->
    (application_version_descriptions_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_versions_message ->
    ( application_version_descriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve a list of application versions.\n"]

module DescribeConfigurationOptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `TooManyBucketsException of too_many_buckets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_options_message ->
    ( configuration_options_description,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TooManyBucketsException of too_many_buckets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_options_message ->
    ( configuration_options_description Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TooManyBucketsException of too_many_buckets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the configuration options that are used in a particular configuration template or \
   environment, or that a specified solution stack defines. The description includes the values \
   the options, their default values, and an indication of the required action on a running \
   environment if an option value is changed.\n"]

module DescribeConfigurationSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `TooManyBucketsException of too_many_buckets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_settings_message ->
    ( configuration_settings_descriptions,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TooManyBucketsException of too_many_buckets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_configuration_settings_message ->
    ( configuration_settings_descriptions Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TooManyBucketsException of too_many_buckets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of the settings for the specified configuration set, that is, either a \
   configuration template or the configuration set associated with a running environment.\n\n\
  \ When describing the settings for the configuration set associated with a running environment, \
   it is possible to receive two sets of setting descriptions. One is the deployed configuration \
   set, and the other is a draft configuration of an environment that is either in the process of \
   deployment or that failed to deploy.\n\
  \ \n\
  \  Related Topics\n\
  \  \n\
  \   {ul\n\
  \         {-   [DeleteEnvironmentConfiguration] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DescribeEnvironmentHealth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_health_request ->
    ( describe_environment_health_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_health_request ->
    ( describe_environment_health_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the overall health of the specified environment. The {b \
   DescribeEnvironmentHealth} operation is only available with AWS Elastic Beanstalk Enhanced \
   Health.\n"]

module DescribeEnvironmentManagedActionHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_managed_action_history_request ->
    ( describe_environment_managed_action_history_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_managed_action_history_request ->
    ( describe_environment_managed_action_history_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists an environment's completed and failed managed actions.\n"]

module DescribeEnvironmentManagedActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_managed_actions_request ->
    ( describe_environment_managed_actions_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_managed_actions_request ->
    ( describe_environment_managed_actions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists an environment's upcoming and in-progress managed actions.\n"]

module DescribeEnvironmentResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_resources_message ->
    ( environment_resource_descriptions_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_resources_message ->
    ( environment_resource_descriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns AWS resources for this environment.\n"]

module DescribeEnvironments : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environments_message ->
    (environment_descriptions_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environments_message ->
    ( environment_descriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns descriptions for existing environments.\n"]

module DescribeEvents : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    (event_descriptions_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_message ->
    ( event_descriptions_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns list of event descriptions matching criteria up to the last 6 weeks.\n\n\
  \  This action returns the most recent 1,000 events from the specified [NextToken].\n\
  \  \n\
  \   "]

module DescribeInstancesHealth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instances_health_request ->
    ( describe_instances_health_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instances_health_request ->
    ( describe_instances_health_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about the health of instances in your AWS Elastic Beanstalk. \
   This operation requires \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/health-enhanced.html}enhanced health \
   reporting}.\n"]

module DescribePlatformVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_platform_version_request ->
    ( describe_platform_version_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_platform_version_request ->
    ( describe_platform_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a platform version. Provides full details. Compare to [ListPlatformVersions], which \
   provides summary information about a list of platform versions.\n\n\
  \ For definitions of platform version and other platform-related terms, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html}AWS Elastic \
   Beanstalk Platforms Glossary}.\n\
  \ "]

module DisassociateEnvironmentOperationsRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_environment_operations_role_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_environment_operations_role_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociate the operations role from an environment. After this call is made, Elastic \
   Beanstalk uses the caller's permissions for permissions to downstream services during \
   subsequent calls acting on this environment. For more information, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/iam-operationsrole.html}Operations \
   roles} in the {i AWS Elastic Beanstalk Developer Guide}.\n"]

module ListAvailableSolutionStacks : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (list_available_solution_stacks_result_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( list_available_solution_stacks_result_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the available solution stack names, with the public version first and then in \
   reverse chronological order.\n"]

module ListPlatformBranches : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_platform_branches_request ->
    (list_platform_branches_result, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_platform_branches_request ->
    ( list_platform_branches_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the platform branches available for your account in an AWS Region. Provides summary \
   information about each platform branch.\n\n\
  \ For definitions of platform branch and other platform-related terms, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html}AWS Elastic \
   Beanstalk Platforms Glossary}.\n\
  \ "]

module ListPlatformVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_platform_versions_request ->
    ( list_platform_versions_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_platform_versions_request ->
    ( list_platform_versions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ElasticBeanstalkServiceException of elastic_beanstalk_service_exception
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the platform versions available for your account in an AWS Region. Provides summary \
   information about each platform version. Compare to [DescribePlatformVersion], which provides \
   full details about a single platform version.\n\n\
  \ For definitions of platform version and other platform-related terms, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-glossary.html}AWS Elastic \
   Beanstalk Platforms Glossary}.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceTypeNotSupportedException of resource_type_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( resource_tags_description_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_message ->
    ( resource_tags_description_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Return the tags applied to an AWS Elastic Beanstalk resource. The response contains a list of \
   tag key-value pairs.\n\n\
  \ Elastic Beanstalk supports tagging of all of its resources. For details about resource \
   tagging, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html}Tagging \
   Application Resources}.\n\
  \ "]

module RebuildEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rebuild_environment_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rebuild_environment_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes and recreates all of the AWS resources (for example: the Auto Scaling group, load \
   balancer, etc.) for a specified environment and forces a restart.\n"]

module RequestEnvironmentInfo : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    request_environment_info_message ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    request_environment_info_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a request to compile the specified type of information of the deployed environment.\n\n\
  \  Setting the [InfoType] to [tail] compiles the last lines from the application server log \
   files of every Amazon EC2 instance in your environment. \n\
  \ \n\
  \   Setting the [InfoType] to [bundle] compresses the application server log files for every \
   Amazon EC2 instance into a [.zip] file. Legacy and .NET containers do not support bundle logs. \n\
  \  \n\
  \    Setting the [InfoType] to [analyze] collects recent events, instance health, and logs from \
   your environment and sends them to Amazon Bedrock in your account to generate diagnostic \
   insights and recommended next steps. \n\
  \   \n\
  \     Use [RetrieveEnvironmentInfo] to obtain the set of logs. \n\
  \    \n\
  \     Related Topics\n\
  \     \n\
  \      {ul\n\
  \            {-   [RetrieveEnvironmentInfo] \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

module RestartAppServer : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restart_app_server_message ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restart_app_server_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Causes the environment to restart the application container server running on each Amazon EC2 \
   instance.\n"]

module RetrieveEnvironmentInfo : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retrieve_environment_info_message ->
    (retrieve_environment_info_result_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retrieve_environment_info_message ->
    ( retrieve_environment_info_result_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the compiled information from a [RequestEnvironmentInfo] request.\n\n\
  \ Related Topics\n\
  \ \n\
  \  {ul\n\
  \        {-   [RequestEnvironmentInfo] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module SwapEnvironmentCNAMEs : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    swap_environment_cnam_es_message ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    swap_environment_cnam_es_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Swaps the CNAMEs of two environments.\n"]

module TerminateEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_environment_message ->
    ( environment_description,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_environment_message ->
    ( environment_description Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Terminates the specified environment.\n"]

module UpdateApplication : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_message ->
    (application_description_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_message ->
    ( application_description_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified application to have the specified properties.\n\n\
  \  If a property (for example, [description]) is not provided, the value remains unchanged. To \
   clear these properties, specify an empty string.\n\
  \  \n\
  \   "]

module UpdateApplicationResourceLifecycle : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_resource_lifecycle_message ->
    ( application_resource_lifecycle_description_message,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_resource_lifecycle_message ->
    ( application_resource_lifecycle_description_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies lifecycle settings for an application.\n"]

module UpdateApplicationVersion : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_version_message ->
    (application_version_description_message, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_version_message ->
    ( application_version_description_message Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified application version to have the specified properties.\n\n\
  \  If a property (for example, [description]) is not provided, the value remains unchanged. To \
   clear properties, specify an empty string.\n\
  \  \n\
  \   "]

module UpdateConfigurationTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `TooManyBucketsException of too_many_buckets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_template_message ->
    ( configuration_settings_description,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_configuration_template_message ->
    ( configuration_settings_description Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified configuration template to have the specified properties or configuration \
   option values.\n\n\
  \  If a property (for example, [ApplicationName]) is not provided, its value remains unchanged. \
   To clear such properties, specify an empty string.\n\
  \  \n\
  \    Related Topics\n\
  \    \n\
  \     {ul\n\
  \           {-   [DescribeConfigurationOptions] \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module UpdateEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `TooManyBucketsException of too_many_buckets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_message ->
    ( environment_description,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_environment_message ->
    ( environment_description Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the environment description, deploys a new application version, updates the \
   configuration settings to an entirely new configuration template, or updates select \
   configuration option values in the running environment.\n\n\
  \  Attempting to update both the release and configuration is not allowed and AWS Elastic \
   Beanstalk returns an [InvalidParameterCombination] error. \n\
  \ \n\
  \   When updating the configuration settings to a new template or individual settings, a draft \
   configuration is created and [DescribeConfigurationSettings] for this environment returns two \
   setting descriptions with different [DeploymentStatus] values. \n\
  \  "]

module UpdateTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_tags_for_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_tags_for_resource_message ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update the list of tags applied to an AWS Elastic Beanstalk resource. Two lists can be passed: \
   [TagsToAdd] for tags to add or update, and [TagsToRemove].\n\n\
  \ Elastic Beanstalk supports tagging of all of its resources. For details about resource \
   tagging, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/applications-tagging-resources.html}Tagging \
   Application Resources}.\n\
  \ \n\
  \  If you create a custom IAM user policy to control permission to this operation, specify one \
   of the following two virtual actions (or both) instead of the API operation name:\n\
  \  \n\
  \    elasticbeanstalk:AddTags  Controls permission to call [UpdateTagsForResource] and pass a \
   list of tags to add in the [TagsToAdd] parameter.\n\
  \                              \n\
  \                                elasticbeanstalk:RemoveTags  Controls permission to call \
   [UpdateTagsForResource] and pass a list of tag keys to remove in the [TagsToRemove] parameter.\n\
  \                                                             \n\
  \                                                                For details about creating a \
   custom user policy, see \
   {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/AWSHowTo.iam.managed-policies.html#AWSHowTo.iam.policies}Creating \
   a Custom User Policy}.\n\
  \                                                                "]

module ValidateConfigurationSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientPrivilegesException of insufficient_privileges_exception
    | `TooManyBucketsException of too_many_buckets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    validate_configuration_settings_message ->
    ( configuration_settings_validation_messages,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    validate_configuration_settings_message ->
    ( configuration_settings_validation_messages Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientPrivilegesException of insufficient_privileges_exception
      | `TooManyBucketsException of too_many_buckets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Takes a set of configuration settings and either a configuration template or environment, and \
   determines whether those values are valid.\n\n\
  \ This action returns a list of messages indicating any errors or warnings associated with the \
   selection of option values.\n\
  \ "]
