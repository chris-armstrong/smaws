(** Translate client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_parallel_data_response :
  ?latest_update_attempt_at:timestamp ->
  ?latest_update_attempt_status:parallel_data_status ->
  ?status:parallel_data_status ->
  ?name:resource_name ->
  unit ->
  update_parallel_data_response

val make_parallel_data_config :
  ?format:parallel_data_format -> ?s3_uri:s3_uri -> unit -> parallel_data_config

val make_update_parallel_data_request :
  ?description:description ->
  client_token:client_token_string ->
  parallel_data_config:parallel_data_config ->
  name:resource_name ->
  unit ->
  update_parallel_data_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:resource_arn -> unit -> untag_resource_request

val make_translation_settings :
  ?brevity:brevity -> ?profanity:profanity -> ?formality:formality -> unit -> translation_settings

val make_translated_document : content:translated_document_content -> unit -> translated_document
val make_term : ?target_text:string_ -> ?source_text:string_ -> unit -> term

val make_applied_terminology :
  ?terms:term_list -> ?name:resource_name -> unit -> applied_terminology

val make_translate_text_response :
  ?applied_settings:translation_settings ->
  ?applied_terminologies:applied_terminology_list ->
  target_language_code:language_code_string ->
  source_language_code:language_code_string ->
  translated_text:translated_text_string ->
  unit ->
  translate_text_response

val make_translate_text_request :
  ?settings:translation_settings ->
  ?terminology_names:resource_name_list ->
  target_language_code:language_code_string ->
  source_language_code:language_code_string ->
  text:bounded_length_string ->
  unit ->
  translate_text_request

val make_translate_document_response :
  ?applied_settings:translation_settings ->
  ?applied_terminologies:applied_terminology_list ->
  target_language_code:language_code_string ->
  source_language_code:language_code_string ->
  translated_document:translated_document ->
  unit ->
  translate_document_response

val make_document : content_type:content_type -> content:document_content -> unit -> document

val make_translate_document_request :
  ?settings:translation_settings ->
  ?terminology_names:resource_name_list ->
  target_language_code:language_code_string ->
  source_language_code:language_code_string ->
  document:document ->
  unit ->
  translate_document_request

val make_job_details :
  ?input_documents_count:integer ->
  ?documents_with_errors_count:integer ->
  ?translated_documents_count:integer ->
  unit ->
  job_details

val make_input_data_config : content_type:content_type -> s3_uri:s3_uri -> unit -> input_data_config

val make_encryption_key :
  id:encryption_key_i_d -> type_:encryption_key_type -> unit -> encryption_key

val make_output_data_config :
  ?encryption_key:encryption_key -> s3_uri:s3_uri -> unit -> output_data_config

val make_text_translation_job_properties :
  ?settings:translation_settings ->
  ?data_access_role_arn:iam_role_arn ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?end_time:timestamp ->
  ?submitted_time:timestamp ->
  ?message:unbounded_length_string ->
  ?parallel_data_names:resource_name_list ->
  ?terminology_names:resource_name_list ->
  ?target_language_codes:target_language_code_string_list ->
  ?source_language_code:language_code_string ->
  ?job_details:job_details ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  ?job_id:job_id ->
  unit ->
  text_translation_job_properties

val make_text_translation_job_filter :
  ?submitted_after_time:timestamp ->
  ?submitted_before_time:timestamp ->
  ?job_status:job_status ->
  ?job_name:job_name ->
  unit ->
  text_translation_job_filter

val make_terminology_properties :
  ?format:terminology_data_format ->
  ?skipped_term_count:integer ->
  ?message:unbounded_length_string ->
  ?directionality:directionality ->
  ?last_updated_at:timestamp ->
  ?created_at:timestamp ->
  ?term_count:integer ->
  ?size_bytes:integer ->
  ?encryption_key:encryption_key ->
  ?target_language_codes:language_code_string_list ->
  ?source_language_code:language_code_string ->
  ?arn:terminology_arn ->
  ?description:description ->
  ?name:resource_name ->
  unit ->
  terminology_properties

val make_terminology_data_location :
  location:string_ -> repository_type:string_ -> unit -> terminology_data_location

val make_terminology_data :
  ?directionality:directionality ->
  format:terminology_data_format ->
  file:terminology_file ->
  unit ->
  terminology_data

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_stop_text_translation_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> stop_text_translation_job_response

val make_stop_text_translation_job_request :
  job_id:job_id -> unit -> stop_text_translation_job_request

val make_start_text_translation_job_response :
  ?job_status:job_status -> ?job_id:job_id -> unit -> start_text_translation_job_response

val make_start_text_translation_job_request :
  ?settings:translation_settings ->
  ?parallel_data_names:resource_name_list ->
  ?terminology_names:resource_name_list ->
  ?job_name:job_name ->
  client_token:client_token_string ->
  target_language_codes:target_language_code_string_list ->
  source_language_code:language_code_string ->
  data_access_role_arn:iam_role_arn ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  unit ->
  start_text_translation_job_request

val make_parallel_data_properties :
  ?latest_update_attempt_at:timestamp ->
  ?latest_update_attempt_status:parallel_data_status ->
  ?last_updated_at:timestamp ->
  ?created_at:timestamp ->
  ?encryption_key:encryption_key ->
  ?skipped_record_count:long ->
  ?failed_record_count:long ->
  ?imported_record_count:long ->
  ?imported_data_size:long ->
  ?message:unbounded_length_string ->
  ?parallel_data_config:parallel_data_config ->
  ?target_language_codes:language_code_string_list ->
  ?source_language_code:language_code_string ->
  ?status:parallel_data_status ->
  ?description:description ->
  ?arn:parallel_data_arn ->
  ?name:resource_name ->
  unit ->
  parallel_data_properties

val make_parallel_data_data_location :
  location:string_ -> repository_type:string_ -> unit -> parallel_data_data_location

val make_list_text_translation_jobs_response :
  ?next_token:next_token ->
  ?text_translation_job_properties_list:text_translation_job_properties_list ->
  unit ->
  list_text_translation_jobs_response

val make_list_text_translation_jobs_request :
  ?max_results:max_results_integer ->
  ?next_token:next_token ->
  ?filter:text_translation_job_filter ->
  unit ->
  list_text_translation_jobs_request

val make_list_terminologies_response :
  ?next_token:next_token ->
  ?terminology_properties_list:terminology_properties_list ->
  unit ->
  list_terminologies_response

val make_list_terminologies_request :
  ?max_results:max_results_integer -> ?next_token:next_token -> unit -> list_terminologies_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_parallel_data_response :
  ?next_token:next_token ->
  ?parallel_data_properties_list:parallel_data_properties_list ->
  unit ->
  list_parallel_data_response

val make_list_parallel_data_request :
  ?max_results:max_results_integer -> ?next_token:next_token -> unit -> list_parallel_data_request

val make_language :
  language_code:language_code_string -> language_name:localized_name_string -> unit -> language

val make_list_languages_response :
  ?next_token:next_token ->
  ?display_language_code:display_language_code ->
  ?languages:languages_list ->
  unit ->
  list_languages_response

val make_list_languages_request :
  ?max_results:max_results_integer ->
  ?next_token:next_token ->
  ?display_language_code:display_language_code ->
  unit ->
  list_languages_request

val make_import_terminology_response :
  ?auxiliary_data_location:terminology_data_location ->
  ?terminology_properties:terminology_properties ->
  unit ->
  import_terminology_response

val make_import_terminology_request :
  ?tags:tag_list ->
  ?encryption_key:encryption_key ->
  ?description:description ->
  terminology_data:terminology_data ->
  merge_strategy:merge_strategy ->
  name:resource_name ->
  unit ->
  import_terminology_request

val make_get_terminology_response :
  ?auxiliary_data_location:terminology_data_location ->
  ?terminology_data_location:terminology_data_location ->
  ?terminology_properties:terminology_properties ->
  unit ->
  get_terminology_response

val make_get_terminology_request :
  ?terminology_data_format:terminology_data_format ->
  name:resource_name ->
  unit ->
  get_terminology_request

val make_get_parallel_data_response :
  ?latest_update_attempt_auxiliary_data_location:parallel_data_data_location ->
  ?auxiliary_data_location:parallel_data_data_location ->
  ?data_location:parallel_data_data_location ->
  ?parallel_data_properties:parallel_data_properties ->
  unit ->
  get_parallel_data_response

val make_get_parallel_data_request : name:resource_name -> unit -> get_parallel_data_request

val make_describe_text_translation_job_response :
  ?text_translation_job_properties:text_translation_job_properties ->
  unit ->
  describe_text_translation_job_response

val make_describe_text_translation_job_request :
  job_id:job_id -> unit -> describe_text_translation_job_request

val make_delete_terminology_request : name:resource_name -> unit -> delete_terminology_request

val make_delete_parallel_data_response :
  ?status:parallel_data_status -> ?name:resource_name -> unit -> delete_parallel_data_response

val make_delete_parallel_data_request : name:resource_name -> unit -> delete_parallel_data_request

val make_create_parallel_data_response :
  ?status:parallel_data_status -> ?name:resource_name -> unit -> create_parallel_data_response

val make_create_parallel_data_request :
  ?tags:tag_list ->
  ?encryption_key:encryption_key ->
  ?description:description ->
  client_token:client_token_string ->
  parallel_data_config:parallel_data_config ->
  name:resource_name ->
  unit ->
  create_parallel_data_request
(** {1:operations Operations} *)

module CreateParallelData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_parallel_data_request ->
    ( create_parallel_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_parallel_data_request ->
    ( create_parallel_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a parallel data resource in Amazon Translate by importing an input file from Amazon S3. \
   Parallel data files contain examples that show how you want segments of text to be translated. \
   By adding parallel data, you can influence the style, tone, and word choice in your translation \
   output.\n"]

module DeleteParallelData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_parallel_data_request ->
    ( delete_parallel_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_parallel_data_request ->
    ( delete_parallel_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a parallel data resource in Amazon Translate.\n"]

module DeleteTerminology : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_terminology_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_terminology_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A synchronous action that deletes a custom terminology.\n"]

module DescribeTextTranslationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_text_translation_job_request ->
    ( describe_text_translation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_text_translation_job_request ->
    ( describe_text_translation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties associated with an asynchronous batch translation job including name, ID, \
   status, source and target languages, input/output S3 buckets, and so on.\n"]

module GetParallelData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_parallel_data_request ->
    ( get_parallel_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_parallel_data_request ->
    ( get_parallel_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides information about a parallel data resource.\n"]

module GetTerminology : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_terminology_request ->
    ( get_terminology_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_terminology_request ->
    ( get_terminology_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a custom terminology.\n"]

module ImportTerminology : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_terminology_request ->
    ( import_terminology_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_terminology_request ->
    ( import_terminology_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a custom terminology, depending on whether one already exists for the given \
   terminology name. Importing a terminology with the same name as an existing one will merge the \
   terminologies based on the chosen merge strategy. The only supported merge strategy is \
   OVERWRITE, where the imported terminology overwrites the existing terminology of the same \
   name.\n\n\
  \ If you import a terminology that overwrites an existing one, the new terminology takes up to \
   10 minutes to fully propagate. After that, translations have access to the new terminology.\n\
  \ "]

module ListLanguages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedDisplayLanguageCodeException of unsupported_display_language_code_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_languages_request ->
    ( list_languages_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedDisplayLanguageCodeException of unsupported_display_language_code_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_languages_request ->
    ( list_languages_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedDisplayLanguageCodeException of unsupported_display_language_code_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of languages (RFC-5646 codes and names) that Amazon Translate supports.\n"]

module ListParallelData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_parallel_data_request ->
    ( list_parallel_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_parallel_data_request ->
    ( list_parallel_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides a list of your parallel data resources in Amazon Translate.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all tags associated with a given Amazon Translate resource. For more information, see \
   {{:https://docs.aws.amazon.com/translate/latest/dg/tagging.html} Tagging your resources}.\n"]

module ListTerminologies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_terminologies_request ->
    ( list_terminologies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_terminologies_request ->
    ( list_terminologies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides a list of custom terminologies associated with your account.\n"]

module ListTextTranslationJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidFilterException of invalid_filter_exception
    | `InvalidRequestException of invalid_request_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_text_translation_jobs_request ->
    ( list_text_translation_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_text_translation_jobs_request ->
    ( list_text_translation_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidFilterException of invalid_filter_exception
      | `InvalidRequestException of invalid_request_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of the batch translation jobs that you have submitted.\n"]

module StartTextTranslationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedLanguagePairException of unsupported_language_pair_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_text_translation_job_request ->
    ( start_text_translation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedLanguagePairException of unsupported_language_pair_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_text_translation_job_request ->
    ( start_text_translation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedLanguagePairException of unsupported_language_pair_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an asynchronous batch translation job. Use batch translation jobs to translate large \
   volumes of text across multiple documents at once. For batch translation, you can input \
   documents with different source languages (specify [auto] as the source language). You can \
   specify one or more target languages. Batch translation translates each input document into \
   each of the target languages. For more information, see \
   {{:https://docs.aws.amazon.com/translate/latest/dg/async.html}Asynchronous batch processing}.\n\n\
  \ Batch translation jobs can be described with the [DescribeTextTranslationJob] operation, \
   listed with the [ListTextTranslationJobs] operation, and stopped with the \
   [StopTextTranslationJob] operation.\n\
  \ "]

module StopTextTranslationJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_text_translation_job_request ->
    ( stop_text_translation_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_text_translation_job_request ->
    ( stop_text_translation_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an asynchronous batch translation job that is in progress.\n\n\
  \ If the job's state is [IN_PROGRESS], the job will be marked for termination and put into the \
   [STOP_REQUESTED] state. If the job completes before it can be stopped, it is put into the \
   [COMPLETED] state. Otherwise, the job is put into the [STOPPED] state.\n\
  \ \n\
  \  Asynchronous batch translation jobs are started with the [StartTextTranslationJob] operation. \
   You can use the [DescribeTextTranslationJob] or [ListTextTranslationJobs] operations to get a \
   batch translation job's [JobId].\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a specific tag with a resource. A tag is a key-value pair that adds as a metadata to \
   a resource. For more information, see \
   {{:https://docs.aws.amazon.com/translate/latest/dg/tagging.html} Tagging your resources}.\n"]

module TranslateDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedLanguagePairException of unsupported_language_pair_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    translate_document_request ->
    ( translate_document_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedLanguagePairException of unsupported_language_pair_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    translate_document_request ->
    ( translate_document_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedLanguagePairException of unsupported_language_pair_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Translates the input document from the source language to the target language. This synchronous \
   operation supports text, HTML, or Word documents as the input document. [TranslateDocument] \
   supports translations from English to any supported language, and from any supported language \
   to English. Therefore, specify either the source language code or the target language code as \
   \226\128\156en\226\128\157 (English). \n\n\
  \  If you set the [Formality] parameter, the request will fail if the target language does not \
   support formality. For a list of target languages that support formality, see \
   {{:https://docs.aws.amazon.com/translate/latest/dg/customizing-translations-formality.html}Setting \
   formality}. \n\
  \ "]

module TranslateText : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DetectedLanguageLowConfidenceException of detected_language_low_confidence_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedLanguagePairException of unsupported_language_pair_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    translate_text_request ->
    ( translate_text_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DetectedLanguageLowConfidenceException of detected_language_low_confidence_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedLanguagePairException of unsupported_language_pair_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    translate_text_request ->
    ( translate_text_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DetectedLanguageLowConfidenceException of detected_language_low_confidence_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `TextSizeLimitExceededException of text_size_limit_exceeded_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedLanguagePairException of unsupported_language_pair_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Translates input text from the source language to the target language. For a list of available \
   languages and language codes, see \
   {{:https://docs.aws.amazon.com/translate/latest/dg/what-is-languages.html}Supported languages}.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a specific tag associated with an Amazon Translate resource. For more information, see \
   {{:https://docs.aws.amazon.com/translate/latest/dg/tagging.html} Tagging your resources}.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateParallelData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_parallel_data_request ->
    ( update_parallel_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_parallel_data_request ->
    ( update_parallel_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a previously created parallel data resource by importing a new input file from Amazon S3.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
