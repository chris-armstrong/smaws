type nonrec error_message = string [@@ocaml.doc ""]

type nonrec tag_limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec error_code = int [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : error_message option; [@ocaml.doc ""]
  code : error_code option; [@ocaml.doc ""]
}
[@@ocaml.doc "A specified resource cannot be located.\n"]

type nonrec invalid_tag_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec invalid_input_exception = {
  message : error_message option; [@ocaml.doc ""]
  code : error_code option; [@ocaml.doc ""]
}
[@@ocaml.doc "An error on the client occurred. Typically, the cause is an invalid input value.\n"]

type nonrec internal_server_exception = {
  message : error_message option; [@ocaml.doc ""]
  code : error_code option; [@ocaml.doc ""]
}
[@@ocaml.doc "An error on the server occurred when trying to process a request.\n"]

type nonrec taggable_resource_type =
  | BATCH_PREDICTION [@ocaml.doc ""]
  | DATASOURCE [@ocaml.doc ""]
  | EVALUATION [@ocaml.doc ""]
  | ML_MODEL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entity_id = string [@@ocaml.doc ""]

type nonrec add_tags_output = {
  resource_id : entity_id option; [@ocaml.doc "The ID of the ML object that was tagged.\n"]
  resource_type : taggable_resource_type option;
      [@ocaml.doc "The type of the ML object that was tagged.\n"]
}
[@@ocaml.doc "Amazon ML returns the following elements.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key option;
      [@ocaml.doc
        "A unique identifier for the tag. Valid characters include Unicode letters, digits, white \
         space, _, ., /, =, +, -, %, and \\@.\n"]
  value : tag_value option;
      [@ocaml.doc
        "An optional string, typically used to describe or define the tag. Valid characters \
         include Unicode letters, digits, white space, _, ., /, =, +, -, %, and \\@.\n"]
}
[@@ocaml.doc "A custom key-value pair associated with an ML object, such as an ML model.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec add_tags_input = {
  tags : tag_list;
      [@ocaml.doc
        "The key-value pairs to use to create tags. If you specify a key without specifying a \
         value, Amazon ML creates a tag with the specified key and a value of null.\n"]
  resource_id : entity_id;
      [@ocaml.doc "The ID of the ML object to tag. For example, [exampleModelId].\n"]
  resource_type : taggable_resource_type; [@ocaml.doc "The type of the ML object to tag.\n"]
}
[@@ocaml.doc ""]

type nonrec algorithm = SGD [@ocaml.doc ""]
[@@ocaml.doc
  "The function used to train an [MLModel]. Training choices supported by Amazon ML include the \
   following:\n\n\
  \ {ul\n\
  \       {-   [SGD] - Stochastic Gradient Descent.\n\
  \           \n\
  \            }\n\
  \       {-   [RandomForest] - Random forest of decision trees.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec update_ml_model_output = {
  ml_model_id : entity_id option;
      [@ocaml.doc
        "The ID assigned to the [MLModel] during creation. This value should be identical to the \
         value of the [MLModelID] in the request.\n"]
}
[@@ocaml.doc
  "Represents the output of an [UpdateMLModel] operation.\n\n\
  \ You can see the updated content by using the [GetMLModel] operation.\n\
  \ "]

type nonrec score_threshold = float [@@ocaml.doc ""]

type nonrec entity_name = string [@@ocaml.doc ""]

type nonrec update_ml_model_input = {
  ml_model_id : entity_id; [@ocaml.doc "The ID assigned to the [MLModel] during creation.\n"]
  ml_model_name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [MLModel].\n"]
  score_threshold : score_threshold option;
      [@ocaml.doc
        "The [ScoreThreshold] used in binary classification [MLModel] that marks the boundary \
         between a positive prediction and a negative prediction.\n\n\
        \ Output values greater than or equal to the [ScoreThreshold] receive a positive result \
         from the [MLModel], such as [true]. Output values less than the [ScoreThreshold] receive \
         a negative response from the [MLModel], such as [false].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_evaluation_output = {
  evaluation_id : entity_id option;
      [@ocaml.doc
        "The ID assigned to the [Evaluation] during creation. This value should be identical to \
         the value of the [Evaluation] in the request.\n"]
}
[@@ocaml.doc
  "Represents the output of an [UpdateEvaluation] operation.\n\n\
  \ You can see the updated content by using the [GetEvaluation] operation.\n\
  \ "]

type nonrec update_evaluation_input = {
  evaluation_id : entity_id; [@ocaml.doc "The ID assigned to the [Evaluation] during creation.\n"]
  evaluation_name : entity_name;
      [@ocaml.doc
        "A new user-supplied name or description of the [Evaluation] that will replace the current \
         content. \n"]
}
[@@ocaml.doc ""]

type nonrec update_data_source_output = {
  data_source_id : entity_id option;
      [@ocaml.doc
        "The ID assigned to the [DataSource] during creation. This value should be identical to \
         the value of the [DataSourceID] in the request.\n"]
}
[@@ocaml.doc
  "Represents the output of an [UpdateDataSource] operation.\n\n\
  \ You can see the updated content by using the [GetBatchPrediction] operation.\n\
  \ "]

type nonrec update_data_source_input = {
  data_source_id : entity_id; [@ocaml.doc "The ID assigned to the [DataSource] during creation.\n"]
  data_source_name : entity_name;
      [@ocaml.doc
        "A new user-supplied name or description of the [DataSource] that will replace the current \
         description. \n"]
}
[@@ocaml.doc ""]

type nonrec update_batch_prediction_output = {
  batch_prediction_id : entity_id option;
      [@ocaml.doc
        "The ID assigned to the [BatchPrediction] during creation. This value should be identical \
         to the value of the [BatchPredictionId] in the request.\n"]
}
[@@ocaml.doc
  "Represents the output of an [UpdateBatchPrediction] operation.\n\n\
  \ You can see the updated content by using the [GetBatchPrediction] operation.\n\
  \ "]

type nonrec update_batch_prediction_input = {
  batch_prediction_id : entity_id;
      [@ocaml.doc "The ID assigned to the [BatchPrediction] during creation.\n"]
  batch_prediction_name : entity_name;
      [@ocaml.doc "A new user-supplied name or description of the [BatchPrediction].\n"]
}
[@@ocaml.doc ""]

type nonrec predictor_not_mounted_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The exception is thrown when a predict request is made to an unmounted [MLModel].\n"]

type nonrec limit_exceeded_exception = {
  message : error_message option; [@ocaml.doc ""]
  code : error_code option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The subscriber exceeded the maximum number of operations. This exception can occur when listing \
   objects such as [DataSource].\n"]

type nonrec details_value = string [@@ocaml.doc ""]

type nonrec details_attributes = PREDICTIVE_MODEL_TYPE [@ocaml.doc ""] | ALGORITHM [@ocaml.doc ""]
[@@ocaml.doc
  "Contains the key values of [DetailsMap]:\n\n\
  \ {ul\n\
  \       {-   [PredictiveModelType] - Indicates the type of the [MLModel].\n\
  \           \n\
  \            }\n\
  \       {-   [Algorithm] - Indicates the algorithm that was used for the [MLModel].\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec details_map = (details_attributes * details_value) list
[@@ocaml.doc "Provides any additional details regarding the prediction.\n"]

type nonrec score_value = float [@@ocaml.doc ""]

type nonrec label = string [@@ocaml.doc ""]

type nonrec score_value_per_label_map = (label * score_value) list
[@@ocaml.doc "Provides the raw classification score corresponding to each label.\n"]

type nonrec float_label = float [@@ocaml.doc ""]

type nonrec prediction = {
  predicted_label : label option;
      [@ocaml.doc "The prediction label for either a [BINARY] or [MULTICLASS] [MLModel].\n"]
  predicted_value : float_label option;
      [@ocaml.doc "The prediction value for [REGRESSION] [MLModel].\n"]
  predicted_scores : score_value_per_label_map option; [@ocaml.doc ""]
  details : details_map option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The output from a [Predict] operation: \n\n\
  \ {ul\n\
  \       {-   [Details] - Contains the following attributes: \
   [DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY | MULTICLASS] \
   [DetailsAttributes.ALGORITHM - SGD] \n\
  \           \n\
  \            }\n\
  \       {-   [PredictedLabel] - Present for either a [BINARY] or [MULTICLASS] [MLModel] request. \n\
  \           \n\
  \            }\n\
  \       {-   [PredictedScores] - Contains the raw classification score corresponding to each \
   label. \n\
  \           \n\
  \            }\n\
  \       {-   [PredictedValue] - Present for a [REGRESSION] [MLModel] request. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec predict_output = { prediction : prediction option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec vip_ur_l = string [@@ocaml.doc ""]

type nonrec variable_value = string [@@ocaml.doc ""]

type nonrec variable_name = string [@@ocaml.doc ""]

type nonrec record = (variable_name * variable_value) list
[@@ocaml.doc "A map of variable name-value pairs that represent an observation.\n"]

type nonrec predict_input = {
  ml_model_id : entity_id; [@ocaml.doc "A unique identifier of the [MLModel].\n"]
  record : record; [@ocaml.doc ""]
  predict_endpoint : vip_ur_l; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec data_schema = string [@@ocaml.doc ""]

type nonrec recipe = string [@@ocaml.doc ""]

type nonrec epoch_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec long_type = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec presigned_s3_url = string [@@ocaml.doc ""]

type nonrec ml_model_type =
  | REGRESSION [@ocaml.doc ""]
  | BINARY [@ocaml.doc ""]
  | MULTICLASS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_url = string [@@ocaml.doc ""]

type nonrec string_type = string [@@ocaml.doc ""]

type nonrec training_parameters = (string_type * string_type) list [@@ocaml.doc ""]

type nonrec realtime_endpoint_status =
  | NONE [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer_type = int [@@ocaml.doc ""]

type nonrec realtime_endpoint_info = {
  peak_requests_per_second : integer_type option;
      [@ocaml.doc
        " The maximum processing rate for the real-time endpoint for [MLModel], measured in \
         incoming requests per second.\n"]
  created_at : epoch_time option;
      [@ocaml.doc
        "The time that the request to create the real-time endpoint for the [MLModel] was \
         received. The time is expressed in epoch time.\n"]
  endpoint_url : vip_ur_l option;
      [@ocaml.doc
        "The URI that specifies where to send real-time prediction requests for the [MLModel].\n\n\
        \  {b Note:} The application must wait until the real-time endpoint is ready before using \
         this URI.\n\
        \ "]
  endpoint_status : realtime_endpoint_status option;
      [@ocaml.doc
        " The current status of the real-time endpoint for the [MLModel]. This element can have \
         one of the following values: \n\n\
        \ {ul\n\
        \       {-   [NONE] - Endpoint does not exist or was previously deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [READY] - Endpoint is ready to be used for real-time predictions.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] - Updating/creating the endpoint. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc " Describes the real-time endpoint information for an [MLModel].\n"]

type nonrec entity_status =
  | PENDING [@ocaml.doc ""]
  | INPROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc
  "Object status with the following possible values:\n\n\
  \ {ul\n\
  \       {-   [PENDING] \n\
  \           \n\
  \            }\n\
  \       {-   [INPROGRESS] \n\
  \           \n\
  \            }\n\
  \       {-   [FAILED] \n\
  \           \n\
  \            }\n\
  \       {-   [COMPLETED] \n\
  \           \n\
  \            }\n\
  \       {-   [DELETED] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec ml_model_name = string [@@ocaml.doc ""]

type nonrec aws_user_arn = string [@@ocaml.doc ""]

type nonrec get_ml_model_output = {
  ml_model_id : entity_id option;
      [@ocaml.doc "The MLModel ID, which is same as the [MLModelId] in the request.\n"]
  training_data_source_id : entity_id option; [@ocaml.doc "The ID of the training [DataSource].\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account from which the [MLModel] was created. The account type can be either \
         an AWS root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc "The time that the [MLModel] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [MLModel]. The time is expressed in epoch time.\n"]
  name : ml_model_name option;
      [@ocaml.doc "A user-supplied name or description of the [MLModel].\n"]
  status : entity_status option;
      [@ocaml.doc
        "The current status of the [MLModel]. This element can have one of the following values:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon Machine Learning (Amazon ML) submitted a request to \
         describe a [MLModel].\n\
        \           \n\
        \            }\n\
        \       {-   [INPROGRESS] - The request is processing.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The request did not run to completion. The ML model isn't usable.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The request completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The [MLModel] is marked as deleted. It isn't usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  size_in_bytes : long_type option; [@ocaml.doc ""]
  endpoint_info : realtime_endpoint_info option;
      [@ocaml.doc "The current endpoint of the [MLModel] \n"]
  training_parameters : training_parameters option;
      [@ocaml.doc
        "A list of the training parameters in the [MLModel]. The list is implemented as a map of \
         key-value pairs.\n\n\
        \ The following is the current set of training parameters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [sgd.maxMLModelSizeInBytes] - The maximum allowed size of the model. \
         Depending on the input data, the size of the model might affect its performance.\n\
        \            \n\
        \              The value is an integer that ranges from [100000] to [2147483648]. The \
         default value is [33554432].\n\
        \             \n\
        \              }\n\
        \        {-   [sgd.maxPasses] - The number of times that the training process traverses \
         the observations to build the [MLModel]. The value is an integer that ranges from [1] to \
         [10000]. The default value is [10].\n\
        \            \n\
        \             }\n\
        \        {-   [sgd.shuffleType] - Whether Amazon ML shuffles the training data. Shuffling \
         data improves a model's ability to find the optimal solution for a variety of data types. \
         The valid values are [auto] and [none]. The default value is [none]. We strongly \
         recommend that you shuffle your data.\n\
        \            \n\
        \             }\n\
        \        {-   [sgd.l1RegularizationAmount] - The coefficient regularization L1 norm. It \
         controls overfitting the data by penalizing large coefficients. This tends to drive \
         coefficients to zero, resulting in a sparse feature set. If you use this parameter, start \
         by specifying a small value, such as [1.0E-08].\n\
        \            \n\
        \             The value is a double that ranges from [0] to [MAX_DOUBLE]. The default is \
         to not use L1 normalization. This parameter can't be used when [L2] is specified. Use \
         this parameter sparingly.\n\
        \             \n\
        \              }\n\
        \        {-   [sgd.l2RegularizationAmount] - The coefficient regularization L2 norm. It \
         controls overfitting the data by penalizing large coefficients. This tends to drive \
         coefficients to small, nonzero values. If you use this parameter, start by specifying a \
         small value, such as [1.0E-08].\n\
        \            \n\
        \             The value is a double that ranges from [0] to [MAX_DOUBLE]. The default is \
         to not use L2 normalization. This parameter can't be used when [L1] is specified. Use \
         this parameter sparingly.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  input_data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).\n"]
  ml_model_type : ml_model_type option;
      [@ocaml.doc
        "Identifies the [MLModel] category. The following are the available types: \n\n\
        \ {ul\n\
        \       {-  REGRESSION -- Produces a numeric result. For example, \"What price should a \
         house be listed at?\"\n\
        \           \n\
        \            }\n\
        \       {-  BINARY -- Produces one of two possible results. For example, \"Is this an \
         e-commerce website?\"\n\
        \           \n\
        \            }\n\
        \       {-  MULTICLASS -- Produces one of several possible results. For example, \"Is this \
         a HIGH, LOW or MEDIUM risk trade?\"\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  score_threshold : score_threshold option;
      [@ocaml.doc
        "The scoring threshold is used in binary classification [MLModel] models. It marks the \
         boundary between a positive prediction and a negative prediction.\n\n\
        \ Output values greater than or equal to the threshold receive a positive result from the \
         MLModel, such as [true]. Output values less than the threshold receive a negative \
         response from the MLModel, such as [false].\n\
        \ "]
  score_threshold_last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [ScoreThreshold]. The time is expressed in epoch \
         time.\n"]
  log_uri : presigned_s3_url option;
      [@ocaml.doc "A link to the file that contains logs of the [CreateMLModel] operation.\n"]
  message : message option;
      [@ocaml.doc "A description of the most recent details about accessing the [MLModel].\n"]
  compute_time : long_type option;
      [@ocaml.doc
        "The approximate CPU time in milliseconds that Amazon Machine Learning spent processing \
         the [MLModel], normalized and scaled on computation resources. [ComputeTime] is only \
         available if the [MLModel] is in the [COMPLETED] state.\n"]
  finished_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [MLModel] as [COMPLETED] or \
         [FAILED]. [FinishedAt] is only available when the [MLModel] is in the [COMPLETED] or \
         [FAILED] state.\n"]
  started_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [MLModel] as [INPROGRESS]. \
         [StartedAt] isn't available if the [MLModel] is in the [PENDING] state.\n"]
  recipe : recipe option;
      [@ocaml.doc
        "The recipe to use when training the [MLModel]. The [Recipe] provides detailed information \
         about the observation data to use during training, and manipulations to perform on the \
         observation data during training.\n\n\
        \  {b Note:} This parameter is provided as part of the verbose format.\n\
        \ "]
  schema : data_schema option;
      [@ocaml.doc
        "The schema used by all of the data files referenced by the [DataSource].\n\n\
        \  {b Note:} This parameter is provided as part of the verbose format.\n\
        \ "]
}
[@@ocaml.doc
  "Represents the output of a [GetMLModel] operation, and provides detailed information about a \
   [MLModel].\n"]

type nonrec verbose = bool [@@ocaml.doc ""]

type nonrec get_ml_model_input = {
  ml_model_id : entity_id; [@ocaml.doc "The ID assigned to the [MLModel] at creation.\n"]
  verbose : verbose option;
      [@ocaml.doc
        "Specifies whether the [GetMLModel] operation should return [Recipe].\n\n\
        \ If true, [Recipe] is returned.\n\
        \ \n\
        \  If false, [Recipe] is not returned.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec performance_metrics_property_value = string [@@ocaml.doc ""]

type nonrec performance_metrics_property_key = string [@@ocaml.doc ""]

type nonrec performance_metrics_properties =
  (performance_metrics_property_key * performance_metrics_property_value) list
[@@ocaml.doc ""]

type nonrec performance_metrics = {
  properties : performance_metrics_properties option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Measurements of how well the [MLModel] performed on known observations. One of the following \
   metrics is returned, based on the type of the [MLModel]: \n\n\
  \ {ul\n\
  \       {-  BinaryAUC: The binary [MLModel] uses the Area Under the Curve (AUC) technique to \
   measure performance. \n\
  \           \n\
  \            }\n\
  \       {-  RegressionRMSE: The regression [MLModel] uses the Root Mean Square Error (RMSE) \
   technique to measure performance. RMSE measures the difference between predicted and actual \
   values for a single variable.\n\
  \           \n\
  \            }\n\
  \       {-  MulticlassAvgFScore: The multiclass [MLModel] uses the F1 score technique to measure \
   performance. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \    For more information about performance metrics, please see the \
   {{:https://docs.aws.amazon.com/machine-learning/latest/dg}Amazon Machine Learning Developer \
   Guide}. \n\
  \   "]

type nonrec get_evaluation_output = {
  evaluation_id : entity_id option;
      [@ocaml.doc "The evaluation ID which is same as the [EvaluationId] in the request.\n"]
  ml_model_id : entity_id option;
      [@ocaml.doc "The ID of the [MLModel] that was the focus of the evaluation.\n"]
  evaluation_data_source_id : entity_id option;
      [@ocaml.doc "The [DataSource] used for this evaluation.\n"]
  input_data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account that invoked the evaluation. The account type can be either an AWS \
         root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc
        "The time that the [Evaluation] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [Evaluation]. The time is expressed in epoch time.\n"]
  name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [Evaluation]. \n"]
  status : entity_status option;
      [@ocaml.doc
        "The status of the evaluation. This element can have one of the following values:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon Machine Language (Amazon ML) submitted a request to \
         evaluate an [MLModel].\n\
        \           \n\
        \            }\n\
        \       {-   [INPROGRESS] - The evaluation is underway.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The request to evaluate an [MLModel] did not run to completion. It \
         is not usable.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The evaluation process completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The [Evaluation] is marked as deleted. It is not usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  performance_metrics : performance_metrics option;
      [@ocaml.doc
        "Measurements of how well the [MLModel] performed using observations referenced by the \
         [DataSource]. One of the following metric is returned based on the type of the [MLModel]: \
         \n\n\
        \ {ul\n\
        \       {-  BinaryAUC: A binary [MLModel] uses the Area Under the Curve (AUC) technique to \
         measure performance. \n\
        \           \n\
        \            }\n\
        \       {-  RegressionRMSE: A regression [MLModel] uses the Root Mean Square Error (RMSE) \
         technique to measure performance. RMSE measures the difference between predicted and \
         actual values for a single variable.\n\
        \           \n\
        \            }\n\
        \       {-  MulticlassAvgFScore: A multiclass [MLModel] uses the F1 score technique to \
         measure performance. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information about performance metrics, please see the \
         {{:https://docs.aws.amazon.com/machine-learning/latest/dg}Amazon Machine Learning \
         Developer Guide}. \n\
        \   "]
  log_uri : presigned_s3_url option;
      [@ocaml.doc "A link to the file that contains logs of the [CreateEvaluation] operation.\n"]
  message : message option;
      [@ocaml.doc "A description of the most recent details about evaluating the [MLModel].\n"]
  compute_time : long_type option;
      [@ocaml.doc
        "The approximate CPU time in milliseconds that Amazon Machine Learning spent processing \
         the [Evaluation], normalized and scaled on computation resources. [ComputeTime] is only \
         available if the [Evaluation] is in the [COMPLETED] state.\n"]
  finished_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [Evaluation] as [COMPLETED] or \
         [FAILED]. [FinishedAt] is only available when the [Evaluation] is in the [COMPLETED] or \
         [FAILED] state.\n"]
  started_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [Evaluation] as [INPROGRESS]. \
         [StartedAt] isn't available if the [Evaluation] is in the [PENDING] state.\n"]
}
[@@ocaml.doc
  "Represents the output of a [GetEvaluation] operation and describes an [Evaluation].\n"]

type nonrec get_evaluation_input = {
  evaluation_id : entity_id;
      [@ocaml.doc
        "The ID of the [Evaluation] to retrieve. The evaluation of each [MLModel] is recorded and \
         cataloged. The ID provides the means to access the information. \n"]
}
[@@ocaml.doc ""]

type nonrec compute_statistics = bool [@@ocaml.doc ""]

type nonrec role_ar_n = string [@@ocaml.doc ""]

type nonrec edp_pipeline_id = string [@@ocaml.doc ""]

type nonrec edp_service_role = string [@@ocaml.doc ""]

type nonrec edp_resource_role = string [@@ocaml.doc ""]

type nonrec rds_select_sql_query = string [@@ocaml.doc ""]

type nonrec rds_database_username = string [@@ocaml.doc ""]

type nonrec rds_database_name = string [@@ocaml.doc ""]

type nonrec rds_instance_identifier = string [@@ocaml.doc ""]

type nonrec rds_database = {
  instance_identifier : rds_instance_identifier; [@ocaml.doc "The ID of an RDS DB instance.\n"]
  database_name : rds_database_name; [@ocaml.doc ""]
}
[@@ocaml.doc "The database details of an Amazon RDS database.\n"]

type nonrec rds_metadata = {
  database : rds_database option;
      [@ocaml.doc "The database details required to connect to an Amazon RDS.\n"]
  database_user_name : rds_database_username option; [@ocaml.doc ""]
  select_sql_query : rds_select_sql_query option;
      [@ocaml.doc
        "The SQL query that is supplied during [CreateDataSourceFromRDS]. Returns only if \
         [Verbose] is true in [GetDataSourceInput]. \n"]
  resource_role : edp_resource_role option;
      [@ocaml.doc
        "The role (DataPipelineDefaultResourceRole) assumed by an Amazon EC2 instance to carry out \
         the copy task from Amazon RDS to Amazon S3. For more information, see \
         {{:https://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html}Role \
         templates} for data pipelines.\n"]
  service_role : edp_service_role option;
      [@ocaml.doc
        "The role (DataPipelineDefaultRole) assumed by the Data Pipeline service to monitor the \
         progress of the copy task from Amazon RDS to Amazon S3. For more information, see \
         {{:https://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html}Role \
         templates} for data pipelines.\n"]
  data_pipeline_id : edp_pipeline_id option;
      [@ocaml.doc
        "The ID of the Data Pipeline instance that is used to carry to copy data from Amazon RDS \
         to Amazon S3. You can use the ID to find details about the instance in the Data Pipeline \
         console.\n"]
}
[@@ocaml.doc "The datasource details that are specific to Amazon RDS.\n"]

type nonrec redshift_select_sql_query = string [@@ocaml.doc ""]

type nonrec redshift_database_username = string [@@ocaml.doc ""]

type nonrec redshift_cluster_identifier = string [@@ocaml.doc ""]

type nonrec redshift_database_name = string [@@ocaml.doc ""]

type nonrec redshift_database = {
  database_name : redshift_database_name; [@ocaml.doc ""]
  cluster_identifier : redshift_cluster_identifier; [@ocaml.doc ""]
}
[@@ocaml.doc "Describes the database details required to connect to an Amazon Redshift database.\n"]

type nonrec redshift_metadata = {
  redshift_database : redshift_database option; [@ocaml.doc ""]
  database_user_name : redshift_database_username option; [@ocaml.doc ""]
  select_sql_query : redshift_select_sql_query option;
      [@ocaml.doc
        " The SQL query that is specified during [CreateDataSourceFromRedshift]. Returns only if \
         [Verbose] is true in GetDataSourceInput. \n"]
}
[@@ocaml.doc "Describes the [DataSource] details specific to Amazon Redshift.\n"]

type nonrec data_rearrangement = string [@@ocaml.doc ""]

type nonrec get_data_source_output = {
  data_source_id : entity_id option;
      [@ocaml.doc
        "The ID assigned to the [DataSource] at creation. This value should be identical to the \
         value of the [DataSourceId] in the request.\n"]
  data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).\n"]
  data_rearrangement : data_rearrangement option;
      [@ocaml.doc
        "A JSON string that represents the splitting and rearrangement requirement used when this \
         [DataSource] was created.\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account from which the [DataSource] was created. The account type can be \
         either an AWS root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc
        "The time that the [DataSource] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [DataSource]. The time is expressed in epoch time.\n"]
  data_size_in_bytes : long_type option;
      [@ocaml.doc "The total size of observations in the data files.\n"]
  number_of_files : long_type option;
      [@ocaml.doc "The number of data files referenced by the [DataSource].\n"]
  name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [DataSource].\n"]
  status : entity_status option;
      [@ocaml.doc
        "The current status of the [DataSource]. This element can have one of the following \
         values:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon ML submitted a request to create a [DataSource].\n\
        \           \n\
        \            }\n\
        \       {-   [INPROGRESS] - The creation process is underway.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The request to create a [DataSource] did not run to completion. It \
         is not usable.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The creation process completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The [DataSource] is marked as deleted. It is not usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  log_uri : presigned_s3_url option;
      [@ocaml.doc "A link to the file containing logs of [CreateDataSourceFrom*] operations.\n"]
  message : message option;
      [@ocaml.doc
        "The user-supplied description of the most recent details about creating the [DataSource].\n"]
  redshift_metadata : redshift_metadata option; [@ocaml.doc ""]
  rds_metadata : rds_metadata option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option; [@ocaml.doc ""]
  compute_statistics : compute_statistics option;
      [@ocaml.doc
        " The parameter is [true] if statistics need to be generated from the observation data. \n"]
  compute_time : long_type option;
      [@ocaml.doc
        "The approximate CPU time in milliseconds that Amazon Machine Learning spent processing \
         the [DataSource], normalized and scaled on computation resources. [ComputeTime] is only \
         available if the [DataSource] is in the [COMPLETED] state and the [ComputeStatistics] is \
         set to true.\n"]
  finished_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [DataSource] as [COMPLETED] or \
         [FAILED]. [FinishedAt] is only available when the [DataSource] is in the [COMPLETED] or \
         [FAILED] state.\n"]
  started_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [DataSource] as [INPROGRESS]. \
         [StartedAt] isn't available if the [DataSource] is in the [PENDING] state.\n"]
  data_source_schema : data_schema option;
      [@ocaml.doc
        "The schema used by all of the data files of this [DataSource].\n\n\
        \  {b Note:} This parameter is provided as part of the verbose format.\n\
        \ "]
}
[@@ocaml.doc "Represents the output of a [GetDataSource] operation and describes a [DataSource].\n"]

type nonrec get_data_source_input = {
  data_source_id : entity_id; [@ocaml.doc "The ID assigned to the [DataSource] at creation.\n"]
  verbose : verbose option;
      [@ocaml.doc
        "Specifies whether the [GetDataSource] operation should return [DataSourceSchema].\n\n\
        \ If true, [DataSourceSchema] is returned.\n\
        \ \n\
        \  If false, [DataSourceSchema] is not returned.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_batch_prediction_output = {
  batch_prediction_id : entity_id option;
      [@ocaml.doc
        "An ID assigned to the [BatchPrediction] at creation. This value should be identical to \
         the value of the [BatchPredictionID] in the request.\n"]
  ml_model_id : entity_id option;
      [@ocaml.doc
        "The ID of the [MLModel] that generated predictions for the [BatchPrediction] request.\n"]
  batch_prediction_data_source_id : entity_id option;
      [@ocaml.doc "The ID of the [DataSource] that was used to create the [BatchPrediction]. \n"]
  input_data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account that invoked the [BatchPrediction]. The account type can be either \
         an AWS root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc
        "The time when the [BatchPrediction] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to [BatchPrediction]. The time is expressed in epoch time.\n"]
  name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [BatchPrediction].\n"]
  status : entity_status option;
      [@ocaml.doc
        "The status of the [BatchPrediction], which can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon Machine Learning (Amazon ML) submitted a request to \
         generate batch predictions.\n\
        \           \n\
        \            }\n\
        \       {-   [INPROGRESS] - The batch predictions are in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The request to perform a batch prediction did not run to \
         completion. It is not usable.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The batch prediction process completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The [BatchPrediction] is marked as deleted. It is not usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  output_uri : s3_url option;
      [@ocaml.doc
        "The location of an Amazon S3 bucket or directory to receive the operation results.\n"]
  log_uri : presigned_s3_url option;
      [@ocaml.doc
        "A link to the file that contains logs of the [CreateBatchPrediction] operation.\n"]
  message : message option;
      [@ocaml.doc
        "A description of the most recent details about processing the batch prediction request.\n"]
  compute_time : long_type option;
      [@ocaml.doc
        "The approximate CPU time in milliseconds that Amazon Machine Learning spent processing \
         the [BatchPrediction], normalized and scaled on computation resources. [ComputeTime] is \
         only available if the [BatchPrediction] is in the [COMPLETED] state.\n"]
  finished_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [BatchPrediction] as [COMPLETED] \
         or [FAILED]. [FinishedAt] is only available when the [BatchPrediction] is in the \
         [COMPLETED] or [FAILED] state.\n"]
  started_at : epoch_time option;
      [@ocaml.doc
        "The epoch time when Amazon Machine Learning marked the [BatchPrediction] as [INPROGRESS]. \
         [StartedAt] isn't available if the [BatchPrediction] is in the [PENDING] state.\n"]
  total_record_count : long_type option;
      [@ocaml.doc
        "The number of total records that Amazon Machine Learning saw while processing the \
         [BatchPrediction].\n"]
  invalid_record_count : long_type option;
      [@ocaml.doc
        "The number of invalid records that Amazon Machine Learning saw while processing the \
         [BatchPrediction].\n"]
}
[@@ocaml.doc
  "Represents the output of a [GetBatchPrediction] operation and describes a [BatchPrediction].\n"]

type nonrec get_batch_prediction_input = {
  batch_prediction_id : entity_id;
      [@ocaml.doc "An ID assigned to the [BatchPrediction] at creation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tags_output = {
  resource_id : entity_id option; [@ocaml.doc "The ID of the tagged ML object.\n"]
  resource_type : taggable_resource_type option; [@ocaml.doc "The type of the tagged ML object.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags associated with the ML object.\n"]
}
[@@ocaml.doc "Amazon ML returns the following elements.\n"]

type nonrec describe_tags_input = {
  resource_id : entity_id; [@ocaml.doc "The ID of the ML object. For example, [exampleModelId]. \n"]
  resource_type : taggable_resource_type; [@ocaml.doc "The type of the ML object.\n"]
}
[@@ocaml.doc ""]

type nonrec ml_model = {
  ml_model_id : entity_id option; [@ocaml.doc "The ID assigned to the [MLModel] at creation.\n"]
  training_data_source_id : entity_id option;
      [@ocaml.doc
        "The ID of the training [DataSource]. The [CreateMLModel] operation uses the \
         [TrainingDataSourceId].\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account from which the [MLModel] was created. The account type can be either \
         an AWS root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc "The time that the [MLModel] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [MLModel]. The time is expressed in epoch time.\n"]
  name : ml_model_name option;
      [@ocaml.doc "A user-supplied name or description of the [MLModel].\n"]
  status : entity_status option;
      [@ocaml.doc
        "The current status of an [MLModel]. This element can have one of the following values: \n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon Machine Learning (Amazon ML) submitted a request to create \
         an [MLModel].\n\
        \           \n\
        \            }\n\
        \       {-   [INPROGRESS] - The creation process is underway.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The request to create an [MLModel] didn't run to completion. The \
         model isn't usable.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The creation process completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The [MLModel] is marked as deleted. It isn't usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  size_in_bytes : long_type option; [@ocaml.doc ""]
  endpoint_info : realtime_endpoint_info option;
      [@ocaml.doc "The current endpoint of the [MLModel].\n"]
  training_parameters : training_parameters option;
      [@ocaml.doc
        "A list of the training parameters in the [MLModel]. The list is implemented as a map of \
         key-value pairs.\n\n\
        \ The following is the current set of training parameters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [sgd.maxMLModelSizeInBytes] - The maximum allowed size of the model. \
         Depending on the input data, the size of the model might affect its performance.\n\
        \            \n\
        \              The value is an integer that ranges from [100000] to [2147483648]. The \
         default value is [33554432].\n\
        \             \n\
        \              }\n\
        \        {-   [sgd.maxPasses] - The number of times that the training process traverses \
         the observations to build the [MLModel]. The value is an integer that ranges from [1] to \
         [10000]. The default value is [10].\n\
        \            \n\
        \             }\n\
        \        {-   [sgd.shuffleType] - Whether Amazon ML shuffles the training data. Shuffling \
         the data improves a model's ability to find the optimal solution for a variety of data \
         types. The valid values are [auto] and [none]. The default value is [none].\n\
        \            \n\
        \             }\n\
        \        {-   [sgd.l1RegularizationAmount] - The coefficient regularization L1 norm, which \
         controls overfitting the data by penalizing large coefficients. This parameter tends to \
         drive coefficients to zero, resulting in sparse feature set. If you use this parameter, \
         start by specifying a small value, such as [1.0E-08].\n\
        \            \n\
        \             The value is a double that ranges from [0] to [MAX_DOUBLE]. The default is \
         to not use L1 normalization. This parameter can't be used when [L2] is specified. Use \
         this parameter sparingly.\n\
        \             \n\
        \              }\n\
        \        {-   [sgd.l2RegularizationAmount] - The coefficient regularization L2 norm, which \
         controls overfitting the data by penalizing large coefficients. This tends to drive \
         coefficients to small, nonzero values. If you use this parameter, start by specifying a \
         small value, such as [1.0E-08].\n\
        \            \n\
        \             The value is a double that ranges from [0] to [MAX_DOUBLE]. The default is \
         to not use L2 normalization. This parameter can't be used when [L1] is specified. Use \
         this parameter sparingly.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  input_data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).\n"]
  algorithm : algorithm option;
      [@ocaml.doc
        "The algorithm used to train the [MLModel]. The following algorithm is supported:\n\n\
        \ {ul\n\
        \       {-   [SGD] -- Stochastic gradient descent. The goal of [SGD] is to minimize the \
         gradient of the loss function. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  ml_model_type : ml_model_type option;
      [@ocaml.doc
        "Identifies the [MLModel] category. The following are the available types:\n\n\
        \ {ul\n\
        \       {-   [REGRESSION] - Produces a numeric result. For example, \"What price should a \
         house be listed at?\"\n\
        \           \n\
        \            }\n\
        \       {-   [BINARY] - Produces one of two possible results. For example, \"Is this a \
         child-friendly web site?\".\n\
        \           \n\
        \            }\n\
        \       {-   [MULTICLASS] - Produces one of several possible results. For example, \"Is \
         this a HIGH-, LOW-, or MEDIUM-risk trade?\".\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  score_threshold : score_threshold option; [@ocaml.doc ""]
  score_threshold_last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [ScoreThreshold]. The time is expressed in epoch \
         time.\n"]
  message : message option;
      [@ocaml.doc "A description of the most recent details about accessing the [MLModel].\n"]
  compute_time : long_type option; [@ocaml.doc ""]
  finished_at : epoch_time option; [@ocaml.doc ""]
  started_at : epoch_time option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " Represents the output of a [GetMLModel] operation. \n\n\
  \ The content consists of the detailed metadata and the current status of the [MLModel].\n\
  \ "]

type nonrec ml_models = ml_model list [@@ocaml.doc ""]

type nonrec describe_ml_models_output = {
  results : ml_models option; [@ocaml.doc "A list of [MLModel] that meet the search criteria.\n"]
  next_token : string_type option;
      [@ocaml.doc
        "The ID of the next page in the paginated results that indicates at least one more page \
         follows.\n"]
}
[@@ocaml.doc
  "Represents the output of a [DescribeMLModels] operation. The content is essentially a list of \
   [MLModel].\n"]

type nonrec page_limit = int [@@ocaml.doc ""]

type nonrec sort_order = ASC [@ocaml.doc ""] | DSC [@ocaml.doc ""]
[@@ocaml.doc
  "The sort order specified in a listing condition. Possible values include the following:\n\n\
  \ {ul\n\
  \       {-   [asc] - Present the information in ascending order (from A-Z).\n\
  \           \n\
  \            }\n\
  \       {-   [dsc] - Present the information in descending order (from Z-A).\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec comparator_value = string [@@ocaml.doc ""]

type nonrec ml_model_filter_variable =
  | CREATED_AT [@ocaml.doc ""]
  | LAST_UPDATED_AT [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | IAM_USER [@ocaml.doc ""]
  | TRAINING_DATASOURCE_ID [@ocaml.doc ""]
  | REAL_TIME_ENDPOINT_STATUS [@ocaml.doc ""]
  | ML_MODEL_TYPE [@ocaml.doc ""]
  | ALGORITHM [@ocaml.doc ""]
  | TRAINING_DATA_URI [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_ml_models_input = {
  filter_variable : ml_model_filter_variable option;
      [@ocaml.doc
        "Use one of the following variables to filter a list of [MLModel]:\n\n\
        \ {ul\n\
        \       {-   [CreatedAt] - Sets the search criteria to [MLModel] creation date.\n\
        \           \n\
        \            }\n\
        \       {-   [Status] - Sets the search criteria to [MLModel] status.\n\
        \           \n\
        \            }\n\
        \       {-   [Name] - Sets the search criteria to the contents of [MLModel] {b  } [Name].\n\
        \           \n\
        \            }\n\
        \       {-   [IAMUser] - Sets the search criteria to the user account that invoked the \
         [MLModel] creation.\n\
        \           \n\
        \            }\n\
        \       {-   [TrainingDataSourceId] - Sets the search criteria to the [DataSource] used to \
         train one or more [MLModel].\n\
        \           \n\
        \            }\n\
        \       {-   [RealtimeEndpointStatus] - Sets the search criteria to the [MLModel] \
         real-time endpoint status.\n\
        \           \n\
        \            }\n\
        \       {-   [MLModelType] - Sets the search criteria to [MLModel] type: binary, \
         regression, or multi-class.\n\
        \           \n\
        \            }\n\
        \       {-   [Algorithm] - Sets the search criteria to the algorithm that the [MLModel] \
         uses.\n\
        \           \n\
        \            }\n\
        \       {-   [TrainingDataURI] - Sets the search criteria to the data file(s) used in \
         training a [MLModel]. The URL can identify either a file or an Amazon Simple Storage \
         Service (Amazon S3) bucket or directory.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  e_q : comparator_value option;
      [@ocaml.doc
        "The equal to operator. The [MLModel] results will have [FilterVariable] values that \
         exactly match the value specified with [EQ].\n"]
  g_t : comparator_value option;
      [@ocaml.doc
        "The greater than operator. The [MLModel] results will have [FilterVariable] values that \
         are greater than the value specified with [GT].\n"]
  l_t : comparator_value option;
      [@ocaml.doc
        "The less than operator. The [MLModel] results will have [FilterVariable] values that are \
         less than the value specified with [LT].\n"]
  g_e : comparator_value option;
      [@ocaml.doc
        "The greater than or equal to operator. The [MLModel] results will have [FilterVariable] \
         values that are greater than or equal to the value specified with [GE]. \n"]
  l_e : comparator_value option;
      [@ocaml.doc
        "The less than or equal to operator. The [MLModel] results will have [FilterVariable] \
         values that are less than or equal to the value specified with [LE].\n"]
  n_e : comparator_value option;
      [@ocaml.doc
        "The not equal to operator. The [MLModel] results will have [FilterVariable] values not \
         equal to the value specified with [NE].\n"]
  prefix : comparator_value option;
      [@ocaml.doc
        "A string that is found at the beginning of a variable, such as [Name] or [Id].\n\n\
        \ For example, an [MLModel] could have the [Name] [2014-09-09-HolidayGiftMailer]. To \
         search for this [MLModel], select [Name] for the [FilterVariable] and any of the \
         following strings for the [Prefix]: \n\
        \ \n\
        \  {ul\n\
        \        {-  2014-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09-Holiday\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  sort_order : sort_order option;
      [@ocaml.doc
        "A two-value parameter that determines the sequence of the resulting list of [MLModel].\n\n\
        \ {ul\n\
        \       {-   [asc] - Arranges the list in ascending order (A-Z, 0-9).\n\
        \           \n\
        \            }\n\
        \       {-   [dsc] - Arranges the list in descending order (Z-A, 9-0).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Results are sorted by [FilterVariable].\n\
        \   "]
  next_token : string_type option; [@ocaml.doc "The ID of the page in the paginated results.\n"]
  limit : page_limit option;
      [@ocaml.doc
        "The number of pages of information to include in the result. The range of acceptable \
         values is [1] through [100]. The default value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec evaluation = {
  evaluation_id : entity_id option;
      [@ocaml.doc "The ID that is assigned to the [Evaluation] at creation.\n"]
  ml_model_id : entity_id option;
      [@ocaml.doc "The ID of the [MLModel] that is the focus of the evaluation.\n"]
  evaluation_data_source_id : entity_id option;
      [@ocaml.doc "The ID of the [DataSource] that is used to evaluate the [MLModel].\n"]
  input_data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location and name of the data in Amazon Simple Storage Server (Amazon S3) that is \
         used in the evaluation.\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account that invoked the evaluation. The account type can be either an AWS \
         root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc
        "The time that the [Evaluation] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [Evaluation]. The time is expressed in epoch time.\n"]
  name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [Evaluation]. \n"]
  status : entity_status option;
      [@ocaml.doc
        "The status of the evaluation. This element can have one of the following values:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon Machine Learning (Amazon ML) submitted a request to \
         evaluate an [MLModel].\n\
        \           \n\
        \            }\n\
        \       {-   [INPROGRESS] - The evaluation is underway.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The request to evaluate an [MLModel] did not run to completion. It \
         is not usable.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The evaluation process completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The [Evaluation] is marked as deleted. It is not usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  performance_metrics : performance_metrics option;
      [@ocaml.doc
        "Measurements of how well the [MLModel] performed, using observations referenced by the \
         [DataSource]. One of the following metrics is returned, based on the type of the \
         [MLModel]: \n\n\
        \ {ul\n\
        \       {-  BinaryAUC: A binary [MLModel] uses the Area Under the Curve (AUC) technique to \
         measure performance. \n\
        \           \n\
        \            }\n\
        \       {-  RegressionRMSE: A regression [MLModel] uses the Root Mean Square Error (RMSE) \
         technique to measure performance. RMSE measures the difference between predicted and \
         actual values for a single variable.\n\
        \           \n\
        \            }\n\
        \       {-  MulticlassAvgFScore: A multiclass [MLModel] uses the F1 score technique to \
         measure performance. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information about performance metrics, please see the \
         {{:https://docs.aws.amazon.com/machine-learning/latest/dg}Amazon Machine Learning \
         Developer Guide}. \n\
        \   "]
  message : message option;
      [@ocaml.doc "A description of the most recent details about evaluating the [MLModel].\n"]
  compute_time : long_type option; [@ocaml.doc ""]
  finished_at : epoch_time option; [@ocaml.doc ""]
  started_at : epoch_time option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " Represents the output of [GetEvaluation] operation. \n\n\
  \ The content consists of the detailed metadata and data file information and the current status \
   of the [Evaluation].\n\
  \ "]

type nonrec evaluations = evaluation list [@@ocaml.doc ""]

type nonrec describe_evaluations_output = {
  results : evaluations option;
      [@ocaml.doc "A list of [Evaluation] that meet the search criteria. \n"]
  next_token : string_type option;
      [@ocaml.doc
        "The ID of the next page in the paginated results that indicates at least one more page \
         follows.\n"]
}
[@@ocaml.doc
  "Represents the query results from a [DescribeEvaluations] operation. The content is essentially \
   a list of [Evaluation].\n"]

type nonrec evaluation_filter_variable =
  | CREATED_AT [@ocaml.doc ""]
  | LAST_UPDATED_AT [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | IAM_USER [@ocaml.doc ""]
  | ML_MODEL_ID [@ocaml.doc ""]
  | DATASOURCE_ID [@ocaml.doc ""]
  | DATA_URI [@ocaml.doc ""]
[@@ocaml.doc
  "A list of the variables to use in searching or filtering [Evaluation].\n\n\
  \ {ul\n\
  \       {-   [CreatedAt] - Sets the search criteria to [Evaluation] creation date.\n\
  \           \n\
  \            }\n\
  \       {-   [Status] - Sets the search criteria to [Evaluation] status.\n\
  \           \n\
  \            }\n\
  \       {-   [Name] - Sets the search criteria to the contents of [Evaluation] {b  } [Name].\n\
  \           \n\
  \            }\n\
  \       {-   [IAMUser] - Sets the search criteria to the user account that invoked an evaluation.\n\
  \           \n\
  \            }\n\
  \       {-   [MLModelId] - Sets the search criteria to the [Predictor] that was evaluated.\n\
  \           \n\
  \            }\n\
  \       {-   [DataSourceId] - Sets the search criteria to the [DataSource] used in evaluation.\n\
  \           \n\
  \            }\n\
  \       {-   [DataUri] - Sets the search criteria to the data file(s) used in evaluation. The \
   URL can identify either a file or an Amazon Simple Storage Service (Amazon S3) bucket or \
   directory.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec describe_evaluations_input = {
  filter_variable : evaluation_filter_variable option;
      [@ocaml.doc
        "Use one of the following variable to filter a list of [Evaluation] objects:\n\n\
        \ {ul\n\
        \       {-   [CreatedAt] - Sets the search criteria to the [Evaluation] creation date.\n\
        \           \n\
        \            }\n\
        \       {-   [Status] - Sets the search criteria to the [Evaluation] status.\n\
        \           \n\
        \            }\n\
        \       {-   [Name] - Sets the search criteria to the contents of [Evaluation] {b  } [Name].\n\
        \           \n\
        \            }\n\
        \       {-   [IAMUser] - Sets the search criteria to the user account that invoked an \
         [Evaluation].\n\
        \           \n\
        \            }\n\
        \       {-   [MLModelId] - Sets the search criteria to the [MLModel] that was evaluated.\n\
        \           \n\
        \            }\n\
        \       {-   [DataSourceId] - Sets the search criteria to the [DataSource] used in \
         [Evaluation].\n\
        \           \n\
        \            }\n\
        \       {-   [DataUri] - Sets the search criteria to the data file(s) used in \
         [Evaluation]. The URL can identify either a file or an Amazon Simple Storage Solution \
         (Amazon S3) bucket or directory.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  e_q : comparator_value option;
      [@ocaml.doc
        "The equal to operator. The [Evaluation] results will have [FilterVariable] values that \
         exactly match the value specified with [EQ].\n"]
  g_t : comparator_value option;
      [@ocaml.doc
        "The greater than operator. The [Evaluation] results will have [FilterVariable] values \
         that are greater than the value specified with [GT].\n"]
  l_t : comparator_value option;
      [@ocaml.doc
        "The less than operator. The [Evaluation] results will have [FilterVariable] values that \
         are less than the value specified with [LT].\n"]
  g_e : comparator_value option;
      [@ocaml.doc
        "The greater than or equal to operator. The [Evaluation] results will have \
         [FilterVariable] values that are greater than or equal to the value specified with [GE]. \n"]
  l_e : comparator_value option;
      [@ocaml.doc
        "The less than or equal to operator. The [Evaluation] results will have [FilterVariable] \
         values that are less than or equal to the value specified with [LE].\n"]
  n_e : comparator_value option;
      [@ocaml.doc
        "The not equal to operator. The [Evaluation] results will have [FilterVariable] values not \
         equal to the value specified with [NE].\n"]
  prefix : comparator_value option;
      [@ocaml.doc
        "A string that is found at the beginning of a variable, such as [Name] or [Id].\n\n\
        \ For example, an [Evaluation] could have the [Name] [2014-09-09-HolidayGiftMailer]. To \
         search for this [Evaluation], select [Name] for the [FilterVariable] and any of the \
         following strings for the [Prefix]: \n\
        \ \n\
        \  {ul\n\
        \        {-  2014-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09-Holiday\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  sort_order : sort_order option;
      [@ocaml.doc
        "A two-value parameter that determines the sequence of the resulting list of [Evaluation].\n\n\
        \ {ul\n\
        \       {-   [asc] - Arranges the list in ascending order (A-Z, 0-9).\n\
        \           \n\
        \            }\n\
        \       {-   [dsc] - Arranges the list in descending order (Z-A, 9-0).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Results are sorted by [FilterVariable].\n\
        \   "]
  next_token : string_type option; [@ocaml.doc "The ID of the page in the paginated results.\n"]
  limit : page_limit option;
      [@ocaml.doc " The maximum number of [Evaluation] to include in the result.\n"]
}
[@@ocaml.doc ""]

type nonrec data_source = {
  data_source_id : entity_id option;
      [@ocaml.doc "The ID that is assigned to the [DataSource] during creation.\n"]
  data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location and name of the data in Amazon Simple Storage Service (Amazon S3) that is \
         used by a [DataSource].\n"]
  data_rearrangement : data_rearrangement option;
      [@ocaml.doc
        "A JSON string that represents the splitting and rearrangement requirement used when this \
         [DataSource] was created.\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account from which the [DataSource] was created. The account type can be \
         either an AWS root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc
        "The time that the [DataSource] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [BatchPrediction]. The time is expressed in epoch \
         time.\n"]
  data_size_in_bytes : long_type option;
      [@ocaml.doc
        "The total number of observations contained in the data files that the [DataSource] \
         references.\n"]
  number_of_files : long_type option;
      [@ocaml.doc "The number of data files referenced by the [DataSource].\n"]
  name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [DataSource].\n"]
  status : entity_status option;
      [@ocaml.doc
        "The current status of the [DataSource]. This element can have one of the following \
         values: \n\n\
        \ {ul\n\
        \       {-  PENDING - Amazon Machine Learning (Amazon ML) submitted a request to create a \
         [DataSource].\n\
        \           \n\
        \            }\n\
        \       {-  INPROGRESS - The creation process is underway.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED - The request to create a [DataSource] did not run to completion. It is \
         not usable.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED - The creation process completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-  DELETED - The [DataSource] is marked as deleted. It is not usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : message option;
      [@ocaml.doc "A description of the most recent details about creating the [DataSource].\n"]
  redshift_metadata : redshift_metadata option; [@ocaml.doc ""]
  rds_metadata : rds_metadata option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option; [@ocaml.doc ""]
  compute_statistics : compute_statistics option;
      [@ocaml.doc
        " The parameter is [true] if statistics need to be generated from the observation data. \n"]
  compute_time : long_type option; [@ocaml.doc ""]
  finished_at : epoch_time option; [@ocaml.doc ""]
  started_at : epoch_time option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " Represents the output of the [GetDataSource] operation. \n\n\
  \  The content consists of the detailed metadata and data file information and the current \
   status of the [DataSource]. \n\
  \ "]

type nonrec data_sources = data_source list [@@ocaml.doc ""]

type nonrec describe_data_sources_output = {
  results : data_sources option;
      [@ocaml.doc "A list of [DataSource] that meet the search criteria. \n"]
  next_token : string_type option;
      [@ocaml.doc
        "An ID of the next page in the paginated results that indicates at least one more page \
         follows.\n"]
}
[@@ocaml.doc
  "Represents the query results from a [DescribeDataSources] operation. The content is essentially \
   a list of [DataSource].\n"]

type nonrec data_source_filter_variable =
  | CREATED_AT [@ocaml.doc ""]
  | LAST_UPDATED_AT [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | DATA_URI [@ocaml.doc ""]
  | IAM_USER [@ocaml.doc ""]
[@@ocaml.doc
  "A list of the variables to use in searching or filtering [DataSource].\n\n\
  \ {ul\n\
  \       {-   [CreatedAt] - Sets the search criteria to [DataSource] creation date.\n\
  \           \n\
  \            }\n\
  \       {-   [Status] - Sets the search criteria to [DataSource] status.\n\
  \           \n\
  \            }\n\
  \       {-   [Name] - Sets the search criteria to the contents of [DataSource] [Name].\n\
  \           \n\
  \            }\n\
  \       {-   [DataUri] - Sets the search criteria to the URI of data files used to create the \
   [DataSource]. The URI can identify either a file or an Amazon Simple Storage Service (Amazon \
   S3) bucket or directory.\n\
  \           \n\
  \            }\n\
  \       {-   [IAMUser] - Sets the search criteria to the user account that invoked the \
   [DataSource] creation.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    {b Note:} The variable names should match the variable names in the [DataSource].\n\
  \   "]

type nonrec describe_data_sources_input = {
  filter_variable : data_source_filter_variable option;
      [@ocaml.doc
        "Use one of the following variables to filter a list of [DataSource]:\n\n\
        \ {ul\n\
        \       {-   [CreatedAt] - Sets the search criteria to [DataSource] creation dates.\n\
        \           \n\
        \            }\n\
        \       {-   [Status] - Sets the search criteria to [DataSource] statuses.\n\
        \           \n\
        \            }\n\
        \       {-   [Name] - Sets the search criteria to the contents of [DataSource] [Name].\n\
        \           \n\
        \            }\n\
        \       {-   [DataUri] - Sets the search criteria to the URI of data files used to create \
         the [DataSource]. The URI can identify either a file or an Amazon Simple Storage Service \
         (Amazon S3) bucket or directory.\n\
        \           \n\
        \            }\n\
        \       {-   [IAMUser] - Sets the search criteria to the user account that invoked the \
         [DataSource] creation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  e_q : comparator_value option;
      [@ocaml.doc
        "The equal to operator. The [DataSource] results will have [FilterVariable] values that \
         exactly match the value specified with [EQ].\n"]
  g_t : comparator_value option;
      [@ocaml.doc
        "The greater than operator. The [DataSource] results will have [FilterVariable] values \
         that are greater than the value specified with [GT].\n"]
  l_t : comparator_value option;
      [@ocaml.doc
        "The less than operator. The [DataSource] results will have [FilterVariable] values that \
         are less than the value specified with [LT].\n"]
  g_e : comparator_value option;
      [@ocaml.doc
        "The greater than or equal to operator. The [DataSource] results will have \
         [FilterVariable] values that are greater than or equal to the value specified with [GE]. \n"]
  l_e : comparator_value option;
      [@ocaml.doc
        "The less than or equal to operator. The [DataSource] results will have [FilterVariable] \
         values that are less than or equal to the value specified with [LE].\n"]
  n_e : comparator_value option;
      [@ocaml.doc
        "The not equal to operator. The [DataSource] results will have [FilterVariable] values not \
         equal to the value specified with [NE].\n"]
  prefix : comparator_value option;
      [@ocaml.doc
        "A string that is found at the beginning of a variable, such as [Name] or [Id].\n\n\
        \ For example, a [DataSource] could have the [Name] [2014-09-09-HolidayGiftMailer]. To \
         search for this [DataSource], select [Name] for the [FilterVariable] and any of the \
         following strings for the [Prefix]: \n\
        \ \n\
        \  {ul\n\
        \        {-  2014-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09-Holiday\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  sort_order : sort_order option;
      [@ocaml.doc
        "A two-value parameter that determines the sequence of the resulting list of [DataSource].\n\n\
        \ {ul\n\
        \       {-   [asc] - Arranges the list in ascending order (A-Z, 0-9).\n\
        \           \n\
        \            }\n\
        \       {-   [dsc] - Arranges the list in descending order (Z-A, 9-0).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Results are sorted by [FilterVariable].\n\
        \   "]
  next_token : string_type option; [@ocaml.doc "The ID of the page in the paginated results.\n"]
  limit : page_limit option;
      [@ocaml.doc " The maximum number of [DataSource] to include in the result.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_prediction = {
  batch_prediction_id : entity_id option;
      [@ocaml.doc
        "The ID assigned to the [BatchPrediction] at creation. This value should be identical to \
         the value of the [BatchPredictionID] in the request. \n"]
  ml_model_id : entity_id option;
      [@ocaml.doc
        "The ID of the [MLModel] that generated predictions for the [BatchPrediction] request.\n"]
  batch_prediction_data_source_id : entity_id option;
      [@ocaml.doc
        "The ID of the [DataSource] that points to the group of observations to predict.\n"]
  input_data_location_s3 : s3_url option;
      [@ocaml.doc
        "The location of the data file or directory in Amazon Simple Storage Service (Amazon S3).\n"]
  created_by_iam_user : aws_user_arn option;
      [@ocaml.doc
        "The AWS user account that invoked the [BatchPrediction]. The account type can be either \
         an AWS root account or an AWS Identity and Access Management (IAM) user account.\n"]
  created_at : epoch_time option;
      [@ocaml.doc
        "The time that the [BatchPrediction] was created. The time is expressed in epoch time.\n"]
  last_updated_at : epoch_time option;
      [@ocaml.doc
        "The time of the most recent edit to the [BatchPrediction]. The time is expressed in epoch \
         time.\n"]
  name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [BatchPrediction].\n"]
  status : entity_status option;
      [@ocaml.doc
        "The status of the [BatchPrediction]. This element can have one of the following values:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - Amazon Machine Learning (Amazon ML) submitted a request to \
         generate predictions for a batch of observations.\n\
        \           \n\
        \            }\n\
        \       {-   [INPROGRESS] - The process is underway.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The request to perform a batch prediction did not run to \
         completion. It is not usable.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The batch prediction process completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The [BatchPrediction] is marked as deleted. It is not usable.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  output_uri : s3_url option;
      [@ocaml.doc
        "The location of an Amazon S3 bucket or directory to receive the operation results. The \
         following substrings are not allowed in the [s3 key] portion of the [outputURI] field: \
         ':', '//', '/./', '/../'.\n"]
  message : message option;
      [@ocaml.doc
        "A description of the most recent details about processing the batch prediction request.\n"]
  compute_time : long_type option; [@ocaml.doc ""]
  finished_at : epoch_time option; [@ocaml.doc ""]
  started_at : epoch_time option; [@ocaml.doc ""]
  total_record_count : long_type option; [@ocaml.doc ""]
  invalid_record_count : long_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " Represents the output of a [GetBatchPrediction] operation.\n\n\
  \  The content consists of the detailed metadata, the status, and the data file information of a \
   [Batch Prediction].\n\
  \ "]

type nonrec batch_predictions = batch_prediction list [@@ocaml.doc ""]

type nonrec describe_batch_predictions_output = {
  results : batch_predictions option;
      [@ocaml.doc "A list of [BatchPrediction] objects that meet the search criteria. \n"]
  next_token : string_type option;
      [@ocaml.doc
        "The ID of the next page in the paginated results that indicates at least one more page \
         follows.\n"]
}
[@@ocaml.doc
  "Represents the output of a [DescribeBatchPredictions] operation. The content is essentially a \
   list of [BatchPrediction]s.\n"]

type nonrec batch_prediction_filter_variable =
  | CREATED_AT [@ocaml.doc ""]
  | LAST_UPDATED_AT [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | IAM_USER [@ocaml.doc ""]
  | ML_MODEL_ID [@ocaml.doc ""]
  | DATASOURCE_ID [@ocaml.doc ""]
  | DATA_URI [@ocaml.doc ""]
[@@ocaml.doc
  "A list of the variables to use in searching or filtering [BatchPrediction].\n\n\
  \ {ul\n\
  \       {-   [CreatedAt] - Sets the search criteria to [BatchPrediction] creation date.\n\
  \           \n\
  \            }\n\
  \       {-   [Status] - Sets the search criteria to [BatchPrediction] status.\n\
  \           \n\
  \            }\n\
  \       {-   [Name] - Sets the search criteria to the contents of [BatchPrediction] [Name].\n\
  \           \n\
  \            }\n\
  \       {-   [IAMUser] - Sets the search criteria to the user account that invoked the \
   [BatchPrediction] creation.\n\
  \           \n\
  \            }\n\
  \       {-   [MLModelId] - Sets the search criteria to the [MLModel] used in the \
   [BatchPrediction].\n\
  \           \n\
  \            }\n\
  \       {-   [DataSourceId] - Sets the search criteria to the [DataSource] used in the \
   [BatchPrediction].\n\
  \           \n\
  \            }\n\
  \       {-   [DataURI] - Sets the search criteria to the data file(s) used in the \
   [BatchPrediction]. The URL can identify either a file or an Amazon Simple Storage Service \
   (Amazon S3) bucket or directory.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec describe_batch_predictions_input = {
  filter_variable : batch_prediction_filter_variable option;
      [@ocaml.doc
        "Use one of the following variables to filter a list of [BatchPrediction]:\n\n\
        \ {ul\n\
        \       {-   [CreatedAt] - Sets the search criteria to the [BatchPrediction] creation date.\n\
        \           \n\
        \            }\n\
        \       {-   [Status] - Sets the search criteria to the [BatchPrediction] status.\n\
        \           \n\
        \            }\n\
        \       {-   [Name] - Sets the search criteria to the contents of the [BatchPrediction] \
         {b  } [Name].\n\
        \           \n\
        \            }\n\
        \       {-   [IAMUser] - Sets the search criteria to the user account that invoked the \
         [BatchPrediction] creation.\n\
        \           \n\
        \            }\n\
        \       {-   [MLModelId] - Sets the search criteria to the [MLModel] used in the \
         [BatchPrediction].\n\
        \           \n\
        \            }\n\
        \       {-   [DataSourceId] - Sets the search criteria to the [DataSource] used in the \
         [BatchPrediction].\n\
        \           \n\
        \            }\n\
        \       {-   [DataURI] - Sets the search criteria to the data file(s) used in the \
         [BatchPrediction]. The URL can identify either a file or an Amazon Simple Storage \
         Solution (Amazon S3) bucket or directory.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  e_q : comparator_value option;
      [@ocaml.doc
        "The equal to operator. The [BatchPrediction] results will have [FilterVariable] values \
         that exactly match the value specified with [EQ].\n"]
  g_t : comparator_value option;
      [@ocaml.doc
        "The greater than operator. The [BatchPrediction] results will have [FilterVariable] \
         values that are greater than the value specified with [GT].\n"]
  l_t : comparator_value option;
      [@ocaml.doc
        "The less than operator. The [BatchPrediction] results will have [FilterVariable] values \
         that are less than the value specified with [LT].\n"]
  g_e : comparator_value option;
      [@ocaml.doc
        "The greater than or equal to operator. The [BatchPrediction] results will have \
         [FilterVariable] values that are greater than or equal to the value specified with [GE]. \n"]
  l_e : comparator_value option;
      [@ocaml.doc
        "The less than or equal to operator. The [BatchPrediction] results will have \
         [FilterVariable] values that are less than or equal to the value specified with [LE].\n"]
  n_e : comparator_value option;
      [@ocaml.doc
        "The not equal to operator. The [BatchPrediction] results will have [FilterVariable] \
         values not equal to the value specified with [NE].\n"]
  prefix : comparator_value option;
      [@ocaml.doc
        "A string that is found at the beginning of a variable, such as [Name] or [Id].\n\n\
        \ For example, a [Batch Prediction] operation could have the [Name] \
         [2014-09-09-HolidayGiftMailer]. To search for this [BatchPrediction], select [Name] for \
         the [FilterVariable] and any of the following strings for the [Prefix]: \n\
        \ \n\
        \  {ul\n\
        \        {-  2014-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09\n\
        \            \n\
        \             }\n\
        \        {-  2014-09-09-Holiday\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  sort_order : sort_order option;
      [@ocaml.doc
        "A two-value parameter that determines the sequence of the resulting list of [MLModel]s.\n\n\
        \ {ul\n\
        \       {-   [asc] - Arranges the list in ascending order (A-Z, 0-9).\n\
        \           \n\
        \            }\n\
        \       {-   [dsc] - Arranges the list in descending order (Z-A, 9-0).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Results are sorted by [FilterVariable].\n\
        \   "]
  next_token : string_type option; [@ocaml.doc "An ID of the page in the paginated results.\n"]
  limit : page_limit option;
      [@ocaml.doc
        "The number of pages of information to include in the result. The range of acceptable \
         values is [1] through [100]. The default value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_tags_output = {
  resource_id : entity_id option;
      [@ocaml.doc "The ID of the ML object from which tags were deleted.\n"]
  resource_type : taggable_resource_type option;
      [@ocaml.doc "The type of the ML object from which tags were deleted.\n"]
}
[@@ocaml.doc "Amazon ML returns the following elements.\n"]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec delete_tags_input = {
  tag_keys : tag_key_list; [@ocaml.doc "One or more tags to delete.\n"]
  resource_id : entity_id;
      [@ocaml.doc "The ID of the tagged ML object. For example, [exampleModelId].\n"]
  resource_type : taggable_resource_type; [@ocaml.doc "The type of the tagged ML object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_realtime_endpoint_output = {
  ml_model_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [MLModel]. This value should be identical \
         to the value of the [MLModelId] in the request.\n"]
  realtime_endpoint_info : realtime_endpoint_info option;
      [@ocaml.doc "The endpoint information of the [MLModel] \n"]
}
[@@ocaml.doc
  "Represents the output of an [DeleteRealtimeEndpoint] operation.\n\n\
  \ The result contains the [MLModelId] and the endpoint information for the [MLModel]. \n\
  \ "]

type nonrec delete_realtime_endpoint_input = {
  ml_model_id : entity_id; [@ocaml.doc "The ID assigned to the [MLModel] during creation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_ml_model_output = {
  ml_model_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [MLModel]. This value should be identical \
         to the value of the [MLModelID] in the request.\n"]
}
[@@ocaml.doc
  "Represents the output of a [DeleteMLModel] operation.\n\n\
  \ You can use the [GetMLModel] operation and check the value of the [Status] parameter to see \
   whether an [MLModel] is marked as [DELETED].\n\
  \ "]

type nonrec delete_ml_model_input = {
  ml_model_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [MLModel].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_evaluation_output = {
  evaluation_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [Evaluation]. This value should be \
         identical to the value of the [EvaluationId] in the request.\n"]
}
[@@ocaml.doc
  " Represents the output of a [DeleteEvaluation] operation. The output indicates that Amazon \
   Machine Learning (Amazon ML) received the request.\n\n\
  \ You can use the [GetEvaluation] operation and check the value of the [Status] parameter to see \
   whether an [Evaluation] is marked as [DELETED].\n\
  \ "]

type nonrec delete_evaluation_input = {
  evaluation_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [Evaluation] to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_data_source_output = {
  data_source_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [DataSource]. This value should be \
         identical to the value of the [DataSourceID] in the request.\n"]
}
[@@ocaml.doc " Represents the output of a [DeleteDataSource] operation.\n"]

type nonrec delete_data_source_input = {
  data_source_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [DataSource].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_batch_prediction_output = {
  batch_prediction_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [BatchPrediction]. This value should be \
         identical to the value of the [BatchPredictionID] in the request.\n"]
}
[@@ocaml.doc
  " Represents the output of a [DeleteBatchPrediction] operation.\n\n\
  \ You can use the [GetBatchPrediction] operation and check the value of the [Status] parameter \
   to see whether a [BatchPrediction] is marked as [DELETED].\n\
  \ "]

type nonrec delete_batch_prediction_input = {
  batch_prediction_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [BatchPrediction].\n"]
}
[@@ocaml.doc ""]

type nonrec create_realtime_endpoint_output = {
  ml_model_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [MLModel]. This value should be identical \
         to the value of the [MLModelId] in the request.\n"]
  realtime_endpoint_info : realtime_endpoint_info option;
      [@ocaml.doc "The endpoint information of the [MLModel] \n"]
}
[@@ocaml.doc
  "Represents the output of an [CreateRealtimeEndpoint] operation.\n\n\
  \ The result contains the [MLModelId] and the endpoint information for the [MLModel].\n\
  \ \n\
  \   {b Note:} The endpoint information includes the URI of the [MLModel]; that is, the location \
   to send online prediction requests for the specified [MLModel].\n\
  \  "]

type nonrec create_realtime_endpoint_input = {
  ml_model_id : entity_id; [@ocaml.doc "The ID assigned to the [MLModel] during creation.\n"]
}
[@@ocaml.doc ""]

type nonrec idempotent_parameter_mismatch_exception = {
  message : error_message option; [@ocaml.doc ""]
  code : error_code option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A second request to use or change an object was not allowed. This can result from retrying a \
   request using a parameter that was not present in the original request.\n"]

type nonrec create_ml_model_output = {
  ml_model_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [MLModel]. This value should be identical \
         to the value of the [MLModelId] in the request. \n"]
}
[@@ocaml.doc
  " Represents the output of a [CreateMLModel] operation, and is an acknowledgement that Amazon ML \
   received the request.\n\n\
  \ The [CreateMLModel] operation is asynchronous. You can poll for status updates by using the \
   [GetMLModel] operation and checking the [Status] parameter. \n\
  \ "]

type nonrec create_ml_model_input = {
  ml_model_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [MLModel].\n"]
  ml_model_name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [MLModel].\n"]
  ml_model_type : ml_model_type;
      [@ocaml.doc
        "The category of supervised learning that this [MLModel] will address. Choose from the \
         following types:\n\n\
        \ {ul\n\
        \       {-  Choose [REGRESSION] if the [MLModel] will be used to predict a numeric value.\n\
        \           \n\
        \            }\n\
        \       {-  Choose [BINARY] if the [MLModel] result has two possible values.\n\
        \           \n\
        \            }\n\
        \       {-  Choose [MULTICLASS] if the [MLModel] result has a limited number of values.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    For more information, see the \
         {{:https://docs.aws.amazon.com/machine-learning/latest/dg}Amazon Machine Learning \
         Developer Guide}.\n\
        \   "]
  parameters : training_parameters option;
      [@ocaml.doc
        "A list of the training parameters in the [MLModel]. The list is implemented as a map of \
         key-value pairs.\n\n\
        \ The following is the current set of training parameters:\n\
        \ \n\
        \  {ul\n\
        \        {-   [sgd.maxMLModelSizeInBytes] - The maximum allowed size of the model. \
         Depending on the input data, the size of the model might affect its performance.\n\
        \            \n\
        \              The value is an integer that ranges from [100000] to [2147483648]. The \
         default value is [33554432].\n\
        \             \n\
        \              }\n\
        \        {-   [sgd.maxPasses] - The number of times that the training process traverses \
         the observations to build the [MLModel]. The value is an integer that ranges from [1] to \
         [10000]. The default value is [10].\n\
        \            \n\
        \             }\n\
        \        {-   [sgd.shuffleType] - Whether Amazon ML shuffles the training data. Shuffling \
         the data improves a model's ability to find the optimal solution for a variety of data \
         types. The valid values are [auto] and [none]. The default value is [none]. We strongly \
         recommend that you shuffle your data.\n\
        \            \n\
        \             }\n\
        \        {-   [sgd.l1RegularizationAmount] - The coefficient regularization L1 norm. It \
         controls overfitting the data by penalizing large coefficients. This tends to drive \
         coefficients to zero, resulting in a sparse feature set. If you use this parameter, start \
         by specifying a small value, such as [1.0E-08].\n\
        \            \n\
        \             The value is a double that ranges from [0] to [MAX_DOUBLE]. The default is \
         to not use L1 normalization. This parameter can't be used when [L2] is specified. Use \
         this parameter sparingly.\n\
        \             \n\
        \              }\n\
        \        {-   [sgd.l2RegularizationAmount] - The coefficient regularization L2 norm. It \
         controls overfitting the data by penalizing large coefficients. This tends to drive \
         coefficients to small, nonzero values. If you use this parameter, start by specifying a \
         small value, such as [1.0E-08].\n\
        \            \n\
        \             The value is a double that ranges from [0] to [MAX_DOUBLE]. The default is \
         to not use L2 normalization. This parameter can't be used when [L1] is specified. Use \
         this parameter sparingly.\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
  training_data_source_id : entity_id;
      [@ocaml.doc "The [DataSource] that points to the training data.\n"]
  recipe : recipe option;
      [@ocaml.doc
        "The data recipe for creating the [MLModel]. You must specify either the recipe or its \
         URI. If you don't specify a recipe or its URI, Amazon ML creates a default.\n"]
  recipe_uri : s3_url option;
      [@ocaml.doc
        "The Amazon Simple Storage Service (Amazon S3) location and file name that contains the \
         [MLModel] recipe. You must specify either the recipe or its URI. If you don't specify a \
         recipe or its URI, Amazon ML creates a default.\n"]
}
[@@ocaml.doc ""]

type nonrec create_evaluation_output = {
  evaluation_id : entity_id option;
      [@ocaml.doc
        "The user-supplied ID that uniquely identifies the [Evaluation]. This value should be \
         identical to the value of the [EvaluationId] in the request.\n"]
}
[@@ocaml.doc
  " Represents the output of a [CreateEvaluation] operation, and is an acknowledgement that Amazon \
   ML received the request.\n\n\
  \  [CreateEvaluation] operation is asynchronous. You can poll for status updates by using the \
   [GetEvcaluation] operation and checking the [Status] parameter. \n\
  \ "]

type nonrec create_evaluation_input = {
  evaluation_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [Evaluation].\n"]
  evaluation_name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [Evaluation].\n"]
  ml_model_id : entity_id;
      [@ocaml.doc
        "The ID of the [MLModel] to evaluate.\n\n\
        \ The schema used in creating the [MLModel] must match the schema of the [DataSource] used \
         in the [Evaluation].\n\
        \ "]
  evaluation_data_source_id : entity_id;
      [@ocaml.doc
        "The ID of the [DataSource] for the evaluation. The schema of the [DataSource] must match \
         the schema used to create the [MLModel].\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_source_from_s3_output = {
  data_source_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [DataSource]. This value should be \
         identical to the value of the [DataSourceID] in the request. \n"]
}
[@@ocaml.doc
  " Represents the output of a [CreateDataSourceFromS3] operation, and is an acknowledgement that \
   Amazon ML received the request.\n\n\
  \ The [CreateDataSourceFromS3] operation is asynchronous. You can poll for updates by using the \
   [GetBatchPrediction] operation and checking the [Status] parameter. \n\
  \ "]

type nonrec s3_data_spec = {
  data_location_s3 : s3_url;
      [@ocaml.doc
        "The location of the data file(s) used by a [DataSource]. The URI specifies a data file or \
         an Amazon Simple Storage Service (Amazon S3) directory or bucket containing data files.\n"]
  data_rearrangement : data_rearrangement option;
      [@ocaml.doc
        "A JSON string that represents the splitting and rearrangement processing to be applied to \
         a [DataSource]. If the [DataRearrangement] parameter is not provided, all of the input \
         data is used to create the [Datasource].\n\n\
        \ There are multiple parameters that control what data is used to create a datasource:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [percentBegin] } \n\
        \            \n\
        \             Use [percentBegin] to indicate the beginning of the range of the data used \
         to create the Datasource. If you do not include [percentBegin] and [percentEnd], Amazon \
         ML includes all of the data when creating the datasource.\n\
        \             \n\
        \              }\n\
        \        {-   {b  [percentEnd] } \n\
        \            \n\
        \             Use [percentEnd] to indicate the end of the range of the data used to create \
         the Datasource. If you do not include [percentBegin] and [percentEnd], Amazon ML includes \
         all of the data when creating the datasource.\n\
        \             \n\
        \              }\n\
        \        {-   {b  [complement] } \n\
        \            \n\
        \             The [complement] parameter instructs Amazon ML to use the data that is not \
         included in the range of [percentBegin] to [percentEnd] to create a datasource. The \
         [complement] parameter is useful if you need to create complementary datasources for \
         training and evaluation. To create a complementary datasource, use the same values for \
         [percentBegin] and [percentEnd], along with the [complement] parameter.\n\
        \             \n\
        \              For example, the following two datasources do not share any data, and can \
         be used to train and evaluate a model. The first datasource has 25 percent of the data, \
         and the second one has 75 percent of the data.\n\
        \              \n\
        \               Datasource for evaluation: [{\"splitting\":{\"percentBegin\":0, \
         \"percentEnd\":25}}] \n\
        \               \n\
        \                Datasource for training: [{\"splitting\":{\"percentBegin\":0, \
         \"percentEnd\":25, \"complement\":\"true\"}}] \n\
        \                \n\
        \                 }\n\
        \        {-   {b  [strategy] } \n\
        \            \n\
        \             To change how Amazon ML splits the data for a datasource, use the [strategy] \
         parameter.\n\
        \             \n\
        \              The default value for the [strategy] parameter is [sequential], meaning \
         that Amazon ML takes all of the data records between the [percentBegin] and [percentEnd] \
         parameters for the datasource, in the order that the records appear in the input data.\n\
        \              \n\
        \               The following two [DataRearrangement] lines are examples of sequentially \
         ordered training and evaluation datasources:\n\
        \               \n\
        \                Datasource for evaluation: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"sequential\"}}] \n\
        \                \n\
        \                 Datasource for training: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"sequential\", \"complement\":\"true\"}}] \n\
        \                 \n\
        \                  To randomly split the input data into the proportions indicated by the \
         percentBegin and percentEnd parameters, set the [strategy] parameter to [random] and \
         provide a string that is used as the seed value for the random data splitting (for \
         example, you can use the S3 path to your data as the random seed string). If you choose \
         the random split strategy, Amazon ML assigns each row of data a pseudo-random number \
         between 0 and 100, and then selects the rows that have an assigned number between \
         [percentBegin] and [percentEnd]. Pseudo-random numbers are assigned using both the input \
         seed string value and the byte offset as a seed, so changing the data results in a \
         different split. Any existing ordering is preserved. The random splitting strategy \
         ensures that variables in the training and evaluation data are distributed similarly. It \
         is useful in the cases where the input data may have an implicit sort order, which would \
         otherwise result in training and evaluation datasources containing non-similar data \
         records.\n\
        \                  \n\
        \                   The following two [DataRearrangement] lines are examples of \
         non-sequentially ordered training and evaluation datasources:\n\
        \                   \n\
        \                    Datasource for evaluation: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"random\", \
         \"randomSeed\"=\"s3://my_s3_path/bucket/file.csv\"}}] \n\
        \                    \n\
        \                     Datasource for training: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"random\", \
         \"randomSeed\"=\"s3://my_s3_path/bucket/file.csv\", \"complement\":\"true\"}}] \n\
        \                     \n\
        \                      }\n\
        \        }\n\
        \  "]
  data_schema : data_schema option;
      [@ocaml.doc
        " A JSON string that represents the schema for an Amazon S3 [DataSource]. The [DataSchema] \
         defines the structure of the observation data in the data file(s) referenced in the \
         [DataSource].\n\n\
        \ You must provide either the [DataSchema] or the [DataSchemaLocationS3].\n\
        \ \n\
        \  Define your [DataSchema] as a series of key-value pairs. [attributes] and \
         [excludedVariableNames] have an array of key-value pairs for their value. Use the \
         following format to define your [DataSchema].\n\
        \  \n\
        \   \\{ \"version\": \"1.0\",\n\
        \   \n\
        \    \"recordAnnotationFieldName\": \"F1\",\n\
        \    \n\
        \     \"recordWeightFieldName\": \"F2\",\n\
        \     \n\
        \      \"targetFieldName\": \"F3\",\n\
        \      \n\
        \       \"dataFormat\": \"CSV\",\n\
        \       \n\
        \        \"dataFileContainsHeader\": true,\n\
        \        \n\
        \         \"attributes\": \\[\n\
        \         \n\
        \          \\{ \"fieldName\": \"F1\", \"fieldType\": \"TEXT\" \\}, \\{ \"fieldName\": \
         \"F2\", \"fieldType\": \"NUMERIC\" \\}, \\{ \"fieldName\": \"F3\", \"fieldType\": \
         \"CATEGORICAL\" \\}, \\{ \"fieldName\": \"F4\", \"fieldType\": \"NUMERIC\" \\}, \\{ \
         \"fieldName\": \"F5\", \"fieldType\": \"CATEGORICAL\" \\}, \\{ \"fieldName\": \"F6\", \
         \"fieldType\": \"TEXT\" \\}, \\{ \"fieldName\": \"F7\", \"fieldType\": \
         \"WEIGHTED_INT_SEQUENCE\" \\}, \\{ \"fieldName\": \"F8\", \"fieldType\": \
         \"WEIGHTED_STRING_SEQUENCE\" \\} \\],\n\
        \          \n\
        \           \"excludedVariableNames\": \\[ \"F6\" \\] \\}\n\
        \           "]
  data_schema_location_s3 : s3_url option;
      [@ocaml.doc
        "Describes the schema location in Amazon S3. You must provide either the [DataSchema] or \
         the [DataSchemaLocationS3].\n"]
}
[@@ocaml.doc " Describes the data specification of a [DataSource].\n"]

type nonrec create_data_source_from_s3_input = {
  data_source_id : entity_id;
      [@ocaml.doc "A user-supplied identifier that uniquely identifies the [DataSource]. \n"]
  data_source_name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [DataSource]. \n"]
  data_spec : s3_data_spec;
      [@ocaml.doc
        "The data specification of a [DataSource]:\n\n\
        \ {ul\n\
        \       {-  DataLocationS3 - The Amazon S3 location of the observation data.\n\
        \           \n\
        \            }\n\
        \       {-  DataSchemaLocationS3 - The Amazon S3 location of the [DataSchema].\n\
        \           \n\
        \            }\n\
        \       {-  DataSchema - A JSON string representing the schema. This is not required if \
         [DataSchemaUri] is specified. \n\
        \           \n\
        \            }\n\
        \       {-  DataRearrangement - A JSON string that represents the splitting and \
         rearrangement requirements for the [Datasource]. \n\
        \           \n\
        \             Sample - [ \
         \"{\\\"splitting\\\":{\\\"percentBegin\\\":10,\\\"percentEnd\\\":60}}\"] \n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  compute_statistics : compute_statistics option;
      [@ocaml.doc
        "The compute statistics for a [DataSource]. The statistics are generated from the \
         observation data referenced by a [DataSource]. Amazon ML uses the statistics internally \
         during [MLModel] training. This parameter must be set to [true] if the DataSource needs \
         to be used for [MLModel] training.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_source_from_redshift_output = {
  data_source_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the datasource. This value should be \
         identical to the value of the [DataSourceID] in the request. \n"]
}
[@@ocaml.doc
  " Represents the output of a [CreateDataSourceFromRedshift] operation, and is an acknowledgement \
   that Amazon ML received the request.\n\n\
  \ The [CreateDataSourceFromRedshift] operation is asynchronous. You can poll for updates by \
   using the [GetBatchPrediction] operation and checking the [Status] parameter. \n\
  \ "]

type nonrec redshift_database_password = string [@@ocaml.doc ""]

type nonrec redshift_database_credentials = {
  username : redshift_database_username; [@ocaml.doc ""]
  password : redshift_database_password; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Describes the database credentials for connecting to a database on an Amazon Redshift cluster.\n"]

type nonrec redshift_data_spec = {
  database_information : redshift_database;
      [@ocaml.doc
        "Describes the [DatabaseName] and [ClusterIdentifier] for an Amazon Redshift [DataSource].\n"]
  select_sql_query : redshift_select_sql_query;
      [@ocaml.doc
        "Describes the SQL Query to execute on an Amazon Redshift database for an Amazon Redshift \
         [DataSource].\n"]
  database_credentials : redshift_database_credentials;
      [@ocaml.doc
        "Describes AWS Identity and Access Management (IAM) credentials that are used connect to \
         the Amazon Redshift database.\n"]
  s3_staging_location : s3_url;
      [@ocaml.doc
        "Describes an Amazon S3 location to store the result set of the [SelectSqlQuery] query.\n"]
  data_rearrangement : data_rearrangement option;
      [@ocaml.doc
        "A JSON string that represents the splitting and rearrangement processing to be applied to \
         a [DataSource]. If the [DataRearrangement] parameter is not provided, all of the input \
         data is used to create the [Datasource].\n\n\
        \ There are multiple parameters that control what data is used to create a datasource:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [percentBegin] } \n\
        \            \n\
        \             Use [percentBegin] to indicate the beginning of the range of the data used \
         to create the Datasource. If you do not include [percentBegin] and [percentEnd], Amazon \
         ML includes all of the data when creating the datasource.\n\
        \             \n\
        \              }\n\
        \        {-   {b  [percentEnd] } \n\
        \            \n\
        \             Use [percentEnd] to indicate the end of the range of the data used to create \
         the Datasource. If you do not include [percentBegin] and [percentEnd], Amazon ML includes \
         all of the data when creating the datasource.\n\
        \             \n\
        \              }\n\
        \        {-   {b  [complement] } \n\
        \            \n\
        \             The [complement] parameter instructs Amazon ML to use the data that is not \
         included in the range of [percentBegin] to [percentEnd] to create a datasource. The \
         [complement] parameter is useful if you need to create complementary datasources for \
         training and evaluation. To create a complementary datasource, use the same values for \
         [percentBegin] and [percentEnd], along with the [complement] parameter.\n\
        \             \n\
        \              For example, the following two datasources do not share any data, and can \
         be used to train and evaluate a model. The first datasource has 25 percent of the data, \
         and the second one has 75 percent of the data.\n\
        \              \n\
        \               Datasource for evaluation: [{\"splitting\":{\"percentBegin\":0, \
         \"percentEnd\":25}}] \n\
        \               \n\
        \                Datasource for training: [{\"splitting\":{\"percentBegin\":0, \
         \"percentEnd\":25, \"complement\":\"true\"}}] \n\
        \                \n\
        \                 }\n\
        \        {-   {b  [strategy] } \n\
        \            \n\
        \             To change how Amazon ML splits the data for a datasource, use the [strategy] \
         parameter.\n\
        \             \n\
        \              The default value for the [strategy] parameter is [sequential], meaning \
         that Amazon ML takes all of the data records between the [percentBegin] and [percentEnd] \
         parameters for the datasource, in the order that the records appear in the input data.\n\
        \              \n\
        \               The following two [DataRearrangement] lines are examples of sequentially \
         ordered training and evaluation datasources:\n\
        \               \n\
        \                Datasource for evaluation: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"sequential\"}}] \n\
        \                \n\
        \                 Datasource for training: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"sequential\", \"complement\":\"true\"}}] \n\
        \                 \n\
        \                  To randomly split the input data into the proportions indicated by the \
         percentBegin and percentEnd parameters, set the [strategy] parameter to [random] and \
         provide a string that is used as the seed value for the random data splitting (for \
         example, you can use the S3 path to your data as the random seed string). If you choose \
         the random split strategy, Amazon ML assigns each row of data a pseudo-random number \
         between 0 and 100, and then selects the rows that have an assigned number between \
         [percentBegin] and [percentEnd]. Pseudo-random numbers are assigned using both the input \
         seed string value and the byte offset as a seed, so changing the data results in a \
         different split. Any existing ordering is preserved. The random splitting strategy \
         ensures that variables in the training and evaluation data are distributed similarly. It \
         is useful in the cases where the input data may have an implicit sort order, which would \
         otherwise result in training and evaluation datasources containing non-similar data \
         records.\n\
        \                  \n\
        \                   The following two [DataRearrangement] lines are examples of \
         non-sequentially ordered training and evaluation datasources:\n\
        \                   \n\
        \                    Datasource for evaluation: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"random\", \
         \"randomSeed\"=\"s3://my_s3_path/bucket/file.csv\"}}] \n\
        \                    \n\
        \                     Datasource for training: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"random\", \
         \"randomSeed\"=\"s3://my_s3_path/bucket/file.csv\", \"complement\":\"true\"}}] \n\
        \                     \n\
        \                      }\n\
        \        }\n\
        \  "]
  data_schema : data_schema option;
      [@ocaml.doc
        "A JSON string that represents the schema for an Amazon Redshift [DataSource]. The \
         [DataSchema] defines the structure of the observation data in the data file(s) referenced \
         in the [DataSource].\n\n\
        \ A [DataSchema] is not required if you specify a [DataSchemaUri].\n\
        \ \n\
        \  Define your [DataSchema] as a series of key-value pairs. [attributes] and \
         [excludedVariableNames] have an array of key-value pairs for their value. Use the \
         following format to define your [DataSchema].\n\
        \  \n\
        \   \\{ \"version\": \"1.0\",\n\
        \   \n\
        \    \"recordAnnotationFieldName\": \"F1\",\n\
        \    \n\
        \     \"recordWeightFieldName\": \"F2\",\n\
        \     \n\
        \      \"targetFieldName\": \"F3\",\n\
        \      \n\
        \       \"dataFormat\": \"CSV\",\n\
        \       \n\
        \        \"dataFileContainsHeader\": true,\n\
        \        \n\
        \         \"attributes\": \\[\n\
        \         \n\
        \          \\{ \"fieldName\": \"F1\", \"fieldType\": \"TEXT\" \\}, \\{ \"fieldName\": \
         \"F2\", \"fieldType\": \"NUMERIC\" \\}, \\{ \"fieldName\": \"F3\", \"fieldType\": \
         \"CATEGORICAL\" \\}, \\{ \"fieldName\": \"F4\", \"fieldType\": \"NUMERIC\" \\}, \\{ \
         \"fieldName\": \"F5\", \"fieldType\": \"CATEGORICAL\" \\}, \\{ \"fieldName\": \"F6\", \
         \"fieldType\": \"TEXT\" \\}, \\{ \"fieldName\": \"F7\", \"fieldType\": \
         \"WEIGHTED_INT_SEQUENCE\" \\}, \\{ \"fieldName\": \"F8\", \"fieldType\": \
         \"WEIGHTED_STRING_SEQUENCE\" \\} \\],\n\
        \          \n\
        \           \"excludedVariableNames\": \\[ \"F6\" \\] \\}\n\
        \           "]
  data_schema_uri : s3_url option;
      [@ocaml.doc "Describes the schema location for an Amazon Redshift [DataSource].\n"]
}
[@@ocaml.doc "Describes the data specification of an Amazon Redshift [DataSource].\n"]

type nonrec create_data_source_from_redshift_input = {
  data_source_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [DataSource].\n"]
  data_source_name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [DataSource]. \n"]
  data_spec : redshift_data_spec;
      [@ocaml.doc
        "The data specification of an Amazon Redshift [DataSource]:\n\n\
        \ {ul\n\
        \       {-  DatabaseInformation -\n\
        \           \n\
        \            {ul\n\
        \                  {-   [DatabaseName] - The name of the Amazon Redshift database.\n\
        \                      \n\
        \                       }\n\
        \                  {-   [ ClusterIdentifier] - The unique ID for the Amazon Redshift \
         cluster.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  DatabaseCredentials - The AWS Identity and Access Management (IAM) credentials \
         that are used to connect to the Amazon Redshift database.\n\
        \           \n\
        \            }\n\
        \       {-  SelectSqlQuery - The query that is used to retrieve the observation data for \
         the [Datasource].\n\
        \           \n\
        \            }\n\
        \       {-  S3StagingLocation - The Amazon Simple Storage Service (Amazon S3) location for \
         staging Amazon Redshift data. The data retrieved from Amazon Redshift using the \
         [SelectSqlQuery] query is stored in this location.\n\
        \           \n\
        \            }\n\
        \       {-  DataSchemaUri - The Amazon S3 location of the [DataSchema].\n\
        \           \n\
        \            }\n\
        \       {-  DataSchema - A JSON string representing the schema. This is not required if \
         [DataSchemaUri] is specified. \n\
        \           \n\
        \            }\n\
        \       {-  DataRearrangement - A JSON string that represents the splitting and \
         rearrangement requirements for the [DataSource].\n\
        \           \n\
        \             Sample - [ \
         \"{\\\"splitting\\\":{\\\"percentBegin\\\":10,\\\"percentEnd\\\":60}}\"] \n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "A fully specified role Amazon Resource Name (ARN). Amazon ML assumes the role on behalf \
         of the user to create the following:\n\n\
        \ {ul\n\
        \       {-  A security group to allow Amazon ML to execute the [SelectSqlQuery] query on \
         an Amazon Redshift cluster\n\
        \           \n\
        \            }\n\
        \       {-  An Amazon S3 bucket policy to grant Amazon ML read/write permissions on the \
         [S3StagingLocation] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  compute_statistics : compute_statistics option;
      [@ocaml.doc
        "The compute statistics for a [DataSource]. The statistics are generated from the \
         observation data referenced by a [DataSource]. Amazon ML uses the statistics internally \
         during [MLModel] training. This parameter must be set to [true] if the [DataSource] needs \
         to be used for [MLModel] training.\n"]
}
[@@ocaml.doc ""]

type nonrec create_data_source_from_rds_output = {
  data_source_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the datasource. This value should be \
         identical to the value of the [DataSourceID] in the request. \n"]
}
[@@ocaml.doc
  " Represents the output of a [CreateDataSourceFromRDS] operation, and is an acknowledgement that \
   Amazon ML received the request.\n\n\
  \ The [CreateDataSourceFromRDS]> operation is asynchronous. You can poll for updates by using \
   the [GetBatchPrediction] operation and checking the [Status] parameter. You can inspect the \
   [Message] when [Status] shows up as [FAILED]. You can also check the progress of the copy \
   operation by going to the [DataPipeline] console and looking up the pipeline using the \
   [pipelineId ] from the describe call.\n\
  \ "]

type nonrec edp_security_group_id = string [@@ocaml.doc ""]

type nonrec edp_security_group_ids = edp_security_group_id list [@@ocaml.doc ""]

type nonrec edp_subnet_id = string [@@ocaml.doc ""]

type nonrec rds_database_password = string [@@ocaml.doc ""]

type nonrec rds_database_credentials = {
  username : rds_database_username; [@ocaml.doc ""]
  password : rds_database_password; [@ocaml.doc ""]
}
[@@ocaml.doc "The database credentials to connect to a database on an RDS DB instance.\n"]

type nonrec rds_data_spec = {
  database_information : rds_database;
      [@ocaml.doc
        "Describes the [DatabaseName] and [InstanceIdentifier] of an Amazon RDS database.\n"]
  select_sql_query : rds_select_sql_query;
      [@ocaml.doc "The query that is used to retrieve the observation data for the [DataSource].\n"]
  database_credentials : rds_database_credentials;
      [@ocaml.doc
        "The AWS Identity and Access Management (IAM) credentials that are used connect to the \
         Amazon RDS database.\n"]
  s3_staging_location : s3_url;
      [@ocaml.doc
        "The Amazon S3 location for staging Amazon RDS data. The data retrieved from Amazon RDS \
         using [SelectSqlQuery] is stored in this location.\n"]
  data_rearrangement : data_rearrangement option;
      [@ocaml.doc
        "A JSON string that represents the splitting and rearrangement processing to be applied to \
         a [DataSource]. If the [DataRearrangement] parameter is not provided, all of the input \
         data is used to create the [Datasource].\n\n\
        \ There are multiple parameters that control what data is used to create a datasource:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [percentBegin] } \n\
        \            \n\
        \             Use [percentBegin] to indicate the beginning of the range of the data used \
         to create the Datasource. If you do not include [percentBegin] and [percentEnd], Amazon \
         ML includes all of the data when creating the datasource.\n\
        \             \n\
        \              }\n\
        \        {-   {b  [percentEnd] } \n\
        \            \n\
        \             Use [percentEnd] to indicate the end of the range of the data used to create \
         the Datasource. If you do not include [percentBegin] and [percentEnd], Amazon ML includes \
         all of the data when creating the datasource.\n\
        \             \n\
        \              }\n\
        \        {-   {b  [complement] } \n\
        \            \n\
        \             The [complement] parameter instructs Amazon ML to use the data that is not \
         included in the range of [percentBegin] to [percentEnd] to create a datasource. The \
         [complement] parameter is useful if you need to create complementary datasources for \
         training and evaluation. To create a complementary datasource, use the same values for \
         [percentBegin] and [percentEnd], along with the [complement] parameter.\n\
        \             \n\
        \              For example, the following two datasources do not share any data, and can \
         be used to train and evaluate a model. The first datasource has 25 percent of the data, \
         and the second one has 75 percent of the data.\n\
        \              \n\
        \               Datasource for evaluation: [{\"splitting\":{\"percentBegin\":0, \
         \"percentEnd\":25}}] \n\
        \               \n\
        \                Datasource for training: [{\"splitting\":{\"percentBegin\":0, \
         \"percentEnd\":25, \"complement\":\"true\"}}] \n\
        \                \n\
        \                 }\n\
        \        {-   {b  [strategy] } \n\
        \            \n\
        \             To change how Amazon ML splits the data for a datasource, use the [strategy] \
         parameter.\n\
        \             \n\
        \              The default value for the [strategy] parameter is [sequential], meaning \
         that Amazon ML takes all of the data records between the [percentBegin] and [percentEnd] \
         parameters for the datasource, in the order that the records appear in the input data.\n\
        \              \n\
        \               The following two [DataRearrangement] lines are examples of sequentially \
         ordered training and evaluation datasources:\n\
        \               \n\
        \                Datasource for evaluation: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"sequential\"}}] \n\
        \                \n\
        \                 Datasource for training: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"sequential\", \"complement\":\"true\"}}] \n\
        \                 \n\
        \                  To randomly split the input data into the proportions indicated by the \
         percentBegin and percentEnd parameters, set the [strategy] parameter to [random] and \
         provide a string that is used as the seed value for the random data splitting (for \
         example, you can use the S3 path to your data as the random seed string). If you choose \
         the random split strategy, Amazon ML assigns each row of data a pseudo-random number \
         between 0 and 100, and then selects the rows that have an assigned number between \
         [percentBegin] and [percentEnd]. Pseudo-random numbers are assigned using both the input \
         seed string value and the byte offset as a seed, so changing the data results in a \
         different split. Any existing ordering is preserved. The random splitting strategy \
         ensures that variables in the training and evaluation data are distributed similarly. It \
         is useful in the cases where the input data may have an implicit sort order, which would \
         otherwise result in training and evaluation datasources containing non-similar data \
         records.\n\
        \                  \n\
        \                   The following two [DataRearrangement] lines are examples of \
         non-sequentially ordered training and evaluation datasources:\n\
        \                   \n\
        \                    Datasource for evaluation: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"random\", \
         \"randomSeed\"=\"s3://my_s3_path/bucket/file.csv\"}}] \n\
        \                    \n\
        \                     Datasource for training: [{\"splitting\":{\"percentBegin\":70, \
         \"percentEnd\":100, \"strategy\":\"random\", \
         \"randomSeed\"=\"s3://my_s3_path/bucket/file.csv\", \"complement\":\"true\"}}] \n\
        \                     \n\
        \                      }\n\
        \        }\n\
        \  "]
  data_schema : data_schema option;
      [@ocaml.doc
        "A JSON string that represents the schema for an Amazon RDS [DataSource]. The [DataSchema] \
         defines the structure of the observation data in the data file(s) referenced in the \
         [DataSource].\n\n\
        \ A [DataSchema] is not required if you specify a [DataSchemaUri] \n\
        \ \n\
        \  Define your [DataSchema] as a series of key-value pairs. [attributes] and \
         [excludedVariableNames] have an array of key-value pairs for their value. Use the \
         following format to define your [DataSchema].\n\
        \  \n\
        \   \\{ \"version\": \"1.0\",\n\
        \   \n\
        \    \"recordAnnotationFieldName\": \"F1\",\n\
        \    \n\
        \     \"recordWeightFieldName\": \"F2\",\n\
        \     \n\
        \      \"targetFieldName\": \"F3\",\n\
        \      \n\
        \       \"dataFormat\": \"CSV\",\n\
        \       \n\
        \        \"dataFileContainsHeader\": true,\n\
        \        \n\
        \         \"attributes\": \\[\n\
        \         \n\
        \          \\{ \"fieldName\": \"F1\", \"fieldType\": \"TEXT\" \\}, \\{ \"fieldName\": \
         \"F2\", \"fieldType\": \"NUMERIC\" \\}, \\{ \"fieldName\": \"F3\", \"fieldType\": \
         \"CATEGORICAL\" \\}, \\{ \"fieldName\": \"F4\", \"fieldType\": \"NUMERIC\" \\}, \\{ \
         \"fieldName\": \"F5\", \"fieldType\": \"CATEGORICAL\" \\}, \\{ \"fieldName\": \"F6\", \
         \"fieldType\": \"TEXT\" \\}, \\{ \"fieldName\": \"F7\", \"fieldType\": \
         \"WEIGHTED_INT_SEQUENCE\" \\}, \\{ \"fieldName\": \"F8\", \"fieldType\": \
         \"WEIGHTED_STRING_SEQUENCE\" \\} \\],\n\
        \          \n\
        \           \"excludedVariableNames\": \\[ \"F6\" \\] \\}\n\
        \           "]
  data_schema_uri : s3_url option; [@ocaml.doc "The Amazon S3 location of the [DataSchema]. \n"]
  resource_role : edp_resource_role;
      [@ocaml.doc
        "The role (DataPipelineDefaultResourceRole) assumed by an Amazon Elastic Compute Cloud \
         (Amazon EC2) instance to carry out the copy operation from Amazon RDS to an Amazon S3 \
         task. For more information, see \
         {{:https://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html}Role \
         templates} for data pipelines.\n"]
  service_role : edp_service_role;
      [@ocaml.doc
        "The role (DataPipelineDefaultRole) assumed by AWS Data Pipeline service to monitor the \
         progress of the copy task from Amazon RDS to Amazon S3. For more information, see \
         {{:https://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html}Role \
         templates} for data pipelines.\n"]
  subnet_id : edp_subnet_id;
      [@ocaml.doc
        "The subnet ID to be used to access a VPC-based RDS DB instance. This attribute is used by \
         Data Pipeline to carry out the copy task from Amazon RDS to Amazon S3.\n"]
  security_group_ids : edp_security_group_ids;
      [@ocaml.doc
        "The security group IDs to be used to access a VPC-based RDS DB instance. Ensure that \
         there are appropriate ingress rules set up to allow access to the RDS DB instance. This \
         attribute is used by Data Pipeline to carry out the copy operation from Amazon RDS to an \
         Amazon S3 task.\n"]
}
[@@ocaml.doc
  "The data specification of an Amazon Relational Database Service (Amazon RDS) [DataSource].\n"]

type nonrec create_data_source_from_rds_input = {
  data_source_id : entity_id;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [DataSource]. Typically, an Amazon \
         Resource Number (ARN) becomes the ID for a [DataSource].\n"]
  data_source_name : entity_name option;
      [@ocaml.doc "A user-supplied name or description of the [DataSource].\n"]
  rds_data : rds_data_spec;
      [@ocaml.doc
        "The data specification of an Amazon RDS [DataSource]:\n\n\
        \ {ul\n\
        \       {-  DatabaseInformation -\n\
        \           \n\
        \            {ul\n\
        \                  {-   [DatabaseName] - The name of the Amazon RDS database.\n\
        \                      \n\
        \                       }\n\
        \                  {-   [InstanceIdentifier ] - A unique identifier for the Amazon RDS \
         database instance.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  DatabaseCredentials - AWS Identity and Access Management (IAM) credentials \
         that are used to connect to the Amazon RDS database.\n\
        \           \n\
        \            }\n\
        \       {-  ResourceRole - A role (DataPipelineDefaultResourceRole) assumed by an EC2 \
         instance to carry out the copy task from Amazon RDS to Amazon Simple Storage Service \
         (Amazon S3). For more information, see \
         {{:https://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html}Role \
         templates} for data pipelines.\n\
        \           \n\
        \            }\n\
        \       {-  ServiceRole - A role (DataPipelineDefaultRole) assumed by the AWS Data \
         Pipeline service to monitor the progress of the copy task from Amazon RDS to Amazon S3. \
         For more information, see \
         {{:https://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html}Role \
         templates} for data pipelines.\n\
        \           \n\
        \            }\n\
        \       {-  SecurityInfo - The security information to use to access an RDS DB instance. \
         You need to set up appropriate ingress rules for the security entity IDs provided to \
         allow access to the Amazon RDS instance. Specify a \\[[SubnetId], [SecurityGroupIds]\\] \
         pair for a VPC-based RDS DB instance.\n\
        \           \n\
        \            }\n\
        \       {-  SelectSqlQuery - A query that is used to retrieve the observation data for the \
         [Datasource].\n\
        \           \n\
        \            }\n\
        \       {-  S3StagingLocation - The Amazon S3 location for staging Amazon RDS data. The \
         data retrieved from Amazon RDS using [SelectSqlQuery] is stored in this location.\n\
        \           \n\
        \            }\n\
        \       {-  DataSchemaUri - The Amazon S3 location of the [DataSchema].\n\
        \           \n\
        \            }\n\
        \       {-  DataSchema - A JSON string representing the schema. This is not required if \
         [DataSchemaUri] is specified. \n\
        \           \n\
        \            }\n\
        \       {-  DataRearrangement - A JSON string that represents the splitting and \
         rearrangement requirements for the [Datasource]. \n\
        \           \n\
        \             Sample - [ \
         \"{\\\"splitting\\\":{\\\"percentBegin\\\":10,\\\"percentEnd\\\":60}}\"] \n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The role that Amazon ML assumes on behalf of the user to create and activate a data \
         pipeline in the user's account and copy data using the [SelectSqlQuery] query from Amazon \
         RDS to Amazon S3.\n\n\
        \ \n\
        \ "]
  compute_statistics : compute_statistics option;
      [@ocaml.doc
        "The compute statistics for a [DataSource]. The statistics are generated from the \
         observation data referenced by a [DataSource]. Amazon ML uses the statistics internally \
         during [MLModel] training. This parameter must be set to [true] if the DataSource needs \
         to be used for [MLModel] training. \n"]
}
[@@ocaml.doc ""]

type nonrec create_batch_prediction_output = {
  batch_prediction_id : entity_id option;
      [@ocaml.doc
        "A user-supplied ID that uniquely identifies the [BatchPrediction]. This value is \
         identical to the value of the [BatchPredictionId] in the request.\n"]
}
[@@ocaml.doc
  " Represents the output of a [CreateBatchPrediction] operation, and is an acknowledgement that \
   Amazon ML received the request.\n\n\
  \ The [CreateBatchPrediction] operation is asynchronous. You can poll for status updates by \
   using the [>GetBatchPrediction] operation and checking the [Status] parameter of the result. \n\
  \ "]

type nonrec create_batch_prediction_input = {
  batch_prediction_id : entity_id;
      [@ocaml.doc "A user-supplied ID that uniquely identifies the [BatchPrediction].\n"]
  batch_prediction_name : entity_name option;
      [@ocaml.doc
        "A user-supplied name or description of the [BatchPrediction]. [BatchPredictionName] can \
         only use the UTF-8 character set.\n"]
  ml_model_id : entity_id;
      [@ocaml.doc
        "The ID of the [MLModel] that will generate predictions for the group of observations. \n"]
  batch_prediction_data_source_id : entity_id;
      [@ocaml.doc
        "The ID of the [DataSource] that points to the group of observations to predict.\n"]
  output_uri : s3_url;
      [@ocaml.doc
        "The location of an Amazon Simple Storage Service (Amazon S3) bucket or directory to store \
         the batch prediction results. The following substrings are not allowed in the [s3 key] \
         portion of the [outputURI] field: ':', '//', '/./', '/../'.\n\n\
        \ Amazon ML needs permissions to store and retrieve the logs on your behalf. For \
         information about how to set permissions, see the \
         {{:https://docs.aws.amazon.com/machine-learning/latest/dg}Amazon Machine Learning \
         Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc ""]
