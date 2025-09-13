open Types

module AddApplicationCloudWatchLoggingOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_cloud_watch_logging_option_request ->
    ( add_application_cloud_watch_logging_option_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Adds an Amazon CloudWatch log stream to monitor application configuration errors.\n"]

module AddApplicationInput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_request ->
    ( add_application_input_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  " Adds a streaming source to your SQL-based Kinesis Data Analytics application. \n\n\
  \ You can add a streaming source when you create an application, or you can use this operation \
   to add a streaming source after you create an application. For more information, see \
   [CreateApplication].\n\
  \ \n\
  \  Any configuration update, including adding a streaming source using this operation, results \
   in a new version of the application. You can use the [DescribeApplication] operation to find \
   the current application version. \n\
  \  "]

module AddApplicationInputProcessingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_processing_configuration_request ->
    ( add_application_input_processing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Adds an [InputProcessingConfiguration] to a SQL-based Kinesis Data Analytics application. An \
   input processor pre-processes records on the input stream before the application's SQL code \
   executes. Currently, the only input processor available is \
   {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.\n"]

module AddApplicationOutput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_output_request ->
    ( add_application_output_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Adds an external destination to your SQL-based Kinesis Data Analytics application.\n\n\
  \ If you want Kinesis Data Analytics to deliver data from an in-application stream within your \
   application to an external destination (such as an Kinesis data stream, a Kinesis Data Firehose \
   delivery stream, or an Amazon Lambda function), you add the relevant configuration to your \
   application using this operation. You can configure one or more outputs for your application. \
   Each output configuration maps an in-application stream and an external destination.\n\
  \ \n\
  \   You can use one of the output configurations to deliver data from your in-application error \
   stream to an external destination so that you can analyze the errors. \n\
  \  \n\
  \    Any configuration update, including adding a streaming source using this operation, results \
   in a new version of the application. You can use the [DescribeApplication] operation to find \
   the current application version.\n\
  \   "]

module AddApplicationReferenceDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_reference_data_source_request ->
    ( add_application_reference_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Adds a reference data source to an existing SQL-based Kinesis Data Analytics application.\n\n\
  \ Kinesis Data Analytics reads reference data (that is, an Amazon S3 object) and creates an \
   in-application table within your application. In the request, you provide the source (S3 bucket \
   name and object key name), name of the in-application table to create, and the necessary \
   mapping information that describes how data in an Amazon S3 object maps to columns in the \
   resulting in-application table.\n\
  \ "]

module AddApplicationVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_vpc_configuration_request ->
    ( add_application_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Adds a Virtual Private Cloud (VPC) configuration to the application. Applications can use VPCs \
   to store and access resources securely.\n\n\
  \ Note the following about VPC configurations for Managed Service for Apache Flink applications:\n\
  \ \n\
  \  {ul\n\
  \        {-  VPC configurations are not supported for SQL applications.\n\
  \            \n\
  \             }\n\
  \        {-  When a VPC is added to a Managed Service for Apache Flink application, the \
   application can no longer be accessed from the Internet directly. To enable Internet access to \
   the application, add an Internet gateway to your VPC.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a Managed Service for Apache Flink application. For information about creating a \
   Managed Service for Apache Flink application, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html}Creating an \
   Application}.\n"]

module CreateApplicationPresignedUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_presigned_url_request ->
    ( create_application_presigned_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Creates and returns a URL that you can use to connect to an application's extension.\n\n\
  \ The IAM role or user used to call this API defines the permissions to access the extension. \
   After the presigned URL is created, no additional permission is required to access this URL. \
   IAM authorization policies for this API are also enforced for every HTTP request that attempts \
   to connect to the extension. \n\
  \ \n\
  \  You control the amount of time that the URL will be valid using the \
   [SessionExpirationDurationInSeconds] parameter. If you do not provide this parameter, the \
   returned URL is valid for twelve hours.\n\
  \  \n\
  \    The URL that you get from a call to CreateApplicationPresignedUrl must be used within 3 \
   minutes to be valid. If you first try to use the URL after the 3-minute limit expires, the \
   service returns an HTTP 403 Forbidden error.\n\
  \    \n\
  \     "]

module CreateApplicationSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_snapshot_request ->
    ( create_application_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Creates a snapshot of the application's state data.\n"]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the specified application. Managed Service for Apache Flink halts application execution \
   and deletes the application.\n"]

module DeleteApplicationCloudWatchLoggingOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_cloud_watch_logging_option_request ->
    ( delete_application_cloud_watch_logging_option_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an Amazon CloudWatch log stream from an SQL-based Kinesis Data Analytics application. \n"]

module DeleteApplicationInputProcessingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_input_processing_configuration_request ->
    ( delete_application_input_processing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Deletes an [InputProcessingConfiguration] from an input.\n"]

module DeleteApplicationOutput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_output_request ->
    ( delete_application_output_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the output destination configuration from your SQL-based Kinesis Data Analytics \
   application's configuration. Kinesis Data Analytics will no longer write data from the \
   corresponding in-application stream to the external output destination.\n"]

module DeleteApplicationReferenceDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_reference_data_source_request ->
    ( delete_application_reference_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Deletes a reference data source configuration from the specified SQL-based Kinesis Data \
   Analytics application's configuration.\n\n\
  \ If the application is running, Kinesis Data Analytics immediately removes the in-application \
   table that you created using the [AddApplicationReferenceDataSource] operation. \n\
  \ "]

module DeleteApplicationSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_snapshot_request ->
    ( delete_application_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Deletes a snapshot of application state.\n"]

module DeleteApplicationVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_vpc_configuration_request ->
    ( delete_application_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Removes a VPC configuration from a Managed Service for Apache Flink application.\n"]

module DescribeApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about a specific Managed Service for Apache Flink application.\n\n\
  \ If you want to retrieve a list of all applications in your account, use the [ListApplications] \
   operation.\n\
  \ "]

module DescribeApplicationOperation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_operation_request ->
    ( describe_application_operation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Returns information about a specific operation performed on a Managed Service for Apache Flink \
   application"]

module DescribeApplicationSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_snapshot_request ->
    ( describe_application_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Returns information about a snapshot of application state data.\n"]

module DescribeApplicationVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_version_request ->
    ( describe_application_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Provides a detailed description of a specified version of the application. To see a list of all \
   the versions of an application, invoke the [ListApplicationVersions] operation.\n\n\
  \  This operation is supported only for Managed Service for Apache Flink.\n\
  \  \n\
  \   "]

module DiscoverInputSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceProvisionedThroughputExceededException of
      resource_provisioned_throughput_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `UnableToDetectSchemaException of unable_to_detect_schema_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    discover_input_schema_request ->
    ( discover_input_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceProvisionedThroughputExceededException of
        resource_provisioned_throughput_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `UnableToDetectSchemaException of unable_to_detect_schema_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Infers a schema for a SQL-based Kinesis Data Analytics application by evaluating sample records \
   on the specified streaming source (Kinesis data stream or Kinesis Data Firehose delivery \
   stream) or Amazon S3 object. In the response, the operation returns the inferred schema and \
   also the sample records that the operation used to infer the schema.\n\n\
  \  You can use the inferred schema when configuring a streaming source for your application. \
   When you create an application using the Kinesis Data Analytics console, the console uses this \
   operation to infer a schema and show it in the console user interface. \n\
  \ "]

module ListApplicationOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_operations_request ->
    ( list_application_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Lists information about operations performed on a Managed Service for Apache Flink application"]

module ListApplicationSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_snapshots_request ->
    ( list_application_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc "Lists information about the current application snapshots.\n"]

module ListApplicationVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_versions_request ->
    ( list_application_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Lists all the versions for the specified application, including versions that were rolled back. \
   The response also includes a summary of the configuration associated with each version.\n\n\
  \ To get the complete description of a specific application version, invoke the \
   [DescribeApplicationVersion] operation.\n\
  \ \n\
  \   This operation is supported only for Managed Service for Apache Flink.\n\
  \   \n\
  \    "]

module ListApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidRequestException of invalid_request_exception ]
    )
    result
end
[@@ocaml.doc
  "Returns a list of Managed Service for Apache Flink applications in your account. For each \
   application, the response includes the application name, Amazon Resource Name (ARN), and \
   status. \n\n\
  \ If you want detailed information about a specific application, use [DescribeApplication].\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Retrieves the list of key-value tags assigned to the application. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]

module RollbackApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_application_request ->
    ( rollback_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Reverts the application to the previous running version. You can roll back an application if \
   you suspect it is stuck in a transient status or in the running status. \n\n\
  \ You can roll back an application only if it is in the [UPDATING], [AUTOSCALING], or [RUNNING] \
   statuses.\n\
  \ \n\
  \  When you rollback an application, it loads state data from the last successful snapshot. If \
   the application has no snapshots, Managed Service for Apache Flink rejects the rollback request.\n\
  \  "]

module StartApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_application_request ->
    ( start_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Starts the specified Managed Service for Apache Flink application. After creating an \
   application, you must exclusively call this operation to start your application.\n"]

module StopApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_application_request ->
    ( stop_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Stops the application from processing data. You can stop an application only if it is in the \
   running status, unless you set the [Force] parameter to [true].\n\n\
  \ You can use the [DescribeApplication] operation to find the application status. \n\
  \ \n\
  \  Managed Service for Apache Flink takes a snapshot when the application is stopped, unless \
   [Force] is set to [true].\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Adds one or more key-value tags to a Managed Service for Apache Flink application. Note that \
   the maximum number of application tags includes system tags. The maximum number of user-defined \
   application tags is 50. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Removes one or more tags from a Managed Service for Apache Flink application. For more \
   information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Updates an existing Managed Service for Apache Flink application. Using this operation, you can \
   update application code, input configuration, and output configuration. \n\n\
  \ Managed Service for Apache Flink updates the [ApplicationVersionId] each time you update your \
   application. \n\
  \ "]

module UpdateApplicationMaintenanceConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_maintenance_configuration_request ->
    ( update_application_maintenance_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result
end
[@@ocaml.doc
  "Updates the maintenance configuration of the Managed Service for Apache Flink application. \n\n\
  \ You can invoke this operation on an application that is in one of the two following states: \
   [READY] or [RUNNING]. If you invoke it when the application is in a state other than these two \
   states, it throws a [ResourceInUseException]. The service makes use of the updated \
   configuration the next time it schedules maintenance for the application. If you invoke this \
   operation after the service schedules maintenance, the service will apply the configuration \
   update the next time it schedules maintenance for the application. This means that you might \
   not see the maintenance configuration update applied to the maintenance process that follows a \
   successful invocation of this operation, but to the following maintenance process instead.\n\
  \ \n\
  \  To see the current maintenance configuration of your application, invoke the \
   [DescribeApplication] operation.\n\
  \  \n\
  \   For information about application maintenance, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/maintenance.html}Managed Service \
   for Apache Flink for Apache Flink Maintenance}.\n\
  \   \n\
  \     This operation is supported only for Managed Service for Apache Flink.\n\
  \     \n\
  \      "]
