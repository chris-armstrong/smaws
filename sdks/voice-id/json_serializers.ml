open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let amazon_resource_name_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson string__to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
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
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
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
      ("Message", option_to_yojson string__to_yojson x.message);
      ("ConflictType", option_to_yojson conflict_type_to_yojson x.conflict_type);
    ]

let watchlist_id_to_yojson = string_to_yojson
let response_watchlist_ids_to_yojson tree = list_to_yojson watchlist_id_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let generated_fraudster_id_to_yojson = string_to_yojson
let domain_id_to_yojson = string_to_yojson

let fraudster_to_yojson (x : fraudster) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ( "GeneratedFraudsterId",
        option_to_yojson generated_fraudster_id_to_yojson x.generated_fraudster_id );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("WatchlistIds", option_to_yojson response_watchlist_ids_to_yojson x.watchlist_ids);
    ]

let associate_fraudster_response_to_yojson (x : associate_fraudster_response) =
  assoc_to_yojson [ ("Fraudster", option_to_yojson fraudster_to_yojson x.fraudster) ]

let fraudster_id_to_yojson = string_to_yojson

let associate_fraudster_request_to_yojson (x : associate_fraudster_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
    ]

let score_to_yojson = int_to_yojson

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson [ ("AcceptanceThreshold", Some (score_to_yojson x.acceptance_threshold)) ]

let authentication_decision_to_yojson (x : authentication_decision) =
  match x with
  | ACCEPT -> `String "ACCEPT"
  | REJECT -> `String "REJECT"
  | NOT_ENOUGH_SPEECH -> `String "NOT_ENOUGH_SPEECH"
  | SPEAKER_NOT_ENROLLED -> `String "SPEAKER_NOT_ENROLLED"
  | SPEAKER_OPTED_OUT -> `String "SPEAKER_OPTED_OUT"
  | SPEAKER_ID_NOT_PROVIDED -> `String "SPEAKER_ID_NOT_PROVIDED"
  | SPEAKER_EXPIRED -> `String "SPEAKER_EXPIRED"

let generated_speaker_id_to_yojson = string_to_yojson
let customer_speaker_id_to_yojson = string_to_yojson
let unique_id_large_to_yojson = string_to_yojson

let authentication_result_to_yojson (x : authentication_result) =
  assoc_to_yojson
    [
      ( "AuthenticationResultId",
        option_to_yojson unique_id_large_to_yojson x.authentication_result_id );
      ( "AudioAggregationStartedAt",
        option_to_yojson timestamp_to_yojson x.audio_aggregation_started_at );
      ("AudioAggregationEndedAt", option_to_yojson timestamp_to_yojson x.audio_aggregation_ended_at);
      ("CustomerSpeakerId", option_to_yojson customer_speaker_id_to_yojson x.customer_speaker_id);
      ("GeneratedSpeakerId", option_to_yojson generated_speaker_id_to_yojson x.generated_speaker_id);
      ("Decision", option_to_yojson authentication_decision_to_yojson x.decision);
      ("Score", option_to_yojson score_to_yojson x.score);
      ("Configuration", option_to_yojson authentication_configuration_to_yojson x.configuration);
    ]

let boolean__to_yojson = bool_to_yojson
let client_token_string_to_yojson = string_to_yojson

let watchlist_details_to_yojson (x : watchlist_details) =
  assoc_to_yojson [ ("DefaultWatchlistId", Some (watchlist_id_to_yojson x.default_watchlist_id)) ]

let server_side_encryption_update_status_to_yojson (x : server_side_encryption_update_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let kms_key_id_to_yojson = string_to_yojson

let server_side_encryption_update_details_to_yojson (x : server_side_encryption_update_details) =
  assoc_to_yojson
    [
      ("OldKmsKeyId", option_to_yojson kms_key_id_to_yojson x.old_kms_key_id);
      ( "UpdateStatus",
        option_to_yojson server_side_encryption_update_status_to_yojson x.update_status );
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let server_side_encryption_configuration_to_yojson (x : server_side_encryption_configuration) =
  assoc_to_yojson [ ("KmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id)) ]

let domain_status_to_yojson (x : domain_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"
  | SUSPENDED -> `String "SUSPENDED"

let description_to_yojson = string_to_yojson
let domain_name_to_yojson = string_to_yojson

let domain_to_yojson (x : domain) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson domain_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DomainStatus", option_to_yojson domain_status_to_yojson x.domain_status);
      ( "ServerSideEncryptionConfiguration",
        option_to_yojson server_side_encryption_configuration_to_yojson
          x.server_side_encryption_configuration );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "ServerSideEncryptionUpdateDetails",
        option_to_yojson server_side_encryption_update_details_to_yojson
          x.server_side_encryption_update_details );
      ("WatchlistDetails", option_to_yojson watchlist_details_to_yojson x.watchlist_details);
    ]

let create_domain_response_to_yojson (x : create_domain_response) =
  assoc_to_yojson [ ("Domain", option_to_yojson domain_to_yojson x.domain) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_domain_request_to_yojson (x : create_domain_request) =
  assoc_to_yojson
    [
      ("Name", Some (domain_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ServerSideEncryptionConfiguration",
        Some (server_side_encryption_configuration_to_yojson x.server_side_encryption_configuration)
      );
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let watchlist_description_to_yojson = string_to_yojson
let watchlist_name_to_yojson = string_to_yojson

let watchlist_to_yojson (x : watchlist) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
      ("Name", option_to_yojson watchlist_name_to_yojson x.name);
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
      ("DefaultWatchlist", option_to_yojson boolean__to_yojson x.default_watchlist);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let create_watchlist_response_to_yojson (x : create_watchlist_response) =
  assoc_to_yojson [ ("Watchlist", option_to_yojson watchlist_to_yojson x.watchlist) ]

let create_watchlist_request_to_yojson (x : create_watchlist_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("Name", Some (watchlist_name_to_yojson x.name));
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_domain_request_to_yojson (x : delete_domain_request) =
  assoc_to_yojson [ ("DomainId", Some (domain_id_to_yojson x.domain_id)) ]

let delete_fraudster_request_to_yojson (x : delete_fraudster_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
    ]

let speaker_id_to_yojson = string_to_yojson

let delete_speaker_request_to_yojson (x : delete_speaker_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SpeakerId", Some (speaker_id_to_yojson x.speaker_id));
    ]

let delete_watchlist_request_to_yojson (x : delete_watchlist_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
    ]

let describe_domain_response_to_yojson (x : describe_domain_response) =
  assoc_to_yojson [ ("Domain", option_to_yojson domain_to_yojson x.domain) ]

let describe_domain_request_to_yojson (x : describe_domain_request) =
  assoc_to_yojson [ ("DomainId", Some (domain_id_to_yojson x.domain_id)) ]

let describe_fraudster_response_to_yojson (x : describe_fraudster_response) =
  assoc_to_yojson [ ("Fraudster", option_to_yojson fraudster_to_yojson x.fraudster) ]

let describe_fraudster_request_to_yojson (x : describe_fraudster_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
    ]

let job_progress_to_yojson (x : job_progress) =
  assoc_to_yojson [ ("PercentComplete", option_to_yojson score_to_yojson x.percent_complete) ]

let integer_to_yojson = int_to_yojson

let failure_details_to_yojson (x : failure_details) =
  assoc_to_yojson
    [
      ("StatusCode", option_to_yojson integer_to_yojson x.status_code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let s3_uri_to_yojson = string_to_yojson

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let registration_config_watchlist_ids_to_yojson tree = list_to_yojson watchlist_id_to_yojson tree

let duplicate_registration_action_to_yojson (x : duplicate_registration_action) =
  match x with SKIP -> `String "SKIP" | REGISTER_AS_NEW -> `String "REGISTER_AS_NEW"

let registration_config_to_yojson (x : registration_config) =
  assoc_to_yojson
    [
      ( "DuplicateRegistrationAction",
        option_to_yojson duplicate_registration_action_to_yojson x.duplicate_registration_action );
      ( "FraudsterSimilarityThreshold",
        option_to_yojson score_to_yojson x.fraudster_similarity_threshold );
      ("WatchlistIds", option_to_yojson registration_config_watchlist_ids_to_yojson x.watchlist_ids);
    ]

let iam_role_arn_to_yojson = string_to_yojson

let fraudster_registration_job_status_to_yojson (x : fraudster_registration_job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | FAILED -> `String "FAILED"

let job_id_to_yojson = string_to_yojson
let job_name_to_yojson = string_to_yojson

let fraudster_registration_job_to_yojson (x : fraudster_registration_job) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson fraudster_registration_job_status_to_yojson x.job_status);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("RegistrationConfig", option_to_yojson registration_config_to_yojson x.registration_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
    ]

let describe_fraudster_registration_job_response_to_yojson
    (x : describe_fraudster_registration_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson fraudster_registration_job_to_yojson x.job) ]

let describe_fraudster_registration_job_request_to_yojson
    (x : describe_fraudster_registration_job_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let speaker_status_to_yojson (x : speaker_status) =
  match x with
  | ENROLLED -> `String "ENROLLED"
  | EXPIRED -> `String "EXPIRED"
  | OPTED_OUT -> `String "OPTED_OUT"
  | PENDING -> `String "PENDING"

let speaker_to_yojson (x : speaker) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("CustomerSpeakerId", option_to_yojson customer_speaker_id_to_yojson x.customer_speaker_id);
      ("GeneratedSpeakerId", option_to_yojson generated_speaker_id_to_yojson x.generated_speaker_id);
      ("Status", option_to_yojson speaker_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("LastAccessedAt", option_to_yojson timestamp_to_yojson x.last_accessed_at);
    ]

let describe_speaker_response_to_yojson (x : describe_speaker_response) =
  assoc_to_yojson [ ("Speaker", option_to_yojson speaker_to_yojson x.speaker) ]

let describe_speaker_request_to_yojson (x : describe_speaker_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SpeakerId", Some (speaker_id_to_yojson x.speaker_id));
    ]

let enrollment_job_fraud_detection_config_watchlist_ids_to_yojson tree =
  list_to_yojson watchlist_id_to_yojson tree

let fraud_detection_action_to_yojson (x : fraud_detection_action) =
  match x with IGNORE -> `String "IGNORE" | FAIL -> `String "FAIL"

let enrollment_job_fraud_detection_config_to_yojson (x : enrollment_job_fraud_detection_config) =
  assoc_to_yojson
    [
      ( "FraudDetectionAction",
        option_to_yojson fraud_detection_action_to_yojson x.fraud_detection_action );
      ("RiskThreshold", option_to_yojson score_to_yojson x.risk_threshold);
      ( "WatchlistIds",
        option_to_yojson enrollment_job_fraud_detection_config_watchlist_ids_to_yojson
          x.watchlist_ids );
    ]

let existing_enrollment_action_to_yojson (x : existing_enrollment_action) =
  match x with SKIP -> `String "SKIP" | OVERWRITE -> `String "OVERWRITE"

let enrollment_config_to_yojson (x : enrollment_config) =
  assoc_to_yojson
    [
      ( "ExistingEnrollmentAction",
        option_to_yojson existing_enrollment_action_to_yojson x.existing_enrollment_action );
      ( "FraudDetectionConfig",
        option_to_yojson enrollment_job_fraud_detection_config_to_yojson x.fraud_detection_config );
    ]

let speaker_enrollment_job_status_to_yojson (x : speaker_enrollment_job_status) =
  match x with
  | SUBMITTED -> `String "SUBMITTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | FAILED -> `String "FAILED"

let speaker_enrollment_job_to_yojson (x : speaker_enrollment_job) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson speaker_enrollment_job_status_to_yojson x.job_status);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("DataAccessRoleArn", option_to_yojson iam_role_arn_to_yojson x.data_access_role_arn);
      ("EnrollmentConfig", option_to_yojson enrollment_config_to_yojson x.enrollment_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
    ]

let describe_speaker_enrollment_job_response_to_yojson
    (x : describe_speaker_enrollment_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson speaker_enrollment_job_to_yojson x.job) ]

let describe_speaker_enrollment_job_request_to_yojson (x : describe_speaker_enrollment_job_request)
    =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("JobId", Some (job_id_to_yojson x.job_id));
    ]

let describe_watchlist_response_to_yojson (x : describe_watchlist_response) =
  assoc_to_yojson [ ("Watchlist", option_to_yojson watchlist_to_yojson x.watchlist) ]

let describe_watchlist_request_to_yojson (x : describe_watchlist_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
    ]

let disassociate_fraudster_response_to_yojson (x : disassociate_fraudster_response) =
  assoc_to_yojson [ ("Fraudster", option_to_yojson fraudster_to_yojson x.fraudster) ]

let disassociate_fraudster_request_to_yojson (x : disassociate_fraudster_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("FraudsterId", Some (fraudster_id_to_yojson x.fraudster_id));
    ]

let domain_summary_to_yojson (x : domain_summary) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", option_to_yojson domain_name_to_yojson x.name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DomainStatus", option_to_yojson domain_status_to_yojson x.domain_status);
      ( "ServerSideEncryptionConfiguration",
        option_to_yojson server_side_encryption_configuration_to_yojson
          x.server_side_encryption_configuration );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "ServerSideEncryptionUpdateDetails",
        option_to_yojson server_side_encryption_update_details_to_yojson
          x.server_side_encryption_update_details );
      ("WatchlistDetails", option_to_yojson watchlist_details_to_yojson x.watchlist_details);
    ]

let domain_summaries_to_yojson tree = list_to_yojson domain_summary_to_yojson tree

let voice_spoofing_risk_to_yojson (x : voice_spoofing_risk) =
  assoc_to_yojson [ ("RiskScore", Some (score_to_yojson x.risk_score)) ]

let known_fraudster_risk_to_yojson (x : known_fraudster_risk) =
  assoc_to_yojson
    [
      ("RiskScore", Some (score_to_yojson x.risk_score));
      ( "GeneratedFraudsterId",
        option_to_yojson generated_fraudster_id_to_yojson x.generated_fraudster_id );
    ]

let fraud_risk_details_to_yojson (x : fraud_risk_details) =
  assoc_to_yojson
    [
      ("KnownFraudsterRisk", Some (known_fraudster_risk_to_yojson x.known_fraudster_risk));
      ("VoiceSpoofingRisk", Some (voice_spoofing_risk_to_yojson x.voice_spoofing_risk));
    ]

let fraud_detection_reason_to_yojson (x : fraud_detection_reason) =
  match x with
  | KNOWN_FRAUDSTER -> `String "KNOWN_FRAUDSTER"
  | VOICE_SPOOFING -> `String "VOICE_SPOOFING"

let fraud_detection_reasons_to_yojson tree = list_to_yojson fraud_detection_reason_to_yojson tree

let fraud_detection_decision_to_yojson (x : fraud_detection_decision) =
  match x with
  | HIGH_RISK -> `String "HIGH_RISK"
  | LOW_RISK -> `String "LOW_RISK"
  | NOT_ENOUGH_SPEECH -> `String "NOT_ENOUGH_SPEECH"

let fraud_detection_configuration_to_yojson (x : fraud_detection_configuration) =
  assoc_to_yojson
    [
      ("RiskThreshold", option_to_yojson score_to_yojson x.risk_threshold);
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
    ]

let fraud_detection_result_to_yojson (x : fraud_detection_result) =
  assoc_to_yojson
    [
      ( "FraudDetectionResultId",
        option_to_yojson unique_id_large_to_yojson x.fraud_detection_result_id );
      ( "AudioAggregationStartedAt",
        option_to_yojson timestamp_to_yojson x.audio_aggregation_started_at );
      ("AudioAggregationEndedAt", option_to_yojson timestamp_to_yojson x.audio_aggregation_ended_at);
      ("Configuration", option_to_yojson fraud_detection_configuration_to_yojson x.configuration);
      ("Decision", option_to_yojson fraud_detection_decision_to_yojson x.decision);
      ("Reasons", option_to_yojson fraud_detection_reasons_to_yojson x.reasons);
      ("RiskDetails", option_to_yojson fraud_risk_details_to_yojson x.risk_details);
    ]

let streaming_status_to_yojson (x : streaming_status) =
  match x with
  | PENDING_CONFIGURATION -> `String "PENDING_CONFIGURATION"
  | ONGOING -> `String "ONGOING"
  | ENDED -> `String "ENDED"

let session_name_to_yojson = string_to_yojson
let session_id_to_yojson = string_to_yojson

let evaluate_session_response_to_yojson (x : evaluate_session_response) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("SessionName", option_to_yojson session_name_to_yojson x.session_name);
      ("StreamingStatus", option_to_yojson streaming_status_to_yojson x.streaming_status);
      ( "AuthenticationResult",
        option_to_yojson authentication_result_to_yojson x.authentication_result );
      ( "FraudDetectionResult",
        option_to_yojson fraud_detection_result_to_yojson x.fraud_detection_result );
    ]

let session_name_or_id_to_yojson = string_to_yojson

let evaluate_session_request_to_yojson (x : evaluate_session_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SessionNameOrId", Some (session_name_or_id_to_yojson x.session_name_or_id));
    ]

let fraudster_registration_job_summary_to_yojson (x : fraudster_registration_job_summary) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson fraudster_registration_job_status_to_yojson x.job_status);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
    ]

let fraudster_registration_job_summaries_to_yojson tree =
  list_to_yojson fraudster_registration_job_summary_to_yojson tree

let fraudster_summary_to_yojson (x : fraudster_summary) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ( "GeneratedFraudsterId",
        option_to_yojson generated_fraudster_id_to_yojson x.generated_fraudster_id );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("WatchlistIds", option_to_yojson response_watchlist_ids_to_yojson x.watchlist_ids);
    ]

let fraudster_summaries_to_yojson tree = list_to_yojson fraudster_summary_to_yojson tree

let list_domains_response_to_yojson (x : list_domains_response) =
  assoc_to_yojson
    [
      ("DomainSummaries", option_to_yojson domain_summaries_to_yojson x.domain_summaries);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let next_token_to_yojson = string_to_yojson
let max_results_for_list_domain_fe_to_yojson = int_to_yojson

let list_domains_request_to_yojson (x : list_domains_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_for_list_domain_fe_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_fraudster_registration_jobs_response_to_yojson
    (x : list_fraudster_registration_jobs_response) =
  assoc_to_yojson
    [
      ( "JobSummaries",
        option_to_yojson fraudster_registration_job_summaries_to_yojson x.job_summaries );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let max_results_for_list_to_yojson = int_to_yojson

let list_fraudster_registration_jobs_request_to_yojson
    (x : list_fraudster_registration_jobs_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("JobStatus", option_to_yojson fraudster_registration_job_status_to_yojson x.job_status);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_fraudsters_response_to_yojson (x : list_fraudsters_response) =
  assoc_to_yojson
    [
      ("FraudsterSummaries", option_to_yojson fraudster_summaries_to_yojson x.fraudster_summaries);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_fraudsters_request_to_yojson (x : list_fraudsters_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let speaker_enrollment_job_summary_to_yojson (x : speaker_enrollment_job_summary) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("JobId", option_to_yojson job_id_to_yojson x.job_id);
      ("JobStatus", option_to_yojson speaker_enrollment_job_status_to_yojson x.job_status);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("FailureDetails", option_to_yojson failure_details_to_yojson x.failure_details);
      ("JobProgress", option_to_yojson job_progress_to_yojson x.job_progress);
    ]

let speaker_enrollment_job_summaries_to_yojson tree =
  list_to_yojson speaker_enrollment_job_summary_to_yojson tree

let list_speaker_enrollment_jobs_response_to_yojson (x : list_speaker_enrollment_jobs_response) =
  assoc_to_yojson
    [
      ("JobSummaries", option_to_yojson speaker_enrollment_job_summaries_to_yojson x.job_summaries);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_speaker_enrollment_jobs_request_to_yojson (x : list_speaker_enrollment_jobs_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("JobStatus", option_to_yojson speaker_enrollment_job_status_to_yojson x.job_status);
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let speaker_summary_to_yojson (x : speaker_summary) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("CustomerSpeakerId", option_to_yojson customer_speaker_id_to_yojson x.customer_speaker_id);
      ("GeneratedSpeakerId", option_to_yojson generated_speaker_id_to_yojson x.generated_speaker_id);
      ("Status", option_to_yojson speaker_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("LastAccessedAt", option_to_yojson timestamp_to_yojson x.last_accessed_at);
    ]

let speaker_summaries_to_yojson tree = list_to_yojson speaker_summary_to_yojson tree

let list_speakers_response_to_yojson (x : list_speakers_response) =
  assoc_to_yojson
    [
      ("SpeakerSummaries", option_to_yojson speaker_summaries_to_yojson x.speaker_summaries);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_speakers_request_to_yojson (x : list_speakers_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let watchlist_summary_to_yojson (x : watchlist_summary) =
  assoc_to_yojson
    [
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("WatchlistId", option_to_yojson watchlist_id_to_yojson x.watchlist_id);
      ("Name", option_to_yojson watchlist_name_to_yojson x.name);
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
      ("DefaultWatchlist", option_to_yojson boolean__to_yojson x.default_watchlist);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let watchlist_summaries_to_yojson tree = list_to_yojson watchlist_summary_to_yojson tree

let list_watchlists_response_to_yojson (x : list_watchlists_response) =
  assoc_to_yojson
    [
      ("WatchlistSummaries", option_to_yojson watchlist_summaries_to_yojson x.watchlist_summaries);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_watchlists_request_to_yojson (x : list_watchlists_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("MaxResults", option_to_yojson max_results_for_list_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let opt_out_speaker_response_to_yojson (x : opt_out_speaker_response) =
  assoc_to_yojson [ ("Speaker", option_to_yojson speaker_to_yojson x.speaker) ]

let opt_out_speaker_request_to_yojson (x : opt_out_speaker_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("SpeakerId", Some (speaker_id_to_yojson x.speaker_id));
    ]

let start_fraudster_registration_job_response_to_yojson
    (x : start_fraudster_registration_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson fraudster_registration_job_to_yojson x.job) ]

let start_fraudster_registration_job_request_to_yojson
    (x : start_fraudster_registration_job_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("RegistrationConfig", option_to_yojson registration_config_to_yojson x.registration_config);
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
    ]

let start_speaker_enrollment_job_response_to_yojson (x : start_speaker_enrollment_job_response) =
  assoc_to_yojson [ ("Job", option_to_yojson speaker_enrollment_job_to_yojson x.job) ]

let start_speaker_enrollment_job_request_to_yojson (x : start_speaker_enrollment_job_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_string_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("DataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("EnrollmentConfig", option_to_yojson enrollment_config_to_yojson x.enrollment_config);
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let update_domain_response_to_yojson (x : update_domain_response) =
  assoc_to_yojson [ ("Domain", option_to_yojson domain_to_yojson x.domain) ]

let update_domain_request_to_yojson (x : update_domain_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("Name", Some (domain_name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ServerSideEncryptionConfiguration",
        Some (server_side_encryption_configuration_to_yojson x.server_side_encryption_configuration)
      );
    ]

let update_watchlist_response_to_yojson (x : update_watchlist_response) =
  assoc_to_yojson [ ("Watchlist", option_to_yojson watchlist_to_yojson x.watchlist) ]

let update_watchlist_request_to_yojson (x : update_watchlist_request) =
  assoc_to_yojson
    [
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
      ("WatchlistId", Some (watchlist_id_to_yojson x.watchlist_id));
      ("Name", option_to_yojson watchlist_name_to_yojson x.name);
      ("Description", option_to_yojson watchlist_description_to_yojson x.description);
    ]
