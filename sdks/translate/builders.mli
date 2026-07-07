open Types

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
