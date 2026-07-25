open Types

let make_add_tags_output ?resource_id:(resource_id_ : entity_id option)
    ?resource_type:(resource_type_ : taggable_resource_type option) () =
  ({ resource_id = resource_id_; resource_type = resource_type_ } : add_tags_output)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_input ~tags:(tags_ : tag_list) ~resource_id:(resource_id_ : entity_id)
    ~resource_type:(resource_type_ : taggable_resource_type) () =
  ({ tags = tags_; resource_id = resource_id_; resource_type = resource_type_ } : add_tags_input)

let make_update_ml_model_output ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({ ml_model_id = ml_model_id_ } : update_ml_model_output)

let make_update_ml_model_input ?ml_model_name:(ml_model_name_ : entity_name option)
    ?score_threshold:(score_threshold_ : score_threshold option)
    ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({
     ml_model_id = ml_model_id_;
     ml_model_name = ml_model_name_;
     score_threshold = score_threshold_;
   }
    : update_ml_model_input)

let make_update_evaluation_output ?evaluation_id:(evaluation_id_ : entity_id option) () =
  ({ evaluation_id = evaluation_id_ } : update_evaluation_output)

let make_update_evaluation_input ~evaluation_id:(evaluation_id_ : entity_id)
    ~evaluation_name:(evaluation_name_ : entity_name) () =
  ({ evaluation_id = evaluation_id_; evaluation_name = evaluation_name_ } : update_evaluation_input)

let make_update_data_source_output ?data_source_id:(data_source_id_ : entity_id option) () =
  ({ data_source_id = data_source_id_ } : update_data_source_output)

let make_update_data_source_input ~data_source_id:(data_source_id_ : entity_id)
    ~data_source_name:(data_source_name_ : entity_name) () =
  ({ data_source_id = data_source_id_; data_source_name = data_source_name_ }
    : update_data_source_input)

let make_update_batch_prediction_output
    ?batch_prediction_id:(batch_prediction_id_ : entity_id option) () =
  ({ batch_prediction_id = batch_prediction_id_ } : update_batch_prediction_output)

let make_update_batch_prediction_input ~batch_prediction_id:(batch_prediction_id_ : entity_id)
    ~batch_prediction_name:(batch_prediction_name_ : entity_name) () =
  ({ batch_prediction_id = batch_prediction_id_; batch_prediction_name = batch_prediction_name_ }
    : update_batch_prediction_input)

let make_prediction ?predicted_label:(predicted_label_ : label option)
    ?predicted_value:(predicted_value_ : float_label option)
    ?predicted_scores:(predicted_scores_ : score_value_per_label_map option)
    ?details:(details_ : details_map option) () =
  ({
     predicted_label = predicted_label_;
     predicted_value = predicted_value_;
     predicted_scores = predicted_scores_;
     details = details_;
   }
    : prediction)

let make_predict_output ?prediction:(prediction_ : prediction option) () =
  ({ prediction = prediction_ } : predict_output)

let make_predict_input ~ml_model_id:(ml_model_id_ : entity_id) ~record:(record_ : record)
    ~predict_endpoint:(predict_endpoint_ : vip_ur_l) () =
  ({ ml_model_id = ml_model_id_; record = record_; predict_endpoint = predict_endpoint_ }
    : predict_input)

let make_realtime_endpoint_info
    ?peak_requests_per_second:(peak_requests_per_second_ : integer_type option)
    ?created_at:(created_at_ : epoch_time option) ?endpoint_url:(endpoint_url_ : vip_ur_l option)
    ?endpoint_status:(endpoint_status_ : realtime_endpoint_status option) () =
  ({
     peak_requests_per_second = peak_requests_per_second_;
     created_at = created_at_;
     endpoint_url = endpoint_url_;
     endpoint_status = endpoint_status_;
   }
    : realtime_endpoint_info)

let make_get_ml_model_output ?ml_model_id:(ml_model_id_ : entity_id option)
    ?training_data_source_id:(training_data_source_id_ : entity_id option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option) ?name:(name_ : ml_model_name option)
    ?status:(status_ : entity_status option) ?size_in_bytes:(size_in_bytes_ : long_type option)
    ?endpoint_info:(endpoint_info_ : realtime_endpoint_info option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?ml_model_type:(ml_model_type_ : ml_model_type option)
    ?score_threshold:(score_threshold_ : score_threshold option)
    ?score_threshold_last_updated_at:(score_threshold_last_updated_at_ : epoch_time option)
    ?log_uri:(log_uri_ : presigned_s3_url option) ?message:(message_ : message option)
    ?compute_time:(compute_time_ : long_type option) ?finished_at:(finished_at_ : epoch_time option)
    ?started_at:(started_at_ : epoch_time option) ?recipe:(recipe_ : recipe option)
    ?schema:(schema_ : data_schema option) () =
  ({
     ml_model_id = ml_model_id_;
     training_data_source_id = training_data_source_id_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     name = name_;
     status = status_;
     size_in_bytes = size_in_bytes_;
     endpoint_info = endpoint_info_;
     training_parameters = training_parameters_;
     input_data_location_s3 = input_data_location_s3_;
     ml_model_type = ml_model_type_;
     score_threshold = score_threshold_;
     score_threshold_last_updated_at = score_threshold_last_updated_at_;
     log_uri = log_uri_;
     message = message_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
     recipe = recipe_;
     schema = schema_;
   }
    : get_ml_model_output)

let make_get_ml_model_input ?verbose:(verbose_ : verbose option)
    ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({ ml_model_id = ml_model_id_; verbose = verbose_ } : get_ml_model_input)

let make_performance_metrics ?properties:(properties_ : performance_metrics_properties option) () =
  ({ properties = properties_ } : performance_metrics)

let make_get_evaluation_output ?evaluation_id:(evaluation_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?evaluation_data_source_id:(evaluation_data_source_id_ : entity_id option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option) ?name:(name_ : entity_name option)
    ?status:(status_ : entity_status option)
    ?performance_metrics:(performance_metrics_ : performance_metrics option)
    ?log_uri:(log_uri_ : presigned_s3_url option) ?message:(message_ : message option)
    ?compute_time:(compute_time_ : long_type option) ?finished_at:(finished_at_ : epoch_time option)
    ?started_at:(started_at_ : epoch_time option) () =
  ({
     evaluation_id = evaluation_id_;
     ml_model_id = ml_model_id_;
     evaluation_data_source_id = evaluation_data_source_id_;
     input_data_location_s3 = input_data_location_s3_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     name = name_;
     status = status_;
     performance_metrics = performance_metrics_;
     log_uri = log_uri_;
     message = message_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
   }
    : get_evaluation_output)

let make_get_evaluation_input ~evaluation_id:(evaluation_id_ : entity_id) () =
  ({ evaluation_id = evaluation_id_ } : get_evaluation_input)

let make_rds_database ~instance_identifier:(instance_identifier_ : rds_instance_identifier)
    ~database_name:(database_name_ : rds_database_name) () =
  ({ instance_identifier = instance_identifier_; database_name = database_name_ } : rds_database)

let make_rds_metadata ?database:(database_ : rds_database option)
    ?database_user_name:(database_user_name_ : rds_database_username option)
    ?select_sql_query:(select_sql_query_ : rds_select_sql_query option)
    ?resource_role:(resource_role_ : edp_resource_role option)
    ?service_role:(service_role_ : edp_service_role option)
    ?data_pipeline_id:(data_pipeline_id_ : edp_pipeline_id option) () =
  ({
     database = database_;
     database_user_name = database_user_name_;
     select_sql_query = select_sql_query_;
     resource_role = resource_role_;
     service_role = service_role_;
     data_pipeline_id = data_pipeline_id_;
   }
    : rds_metadata)

let make_redshift_database ~database_name:(database_name_ : redshift_database_name)
    ~cluster_identifier:(cluster_identifier_ : redshift_cluster_identifier) () =
  ({ database_name = database_name_; cluster_identifier = cluster_identifier_ } : redshift_database)

let make_redshift_metadata ?redshift_database:(redshift_database_ : redshift_database option)
    ?database_user_name:(database_user_name_ : redshift_database_username option)
    ?select_sql_query:(select_sql_query_ : redshift_select_sql_query option) () =
  ({
     redshift_database = redshift_database_;
     database_user_name = database_user_name_;
     select_sql_query = select_sql_query_;
   }
    : redshift_metadata)

let make_get_data_source_output ?data_source_id:(data_source_id_ : entity_id option)
    ?data_location_s3:(data_location_s3_ : s3_url option)
    ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?data_size_in_bytes:(data_size_in_bytes_ : long_type option)
    ?number_of_files:(number_of_files_ : long_type option) ?name:(name_ : entity_name option)
    ?status:(status_ : entity_status option) ?log_uri:(log_uri_ : presigned_s3_url option)
    ?message:(message_ : message option)
    ?redshift_metadata:(redshift_metadata_ : redshift_metadata option)
    ?rds_metadata:(rds_metadata_ : rds_metadata option) ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ?compute_time:(compute_time_ : long_type option) ?finished_at:(finished_at_ : epoch_time option)
    ?started_at:(started_at_ : epoch_time option)
    ?data_source_schema:(data_source_schema_ : data_schema option) () =
  ({
     data_source_id = data_source_id_;
     data_location_s3 = data_location_s3_;
     data_rearrangement = data_rearrangement_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     data_size_in_bytes = data_size_in_bytes_;
     number_of_files = number_of_files_;
     name = name_;
     status = status_;
     log_uri = log_uri_;
     message = message_;
     redshift_metadata = redshift_metadata_;
     rds_metadata = rds_metadata_;
     role_ar_n = role_ar_n_;
     compute_statistics = compute_statistics_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
     data_source_schema = data_source_schema_;
   }
    : get_data_source_output)

let make_get_data_source_input ?verbose:(verbose_ : verbose option)
    ~data_source_id:(data_source_id_ : entity_id) () =
  ({ data_source_id = data_source_id_; verbose = verbose_ } : get_data_source_input)

let make_get_batch_prediction_output ?batch_prediction_id:(batch_prediction_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?batch_prediction_data_source_id:(batch_prediction_data_source_id_ : entity_id option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option) ?name:(name_ : entity_name option)
    ?status:(status_ : entity_status option) ?output_uri:(output_uri_ : s3_url option)
    ?log_uri:(log_uri_ : presigned_s3_url option) ?message:(message_ : message option)
    ?compute_time:(compute_time_ : long_type option) ?finished_at:(finished_at_ : epoch_time option)
    ?started_at:(started_at_ : epoch_time option)
    ?total_record_count:(total_record_count_ : long_type option)
    ?invalid_record_count:(invalid_record_count_ : long_type option) () =
  ({
     batch_prediction_id = batch_prediction_id_;
     ml_model_id = ml_model_id_;
     batch_prediction_data_source_id = batch_prediction_data_source_id_;
     input_data_location_s3 = input_data_location_s3_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     name = name_;
     status = status_;
     output_uri = output_uri_;
     log_uri = log_uri_;
     message = message_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
     total_record_count = total_record_count_;
     invalid_record_count = invalid_record_count_;
   }
    : get_batch_prediction_output)

let make_get_batch_prediction_input ~batch_prediction_id:(batch_prediction_id_ : entity_id) () =
  ({ batch_prediction_id = batch_prediction_id_ } : get_batch_prediction_input)

let make_describe_tags_output ?resource_id:(resource_id_ : entity_id option)
    ?resource_type:(resource_type_ : taggable_resource_type option) ?tags:(tags_ : tag_list option)
    () =
  ({ resource_id = resource_id_; resource_type = resource_type_; tags = tags_ }
    : describe_tags_output)

let make_describe_tags_input ~resource_id:(resource_id_ : entity_id)
    ~resource_type:(resource_type_ : taggable_resource_type) () =
  ({ resource_id = resource_id_; resource_type = resource_type_ } : describe_tags_input)

let make_ml_model ?ml_model_id:(ml_model_id_ : entity_id option)
    ?training_data_source_id:(training_data_source_id_ : entity_id option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option) ?name:(name_ : ml_model_name option)
    ?status:(status_ : entity_status option) ?size_in_bytes:(size_in_bytes_ : long_type option)
    ?endpoint_info:(endpoint_info_ : realtime_endpoint_info option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?algorithm:(algorithm_ : algorithm option)
    ?ml_model_type:(ml_model_type_ : ml_model_type option)
    ?score_threshold:(score_threshold_ : score_threshold option)
    ?score_threshold_last_updated_at:(score_threshold_last_updated_at_ : epoch_time option)
    ?message:(message_ : message option) ?compute_time:(compute_time_ : long_type option)
    ?finished_at:(finished_at_ : epoch_time option) ?started_at:(started_at_ : epoch_time option) ()
    =
  ({
     ml_model_id = ml_model_id_;
     training_data_source_id = training_data_source_id_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     name = name_;
     status = status_;
     size_in_bytes = size_in_bytes_;
     endpoint_info = endpoint_info_;
     training_parameters = training_parameters_;
     input_data_location_s3 = input_data_location_s3_;
     algorithm = algorithm_;
     ml_model_type = ml_model_type_;
     score_threshold = score_threshold_;
     score_threshold_last_updated_at = score_threshold_last_updated_at_;
     message = message_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
   }
    : ml_model)

let make_describe_ml_models_output ?results:(results_ : ml_models option)
    ?next_token:(next_token_ : string_type option) () =
  ({ results = results_; next_token = next_token_ } : describe_ml_models_output)

let make_describe_ml_models_input
    ?filter_variable:(filter_variable_ : ml_model_filter_variable option)
    ?e_q:(e_q_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?prefix:(prefix_ : comparator_value option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : string_type option) ?limit:(limit_ : page_limit option) () =
  ({
     filter_variable = filter_variable_;
     e_q = e_q_;
     g_t = g_t_;
     l_t = l_t_;
     g_e = g_e_;
     l_e = l_e_;
     n_e = n_e_;
     prefix = prefix_;
     sort_order = sort_order_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_ml_models_input)

let make_evaluation ?evaluation_id:(evaluation_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?evaluation_data_source_id:(evaluation_data_source_id_ : entity_id option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option) ?name:(name_ : entity_name option)
    ?status:(status_ : entity_status option)
    ?performance_metrics:(performance_metrics_ : performance_metrics option)
    ?message:(message_ : message option) ?compute_time:(compute_time_ : long_type option)
    ?finished_at:(finished_at_ : epoch_time option) ?started_at:(started_at_ : epoch_time option) ()
    =
  ({
     evaluation_id = evaluation_id_;
     ml_model_id = ml_model_id_;
     evaluation_data_source_id = evaluation_data_source_id_;
     input_data_location_s3 = input_data_location_s3_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     name = name_;
     status = status_;
     performance_metrics = performance_metrics_;
     message = message_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
   }
    : evaluation)

let make_describe_evaluations_output ?results:(results_ : evaluations option)
    ?next_token:(next_token_ : string_type option) () =
  ({ results = results_; next_token = next_token_ } : describe_evaluations_output)

let make_describe_evaluations_input
    ?filter_variable:(filter_variable_ : evaluation_filter_variable option)
    ?e_q:(e_q_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?prefix:(prefix_ : comparator_value option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : string_type option) ?limit:(limit_ : page_limit option) () =
  ({
     filter_variable = filter_variable_;
     e_q = e_q_;
     g_t = g_t_;
     l_t = l_t_;
     g_e = g_e_;
     l_e = l_e_;
     n_e = n_e_;
     prefix = prefix_;
     sort_order = sort_order_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_evaluations_input)

let make_data_source ?data_source_id:(data_source_id_ : entity_id option)
    ?data_location_s3:(data_location_s3_ : s3_url option)
    ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?data_size_in_bytes:(data_size_in_bytes_ : long_type option)
    ?number_of_files:(number_of_files_ : long_type option) ?name:(name_ : entity_name option)
    ?status:(status_ : entity_status option) ?message:(message_ : message option)
    ?redshift_metadata:(redshift_metadata_ : redshift_metadata option)
    ?rds_metadata:(rds_metadata_ : rds_metadata option) ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ?compute_time:(compute_time_ : long_type option) ?finished_at:(finished_at_ : epoch_time option)
    ?started_at:(started_at_ : epoch_time option) () =
  ({
     data_source_id = data_source_id_;
     data_location_s3 = data_location_s3_;
     data_rearrangement = data_rearrangement_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     data_size_in_bytes = data_size_in_bytes_;
     number_of_files = number_of_files_;
     name = name_;
     status = status_;
     message = message_;
     redshift_metadata = redshift_metadata_;
     rds_metadata = rds_metadata_;
     role_ar_n = role_ar_n_;
     compute_statistics = compute_statistics_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
   }
    : data_source)

let make_describe_data_sources_output ?results:(results_ : data_sources option)
    ?next_token:(next_token_ : string_type option) () =
  ({ results = results_; next_token = next_token_ } : describe_data_sources_output)

let make_describe_data_sources_input
    ?filter_variable:(filter_variable_ : data_source_filter_variable option)
    ?e_q:(e_q_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?prefix:(prefix_ : comparator_value option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : string_type option) ?limit:(limit_ : page_limit option) () =
  ({
     filter_variable = filter_variable_;
     e_q = e_q_;
     g_t = g_t_;
     l_t = l_t_;
     g_e = g_e_;
     l_e = l_e_;
     n_e = n_e_;
     prefix = prefix_;
     sort_order = sort_order_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_data_sources_input)

let make_batch_prediction ?batch_prediction_id:(batch_prediction_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?batch_prediction_data_source_id:(batch_prediction_data_source_id_ : entity_id option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?created_at:(created_at_ : epoch_time option)
    ?last_updated_at:(last_updated_at_ : epoch_time option) ?name:(name_ : entity_name option)
    ?status:(status_ : entity_status option) ?output_uri:(output_uri_ : s3_url option)
    ?message:(message_ : message option) ?compute_time:(compute_time_ : long_type option)
    ?finished_at:(finished_at_ : epoch_time option) ?started_at:(started_at_ : epoch_time option)
    ?total_record_count:(total_record_count_ : long_type option)
    ?invalid_record_count:(invalid_record_count_ : long_type option) () =
  ({
     batch_prediction_id = batch_prediction_id_;
     ml_model_id = ml_model_id_;
     batch_prediction_data_source_id = batch_prediction_data_source_id_;
     input_data_location_s3 = input_data_location_s3_;
     created_by_iam_user = created_by_iam_user_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     name = name_;
     status = status_;
     output_uri = output_uri_;
     message = message_;
     compute_time = compute_time_;
     finished_at = finished_at_;
     started_at = started_at_;
     total_record_count = total_record_count_;
     invalid_record_count = invalid_record_count_;
   }
    : batch_prediction)

let make_describe_batch_predictions_output ?results:(results_ : batch_predictions option)
    ?next_token:(next_token_ : string_type option) () =
  ({ results = results_; next_token = next_token_ } : describe_batch_predictions_output)

let make_describe_batch_predictions_input
    ?filter_variable:(filter_variable_ : batch_prediction_filter_variable option)
    ?e_q:(e_q_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?prefix:(prefix_ : comparator_value option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : string_type option) ?limit:(limit_ : page_limit option) () =
  ({
     filter_variable = filter_variable_;
     e_q = e_q_;
     g_t = g_t_;
     l_t = l_t_;
     g_e = g_e_;
     l_e = l_e_;
     n_e = n_e_;
     prefix = prefix_;
     sort_order = sort_order_;
     next_token = next_token_;
     limit = limit_;
   }
    : describe_batch_predictions_input)

let make_delete_tags_output ?resource_id:(resource_id_ : entity_id option)
    ?resource_type:(resource_type_ : taggable_resource_type option) () =
  ({ resource_id = resource_id_; resource_type = resource_type_ } : delete_tags_output)

let make_delete_tags_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_id:(resource_id_ : entity_id) ~resource_type:(resource_type_ : taggable_resource_type)
    () =
  ({ tag_keys = tag_keys_; resource_id = resource_id_; resource_type = resource_type_ }
    : delete_tags_input)

let make_delete_realtime_endpoint_output ?ml_model_id:(ml_model_id_ : entity_id option)
    ?realtime_endpoint_info:(realtime_endpoint_info_ : realtime_endpoint_info option) () =
  ({ ml_model_id = ml_model_id_; realtime_endpoint_info = realtime_endpoint_info_ }
    : delete_realtime_endpoint_output)

let make_delete_realtime_endpoint_input ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({ ml_model_id = ml_model_id_ } : delete_realtime_endpoint_input)

let make_delete_ml_model_output ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({ ml_model_id = ml_model_id_ } : delete_ml_model_output)

let make_delete_ml_model_input ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({ ml_model_id = ml_model_id_ } : delete_ml_model_input)

let make_delete_evaluation_output ?evaluation_id:(evaluation_id_ : entity_id option) () =
  ({ evaluation_id = evaluation_id_ } : delete_evaluation_output)

let make_delete_evaluation_input ~evaluation_id:(evaluation_id_ : entity_id) () =
  ({ evaluation_id = evaluation_id_ } : delete_evaluation_input)

let make_delete_data_source_output ?data_source_id:(data_source_id_ : entity_id option) () =
  ({ data_source_id = data_source_id_ } : delete_data_source_output)

let make_delete_data_source_input ~data_source_id:(data_source_id_ : entity_id) () =
  ({ data_source_id = data_source_id_ } : delete_data_source_input)

let make_delete_batch_prediction_output
    ?batch_prediction_id:(batch_prediction_id_ : entity_id option) () =
  ({ batch_prediction_id = batch_prediction_id_ } : delete_batch_prediction_output)

let make_delete_batch_prediction_input ~batch_prediction_id:(batch_prediction_id_ : entity_id) () =
  ({ batch_prediction_id = batch_prediction_id_ } : delete_batch_prediction_input)

let make_create_realtime_endpoint_output ?ml_model_id:(ml_model_id_ : entity_id option)
    ?realtime_endpoint_info:(realtime_endpoint_info_ : realtime_endpoint_info option) () =
  ({ ml_model_id = ml_model_id_; realtime_endpoint_info = realtime_endpoint_info_ }
    : create_realtime_endpoint_output)

let make_create_realtime_endpoint_input ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({ ml_model_id = ml_model_id_ } : create_realtime_endpoint_input)

let make_create_ml_model_output ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({ ml_model_id = ml_model_id_ } : create_ml_model_output)

let make_create_ml_model_input ?ml_model_name:(ml_model_name_ : entity_name option)
    ?parameters:(parameters_ : training_parameters option) ?recipe:(recipe_ : recipe option)
    ?recipe_uri:(recipe_uri_ : s3_url option) ~ml_model_id:(ml_model_id_ : entity_id)
    ~ml_model_type:(ml_model_type_ : ml_model_type)
    ~training_data_source_id:(training_data_source_id_ : entity_id) () =
  ({
     ml_model_id = ml_model_id_;
     ml_model_name = ml_model_name_;
     ml_model_type = ml_model_type_;
     parameters = parameters_;
     training_data_source_id = training_data_source_id_;
     recipe = recipe_;
     recipe_uri = recipe_uri_;
   }
    : create_ml_model_input)

let make_create_evaluation_output ?evaluation_id:(evaluation_id_ : entity_id option) () =
  ({ evaluation_id = evaluation_id_ } : create_evaluation_output)

let make_create_evaluation_input ?evaluation_name:(evaluation_name_ : entity_name option)
    ~evaluation_id:(evaluation_id_ : entity_id) ~ml_model_id:(ml_model_id_ : entity_id)
    ~evaluation_data_source_id:(evaluation_data_source_id_ : entity_id) () =
  ({
     evaluation_id = evaluation_id_;
     evaluation_name = evaluation_name_;
     ml_model_id = ml_model_id_;
     evaluation_data_source_id = evaluation_data_source_id_;
   }
    : create_evaluation_input)

let make_create_data_source_from_s3_output ?data_source_id:(data_source_id_ : entity_id option) () =
  ({ data_source_id = data_source_id_ } : create_data_source_from_s3_output)

let make_s3_data_spec ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ?data_schema:(data_schema_ : data_schema option)
    ?data_schema_location_s3:(data_schema_location_s3_ : s3_url option)
    ~data_location_s3:(data_location_s3_ : s3_url) () =
  ({
     data_location_s3 = data_location_s3_;
     data_rearrangement = data_rearrangement_;
     data_schema = data_schema_;
     data_schema_location_s3 = data_schema_location_s3_;
   }
    : s3_data_spec)

let make_create_data_source_from_s3_input ?data_source_name:(data_source_name_ : entity_name option)
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ~data_source_id:(data_source_id_ : entity_id) ~data_spec:(data_spec_ : s3_data_spec) () =
  ({
     data_source_id = data_source_id_;
     data_source_name = data_source_name_;
     data_spec = data_spec_;
     compute_statistics = compute_statistics_;
   }
    : create_data_source_from_s3_input)

let make_create_data_source_from_redshift_output
    ?data_source_id:(data_source_id_ : entity_id option) () =
  ({ data_source_id = data_source_id_ } : create_data_source_from_redshift_output)

let make_redshift_database_credentials ~username:(username_ : redshift_database_username)
    ~password:(password_ : redshift_database_password) () =
  ({ username = username_; password = password_ } : redshift_database_credentials)

let make_redshift_data_spec ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ?data_schema:(data_schema_ : data_schema option)
    ?data_schema_uri:(data_schema_uri_ : s3_url option)
    ~database_information:(database_information_ : redshift_database)
    ~select_sql_query:(select_sql_query_ : redshift_select_sql_query)
    ~database_credentials:(database_credentials_ : redshift_database_credentials)
    ~s3_staging_location:(s3_staging_location_ : s3_url) () =
  ({
     database_information = database_information_;
     select_sql_query = select_sql_query_;
     database_credentials = database_credentials_;
     s3_staging_location = s3_staging_location_;
     data_rearrangement = data_rearrangement_;
     data_schema = data_schema_;
     data_schema_uri = data_schema_uri_;
   }
    : redshift_data_spec)

let make_create_data_source_from_redshift_input
    ?data_source_name:(data_source_name_ : entity_name option)
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ~data_source_id:(data_source_id_ : entity_id) ~data_spec:(data_spec_ : redshift_data_spec)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     data_source_id = data_source_id_;
     data_source_name = data_source_name_;
     data_spec = data_spec_;
     role_ar_n = role_ar_n_;
     compute_statistics = compute_statistics_;
   }
    : create_data_source_from_redshift_input)

let make_create_data_source_from_rds_output ?data_source_id:(data_source_id_ : entity_id option) ()
    =
  ({ data_source_id = data_source_id_ } : create_data_source_from_rds_output)

let make_rds_database_credentials ~username:(username_ : rds_database_username)
    ~password:(password_ : rds_database_password) () =
  ({ username = username_; password = password_ } : rds_database_credentials)

let make_rds_data_spec ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ?data_schema:(data_schema_ : data_schema option)
    ?data_schema_uri:(data_schema_uri_ : s3_url option)
    ~database_information:(database_information_ : rds_database)
    ~select_sql_query:(select_sql_query_ : rds_select_sql_query)
    ~database_credentials:(database_credentials_ : rds_database_credentials)
    ~s3_staging_location:(s3_staging_location_ : s3_url)
    ~resource_role:(resource_role_ : edp_resource_role)
    ~service_role:(service_role_ : edp_service_role) ~subnet_id:(subnet_id_ : edp_subnet_id)
    ~security_group_ids:(security_group_ids_ : edp_security_group_ids) () =
  ({
     database_information = database_information_;
     select_sql_query = select_sql_query_;
     database_credentials = database_credentials_;
     s3_staging_location = s3_staging_location_;
     data_rearrangement = data_rearrangement_;
     data_schema = data_schema_;
     data_schema_uri = data_schema_uri_;
     resource_role = resource_role_;
     service_role = service_role_;
     subnet_id = subnet_id_;
     security_group_ids = security_group_ids_;
   }
    : rds_data_spec)

let make_create_data_source_from_rds_input
    ?data_source_name:(data_source_name_ : entity_name option)
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ~data_source_id:(data_source_id_ : entity_id) ~rds_data:(rds_data_ : rds_data_spec)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     data_source_id = data_source_id_;
     data_source_name = data_source_name_;
     rds_data = rds_data_;
     role_ar_n = role_ar_n_;
     compute_statistics = compute_statistics_;
   }
    : create_data_source_from_rds_input)

let make_create_batch_prediction_output
    ?batch_prediction_id:(batch_prediction_id_ : entity_id option) () =
  ({ batch_prediction_id = batch_prediction_id_ } : create_batch_prediction_output)

let make_create_batch_prediction_input
    ?batch_prediction_name:(batch_prediction_name_ : entity_name option)
    ~batch_prediction_id:(batch_prediction_id_ : entity_id) ~ml_model_id:(ml_model_id_ : entity_id)
    ~batch_prediction_data_source_id:(batch_prediction_data_source_id_ : entity_id)
    ~output_uri:(output_uri_ : s3_url) () =
  ({
     batch_prediction_id = batch_prediction_id_;
     batch_prediction_name = batch_prediction_name_;
     ml_model_id = ml_model_id_;
     batch_prediction_data_source_id = batch_prediction_data_source_id_;
     output_uri = output_uri_;
   }
    : create_batch_prediction_input)
