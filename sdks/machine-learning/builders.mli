open Types

val make_update_ml_model_output : ?ml_model_id:entity_id -> unit -> update_ml_model_output

val make_update_ml_model_input :
  ?score_threshold:score_threshold ->
  ?ml_model_name:entity_name ->
  ml_model_id:entity_id ->
  unit ->
  update_ml_model_input

val make_update_evaluation_output : ?evaluation_id:entity_id -> unit -> update_evaluation_output

val make_update_evaluation_input :
  evaluation_name:entity_name -> evaluation_id:entity_id -> unit -> update_evaluation_input

val make_update_data_source_output : ?data_source_id:entity_id -> unit -> update_data_source_output

val make_update_data_source_input :
  data_source_name:entity_name -> data_source_id:entity_id -> unit -> update_data_source_input

val make_update_batch_prediction_output :
  ?batch_prediction_id:entity_id -> unit -> update_batch_prediction_output

val make_update_batch_prediction_input :
  batch_prediction_name:entity_name ->
  batch_prediction_id:entity_id ->
  unit ->
  update_batch_prediction_input

val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_s3_data_spec :
  ?data_schema_location_s3:s3_url ->
  ?data_schema:data_schema ->
  ?data_rearrangement:data_rearrangement ->
  data_location_s3:s3_url ->
  unit ->
  s3_data_spec

val make_redshift_database :
  cluster_identifier:redshift_cluster_identifier ->
  database_name:redshift_database_name ->
  unit ->
  redshift_database

val make_redshift_metadata :
  ?select_sql_query:redshift_select_sql_query ->
  ?database_user_name:redshift_database_username ->
  ?redshift_database:redshift_database ->
  unit ->
  redshift_metadata

val make_redshift_database_credentials :
  password:redshift_database_password ->
  username:redshift_database_username ->
  unit ->
  redshift_database_credentials

val make_redshift_data_spec :
  ?data_schema_uri:s3_url ->
  ?data_schema:data_schema ->
  ?data_rearrangement:data_rearrangement ->
  s3_staging_location:s3_url ->
  database_credentials:redshift_database_credentials ->
  select_sql_query:redshift_select_sql_query ->
  database_information:redshift_database ->
  unit ->
  redshift_data_spec

val make_realtime_endpoint_info :
  ?endpoint_status:realtime_endpoint_status ->
  ?endpoint_url:vip_ur_l ->
  ?created_at:epoch_time ->
  ?peak_requests_per_second:integer_type ->
  unit ->
  realtime_endpoint_info

val make_rds_database :
  database_name:rds_database_name ->
  instance_identifier:rds_instance_identifier ->
  unit ->
  rds_database

val make_rds_metadata :
  ?data_pipeline_id:edp_pipeline_id ->
  ?service_role:edp_service_role ->
  ?resource_role:edp_resource_role ->
  ?select_sql_query:rds_select_sql_query ->
  ?database_user_name:rds_database_username ->
  ?database:rds_database ->
  unit ->
  rds_metadata

val make_rds_database_credentials :
  password:rds_database_password ->
  username:rds_database_username ->
  unit ->
  rds_database_credentials

val make_rds_data_spec :
  ?data_schema_uri:s3_url ->
  ?data_schema:data_schema ->
  ?data_rearrangement:data_rearrangement ->
  security_group_ids:edp_security_group_ids ->
  subnet_id:edp_subnet_id ->
  service_role:edp_service_role ->
  resource_role:edp_resource_role ->
  s3_staging_location:s3_url ->
  database_credentials:rds_database_credentials ->
  select_sql_query:rds_select_sql_query ->
  database_information:rds_database ->
  unit ->
  rds_data_spec

val make_prediction :
  ?details:details_map ->
  ?predicted_scores:score_value_per_label_map ->
  ?predicted_value:float_label ->
  ?predicted_label:label ->
  unit ->
  prediction

val make_predict_output : ?prediction:prediction -> unit -> predict_output

val make_predict_input :
  predict_endpoint:vip_ur_l -> record:record -> ml_model_id:entity_id -> unit -> predict_input

val make_performance_metrics :
  ?properties:performance_metrics_properties -> unit -> performance_metrics

val make_ml_model :
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?message:message ->
  ?score_threshold_last_updated_at:epoch_time ->
  ?score_threshold:score_threshold ->
  ?ml_model_type:ml_model_type ->
  ?algorithm:algorithm ->
  ?input_data_location_s3:s3_url ->
  ?training_parameters:training_parameters ->
  ?endpoint_info:realtime_endpoint_info ->
  ?size_in_bytes:long_type ->
  ?status:entity_status ->
  ?name:ml_model_name ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?training_data_source_id:entity_id ->
  ?ml_model_id:entity_id ->
  unit ->
  ml_model

val make_get_ml_model_output :
  ?schema:data_schema ->
  ?recipe:recipe ->
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?message:message ->
  ?log_uri:presigned_s3_url ->
  ?score_threshold_last_updated_at:epoch_time ->
  ?score_threshold:score_threshold ->
  ?ml_model_type:ml_model_type ->
  ?input_data_location_s3:s3_url ->
  ?training_parameters:training_parameters ->
  ?endpoint_info:realtime_endpoint_info ->
  ?size_in_bytes:long_type ->
  ?status:entity_status ->
  ?name:ml_model_name ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?training_data_source_id:entity_id ->
  ?ml_model_id:entity_id ->
  unit ->
  get_ml_model_output

val make_get_ml_model_input :
  ?verbose:verbose -> ml_model_id:entity_id -> unit -> get_ml_model_input

val make_get_evaluation_output :
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?message:message ->
  ?log_uri:presigned_s3_url ->
  ?performance_metrics:performance_metrics ->
  ?status:entity_status ->
  ?name:entity_name ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?input_data_location_s3:s3_url ->
  ?evaluation_data_source_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?evaluation_id:entity_id ->
  unit ->
  get_evaluation_output

val make_get_evaluation_input : evaluation_id:entity_id -> unit -> get_evaluation_input

val make_get_data_source_output :
  ?data_source_schema:data_schema ->
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?compute_statistics:compute_statistics ->
  ?role_ar_n:role_ar_n ->
  ?rds_metadata:rds_metadata ->
  ?redshift_metadata:redshift_metadata ->
  ?message:message ->
  ?log_uri:presigned_s3_url ->
  ?status:entity_status ->
  ?name:entity_name ->
  ?number_of_files:long_type ->
  ?data_size_in_bytes:long_type ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?data_rearrangement:data_rearrangement ->
  ?data_location_s3:s3_url ->
  ?data_source_id:entity_id ->
  unit ->
  get_data_source_output

val make_get_data_source_input :
  ?verbose:verbose -> data_source_id:entity_id -> unit -> get_data_source_input

val make_get_batch_prediction_output :
  ?invalid_record_count:long_type ->
  ?total_record_count:long_type ->
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?message:message ->
  ?log_uri:presigned_s3_url ->
  ?output_uri:s3_url ->
  ?status:entity_status ->
  ?name:entity_name ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?input_data_location_s3:s3_url ->
  ?batch_prediction_data_source_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?batch_prediction_id:entity_id ->
  unit ->
  get_batch_prediction_output

val make_get_batch_prediction_input :
  batch_prediction_id:entity_id -> unit -> get_batch_prediction_input

val make_evaluation :
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?message:message ->
  ?performance_metrics:performance_metrics ->
  ?status:entity_status ->
  ?name:entity_name ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?input_data_location_s3:s3_url ->
  ?evaluation_data_source_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?evaluation_id:entity_id ->
  unit ->
  evaluation

val make_describe_tags_output :
  ?tags:tag_list ->
  ?resource_type:taggable_resource_type ->
  ?resource_id:entity_id ->
  unit ->
  describe_tags_output

val make_describe_tags_input :
  resource_type:taggable_resource_type -> resource_id:entity_id -> unit -> describe_tags_input

val make_describe_ml_models_output :
  ?next_token:string_type -> ?results:ml_models -> unit -> describe_ml_models_output

val make_describe_ml_models_input :
  ?limit:page_limit ->
  ?next_token:string_type ->
  ?sort_order:sort_order ->
  ?prefix:comparator_value ->
  ?n_e:comparator_value ->
  ?l_e:comparator_value ->
  ?g_e:comparator_value ->
  ?l_t:comparator_value ->
  ?g_t:comparator_value ->
  ?e_q:comparator_value ->
  ?filter_variable:ml_model_filter_variable ->
  unit ->
  describe_ml_models_input

val make_describe_evaluations_output :
  ?next_token:string_type -> ?results:evaluations -> unit -> describe_evaluations_output

val make_describe_evaluations_input :
  ?limit:page_limit ->
  ?next_token:string_type ->
  ?sort_order:sort_order ->
  ?prefix:comparator_value ->
  ?n_e:comparator_value ->
  ?l_e:comparator_value ->
  ?g_e:comparator_value ->
  ?l_t:comparator_value ->
  ?g_t:comparator_value ->
  ?e_q:comparator_value ->
  ?filter_variable:evaluation_filter_variable ->
  unit ->
  describe_evaluations_input

val make_data_source :
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?compute_statistics:compute_statistics ->
  ?role_ar_n:role_ar_n ->
  ?rds_metadata:rds_metadata ->
  ?redshift_metadata:redshift_metadata ->
  ?message:message ->
  ?status:entity_status ->
  ?name:entity_name ->
  ?number_of_files:long_type ->
  ?data_size_in_bytes:long_type ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?data_rearrangement:data_rearrangement ->
  ?data_location_s3:s3_url ->
  ?data_source_id:entity_id ->
  unit ->
  data_source

val make_describe_data_sources_output :
  ?next_token:string_type -> ?results:data_sources -> unit -> describe_data_sources_output

val make_describe_data_sources_input :
  ?limit:page_limit ->
  ?next_token:string_type ->
  ?sort_order:sort_order ->
  ?prefix:comparator_value ->
  ?n_e:comparator_value ->
  ?l_e:comparator_value ->
  ?g_e:comparator_value ->
  ?l_t:comparator_value ->
  ?g_t:comparator_value ->
  ?e_q:comparator_value ->
  ?filter_variable:data_source_filter_variable ->
  unit ->
  describe_data_sources_input

val make_batch_prediction :
  ?invalid_record_count:long_type ->
  ?total_record_count:long_type ->
  ?started_at:epoch_time ->
  ?finished_at:epoch_time ->
  ?compute_time:long_type ->
  ?message:message ->
  ?output_uri:s3_url ->
  ?status:entity_status ->
  ?name:entity_name ->
  ?last_updated_at:epoch_time ->
  ?created_at:epoch_time ->
  ?created_by_iam_user:aws_user_arn ->
  ?input_data_location_s3:s3_url ->
  ?batch_prediction_data_source_id:entity_id ->
  ?ml_model_id:entity_id ->
  ?batch_prediction_id:entity_id ->
  unit ->
  batch_prediction

val make_describe_batch_predictions_output :
  ?next_token:string_type -> ?results:batch_predictions -> unit -> describe_batch_predictions_output

val make_describe_batch_predictions_input :
  ?limit:page_limit ->
  ?next_token:string_type ->
  ?sort_order:sort_order ->
  ?prefix:comparator_value ->
  ?n_e:comparator_value ->
  ?l_e:comparator_value ->
  ?g_e:comparator_value ->
  ?l_t:comparator_value ->
  ?g_t:comparator_value ->
  ?e_q:comparator_value ->
  ?filter_variable:batch_prediction_filter_variable ->
  unit ->
  describe_batch_predictions_input

val make_delete_tags_output :
  ?resource_type:taggable_resource_type -> ?resource_id:entity_id -> unit -> delete_tags_output

val make_delete_tags_input :
  resource_type:taggable_resource_type ->
  resource_id:entity_id ->
  tag_keys:tag_key_list ->
  unit ->
  delete_tags_input

val make_delete_realtime_endpoint_output :
  ?realtime_endpoint_info:realtime_endpoint_info ->
  ?ml_model_id:entity_id ->
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
  ?realtime_endpoint_info:realtime_endpoint_info ->
  ?ml_model_id:entity_id ->
  unit ->
  create_realtime_endpoint_output

val make_create_realtime_endpoint_input :
  ml_model_id:entity_id -> unit -> create_realtime_endpoint_input

val make_create_ml_model_output : ?ml_model_id:entity_id -> unit -> create_ml_model_output

val make_create_ml_model_input :
  ?recipe_uri:s3_url ->
  ?recipe:recipe ->
  ?parameters:training_parameters ->
  ?ml_model_name:entity_name ->
  training_data_source_id:entity_id ->
  ml_model_type:ml_model_type ->
  ml_model_id:entity_id ->
  unit ->
  create_ml_model_input

val make_create_evaluation_output : ?evaluation_id:entity_id -> unit -> create_evaluation_output

val make_create_evaluation_input :
  ?evaluation_name:entity_name ->
  evaluation_data_source_id:entity_id ->
  ml_model_id:entity_id ->
  evaluation_id:entity_id ->
  unit ->
  create_evaluation_input

val make_create_data_source_from_s3_output :
  ?data_source_id:entity_id -> unit -> create_data_source_from_s3_output

val make_create_data_source_from_s3_input :
  ?compute_statistics:compute_statistics ->
  ?data_source_name:entity_name ->
  data_spec:s3_data_spec ->
  data_source_id:entity_id ->
  unit ->
  create_data_source_from_s3_input

val make_create_data_source_from_redshift_output :
  ?data_source_id:entity_id -> unit -> create_data_source_from_redshift_output

val make_create_data_source_from_redshift_input :
  ?compute_statistics:compute_statistics ->
  ?data_source_name:entity_name ->
  role_ar_n:role_ar_n ->
  data_spec:redshift_data_spec ->
  data_source_id:entity_id ->
  unit ->
  create_data_source_from_redshift_input

val make_create_data_source_from_rds_output :
  ?data_source_id:entity_id -> unit -> create_data_source_from_rds_output

val make_create_data_source_from_rds_input :
  ?compute_statistics:compute_statistics ->
  ?data_source_name:entity_name ->
  role_ar_n:role_ar_n ->
  rds_data:rds_data_spec ->
  data_source_id:entity_id ->
  unit ->
  create_data_source_from_rds_input

val make_create_batch_prediction_output :
  ?batch_prediction_id:entity_id -> unit -> create_batch_prediction_output

val make_create_batch_prediction_input :
  ?batch_prediction_name:entity_name ->
  output_uri:s3_url ->
  batch_prediction_data_source_id:entity_id ->
  ml_model_id:entity_id ->
  batch_prediction_id:entity_id ->
  unit ->
  create_batch_prediction_input

val make_add_tags_output :
  ?resource_type:taggable_resource_type -> ?resource_id:entity_id -> unit -> add_tags_output

val make_add_tags_input :
  resource_type:taggable_resource_type ->
  resource_id:entity_id ->
  tags:tag_list ->
  unit ->
  add_tags_input
