open Types

val make_watchlist_summary :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?default_watchlist:boolean_ ->
  ?description:watchlist_description ->
  ?name:watchlist_name ->
  ?watchlist_id:watchlist_id ->
  ?domain_id:domain_id ->
  unit ->
  watchlist_summary

val make_watchlist_details : default_watchlist_id:watchlist_id -> unit -> watchlist_details

val make_watchlist :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?default_watchlist:boolean_ ->
  ?description:watchlist_description ->
  ?name:watchlist_name ->
  ?watchlist_id:watchlist_id ->
  ?domain_id:domain_id ->
  unit ->
  watchlist

val make_voice_spoofing_risk : risk_score:score -> unit -> voice_spoofing_risk
val make_update_watchlist_response : ?watchlist:watchlist -> unit -> update_watchlist_response

val make_update_watchlist_request :
  ?description:watchlist_description ->
  ?name:watchlist_name ->
  watchlist_id:watchlist_id ->
  domain_id:domain_id ->
  unit ->
  update_watchlist_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:amazon_resource_name -> unit -> tag_resource_request

val make_enrollment_job_fraud_detection_config :
  ?watchlist_ids:enrollment_job_fraud_detection_config_watchlist_ids ->
  ?risk_threshold:score ->
  ?fraud_detection_action:fraud_detection_action ->
  unit ->
  enrollment_job_fraud_detection_config

val make_enrollment_config :
  ?fraud_detection_config:enrollment_job_fraud_detection_config ->
  ?existing_enrollment_action:existing_enrollment_action ->
  unit ->
  enrollment_config

val make_input_data_config : s3_uri:s3_uri -> unit -> input_data_config
val make_output_data_config : ?kms_key_id:kms_key_id -> s3_uri:s3_uri -> unit -> output_data_config
val make_failure_details : ?message:string_ -> ?status_code:integer -> unit -> failure_details
val make_job_progress : ?percent_complete:score -> unit -> job_progress

val make_speaker_enrollment_job :
  ?job_progress:job_progress ->
  ?failure_details:failure_details ->
  ?ended_at:timestamp ->
  ?created_at:timestamp ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?enrollment_config:enrollment_config ->
  ?data_access_role_arn:iam_role_arn ->
  ?domain_id:domain_id ->
  ?job_status:speaker_enrollment_job_status ->
  ?job_id:job_id ->
  ?job_name:job_name ->
  unit ->
  speaker_enrollment_job

val make_start_speaker_enrollment_job_response :
  ?job:speaker_enrollment_job -> unit -> start_speaker_enrollment_job_response

val make_start_speaker_enrollment_job_request :
  ?enrollment_config:enrollment_config ->
  ?job_name:job_name ->
  ?client_token:client_token_string ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  data_access_role_arn:iam_role_arn ->
  domain_id:domain_id ->
  unit ->
  start_speaker_enrollment_job_request

val make_registration_config :
  ?watchlist_ids:registration_config_watchlist_ids ->
  ?fraudster_similarity_threshold:score ->
  ?duplicate_registration_action:duplicate_registration_action ->
  unit ->
  registration_config

val make_fraudster_registration_job :
  ?job_progress:job_progress ->
  ?failure_details:failure_details ->
  ?ended_at:timestamp ->
  ?created_at:timestamp ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?registration_config:registration_config ->
  ?data_access_role_arn:iam_role_arn ->
  ?domain_id:domain_id ->
  ?job_status:fraudster_registration_job_status ->
  ?job_id:job_id ->
  ?job_name:job_name ->
  unit ->
  fraudster_registration_job

val make_start_fraudster_registration_job_response :
  ?job:fraudster_registration_job -> unit -> start_fraudster_registration_job_response

val make_start_fraudster_registration_job_request :
  ?registration_config:registration_config ->
  ?job_name:job_name ->
  ?client_token:client_token_string ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  data_access_role_arn:iam_role_arn ->
  domain_id:domain_id ->
  unit ->
  start_fraudster_registration_job_request

val make_speaker :
  ?last_accessed_at:timestamp ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status:speaker_status ->
  ?generated_speaker_id:generated_speaker_id ->
  ?customer_speaker_id:customer_speaker_id ->
  ?domain_id:domain_id ->
  unit ->
  speaker

val make_opt_out_speaker_response : ?speaker:speaker -> unit -> opt_out_speaker_response

val make_opt_out_speaker_request :
  speaker_id:speaker_id -> domain_id:domain_id -> unit -> opt_out_speaker_request

val make_list_watchlists_response :
  ?next_token:string_ ->
  ?watchlist_summaries:watchlist_summaries ->
  unit ->
  list_watchlists_response

val make_list_watchlists_request :
  ?next_token:next_token ->
  ?max_results:max_results_for_list ->
  domain_id:domain_id ->
  unit ->
  list_watchlists_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_speaker_summary :
  ?last_accessed_at:timestamp ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status:speaker_status ->
  ?generated_speaker_id:generated_speaker_id ->
  ?customer_speaker_id:customer_speaker_id ->
  ?domain_id:domain_id ->
  unit ->
  speaker_summary

val make_list_speakers_response :
  ?next_token:string_ -> ?speaker_summaries:speaker_summaries -> unit -> list_speakers_response

val make_list_speakers_request :
  ?next_token:next_token ->
  ?max_results:max_results_for_list ->
  domain_id:domain_id ->
  unit ->
  list_speakers_request

val make_speaker_enrollment_job_summary :
  ?job_progress:job_progress ->
  ?failure_details:failure_details ->
  ?ended_at:timestamp ->
  ?created_at:timestamp ->
  ?domain_id:domain_id ->
  ?job_status:speaker_enrollment_job_status ->
  ?job_id:job_id ->
  ?job_name:job_name ->
  unit ->
  speaker_enrollment_job_summary

val make_list_speaker_enrollment_jobs_response :
  ?next_token:string_ ->
  ?job_summaries:speaker_enrollment_job_summaries ->
  unit ->
  list_speaker_enrollment_jobs_response

val make_list_speaker_enrollment_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results_for_list ->
  ?job_status:speaker_enrollment_job_status ->
  domain_id:domain_id ->
  unit ->
  list_speaker_enrollment_jobs_request

val make_fraudster_summary :
  ?watchlist_ids:response_watchlist_ids ->
  ?created_at:timestamp ->
  ?generated_fraudster_id:generated_fraudster_id ->
  ?domain_id:domain_id ->
  unit ->
  fraudster_summary

val make_list_fraudsters_response :
  ?next_token:string_ ->
  ?fraudster_summaries:fraudster_summaries ->
  unit ->
  list_fraudsters_response

val make_list_fraudsters_request :
  ?next_token:next_token ->
  ?max_results:max_results_for_list ->
  ?watchlist_id:watchlist_id ->
  domain_id:domain_id ->
  unit ->
  list_fraudsters_request

val make_fraudster_registration_job_summary :
  ?job_progress:job_progress ->
  ?failure_details:failure_details ->
  ?ended_at:timestamp ->
  ?created_at:timestamp ->
  ?domain_id:domain_id ->
  ?job_status:fraudster_registration_job_status ->
  ?job_id:job_id ->
  ?job_name:job_name ->
  unit ->
  fraudster_registration_job_summary

val make_list_fraudster_registration_jobs_response :
  ?next_token:string_ ->
  ?job_summaries:fraudster_registration_job_summaries ->
  unit ->
  list_fraudster_registration_jobs_response

val make_list_fraudster_registration_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results_for_list ->
  ?job_status:fraudster_registration_job_status ->
  domain_id:domain_id ->
  unit ->
  list_fraudster_registration_jobs_request

val make_authentication_configuration :
  acceptance_threshold:score -> unit -> authentication_configuration

val make_fraud_detection_configuration :
  ?watchlist_id:watchlist_id -> ?risk_threshold:score -> unit -> fraud_detection_configuration

val make_known_fraudster_risk :
  ?generated_fraudster_id:generated_fraudster_id -> risk_score:score -> unit -> known_fraudster_risk

val make_fraud_risk_details :
  voice_spoofing_risk:voice_spoofing_risk ->
  known_fraudster_risk:known_fraudster_risk ->
  unit ->
  fraud_risk_details

val make_evaluate_session_response :
  ?fraud_detection_result:fraud_detection_result ->
  ?authentication_result:authentication_result ->
  ?streaming_status:streaming_status ->
  ?session_name:session_name ->
  ?session_id:session_id ->
  ?domain_id:domain_id ->
  unit ->
  evaluate_session_response

val make_evaluate_session_request :
  session_name_or_id:session_name_or_id -> domain_id:domain_id -> unit -> evaluate_session_request

val make_fraudster :
  ?watchlist_ids:response_watchlist_ids ->
  ?created_at:timestamp ->
  ?generated_fraudster_id:generated_fraudster_id ->
  ?domain_id:domain_id ->
  unit ->
  fraudster

val make_disassociate_fraudster_response :
  ?fraudster:fraudster -> unit -> disassociate_fraudster_response

val make_disassociate_fraudster_request :
  fraudster_id:fraudster_id ->
  watchlist_id:watchlist_id ->
  domain_id:domain_id ->
  unit ->
  disassociate_fraudster_request

val make_describe_watchlist_response : ?watchlist:watchlist -> unit -> describe_watchlist_response

val make_describe_watchlist_request :
  watchlist_id:watchlist_id -> domain_id:domain_id -> unit -> describe_watchlist_request

val make_describe_speaker_enrollment_job_response :
  ?job:speaker_enrollment_job -> unit -> describe_speaker_enrollment_job_response

val make_describe_speaker_enrollment_job_request :
  job_id:job_id -> domain_id:domain_id -> unit -> describe_speaker_enrollment_job_request

val make_describe_speaker_response : ?speaker:speaker -> unit -> describe_speaker_response

val make_describe_speaker_request :
  speaker_id:speaker_id -> domain_id:domain_id -> unit -> describe_speaker_request

val make_describe_fraudster_registration_job_response :
  ?job:fraudster_registration_job -> unit -> describe_fraudster_registration_job_response

val make_describe_fraudster_registration_job_request :
  job_id:job_id -> domain_id:domain_id -> unit -> describe_fraudster_registration_job_request

val make_describe_fraudster_response : ?fraudster:fraudster -> unit -> describe_fraudster_response

val make_describe_fraudster_request :
  fraudster_id:fraudster_id -> domain_id:domain_id -> unit -> describe_fraudster_request

val make_delete_watchlist_request :
  watchlist_id:watchlist_id -> domain_id:domain_id -> unit -> delete_watchlist_request

val make_delete_speaker_request :
  speaker_id:speaker_id -> domain_id:domain_id -> unit -> delete_speaker_request

val make_delete_fraudster_request :
  fraudster_id:fraudster_id -> domain_id:domain_id -> unit -> delete_fraudster_request

val make_create_watchlist_response : ?watchlist:watchlist -> unit -> create_watchlist_response

val make_create_watchlist_request :
  ?client_token:client_token_string ->
  ?description:watchlist_description ->
  name:watchlist_name ->
  domain_id:domain_id ->
  unit ->
  create_watchlist_request

val make_associate_fraudster_response : ?fraudster:fraudster -> unit -> associate_fraudster_response

val make_associate_fraudster_request :
  fraudster_id:fraudster_id ->
  watchlist_id:watchlist_id ->
  domain_id:domain_id ->
  unit ->
  associate_fraudster_request

val make_server_side_encryption_configuration :
  kms_key_id:kms_key_id -> unit -> server_side_encryption_configuration

val make_server_side_encryption_update_details :
  ?message:string_ ->
  ?update_status:server_side_encryption_update_status ->
  ?old_kms_key_id:kms_key_id ->
  unit ->
  server_side_encryption_update_details

val make_domain :
  ?watchlist_details:watchlist_details ->
  ?server_side_encryption_update_details:server_side_encryption_update_details ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?domain_status:domain_status ->
  ?description:description ->
  ?name:domain_name ->
  ?arn:arn ->
  ?domain_id:domain_id ->
  unit ->
  domain

val make_update_domain_response : ?domain:domain -> unit -> update_domain_response

val make_update_domain_request :
  ?description:description ->
  server_side_encryption_configuration:server_side_encryption_configuration ->
  name:domain_name ->
  domain_id:domain_id ->
  unit ->
  update_domain_request

val make_domain_summary :
  ?watchlist_details:watchlist_details ->
  ?server_side_encryption_update_details:server_side_encryption_update_details ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?domain_status:domain_status ->
  ?description:description ->
  ?name:domain_name ->
  ?arn:arn ->
  ?domain_id:domain_id ->
  unit ->
  domain_summary

val make_list_domains_response :
  ?next_token:string_ -> ?domain_summaries:domain_summaries -> unit -> list_domains_response

val make_list_domains_request :
  ?next_token:next_token ->
  ?max_results:max_results_for_list_domain_fe ->
  unit ->
  list_domains_request

val make_describe_domain_response : ?domain:domain -> unit -> describe_domain_response
val make_describe_domain_request : domain_id:domain_id -> unit -> describe_domain_request
val make_delete_domain_request : domain_id:domain_id -> unit -> delete_domain_request
val make_create_domain_response : ?domain:domain -> unit -> create_domain_response

val make_create_domain_request :
  ?tags:tag_list ->
  ?client_token:client_token_string ->
  ?description:description ->
  server_side_encryption_configuration:server_side_encryption_configuration ->
  name:domain_name ->
  unit ->
  create_domain_request
