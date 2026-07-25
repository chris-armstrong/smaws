open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let tag_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : tag_limit_exceeded_exception)

let error_code_of_yojson = int_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
   }
    : resource_not_found_exception)

let invalid_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_tag_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
   }
    : invalid_input_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
   }
    : internal_server_exception)

let taggable_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BatchPrediction" -> BATCH_PREDICTION
    | `String "DataSource" -> DATASOURCE
    | `String "Evaluation" -> EVALUATION
    | `String "MLModel" -> ML_MODEL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TaggableResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "TaggableResourceType")
     : taggable_resource_type)
    : taggable_resource_type)

let entity_id_of_yojson = string_of_yojson

let add_tags_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = option_of_yojson (value_for_key entity_id_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key taggable_resource_type_of_yojson "ResourceType") _list path;
   }
    : add_tags_output)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let add_tags_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_id = value_for_key entity_id_of_yojson "ResourceId" _list path;
     resource_type = value_for_key taggable_resource_type_of_yojson "ResourceType" _list path;
   }
    : add_tags_input)

let algorithm_of_yojson (tree : t) path =
  ((match tree with
    | `String "sgd" -> SGD
    | `String value -> raise (deserialize_unknown_enum_value_error path "Algorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "Algorithm")
     : algorithm)
    : algorithm)

let update_ml_model_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path }
    : update_ml_model_output)

let score_threshold_of_yojson = float_of_yojson
let entity_name_of_yojson = string_of_yojson

let update_ml_model_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path;
     ml_model_name = option_of_yojson (value_for_key entity_name_of_yojson "MLModelName") _list path;
     score_threshold =
       option_of_yojson (value_for_key score_threshold_of_yojson "ScoreThreshold") _list path;
   }
    : update_ml_model_input)

let update_evaluation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_id = option_of_yojson (value_for_key entity_id_of_yojson "EvaluationId") _list path;
   }
    : update_evaluation_output)

let update_evaluation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_id = value_for_key entity_id_of_yojson "EvaluationId" _list path;
     evaluation_name = value_for_key entity_name_of_yojson "EvaluationName" _list path;
   }
    : update_evaluation_input)

let update_data_source_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = option_of_yojson (value_for_key entity_id_of_yojson "DataSourceId") _list path;
   }
    : update_data_source_output)

let update_data_source_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = value_for_key entity_id_of_yojson "DataSourceId" _list path;
     data_source_name = value_for_key entity_name_of_yojson "DataSourceName" _list path;
   }
    : update_data_source_input)

let update_batch_prediction_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_prediction_id =
       option_of_yojson (value_for_key entity_id_of_yojson "BatchPredictionId") _list path;
   }
    : update_batch_prediction_output)

let update_batch_prediction_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_prediction_id = value_for_key entity_id_of_yojson "BatchPredictionId" _list path;
     batch_prediction_name = value_for_key entity_name_of_yojson "BatchPredictionName" _list path;
   }
    : update_batch_prediction_input)

let predictor_not_mounted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : predictor_not_mounted_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
   }
    : limit_exceeded_exception)

let details_value_of_yojson = string_of_yojson

let details_attributes_of_yojson (tree : t) path =
  ((match tree with
    | `String "PredictiveModelType" -> PREDICTIVE_MODEL_TYPE
    | `String "Algorithm" -> ALGORITHM
    | `String value -> raise (deserialize_unknown_enum_value_error path "DetailsAttributes" value)
    | _ -> raise (deserialize_wrong_type_error path "DetailsAttributes")
     : details_attributes)
    : details_attributes)

let details_map_of_yojson tree path =
  map_of_yojson details_attributes_of_yojson details_value_of_yojson tree path

let score_value_of_yojson = float_of_yojson
let label_of_yojson = string_of_yojson

let score_value_per_label_map_of_yojson tree path =
  map_of_yojson label_of_yojson score_value_of_yojson tree path

let float_label_of_yojson = float_of_yojson

let prediction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predicted_label = option_of_yojson (value_for_key label_of_yojson "predictedLabel") _list path;
     predicted_value =
       option_of_yojson (value_for_key float_label_of_yojson "predictedValue") _list path;
     predicted_scores =
       option_of_yojson
         (value_for_key score_value_per_label_map_of_yojson "predictedScores")
         _list path;
     details = option_of_yojson (value_for_key details_map_of_yojson "details") _list path;
   }
    : prediction)

let predict_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ prediction = option_of_yojson (value_for_key prediction_of_yojson "Prediction") _list path }
    : predict_output)

let vip_ur_l_of_yojson = string_of_yojson
let variable_value_of_yojson = string_of_yojson
let variable_name_of_yojson = string_of_yojson

let record_of_yojson tree path =
  map_of_yojson variable_name_of_yojson variable_value_of_yojson tree path

let predict_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path;
     record = value_for_key record_of_yojson "Record" _list path;
     predict_endpoint = value_for_key vip_ur_l_of_yojson "PredictEndpoint" _list path;
   }
    : predict_input)

let data_schema_of_yojson = string_of_yojson
let recipe_of_yojson = string_of_yojson
let epoch_time_of_yojson = timestamp_epoch_seconds_of_yojson
let long_type_of_yojson = long_of_yojson
let message_of_yojson = string_of_yojson
let presigned_s3_url_of_yojson = string_of_yojson

let ml_model_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGRESSION" -> REGRESSION
    | `String "BINARY" -> BINARY
    | `String "MULTICLASS" -> MULTICLASS
    | `String value -> raise (deserialize_unknown_enum_value_error path "MLModelType" value)
    | _ -> raise (deserialize_wrong_type_error path "MLModelType")
     : ml_model_type)
    : ml_model_type)

let s3_url_of_yojson = string_of_yojson
let string_type_of_yojson = string_of_yojson

let training_parameters_of_yojson tree path =
  map_of_yojson string_type_of_yojson string_type_of_yojson tree path

let realtime_endpoint_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "READY" -> READY
    | `String "UPDATING" -> UPDATING
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RealtimeEndpointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RealtimeEndpointStatus")
     : realtime_endpoint_status)
    : realtime_endpoint_status)

let integer_type_of_yojson = int_of_yojson

let realtime_endpoint_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     peak_requests_per_second =
       option_of_yojson (value_for_key integer_type_of_yojson "PeakRequestsPerSecond") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     endpoint_url = option_of_yojson (value_for_key vip_ur_l_of_yojson "EndpointUrl") _list path;
     endpoint_status =
       option_of_yojson
         (value_for_key realtime_endpoint_status_of_yojson "EndpointStatus")
         _list path;
   }
    : realtime_endpoint_info)

let entity_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "INPROGRESS" -> INPROGRESS
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "DELETED" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityStatus")
     : entity_status)
    : entity_status)

let ml_model_name_of_yojson = string_of_yojson
let aws_user_arn_of_yojson = string_of_yojson

let get_ml_model_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     training_data_source_id =
       option_of_yojson (value_for_key entity_id_of_yojson "TrainingDataSourceId") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     name = option_of_yojson (value_for_key ml_model_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     size_in_bytes = option_of_yojson (value_for_key long_type_of_yojson "SizeInBytes") _list path;
     endpoint_info =
       option_of_yojson (value_for_key realtime_endpoint_info_of_yojson "EndpointInfo") _list path;
     training_parameters =
       option_of_yojson
         (value_for_key training_parameters_of_yojson "TrainingParameters")
         _list path;
     input_data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "InputDataLocationS3") _list path;
     ml_model_type =
       option_of_yojson (value_for_key ml_model_type_of_yojson "MLModelType") _list path;
     score_threshold =
       option_of_yojson (value_for_key score_threshold_of_yojson "ScoreThreshold") _list path;
     score_threshold_last_updated_at =
       option_of_yojson
         (value_for_key epoch_time_of_yojson "ScoreThresholdLastUpdatedAt")
         _list path;
     log_uri = option_of_yojson (value_for_key presigned_s3_url_of_yojson "LogUri") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
     recipe = option_of_yojson (value_for_key recipe_of_yojson "Recipe") _list path;
     schema = option_of_yojson (value_for_key data_schema_of_yojson "Schema") _list path;
   }
    : get_ml_model_output)

let verbose_of_yojson = bool_of_yojson

let get_ml_model_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path;
     verbose = option_of_yojson (value_for_key verbose_of_yojson "Verbose") _list path;
   }
    : get_ml_model_input)

let performance_metrics_property_value_of_yojson = string_of_yojson
let performance_metrics_property_key_of_yojson = string_of_yojson

let performance_metrics_properties_of_yojson tree path =
  map_of_yojson performance_metrics_property_key_of_yojson
    performance_metrics_property_value_of_yojson tree path

let performance_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     properties =
       option_of_yojson
         (value_for_key performance_metrics_properties_of_yojson "Properties")
         _list path;
   }
    : performance_metrics)

let get_evaluation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_id = option_of_yojson (value_for_key entity_id_of_yojson "EvaluationId") _list path;
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     evaluation_data_source_id =
       option_of_yojson (value_for_key entity_id_of_yojson "EvaluationDataSourceId") _list path;
     input_data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "InputDataLocationS3") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     performance_metrics =
       option_of_yojson
         (value_for_key performance_metrics_of_yojson "PerformanceMetrics")
         _list path;
     log_uri = option_of_yojson (value_for_key presigned_s3_url_of_yojson "LogUri") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
   }
    : get_evaluation_output)

let get_evaluation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ evaluation_id = value_for_key entity_id_of_yojson "EvaluationId" _list path }
    : get_evaluation_input)

let compute_statistics_of_yojson = bool_of_yojson
let role_ar_n_of_yojson = string_of_yojson
let edp_pipeline_id_of_yojson = string_of_yojson
let edp_service_role_of_yojson = string_of_yojson
let edp_resource_role_of_yojson = string_of_yojson
let rds_select_sql_query_of_yojson = string_of_yojson
let rds_database_username_of_yojson = string_of_yojson
let rds_database_name_of_yojson = string_of_yojson
let rds_instance_identifier_of_yojson = string_of_yojson

let rds_database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_identifier =
       value_for_key rds_instance_identifier_of_yojson "InstanceIdentifier" _list path;
     database_name = value_for_key rds_database_name_of_yojson "DatabaseName" _list path;
   }
    : rds_database)

let rds_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database = option_of_yojson (value_for_key rds_database_of_yojson "Database") _list path;
     database_user_name =
       option_of_yojson
         (value_for_key rds_database_username_of_yojson "DatabaseUserName")
         _list path;
     select_sql_query =
       option_of_yojson (value_for_key rds_select_sql_query_of_yojson "SelectSqlQuery") _list path;
     resource_role =
       option_of_yojson (value_for_key edp_resource_role_of_yojson "ResourceRole") _list path;
     service_role =
       option_of_yojson (value_for_key edp_service_role_of_yojson "ServiceRole") _list path;
     data_pipeline_id =
       option_of_yojson (value_for_key edp_pipeline_id_of_yojson "DataPipelineId") _list path;
   }
    : rds_metadata)

let redshift_select_sql_query_of_yojson = string_of_yojson
let redshift_database_username_of_yojson = string_of_yojson
let redshift_cluster_identifier_of_yojson = string_of_yojson
let redshift_database_name_of_yojson = string_of_yojson

let redshift_database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_name = value_for_key redshift_database_name_of_yojson "DatabaseName" _list path;
     cluster_identifier =
       value_for_key redshift_cluster_identifier_of_yojson "ClusterIdentifier" _list path;
   }
    : redshift_database)

let redshift_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redshift_database =
       option_of_yojson (value_for_key redshift_database_of_yojson "RedshiftDatabase") _list path;
     database_user_name =
       option_of_yojson
         (value_for_key redshift_database_username_of_yojson "DatabaseUserName")
         _list path;
     select_sql_query =
       option_of_yojson
         (value_for_key redshift_select_sql_query_of_yojson "SelectSqlQuery")
         _list path;
   }
    : redshift_metadata)

let data_rearrangement_of_yojson = string_of_yojson

let get_data_source_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = option_of_yojson (value_for_key entity_id_of_yojson "DataSourceId") _list path;
     data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "DataLocationS3") _list path;
     data_rearrangement =
       option_of_yojson (value_for_key data_rearrangement_of_yojson "DataRearrangement") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     data_size_in_bytes =
       option_of_yojson (value_for_key long_type_of_yojson "DataSizeInBytes") _list path;
     number_of_files =
       option_of_yojson (value_for_key long_type_of_yojson "NumberOfFiles") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     log_uri = option_of_yojson (value_for_key presigned_s3_url_of_yojson "LogUri") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     redshift_metadata =
       option_of_yojson (value_for_key redshift_metadata_of_yojson "RedshiftMetadata") _list path;
     rds_metadata = option_of_yojson (value_for_key rds_metadata_of_yojson "RDSMetadata") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     compute_statistics =
       option_of_yojson (value_for_key compute_statistics_of_yojson "ComputeStatistics") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
     data_source_schema =
       option_of_yojson (value_for_key data_schema_of_yojson "DataSourceSchema") _list path;
   }
    : get_data_source_output)

let get_data_source_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = value_for_key entity_id_of_yojson "DataSourceId" _list path;
     verbose = option_of_yojson (value_for_key verbose_of_yojson "Verbose") _list path;
   }
    : get_data_source_input)

let get_batch_prediction_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_prediction_id =
       option_of_yojson (value_for_key entity_id_of_yojson "BatchPredictionId") _list path;
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     batch_prediction_data_source_id =
       option_of_yojson (value_for_key entity_id_of_yojson "BatchPredictionDataSourceId") _list path;
     input_data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "InputDataLocationS3") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     output_uri = option_of_yojson (value_for_key s3_url_of_yojson "OutputUri") _list path;
     log_uri = option_of_yojson (value_for_key presigned_s3_url_of_yojson "LogUri") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
     total_record_count =
       option_of_yojson (value_for_key long_type_of_yojson "TotalRecordCount") _list path;
     invalid_record_count =
       option_of_yojson (value_for_key long_type_of_yojson "InvalidRecordCount") _list path;
   }
    : get_batch_prediction_output)

let get_batch_prediction_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ batch_prediction_id = value_for_key entity_id_of_yojson "BatchPredictionId" _list path }
    : get_batch_prediction_input)

let describe_tags_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = option_of_yojson (value_for_key entity_id_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key taggable_resource_type_of_yojson "ResourceType") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : describe_tags_output)

let describe_tags_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = value_for_key entity_id_of_yojson "ResourceId" _list path;
     resource_type = value_for_key taggable_resource_type_of_yojson "ResourceType" _list path;
   }
    : describe_tags_input)

let ml_model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     training_data_source_id =
       option_of_yojson (value_for_key entity_id_of_yojson "TrainingDataSourceId") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     name = option_of_yojson (value_for_key ml_model_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     size_in_bytes = option_of_yojson (value_for_key long_type_of_yojson "SizeInBytes") _list path;
     endpoint_info =
       option_of_yojson (value_for_key realtime_endpoint_info_of_yojson "EndpointInfo") _list path;
     training_parameters =
       option_of_yojson
         (value_for_key training_parameters_of_yojson "TrainingParameters")
         _list path;
     input_data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "InputDataLocationS3") _list path;
     algorithm = option_of_yojson (value_for_key algorithm_of_yojson "Algorithm") _list path;
     ml_model_type =
       option_of_yojson (value_for_key ml_model_type_of_yojson "MLModelType") _list path;
     score_threshold =
       option_of_yojson (value_for_key score_threshold_of_yojson "ScoreThreshold") _list path;
     score_threshold_last_updated_at =
       option_of_yojson
         (value_for_key epoch_time_of_yojson "ScoreThresholdLastUpdatedAt")
         _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
   }
    : ml_model)

let ml_models_of_yojson tree path = list_of_yojson ml_model_of_yojson tree path

let describe_ml_models_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results = option_of_yojson (value_for_key ml_models_of_yojson "Results") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
   }
    : describe_ml_models_output)

let page_limit_of_yojson = int_of_yojson

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "asc" -> ASC
    | `String "dsc" -> DSC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let comparator_value_of_yojson = string_of_yojson

let ml_model_filter_variable_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedAt" -> CREATED_AT
    | `String "LastUpdatedAt" -> LAST_UPDATED_AT
    | `String "Status" -> STATUS
    | `String "Name" -> NAME
    | `String "IAMUser" -> IAM_USER
    | `String "TrainingDataSourceId" -> TRAINING_DATASOURCE_ID
    | `String "RealtimeEndpointStatus" -> REAL_TIME_ENDPOINT_STATUS
    | `String "MLModelType" -> ML_MODEL_TYPE
    | `String "Algorithm" -> ALGORITHM
    | `String "TrainingDataURI" -> TRAINING_DATA_URI
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MLModelFilterVariable" value)
    | _ -> raise (deserialize_wrong_type_error path "MLModelFilterVariable")
     : ml_model_filter_variable)
    : ml_model_filter_variable)

let describe_ml_models_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_variable =
       option_of_yojson
         (value_for_key ml_model_filter_variable_of_yojson "FilterVariable")
         _list path;
     e_q = option_of_yojson (value_for_key comparator_value_of_yojson "EQ") _list path;
     g_t = option_of_yojson (value_for_key comparator_value_of_yojson "GT") _list path;
     l_t = option_of_yojson (value_for_key comparator_value_of_yojson "LT") _list path;
     g_e = option_of_yojson (value_for_key comparator_value_of_yojson "GE") _list path;
     l_e = option_of_yojson (value_for_key comparator_value_of_yojson "LE") _list path;
     n_e = option_of_yojson (value_for_key comparator_value_of_yojson "NE") _list path;
     prefix = option_of_yojson (value_for_key comparator_value_of_yojson "Prefix") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list path;
   }
    : describe_ml_models_input)

let evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_id = option_of_yojson (value_for_key entity_id_of_yojson "EvaluationId") _list path;
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     evaluation_data_source_id =
       option_of_yojson (value_for_key entity_id_of_yojson "EvaluationDataSourceId") _list path;
     input_data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "InputDataLocationS3") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     performance_metrics =
       option_of_yojson
         (value_for_key performance_metrics_of_yojson "PerformanceMetrics")
         _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
   }
    : evaluation)

let evaluations_of_yojson tree path = list_of_yojson evaluation_of_yojson tree path

let describe_evaluations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results = option_of_yojson (value_for_key evaluations_of_yojson "Results") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
   }
    : describe_evaluations_output)

let evaluation_filter_variable_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedAt" -> CREATED_AT
    | `String "LastUpdatedAt" -> LAST_UPDATED_AT
    | `String "Status" -> STATUS
    | `String "Name" -> NAME
    | `String "IAMUser" -> IAM_USER
    | `String "MLModelId" -> ML_MODEL_ID
    | `String "DataSourceId" -> DATASOURCE_ID
    | `String "DataURI" -> DATA_URI
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EvaluationFilterVariable" value)
    | _ -> raise (deserialize_wrong_type_error path "EvaluationFilterVariable")
     : evaluation_filter_variable)
    : evaluation_filter_variable)

let describe_evaluations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_variable =
       option_of_yojson
         (value_for_key evaluation_filter_variable_of_yojson "FilterVariable")
         _list path;
     e_q = option_of_yojson (value_for_key comparator_value_of_yojson "EQ") _list path;
     g_t = option_of_yojson (value_for_key comparator_value_of_yojson "GT") _list path;
     l_t = option_of_yojson (value_for_key comparator_value_of_yojson "LT") _list path;
     g_e = option_of_yojson (value_for_key comparator_value_of_yojson "GE") _list path;
     l_e = option_of_yojson (value_for_key comparator_value_of_yojson "LE") _list path;
     n_e = option_of_yojson (value_for_key comparator_value_of_yojson "NE") _list path;
     prefix = option_of_yojson (value_for_key comparator_value_of_yojson "Prefix") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list path;
   }
    : describe_evaluations_input)

let data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = option_of_yojson (value_for_key entity_id_of_yojson "DataSourceId") _list path;
     data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "DataLocationS3") _list path;
     data_rearrangement =
       option_of_yojson (value_for_key data_rearrangement_of_yojson "DataRearrangement") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     data_size_in_bytes =
       option_of_yojson (value_for_key long_type_of_yojson "DataSizeInBytes") _list path;
     number_of_files =
       option_of_yojson (value_for_key long_type_of_yojson "NumberOfFiles") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     redshift_metadata =
       option_of_yojson (value_for_key redshift_metadata_of_yojson "RedshiftMetadata") _list path;
     rds_metadata = option_of_yojson (value_for_key rds_metadata_of_yojson "RDSMetadata") _list path;
     role_ar_n = option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list path;
     compute_statistics =
       option_of_yojson (value_for_key compute_statistics_of_yojson "ComputeStatistics") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
   }
    : data_source)

let data_sources_of_yojson tree path = list_of_yojson data_source_of_yojson tree path

let describe_data_sources_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results = option_of_yojson (value_for_key data_sources_of_yojson "Results") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
   }
    : describe_data_sources_output)

let data_source_filter_variable_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedAt" -> CREATED_AT
    | `String "LastUpdatedAt" -> LAST_UPDATED_AT
    | `String "Status" -> STATUS
    | `String "Name" -> NAME
    | `String "DataLocationS3" -> DATA_URI
    | `String "IAMUser" -> IAM_USER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataSourceFilterVariable" value)
    | _ -> raise (deserialize_wrong_type_error path "DataSourceFilterVariable")
     : data_source_filter_variable)
    : data_source_filter_variable)

let describe_data_sources_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_variable =
       option_of_yojson
         (value_for_key data_source_filter_variable_of_yojson "FilterVariable")
         _list path;
     e_q = option_of_yojson (value_for_key comparator_value_of_yojson "EQ") _list path;
     g_t = option_of_yojson (value_for_key comparator_value_of_yojson "GT") _list path;
     l_t = option_of_yojson (value_for_key comparator_value_of_yojson "LT") _list path;
     g_e = option_of_yojson (value_for_key comparator_value_of_yojson "GE") _list path;
     l_e = option_of_yojson (value_for_key comparator_value_of_yojson "LE") _list path;
     n_e = option_of_yojson (value_for_key comparator_value_of_yojson "NE") _list path;
     prefix = option_of_yojson (value_for_key comparator_value_of_yojson "Prefix") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list path;
   }
    : describe_data_sources_input)

let batch_prediction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_prediction_id =
       option_of_yojson (value_for_key entity_id_of_yojson "BatchPredictionId") _list path;
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     batch_prediction_data_source_id =
       option_of_yojson (value_for_key entity_id_of_yojson "BatchPredictionDataSourceId") _list path;
     input_data_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "InputDataLocationS3") _list path;
     created_by_iam_user =
       option_of_yojson (value_for_key aws_user_arn_of_yojson "CreatedByIamUser") _list path;
     created_at = option_of_yojson (value_for_key epoch_time_of_yojson "CreatedAt") _list path;
     last_updated_at =
       option_of_yojson (value_for_key epoch_time_of_yojson "LastUpdatedAt") _list path;
     name = option_of_yojson (value_for_key entity_name_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key entity_status_of_yojson "Status") _list path;
     output_uri = option_of_yojson (value_for_key s3_url_of_yojson "OutputUri") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     compute_time = option_of_yojson (value_for_key long_type_of_yojson "ComputeTime") _list path;
     finished_at = option_of_yojson (value_for_key epoch_time_of_yojson "FinishedAt") _list path;
     started_at = option_of_yojson (value_for_key epoch_time_of_yojson "StartedAt") _list path;
     total_record_count =
       option_of_yojson (value_for_key long_type_of_yojson "TotalRecordCount") _list path;
     invalid_record_count =
       option_of_yojson (value_for_key long_type_of_yojson "InvalidRecordCount") _list path;
   }
    : batch_prediction)

let batch_predictions_of_yojson tree path = list_of_yojson batch_prediction_of_yojson tree path

let describe_batch_predictions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     results = option_of_yojson (value_for_key batch_predictions_of_yojson "Results") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
   }
    : describe_batch_predictions_output)

let batch_prediction_filter_variable_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreatedAt" -> CREATED_AT
    | `String "LastUpdatedAt" -> LAST_UPDATED_AT
    | `String "Status" -> STATUS
    | `String "Name" -> NAME
    | `String "IAMUser" -> IAM_USER
    | `String "MLModelId" -> ML_MODEL_ID
    | `String "DataSourceId" -> DATASOURCE_ID
    | `String "DataURI" -> DATA_URI
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchPredictionFilterVariable" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchPredictionFilterVariable")
     : batch_prediction_filter_variable)
    : batch_prediction_filter_variable)

let describe_batch_predictions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_variable =
       option_of_yojson
         (value_for_key batch_prediction_filter_variable_of_yojson "FilterVariable")
         _list path;
     e_q = option_of_yojson (value_for_key comparator_value_of_yojson "EQ") _list path;
     g_t = option_of_yojson (value_for_key comparator_value_of_yojson "GT") _list path;
     l_t = option_of_yojson (value_for_key comparator_value_of_yojson "LT") _list path;
     g_e = option_of_yojson (value_for_key comparator_value_of_yojson "GE") _list path;
     l_e = option_of_yojson (value_for_key comparator_value_of_yojson "LE") _list path;
     n_e = option_of_yojson (value_for_key comparator_value_of_yojson "NE") _list path;
     prefix = option_of_yojson (value_for_key comparator_value_of_yojson "Prefix") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key page_limit_of_yojson "Limit") _list path;
   }
    : describe_batch_predictions_input)

let delete_tags_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = option_of_yojson (value_for_key entity_id_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key taggable_resource_type_of_yojson "ResourceType") _list path;
   }
    : delete_tags_output)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let delete_tags_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_id = value_for_key entity_id_of_yojson "ResourceId" _list path;
     resource_type = value_for_key taggable_resource_type_of_yojson "ResourceType" _list path;
   }
    : delete_tags_input)

let delete_realtime_endpoint_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     realtime_endpoint_info =
       option_of_yojson
         (value_for_key realtime_endpoint_info_of_yojson "RealtimeEndpointInfo")
         _list path;
   }
    : delete_realtime_endpoint_output)

let delete_realtime_endpoint_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path }
    : delete_realtime_endpoint_input)

let delete_ml_model_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path }
    : delete_ml_model_output)

let delete_ml_model_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path }
    : delete_ml_model_input)

let delete_evaluation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_id = option_of_yojson (value_for_key entity_id_of_yojson "EvaluationId") _list path;
   }
    : delete_evaluation_output)

let delete_evaluation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ evaluation_id = value_for_key entity_id_of_yojson "EvaluationId" _list path }
    : delete_evaluation_input)

let delete_data_source_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = option_of_yojson (value_for_key entity_id_of_yojson "DataSourceId") _list path;
   }
    : delete_data_source_output)

let delete_data_source_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data_source_id = value_for_key entity_id_of_yojson "DataSourceId" _list path }
    : delete_data_source_input)

let delete_batch_prediction_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_prediction_id =
       option_of_yojson (value_for_key entity_id_of_yojson "BatchPredictionId") _list path;
   }
    : delete_batch_prediction_output)

let delete_batch_prediction_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ batch_prediction_id = value_for_key entity_id_of_yojson "BatchPredictionId" _list path }
    : delete_batch_prediction_input)

let create_realtime_endpoint_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path;
     realtime_endpoint_info =
       option_of_yojson
         (value_for_key realtime_endpoint_info_of_yojson "RealtimeEndpointInfo")
         _list path;
   }
    : create_realtime_endpoint_output)

let create_realtime_endpoint_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path }
    : create_realtime_endpoint_input)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path;
     code = option_of_yojson (value_for_key error_code_of_yojson "code") _list path;
   }
    : idempotent_parameter_mismatch_exception)

let create_ml_model_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ml_model_id = option_of_yojson (value_for_key entity_id_of_yojson "MLModelId") _list path }
    : create_ml_model_output)

let create_ml_model_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path;
     ml_model_name = option_of_yojson (value_for_key entity_name_of_yojson "MLModelName") _list path;
     ml_model_type = value_for_key ml_model_type_of_yojson "MLModelType" _list path;
     parameters =
       option_of_yojson (value_for_key training_parameters_of_yojson "Parameters") _list path;
     training_data_source_id = value_for_key entity_id_of_yojson "TrainingDataSourceId" _list path;
     recipe = option_of_yojson (value_for_key recipe_of_yojson "Recipe") _list path;
     recipe_uri = option_of_yojson (value_for_key s3_url_of_yojson "RecipeUri") _list path;
   }
    : create_ml_model_input)

let create_evaluation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_id = option_of_yojson (value_for_key entity_id_of_yojson "EvaluationId") _list path;
   }
    : create_evaluation_output)

let create_evaluation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_id = value_for_key entity_id_of_yojson "EvaluationId" _list path;
     evaluation_name =
       option_of_yojson (value_for_key entity_name_of_yojson "EvaluationName") _list path;
     ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path;
     evaluation_data_source_id =
       value_for_key entity_id_of_yojson "EvaluationDataSourceId" _list path;
   }
    : create_evaluation_input)

let create_data_source_from_s3_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = option_of_yojson (value_for_key entity_id_of_yojson "DataSourceId") _list path;
   }
    : create_data_source_from_s3_output)

let s3_data_spec_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_location_s3 = value_for_key s3_url_of_yojson "DataLocationS3" _list path;
     data_rearrangement =
       option_of_yojson (value_for_key data_rearrangement_of_yojson "DataRearrangement") _list path;
     data_schema = option_of_yojson (value_for_key data_schema_of_yojson "DataSchema") _list path;
     data_schema_location_s3 =
       option_of_yojson (value_for_key s3_url_of_yojson "DataSchemaLocationS3") _list path;
   }
    : s3_data_spec)

let create_data_source_from_s3_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = value_for_key entity_id_of_yojson "DataSourceId" _list path;
     data_source_name =
       option_of_yojson (value_for_key entity_name_of_yojson "DataSourceName") _list path;
     data_spec = value_for_key s3_data_spec_of_yojson "DataSpec" _list path;
     compute_statistics =
       option_of_yojson (value_for_key compute_statistics_of_yojson "ComputeStatistics") _list path;
   }
    : create_data_source_from_s3_input)

let create_data_source_from_redshift_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = option_of_yojson (value_for_key entity_id_of_yojson "DataSourceId") _list path;
   }
    : create_data_source_from_redshift_output)

let redshift_database_password_of_yojson = string_of_yojson

let redshift_database_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key redshift_database_username_of_yojson "Username" _list path;
     password = value_for_key redshift_database_password_of_yojson "Password" _list path;
   }
    : redshift_database_credentials)

let redshift_data_spec_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_information =
       value_for_key redshift_database_of_yojson "DatabaseInformation" _list path;
     select_sql_query =
       value_for_key redshift_select_sql_query_of_yojson "SelectSqlQuery" _list path;
     database_credentials =
       value_for_key redshift_database_credentials_of_yojson "DatabaseCredentials" _list path;
     s3_staging_location = value_for_key s3_url_of_yojson "S3StagingLocation" _list path;
     data_rearrangement =
       option_of_yojson (value_for_key data_rearrangement_of_yojson "DataRearrangement") _list path;
     data_schema = option_of_yojson (value_for_key data_schema_of_yojson "DataSchema") _list path;
     data_schema_uri = option_of_yojson (value_for_key s3_url_of_yojson "DataSchemaUri") _list path;
   }
    : redshift_data_spec)

let create_data_source_from_redshift_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = value_for_key entity_id_of_yojson "DataSourceId" _list path;
     data_source_name =
       option_of_yojson (value_for_key entity_name_of_yojson "DataSourceName") _list path;
     data_spec = value_for_key redshift_data_spec_of_yojson "DataSpec" _list path;
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     compute_statistics =
       option_of_yojson (value_for_key compute_statistics_of_yojson "ComputeStatistics") _list path;
   }
    : create_data_source_from_redshift_input)

let create_data_source_from_rds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = option_of_yojson (value_for_key entity_id_of_yojson "DataSourceId") _list path;
   }
    : create_data_source_from_rds_output)

let edp_security_group_id_of_yojson = string_of_yojson

let edp_security_group_ids_of_yojson tree path =
  list_of_yojson edp_security_group_id_of_yojson tree path

let edp_subnet_id_of_yojson = string_of_yojson
let rds_database_password_of_yojson = string_of_yojson

let rds_database_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key rds_database_username_of_yojson "Username" _list path;
     password = value_for_key rds_database_password_of_yojson "Password" _list path;
   }
    : rds_database_credentials)

let rds_data_spec_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_information = value_for_key rds_database_of_yojson "DatabaseInformation" _list path;
     select_sql_query = value_for_key rds_select_sql_query_of_yojson "SelectSqlQuery" _list path;
     database_credentials =
       value_for_key rds_database_credentials_of_yojson "DatabaseCredentials" _list path;
     s3_staging_location = value_for_key s3_url_of_yojson "S3StagingLocation" _list path;
     data_rearrangement =
       option_of_yojson (value_for_key data_rearrangement_of_yojson "DataRearrangement") _list path;
     data_schema = option_of_yojson (value_for_key data_schema_of_yojson "DataSchema") _list path;
     data_schema_uri = option_of_yojson (value_for_key s3_url_of_yojson "DataSchemaUri") _list path;
     resource_role = value_for_key edp_resource_role_of_yojson "ResourceRole" _list path;
     service_role = value_for_key edp_service_role_of_yojson "ServiceRole" _list path;
     subnet_id = value_for_key edp_subnet_id_of_yojson "SubnetId" _list path;
     security_group_ids =
       value_for_key edp_security_group_ids_of_yojson "SecurityGroupIds" _list path;
   }
    : rds_data_spec)

let create_data_source_from_rds_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_id = value_for_key entity_id_of_yojson "DataSourceId" _list path;
     data_source_name =
       option_of_yojson (value_for_key entity_name_of_yojson "DataSourceName") _list path;
     rds_data = value_for_key rds_data_spec_of_yojson "RDSData" _list path;
     role_ar_n = value_for_key role_ar_n_of_yojson "RoleARN" _list path;
     compute_statistics =
       option_of_yojson (value_for_key compute_statistics_of_yojson "ComputeStatistics") _list path;
   }
    : create_data_source_from_rds_input)

let create_batch_prediction_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_prediction_id =
       option_of_yojson (value_for_key entity_id_of_yojson "BatchPredictionId") _list path;
   }
    : create_batch_prediction_output)

let create_batch_prediction_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_prediction_id = value_for_key entity_id_of_yojson "BatchPredictionId" _list path;
     batch_prediction_name =
       option_of_yojson (value_for_key entity_name_of_yojson "BatchPredictionName") _list path;
     ml_model_id = value_for_key entity_id_of_yojson "MLModelId" _list path;
     batch_prediction_data_source_id =
       value_for_key entity_id_of_yojson "BatchPredictionDataSourceId" _list path;
     output_uri = value_for_key s3_url_of_yojson "OutputUri" _list path;
   }
    : create_batch_prediction_input)
