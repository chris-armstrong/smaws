open Types

let make_update_ml_model_output ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({ ml_model_id = ml_model_id_ } : update_ml_model_output)

let make_update_ml_model_input ?score_threshold:(score_threshold_ : score_threshold option)
    ?ml_model_name:(ml_model_name_ : entity_name option) ~ml_model_id:(ml_model_id_ : entity_id) ()
    =
  ({
     score_threshold = score_threshold_;
     ml_model_name = ml_model_name_;
     ml_model_id = ml_model_id_;
   }
    : update_ml_model_input)

let make_update_evaluation_output ?evaluation_id:(evaluation_id_ : entity_id option) () =
  ({ evaluation_id = evaluation_id_ } : update_evaluation_output)

let make_update_evaluation_input ~evaluation_name:(evaluation_name_ : entity_name)
    ~evaluation_id:(evaluation_id_ : entity_id) () =
  ({ evaluation_name = evaluation_name_; evaluation_id = evaluation_id_ } : update_evaluation_input)

let make_update_data_source_output ?data_source_id:(data_source_id_ : entity_id option) () =
  ({ data_source_id = data_source_id_ } : update_data_source_output)

let make_update_data_source_input ~data_source_name:(data_source_name_ : entity_name)
    ~data_source_id:(data_source_id_ : entity_id) () =
  ({ data_source_name = data_source_name_; data_source_id = data_source_id_ }
    : update_data_source_input)

let make_update_batch_prediction_output
    ?batch_prediction_id:(batch_prediction_id_ : entity_id option) () =
  ({ batch_prediction_id = batch_prediction_id_ } : update_batch_prediction_output)

let make_update_batch_prediction_input ~batch_prediction_name:(batch_prediction_name_ : entity_name)
    ~batch_prediction_id:(batch_prediction_id_ : entity_id) () =
  ({ batch_prediction_name = batch_prediction_name_; batch_prediction_id = batch_prediction_id_ }
    : update_batch_prediction_input)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_s3_data_spec ?data_schema_location_s3:(data_schema_location_s3_ : s3_url option)
    ?data_schema:(data_schema_ : data_schema option)
    ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ~data_location_s3:(data_location_s3_ : s3_url) () =
  ({
     data_schema_location_s3 = data_schema_location_s3_;
     data_schema = data_schema_;
     data_rearrangement = data_rearrangement_;
     data_location_s3 = data_location_s3_;
   }
    : s3_data_spec)

let make_redshift_database ~cluster_identifier:(cluster_identifier_ : redshift_cluster_identifier)
    ~database_name:(database_name_ : redshift_database_name) () =
  ({ cluster_identifier = cluster_identifier_; database_name = database_name_ } : redshift_database)

let make_redshift_metadata ?select_sql_query:(select_sql_query_ : redshift_select_sql_query option)
    ?database_user_name:(database_user_name_ : redshift_database_username option)
    ?redshift_database:(redshift_database_ : redshift_database option) () =
  ({
     select_sql_query = select_sql_query_;
     database_user_name = database_user_name_;
     redshift_database = redshift_database_;
   }
    : redshift_metadata)

let make_redshift_database_credentials ~password:(password_ : redshift_database_password)
    ~username:(username_ : redshift_database_username) () =
  ({ password = password_; username = username_ } : redshift_database_credentials)

let make_redshift_data_spec ?data_schema_uri:(data_schema_uri_ : s3_url option)
    ?data_schema:(data_schema_ : data_schema option)
    ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ~s3_staging_location:(s3_staging_location_ : s3_url)
    ~database_credentials:(database_credentials_ : redshift_database_credentials)
    ~select_sql_query:(select_sql_query_ : redshift_select_sql_query)
    ~database_information:(database_information_ : redshift_database) () =
  ({
     data_schema_uri = data_schema_uri_;
     data_schema = data_schema_;
     data_rearrangement = data_rearrangement_;
     s3_staging_location = s3_staging_location_;
     database_credentials = database_credentials_;
     select_sql_query = select_sql_query_;
     database_information = database_information_;
   }
    : redshift_data_spec)

let make_realtime_endpoint_info
    ?endpoint_status:(endpoint_status_ : realtime_endpoint_status option)
    ?endpoint_url:(endpoint_url_ : vip_ur_l option) ?created_at:(created_at_ : epoch_time option)
    ?peak_requests_per_second:(peak_requests_per_second_ : integer_type option) () =
  ({
     endpoint_status = endpoint_status_;
     endpoint_url = endpoint_url_;
     created_at = created_at_;
     peak_requests_per_second = peak_requests_per_second_;
   }
    : realtime_endpoint_info)

let make_rds_database ~database_name:(database_name_ : rds_database_name)
    ~instance_identifier:(instance_identifier_ : rds_instance_identifier) () =
  ({ database_name = database_name_; instance_identifier = instance_identifier_ } : rds_database)

let make_rds_metadata ?data_pipeline_id:(data_pipeline_id_ : edp_pipeline_id option)
    ?service_role:(service_role_ : edp_service_role option)
    ?resource_role:(resource_role_ : edp_resource_role option)
    ?select_sql_query:(select_sql_query_ : rds_select_sql_query option)
    ?database_user_name:(database_user_name_ : rds_database_username option)
    ?database:(database_ : rds_database option) () =
  ({
     data_pipeline_id = data_pipeline_id_;
     service_role = service_role_;
     resource_role = resource_role_;
     select_sql_query = select_sql_query_;
     database_user_name = database_user_name_;
     database = database_;
   }
    : rds_metadata)

let make_rds_database_credentials ~password:(password_ : rds_database_password)
    ~username:(username_ : rds_database_username) () =
  ({ password = password_; username = username_ } : rds_database_credentials)

let make_rds_data_spec ?data_schema_uri:(data_schema_uri_ : s3_url option)
    ?data_schema:(data_schema_ : data_schema option)
    ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ~security_group_ids:(security_group_ids_ : edp_security_group_ids)
    ~subnet_id:(subnet_id_ : edp_subnet_id) ~service_role:(service_role_ : edp_service_role)
    ~resource_role:(resource_role_ : edp_resource_role)
    ~s3_staging_location:(s3_staging_location_ : s3_url)
    ~database_credentials:(database_credentials_ : rds_database_credentials)
    ~select_sql_query:(select_sql_query_ : rds_select_sql_query)
    ~database_information:(database_information_ : rds_database) () =
  ({
     security_group_ids = security_group_ids_;
     subnet_id = subnet_id_;
     service_role = service_role_;
     resource_role = resource_role_;
     data_schema_uri = data_schema_uri_;
     data_schema = data_schema_;
     data_rearrangement = data_rearrangement_;
     s3_staging_location = s3_staging_location_;
     database_credentials = database_credentials_;
     select_sql_query = select_sql_query_;
     database_information = database_information_;
   }
    : rds_data_spec)

let make_prediction ?details:(details_ : details_map option)
    ?predicted_scores:(predicted_scores_ : score_value_per_label_map option)
    ?predicted_value:(predicted_value_ : float_label option)
    ?predicted_label:(predicted_label_ : label option) () =
  ({
     details = details_;
     predicted_scores = predicted_scores_;
     predicted_value = predicted_value_;
     predicted_label = predicted_label_;
   }
    : prediction)

let make_predict_output ?prediction:(prediction_ : prediction option) () =
  ({ prediction = prediction_ } : predict_output)

let make_predict_input ~predict_endpoint:(predict_endpoint_ : vip_ur_l) ~record:(record_ : record)
    ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({ predict_endpoint = predict_endpoint_; record = record_; ml_model_id = ml_model_id_ }
    : predict_input)

let make_performance_metrics ?properties:(properties_ : performance_metrics_properties option) () =
  ({ properties = properties_ } : performance_metrics)

let make_ml_model ?started_at:(started_at_ : epoch_time option)
    ?finished_at:(finished_at_ : epoch_time option) ?compute_time:(compute_time_ : long_type option)
    ?message:(message_ : message option)
    ?score_threshold_last_updated_at:(score_threshold_last_updated_at_ : epoch_time option)
    ?score_threshold:(score_threshold_ : score_threshold option)
    ?ml_model_type:(ml_model_type_ : ml_model_type option)
    ?algorithm:(algorithm_ : algorithm option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?endpoint_info:(endpoint_info_ : realtime_endpoint_info option)
    ?size_in_bytes:(size_in_bytes_ : long_type option) ?status:(status_ : entity_status option)
    ?name:(name_ : ml_model_name option) ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?training_data_source_id:(training_data_source_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     message = message_;
     score_threshold_last_updated_at = score_threshold_last_updated_at_;
     score_threshold = score_threshold_;
     ml_model_type = ml_model_type_;
     algorithm = algorithm_;
     input_data_location_s3 = input_data_location_s3_;
     training_parameters = training_parameters_;
     endpoint_info = endpoint_info_;
     size_in_bytes = size_in_bytes_;
     status = status_;
     name = name_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     training_data_source_id = training_data_source_id_;
     ml_model_id = ml_model_id_;
   }
    : ml_model)

let make_get_ml_model_output ?schema:(schema_ : data_schema option)
    ?recipe:(recipe_ : recipe option) ?started_at:(started_at_ : epoch_time option)
    ?finished_at:(finished_at_ : epoch_time option) ?compute_time:(compute_time_ : long_type option)
    ?message:(message_ : message option) ?log_uri:(log_uri_ : presigned_s3_url option)
    ?score_threshold_last_updated_at:(score_threshold_last_updated_at_ : epoch_time option)
    ?score_threshold:(score_threshold_ : score_threshold option)
    ?ml_model_type:(ml_model_type_ : ml_model_type option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?endpoint_info:(endpoint_info_ : realtime_endpoint_info option)
    ?size_in_bytes:(size_in_bytes_ : long_type option) ?status:(status_ : entity_status option)
    ?name:(name_ : ml_model_name option) ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?training_data_source_id:(training_data_source_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({
     schema = schema_;
     recipe = recipe_;
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     message = message_;
     log_uri = log_uri_;
     score_threshold_last_updated_at = score_threshold_last_updated_at_;
     score_threshold = score_threshold_;
     ml_model_type = ml_model_type_;
     input_data_location_s3 = input_data_location_s3_;
     training_parameters = training_parameters_;
     endpoint_info = endpoint_info_;
     size_in_bytes = size_in_bytes_;
     status = status_;
     name = name_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     training_data_source_id = training_data_source_id_;
     ml_model_id = ml_model_id_;
   }
    : get_ml_model_output)

let make_get_ml_model_input ?verbose:(verbose_ : verbose option)
    ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({ verbose = verbose_; ml_model_id = ml_model_id_ } : get_ml_model_input)

let make_get_evaluation_output ?started_at:(started_at_ : epoch_time option)
    ?finished_at:(finished_at_ : epoch_time option) ?compute_time:(compute_time_ : long_type option)
    ?message:(message_ : message option) ?log_uri:(log_uri_ : presigned_s3_url option)
    ?performance_metrics:(performance_metrics_ : performance_metrics option)
    ?status:(status_ : entity_status option) ?name:(name_ : entity_name option)
    ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?evaluation_data_source_id:(evaluation_data_source_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?evaluation_id:(evaluation_id_ : entity_id option) () =
  ({
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     message = message_;
     log_uri = log_uri_;
     performance_metrics = performance_metrics_;
     status = status_;
     name = name_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     input_data_location_s3 = input_data_location_s3_;
     evaluation_data_source_id = evaluation_data_source_id_;
     ml_model_id = ml_model_id_;
     evaluation_id = evaluation_id_;
   }
    : get_evaluation_output)

let make_get_evaluation_input ~evaluation_id:(evaluation_id_ : entity_id) () =
  ({ evaluation_id = evaluation_id_ } : get_evaluation_input)

let make_get_data_source_output ?data_source_schema:(data_source_schema_ : data_schema option)
    ?started_at:(started_at_ : epoch_time option) ?finished_at:(finished_at_ : epoch_time option)
    ?compute_time:(compute_time_ : long_type option)
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?rds_metadata:(rds_metadata_ : rds_metadata option)
    ?redshift_metadata:(redshift_metadata_ : redshift_metadata option)
    ?message:(message_ : message option) ?log_uri:(log_uri_ : presigned_s3_url option)
    ?status:(status_ : entity_status option) ?name:(name_ : entity_name option)
    ?number_of_files:(number_of_files_ : long_type option)
    ?data_size_in_bytes:(data_size_in_bytes_ : long_type option)
    ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ?data_location_s3:(data_location_s3_ : s3_url option)
    ?data_source_id:(data_source_id_ : entity_id option) () =
  ({
     data_source_schema = data_source_schema_;
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     compute_statistics = compute_statistics_;
     role_ar_n = role_ar_n_;
     rds_metadata = rds_metadata_;
     redshift_metadata = redshift_metadata_;
     message = message_;
     log_uri = log_uri_;
     status = status_;
     name = name_;
     number_of_files = number_of_files_;
     data_size_in_bytes = data_size_in_bytes_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     data_rearrangement = data_rearrangement_;
     data_location_s3 = data_location_s3_;
     data_source_id = data_source_id_;
   }
    : get_data_source_output)

let make_get_data_source_input ?verbose:(verbose_ : verbose option)
    ~data_source_id:(data_source_id_ : entity_id) () =
  ({ verbose = verbose_; data_source_id = data_source_id_ } : get_data_source_input)

let make_get_batch_prediction_output
    ?invalid_record_count:(invalid_record_count_ : long_type option)
    ?total_record_count:(total_record_count_ : long_type option)
    ?started_at:(started_at_ : epoch_time option) ?finished_at:(finished_at_ : epoch_time option)
    ?compute_time:(compute_time_ : long_type option) ?message:(message_ : message option)
    ?log_uri:(log_uri_ : presigned_s3_url option) ?output_uri:(output_uri_ : s3_url option)
    ?status:(status_ : entity_status option) ?name:(name_ : entity_name option)
    ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?batch_prediction_data_source_id:(batch_prediction_data_source_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?batch_prediction_id:(batch_prediction_id_ : entity_id option) () =
  ({
     invalid_record_count = invalid_record_count_;
     total_record_count = total_record_count_;
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     message = message_;
     log_uri = log_uri_;
     output_uri = output_uri_;
     status = status_;
     name = name_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     input_data_location_s3 = input_data_location_s3_;
     batch_prediction_data_source_id = batch_prediction_data_source_id_;
     ml_model_id = ml_model_id_;
     batch_prediction_id = batch_prediction_id_;
   }
    : get_batch_prediction_output)

let make_get_batch_prediction_input ~batch_prediction_id:(batch_prediction_id_ : entity_id) () =
  ({ batch_prediction_id = batch_prediction_id_ } : get_batch_prediction_input)

let make_evaluation ?started_at:(started_at_ : epoch_time option)
    ?finished_at:(finished_at_ : epoch_time option) ?compute_time:(compute_time_ : long_type option)
    ?message:(message_ : message option)
    ?performance_metrics:(performance_metrics_ : performance_metrics option)
    ?status:(status_ : entity_status option) ?name:(name_ : entity_name option)
    ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?evaluation_data_source_id:(evaluation_data_source_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?evaluation_id:(evaluation_id_ : entity_id option) () =
  ({
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     message = message_;
     performance_metrics = performance_metrics_;
     status = status_;
     name = name_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     input_data_location_s3 = input_data_location_s3_;
     evaluation_data_source_id = evaluation_data_source_id_;
     ml_model_id = ml_model_id_;
     evaluation_id = evaluation_id_;
   }
    : evaluation)

let make_describe_tags_output ?tags:(tags_ : tag_list option)
    ?resource_type:(resource_type_ : taggable_resource_type option)
    ?resource_id:(resource_id_ : entity_id option) () =
  ({ tags = tags_; resource_type = resource_type_; resource_id = resource_id_ }
    : describe_tags_output)

let make_describe_tags_input ~resource_type:(resource_type_ : taggable_resource_type)
    ~resource_id:(resource_id_ : entity_id) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ } : describe_tags_input)

let make_describe_ml_models_output ?next_token:(next_token_ : string_type option)
    ?results:(results_ : ml_models option) () =
  ({ next_token = next_token_; results = results_ } : describe_ml_models_output)

let make_describe_ml_models_input ?limit:(limit_ : page_limit option)
    ?next_token:(next_token_ : string_type option) ?sort_order:(sort_order_ : sort_order option)
    ?prefix:(prefix_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?e_q:(e_q_ : comparator_value option)
    ?filter_variable:(filter_variable_ : ml_model_filter_variable option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     sort_order = sort_order_;
     prefix = prefix_;
     n_e = n_e_;
     l_e = l_e_;
     g_e = g_e_;
     l_t = l_t_;
     g_t = g_t_;
     e_q = e_q_;
     filter_variable = filter_variable_;
   }
    : describe_ml_models_input)

let make_describe_evaluations_output ?next_token:(next_token_ : string_type option)
    ?results:(results_ : evaluations option) () =
  ({ next_token = next_token_; results = results_ } : describe_evaluations_output)

let make_describe_evaluations_input ?limit:(limit_ : page_limit option)
    ?next_token:(next_token_ : string_type option) ?sort_order:(sort_order_ : sort_order option)
    ?prefix:(prefix_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?e_q:(e_q_ : comparator_value option)
    ?filter_variable:(filter_variable_ : evaluation_filter_variable option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     sort_order = sort_order_;
     prefix = prefix_;
     n_e = n_e_;
     l_e = l_e_;
     g_e = g_e_;
     l_t = l_t_;
     g_t = g_t_;
     e_q = e_q_;
     filter_variable = filter_variable_;
   }
    : describe_evaluations_input)

let make_data_source ?started_at:(started_at_ : epoch_time option)
    ?finished_at:(finished_at_ : epoch_time option) ?compute_time:(compute_time_ : long_type option)
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?rds_metadata:(rds_metadata_ : rds_metadata option)
    ?redshift_metadata:(redshift_metadata_ : redshift_metadata option)
    ?message:(message_ : message option) ?status:(status_ : entity_status option)
    ?name:(name_ : entity_name option) ?number_of_files:(number_of_files_ : long_type option)
    ?data_size_in_bytes:(data_size_in_bytes_ : long_type option)
    ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?data_rearrangement:(data_rearrangement_ : data_rearrangement option)
    ?data_location_s3:(data_location_s3_ : s3_url option)
    ?data_source_id:(data_source_id_ : entity_id option) () =
  ({
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     compute_statistics = compute_statistics_;
     role_ar_n = role_ar_n_;
     rds_metadata = rds_metadata_;
     redshift_metadata = redshift_metadata_;
     message = message_;
     status = status_;
     name = name_;
     number_of_files = number_of_files_;
     data_size_in_bytes = data_size_in_bytes_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     data_rearrangement = data_rearrangement_;
     data_location_s3 = data_location_s3_;
     data_source_id = data_source_id_;
   }
    : data_source)

let make_describe_data_sources_output ?next_token:(next_token_ : string_type option)
    ?results:(results_ : data_sources option) () =
  ({ next_token = next_token_; results = results_ } : describe_data_sources_output)

let make_describe_data_sources_input ?limit:(limit_ : page_limit option)
    ?next_token:(next_token_ : string_type option) ?sort_order:(sort_order_ : sort_order option)
    ?prefix:(prefix_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?e_q:(e_q_ : comparator_value option)
    ?filter_variable:(filter_variable_ : data_source_filter_variable option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     sort_order = sort_order_;
     prefix = prefix_;
     n_e = n_e_;
     l_e = l_e_;
     g_e = g_e_;
     l_t = l_t_;
     g_t = g_t_;
     e_q = e_q_;
     filter_variable = filter_variable_;
   }
    : describe_data_sources_input)

let make_batch_prediction ?invalid_record_count:(invalid_record_count_ : long_type option)
    ?total_record_count:(total_record_count_ : long_type option)
    ?started_at:(started_at_ : epoch_time option) ?finished_at:(finished_at_ : epoch_time option)
    ?compute_time:(compute_time_ : long_type option) ?message:(message_ : message option)
    ?output_uri:(output_uri_ : s3_url option) ?status:(status_ : entity_status option)
    ?name:(name_ : entity_name option) ?last_updated_at:(last_updated_at_ : epoch_time option)
    ?created_at:(created_at_ : epoch_time option)
    ?created_by_iam_user:(created_by_iam_user_ : aws_user_arn option)
    ?input_data_location_s3:(input_data_location_s3_ : s3_url option)
    ?batch_prediction_data_source_id:(batch_prediction_data_source_id_ : entity_id option)
    ?ml_model_id:(ml_model_id_ : entity_id option)
    ?batch_prediction_id:(batch_prediction_id_ : entity_id option) () =
  ({
     invalid_record_count = invalid_record_count_;
     total_record_count = total_record_count_;
     started_at = started_at_;
     finished_at = finished_at_;
     compute_time = compute_time_;
     message = message_;
     output_uri = output_uri_;
     status = status_;
     name = name_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     created_by_iam_user = created_by_iam_user_;
     input_data_location_s3 = input_data_location_s3_;
     batch_prediction_data_source_id = batch_prediction_data_source_id_;
     ml_model_id = ml_model_id_;
     batch_prediction_id = batch_prediction_id_;
   }
    : batch_prediction)

let make_describe_batch_predictions_output ?next_token:(next_token_ : string_type option)
    ?results:(results_ : batch_predictions option) () =
  ({ next_token = next_token_; results = results_ } : describe_batch_predictions_output)

let make_describe_batch_predictions_input ?limit:(limit_ : page_limit option)
    ?next_token:(next_token_ : string_type option) ?sort_order:(sort_order_ : sort_order option)
    ?prefix:(prefix_ : comparator_value option) ?n_e:(n_e_ : comparator_value option)
    ?l_e:(l_e_ : comparator_value option) ?g_e:(g_e_ : comparator_value option)
    ?l_t:(l_t_ : comparator_value option) ?g_t:(g_t_ : comparator_value option)
    ?e_q:(e_q_ : comparator_value option)
    ?filter_variable:(filter_variable_ : batch_prediction_filter_variable option) () =
  ({
     limit = limit_;
     next_token = next_token_;
     sort_order = sort_order_;
     prefix = prefix_;
     n_e = n_e_;
     l_e = l_e_;
     g_e = g_e_;
     l_t = l_t_;
     g_t = g_t_;
     e_q = e_q_;
     filter_variable = filter_variable_;
   }
    : describe_batch_predictions_input)

let make_delete_tags_output ?resource_type:(resource_type_ : taggable_resource_type option)
    ?resource_id:(resource_id_ : entity_id option) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ } : delete_tags_output)

let make_delete_tags_input ~resource_type:(resource_type_ : taggable_resource_type)
    ~resource_id:(resource_id_ : entity_id) ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_type = resource_type_; resource_id = resource_id_; tag_keys = tag_keys_ }
    : delete_tags_input)

let make_delete_realtime_endpoint_output
    ?realtime_endpoint_info:(realtime_endpoint_info_ : realtime_endpoint_info option)
    ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({ realtime_endpoint_info = realtime_endpoint_info_; ml_model_id = ml_model_id_ }
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

let make_create_realtime_endpoint_output
    ?realtime_endpoint_info:(realtime_endpoint_info_ : realtime_endpoint_info option)
    ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({ realtime_endpoint_info = realtime_endpoint_info_; ml_model_id = ml_model_id_ }
    : create_realtime_endpoint_output)

let make_create_realtime_endpoint_input ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({ ml_model_id = ml_model_id_ } : create_realtime_endpoint_input)

let make_create_ml_model_output ?ml_model_id:(ml_model_id_ : entity_id option) () =
  ({ ml_model_id = ml_model_id_ } : create_ml_model_output)

let make_create_ml_model_input ?recipe_uri:(recipe_uri_ : s3_url option)
    ?recipe:(recipe_ : recipe option) ?parameters:(parameters_ : training_parameters option)
    ?ml_model_name:(ml_model_name_ : entity_name option)
    ~training_data_source_id:(training_data_source_id_ : entity_id)
    ~ml_model_type:(ml_model_type_ : ml_model_type) ~ml_model_id:(ml_model_id_ : entity_id) () =
  ({
     recipe_uri = recipe_uri_;
     recipe = recipe_;
     training_data_source_id = training_data_source_id_;
     parameters = parameters_;
     ml_model_type = ml_model_type_;
     ml_model_name = ml_model_name_;
     ml_model_id = ml_model_id_;
   }
    : create_ml_model_input)

let make_create_evaluation_output ?evaluation_id:(evaluation_id_ : entity_id option) () =
  ({ evaluation_id = evaluation_id_ } : create_evaluation_output)

let make_create_evaluation_input ?evaluation_name:(evaluation_name_ : entity_name option)
    ~evaluation_data_source_id:(evaluation_data_source_id_ : entity_id)
    ~ml_model_id:(ml_model_id_ : entity_id) ~evaluation_id:(evaluation_id_ : entity_id) () =
  ({
     evaluation_data_source_id = evaluation_data_source_id_;
     ml_model_id = ml_model_id_;
     evaluation_name = evaluation_name_;
     evaluation_id = evaluation_id_;
   }
    : create_evaluation_input)

let make_create_data_source_from_s3_output ?data_source_id:(data_source_id_ : entity_id option) () =
  ({ data_source_id = data_source_id_ } : create_data_source_from_s3_output)

let make_create_data_source_from_s3_input
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ?data_source_name:(data_source_name_ : entity_name option)
    ~data_spec:(data_spec_ : s3_data_spec) ~data_source_id:(data_source_id_ : entity_id) () =
  ({
     compute_statistics = compute_statistics_;
     data_spec = data_spec_;
     data_source_name = data_source_name_;
     data_source_id = data_source_id_;
   }
    : create_data_source_from_s3_input)

let make_create_data_source_from_redshift_output
    ?data_source_id:(data_source_id_ : entity_id option) () =
  ({ data_source_id = data_source_id_ } : create_data_source_from_redshift_output)

let make_create_data_source_from_redshift_input
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ?data_source_name:(data_source_name_ : entity_name option) ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~data_spec:(data_spec_ : redshift_data_spec) ~data_source_id:(data_source_id_ : entity_id) () =
  ({
     compute_statistics = compute_statistics_;
     role_ar_n = role_ar_n_;
     data_spec = data_spec_;
     data_source_name = data_source_name_;
     data_source_id = data_source_id_;
   }
    : create_data_source_from_redshift_input)

let make_create_data_source_from_rds_output ?data_source_id:(data_source_id_ : entity_id option) ()
    =
  ({ data_source_id = data_source_id_ } : create_data_source_from_rds_output)

let make_create_data_source_from_rds_input
    ?compute_statistics:(compute_statistics_ : compute_statistics option)
    ?data_source_name:(data_source_name_ : entity_name option) ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~rds_data:(rds_data_ : rds_data_spec) ~data_source_id:(data_source_id_ : entity_id) () =
  ({
     compute_statistics = compute_statistics_;
     role_ar_n = role_ar_n_;
     rds_data = rds_data_;
     data_source_name = data_source_name_;
     data_source_id = data_source_id_;
   }
    : create_data_source_from_rds_input)

let make_create_batch_prediction_output
    ?batch_prediction_id:(batch_prediction_id_ : entity_id option) () =
  ({ batch_prediction_id = batch_prediction_id_ } : create_batch_prediction_output)

let make_create_batch_prediction_input
    ?batch_prediction_name:(batch_prediction_name_ : entity_name option)
    ~output_uri:(output_uri_ : s3_url)
    ~batch_prediction_data_source_id:(batch_prediction_data_source_id_ : entity_id)
    ~ml_model_id:(ml_model_id_ : entity_id) ~batch_prediction_id:(batch_prediction_id_ : entity_id)
    () =
  ({
     output_uri = output_uri_;
     batch_prediction_data_source_id = batch_prediction_data_source_id_;
     ml_model_id = ml_model_id_;
     batch_prediction_name = batch_prediction_name_;
     batch_prediction_id = batch_prediction_id_;
   }
    : create_batch_prediction_input)

let make_add_tags_output ?resource_type:(resource_type_ : taggable_resource_type option)
    ?resource_id:(resource_id_ : entity_id option) () =
  ({ resource_type = resource_type_; resource_id = resource_id_ } : add_tags_output)

let make_add_tags_input ~resource_type:(resource_type_ : taggable_resource_type)
    ~resource_id:(resource_id_ : entity_id) ~tags:(tags_ : tag_list) () =
  ({ resource_type = resource_type_; resource_id = resource_id_; tags = tags_ } : add_tags_input)
