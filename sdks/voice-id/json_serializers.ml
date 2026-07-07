open Smaws_Lib.Json.SerializeHelpers
open Types

let domain_id_to_yojson = string_to_yojson
let watchlist_id_to_yojson = string_to_yojson
let watchlist_name_to_yojson = string_to_yojson
let watchlist_description_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let watchlist_summary_to_yojson (x : watchlist_summary) =
  assoc_to_yojson
    [
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DefaultWatchlist", option_to_yojson boolean__to_yojson x.default_watchlist);
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
      ("Name", option_to_yojson watchlist_name_to_yojson x.name);
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let watchlist_summaries_to_yojson tree = list_to_yojson watchlist_summary_to_yojson tree

let watchlist_details_to_yojson (x : watchlist_details) =
  assoc_to_yojson [ ("DefaultWatchlistId", Some (watchlist_id_to_yojson x.default_watchlist_id)) ]

let watchlist_to_yojson (x : watchlist) =
  assoc_to_yojson
    [
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DefaultWatchlist", option_to_yojson boolean__to_yojson x.default_watchlist);
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
      ("Name", option_to_yojson watchlist_name_to_yojson x.name);
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let score_to_yojson = int_to_yojson

let voice_spoofing_risk_to_yojson (x : voice_spoofing_risk) =
  assoc_to_yojson [ ("RiskScore", Some (score_to_yojson x.risk_score)) ]

let string__to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | BATCH_JOB -> `String "BATCH_JOB"
  | COMPLIANCE_CONSENT -> `String "COMPLIANCE_CONSENT"
  | DOMAIN -> `String "DOMAIN"
  | FRAUDSTER -> `String "FRAUDSTER"
  | SESSION -> `String "SESSION"
  | SPEAKER -> `String "SPEAKER"
  | WATCHLIST -> `String "WATCHLIST"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let conflict_type_to_yojson (x : conflict_type) =
  match x with
  | ANOTHER_ACTIVE_STREAM -> `String "ANOTHER_ACTIVE_STREAM"
  | DOMAIN_NOT_ACTIVE -> `String "DOMAIN_NOT_ACTIVE"
  | CANNOT_CHANGE_SPEAKER_AFTER_ENROLLMENT -> `String "CANNOT_CHANGE_SPEAKER_AFTER_ENROLLMENT"
  | ENROLLMENT_ALREADY_EXISTS -> `String "ENROLLMENT_ALREADY_EXISTS"
  | SPEAKER_NOT_SET -> `String "SPEAKER_NOT_SET"
  | SPEAKER_OPTED_OUT -> `String "SPEAKER_OPTED_OUT"
  | CONCURRENT_CHANGES -> `String "CONCURRENT_CHANGES"
  | DOMAIN_LOCKED_FROM_ENCRYPTION_UPDATES -> `String "DOMAIN_LOCKED_FROM_ENCRYPTION_UPDATES"
  | CANNOT_DELETE_NON_EMPTY_WATCHLIST -> `String "CANNOT_DELETE_NON_EMPTY_WATCHLIST"
  | FRAUDSTER_MUST_BELONG_TO_AT_LEAST_ONE_WATCHLIST ->
      `String "FRAUDSTER_MUST_BELONG_TO_AT_LEAST_ONE_WATCHLIST"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("ConflictType", option_to_yojson conflict_type_to_yojson x.conflict_type);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let update_watchlist_response_to_yojson (x : update_watchlist_response) =
  assoc_to_yojson [ ("Watchlist", option_to_yojson watchlist_to_yojson x.watchlist) ]

let update_watchlist_request_to_yojson (x : update_watchlist_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
      ("Name", option_to_yojson watchlist_name_to_yojson x.name);
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let job_name_to_yojson = string_to_yojson
let job_id_to_yojson = string_to_yojson

let speaker_enrollment_job_status_to_yojson (x : speaker_enrollment_job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | FAILED -> `String "FAILED"

let iam_role_arn_to_yojson = string_to_yojson

let existing_enrollment_action_to_yojson (x : existing_enrollment_action) =
  match x with SKIP -> `String "SKIP" | OVERWRITE -> `String "OVERWRITE"

let fraud_detection_action_to_yojson (x : fraud_detection_action) =
  match x with IGNORE -> `String "IGNORE" | FAIL -> `String "FAIL"

let enrollment_job_fraud_detection_config_watchlist_ids_to_yojson tree =
  list_to_yojson watchlist_id_to_yojson tree

let enrollment_job_fraud_detection_config_to_yojson (x : enrollment_job_fraud_detection_config) =
  assoc_to_yojson
    [
      ( "WatchlistIds",
        option_to_yojson enrollment_job_fraud_detection_config_watchlist_ids_to_yojson
          x.watchlist_ids );
      ("RiskThreshold", option_to_yojson score_to_yojson x.risk_threshold);
      ( "FraudDetectionAction",
        option_to_yojson fraud_detection_action_to_yojson x.fraud_detection_action );
    ]

let enrollment_config_to_yojson (x : enrollment_config) =
  assoc_to_yojson
    [
      ( "FraudDetectionConfig",
        option_to_yojson enrollment_job_fraud_detection_config_to_yojson x.fraud_detection_config );
      ( "ExistingEnrollmentAction",
        option_to_yojson existing_enrollment_action_to_yojson x.existing_enrollment_action );
    ]

let s3_uri_to_yojson = string_to_yojson

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let kms_key_id_to_yojson = string_to_yojson

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let integer_to_yojson = int_to_yojson

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("StatusCode", option_to_yojson integer_to_yojson x.status_code);
    ]

let job_progress_to_yojson (x : job_progress) =
  assoc_to_yojson [ ("PercentComplete", option_to_yojson score_to_yojson x.percent_complete) ]

let speaker_enrollment_job_to_yojson (x : speaker_enrollment_job) =
  assoc_to_yojson
    [
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("EnrollmentConfig", option_to_yojson enrollment_config_to_yojson x.enrollment_config);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("JobStatus", option_to_yojson speaker_enrollment_job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let start_speaker_enrollment_job_response_to_yojson (x : start_speaker_enrollment_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson speaker_enrollment_job_to_yojson x.job) ]

let client_token_string_to_yojson = string_to_yojson

let start_speaker_enrollment_job_request_to_yojson (x : start_speaker_enrollment_job_request) =
  assoc_to_yojson
    [
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("EnrollmentConfig", option_to_yojson enrollment_config_to_yojson x.enrollment_config);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let fraudster_registration_job_status_to_yojson (x : fraudster_registration_job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | FAILED -> `String "FAILED"

let duplicate_registration_action_to_yojson (x : duplicate_registration_action) =
  match x with SKIP -> `String "SKIP" | REGISTER_AS_NEW -> `String "REGISTER_AS_NEW"

let registration_config_watchlist_ids_to_yojson tree = list_to_yojson watchlist_id_to_yojson tree

let registration_config_to_yojson (x : registration_config) =
  assoc_to_yojson
    [
      ("WatchlistIds", option_to_yojson registration_config_watchlist_ids_to_yojson x.watchlist_ids);
      ( "FraudsterSimilarityThreshold",
        option_to_yojson score_to_yojson x.fraudster_similarity_threshold );
      ( "DuplicateRegistrationAction",
        option_to_yojson duplicate_registration_action_to_yojson x.duplicate_registration_action );
    ]

let fraudster_registration_job_to_yojson (x : fraudster_registration_job) =
  assoc_to_yojson
    [
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("RegistrationConfig", option_to_yojson registration_config_to_yojson x.registration_config);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("JobStatus", option_to_yojson fraudster_registration_job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let start_fraudster_registration_job_response_to_yojson
    (x : start_fraudster_registration_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson fraudster_registration_job_to_yojson x.job) ]

let start_fraudster_registration_job_request_to_yojson
    (x : start_fraudster_registration_job_request) =
  assoc_to_yojson
    [
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("RegistrationConfig", option_to_yojson registration_config_to_yojson x.registration_config);
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let customer_speaker_id_to_yojson = string_to_yojson
let generated_speaker_id_to_yojson = string_to_yojson

let speaker_status_to_yojson (x : speaker_status) =
  match x with
  | ENROLLED -> `String "ENROLLED"
  | EXPIRED -> `String "EXPIRED"
  | OPTED_OUT -> `String "OPTED_OUT"
  | PENDING -> `String "PENDING"

let speaker_to_yojson (x : speaker) =
  assoc_to_yojson
    [
      ("LastAccessedAt", option_to_yojson timestamp_to_yojson x.last_accessed_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Status", option_to_yojson speaker_status_to_yojson x.status);
      ("GeneratedSpeakerId", option_to_yojson generated_speaker_id_to_yojson x.generated_speaker_id);
      ("CustomerSpeakerId", option_to_yojson customer_speaker_id_to_yojson x.customer_speaker_id);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let opt_out_speaker_response_to_yojson (x : opt_out_speaker_response) =
  assoc_to_yojson [ ("Speaker", option_to_yojson speaker_to_yojson x.speaker) ]

let speaker_id_to_yojson = string_to_yojson

let opt_out_speaker_request_to_yojson (x : opt_out_speaker_request) =
  assoc_to_yojson
    [
      ("SpeakerId", Some (speaker_id_to_yojson x.speaker_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let list_watchlists_response_to_yojson (x : list_watchlists_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("WatchlistSummaries", option_to_yojson watchlist_summaries_to_yojson x.watchlist_summaries);
    ]

let max_results_for_list_to_yojson = int_to_yojson
let next_token_to_yojson = string_to_yojson

let list_watchlists_request_to_yojson (x : list_watchlists_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let speaker_summary_to_yojson (x : speaker_summary) =
  assoc_to_yojson
    [
      ("LastAccessedAt", option_to_yojson timestamp_to_yojson x.last_accessed_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Status", option_to_yojson speaker_status_to_yojson x.status);
      ("GeneratedSpeakerId", option_to_yojson generated_speaker_id_to_yojson x.generated_speaker_id);
      ("CustomerSpeakerId", option_to_yojson customer_speaker_id_to_yojson x.customer_speaker_id);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let speaker_summaries_to_yojson tree = list_to_yojson speaker_summary_to_yojson tree

let list_speakers_response_to_yojson (x : list_speakers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("SpeakerSummaries", option_to_yojson speaker_summaries_to_yojson x.speaker_summaries);
    ]

let list_speakers_request_to_yojson (x : list_speakers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let speaker_enrollment_job_summary_to_yojson (x : speaker_enrollment_job_summary) =
  assoc_to_yojson
    [
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("JobStatus", option_to_yojson speaker_enrollment_job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let speaker_enrollment_job_summaries_to_yojson tree =
  list_to_yojson speaker_enrollment_job_summary_to_yojson tree

let list_speaker_enrollment_jobs_response_to_yojson (x : list_speaker_enrollment_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("JobSummaries", option_to_yojson speaker_enrollment_job_summaries_to_yojson x.job_summaries);
    ]

let list_speaker_enrollment_jobs_request_to_yojson (x : list_speaker_enrollment_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("JobStatus", option_to_yojson speaker_enrollment_job_status_to_yojson x.job_status);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let generated_fraudster_id_to_yojson = string_to_yojson
let response_watchlist_ids_to_yojson tree = list_to_yojson watchlist_id_to_yojson tree

let fraudster_summary_to_yojson (x : fraudster_summary) =
  assoc_to_yojson
    [
      ("WatchlistIds", option_to_yojson response_watchlist_ids_to_yojson x.watchlist_ids);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "GeneratedFraudsterId",
        option_to_yojson generated_fraudster_id_to_yojson x.generated_fraudster_id );
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let fraudster_summaries_to_yojson tree = list_to_yojson fraudster_summary_to_yojson tree

let list_fraudsters_response_to_yojson (x : list_fraudsters_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("FraudsterSummaries", option_to_yojson fraudster_summaries_to_yojson x.fraudster_summaries);
    ]

let list_fraudsters_request_to_yojson (x : list_fraudsters_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let fraudster_registration_job_summary_to_yojson (x : fraudster_registration_job_summary) =
  assoc_to_yojson
    [
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("JobStatus", option_to_yojson fraudster_registration_job_status_to_yojson x.job_status);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let fraudster_registration_job_summaries_to_yojson tree =
  list_to_yojson fraudster_registration_job_summary_to_yojson tree

let list_fraudster_registration_jobs_response_to_yojson
    (x : list_fraudster_registration_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "JobSummaries",
        option_to_yojson fraudster_registration_job_summaries_to_yojson x.job_summaries );
    ]

let list_fraudster_registration_jobs_request_to_yojson
    (x : list_fraudster_registration_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("JobStatus", option_to_yojson fraudster_registration_job_status_to_yojson x.job_status);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let session_id_to_yojson = string_to_yojson
let session_name_to_yojson = string_to_yojson

let streaming_status_to_yojson (x : streaming_status) =
  match x with
  | PENDING_CONFIGURATION -> `String "PENDING_CONFIGURATION"
  | ONGOING -> `String "ONGOING"
  | ENDED -> `String "ENDED"

let unique_id_large_to_yojson = string_to_yojson

let authentication_decision_to_yojson (x : authentication_decision) =
  match x with
  | ACCEPT -> `String "ACCEPT"
  | REJECT -> `String "REJECT"
  | NOT_ENOUGH_SPEECH -> `String "NOT_ENOUGH_SPEECH"
  | SPEAKER_NOT_ENROLLED -> `String "SPEAKER_NOT_ENROLLED"
  | SPEAKER_OPTED_OUT -> `String "SPEAKER_OPTED_OUT"
  | SPEAKER_ID_NOT_PROVIDED -> `String "SPEAKER_ID_NOT_PROVIDED"
  | SPEAKER_EXPIRED -> `String "SPEAKER_EXPIRED"

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson [ ("AcceptanceThreshold", Some (score_to_yojson x.acceptance_threshold)) ]

let authentication_result_to_yojson (x : authentication_result) =
  assoc_to_yojson
    [
      ("Configuration", option_to_yojson authentication_configuration_to_yojson x.configuration);
      ("Score", option_to_yojson score_to_yojson x.score);
      ("Decision", option_to_yojson authentication_decision_to_yojson x.decision);
      ("GeneratedSpeakerId", option_to_yojson generated_speaker_id_to_yojson x.generated_speaker_id);
      ("CustomerSpeakerId", option_to_yojson customer_speaker_id_to_yojson x.customer_speaker_id);
      ("AudioAggregationEndedAt", option_to_yojson timestamp_to_yojson x.audio_aggregation_ended_at);
      ( "AudioAggregationStartedAt",
        option_to_yojson timestamp_to_yojson x.audio_aggregation_started_at );
      ( "AuthenticationResultId",
        option_to_yojson unique_id_large_to_yojson x.authentication_result_id );
    ]

let fraud_detection_configuration_to_yojson (x : fraud_detection_configuration) =
  assoc_to_yojson
    [
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
      ("RiskThreshold", option_to_yojson score_to_yojson x.risk_threshold);
    ]

let fraud_detection_decision_to_yojson (x : fraud_detection_decision) =
  match x with
  | HIGH_RISK -> `String "HIGH_RISK"
  | LOW_RISK -> `String "LOW_RISK"
  | NOT_ENOUGH_SPEECH -> `String "NOT_ENOUGH_SPEECH"

let fraud_detection_reason_to_yojson (x : fraud_detection_reason) =
  match x with
  | KNOWN_FRAUDSTER -> `String "KNOWN_FRAUDSTER"
  | VOICE_SPOOFING -> `String "VOICE_SPOOFING"

let fraud_detection_reasons_to_yojson tree = list_to_yojson fraud_detection_reason_to_yojson tree

let known_fraudster_risk_to_yojson (x : known_fraudster_risk) =
  assoc_to_yojson
    [
      ( "GeneratedFraudsterId",
        option_to_yojson generated_fraudster_id_to_yojson x.generated_fraudster_id );
      ("RiskScore", Some (score_to_yojson x.risk_score));
    ]

let fraud_risk_details_to_yojson (x : fraud_risk_details) =
  assoc_to_yojson
    [
      ("VoiceSpoofingRisk", Some (voice_spoofing_risk_to_yojson x.voice_spoofing_risk));
      ("KnownFraudsterRisk", Some (known_fraudster_risk_to_yojson x.known_fraudster_risk));
    ]

let fraud_detection_result_to_yojson (x : fraud_detection_result) =
  assoc_to_yojson
    [
      ("RiskDetails", option_to_yojson fraud_risk_details_to_yojson x.risk_details);
      ("Reasons", option_to_yojson fraud_detection_reasons_to_yojson x.reasons);
      ("Decision", option_to_yojson fraud_detection_decision_to_yojson x.decision);
      ("Configuration", option_to_yojson fraud_detection_configuration_to_yojson x.configuration);
      ("AudioAggregationEndedAt", option_to_yojson timestamp_to_yojson x.audio_aggregation_ended_at);
      ( "AudioAggregationStartedAt",
        option_to_yojson timestamp_to_yojson x.audio_aggregation_started_at );
      ( "FraudDetectionResultId",
        option_to_yojson unique_id_large_to_yojson x.fraud_detection_result_id );
    ]

let evaluate_session_response_to_yojson (x : evaluate_session_response) =
  assoc_to_yojson
    [
      ( "FraudDetectionResult",
        option_to_yojson fraud_detection_result_to_yojson x.fraud_detection_result );
      ( "AuthenticationResult",
        option_to_yojson authentication_result_to_yojson x.authentication_result );
      ("StreamingStatus", option_to_yojson streaming_status_to_yojson x.streaming_status);
      ("SessionName", option_to_yojson session_name_to_yojson x.session_name);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let session_name_or_id_to_yojson = string_to_yojson

let evaluate_session_request_to_yojson (x : evaluate_session_request) =
  assoc_to_yojson
    [
      ("SessionNameOrId", Some (session_name_or_id_to_yojson x.session_name_or_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let fraudster_to_yojson (x : fraudster) =
  assoc_to_yojson
    [
      ("WatchlistIds", option_to_yojson response_watchlist_ids_to_yojson x.watchlist_ids);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "GeneratedFraudsterId",
        option_to_yojson generated_fraudster_id_to_yojson x.generated_fraudster_id );
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let disassociate_fraudster_response_to_yojson (x : disassociate_fraudster_response) =
  assoc_to_yojson [ ("Fraudster", option_to_yojson fraudster_to_yojson x.fraudster) ]

let fraudster_id_to_yojson = string_to_yojson

let disassociate_fraudster_request_to_yojson (x : disassociate_fraudster_request) =
  assoc_to_yojson
    [
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let describe_watchlist_response_to_yojson (x : describe_watchlist_response) =
  assoc_to_yojson [ ("Watchlist", option_to_yojson watchlist_to_yojson x.watchlist) ]

let describe_watchlist_request_to_yojson (x : describe_watchlist_request) =
  assoc_to_yojson
    [
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let describe_speaker_enrollment_job_response_to_yojson
    (x : describe_speaker_enrollment_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson speaker_enrollment_job_to_yojson x.job) ]

let describe_speaker_enrollment_job_request_to_yojson (x : describe_speaker_enrollment_job_request)
    =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let describe_speaker_response_to_yojson (x : describe_speaker_response) =
  assoc_to_yojson [ ("Speaker", option_to_yojson speaker_to_yojson x.speaker) ]

let describe_speaker_request_to_yojson (x : describe_speaker_request) =
  assoc_to_yojson
    [
      ("SpeakerId", Some (speaker_id_to_yojson x.speaker_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let describe_fraudster_registration_job_response_to_yojson
    (x : describe_fraudster_registration_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson fraudster_registration_job_to_yojson x.job) ]

let describe_fraudster_registration_job_request_to_yojson
    (x : describe_fraudster_registration_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (job_id_to_yojson x.job_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let describe_fraudster_response_to_yojson (x : describe_fraudster_response) =
  assoc_to_yojson [ ("Fraudster", option_to_yojson fraudster_to_yojson x.fraudster) ]

let describe_fraudster_request_to_yojson (x : describe_fraudster_request) =
  assoc_to_yojson
    [
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let delete_watchlist_request_to_yojson (x : delete_watchlist_request) =
  assoc_to_yojson
    [
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let delete_speaker_request_to_yojson (x : delete_speaker_request) =
  assoc_to_yojson
    [
      ("SpeakerId", Some (speaker_id_to_yojson x.speaker_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let delete_fraudster_request_to_yojson (x : delete_fraudster_request) =
  assoc_to_yojson
    [
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let create_watchlist_response_to_yojson (x : create_watchlist_response) =
  assoc_to_yojson [ ("Watchlist", option_to_yojson watchlist_to_yojson x.watchlist) ]

let create_watchlist_request_to_yojson (x : create_watchlist_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
      ("Name", Some (watchlist_name_to_yojson x.name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let associate_fraudster_response_to_yojson (x : associate_fraudster_response) =
  assoc_to_yojson [ ("Fraudster", option_to_yojson fraudster_to_yojson x.fraudster) ]

let associate_fraudster_request_to_yojson (x : associate_fraudster_request) =
  assoc_to_yojson
    [
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let arn_to_yojson = string_to_yojson
let domain_name_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let domain_status_to_yojson (x : domain_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"
  | SUSPENDED -> `String "SUSPENDED"

let server_side_encryption_configuration_to_yojson (x : server_side_encryption_configuration) =
  assoc_to_yojson [ ("KmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id)) ]

let server_side_encryption_update_status_to_yojson (x : server_side_encryption_update_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let server_side_encryption_update_details_to_yojson (x : server_side_encryption_update_details) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ( "UpdateStatus",
        option_to_yojson server_side_encryption_update_status_to_yojson x.update_status );
      ("OldKmsKeyId", option_to_yojson kms_key_id_to_yojson x.old_kms_key_id);
    ]

let domain_to_yojson (x : domain) =
  assoc_to_yojson
    [
      ("WatchlistDetails", option_to_yojson watchlist_details_to_yojson x.watchlist_details);
      ( "ServerSideEncryptionUpdateDetails",
        option_to_yojson server_side_encryption_update_details_to_yojson
          x.server_side_encryption_update_details );
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "ServerSideEncryptionConfiguration",
        option_to_yojson server_side_encryption_configuration_to_yojson
          x.server_side_encryption_configuration );
      ("DomainStatus", option_to_yojson domain_status_to_yojson x.domain_status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", option_to_yojson domain_name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let update_domain_response_to_yojson (x : update_domain_response) =
  assoc_to_yojson [ ("Domain", option_to_yojson domain_to_yojson x.domain) ]

let update_domain_request_to_yojson (x : update_domain_request) =
  assoc_to_yojson
    [
      ( "ServerSideEncryptionConfiguration",
        Some (server_side_encryption_configuration_to_yojson x.server_side_encryption_configuration)
      );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (domain_name_to_yojson x.name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let max_results_for_list_domain_fe_to_yojson = int_to_yojson

let domain_summary_to_yojson (x : domain_summary) =
  assoc_to_yojson
    [
      ("WatchlistDetails", option_to_yojson watchlist_details_to_yojson x.watchlist_details);
      ( "ServerSideEncryptionUpdateDetails",
        option_to_yojson server_side_encryption_update_details_to_yojson
          x.server_side_encryption_update_details );
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "ServerSideEncryptionConfiguration",
        option_to_yojson server_side_encryption_configuration_to_yojson
          x.server_side_encryption_configuration );
      ("DomainStatus", option_to_yojson domain_status_to_yojson x.domain_status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", option_to_yojson domain_name_to_yojson x.name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let domain_summaries_to_yojson tree = list_to_yojson domain_summary_to_yojson tree

let list_domains_response_to_yojson (x : list_domains_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("DomainSummaries", option_to_yojson domain_summaries_to_yojson x.domain_summaries);
    ]

let list_domains_request_to_yojson (x : list_domains_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_for_list_domain_fe_to_yojson x.max_results);
    ]

let describe_domain_response_to_yojson (x : describe_domain_response) =
  assoc_to_yojson [ ("Domain", option_to_yojson domain_to_yojson x.domain) ]

let describe_domain_request_to_yojson (x : describe_domain_request) =
  assoc_to_yojson [ ("DomainId", Some (domain_id_to_yojson x.domain_id)) ]

let delete_domain_request_to_yojson (x : delete_domain_request) =
  assoc_to_yojson [ ("DomainId", Some (domain_id_to_yojson x.domain_id)) ]

let create_domain_response_to_yojson (x : create_domain_response) =
  assoc_to_yojson [ ("Domain", option_to_yojson domain_to_yojson x.domain) ]

let create_domain_request_to_yojson (x : create_domain_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "ServerSideEncryptionConfiguration",
        Some (server_side_encryption_configuration_to_yojson x.server_side_encryption_configuration)
      );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (domain_name_to_yojson x.name));
    ]
