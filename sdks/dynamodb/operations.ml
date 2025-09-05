open Types
open Service_metadata
module BatchExecuteStatement =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : batch_execute_statement_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.batch_execute_statement_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810BatchExecuteStatement" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.batch_execute_statement_output_of_yojson
          ~error_deserializer
  end
module BatchGetItem =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : batch_get_item_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.batch_get_item_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810BatchGetItem" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.batch_get_item_output_of_yojson
          ~error_deserializer
  end
module BatchWriteItem =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ItemCollectionSizeLimitExceededException") ->
            `ItemCollectionSizeLimitExceededException
              (Json_deserializers.item_collection_size_limit_exceeded_exception_of_yojson
                 tree path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "ReplicatedWriteConflictException") ->
            `ReplicatedWriteConflictException
              (Json_deserializers.replicated_write_conflict_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : batch_write_item_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.batch_write_item_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810BatchWriteItem" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.batch_write_item_output_of_yojson
          ~error_deserializer
  end
module CreateBackup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "BackupInUseException") ->
            `BackupInUseException
              (Json_deserializers.backup_in_use_exception_of_yojson tree path)
        | (_, "ContinuousBackupsUnavailableException") ->
            `ContinuousBackupsUnavailableException
              (Json_deserializers.continuous_backups_unavailable_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "TableInUseException") ->
            `TableInUseException
              (Json_deserializers.table_in_use_exception_of_yojson tree path)
        | (_, "TableNotFoundException") ->
            `TableNotFoundException
              (Json_deserializers.table_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_backup_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.create_backup_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810CreateBackup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_backup_output_of_yojson
          ~error_deserializer
  end
module CreateGlobalTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "GlobalTableAlreadyExistsException") ->
            `GlobalTableAlreadyExistsException
              (Json_deserializers.global_table_already_exists_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "TableNotFoundException") ->
            `TableNotFoundException
              (Json_deserializers.table_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_global_table_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.create_global_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810CreateGlobalTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_global_table_output_of_yojson
          ~error_deserializer
  end
module CreateTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_table_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.create_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810CreateTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_table_output_of_yojson
          ~error_deserializer
  end
module DeleteBackup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "BackupInUseException") ->
            `BackupInUseException
              (Json_deserializers.backup_in_use_exception_of_yojson tree path)
        | (_, "BackupNotFoundException") ->
            `BackupNotFoundException
              (Json_deserializers.backup_not_found_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_backup_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.delete_backup_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DeleteBackup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_backup_output_of_yojson
          ~error_deserializer
  end
module DeleteItem =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConditionalCheckFailedException") ->
            `ConditionalCheckFailedException
              (Json_deserializers.conditional_check_failed_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ItemCollectionSizeLimitExceededException") ->
            `ItemCollectionSizeLimitExceededException
              (Json_deserializers.item_collection_size_limit_exceeded_exception_of_yojson
                 tree path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "ReplicatedWriteConflictException") ->
            `ReplicatedWriteConflictException
              (Json_deserializers.replicated_write_conflict_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TransactionConflictException") ->
            `TransactionConflictException
              (Json_deserializers.transaction_conflict_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_item_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.delete_item_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DeleteItem" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_item_output_of_yojson
          ~error_deserializer
  end
module DeleteResourcePolicy =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "PolicyNotFoundException") ->
            `PolicyNotFoundException
              (Json_deserializers.policy_not_found_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_resource_policy_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_resource_policy_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DeleteResourcePolicy" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_resource_policy_output_of_yojson
          ~error_deserializer
  end
module DeleteTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_table_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.delete_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DeleteTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_table_output_of_yojson
          ~error_deserializer
  end
module DescribeBackup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "BackupNotFoundException") ->
            `BackupNotFoundException
              (Json_deserializers.backup_not_found_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_backup_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.describe_backup_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeBackup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_backup_output_of_yojson
          ~error_deserializer
  end
module DescribeContinuousBackups =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "TableNotFoundException") ->
            `TableNotFoundException
              (Json_deserializers.table_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_continuous_backups_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_continuous_backups_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeContinuousBackups" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_continuous_backups_output_of_yojson
          ~error_deserializer
  end
module DescribeContributorInsights =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_contributor_insights_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_contributor_insights_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeContributorInsights" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_contributor_insights_output_of_yojson
          ~error_deserializer
  end
module DescribeEndpoints =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_endpoints_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_endpoints_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeEndpoints" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_endpoints_response_of_yojson
          ~error_deserializer
  end
module DescribeExport =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExportNotFoundException") ->
            `ExportNotFoundException
              (Json_deserializers.export_not_found_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_export_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.describe_export_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeExport" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_export_output_of_yojson
          ~error_deserializer
  end
module DescribeGlobalTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "GlobalTableNotFoundException") ->
            `GlobalTableNotFoundException
              (Json_deserializers.global_table_not_found_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_global_table_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_global_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeGlobalTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_global_table_output_of_yojson
          ~error_deserializer
  end
module DescribeGlobalTableSettings =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "GlobalTableNotFoundException") ->
            `GlobalTableNotFoundException
              (Json_deserializers.global_table_not_found_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_global_table_settings_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_global_table_settings_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeGlobalTableSettings" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_global_table_settings_output_of_yojson
          ~error_deserializer
  end
module DescribeImport =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ImportNotFoundException") ->
            `ImportNotFoundException
              (Json_deserializers.import_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_import_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.describe_import_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeImport" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_import_output_of_yojson
          ~error_deserializer
  end
module DescribeKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_kinesis_streaming_destination_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeKinesisStreamingDestination"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_kinesis_streaming_destination_output_of_yojson
          ~error_deserializer
  end
module DescribeLimits =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_limits_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.describe_limits_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeLimits" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_limits_output_of_yojson
          ~error_deserializer
  end
module DescribeTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_table_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.describe_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_table_output_of_yojson
          ~error_deserializer
  end
module DescribeTableReplicaAutoScaling =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_table_replica_auto_scaling_input)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_table_replica_auto_scaling_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeTableReplicaAutoScaling"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_table_replica_auto_scaling_output_of_yojson
          ~error_deserializer
  end
module DescribeTimeToLive =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_time_to_live_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_time_to_live_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DescribeTimeToLive" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_time_to_live_output_of_yojson
          ~error_deserializer
  end
module DisableKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.kinesis_streaming_destination_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810DisableKinesisStreamingDestination"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.kinesis_streaming_destination_output_of_yojson
          ~error_deserializer
  end
module EnableKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.kinesis_streaming_destination_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810EnableKinesisStreamingDestination"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.kinesis_streaming_destination_output_of_yojson
          ~error_deserializer
  end
module ExecuteStatement =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConditionalCheckFailedException") ->
            `ConditionalCheckFailedException
              (Json_deserializers.conditional_check_failed_exception_of_yojson
                 tree path)
        | (_, "DuplicateItemException") ->
            `DuplicateItemException
              (Json_deserializers.duplicate_item_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ItemCollectionSizeLimitExceededException") ->
            `ItemCollectionSizeLimitExceededException
              (Json_deserializers.item_collection_size_limit_exceeded_exception_of_yojson
                 tree path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TransactionConflictException") ->
            `TransactionConflictException
              (Json_deserializers.transaction_conflict_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : execute_statement_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.execute_statement_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ExecuteStatement" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.execute_statement_output_of_yojson
          ~error_deserializer
  end
module ExecuteTransaction =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "IdempotentParameterMismatchException") ->
            `IdempotentParameterMismatchException
              (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TransactionCanceledException") ->
            `TransactionCanceledException
              (Json_deserializers.transaction_canceled_exception_of_yojson
                 tree path)
        | (_, "TransactionInProgressException") ->
            `TransactionInProgressException
              (Json_deserializers.transaction_in_progress_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : execute_transaction_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.execute_transaction_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ExecuteTransaction" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.execute_transaction_output_of_yojson
          ~error_deserializer
  end
module ExportTableToPointInTime =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExportConflictException") ->
            `ExportConflictException
              (Json_deserializers.export_conflict_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidExportTimeException") ->
            `InvalidExportTimeException
              (Json_deserializers.invalid_export_time_exception_of_yojson
                 tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "PointInTimeRecoveryUnavailableException") ->
            `PointInTimeRecoveryUnavailableException
              (Json_deserializers.point_in_time_recovery_unavailable_exception_of_yojson
                 tree path)
        | (_, "TableNotFoundException") ->
            `TableNotFoundException
              (Json_deserializers.table_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : export_table_to_point_in_time_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.export_table_to_point_in_time_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ExportTableToPointInTime" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.export_table_to_point_in_time_output_of_yojson
          ~error_deserializer
  end
module GetItem =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_item_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.get_item_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810GetItem" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_item_output_of_yojson
          ~error_deserializer
  end
module GetResourcePolicy =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "PolicyNotFoundException") ->
            `PolicyNotFoundException
              (Json_deserializers.policy_not_found_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_resource_policy_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_resource_policy_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810GetResourcePolicy" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_resource_policy_output_of_yojson
          ~error_deserializer
  end
module ImportTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ImportConflictException") ->
            `ImportConflictException
              (Json_deserializers.import_conflict_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : import_table_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.import_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ImportTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.import_table_output_of_yojson
          ~error_deserializer
  end
module ListBackups =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_backups_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_backups_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ListBackups" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_backups_output_of_yojson
          ~error_deserializer
  end
module ListContributorInsights =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_contributor_insights_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_contributor_insights_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ListContributorInsights" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_contributor_insights_output_of_yojson
          ~error_deserializer
  end
module ListExports =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_exports_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_exports_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ListExports" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_exports_output_of_yojson
          ~error_deserializer
  end
module ListGlobalTables =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_global_tables_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_global_tables_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ListGlobalTables" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_global_tables_output_of_yojson
          ~error_deserializer
  end
module ListImports =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_imports_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_imports_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ListImports" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_imports_output_of_yojson
          ~error_deserializer
  end
module ListTables =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_tables_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_tables_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ListTables" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_tables_output_of_yojson
          ~error_deserializer
  end
module ListTagsOfResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_tags_of_resource_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_tags_of_resource_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810ListTagsOfResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_tags_of_resource_output_of_yojson
          ~error_deserializer
  end
module PutItem =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConditionalCheckFailedException") ->
            `ConditionalCheckFailedException
              (Json_deserializers.conditional_check_failed_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ItemCollectionSizeLimitExceededException") ->
            `ItemCollectionSizeLimitExceededException
              (Json_deserializers.item_collection_size_limit_exceeded_exception_of_yojson
                 tree path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "ReplicatedWriteConflictException") ->
            `ReplicatedWriteConflictException
              (Json_deserializers.replicated_write_conflict_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TransactionConflictException") ->
            `TransactionConflictException
              (Json_deserializers.transaction_conflict_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_item_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.put_item_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810PutItem" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_item_output_of_yojson
          ~error_deserializer
  end
module PutResourcePolicy =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "PolicyNotFoundException") ->
            `PolicyNotFoundException
              (Json_deserializers.policy_not_found_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_resource_policy_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_resource_policy_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810PutResourcePolicy" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_resource_policy_output_of_yojson
          ~error_deserializer
  end
module Query =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : query_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.query_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810Query" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.query_output_of_yojson
          ~error_deserializer
  end
module RestoreTableFromBackup =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "BackupInUseException") ->
            `BackupInUseException
              (Json_deserializers.backup_in_use_exception_of_yojson tree path)
        | (_, "BackupNotFoundException") ->
            `BackupNotFoundException
              (Json_deserializers.backup_not_found_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "TableAlreadyExistsException") ->
            `TableAlreadyExistsException
              (Json_deserializers.table_already_exists_exception_of_yojson
                 tree path)
        | (_, "TableInUseException") ->
            `TableInUseException
              (Json_deserializers.table_in_use_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : restore_table_from_backup_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.restore_table_from_backup_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810RestoreTableFromBackup" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.restore_table_from_backup_output_of_yojson
          ~error_deserializer
  end
module RestoreTableToPointInTime =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "InvalidRestoreTimeException") ->
            `InvalidRestoreTimeException
              (Json_deserializers.invalid_restore_time_exception_of_yojson
                 tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "PointInTimeRecoveryUnavailableException") ->
            `PointInTimeRecoveryUnavailableException
              (Json_deserializers.point_in_time_recovery_unavailable_exception_of_yojson
                 tree path)
        | (_, "TableAlreadyExistsException") ->
            `TableAlreadyExistsException
              (Json_deserializers.table_already_exists_exception_of_yojson
                 tree path)
        | (_, "TableInUseException") ->
            `TableInUseException
              (Json_deserializers.table_in_use_exception_of_yojson tree path)
        | (_, "TableNotFoundException") ->
            `TableNotFoundException
              (Json_deserializers.table_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : restore_table_to_point_in_time_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.restore_table_to_point_in_time_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810RestoreTableToPointInTime" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.restore_table_to_point_in_time_output_of_yojson
          ~error_deserializer
  end
module Scan =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : scan_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.scan_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810Scan" ~service ~config:context.config
          ~http:context.http ~input
          ~output_deserializer:Json_deserializers.scan_output_of_yojson
          ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : tag_resource_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.tag_resource_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810TagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module TransactGetItems =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TransactionCanceledException") ->
            `TransactionCanceledException
              (Json_deserializers.transaction_canceled_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : transact_get_items_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.transact_get_items_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810TransactGetItems" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.transact_get_items_output_of_yojson
          ~error_deserializer
  end
module TransactWriteItems =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "IdempotentParameterMismatchException") ->
            `IdempotentParameterMismatchException
              (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TransactionCanceledException") ->
            `TransactionCanceledException
              (Json_deserializers.transaction_canceled_exception_of_yojson
                 tree path)
        | (_, "TransactionInProgressException") ->
            `TransactionInProgressException
              (Json_deserializers.transaction_in_progress_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : transact_write_items_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.transact_write_items_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810TransactWriteItems" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.transact_write_items_output_of_yojson
          ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : untag_resource_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.untag_resource_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UntagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module UpdateContinuousBackups =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ContinuousBackupsUnavailableException") ->
            `ContinuousBackupsUnavailableException
              (Json_deserializers.continuous_backups_unavailable_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "TableNotFoundException") ->
            `TableNotFoundException
              (Json_deserializers.table_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_continuous_backups_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_continuous_backups_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateContinuousBackups" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_continuous_backups_output_of_yojson
          ~error_deserializer
  end
module UpdateContributorInsights =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_contributor_insights_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_contributor_insights_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateContributorInsights" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_contributor_insights_output_of_yojson
          ~error_deserializer
  end
module UpdateGlobalTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "GlobalTableNotFoundException") ->
            `GlobalTableNotFoundException
              (Json_deserializers.global_table_not_found_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ReplicaAlreadyExistsException") ->
            `ReplicaAlreadyExistsException
              (Json_deserializers.replica_already_exists_exception_of_yojson
                 tree path)
        | (_, "ReplicaNotFoundException") ->
            `ReplicaNotFoundException
              (Json_deserializers.replica_not_found_exception_of_yojson tree
                 path)
        | (_, "TableNotFoundException") ->
            `TableNotFoundException
              (Json_deserializers.table_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_global_table_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_global_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateGlobalTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_global_table_output_of_yojson
          ~error_deserializer
  end
module UpdateGlobalTableSettings =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "GlobalTableNotFoundException") ->
            `GlobalTableNotFoundException
              (Json_deserializers.global_table_not_found_exception_of_yojson
                 tree path)
        | (_, "IndexNotFoundException") ->
            `IndexNotFoundException
              (Json_deserializers.index_not_found_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ReplicaNotFoundException") ->
            `ReplicaNotFoundException
              (Json_deserializers.replica_not_found_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_global_table_settings_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_global_table_settings_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateGlobalTableSettings" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_global_table_settings_output_of_yojson
          ~error_deserializer
  end
module UpdateItem =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConditionalCheckFailedException") ->
            `ConditionalCheckFailedException
              (Json_deserializers.conditional_check_failed_exception_of_yojson
                 tree path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "ItemCollectionSizeLimitExceededException") ->
            `ItemCollectionSizeLimitExceededException
              (Json_deserializers.item_collection_size_limit_exceeded_exception_of_yojson
                 tree path)
        | (_, "ProvisionedThroughputExceededException") ->
            `ProvisionedThroughputExceededException
              (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson
                 tree path)
        | (_, "ReplicatedWriteConflictException") ->
            `ReplicatedWriteConflictException
              (Json_deserializers.replicated_write_conflict_exception_of_yojson
                 tree path)
        | (_, "RequestLimitExceeded") ->
            `RequestLimitExceeded
              (Json_deserializers.request_limit_exceeded_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TransactionConflictException") ->
            `TransactionConflictException
              (Json_deserializers.transaction_conflict_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_item_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.update_item_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateItem" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_item_output_of_yojson
          ~error_deserializer
  end
module UpdateKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : update_kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_kinesis_streaming_destination_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateKinesisStreamingDestination"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_kinesis_streaming_destination_output_of_yojson
          ~error_deserializer
  end
module UpdateTable =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_table_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.update_table_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateTable" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_table_output_of_yojson
          ~error_deserializer
  end
module UpdateTableReplicaAutoScaling =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_table_replica_auto_scaling_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_table_replica_auto_scaling_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateTableReplicaAutoScaling"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_table_replica_auto_scaling_output_of_yojson
          ~error_deserializer
  end
module UpdateTimeToLive =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "InvalidEndpointException") ->
            `InvalidEndpointException
              (Json_deserializers.invalid_endpoint_exception_of_yojson tree
                 path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_time_to_live_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_time_to_live_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDB_20120810UpdateTimeToLive" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_time_to_live_output_of_yojson
          ~error_deserializer
  end