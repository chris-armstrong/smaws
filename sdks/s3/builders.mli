open Types

val make_abac_status : ?status:bucket_abac_status -> unit -> abac_status

val make_abort_incomplete_multipart_upload :
  ?days_after_initiation:days_after_initiation -> unit -> abort_incomplete_multipart_upload

val make_abort_multipart_upload_output :
  ?request_charged:request_charged -> unit -> abort_multipart_upload_output

val make_abort_multipart_upload_request :
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?if_match_initiated_time:if_match_initiated_time ->
  bucket:bucket_name ->
  key:object_key ->
  upload_id:multipart_upload_id ->
  unit ->
  abort_multipart_upload_request

val make_accelerate_configuration :
  ?status:bucket_accelerate_status -> unit -> accelerate_configuration

val make_owner : ?display_name:display_name -> ?i_d:i_d -> unit -> owner

val make_grantee :
  ?display_name:display_name ->
  ?email_address:email_address ->
  ?i_d:i_d ->
  ?ur_i:ur_i ->
  type_:type_ ->
  unit ->
  grantee

val make_grant : ?grantee:grantee -> ?permission:permission -> unit -> grant
val make_access_control_policy : ?grants:grants -> ?owner:owner -> unit -> access_control_policy
val make_access_control_translation : owner:owner_override -> unit -> access_control_translation

val make_write_get_object_response_request :
  ?body:streaming_blob ->
  ?status_code:get_object_response_status_code ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  ?accept_ranges:accept_ranges ->
  ?cache_control:cache_control ->
  ?content_disposition:content_disposition ->
  ?content_encoding:content_encoding ->
  ?content_language:content_language ->
  ?content_length:content_length ->
  ?content_range:content_range ->
  ?content_type:content_type ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?delete_marker:delete_marker ->
  ?e_tag:e_tag ->
  ?expires:expires ->
  ?expiration:expiration ->
  ?last_modified:last_modified ->
  ?missing_meta:missing_meta ->
  ?metadata:metadata ->
  ?object_lock_mode:object_lock_mode ->
  ?object_lock_legal_hold_status:object_lock_legal_hold_status ->
  ?object_lock_retain_until_date:object_lock_retain_until_date ->
  ?parts_count:parts_count ->
  ?replication_status:replication_status ->
  ?request_charged:request_charged ->
  ?restore:restore ->
  ?server_side_encryption:server_side_encryption ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?ssekms_key_id:ssekms_key_id ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?storage_class:storage_class ->
  ?tag_count:tag_count ->
  ?version_id:object_version_id ->
  ?bucket_key_enabled:bucket_key_enabled ->
  request_route:request_route ->
  request_token:request_token ->
  unit ->
  write_get_object_response_request

val make_upload_part_copy_output :
  ?copy_source_version_id:copy_source_version_id ->
  ?copy_part_result:copy_part_result ->
  ?server_side_encryption:server_side_encryption ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?request_charged:request_charged ->
  unit ->
  upload_part_copy_output

val make_upload_part_copy_request :
  ?copy_source_if_match:copy_source_if_match ->
  ?copy_source_if_modified_since:copy_source_if_modified_since ->
  ?copy_source_if_none_match:copy_source_if_none_match ->
  ?copy_source_if_unmodified_since:copy_source_if_unmodified_since ->
  ?copy_source_range:copy_source_range ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?copy_source_sse_customer_algorithm:copy_source_sse_customer_algorithm ->
  ?copy_source_sse_customer_key:copy_source_sse_customer_key ->
  ?copy_source_sse_customer_key_m_d5:copy_source_sse_customer_key_m_d5 ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?expected_source_bucket_owner:account_id ->
  bucket:bucket_name ->
  copy_source:copy_source ->
  key:object_key ->
  part_number:part_number ->
  upload_id:multipart_upload_id ->
  unit ->
  upload_part_copy_request

val make_upload_part_output :
  ?server_side_encryption:server_side_encryption ->
  ?e_tag:e_tag ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?request_charged:request_charged ->
  unit ->
  upload_part_output

val make_upload_part_request :
  ?body:streaming_blob ->
  ?content_length:content_length ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  part_number:part_number ->
  upload_id:multipart_upload_id ->
  unit ->
  upload_part_request

val make_update_object_encryption_response :
  ?request_charged:request_charged -> unit -> update_object_encryption_response

val make_ssekms_encryption :
  ?bucket_key_enabled:bucket_key_enabled ->
  kms_key_arn:non_empty_kms_key_arn_string ->
  unit ->
  ssekms_encryption

val make_update_object_encryption_request :
  ?version_id:object_version_id ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  bucket:bucket_name ->
  key:object_key ->
  object_encryption:object_encryption ->
  unit ->
  update_object_encryption_request

val make_record_expiration :
  ?days:record_expiration_days -> expiration:expiration_state -> unit -> record_expiration

val make_journal_table_configuration_updates :
  record_expiration:record_expiration -> unit -> journal_table_configuration_updates

val make_update_bucket_metadata_journal_table_configuration_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  journal_table_configuration:journal_table_configuration_updates ->
  unit ->
  update_bucket_metadata_journal_table_configuration_request

val make_metadata_table_encryption_configuration :
  ?kms_key_arn:kms_key_arn ->
  sse_algorithm:table_sse_algorithm ->
  unit ->
  metadata_table_encryption_configuration

val make_inventory_table_configuration_updates :
  ?encryption_configuration:metadata_table_encryption_configuration ->
  configuration_state:inventory_configuration_state ->
  unit ->
  inventory_table_configuration_updates

val make_update_bucket_metadata_inventory_table_configuration_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  inventory_table_configuration:inventory_table_configuration_updates ->
  unit ->
  update_bucket_metadata_inventory_table_configuration_request

val make_annotation_table_configuration_updates :
  ?encryption_configuration:metadata_table_encryption_configuration ->
  ?role:role ->
  configuration_state:annotation_configuration_state ->
  unit ->
  annotation_table_configuration_updates

val make_update_bucket_metadata_annotation_table_configuration_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  annotation_table_configuration:annotation_table_configuration_updates ->
  unit ->
  update_bucket_metadata_annotation_table_configuration_request

val make_end_event : unit -> unit
val make_continuation_event : unit -> unit

val make_progress :
  ?bytes_scanned:bytes_scanned ->
  ?bytes_processed:bytes_processed ->
  ?bytes_returned:bytes_returned ->
  unit ->
  progress

val make_progress_event : ?details:progress -> unit -> progress_event

val make_stats :
  ?bytes_scanned:bytes_scanned ->
  ?bytes_processed:bytes_processed ->
  ?bytes_returned:bytes_returned ->
  unit ->
  stats

val make_stats_event : ?details:stats -> unit -> stats_event
val make_records_event : ?payload:body -> unit -> records_event

val make_select_object_content_output :
  ?payload:select_object_content_event_stream -> unit -> select_object_content_output

val make_scan_range : ?start:start -> ?end_:end_ -> unit -> scan_range
val make_json_output : ?record_delimiter:record_delimiter -> unit -> json_output

val make_csv_output :
  ?quote_fields:quote_fields ->
  ?quote_escape_character:quote_escape_character ->
  ?record_delimiter:record_delimiter ->
  ?field_delimiter:field_delimiter ->
  ?quote_character:quote_character ->
  unit ->
  csv_output

val make_output_serialization :
  ?cs_v:csv_output -> ?jso_n:json_output -> unit -> output_serialization

val make_parquet_input : unit -> unit
val make_json_input : ?type_:json_type -> unit -> json_input

val make_csv_input :
  ?file_header_info:file_header_info ->
  ?comments:comments ->
  ?quote_escape_character:quote_escape_character ->
  ?record_delimiter:record_delimiter ->
  ?field_delimiter:field_delimiter ->
  ?quote_character:quote_character ->
  ?allow_quoted_record_delimiter:allow_quoted_record_delimiter ->
  unit ->
  csv_input

val make_input_serialization :
  ?cs_v:csv_input ->
  ?compression_type:compression_type ->
  ?jso_n:json_input ->
  ?parquet:parquet_input ->
  unit ->
  input_serialization

val make_request_progress : ?enabled:enable_request_progress -> unit -> request_progress

val make_select_object_content_request :
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?request_progress:request_progress ->
  ?scan_range:scan_range ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  expression:expression ->
  expression_type:expression_type ->
  input_serialization:input_serialization ->
  output_serialization:output_serialization ->
  unit ->
  select_object_content_request

val make_restore_object_output :
  ?request_charged:request_charged ->
  ?restore_output_path:restore_output_path ->
  unit ->
  restore_object_output

val make_metadata_entry : ?name:metadata_key -> ?value:metadata_value -> unit -> metadata_entry
val make_tag : key:object_key -> value:value -> unit -> tag
val make_tagging : tag_set:tag_set -> unit -> tagging

val make_encryption :
  ?kms_key_id:ssekms_key_id ->
  ?kms_context:kms_context ->
  encryption_type:server_side_encryption ->
  unit ->
  encryption

val make_s3_location :
  ?encryption:encryption ->
  ?canned_ac_l:object_canned_ac_l ->
  ?access_control_list:grants ->
  ?tagging:tagging ->
  ?user_metadata:user_metadata ->
  ?storage_class:storage_class ->
  bucket_name:bucket_name ->
  prefix:location_prefix ->
  unit ->
  s3_location

val make_output_location : ?s3:s3_location -> unit -> output_location

val make_select_parameters :
  input_serialization:input_serialization ->
  expression_type:expression_type ->
  expression:expression ->
  output_serialization:output_serialization ->
  unit ->
  select_parameters

val make_glacier_job_parameters : tier:tier -> unit -> glacier_job_parameters

val make_restore_request :
  ?days:days ->
  ?glacier_job_parameters:glacier_job_parameters ->
  ?type_:restore_request_type ->
  ?tier:tier ->
  ?description:description ->
  ?select_parameters:select_parameters ->
  ?output_location:output_location ->
  unit ->
  restore_request

val make_restore_object_request :
  ?version_id:object_version_id ->
  ?restore_request:restore_request ->
  ?request_payer:request_payer ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  restore_object_request

val make_rename_object_output : unit -> unit

val make_rename_object_request :
  ?destination_if_match:if_match ->
  ?destination_if_none_match:if_none_match ->
  ?destination_if_modified_since:if_modified_since ->
  ?destination_if_unmodified_since:if_unmodified_since ->
  ?source_if_match:rename_source_if_match ->
  ?source_if_none_match:rename_source_if_none_match ->
  ?source_if_modified_since:rename_source_if_modified_since ->
  ?source_if_unmodified_since:rename_source_if_unmodified_since ->
  ?client_token:client_token ->
  bucket:bucket_name ->
  key:object_key ->
  rename_source:rename_source ->
  unit ->
  rename_object_request

val make_public_access_block_configuration :
  ?block_public_acls:setting ->
  ?ignore_public_acls:setting ->
  ?block_public_policy:setting ->
  ?restrict_public_buckets:setting ->
  unit ->
  public_access_block_configuration

val make_put_public_access_block_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  public_access_block_configuration:public_access_block_configuration ->
  unit ->
  put_public_access_block_request

val make_put_object_tagging_output :
  ?version_id:object_version_id -> unit -> put_object_tagging_output

val make_put_object_tagging_request :
  ?version_id:object_version_id ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  ?request_payer:request_payer ->
  bucket:bucket_name ->
  key:object_key ->
  tagging:tagging ->
  unit ->
  put_object_tagging_request

val make_put_object_retention_output :
  ?request_charged:request_charged -> unit -> put_object_retention_output

val make_object_lock_retention :
  ?mode:object_lock_retention_mode -> ?retain_until_date:date -> unit -> object_lock_retention

val make_put_object_retention_request :
  ?retention:object_lock_retention ->
  ?request_payer:request_payer ->
  ?version_id:object_version_id ->
  ?bypass_governance_retention:bypass_governance_retention ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  put_object_retention_request

val make_put_object_lock_configuration_output :
  ?request_charged:request_charged -> unit -> put_object_lock_configuration_output

val make_default_retention :
  ?mode:object_lock_retention_mode -> ?days:days -> ?years:years -> unit -> default_retention

val make_object_lock_rule : ?default_retention:default_retention -> unit -> object_lock_rule

val make_object_lock_configuration :
  ?object_lock_enabled:object_lock_enabled ->
  ?rule:object_lock_rule ->
  unit ->
  object_lock_configuration

val make_put_object_lock_configuration_request :
  ?object_lock_configuration:object_lock_configuration ->
  ?request_payer:request_payer ->
  ?token:object_lock_token ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  put_object_lock_configuration_request

val make_put_object_legal_hold_output :
  ?request_charged:request_charged -> unit -> put_object_legal_hold_output

val make_object_lock_legal_hold :
  ?status:object_lock_legal_hold_status -> unit -> object_lock_legal_hold

val make_put_object_legal_hold_request :
  ?legal_hold:object_lock_legal_hold ->
  ?request_payer:request_payer ->
  ?version_id:object_version_id ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  put_object_legal_hold_request

val make_put_object_annotation_output :
  ?key:object_key ->
  ?annotation_name:annotation_name ->
  ?object_version_id:object_version_id ->
  ?e_tag:e_tag ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  ?server_side_encryption:server_side_encryption ->
  ?request_charged:request_charged ->
  unit ->
  put_object_annotation_output

val make_put_object_annotation_request :
  ?version_id:object_version_id ->
  ?object_if_match:object_if_match ->
  ?checksum_algorithm:checksum_algorithm ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?content_m_d5:content_m_d5 ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  annotation_name:annotation_name ->
  annotation_payload:streaming_blob ->
  unit ->
  put_object_annotation_request

val make_put_object_acl_output : ?request_charged:request_charged -> unit -> put_object_acl_output

val make_put_object_acl_request :
  ?ac_l:object_canned_ac_l ->
  ?access_control_policy:access_control_policy ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?grant_full_control:grant_full_control ->
  ?grant_read:grant_read ->
  ?grant_read_ac_p:grant_read_ac_p ->
  ?grant_write:grant_write ->
  ?grant_write_ac_p:grant_write_ac_p ->
  ?request_payer:request_payer ->
  ?version_id:object_version_id ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  put_object_acl_request

val make_put_object_output :
  ?expiration:expiration ->
  ?e_tag:e_tag ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  ?server_side_encryption:server_side_encryption ->
  ?version_id:object_version_id ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?size:size ->
  ?request_charged:request_charged ->
  unit ->
  put_object_output

val make_put_object_request :
  ?ac_l:object_canned_ac_l ->
  ?body:streaming_blob ->
  ?cache_control:cache_control ->
  ?content_disposition:content_disposition ->
  ?content_encoding:content_encoding ->
  ?content_language:content_language ->
  ?content_length:content_length ->
  ?content_m_d5:content_m_d5 ->
  ?content_type:content_type ->
  ?checksum_algorithm:checksum_algorithm ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?expires:expires ->
  ?if_match:if_match ->
  ?if_none_match:if_none_match ->
  ?grant_full_control:grant_full_control ->
  ?grant_read:grant_read ->
  ?grant_read_ac_p:grant_read_ac_p ->
  ?grant_write_ac_p:grant_write_ac_p ->
  ?write_offset_bytes:write_offset_bytes ->
  ?metadata:metadata ->
  ?server_side_encryption:server_side_encryption ->
  ?storage_class:storage_class ->
  ?website_redirect_location:website_redirect_location ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?request_payer:request_payer ->
  ?tagging:tagging_header ->
  ?object_lock_mode:object_lock_mode ->
  ?object_lock_retain_until_date:object_lock_retain_until_date ->
  ?object_lock_legal_hold_status:object_lock_legal_hold_status ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  put_object_request

val make_redirect :
  ?host_name:host_name ->
  ?http_redirect_code:http_redirect_code ->
  ?protocol:protocol ->
  ?replace_key_prefix_with:replace_key_prefix_with ->
  ?replace_key_with:replace_key_with ->
  unit ->
  redirect

val make_condition :
  ?http_error_code_returned_equals:http_error_code_returned_equals ->
  ?key_prefix_equals:key_prefix_equals ->
  unit ->
  condition

val make_routing_rule : ?condition:condition -> redirect:redirect -> unit -> routing_rule

val make_redirect_all_requests_to :
  ?protocol:protocol -> host_name:host_name -> unit -> redirect_all_requests_to

val make_index_document : suffix:suffix -> unit -> index_document
val make_error_document : key:object_key -> unit -> error_document

val make_website_configuration :
  ?error_document:error_document ->
  ?index_document:index_document ->
  ?redirect_all_requests_to:redirect_all_requests_to ->
  ?routing_rules:routing_rules ->
  unit ->
  website_configuration

val make_put_bucket_website_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  website_configuration:website_configuration ->
  unit ->
  put_bucket_website_request

val make_versioning_configuration :
  ?mfa_delete:mfa_delete -> ?status:bucket_versioning_status -> unit -> versioning_configuration

val make_put_bucket_versioning_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?mf_a:mf_a ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  versioning_configuration:versioning_configuration ->
  unit ->
  put_bucket_versioning_request

val make_put_bucket_tagging_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  tagging:tagging ->
  unit ->
  put_bucket_tagging_request

val make_request_payment_configuration : payer:payer -> unit -> request_payment_configuration

val make_put_bucket_request_payment_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  request_payment_configuration:request_payment_configuration ->
  unit ->
  put_bucket_request_payment_request

val make_delete_marker_replication :
  ?status:delete_marker_replication_status -> unit -> delete_marker_replication

val make_replication_time_value : ?minutes:minutes -> unit -> replication_time_value

val make_metrics :
  ?event_threshold:replication_time_value -> status:metrics_status -> unit -> metrics

val make_replication_time :
  status:replication_time_status -> time:replication_time_value -> unit -> replication_time

val make_encryption_configuration :
  ?replica_kms_key_i_d:replica_kms_key_i_d -> unit -> encryption_configuration

val make_destination :
  ?account:account_id ->
  ?storage_class:storage_class ->
  ?access_control_translation:access_control_translation ->
  ?encryption_configuration:encryption_configuration ->
  ?replication_time:replication_time ->
  ?metrics:metrics ->
  bucket:bucket_name ->
  unit ->
  destination

val make_existing_object_replication :
  status:existing_object_replication_status -> unit -> existing_object_replication

val make_replica_modifications :
  status:replica_modifications_status -> unit -> replica_modifications

val make_sse_kms_encrypted_objects :
  status:sse_kms_encrypted_objects_status -> unit -> sse_kms_encrypted_objects

val make_source_selection_criteria :
  ?sse_kms_encrypted_objects:sse_kms_encrypted_objects ->
  ?replica_modifications:replica_modifications ->
  unit ->
  source_selection_criteria

val make_replication_rule_and_operator :
  ?prefix:prefix -> ?tags:tag_set -> unit -> replication_rule_and_operator

val make_replication_rule_filter :
  ?prefix:prefix ->
  ?tag:tag ->
  ?and_:replication_rule_and_operator ->
  unit ->
  replication_rule_filter

val make_replication_rule :
  ?i_d:i_d ->
  ?priority:priority ->
  ?prefix:prefix ->
  ?filter:replication_rule_filter ->
  ?source_selection_criteria:source_selection_criteria ->
  ?existing_object_replication:existing_object_replication ->
  ?delete_marker_replication:delete_marker_replication ->
  status:replication_rule_status ->
  destination:destination ->
  unit ->
  replication_rule

val make_replication_configuration :
  role:role -> rules:replication_rules -> unit -> replication_configuration

val make_put_bucket_replication_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?token:object_lock_token ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  replication_configuration:replication_configuration ->
  unit ->
  put_bucket_replication_request

val make_put_bucket_policy_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?confirm_remove_self_bucket_access:confirm_remove_self_bucket_access ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  policy:policy ->
  unit ->
  put_bucket_policy_request

val make_ownership_controls_rule :
  object_ownership:object_ownership -> unit -> ownership_controls_rule

val make_ownership_controls : rules:ownership_controls_rules -> unit -> ownership_controls

val make_put_bucket_ownership_controls_request :
  ?content_m_d5:content_m_d5 ->
  ?expected_bucket_owner:account_id ->
  ?checksum_algorithm:checksum_algorithm ->
  bucket:bucket_name ->
  ownership_controls:ownership_controls ->
  unit ->
  put_bucket_ownership_controls_request

val make_event_bridge_configuration : unit -> unit
val make_filter_rule : ?name:filter_rule_name -> ?value:filter_rule_value -> unit -> filter_rule
val make_s3_key_filter : ?filter_rules:filter_rule_list -> unit -> s3_key_filter

val make_notification_configuration_filter :
  ?key:s3_key_filter -> unit -> notification_configuration_filter

val make_lambda_function_configuration :
  ?id:notification_id ->
  ?filter:notification_configuration_filter ->
  lambda_function_arn:lambda_function_arn ->
  events:event_list ->
  unit ->
  lambda_function_configuration

val make_queue_configuration :
  ?id:notification_id ->
  ?filter:notification_configuration_filter ->
  queue_arn:queue_arn ->
  events:event_list ->
  unit ->
  queue_configuration

val make_topic_configuration :
  ?id:notification_id ->
  ?filter:notification_configuration_filter ->
  topic_arn:topic_arn ->
  events:event_list ->
  unit ->
  topic_configuration

val make_notification_configuration :
  ?topic_configurations:topic_configuration_list ->
  ?queue_configurations:queue_configuration_list ->
  ?lambda_function_configurations:lambda_function_configuration_list ->
  ?event_bridge_configuration:event_bridge_configuration ->
  unit ->
  notification_configuration

val make_put_bucket_notification_configuration_request :
  ?expected_bucket_owner:account_id ->
  ?skip_destination_validation:skip_validation ->
  bucket:bucket_name ->
  notification_configuration:notification_configuration ->
  unit ->
  put_bucket_notification_configuration_request

val make_metrics_and_operator :
  ?prefix:prefix ->
  ?tags:tag_set ->
  ?access_point_arn:access_point_arn ->
  unit ->
  metrics_and_operator

val make_metrics_configuration :
  ?filter:metrics_filter -> id:metrics_id -> unit -> metrics_configuration

val make_put_bucket_metrics_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:metrics_id ->
  metrics_configuration:metrics_configuration ->
  unit ->
  put_bucket_metrics_configuration_request

val make_partitioned_prefix :
  ?partition_date_source:partition_date_source -> unit -> partitioned_prefix

val make_simple_prefix : unit -> unit

val make_target_object_key_format :
  ?simple_prefix:simple_prefix ->
  ?partitioned_prefix:partitioned_prefix ->
  unit ->
  target_object_key_format

val make_target_grant :
  ?grantee:grantee -> ?permission:bucket_logs_permission -> unit -> target_grant

val make_logging_enabled :
  ?target_grants:target_grants ->
  ?target_object_key_format:target_object_key_format ->
  target_bucket:target_bucket ->
  target_prefix:target_prefix ->
  unit ->
  logging_enabled

val make_bucket_logging_status : ?logging_enabled:logging_enabled -> unit -> bucket_logging_status

val make_put_bucket_logging_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  bucket_logging_status:bucket_logging_status ->
  unit ->
  put_bucket_logging_request

val make_put_bucket_lifecycle_configuration_output :
  ?transition_default_minimum_object_size:transition_default_minimum_object_size ->
  unit ->
  put_bucket_lifecycle_configuration_output

val make_noncurrent_version_expiration :
  ?noncurrent_days:days ->
  ?newer_noncurrent_versions:version_count ->
  unit ->
  noncurrent_version_expiration

val make_noncurrent_version_transition :
  ?noncurrent_days:days ->
  ?storage_class:transition_storage_class ->
  ?newer_noncurrent_versions:version_count ->
  unit ->
  noncurrent_version_transition

val make_transition :
  ?date:date -> ?days:days -> ?storage_class:transition_storage_class -> unit -> transition

val make_lifecycle_rule_and_operator :
  ?prefix:prefix ->
  ?tags:tag_set ->
  ?object_size_greater_than:object_size_greater_than_bytes ->
  ?object_size_less_than:object_size_less_than_bytes ->
  unit ->
  lifecycle_rule_and_operator

val make_lifecycle_rule_filter :
  ?prefix:prefix ->
  ?tag:tag ->
  ?object_size_greater_than:object_size_greater_than_bytes ->
  ?object_size_less_than:object_size_less_than_bytes ->
  ?and_:lifecycle_rule_and_operator ->
  unit ->
  lifecycle_rule_filter

val make_lifecycle_expiration :
  ?date:date ->
  ?days:days ->
  ?expired_object_delete_marker:expired_object_delete_marker ->
  unit ->
  lifecycle_expiration

val make_lifecycle_rule :
  ?expiration:lifecycle_expiration ->
  ?i_d:i_d ->
  ?prefix:prefix ->
  ?filter:lifecycle_rule_filter ->
  ?transitions:transition_list ->
  ?noncurrent_version_transitions:noncurrent_version_transition_list ->
  ?noncurrent_version_expiration:noncurrent_version_expiration ->
  ?abort_incomplete_multipart_upload:abort_incomplete_multipart_upload ->
  status:expiration_status ->
  unit ->
  lifecycle_rule

val make_bucket_lifecycle_configuration :
  rules:lifecycle_rules -> unit -> bucket_lifecycle_configuration

val make_put_bucket_lifecycle_configuration_request :
  ?checksum_algorithm:checksum_algorithm ->
  ?lifecycle_configuration:bucket_lifecycle_configuration ->
  ?expected_bucket_owner:account_id ->
  ?transition_default_minimum_object_size:transition_default_minimum_object_size ->
  bucket:bucket_name ->
  unit ->
  put_bucket_lifecycle_configuration_request

val make_inventory_schedule : frequency:inventory_frequency -> unit -> inventory_schedule
val make_inventory_filter : prefix:prefix -> unit -> inventory_filter
val make_ssekm_s : key_id:ssekms_key_id -> unit -> ssekm_s
val make_sse_s3 : unit -> unit
val make_inventory_encryption : ?sse_s3:sse_s3 -> ?ssekm_s:ssekm_s -> unit -> inventory_encryption

val make_inventory_s3_bucket_destination :
  ?account_id:account_id ->
  ?prefix:prefix ->
  ?encryption:inventory_encryption ->
  bucket:bucket_name ->
  format:inventory_format ->
  unit ->
  inventory_s3_bucket_destination

val make_inventory_destination :
  s3_bucket_destination:inventory_s3_bucket_destination -> unit -> inventory_destination

val make_inventory_configuration :
  ?filter:inventory_filter ->
  ?optional_fields:inventory_optional_fields ->
  destination:inventory_destination ->
  is_enabled:is_enabled ->
  id:inventory_id ->
  included_object_versions:inventory_included_object_versions ->
  schedule:inventory_schedule ->
  unit ->
  inventory_configuration

val make_put_bucket_inventory_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:inventory_id ->
  inventory_configuration:inventory_configuration ->
  unit ->
  put_bucket_inventory_configuration_request

val make_tiering :
  days:intelligent_tiering_days -> access_tier:intelligent_tiering_access_tier -> unit -> tiering

val make_intelligent_tiering_and_operator :
  ?prefix:prefix -> ?tags:tag_set -> unit -> intelligent_tiering_and_operator

val make_intelligent_tiering_filter :
  ?prefix:prefix ->
  ?tag:tag ->
  ?and_:intelligent_tiering_and_operator ->
  unit ->
  intelligent_tiering_filter

val make_intelligent_tiering_configuration :
  ?filter:intelligent_tiering_filter ->
  id:intelligent_tiering_id ->
  status:intelligent_tiering_status ->
  tierings:tiering_list ->
  unit ->
  intelligent_tiering_configuration

val make_put_bucket_intelligent_tiering_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:intelligent_tiering_id ->
  intelligent_tiering_configuration:intelligent_tiering_configuration ->
  unit ->
  put_bucket_intelligent_tiering_configuration_request

val make_blocked_encryption_types :
  ?encryption_type:encryption_type_list -> unit -> blocked_encryption_types

val make_server_side_encryption_by_default :
  ?kms_master_key_i_d:ssekms_key_id ->
  sse_algorithm:server_side_encryption ->
  unit ->
  server_side_encryption_by_default

val make_server_side_encryption_rule :
  ?apply_server_side_encryption_by_default:server_side_encryption_by_default ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?blocked_encryption_types:blocked_encryption_types ->
  unit ->
  server_side_encryption_rule

val make_server_side_encryption_configuration :
  rules:server_side_encryption_rules -> unit -> server_side_encryption_configuration

val make_put_bucket_encryption_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  server_side_encryption_configuration:server_side_encryption_configuration ->
  unit ->
  put_bucket_encryption_request

val make_cors_rule :
  ?i_d:i_d ->
  ?allowed_headers:allowed_headers ->
  ?expose_headers:expose_headers ->
  ?max_age_seconds:max_age_seconds ->
  allowed_methods:allowed_methods ->
  allowed_origins:allowed_origins ->
  unit ->
  cors_rule

val make_cors_configuration : cors_rules:cors_rules -> unit -> cors_configuration

val make_put_bucket_cors_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  cors_configuration:cors_configuration ->
  unit ->
  put_bucket_cors_request

val make_analytics_s3_bucket_destination :
  ?bucket_account_id:account_id ->
  ?prefix:prefix ->
  format:analytics_s3_export_file_format ->
  bucket:bucket_name ->
  unit ->
  analytics_s3_bucket_destination

val make_analytics_export_destination :
  s3_bucket_destination:analytics_s3_bucket_destination -> unit -> analytics_export_destination

val make_storage_class_analysis_data_export :
  output_schema_version:storage_class_analysis_schema_version ->
  destination:analytics_export_destination ->
  unit ->
  storage_class_analysis_data_export

val make_storage_class_analysis :
  ?data_export:storage_class_analysis_data_export -> unit -> storage_class_analysis

val make_analytics_and_operator : ?prefix:prefix -> ?tags:tag_set -> unit -> analytics_and_operator

val make_analytics_configuration :
  ?filter:analytics_filter ->
  id:analytics_id ->
  storage_class_analysis:storage_class_analysis ->
  unit ->
  analytics_configuration

val make_put_bucket_analytics_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:analytics_id ->
  analytics_configuration:analytics_configuration ->
  unit ->
  put_bucket_analytics_configuration_request

val make_put_bucket_acl_request :
  ?ac_l:bucket_canned_ac_l ->
  ?access_control_policy:access_control_policy ->
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?grant_full_control:grant_full_control ->
  ?grant_read:grant_read ->
  ?grant_read_ac_p:grant_read_ac_p ->
  ?grant_write:grant_write ->
  ?grant_write_ac_p:grant_write_ac_p ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  put_bucket_acl_request

val make_put_bucket_accelerate_configuration_request :
  ?expected_bucket_owner:account_id ->
  ?checksum_algorithm:checksum_algorithm ->
  bucket:bucket_name ->
  accelerate_configuration:accelerate_configuration ->
  unit ->
  put_bucket_accelerate_configuration_request

val make_put_bucket_abac_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  abac_status:abac_status ->
  unit ->
  put_bucket_abac_request

val make_initiator : ?i_d:i_d -> ?display_name:display_name -> unit -> initiator

val make_part :
  ?part_number:part_number ->
  ?last_modified:last_modified ->
  ?e_tag:e_tag ->
  ?size:size ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  unit ->
  part

val make_list_parts_output :
  ?abort_date:abort_date ->
  ?abort_rule_id:abort_rule_id ->
  ?bucket:bucket_name ->
  ?key:object_key ->
  ?upload_id:multipart_upload_id ->
  ?part_number_marker:part_number_marker ->
  ?next_part_number_marker:next_part_number_marker ->
  ?max_parts:max_parts ->
  ?is_truncated:is_truncated ->
  ?parts:parts ->
  ?initiator:initiator ->
  ?owner:owner ->
  ?storage_class:storage_class ->
  ?request_charged:request_charged ->
  ?checksum_algorithm:checksum_algorithm ->
  ?checksum_type:checksum_type ->
  unit ->
  list_parts_output

val make_list_parts_request :
  ?max_parts:max_parts ->
  ?part_number_marker:part_number_marker ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  bucket:bucket_name ->
  key:object_key ->
  upload_id:multipart_upload_id ->
  unit ->
  list_parts_request

val make_common_prefix : ?prefix:prefix -> unit -> common_prefix

val make_delete_marker_entry :
  ?owner:owner ->
  ?key:object_key ->
  ?version_id:object_version_id ->
  ?is_latest:is_latest ->
  ?last_modified:last_modified ->
  unit ->
  delete_marker_entry

val make_restore_status :
  ?is_restore_in_progress:is_restore_in_progress ->
  ?restore_expiry_date:restore_expiry_date ->
  unit ->
  restore_status

val make_object_version :
  ?e_tag:e_tag ->
  ?checksum_algorithm:checksum_algorithm_list ->
  ?checksum_type:checksum_type ->
  ?size:size ->
  ?storage_class:object_version_storage_class ->
  ?key:object_key ->
  ?version_id:object_version_id ->
  ?is_latest:is_latest ->
  ?last_modified:last_modified ->
  ?owner:owner ->
  ?restore_status:restore_status ->
  unit ->
  object_version

val make_list_object_versions_output :
  ?is_truncated:is_truncated ->
  ?key_marker:key_marker ->
  ?version_id_marker:version_id_marker ->
  ?next_key_marker:next_key_marker ->
  ?next_version_id_marker:next_version_id_marker ->
  ?versions:object_version_list ->
  ?delete_markers:delete_markers ->
  ?name:bucket_name ->
  ?prefix:prefix ->
  ?delimiter:delimiter ->
  ?max_keys:max_keys ->
  ?common_prefixes:common_prefix_list ->
  ?encoding_type:encoding_type ->
  ?request_charged:request_charged ->
  unit ->
  list_object_versions_output

val make_list_object_versions_request :
  ?delimiter:delimiter ->
  ?encoding_type:encoding_type ->
  ?key_marker:key_marker ->
  ?max_keys:max_keys ->
  ?prefix:prefix ->
  ?version_id_marker:version_id_marker ->
  ?expected_bucket_owner:account_id ->
  ?request_payer:request_payer ->
  ?optional_object_attributes:optional_object_attributes_list ->
  bucket:bucket_name ->
  unit ->
  list_object_versions_request

val make_object_ :
  ?key:object_key ->
  ?last_modified:last_modified ->
  ?e_tag:e_tag ->
  ?checksum_algorithm:checksum_algorithm_list ->
  ?checksum_type:checksum_type ->
  ?size:size ->
  ?storage_class:object_storage_class ->
  ?owner:owner ->
  ?restore_status:restore_status ->
  unit ->
  object_

val make_list_objects_v2_output :
  ?is_truncated:is_truncated ->
  ?contents:object_list ->
  ?name:bucket_name ->
  ?prefix:prefix ->
  ?delimiter:delimiter ->
  ?max_keys:max_keys ->
  ?common_prefixes:common_prefix_list ->
  ?encoding_type:encoding_type ->
  ?key_count:key_count ->
  ?continuation_token:token ->
  ?next_continuation_token:next_token ->
  ?start_after:start_after ->
  ?request_charged:request_charged ->
  unit ->
  list_objects_v2_output

val make_list_objects_v2_request :
  ?delimiter:delimiter ->
  ?encoding_type:encoding_type ->
  ?max_keys:max_keys ->
  ?prefix:prefix ->
  ?continuation_token:token ->
  ?fetch_owner:fetch_owner ->
  ?start_after:start_after ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?optional_object_attributes:optional_object_attributes_list ->
  bucket:bucket_name ->
  unit ->
  list_objects_v2_request

val make_list_objects_output :
  ?is_truncated:is_truncated ->
  ?marker:marker ->
  ?next_marker:next_marker ->
  ?contents:object_list ->
  ?name:bucket_name ->
  ?prefix:prefix ->
  ?delimiter:delimiter ->
  ?max_keys:max_keys ->
  ?common_prefixes:common_prefix_list ->
  ?encoding_type:encoding_type ->
  ?request_charged:request_charged ->
  unit ->
  list_objects_output

val make_list_objects_request :
  ?delimiter:delimiter ->
  ?encoding_type:encoding_type ->
  ?marker:marker ->
  ?max_keys:max_keys ->
  ?prefix:prefix ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?optional_object_attributes:optional_object_attributes_list ->
  bucket:bucket_name ->
  unit ->
  list_objects_request

val make_annotation_entry :
  ?e_tag:e_tag ->
  ?checksum_algorithm:checksum_algorithm_list ->
  ?replication_status:replication_status ->
  annotation_name:annotation_name ->
  last_modified:last_modified ->
  size:size ->
  unit ->
  annotation_entry

val make_list_object_annotations_output :
  ?annotations:annotation_list ->
  ?bucket:bucket_name ->
  ?key:object_key ->
  ?object_version_id:object_version_id ->
  ?annotation_prefix:annotation_prefix ->
  ?max_annotation_results:max_annotation_results ->
  ?annotation_count:annotation_count ->
  ?continuation_token:token ->
  ?next_continuation_token:next_token ->
  ?request_charged:request_charged ->
  unit ->
  list_object_annotations_output

val make_list_object_annotations_request :
  ?version_id:object_version_id ->
  ?max_annotation_results:max_annotation_results ->
  ?annotation_prefix:annotation_prefix ->
  ?continuation_token:token ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  list_object_annotations_request

val make_multipart_upload :
  ?upload_id:multipart_upload_id ->
  ?key:object_key ->
  ?initiated:initiated ->
  ?storage_class:storage_class ->
  ?owner:owner ->
  ?initiator:initiator ->
  ?checksum_algorithm:checksum_algorithm ->
  ?checksum_type:checksum_type ->
  unit ->
  multipart_upload

val make_list_multipart_uploads_output :
  ?bucket:bucket_name ->
  ?key_marker:key_marker ->
  ?upload_id_marker:upload_id_marker ->
  ?next_key_marker:next_key_marker ->
  ?prefix:prefix ->
  ?delimiter:delimiter ->
  ?next_upload_id_marker:next_upload_id_marker ->
  ?max_uploads:max_uploads ->
  ?is_truncated:is_truncated ->
  ?uploads:multipart_upload_list ->
  ?common_prefixes:common_prefix_list ->
  ?encoding_type:encoding_type ->
  ?request_charged:request_charged ->
  unit ->
  list_multipart_uploads_output

val make_list_multipart_uploads_request :
  ?delimiter:delimiter ->
  ?encoding_type:encoding_type ->
  ?key_marker:key_marker ->
  ?max_uploads:max_uploads ->
  ?prefix:prefix ->
  ?upload_id_marker:upload_id_marker ->
  ?expected_bucket_owner:account_id ->
  ?request_payer:request_payer ->
  bucket:bucket_name ->
  unit ->
  list_multipart_uploads_request

val make_bucket :
  ?name:bucket_name ->
  ?creation_date:creation_date ->
  ?bucket_region:bucket_region ->
  ?bucket_arn:s3_regional_or_s3_express_bucket_arn_string ->
  unit ->
  bucket

val make_list_directory_buckets_output :
  ?buckets:buckets ->
  ?continuation_token:directory_bucket_token ->
  unit ->
  list_directory_buckets_output

val make_list_directory_buckets_request :
  ?continuation_token:directory_bucket_token ->
  ?max_directory_buckets:max_directory_buckets ->
  unit ->
  list_directory_buckets_request

val make_list_buckets_output :
  ?buckets:buckets ->
  ?owner:owner ->
  ?continuation_token:next_token ->
  ?prefix:prefix ->
  unit ->
  list_buckets_output

val make_list_buckets_request :
  ?max_buckets:max_buckets ->
  ?continuation_token:token ->
  ?prefix:prefix ->
  ?bucket_region:bucket_region ->
  unit ->
  list_buckets_request

val make_list_bucket_metrics_configurations_output :
  ?is_truncated:is_truncated ->
  ?continuation_token:token ->
  ?next_continuation_token:next_token ->
  ?metrics_configuration_list:metrics_configuration_list ->
  unit ->
  list_bucket_metrics_configurations_output

val make_list_bucket_metrics_configurations_request :
  ?continuation_token:token ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  list_bucket_metrics_configurations_request

val make_list_bucket_inventory_configurations_output :
  ?continuation_token:token ->
  ?inventory_configuration_list:inventory_configuration_list ->
  ?is_truncated:is_truncated ->
  ?next_continuation_token:next_token ->
  unit ->
  list_bucket_inventory_configurations_output

val make_list_bucket_inventory_configurations_request :
  ?continuation_token:token ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  list_bucket_inventory_configurations_request

val make_list_bucket_intelligent_tiering_configurations_output :
  ?is_truncated:is_truncated ->
  ?continuation_token:token ->
  ?next_continuation_token:next_token ->
  ?intelligent_tiering_configuration_list:intelligent_tiering_configuration_list ->
  unit ->
  list_bucket_intelligent_tiering_configurations_output

val make_list_bucket_intelligent_tiering_configurations_request :
  ?continuation_token:token ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  list_bucket_intelligent_tiering_configurations_request

val make_list_bucket_analytics_configurations_output :
  ?is_truncated:is_truncated ->
  ?continuation_token:token ->
  ?next_continuation_token:next_token ->
  ?analytics_configuration_list:analytics_configuration_list ->
  unit ->
  list_bucket_analytics_configurations_output

val make_list_bucket_analytics_configurations_request :
  ?continuation_token:token ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  list_bucket_analytics_configurations_request

val make_head_object_output :
  ?delete_marker:delete_marker ->
  ?accept_ranges:accept_ranges ->
  ?expiration:expiration ->
  ?restore:restore ->
  ?archive_status:archive_status ->
  ?last_modified:last_modified ->
  ?content_length:content_length ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  ?e_tag:e_tag ->
  ?missing_meta:missing_meta ->
  ?version_id:object_version_id ->
  ?cache_control:cache_control ->
  ?content_disposition:content_disposition ->
  ?content_encoding:content_encoding ->
  ?content_language:content_language ->
  ?content_type:content_type ->
  ?content_range:content_range ->
  ?expires:expires ->
  ?website_redirect_location:website_redirect_location ->
  ?server_side_encryption:server_side_encryption ->
  ?metadata:metadata ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?storage_class:storage_class ->
  ?request_charged:request_charged ->
  ?replication_status:replication_status ->
  ?parts_count:parts_count ->
  ?tag_count:tag_count ->
  ?object_lock_mode:object_lock_mode ->
  ?object_lock_retain_until_date:object_lock_retain_until_date ->
  ?object_lock_legal_hold_status:object_lock_legal_hold_status ->
  unit ->
  head_object_output

val make_head_object_request :
  ?if_match:if_match ->
  ?if_modified_since:if_modified_since ->
  ?if_none_match:if_none_match ->
  ?if_unmodified_since:if_unmodified_since ->
  ?range:range ->
  ?response_cache_control:response_cache_control ->
  ?response_content_disposition:response_content_disposition ->
  ?response_content_encoding:response_content_encoding ->
  ?response_content_language:response_content_language ->
  ?response_content_type:response_content_type ->
  ?response_expires:response_expires ->
  ?version_id:object_version_id ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?request_payer:request_payer ->
  ?part_number:part_number ->
  ?expected_bucket_owner:account_id ->
  ?checksum_mode:checksum_mode ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  head_object_request

val make_head_bucket_output :
  ?bucket_arn:s3_regional_or_s3_express_bucket_arn_string ->
  ?bucket_location_type:location_type ->
  ?bucket_location_name:bucket_location_name ->
  ?bucket_region:region ->
  ?access_point_alias:access_point_alias ->
  unit ->
  head_bucket_output

val make_head_bucket_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> head_bucket_request

val make_get_public_access_block_output :
  ?public_access_block_configuration:public_access_block_configuration ->
  unit ->
  get_public_access_block_output

val make_get_public_access_block_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_public_access_block_request

val make_get_object_torrent_output :
  ?body:streaming_blob -> ?request_charged:request_charged -> unit -> get_object_torrent_output

val make_get_object_torrent_request :
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  get_object_torrent_request

val make_get_object_tagging_output :
  ?version_id:object_version_id -> tag_set:tag_set -> unit -> get_object_tagging_output

val make_get_object_tagging_request :
  ?version_id:object_version_id ->
  ?expected_bucket_owner:account_id ->
  ?request_payer:request_payer ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  get_object_tagging_request

val make_get_object_retention_output :
  ?retention:object_lock_retention -> unit -> get_object_retention_output

val make_get_object_retention_request :
  ?version_id:object_version_id ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  get_object_retention_request

val make_get_object_lock_configuration_output :
  ?object_lock_configuration:object_lock_configuration ->
  unit ->
  get_object_lock_configuration_output

val make_get_object_lock_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_object_lock_configuration_request

val make_get_object_legal_hold_output :
  ?legal_hold:object_lock_legal_hold -> unit -> get_object_legal_hold_output

val make_get_object_legal_hold_request :
  ?version_id:object_version_id ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  get_object_legal_hold_request

val make_object_part :
  ?part_number:part_number ->
  ?size:size ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  unit ->
  object_part

val make_get_object_attributes_parts :
  ?total_parts_count:parts_count ->
  ?part_number_marker:part_number_marker ->
  ?next_part_number_marker:next_part_number_marker ->
  ?max_parts:max_parts ->
  ?is_truncated:is_truncated ->
  ?parts:parts_list ->
  unit ->
  get_object_attributes_parts

val make_checksum :
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  unit ->
  checksum

val make_get_object_attributes_output :
  ?delete_marker:delete_marker ->
  ?last_modified:last_modified ->
  ?version_id:object_version_id ->
  ?request_charged:request_charged ->
  ?e_tag:e_tag ->
  ?checksum:checksum ->
  ?object_parts:get_object_attributes_parts ->
  ?storage_class:storage_class ->
  ?object_size:object_size ->
  unit ->
  get_object_attributes_output

val make_get_object_attributes_request :
  ?version_id:object_version_id ->
  ?max_parts:max_parts ->
  ?part_number_marker:part_number_marker ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  object_attributes:object_attributes_list ->
  unit ->
  get_object_attributes_request

val make_get_object_annotation_output :
  ?annotation_payload:streaming_blob ->
  ?object_version_id:object_version_id ->
  ?last_modified:last_modified ->
  ?content_length:content_length ->
  ?e_tag:e_tag ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  ?server_side_encryption:server_side_encryption ->
  ?request_charged:request_charged ->
  ?replication_status:replication_status ->
  unit ->
  get_object_annotation_output

val make_get_object_annotation_request :
  ?version_id:object_version_id ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?checksum_mode:checksum_mode ->
  bucket:bucket_name ->
  key:object_key ->
  annotation_name:annotation_name ->
  unit ->
  get_object_annotation_request

val make_get_object_acl_output :
  ?owner:owner ->
  ?grants:grants ->
  ?request_charged:request_charged ->
  unit ->
  get_object_acl_output

val make_get_object_acl_request :
  ?version_id:object_version_id ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  get_object_acl_request

val make_get_object_output :
  ?body:streaming_blob ->
  ?delete_marker:delete_marker ->
  ?accept_ranges:accept_ranges ->
  ?expiration:expiration ->
  ?restore:restore ->
  ?last_modified:last_modified ->
  ?content_length:content_length ->
  ?e_tag:e_tag ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  ?missing_meta:missing_meta ->
  ?version_id:object_version_id ->
  ?cache_control:cache_control ->
  ?content_disposition:content_disposition ->
  ?content_encoding:content_encoding ->
  ?content_language:content_language ->
  ?content_range:content_range ->
  ?content_type:content_type ->
  ?expires:expires ->
  ?website_redirect_location:website_redirect_location ->
  ?server_side_encryption:server_side_encryption ->
  ?metadata:metadata ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?storage_class:storage_class ->
  ?request_charged:request_charged ->
  ?replication_status:replication_status ->
  ?parts_count:parts_count ->
  ?tag_count:tag_count ->
  ?object_lock_mode:object_lock_mode ->
  ?object_lock_retain_until_date:object_lock_retain_until_date ->
  ?object_lock_legal_hold_status:object_lock_legal_hold_status ->
  unit ->
  get_object_output

val make_get_object_request :
  ?if_match:if_match ->
  ?if_modified_since:if_modified_since ->
  ?if_none_match:if_none_match ->
  ?if_unmodified_since:if_unmodified_since ->
  ?range:range ->
  ?response_cache_control:response_cache_control ->
  ?response_content_disposition:response_content_disposition ->
  ?response_content_encoding:response_content_encoding ->
  ?response_content_language:response_content_language ->
  ?response_content_type:response_content_type ->
  ?response_expires:response_expires ->
  ?version_id:object_version_id ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?request_payer:request_payer ->
  ?part_number:part_number ->
  ?expected_bucket_owner:account_id ->
  ?checksum_mode:checksum_mode ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  get_object_request

val make_get_bucket_website_output :
  ?redirect_all_requests_to:redirect_all_requests_to ->
  ?index_document:index_document ->
  ?error_document:error_document ->
  ?routing_rules:routing_rules ->
  unit ->
  get_bucket_website_output

val make_get_bucket_website_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_website_request

val make_get_bucket_versioning_output :
  ?status:bucket_versioning_status ->
  ?mfa_delete:mfa_delete_status ->
  unit ->
  get_bucket_versioning_output

val make_get_bucket_versioning_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_versioning_request

val make_get_bucket_tagging_output : tag_set:tag_set -> unit -> get_bucket_tagging_output

val make_get_bucket_tagging_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_tagging_request

val make_get_bucket_request_payment_output :
  ?payer:payer -> unit -> get_bucket_request_payment_output

val make_get_bucket_request_payment_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_bucket_request_payment_request

val make_get_bucket_replication_output :
  ?replication_configuration:replication_configuration -> unit -> get_bucket_replication_output

val make_get_bucket_replication_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_replication_request

val make_policy_status : ?is_public:is_public -> unit -> policy_status

val make_get_bucket_policy_status_output :
  ?policy_status:policy_status -> unit -> get_bucket_policy_status_output

val make_get_bucket_policy_status_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_bucket_policy_status_request

val make_get_bucket_policy_output : ?policy:policy -> unit -> get_bucket_policy_output

val make_get_bucket_policy_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_policy_request

val make_get_bucket_ownership_controls_output :
  ?ownership_controls:ownership_controls -> unit -> get_bucket_ownership_controls_output

val make_get_bucket_ownership_controls_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_bucket_ownership_controls_request

val make_get_bucket_notification_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_bucket_notification_configuration_request

val make_get_bucket_metrics_configuration_output :
  ?metrics_configuration:metrics_configuration -> unit -> get_bucket_metrics_configuration_output

val make_get_bucket_metrics_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:metrics_id ->
  unit ->
  get_bucket_metrics_configuration_request

val make_error_details :
  ?error_code:error_code -> ?error_message:error_message -> unit -> error_details

val make_get_bucket_metadata_table_configuration_output :
  ?get_bucket_metadata_table_configuration_result:get_bucket_metadata_table_configuration_result ->
  unit ->
  get_bucket_metadata_table_configuration_output

val make_get_bucket_metadata_table_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_bucket_metadata_table_configuration_request

val make_get_bucket_metadata_configuration_output :
  ?get_bucket_metadata_configuration_result:get_bucket_metadata_configuration_result ->
  unit ->
  get_bucket_metadata_configuration_output

val make_get_bucket_metadata_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_bucket_metadata_configuration_request

val make_get_bucket_logging_output :
  ?logging_enabled:logging_enabled -> unit -> get_bucket_logging_output

val make_get_bucket_logging_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_logging_request

val make_get_bucket_location_output :
  ?location_constraint:bucket_location_constraint -> unit -> get_bucket_location_output

val make_get_bucket_location_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_location_request

val make_get_bucket_lifecycle_configuration_output :
  ?rules:lifecycle_rules ->
  ?transition_default_minimum_object_size:transition_default_minimum_object_size ->
  unit ->
  get_bucket_lifecycle_configuration_output

val make_get_bucket_lifecycle_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  get_bucket_lifecycle_configuration_request

val make_get_bucket_inventory_configuration_output :
  ?inventory_configuration:inventory_configuration ->
  unit ->
  get_bucket_inventory_configuration_output

val make_get_bucket_inventory_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:inventory_id ->
  unit ->
  get_bucket_inventory_configuration_request

val make_get_bucket_intelligent_tiering_configuration_output :
  ?intelligent_tiering_configuration:intelligent_tiering_configuration ->
  unit ->
  get_bucket_intelligent_tiering_configuration_output

val make_get_bucket_intelligent_tiering_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:intelligent_tiering_id ->
  unit ->
  get_bucket_intelligent_tiering_configuration_request

val make_get_bucket_encryption_output :
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  unit ->
  get_bucket_encryption_output

val make_get_bucket_encryption_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_encryption_request

val make_get_bucket_cors_output : ?cors_rules:cors_rules -> unit -> get_bucket_cors_output

val make_get_bucket_cors_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_cors_request

val make_get_bucket_analytics_configuration_output :
  ?analytics_configuration:analytics_configuration ->
  unit ->
  get_bucket_analytics_configuration_output

val make_get_bucket_analytics_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:analytics_id ->
  unit ->
  get_bucket_analytics_configuration_request

val make_get_bucket_acl_output : ?owner:owner -> ?grants:grants -> unit -> get_bucket_acl_output

val make_get_bucket_acl_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_acl_request

val make_get_bucket_accelerate_configuration_output :
  ?status:bucket_accelerate_status ->
  ?request_charged:request_charged ->
  unit ->
  get_bucket_accelerate_configuration_output

val make_get_bucket_accelerate_configuration_request :
  ?expected_bucket_owner:account_id ->
  ?request_payer:request_payer ->
  bucket:bucket_name ->
  unit ->
  get_bucket_accelerate_configuration_request

val make_get_bucket_abac_output : ?abac_status:abac_status -> unit -> get_bucket_abac_output

val make_get_bucket_abac_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> get_bucket_abac_request

val make_delete_public_access_block_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  delete_public_access_block_request

val make_delete_object_tagging_output :
  ?version_id:object_version_id -> unit -> delete_object_tagging_output

val make_delete_object_tagging_request :
  ?version_id:object_version_id ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  delete_object_tagging_request

val make_error :
  ?key:object_key ->
  ?version_id:object_version_id ->
  ?code:code ->
  ?message:message ->
  unit ->
  error

val make_deleted_object :
  ?key:object_key ->
  ?version_id:object_version_id ->
  ?delete_marker:delete_marker ->
  ?delete_marker_version_id:delete_marker_version_id ->
  unit ->
  deleted_object

val make_delete_objects_output :
  ?deleted:deleted_objects ->
  ?request_charged:request_charged ->
  ?errors:errors ->
  unit ->
  delete_objects_output

val make_object_identifier :
  ?version_id:object_version_id ->
  ?e_tag:e_tag ->
  ?last_modified_time:last_modified_time ->
  ?size:size ->
  key:object_key ->
  unit ->
  object_identifier

val make_delete : ?quiet:quiet -> objects:object_identifier_list -> unit -> delete

val make_delete_objects_request :
  ?mf_a:mf_a ->
  ?request_payer:request_payer ->
  ?bypass_governance_retention:bypass_governance_retention ->
  ?expected_bucket_owner:account_id ->
  ?checksum_algorithm:checksum_algorithm ->
  bucket:bucket_name ->
  delete:delete ->
  unit ->
  delete_objects_request

val make_delete_object_annotation_output :
  ?object_version_id:object_version_id ->
  ?request_charged:request_charged ->
  unit ->
  delete_object_annotation_output

val make_delete_object_annotation_request :
  ?version_id:object_version_id ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?object_if_match:object_if_match ->
  bucket:bucket_name ->
  key:object_key ->
  annotation_name:annotation_name ->
  unit ->
  delete_object_annotation_request

val make_delete_object_output :
  ?delete_marker:delete_marker ->
  ?version_id:object_version_id ->
  ?request_charged:request_charged ->
  unit ->
  delete_object_output

val make_delete_object_request :
  ?mf_a:mf_a ->
  ?version_id:object_version_id ->
  ?request_payer:request_payer ->
  ?bypass_governance_retention:bypass_governance_retention ->
  ?expected_bucket_owner:account_id ->
  ?if_match:if_match ->
  ?if_match_last_modified_time:if_match_last_modified_time ->
  ?if_match_size:if_match_size ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  delete_object_request

val make_delete_bucket_website_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> delete_bucket_website_request

val make_delete_bucket_tagging_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> delete_bucket_tagging_request

val make_delete_bucket_replication_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  delete_bucket_replication_request

val make_delete_bucket_policy_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> delete_bucket_policy_request

val make_delete_bucket_ownership_controls_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  delete_bucket_ownership_controls_request

val make_delete_bucket_metrics_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:metrics_id ->
  unit ->
  delete_bucket_metrics_configuration_request

val make_delete_bucket_metadata_table_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  delete_bucket_metadata_table_configuration_request

val make_delete_bucket_metadata_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  delete_bucket_metadata_configuration_request

val make_delete_bucket_lifecycle_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> delete_bucket_lifecycle_request

val make_delete_bucket_inventory_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:inventory_id ->
  unit ->
  delete_bucket_inventory_configuration_request

val make_delete_bucket_intelligent_tiering_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:intelligent_tiering_id ->
  unit ->
  delete_bucket_intelligent_tiering_configuration_request

val make_delete_bucket_encryption_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  unit ->
  delete_bucket_encryption_request

val make_delete_bucket_cors_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> delete_bucket_cors_request

val make_delete_bucket_analytics_configuration_request :
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  id:analytics_id ->
  unit ->
  delete_bucket_analytics_configuration_request

val make_delete_bucket_request :
  ?expected_bucket_owner:account_id -> bucket:bucket_name -> unit -> delete_bucket_request

val make_session_credentials :
  access_key_id:access_key_id_value ->
  secret_access_key:session_credential_value ->
  session_token:session_credential_value ->
  expiration:session_expiration ->
  unit ->
  session_credentials

val make_create_session_output :
  ?server_side_encryption:server_side_encryption ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  credentials:session_credentials ->
  unit ->
  create_session_output

val make_create_session_request :
  ?session_mode:session_mode ->
  ?server_side_encryption:server_side_encryption ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  bucket:bucket_name ->
  unit ->
  create_session_request

val make_create_multipart_upload_output :
  ?abort_date:abort_date ->
  ?abort_rule_id:abort_rule_id ->
  ?bucket:bucket_name ->
  ?key:object_key ->
  ?upload_id:multipart_upload_id ->
  ?server_side_encryption:server_side_encryption ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?request_charged:request_charged ->
  ?checksum_algorithm:checksum_algorithm ->
  ?checksum_type:checksum_type ->
  unit ->
  create_multipart_upload_output

val make_create_multipart_upload_request :
  ?ac_l:object_canned_ac_l ->
  ?cache_control:cache_control ->
  ?content_disposition:content_disposition ->
  ?content_encoding:content_encoding ->
  ?content_language:content_language ->
  ?content_type:content_type ->
  ?expires:expires ->
  ?grant_full_control:grant_full_control ->
  ?grant_read:grant_read ->
  ?grant_read_ac_p:grant_read_ac_p ->
  ?grant_write_ac_p:grant_write_ac_p ->
  ?metadata:metadata ->
  ?server_side_encryption:server_side_encryption ->
  ?storage_class:storage_class ->
  ?website_redirect_location:website_redirect_location ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?request_payer:request_payer ->
  ?tagging:tagging_header ->
  ?object_lock_mode:object_lock_mode ->
  ?object_lock_retain_until_date:object_lock_retain_until_date ->
  ?object_lock_legal_hold_status:object_lock_legal_hold_status ->
  ?expected_bucket_owner:account_id ->
  ?checksum_algorithm:checksum_algorithm ->
  ?checksum_type:checksum_type ->
  bucket:bucket_name ->
  key:object_key ->
  unit ->
  create_multipart_upload_request

val make_s3_tables_destination :
  table_bucket_arn:s3_tables_bucket_arn ->
  table_name:s3_tables_name ->
  unit ->
  s3_tables_destination

val make_metadata_table_configuration :
  s3_tables_destination:s3_tables_destination -> unit -> metadata_table_configuration

val make_create_bucket_metadata_table_configuration_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  metadata_table_configuration:metadata_table_configuration ->
  unit ->
  create_bucket_metadata_table_configuration_request

val make_annotation_table_configuration :
  ?encryption_configuration:metadata_table_encryption_configuration ->
  ?role:role ->
  configuration_state:annotation_configuration_state ->
  unit ->
  annotation_table_configuration

val make_inventory_table_configuration :
  ?encryption_configuration:metadata_table_encryption_configuration ->
  configuration_state:inventory_configuration_state ->
  unit ->
  inventory_table_configuration

val make_journal_table_configuration :
  ?encryption_configuration:metadata_table_encryption_configuration ->
  record_expiration:record_expiration ->
  unit ->
  journal_table_configuration

val make_metadata_configuration :
  ?inventory_table_configuration:inventory_table_configuration ->
  ?annotation_table_configuration:annotation_table_configuration ->
  journal_table_configuration:journal_table_configuration ->
  unit ->
  metadata_configuration

val make_create_bucket_metadata_configuration_request :
  ?content_m_d5:content_m_d5 ->
  ?checksum_algorithm:checksum_algorithm ->
  ?expected_bucket_owner:account_id ->
  bucket:bucket_name ->
  metadata_configuration:metadata_configuration ->
  unit ->
  create_bucket_metadata_configuration_request

val make_create_bucket_output :
  ?location:location ->
  ?bucket_arn:s3_regional_or_s3_express_bucket_arn_string ->
  unit ->
  create_bucket_output

val make_bucket_info : ?data_redundancy:data_redundancy -> ?type_:bucket_type -> unit -> bucket_info

val make_location_info :
  ?type_:location_type -> ?name:location_name_as_string -> unit -> location_info

val make_create_bucket_configuration :
  ?location_constraint:bucket_location_constraint ->
  ?location:location_info ->
  ?bucket:bucket_info ->
  ?tags:tag_set ->
  unit ->
  create_bucket_configuration

val make_create_bucket_request :
  ?ac_l:bucket_canned_ac_l ->
  ?create_bucket_configuration:create_bucket_configuration ->
  ?grant_full_control:grant_full_control ->
  ?grant_read:grant_read ->
  ?grant_read_ac_p:grant_read_ac_p ->
  ?grant_write:grant_write ->
  ?grant_write_ac_p:grant_write_ac_p ->
  ?object_lock_enabled_for_bucket:object_lock_enabled_for_bucket ->
  ?object_ownership:object_ownership ->
  ?bucket_namespace:bucket_namespace ->
  bucket:bucket_name ->
  unit ->
  create_bucket_request

val make_copy_object_output :
  ?copy_object_result:copy_object_result ->
  ?expiration:expiration ->
  ?copy_source_version_id:copy_source_version_id ->
  ?version_id:object_version_id ->
  ?server_side_encryption:server_side_encryption ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?request_charged:request_charged ->
  unit ->
  copy_object_output

val make_copy_object_request :
  ?ac_l:object_canned_ac_l ->
  ?cache_control:cache_control ->
  ?checksum_algorithm:checksum_algorithm ->
  ?content_disposition:content_disposition ->
  ?content_encoding:content_encoding ->
  ?content_language:content_language ->
  ?content_type:content_type ->
  ?copy_source_if_match:copy_source_if_match ->
  ?copy_source_if_modified_since:copy_source_if_modified_since ->
  ?copy_source_if_none_match:copy_source_if_none_match ->
  ?copy_source_if_unmodified_since:copy_source_if_unmodified_since ->
  ?expires:expires ->
  ?grant_full_control:grant_full_control ->
  ?grant_read:grant_read ->
  ?grant_read_ac_p:grant_read_ac_p ->
  ?grant_write_ac_p:grant_write_ac_p ->
  ?if_match:if_match ->
  ?if_none_match:if_none_match ->
  ?metadata:metadata ->
  ?metadata_directive:metadata_directive ->
  ?tagging_directive:tagging_directive ->
  ?annotation_directive:annotation_directive ->
  ?server_side_encryption:server_side_encryption ->
  ?storage_class:storage_class ->
  ?website_redirect_location:website_redirect_location ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  ?ssekms_key_id:ssekms_key_id ->
  ?ssekms_encryption_context:ssekms_encryption_context ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?copy_source_sse_customer_algorithm:copy_source_sse_customer_algorithm ->
  ?copy_source_sse_customer_key:copy_source_sse_customer_key ->
  ?copy_source_sse_customer_key_m_d5:copy_source_sse_customer_key_m_d5 ->
  ?request_payer:request_payer ->
  ?tagging:tagging_header ->
  ?object_lock_mode:object_lock_mode ->
  ?object_lock_retain_until_date:object_lock_retain_until_date ->
  ?object_lock_legal_hold_status:object_lock_legal_hold_status ->
  ?expected_bucket_owner:account_id ->
  ?expected_source_bucket_owner:account_id ->
  bucket:bucket_name ->
  copy_source:copy_source ->
  key:object_key ->
  unit ->
  copy_object_request

val make_complete_multipart_upload_output :
  ?location:location ->
  ?bucket:bucket_name ->
  ?key:object_key ->
  ?expiration:expiration ->
  ?e_tag:e_tag ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  ?server_side_encryption:server_side_encryption ->
  ?version_id:object_version_id ->
  ?ssekms_key_id:ssekms_key_id ->
  ?bucket_key_enabled:bucket_key_enabled ->
  ?request_charged:request_charged ->
  unit ->
  complete_multipart_upload_output

val make_completed_part :
  ?e_tag:e_tag ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?part_number:part_number ->
  unit ->
  completed_part

val make_completed_multipart_upload :
  ?parts:completed_part_list -> unit -> completed_multipart_upload

val make_complete_multipart_upload_request :
  ?multipart_upload:completed_multipart_upload ->
  ?checksum_cr_c32:checksum_cr_c32 ->
  ?checksum_crc32_c:checksum_crc32_c ->
  ?checksum_crc64nvm_e:checksum_crc64nvm_e ->
  ?checksum_sh_a1:checksum_sh_a1 ->
  ?checksum_sh_a256:checksum_sh_a256 ->
  ?checksum_sh_a512:checksum_sh_a512 ->
  ?checksum_m_d5:checksum_m_d5 ->
  ?checksum_xxhas_h64:checksum_xxhas_h64 ->
  ?checksum_xxhas_h3:checksum_xxhas_h3 ->
  ?checksum_xxhas_h128:checksum_xxhas_h128 ->
  ?checksum_type:checksum_type ->
  ?mpu_object_size:mpu_object_size ->
  ?request_payer:request_payer ->
  ?expected_bucket_owner:account_id ->
  ?if_match:if_match ->
  ?if_none_match:if_none_match ->
  ?sse_customer_algorithm:sse_customer_algorithm ->
  ?sse_customer_key:sse_customer_key ->
  ?sse_customer_key_m_d5:sse_customer_key_m_d5 ->
  bucket:bucket_name ->
  key:object_key ->
  upload_id:multipart_upload_id ->
  unit ->
  complete_multipart_upload_request
