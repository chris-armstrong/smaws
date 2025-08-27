open Types
open Service_metadata
module BatchExecuteStatement =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_execute_statement_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_execute_statement_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810BatchExecuteStatement" ~service
            ~config:context.config ~input
            ~output_deserializer:batch_execute_statement_output_of_yojson
            ~error_deserializer
  end
module BatchGetItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_get_item_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.batch_get_item_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810BatchGetItem"
            ~service ~config:context.config ~input
            ~output_deserializer:batch_get_item_output_of_yojson
            ~error_deserializer
  end
module BatchWriteItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ItemCollectionSizeLimitExceededException") ->
              `ItemCollectionSizeLimitExceededException
                (item_collection_size_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ReplicatedWriteConflictException") ->
              `ReplicatedWriteConflictException
                (replicated_write_conflict_exception_of_yojson tree path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_write_item_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.batch_write_item_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810BatchWriteItem"
            ~service ~config:context.config ~input
            ~output_deserializer:batch_write_item_output_of_yojson
            ~error_deserializer
  end
module CreateBackup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BackupInUseException") ->
              `BackupInUseException
                (backup_in_use_exception_of_yojson tree path)
          | (_, "ContinuousBackupsUnavailableException") ->
              `ContinuousBackupsUnavailableException
                (continuous_backups_unavailable_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "TableInUseException") ->
              `TableInUseException
                (table_in_use_exception_of_yojson tree path)
          | (_, "TableNotFoundException") ->
              `TableNotFoundException
                (table_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_backup_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_backup_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810CreateBackup"
            ~service ~config:context.config ~input
            ~output_deserializer:create_backup_output_of_yojson
            ~error_deserializer
  end
module CreateGlobalTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "GlobalTableAlreadyExistsException") ->
              `GlobalTableAlreadyExistsException
                (global_table_already_exists_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "TableNotFoundException") ->
              `TableNotFoundException
                (table_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_global_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_global_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810CreateGlobalTable" ~service
            ~config:context.config ~input
            ~output_deserializer:create_global_table_output_of_yojson
            ~error_deserializer
  end
module CreateTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810CreateTable"
            ~service ~config:context.config ~input
            ~output_deserializer:create_table_output_of_yojson
            ~error_deserializer
  end
module DeleteBackup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BackupInUseException") ->
              `BackupInUseException
                (backup_in_use_exception_of_yojson tree path)
          | (_, "BackupNotFoundException") ->
              `BackupNotFoundException
                (backup_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_backup_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_backup_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DeleteBackup"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_backup_output_of_yojson
            ~error_deserializer
  end
module DeleteItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConditionalCheckFailedException") ->
              `ConditionalCheckFailedException
                (conditional_check_failed_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ItemCollectionSizeLimitExceededException") ->
              `ItemCollectionSizeLimitExceededException
                (item_collection_size_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ReplicatedWriteConflictException") ->
              `ReplicatedWriteConflictException
                (replicated_write_conflict_exception_of_yojson tree path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TransactionConflictException") ->
              `TransactionConflictException
                (transaction_conflict_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_item_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_item_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DeleteItem"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_item_output_of_yojson
            ~error_deserializer
  end
module DeleteResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "PolicyNotFoundException") ->
              `PolicyNotFoundException
                (policy_not_found_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_policy_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_resource_policy_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DeleteResourcePolicy" ~service
            ~config:context.config ~input
            ~output_deserializer:delete_resource_policy_output_of_yojson
            ~error_deserializer
  end
module DeleteTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DeleteTable"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_table_output_of_yojson
            ~error_deserializer
  end
module DescribeBackup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BackupNotFoundException") ->
              `BackupNotFoundException
                (backup_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_backup_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_backup_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DescribeBackup"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_backup_output_of_yojson
            ~error_deserializer
  end
module DescribeContinuousBackups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "TableNotFoundException") ->
              `TableNotFoundException
                (table_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_continuous_backups_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_continuous_backups_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeContinuousBackups" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_continuous_backups_output_of_yojson
            ~error_deserializer
  end
module DescribeContributorInsights =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_contributor_insights_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_contributor_insights_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeContributorInsights"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_contributor_insights_output_of_yojson
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
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_endpoints_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeEndpoints" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_endpoints_response_of_yojson
            ~error_deserializer
  end
module DescribeExport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExportNotFoundException") ->
              `ExportNotFoundException
                (export_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_export_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_export_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DescribeExport"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_export_output_of_yojson
            ~error_deserializer
  end
module DescribeGlobalTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "GlobalTableNotFoundException") ->
              `GlobalTableNotFoundException
                (global_table_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_global_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_global_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeGlobalTable" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_global_table_output_of_yojson
            ~error_deserializer
  end
module DescribeGlobalTableSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "GlobalTableNotFoundException") ->
              `GlobalTableNotFoundException
                (global_table_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_global_table_settings_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_global_table_settings_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeGlobalTableSettings"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_global_table_settings_output_of_yojson
            ~error_deserializer
  end
module DescribeImport =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ImportNotFoundException") ->
              `ImportNotFoundException
                (import_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_import_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_import_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DescribeImport"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_import_output_of_yojson
            ~error_deserializer
  end
module DescribeKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_kinesis_streaming_destination_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeKinesisStreamingDestination"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_kinesis_streaming_destination_output_of_yojson
            ~error_deserializer
  end
module DescribeLimits =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_limits_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DescribeLimits"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_limits_output_of_yojson
            ~error_deserializer
  end
module DescribeTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810DescribeTable"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_table_output_of_yojson
            ~error_deserializer
  end
module DescribeTableReplicaAutoScaling =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_table_replica_auto_scaling_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_table_replica_auto_scaling_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeTableReplicaAutoScaling"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_table_replica_auto_scaling_output_of_yojson
            ~error_deserializer
  end
module DescribeTimeToLive =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_time_to_live_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_time_to_live_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DescribeTimeToLive" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_time_to_live_output_of_yojson
            ~error_deserializer
  end
module DisableKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.kinesis_streaming_destination_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810DisableKinesisStreamingDestination"
            ~service ~config:context.config ~input
            ~output_deserializer:kinesis_streaming_destination_output_of_yojson
            ~error_deserializer
  end
module EnableKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.kinesis_streaming_destination_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810EnableKinesisStreamingDestination"
            ~service ~config:context.config ~input
            ~output_deserializer:kinesis_streaming_destination_output_of_yojson
            ~error_deserializer
  end
module ExecuteStatement =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConditionalCheckFailedException") ->
              `ConditionalCheckFailedException
                (conditional_check_failed_exception_of_yojson tree path)
          | (_, "DuplicateItemException") ->
              `DuplicateItemException
                (duplicate_item_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ItemCollectionSizeLimitExceededException") ->
              `ItemCollectionSizeLimitExceededException
                (item_collection_size_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TransactionConflictException") ->
              `TransactionConflictException
                (transaction_conflict_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : execute_statement_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.execute_statement_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810ExecuteStatement" ~service
            ~config:context.config ~input
            ~output_deserializer:execute_statement_output_of_yojson
            ~error_deserializer
  end
module ExecuteTransaction =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "IdempotentParameterMismatchException") ->
              `IdempotentParameterMismatchException
                (idempotent_parameter_mismatch_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TransactionCanceledException") ->
              `TransactionCanceledException
                (transaction_canceled_exception_of_yojson tree path)
          | (_, "TransactionInProgressException") ->
              `TransactionInProgressException
                (transaction_in_progress_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : execute_transaction_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.execute_transaction_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810ExecuteTransaction" ~service
            ~config:context.config ~input
            ~output_deserializer:execute_transaction_output_of_yojson
            ~error_deserializer
  end
module ExportTableToPointInTime =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExportConflictException") ->
              `ExportConflictException
                (export_conflict_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidExportTimeException") ->
              `InvalidExportTimeException
                (invalid_export_time_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "PointInTimeRecoveryUnavailableException") ->
              `PointInTimeRecoveryUnavailableException
                (point_in_time_recovery_unavailable_exception_of_yojson tree
                   path)
          | (_, "TableNotFoundException") ->
              `TableNotFoundException
                (table_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : export_table_to_point_in_time_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.export_table_to_point_in_time_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810ExportTableToPointInTime" ~service
            ~config:context.config ~input
            ~output_deserializer:export_table_to_point_in_time_output_of_yojson
            ~error_deserializer
  end
module GetItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_item_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_item_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810GetItem"
            ~service ~config:context.config ~input
            ~output_deserializer:get_item_output_of_yojson
            ~error_deserializer
  end
module GetResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "PolicyNotFoundException") ->
              `PolicyNotFoundException
                (policy_not_found_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_policy_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_resource_policy_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810GetResourcePolicy" ~service
            ~config:context.config ~input
            ~output_deserializer:get_resource_policy_output_of_yojson
            ~error_deserializer
  end
module ImportTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ImportConflictException") ->
              `ImportConflictException
                (import_conflict_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : import_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.import_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810ImportTable"
            ~service ~config:context.config ~input
            ~output_deserializer:import_table_output_of_yojson
            ~error_deserializer
  end
module ListBackups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_backups_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_backups_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810ListBackups"
            ~service ~config:context.config ~input
            ~output_deserializer:list_backups_output_of_yojson
            ~error_deserializer
  end
module ListContributorInsights =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_contributor_insights_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_contributor_insights_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810ListContributorInsights" ~service
            ~config:context.config ~input
            ~output_deserializer:list_contributor_insights_output_of_yojson
            ~error_deserializer
  end
module ListExports =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_exports_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_exports_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810ListExports"
            ~service ~config:context.config ~input
            ~output_deserializer:list_exports_output_of_yojson
            ~error_deserializer
  end
module ListGlobalTables =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_global_tables_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_global_tables_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810ListGlobalTables" ~service
            ~config:context.config ~input
            ~output_deserializer:list_global_tables_output_of_yojson
            ~error_deserializer
  end
module ListImports =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_imports_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_imports_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810ListImports"
            ~service ~config:context.config ~input
            ~output_deserializer:list_imports_output_of_yojson
            ~error_deserializer
  end
module ListTables =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tables_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_tables_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810ListTables"
            ~service ~config:context.config ~input
            ~output_deserializer:list_tables_output_of_yojson
            ~error_deserializer
  end
module ListTagsOfResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_of_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_of_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810ListTagsOfResource" ~service
            ~config:context.config ~input
            ~output_deserializer:list_tags_of_resource_output_of_yojson
            ~error_deserializer
  end
module PutItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConditionalCheckFailedException") ->
              `ConditionalCheckFailedException
                (conditional_check_failed_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ItemCollectionSizeLimitExceededException") ->
              `ItemCollectionSizeLimitExceededException
                (item_collection_size_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ReplicatedWriteConflictException") ->
              `ReplicatedWriteConflictException
                (replicated_write_conflict_exception_of_yojson tree path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TransactionConflictException") ->
              `TransactionConflictException
                (transaction_conflict_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_item_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_item_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810PutItem"
            ~service ~config:context.config ~input
            ~output_deserializer:put_item_output_of_yojson
            ~error_deserializer
  end
module PutResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "PolicyNotFoundException") ->
              `PolicyNotFoundException
                (policy_not_found_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_resource_policy_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_resource_policy_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810PutResourcePolicy" ~service
            ~config:context.config ~input
            ~output_deserializer:put_resource_policy_output_of_yojson
            ~error_deserializer
  end
module Query =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : query_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.query_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810Query" ~service
            ~config:context.config ~input
            ~output_deserializer:query_output_of_yojson ~error_deserializer
  end
module RestoreTableFromBackup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BackupInUseException") ->
              `BackupInUseException
                (backup_in_use_exception_of_yojson tree path)
          | (_, "BackupNotFoundException") ->
              `BackupNotFoundException
                (backup_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "TableAlreadyExistsException") ->
              `TableAlreadyExistsException
                (table_already_exists_exception_of_yojson tree path)
          | (_, "TableInUseException") ->
              `TableInUseException
                (table_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : restore_table_from_backup_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.restore_table_from_backup_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810RestoreTableFromBackup" ~service
            ~config:context.config ~input
            ~output_deserializer:restore_table_from_backup_output_of_yojson
            ~error_deserializer
  end
module RestoreTableToPointInTime =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "InvalidRestoreTimeException") ->
              `InvalidRestoreTimeException
                (invalid_restore_time_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "PointInTimeRecoveryUnavailableException") ->
              `PointInTimeRecoveryUnavailableException
                (point_in_time_recovery_unavailable_exception_of_yojson tree
                   path)
          | (_, "TableAlreadyExistsException") ->
              `TableAlreadyExistsException
                (table_already_exists_exception_of_yojson tree path)
          | (_, "TableInUseException") ->
              `TableInUseException
                (table_in_use_exception_of_yojson tree path)
          | (_, "TableNotFoundException") ->
              `TableNotFoundException
                (table_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : restore_table_to_point_in_time_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.restore_table_to_point_in_time_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810RestoreTableToPointInTime" ~service
            ~config:context.config ~input
            ~output_deserializer:restore_table_to_point_in_time_output_of_yojson
            ~error_deserializer
  end
module Scan =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : scan_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.scan_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810Scan" ~service
            ~config:context.config ~input
            ~output_deserializer:scan_output_of_yojson ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810TagResource"
            ~service ~config:context.config ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module TransactGetItems =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TransactionCanceledException") ->
              `TransactionCanceledException
                (transaction_canceled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : transact_get_items_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.transact_get_items_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810TransactGetItems" ~service
            ~config:context.config ~input
            ~output_deserializer:transact_get_items_output_of_yojson
            ~error_deserializer
  end
module TransactWriteItems =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "IdempotentParameterMismatchException") ->
              `IdempotentParameterMismatchException
                (idempotent_parameter_mismatch_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TransactionCanceledException") ->
              `TransactionCanceledException
                (transaction_canceled_exception_of_yojson tree path)
          | (_, "TransactionInProgressException") ->
              `TransactionInProgressException
                (transaction_in_progress_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : transact_write_items_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.transact_write_items_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810TransactWriteItems" ~service
            ~config:context.config ~input
            ~output_deserializer:transact_write_items_output_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810UntagResource"
            ~service ~config:context.config ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateContinuousBackups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ContinuousBackupsUnavailableException") ->
              `ContinuousBackupsUnavailableException
                (continuous_backups_unavailable_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "TableNotFoundException") ->
              `TableNotFoundException
                (table_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_continuous_backups_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_continuous_backups_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810UpdateContinuousBackups" ~service
            ~config:context.config ~input
            ~output_deserializer:update_continuous_backups_output_of_yojson
            ~error_deserializer
  end
module UpdateContributorInsights =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_contributor_insights_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_contributor_insights_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810UpdateContributorInsights" ~service
            ~config:context.config ~input
            ~output_deserializer:update_contributor_insights_output_of_yojson
            ~error_deserializer
  end
module UpdateGlobalTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "GlobalTableNotFoundException") ->
              `GlobalTableNotFoundException
                (global_table_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ReplicaAlreadyExistsException") ->
              `ReplicaAlreadyExistsException
                (replica_already_exists_exception_of_yojson tree path)
          | (_, "ReplicaNotFoundException") ->
              `ReplicaNotFoundException
                (replica_not_found_exception_of_yojson tree path)
          | (_, "TableNotFoundException") ->
              `TableNotFoundException
                (table_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_global_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_global_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810UpdateGlobalTable" ~service
            ~config:context.config ~input
            ~output_deserializer:update_global_table_output_of_yojson
            ~error_deserializer
  end
module UpdateGlobalTableSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "GlobalTableNotFoundException") ->
              `GlobalTableNotFoundException
                (global_table_not_found_exception_of_yojson tree path)
          | (_, "IndexNotFoundException") ->
              `IndexNotFoundException
                (index_not_found_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ReplicaNotFoundException") ->
              `ReplicaNotFoundException
                (replica_not_found_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_global_table_settings_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_global_table_settings_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810UpdateGlobalTableSettings" ~service
            ~config:context.config ~input
            ~output_deserializer:update_global_table_settings_output_of_yojson
            ~error_deserializer
  end
module UpdateItem =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConditionalCheckFailedException") ->
              `ConditionalCheckFailedException
                (conditional_check_failed_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "ItemCollectionSizeLimitExceededException") ->
              `ItemCollectionSizeLimitExceededException
                (item_collection_size_limit_exceeded_exception_of_yojson tree
                   path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ReplicatedWriteConflictException") ->
              `ReplicatedWriteConflictException
                (replicated_write_conflict_exception_of_yojson tree path)
          | (_, "RequestLimitExceeded") ->
              `RequestLimitExceeded
                (request_limit_exceeded_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TransactionConflictException") ->
              `TransactionConflictException
                (transaction_conflict_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_item_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_item_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810UpdateItem"
            ~service ~config:context.config ~input
            ~output_deserializer:update_item_output_of_yojson
            ~error_deserializer
  end
module UpdateKinesisStreamingDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : update_kinesis_streaming_destination_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_kinesis_streaming_destination_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810UpdateKinesisStreamingDestination"
            ~service ~config:context.config ~input
            ~output_deserializer:update_kinesis_streaming_destination_output_of_yojson
            ~error_deserializer
  end
module UpdateTable =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_table_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_table_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"DynamoDB_20120810UpdateTable"
            ~service ~config:context.config ~input
            ~output_deserializer:update_table_output_of_yojson
            ~error_deserializer
  end
module UpdateTableReplicaAutoScaling =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_table_replica_auto_scaling_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_table_replica_auto_scaling_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810UpdateTableReplicaAutoScaling"
            ~service ~config:context.config ~input
            ~output_deserializer:update_table_replica_auto_scaling_output_of_yojson
            ~error_deserializer
  end
module UpdateTimeToLive =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "InvalidEndpointException") ->
              `InvalidEndpointException
                (invalid_endpoint_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_time_to_live_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_time_to_live_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDB_20120810UpdateTimeToLive" ~service
            ~config:context.config ~input
            ~output_deserializer:update_time_to_live_output_of_yojson
            ~error_deserializer
  end