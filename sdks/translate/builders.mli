open Types

val make_update_parallel_data_response :
  ?name:resource_name ->
  ?status:parallel_data_status ->
  ?latest_update_attempt_status:parallel_data_status ->
  ?latest_update_attempt_at:timestamp ->
  unit ->
  update_parallel_data_response

val make_parallel_data_config :
  ?s3_uri:s3_uri -> ?format:parallel_data_format -> unit -> parallel_data_config

val make_update_parallel_data_request :
  ?description:description ->
  name:resource_name ->
  parallel_data_config:parallel_data_config ->
  client_token:client_token_string ->
  unit ->
  update_parallel_data_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_translation_settings :
  ?formality:formality -> ?profanity:profanity -> ?brevity:brevity -> unit -> translation_settings

val make_term : ?source_text:string_ -> ?target_text:string_ -> unit -> term

val make_applied_terminology :
  ?name:resource_name -> ?terms:term_list -> unit -> applied_terminology

val make_translate_text_response :
  ?applied_terminologies:applied_terminology_list ->
  ?applied_settings:translation_settings ->
  translated_text:translated_text_string ->
  source_language_code:language_code_string ->
  target_language_code:language_code_string ->
  unit ->
  translate_text_response

val make_translate_text_request :
  ?terminology_names:resource_name_list ->
  ?settings:translation_settings ->
  text:bounded_length_string ->
  source_language_code:language_code_string ->
  target_language_code:language_code_string ->
  unit ->
  translate_text_request

val make_translated_document : content:translated_document_content -> unit -> translated_document

val make_translate_document_response :
  ?applied_terminologies:applied_terminology_list ->
  ?applied_settings:translation_settings ->
  translated_document:translated_document ->
  source_language_code:language_code_string ->
  target_language_code:language_code_string ->
  unit ->
  translate_document_response

val make_document : content:document_content -> content_type:content_type -> unit -> document

val make_translate_document_request :
  ?terminology_names:resource_name_list ->
  ?settings:translation_settings ->
  document:document ->
  source_language_code:language_code_string ->
  target_language_code:language_code_string ->
  unit ->
  translate_document_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_arn:resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_stop_text_translation_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> stop_text_translation_job_response

val make_stop_text_translation_job_request :
  job_id:job_id -> unit -> stop_text_translation_job_request

val make_start_text_translation_job_response :
  ?job_id:job_id -> ?job_status:job_status -> unit -> start_text_translation_job_response

val make_encryption_key :
  type_:encryption_key_type -> id:encryption_key_i_d -> unit -> encryption_key

val make_output_data_config :
  ?encryption_key:encryption_key -> s3_uri:s3_uri -> unit -> output_data_config

val make_input_data_config : s3_uri:s3_uri -> content_type:content_type -> unit -> input_data_config

val make_start_text_translation_job_request :
  ?job_name:job_name ->
  ?terminology_names:resource_name_list ->
  ?parallel_data_names:resource_name_list ->
  ?settings:translation_settings ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  data_access_role_arn:iam_role_arn ->
  source_language_code:language_code_string ->
  target_language_codes:target_language_code_string_list ->
  client_token:client_token_string ->
  unit ->
  start_text_translation_job_request

val make_job_details :
  ?translated_documents_count:integer ->
  ?documents_with_errors_count:integer ->
  ?input_documents_count:integer ->
  unit ->
  job_details

val make_text_translation_job_properties :
  ?job_id:job_id ->
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?job_details:job_details ->
  ?source_language_code:language_code_string ->
  ?target_language_codes:target_language_code_string_list ->
  ?terminology_names:resource_name_list ->
  ?parallel_data_names:resource_name_list ->
  ?message:unbounded_length_string ->
  ?submitted_time:timestamp ->
  ?end_time:timestamp ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?data_access_role_arn:iam_role_arn ->
  ?settings:translation_settings ->
  unit ->
  text_translation_job_properties

val make_list_text_translation_jobs_response :
  ?text_translation_job_properties_list:text_translation_job_properties_list ->
  ?next_token:next_token ->
  unit ->
  list_text_translation_jobs_response

val make_text_translation_job_filter :
  ?job_name:job_name ->
  ?job_status:job_status ->
  ?submitted_before_time:timestamp ->
  ?submitted_after_time:timestamp ->
  unit ->
  text_translation_job_filter

val make_list_text_translation_jobs_request :
  ?filter:text_translation_job_filter ->
  ?next_token:next_token ->
  ?max_results:max_results_integer ->
  unit ->
  list_text_translation_jobs_request

val make_terminology_properties :
  ?name:resource_name ->
  ?description:description ->
  ?arn:terminology_arn ->
  ?source_language_code:language_code_string ->
  ?target_language_codes:language_code_string_list ->
  ?encryption_key:encryption_key ->
  ?size_bytes:integer ->
  ?term_count:integer ->
  ?created_at:timestamp ->
  ?last_updated_at:timestamp ->
  ?directionality:directionality ->
  ?message:unbounded_length_string ->
  ?skipped_term_count:integer ->
  ?format:terminology_data_format ->
  unit ->
  terminology_properties

val make_list_terminologies_response :
  ?terminology_properties_list:terminology_properties_list ->
  ?next_token:next_token ->
  unit ->
  list_terminologies_response

val make_list_terminologies_request :
  ?next_token:next_token -> ?max_results:max_results_integer -> unit -> list_terminologies_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_parallel_data_properties :
  ?name:resource_name ->
  ?arn:parallel_data_arn ->
  ?description:description ->
  ?status:parallel_data_status ->
  ?source_language_code:language_code_string ->
  ?target_language_codes:language_code_string_list ->
  ?parallel_data_config:parallel_data_config ->
  ?message:unbounded_length_string ->
  ?imported_data_size:long ->
  ?imported_record_count:long ->
  ?failed_record_count:long ->
  ?skipped_record_count:long ->
  ?encryption_key:encryption_key ->
  ?created_at:timestamp ->
  ?last_updated_at:timestamp ->
  ?latest_update_attempt_status:parallel_data_status ->
  ?latest_update_attempt_at:timestamp ->
  unit ->
  parallel_data_properties

val make_list_parallel_data_response :
  ?parallel_data_properties_list:parallel_data_properties_list ->
  ?next_token:next_token ->
  unit ->
  list_parallel_data_response

val make_list_parallel_data_request :
  ?next_token:next_token -> ?max_results:max_results_integer -> unit -> list_parallel_data_request

val make_language :
  language_name:localized_name_string -> language_code:language_code_string -> unit -> language

val make_list_languages_response :
  ?languages:languages_list ->
  ?display_language_code:display_language_code ->
  ?next_token:next_token ->
  unit ->
  list_languages_response

val make_list_languages_request :
  ?display_language_code:display_language_code ->
  ?next_token:next_token ->
  ?max_results:max_results_integer ->
  unit ->
  list_languages_request

val make_terminology_data_location :
  repository_type:string_ -> location:string_ -> unit -> terminology_data_location

val make_import_terminology_response :
  ?terminology_properties:terminology_properties ->
  ?auxiliary_data_location:terminology_data_location ->
  unit ->
  import_terminology_response

val make_terminology_data :
  ?directionality:directionality ->
  file:terminology_file ->
  format:terminology_data_format ->
  unit ->
  terminology_data

val make_import_terminology_request :
  ?description:description ->
  ?encryption_key:encryption_key ->
  ?tags:tag_list ->
  name:resource_name ->
  merge_strategy:merge_strategy ->
  terminology_data:terminology_data ->
  unit ->
  import_terminology_request

val make_get_terminology_response :
  ?terminology_properties:terminology_properties ->
  ?terminology_data_location:terminology_data_location ->
  ?auxiliary_data_location:terminology_data_location ->
  unit ->
  get_terminology_response

val make_get_terminology_request :
  ?terminology_data_format:terminology_data_format ->
  name:resource_name ->
  unit ->
  get_terminology_request

val make_parallel_data_data_location :
  repository_type:string_ -> location:string_ -> unit -> parallel_data_data_location

val make_get_parallel_data_response :
  ?parallel_data_properties:parallel_data_properties ->
  ?data_location:parallel_data_data_location ->
  ?auxiliary_data_location:parallel_data_data_location ->
  ?latest_update_attempt_auxiliary_data_location:parallel_data_data_location ->
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
  ?name:resource_name -> ?status:parallel_data_status -> unit -> delete_parallel_data_response

val make_delete_parallel_data_request : name:resource_name -> unit -> delete_parallel_data_request

val make_create_parallel_data_response :
  ?name:resource_name -> ?status:parallel_data_status -> unit -> create_parallel_data_response

val make_create_parallel_data_request :
  ?description:description ->
  ?encryption_key:encryption_key ->
  ?tags:tag_list ->
  name:resource_name ->
  parallel_data_config:parallel_data_config ->
  client_token:client_token_string ->
  unit ->
  create_parallel_data_request
