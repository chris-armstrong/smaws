open Types

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
