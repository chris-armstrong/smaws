open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : access_denied_exception)

let amazon_resource_name_of_yojson = string_of_yojson
let arn_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : throttling_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BATCH_JOB" -> BATCH_JOB
    | `String "COMPLIANCE_CONSENT" -> COMPLIANCE_CONSENT
    | `String "DOMAIN" -> DOMAIN
    | `String "FRAUDSTER" -> FRAUDSTER
    | `String "SESSION" -> SESSION
    | `String "SPEAKER" -> SPEAKER
    | `String "WATCHLIST" -> WATCHLIST
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "Message") _list path }
    : internal_server_exception)

let conflict_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANOTHER_ACTIVE_STREAM" -> ANOTHER_ACTIVE_STREAM
    | `String "DOMAIN_NOT_ACTIVE" -> DOMAIN_NOT_ACTIVE
    | `String "CANNOT_CHANGE_SPEAKER_AFTER_ENROLLMENT" -> CANNOT_CHANGE_SPEAKER_AFTER_ENROLLMENT
    | `String "ENROLLMENT_ALREADY_EXISTS" -> ENROLLMENT_ALREADY_EXISTS
    | `String "SPEAKER_NOT_SET" -> SPEAKER_NOT_SET
    | `String "SPEAKER_OPTED_OUT" -> SPEAKER_OPTED_OUT
    | `String "CONCURRENT_CHANGES" -> CONCURRENT_CHANGES
    | `String "DOMAIN_LOCKED_FROM_ENCRYPTION_UPDATES" -> DOMAIN_LOCKED_FROM_ENCRYPTION_UPDATES
    | `String "CANNOT_DELETE_NON_EMPTY_WATCHLIST" -> CANNOT_DELETE_NON_EMPTY_WATCHLIST
    | `String "FRAUDSTER_MUST_BELONG_TO_AT_LEAST_ONE_WATCHLIST" ->
        FRAUDSTER_MUST_BELONG_TO_AT_LEAST_ONE_WATCHLIST
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConflictType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConflictType")
     : conflict_type)
    : conflict_type)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     conflict_type =
       option_of_yojson (value_for_key conflict_type_of_yojson "ConflictType") _list path;
   }
    : conflict_exception)

let watchlist_id_of_yojson = string_of_yojson
let response_watchlist_ids_of_yojson tree path = list_of_yojson watchlist_id_of_yojson tree path
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let generated_fraudster_id_of_yojson = string_of_yojson
let domain_id_of_yojson = string_of_yojson

let fraudster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     generated_fraudster_id =
       option_of_yojson
         (value_for_key generated_fraudster_id_of_yojson "GeneratedFraudsterId")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     watchlist_ids =
       option_of_yojson (value_for_key response_watchlist_ids_of_yojson "WatchlistIds") _list path;
   }
    : fraudster)

let associate_fraudster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fraudster = option_of_yojson (value_for_key fraudster_of_yojson "Fraudster") _list path }
    : associate_fraudster_response)

let fraudster_id_of_yojson = string_of_yojson

let associate_fraudster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     watchlist_id = value_for_key watchlist_id_of_yojson "WatchlistId" _list path;
     fraudster_id = value_for_key fraudster_id_of_yojson "FraudsterId" _list path;
   }
    : associate_fraudster_request)

let score_of_yojson = int_of_yojson

let authentication_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ acceptance_threshold = value_for_key score_of_yojson "AcceptanceThreshold" _list path }
    : authentication_configuration)

let authentication_decision_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCEPT" -> ACCEPT
    | `String "REJECT" -> REJECT
    | `String "NOT_ENOUGH_SPEECH" -> NOT_ENOUGH_SPEECH
    | `String "SPEAKER_NOT_ENROLLED" -> SPEAKER_NOT_ENROLLED
    | `String "SPEAKER_OPTED_OUT" -> SPEAKER_OPTED_OUT
    | `String "SPEAKER_ID_NOT_PROVIDED" -> SPEAKER_ID_NOT_PROVIDED
    | `String "SPEAKER_EXPIRED" -> SPEAKER_EXPIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AuthenticationDecision" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthenticationDecision")
     : authentication_decision)
    : authentication_decision)

let generated_speaker_id_of_yojson = string_of_yojson
let customer_speaker_id_of_yojson = string_of_yojson
let unique_id_large_of_yojson = string_of_yojson

let authentication_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_result_id =
       option_of_yojson
         (value_for_key unique_id_large_of_yojson "AuthenticationResultId")
         _list path;
     audio_aggregation_started_at =
       option_of_yojson (value_for_key timestamp_of_yojson "AudioAggregationStartedAt") _list path;
     audio_aggregation_ended_at =
       option_of_yojson (value_for_key timestamp_of_yojson "AudioAggregationEndedAt") _list path;
     customer_speaker_id =
       option_of_yojson (value_for_key customer_speaker_id_of_yojson "CustomerSpeakerId") _list path;
     generated_speaker_id =
       option_of_yojson
         (value_for_key generated_speaker_id_of_yojson "GeneratedSpeakerId")
         _list path;
     decision =
       option_of_yojson (value_for_key authentication_decision_of_yojson "Decision") _list path;
     score = option_of_yojson (value_for_key score_of_yojson "Score") _list path;
     configuration =
       option_of_yojson
         (value_for_key authentication_configuration_of_yojson "Configuration")
         _list path;
   }
    : authentication_result)

let boolean__of_yojson = bool_of_yojson
let client_token_string_of_yojson = string_of_yojson

let watchlist_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ default_watchlist_id = value_for_key watchlist_id_of_yojson "DefaultWatchlistId" _list path }
    : watchlist_details)

let server_side_encryption_update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ServerSideEncryptionUpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServerSideEncryptionUpdateStatus")
     : server_side_encryption_update_status)
    : server_side_encryption_update_status)

let kms_key_id_of_yojson = string_of_yojson

let server_side_encryption_update_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     old_kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "OldKmsKeyId") _list path;
     update_status =
       option_of_yojson
         (value_for_key server_side_encryption_update_status_of_yojson "UpdateStatus")
         _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : server_side_encryption_update_details)

let server_side_encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ kms_key_id = value_for_key kms_key_id_of_yojson "KmsKeyId" _list path }
    : server_side_encryption_configuration)

let domain_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "PENDING" -> PENDING
    | `String "SUSPENDED" -> SUSPENDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainStatus")
     : domain_status)
    : domain_status)

let description_of_yojson = string_of_yojson
let domain_name_of_yojson = string_of_yojson

let domain_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key domain_name_of_yojson "Name") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     domain_status =
       option_of_yojson (value_for_key domain_status_of_yojson "DomainStatus") _list path;
     server_side_encryption_configuration =
       option_of_yojson
         (value_for_key server_side_encryption_configuration_of_yojson
            "ServerSideEncryptionConfiguration")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     server_side_encryption_update_details =
       option_of_yojson
         (value_for_key server_side_encryption_update_details_of_yojson
            "ServerSideEncryptionUpdateDetails")
         _list path;
     watchlist_details =
       option_of_yojson (value_for_key watchlist_details_of_yojson "WatchlistDetails") _list path;
   }
    : domain)

let create_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path }
    : create_domain_response)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key domain_name_of_yojson "Name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     server_side_encryption_configuration =
       value_for_key server_side_encryption_configuration_of_yojson
         "ServerSideEncryptionConfiguration" _list path;
     client_token =
       option_of_yojson (value_for_key client_token_string_of_yojson "ClientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_domain_request)

let watchlist_description_of_yojson = string_of_yojson
let watchlist_name_of_yojson = string_of_yojson

let watchlist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     watchlist_id = option_of_yojson (value_for_key watchlist_id_of_yojson "WatchlistId") _list path;
     name = option_of_yojson (value_for_key watchlist_name_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key watchlist_description_of_yojson "Description") _list path;
     default_watchlist =
       option_of_yojson (value_for_key boolean__of_yojson "DefaultWatchlist") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
   }
    : watchlist)

let create_watchlist_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ watchlist = option_of_yojson (value_for_key watchlist_of_yojson "Watchlist") _list path }
    : create_watchlist_response)

let create_watchlist_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     name = value_for_key watchlist_name_of_yojson "Name" _list path;
     description =
       option_of_yojson (value_for_key watchlist_description_of_yojson "Description") _list path;
     client_token =
       option_of_yojson (value_for_key client_token_string_of_yojson "ClientToken") _list path;
   }
    : create_watchlist_request)

let delete_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_id = value_for_key domain_id_of_yojson "DomainId" _list path } : delete_domain_request)

let delete_fraudster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     fraudster_id = value_for_key fraudster_id_of_yojson "FraudsterId" _list path;
   }
    : delete_fraudster_request)

let speaker_id_of_yojson = string_of_yojson

let delete_speaker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     speaker_id = value_for_key speaker_id_of_yojson "SpeakerId" _list path;
   }
    : delete_speaker_request)

let delete_watchlist_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     watchlist_id = value_for_key watchlist_id_of_yojson "WatchlistId" _list path;
   }
    : delete_watchlist_request)

let describe_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path }
    : describe_domain_response)

let describe_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain_id = value_for_key domain_id_of_yojson "DomainId" _list path }
    : describe_domain_request)

let describe_fraudster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fraudster = option_of_yojson (value_for_key fraudster_of_yojson "Fraudster") _list path }
    : describe_fraudster_response)

let describe_fraudster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     fraudster_id = value_for_key fraudster_id_of_yojson "FraudsterId" _list path;
   }
    : describe_fraudster_request)

let job_progress_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     percent_complete =
       option_of_yojson (value_for_key score_of_yojson "PercentComplete") _list path;
   }
    : job_progress)

let integer_of_yojson = int_of_yojson

let failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code = option_of_yojson (value_for_key integer_of_yojson "StatusCode") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
   }
    : failure_details)

let s3_uri_of_yojson = string_of_yojson

let output_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
   }
    : output_data_config)

let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_uri = value_for_key s3_uri_of_yojson "S3Uri" _list path } : input_data_config)

let registration_config_watchlist_ids_of_yojson tree path =
  list_of_yojson watchlist_id_of_yojson tree path

let duplicate_registration_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "SKIP" -> SKIP
    | `String "REGISTER_AS_NEW" -> REGISTER_AS_NEW
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DuplicateRegistrationAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DuplicateRegistrationAction")
     : duplicate_registration_action)
    : duplicate_registration_action)

let registration_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duplicate_registration_action =
       option_of_yojson
         (value_for_key duplicate_registration_action_of_yojson "DuplicateRegistrationAction")
         _list path;
     fraudster_similarity_threshold =
       option_of_yojson (value_for_key score_of_yojson "FraudsterSimilarityThreshold") _list path;
     watchlist_ids =
       option_of_yojson
         (value_for_key registration_config_watchlist_ids_of_yojson "WatchlistIds")
         _list path;
   }
    : registration_config)

let iam_role_arn_of_yojson = string_of_yojson

let fraudster_registration_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "COMPLETED_WITH_ERRORS" -> COMPLETED_WITH_ERRORS
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FraudsterRegistrationJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FraudsterRegistrationJobStatus")
     : fraudster_registration_job_status)
    : fraudster_registration_job_status)

let job_id_of_yojson = string_of_yojson
let job_name_of_yojson = string_of_yojson

let fraudster_registration_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status =
       option_of_yojson
         (value_for_key fraudster_registration_job_status_of_yojson "JobStatus")
         _list path;
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     registration_config =
       option_of_yojson
         (value_for_key registration_config_of_yojson "RegistrationConfig")
         _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     ended_at = option_of_yojson (value_for_key timestamp_of_yojson "EndedAt") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     job_progress = option_of_yojson (value_for_key job_progress_of_yojson "JobProgress") _list path;
   }
    : fraudster_registration_job)

let describe_fraudster_registration_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job = option_of_yojson (value_for_key fraudster_registration_job_of_yojson "Job") _list path }
    : describe_fraudster_registration_job_response)

let describe_fraudster_registration_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
   }
    : describe_fraudster_registration_job_request)

let speaker_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENROLLED" -> ENROLLED
    | `String "EXPIRED" -> EXPIRED
    | `String "OPTED_OUT" -> OPTED_OUT
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SpeakerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SpeakerStatus")
     : speaker_status)
    : speaker_status)

let speaker_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     customer_speaker_id =
       option_of_yojson (value_for_key customer_speaker_id_of_yojson "CustomerSpeakerId") _list path;
     generated_speaker_id =
       option_of_yojson
         (value_for_key generated_speaker_id_of_yojson "GeneratedSpeakerId")
         _list path;
     status = option_of_yojson (value_for_key speaker_status_of_yojson "Status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     last_accessed_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAccessedAt") _list path;
   }
    : speaker)

let describe_speaker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ speaker = option_of_yojson (value_for_key speaker_of_yojson "Speaker") _list path }
    : describe_speaker_response)

let describe_speaker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     speaker_id = value_for_key speaker_id_of_yojson "SpeakerId" _list path;
   }
    : describe_speaker_request)

let enrollment_job_fraud_detection_config_watchlist_ids_of_yojson tree path =
  list_of_yojson watchlist_id_of_yojson tree path

let fraud_detection_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "IGNORE" -> IGNORE
    | `String "FAIL" -> FAIL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FraudDetectionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "FraudDetectionAction")
     : fraud_detection_action)
    : fraud_detection_action)

let enrollment_job_fraud_detection_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fraud_detection_action =
       option_of_yojson
         (value_for_key fraud_detection_action_of_yojson "FraudDetectionAction")
         _list path;
     risk_threshold = option_of_yojson (value_for_key score_of_yojson "RiskThreshold") _list path;
     watchlist_ids =
       option_of_yojson
         (value_for_key enrollment_job_fraud_detection_config_watchlist_ids_of_yojson "WatchlistIds")
         _list path;
   }
    : enrollment_job_fraud_detection_config)

let existing_enrollment_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "SKIP" -> SKIP
    | `String "OVERWRITE" -> OVERWRITE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExistingEnrollmentAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ExistingEnrollmentAction")
     : existing_enrollment_action)
    : existing_enrollment_action)

let enrollment_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     existing_enrollment_action =
       option_of_yojson
         (value_for_key existing_enrollment_action_of_yojson "ExistingEnrollmentAction")
         _list path;
     fraud_detection_config =
       option_of_yojson
         (value_for_key enrollment_job_fraud_detection_config_of_yojson "FraudDetectionConfig")
         _list path;
   }
    : enrollment_config)

let speaker_enrollment_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUBMITTED" -> SUBMITTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "COMPLETED_WITH_ERRORS" -> COMPLETED_WITH_ERRORS
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SpeakerEnrollmentJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SpeakerEnrollmentJobStatus")
     : speaker_enrollment_job_status)
    : speaker_enrollment_job_status)

let speaker_enrollment_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status =
       option_of_yojson
         (value_for_key speaker_enrollment_job_status_of_yojson "JobStatus")
         _list path;
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     data_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "DataAccessRoleArn") _list path;
     enrollment_config =
       option_of_yojson (value_for_key enrollment_config_of_yojson "EnrollmentConfig") _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     output_data_config =
       option_of_yojson (value_for_key output_data_config_of_yojson "OutputDataConfig") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     ended_at = option_of_yojson (value_for_key timestamp_of_yojson "EndedAt") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     job_progress = option_of_yojson (value_for_key job_progress_of_yojson "JobProgress") _list path;
   }
    : speaker_enrollment_job)

let describe_speaker_enrollment_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job = option_of_yojson (value_for_key speaker_enrollment_job_of_yojson "Job") _list path }
    : describe_speaker_enrollment_job_response)

let describe_speaker_enrollment_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     job_id = value_for_key job_id_of_yojson "JobId" _list path;
   }
    : describe_speaker_enrollment_job_request)

let describe_watchlist_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ watchlist = option_of_yojson (value_for_key watchlist_of_yojson "Watchlist") _list path }
    : describe_watchlist_response)

let describe_watchlist_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     watchlist_id = value_for_key watchlist_id_of_yojson "WatchlistId" _list path;
   }
    : describe_watchlist_request)

let disassociate_fraudster_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fraudster = option_of_yojson (value_for_key fraudster_of_yojson "Fraudster") _list path }
    : disassociate_fraudster_response)

let disassociate_fraudster_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     watchlist_id = value_for_key watchlist_id_of_yojson "WatchlistId" _list path;
     fraudster_id = value_for_key fraudster_id_of_yojson "FraudsterId" _list path;
   }
    : disassociate_fraudster_request)

let domain_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key domain_name_of_yojson "Name") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     domain_status =
       option_of_yojson (value_for_key domain_status_of_yojson "DomainStatus") _list path;
     server_side_encryption_configuration =
       option_of_yojson
         (value_for_key server_side_encryption_configuration_of_yojson
            "ServerSideEncryptionConfiguration")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     server_side_encryption_update_details =
       option_of_yojson
         (value_for_key server_side_encryption_update_details_of_yojson
            "ServerSideEncryptionUpdateDetails")
         _list path;
     watchlist_details =
       option_of_yojson (value_for_key watchlist_details_of_yojson "WatchlistDetails") _list path;
   }
    : domain_summary)

let domain_summaries_of_yojson tree path = list_of_yojson domain_summary_of_yojson tree path

let voice_spoofing_risk_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ risk_score = value_for_key score_of_yojson "RiskScore" _list path } : voice_spoofing_risk)

let known_fraudster_risk_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     risk_score = value_for_key score_of_yojson "RiskScore" _list path;
     generated_fraudster_id =
       option_of_yojson
         (value_for_key generated_fraudster_id_of_yojson "GeneratedFraudsterId")
         _list path;
   }
    : known_fraudster_risk)

let fraud_risk_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     known_fraudster_risk =
       value_for_key known_fraudster_risk_of_yojson "KnownFraudsterRisk" _list path;
     voice_spoofing_risk =
       value_for_key voice_spoofing_risk_of_yojson "VoiceSpoofingRisk" _list path;
   }
    : fraud_risk_details)

let fraud_detection_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KNOWN_FRAUDSTER" -> KNOWN_FRAUDSTER
    | `String "VOICE_SPOOFING" -> VOICE_SPOOFING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FraudDetectionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FraudDetectionReason")
     : fraud_detection_reason)
    : fraud_detection_reason)

let fraud_detection_reasons_of_yojson tree path =
  list_of_yojson fraud_detection_reason_of_yojson tree path

let fraud_detection_decision_of_yojson (tree : t) path =
  ((match tree with
    | `String "HIGH_RISK" -> HIGH_RISK
    | `String "LOW_RISK" -> LOW_RISK
    | `String "NOT_ENOUGH_SPEECH" -> NOT_ENOUGH_SPEECH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FraudDetectionDecision" value)
    | _ -> raise (deserialize_wrong_type_error path "FraudDetectionDecision")
     : fraud_detection_decision)
    : fraud_detection_decision)

let fraud_detection_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     risk_threshold = option_of_yojson (value_for_key score_of_yojson "RiskThreshold") _list path;
     watchlist_id = option_of_yojson (value_for_key watchlist_id_of_yojson "WatchlistId") _list path;
   }
    : fraud_detection_configuration)

let fraud_detection_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fraud_detection_result_id =
       option_of_yojson
         (value_for_key unique_id_large_of_yojson "FraudDetectionResultId")
         _list path;
     audio_aggregation_started_at =
       option_of_yojson (value_for_key timestamp_of_yojson "AudioAggregationStartedAt") _list path;
     audio_aggregation_ended_at =
       option_of_yojson (value_for_key timestamp_of_yojson "AudioAggregationEndedAt") _list path;
     configuration =
       option_of_yojson
         (value_for_key fraud_detection_configuration_of_yojson "Configuration")
         _list path;
     decision =
       option_of_yojson (value_for_key fraud_detection_decision_of_yojson "Decision") _list path;
     reasons =
       option_of_yojson (value_for_key fraud_detection_reasons_of_yojson "Reasons") _list path;
     risk_details =
       option_of_yojson (value_for_key fraud_risk_details_of_yojson "RiskDetails") _list path;
   }
    : fraud_detection_result)

let streaming_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_CONFIGURATION" -> PENDING_CONFIGURATION
    | `String "ONGOING" -> ONGOING
    | `String "ENDED" -> ENDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamingStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamingStatus")
     : streaming_status)
    : streaming_status)

let session_name_of_yojson = string_of_yojson
let session_id_of_yojson = string_of_yojson

let evaluate_session_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "SessionId") _list path;
     session_name = option_of_yojson (value_for_key session_name_of_yojson "SessionName") _list path;
     streaming_status =
       option_of_yojson (value_for_key streaming_status_of_yojson "StreamingStatus") _list path;
     authentication_result =
       option_of_yojson
         (value_for_key authentication_result_of_yojson "AuthenticationResult")
         _list path;
     fraud_detection_result =
       option_of_yojson
         (value_for_key fraud_detection_result_of_yojson "FraudDetectionResult")
         _list path;
   }
    : evaluate_session_response)

let session_name_or_id_of_yojson = string_of_yojson

let evaluate_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     session_name_or_id = value_for_key session_name_or_id_of_yojson "SessionNameOrId" _list path;
   }
    : evaluate_session_request)

let fraudster_registration_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status =
       option_of_yojson
         (value_for_key fraudster_registration_job_status_of_yojson "JobStatus")
         _list path;
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     ended_at = option_of_yojson (value_for_key timestamp_of_yojson "EndedAt") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     job_progress = option_of_yojson (value_for_key job_progress_of_yojson "JobProgress") _list path;
   }
    : fraudster_registration_job_summary)

let fraudster_registration_job_summaries_of_yojson tree path =
  list_of_yojson fraudster_registration_job_summary_of_yojson tree path

let fraudster_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     generated_fraudster_id =
       option_of_yojson
         (value_for_key generated_fraudster_id_of_yojson "GeneratedFraudsterId")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     watchlist_ids =
       option_of_yojson (value_for_key response_watchlist_ids_of_yojson "WatchlistIds") _list path;
   }
    : fraudster_summary)

let fraudster_summaries_of_yojson tree path = list_of_yojson fraudster_summary_of_yojson tree path

let list_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_summaries =
       option_of_yojson (value_for_key domain_summaries_of_yojson "DomainSummaries") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_domains_response)

let next_token_of_yojson = string_of_yojson
let max_results_for_list_domain_fe_of_yojson = int_of_yojson

let list_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key max_results_for_list_domain_fe_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_domains_request)

let list_fraudster_registration_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_summaries =
       option_of_yojson
         (value_for_key fraudster_registration_job_summaries_of_yojson "JobSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_fraudster_registration_jobs_response)

let max_results_for_list_of_yojson = int_of_yojson

let list_fraudster_registration_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     job_status =
       option_of_yojson
         (value_for_key fraudster_registration_job_status_of_yojson "JobStatus")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_results_for_list_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_fraudster_registration_jobs_request)

let list_fraudsters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fraudster_summaries =
       option_of_yojson
         (value_for_key fraudster_summaries_of_yojson "FraudsterSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_fraudsters_response)

let list_fraudsters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     watchlist_id = option_of_yojson (value_for_key watchlist_id_of_yojson "WatchlistId") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_for_list_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_fraudsters_request)

let speaker_enrollment_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     job_id = option_of_yojson (value_for_key job_id_of_yojson "JobId") _list path;
     job_status =
       option_of_yojson
         (value_for_key speaker_enrollment_job_status_of_yojson "JobStatus")
         _list path;
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     ended_at = option_of_yojson (value_for_key timestamp_of_yojson "EndedAt") _list path;
     failure_details =
       option_of_yojson (value_for_key failure_details_of_yojson "FailureDetails") _list path;
     job_progress = option_of_yojson (value_for_key job_progress_of_yojson "JobProgress") _list path;
   }
    : speaker_enrollment_job_summary)

let speaker_enrollment_job_summaries_of_yojson tree path =
  list_of_yojson speaker_enrollment_job_summary_of_yojson tree path

let list_speaker_enrollment_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_summaries =
       option_of_yojson
         (value_for_key speaker_enrollment_job_summaries_of_yojson "JobSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_speaker_enrollment_jobs_response)

let list_speaker_enrollment_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     job_status =
       option_of_yojson
         (value_for_key speaker_enrollment_job_status_of_yojson "JobStatus")
         _list path;
     max_results =
       option_of_yojson (value_for_key max_results_for_list_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_speaker_enrollment_jobs_request)

let speaker_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     customer_speaker_id =
       option_of_yojson (value_for_key customer_speaker_id_of_yojson "CustomerSpeakerId") _list path;
     generated_speaker_id =
       option_of_yojson
         (value_for_key generated_speaker_id_of_yojson "GeneratedSpeakerId")
         _list path;
     status = option_of_yojson (value_for_key speaker_status_of_yojson "Status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     last_accessed_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LastAccessedAt") _list path;
   }
    : speaker_summary)

let speaker_summaries_of_yojson tree path = list_of_yojson speaker_summary_of_yojson tree path

let list_speakers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     speaker_summaries =
       option_of_yojson (value_for_key speaker_summaries_of_yojson "SpeakerSummaries") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_speakers_response)

let list_speakers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     max_results =
       option_of_yojson (value_for_key max_results_for_list_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_speakers_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let watchlist_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = option_of_yojson (value_for_key domain_id_of_yojson "DomainId") _list path;
     watchlist_id = option_of_yojson (value_for_key watchlist_id_of_yojson "WatchlistId") _list path;
     name = option_of_yojson (value_for_key watchlist_name_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key watchlist_description_of_yojson "Description") _list path;
     default_watchlist =
       option_of_yojson (value_for_key boolean__of_yojson "DefaultWatchlist") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
   }
    : watchlist_summary)

let watchlist_summaries_of_yojson tree path = list_of_yojson watchlist_summary_of_yojson tree path

let list_watchlists_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     watchlist_summaries =
       option_of_yojson
         (value_for_key watchlist_summaries_of_yojson "WatchlistSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_watchlists_response)

let list_watchlists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     max_results =
       option_of_yojson (value_for_key max_results_for_list_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_watchlists_request)

let opt_out_speaker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ speaker = option_of_yojson (value_for_key speaker_of_yojson "Speaker") _list path }
    : opt_out_speaker_response)

let opt_out_speaker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     speaker_id = value_for_key speaker_id_of_yojson "SpeakerId" _list path;
   }
    : opt_out_speaker_request)

let start_fraudster_registration_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job = option_of_yojson (value_for_key fraudster_registration_job_of_yojson "Job") _list path }
    : start_fraudster_registration_job_response)

let start_fraudster_registration_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key client_token_string_of_yojson "ClientToken") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     registration_config =
       option_of_yojson
         (value_for_key registration_config_of_yojson "RegistrationConfig")
         _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
   }
    : start_fraudster_registration_job_request)

let start_speaker_enrollment_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job = option_of_yojson (value_for_key speaker_enrollment_job_of_yojson "Job") _list path }
    : start_speaker_enrollment_job_response)

let start_speaker_enrollment_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       option_of_yojson (value_for_key client_token_string_of_yojson "ClientToken") _list path;
     job_name = option_of_yojson (value_for_key job_name_of_yojson "JobName") _list path;
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "DataAccessRoleArn" _list path;
     enrollment_config =
       option_of_yojson (value_for_key enrollment_config_of_yojson "EnrollmentConfig") _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     output_data_config = value_for_key output_data_config_of_yojson "OutputDataConfig" _list path;
   }
    : start_speaker_enrollment_job_request)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let update_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path }
    : update_domain_response)

let update_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     name = value_for_key domain_name_of_yojson "Name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     server_side_encryption_configuration =
       value_for_key server_side_encryption_configuration_of_yojson
         "ServerSideEncryptionConfiguration" _list path;
   }
    : update_domain_request)

let update_watchlist_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ watchlist = option_of_yojson (value_for_key watchlist_of_yojson "Watchlist") _list path }
    : update_watchlist_response)

let update_watchlist_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_id = value_for_key domain_id_of_yojson "DomainId" _list path;
     watchlist_id = value_for_key watchlist_id_of_yojson "WatchlistId" _list path;
     name = option_of_yojson (value_for_key watchlist_name_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key watchlist_description_of_yojson "Description") _list path;
   }
    : update_watchlist_request)
