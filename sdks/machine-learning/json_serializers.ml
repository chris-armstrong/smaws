open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let tag_limit_exceeded_exception_to_yojson (x : tag_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let error_code_to_yojson = int_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let taggable_resource_type_to_yojson (x : taggable_resource_type) =
  match x with
  | BATCH_PREDICTION -> `String "BatchPrediction"
  | DATASOURCE -> `String "DataSource"
  | EVALUATION -> `String "Evaluation"
  | ML_MODEL -> `String "MLModel"

let entity_id_to_yojson = string_to_yojson

let add_tags_output_to_yojson (x : add_tags_output) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson entity_id_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson taggable_resource_type_to_yojson x.resource_type);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceId", Some (entity_id_to_yojson x.resource_id));
      ("ResourceType", Some (taggable_resource_type_to_yojson x.resource_type));
    ]

let algorithm_to_yojson (x : algorithm) = match x with SGD -> `String "sgd"

let update_ml_model_output_to_yojson (x : update_ml_model_output) =
  assoc_to_yojson [ ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id) ]

let score_threshold_to_yojson = float_to_yojson
let entity_name_to_yojson = string_to_yojson

let update_ml_model_input_to_yojson (x : update_ml_model_input) =
  assoc_to_yojson
    [
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("MLModelName", option_to_yojson entity_name_to_yojson x.ml_model_name);
      ("ScoreThreshold", option_to_yojson score_threshold_to_yojson x.score_threshold);
    ]

let update_evaluation_output_to_yojson (x : update_evaluation_output) =
  assoc_to_yojson [ ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id) ]

let update_evaluation_input_to_yojson (x : update_evaluation_input) =
  assoc_to_yojson
    [
      ("EvaluationId", Some (entity_id_to_yojson x.evaluation_id));
      ("EvaluationName", Some (entity_name_to_yojson x.evaluation_name));
    ]

let update_data_source_output_to_yojson (x : update_data_source_output) =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let update_data_source_input_to_yojson (x : update_data_source_input) =
  assoc_to_yojson
    [
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
      ("DataSourceName", Some (entity_name_to_yojson x.data_source_name));
    ]

let update_batch_prediction_output_to_yojson (x : update_batch_prediction_output) =
  assoc_to_yojson
    [ ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id) ]

let update_batch_prediction_input_to_yojson (x : update_batch_prediction_input) =
  assoc_to_yojson
    [
      ("BatchPredictionId", Some (entity_id_to_yojson x.batch_prediction_id));
      ("BatchPredictionName", Some (entity_name_to_yojson x.batch_prediction_name));
    ]

let predictor_not_mounted_exception_to_yojson (x : predictor_not_mounted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let details_value_to_yojson = string_to_yojson

let details_attributes_to_yojson (x : details_attributes) =
  match x with
  | PREDICTIVE_MODEL_TYPE -> `String "PredictiveModelType"
  | ALGORITHM -> `String "Algorithm"

let details_map_to_yojson tree =
  map_to_yojson details_attributes_to_yojson details_value_to_yojson tree

let score_value_to_yojson = float_to_yojson
let label_to_yojson = string_to_yojson

let score_value_per_label_map_to_yojson tree =
  map_to_yojson label_to_yojson score_value_to_yojson tree

let float_label_to_yojson = float_to_yojson

let prediction_to_yojson (x : prediction) =
  assoc_to_yojson
    [
      ("predictedLabel", option_to_yojson label_to_yojson x.predicted_label);
      ("predictedValue", option_to_yojson float_label_to_yojson x.predicted_value);
      ("predictedScores", option_to_yojson score_value_per_label_map_to_yojson x.predicted_scores);
      ("details", option_to_yojson details_map_to_yojson x.details);
    ]

let predict_output_to_yojson (x : predict_output) =
  assoc_to_yojson [ ("Prediction", option_to_yojson prediction_to_yojson x.prediction) ]

let vip_ur_l_to_yojson = string_to_yojson
let variable_value_to_yojson = string_to_yojson
let variable_name_to_yojson = string_to_yojson
let record_to_yojson tree = map_to_yojson variable_name_to_yojson variable_value_to_yojson tree

let predict_input_to_yojson (x : predict_input) =
  assoc_to_yojson
    [
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("Record", Some (record_to_yojson x.record));
      ("PredictEndpoint", Some (vip_ur_l_to_yojson x.predict_endpoint));
    ]

let data_schema_to_yojson = string_to_yojson
let recipe_to_yojson = string_to_yojson
let epoch_time_to_yojson = timestamp_epoch_seconds_to_yojson
let long_type_to_yojson = long_to_yojson
let message_to_yojson = string_to_yojson
let presigned_s3_url_to_yojson = string_to_yojson

let ml_model_type_to_yojson (x : ml_model_type) =
  match x with
  | REGRESSION -> `String "REGRESSION"
  | BINARY -> `String "BINARY"
  | MULTICLASS -> `String "MULTICLASS"

let s3_url_to_yojson = string_to_yojson
let string_type_to_yojson = string_to_yojson

let training_parameters_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let realtime_endpoint_status_to_yojson (x : realtime_endpoint_status) =
  match x with
  | NONE -> `String "NONE"
  | READY -> `String "READY"
  | UPDATING -> `String "UPDATING"
  | FAILED -> `String "FAILED"

let integer_type_to_yojson = int_to_yojson

let realtime_endpoint_info_to_yojson (x : realtime_endpoint_info) =
  assoc_to_yojson
    [
      ("PeakRequestsPerSecond", option_to_yojson integer_type_to_yojson x.peak_requests_per_second);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("EndpointUrl", option_to_yojson vip_ur_l_to_yojson x.endpoint_url);
      ("EndpointStatus", option_to_yojson realtime_endpoint_status_to_yojson x.endpoint_status);
    ]

let entity_status_to_yojson (x : entity_status) =
  match x with
  | PENDING -> `String "PENDING"
  | INPROGRESS -> `String "INPROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | DELETED -> `String "DELETED"

let ml_model_name_to_yojson = string_to_yojson
let aws_user_arn_to_yojson = string_to_yojson

let get_ml_model_output_to_yojson (x : get_ml_model_output) =
  assoc_to_yojson
    [
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("TrainingDataSourceId", option_to_yojson entity_id_to_yojson x.training_data_source_id);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("Name", option_to_yojson ml_model_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("SizeInBytes", option_to_yojson long_type_to_yojson x.size_in_bytes);
      ("EndpointInfo", option_to_yojson realtime_endpoint_info_to_yojson x.endpoint_info);
      ("TrainingParameters", option_to_yojson training_parameters_to_yojson x.training_parameters);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("MLModelType", option_to_yojson ml_model_type_to_yojson x.ml_model_type);
      ("ScoreThreshold", option_to_yojson score_threshold_to_yojson x.score_threshold);
      ( "ScoreThresholdLastUpdatedAt",
        option_to_yojson epoch_time_to_yojson x.score_threshold_last_updated_at );
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("Recipe", option_to_yojson recipe_to_yojson x.recipe);
      ("Schema", option_to_yojson data_schema_to_yojson x.schema);
    ]

let verbose_to_yojson = bool_to_yojson

let get_ml_model_input_to_yojson (x : get_ml_model_input) =
  assoc_to_yojson
    [
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("Verbose", option_to_yojson verbose_to_yojson x.verbose);
    ]

let performance_metrics_property_value_to_yojson = string_to_yojson
let performance_metrics_property_key_to_yojson = string_to_yojson

let performance_metrics_properties_to_yojson tree =
  map_to_yojson performance_metrics_property_key_to_yojson
    performance_metrics_property_value_to_yojson tree

let performance_metrics_to_yojson (x : performance_metrics) =
  assoc_to_yojson
    [ ("Properties", option_to_yojson performance_metrics_properties_to_yojson x.properties) ]

let get_evaluation_output_to_yojson (x : get_evaluation_output) =
  assoc_to_yojson
    [
      ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("EvaluationDataSourceId", option_to_yojson entity_id_to_yojson x.evaluation_data_source_id);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("PerformanceMetrics", option_to_yojson performance_metrics_to_yojson x.performance_metrics);
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
    ]

let get_evaluation_input_to_yojson (x : get_evaluation_input) =
  assoc_to_yojson [ ("EvaluationId", Some (entity_id_to_yojson x.evaluation_id)) ]

let compute_statistics_to_yojson = bool_to_yojson
let role_ar_n_to_yojson = string_to_yojson
let edp_pipeline_id_to_yojson = string_to_yojson
let edp_service_role_to_yojson = string_to_yojson
let edp_resource_role_to_yojson = string_to_yojson
let rds_select_sql_query_to_yojson = string_to_yojson
let rds_database_username_to_yojson = string_to_yojson
let rds_database_name_to_yojson = string_to_yojson
let rds_instance_identifier_to_yojson = string_to_yojson

let rds_database_to_yojson (x : rds_database) =
  assoc_to_yojson
    [
      ("InstanceIdentifier", Some (rds_instance_identifier_to_yojson x.instance_identifier));
      ("DatabaseName", Some (rds_database_name_to_yojson x.database_name));
    ]

let rds_metadata_to_yojson (x : rds_metadata) =
  assoc_to_yojson
    [
      ("Database", option_to_yojson rds_database_to_yojson x.database);
      ("DatabaseUserName", option_to_yojson rds_database_username_to_yojson x.database_user_name);
      ("SelectSqlQuery", option_to_yojson rds_select_sql_query_to_yojson x.select_sql_query);
      ("ResourceRole", option_to_yojson edp_resource_role_to_yojson x.resource_role);
      ("ServiceRole", option_to_yojson edp_service_role_to_yojson x.service_role);
      ("DataPipelineId", option_to_yojson edp_pipeline_id_to_yojson x.data_pipeline_id);
    ]

let redshift_select_sql_query_to_yojson = string_to_yojson
let redshift_database_username_to_yojson = string_to_yojson
let redshift_cluster_identifier_to_yojson = string_to_yojson
let redshift_database_name_to_yojson = string_to_yojson

let redshift_database_to_yojson (x : redshift_database) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (redshift_database_name_to_yojson x.database_name));
      ("ClusterIdentifier", Some (redshift_cluster_identifier_to_yojson x.cluster_identifier));
    ]

let redshift_metadata_to_yojson (x : redshift_metadata) =
  assoc_to_yojson
    [
      ("RedshiftDatabase", option_to_yojson redshift_database_to_yojson x.redshift_database);
      ( "DatabaseUserName",
        option_to_yojson redshift_database_username_to_yojson x.database_user_name );
      ("SelectSqlQuery", option_to_yojson redshift_select_sql_query_to_yojson x.select_sql_query);
    ]

let data_rearrangement_to_yojson = string_to_yojson

let get_data_source_output_to_yojson (x : get_data_source_output) =
  assoc_to_yojson
    [
      ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id);
      ("DataLocationS3", option_to_yojson s3_url_to_yojson x.data_location_s3);
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("DataSizeInBytes", option_to_yojson long_type_to_yojson x.data_size_in_bytes);
      ("NumberOfFiles", option_to_yojson long_type_to_yojson x.number_of_files);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("RedshiftMetadata", option_to_yojson redshift_metadata_to_yojson x.redshift_metadata);
      ("RDSMetadata", option_to_yojson rds_metadata_to_yojson x.rds_metadata);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("DataSourceSchema", option_to_yojson data_schema_to_yojson x.data_source_schema);
    ]

let get_data_source_input_to_yojson (x : get_data_source_input) =
  assoc_to_yojson
    [
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
      ("Verbose", option_to_yojson verbose_to_yojson x.verbose);
    ]

let get_batch_prediction_output_to_yojson (x : get_batch_prediction_output) =
  assoc_to_yojson
    [
      ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ( "BatchPredictionDataSourceId",
        option_to_yojson entity_id_to_yojson x.batch_prediction_data_source_id );
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("OutputUri", option_to_yojson s3_url_to_yojson x.output_uri);
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("TotalRecordCount", option_to_yojson long_type_to_yojson x.total_record_count);
      ("InvalidRecordCount", option_to_yojson long_type_to_yojson x.invalid_record_count);
    ]

let get_batch_prediction_input_to_yojson (x : get_batch_prediction_input) =
  assoc_to_yojson [ ("BatchPredictionId", Some (entity_id_to_yojson x.batch_prediction_id)) ]

let describe_tags_output_to_yojson (x : describe_tags_output) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson entity_id_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson taggable_resource_type_to_yojson x.resource_type);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let describe_tags_input_to_yojson (x : describe_tags_input) =
  assoc_to_yojson
    [
      ("ResourceId", Some (entity_id_to_yojson x.resource_id));
      ("ResourceType", Some (taggable_resource_type_to_yojson x.resource_type));
    ]

let ml_model_to_yojson (x : ml_model) =
  assoc_to_yojson
    [
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("TrainingDataSourceId", option_to_yojson entity_id_to_yojson x.training_data_source_id);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("Name", option_to_yojson ml_model_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("SizeInBytes", option_to_yojson long_type_to_yojson x.size_in_bytes);
      ("EndpointInfo", option_to_yojson realtime_endpoint_info_to_yojson x.endpoint_info);
      ("TrainingParameters", option_to_yojson training_parameters_to_yojson x.training_parameters);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("Algorithm", option_to_yojson algorithm_to_yojson x.algorithm);
      ("MLModelType", option_to_yojson ml_model_type_to_yojson x.ml_model_type);
      ("ScoreThreshold", option_to_yojson score_threshold_to_yojson x.score_threshold);
      ( "ScoreThresholdLastUpdatedAt",
        option_to_yojson epoch_time_to_yojson x.score_threshold_last_updated_at );
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
    ]

let ml_models_to_yojson tree = list_to_yojson ml_model_to_yojson tree

let describe_ml_models_output_to_yojson (x : describe_ml_models_output) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson ml_models_to_yojson x.results);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
    ]

let page_limit_to_yojson = int_to_yojson

let sort_order_to_yojson (x : sort_order) =
  match x with ASC -> `String "asc" | DSC -> `String "dsc"

let comparator_value_to_yojson = string_to_yojson

let ml_model_filter_variable_to_yojson (x : ml_model_filter_variable) =
  match x with
  | CREATED_AT -> `String "CreatedAt"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | STATUS -> `String "Status"
  | NAME -> `String "Name"
  | IAM_USER -> `String "IAMUser"
  | TRAINING_DATASOURCE_ID -> `String "TrainingDataSourceId"
  | REAL_TIME_ENDPOINT_STATUS -> `String "RealtimeEndpointStatus"
  | ML_MODEL_TYPE -> `String "MLModelType"
  | ALGORITHM -> `String "Algorithm"
  | TRAINING_DATA_URI -> `String "TrainingDataURI"

let describe_ml_models_input_to_yojson (x : describe_ml_models_input) =
  assoc_to_yojson
    [
      ("FilterVariable", option_to_yojson ml_model_filter_variable_to_yojson x.filter_variable);
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
    ]

let evaluation_to_yojson (x : evaluation) =
  assoc_to_yojson
    [
      ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("EvaluationDataSourceId", option_to_yojson entity_id_to_yojson x.evaluation_data_source_id);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("PerformanceMetrics", option_to_yojson performance_metrics_to_yojson x.performance_metrics);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
    ]

let evaluations_to_yojson tree = list_to_yojson evaluation_to_yojson tree

let describe_evaluations_output_to_yojson (x : describe_evaluations_output) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson evaluations_to_yojson x.results);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
    ]

let evaluation_filter_variable_to_yojson (x : evaluation_filter_variable) =
  match x with
  | CREATED_AT -> `String "CreatedAt"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | STATUS -> `String "Status"
  | NAME -> `String "Name"
  | IAM_USER -> `String "IAMUser"
  | ML_MODEL_ID -> `String "MLModelId"
  | DATASOURCE_ID -> `String "DataSourceId"
  | DATA_URI -> `String "DataURI"

let describe_evaluations_input_to_yojson (x : describe_evaluations_input) =
  assoc_to_yojson
    [
      ("FilterVariable", option_to_yojson evaluation_filter_variable_to_yojson x.filter_variable);
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
    ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id);
      ("DataLocationS3", option_to_yojson s3_url_to_yojson x.data_location_s3);
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("DataSizeInBytes", option_to_yojson long_type_to_yojson x.data_size_in_bytes);
      ("NumberOfFiles", option_to_yojson long_type_to_yojson x.number_of_files);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("RedshiftMetadata", option_to_yojson redshift_metadata_to_yojson x.redshift_metadata);
      ("RDSMetadata", option_to_yojson rds_metadata_to_yojson x.rds_metadata);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
    ]

let data_sources_to_yojson tree = list_to_yojson data_source_to_yojson tree

let describe_data_sources_output_to_yojson (x : describe_data_sources_output) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson data_sources_to_yojson x.results);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
    ]

let data_source_filter_variable_to_yojson (x : data_source_filter_variable) =
  match x with
  | CREATED_AT -> `String "CreatedAt"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | STATUS -> `String "Status"
  | NAME -> `String "Name"
  | DATA_URI -> `String "DataLocationS3"
  | IAM_USER -> `String "IAMUser"

let describe_data_sources_input_to_yojson (x : describe_data_sources_input) =
  assoc_to_yojson
    [
      ("FilterVariable", option_to_yojson data_source_filter_variable_to_yojson x.filter_variable);
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
    ]

let batch_prediction_to_yojson (x : batch_prediction) =
  assoc_to_yojson
    [
      ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ( "BatchPredictionDataSourceId",
        option_to_yojson entity_id_to_yojson x.batch_prediction_data_source_id );
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("OutputUri", option_to_yojson s3_url_to_yojson x.output_uri);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("TotalRecordCount", option_to_yojson long_type_to_yojson x.total_record_count);
      ("InvalidRecordCount", option_to_yojson long_type_to_yojson x.invalid_record_count);
    ]

let batch_predictions_to_yojson tree = list_to_yojson batch_prediction_to_yojson tree

let describe_batch_predictions_output_to_yojson (x : describe_batch_predictions_output) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson batch_predictions_to_yojson x.results);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
    ]

let batch_prediction_filter_variable_to_yojson (x : batch_prediction_filter_variable) =
  match x with
  | CREATED_AT -> `String "CreatedAt"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | STATUS -> `String "Status"
  | NAME -> `String "Name"
  | IAM_USER -> `String "IAMUser"
  | ML_MODEL_ID -> `String "MLModelId"
  | DATASOURCE_ID -> `String "DataSourceId"
  | DATA_URI -> `String "DataURI"

let describe_batch_predictions_input_to_yojson (x : describe_batch_predictions_input) =
  assoc_to_yojson
    [
      ( "FilterVariable",
        option_to_yojson batch_prediction_filter_variable_to_yojson x.filter_variable );
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
    ]

let delete_tags_output_to_yojson (x : delete_tags_output) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson entity_id_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson taggable_resource_type_to_yojson x.resource_type);
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let delete_tags_input_to_yojson (x : delete_tags_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceId", Some (entity_id_to_yojson x.resource_id));
      ("ResourceType", Some (taggable_resource_type_to_yojson x.resource_type));
    ]

let delete_realtime_endpoint_output_to_yojson (x : delete_realtime_endpoint_output) =
  assoc_to_yojson
    [
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ( "RealtimeEndpointInfo",
        option_to_yojson realtime_endpoint_info_to_yojson x.realtime_endpoint_info );
    ]

let delete_realtime_endpoint_input_to_yojson (x : delete_realtime_endpoint_input) =
  assoc_to_yojson [ ("MLModelId", Some (entity_id_to_yojson x.ml_model_id)) ]

let delete_ml_model_output_to_yojson (x : delete_ml_model_output) =
  assoc_to_yojson [ ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id) ]

let delete_ml_model_input_to_yojson (x : delete_ml_model_input) =
  assoc_to_yojson [ ("MLModelId", Some (entity_id_to_yojson x.ml_model_id)) ]

let delete_evaluation_output_to_yojson (x : delete_evaluation_output) =
  assoc_to_yojson [ ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id) ]

let delete_evaluation_input_to_yojson (x : delete_evaluation_input) =
  assoc_to_yojson [ ("EvaluationId", Some (entity_id_to_yojson x.evaluation_id)) ]

let delete_data_source_output_to_yojson (x : delete_data_source_output) =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let delete_data_source_input_to_yojson (x : delete_data_source_input) =
  assoc_to_yojson [ ("DataSourceId", Some (entity_id_to_yojson x.data_source_id)) ]

let delete_batch_prediction_output_to_yojson (x : delete_batch_prediction_output) =
  assoc_to_yojson
    [ ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id) ]

let delete_batch_prediction_input_to_yojson (x : delete_batch_prediction_input) =
  assoc_to_yojson [ ("BatchPredictionId", Some (entity_id_to_yojson x.batch_prediction_id)) ]

let create_realtime_endpoint_output_to_yojson (x : create_realtime_endpoint_output) =
  assoc_to_yojson
    [
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ( "RealtimeEndpointInfo",
        option_to_yojson realtime_endpoint_info_to_yojson x.realtime_endpoint_info );
    ]

let create_realtime_endpoint_input_to_yojson (x : create_realtime_endpoint_input) =
  assoc_to_yojson [ ("MLModelId", Some (entity_id_to_yojson x.ml_model_id)) ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let create_ml_model_output_to_yojson (x : create_ml_model_output) =
  assoc_to_yojson [ ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id) ]

let create_ml_model_input_to_yojson (x : create_ml_model_input) =
  assoc_to_yojson
    [
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("MLModelName", option_to_yojson entity_name_to_yojson x.ml_model_name);
      ("MLModelType", Some (ml_model_type_to_yojson x.ml_model_type));
      ("Parameters", option_to_yojson training_parameters_to_yojson x.parameters);
      ("TrainingDataSourceId", Some (entity_id_to_yojson x.training_data_source_id));
      ("Recipe", option_to_yojson recipe_to_yojson x.recipe);
      ("RecipeUri", option_to_yojson s3_url_to_yojson x.recipe_uri);
    ]

let create_evaluation_output_to_yojson (x : create_evaluation_output) =
  assoc_to_yojson [ ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id) ]

let create_evaluation_input_to_yojson (x : create_evaluation_input) =
  assoc_to_yojson
    [
      ("EvaluationId", Some (entity_id_to_yojson x.evaluation_id));
      ("EvaluationName", option_to_yojson entity_name_to_yojson x.evaluation_name);
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("EvaluationDataSourceId", Some (entity_id_to_yojson x.evaluation_data_source_id));
    ]

let create_data_source_from_s3_output_to_yojson (x : create_data_source_from_s3_output) =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let s3_data_spec_to_yojson (x : s3_data_spec) =
  assoc_to_yojson
    [
      ("DataLocationS3", Some (s3_url_to_yojson x.data_location_s3));
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("DataSchema", option_to_yojson data_schema_to_yojson x.data_schema);
      ("DataSchemaLocationS3", option_to_yojson s3_url_to_yojson x.data_schema_location_s3);
    ]

let create_data_source_from_s3_input_to_yojson (x : create_data_source_from_s3_input) =
  assoc_to_yojson
    [
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
      ("DataSourceName", option_to_yojson entity_name_to_yojson x.data_source_name);
      ("DataSpec", Some (s3_data_spec_to_yojson x.data_spec));
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
    ]

let create_data_source_from_redshift_output_to_yojson (x : create_data_source_from_redshift_output)
    =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let redshift_database_password_to_yojson = string_to_yojson

let redshift_database_credentials_to_yojson (x : redshift_database_credentials) =
  assoc_to_yojson
    [
      ("Username", Some (redshift_database_username_to_yojson x.username));
      ("Password", Some (redshift_database_password_to_yojson x.password));
    ]

let redshift_data_spec_to_yojson (x : redshift_data_spec) =
  assoc_to_yojson
    [
      ("DatabaseInformation", Some (redshift_database_to_yojson x.database_information));
      ("SelectSqlQuery", Some (redshift_select_sql_query_to_yojson x.select_sql_query));
      ("DatabaseCredentials", Some (redshift_database_credentials_to_yojson x.database_credentials));
      ("S3StagingLocation", Some (s3_url_to_yojson x.s3_staging_location));
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("DataSchema", option_to_yojson data_schema_to_yojson x.data_schema);
      ("DataSchemaUri", option_to_yojson s3_url_to_yojson x.data_schema_uri);
    ]

let create_data_source_from_redshift_input_to_yojson (x : create_data_source_from_redshift_input) =
  assoc_to_yojson
    [
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
      ("DataSourceName", option_to_yojson entity_name_to_yojson x.data_source_name);
      ("DataSpec", Some (redshift_data_spec_to_yojson x.data_spec));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
    ]

let create_data_source_from_rds_output_to_yojson (x : create_data_source_from_rds_output) =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let edp_security_group_id_to_yojson = string_to_yojson
let edp_security_group_ids_to_yojson tree = list_to_yojson edp_security_group_id_to_yojson tree
let edp_subnet_id_to_yojson = string_to_yojson
let rds_database_password_to_yojson = string_to_yojson

let rds_database_credentials_to_yojson (x : rds_database_credentials) =
  assoc_to_yojson
    [
      ("Username", Some (rds_database_username_to_yojson x.username));
      ("Password", Some (rds_database_password_to_yojson x.password));
    ]

let rds_data_spec_to_yojson (x : rds_data_spec) =
  assoc_to_yojson
    [
      ("DatabaseInformation", Some (rds_database_to_yojson x.database_information));
      ("SelectSqlQuery", Some (rds_select_sql_query_to_yojson x.select_sql_query));
      ("DatabaseCredentials", Some (rds_database_credentials_to_yojson x.database_credentials));
      ("S3StagingLocation", Some (s3_url_to_yojson x.s3_staging_location));
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("DataSchema", option_to_yojson data_schema_to_yojson x.data_schema);
      ("DataSchemaUri", option_to_yojson s3_url_to_yojson x.data_schema_uri);
      ("ResourceRole", Some (edp_resource_role_to_yojson x.resource_role));
      ("ServiceRole", Some (edp_service_role_to_yojson x.service_role));
      ("SubnetId", Some (edp_subnet_id_to_yojson x.subnet_id));
      ("SecurityGroupIds", Some (edp_security_group_ids_to_yojson x.security_group_ids));
    ]

let create_data_source_from_rds_input_to_yojson (x : create_data_source_from_rds_input) =
  assoc_to_yojson
    [
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
      ("DataSourceName", option_to_yojson entity_name_to_yojson x.data_source_name);
      ("RDSData", Some (rds_data_spec_to_yojson x.rds_data));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
    ]

let create_batch_prediction_output_to_yojson (x : create_batch_prediction_output) =
  assoc_to_yojson
    [ ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id) ]

let create_batch_prediction_input_to_yojson (x : create_batch_prediction_input) =
  assoc_to_yojson
    [
      ("BatchPredictionId", Some (entity_id_to_yojson x.batch_prediction_id));
      ("BatchPredictionName", option_to_yojson entity_name_to_yojson x.batch_prediction_name);
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("BatchPredictionDataSourceId", Some (entity_id_to_yojson x.batch_prediction_data_source_id));
      ("OutputUri", Some (s3_url_to_yojson x.output_uri));
    ]
