(** Machine Learning client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_add_tags_output :
  ?resource_id:entity_id -> ?resource_type:taggable_resource_type -> unit -> add_tags_output

val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_add_tags_input :
  tags:tag_list ->
  resource_id:entity_id ->
  resource_type:taggable_resource_type ->
  unit ->
  add_tags_input

val make_update_ml_model_output : ?ml_model_id:entity_id -> unit -> update_ml_model_output

val make_update_ml_model_input :
  ?ml_model_name:entity_name ->
  ?score_threshold:score_threshold ->
  ml_model_id:entity_id ->
  unit ->
  update_ml_model_input

val make_update_evaluation_output : ?evaluation_id:entity_id -> unit -> update_evaluation_output

val make_update_evaluation_input :
  evaluation_id:entity_id -> evaluation_name:entity_name -> unit -> update_evaluation_input

val make_update_data_source_output : ?data_source_id:entity_id -> unit -> update_data_source_output

val make_update_data_source_input :
  data_source_id:entity_id -> data_source_name:entity_name -> unit -> update_data_source_input

val make_update_batch_prediction_output :
  ?batch_prediction_id:entity_id -> unit -> update_batch_prediction_output

val make_update_batch_prediction_input :
  batch_prediction_id:entity_id ->
  batch_prediction_name:entity_name ->
  unit ->
  update_batch_prediction_input

val make_prediction :
  ?predicted_label:label ->
  ?predicted_value:float_label ->
  ?predicted_scores:score_value_per_label_map ->
  ?details:details_map ->
  unit ->
  prediction

val make_predict_output : ?prediction:prediction -> unit -> predict_output

val make_predict_input :
  ml_model_id:entity_id -> record:record -> predict_endpoint:vip_ur_l -> unit -> predict_input

val make_realtime_endpoint_info :
  ?peak_requests_per_second:integer_type ->
  ?created_at:epoch_time ->
  ?endpoint_url:vip_ur_l ->
  ?endpoint_status:realtime_endpoint_status ->
  unit ->
  realtime_endpoint_info

val make_get_ml_model_output :
  ?ml_model_id:entity_id ->
  ?training_data_source_id:entity_id ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?name:ml_model_name ->
  ?status:entity_status ->
  ?size_in_bytes:long_type ->
  ?endpoint_info:realtime_endpoint_info ->
  ?training_parameters:training_parameters ->
  ?input_data_location_s3:s3_url ->
  ?ml_model_type:ml_model_type ->
  ?score_threshold:score_threshold ->
  ?score_threshold_last_updated_at:epoch_time ->
  ?log_uri:presigned_s3_url ->
  ?message:message ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  ?recipe:recipe ->
  ?schema:data_schema ->
  unit ->
  get_ml_model_output

val make_get_ml_model_input :
  ?verbose:verbose -> ml_model_id:entity_id -> unit -> get_ml_model_input

val make_performance_metrics :
  ?properties:performance_metrics_properties -> unit -> performance_metrics

val make_get_evaluation_output :
  ?evaluation_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?evaluation_data_source_id:entity_id ->
  ?input_data_location_s3:s3_url ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?name:entity_name ->
  ?status:entity_status ->
  ?performance_metrics:performance_metrics ->
  ?log_uri:presigned_s3_url ->
  ?message:message ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  unit ->
  get_evaluation_output

val make_get_evaluation_input : evaluation_id:entity_id -> unit -> get_evaluation_input

val make_rds_database :
  instance_identifier:rds_instance_identifier ->
  database_name:rds_database_name ->
  unit ->
  rds_database

val make_rds_metadata :
  ?database:rds_database ->
  ?database_user_name:rds_database_username ->
  ?select_sql_query:rds_select_sql_query ->
  ?resource_role:edp_resource_role ->
  ?service_role:edp_service_role ->
  ?data_pipeline_id:edp_pipeline_id ->
  unit ->
  rds_metadata

val make_redshift_database :
  database_name:redshift_database_name ->
  cluster_identifier:redshift_cluster_identifier ->
  unit ->
  redshift_database

val make_redshift_metadata :
  ?redshift_database:redshift_database ->
  ?database_user_name:redshift_database_username ->
  ?select_sql_query:redshift_select_sql_query ->
  unit ->
  redshift_metadata

val make_get_data_source_output :
  ?data_source_id:entity_id ->
  ?data_location_s3:s3_url ->
  ?data_rearrangement:data_rearrangement ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?data_size_in_bytes:long_type ->
  ?number_of_files:long_type ->
  ?name:entity_name ->
  ?status:entity_status ->
  ?log_uri:presigned_s3_url ->
  ?message:message ->
  ?redshift_metadata:redshift_metadata ->
  ?rds_metadata:rds_metadata ->
  ?role_ar_n:role_ar_n ->
  ?compute_statistics:compute_statistics ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  ?data_source_schema:data_schema ->
  unit ->
  get_data_source_output

val make_get_data_source_input :
  ?verbose:verbose -> data_source_id:entity_id -> unit -> get_data_source_input

val make_get_batch_prediction_output :
  ?batch_prediction_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?batch_prediction_data_source_id:entity_id ->
  ?input_data_location_s3:s3_url ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?name:entity_name ->
  ?status:entity_status ->
  ?output_uri:s3_url ->
  ?log_uri:presigned_s3_url ->
  ?message:message ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  ?total_record_count:long_type ->
  ?invalid_record_count:long_type ->
  unit ->
  get_batch_prediction_output

val make_get_batch_prediction_input :
  batch_prediction_id:entity_id -> unit -> get_batch_prediction_input

val make_describe_tags_output :
  ?resource_id:entity_id ->
  ?resource_type:taggable_resource_type ->
  ?tags:tag_list ->
  unit ->
  describe_tags_output

val make_describe_tags_input :
  resource_id:entity_id -> resource_type:taggable_resource_type -> unit -> describe_tags_input

val make_ml_model :
  ?ml_model_id:entity_id ->
  ?training_data_source_id:entity_id ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?name:ml_model_name ->
  ?status:entity_status ->
  ?size_in_bytes:long_type ->
  ?endpoint_info:realtime_endpoint_info ->
  ?training_parameters:training_parameters ->
  ?input_data_location_s3:s3_url ->
  ?algorithm:algorithm ->
  ?ml_model_type:ml_model_type ->
  ?score_threshold:score_threshold ->
  ?score_threshold_last_updated_at:epoch_time ->
  ?message:message ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  unit ->
  ml_model

val make_describe_ml_models_output :
  ?results:ml_models -> ?next_token:string_type -> unit -> describe_ml_models_output

val make_describe_ml_models_input :
  ?filter_variable:ml_model_filter_variable ->
  ?e_q:comparator_value ->
  ?g_t:comparator_value ->
  ?l_t:comparator_value ->
  ?g_e:comparator_value ->
  ?l_e:comparator_value ->
  ?n_e:comparator_value ->
  ?prefix:comparator_value ->
  ?sort_order:sort_order ->
  ?next_token:string_type ->
  ?limit:page_limit ->
  unit ->
  describe_ml_models_input

val make_evaluation :
  ?evaluation_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?evaluation_data_source_id:entity_id ->
  ?input_data_location_s3:s3_url ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?name:entity_name ->
  ?status:entity_status ->
  ?performance_metrics:performance_metrics ->
  ?message:message ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  unit ->
  evaluation

val make_describe_evaluations_output :
  ?results:evaluations -> ?next_token:string_type -> unit -> describe_evaluations_output

val make_describe_evaluations_input :
  ?filter_variable:evaluation_filter_variable ->
  ?e_q:comparator_value ->
  ?g_t:comparator_value ->
  ?l_t:comparator_value ->
  ?g_e:comparator_value ->
  ?l_e:comparator_value ->
  ?n_e:comparator_value ->
  ?prefix:comparator_value ->
  ?sort_order:sort_order ->
  ?next_token:string_type ->
  ?limit:page_limit ->
  unit ->
  describe_evaluations_input

val make_data_source :
  ?data_source_id:entity_id ->
  ?data_location_s3:s3_url ->
  ?data_rearrangement:data_rearrangement ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?data_size_in_bytes:long_type ->
  ?number_of_files:long_type ->
  ?name:entity_name ->
  ?status:entity_status ->
  ?message:message ->
  ?redshift_metadata:redshift_metadata ->
  ?rds_metadata:rds_metadata ->
  ?role_ar_n:role_ar_n ->
  ?compute_statistics:compute_statistics ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  unit ->
  data_source

val make_describe_data_sources_output :
  ?results:data_sources -> ?next_token:string_type -> unit -> describe_data_sources_output

val make_describe_data_sources_input :
  ?filter_variable:data_source_filter_variable ->
  ?e_q:comparator_value ->
  ?g_t:comparator_value ->
  ?l_t:comparator_value ->
  ?g_e:comparator_value ->
  ?l_e:comparator_value ->
  ?n_e:comparator_value ->
  ?prefix:comparator_value ->
  ?sort_order:sort_order ->
  ?next_token:string_type ->
  ?limit:page_limit ->
  unit ->
  describe_data_sources_input

val make_batch_prediction :
  ?batch_prediction_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?batch_prediction_data_source_id:entity_id ->
  ?input_data_location_s3:s3_url ->
  ?created_by_iam_user:aws_user_arn ->
  ?created_at:epoch_time ->
  ?last_updated_at:epoch_time ->
  ?name:entity_name ->
  ?status:entity_status ->
  ?output_uri:s3_url ->
  ?message:message ->
  ?compute_time:long_type ->
  ?finished_at:epoch_time ->
  ?started_at:epoch_time ->
  ?total_record_count:long_type ->
  ?invalid_record_count:long_type ->
  unit ->
  batch_prediction

val make_describe_batch_predictions_output :
  ?results:batch_predictions -> ?next_token:string_type -> unit -> describe_batch_predictions_output

val make_describe_batch_predictions_input :
  ?filter_variable:batch_prediction_filter_variable ->
  ?e_q:comparator_value ->
  ?g_t:comparator_value ->
  ?l_t:comparator_value ->
  ?g_e:comparator_value ->
  ?l_e:comparator_value ->
  ?n_e:comparator_value ->
  ?prefix:comparator_value ->
  ?sort_order:sort_order ->
  ?next_token:string_type ->
  ?limit:page_limit ->
  unit ->
  describe_batch_predictions_input

val make_delete_tags_output :
  ?resource_id:entity_id -> ?resource_type:taggable_resource_type -> unit -> delete_tags_output

val make_delete_tags_input :
  tag_keys:tag_key_list ->
  resource_id:entity_id ->
  resource_type:taggable_resource_type ->
  unit ->
  delete_tags_input

val make_delete_realtime_endpoint_output :
  ?ml_model_id:entity_id ->
  ?realtime_endpoint_info:realtime_endpoint_info ->
  unit ->
  delete_realtime_endpoint_output

val make_delete_realtime_endpoint_input :
  ml_model_id:entity_id -> unit -> delete_realtime_endpoint_input

val make_delete_ml_model_output : ?ml_model_id:entity_id -> unit -> delete_ml_model_output
val make_delete_ml_model_input : ml_model_id:entity_id -> unit -> delete_ml_model_input
val make_delete_evaluation_output : ?evaluation_id:entity_id -> unit -> delete_evaluation_output
val make_delete_evaluation_input : evaluation_id:entity_id -> unit -> delete_evaluation_input
val make_delete_data_source_output : ?data_source_id:entity_id -> unit -> delete_data_source_output
val make_delete_data_source_input : data_source_id:entity_id -> unit -> delete_data_source_input

val make_delete_batch_prediction_output :
  ?batch_prediction_id:entity_id -> unit -> delete_batch_prediction_output

val make_delete_batch_prediction_input :
  batch_prediction_id:entity_id -> unit -> delete_batch_prediction_input

val make_create_realtime_endpoint_output :
  ?ml_model_id:entity_id ->
  ?realtime_endpoint_info:realtime_endpoint_info ->
  unit ->
  create_realtime_endpoint_output

val make_create_realtime_endpoint_input :
  ml_model_id:entity_id -> unit -> create_realtime_endpoint_input

val make_create_ml_model_output : ?ml_model_id:entity_id -> unit -> create_ml_model_output

val make_create_ml_model_input :
  ?ml_model_name:entity_name ->
  ?parameters:training_parameters ->
  ?recipe:recipe ->
  ?recipe_uri:s3_url ->
  ml_model_id:entity_id ->
  ml_model_type:ml_model_type ->
  training_data_source_id:entity_id ->
  unit ->
  create_ml_model_input

val make_create_evaluation_output : ?evaluation_id:entity_id -> unit -> create_evaluation_output

val make_create_evaluation_input :
  ?evaluation_name:entity_name ->
  evaluation_id:entity_id ->
  ml_model_id:entity_id ->
  evaluation_data_source_id:entity_id ->
  unit ->
  create_evaluation_input

val make_create_data_source_from_s3_output :
  ?data_source_id:entity_id -> unit -> create_data_source_from_s3_output

val make_s3_data_spec :
  ?data_rearrangement:data_rearrangement ->
  ?data_schema:data_schema ->
  ?data_schema_location_s3:s3_url ->
  data_location_s3:s3_url ->
  unit ->
  s3_data_spec

val make_create_data_source_from_s3_input :
  ?data_source_name:entity_name ->
  ?compute_statistics:compute_statistics ->
  data_source_id:entity_id ->
  data_spec:s3_data_spec ->
  unit ->
  create_data_source_from_s3_input

val make_create_data_source_from_redshift_output :
  ?data_source_id:entity_id -> unit -> create_data_source_from_redshift_output

val make_redshift_database_credentials :
  username:redshift_database_username ->
  password:redshift_database_password ->
  unit ->
  redshift_database_credentials

val make_redshift_data_spec :
  ?data_rearrangement:data_rearrangement ->
  ?data_schema:data_schema ->
  ?data_schema_uri:s3_url ->
  database_information:redshift_database ->
  select_sql_query:redshift_select_sql_query ->
  database_credentials:redshift_database_credentials ->
  s3_staging_location:s3_url ->
  unit ->
  redshift_data_spec

val make_create_data_source_from_redshift_input :
  ?data_source_name:entity_name ->
  ?compute_statistics:compute_statistics ->
  data_source_id:entity_id ->
  data_spec:redshift_data_spec ->
  role_ar_n:role_ar_n ->
  unit ->
  create_data_source_from_redshift_input

val make_create_data_source_from_rds_output :
  ?data_source_id:entity_id -> unit -> create_data_source_from_rds_output

val make_rds_database_credentials :
  username:rds_database_username ->
  password:rds_database_password ->
  unit ->
  rds_database_credentials

val make_rds_data_spec :
  ?data_rearrangement:data_rearrangement ->
  ?data_schema:data_schema ->
  ?data_schema_uri:s3_url ->
  database_information:rds_database ->
  select_sql_query:rds_select_sql_query ->
  database_credentials:rds_database_credentials ->
  s3_staging_location:s3_url ->
  resource_role:edp_resource_role ->
  service_role:edp_service_role ->
  subnet_id:edp_subnet_id ->
  security_group_ids:edp_security_group_ids ->
  unit ->
  rds_data_spec

val make_create_data_source_from_rds_input :
  ?data_source_name:entity_name ->
  ?compute_statistics:compute_statistics ->
  data_source_id:entity_id ->
  rds_data:rds_data_spec ->
  role_ar_n:role_ar_n ->
  unit ->
  create_data_source_from_rds_input

val make_create_batch_prediction_output :
  ?batch_prediction_id:entity_id -> unit -> create_batch_prediction_output

val make_create_batch_prediction_input :
  ?batch_prediction_name:entity_name ->
  batch_prediction_id:entity_id ->
  ml_model_id:entity_id ->
  batch_prediction_data_source_id:entity_id ->
  output_uri:s3_url ->
  unit ->
  create_batch_prediction_input
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
