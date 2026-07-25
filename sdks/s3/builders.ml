open Types

let make_abac_status ?status:(status_ : bucket_abac_status option) () =
  ({ status = status_ } : abac_status)

let make_abort_incomplete_multipart_upload
    ?days_after_initiation:(days_after_initiation_ : days_after_initiation option) () =
  ({ days_after_initiation = days_after_initiation_ } : abort_incomplete_multipart_upload)

let make_abort_multipart_upload_output ?request_charged:(request_charged_ : request_charged option)
    () =
  ({ request_charged = request_charged_ } : abort_multipart_upload_output)

let make_abort_multipart_upload_request ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?if_match_initiated_time:(if_match_initiated_time_ : if_match_initiated_time option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key)
    ~upload_id:(upload_id_ : multipart_upload_id) () =
  ({
     bucket = bucket_;
     key = key_;
     upload_id = upload_id_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     if_match_initiated_time = if_match_initiated_time_;
   }
    : abort_multipart_upload_request)

let make_accelerate_configuration ?status:(status_ : bucket_accelerate_status option) () =
  ({ status = status_ } : accelerate_configuration)

let make_owner ?display_name:(display_name_ : display_name option) ?i_d:(i_d_ : i_d option) () =
  ({ display_name = display_name_; i_d = i_d_ } : owner)

let make_grantee ?display_name:(display_name_ : display_name option)
    ?email_address:(email_address_ : email_address option) ?i_d:(i_d_ : i_d option)
    ?ur_i:(ur_i_ : ur_i option) ~type_:(type__ : type_) () =
  ({
     display_name = display_name_;
     email_address = email_address_;
     i_d = i_d_;
     ur_i = ur_i_;
     type_ = type__;
   }
    : grantee)

let make_grant ?grantee:(grantee_ : grantee option) ?permission:(permission_ : permission option) ()
    =
  ({ grantee = grantee_; permission = permission_ } : grant)

let make_access_control_policy ?grants:(grants_ : grants option) ?owner:(owner_ : owner option) () =
  ({ grants = grants_; owner = owner_ } : access_control_policy)

let make_access_control_translation ~owner:(owner_ : owner_override) () =
  ({ owner = owner_ } : access_control_translation)

let make_write_get_object_response_request ?body:(body_ : streaming_blob option)
    ?status_code:(status_code_ : get_object_response_status_code option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option)
    ?accept_ranges:(accept_ranges_ : accept_ranges option)
    ?cache_control:(cache_control_ : cache_control option)
    ?content_disposition:(content_disposition_ : content_disposition option)
    ?content_encoding:(content_encoding_ : content_encoding option)
    ?content_language:(content_language_ : content_language option)
    ?content_length:(content_length_ : content_length option)
    ?content_range:(content_range_ : content_range option)
    ?content_type:(content_type_ : content_type option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?delete_marker:(delete_marker_ : delete_marker option) ?e_tag:(e_tag_ : e_tag option)
    ?expires:(expires_ : expires option) ?expiration:(expiration_ : expiration option)
    ?last_modified:(last_modified_ : last_modified option)
    ?missing_meta:(missing_meta_ : missing_meta option) ?metadata:(metadata_ : metadata option)
    ?object_lock_mode:(object_lock_mode_ : object_lock_mode option)
    ?object_lock_legal_hold_status:
      (object_lock_legal_hold_status_ : object_lock_legal_hold_status option)
    ?object_lock_retain_until_date:
      (object_lock_retain_until_date_ : object_lock_retain_until_date option)
    ?parts_count:(parts_count_ : parts_count option)
    ?replication_status:(replication_status_ : replication_status option)
    ?request_charged:(request_charged_ : request_charged option)
    ?restore:(restore_ : restore option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?storage_class:(storage_class_ : storage_class option)
    ?tag_count:(tag_count_ : tag_count option) ?version_id:(version_id_ : object_version_id option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ~request_route:(request_route_ : request_route) ~request_token:(request_token_ : request_token)
    () =
  ({
     request_route = request_route_;
     request_token = request_token_;
     body = body_;
     status_code = status_code_;
     error_code = error_code_;
     error_message = error_message_;
     accept_ranges = accept_ranges_;
     cache_control = cache_control_;
     content_disposition = content_disposition_;
     content_encoding = content_encoding_;
     content_language = content_language_;
     content_length = content_length_;
     content_range = content_range_;
     content_type = content_type_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     delete_marker = delete_marker_;
     e_tag = e_tag_;
     expires = expires_;
     expiration = expiration_;
     last_modified = last_modified_;
     missing_meta = missing_meta_;
     metadata = metadata_;
     object_lock_mode = object_lock_mode_;
     object_lock_legal_hold_status = object_lock_legal_hold_status_;
     object_lock_retain_until_date = object_lock_retain_until_date_;
     parts_count = parts_count_;
     replication_status = replication_status_;
     request_charged = request_charged_;
     restore = restore_;
     server_side_encryption = server_side_encryption_;
     sse_customer_algorithm = sse_customer_algorithm_;
     ssekms_key_id = ssekms_key_id_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     storage_class = storage_class_;
     tag_count = tag_count_;
     version_id = version_id_;
     bucket_key_enabled = bucket_key_enabled_;
   }
    : write_get_object_response_request)

let make_upload_part_copy_output
    ?copy_source_version_id:(copy_source_version_id_ : copy_source_version_id option)
    ?copy_part_result:(copy_part_result_ : copy_part_result option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     copy_source_version_id = copy_source_version_id_;
     copy_part_result = copy_part_result_;
     server_side_encryption = server_side_encryption_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     bucket_key_enabled = bucket_key_enabled_;
     request_charged = request_charged_;
   }
    : upload_part_copy_output)

let make_upload_part_copy_request
    ?copy_source_if_match:(copy_source_if_match_ : copy_source_if_match option)
    ?copy_source_if_modified_since:
      (copy_source_if_modified_since_ : copy_source_if_modified_since option)
    ?copy_source_if_none_match:(copy_source_if_none_match_ : copy_source_if_none_match option)
    ?copy_source_if_unmodified_since:
      (copy_source_if_unmodified_since_ : copy_source_if_unmodified_since option)
    ?copy_source_range:(copy_source_range_ : copy_source_range option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?copy_source_sse_customer_algorithm:
      (copy_source_sse_customer_algorithm_ : copy_source_sse_customer_algorithm option)
    ?copy_source_sse_customer_key:
      (copy_source_sse_customer_key_ : copy_source_sse_customer_key option)
    ?copy_source_sse_customer_key_m_d5:
      (copy_source_sse_customer_key_m_d5_ : copy_source_sse_customer_key_m_d5 option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?expected_source_bucket_owner:(expected_source_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~copy_source:(copy_source_ : copy_source)
    ~key:(key_ : object_key) ~part_number:(part_number_ : part_number)
    ~upload_id:(upload_id_ : multipart_upload_id) () =
  ({
     bucket = bucket_;
     copy_source = copy_source_;
     copy_source_if_match = copy_source_if_match_;
     copy_source_if_modified_since = copy_source_if_modified_since_;
     copy_source_if_none_match = copy_source_if_none_match_;
     copy_source_if_unmodified_since = copy_source_if_unmodified_since_;
     copy_source_range = copy_source_range_;
     key = key_;
     part_number = part_number_;
     upload_id = upload_id_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     copy_source_sse_customer_algorithm = copy_source_sse_customer_algorithm_;
     copy_source_sse_customer_key = copy_source_sse_customer_key_;
     copy_source_sse_customer_key_m_d5 = copy_source_sse_customer_key_m_d5_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     expected_source_bucket_owner = expected_source_bucket_owner_;
   }
    : upload_part_copy_request)

let make_upload_part_output
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?e_tag:(e_tag_ : e_tag option) ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     server_side_encryption = server_side_encryption_;
     e_tag = e_tag_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     bucket_key_enabled = bucket_key_enabled_;
     request_charged = request_charged_;
   }
    : upload_part_output)

let make_upload_part_request ?body:(body_ : streaming_blob option)
    ?content_length:(content_length_ : content_length option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key)
    ~part_number:(part_number_ : part_number) ~upload_id:(upload_id_ : multipart_upload_id) () =
  ({
     body = body_;
     bucket = bucket_;
     content_length = content_length_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     key = key_;
     part_number = part_number_;
     upload_id = upload_id_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : upload_part_request)

let make_update_object_encryption_response
    ?request_charged:(request_charged_ : request_charged option) () =
  ({ request_charged = request_charged_ } : update_object_encryption_response)

let make_ssekms_encryption ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ~kms_key_arn:(kms_key_arn_ : non_empty_kms_key_arn_string) () =
  ({ kms_key_arn = kms_key_arn_; bucket_key_enabled = bucket_key_enabled_ } : ssekms_encryption)

let make_update_object_encryption_request ?version_id:(version_id_ : object_version_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key)
    ~object_encryption:(object_encryption_ : object_encryption) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     object_encryption = object_encryption_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
   }
    : update_object_encryption_request)

let make_record_expiration ?days:(days_ : record_expiration_days option)
    ~expiration:(expiration_ : expiration_state) () =
  ({ expiration = expiration_; days = days_ } : record_expiration)

let make_journal_table_configuration_updates
    ~record_expiration:(record_expiration_ : record_expiration) () =
  ({ record_expiration = record_expiration_ } : journal_table_configuration_updates)

let make_update_bucket_metadata_journal_table_configuration_request
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~journal_table_configuration:
      (journal_table_configuration_ : journal_table_configuration_updates) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     journal_table_configuration = journal_table_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : update_bucket_metadata_journal_table_configuration_request)

let make_metadata_table_encryption_configuration ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ~sse_algorithm:(sse_algorithm_ : table_sse_algorithm) () =
  ({ sse_algorithm = sse_algorithm_; kms_key_arn = kms_key_arn_ }
    : metadata_table_encryption_configuration)

let make_inventory_table_configuration_updates
    ?encryption_configuration:
      (encryption_configuration_ : metadata_table_encryption_configuration option)
    ~configuration_state:(configuration_state_ : inventory_configuration_state) () =
  ({
     configuration_state = configuration_state_;
     encryption_configuration = encryption_configuration_;
   }
    : inventory_table_configuration_updates)

let make_update_bucket_metadata_inventory_table_configuration_request
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~inventory_table_configuration:
      (inventory_table_configuration_ : inventory_table_configuration_updates) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     inventory_table_configuration = inventory_table_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : update_bucket_metadata_inventory_table_configuration_request)

let make_annotation_table_configuration_updates
    ?encryption_configuration:
      (encryption_configuration_ : metadata_table_encryption_configuration option)
    ?role:(role_ : role option)
    ~configuration_state:(configuration_state_ : annotation_configuration_state) () =
  ({
     configuration_state = configuration_state_;
     encryption_configuration = encryption_configuration_;
     role = role_;
   }
    : annotation_table_configuration_updates)

let make_update_bucket_metadata_annotation_table_configuration_request
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~annotation_table_configuration:
      (annotation_table_configuration_ : annotation_table_configuration_updates) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     annotation_table_configuration = annotation_table_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : update_bucket_metadata_annotation_table_configuration_request)

let make_end_event () = (() : unit)
let make_continuation_event () = (() : unit)

let make_progress ?bytes_scanned:(bytes_scanned_ : bytes_scanned option)
    ?bytes_processed:(bytes_processed_ : bytes_processed option)
    ?bytes_returned:(bytes_returned_ : bytes_returned option) () =
  ({
     bytes_scanned = bytes_scanned_;
     bytes_processed = bytes_processed_;
     bytes_returned = bytes_returned_;
   }
    : progress)

let make_progress_event ?details:(details_ : progress option) () =
  ({ details = details_ } : progress_event)

let make_stats ?bytes_scanned:(bytes_scanned_ : bytes_scanned option)
    ?bytes_processed:(bytes_processed_ : bytes_processed option)
    ?bytes_returned:(bytes_returned_ : bytes_returned option) () =
  ({
     bytes_scanned = bytes_scanned_;
     bytes_processed = bytes_processed_;
     bytes_returned = bytes_returned_;
   }
    : stats)

let make_stats_event ?details:(details_ : stats option) () = ({ details = details_ } : stats_event)

let make_records_event ?payload:(payload_ : body option) () =
  ({ payload = payload_ } : records_event)

let make_select_object_content_output
    ?payload:(payload_ : select_object_content_event_stream option) () =
  ({ payload = payload_ } : select_object_content_output)

let make_scan_range ?start:(start_ : start option) ?end_:(end__ : end_ option) () =
  ({ start = start_; end_ = end__ } : scan_range)

let make_json_output ?record_delimiter:(record_delimiter_ : record_delimiter option) () =
  ({ record_delimiter = record_delimiter_ } : json_output)

let make_csv_output ?quote_fields:(quote_fields_ : quote_fields option)
    ?quote_escape_character:(quote_escape_character_ : quote_escape_character option)
    ?record_delimiter:(record_delimiter_ : record_delimiter option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?quote_character:(quote_character_ : quote_character option) () =
  ({
     quote_fields = quote_fields_;
     quote_escape_character = quote_escape_character_;
     record_delimiter = record_delimiter_;
     field_delimiter = field_delimiter_;
     quote_character = quote_character_;
   }
    : csv_output)

let make_output_serialization ?cs_v:(cs_v_ : csv_output option) ?jso_n:(jso_n_ : json_output option)
    () =
  ({ cs_v = cs_v_; jso_n = jso_n_ } : output_serialization)

let make_parquet_input () = (() : unit)
let make_json_input ?type_:(type__ : json_type option) () = ({ type_ = type__ } : json_input)

let make_csv_input ?file_header_info:(file_header_info_ : file_header_info option)
    ?comments:(comments_ : comments option)
    ?quote_escape_character:(quote_escape_character_ : quote_escape_character option)
    ?record_delimiter:(record_delimiter_ : record_delimiter option)
    ?field_delimiter:(field_delimiter_ : field_delimiter option)
    ?quote_character:(quote_character_ : quote_character option)
    ?allow_quoted_record_delimiter:
      (allow_quoted_record_delimiter_ : allow_quoted_record_delimiter option) () =
  ({
     file_header_info = file_header_info_;
     comments = comments_;
     quote_escape_character = quote_escape_character_;
     record_delimiter = record_delimiter_;
     field_delimiter = field_delimiter_;
     quote_character = quote_character_;
     allow_quoted_record_delimiter = allow_quoted_record_delimiter_;
   }
    : csv_input)

let make_input_serialization ?cs_v:(cs_v_ : csv_input option)
    ?compression_type:(compression_type_ : compression_type option)
    ?jso_n:(jso_n_ : json_input option) ?parquet:(parquet_ : parquet_input option) () =
  ({ cs_v = cs_v_; compression_type = compression_type_; jso_n = jso_n_; parquet = parquet_ }
    : input_serialization)

let make_request_progress ?enabled:(enabled_ : enable_request_progress option) () =
  ({ enabled = enabled_ } : request_progress)

let make_select_object_content_request
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?request_progress:(request_progress_ : request_progress option)
    ?scan_range:(scan_range_ : scan_range option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) ~expression:(expression_ : expression)
    ~expression_type:(expression_type_ : expression_type)
    ~input_serialization:(input_serialization_ : input_serialization)
    ~output_serialization:(output_serialization_ : output_serialization) () =
  ({
     bucket = bucket_;
     key = key_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     expression = expression_;
     expression_type = expression_type_;
     request_progress = request_progress_;
     input_serialization = input_serialization_;
     output_serialization = output_serialization_;
     scan_range = scan_range_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : select_object_content_request)

let make_restore_object_output ?request_charged:(request_charged_ : request_charged option)
    ?restore_output_path:(restore_output_path_ : restore_output_path option) () =
  ({ request_charged = request_charged_; restore_output_path = restore_output_path_ }
    : restore_object_output)

let make_metadata_entry ?name:(name_ : metadata_key option) ?value:(value_ : metadata_value option)
    () =
  ({ name = name_; value = value_ } : metadata_entry)

let make_tag ~key:(key_ : object_key) ~value:(value_ : value) () =
  ({ key = key_; value = value_ } : tag)

let make_tagging ~tag_set:(tag_set_ : tag_set) () = ({ tag_set = tag_set_ } : tagging)

let make_encryption ?kms_key_id:(kms_key_id_ : ssekms_key_id option)
    ?kms_context:(kms_context_ : kms_context option)
    ~encryption_type:(encryption_type_ : server_side_encryption) () =
  ({ encryption_type = encryption_type_; kms_key_id = kms_key_id_; kms_context = kms_context_ }
    : encryption)

let make_s3_location ?encryption:(encryption_ : encryption option)
    ?canned_ac_l:(canned_ac_l_ : object_canned_ac_l option)
    ?access_control_list:(access_control_list_ : grants option) ?tagging:(tagging_ : tagging option)
    ?user_metadata:(user_metadata_ : user_metadata option)
    ?storage_class:(storage_class_ : storage_class option) ~bucket_name:(bucket_name_ : bucket_name)
    ~prefix:(prefix_ : location_prefix) () =
  ({
     bucket_name = bucket_name_;
     prefix = prefix_;
     encryption = encryption_;
     canned_ac_l = canned_ac_l_;
     access_control_list = access_control_list_;
     tagging = tagging_;
     user_metadata = user_metadata_;
     storage_class = storage_class_;
   }
    : s3_location)

let make_output_location ?s3:(s3_ : s3_location option) () = ({ s3 = s3_ } : output_location)

let make_select_parameters ~input_serialization:(input_serialization_ : input_serialization)
    ~expression_type:(expression_type_ : expression_type) ~expression:(expression_ : expression)
    ~output_serialization:(output_serialization_ : output_serialization) () =
  ({
     input_serialization = input_serialization_;
     expression_type = expression_type_;
     expression = expression_;
     output_serialization = output_serialization_;
   }
    : select_parameters)

let make_glacier_job_parameters ~tier:(tier_ : tier) () =
  ({ tier = tier_ } : glacier_job_parameters)

let make_restore_request ?days:(days_ : days option)
    ?glacier_job_parameters:(glacier_job_parameters_ : glacier_job_parameters option)
    ?type_:(type__ : restore_request_type option) ?tier:(tier_ : tier option)
    ?description:(description_ : description option)
    ?select_parameters:(select_parameters_ : select_parameters option)
    ?output_location:(output_location_ : output_location option) () =
  ({
     days = days_;
     glacier_job_parameters = glacier_job_parameters_;
     type_ = type__;
     tier = tier_;
     description = description_;
     select_parameters = select_parameters_;
     output_location = output_location_;
   }
    : restore_request)

let make_restore_object_request ?version_id:(version_id_ : object_version_id option)
    ?restore_request:(restore_request_ : restore_request option)
    ?request_payer:(request_payer_ : request_payer option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     restore_request = restore_request_;
     request_payer = request_payer_;
     checksum_algorithm = checksum_algorithm_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : restore_object_request)

let make_rename_object_output () = (() : unit)

let make_rename_object_request ?destination_if_match:(destination_if_match_ : if_match option)
    ?destination_if_none_match:(destination_if_none_match_ : if_none_match option)
    ?destination_if_modified_since:(destination_if_modified_since_ : if_modified_since option)
    ?destination_if_unmodified_since:(destination_if_unmodified_since_ : if_unmodified_since option)
    ?source_if_match:(source_if_match_ : rename_source_if_match option)
    ?source_if_none_match:(source_if_none_match_ : rename_source_if_none_match option)
    ?source_if_modified_since:(source_if_modified_since_ : rename_source_if_modified_since option)
    ?source_if_unmodified_since:
      (source_if_unmodified_since_ : rename_source_if_unmodified_since option)
    ?client_token:(client_token_ : client_token option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) ~rename_source:(rename_source_ : rename_source) () =
  ({
     bucket = bucket_;
     key = key_;
     rename_source = rename_source_;
     destination_if_match = destination_if_match_;
     destination_if_none_match = destination_if_none_match_;
     destination_if_modified_since = destination_if_modified_since_;
     destination_if_unmodified_since = destination_if_unmodified_since_;
     source_if_match = source_if_match_;
     source_if_none_match = source_if_none_match_;
     source_if_modified_since = source_if_modified_since_;
     source_if_unmodified_since = source_if_unmodified_since_;
     client_token = client_token_;
   }
    : rename_object_request)

let make_public_access_block_configuration ?block_public_acls:(block_public_acls_ : setting option)
    ?ignore_public_acls:(ignore_public_acls_ : setting option)
    ?block_public_policy:(block_public_policy_ : setting option)
    ?restrict_public_buckets:(restrict_public_buckets_ : setting option) () =
  ({
     block_public_acls = block_public_acls_;
     ignore_public_acls = ignore_public_acls_;
     block_public_policy = block_public_policy_;
     restrict_public_buckets = restrict_public_buckets_;
   }
    : public_access_block_configuration)

let make_put_public_access_block_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~public_access_block_configuration:
      (public_access_block_configuration_ : public_access_block_configuration) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     public_access_block_configuration = public_access_block_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_public_access_block_request)

let make_put_object_tagging_output ?version_id:(version_id_ : object_version_id option) () =
  ({ version_id = version_id_ } : put_object_tagging_output)

let make_put_object_tagging_request ?version_id:(version_id_ : object_version_id option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?request_payer:(request_payer_ : request_payer option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) ~tagging:(tagging_ : tagging) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     tagging = tagging_;
     expected_bucket_owner = expected_bucket_owner_;
     request_payer = request_payer_;
   }
    : put_object_tagging_request)

let make_put_object_retention_output ?request_charged:(request_charged_ : request_charged option) ()
    =
  ({ request_charged = request_charged_ } : put_object_retention_output)

let make_object_lock_retention ?mode:(mode_ : object_lock_retention_mode option)
    ?retain_until_date:(retain_until_date_ : date option) () =
  ({ mode = mode_; retain_until_date = retain_until_date_ } : object_lock_retention)

let make_put_object_retention_request ?retention:(retention_ : object_lock_retention option)
    ?request_payer:(request_payer_ : request_payer option)
    ?version_id:(version_id_ : object_version_id option)
    ?bypass_governance_retention:(bypass_governance_retention_ : bypass_governance_retention option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     retention = retention_;
     request_payer = request_payer_;
     version_id = version_id_;
     bypass_governance_retention = bypass_governance_retention_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_object_retention_request)

let make_put_object_lock_configuration_output
    ?request_charged:(request_charged_ : request_charged option) () =
  ({ request_charged = request_charged_ } : put_object_lock_configuration_output)

let make_default_retention ?mode:(mode_ : object_lock_retention_mode option)
    ?days:(days_ : days option) ?years:(years_ : years option) () =
  ({ mode = mode_; days = days_; years = years_ } : default_retention)

let make_object_lock_rule ?default_retention:(default_retention_ : default_retention option) () =
  ({ default_retention = default_retention_ } : object_lock_rule)

let make_object_lock_configuration
    ?object_lock_enabled:(object_lock_enabled_ : object_lock_enabled option)
    ?rule:(rule_ : object_lock_rule option) () =
  ({ object_lock_enabled = object_lock_enabled_; rule = rule_ } : object_lock_configuration)

let make_put_object_lock_configuration_request
    ?object_lock_configuration:(object_lock_configuration_ : object_lock_configuration option)
    ?request_payer:(request_payer_ : request_payer option)
    ?token:(token_ : object_lock_token option) ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     object_lock_configuration = object_lock_configuration_;
     request_payer = request_payer_;
     token = token_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_object_lock_configuration_request)

let make_put_object_legal_hold_output ?request_charged:(request_charged_ : request_charged option)
    () =
  ({ request_charged = request_charged_ } : put_object_legal_hold_output)

let make_object_lock_legal_hold ?status:(status_ : object_lock_legal_hold_status option) () =
  ({ status = status_ } : object_lock_legal_hold)

let make_put_object_legal_hold_request ?legal_hold:(legal_hold_ : object_lock_legal_hold option)
    ?request_payer:(request_payer_ : request_payer option)
    ?version_id:(version_id_ : object_version_id option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     legal_hold = legal_hold_;
     request_payer = request_payer_;
     version_id = version_id_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_object_legal_hold_request)

let make_put_object_annotation_output ?key:(key_ : object_key option)
    ?annotation_name:(annotation_name_ : annotation_name option)
    ?object_version_id:(object_version_id_ : object_version_id option)
    ?e_tag:(e_tag_ : e_tag option) ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     key = key_;
     annotation_name = annotation_name_;
     object_version_id = object_version_id_;
     e_tag = e_tag_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
     server_side_encryption = server_side_encryption_;
     request_charged = request_charged_;
   }
    : put_object_annotation_output)

let make_put_object_annotation_request ?version_id:(version_id_ : object_version_id option)
    ?object_if_match:(object_if_match_ : object_if_match option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key)
    ~annotation_name:(annotation_name_ : annotation_name)
    ~annotation_payload:(annotation_payload_ : streaming_blob) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     annotation_name = annotation_name_;
     annotation_payload = annotation_payload_;
     object_if_match = object_if_match_;
     checksum_algorithm = checksum_algorithm_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     content_m_d5 = content_m_d5_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_object_annotation_request)

let make_put_object_acl_output ?request_charged:(request_charged_ : request_charged option) () =
  ({ request_charged = request_charged_ } : put_object_acl_output)

let make_put_object_acl_request ?ac_l:(ac_l_ : object_canned_ac_l option)
    ?access_control_policy:(access_control_policy_ : access_control_policy option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?grant_full_control:(grant_full_control_ : grant_full_control option)
    ?grant_read:(grant_read_ : grant_read option)
    ?grant_read_ac_p:(grant_read_ac_p_ : grant_read_ac_p option)
    ?grant_write:(grant_write_ : grant_write option)
    ?grant_write_ac_p:(grant_write_ac_p_ : grant_write_ac_p option)
    ?request_payer:(request_payer_ : request_payer option)
    ?version_id:(version_id_ : object_version_id option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     ac_l = ac_l_;
     access_control_policy = access_control_policy_;
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     grant_full_control = grant_full_control_;
     grant_read = grant_read_;
     grant_read_ac_p = grant_read_ac_p_;
     grant_write = grant_write_;
     grant_write_ac_p = grant_write_ac_p_;
     key = key_;
     request_payer = request_payer_;
     version_id = version_id_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_object_acl_request)

let make_put_object_output ?expiration:(expiration_ : expiration option)
    ?e_tag:(e_tag_ : e_tag option) ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?version_id:(version_id_ : object_version_id option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?size:(size_ : size option) ?request_charged:(request_charged_ : request_charged option) () =
  ({
     expiration = expiration_;
     e_tag = e_tag_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
     server_side_encryption = server_side_encryption_;
     version_id = version_id_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
     size = size_;
     request_charged = request_charged_;
   }
    : put_object_output)

let make_put_object_request ?ac_l:(ac_l_ : object_canned_ac_l option)
    ?body:(body_ : streaming_blob option) ?cache_control:(cache_control_ : cache_control option)
    ?content_disposition:(content_disposition_ : content_disposition option)
    ?content_encoding:(content_encoding_ : content_encoding option)
    ?content_language:(content_language_ : content_language option)
    ?content_length:(content_length_ : content_length option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?content_type:(content_type_ : content_type option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?expires:(expires_ : expires option) ?if_match:(if_match_ : if_match option)
    ?if_none_match:(if_none_match_ : if_none_match option)
    ?grant_full_control:(grant_full_control_ : grant_full_control option)
    ?grant_read:(grant_read_ : grant_read option)
    ?grant_read_ac_p:(grant_read_ac_p_ : grant_read_ac_p option)
    ?grant_write_ac_p:(grant_write_ac_p_ : grant_write_ac_p option)
    ?write_offset_bytes:(write_offset_bytes_ : write_offset_bytes option)
    ?metadata:(metadata_ : metadata option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?storage_class:(storage_class_ : storage_class option)
    ?website_redirect_location:(website_redirect_location_ : website_redirect_location option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?request_payer:(request_payer_ : request_payer option)
    ?tagging:(tagging_ : tagging_header option)
    ?object_lock_mode:(object_lock_mode_ : object_lock_mode option)
    ?object_lock_retain_until_date:
      (object_lock_retain_until_date_ : object_lock_retain_until_date option)
    ?object_lock_legal_hold_status:
      (object_lock_legal_hold_status_ : object_lock_legal_hold_status option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     ac_l = ac_l_;
     body = body_;
     bucket = bucket_;
     cache_control = cache_control_;
     content_disposition = content_disposition_;
     content_encoding = content_encoding_;
     content_language = content_language_;
     content_length = content_length_;
     content_m_d5 = content_m_d5_;
     content_type = content_type_;
     checksum_algorithm = checksum_algorithm_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     expires = expires_;
     if_match = if_match_;
     if_none_match = if_none_match_;
     grant_full_control = grant_full_control_;
     grant_read = grant_read_;
     grant_read_ac_p = grant_read_ac_p_;
     grant_write_ac_p = grant_write_ac_p_;
     key = key_;
     write_offset_bytes = write_offset_bytes_;
     metadata = metadata_;
     server_side_encryption = server_side_encryption_;
     storage_class = storage_class_;
     website_redirect_location = website_redirect_location_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
     request_payer = request_payer_;
     tagging = tagging_;
     object_lock_mode = object_lock_mode_;
     object_lock_retain_until_date = object_lock_retain_until_date_;
     object_lock_legal_hold_status = object_lock_legal_hold_status_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_object_request)

let make_redirect ?host_name:(host_name_ : host_name option)
    ?http_redirect_code:(http_redirect_code_ : http_redirect_code option)
    ?protocol:(protocol_ : protocol option)
    ?replace_key_prefix_with:(replace_key_prefix_with_ : replace_key_prefix_with option)
    ?replace_key_with:(replace_key_with_ : replace_key_with option) () =
  ({
     host_name = host_name_;
     http_redirect_code = http_redirect_code_;
     protocol = protocol_;
     replace_key_prefix_with = replace_key_prefix_with_;
     replace_key_with = replace_key_with_;
   }
    : redirect)

let make_condition
    ?http_error_code_returned_equals:
      (http_error_code_returned_equals_ : http_error_code_returned_equals option)
    ?key_prefix_equals:(key_prefix_equals_ : key_prefix_equals option) () =
  ({
     http_error_code_returned_equals = http_error_code_returned_equals_;
     key_prefix_equals = key_prefix_equals_;
   }
    : condition)

let make_routing_rule ?condition:(condition_ : condition option) ~redirect:(redirect_ : redirect) ()
    =
  ({ condition = condition_; redirect = redirect_ } : routing_rule)

let make_redirect_all_requests_to ?protocol:(protocol_ : protocol option)
    ~host_name:(host_name_ : host_name) () =
  ({ host_name = host_name_; protocol = protocol_ } : redirect_all_requests_to)

let make_index_document ~suffix:(suffix_ : suffix) () = ({ suffix = suffix_ } : index_document)
let make_error_document ~key:(key_ : object_key) () = ({ key = key_ } : error_document)

let make_website_configuration ?error_document:(error_document_ : error_document option)
    ?index_document:(index_document_ : index_document option)
    ?redirect_all_requests_to:(redirect_all_requests_to_ : redirect_all_requests_to option)
    ?routing_rules:(routing_rules_ : routing_rules option) () =
  ({
     error_document = error_document_;
     index_document = index_document_;
     redirect_all_requests_to = redirect_all_requests_to_;
     routing_rules = routing_rules_;
   }
    : website_configuration)

let make_put_bucket_website_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~website_configuration:(website_configuration_ : website_configuration) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     website_configuration = website_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_website_request)

let make_versioning_configuration ?mfa_delete:(mfa_delete_ : mfa_delete option)
    ?status:(status_ : bucket_versioning_status option) () =
  ({ mfa_delete = mfa_delete_; status = status_ } : versioning_configuration)

let make_put_bucket_versioning_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?mf_a:(mf_a_ : mf_a option) ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~versioning_configuration:(versioning_configuration_ : versioning_configuration) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     mf_a = mf_a_;
     versioning_configuration = versioning_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_versioning_request)

let make_put_bucket_tagging_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~tagging:(tagging_ : tagging) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     tagging = tagging_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_tagging_request)

let make_request_payment_configuration ~payer:(payer_ : payer) () =
  ({ payer = payer_ } : request_payment_configuration)

let make_put_bucket_request_payment_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~request_payment_configuration:(request_payment_configuration_ : request_payment_configuration)
    () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     request_payment_configuration = request_payment_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_request_payment_request)

let make_delete_marker_replication ?status:(status_ : delete_marker_replication_status option) () =
  ({ status = status_ } : delete_marker_replication)

let make_replication_time_value ?minutes:(minutes_ : minutes option) () =
  ({ minutes = minutes_ } : replication_time_value)

let make_metrics ?event_threshold:(event_threshold_ : replication_time_value option)
    ~status:(status_ : metrics_status) () =
  ({ status = status_; event_threshold = event_threshold_ } : metrics)

let make_replication_time ~status:(status_ : replication_time_status)
    ~time:(time_ : replication_time_value) () =
  ({ status = status_; time = time_ } : replication_time)

let make_encryption_configuration
    ?replica_kms_key_i_d:(replica_kms_key_i_d_ : replica_kms_key_i_d option) () =
  ({ replica_kms_key_i_d = replica_kms_key_i_d_ } : encryption_configuration)

let make_destination ?account:(account_ : account_id option)
    ?storage_class:(storage_class_ : storage_class option)
    ?access_control_translation:(access_control_translation_ : access_control_translation option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?replication_time:(replication_time_ : replication_time option)
    ?metrics:(metrics_ : metrics option) ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     account = account_;
     storage_class = storage_class_;
     access_control_translation = access_control_translation_;
     encryption_configuration = encryption_configuration_;
     replication_time = replication_time_;
     metrics = metrics_;
   }
    : destination)

let make_existing_object_replication ~status:(status_ : existing_object_replication_status) () =
  ({ status = status_ } : existing_object_replication)

let make_replica_modifications ~status:(status_ : replica_modifications_status) () =
  ({ status = status_ } : replica_modifications)

let make_sse_kms_encrypted_objects ~status:(status_ : sse_kms_encrypted_objects_status) () =
  ({ status = status_ } : sse_kms_encrypted_objects)

let make_source_selection_criteria
    ?sse_kms_encrypted_objects:(sse_kms_encrypted_objects_ : sse_kms_encrypted_objects option)
    ?replica_modifications:(replica_modifications_ : replica_modifications option) () =
  ({
     sse_kms_encrypted_objects = sse_kms_encrypted_objects_;
     replica_modifications = replica_modifications_;
   }
    : source_selection_criteria)

let make_replication_rule_and_operator ?prefix:(prefix_ : prefix option)
    ?tags:(tags_ : tag_set option) () =
  ({ prefix = prefix_; tags = tags_ } : replication_rule_and_operator)

let make_replication_rule_filter ?prefix:(prefix_ : prefix option) ?tag:(tag_ : tag option)
    ?and_:(and__ : replication_rule_and_operator option) () =
  ({ prefix = prefix_; tag = tag_; and_ = and__ } : replication_rule_filter)

let make_replication_rule ?i_d:(i_d_ : i_d option) ?priority:(priority_ : priority option)
    ?prefix:(prefix_ : prefix option) ?filter:(filter_ : replication_rule_filter option)
    ?source_selection_criteria:(source_selection_criteria_ : source_selection_criteria option)
    ?existing_object_replication:(existing_object_replication_ : existing_object_replication option)
    ?delete_marker_replication:(delete_marker_replication_ : delete_marker_replication option)
    ~status:(status_ : replication_rule_status) ~destination:(destination_ : destination) () =
  ({
     i_d = i_d_;
     priority = priority_;
     prefix = prefix_;
     filter = filter_;
     status = status_;
     source_selection_criteria = source_selection_criteria_;
     existing_object_replication = existing_object_replication_;
     destination = destination_;
     delete_marker_replication = delete_marker_replication_;
   }
    : replication_rule)

let make_replication_configuration ~role:(role_ : role) ~rules:(rules_ : replication_rules) () =
  ({ role = role_; rules = rules_ } : replication_configuration)

let make_put_bucket_replication_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?token:(token_ : object_lock_token option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~replication_configuration:(replication_configuration_ : replication_configuration) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     replication_configuration = replication_configuration_;
     token = token_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_replication_request)

let make_put_bucket_policy_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?confirm_remove_self_bucket_access:
      (confirm_remove_self_bucket_access_ : confirm_remove_self_bucket_access option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~policy:(policy_ : policy) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     confirm_remove_self_bucket_access = confirm_remove_self_bucket_access_;
     policy = policy_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_policy_request)

let make_ownership_controls_rule ~object_ownership:(object_ownership_ : object_ownership) () =
  ({ object_ownership = object_ownership_ } : ownership_controls_rule)

let make_ownership_controls ~rules:(rules_ : ownership_controls_rules) () =
  ({ rules = rules_ } : ownership_controls)

let make_put_bucket_ownership_controls_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ~bucket:(bucket_ : bucket_name) ~ownership_controls:(ownership_controls_ : ownership_controls)
    () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     expected_bucket_owner = expected_bucket_owner_;
     ownership_controls = ownership_controls_;
     checksum_algorithm = checksum_algorithm_;
   }
    : put_bucket_ownership_controls_request)

let make_event_bridge_configuration () = (() : unit)

let make_filter_rule ?name:(name_ : filter_rule_name option)
    ?value:(value_ : filter_rule_value option) () =
  ({ name = name_; value = value_ } : filter_rule)

let make_s3_key_filter ?filter_rules:(filter_rules_ : filter_rule_list option) () =
  ({ filter_rules = filter_rules_ } : s3_key_filter)

let make_notification_configuration_filter ?key:(key_ : s3_key_filter option) () =
  ({ key = key_ } : notification_configuration_filter)

let make_lambda_function_configuration ?id:(id_ : notification_id option)
    ?filter:(filter_ : notification_configuration_filter option)
    ~lambda_function_arn:(lambda_function_arn_ : lambda_function_arn) ~events:(events_ : event_list)
    () =
  ({ id = id_; lambda_function_arn = lambda_function_arn_; events = events_; filter = filter_ }
    : lambda_function_configuration)

let make_queue_configuration ?id:(id_ : notification_id option)
    ?filter:(filter_ : notification_configuration_filter option) ~queue_arn:(queue_arn_ : queue_arn)
    ~events:(events_ : event_list) () =
  ({ id = id_; queue_arn = queue_arn_; events = events_; filter = filter_ } : queue_configuration)

let make_topic_configuration ?id:(id_ : notification_id option)
    ?filter:(filter_ : notification_configuration_filter option) ~topic_arn:(topic_arn_ : topic_arn)
    ~events:(events_ : event_list) () =
  ({ id = id_; topic_arn = topic_arn_; events = events_; filter = filter_ } : topic_configuration)

let make_notification_configuration
    ?topic_configurations:(topic_configurations_ : topic_configuration_list option)
    ?queue_configurations:(queue_configurations_ : queue_configuration_list option)
    ?lambda_function_configurations:
      (lambda_function_configurations_ : lambda_function_configuration_list option)
    ?event_bridge_configuration:(event_bridge_configuration_ : event_bridge_configuration option) ()
    =
  ({
     topic_configurations = topic_configurations_;
     queue_configurations = queue_configurations_;
     lambda_function_configurations = lambda_function_configurations_;
     event_bridge_configuration = event_bridge_configuration_;
   }
    : notification_configuration)

let make_put_bucket_notification_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?skip_destination_validation:(skip_destination_validation_ : skip_validation option)
    ~bucket:(bucket_ : bucket_name)
    ~notification_configuration:(notification_configuration_ : notification_configuration) () =
  ({
     bucket = bucket_;
     notification_configuration = notification_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
     skip_destination_validation = skip_destination_validation_;
   }
    : put_bucket_notification_configuration_request)

let make_metrics_and_operator ?prefix:(prefix_ : prefix option) ?tags:(tags_ : tag_set option)
    ?access_point_arn:(access_point_arn_ : access_point_arn option) () =
  ({ prefix = prefix_; tags = tags_; access_point_arn = access_point_arn_ } : metrics_and_operator)

let make_metrics_configuration ?filter:(filter_ : metrics_filter option) ~id:(id_ : metrics_id) () =
  ({ id = id_; filter = filter_ } : metrics_configuration)

let make_put_bucket_metrics_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : metrics_id)
    ~metrics_configuration:(metrics_configuration_ : metrics_configuration) () =
  ({
     bucket = bucket_;
     id = id_;
     metrics_configuration = metrics_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_metrics_configuration_request)

let make_partitioned_prefix
    ?partition_date_source:(partition_date_source_ : partition_date_source option) () =
  ({ partition_date_source = partition_date_source_ } : partitioned_prefix)

let make_simple_prefix () = (() : unit)

let make_target_object_key_format ?simple_prefix:(simple_prefix_ : simple_prefix option)
    ?partitioned_prefix:(partitioned_prefix_ : partitioned_prefix option) () =
  ({ simple_prefix = simple_prefix_; partitioned_prefix = partitioned_prefix_ }
    : target_object_key_format)

let make_target_grant ?grantee:(grantee_ : grantee option)
    ?permission:(permission_ : bucket_logs_permission option) () =
  ({ grantee = grantee_; permission = permission_ } : target_grant)

let make_logging_enabled ?target_grants:(target_grants_ : target_grants option)
    ?target_object_key_format:(target_object_key_format_ : target_object_key_format option)
    ~target_bucket:(target_bucket_ : target_bucket) ~target_prefix:(target_prefix_ : target_prefix)
    () =
  ({
     target_bucket = target_bucket_;
     target_grants = target_grants_;
     target_prefix = target_prefix_;
     target_object_key_format = target_object_key_format_;
   }
    : logging_enabled)

let make_bucket_logging_status ?logging_enabled:(logging_enabled_ : logging_enabled option) () =
  ({ logging_enabled = logging_enabled_ } : bucket_logging_status)

let make_put_bucket_logging_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~bucket_logging_status:(bucket_logging_status_ : bucket_logging_status) () =
  ({
     bucket = bucket_;
     bucket_logging_status = bucket_logging_status_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_logging_request)

let make_put_bucket_lifecycle_configuration_output
    ?transition_default_minimum_object_size:
      (transition_default_minimum_object_size_ : transition_default_minimum_object_size option) () =
  ({ transition_default_minimum_object_size = transition_default_minimum_object_size_ }
    : put_bucket_lifecycle_configuration_output)

let make_noncurrent_version_expiration ?noncurrent_days:(noncurrent_days_ : days option)
    ?newer_noncurrent_versions:(newer_noncurrent_versions_ : version_count option) () =
  ({ noncurrent_days = noncurrent_days_; newer_noncurrent_versions = newer_noncurrent_versions_ }
    : noncurrent_version_expiration)

let make_noncurrent_version_transition ?noncurrent_days:(noncurrent_days_ : days option)
    ?storage_class:(storage_class_ : transition_storage_class option)
    ?newer_noncurrent_versions:(newer_noncurrent_versions_ : version_count option) () =
  ({
     noncurrent_days = noncurrent_days_;
     storage_class = storage_class_;
     newer_noncurrent_versions = newer_noncurrent_versions_;
   }
    : noncurrent_version_transition)

let make_transition ?date:(date_ : date option) ?days:(days_ : days option)
    ?storage_class:(storage_class_ : transition_storage_class option) () =
  ({ date = date_; days = days_; storage_class = storage_class_ } : transition)

let make_lifecycle_rule_and_operator ?prefix:(prefix_ : prefix option)
    ?tags:(tags_ : tag_set option)
    ?object_size_greater_than:(object_size_greater_than_ : object_size_greater_than_bytes option)
    ?object_size_less_than:(object_size_less_than_ : object_size_less_than_bytes option) () =
  ({
     prefix = prefix_;
     tags = tags_;
     object_size_greater_than = object_size_greater_than_;
     object_size_less_than = object_size_less_than_;
   }
    : lifecycle_rule_and_operator)

let make_lifecycle_rule_filter ?prefix:(prefix_ : prefix option) ?tag:(tag_ : tag option)
    ?object_size_greater_than:(object_size_greater_than_ : object_size_greater_than_bytes option)
    ?object_size_less_than:(object_size_less_than_ : object_size_less_than_bytes option)
    ?and_:(and__ : lifecycle_rule_and_operator option) () =
  ({
     prefix = prefix_;
     tag = tag_;
     object_size_greater_than = object_size_greater_than_;
     object_size_less_than = object_size_less_than_;
     and_ = and__;
   }
    : lifecycle_rule_filter)

let make_lifecycle_expiration ?date:(date_ : date option) ?days:(days_ : days option)
    ?expired_object_delete_marker:
      (expired_object_delete_marker_ : expired_object_delete_marker option) () =
  ({ date = date_; days = days_; expired_object_delete_marker = expired_object_delete_marker_ }
    : lifecycle_expiration)

let make_lifecycle_rule ?expiration:(expiration_ : lifecycle_expiration option)
    ?i_d:(i_d_ : i_d option) ?prefix:(prefix_ : prefix option)
    ?filter:(filter_ : lifecycle_rule_filter option)
    ?transitions:(transitions_ : transition_list option)
    ?noncurrent_version_transitions:
      (noncurrent_version_transitions_ : noncurrent_version_transition_list option)
    ?noncurrent_version_expiration:
      (noncurrent_version_expiration_ : noncurrent_version_expiration option)
    ?abort_incomplete_multipart_upload:
      (abort_incomplete_multipart_upload_ : abort_incomplete_multipart_upload option)
    ~status:(status_ : expiration_status) () =
  ({
     expiration = expiration_;
     i_d = i_d_;
     prefix = prefix_;
     filter = filter_;
     status = status_;
     transitions = transitions_;
     noncurrent_version_transitions = noncurrent_version_transitions_;
     noncurrent_version_expiration = noncurrent_version_expiration_;
     abort_incomplete_multipart_upload = abort_incomplete_multipart_upload_;
   }
    : lifecycle_rule)

let make_bucket_lifecycle_configuration ~rules:(rules_ : lifecycle_rules) () =
  ({ rules = rules_ } : bucket_lifecycle_configuration)

let make_put_bucket_lifecycle_configuration_request
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?lifecycle_configuration:(lifecycle_configuration_ : bucket_lifecycle_configuration option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?transition_default_minimum_object_size:
      (transition_default_minimum_object_size_ : transition_default_minimum_object_size option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     checksum_algorithm = checksum_algorithm_;
     lifecycle_configuration = lifecycle_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
     transition_default_minimum_object_size = transition_default_minimum_object_size_;
   }
    : put_bucket_lifecycle_configuration_request)

let make_inventory_schedule ~frequency:(frequency_ : inventory_frequency) () =
  ({ frequency = frequency_ } : inventory_schedule)

let make_inventory_filter ~prefix:(prefix_ : prefix) () = ({ prefix = prefix_ } : inventory_filter)
let make_ssekm_s ~key_id:(key_id_ : ssekms_key_id) () = ({ key_id = key_id_ } : ssekm_s)
let make_sse_s3 () = (() : unit)

let make_inventory_encryption ?sse_s3:(sse_s3_ : sse_s3 option) ?ssekm_s:(ssekm_s_ : ssekm_s option)
    () =
  ({ sse_s3 = sse_s3_; ssekm_s = ssekm_s_ } : inventory_encryption)

let make_inventory_s3_bucket_destination ?account_id:(account_id_ : account_id option)
    ?prefix:(prefix_ : prefix option) ?encryption:(encryption_ : inventory_encryption option)
    ~bucket:(bucket_ : bucket_name) ~format:(format_ : inventory_format) () =
  ({
     account_id = account_id_;
     bucket = bucket_;
     format = format_;
     prefix = prefix_;
     encryption = encryption_;
   }
    : inventory_s3_bucket_destination)

let make_inventory_destination
    ~s3_bucket_destination:(s3_bucket_destination_ : inventory_s3_bucket_destination) () =
  ({ s3_bucket_destination = s3_bucket_destination_ } : inventory_destination)

let make_inventory_configuration ?filter:(filter_ : inventory_filter option)
    ?optional_fields:(optional_fields_ : inventory_optional_fields option)
    ~destination:(destination_ : inventory_destination) ~is_enabled:(is_enabled_ : is_enabled)
    ~id:(id_ : inventory_id)
    ~included_object_versions:(included_object_versions_ : inventory_included_object_versions)
    ~schedule:(schedule_ : inventory_schedule) () =
  ({
     destination = destination_;
     is_enabled = is_enabled_;
     filter = filter_;
     id = id_;
     included_object_versions = included_object_versions_;
     optional_fields = optional_fields_;
     schedule = schedule_;
   }
    : inventory_configuration)

let make_put_bucket_inventory_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : inventory_id)
    ~inventory_configuration:(inventory_configuration_ : inventory_configuration) () =
  ({
     bucket = bucket_;
     id = id_;
     inventory_configuration = inventory_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_inventory_configuration_request)

let make_tiering ~days:(days_ : intelligent_tiering_days)
    ~access_tier:(access_tier_ : intelligent_tiering_access_tier) () =
  ({ days = days_; access_tier = access_tier_ } : tiering)

let make_intelligent_tiering_and_operator ?prefix:(prefix_ : prefix option)
    ?tags:(tags_ : tag_set option) () =
  ({ prefix = prefix_; tags = tags_ } : intelligent_tiering_and_operator)

let make_intelligent_tiering_filter ?prefix:(prefix_ : prefix option) ?tag:(tag_ : tag option)
    ?and_:(and__ : intelligent_tiering_and_operator option) () =
  ({ prefix = prefix_; tag = tag_; and_ = and__ } : intelligent_tiering_filter)

let make_intelligent_tiering_configuration ?filter:(filter_ : intelligent_tiering_filter option)
    ~id:(id_ : intelligent_tiering_id) ~status:(status_ : intelligent_tiering_status)
    ~tierings:(tierings_ : tiering_list) () =
  ({ id = id_; filter = filter_; status = status_; tierings = tierings_ }
    : intelligent_tiering_configuration)

let make_put_bucket_intelligent_tiering_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : intelligent_tiering_id)
    ~intelligent_tiering_configuration:
      (intelligent_tiering_configuration_ : intelligent_tiering_configuration) () =
  ({
     bucket = bucket_;
     id = id_;
     expected_bucket_owner = expected_bucket_owner_;
     intelligent_tiering_configuration = intelligent_tiering_configuration_;
   }
    : put_bucket_intelligent_tiering_configuration_request)

let make_blocked_encryption_types ?encryption_type:(encryption_type_ : encryption_type_list option)
    () =
  ({ encryption_type = encryption_type_ } : blocked_encryption_types)

let make_server_side_encryption_by_default
    ?kms_master_key_i_d:(kms_master_key_i_d_ : ssekms_key_id option)
    ~sse_algorithm:(sse_algorithm_ : server_side_encryption) () =
  ({ sse_algorithm = sse_algorithm_; kms_master_key_i_d = kms_master_key_i_d_ }
    : server_side_encryption_by_default)

let make_server_side_encryption_rule
    ?apply_server_side_encryption_by_default:
      (apply_server_side_encryption_by_default_ : server_side_encryption_by_default option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?blocked_encryption_types:(blocked_encryption_types_ : blocked_encryption_types option) () =
  ({
     apply_server_side_encryption_by_default = apply_server_side_encryption_by_default_;
     bucket_key_enabled = bucket_key_enabled_;
     blocked_encryption_types = blocked_encryption_types_;
   }
    : server_side_encryption_rule)

let make_server_side_encryption_configuration ~rules:(rules_ : server_side_encryption_rules) () =
  ({ rules = rules_ } : server_side_encryption_configuration)

let make_put_bucket_encryption_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     server_side_encryption_configuration = server_side_encryption_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_encryption_request)

let make_cors_rule ?i_d:(i_d_ : i_d option)
    ?allowed_headers:(allowed_headers_ : allowed_headers option)
    ?expose_headers:(expose_headers_ : expose_headers option)
    ?max_age_seconds:(max_age_seconds_ : max_age_seconds option)
    ~allowed_methods:(allowed_methods_ : allowed_methods)
    ~allowed_origins:(allowed_origins_ : allowed_origins) () =
  ({
     i_d = i_d_;
     allowed_headers = allowed_headers_;
     allowed_methods = allowed_methods_;
     allowed_origins = allowed_origins_;
     expose_headers = expose_headers_;
     max_age_seconds = max_age_seconds_;
   }
    : cors_rule)

let make_cors_configuration ~cors_rules:(cors_rules_ : cors_rules) () =
  ({ cors_rules = cors_rules_ } : cors_configuration)

let make_put_bucket_cors_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~cors_configuration:(cors_configuration_ : cors_configuration)
    () =
  ({
     bucket = bucket_;
     cors_configuration = cors_configuration_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_cors_request)

let make_analytics_s3_bucket_destination ?bucket_account_id:(bucket_account_id_ : account_id option)
    ?prefix:(prefix_ : prefix option) ~format:(format_ : analytics_s3_export_file_format)
    ~bucket:(bucket_ : bucket_name) () =
  ({ format = format_; bucket_account_id = bucket_account_id_; bucket = bucket_; prefix = prefix_ }
    : analytics_s3_bucket_destination)

let make_analytics_export_destination
    ~s3_bucket_destination:(s3_bucket_destination_ : analytics_s3_bucket_destination) () =
  ({ s3_bucket_destination = s3_bucket_destination_ } : analytics_export_destination)

let make_storage_class_analysis_data_export
    ~output_schema_version:(output_schema_version_ : storage_class_analysis_schema_version)
    ~destination:(destination_ : analytics_export_destination) () =
  ({ output_schema_version = output_schema_version_; destination = destination_ }
    : storage_class_analysis_data_export)

let make_storage_class_analysis
    ?data_export:(data_export_ : storage_class_analysis_data_export option) () =
  ({ data_export = data_export_ } : storage_class_analysis)

let make_analytics_and_operator ?prefix:(prefix_ : prefix option) ?tags:(tags_ : tag_set option) ()
    =
  ({ prefix = prefix_; tags = tags_ } : analytics_and_operator)

let make_analytics_configuration ?filter:(filter_ : analytics_filter option)
    ~id:(id_ : analytics_id)
    ~storage_class_analysis:(storage_class_analysis_ : storage_class_analysis) () =
  ({ id = id_; filter = filter_; storage_class_analysis = storage_class_analysis_ }
    : analytics_configuration)

let make_put_bucket_analytics_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : analytics_id)
    ~analytics_configuration:(analytics_configuration_ : analytics_configuration) () =
  ({
     bucket = bucket_;
     id = id_;
     analytics_configuration = analytics_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_analytics_configuration_request)

let make_put_bucket_acl_request ?ac_l:(ac_l_ : bucket_canned_ac_l option)
    ?access_control_policy:(access_control_policy_ : access_control_policy option)
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?grant_full_control:(grant_full_control_ : grant_full_control option)
    ?grant_read:(grant_read_ : grant_read option)
    ?grant_read_ac_p:(grant_read_ac_p_ : grant_read_ac_p option)
    ?grant_write:(grant_write_ : grant_write option)
    ?grant_write_ac_p:(grant_write_ac_p_ : grant_write_ac_p option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     ac_l = ac_l_;
     access_control_policy = access_control_policy_;
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     grant_full_control = grant_full_control_;
     grant_read = grant_read_;
     grant_read_ac_p = grant_read_ac_p_;
     grant_write = grant_write_;
     grant_write_ac_p = grant_write_ac_p_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : put_bucket_acl_request)

let make_put_bucket_accelerate_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ~bucket:(bucket_ : bucket_name)
    ~accelerate_configuration:(accelerate_configuration_ : accelerate_configuration) () =
  ({
     bucket = bucket_;
     accelerate_configuration = accelerate_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
     checksum_algorithm = checksum_algorithm_;
   }
    : put_bucket_accelerate_configuration_request)

let make_put_bucket_abac_request ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~abac_status:(abac_status_ : abac_status) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     expected_bucket_owner = expected_bucket_owner_;
     abac_status = abac_status_;
   }
    : put_bucket_abac_request)

let make_initiator ?i_d:(i_d_ : i_d option) ?display_name:(display_name_ : display_name option) () =
  ({ i_d = i_d_; display_name = display_name_ } : initiator)

let make_part ?part_number:(part_number_ : part_number option)
    ?last_modified:(last_modified_ : last_modified option) ?e_tag:(e_tag_ : e_tag option)
    ?size:(size_ : size option) ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option) () =
  ({
     part_number = part_number_;
     last_modified = last_modified_;
     e_tag = e_tag_;
     size = size_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
   }
    : part)

let make_list_parts_output ?abort_date:(abort_date_ : abort_date option)
    ?abort_rule_id:(abort_rule_id_ : abort_rule_id option) ?bucket:(bucket_ : bucket_name option)
    ?key:(key_ : object_key option) ?upload_id:(upload_id_ : multipart_upload_id option)
    ?part_number_marker:(part_number_marker_ : part_number_marker option)
    ?next_part_number_marker:(next_part_number_marker_ : next_part_number_marker option)
    ?max_parts:(max_parts_ : max_parts option) ?is_truncated:(is_truncated_ : is_truncated option)
    ?parts:(parts_ : parts option) ?initiator:(initiator_ : initiator option)
    ?owner:(owner_ : owner option) ?storage_class:(storage_class_ : storage_class option)
    ?request_charged:(request_charged_ : request_charged option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?checksum_type:(checksum_type_ : checksum_type option) () =
  ({
     abort_date = abort_date_;
     abort_rule_id = abort_rule_id_;
     bucket = bucket_;
     key = key_;
     upload_id = upload_id_;
     part_number_marker = part_number_marker_;
     next_part_number_marker = next_part_number_marker_;
     max_parts = max_parts_;
     is_truncated = is_truncated_;
     parts = parts_;
     initiator = initiator_;
     owner = owner_;
     storage_class = storage_class_;
     request_charged = request_charged_;
     checksum_algorithm = checksum_algorithm_;
     checksum_type = checksum_type_;
   }
    : list_parts_output)

let make_list_parts_request ?max_parts:(max_parts_ : max_parts option)
    ?part_number_marker:(part_number_marker_ : part_number_marker option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key)
    ~upload_id:(upload_id_ : multipart_upload_id) () =
  ({
     bucket = bucket_;
     key = key_;
     max_parts = max_parts_;
     part_number_marker = part_number_marker_;
     upload_id = upload_id_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
   }
    : list_parts_request)

let make_common_prefix ?prefix:(prefix_ : prefix option) () = ({ prefix = prefix_ } : common_prefix)

let make_delete_marker_entry ?owner:(owner_ : owner option) ?key:(key_ : object_key option)
    ?version_id:(version_id_ : object_version_id option) ?is_latest:(is_latest_ : is_latest option)
    ?last_modified:(last_modified_ : last_modified option) () =
  ({
     owner = owner_;
     key = key_;
     version_id = version_id_;
     is_latest = is_latest_;
     last_modified = last_modified_;
   }
    : delete_marker_entry)

let make_restore_status
    ?is_restore_in_progress:(is_restore_in_progress_ : is_restore_in_progress option)
    ?restore_expiry_date:(restore_expiry_date_ : restore_expiry_date option) () =
  ({ is_restore_in_progress = is_restore_in_progress_; restore_expiry_date = restore_expiry_date_ }
    : restore_status)

let make_object_version ?e_tag:(e_tag_ : e_tag option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm_list option)
    ?checksum_type:(checksum_type_ : checksum_type option) ?size:(size_ : size option)
    ?storage_class:(storage_class_ : object_version_storage_class option)
    ?key:(key_ : object_key option) ?version_id:(version_id_ : object_version_id option)
    ?is_latest:(is_latest_ : is_latest option)
    ?last_modified:(last_modified_ : last_modified option) ?owner:(owner_ : owner option)
    ?restore_status:(restore_status_ : restore_status option) () =
  ({
     e_tag = e_tag_;
     checksum_algorithm = checksum_algorithm_;
     checksum_type = checksum_type_;
     size = size_;
     storage_class = storage_class_;
     key = key_;
     version_id = version_id_;
     is_latest = is_latest_;
     last_modified = last_modified_;
     owner = owner_;
     restore_status = restore_status_;
   }
    : object_version)

let make_list_object_versions_output ?is_truncated:(is_truncated_ : is_truncated option)
    ?key_marker:(key_marker_ : key_marker option)
    ?version_id_marker:(version_id_marker_ : version_id_marker option)
    ?next_key_marker:(next_key_marker_ : next_key_marker option)
    ?next_version_id_marker:(next_version_id_marker_ : next_version_id_marker option)
    ?versions:(versions_ : object_version_list option)
    ?delete_markers:(delete_markers_ : delete_markers option) ?name:(name_ : bucket_name option)
    ?prefix:(prefix_ : prefix option) ?delimiter:(delimiter_ : delimiter option)
    ?max_keys:(max_keys_ : max_keys option)
    ?common_prefixes:(common_prefixes_ : common_prefix_list option)
    ?encoding_type:(encoding_type_ : encoding_type option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     is_truncated = is_truncated_;
     key_marker = key_marker_;
     version_id_marker = version_id_marker_;
     next_key_marker = next_key_marker_;
     next_version_id_marker = next_version_id_marker_;
     versions = versions_;
     delete_markers = delete_markers_;
     name = name_;
     prefix = prefix_;
     delimiter = delimiter_;
     max_keys = max_keys_;
     common_prefixes = common_prefixes_;
     encoding_type = encoding_type_;
     request_charged = request_charged_;
   }
    : list_object_versions_output)

let make_list_object_versions_request ?delimiter:(delimiter_ : delimiter option)
    ?encoding_type:(encoding_type_ : encoding_type option)
    ?key_marker:(key_marker_ : key_marker option) ?max_keys:(max_keys_ : max_keys option)
    ?prefix:(prefix_ : prefix option)
    ?version_id_marker:(version_id_marker_ : version_id_marker option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?optional_object_attributes:
      (optional_object_attributes_ : optional_object_attributes_list option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     delimiter = delimiter_;
     encoding_type = encoding_type_;
     key_marker = key_marker_;
     max_keys = max_keys_;
     prefix = prefix_;
     version_id_marker = version_id_marker_;
     expected_bucket_owner = expected_bucket_owner_;
     request_payer = request_payer_;
     optional_object_attributes = optional_object_attributes_;
   }
    : list_object_versions_request)

let make_object_ ?key:(key_ : object_key option)
    ?last_modified:(last_modified_ : last_modified option) ?e_tag:(e_tag_ : e_tag option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm_list option)
    ?checksum_type:(checksum_type_ : checksum_type option) ?size:(size_ : size option)
    ?storage_class:(storage_class_ : object_storage_class option) ?owner:(owner_ : owner option)
    ?restore_status:(restore_status_ : restore_status option) () =
  ({
     key = key_;
     last_modified = last_modified_;
     e_tag = e_tag_;
     checksum_algorithm = checksum_algorithm_;
     checksum_type = checksum_type_;
     size = size_;
     storage_class = storage_class_;
     owner = owner_;
     restore_status = restore_status_;
   }
    : object_)

let make_list_objects_v2_output ?is_truncated:(is_truncated_ : is_truncated option)
    ?contents:(contents_ : object_list option) ?name:(name_ : bucket_name option)
    ?prefix:(prefix_ : prefix option) ?delimiter:(delimiter_ : delimiter option)
    ?max_keys:(max_keys_ : max_keys option)
    ?common_prefixes:(common_prefixes_ : common_prefix_list option)
    ?encoding_type:(encoding_type_ : encoding_type option)
    ?key_count:(key_count_ : key_count option)
    ?continuation_token:(continuation_token_ : token option)
    ?next_continuation_token:(next_continuation_token_ : next_token option)
    ?start_after:(start_after_ : start_after option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     is_truncated = is_truncated_;
     contents = contents_;
     name = name_;
     prefix = prefix_;
     delimiter = delimiter_;
     max_keys = max_keys_;
     common_prefixes = common_prefixes_;
     encoding_type = encoding_type_;
     key_count = key_count_;
     continuation_token = continuation_token_;
     next_continuation_token = next_continuation_token_;
     start_after = start_after_;
     request_charged = request_charged_;
   }
    : list_objects_v2_output)

let make_list_objects_v2_request ?delimiter:(delimiter_ : delimiter option)
    ?encoding_type:(encoding_type_ : encoding_type option) ?max_keys:(max_keys_ : max_keys option)
    ?prefix:(prefix_ : prefix option) ?continuation_token:(continuation_token_ : token option)
    ?fetch_owner:(fetch_owner_ : fetch_owner option)
    ?start_after:(start_after_ : start_after option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?optional_object_attributes:
      (optional_object_attributes_ : optional_object_attributes_list option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     delimiter = delimiter_;
     encoding_type = encoding_type_;
     max_keys = max_keys_;
     prefix = prefix_;
     continuation_token = continuation_token_;
     fetch_owner = fetch_owner_;
     start_after = start_after_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     optional_object_attributes = optional_object_attributes_;
   }
    : list_objects_v2_request)

let make_list_objects_output ?is_truncated:(is_truncated_ : is_truncated option)
    ?marker:(marker_ : marker option) ?next_marker:(next_marker_ : next_marker option)
    ?contents:(contents_ : object_list option) ?name:(name_ : bucket_name option)
    ?prefix:(prefix_ : prefix option) ?delimiter:(delimiter_ : delimiter option)
    ?max_keys:(max_keys_ : max_keys option)
    ?common_prefixes:(common_prefixes_ : common_prefix_list option)
    ?encoding_type:(encoding_type_ : encoding_type option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     is_truncated = is_truncated_;
     marker = marker_;
     next_marker = next_marker_;
     contents = contents_;
     name = name_;
     prefix = prefix_;
     delimiter = delimiter_;
     max_keys = max_keys_;
     common_prefixes = common_prefixes_;
     encoding_type = encoding_type_;
     request_charged = request_charged_;
   }
    : list_objects_output)

let make_list_objects_request ?delimiter:(delimiter_ : delimiter option)
    ?encoding_type:(encoding_type_ : encoding_type option) ?marker:(marker_ : marker option)
    ?max_keys:(max_keys_ : max_keys option) ?prefix:(prefix_ : prefix option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?optional_object_attributes:
      (optional_object_attributes_ : optional_object_attributes_list option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     delimiter = delimiter_;
     encoding_type = encoding_type_;
     marker = marker_;
     max_keys = max_keys_;
     prefix = prefix_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     optional_object_attributes = optional_object_attributes_;
   }
    : list_objects_request)

let make_annotation_entry ?e_tag:(e_tag_ : e_tag option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm_list option)
    ?replication_status:(replication_status_ : replication_status option)
    ~annotation_name:(annotation_name_ : annotation_name)
    ~last_modified:(last_modified_ : last_modified) ~size:(size_ : size) () =
  ({
     annotation_name = annotation_name_;
     last_modified = last_modified_;
     e_tag = e_tag_;
     checksum_algorithm = checksum_algorithm_;
     size = size_;
     replication_status = replication_status_;
   }
    : annotation_entry)

let make_list_object_annotations_output ?annotations:(annotations_ : annotation_list option)
    ?bucket:(bucket_ : bucket_name option) ?key:(key_ : object_key option)
    ?object_version_id:(object_version_id_ : object_version_id option)
    ?annotation_prefix:(annotation_prefix_ : annotation_prefix option)
    ?max_annotation_results:(max_annotation_results_ : max_annotation_results option)
    ?annotation_count:(annotation_count_ : annotation_count option)
    ?continuation_token:(continuation_token_ : token option)
    ?next_continuation_token:(next_continuation_token_ : next_token option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     annotations = annotations_;
     bucket = bucket_;
     key = key_;
     object_version_id = object_version_id_;
     annotation_prefix = annotation_prefix_;
     max_annotation_results = max_annotation_results_;
     annotation_count = annotation_count_;
     continuation_token = continuation_token_;
     next_continuation_token = next_continuation_token_;
     request_charged = request_charged_;
   }
    : list_object_annotations_output)

let make_list_object_annotations_request ?version_id:(version_id_ : object_version_id option)
    ?max_annotation_results:(max_annotation_results_ : max_annotation_results option)
    ?annotation_prefix:(annotation_prefix_ : annotation_prefix option)
    ?continuation_token:(continuation_token_ : token option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     max_annotation_results = max_annotation_results_;
     annotation_prefix = annotation_prefix_;
     continuation_token = continuation_token_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : list_object_annotations_request)

let make_multipart_upload ?upload_id:(upload_id_ : multipart_upload_id option)
    ?key:(key_ : object_key option) ?initiated:(initiated_ : initiated option)
    ?storage_class:(storage_class_ : storage_class option) ?owner:(owner_ : owner option)
    ?initiator:(initiator_ : initiator option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?checksum_type:(checksum_type_ : checksum_type option) () =
  ({
     upload_id = upload_id_;
     key = key_;
     initiated = initiated_;
     storage_class = storage_class_;
     owner = owner_;
     initiator = initiator_;
     checksum_algorithm = checksum_algorithm_;
     checksum_type = checksum_type_;
   }
    : multipart_upload)

let make_list_multipart_uploads_output ?bucket:(bucket_ : bucket_name option)
    ?key_marker:(key_marker_ : key_marker option)
    ?upload_id_marker:(upload_id_marker_ : upload_id_marker option)
    ?next_key_marker:(next_key_marker_ : next_key_marker option) ?prefix:(prefix_ : prefix option)
    ?delimiter:(delimiter_ : delimiter option)
    ?next_upload_id_marker:(next_upload_id_marker_ : next_upload_id_marker option)
    ?max_uploads:(max_uploads_ : max_uploads option)
    ?is_truncated:(is_truncated_ : is_truncated option)
    ?uploads:(uploads_ : multipart_upload_list option)
    ?common_prefixes:(common_prefixes_ : common_prefix_list option)
    ?encoding_type:(encoding_type_ : encoding_type option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     bucket = bucket_;
     key_marker = key_marker_;
     upload_id_marker = upload_id_marker_;
     next_key_marker = next_key_marker_;
     prefix = prefix_;
     delimiter = delimiter_;
     next_upload_id_marker = next_upload_id_marker_;
     max_uploads = max_uploads_;
     is_truncated = is_truncated_;
     uploads = uploads_;
     common_prefixes = common_prefixes_;
     encoding_type = encoding_type_;
     request_charged = request_charged_;
   }
    : list_multipart_uploads_output)

let make_list_multipart_uploads_request ?delimiter:(delimiter_ : delimiter option)
    ?encoding_type:(encoding_type_ : encoding_type option)
    ?key_marker:(key_marker_ : key_marker option) ?max_uploads:(max_uploads_ : max_uploads option)
    ?prefix:(prefix_ : prefix option)
    ?upload_id_marker:(upload_id_marker_ : upload_id_marker option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?request_payer:(request_payer_ : request_payer option) ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     delimiter = delimiter_;
     encoding_type = encoding_type_;
     key_marker = key_marker_;
     max_uploads = max_uploads_;
     prefix = prefix_;
     upload_id_marker = upload_id_marker_;
     expected_bucket_owner = expected_bucket_owner_;
     request_payer = request_payer_;
   }
    : list_multipart_uploads_request)

let make_bucket ?name:(name_ : bucket_name option)
    ?creation_date:(creation_date_ : creation_date option)
    ?bucket_region:(bucket_region_ : bucket_region option)
    ?bucket_arn:(bucket_arn_ : s3_regional_or_s3_express_bucket_arn_string option) () =
  ({
     name = name_;
     creation_date = creation_date_;
     bucket_region = bucket_region_;
     bucket_arn = bucket_arn_;
   }
    : bucket)

let make_list_directory_buckets_output ?buckets:(buckets_ : buckets option)
    ?continuation_token:(continuation_token_ : directory_bucket_token option) () =
  ({ buckets = buckets_; continuation_token = continuation_token_ } : list_directory_buckets_output)

let make_list_directory_buckets_request
    ?continuation_token:(continuation_token_ : directory_bucket_token option)
    ?max_directory_buckets:(max_directory_buckets_ : max_directory_buckets option) () =
  ({ continuation_token = continuation_token_; max_directory_buckets = max_directory_buckets_ }
    : list_directory_buckets_request)

let make_list_buckets_output ?buckets:(buckets_ : buckets option) ?owner:(owner_ : owner option)
    ?continuation_token:(continuation_token_ : next_token option) ?prefix:(prefix_ : prefix option)
    () =
  ({
     buckets = buckets_;
     owner = owner_;
     continuation_token = continuation_token_;
     prefix = prefix_;
   }
    : list_buckets_output)

let make_list_buckets_request ?max_buckets:(max_buckets_ : max_buckets option)
    ?continuation_token:(continuation_token_ : token option) ?prefix:(prefix_ : prefix option)
    ?bucket_region:(bucket_region_ : bucket_region option) () =
  ({
     max_buckets = max_buckets_;
     continuation_token = continuation_token_;
     prefix = prefix_;
     bucket_region = bucket_region_;
   }
    : list_buckets_request)

let make_list_bucket_metrics_configurations_output
    ?is_truncated:(is_truncated_ : is_truncated option)
    ?continuation_token:(continuation_token_ : token option)
    ?next_continuation_token:(next_continuation_token_ : next_token option)
    ?metrics_configuration_list:(metrics_configuration_list_ : metrics_configuration_list option) ()
    =
  ({
     is_truncated = is_truncated_;
     continuation_token = continuation_token_;
     next_continuation_token = next_continuation_token_;
     metrics_configuration_list = metrics_configuration_list_;
   }
    : list_bucket_metrics_configurations_output)

let make_list_bucket_metrics_configurations_request
    ?continuation_token:(continuation_token_ : token option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     continuation_token = continuation_token_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : list_bucket_metrics_configurations_request)

let make_list_bucket_inventory_configurations_output
    ?continuation_token:(continuation_token_ : token option)
    ?inventory_configuration_list:
      (inventory_configuration_list_ : inventory_configuration_list option)
    ?is_truncated:(is_truncated_ : is_truncated option)
    ?next_continuation_token:(next_continuation_token_ : next_token option) () =
  ({
     continuation_token = continuation_token_;
     inventory_configuration_list = inventory_configuration_list_;
     is_truncated = is_truncated_;
     next_continuation_token = next_continuation_token_;
   }
    : list_bucket_inventory_configurations_output)

let make_list_bucket_inventory_configurations_request
    ?continuation_token:(continuation_token_ : token option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     continuation_token = continuation_token_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : list_bucket_inventory_configurations_request)

let make_list_bucket_intelligent_tiering_configurations_output
    ?is_truncated:(is_truncated_ : is_truncated option)
    ?continuation_token:(continuation_token_ : token option)
    ?next_continuation_token:(next_continuation_token_ : next_token option)
    ?intelligent_tiering_configuration_list:
      (intelligent_tiering_configuration_list_ : intelligent_tiering_configuration_list option) () =
  ({
     is_truncated = is_truncated_;
     continuation_token = continuation_token_;
     next_continuation_token = next_continuation_token_;
     intelligent_tiering_configuration_list = intelligent_tiering_configuration_list_;
   }
    : list_bucket_intelligent_tiering_configurations_output)

let make_list_bucket_intelligent_tiering_configurations_request
    ?continuation_token:(continuation_token_ : token option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     continuation_token = continuation_token_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : list_bucket_intelligent_tiering_configurations_request)

let make_list_bucket_analytics_configurations_output
    ?is_truncated:(is_truncated_ : is_truncated option)
    ?continuation_token:(continuation_token_ : token option)
    ?next_continuation_token:(next_continuation_token_ : next_token option)
    ?analytics_configuration_list:
      (analytics_configuration_list_ : analytics_configuration_list option) () =
  ({
     is_truncated = is_truncated_;
     continuation_token = continuation_token_;
     next_continuation_token = next_continuation_token_;
     analytics_configuration_list = analytics_configuration_list_;
   }
    : list_bucket_analytics_configurations_output)

let make_list_bucket_analytics_configurations_request
    ?continuation_token:(continuation_token_ : token option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     continuation_token = continuation_token_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : list_bucket_analytics_configurations_request)

let make_head_object_output ?delete_marker:(delete_marker_ : delete_marker option)
    ?accept_ranges:(accept_ranges_ : accept_ranges option)
    ?expiration:(expiration_ : expiration option) ?restore:(restore_ : restore option)
    ?archive_status:(archive_status_ : archive_status option)
    ?last_modified:(last_modified_ : last_modified option)
    ?content_length:(content_length_ : content_length option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option) ?e_tag:(e_tag_ : e_tag option)
    ?missing_meta:(missing_meta_ : missing_meta option)
    ?version_id:(version_id_ : object_version_id option)
    ?cache_control:(cache_control_ : cache_control option)
    ?content_disposition:(content_disposition_ : content_disposition option)
    ?content_encoding:(content_encoding_ : content_encoding option)
    ?content_language:(content_language_ : content_language option)
    ?content_type:(content_type_ : content_type option)
    ?content_range:(content_range_ : content_range option) ?expires:(expires_ : expires option)
    ?website_redirect_location:(website_redirect_location_ : website_redirect_location option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?metadata:(metadata_ : metadata option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?storage_class:(storage_class_ : storage_class option)
    ?request_charged:(request_charged_ : request_charged option)
    ?replication_status:(replication_status_ : replication_status option)
    ?parts_count:(parts_count_ : parts_count option) ?tag_count:(tag_count_ : tag_count option)
    ?object_lock_mode:(object_lock_mode_ : object_lock_mode option)
    ?object_lock_retain_until_date:
      (object_lock_retain_until_date_ : object_lock_retain_until_date option)
    ?object_lock_legal_hold_status:
      (object_lock_legal_hold_status_ : object_lock_legal_hold_status option) () =
  ({
     delete_marker = delete_marker_;
     accept_ranges = accept_ranges_;
     expiration = expiration_;
     restore = restore_;
     archive_status = archive_status_;
     last_modified = last_modified_;
     content_length = content_length_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
     e_tag = e_tag_;
     missing_meta = missing_meta_;
     version_id = version_id_;
     cache_control = cache_control_;
     content_disposition = content_disposition_;
     content_encoding = content_encoding_;
     content_language = content_language_;
     content_type = content_type_;
     content_range = content_range_;
     expires = expires_;
     website_redirect_location = website_redirect_location_;
     server_side_encryption = server_side_encryption_;
     metadata = metadata_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     bucket_key_enabled = bucket_key_enabled_;
     storage_class = storage_class_;
     request_charged = request_charged_;
     replication_status = replication_status_;
     parts_count = parts_count_;
     tag_count = tag_count_;
     object_lock_mode = object_lock_mode_;
     object_lock_retain_until_date = object_lock_retain_until_date_;
     object_lock_legal_hold_status = object_lock_legal_hold_status_;
   }
    : head_object_output)

let make_head_object_request ?if_match:(if_match_ : if_match option)
    ?if_modified_since:(if_modified_since_ : if_modified_since option)
    ?if_none_match:(if_none_match_ : if_none_match option)
    ?if_unmodified_since:(if_unmodified_since_ : if_unmodified_since option)
    ?range:(range_ : range option)
    ?response_cache_control:(response_cache_control_ : response_cache_control option)
    ?response_content_disposition:
      (response_content_disposition_ : response_content_disposition option)
    ?response_content_encoding:(response_content_encoding_ : response_content_encoding option)
    ?response_content_language:(response_content_language_ : response_content_language option)
    ?response_content_type:(response_content_type_ : response_content_type option)
    ?response_expires:(response_expires_ : response_expires option)
    ?version_id:(version_id_ : object_version_id option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?request_payer:(request_payer_ : request_payer option)
    ?part_number:(part_number_ : part_number option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?checksum_mode:(checksum_mode_ : checksum_mode option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     if_match = if_match_;
     if_modified_since = if_modified_since_;
     if_none_match = if_none_match_;
     if_unmodified_since = if_unmodified_since_;
     key = key_;
     range = range_;
     response_cache_control = response_cache_control_;
     response_content_disposition = response_content_disposition_;
     response_content_encoding = response_content_encoding_;
     response_content_language = response_content_language_;
     response_content_type = response_content_type_;
     response_expires = response_expires_;
     version_id = version_id_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     request_payer = request_payer_;
     part_number = part_number_;
     expected_bucket_owner = expected_bucket_owner_;
     checksum_mode = checksum_mode_;
   }
    : head_object_request)

let make_head_bucket_output
    ?bucket_arn:(bucket_arn_ : s3_regional_or_s3_express_bucket_arn_string option)
    ?bucket_location_type:(bucket_location_type_ : location_type option)
    ?bucket_location_name:(bucket_location_name_ : bucket_location_name option)
    ?bucket_region:(bucket_region_ : region option)
    ?access_point_alias:(access_point_alias_ : access_point_alias option) () =
  ({
     bucket_arn = bucket_arn_;
     bucket_location_type = bucket_location_type_;
     bucket_location_name = bucket_location_name_;
     bucket_region = bucket_region_;
     access_point_alias = access_point_alias_;
   }
    : head_bucket_output)

let make_head_bucket_request ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ } : head_bucket_request)

let make_get_public_access_block_output
    ?public_access_block_configuration:
      (public_access_block_configuration_ : public_access_block_configuration option) () =
  ({ public_access_block_configuration = public_access_block_configuration_ }
    : get_public_access_block_output)

let make_get_public_access_block_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_public_access_block_request)

let make_get_object_torrent_output ?body:(body_ : streaming_blob option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({ body = body_; request_charged = request_charged_ } : get_object_torrent_output)

let make_get_object_torrent_request ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : get_object_torrent_request)

let make_get_object_tagging_output ?version_id:(version_id_ : object_version_id option)
    ~tag_set:(tag_set_ : tag_set) () =
  ({ version_id = version_id_; tag_set = tag_set_ } : get_object_tagging_output)

let make_get_object_tagging_request ?version_id:(version_id_ : object_version_id option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?request_payer:(request_payer_ : request_payer option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     expected_bucket_owner = expected_bucket_owner_;
     request_payer = request_payer_;
   }
    : get_object_tagging_request)

let make_get_object_retention_output ?retention:(retention_ : object_lock_retention option) () =
  ({ retention = retention_ } : get_object_retention_output)

let make_get_object_retention_request ?version_id:(version_id_ : object_version_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : get_object_retention_request)

let make_get_object_lock_configuration_output
    ?object_lock_configuration:(object_lock_configuration_ : object_lock_configuration option) () =
  ({ object_lock_configuration = object_lock_configuration_ }
    : get_object_lock_configuration_output)

let make_get_object_lock_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_object_lock_configuration_request)

let make_get_object_legal_hold_output ?legal_hold:(legal_hold_ : object_lock_legal_hold option) () =
  ({ legal_hold = legal_hold_ } : get_object_legal_hold_output)

let make_get_object_legal_hold_request ?version_id:(version_id_ : object_version_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : get_object_legal_hold_request)

let make_object_part ?part_number:(part_number_ : part_number option) ?size:(size_ : size option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option) () =
  ({
     part_number = part_number_;
     size = size_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
   }
    : object_part)

let make_get_object_attributes_parts ?total_parts_count:(total_parts_count_ : parts_count option)
    ?part_number_marker:(part_number_marker_ : part_number_marker option)
    ?next_part_number_marker:(next_part_number_marker_ : next_part_number_marker option)
    ?max_parts:(max_parts_ : max_parts option) ?is_truncated:(is_truncated_ : is_truncated option)
    ?parts:(parts_ : parts_list option) () =
  ({
     total_parts_count = total_parts_count_;
     part_number_marker = part_number_marker_;
     next_part_number_marker = next_part_number_marker_;
     max_parts = max_parts_;
     is_truncated = is_truncated_;
     parts = parts_;
   }
    : get_object_attributes_parts)

let make_checksum ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option) () =
  ({
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
   }
    : checksum)

let make_get_object_attributes_output ?delete_marker:(delete_marker_ : delete_marker option)
    ?last_modified:(last_modified_ : last_modified option)
    ?version_id:(version_id_ : object_version_id option)
    ?request_charged:(request_charged_ : request_charged option) ?e_tag:(e_tag_ : e_tag option)
    ?checksum:(checksum_ : checksum option)
    ?object_parts:(object_parts_ : get_object_attributes_parts option)
    ?storage_class:(storage_class_ : storage_class option)
    ?object_size:(object_size_ : object_size option) () =
  ({
     delete_marker = delete_marker_;
     last_modified = last_modified_;
     version_id = version_id_;
     request_charged = request_charged_;
     e_tag = e_tag_;
     checksum = checksum_;
     object_parts = object_parts_;
     storage_class = storage_class_;
     object_size = object_size_;
   }
    : get_object_attributes_output)

let make_get_object_attributes_request ?version_id:(version_id_ : object_version_id option)
    ?max_parts:(max_parts_ : max_parts option)
    ?part_number_marker:(part_number_marker_ : part_number_marker option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key)
    ~object_attributes:(object_attributes_ : object_attributes_list) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     max_parts = max_parts_;
     part_number_marker = part_number_marker_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     object_attributes = object_attributes_;
   }
    : get_object_attributes_request)

let make_get_object_annotation_output
    ?annotation_payload:(annotation_payload_ : streaming_blob option)
    ?object_version_id:(object_version_id_ : object_version_id option)
    ?last_modified:(last_modified_ : last_modified option)
    ?content_length:(content_length_ : content_length option) ?e_tag:(e_tag_ : e_tag option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?request_charged:(request_charged_ : request_charged option)
    ?replication_status:(replication_status_ : replication_status option) () =
  ({
     annotation_payload = annotation_payload_;
     object_version_id = object_version_id_;
     last_modified = last_modified_;
     content_length = content_length_;
     e_tag = e_tag_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
     server_side_encryption = server_side_encryption_;
     request_charged = request_charged_;
     replication_status = replication_status_;
   }
    : get_object_annotation_output)

let make_get_object_annotation_request ?version_id:(version_id_ : object_version_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?checksum_mode:(checksum_mode_ : checksum_mode option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) ~annotation_name:(annotation_name_ : annotation_name) () =
  ({
     bucket = bucket_;
     key = key_;
     annotation_name = annotation_name_;
     version_id = version_id_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     checksum_mode = checksum_mode_;
   }
    : get_object_annotation_request)

let make_get_object_acl_output ?owner:(owner_ : owner option) ?grants:(grants_ : grants option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({ owner = owner_; grants = grants_; request_charged = request_charged_ } : get_object_acl_output)

let make_get_object_acl_request ?version_id:(version_id_ : object_version_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : get_object_acl_request)

let make_get_object_output ?body:(body_ : streaming_blob option)
    ?delete_marker:(delete_marker_ : delete_marker option)
    ?accept_ranges:(accept_ranges_ : accept_ranges option)
    ?expiration:(expiration_ : expiration option) ?restore:(restore_ : restore option)
    ?last_modified:(last_modified_ : last_modified option)
    ?content_length:(content_length_ : content_length option) ?e_tag:(e_tag_ : e_tag option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option)
    ?missing_meta:(missing_meta_ : missing_meta option)
    ?version_id:(version_id_ : object_version_id option)
    ?cache_control:(cache_control_ : cache_control option)
    ?content_disposition:(content_disposition_ : content_disposition option)
    ?content_encoding:(content_encoding_ : content_encoding option)
    ?content_language:(content_language_ : content_language option)
    ?content_range:(content_range_ : content_range option)
    ?content_type:(content_type_ : content_type option) ?expires:(expires_ : expires option)
    ?website_redirect_location:(website_redirect_location_ : website_redirect_location option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?metadata:(metadata_ : metadata option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?storage_class:(storage_class_ : storage_class option)
    ?request_charged:(request_charged_ : request_charged option)
    ?replication_status:(replication_status_ : replication_status option)
    ?parts_count:(parts_count_ : parts_count option) ?tag_count:(tag_count_ : tag_count option)
    ?object_lock_mode:(object_lock_mode_ : object_lock_mode option)
    ?object_lock_retain_until_date:
      (object_lock_retain_until_date_ : object_lock_retain_until_date option)
    ?object_lock_legal_hold_status:
      (object_lock_legal_hold_status_ : object_lock_legal_hold_status option) () =
  ({
     body = body_;
     delete_marker = delete_marker_;
     accept_ranges = accept_ranges_;
     expiration = expiration_;
     restore = restore_;
     last_modified = last_modified_;
     content_length = content_length_;
     e_tag = e_tag_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
     missing_meta = missing_meta_;
     version_id = version_id_;
     cache_control = cache_control_;
     content_disposition = content_disposition_;
     content_encoding = content_encoding_;
     content_language = content_language_;
     content_range = content_range_;
     content_type = content_type_;
     expires = expires_;
     website_redirect_location = website_redirect_location_;
     server_side_encryption = server_side_encryption_;
     metadata = metadata_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     bucket_key_enabled = bucket_key_enabled_;
     storage_class = storage_class_;
     request_charged = request_charged_;
     replication_status = replication_status_;
     parts_count = parts_count_;
     tag_count = tag_count_;
     object_lock_mode = object_lock_mode_;
     object_lock_retain_until_date = object_lock_retain_until_date_;
     object_lock_legal_hold_status = object_lock_legal_hold_status_;
   }
    : get_object_output)

let make_get_object_request ?if_match:(if_match_ : if_match option)
    ?if_modified_since:(if_modified_since_ : if_modified_since option)
    ?if_none_match:(if_none_match_ : if_none_match option)
    ?if_unmodified_since:(if_unmodified_since_ : if_unmodified_since option)
    ?range:(range_ : range option)
    ?response_cache_control:(response_cache_control_ : response_cache_control option)
    ?response_content_disposition:
      (response_content_disposition_ : response_content_disposition option)
    ?response_content_encoding:(response_content_encoding_ : response_content_encoding option)
    ?response_content_language:(response_content_language_ : response_content_language option)
    ?response_content_type:(response_content_type_ : response_content_type option)
    ?response_expires:(response_expires_ : response_expires option)
    ?version_id:(version_id_ : object_version_id option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?request_payer:(request_payer_ : request_payer option)
    ?part_number:(part_number_ : part_number option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?checksum_mode:(checksum_mode_ : checksum_mode option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     if_match = if_match_;
     if_modified_since = if_modified_since_;
     if_none_match = if_none_match_;
     if_unmodified_since = if_unmodified_since_;
     key = key_;
     range = range_;
     response_cache_control = response_cache_control_;
     response_content_disposition = response_content_disposition_;
     response_content_encoding = response_content_encoding_;
     response_content_language = response_content_language_;
     response_content_type = response_content_type_;
     response_expires = response_expires_;
     version_id = version_id_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     request_payer = request_payer_;
     part_number = part_number_;
     expected_bucket_owner = expected_bucket_owner_;
     checksum_mode = checksum_mode_;
   }
    : get_object_request)

let make_get_bucket_website_output
    ?redirect_all_requests_to:(redirect_all_requests_to_ : redirect_all_requests_to option)
    ?index_document:(index_document_ : index_document option)
    ?error_document:(error_document_ : error_document option)
    ?routing_rules:(routing_rules_ : routing_rules option) () =
  ({
     redirect_all_requests_to = redirect_all_requests_to_;
     index_document = index_document_;
     error_document = error_document_;
     routing_rules = routing_rules_;
   }
    : get_bucket_website_output)

let make_get_bucket_website_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_website_request)

let make_get_bucket_versioning_output ?status:(status_ : bucket_versioning_status option)
    ?mfa_delete:(mfa_delete_ : mfa_delete_status option) () =
  ({ status = status_; mfa_delete = mfa_delete_ } : get_bucket_versioning_output)

let make_get_bucket_versioning_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_versioning_request)

let make_get_bucket_tagging_output ~tag_set:(tag_set_ : tag_set) () =
  ({ tag_set = tag_set_ } : get_bucket_tagging_output)

let make_get_bucket_tagging_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_tagging_request)

let make_get_bucket_request_payment_output ?payer:(payer_ : payer option) () =
  ({ payer = payer_ } : get_bucket_request_payment_output)

let make_get_bucket_request_payment_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_request_payment_request)

let make_get_bucket_replication_output
    ?replication_configuration:(replication_configuration_ : replication_configuration option) () =
  ({ replication_configuration = replication_configuration_ } : get_bucket_replication_output)

let make_get_bucket_replication_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_replication_request)

let make_policy_status ?is_public:(is_public_ : is_public option) () =
  ({ is_public = is_public_ } : policy_status)

let make_get_bucket_policy_status_output ?policy_status:(policy_status_ : policy_status option) () =
  ({ policy_status = policy_status_ } : get_bucket_policy_status_output)

let make_get_bucket_policy_status_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_policy_status_request)

let make_get_bucket_policy_output ?policy:(policy_ : policy option) () =
  ({ policy = policy_ } : get_bucket_policy_output)

let make_get_bucket_policy_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ } : get_bucket_policy_request)

let make_get_bucket_ownership_controls_output
    ?ownership_controls:(ownership_controls_ : ownership_controls option) () =
  ({ ownership_controls = ownership_controls_ } : get_bucket_ownership_controls_output)

let make_get_bucket_ownership_controls_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_ownership_controls_request)

let make_get_bucket_notification_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_notification_configuration_request)

let make_get_bucket_metrics_configuration_output
    ?metrics_configuration:(metrics_configuration_ : metrics_configuration option) () =
  ({ metrics_configuration = metrics_configuration_ } : get_bucket_metrics_configuration_output)

let make_get_bucket_metrics_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : metrics_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_metrics_configuration_request)

let make_error_details ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ error_code = error_code_; error_message = error_message_ } : error_details)

let make_get_bucket_metadata_table_configuration_output
    ?get_bucket_metadata_table_configuration_result:
      (get_bucket_metadata_table_configuration_result_ :
         get_bucket_metadata_table_configuration_result option) () =
  ({
     get_bucket_metadata_table_configuration_result =
       get_bucket_metadata_table_configuration_result_;
   }
    : get_bucket_metadata_table_configuration_output)

let make_get_bucket_metadata_table_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_metadata_table_configuration_request)

let make_get_bucket_metadata_configuration_output
    ?get_bucket_metadata_configuration_result:
      (get_bucket_metadata_configuration_result_ : get_bucket_metadata_configuration_result option)
    () =
  ({ get_bucket_metadata_configuration_result = get_bucket_metadata_configuration_result_ }
    : get_bucket_metadata_configuration_output)

let make_get_bucket_metadata_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_metadata_configuration_request)

let make_get_bucket_logging_output ?logging_enabled:(logging_enabled_ : logging_enabled option) () =
  ({ logging_enabled = logging_enabled_ } : get_bucket_logging_output)

let make_get_bucket_logging_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_logging_request)

let make_get_bucket_location_output
    ?location_constraint:(location_constraint_ : bucket_location_constraint option) () =
  ({ location_constraint = location_constraint_ } : get_bucket_location_output)

let make_get_bucket_location_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_location_request)

let make_get_bucket_lifecycle_configuration_output ?rules:(rules_ : lifecycle_rules option)
    ?transition_default_minimum_object_size:
      (transition_default_minimum_object_size_ : transition_default_minimum_object_size option) () =
  ({
     rules = rules_;
     transition_default_minimum_object_size = transition_default_minimum_object_size_;
   }
    : get_bucket_lifecycle_configuration_output)

let make_get_bucket_lifecycle_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_lifecycle_configuration_request)

let make_get_bucket_inventory_configuration_output
    ?inventory_configuration:(inventory_configuration_ : inventory_configuration option) () =
  ({ inventory_configuration = inventory_configuration_ }
    : get_bucket_inventory_configuration_output)

let make_get_bucket_inventory_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : inventory_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_inventory_configuration_request)

let make_get_bucket_intelligent_tiering_configuration_output
    ?intelligent_tiering_configuration:
      (intelligent_tiering_configuration_ : intelligent_tiering_configuration option) () =
  ({ intelligent_tiering_configuration = intelligent_tiering_configuration_ }
    : get_bucket_intelligent_tiering_configuration_output)

let make_get_bucket_intelligent_tiering_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : intelligent_tiering_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_intelligent_tiering_configuration_request)

let make_get_bucket_encryption_output
    ?server_side_encryption_configuration:
      (server_side_encryption_configuration_ : server_side_encryption_configuration option) () =
  ({ server_side_encryption_configuration = server_side_encryption_configuration_ }
    : get_bucket_encryption_output)

let make_get_bucket_encryption_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_encryption_request)

let make_get_bucket_cors_output ?cors_rules:(cors_rules_ : cors_rules option) () =
  ({ cors_rules = cors_rules_ } : get_bucket_cors_output)

let make_get_bucket_cors_request ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ } : get_bucket_cors_request)

let make_get_bucket_analytics_configuration_output
    ?analytics_configuration:(analytics_configuration_ : analytics_configuration option) () =
  ({ analytics_configuration = analytics_configuration_ }
    : get_bucket_analytics_configuration_output)

let make_get_bucket_analytics_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : analytics_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : get_bucket_analytics_configuration_request)

let make_get_bucket_acl_output ?owner:(owner_ : owner option) ?grants:(grants_ : grants option) () =
  ({ owner = owner_; grants = grants_ } : get_bucket_acl_output)

let make_get_bucket_acl_request ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ } : get_bucket_acl_request)

let make_get_bucket_accelerate_configuration_output
    ?status:(status_ : bucket_accelerate_status option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({ status = status_; request_charged = request_charged_ }
    : get_bucket_accelerate_configuration_output)

let make_get_bucket_accelerate_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?request_payer:(request_payer_ : request_payer option) ~bucket:(bucket_ : bucket_name) () =
  ({
     bucket = bucket_;
     expected_bucket_owner = expected_bucket_owner_;
     request_payer = request_payer_;
   }
    : get_bucket_accelerate_configuration_request)

let make_get_bucket_abac_output ?abac_status:(abac_status_ : abac_status option) () =
  ({ abac_status = abac_status_ } : get_bucket_abac_output)

let make_get_bucket_abac_request ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ } : get_bucket_abac_request)

let make_delete_public_access_block_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_public_access_block_request)

let make_delete_object_tagging_output ?version_id:(version_id_ : object_version_id option) () =
  ({ version_id = version_id_ } : delete_object_tagging_output)

let make_delete_object_tagging_request ?version_id:(version_id_ : object_version_id option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     version_id = version_id_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : delete_object_tagging_request)

let make_error ?key:(key_ : object_key option) ?version_id:(version_id_ : object_version_id option)
    ?code:(code_ : code option) ?message:(message_ : message option) () =
  ({ key = key_; version_id = version_id_; code = code_; message = message_ } : error)

let make_deleted_object ?key:(key_ : object_key option)
    ?version_id:(version_id_ : object_version_id option)
    ?delete_marker:(delete_marker_ : delete_marker option)
    ?delete_marker_version_id:(delete_marker_version_id_ : delete_marker_version_id option) () =
  ({
     key = key_;
     version_id = version_id_;
     delete_marker = delete_marker_;
     delete_marker_version_id = delete_marker_version_id_;
   }
    : deleted_object)

let make_delete_objects_output ?deleted:(deleted_ : deleted_objects option)
    ?request_charged:(request_charged_ : request_charged option) ?errors:(errors_ : errors option)
    () =
  ({ deleted = deleted_; request_charged = request_charged_; errors = errors_ }
    : delete_objects_output)

let make_object_identifier ?version_id:(version_id_ : object_version_id option)
    ?e_tag:(e_tag_ : e_tag option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?size:(size_ : size option) ~key:(key_ : object_key) () =
  ({
     key = key_;
     version_id = version_id_;
     e_tag = e_tag_;
     last_modified_time = last_modified_time_;
     size = size_;
   }
    : object_identifier)

let make_delete ?quiet:(quiet_ : quiet option) ~objects:(objects_ : object_identifier_list) () =
  ({ objects = objects_; quiet = quiet_ } : delete)

let make_delete_objects_request ?mf_a:(mf_a_ : mf_a option)
    ?request_payer:(request_payer_ : request_payer option)
    ?bypass_governance_retention:(bypass_governance_retention_ : bypass_governance_retention option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ~bucket:(bucket_ : bucket_name) ~delete:(delete_ : delete) () =
  ({
     bucket = bucket_;
     delete = delete_;
     mf_a = mf_a_;
     request_payer = request_payer_;
     bypass_governance_retention = bypass_governance_retention_;
     expected_bucket_owner = expected_bucket_owner_;
     checksum_algorithm = checksum_algorithm_;
   }
    : delete_objects_request)

let make_delete_object_annotation_output
    ?object_version_id:(object_version_id_ : object_version_id option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({ object_version_id = object_version_id_; request_charged = request_charged_ }
    : delete_object_annotation_output)

let make_delete_object_annotation_request ?version_id:(version_id_ : object_version_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?object_if_match:(object_if_match_ : object_if_match option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) ~annotation_name:(annotation_name_ : annotation_name) () =
  ({
     bucket = bucket_;
     key = key_;
     annotation_name = annotation_name_;
     version_id = version_id_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     object_if_match = object_if_match_;
   }
    : delete_object_annotation_request)

let make_delete_object_output ?delete_marker:(delete_marker_ : delete_marker option)
    ?version_id:(version_id_ : object_version_id option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({ delete_marker = delete_marker_; version_id = version_id_; request_charged = request_charged_ }
    : delete_object_output)

let make_delete_object_request ?mf_a:(mf_a_ : mf_a option)
    ?version_id:(version_id_ : object_version_id option)
    ?request_payer:(request_payer_ : request_payer option)
    ?bypass_governance_retention:(bypass_governance_retention_ : bypass_governance_retention option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?if_match:(if_match_ : if_match option)
    ?if_match_last_modified_time:(if_match_last_modified_time_ : if_match_last_modified_time option)
    ?if_match_size:(if_match_size_ : if_match_size option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) () =
  ({
     bucket = bucket_;
     key = key_;
     mf_a = mf_a_;
     version_id = version_id_;
     request_payer = request_payer_;
     bypass_governance_retention = bypass_governance_retention_;
     expected_bucket_owner = expected_bucket_owner_;
     if_match = if_match_;
     if_match_last_modified_time = if_match_last_modified_time_;
     if_match_size = if_match_size_;
   }
    : delete_object_request)

let make_delete_bucket_website_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_website_request)

let make_delete_bucket_tagging_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_tagging_request)

let make_delete_bucket_replication_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_replication_request)

let make_delete_bucket_policy_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_policy_request)

let make_delete_bucket_ownership_controls_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_ownership_controls_request)

let make_delete_bucket_metrics_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : metrics_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_metrics_configuration_request)

let make_delete_bucket_metadata_table_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_metadata_table_configuration_request)

let make_delete_bucket_metadata_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_metadata_configuration_request)

let make_delete_bucket_lifecycle_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_lifecycle_request)

let make_delete_bucket_inventory_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : inventory_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_inventory_configuration_request)

let make_delete_bucket_intelligent_tiering_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : intelligent_tiering_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_intelligent_tiering_configuration_request)

let make_delete_bucket_encryption_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_encryption_request)

let make_delete_bucket_cors_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_cors_request)

let make_delete_bucket_analytics_configuration_request
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~id:(id_ : analytics_id) () =
  ({ bucket = bucket_; id = id_; expected_bucket_owner = expected_bucket_owner_ }
    : delete_bucket_analytics_configuration_request)

let make_delete_bucket_request ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) () =
  ({ bucket = bucket_; expected_bucket_owner = expected_bucket_owner_ } : delete_bucket_request)

let make_session_credentials ~access_key_id:(access_key_id_ : access_key_id_value)
    ~secret_access_key:(secret_access_key_ : session_credential_value)
    ~session_token:(session_token_ : session_credential_value)
    ~expiration:(expiration_ : session_expiration) () =
  ({
     access_key_id = access_key_id_;
     secret_access_key = secret_access_key_;
     session_token = session_token_;
     expiration = expiration_;
   }
    : session_credentials)

let make_create_session_output
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ~credentials:(credentials_ : session_credentials) () =
  ({
     server_side_encryption = server_side_encryption_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
     credentials = credentials_;
   }
    : create_session_output)

let make_create_session_request ?session_mode:(session_mode_ : session_mode option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ~bucket:(bucket_ : bucket_name) () =
  ({
     session_mode = session_mode_;
     bucket = bucket_;
     server_side_encryption = server_side_encryption_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
   }
    : create_session_request)

let make_create_multipart_upload_output ?abort_date:(abort_date_ : abort_date option)
    ?abort_rule_id:(abort_rule_id_ : abort_rule_id option) ?bucket:(bucket_ : bucket_name option)
    ?key:(key_ : object_key option) ?upload_id:(upload_id_ : multipart_upload_id option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?request_charged:(request_charged_ : request_charged option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?checksum_type:(checksum_type_ : checksum_type option) () =
  ({
     abort_date = abort_date_;
     abort_rule_id = abort_rule_id_;
     bucket = bucket_;
     key = key_;
     upload_id = upload_id_;
     server_side_encryption = server_side_encryption_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
     request_charged = request_charged_;
     checksum_algorithm = checksum_algorithm_;
     checksum_type = checksum_type_;
   }
    : create_multipart_upload_output)

let make_create_multipart_upload_request ?ac_l:(ac_l_ : object_canned_ac_l option)
    ?cache_control:(cache_control_ : cache_control option)
    ?content_disposition:(content_disposition_ : content_disposition option)
    ?content_encoding:(content_encoding_ : content_encoding option)
    ?content_language:(content_language_ : content_language option)
    ?content_type:(content_type_ : content_type option) ?expires:(expires_ : expires option)
    ?grant_full_control:(grant_full_control_ : grant_full_control option)
    ?grant_read:(grant_read_ : grant_read option)
    ?grant_read_ac_p:(grant_read_ac_p_ : grant_read_ac_p option)
    ?grant_write_ac_p:(grant_write_ac_p_ : grant_write_ac_p option)
    ?metadata:(metadata_ : metadata option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?storage_class:(storage_class_ : storage_class option)
    ?website_redirect_location:(website_redirect_location_ : website_redirect_location option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?request_payer:(request_payer_ : request_payer option)
    ?tagging:(tagging_ : tagging_header option)
    ?object_lock_mode:(object_lock_mode_ : object_lock_mode option)
    ?object_lock_retain_until_date:
      (object_lock_retain_until_date_ : object_lock_retain_until_date option)
    ?object_lock_legal_hold_status:
      (object_lock_legal_hold_status_ : object_lock_legal_hold_status option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?checksum_type:(checksum_type_ : checksum_type option) ~bucket:(bucket_ : bucket_name)
    ~key:(key_ : object_key) () =
  ({
     ac_l = ac_l_;
     bucket = bucket_;
     cache_control = cache_control_;
     content_disposition = content_disposition_;
     content_encoding = content_encoding_;
     content_language = content_language_;
     content_type = content_type_;
     expires = expires_;
     grant_full_control = grant_full_control_;
     grant_read = grant_read_;
     grant_read_ac_p = grant_read_ac_p_;
     grant_write_ac_p = grant_write_ac_p_;
     key = key_;
     metadata = metadata_;
     server_side_encryption = server_side_encryption_;
     storage_class = storage_class_;
     website_redirect_location = website_redirect_location_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
     request_payer = request_payer_;
     tagging = tagging_;
     object_lock_mode = object_lock_mode_;
     object_lock_retain_until_date = object_lock_retain_until_date_;
     object_lock_legal_hold_status = object_lock_legal_hold_status_;
     expected_bucket_owner = expected_bucket_owner_;
     checksum_algorithm = checksum_algorithm_;
     checksum_type = checksum_type_;
   }
    : create_multipart_upload_request)

let make_s3_tables_destination ~table_bucket_arn:(table_bucket_arn_ : s3_tables_bucket_arn)
    ~table_name:(table_name_ : s3_tables_name) () =
  ({ table_bucket_arn = table_bucket_arn_; table_name = table_name_ } : s3_tables_destination)

let make_metadata_table_configuration
    ~s3_tables_destination:(s3_tables_destination_ : s3_tables_destination) () =
  ({ s3_tables_destination = s3_tables_destination_ } : metadata_table_configuration)

let make_create_bucket_metadata_table_configuration_request
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~metadata_table_configuration:(metadata_table_configuration_ : metadata_table_configuration) ()
    =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     metadata_table_configuration = metadata_table_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : create_bucket_metadata_table_configuration_request)

let make_annotation_table_configuration
    ?encryption_configuration:
      (encryption_configuration_ : metadata_table_encryption_configuration option)
    ?role:(role_ : role option)
    ~configuration_state:(configuration_state_ : annotation_configuration_state) () =
  ({
     configuration_state = configuration_state_;
     encryption_configuration = encryption_configuration_;
     role = role_;
   }
    : annotation_table_configuration)

let make_inventory_table_configuration
    ?encryption_configuration:
      (encryption_configuration_ : metadata_table_encryption_configuration option)
    ~configuration_state:(configuration_state_ : inventory_configuration_state) () =
  ({
     configuration_state = configuration_state_;
     encryption_configuration = encryption_configuration_;
   }
    : inventory_table_configuration)

let make_journal_table_configuration
    ?encryption_configuration:
      (encryption_configuration_ : metadata_table_encryption_configuration option)
    ~record_expiration:(record_expiration_ : record_expiration) () =
  ({ record_expiration = record_expiration_; encryption_configuration = encryption_configuration_ }
    : journal_table_configuration)

let make_metadata_configuration
    ?inventory_table_configuration:
      (inventory_table_configuration_ : inventory_table_configuration option)
    ?annotation_table_configuration:
      (annotation_table_configuration_ : annotation_table_configuration option)
    ~journal_table_configuration:(journal_table_configuration_ : journal_table_configuration) () =
  ({
     journal_table_configuration = journal_table_configuration_;
     inventory_table_configuration = inventory_table_configuration_;
     annotation_table_configuration = annotation_table_configuration_;
   }
    : metadata_configuration)

let make_create_bucket_metadata_configuration_request
    ?content_m_d5:(content_m_d5_ : content_m_d5 option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name)
    ~metadata_configuration:(metadata_configuration_ : metadata_configuration) () =
  ({
     bucket = bucket_;
     content_m_d5 = content_m_d5_;
     checksum_algorithm = checksum_algorithm_;
     metadata_configuration = metadata_configuration_;
     expected_bucket_owner = expected_bucket_owner_;
   }
    : create_bucket_metadata_configuration_request)

let make_create_bucket_output ?location:(location_ : location option)
    ?bucket_arn:(bucket_arn_ : s3_regional_or_s3_express_bucket_arn_string option) () =
  ({ location = location_; bucket_arn = bucket_arn_ } : create_bucket_output)

let make_bucket_info ?data_redundancy:(data_redundancy_ : data_redundancy option)
    ?type_:(type__ : bucket_type option) () =
  ({ data_redundancy = data_redundancy_; type_ = type__ } : bucket_info)

let make_location_info ?type_:(type__ : location_type option)
    ?name:(name_ : location_name_as_string option) () =
  ({ type_ = type__; name = name_ } : location_info)

let make_create_bucket_configuration
    ?location_constraint:(location_constraint_ : bucket_location_constraint option)
    ?location:(location_ : location_info option) ?bucket:(bucket_ : bucket_info option)
    ?tags:(tags_ : tag_set option) () =
  ({
     location_constraint = location_constraint_;
     location = location_;
     bucket = bucket_;
     tags = tags_;
   }
    : create_bucket_configuration)

let make_create_bucket_request ?ac_l:(ac_l_ : bucket_canned_ac_l option)
    ?create_bucket_configuration:(create_bucket_configuration_ : create_bucket_configuration option)
    ?grant_full_control:(grant_full_control_ : grant_full_control option)
    ?grant_read:(grant_read_ : grant_read option)
    ?grant_read_ac_p:(grant_read_ac_p_ : grant_read_ac_p option)
    ?grant_write:(grant_write_ : grant_write option)
    ?grant_write_ac_p:(grant_write_ac_p_ : grant_write_ac_p option)
    ?object_lock_enabled_for_bucket:
      (object_lock_enabled_for_bucket_ : object_lock_enabled_for_bucket option)
    ?object_ownership:(object_ownership_ : object_ownership option)
    ?bucket_namespace:(bucket_namespace_ : bucket_namespace option) ~bucket:(bucket_ : bucket_name)
    () =
  ({
     ac_l = ac_l_;
     bucket = bucket_;
     create_bucket_configuration = create_bucket_configuration_;
     grant_full_control = grant_full_control_;
     grant_read = grant_read_;
     grant_read_ac_p = grant_read_ac_p_;
     grant_write = grant_write_;
     grant_write_ac_p = grant_write_ac_p_;
     object_lock_enabled_for_bucket = object_lock_enabled_for_bucket_;
     object_ownership = object_ownership_;
     bucket_namespace = bucket_namespace_;
   }
    : create_bucket_request)

let make_copy_object_output ?copy_object_result:(copy_object_result_ : copy_object_result option)
    ?expiration:(expiration_ : expiration option)
    ?copy_source_version_id:(copy_source_version_id_ : copy_source_version_id option)
    ?version_id:(version_id_ : object_version_id option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     copy_object_result = copy_object_result_;
     expiration = expiration_;
     copy_source_version_id = copy_source_version_id_;
     version_id = version_id_;
     server_side_encryption = server_side_encryption_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
     request_charged = request_charged_;
   }
    : copy_object_output)

let make_copy_object_request ?ac_l:(ac_l_ : object_canned_ac_l option)
    ?cache_control:(cache_control_ : cache_control option)
    ?checksum_algorithm:(checksum_algorithm_ : checksum_algorithm option)
    ?content_disposition:(content_disposition_ : content_disposition option)
    ?content_encoding:(content_encoding_ : content_encoding option)
    ?content_language:(content_language_ : content_language option)
    ?content_type:(content_type_ : content_type option)
    ?copy_source_if_match:(copy_source_if_match_ : copy_source_if_match option)
    ?copy_source_if_modified_since:
      (copy_source_if_modified_since_ : copy_source_if_modified_since option)
    ?copy_source_if_none_match:(copy_source_if_none_match_ : copy_source_if_none_match option)
    ?copy_source_if_unmodified_since:
      (copy_source_if_unmodified_since_ : copy_source_if_unmodified_since option)
    ?expires:(expires_ : expires option)
    ?grant_full_control:(grant_full_control_ : grant_full_control option)
    ?grant_read:(grant_read_ : grant_read option)
    ?grant_read_ac_p:(grant_read_ac_p_ : grant_read_ac_p option)
    ?grant_write_ac_p:(grant_write_ac_p_ : grant_write_ac_p option)
    ?if_match:(if_match_ : if_match option) ?if_none_match:(if_none_match_ : if_none_match option)
    ?metadata:(metadata_ : metadata option)
    ?metadata_directive:(metadata_directive_ : metadata_directive option)
    ?tagging_directive:(tagging_directive_ : tagging_directive option)
    ?annotation_directive:(annotation_directive_ : annotation_directive option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?storage_class:(storage_class_ : storage_class option)
    ?website_redirect_location:(website_redirect_location_ : website_redirect_location option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?ssekms_encryption_context:(ssekms_encryption_context_ : ssekms_encryption_context option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?copy_source_sse_customer_algorithm:
      (copy_source_sse_customer_algorithm_ : copy_source_sse_customer_algorithm option)
    ?copy_source_sse_customer_key:
      (copy_source_sse_customer_key_ : copy_source_sse_customer_key option)
    ?copy_source_sse_customer_key_m_d5:
      (copy_source_sse_customer_key_m_d5_ : copy_source_sse_customer_key_m_d5 option)
    ?request_payer:(request_payer_ : request_payer option)
    ?tagging:(tagging_ : tagging_header option)
    ?object_lock_mode:(object_lock_mode_ : object_lock_mode option)
    ?object_lock_retain_until_date:
      (object_lock_retain_until_date_ : object_lock_retain_until_date option)
    ?object_lock_legal_hold_status:
      (object_lock_legal_hold_status_ : object_lock_legal_hold_status option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?expected_source_bucket_owner:(expected_source_bucket_owner_ : account_id option)
    ~bucket:(bucket_ : bucket_name) ~copy_source:(copy_source_ : copy_source)
    ~key:(key_ : object_key) () =
  ({
     ac_l = ac_l_;
     bucket = bucket_;
     cache_control = cache_control_;
     checksum_algorithm = checksum_algorithm_;
     content_disposition = content_disposition_;
     content_encoding = content_encoding_;
     content_language = content_language_;
     content_type = content_type_;
     copy_source = copy_source_;
     copy_source_if_match = copy_source_if_match_;
     copy_source_if_modified_since = copy_source_if_modified_since_;
     copy_source_if_none_match = copy_source_if_none_match_;
     copy_source_if_unmodified_since = copy_source_if_unmodified_since_;
     expires = expires_;
     grant_full_control = grant_full_control_;
     grant_read = grant_read_;
     grant_read_ac_p = grant_read_ac_p_;
     grant_write_ac_p = grant_write_ac_p_;
     if_match = if_match_;
     if_none_match = if_none_match_;
     key = key_;
     metadata = metadata_;
     metadata_directive = metadata_directive_;
     tagging_directive = tagging_directive_;
     annotation_directive = annotation_directive_;
     server_side_encryption = server_side_encryption_;
     storage_class = storage_class_;
     website_redirect_location = website_redirect_location_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
     ssekms_key_id = ssekms_key_id_;
     ssekms_encryption_context = ssekms_encryption_context_;
     bucket_key_enabled = bucket_key_enabled_;
     copy_source_sse_customer_algorithm = copy_source_sse_customer_algorithm_;
     copy_source_sse_customer_key = copy_source_sse_customer_key_;
     copy_source_sse_customer_key_m_d5 = copy_source_sse_customer_key_m_d5_;
     request_payer = request_payer_;
     tagging = tagging_;
     object_lock_mode = object_lock_mode_;
     object_lock_retain_until_date = object_lock_retain_until_date_;
     object_lock_legal_hold_status = object_lock_legal_hold_status_;
     expected_bucket_owner = expected_bucket_owner_;
     expected_source_bucket_owner = expected_source_bucket_owner_;
   }
    : copy_object_request)

let make_complete_multipart_upload_output ?location:(location_ : location option)
    ?bucket:(bucket_ : bucket_name option) ?key:(key_ : object_key option)
    ?expiration:(expiration_ : expiration option) ?e_tag:(e_tag_ : e_tag option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option)
    ?server_side_encryption:(server_side_encryption_ : server_side_encryption option)
    ?version_id:(version_id_ : object_version_id option)
    ?ssekms_key_id:(ssekms_key_id_ : ssekms_key_id option)
    ?bucket_key_enabled:(bucket_key_enabled_ : bucket_key_enabled option)
    ?request_charged:(request_charged_ : request_charged option) () =
  ({
     location = location_;
     bucket = bucket_;
     key = key_;
     expiration = expiration_;
     e_tag = e_tag_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
     server_side_encryption = server_side_encryption_;
     version_id = version_id_;
     ssekms_key_id = ssekms_key_id_;
     bucket_key_enabled = bucket_key_enabled_;
     request_charged = request_charged_;
   }
    : complete_multipart_upload_output)

let make_completed_part ?e_tag:(e_tag_ : e_tag option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?part_number:(part_number_ : part_number option) () =
  ({
     e_tag = e_tag_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     part_number = part_number_;
   }
    : completed_part)

let make_completed_multipart_upload ?parts:(parts_ : completed_part_list option) () =
  ({ parts = parts_ } : completed_multipart_upload)

let make_complete_multipart_upload_request
    ?multipart_upload:(multipart_upload_ : completed_multipart_upload option)
    ?checksum_cr_c32:(checksum_cr_c32_ : checksum_cr_c32 option)
    ?checksum_crc32_c:(checksum_crc32_c_ : checksum_crc32_c option)
    ?checksum_crc64nvm_e:(checksum_crc64nvm_e_ : checksum_crc64nvm_e option)
    ?checksum_sh_a1:(checksum_sh_a1_ : checksum_sh_a1 option)
    ?checksum_sh_a256:(checksum_sh_a256_ : checksum_sh_a256 option)
    ?checksum_sh_a512:(checksum_sh_a512_ : checksum_sh_a512 option)
    ?checksum_m_d5:(checksum_m_d5_ : checksum_m_d5 option)
    ?checksum_xxhas_h64:(checksum_xxhas_h64_ : checksum_xxhas_h64 option)
    ?checksum_xxhas_h3:(checksum_xxhas_h3_ : checksum_xxhas_h3 option)
    ?checksum_xxhas_h128:(checksum_xxhas_h128_ : checksum_xxhas_h128 option)
    ?checksum_type:(checksum_type_ : checksum_type option)
    ?mpu_object_size:(mpu_object_size_ : mpu_object_size option)
    ?request_payer:(request_payer_ : request_payer option)
    ?expected_bucket_owner:(expected_bucket_owner_ : account_id option)
    ?if_match:(if_match_ : if_match option) ?if_none_match:(if_none_match_ : if_none_match option)
    ?sse_customer_algorithm:(sse_customer_algorithm_ : sse_customer_algorithm option)
    ?sse_customer_key:(sse_customer_key_ : sse_customer_key option)
    ?sse_customer_key_m_d5:(sse_customer_key_m_d5_ : sse_customer_key_m_d5 option)
    ~bucket:(bucket_ : bucket_name) ~key:(key_ : object_key)
    ~upload_id:(upload_id_ : multipart_upload_id) () =
  ({
     bucket = bucket_;
     key = key_;
     multipart_upload = multipart_upload_;
     upload_id = upload_id_;
     checksum_cr_c32 = checksum_cr_c32_;
     checksum_crc32_c = checksum_crc32_c_;
     checksum_crc64nvm_e = checksum_crc64nvm_e_;
     checksum_sh_a1 = checksum_sh_a1_;
     checksum_sh_a256 = checksum_sh_a256_;
     checksum_sh_a512 = checksum_sh_a512_;
     checksum_m_d5 = checksum_m_d5_;
     checksum_xxhas_h64 = checksum_xxhas_h64_;
     checksum_xxhas_h3 = checksum_xxhas_h3_;
     checksum_xxhas_h128 = checksum_xxhas_h128_;
     checksum_type = checksum_type_;
     mpu_object_size = mpu_object_size_;
     request_payer = request_payer_;
     expected_bucket_owner = expected_bucket_owner_;
     if_match = if_match_;
     if_none_match = if_none_match_;
     sse_customer_algorithm = sse_customer_algorithm_;
     sse_customer_key = sse_customer_key_;
     sse_customer_key_m_d5 = sse_customer_key_m_d5_;
   }
    : complete_multipart_upload_request)
