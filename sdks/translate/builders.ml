open Types

let make_update_parallel_data_response
    ?latest_update_attempt_at:(latest_update_attempt_at_ : timestamp option)
    ?latest_update_attempt_status:(latest_update_attempt_status_ : parallel_data_status option)
    ?status:(status_ : parallel_data_status option) ?name:(name_ : resource_name option) () =
  ({
     latest_update_attempt_at = latest_update_attempt_at_;
     latest_update_attempt_status = latest_update_attempt_status_;
     status = status_;
     name = name_;
   }
    : update_parallel_data_response)

let make_parallel_data_config ?format:(format_ : parallel_data_format option)
    ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ format = format_; s3_uri = s3_uri_ } : parallel_data_config)

let make_update_parallel_data_request ?description:(description_ : description option)
    ~client_token:(client_token_ : client_token_string)
    ~parallel_data_config:(parallel_data_config_ : parallel_data_config)
    ~name:(name_ : resource_name) () =
  ({
     client_token = client_token_;
     parallel_data_config = parallel_data_config_;
     description = description_;
     name = name_;
   }
    : update_parallel_data_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_translation_settings ?brevity:(brevity_ : brevity option)
    ?profanity:(profanity_ : profanity option) ?formality:(formality_ : formality option) () =
  ({ brevity = brevity_; profanity = profanity_; formality = formality_ } : translation_settings)

let make_translated_document ~content:(content_ : translated_document_content) () =
  ({ content = content_ } : translated_document)

let make_term ?target_text:(target_text_ : string_ option)
    ?source_text:(source_text_ : string_ option) () =
  ({ target_text = target_text_; source_text = source_text_ } : term)

let make_applied_terminology ?terms:(terms_ : term_list option) ?name:(name_ : resource_name option)
    () =
  ({ terms = terms_; name = name_ } : applied_terminology)

let make_translate_text_response ?applied_settings:(applied_settings_ : translation_settings option)
    ?applied_terminologies:(applied_terminologies_ : applied_terminology_list option)
    ~target_language_code:(target_language_code_ : language_code_string)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~translated_text:(translated_text_ : translated_text_string) () =
  ({
     applied_settings = applied_settings_;
     applied_terminologies = applied_terminologies_;
     target_language_code = target_language_code_;
     source_language_code = source_language_code_;
     translated_text = translated_text_;
   }
    : translate_text_response)

let make_translate_text_request ?settings:(settings_ : translation_settings option)
    ?terminology_names:(terminology_names_ : resource_name_list option)
    ~target_language_code:(target_language_code_ : language_code_string)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~text:(text_ : bounded_length_string) () =
  ({
     settings = settings_;
     target_language_code = target_language_code_;
     source_language_code = source_language_code_;
     terminology_names = terminology_names_;
     text = text_;
   }
    : translate_text_request)

let make_translate_document_response
    ?applied_settings:(applied_settings_ : translation_settings option)
    ?applied_terminologies:(applied_terminologies_ : applied_terminology_list option)
    ~target_language_code:(target_language_code_ : language_code_string)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~translated_document:(translated_document_ : translated_document) () =
  ({
     applied_settings = applied_settings_;
     applied_terminologies = applied_terminologies_;
     target_language_code = target_language_code_;
     source_language_code = source_language_code_;
     translated_document = translated_document_;
   }
    : translate_document_response)

let make_document ~content_type:(content_type_ : content_type)
    ~content:(content_ : document_content) () =
  ({ content_type = content_type_; content = content_ } : document)

let make_translate_document_request ?settings:(settings_ : translation_settings option)
    ?terminology_names:(terminology_names_ : resource_name_list option)
    ~target_language_code:(target_language_code_ : language_code_string)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~document:(document_ : document) () =
  ({
     settings = settings_;
     target_language_code = target_language_code_;
     source_language_code = source_language_code_;
     terminology_names = terminology_names_;
     document = document_;
   }
    : translate_document_request)

let make_job_details ?input_documents_count:(input_documents_count_ : integer option)
    ?documents_with_errors_count:(documents_with_errors_count_ : integer option)
    ?translated_documents_count:(translated_documents_count_ : integer option) () =
  ({
     input_documents_count = input_documents_count_;
     documents_with_errors_count = documents_with_errors_count_;
     translated_documents_count = translated_documents_count_;
   }
    : job_details)

let make_input_data_config ~content_type:(content_type_ : content_type) ~s3_uri:(s3_uri_ : s3_uri)
    () =
  ({ content_type = content_type_; s3_uri = s3_uri_ } : input_data_config)

let make_encryption_key ~id:(id_ : encryption_key_i_d) ~type_:(type__ : encryption_key_type) () =
  ({ id = id_; type_ = type__ } : encryption_key)

let make_output_data_config ?encryption_key:(encryption_key_ : encryption_key option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ encryption_key = encryption_key_; s3_uri = s3_uri_ } : output_data_config)

let make_text_translation_job_properties ?settings:(settings_ : translation_settings option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?end_time:(end_time_ : timestamp option) ?submitted_time:(submitted_time_ : timestamp option)
    ?message:(message_ : unbounded_length_string option)
    ?parallel_data_names:(parallel_data_names_ : resource_name_list option)
    ?terminology_names:(terminology_names_ : resource_name_list option)
    ?target_language_codes:(target_language_codes_ : target_language_code_string_list option)
    ?source_language_code:(source_language_code_ : language_code_string option)
    ?job_details:(job_details_ : job_details option) ?job_status:(job_status_ : job_status option)
    ?job_name:(job_name_ : job_name option) ?job_id:(job_id_ : job_id option) () =
  ({
     settings = settings_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     end_time = end_time_;
     submitted_time = submitted_time_;
     message = message_;
     parallel_data_names = parallel_data_names_;
     terminology_names = terminology_names_;
     target_language_codes = target_language_codes_;
     source_language_code = source_language_code_;
     job_details = job_details_;
     job_status = job_status_;
     job_name = job_name_;
     job_id = job_id_;
   }
    : text_translation_job_properties)

let make_text_translation_job_filter
    ?submitted_after_time:(submitted_after_time_ : timestamp option)
    ?submitted_before_time:(submitted_before_time_ : timestamp option)
    ?job_status:(job_status_ : job_status option) ?job_name:(job_name_ : job_name option) () =
  ({
     submitted_after_time = submitted_after_time_;
     submitted_before_time = submitted_before_time_;
     job_status = job_status_;
     job_name = job_name_;
   }
    : text_translation_job_filter)

let make_terminology_properties ?format:(format_ : terminology_data_format option)
    ?skipped_term_count:(skipped_term_count_ : integer option)
    ?message:(message_ : unbounded_length_string option)
    ?directionality:(directionality_ : directionality option)
    ?last_updated_at:(last_updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?term_count:(term_count_ : integer option)
    ?size_bytes:(size_bytes_ : integer option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?target_language_codes:(target_language_codes_ : language_code_string_list option)
    ?source_language_code:(source_language_code_ : language_code_string option)
    ?arn:(arn_ : terminology_arn option) ?description:(description_ : description option)
    ?name:(name_ : resource_name option) () =
  ({
     format = format_;
     skipped_term_count = skipped_term_count_;
     message = message_;
     directionality = directionality_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     term_count = term_count_;
     size_bytes = size_bytes_;
     encryption_key = encryption_key_;
     target_language_codes = target_language_codes_;
     source_language_code = source_language_code_;
     arn = arn_;
     description = description_;
     name = name_;
   }
    : terminology_properties)

let make_terminology_data_location ~location:(location_ : string_)
    ~repository_type:(repository_type_ : string_) () =
  ({ location = location_; repository_type = repository_type_ } : terminology_data_location)

let make_terminology_data ?directionality:(directionality_ : directionality option)
    ~format:(format_ : terminology_data_format) ~file:(file_ : terminology_file) () =
  ({ directionality = directionality_; format = format_; file = file_ } : terminology_data)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : resource_arn)
    () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_stop_text_translation_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : stop_text_translation_job_response)

let make_stop_text_translation_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_text_translation_job_request)

let make_start_text_translation_job_response ?job_status:(job_status_ : job_status option)
    ?job_id:(job_id_ : job_id option) () =
  ({ job_status = job_status_; job_id = job_id_ } : start_text_translation_job_response)

let make_start_text_translation_job_request ?settings:(settings_ : translation_settings option)
    ?parallel_data_names:(parallel_data_names_ : resource_name_list option)
    ?terminology_names:(terminology_names_ : resource_name_list option)
    ?job_name:(job_name_ : job_name option) ~client_token:(client_token_ : client_token_string)
    ~target_language_codes:(target_language_codes_ : target_language_code_string_list)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~input_data_config:(input_data_config_ : input_data_config) () =
  ({
     settings = settings_;
     client_token = client_token_;
     parallel_data_names = parallel_data_names_;
     terminology_names = terminology_names_;
     target_language_codes = target_language_codes_;
     source_language_code = source_language_code_;
     data_access_role_arn = data_access_role_arn_;
     output_data_config = output_data_config_;
     input_data_config = input_data_config_;
     job_name = job_name_;
   }
    : start_text_translation_job_request)

let make_parallel_data_properties
    ?latest_update_attempt_at:(latest_update_attempt_at_ : timestamp option)
    ?latest_update_attempt_status:(latest_update_attempt_status_ : parallel_data_status option)
    ?last_updated_at:(last_updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?skipped_record_count:(skipped_record_count_ : long option)
    ?failed_record_count:(failed_record_count_ : long option)
    ?imported_record_count:(imported_record_count_ : long option)
    ?imported_data_size:(imported_data_size_ : long option)
    ?message:(message_ : unbounded_length_string option)
    ?parallel_data_config:(parallel_data_config_ : parallel_data_config option)
    ?target_language_codes:(target_language_codes_ : language_code_string_list option)
    ?source_language_code:(source_language_code_ : language_code_string option)
    ?status:(status_ : parallel_data_status option) ?description:(description_ : description option)
    ?arn:(arn_ : parallel_data_arn option) ?name:(name_ : resource_name option) () =
  ({
     latest_update_attempt_at = latest_update_attempt_at_;
     latest_update_attempt_status = latest_update_attempt_status_;
     last_updated_at = last_updated_at_;
     created_at = created_at_;
     encryption_key = encryption_key_;
     skipped_record_count = skipped_record_count_;
     failed_record_count = failed_record_count_;
     imported_record_count = imported_record_count_;
     imported_data_size = imported_data_size_;
     message = message_;
     parallel_data_config = parallel_data_config_;
     target_language_codes = target_language_codes_;
     source_language_code = source_language_code_;
     status = status_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : parallel_data_properties)

let make_parallel_data_data_location ~location:(location_ : string_)
    ~repository_type:(repository_type_ : string_) () =
  ({ location = location_; repository_type = repository_type_ } : parallel_data_data_location)

let make_list_text_translation_jobs_response ?next_token:(next_token_ : next_token option)
    ?text_translation_job_properties_list:
      (text_translation_job_properties_list_ : text_translation_job_properties_list option) () =
  ({
     next_token = next_token_;
     text_translation_job_properties_list = text_translation_job_properties_list_;
   }
    : list_text_translation_jobs_response)

let make_list_text_translation_jobs_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : next_token option)
    ?filter:(filter_ : text_translation_job_filter option) () =
  ({ max_results = max_results_; next_token = next_token_; filter = filter_ }
    : list_text_translation_jobs_request)

let make_list_terminologies_response ?next_token:(next_token_ : next_token option)
    ?terminology_properties_list:(terminology_properties_list_ : terminology_properties_list option)
    () =
  ({ next_token = next_token_; terminology_properties_list = terminology_properties_list_ }
    : list_terminologies_response)

let make_list_terminologies_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_terminologies_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_parallel_data_response ?next_token:(next_token_ : next_token option)
    ?parallel_data_properties_list:
      (parallel_data_properties_list_ : parallel_data_properties_list option) () =
  ({ next_token = next_token_; parallel_data_properties_list = parallel_data_properties_list_ }
    : list_parallel_data_response)

let make_list_parallel_data_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_parallel_data_request)

let make_language ~language_code:(language_code_ : language_code_string)
    ~language_name:(language_name_ : localized_name_string) () =
  ({ language_code = language_code_; language_name = language_name_ } : language)

let make_list_languages_response ?next_token:(next_token_ : next_token option)
    ?display_language_code:(display_language_code_ : display_language_code option)
    ?languages:(languages_ : languages_list option) () =
  ({
     next_token = next_token_;
     display_language_code = display_language_code_;
     languages = languages_;
   }
    : list_languages_response)

let make_list_languages_request ?max_results:(max_results_ : max_results_integer option)
    ?next_token:(next_token_ : next_token option)
    ?display_language_code:(display_language_code_ : display_language_code option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     display_language_code = display_language_code_;
   }
    : list_languages_request)

let make_import_terminology_response
    ?auxiliary_data_location:(auxiliary_data_location_ : terminology_data_location option)
    ?terminology_properties:(terminology_properties_ : terminology_properties option) () =
  ({
     auxiliary_data_location = auxiliary_data_location_;
     terminology_properties = terminology_properties_;
   }
    : import_terminology_response)

let make_import_terminology_request ?tags:(tags_ : tag_list option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?description:(description_ : description option)
    ~terminology_data:(terminology_data_ : terminology_data)
    ~merge_strategy:(merge_strategy_ : merge_strategy) ~name:(name_ : resource_name) () =
  ({
     tags = tags_;
     encryption_key = encryption_key_;
     terminology_data = terminology_data_;
     description = description_;
     merge_strategy = merge_strategy_;
     name = name_;
   }
    : import_terminology_request)

let make_get_terminology_response
    ?auxiliary_data_location:(auxiliary_data_location_ : terminology_data_location option)
    ?terminology_data_location:(terminology_data_location_ : terminology_data_location option)
    ?terminology_properties:(terminology_properties_ : terminology_properties option) () =
  ({
     auxiliary_data_location = auxiliary_data_location_;
     terminology_data_location = terminology_data_location_;
     terminology_properties = terminology_properties_;
   }
    : get_terminology_response)

let make_get_terminology_request
    ?terminology_data_format:(terminology_data_format_ : terminology_data_format option)
    ~name:(name_ : resource_name) () =
  ({ terminology_data_format = terminology_data_format_; name = name_ } : get_terminology_request)

let make_get_parallel_data_response
    ?latest_update_attempt_auxiliary_data_location:
      (latest_update_attempt_auxiliary_data_location_ : parallel_data_data_location option)
    ?auxiliary_data_location:(auxiliary_data_location_ : parallel_data_data_location option)
    ?data_location:(data_location_ : parallel_data_data_location option)
    ?parallel_data_properties:(parallel_data_properties_ : parallel_data_properties option) () =
  ({
     latest_update_attempt_auxiliary_data_location = latest_update_attempt_auxiliary_data_location_;
     auxiliary_data_location = auxiliary_data_location_;
     data_location = data_location_;
     parallel_data_properties = parallel_data_properties_;
   }
    : get_parallel_data_response)

let make_get_parallel_data_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : get_parallel_data_request)

let make_describe_text_translation_job_response
    ?text_translation_job_properties:
      (text_translation_job_properties_ : text_translation_job_properties option) () =
  ({ text_translation_job_properties = text_translation_job_properties_ }
    : describe_text_translation_job_response)

let make_describe_text_translation_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : describe_text_translation_job_request)

let make_delete_terminology_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_terminology_request)

let make_delete_parallel_data_response ?status:(status_ : parallel_data_status option)
    ?name:(name_ : resource_name option) () =
  ({ status = status_; name = name_ } : delete_parallel_data_response)

let make_delete_parallel_data_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_parallel_data_request)

let make_create_parallel_data_response ?status:(status_ : parallel_data_status option)
    ?name:(name_ : resource_name option) () =
  ({ status = status_; name = name_ } : create_parallel_data_response)

let make_create_parallel_data_request ?tags:(tags_ : tag_list option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?description:(description_ : description option)
    ~client_token:(client_token_ : client_token_string)
    ~parallel_data_config:(parallel_data_config_ : parallel_data_config)
    ~name:(name_ : resource_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     encryption_key = encryption_key_;
     parallel_data_config = parallel_data_config_;
     description = description_;
     name = name_;
   }
    : create_parallel_data_request)
