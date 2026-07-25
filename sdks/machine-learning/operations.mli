open Types

module CreateBatchPrediction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_prediction_input ->
    ( create_batch_prediction_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_prediction_input ->
    ( create_batch_prediction_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates predictions for a group of observations. The observations to process exist in one or \
   more data files referenced by a [DataSource]. This operation creates a new [BatchPrediction], \
   and uses an [MLModel] and the data files referenced by the [DataSource] as information sources. \
   \n\n\
  \  [CreateBatchPrediction] is an asynchronous operation. In response to [CreateBatchPrediction], \
   Amazon Machine Learning (Amazon ML) immediately returns and sets the [BatchPrediction] status \
   to [PENDING]. After the [BatchPrediction] completes, Amazon ML sets the status to [COMPLETED]. \n\
  \ \n\
  \  You can poll for status updates by using the [GetBatchPrediction] operation and checking the \
   [Status] parameter of the result. After the [COMPLETED] status appears, the results are \
   available in the location specified by the [OutputUri] parameter.\n\
  \  "]

module CreateDataSourceFromRDS : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_from_rds_input ->
    ( create_data_source_from_rds_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_from_rds_input ->
    ( create_data_source_from_rds_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [DataSource] object from an {{:http://aws.amazon.com/rds/} Amazon Relational Database \
   Service} (Amazon RDS). A [DataSource] references data that can be used to perform \
   [CreateMLModel], [CreateEvaluation], or [CreateBatchPrediction] operations.\n\n\
  \  [CreateDataSourceFromRDS] is an asynchronous operation. In response to \
   [CreateDataSourceFromRDS], Amazon Machine Learning (Amazon ML) immediately returns and sets the \
   [DataSource] status to [PENDING]. After the [DataSource] is created and ready for use, Amazon \
   ML sets the [Status] parameter to [COMPLETED]. [DataSource] in the [COMPLETED] or [PENDING] \
   state can be used only to perform [>CreateMLModel]>, [CreateEvaluation], or \
   [CreateBatchPrediction] operations. \n\
  \ \n\
  \   If Amazon ML cannot accept the input source, it sets the [Status] parameter to [FAILED] and \
   includes an error message in the [Message] attribute of the [GetDataSource] operation response. \n\
  \  "]

module CreateDataSourceFromRedshift : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_from_redshift_input ->
    ( create_data_source_from_redshift_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_from_redshift_input ->
    ( create_data_source_from_redshift_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [DataSource] from a database hosted on an Amazon Redshift cluster. A [DataSource] \
   references data that can be used to perform either [CreateMLModel], [CreateEvaluation], or \
   [CreateBatchPrediction] operations.\n\n\
  \  [CreateDataSourceFromRedshift] is an asynchronous operation. In response to \
   [CreateDataSourceFromRedshift], Amazon Machine Learning (Amazon ML) immediately returns and \
   sets the [DataSource] status to [PENDING]. After the [DataSource] is created and ready for use, \
   Amazon ML sets the [Status] parameter to [COMPLETED]. [DataSource] in [COMPLETED] or [PENDING] \
   states can be used to perform only [CreateMLModel], [CreateEvaluation], or \
   [CreateBatchPrediction] operations. \n\
  \ \n\
  \   If Amazon ML can't accept the input source, it sets the [Status] parameter to [FAILED] and \
   includes an error message in the [Message] attribute of the [GetDataSource] operation response. \n\
  \  \n\
  \   The observations should be contained in the database hosted on an Amazon Redshift cluster \
   and should be specified by a [SelectSqlQuery] query. Amazon ML executes an [Unload] command in \
   Amazon Redshift to transfer the result set of the [SelectSqlQuery] query to [S3StagingLocation].\n\
  \   \n\
  \    After the [DataSource] has been created, it's ready for use in evaluations and batch \
   predictions. If you plan to use the [DataSource] to train an [MLModel], the [DataSource] also \
   requires a recipe. A recipe describes how each input variable will be used in training an \
   [MLModel]. Will the variable be included or excluded from training? Will the variable be \
   manipulated; for example, will it be combined with another variable or will it be split apart \
   into word combinations? The recipe provides answers to these questions.\n\
  \    \n\
  \     You can't change an existing datasource, but you can copy and modify the settings from an \
   existing Amazon Redshift datasource to create a new datasource. To do so, call [GetDataSource] \
   for an existing datasource and copy the values to a [CreateDataSource] call. Change the \
   settings that you want to change and make sure that all required fields have the appropriate \
   values.\n\
  \     "]

module CreateDataSourceFromS3 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_from_s3_input ->
    ( create_data_source_from_s3_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_from_s3_input ->
    ( create_data_source_from_s3_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a [DataSource] object. A [DataSource] references data that can be used to perform \
   [CreateMLModel], [CreateEvaluation], or [CreateBatchPrediction] operations.\n\n\
  \  [CreateDataSourceFromS3] is an asynchronous operation. In response to \
   [CreateDataSourceFromS3], Amazon Machine Learning (Amazon ML) immediately returns and sets the \
   [DataSource] status to [PENDING]. After the [DataSource] has been created and is ready for use, \
   Amazon ML sets the [Status] parameter to [COMPLETED]. [DataSource] in the [COMPLETED] or \
   [PENDING] state can be used to perform only [CreateMLModel], [CreateEvaluation] or \
   [CreateBatchPrediction] operations. \n\
  \ \n\
  \   If Amazon ML can't accept the input source, it sets the [Status] parameter to [FAILED] and \
   includes an error message in the [Message] attribute of the [GetDataSource] operation response. \n\
  \  \n\
  \   The observation data used in a [DataSource] should be ready to use; that is, it should have \
   a consistent structure, and missing data values should be kept to a minimum. The observation \
   data must reside in one or more .csv files in an Amazon Simple Storage Service (Amazon S3) \
   location, along with a schema that describes the data items by name and type. The same schema \
   must be used for all of the data files referenced by the [DataSource]. \n\
  \   \n\
  \    After the [DataSource] has been created, it's ready to use in evaluations and batch \
   predictions. If you plan to use the [DataSource] to train an [MLModel], the [DataSource] also \
   needs a recipe. A recipe describes how each input variable will be used in training an \
   [MLModel]. Will the variable be included or excluded from training? Will the variable be \
   manipulated; for example, will it be combined with another variable or will it be split apart \
   into word combinations? The recipe provides answers to these questions.\n\
  \    "]

module CreateEvaluation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_evaluation_input ->
    ( create_evaluation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_evaluation_input ->
    ( create_evaluation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new [Evaluation] of an [MLModel]. An [MLModel] is evaluated on a set of observations \
   associated to a [DataSource]. Like a [DataSource] for an [MLModel], the [DataSource] for an \
   [Evaluation] contains values for the [Target Variable]. The [Evaluation] compares the predicted \
   result for each observation to the actual outcome and provides a summary so that you know how \
   effective the [MLModel] functions on the test data. Evaluation generates a relevant performance \
   metric, such as BinaryAUC, RegressionRMSE or MulticlassAvgFScore based on the corresponding \
   [MLModelType]: [BINARY], [REGRESSION] or [MULTICLASS]. \n\n\
  \  [CreateEvaluation] is an asynchronous operation. In response to [CreateEvaluation], Amazon \
   Machine Learning (Amazon ML) immediately returns and sets the evaluation status to [PENDING]. \
   After the [Evaluation] is created and ready for use, Amazon ML sets the status to [COMPLETED]. \n\
  \ \n\
  \  You can use the [GetEvaluation] operation to check progress of the evaluation during the \
   creation operation.\n\
  \  "]

module CreateMLModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ml_model_input ->
    ( create_ml_model_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ml_model_input ->
    ( create_ml_model_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new [MLModel] using the [DataSource] and the recipe as information sources. \n\n\
  \ An [MLModel] is nearly immutable. Users can update only the [MLModelName] and the \
   [ScoreThreshold] in an [MLModel] without creating a new [MLModel]. \n\
  \ \n\
  \   [CreateMLModel] is an asynchronous operation. In response to [CreateMLModel], Amazon Machine \
   Learning (Amazon ML) immediately returns and sets the [MLModel] status to [PENDING]. After the \
   [MLModel] has been created and ready is for use, Amazon ML sets the status to [COMPLETED]. \n\
  \  \n\
  \   You can use the [GetMLModel] operation to check the progress of the [MLModel] during the \
   creation operation.\n\
  \   \n\
  \     [CreateMLModel] requires a [DataSource] with computed statistics, which can be created by \
   setting [ComputeStatistics] to [true] in [CreateDataSourceFromRDS], [CreateDataSourceFromS3], \
   or [CreateDataSourceFromRedshift] operations. \n\
  \    "]

module CreateRealtimeEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_realtime_endpoint_input ->
    ( create_realtime_endpoint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_realtime_endpoint_input ->
    ( create_realtime_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a real-time endpoint for the [MLModel]. The endpoint contains the URI of the [MLModel]; \
   that is, the location to send real-time prediction requests for the specified [MLModel].\n"]

module DeleteBatchPrediction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_batch_prediction_input ->
    ( delete_batch_prediction_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_batch_prediction_input ->
    ( delete_batch_prediction_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns the DELETED status to a [BatchPrediction], rendering it unusable.\n\n\
  \ After using the [DeleteBatchPrediction] operation, you can use the [GetBatchPrediction] \
   operation to verify that the status of the [BatchPrediction] changed to DELETED.\n\
  \ \n\
  \   {b Caution:} The result of the [DeleteBatchPrediction] operation is irreversible.\n\
  \  "]

module DeleteDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_source_input ->
    ( delete_data_source_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_source_input ->
    ( delete_data_source_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns the DELETED status to a [DataSource], rendering it unusable.\n\n\
  \ After using the [DeleteDataSource] operation, you can use the [GetDataSource] operation to \
   verify that the status of the [DataSource] changed to DELETED.\n\
  \ \n\
  \   {b Caution:} The results of the [DeleteDataSource] operation are irreversible.\n\
  \  "]

module DeleteEvaluation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_evaluation_input ->
    ( delete_evaluation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_evaluation_input ->
    ( delete_evaluation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns the [DELETED] status to an [Evaluation], rendering it unusable.\n\n\
  \ After invoking the [DeleteEvaluation] operation, you can use the [GetEvaluation] operation to \
   verify that the status of the [Evaluation] changed to [DELETED].\n\
  \ \n\
  \   {b Caution:} The results of the [DeleteEvaluation] operation are irreversible.\n\
  \  "]

module DeleteMLModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ml_model_input ->
    ( delete_ml_model_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ml_model_input ->
    ( delete_ml_model_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns the [DELETED] status to an [MLModel], rendering it unusable.\n\n\
  \ After using the [DeleteMLModel] operation, you can use the [GetMLModel] operation to verify \
   that the status of the [MLModel] changed to DELETED.\n\
  \ \n\
  \   {b Caution:} The result of the [DeleteMLModel] operation is irreversible.\n\
  \  "]

module DeleteRealtimeEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_realtime_endpoint_input ->
    ( delete_realtime_endpoint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_realtime_endpoint_input ->
    ( delete_realtime_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a real time endpoint of an [MLModel].\n"]

module DeleteTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_input ->
    ( delete_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_input ->
    ( delete_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified tags associated with an ML object. After this operation is complete, you \
   can't recover deleted tags.\n\n\
  \ If you specify a tag that doesn't exist, Amazon ML ignores it.\n\
  \ "]

module DescribeBatchPredictions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_predictions_input ->
    ( describe_batch_predictions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_predictions_input ->
    ( describe_batch_predictions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of [BatchPrediction] operations that match the search criteria in the request.\n"]

module DescribeDataSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_sources_input ->
    ( describe_data_sources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_sources_input ->
    ( describe_data_sources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of [DataSource] that match the search criteria in the request.\n"]

module DescribeEvaluations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_evaluations_input ->
    ( describe_evaluations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_evaluations_input ->
    ( describe_evaluations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of [DescribeEvaluations] that match the search criteria in the request.\n"]

module DescribeMLModels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ml_models_input ->
    ( describe_ml_models_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ml_models_input ->
    ( describe_ml_models_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of [MLModel] that match the search criteria in the request.\n"]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes one or more of the tags for your Amazon ML object.\n"]

module GetBatchPrediction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_batch_prediction_input ->
    ( get_batch_prediction_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_batch_prediction_input ->
    ( get_batch_prediction_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a [BatchPrediction] that includes detailed metadata, status, and data file information \
   for a [Batch Prediction] request.\n"]

module GetDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_source_input ->
    ( get_data_source_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_source_input ->
    ( get_data_source_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a [DataSource] that includes metadata and data file information, as well as the current \
   status of the [DataSource].\n\n\
  \  [GetDataSource] provides results in normal or verbose format. The verbose format adds the \
   schema description and the list of files pointed to by the DataSource to the normal format.\n\
  \ "]

module GetEvaluation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_evaluation_input ->
    ( get_evaluation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_evaluation_input ->
    ( get_evaluation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an [Evaluation] that includes metadata as well as the current status of the [Evaluation].\n"]

module GetMLModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_model_input ->
    ( get_ml_model_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_model_input ->
    ( get_ml_model_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an [MLModel] that includes detailed metadata, data source information, and the current \
   status of the [MLModel].\n\n\
  \  [GetMLModel] provides results in normal or verbose format. \n\
  \ "]

module Predict : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `PredictorNotMountedException of predictor_not_mounted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    predict_input ->
    ( predict_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PredictorNotMountedException of predictor_not_mounted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    predict_input ->
    ( predict_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PredictorNotMountedException of predictor_not_mounted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a prediction for the observation using the specified [ML Model].\n\n\
  \  {b Note:} Not all response parameters will be populated. Whether a response parameter is \
   populated depends on the type of model requested.\n\
  \ "]

module UpdateBatchPrediction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_batch_prediction_input ->
    ( update_batch_prediction_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_batch_prediction_input ->
    ( update_batch_prediction_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the [BatchPredictionName] of a [BatchPrediction].\n\n\
  \ You can use the [GetBatchPrediction] operation to view the contents of the updated data element.\n\
  \ "]

module UpdateDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_data_source_input ->
    ( update_data_source_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_data_source_input ->
    ( update_data_source_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the [DataSourceName] of a [DataSource].\n\n\
  \ You can use the [GetDataSource] operation to view the contents of the updated data element.\n\
  \ "]

module UpdateEvaluation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_evaluation_input ->
    ( update_evaluation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_evaluation_input ->
    ( update_evaluation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the [EvaluationName] of an [Evaluation].\n\n\
  \ You can use the [GetEvaluation] operation to view the contents of the updated data element.\n\
  \ "]

module UpdateMLModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ml_model_input ->
    ( update_ml_model_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ml_model_input ->
    ( update_ml_model_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the [MLModelName] and the [ScoreThreshold] of an [MLModel].\n\n\
  \ You can use the [GetMLModel] operation to view the contents of the updated data element.\n\
  \ "]

module AddTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidTagException of invalid_tag_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagLimitExceededException of tag_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidTagException of invalid_tag_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagLimitExceededException of tag_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to an object, up to a limit of 10. Each tag consists of a key and an \
   optional value. If you add a tag using a key that is already associated with the ML object, \
   [AddTags] updates the tag's value.\n"]
