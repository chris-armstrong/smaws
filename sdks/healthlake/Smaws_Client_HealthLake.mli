(** HealthLake client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_analytics_configuration : ?status:analytics_status -> unit -> analytics_configuration

val make_create_fhir_datastore_response :
  datastore_id:datastore_id ->
  datastore_arn:datastore_arn ->
  datastore_status:datastore_status ->
  datastore_endpoint:bounded_length_string ->
  unit ->
  create_fhir_datastore_response

val make_profile_configuration : ?default_profiles:default_profiles -> unit -> profile_configuration
val make_nlp_configuration : ?status:nlp_status -> unit -> nlp_configuration

val make_identity_provider_configuration :
  ?fine_grained_authorization_enabled:boolean_ ->
  ?metadata:configuration_metadata ->
  ?idp_lambda_arn:lambda_arn ->
  authorization_strategy:authorization_strategy ->
  unit ->
  identity_provider_configuration

val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_preload_data_config : preload_data_type:preload_data_type -> unit -> preload_data_config

val make_kms_encryption_config :
  ?kms_key_id:encryption_key_i_d -> cmk_type:cmk_type -> unit -> kms_encryption_config

val make_sse_configuration :
  kms_encryption_config:kms_encryption_config -> unit -> sse_configuration

val make_create_fhir_datastore_request :
  ?datastore_name:datastore_name ->
  ?sse_configuration:sse_configuration ->
  ?preload_data_config:preload_data_config ->
  ?client_token:client_token_string ->
  ?tags:tag_list ->
  ?identity_provider_configuration:identity_provider_configuration ->
  ?analytics_configuration:analytics_configuration ->
  ?nlp_configuration:nlp_configuration ->
  ?profile_configuration:profile_configuration ->
  datastore_type_version:fhir_version ->
  unit ->
  create_fhir_datastore_request

val make_datastore_filter :
  ?datastore_name:datastore_name ->
  ?datastore_status:datastore_status ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  unit ->
  datastore_filter

val make_error_cause :
  ?error_message:error_message -> ?error_category:error_category -> unit -> error_cause

val make_datastore_properties :
  ?datastore_name:datastore_name ->
  ?created_at:timestamp ->
  ?sse_configuration:sse_configuration ->
  ?preload_data_config:preload_data_config ->
  ?identity_provider_configuration:identity_provider_configuration ->
  ?error_cause:error_cause ->
  ?nlp_configuration:nlp_configuration ->
  ?analytics_configuration:analytics_configuration ->
  ?profile_configuration:profile_configuration ->
  datastore_id:datastore_id ->
  datastore_arn:datastore_arn ->
  datastore_status:datastore_status ->
  datastore_type_version:fhir_version ->
  datastore_endpoint:string_ ->
  unit ->
  datastore_properties

val make_delete_fhir_datastore_response :
  datastore_id:datastore_id ->
  datastore_arn:datastore_arn ->
  datastore_status:datastore_status ->
  datastore_endpoint:bounded_length_string ->
  unit ->
  delete_fhir_datastore_response

val make_delete_fhir_datastore_request :
  datastore_id:datastore_id -> unit -> delete_fhir_datastore_request

val make_describe_fhir_datastore_response :
  datastore_properties:datastore_properties -> unit -> describe_fhir_datastore_response

val make_describe_fhir_datastore_request :
  datastore_id:datastore_id -> unit -> describe_fhir_datastore_request

val make_s3_configuration :
  s3_uri:s3_uri -> kms_key_id:encryption_key_i_d -> unit -> s3_configuration

val make_export_job_properties :
  ?job_name:job_name ->
  ?end_time:timestamp ->
  ?data_access_role_arn:iam_role_arn ->
  ?message:message ->
  job_id:job_id ->
  job_status:job_status ->
  submit_time:timestamp ->
  datastore_id:datastore_id ->
  output_data_config:output_data_config ->
  unit ->
  export_job_properties

val make_describe_fhir_export_job_response :
  export_job_properties:export_job_properties -> unit -> describe_fhir_export_job_response

val make_describe_fhir_export_job_request :
  datastore_id:datastore_id -> job_id:job_id -> unit -> describe_fhir_export_job_request

val make_job_progress_report :
  ?total_number_of_scanned_files:generic_long ->
  ?total_size_of_scanned_files_in_m_b:generic_double ->
  ?total_number_of_imported_files:generic_long ->
  ?total_number_of_resources_scanned:generic_long ->
  ?total_number_of_resources_imported:generic_long ->
  ?total_number_of_resources_with_customer_error:generic_long ->
  ?total_number_of_files_read_with_customer_error:generic_long ->
  ?throughput:generic_double ->
  unit ->
  job_progress_report

val make_import_job_properties :
  ?job_name:job_name ->
  ?end_time:timestamp ->
  ?job_output_data_config:output_data_config ->
  ?job_progress_report:job_progress_report ->
  ?data_access_role_arn:iam_role_arn ->
  ?message:message ->
  ?validation_level:validation_level ->
  job_id:job_id ->
  job_status:job_status ->
  submit_time:timestamp ->
  datastore_id:datastore_id ->
  input_data_config:input_data_config ->
  unit ->
  import_job_properties

val make_describe_fhir_import_job_response :
  import_job_properties:import_job_properties -> unit -> describe_fhir_import_job_response

val make_describe_fhir_import_job_request :
  datastore_id:datastore_id -> job_id:job_id -> unit -> describe_fhir_import_job_request

val make_update_fhir_datastore_response :
  datastore_properties:datastore_properties -> unit -> update_fhir_datastore_response

val make_update_fhir_datastore_request :
  ?datastore_name:datastore_name ->
  ?nlp_configuration:nlp_configuration ->
  ?analytics_configuration:analytics_configuration ->
  ?profile_configuration:profile_configuration ->
  ?identity_provider_configuration:identity_provider_configuration ->
  datastore_id:datastore_id ->
  unit ->
  update_fhir_datastore_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_start_fhir_import_job_response :
  ?datastore_id:datastore_id ->
  job_id:job_id ->
  job_status:job_status ->
  unit ->
  start_fhir_import_job_response

val make_start_fhir_import_job_request :
  ?job_name:job_name ->
  ?client_token:client_token_string ->
  ?validation_level:validation_level ->
  input_data_config:input_data_config ->
  job_output_data_config:output_data_config ->
  datastore_id:datastore_id ->
  data_access_role_arn:iam_role_arn ->
  unit ->
  start_fhir_import_job_request

val make_start_fhir_export_job_response :
  ?datastore_id:datastore_id ->
  job_id:job_id ->
  job_status:job_status ->
  unit ->
  start_fhir_export_job_response

val make_start_fhir_export_job_request :
  ?job_name:job_name ->
  ?client_token:client_token_string ->
  output_data_config:output_data_config ->
  datastore_id:datastore_id ->
  data_access_role_arn:iam_role_arn ->
  unit ->
  start_fhir_export_job_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_fhir_import_jobs_response :
  ?next_token:next_token ->
  import_job_properties_list:import_job_properties_list ->
  unit ->
  list_fhir_import_jobs_response

val make_list_fhir_import_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submitted_before:timestamp ->
  ?submitted_after:timestamp ->
  datastore_id:datastore_id ->
  unit ->
  list_fhir_import_jobs_request

val make_list_fhir_export_jobs_response :
  ?next_token:next_token ->
  export_job_properties_list:export_job_properties_list ->
  unit ->
  list_fhir_export_jobs_response

val make_list_fhir_export_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submitted_before:timestamp ->
  ?submitted_after:timestamp ->
  datastore_id:datastore_id ->
  unit ->
  list_fhir_export_jobs_request

val make_list_fhir_datastores_response :
  ?next_token:next_token ->
  datastore_properties_list:datastore_properties_list ->
  unit ->
  list_fhir_datastores_response

val make_list_fhir_datastores_request :
  ?filter:datastore_filter ->
  ?next_token:next_token ->
  ?max_results:max_results_integer ->
  unit ->
  list_fhir_datastores_request
(** {1:operations Operations} *)

module ListFHIRDatastores : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_fhir_datastores_request ->
    ( list_fhir_datastores_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fhir_datastores_request ->
    ( list_fhir_datastores_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List all FHIR-enabled data stores in a user\226\128\153s account, regardless of data store \
   status.\n"]

module ListFHIRExportJobs : sig
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
    list_fhir_export_jobs_request ->
    ( list_fhir_export_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fhir_export_jobs_request ->
    ( list_fhir_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all FHIR export jobs associated with an account and their statuses.\n"]

module ListFHIRImportJobs : sig
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
    list_fhir_import_jobs_request ->
    ( list_fhir_import_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_fhir_import_jobs_request ->
    ( list_fhir_import_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all FHIR import jobs associated with an account and their statuses.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all existing tags associated with a data store.\n"]

module StartFHIRExportJob : sig
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
    start_fhir_export_job_request ->
    ( start_fhir_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_fhir_export_job_request ->
    ( start_fhir_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Start a FHIR export job.\n"]

module StartFHIRImportJob : sig
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
    start_fhir_import_job_request ->
    ( start_fhir_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_fhir_import_job_request ->
    ( start_fhir_import_job_response Smaws_Lib.Response.t,
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
  "Start importing bulk FHIR data into an ACTIVE data store. The import job imports FHIR data \
   found in the [InputDataConfig] object and stores processing results in the \
   [JobOutputDataConfig] object.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Add a user-specifed key and value tag to a data store.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Remove a user-specifed key and value tag from a data store.\n"]

module UpdateFHIRDatastore : sig
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
    update_fhir_datastore_request ->
    ( update_fhir_datastore_response,
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
    update_fhir_datastore_request ->
    ( update_fhir_datastore_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Update the properties of a FHIR-enabled data store.\n"]

module DescribeFHIRImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fhir_import_job_request ->
    ( describe_fhir_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fhir_import_job_request ->
    ( describe_fhir_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the import job properties to learn more about the job or job progress.\n"]

module DescribeFHIRExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fhir_export_job_request ->
    ( describe_fhir_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fhir_export_job_request ->
    ( describe_fhir_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get FHIR export job properties.\n"]

module DescribeFHIRDatastore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fhir_datastore_request ->
    ( describe_fhir_datastore_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fhir_datastore_request ->
    ( describe_fhir_datastore_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get properties for a FHIR-enabled data store.\n"]

module DeleteFHIRDatastore : sig
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
    delete_fhir_datastore_request ->
    ( delete_fhir_datastore_response,
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
    delete_fhir_datastore_request ->
    ( delete_fhir_datastore_response Smaws_Lib.Response.t,
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
[@@ocaml.doc "Delete a FHIR-enabled data store.\n"]

(** {1:Serialization and Deserialization} *)
module CreateFHIRDatastore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_fhir_datastore_request ->
    ( create_fhir_datastore_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_fhir_datastore_request ->
    ( create_fhir_datastore_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Create a FHIR-enabled data store.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
