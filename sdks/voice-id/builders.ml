open Types

let make_watchlist_summary ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?default_watchlist:(default_watchlist_ : boolean_ option)
    ?description:(description_ : watchlist_description option) ?name:(name_ : watchlist_name option)
    ?watchlist_id:(watchlist_id_ : watchlist_id option) ?domain_id:(domain_id_ : domain_id option)
    () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     default_watchlist = default_watchlist_;
     description = description_;
     name = name_;
     watchlist_id = watchlist_id_;
     domain_id = domain_id_;
   }
    : watchlist_summary)

let make_watchlist_details ~default_watchlist_id:(default_watchlist_id_ : watchlist_id) () =
  ({ default_watchlist_id = default_watchlist_id_ } : watchlist_details)

let make_watchlist ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?default_watchlist:(default_watchlist_ : boolean_ option)
    ?description:(description_ : watchlist_description option) ?name:(name_ : watchlist_name option)
    ?watchlist_id:(watchlist_id_ : watchlist_id option) ?domain_id:(domain_id_ : domain_id option)
    () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     default_watchlist = default_watchlist_;
     description = description_;
     name = name_;
     watchlist_id = watchlist_id_;
     domain_id = domain_id_;
   }
    : watchlist)

let make_voice_spoofing_risk ~risk_score:(risk_score_ : score) () =
  ({ risk_score = risk_score_ } : voice_spoofing_risk)

let make_update_watchlist_response ?watchlist:(watchlist_ : watchlist option) () =
  ({ watchlist = watchlist_ } : update_watchlist_response)

let make_update_watchlist_request ?description:(description_ : watchlist_description option)
    ?name:(name_ : watchlist_name option) ~watchlist_id:(watchlist_id_ : watchlist_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     description = description_;
     name = name_;
     watchlist_id = watchlist_id_;
     domain_id = domain_id_;
   }
    : update_watchlist_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_enrollment_job_fraud_detection_config
    ?watchlist_ids:(watchlist_ids_ : enrollment_job_fraud_detection_config_watchlist_ids option)
    ?risk_threshold:(risk_threshold_ : score option)
    ?fraud_detection_action:(fraud_detection_action_ : fraud_detection_action option) () =
  ({
     watchlist_ids = watchlist_ids_;
     risk_threshold = risk_threshold_;
     fraud_detection_action = fraud_detection_action_;
   }
    : enrollment_job_fraud_detection_config)

let make_enrollment_config
    ?fraud_detection_config:(fraud_detection_config_ : enrollment_job_fraud_detection_config option)
    ?existing_enrollment_action:(existing_enrollment_action_ : existing_enrollment_action option) ()
    =
  ({
     fraud_detection_config = fraud_detection_config_;
     existing_enrollment_action = existing_enrollment_action_;
   }
    : enrollment_config)

let make_input_data_config ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : input_data_config)

let make_output_data_config ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_uri:(s3_uri_ : s3_uri)
    () =
  ({ kms_key_id = kms_key_id_; s3_uri = s3_uri_ } : output_data_config)

let make_failure_details ?message:(message_ : string_ option)
    ?status_code:(status_code_ : integer option) () =
  ({ message = message_; status_code = status_code_ } : failure_details)

let make_job_progress ?percent_complete:(percent_complete_ : score option) () =
  ({ percent_complete = percent_complete_ } : job_progress)

let make_speaker_enrollment_job ?job_progress:(job_progress_ : job_progress option)
    ?failure_details:(failure_details_ : failure_details option)
    ?ended_at:(ended_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?enrollment_config:(enrollment_config_ : enrollment_config option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?domain_id:(domain_id_ : domain_id option)
    ?job_status:(job_status_ : speaker_enrollment_job_status option)
    ?job_id:(job_id_ : job_id option) ?job_name:(job_name_ : job_name option) () =
  ({
     job_progress = job_progress_;
     failure_details = failure_details_;
     ended_at = ended_at_;
     created_at = created_at_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     enrollment_config = enrollment_config_;
     data_access_role_arn = data_access_role_arn_;
     domain_id = domain_id_;
     job_status = job_status_;
     job_id = job_id_;
     job_name = job_name_;
   }
    : speaker_enrollment_job)

let make_start_speaker_enrollment_job_response ?job:(job_ : speaker_enrollment_job option) () =
  ({ job = job_ } : start_speaker_enrollment_job_response)

let make_start_speaker_enrollment_job_request
    ?enrollment_config:(enrollment_config_ : enrollment_config option)
    ?job_name:(job_name_ : job_name option)
    ?client_token:(client_token_ : client_token_string option)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn) ~domain_id:(domain_id_ : domain_id)
    () =
  ({
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     enrollment_config = enrollment_config_;
     data_access_role_arn = data_access_role_arn_;
     domain_id = domain_id_;
     job_name = job_name_;
     client_token = client_token_;
   }
    : start_speaker_enrollment_job_request)

let make_registration_config
    ?watchlist_ids:(watchlist_ids_ : registration_config_watchlist_ids option)
    ?fraudster_similarity_threshold:(fraudster_similarity_threshold_ : score option)
    ?duplicate_registration_action:
      (duplicate_registration_action_ : duplicate_registration_action option) () =
  ({
     watchlist_ids = watchlist_ids_;
     fraudster_similarity_threshold = fraudster_similarity_threshold_;
     duplicate_registration_action = duplicate_registration_action_;
   }
    : registration_config)

let make_fraudster_registration_job ?job_progress:(job_progress_ : job_progress option)
    ?failure_details:(failure_details_ : failure_details option)
    ?ended_at:(ended_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?registration_config:(registration_config_ : registration_config option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?domain_id:(domain_id_ : domain_id option)
    ?job_status:(job_status_ : fraudster_registration_job_status option)
    ?job_id:(job_id_ : job_id option) ?job_name:(job_name_ : job_name option) () =
  ({
     job_progress = job_progress_;
     failure_details = failure_details_;
     ended_at = ended_at_;
     created_at = created_at_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     registration_config = registration_config_;
     data_access_role_arn = data_access_role_arn_;
     domain_id = domain_id_;
     job_status = job_status_;
     job_id = job_id_;
     job_name = job_name_;
   }
    : fraudster_registration_job)

let make_start_fraudster_registration_job_response ?job:(job_ : fraudster_registration_job option)
    () =
  ({ job = job_ } : start_fraudster_registration_job_response)

let make_start_fraudster_registration_job_request
    ?registration_config:(registration_config_ : registration_config option)
    ?job_name:(job_name_ : job_name option)
    ?client_token:(client_token_ : client_token_string option)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn) ~domain_id:(domain_id_ : domain_id)
    () =
  ({
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     registration_config = registration_config_;
     data_access_role_arn = data_access_role_arn_;
     domain_id = domain_id_;
     job_name = job_name_;
     client_token = client_token_;
   }
    : start_fraudster_registration_job_request)

let make_speaker ?last_accessed_at:(last_accessed_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?status:(status_ : speaker_status option)
    ?generated_speaker_id:(generated_speaker_id_ : generated_speaker_id option)
    ?customer_speaker_id:(customer_speaker_id_ : customer_speaker_id option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     last_accessed_at = last_accessed_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     generated_speaker_id = generated_speaker_id_;
     customer_speaker_id = customer_speaker_id_;
     domain_id = domain_id_;
   }
    : speaker)

let make_opt_out_speaker_response ?speaker:(speaker_ : speaker option) () =
  ({ speaker = speaker_ } : opt_out_speaker_response)

let make_opt_out_speaker_request ~speaker_id:(speaker_id_ : speaker_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ speaker_id = speaker_id_; domain_id = domain_id_ } : opt_out_speaker_request)

let make_list_watchlists_response ?next_token:(next_token_ : string_ option)
    ?watchlist_summaries:(watchlist_summaries_ : watchlist_summaries option) () =
  ({ next_token = next_token_; watchlist_summaries = watchlist_summaries_ }
    : list_watchlists_response)

let make_list_watchlists_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_for_list option) ~domain_id:(domain_id_ : domain_id) ()
    =
  ({ next_token = next_token_; max_results = max_results_; domain_id = domain_id_ }
    : list_watchlists_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_speaker_summary ?last_accessed_at:(last_accessed_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?status:(status_ : speaker_status option)
    ?generated_speaker_id:(generated_speaker_id_ : generated_speaker_id option)
    ?customer_speaker_id:(customer_speaker_id_ : customer_speaker_id option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     last_accessed_at = last_accessed_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     generated_speaker_id = generated_speaker_id_;
     customer_speaker_id = customer_speaker_id_;
     domain_id = domain_id_;
   }
    : speaker_summary)

let make_list_speakers_response ?next_token:(next_token_ : string_ option)
    ?speaker_summaries:(speaker_summaries_ : speaker_summaries option) () =
  ({ next_token = next_token_; speaker_summaries = speaker_summaries_ } : list_speakers_response)

let make_list_speakers_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_for_list option) ~domain_id:(domain_id_ : domain_id) ()
    =
  ({ next_token = next_token_; max_results = max_results_; domain_id = domain_id_ }
    : list_speakers_request)

let make_speaker_enrollment_job_summary ?job_progress:(job_progress_ : job_progress option)
    ?failure_details:(failure_details_ : failure_details option)
    ?ended_at:(ended_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?domain_id:(domain_id_ : domain_id option)
    ?job_status:(job_status_ : speaker_enrollment_job_status option)
    ?job_id:(job_id_ : job_id option) ?job_name:(job_name_ : job_name option) () =
  ({
     job_progress = job_progress_;
     failure_details = failure_details_;
     ended_at = ended_at_;
     created_at = created_at_;
     domain_id = domain_id_;
     job_status = job_status_;
     job_id = job_id_;
     job_name = job_name_;
   }
    : speaker_enrollment_job_summary)

let make_list_speaker_enrollment_jobs_response ?next_token:(next_token_ : string_ option)
    ?job_summaries:(job_summaries_ : speaker_enrollment_job_summaries option) () =
  ({ next_token = next_token_; job_summaries = job_summaries_ }
    : list_speaker_enrollment_jobs_response)

let make_list_speaker_enrollment_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_for_list option)
    ?job_status:(job_status_ : speaker_enrollment_job_status option)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     job_status = job_status_;
     domain_id = domain_id_;
   }
    : list_speaker_enrollment_jobs_request)

let make_fraudster_summary ?watchlist_ids:(watchlist_ids_ : response_watchlist_ids option)
    ?created_at:(created_at_ : timestamp option)
    ?generated_fraudster_id:(generated_fraudster_id_ : generated_fraudster_id option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     watchlist_ids = watchlist_ids_;
     created_at = created_at_;
     generated_fraudster_id = generated_fraudster_id_;
     domain_id = domain_id_;
   }
    : fraudster_summary)

let make_list_fraudsters_response ?next_token:(next_token_ : string_ option)
    ?fraudster_summaries:(fraudster_summaries_ : fraudster_summaries option) () =
  ({ next_token = next_token_; fraudster_summaries = fraudster_summaries_ }
    : list_fraudsters_response)

let make_list_fraudsters_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_for_list option)
    ?watchlist_id:(watchlist_id_ : watchlist_id option) ~domain_id:(domain_id_ : domain_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     watchlist_id = watchlist_id_;
     domain_id = domain_id_;
   }
    : list_fraudsters_request)

let make_fraudster_registration_job_summary ?job_progress:(job_progress_ : job_progress option)
    ?failure_details:(failure_details_ : failure_details option)
    ?ended_at:(ended_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?domain_id:(domain_id_ : domain_id option)
    ?job_status:(job_status_ : fraudster_registration_job_status option)
    ?job_id:(job_id_ : job_id option) ?job_name:(job_name_ : job_name option) () =
  ({
     job_progress = job_progress_;
     failure_details = failure_details_;
     ended_at = ended_at_;
     created_at = created_at_;
     domain_id = domain_id_;
     job_status = job_status_;
     job_id = job_id_;
     job_name = job_name_;
   }
    : fraudster_registration_job_summary)

let make_list_fraudster_registration_jobs_response ?next_token:(next_token_ : string_ option)
    ?job_summaries:(job_summaries_ : fraudster_registration_job_summaries option) () =
  ({ next_token = next_token_; job_summaries = job_summaries_ }
    : list_fraudster_registration_jobs_response)

let make_list_fraudster_registration_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_for_list option)
    ?job_status:(job_status_ : fraudster_registration_job_status option)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     job_status = job_status_;
     domain_id = domain_id_;
   }
    : list_fraudster_registration_jobs_request)

let make_authentication_configuration ~acceptance_threshold:(acceptance_threshold_ : score) () =
  ({ acceptance_threshold = acceptance_threshold_ } : authentication_configuration)

let make_fraud_detection_configuration ?watchlist_id:(watchlist_id_ : watchlist_id option)
    ?risk_threshold:(risk_threshold_ : score option) () =
  ({ watchlist_id = watchlist_id_; risk_threshold = risk_threshold_ }
    : fraud_detection_configuration)

let make_known_fraudster_risk
    ?generated_fraudster_id:(generated_fraudster_id_ : generated_fraudster_id option)
    ~risk_score:(risk_score_ : score) () =
  ({ generated_fraudster_id = generated_fraudster_id_; risk_score = risk_score_ }
    : known_fraudster_risk)

let make_fraud_risk_details ~voice_spoofing_risk:(voice_spoofing_risk_ : voice_spoofing_risk)
    ~known_fraudster_risk:(known_fraudster_risk_ : known_fraudster_risk) () =
  ({ voice_spoofing_risk = voice_spoofing_risk_; known_fraudster_risk = known_fraudster_risk_ }
    : fraud_risk_details)

let make_evaluate_session_response
    ?fraud_detection_result:(fraud_detection_result_ : fraud_detection_result option)
    ?authentication_result:(authentication_result_ : authentication_result option)
    ?streaming_status:(streaming_status_ : streaming_status option)
    ?session_name:(session_name_ : session_name option)
    ?session_id:(session_id_ : session_id option) ?domain_id:(domain_id_ : domain_id option) () =
  ({
     fraud_detection_result = fraud_detection_result_;
     authentication_result = authentication_result_;
     streaming_status = streaming_status_;
     session_name = session_name_;
     session_id = session_id_;
     domain_id = domain_id_;
   }
    : evaluate_session_response)

let make_evaluate_session_request ~session_name_or_id:(session_name_or_id_ : session_name_or_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ session_name_or_id = session_name_or_id_; domain_id = domain_id_ } : evaluate_session_request)

let make_fraudster ?watchlist_ids:(watchlist_ids_ : response_watchlist_ids option)
    ?created_at:(created_at_ : timestamp option)
    ?generated_fraudster_id:(generated_fraudster_id_ : generated_fraudster_id option)
    ?domain_id:(domain_id_ : domain_id option) () =
  ({
     watchlist_ids = watchlist_ids_;
     created_at = created_at_;
     generated_fraudster_id = generated_fraudster_id_;
     domain_id = domain_id_;
   }
    : fraudster)

let make_disassociate_fraudster_response ?fraudster:(fraudster_ : fraudster option) () =
  ({ fraudster = fraudster_ } : disassociate_fraudster_response)

let make_disassociate_fraudster_request ~fraudster_id:(fraudster_id_ : fraudster_id)
    ~watchlist_id:(watchlist_id_ : watchlist_id) ~domain_id:(domain_id_ : domain_id) () =
  ({ fraudster_id = fraudster_id_; watchlist_id = watchlist_id_; domain_id = domain_id_ }
    : disassociate_fraudster_request)

let make_describe_watchlist_response ?watchlist:(watchlist_ : watchlist option) () =
  ({ watchlist = watchlist_ } : describe_watchlist_response)

let make_describe_watchlist_request ~watchlist_id:(watchlist_id_ : watchlist_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ watchlist_id = watchlist_id_; domain_id = domain_id_ } : describe_watchlist_request)

let make_describe_speaker_enrollment_job_response ?job:(job_ : speaker_enrollment_job option) () =
  ({ job = job_ } : describe_speaker_enrollment_job_response)

let make_describe_speaker_enrollment_job_request ~job_id:(job_id_ : job_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ job_id = job_id_; domain_id = domain_id_ } : describe_speaker_enrollment_job_request)

let make_describe_speaker_response ?speaker:(speaker_ : speaker option) () =
  ({ speaker = speaker_ } : describe_speaker_response)

let make_describe_speaker_request ~speaker_id:(speaker_id_ : speaker_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ speaker_id = speaker_id_; domain_id = domain_id_ } : describe_speaker_request)

let make_describe_fraudster_registration_job_response
    ?job:(job_ : fraudster_registration_job option) () =
  ({ job = job_ } : describe_fraudster_registration_job_response)

let make_describe_fraudster_registration_job_request ~job_id:(job_id_ : job_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ job_id = job_id_; domain_id = domain_id_ } : describe_fraudster_registration_job_request)

let make_describe_fraudster_response ?fraudster:(fraudster_ : fraudster option) () =
  ({ fraudster = fraudster_ } : describe_fraudster_response)

let make_describe_fraudster_request ~fraudster_id:(fraudster_id_ : fraudster_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ fraudster_id = fraudster_id_; domain_id = domain_id_ } : describe_fraudster_request)

let make_delete_watchlist_request ~watchlist_id:(watchlist_id_ : watchlist_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ watchlist_id = watchlist_id_; domain_id = domain_id_ } : delete_watchlist_request)

let make_delete_speaker_request ~speaker_id:(speaker_id_ : speaker_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ speaker_id = speaker_id_; domain_id = domain_id_ } : delete_speaker_request)

let make_delete_fraudster_request ~fraudster_id:(fraudster_id_ : fraudster_id)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ fraudster_id = fraudster_id_; domain_id = domain_id_ } : delete_fraudster_request)

let make_create_watchlist_response ?watchlist:(watchlist_ : watchlist option) () =
  ({ watchlist = watchlist_ } : create_watchlist_response)

let make_create_watchlist_request ?client_token:(client_token_ : client_token_string option)
    ?description:(description_ : watchlist_description option) ~name:(name_ : watchlist_name)
    ~domain_id:(domain_id_ : domain_id) () =
  ({
     client_token = client_token_;
     description = description_;
     name = name_;
     domain_id = domain_id_;
   }
    : create_watchlist_request)

let make_associate_fraudster_response ?fraudster:(fraudster_ : fraudster option) () =
  ({ fraudster = fraudster_ } : associate_fraudster_response)

let make_associate_fraudster_request ~fraudster_id:(fraudster_id_ : fraudster_id)
    ~watchlist_id:(watchlist_id_ : watchlist_id) ~domain_id:(domain_id_ : domain_id) () =
  ({ fraudster_id = fraudster_id_; watchlist_id = watchlist_id_; domain_id = domain_id_ }
    : associate_fraudster_request)

let make_server_side_encryption_configuration ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({ kms_key_id = kms_key_id_ } : server_side_encryption_configuration)

let make_server_side_encryption_update_details ?message:(message_ : string_ option)
    ?update_status:(update_status_ : server_side_encryption_update_status option)
    ?old_kms_key_id:(old_kms_key_id_ : kms_key_id option) () =
  ({ message = message_; update_status = update_status_; old_kms_key_id = old_kms_key_id_ }
    : server_side_encryption_update_details)

let make_domain ?watchlist_details:(watchlist_details_ : watchlist_details option)
    ?server_side_encryption_update_details:
      (server_side_encryption_update_details_ : server_side_encryption_update_details option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration option)
    ?domain_status:(domain_status_ : domain_status option)
    ?description:(description_ : description option) ?name:(name_ : domain_name option)
    ?arn:(arn_ : arn option) ?domain_id:(domain_id_ : domain_id option) () =
  ({
     watchlist_details = watchlist_details_;
     server_side_encryption_update_details = server_side_encryption_update_details_;
     updated_at = updated_at_;
     created_at = created_at_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     domain_status = domain_status_;
     description = description_;
     name = name_;
     arn = arn_;
     domain_id = domain_id_;
   }
    : domain)

let make_update_domain_response ?domain:(domain_ : domain option) () =
  ({ domain = domain_ } : update_domain_response)

let make_update_domain_request ?description:(description_ : description option)
    ~server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration)
    ~name:(name_ : domain_name) ~domain_id:(domain_id_ : domain_id) () =
  ({
     server_side_encryption_configuration = server_side_encryption_configuration_;
     description = description_;
     name = name_;
     domain_id = domain_id_;
   }
    : update_domain_request)

let make_domain_summary ?watchlist_details:(watchlist_details_ : watchlist_details option)
    ?server_side_encryption_update_details:
      (server_side_encryption_update_details_ : server_side_encryption_update_details option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration option)
    ?domain_status:(domain_status_ : domain_status option)
    ?description:(description_ : description option) ?name:(name_ : domain_name option)
    ?arn:(arn_ : arn option) ?domain_id:(domain_id_ : domain_id option) () =
  ({
     watchlist_details = watchlist_details_;
     server_side_encryption_update_details = server_side_encryption_update_details_;
     updated_at = updated_at_;
     created_at = created_at_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     domain_status = domain_status_;
     description = description_;
     name = name_;
     arn = arn_;
     domain_id = domain_id_;
   }
    : domain_summary)

let make_list_domains_response ?next_token:(next_token_ : string_ option)
    ?domain_summaries:(domain_summaries_ : domain_summaries option) () =
  ({ next_token = next_token_; domain_summaries = domain_summaries_ } : list_domains_response)

let make_list_domains_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_for_list_domain_fe option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_domains_request)

let make_describe_domain_response ?domain:(domain_ : domain option) () =
  ({ domain = domain_ } : describe_domain_response)

let make_describe_domain_request ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_ } : describe_domain_request)

let make_delete_domain_request ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_ } : delete_domain_request)

let make_create_domain_response ?domain:(domain_ : domain option) () =
  ({ domain = domain_ } : create_domain_response)

let make_create_domain_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token_string option)
    ?description:(description_ : description option)
    ~server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration)
    ~name:(name_ : domain_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     description = description_;
     name = name_;
   }
    : create_domain_request)
