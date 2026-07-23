open Types

let make_update_parallel_data_response ?name:(name_ : resource_name option)
    ?status:(status_ : parallel_data_status option)
    ?latest_update_attempt_status:(latest_update_attempt_status_ : parallel_data_status option)
    ?latest_update_attempt_at:(latest_update_attempt_at_ : timestamp option) () =
  ({
     name = name_;
     status = status_;
     latest_update_attempt_status = latest_update_attempt_status_;
     latest_update_attempt_at = latest_update_attempt_at_;
   }
    : update_parallel_data_response)

let make_parallel_data_config ?s3_uri:(s3_uri_ : s3_uri option)
    ?format:(format_ : parallel_data_format option) () =
  ({ s3_uri = s3_uri_; format = format_ } : parallel_data_config)

let make_update_parallel_data_request ?description:(description_ : description option)
    ~name:(name_ : resource_name)
    ~parallel_data_config:(parallel_data_config_ : parallel_data_config)
    ~client_token:(client_token_ : client_token_string) () =
  ({
     name = name_;
     description = description_;
     parallel_data_config = parallel_data_config_;
     client_token = client_token_;
   }
    : update_parallel_data_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_translation_settings ?formality:(formality_ : formality option)
    ?profanity:(profanity_ : profanity option) ?brevity:(brevity_ : brevity option) () =
  ({ formality = formality_; profanity = profanity_; brevity = brevity_ } : translation_settings)

let make_term ?source_text:(source_text_ : string_ option)
    ?target_text:(target_text_ : string_ option) () =
  ({ source_text = source_text_; target_text = target_text_ } : term)

let make_applied_terminology ?name:(name_ : resource_name option) ?terms:(terms_ : term_list option)
    () =
  ({ name = name_; terms = terms_ } : applied_terminology)

let make_translate_text_response
    ?applied_terminologies:(applied_terminologies_ : applied_terminology_list option)
    ?applied_settings:(applied_settings_ : translation_settings option)
    ~translated_text:(translated_text_ : translated_text_string)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~target_language_code:(target_language_code_ : language_code_string) () =
  ({
     translated_text = translated_text_;
     source_language_code = source_language_code_;
     target_language_code = target_language_code_;
     applied_terminologies = applied_terminologies_;
     applied_settings = applied_settings_;
   }
    : translate_text_response)

let make_translate_text_request ?terminology_names:(terminology_names_ : resource_name_list option)
    ?settings:(settings_ : translation_settings option) ~text:(text_ : bounded_length_string)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~target_language_code:(target_language_code_ : language_code_string) () =
  ({
     text = text_;
     terminology_names = terminology_names_;
     source_language_code = source_language_code_;
     target_language_code = target_language_code_;
     settings = settings_;
   }
    : translate_text_request)

let make_translated_document ~content:(content_ : translated_document_content) () =
  ({ content = content_ } : translated_document)

let make_translate_document_response
    ?applied_terminologies:(applied_terminologies_ : applied_terminology_list option)
    ?applied_settings:(applied_settings_ : translation_settings option)
    ~translated_document:(translated_document_ : translated_document)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~target_language_code:(target_language_code_ : language_code_string) () =
  ({
     translated_document = translated_document_;
     source_language_code = source_language_code_;
     target_language_code = target_language_code_;
     applied_terminologies = applied_terminologies_;
     applied_settings = applied_settings_;
   }
    : translate_document_response)

let make_document ~content:(content_ : document_content)
    ~content_type:(content_type_ : content_type) () =
  ({ content = content_; content_type = content_type_ } : document)

let make_translate_document_request
    ?terminology_names:(terminology_names_ : resource_name_list option)
    ?settings:(settings_ : translation_settings option) ~document:(document_ : document)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~target_language_code:(target_language_code_ : language_code_string) () =
  ({
     document = document_;
     terminology_names = terminology_names_;
     source_language_code = source_language_code_;
     target_language_code = target_language_code_;
     settings = settings_;
   }
    : translate_document_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tag_list)
    () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_stop_text_translation_job_response ?job_id:(job_id_ : job_id option)
    ?job_status:(job_status_ : job_status option) () =
  ({ job_id = job_id_; job_status = job_status_ } : stop_text_translation_job_response)

let make_stop_text_translation_job_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : stop_text_translation_job_request)

let make_start_text_translation_job_response ?job_id:(job_id_ : job_id option)
    ?job_status:(job_status_ : job_status option) () =
  ({ job_id = job_id_; job_status = job_status_ } : start_text_translation_job_response)

let make_encryption_key ~type_:(type__ : encryption_key_type) ~id:(id_ : encryption_key_i_d) () =
  ({ type_ = type__; id = id_ } : encryption_key)

let make_output_data_config ?encryption_key:(encryption_key_ : encryption_key option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_; encryption_key = encryption_key_ } : output_data_config)

let make_input_data_config ~s3_uri:(s3_uri_ : s3_uri) ~content_type:(content_type_ : content_type)
    () =
  ({ s3_uri = s3_uri_; content_type = content_type_ } : input_data_config)

let make_start_text_translation_job_request ?job_name:(job_name_ : job_name option)
    ?terminology_names:(terminology_names_ : resource_name_list option)
    ?parallel_data_names:(parallel_data_names_ : resource_name_list option)
    ?settings:(settings_ : translation_settings option)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~data_access_role_arn:(data_access_role_arn_ : iam_role_arn)
    ~source_language_code:(source_language_code_ : language_code_string)
    ~target_language_codes:(target_language_codes_ : target_language_code_string_list)
    ~client_token:(client_token_ : client_token_string) () =
  ({
     job_name = job_name_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     source_language_code = source_language_code_;
     target_language_codes = target_language_codes_;
     terminology_names = terminology_names_;
     parallel_data_names = parallel_data_names_;
     client_token = client_token_;
     settings = settings_;
   }
    : start_text_translation_job_request)

let make_job_details ?translated_documents_count:(translated_documents_count_ : integer option)
    ?documents_with_errors_count:(documents_with_errors_count_ : integer option)
    ?input_documents_count:(input_documents_count_ : integer option) () =
  ({
     translated_documents_count = translated_documents_count_;
     documents_with_errors_count = documents_with_errors_count_;
     input_documents_count = input_documents_count_;
   }
    : job_details)

let make_text_translation_job_properties ?job_id:(job_id_ : job_id option)
    ?job_name:(job_name_ : job_name option) ?job_status:(job_status_ : job_status option)
    ?job_details:(job_details_ : job_details option)
    ?source_language_code:(source_language_code_ : language_code_string option)
    ?target_language_codes:(target_language_codes_ : target_language_code_string_list option)
    ?terminology_names:(terminology_names_ : resource_name_list option)
    ?parallel_data_names:(parallel_data_names_ : resource_name_list option)
    ?message:(message_ : unbounded_length_string option)
    ?submitted_time:(submitted_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?data_access_role_arn:(data_access_role_arn_ : iam_role_arn option)
    ?settings:(settings_ : translation_settings option) () =
  ({
     job_id = job_id_;
     job_name = job_name_;
     job_status = job_status_;
     job_details = job_details_;
     source_language_code = source_language_code_;
     target_language_codes = target_language_codes_;
     terminology_names = terminology_names_;
     parallel_data_names = parallel_data_names_;
     message = message_;
     submitted_time = submitted_time_;
     end_time = end_time_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     data_access_role_arn = data_access_role_arn_;
     settings = settings_;
   }
    : text_translation_job_properties)

let make_list_text_translation_jobs_response
    ?text_translation_job_properties_list:
      (text_translation_job_properties_list_ : text_translation_job_properties_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     text_translation_job_properties_list = text_translation_job_properties_list_;
     next_token = next_token_;
   }
    : list_text_translation_jobs_response)

let make_text_translation_job_filter ?job_name:(job_name_ : job_name option)
    ?job_status:(job_status_ : job_status option)
    ?submitted_before_time:(submitted_before_time_ : timestamp option)
    ?submitted_after_time:(submitted_after_time_ : timestamp option) () =
  ({
     job_name = job_name_;
     job_status = job_status_;
     submitted_before_time = submitted_before_time_;
     submitted_after_time = submitted_after_time_;
   }
    : text_translation_job_filter)

let make_list_text_translation_jobs_request ?filter:(filter_ : text_translation_job_filter option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ filter = filter_; next_token = next_token_; max_results = max_results_ }
    : list_text_translation_jobs_request)

let make_terminology_properties ?name:(name_ : resource_name option)
    ?description:(description_ : description option) ?arn:(arn_ : terminology_arn option)
    ?source_language_code:(source_language_code_ : language_code_string option)
    ?target_language_codes:(target_language_codes_ : language_code_string_list option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?size_bytes:(size_bytes_ : integer option) ?term_count:(term_count_ : integer option)
    ?created_at:(created_at_ : timestamp option)
    ?last_updated_at:(last_updated_at_ : timestamp option)
    ?directionality:(directionality_ : directionality option)
    ?message:(message_ : unbounded_length_string option)
    ?skipped_term_count:(skipped_term_count_ : integer option)
    ?format:(format_ : terminology_data_format option) () =
  ({
     name = name_;
     description = description_;
     arn = arn_;
     source_language_code = source_language_code_;
     target_language_codes = target_language_codes_;
     encryption_key = encryption_key_;
     size_bytes = size_bytes_;
     term_count = term_count_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     directionality = directionality_;
     message = message_;
     skipped_term_count = skipped_term_count_;
     format = format_;
   }
    : terminology_properties)

let make_list_terminologies_response
    ?terminology_properties_list:(terminology_properties_list_ : terminology_properties_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ terminology_properties_list = terminology_properties_list_; next_token = next_token_ }
    : list_terminologies_response)

let make_list_terminologies_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_terminologies_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_parallel_data_properties ?name:(name_ : resource_name option)
    ?arn:(arn_ : parallel_data_arn option) ?description:(description_ : description option)
    ?status:(status_ : parallel_data_status option)
    ?source_language_code:(source_language_code_ : language_code_string option)
    ?target_language_codes:(target_language_codes_ : language_code_string_list option)
    ?parallel_data_config:(parallel_data_config_ : parallel_data_config option)
    ?message:(message_ : unbounded_length_string option)
    ?imported_data_size:(imported_data_size_ : long option)
    ?imported_record_count:(imported_record_count_ : long option)
    ?failed_record_count:(failed_record_count_ : long option)
    ?skipped_record_count:(skipped_record_count_ : long option)
    ?encryption_key:(encryption_key_ : encryption_key option)
    ?created_at:(created_at_ : timestamp option)
    ?last_updated_at:(last_updated_at_ : timestamp option)
    ?latest_update_attempt_status:(latest_update_attempt_status_ : parallel_data_status option)
    ?latest_update_attempt_at:(latest_update_attempt_at_ : timestamp option) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     status = status_;
     source_language_code = source_language_code_;
     target_language_codes = target_language_codes_;
     parallel_data_config = parallel_data_config_;
     message = message_;
     imported_data_size = imported_data_size_;
     imported_record_count = imported_record_count_;
     failed_record_count = failed_record_count_;
     skipped_record_count = skipped_record_count_;
     encryption_key = encryption_key_;
     created_at = created_at_;
     last_updated_at = last_updated_at_;
     latest_update_attempt_status = latest_update_attempt_status_;
     latest_update_attempt_at = latest_update_attempt_at_;
   }
    : parallel_data_properties)

let make_list_parallel_data_response
    ?parallel_data_properties_list:
      (parallel_data_properties_list_ : parallel_data_properties_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ parallel_data_properties_list = parallel_data_properties_list_; next_token = next_token_ }
    : list_parallel_data_response)

let make_list_parallel_data_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_parallel_data_request)

let make_language ~language_name:(language_name_ : localized_name_string)
    ~language_code:(language_code_ : language_code_string) () =
  ({ language_name = language_name_; language_code = language_code_ } : language)

let make_list_languages_response ?languages:(languages_ : languages_list option)
    ?display_language_code:(display_language_code_ : display_language_code option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     languages = languages_;
     display_language_code = display_language_code_;
     next_token = next_token_;
   }
    : list_languages_response)

let make_list_languages_request
    ?display_language_code:(display_language_code_ : display_language_code option)
    ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results_integer option) () =
  ({
     display_language_code = display_language_code_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_languages_request)

let make_terminology_data_location ~repository_type:(repository_type_ : string_)
    ~location:(location_ : string_) () =
  ({ repository_type = repository_type_; location = location_ } : terminology_data_location)

let make_import_terminology_response
    ?terminology_properties:(terminology_properties_ : terminology_properties option)
    ?auxiliary_data_location:(auxiliary_data_location_ : terminology_data_location option) () =
  ({
     terminology_properties = terminology_properties_;
     auxiliary_data_location = auxiliary_data_location_;
   }
    : import_terminology_response)

let make_terminology_data ?directionality:(directionality_ : directionality option)
    ~file:(file_ : terminology_file) ~format:(format_ : terminology_data_format) () =
  ({ file = file_; format = format_; directionality = directionality_ } : terminology_data)

let make_import_terminology_request ?description:(description_ : description option)
    ?encryption_key:(encryption_key_ : encryption_key option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : resource_name) ~merge_strategy:(merge_strategy_ : merge_strategy)
    ~terminology_data:(terminology_data_ : terminology_data) () =
  ({
     name = name_;
     merge_strategy = merge_strategy_;
     description = description_;
     terminology_data = terminology_data_;
     encryption_key = encryption_key_;
     tags = tags_;
   }
    : import_terminology_request)

let make_get_terminology_response
    ?terminology_properties:(terminology_properties_ : terminology_properties option)
    ?terminology_data_location:(terminology_data_location_ : terminology_data_location option)
    ?auxiliary_data_location:(auxiliary_data_location_ : terminology_data_location option) () =
  ({
     terminology_properties = terminology_properties_;
     terminology_data_location = terminology_data_location_;
     auxiliary_data_location = auxiliary_data_location_;
   }
    : get_terminology_response)

let make_get_terminology_request
    ?terminology_data_format:(terminology_data_format_ : terminology_data_format option)
    ~name:(name_ : resource_name) () =
  ({ name = name_; terminology_data_format = terminology_data_format_ } : get_terminology_request)

let make_parallel_data_data_location ~repository_type:(repository_type_ : string_)
    ~location:(location_ : string_) () =
  ({ repository_type = repository_type_; location = location_ } : parallel_data_data_location)

let make_get_parallel_data_response
    ?parallel_data_properties:(parallel_data_properties_ : parallel_data_properties option)
    ?data_location:(data_location_ : parallel_data_data_location option)
    ?auxiliary_data_location:(auxiliary_data_location_ : parallel_data_data_location option)
    ?latest_update_attempt_auxiliary_data_location:
      (latest_update_attempt_auxiliary_data_location_ : parallel_data_data_location option) () =
  ({
     parallel_data_properties = parallel_data_properties_;
     data_location = data_location_;
     auxiliary_data_location = auxiliary_data_location_;
     latest_update_attempt_auxiliary_data_location = latest_update_attempt_auxiliary_data_location_;
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

let make_delete_parallel_data_response ?name:(name_ : resource_name option)
    ?status:(status_ : parallel_data_status option) () =
  ({ name = name_; status = status_ } : delete_parallel_data_response)

let make_delete_parallel_data_request ~name:(name_ : resource_name) () =
  ({ name = name_ } : delete_parallel_data_request)

let make_create_parallel_data_response ?name:(name_ : resource_name option)
    ?status:(status_ : parallel_data_status option) () =
  ({ name = name_; status = status_ } : create_parallel_data_response)

let make_create_parallel_data_request ?description:(description_ : description option)
    ?encryption_key:(encryption_key_ : encryption_key option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : resource_name)
    ~parallel_data_config:(parallel_data_config_ : parallel_data_config)
    ~client_token:(client_token_ : client_token_string) () =
  ({
     name = name_;
     description = description_;
     parallel_data_config = parallel_data_config_;
     encryption_key = encryption_key_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_parallel_data_request)
