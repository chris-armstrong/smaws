open Types

let make_fraudster ?domain_id:(domain_id_ : domain_id option)
    ?generated_fraudster_id:(generated_fraudster_id_ : generated_fraudster_id option)
    ?created_at:(created_at_ : timestamp option)
    ?watchlist_ids:(watchlist_ids_ : response_watchlist_ids option) () =
  ({
     domain_id = domain_id_;
     generated_fraudster_id = generated_fraudster_id_;
     created_at = created_at_;
     watchlist_ids = watchlist_ids_;
   }
    : fraudster)

let make_associate_fraudster_response ?fraudster:(fraudster_ : fraudster option) () =
  ({ fraudster = fraudster_ } : associate_fraudster_response)

let make_associate_fraudster_request ~domain_id:(domain_id_ : domain_id)
    ~watchlist_id:(watchlist_id_ : watchlist_id) ~fraudster_id:(fraudster_id_ : fraudster_id) () =
  ({ domain_id = domain_id_; watchlist_id = watchlist_id_; fraudster_id = fraudster_id_ }
    : associate_fraudster_request)

let make_authentication_configuration ~acceptance_threshold:(acceptance_threshold_ : score) () =
  ({ acceptance_threshold = acceptance_threshold_ } : authentication_configuration)

let make_watchlist_details ~default_watchlist_id:(default_watchlist_id_ : watchlist_id) () =
  ({ default_watchlist_id = default_watchlist_id_ } : watchlist_details)

let make_server_side_encryption_update_details ?old_kms_key_id:(old_kms_key_id_ : kms_key_id option)
    ?update_status:(update_status_ : server_side_encryption_update_status option)
    ?message:(message_ : string_ option) () =
  ({ old_kms_key_id = old_kms_key_id_; update_status = update_status_; message = message_ }
    : server_side_encryption_update_details)

let make_server_side_encryption_configuration ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({ kms_key_id = kms_key_id_ } : server_side_encryption_configuration)

let make_domain ?domain_id:(domain_id_ : domain_id option) ?arn:(arn_ : arn option)
    ?name:(name_ : domain_name option) ?description:(description_ : description option)
    ?domain_status:(domain_status_ : domain_status option)
    ?server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?server_side_encryption_update_details:
      (server_side_encryption_update_details_ : server_side_encryption_update_details option)
    ?watchlist_details:(watchlist_details_ : watchlist_details option) () =
  ({
     domain_id = domain_id_;
     arn = arn_;
     name = name_;
     description = description_;
     domain_status = domain_status_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     created_at = created_at_;
     updated_at = updated_at_;
     server_side_encryption_update_details = server_side_encryption_update_details_;
     watchlist_details = watchlist_details_;
   }
    : domain)

let make_create_domain_response ?domain:(domain_ : domain option) () =
  ({ domain = domain_ } : create_domain_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_domain_request ?description:(description_ : description option)
    ?client_token:(client_token_ : client_token_string option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : domain_name)
    ~server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration) () =
  ({
     name = name_;
     description = description_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_domain_request)

let make_watchlist ?domain_id:(domain_id_ : domain_id option)
    ?watchlist_id:(watchlist_id_ : watchlist_id option) ?name:(name_ : watchlist_name option)
    ?description:(description_ : watchlist_description option)
    ?default_watchlist:(default_watchlist_ : boolean_ option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     domain_id = domain_id_;
     watchlist_id = watchlist_id_;
     name = name_;
     description = description_;
     default_watchlist = default_watchlist_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : watchlist)

let make_create_watchlist_response ?watchlist:(watchlist_ : watchlist option) () =
  ({ watchlist = watchlist_ } : create_watchlist_response)

let make_create_watchlist_request ?description:(description_ : watchlist_description option)
    ?client_token:(client_token_ : client_token_string option) ~domain_id:(domain_id_ : domain_id)
    ~name:(name_ : watchlist_name) () =
  ({
     domain_id = domain_id_;
     name = name_;
     description = description_;
     client_token = client_token_;
   }
    : create_watchlist_request)

let make_delete_domain_request ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_ } : delete_domain_request)

let make_delete_fraudster_request ~domain_id:(domain_id_ : domain_id)
    ~fraudster_id:(fraudster_id_ : fraudster_id) () =
  ({ domain_id = domain_id_; fraudster_id = fraudster_id_ } : delete_fraudster_request)

let make_delete_speaker_request ~domain_id:(domain_id_ : domain_id)
    ~speaker_id:(speaker_id_ : speaker_id) () =
  ({ domain_id = domain_id_; speaker_id = speaker_id_ } : delete_speaker_request)

let make_delete_watchlist_request ~domain_id:(domain_id_ : domain_id)
    ~watchlist_id:(watchlist_id_ : watchlist_id) () =
  ({ domain_id = domain_id_; watchlist_id = watchlist_id_ } : delete_watchlist_request)

let make_describe_domain_response ?domain:(domain_ : domain option) () =
  ({ domain = domain_ } : describe_domain_response)

let make_describe_domain_request ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_ } : describe_domain_request)

let make_describe_fraudster_response ?fraudster:(fraudster_ : fraudster option) () =
  ({ fraudster = fraudster_ } : describe_fraudster_response)

let make_describe_fraudster_request ~domain_id:(domain_id_ : domain_id)
    ~fraudster_id:(fraudster_id_ : fraudster_id) () =
  ({ domain_id = domain_id_; fraudster_id = fraudster_id_ } : describe_fraudster_request)

let make_job_progress ?percent_complete:(percent_complete_ : score option) () =
  ({ percent_complete = percent_complete_ } : job_progress)

let make_failure_details ?status_code:(status_code_ : integer option)
    ?message:(message_ : string_ option) () =
  ({ status_code = status_code_; message = message_ } : failure_details)

let make_output_data_config ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_uri:(s3_uri_ : s3_uri)
    () =
  ({ s3_uri = s3_uri_; kms_key_id = kms_key_id_ } : output_data_config)

let make_input_data_config ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : input_data_config)

let make_registration_config
    ?duplicate_registration_action:
      (duplicate_registration_action_ : duplicate_registration_action option)
    ?fraudster_similarity_threshold:(fraudster_similarity_threshold_ : score option)
    ?watchlist_ids:(watchlist_ids_ : registration_config_watchlist_ids option) () =
  ({
     duplicate_registration_action = duplicate_registration_action_;
     fraudster_similarity_threshold = fraudster_similarity_threshold_;
     watchlist_ids = watchlist_ids_;
   }
    : registration_config)

let make_fraudster_registration_job ?job_name:(job_name_ : job_name option)
    ?job_id:(job_id_ : job_id option)
    ?job_status:(job_status_ : fraudster_registration_job_status option)
    ?domain_id:(domain_id_ : domain_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?registration_config:(registration_config_ : registration_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?created_at:(created_at_ : timestamp option) ?ended_at:(ended_at_ : timestamp option)
    ?failure_details:(failure_details_ : failure_details option)
    ?job_progress:(job_progress_ : job_progress option) () =
  ({
     job_name = job_name_;
     job_id = job_id_;
     job_status = job_status_;
     domain_id = domain_id_;
     data_access_role_arn = data_access_role_arn_;
     registration_config = registration_config_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     created_at = created_at_;
     ended_at = ended_at_;
     failure_details = failure_details_;
     job_progress = job_progress_;
   }
    : fraudster_registration_job)

let make_describe_fraudster_registration_job_response
    ?job:(job_ : fraudster_registration_job option) () =
  ({ job = job_ } : describe_fraudster_registration_job_response)

let make_describe_fraudster_registration_job_request ~domain_id:(domain_id_ : domain_id)
    ~job_id:(job_id_ : job_id) () =
  ({ domain_id = domain_id_; job_id = job_id_ } : describe_fraudster_registration_job_request)

let make_speaker ?domain_id:(domain_id_ : domain_id option)
    ?customer_speaker_id:(customer_speaker_id_ : customer_speaker_id option)
    ?generated_speaker_id:(generated_speaker_id_ : generated_speaker_id option)
    ?status:(status_ : speaker_status option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option)
    ?last_accessed_at:(last_accessed_at_ : timestamp option) () =
  ({
     domain_id = domain_id_;
     customer_speaker_id = customer_speaker_id_;
     generated_speaker_id = generated_speaker_id_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     last_accessed_at = last_accessed_at_;
   }
    : speaker)

let make_describe_speaker_response ?speaker:(speaker_ : speaker option) () =
  ({ speaker = speaker_ } : describe_speaker_response)

let make_describe_speaker_request ~domain_id:(domain_id_ : domain_id)
    ~speaker_id:(speaker_id_ : speaker_id) () =
  ({ domain_id = domain_id_; speaker_id = speaker_id_ } : describe_speaker_request)

let make_enrollment_job_fraud_detection_config
    ?fraud_detection_action:(fraud_detection_action_ : fraud_detection_action option)
    ?risk_threshold:(risk_threshold_ : score option)
    ?watchlist_ids:(watchlist_ids_ : enrollment_job_fraud_detection_config_watchlist_ids option) ()
    =
  ({
     fraud_detection_action = fraud_detection_action_;
     risk_threshold = risk_threshold_;
     watchlist_ids = watchlist_ids_;
   }
    : enrollment_job_fraud_detection_config)

let make_enrollment_config
    ?existing_enrollment_action:(existing_enrollment_action_ : existing_enrollment_action option)
    ?fraud_detection_config:(fraud_detection_config_ : enrollment_job_fraud_detection_config option)
    () =
  ({
     existing_enrollment_action = existing_enrollment_action_;
     fraud_detection_config = fraud_detection_config_;
   }
    : enrollment_config)

let make_speaker_enrollment_job ?job_name:(job_name_ : job_name option)
    ?job_id:(job_id_ : job_id option)
    ?job_status:(job_status_ : speaker_enrollment_job_status option)
    ?domain_id:(domain_id_ : domain_id option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?enrollment_config:(enrollment_config_ : enrollment_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?created_at:(created_at_ : timestamp option) ?ended_at:(ended_at_ : timestamp option)
    ?failure_details:(failure_details_ : failure_details option)
    ?job_progress:(job_progress_ : job_progress option) () =
  ({
     job_name = job_name_;
     job_id = job_id_;
     job_status = job_status_;
     domain_id = domain_id_;
     data_access_role_arn = data_access_role_arn_;
     enrollment_config = enrollment_config_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     created_at = created_at_;
     ended_at = ended_at_;
     failure_details = failure_details_;
     job_progress = job_progress_;
   }
    : speaker_enrollment_job)

let make_describe_speaker_enrollment_job_response ?job:(job_ : speaker_enrollment_job option) () =
  ({ job = job_ } : describe_speaker_enrollment_job_response)

let make_describe_speaker_enrollment_job_request ~domain_id:(domain_id_ : domain_id)
    ~job_id:(job_id_ : job_id) () =
  ({ domain_id = domain_id_; job_id = job_id_ } : describe_speaker_enrollment_job_request)

let make_describe_watchlist_response ?watchlist:(watchlist_ : watchlist option) () =
  ({ watchlist = watchlist_ } : describe_watchlist_response)

let make_describe_watchlist_request ~domain_id:(domain_id_ : domain_id)
    ~watchlist_id:(watchlist_id_ : watchlist_id) () =
  ({ domain_id = domain_id_; watchlist_id = watchlist_id_ } : describe_watchlist_request)

let make_disassociate_fraudster_response ?fraudster:(fraudster_ : fraudster option) () =
  ({ fraudster = fraudster_ } : disassociate_fraudster_response)

let make_disassociate_fraudster_request ~domain_id:(domain_id_ : domain_id)
    ~watchlist_id:(watchlist_id_ : watchlist_id) ~fraudster_id:(fraudster_id_ : fraudster_id) () =
  ({ domain_id = domain_id_; watchlist_id = watchlist_id_; fraudster_id = fraudster_id_ }
    : disassociate_fraudster_request)

let make_domain_summary ?domain_id:(domain_id_ : domain_id option) ?arn:(arn_ : arn option)
    ?name:(name_ : domain_name option) ?description:(description_ : description option)
    ?domain_status:(domain_status_ : domain_status option)
    ?server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?server_side_encryption_update_details:
      (server_side_encryption_update_details_ : server_side_encryption_update_details option)
    ?watchlist_details:(watchlist_details_ : watchlist_details option) () =
  ({
     domain_id = domain_id_;
     arn = arn_;
     name = name_;
     description = description_;
     domain_status = domain_status_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     created_at = created_at_;
     updated_at = updated_at_;
     server_side_encryption_update_details = server_side_encryption_update_details_;
     watchlist_details = watchlist_details_;
   }
    : domain_summary)

let make_voice_spoofing_risk ~risk_score:(risk_score_ : score) () =
  ({ risk_score = risk_score_ } : voice_spoofing_risk)

let make_known_fraudster_risk
    ?generated_fraudster_id:(generated_fraudster_id_ : generated_fraudster_id option)
    ~risk_score:(risk_score_ : score) () =
  ({ risk_score = risk_score_; generated_fraudster_id = generated_fraudster_id_ }
    : known_fraudster_risk)

let make_fraud_risk_details ~known_fraudster_risk:(known_fraudster_risk_ : known_fraudster_risk)
    ~voice_spoofing_risk:(voice_spoofing_risk_ : voice_spoofing_risk) () =
  ({ known_fraudster_risk = known_fraudster_risk_; voice_spoofing_risk = voice_spoofing_risk_ }
    : fraud_risk_details)

let make_fraud_detection_configuration ?risk_threshold:(risk_threshold_ : score option)
    ?watchlist_id:(watchlist_id_ : watchlist_id option) () =
  ({ risk_threshold = risk_threshold_; watchlist_id = watchlist_id_ }
    : fraud_detection_configuration)

let make_evaluate_session_response ?domain_id:(domain_id_ : domain_id option)
    ?session_id:(session_id_ : session_id option)
    ?session_name:(session_name_ : session_name option)
    ?streaming_status:(streaming_status_ : streaming_status option)
    ?authentication_result:(authentication_result_ : authentication_result option)
    ?fraud_detection_result:(fraud_detection_result_ : fraud_detection_result option) () =
  ({
     domain_id = domain_id_;
     session_id = session_id_;
     session_name = session_name_;
     streaming_status = streaming_status_;
     authentication_result = authentication_result_;
     fraud_detection_result = fraud_detection_result_;
   }
    : evaluate_session_response)

let make_evaluate_session_request ~domain_id:(domain_id_ : domain_id)
    ~session_name_or_id:(session_name_or_id_ : session_name_or_id) () =
  ({ domain_id = domain_id_; session_name_or_id = session_name_or_id_ } : evaluate_session_request)

let make_fraudster_registration_job_summary ?job_name:(job_name_ : job_name option)
    ?job_id:(job_id_ : job_id option)
    ?job_status:(job_status_ : fraudster_registration_job_status option)
    ?domain_id:(domain_id_ : domain_id option) ?created_at:(created_at_ : timestamp option)
    ?ended_at:(ended_at_ : timestamp option)
    ?failure_details:(failure_details_ : failure_details option)
    ?job_progress:(job_progress_ : job_progress option) () =
  ({
     job_name = job_name_;
     job_id = job_id_;
     job_status = job_status_;
     domain_id = domain_id_;
     created_at = created_at_;
     ended_at = ended_at_;
     failure_details = failure_details_;
     job_progress = job_progress_;
   }
    : fraudster_registration_job_summary)

let make_fraudster_summary ?domain_id:(domain_id_ : domain_id option)
    ?generated_fraudster_id:(generated_fraudster_id_ : generated_fraudster_id option)
    ?created_at:(created_at_ : timestamp option)
    ?watchlist_ids:(watchlist_ids_ : response_watchlist_ids option) () =
  ({
     domain_id = domain_id_;
     generated_fraudster_id = generated_fraudster_id_;
     created_at = created_at_;
     watchlist_ids = watchlist_ids_;
   }
    : fraudster_summary)

let make_list_domains_response ?domain_summaries:(domain_summaries_ : domain_summaries option)
    ?next_token:(next_token_ : string_ option) () =
  ({ domain_summaries = domain_summaries_; next_token = next_token_ } : list_domains_response)

let make_list_domains_request ?max_results:(max_results_ : max_results_for_list_domain_fe option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_domains_request)

let make_list_fraudster_registration_jobs_response
    ?job_summaries:(job_summaries_ : fraudster_registration_job_summaries option)
    ?next_token:(next_token_ : string_ option) () =
  ({ job_summaries = job_summaries_; next_token = next_token_ }
    : list_fraudster_registration_jobs_response)

let make_list_fraudster_registration_jobs_request
    ?job_status:(job_status_ : fraudster_registration_job_status option)
    ?max_results:(max_results_ : max_results_for_list option)
    ?next_token:(next_token_ : next_token option) ~domain_id:(domain_id_ : domain_id) () =
  ({
     domain_id = domain_id_;
     job_status = job_status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_fraudster_registration_jobs_request)

let make_list_fraudsters_response
    ?fraudster_summaries:(fraudster_summaries_ : fraudster_summaries option)
    ?next_token:(next_token_ : string_ option) () =
  ({ fraudster_summaries = fraudster_summaries_; next_token = next_token_ }
    : list_fraudsters_response)

let make_list_fraudsters_request ?watchlist_id:(watchlist_id_ : watchlist_id option)
    ?max_results:(max_results_ : max_results_for_list option)
    ?next_token:(next_token_ : next_token option) ~domain_id:(domain_id_ : domain_id) () =
  ({
     domain_id = domain_id_;
     watchlist_id = watchlist_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_fraudsters_request)

let make_speaker_enrollment_job_summary ?job_name:(job_name_ : job_name option)
    ?job_id:(job_id_ : job_id option)
    ?job_status:(job_status_ : speaker_enrollment_job_status option)
    ?domain_id:(domain_id_ : domain_id option) ?created_at:(created_at_ : timestamp option)
    ?ended_at:(ended_at_ : timestamp option)
    ?failure_details:(failure_details_ : failure_details option)
    ?job_progress:(job_progress_ : job_progress option) () =
  ({
     job_name = job_name_;
     job_id = job_id_;
     job_status = job_status_;
     domain_id = domain_id_;
     created_at = created_at_;
     ended_at = ended_at_;
     failure_details = failure_details_;
     job_progress = job_progress_;
   }
    : speaker_enrollment_job_summary)

let make_list_speaker_enrollment_jobs_response
    ?job_summaries:(job_summaries_ : speaker_enrollment_job_summaries option)
    ?next_token:(next_token_ : string_ option) () =
  ({ job_summaries = job_summaries_; next_token = next_token_ }
    : list_speaker_enrollment_jobs_response)

let make_list_speaker_enrollment_jobs_request
    ?job_status:(job_status_ : speaker_enrollment_job_status option)
    ?max_results:(max_results_ : max_results_for_list option)
    ?next_token:(next_token_ : next_token option) ~domain_id:(domain_id_ : domain_id) () =
  ({
     domain_id = domain_id_;
     job_status = job_status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_speaker_enrollment_jobs_request)

let make_speaker_summary ?domain_id:(domain_id_ : domain_id option)
    ?customer_speaker_id:(customer_speaker_id_ : customer_speaker_id option)
    ?generated_speaker_id:(generated_speaker_id_ : generated_speaker_id option)
    ?status:(status_ : speaker_status option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option)
    ?last_accessed_at:(last_accessed_at_ : timestamp option) () =
  ({
     domain_id = domain_id_;
     customer_speaker_id = customer_speaker_id_;
     generated_speaker_id = generated_speaker_id_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     last_accessed_at = last_accessed_at_;
   }
    : speaker_summary)

let make_list_speakers_response ?speaker_summaries:(speaker_summaries_ : speaker_summaries option)
    ?next_token:(next_token_ : string_ option) () =
  ({ speaker_summaries = speaker_summaries_; next_token = next_token_ } : list_speakers_response)

let make_list_speakers_request ?max_results:(max_results_ : max_results_for_list option)
    ?next_token:(next_token_ : next_token option) ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_; max_results = max_results_; next_token = next_token_ }
    : list_speakers_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_watchlist_summary ?domain_id:(domain_id_ : domain_id option)
    ?watchlist_id:(watchlist_id_ : watchlist_id option) ?name:(name_ : watchlist_name option)
    ?description:(description_ : watchlist_description option)
    ?default_watchlist:(default_watchlist_ : boolean_ option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     domain_id = domain_id_;
     watchlist_id = watchlist_id_;
     name = name_;
     description = description_;
     default_watchlist = default_watchlist_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : watchlist_summary)

let make_list_watchlists_response
    ?watchlist_summaries:(watchlist_summaries_ : watchlist_summaries option)
    ?next_token:(next_token_ : string_ option) () =
  ({ watchlist_summaries = watchlist_summaries_; next_token = next_token_ }
    : list_watchlists_response)

let make_list_watchlists_request ?max_results:(max_results_ : max_results_for_list option)
    ?next_token:(next_token_ : next_token option) ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_; max_results = max_results_; next_token = next_token_ }
    : list_watchlists_request)

let make_opt_out_speaker_response ?speaker:(speaker_ : speaker option) () =
  ({ speaker = speaker_ } : opt_out_speaker_response)

let make_opt_out_speaker_request ~domain_id:(domain_id_ : domain_id)
    ~speaker_id:(speaker_id_ : speaker_id) () =
  ({ domain_id = domain_id_; speaker_id = speaker_id_ } : opt_out_speaker_request)

let make_start_fraudster_registration_job_response ?job:(job_ : fraudster_registration_job option)
    () =
  ({ job = job_ } : start_fraudster_registration_job_response)

let make_start_fraudster_registration_job_request
    ?client_token:(client_token_ : client_token_string option)
    ?job_name:(job_name_ : job_name option)
    ?registration_config:(registration_config_ : registration_config option)
    ~domain_id:(domain_id_ : domain_id) ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config) () =
  ({
     client_token = client_token_;
     job_name = job_name_;
     domain_id = domain_id_;
     data_access_role_arn = data_access_role_arn_;
     registration_config = registration_config_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
   }
    : start_fraudster_registration_job_request)

let make_start_speaker_enrollment_job_response ?job:(job_ : speaker_enrollment_job option) () =
  ({ job = job_ } : start_speaker_enrollment_job_response)

let make_start_speaker_enrollment_job_request
    ?client_token:(client_token_ : client_token_string option)
    ?job_name:(job_name_ : job_name option)
    ?enrollment_config:(enrollment_config_ : enrollment_config option)
    ~domain_id:(domain_id_ : domain_id) ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config) () =
  ({
     client_token = client_token_;
     job_name = job_name_;
     domain_id = domain_id_;
     data_access_role_arn = data_access_role_arn_;
     enrollment_config = enrollment_config_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
   }
    : start_speaker_enrollment_job_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_update_domain_response ?domain:(domain_ : domain option) () =
  ({ domain = domain_ } : update_domain_response)

let make_update_domain_request ?description:(description_ : description option)
    ~domain_id:(domain_id_ : domain_id) ~name:(name_ : domain_name)
    ~server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration) () =
  ({
     domain_id = domain_id_;
     name = name_;
     description = description_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
   }
    : update_domain_request)

let make_update_watchlist_response ?watchlist:(watchlist_ : watchlist option) () =
  ({ watchlist = watchlist_ } : update_watchlist_response)

let make_update_watchlist_request ?name:(name_ : watchlist_name option)
    ?description:(description_ : watchlist_description option) ~domain_id:(domain_id_ : domain_id)
    ~watchlist_id:(watchlist_id_ : watchlist_id) () =
  ({
     domain_id = domain_id_;
     watchlist_id = watchlist_id_;
     name = name_;
     description = description_;
   }
    : update_watchlist_request)
