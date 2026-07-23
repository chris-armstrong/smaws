(** Voice ID client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_fraudster :
  ?domain_id:domain_id ->
  ?generated_fraudster_id:generated_fraudster_id ->
  ?created_at:timestamp ->
  ?watchlist_ids:response_watchlist_ids ->
  unit ->
  fraudster

val make_associate_fraudster_response : ?fraudster:fraudster -> unit -> associate_fraudster_response

val make_associate_fraudster_request :
  domain_id:domain_id ->
  watchlist_id:watchlist_id ->
  fraudster_id:fraudster_id ->
  unit ->
  associate_fraudster_request

val make_authentication_configuration :
  acceptance_threshold:score -> unit -> authentication_configuration

val make_watchlist_details : default_watchlist_id:watchlist_id -> unit -> watchlist_details

val make_server_side_encryption_update_details :
  ?old_kms_key_id:kms_key_id ->
  ?update_status:server_side_encryption_update_status ->
  ?message:string_ ->
  unit ->
  server_side_encryption_update_details

val make_server_side_encryption_configuration :
  kms_key_id:kms_key_id -> unit -> server_side_encryption_configuration

val make_domain :
  ?domain_id:domain_id ->
  ?arn:arn ->
  ?name:domain_name ->
  ?description:description ->
  ?domain_status:domain_status ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?server_side_encryption_update_details:server_side_encryption_update_details ->
  ?watchlist_details:watchlist_details ->
  unit ->
  domain

val make_create_domain_response : ?domain:domain -> unit -> create_domain_response
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_domain_request :
  ?description:description ->
  ?client_token:client_token_string ->
  ?tags:tag_list ->
  name:domain_name ->
  server_side_encryption_configuration:server_side_encryption_configuration ->
  unit ->
  create_domain_request

val make_watchlist :
  ?domain_id:domain_id ->
  ?watchlist_id:watchlist_id ->
  ?name:watchlist_name ->
  ?description:watchlist_description ->
  ?default_watchlist:boolean_ ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  watchlist

val make_create_watchlist_response : ?watchlist:watchlist -> unit -> create_watchlist_response

val make_create_watchlist_request :
  ?description:watchlist_description ->
  ?client_token:client_token_string ->
  domain_id:domain_id ->
  name:watchlist_name ->
  unit ->
  create_watchlist_request

val make_delete_domain_request : domain_id:domain_id -> unit -> delete_domain_request

val make_delete_fraudster_request :
  domain_id:domain_id -> fraudster_id:fraudster_id -> unit -> delete_fraudster_request

val make_delete_speaker_request :
  domain_id:domain_id -> speaker_id:speaker_id -> unit -> delete_speaker_request

val make_delete_watchlist_request :
  domain_id:domain_id -> watchlist_id:watchlist_id -> unit -> delete_watchlist_request

val make_describe_domain_response : ?domain:domain -> unit -> describe_domain_response
val make_describe_domain_request : domain_id:domain_id -> unit -> describe_domain_request
val make_describe_fraudster_response : ?fraudster:fraudster -> unit -> describe_fraudster_response

val make_describe_fraudster_request :
  domain_id:domain_id -> fraudster_id:fraudster_id -> unit -> describe_fraudster_request

val make_job_progress : ?percent_complete:score -> unit -> job_progress
val make_failure_details : ?status_code:integer -> ?message:string_ -> unit -> failure_details
val make_output_data_config : ?kms_key_id:kms_key_id -> s3_uri:s3_uri -> unit -> output_data_config
val make_input_data_config : s3_uri:s3_uri -> unit -> input_data_config

val make_registration_config :
  ?duplicate_registration_action:duplicate_registration_action ->
  ?fraudster_similarity_threshold:score ->
  ?watchlist_ids:registration_config_watchlist_ids ->
  unit ->
  registration_config

val make_fraudster_registration_job :
  ?job_name:job_name ->
  ?job_id:job_id ->
  ?job_status:fraudster_registration_job_status ->
  ?domain_id:domain_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?registration_config:registration_config ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?created_at:timestamp ->
  ?ended_at:timestamp ->
  ?failure_details:failure_details ->
  ?job_progress:job_progress ->
  unit ->
  fraudster_registration_job

val make_describe_fraudster_registration_job_response :
  ?job:fraudster_registration_job -> unit -> describe_fraudster_registration_job_response

val make_describe_fraudster_registration_job_request :
  domain_id:domain_id -> job_id:job_id -> unit -> describe_fraudster_registration_job_request

val make_speaker :
  ?domain_id:domain_id ->
  ?customer_speaker_id:customer_speaker_id ->
  ?generated_speaker_id:generated_speaker_id ->
  ?status:speaker_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?last_accessed_at:timestamp ->
  unit ->
  speaker

val make_describe_speaker_response : ?speaker:speaker -> unit -> describe_speaker_response

val make_describe_speaker_request :
  domain_id:domain_id -> speaker_id:speaker_id -> unit -> describe_speaker_request

val make_enrollment_job_fraud_detection_config :
  ?fraud_detection_action:fraud_detection_action ->
  ?risk_threshold:score ->
  ?watchlist_ids:enrollment_job_fraud_detection_config_watchlist_ids ->
  unit ->
  enrollment_job_fraud_detection_config

val make_enrollment_config :
  ?existing_enrollment_action:existing_enrollment_action ->
  ?fraud_detection_config:enrollment_job_fraud_detection_config ->
  unit ->
  enrollment_config

val make_speaker_enrollment_job :
  ?job_name:job_name ->
  ?job_id:job_id ->
  ?job_status:speaker_enrollment_job_status ->
  ?domain_id:domain_id ->
  ?data_access_role_arn:iam_role_arn ->
  ?enrollment_config:enrollment_config ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?created_at:timestamp ->
  ?ended_at:timestamp ->
  ?failure_details:failure_details ->
  ?job_progress:job_progress ->
  unit ->
  speaker_enrollment_job

val make_describe_speaker_enrollment_job_response :
  ?job:speaker_enrollment_job -> unit -> describe_speaker_enrollment_job_response

val make_describe_speaker_enrollment_job_request :
  domain_id:domain_id -> job_id:job_id -> unit -> describe_speaker_enrollment_job_request

val make_describe_watchlist_response : ?watchlist:watchlist -> unit -> describe_watchlist_response

val make_describe_watchlist_request :
  domain_id:domain_id -> watchlist_id:watchlist_id -> unit -> describe_watchlist_request

val make_disassociate_fraudster_response :
  ?fraudster:fraudster -> unit -> disassociate_fraudster_response

val make_disassociate_fraudster_request :
  domain_id:domain_id ->
  watchlist_id:watchlist_id ->
  fraudster_id:fraudster_id ->
  unit ->
  disassociate_fraudster_request

val make_domain_summary :
  ?domain_id:domain_id ->
  ?arn:arn ->
  ?name:domain_name ->
  ?description:description ->
  ?domain_status:domain_status ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?server_side_encryption_update_details:server_side_encryption_update_details ->
  ?watchlist_details:watchlist_details ->
  unit ->
  domain_summary

val make_voice_spoofing_risk : risk_score:score -> unit -> voice_spoofing_risk

val make_known_fraudster_risk :
  ?generated_fraudster_id:generated_fraudster_id -> risk_score:score -> unit -> known_fraudster_risk

val make_fraud_risk_details :
  known_fraudster_risk:known_fraudster_risk ->
  voice_spoofing_risk:voice_spoofing_risk ->
  unit ->
  fraud_risk_details

val make_fraud_detection_configuration :
  ?risk_threshold:score -> ?watchlist_id:watchlist_id -> unit -> fraud_detection_configuration

val make_evaluate_session_response :
  ?domain_id:domain_id ->
  ?session_id:session_id ->
  ?session_name:session_name ->
  ?streaming_status:streaming_status ->
  ?authentication_result:authentication_result ->
  ?fraud_detection_result:fraud_detection_result ->
  unit ->
  evaluate_session_response

val make_evaluate_session_request :
  domain_id:domain_id -> session_name_or_id:session_name_or_id -> unit -> evaluate_session_request

val make_fraudster_registration_job_summary :
  ?job_name:job_name ->
  ?job_id:job_id ->
  ?job_status:fraudster_registration_job_status ->
  ?domain_id:domain_id ->
  ?created_at:timestamp ->
  ?ended_at:timestamp ->
  ?failure_details:failure_details ->
  ?job_progress:job_progress ->
  unit ->
  fraudster_registration_job_summary

val make_fraudster_summary :
  ?domain_id:domain_id ->
  ?generated_fraudster_id:generated_fraudster_id ->
  ?created_at:timestamp ->
  ?watchlist_ids:response_watchlist_ids ->
  unit ->
  fraudster_summary

val make_list_domains_response :
  ?domain_summaries:domain_summaries -> ?next_token:string_ -> unit -> list_domains_response

val make_list_domains_request :
  ?max_results:max_results_for_list_domain_fe ->
  ?next_token:next_token ->
  unit ->
  list_domains_request

val make_list_fraudster_registration_jobs_response :
  ?job_summaries:fraudster_registration_job_summaries ->
  ?next_token:string_ ->
  unit ->
  list_fraudster_registration_jobs_response

val make_list_fraudster_registration_jobs_request :
  ?job_status:fraudster_registration_job_status ->
  ?max_results:max_results_for_list ->
  ?next_token:next_token ->
  domain_id:domain_id ->
  unit ->
  list_fraudster_registration_jobs_request

val make_list_fraudsters_response :
  ?fraudster_summaries:fraudster_summaries ->
  ?next_token:string_ ->
  unit ->
  list_fraudsters_response

val make_list_fraudsters_request :
  ?watchlist_id:watchlist_id ->
  ?max_results:max_results_for_list ->
  ?next_token:next_token ->
  domain_id:domain_id ->
  unit ->
  list_fraudsters_request

val make_speaker_enrollment_job_summary :
  ?job_name:job_name ->
  ?job_id:job_id ->
  ?job_status:speaker_enrollment_job_status ->
  ?domain_id:domain_id ->
  ?created_at:timestamp ->
  ?ended_at:timestamp ->
  ?failure_details:failure_details ->
  ?job_progress:job_progress ->
  unit ->
  speaker_enrollment_job_summary

val make_list_speaker_enrollment_jobs_response :
  ?job_summaries:speaker_enrollment_job_summaries ->
  ?next_token:string_ ->
  unit ->
  list_speaker_enrollment_jobs_response

val make_list_speaker_enrollment_jobs_request :
  ?job_status:speaker_enrollment_job_status ->
  ?max_results:max_results_for_list ->
  ?next_token:next_token ->
  domain_id:domain_id ->
  unit ->
  list_speaker_enrollment_jobs_request

val make_speaker_summary :
  ?domain_id:domain_id ->
  ?customer_speaker_id:customer_speaker_id ->
  ?generated_speaker_id:generated_speaker_id ->
  ?status:speaker_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?last_accessed_at:timestamp ->
  unit ->
  speaker_summary

val make_list_speakers_response :
  ?speaker_summaries:speaker_summaries -> ?next_token:string_ -> unit -> list_speakers_response

val make_list_speakers_request :
  ?max_results:max_results_for_list ->
  ?next_token:next_token ->
  domain_id:domain_id ->
  unit ->
  list_speakers_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_watchlist_summary :
  ?domain_id:domain_id ->
  ?watchlist_id:watchlist_id ->
  ?name:watchlist_name ->
  ?description:watchlist_description ->
  ?default_watchlist:boolean_ ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  watchlist_summary

val make_list_watchlists_response :
  ?watchlist_summaries:watchlist_summaries ->
  ?next_token:string_ ->
  unit ->
  list_watchlists_response

val make_list_watchlists_request :
  ?max_results:max_results_for_list ->
  ?next_token:next_token ->
  domain_id:domain_id ->
  unit ->
  list_watchlists_request

val make_opt_out_speaker_response : ?speaker:speaker -> unit -> opt_out_speaker_response

val make_opt_out_speaker_request :
  domain_id:domain_id -> speaker_id:speaker_id -> unit -> opt_out_speaker_request

val make_start_fraudster_registration_job_response :
  ?job:fraudster_registration_job -> unit -> start_fraudster_registration_job_response

val make_start_fraudster_registration_job_request :
  ?client_token:client_token_string ->
  ?job_name:job_name ->
  ?registration_config:registration_config ->
  domain_id:domain_id ->
  data_access_role_arn:iam_role_arn ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  unit ->
  start_fraudster_registration_job_request

val make_start_speaker_enrollment_job_response :
  ?job:speaker_enrollment_job -> unit -> start_speaker_enrollment_job_response

val make_start_speaker_enrollment_job_request :
  ?client_token:client_token_string ->
  ?job_name:job_name ->
  ?enrollment_config:enrollment_config ->
  domain_id:domain_id ->
  data_access_role_arn:iam_role_arn ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  unit ->
  start_speaker_enrollment_job_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_arn:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_update_domain_response : ?domain:domain -> unit -> update_domain_response

val make_update_domain_request :
  ?description:description ->
  domain_id:domain_id ->
  name:domain_name ->
  server_side_encryption_configuration:server_side_encryption_configuration ->
  unit ->
  update_domain_request

val make_update_watchlist_response : ?watchlist:watchlist -> unit -> update_watchlist_response

val make_update_watchlist_request :
  ?name:watchlist_name ->
  ?description:watchlist_description ->
  domain_id:domain_id ->
  watchlist_id:watchlist_id ->
  unit ->
  update_watchlist_request
(** {1:operations Operations} *)

module UpdateWatchlist : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_watchlist_request ->
    ( update_watchlist_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_watchlist_request ->
    ( update_watchlist_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified watchlist. Every domain has a default watchlist which cannot be updated. \n"]

module UpdateDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_domain_request ->
    ( update_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_domain_request ->
    ( update_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified domain. This API has clobber behavior, and clears and replaces all \
   attributes. If an optional field, such as 'Description' is not provided, it is removed from the \
   domain.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes specified tags from a specified Amazon Connect Voice ID resource.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Tags a Voice ID resource with the provided list of tags.\n"]

module StartSpeakerEnrollmentJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_speaker_enrollment_job_request ->
    ( start_speaker_enrollment_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_speaker_enrollment_job_request ->
    ( start_speaker_enrollment_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a new batch speaker enrollment job using specified details.\n"]

module StartFraudsterRegistrationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_fraudster_registration_job_request ->
    ( start_fraudster_registration_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_fraudster_registration_job_request ->
    ( start_fraudster_registration_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a new batch fraudster registration job using provided details.\n"]

module OptOutSpeaker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    opt_out_speaker_request ->
    ( opt_out_speaker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    opt_out_speaker_request ->
    ( opt_out_speaker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Opts out a speaker from Voice ID. A speaker can be opted out regardless of whether or not they \
   already exist in Voice ID. If they don't yet exist, a new speaker is created in an opted out \
   state. If they already exist, their existing status is overridden and they are opted out. \
   Enrollment and evaluation authentication requests are rejected for opted out speakers, and \
   opted out speakers have no voice embeddings stored in Voice ID.\n"]

module ListWatchlists : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_watchlists_request ->
    ( list_watchlists_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_watchlists_request ->
    ( list_watchlists_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all watchlists in a specified domain.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags associated with a specified Voice ID resource.\n"]

module ListSpeakers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_speakers_request ->
    ( list_speakers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_speakers_request ->
    ( list_speakers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all speakers in a specified domain.\n"]

module ListSpeakerEnrollmentJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_speaker_enrollment_jobs_request ->
    ( list_speaker_enrollment_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_speaker_enrollment_jobs_request ->
    ( list_speaker_enrollment_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the speaker enrollment jobs in the domain with the specified [JobStatus]. If \
   [JobStatus] is not provided, this lists all jobs with all possible speaker enrollment job \
   statuses.\n"]

module ListFraudsters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_fraudsters_request ->
    ( list_fraudsters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fraudsters_request ->
    ( list_fraudsters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all fraudsters in a specified watchlist or domain.\n"]

module ListFraudsterRegistrationJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_fraudster_registration_jobs_request ->
    ( list_fraudster_registration_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fraudster_registration_jobs_request ->
    ( list_fraudster_registration_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the fraudster registration jobs in the domain with the given [JobStatus]. If \
   [JobStatus] is not provided, this lists all fraudster registration jobs in the given domain. \n"]

module ListDomains : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_domains_request ->
    ( list_domains_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_domains_request ->
    ( list_domains_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the domains in the Amazon Web Services account. \n"]

module EvaluateSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    evaluate_session_request ->
    ( evaluate_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    evaluate_session_request ->
    ( evaluate_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Evaluates a specified session based on audio data accumulated during a streaming Amazon Connect \
   Voice ID call.\n"]

module DisassociateFraudster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_fraudster_request ->
    ( disassociate_fraudster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_fraudster_request ->
    ( disassociate_fraudster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the fraudsters from the watchlist specified. Voice ID always expects a fraudster \
   to be a part of at least one watchlist. If you try to disassociate a fraudster from its only \
   watchlist, a [ValidationException] is thrown. \n"]

module DescribeWatchlist : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_watchlist_request ->
    ( describe_watchlist_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_watchlist_request ->
    ( describe_watchlist_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified watchlist.\n"]

module DescribeSpeakerEnrollmentJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_speaker_enrollment_job_request ->
    ( describe_speaker_enrollment_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_speaker_enrollment_job_request ->
    ( describe_speaker_enrollment_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified speaker enrollment job.\n"]

module DescribeSpeaker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_speaker_request ->
    ( describe_speaker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_speaker_request ->
    ( describe_speaker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified speaker.\n"]

module DescribeFraudsterRegistrationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fraudster_registration_job_request ->
    ( describe_fraudster_registration_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fraudster_registration_job_request ->
    ( describe_fraudster_registration_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified fraudster registration job.\n"]

module DescribeFraudster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fraudster_request ->
    ( describe_fraudster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fraudster_request ->
    ( describe_fraudster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified fraudster.\n"]

module DescribeDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_request ->
    ( describe_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_domain_request ->
    ( describe_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified domain.\n"]

module DeleteWatchlist : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_watchlist_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_watchlist_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified watchlist from Voice ID. This API throws an exception when there are \
   fraudsters in the watchlist that you are trying to delete. You must delete the fraudsters, and \
   then delete the watchlist. Every domain has a default watchlist which cannot be deleted. \n"]

module DeleteSpeaker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_speaker_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_speaker_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified speaker from Voice ID.\n"]

module DeleteFraudster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_fraudster_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_fraudster_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified fraudster from Voice ID. This action disassociates the fraudster from any \
   watchlists it is a part of.\n"]

module DeleteDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified domain from Voice ID.\n"]

module CreateWatchlist : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_watchlist_request ->
    ( create_watchlist_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_watchlist_request ->
    ( create_watchlist_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a watchlist that fraudsters can be a part of.\n"]

module CreateDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_domain_request ->
    ( create_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_domain_request ->
    ( create_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a domain that contains all Amazon Connect Voice ID data, such as speakers, fraudsters, \
   customer audio, and voiceprints. Every domain is created with a default watchlist that \
   fraudsters can be a part of.\n"]

(** {1:Serialization and Deserialization} *)
module AssociateFraudster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_fraudster_request ->
    ( associate_fraudster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_fraudster_request ->
    ( associate_fraudster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the fraudsters with the watchlist specified in the same domain. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
