open Smaws_Lib.Json.SerializeHelpers
open Types

let float_label_to_yojson = float_to_yojson
let vip_ur_l_to_yojson = string_to_yojson
let verbose_to_yojson = bool_to_yojson
let variable_value_to_yojson = string_to_yojson
let variable_name_to_yojson = string_to_yojson
let entity_id_to_yojson = string_to_yojson

let update_ml_model_output_to_yojson (x : update_ml_model_output) =
  assoc_to_yojson [ ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id) ]

let entity_name_to_yojson = string_to_yojson
let score_threshold_to_yojson = float_to_yojson

let update_ml_model_input_to_yojson (x : update_ml_model_input) =
  assoc_to_yojson
    [
      ("ScoreThreshold", option_to_yojson score_threshold_to_yojson x.score_threshold);
      ("MLModelName", option_to_yojson entity_name_to_yojson x.ml_model_name);
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
    ]

let error_message_to_yojson = string_to_yojson
let error_code_to_yojson = int_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let update_evaluation_output_to_yojson (x : update_evaluation_output) =
  assoc_to_yojson [ ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id) ]

let update_evaluation_input_to_yojson (x : update_evaluation_input) =
  assoc_to_yojson
    [
      ("EvaluationName", Some (entity_name_to_yojson x.evaluation_name));
      ("EvaluationId", Some (entity_id_to_yojson x.evaluation_id));
    ]

let update_data_source_output_to_yojson (x : update_data_source_output) =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let update_data_source_input_to_yojson (x : update_data_source_input) =
  assoc_to_yojson
    [
      ("DataSourceName", Some (entity_name_to_yojson x.data_source_name));
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
    ]

let update_batch_prediction_output_to_yojson (x : update_batch_prediction_output) =
  assoc_to_yojson
    [ ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id) ]

let update_batch_prediction_input_to_yojson (x : update_batch_prediction_input) =
  assoc_to_yojson
    [
      ("BatchPredictionName", Some (entity_name_to_yojson x.batch_prediction_name));
      ("BatchPredictionId", Some (entity_id_to_yojson x.batch_prediction_id));
    ]

let string_type_to_yojson = string_to_yojson

let training_parameters_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let taggable_resource_type_to_yojson (x : taggable_resource_type) =
  match x with
  | ML_MODEL -> `String "MLModel"
  | EVALUATION -> `String "Evaluation"
  | DATASOURCE -> `String "DataSource"
  | BATCH_PREDICTION -> `String "BatchPrediction"

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_limit_exceeded_exception_to_yojson (x : tag_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let sort_order_to_yojson (x : sort_order) =
  match x with DSC -> `String "dsc" | ASC -> `String "asc"

let score_value_to_yojson = float_to_yojson
let label_to_yojson = string_to_yojson

let score_value_per_label_map_to_yojson tree =
  map_to_yojson label_to_yojson score_value_to_yojson tree

let s3_url_to_yojson = string_to_yojson
let data_rearrangement_to_yojson = string_to_yojson
let data_schema_to_yojson = string_to_yojson

let s3_data_spec_to_yojson (x : s3_data_spec) =
  assoc_to_yojson
    [
      ("DataSchemaLocationS3", option_to_yojson s3_url_to_yojson x.data_schema_location_s3);
      ("DataSchema", option_to_yojson data_schema_to_yojson x.data_schema);
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("DataLocationS3", Some (s3_url_to_yojson x.data_location_s3));
    ]

let role_ar_n_to_yojson = string_to_yojson
let redshift_select_sql_query_to_yojson = string_to_yojson
let redshift_database_name_to_yojson = string_to_yojson
let redshift_cluster_identifier_to_yojson = string_to_yojson

let redshift_database_to_yojson (x : redshift_database) =
  assoc_to_yojson
    [
      ("ClusterIdentifier", Some (redshift_cluster_identifier_to_yojson x.cluster_identifier));
      ("DatabaseName", Some (redshift_database_name_to_yojson x.database_name));
    ]

let redshift_database_username_to_yojson = string_to_yojson

let redshift_metadata_to_yojson (x : redshift_metadata) =
  assoc_to_yojson
    [
      ("SelectSqlQuery", option_to_yojson redshift_select_sql_query_to_yojson x.select_sql_query);
      ( "DatabaseUserName",
        option_to_yojson redshift_database_username_to_yojson x.database_user_name );
      ("RedshiftDatabase", option_to_yojson redshift_database_to_yojson x.redshift_database);
    ]

let redshift_database_password_to_yojson = string_to_yojson

let redshift_database_credentials_to_yojson (x : redshift_database_credentials) =
  assoc_to_yojson
    [
      ("Password", Some (redshift_database_password_to_yojson x.password));
      ("Username", Some (redshift_database_username_to_yojson x.username));
    ]

let redshift_data_spec_to_yojson (x : redshift_data_spec) =
  assoc_to_yojson
    [
      ("DataSchemaUri", option_to_yojson s3_url_to_yojson x.data_schema_uri);
      ("DataSchema", option_to_yojson data_schema_to_yojson x.data_schema);
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("S3StagingLocation", Some (s3_url_to_yojson x.s3_staging_location));
      ("DatabaseCredentials", Some (redshift_database_credentials_to_yojson x.database_credentials));
      ("SelectSqlQuery", Some (redshift_select_sql_query_to_yojson x.select_sql_query));
      ("DatabaseInformation", Some (redshift_database_to_yojson x.database_information));
    ]

let record_to_yojson tree = map_to_yojson variable_name_to_yojson variable_value_to_yojson tree
let recipe_to_yojson = string_to_yojson

let realtime_endpoint_status_to_yojson (x : realtime_endpoint_status) =
  match x with
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"
  | READY -> `String "READY"
  | NONE -> `String "NONE"

let integer_type_to_yojson = int_to_yojson
let epoch_time_to_yojson = timestamp_epoch_seconds_to_yojson

let realtime_endpoint_info_to_yojson (x : realtime_endpoint_info) =
  assoc_to_yojson
    [
      ("EndpointStatus", option_to_yojson realtime_endpoint_status_to_yojson x.endpoint_status);
      ("EndpointUrl", option_to_yojson vip_ur_l_to_yojson x.endpoint_url);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("PeakRequestsPerSecond", option_to_yojson integer_type_to_yojson x.peak_requests_per_second);
    ]

let rds_select_sql_query_to_yojson = string_to_yojson
let rds_instance_identifier_to_yojson = string_to_yojson
let rds_database_name_to_yojson = string_to_yojson

let rds_database_to_yojson (x : rds_database) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (rds_database_name_to_yojson x.database_name));
      ("InstanceIdentifier", Some (rds_instance_identifier_to_yojson x.instance_identifier));
    ]

let rds_database_username_to_yojson = string_to_yojson
let edp_resource_role_to_yojson = string_to_yojson
let edp_service_role_to_yojson = string_to_yojson
let edp_pipeline_id_to_yojson = string_to_yojson

let rds_metadata_to_yojson (x : rds_metadata) =
  assoc_to_yojson
    [
      ("DataPipelineId", option_to_yojson edp_pipeline_id_to_yojson x.data_pipeline_id);
      ("ServiceRole", option_to_yojson edp_service_role_to_yojson x.service_role);
      ("ResourceRole", option_to_yojson edp_resource_role_to_yojson x.resource_role);
      ("SelectSqlQuery", option_to_yojson rds_select_sql_query_to_yojson x.select_sql_query);
      ("DatabaseUserName", option_to_yojson rds_database_username_to_yojson x.database_user_name);
      ("Database", option_to_yojson rds_database_to_yojson x.database);
    ]

let rds_database_password_to_yojson = string_to_yojson

let rds_database_credentials_to_yojson (x : rds_database_credentials) =
  assoc_to_yojson
    [
      ("Password", Some (rds_database_password_to_yojson x.password));
      ("Username", Some (rds_database_username_to_yojson x.username));
    ]

let edp_subnet_id_to_yojson = string_to_yojson
let edp_security_group_id_to_yojson = string_to_yojson
let edp_security_group_ids_to_yojson tree = list_to_yojson edp_security_group_id_to_yojson tree

let rds_data_spec_to_yojson (x : rds_data_spec) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", Some (edp_security_group_ids_to_yojson x.security_group_ids));
      ("SubnetId", Some (edp_subnet_id_to_yojson x.subnet_id));
      ("ServiceRole", Some (edp_service_role_to_yojson x.service_role));
      ("ResourceRole", Some (edp_resource_role_to_yojson x.resource_role));
      ("DataSchemaUri", option_to_yojson s3_url_to_yojson x.data_schema_uri);
      ("DataSchema", option_to_yojson data_schema_to_yojson x.data_schema);
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("S3StagingLocation", Some (s3_url_to_yojson x.s3_staging_location));
      ("DatabaseCredentials", Some (rds_database_credentials_to_yojson x.database_credentials));
      ("SelectSqlQuery", Some (rds_select_sql_query_to_yojson x.select_sql_query));
      ("DatabaseInformation", Some (rds_database_to_yojson x.database_information));
    ]

let presigned_s3_url_to_yojson = string_to_yojson

let predictor_not_mounted_exception_to_yojson (x : predictor_not_mounted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let details_value_to_yojson = string_to_yojson

let details_attributes_to_yojson (x : details_attributes) =
  match x with
  | ALGORITHM -> `String "Algorithm"
  | PREDICTIVE_MODEL_TYPE -> `String "PredictiveModelType"

let details_map_to_yojson tree =
  map_to_yojson details_attributes_to_yojson details_value_to_yojson tree

let prediction_to_yojson (x : prediction) =
  assoc_to_yojson
    [
      ("details", option_to_yojson details_map_to_yojson x.details);
      ("predictedScores", option_to_yojson score_value_per_label_map_to_yojson x.predicted_scores);
      ("predictedValue", option_to_yojson float_label_to_yojson x.predicted_value);
      ("predictedLabel", option_to_yojson label_to_yojson x.predicted_label);
    ]

let predict_output_to_yojson (x : predict_output) =
  assoc_to_yojson [ ("Prediction", option_to_yojson prediction_to_yojson x.prediction) ]

let predict_input_to_yojson (x : predict_input) =
  assoc_to_yojson
    [
      ("PredictEndpoint", Some (vip_ur_l_to_yojson x.predict_endpoint));
      ("Record", Some (record_to_yojson x.record));
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let performance_metrics_property_value_to_yojson = string_to_yojson
let performance_metrics_property_key_to_yojson = string_to_yojson

let performance_metrics_properties_to_yojson tree =
  map_to_yojson performance_metrics_property_key_to_yojson
    performance_metrics_property_value_to_yojson tree

let performance_metrics_to_yojson (x : performance_metrics) =
  assoc_to_yojson
    [ ("Properties", option_to_yojson performance_metrics_properties_to_yojson x.properties) ]

let page_limit_to_yojson = int_to_yojson
let message_to_yojson = string_to_yojson
let aws_user_arn_to_yojson = string_to_yojson
let ml_model_name_to_yojson = string_to_yojson

let entity_status_to_yojson (x : entity_status) =
  match x with
  | DELETED -> `String "DELETED"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | INPROGRESS -> `String "INPROGRESS"
  | PENDING -> `String "PENDING"

let long_type_to_yojson = long_to_yojson
let algorithm_to_yojson (x : algorithm) = match x with SGD -> `String "sgd"

let ml_model_type_to_yojson (x : ml_model_type) =
  match x with
  | MULTICLASS -> `String "MULTICLASS"
  | BINARY -> `String "BINARY"
  | REGRESSION -> `String "REGRESSION"

let ml_model_to_yojson (x : ml_model) =
  assoc_to_yojson
    [
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ( "ScoreThresholdLastUpdatedAt",
        option_to_yojson epoch_time_to_yojson x.score_threshold_last_updated_at );
      ("ScoreThreshold", option_to_yojson score_threshold_to_yojson x.score_threshold);
      ("MLModelType", option_to_yojson ml_model_type_to_yojson x.ml_model_type);
      ("Algorithm", option_to_yojson algorithm_to_yojson x.algorithm);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("TrainingParameters", option_to_yojson training_parameters_to_yojson x.training_parameters);
      ("EndpointInfo", option_to_yojson realtime_endpoint_info_to_yojson x.endpoint_info);
      ("SizeInBytes", option_to_yojson long_type_to_yojson x.size_in_bytes);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson ml_model_name_to_yojson x.name);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("TrainingDataSourceId", option_to_yojson entity_id_to_yojson x.training_data_source_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
    ]

let ml_models_to_yojson tree = list_to_yojson ml_model_to_yojson tree

let ml_model_filter_variable_to_yojson (x : ml_model_filter_variable) =
  match x with
  | TRAINING_DATA_URI -> `String "TrainingDataURI"
  | ALGORITHM -> `String "Algorithm"
  | ML_MODEL_TYPE -> `String "MLModelType"
  | REAL_TIME_ENDPOINT_STATUS -> `String "RealtimeEndpointStatus"
  | TRAINING_DATASOURCE_ID -> `String "TrainingDataSourceId"
  | IAM_USER -> `String "IAMUser"
  | NAME -> `String "Name"
  | STATUS -> `String "Status"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | CREATED_AT -> `String "CreatedAt"

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let get_ml_model_output_to_yojson (x : get_ml_model_output) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson data_schema_to_yojson x.schema);
      ("Recipe", option_to_yojson recipe_to_yojson x.recipe);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ( "ScoreThresholdLastUpdatedAt",
        option_to_yojson epoch_time_to_yojson x.score_threshold_last_updated_at );
      ("ScoreThreshold", option_to_yojson score_threshold_to_yojson x.score_threshold);
      ("MLModelType", option_to_yojson ml_model_type_to_yojson x.ml_model_type);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("TrainingParameters", option_to_yojson training_parameters_to_yojson x.training_parameters);
      ("EndpointInfo", option_to_yojson realtime_endpoint_info_to_yojson x.endpoint_info);
      ("SizeInBytes", option_to_yojson long_type_to_yojson x.size_in_bytes);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson ml_model_name_to_yojson x.name);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("TrainingDataSourceId", option_to_yojson entity_id_to_yojson x.training_data_source_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
    ]

let get_ml_model_input_to_yojson (x : get_ml_model_input) =
  assoc_to_yojson
    [
      ("Verbose", option_to_yojson verbose_to_yojson x.verbose);
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
    ]

let get_evaluation_output_to_yojson (x : get_evaluation_output) =
  assoc_to_yojson
    [
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ("PerformanceMetrics", option_to_yojson performance_metrics_to_yojson x.performance_metrics);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("EvaluationDataSourceId", option_to_yojson entity_id_to_yojson x.evaluation_data_source_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id);
    ]

let get_evaluation_input_to_yojson (x : get_evaluation_input) =
  assoc_to_yojson [ ("EvaluationId", Some (entity_id_to_yojson x.evaluation_id)) ]

let compute_statistics_to_yojson = bool_to_yojson

let get_data_source_output_to_yojson (x : get_data_source_output) =
  assoc_to_yojson
    [
      ("DataSourceSchema", option_to_yojson data_schema_to_yojson x.data_source_schema);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RDSMetadata", option_to_yojson rds_metadata_to_yojson x.rds_metadata);
      ("RedshiftMetadata", option_to_yojson redshift_metadata_to_yojson x.redshift_metadata);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("NumberOfFiles", option_to_yojson long_type_to_yojson x.number_of_files);
      ("DataSizeInBytes", option_to_yojson long_type_to_yojson x.data_size_in_bytes);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("DataLocationS3", option_to_yojson s3_url_to_yojson x.data_location_s3);
      ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id);
    ]

let get_data_source_input_to_yojson (x : get_data_source_input) =
  assoc_to_yojson
    [
      ("Verbose", option_to_yojson verbose_to_yojson x.verbose);
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
    ]

let get_batch_prediction_output_to_yojson (x : get_batch_prediction_output) =
  assoc_to_yojson
    [
      ("InvalidRecordCount", option_to_yojson long_type_to_yojson x.invalid_record_count);
      ("TotalRecordCount", option_to_yojson long_type_to_yojson x.total_record_count);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("LogUri", option_to_yojson presigned_s3_url_to_yojson x.log_uri);
      ("OutputUri", option_to_yojson s3_url_to_yojson x.output_uri);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ( "BatchPredictionDataSourceId",
        option_to_yojson entity_id_to_yojson x.batch_prediction_data_source_id );
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id);
    ]

let get_batch_prediction_input_to_yojson (x : get_batch_prediction_input) =
  assoc_to_yojson [ ("BatchPredictionId", Some (entity_id_to_yojson x.batch_prediction_id)) ]

let evaluation_to_yojson (x : evaluation) =
  assoc_to_yojson
    [
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("PerformanceMetrics", option_to_yojson performance_metrics_to_yojson x.performance_metrics);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ("EvaluationDataSourceId", option_to_yojson entity_id_to_yojson x.evaluation_data_source_id);
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id);
    ]

let evaluations_to_yojson tree = list_to_yojson evaluation_to_yojson tree

let evaluation_filter_variable_to_yojson (x : evaluation_filter_variable) =
  match x with
  | DATA_URI -> `String "DataURI"
  | DATASOURCE_ID -> `String "DataSourceId"
  | ML_MODEL_ID -> `String "MLModelId"
  | IAM_USER -> `String "IAMUser"
  | NAME -> `String "Name"
  | STATUS -> `String "Status"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | CREATED_AT -> `String "CreatedAt"

let describe_tags_output_to_yojson (x : describe_tags_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceType", option_to_yojson taggable_resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson entity_id_to_yojson x.resource_id);
    ]

let describe_tags_input_to_yojson (x : describe_tags_input) =
  assoc_to_yojson
    [
      ("ResourceType", Some (taggable_resource_type_to_yojson x.resource_type));
      ("ResourceId", Some (entity_id_to_yojson x.resource_id));
    ]

let describe_ml_models_output_to_yojson (x : describe_ml_models_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Results", option_to_yojson ml_models_to_yojson x.results);
    ]

let comparator_value_to_yojson = string_to_yojson

let describe_ml_models_input_to_yojson (x : describe_ml_models_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ("FilterVariable", option_to_yojson ml_model_filter_variable_to_yojson x.filter_variable);
    ]

let describe_evaluations_output_to_yojson (x : describe_evaluations_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Results", option_to_yojson evaluations_to_yojson x.results);
    ]

let describe_evaluations_input_to_yojson (x : describe_evaluations_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ("FilterVariable", option_to_yojson evaluation_filter_variable_to_yojson x.filter_variable);
    ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RDSMetadata", option_to_yojson rds_metadata_to_yojson x.rds_metadata);
      ("RedshiftMetadata", option_to_yojson redshift_metadata_to_yojson x.redshift_metadata);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("NumberOfFiles", option_to_yojson long_type_to_yojson x.number_of_files);
      ("DataSizeInBytes", option_to_yojson long_type_to_yojson x.data_size_in_bytes);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("DataRearrangement", option_to_yojson data_rearrangement_to_yojson x.data_rearrangement);
      ("DataLocationS3", option_to_yojson s3_url_to_yojson x.data_location_s3);
      ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id);
    ]

let data_sources_to_yojson tree = list_to_yojson data_source_to_yojson tree

let describe_data_sources_output_to_yojson (x : describe_data_sources_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Results", option_to_yojson data_sources_to_yojson x.results);
    ]

let data_source_filter_variable_to_yojson (x : data_source_filter_variable) =
  match x with
  | IAM_USER -> `String "IAMUser"
  | DATA_URI -> `String "DataLocationS3"
  | NAME -> `String "Name"
  | STATUS -> `String "Status"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | CREATED_AT -> `String "CreatedAt"

let describe_data_sources_input_to_yojson (x : describe_data_sources_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ("FilterVariable", option_to_yojson data_source_filter_variable_to_yojson x.filter_variable);
    ]

let batch_prediction_to_yojson (x : batch_prediction) =
  assoc_to_yojson
    [
      ("InvalidRecordCount", option_to_yojson long_type_to_yojson x.invalid_record_count);
      ("TotalRecordCount", option_to_yojson long_type_to_yojson x.total_record_count);
      ("StartedAt", option_to_yojson epoch_time_to_yojson x.started_at);
      ("FinishedAt", option_to_yojson epoch_time_to_yojson x.finished_at);
      ("ComputeTime", option_to_yojson long_type_to_yojson x.compute_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("OutputUri", option_to_yojson s3_url_to_yojson x.output_uri);
      ("Status", option_to_yojson entity_status_to_yojson x.status);
      ("Name", option_to_yojson entity_name_to_yojson x.name);
      ("LastUpdatedAt", option_to_yojson epoch_time_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson epoch_time_to_yojson x.created_at);
      ("CreatedByIamUser", option_to_yojson aws_user_arn_to_yojson x.created_by_iam_user);
      ("InputDataLocationS3", option_to_yojson s3_url_to_yojson x.input_data_location_s3);
      ( "BatchPredictionDataSourceId",
        option_to_yojson entity_id_to_yojson x.batch_prediction_data_source_id );
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
      ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id);
    ]

let batch_predictions_to_yojson tree = list_to_yojson batch_prediction_to_yojson tree

let describe_batch_predictions_output_to_yojson (x : describe_batch_predictions_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Results", option_to_yojson batch_predictions_to_yojson x.results);
    ]

let batch_prediction_filter_variable_to_yojson (x : batch_prediction_filter_variable) =
  match x with
  | DATA_URI -> `String "DataURI"
  | DATASOURCE_ID -> `String "DataSourceId"
  | ML_MODEL_ID -> `String "MLModelId"
  | IAM_USER -> `String "IAMUser"
  | NAME -> `String "Name"
  | STATUS -> `String "Status"
  | LAST_UPDATED_AT -> `String "LastUpdatedAt"
  | CREATED_AT -> `String "CreatedAt"

let describe_batch_predictions_input_to_yojson (x : describe_batch_predictions_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson page_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("Prefix", option_to_yojson comparator_value_to_yojson x.prefix);
      ("NE", option_to_yojson comparator_value_to_yojson x.n_e);
      ("LE", option_to_yojson comparator_value_to_yojson x.l_e);
      ("GE", option_to_yojson comparator_value_to_yojson x.g_e);
      ("LT", option_to_yojson comparator_value_to_yojson x.l_t);
      ("GT", option_to_yojson comparator_value_to_yojson x.g_t);
      ("EQ", option_to_yojson comparator_value_to_yojson x.e_q);
      ( "FilterVariable",
        option_to_yojson batch_prediction_filter_variable_to_yojson x.filter_variable );
    ]

let delete_tags_output_to_yojson (x : delete_tags_output) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson taggable_resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson entity_id_to_yojson x.resource_id);
    ]

let delete_tags_input_to_yojson (x : delete_tags_input) =
  assoc_to_yojson
    [
      ("ResourceType", Some (taggable_resource_type_to_yojson x.resource_type));
      ("ResourceId", Some (entity_id_to_yojson x.resource_id));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let delete_realtime_endpoint_output_to_yojson (x : delete_realtime_endpoint_output) =
  assoc_to_yojson
    [
      ( "RealtimeEndpointInfo",
        option_to_yojson realtime_endpoint_info_to_yojson x.realtime_endpoint_info );
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
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
      ( "RealtimeEndpointInfo",
        option_to_yojson realtime_endpoint_info_to_yojson x.realtime_endpoint_info );
      ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id);
    ]

let create_realtime_endpoint_input_to_yojson (x : create_realtime_endpoint_input) =
  assoc_to_yojson [ ("MLModelId", Some (entity_id_to_yojson x.ml_model_id)) ]

let create_ml_model_output_to_yojson (x : create_ml_model_output) =
  assoc_to_yojson [ ("MLModelId", option_to_yojson entity_id_to_yojson x.ml_model_id) ]

let create_ml_model_input_to_yojson (x : create_ml_model_input) =
  assoc_to_yojson
    [
      ("RecipeUri", option_to_yojson s3_url_to_yojson x.recipe_uri);
      ("Recipe", option_to_yojson recipe_to_yojson x.recipe);
      ("TrainingDataSourceId", Some (entity_id_to_yojson x.training_data_source_id));
      ("Parameters", option_to_yojson training_parameters_to_yojson x.parameters);
      ("MLModelType", Some (ml_model_type_to_yojson x.ml_model_type));
      ("MLModelName", option_to_yojson entity_name_to_yojson x.ml_model_name);
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
    ]

let create_evaluation_output_to_yojson (x : create_evaluation_output) =
  assoc_to_yojson [ ("EvaluationId", option_to_yojson entity_id_to_yojson x.evaluation_id) ]

let create_evaluation_input_to_yojson (x : create_evaluation_input) =
  assoc_to_yojson
    [
      ("EvaluationDataSourceId", Some (entity_id_to_yojson x.evaluation_data_source_id));
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("EvaluationName", option_to_yojson entity_name_to_yojson x.evaluation_name);
      ("EvaluationId", Some (entity_id_to_yojson x.evaluation_id));
    ]

let create_data_source_from_s3_output_to_yojson (x : create_data_source_from_s3_output) =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let create_data_source_from_s3_input_to_yojson (x : create_data_source_from_s3_input) =
  assoc_to_yojson
    [
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
      ("DataSpec", Some (s3_data_spec_to_yojson x.data_spec));
      ("DataSourceName", option_to_yojson entity_name_to_yojson x.data_source_name);
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
    ]

let create_data_source_from_redshift_output_to_yojson (x : create_data_source_from_redshift_output)
    =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let create_data_source_from_redshift_input_to_yojson (x : create_data_source_from_redshift_input) =
  assoc_to_yojson
    [
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("DataSpec", Some (redshift_data_spec_to_yojson x.data_spec));
      ("DataSourceName", option_to_yojson entity_name_to_yojson x.data_source_name);
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
    ]

let create_data_source_from_rds_output_to_yojson (x : create_data_source_from_rds_output) =
  assoc_to_yojson [ ("DataSourceId", option_to_yojson entity_id_to_yojson x.data_source_id) ]

let create_data_source_from_rds_input_to_yojson (x : create_data_source_from_rds_input) =
  assoc_to_yojson
    [
      ("ComputeStatistics", option_to_yojson compute_statistics_to_yojson x.compute_statistics);
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("RDSData", Some (rds_data_spec_to_yojson x.rds_data));
      ("DataSourceName", option_to_yojson entity_name_to_yojson x.data_source_name);
      ("DataSourceId", Some (entity_id_to_yojson x.data_source_id));
    ]

let create_batch_prediction_output_to_yojson (x : create_batch_prediction_output) =
  assoc_to_yojson
    [ ("BatchPredictionId", option_to_yojson entity_id_to_yojson x.batch_prediction_id) ]

let create_batch_prediction_input_to_yojson (x : create_batch_prediction_input) =
  assoc_to_yojson
    [
      ("OutputUri", Some (s3_url_to_yojson x.output_uri));
      ("BatchPredictionDataSourceId", Some (entity_id_to_yojson x.batch_prediction_data_source_id));
      ("MLModelId", Some (entity_id_to_yojson x.ml_model_id));
      ("BatchPredictionName", option_to_yojson entity_name_to_yojson x.batch_prediction_name);
      ("BatchPredictionId", Some (entity_id_to_yojson x.batch_prediction_id));
    ]

let add_tags_output_to_yojson (x : add_tags_output) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson taggable_resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson entity_id_to_yojson x.resource_id);
    ]

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("ResourceType", Some (taggable_resource_type_to_yojson x.resource_type));
      ("ResourceId", Some (entity_id_to_yojson x.resource_id));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]
