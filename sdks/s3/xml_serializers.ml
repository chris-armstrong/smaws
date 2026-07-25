open Smaws_Lib.Xml.Write
open Types

let bucket_abac_status_to_xml w (x : bucket_abac_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let abac_status_to_xml w (x : abac_status) =
  ignore
    [
      (match x.status with
      | None -> null w
      | Some v -> element w "Status" (fun w -> bucket_abac_status_to_xml w v));
    ]

let abort_date_to_xml w v = text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
let days_after_initiation_to_xml w v = text w (string_of_int v)

let abort_incomplete_multipart_upload_to_xml w (x : abort_incomplete_multipart_upload) =
  ignore
    [
      (match x.days_after_initiation with
      | None -> null w
      | Some v -> element w "DaysAfterInitiation" (fun w -> days_after_initiation_to_xml w v));
    ]

let no_such_upload_to_xml w _x = null w

let request_charged_to_xml w (x : request_charged) =
  text w (match x with Requester -> "requester")

let abort_multipart_upload_output_to_xml w (x : abort_multipart_upload_output) =
  ignore
    [
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let if_match_initiated_time_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)

let account_id_to_xml w v = text w v
let request_payer_to_xml w (x : request_payer) = text w (match x with Requester -> "requester")
let multipart_upload_id_to_xml w v = text w v
let object_key_to_xml w v = text w v
let bucket_name_to_xml w v = text w v

let abort_multipart_upload_request_to_xml w (x : abort_multipart_upload_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      element w "UploadId" (fun w -> multipart_upload_id_to_xml w x.upload_id);
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.if_match_initiated_time with
      | None -> null w
      | Some v -> element w "IfMatchInitiatedTime" (fun w -> if_match_initiated_time_to_xml w v));
    ]

let abort_rule_id_to_xml w v = text w v

let bucket_accelerate_status_to_xml w (x : bucket_accelerate_status) =
  text w (match x with Enabled -> "Enabled" | Suspended -> "Suspended")

let accelerate_configuration_to_xml w (x : accelerate_configuration) =
  ignore
    [
      (match x.status with
      | None -> null w
      | Some v -> element w "Status" (fun w -> bucket_accelerate_status_to_xml w v));
    ]

let accept_ranges_to_xml w v = text w v
let i_d_to_xml w v = text w v
let display_name_to_xml w v = text w v

let owner_to_xml w (x : owner) =
  ignore
    [
      (match x.display_name with
      | None -> null w
      | Some v -> element w "DisplayName" (fun w -> display_name_to_xml w v));
      (match x.i_d with None -> null w | Some v -> element w "ID" (fun w -> i_d_to_xml w v));
    ]

let permission_to_xml w (x : permission) =
  text w
    (match x with
    | FULL_CONTROL -> "FULL_CONTROL"
    | WRITE -> "WRITE"
    | WRITE_ACP -> "WRITE_ACP"
    | READ -> "READ"
    | READ_ACP -> "READ_ACP")

let type__to_xml w (x : type_) =
  text w
    (match x with
    | CanonicalUser -> "CanonicalUser"
    | AmazonCustomerByEmail -> "AmazonCustomerByEmail"
    | Group -> "Group")

let ur_i_to_xml w v = text w v
let email_address_to_xml w v = text w v

let grantee_to_xml w (x : grantee) =
  ignore
    [
      (match x.display_name with
      | None -> null w
      | Some v -> element w "DisplayName" (fun w -> display_name_to_xml w v));
      (match x.email_address with
      | None -> null w
      | Some v -> element w "EmailAddress" (fun w -> email_address_to_xml w v));
      (match x.i_d with None -> null w | Some v -> element w "ID" (fun w -> i_d_to_xml w v));
      (match x.ur_i with None -> null w | Some v -> element w "URI" (fun w -> ur_i_to_xml w v));
      null w;
    ]

let grant_to_xml w (x : grant) =
  ignore
    [
      (match x.grantee with
      | None -> null w
      | Some v ->
          element w "Grantee"
            ~attrs:
              (("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance", None)
              :: List.concat
                   [
                     [
                       ( "xsi:type",
                         (fun (v : type_) ->
                           match v with
                           | CanonicalUser -> "CanonicalUser"
                           | AmazonCustomerByEmail -> "AmazonCustomerByEmail"
                           | Group -> "Group")
                           v.type_,
                         None );
                     ];
                   ])
            (fun w -> grantee_to_xml w v));
      (match x.permission with
      | None -> null w
      | Some v -> element w "Permission" (fun w -> permission_to_xml w v));
    ]

let grants_to_xml w xs = List.iter (fun item -> element w "Grant" (fun w -> grant_to_xml w item)) xs

let access_control_policy_to_xml w (x : access_control_policy) =
  ignore
    [
      (match x.grants with
      | None -> null w
      | Some v -> element w "AccessControlList" (fun w -> grants_to_xml w v));
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
    ]

let owner_override_to_xml w (x : owner_override) =
  text w (match x with Destination -> "Destination")

let access_control_translation_to_xml w (x : access_control_translation) =
  ignore [ element w "Owner" (fun w -> owner_override_to_xml w x.owner) ]

let access_denied_to_xml w _x = null w
let access_key_id_value_to_xml w v = text w v
let access_point_alias_to_xml w v = text w (string_of_bool v)
let access_point_arn_to_xml w v = text w v
let allow_quoted_record_delimiter_to_xml w v = text w (string_of_bool v)
let allowed_header_to_xml w v = text w v

let allowed_headers_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> allowed_header_to_xml w item)) xs

let allowed_method_to_xml w v = text w v

let allowed_methods_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> allowed_method_to_xml w item)) xs

let allowed_origin_to_xml w v = text w v

let allowed_origins_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> allowed_origin_to_xml w item)) xs

let bucket_key_enabled_to_xml w v = text w (string_of_bool v)
let object_version_id_to_xml w v = text w v
let tag_count_to_xml w v = text w (string_of_int v)

let storage_class_to_xml w (x : storage_class) =
  text w
    (match x with
    | STANDARD -> "STANDARD"
    | REDUCED_REDUNDANCY -> "REDUCED_REDUNDANCY"
    | STANDARD_IA -> "STANDARD_IA"
    | ONEZONE_IA -> "ONEZONE_IA"
    | INTELLIGENT_TIERING -> "INTELLIGENT_TIERING"
    | GLACIER -> "GLACIER"
    | DEEP_ARCHIVE -> "DEEP_ARCHIVE"
    | OUTPOSTS -> "OUTPOSTS"
    | GLACIER_IR -> "GLACIER_IR"
    | SNOW -> "SNOW"
    | EXPRESS_ONEZONE -> "EXPRESS_ONEZONE"
    | FSX_OPENZFS -> "FSX_OPENZFS"
    | FSX_ONTAP -> "FSX_ONTAP")

let sse_customer_key_m_d5_to_xml w v = text w v
let ssekms_key_id_to_xml w v = text w v
let sse_customer_algorithm_to_xml w v = text w v

let server_side_encryption_to_xml w (x : server_side_encryption) =
  text w
    (match x with
    | AES256 -> "AES256"
    | Aws_fsx -> "aws:fsx"
    | Aws_kms -> "aws:kms"
    | Aws_kms_dsse -> "aws:kms:dsse")

let restore_to_xml w v = text w v

let replication_status_to_xml w (x : replication_status) =
  text w
    (match x with
    | COMPLETE -> "COMPLETE"
    | PENDING -> "PENDING"
    | FAILED -> "FAILED"
    | REPLICA -> "REPLICA"
    | COMPLETED -> "COMPLETED")

let parts_count_to_xml w v = text w (string_of_int v)

let object_lock_retain_until_date_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let object_lock_legal_hold_status_to_xml w (x : object_lock_legal_hold_status) =
  text w (match x with ON -> "ON" | OFF -> "OFF")

let object_lock_mode_to_xml w (x : object_lock_mode) =
  text w (match x with GOVERNANCE -> "GOVERNANCE" | COMPLIANCE -> "COMPLIANCE")

let metadata_value_to_xml w v = text w v
let metadata_key_to_xml w v = text w v

let metadata_to_xml w pairs =
  List.iter
    (fun (k, v) ->
      element w "entry" (fun w ->
          element w "key" (fun w -> metadata_key_to_xml w k);
          element w "value" (fun w -> metadata_value_to_xml w v)))
    pairs

let missing_meta_to_xml w v = text w (string_of_int v)

let last_modified_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let expiration_to_xml w v = text w v
let expires_to_xml w v = text w v
let e_tag_to_xml w v = text w v
let delete_marker_to_xml w v = text w (string_of_bool v)
let checksum_xxhas_h128_to_xml w v = text w v
let checksum_xxhas_h3_to_xml w v = text w v
let checksum_xxhas_h64_to_xml w v = text w v
let checksum_m_d5_to_xml w v = text w v
let checksum_sh_a512_to_xml w v = text w v
let checksum_sh_a256_to_xml w v = text w v
let checksum_sh_a1_to_xml w v = text w v
let checksum_crc64nvm_e_to_xml w v = text w v
let checksum_crc32_c_to_xml w v = text w v
let checksum_cr_c32_to_xml w v = text w v
let content_type_to_xml w v = text w v
let content_range_to_xml w v = text w v
let content_length_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)
let content_language_to_xml w v = text w v
let content_encoding_to_xml w v = text w v
let content_disposition_to_xml w v = text w v
let cache_control_to_xml w v = text w v
let error_message_to_xml w v = text w v
let error_code_to_xml w v = text w v
let get_object_response_status_code_to_xml w v = text w (string_of_int v)
let streaming_blob_to_xml w v = text w (Base64.encode_exn (Bytes.to_string v))
let request_token_to_xml w v = text w v
let request_route_to_xml w v = text w v

let write_get_object_response_request_to_xml w (x : write_get_object_response_request) =
  ignore
    [
      element w "RequestRoute" (fun w -> request_route_to_xml w x.request_route);
      element w "RequestToken" (fun w -> request_token_to_xml w x.request_token);
      (match x.body with
      | None -> null w
      | Some v -> element w "Body" (fun w -> streaming_blob_to_xml w v));
      (match x.status_code with
      | None -> null w
      | Some v -> element w "StatusCode" (fun w -> get_object_response_status_code_to_xml w v));
      (match x.error_code with
      | None -> null w
      | Some v -> element w "ErrorCode" (fun w -> error_code_to_xml w v));
      (match x.error_message with
      | None -> null w
      | Some v -> element w "ErrorMessage" (fun w -> error_message_to_xml w v));
      (match x.accept_ranges with
      | None -> null w
      | Some v -> element w "AcceptRanges" (fun w -> accept_ranges_to_xml w v));
      (match x.cache_control with
      | None -> null w
      | Some v -> element w "CacheControl" (fun w -> cache_control_to_xml w v));
      (match x.content_disposition with
      | None -> null w
      | Some v -> element w "ContentDisposition" (fun w -> content_disposition_to_xml w v));
      (match x.content_encoding with
      | None -> null w
      | Some v -> element w "ContentEncoding" (fun w -> content_encoding_to_xml w v));
      (match x.content_language with
      | None -> null w
      | Some v -> element w "ContentLanguage" (fun w -> content_language_to_xml w v));
      (match x.content_length with
      | None -> null w
      | Some v -> element w "ContentLength" (fun w -> content_length_to_xml w v));
      (match x.content_range with
      | None -> null w
      | Some v -> element w "ContentRange" (fun w -> content_range_to_xml w v));
      (match x.content_type with
      | None -> null w
      | Some v -> element w "ContentType" (fun w -> content_type_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.delete_marker with
      | None -> null w
      | Some v -> element w "DeleteMarker" (fun w -> delete_marker_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.expires with
      | None -> null w
      | Some v -> element w "Expires" (fun w -> expires_to_xml w v));
      (match x.expiration with
      | None -> null w
      | Some v -> element w "Expiration" (fun w -> expiration_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.missing_meta with
      | None -> null w
      | Some v -> element w "MissingMeta" (fun w -> missing_meta_to_xml w v));
      (match x.metadata with
      | None -> null w
      | Some v -> element w "Metadata" (fun w -> metadata_to_xml w v));
      (match x.object_lock_mode with
      | None -> null w
      | Some v -> element w "ObjectLockMode" (fun w -> object_lock_mode_to_xml w v));
      (match x.object_lock_legal_hold_status with
      | None -> null w
      | Some v ->
          element w "ObjectLockLegalHoldStatus" (fun w -> object_lock_legal_hold_status_to_xml w v));
      (match x.object_lock_retain_until_date with
      | None -> null w
      | Some v ->
          element w "ObjectLockRetainUntilDate" (fun w -> object_lock_retain_until_date_to_xml w v));
      (match x.parts_count with
      | None -> null w
      | Some v -> element w "PartsCount" (fun w -> parts_count_to_xml w v));
      (match x.replication_status with
      | None -> null w
      | Some v -> element w "ReplicationStatus" (fun w -> replication_status_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.restore with
      | None -> null w
      | Some v -> element w "Restore" (fun w -> restore_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.tag_count with
      | None -> null w
      | Some v -> element w "TagCount" (fun w -> tag_count_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
    ]

let copy_part_result_to_xml w (x : copy_part_result) =
  ignore
    [
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
    ]

let copy_source_version_id_to_xml w v = text w v

let upload_part_copy_output_to_xml w (x : upload_part_copy_output) =
  ignore
    [
      (match x.copy_source_version_id with
      | None -> null w
      | Some v -> element w "CopySourceVersionId" (fun w -> copy_source_version_id_to_xml w v));
      (match x.copy_part_result with
      | None -> null w
      | Some v -> element w "CopyPartResult" (fun w -> copy_part_result_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let copy_source_sse_customer_key_m_d5_to_xml w v = text w v
let copy_source_sse_customer_key_to_xml w v = text w v
let copy_source_sse_customer_algorithm_to_xml w v = text w v
let sse_customer_key_to_xml w v = text w v
let part_number_to_xml w v = text w (string_of_int v)
let copy_source_range_to_xml w v = text w v

let copy_source_if_unmodified_since_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let copy_source_if_none_match_to_xml w v = text w v

let copy_source_if_modified_since_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let copy_source_if_match_to_xml w v = text w v
let copy_source_to_xml w v = text w v

let upload_part_copy_request_to_xml w (x : upload_part_copy_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "CopySource" (fun w -> copy_source_to_xml w x.copy_source);
      (match x.copy_source_if_match with
      | None -> null w
      | Some v -> element w "CopySourceIfMatch" (fun w -> copy_source_if_match_to_xml w v));
      (match x.copy_source_if_modified_since with
      | None -> null w
      | Some v ->
          element w "CopySourceIfModifiedSince" (fun w -> copy_source_if_modified_since_to_xml w v));
      (match x.copy_source_if_none_match with
      | None -> null w
      | Some v -> element w "CopySourceIfNoneMatch" (fun w -> copy_source_if_none_match_to_xml w v));
      (match x.copy_source_if_unmodified_since with
      | None -> null w
      | Some v ->
          element w "CopySourceIfUnmodifiedSince" (fun w ->
              copy_source_if_unmodified_since_to_xml w v));
      (match x.copy_source_range with
      | None -> null w
      | Some v -> element w "CopySourceRange" (fun w -> copy_source_range_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      element w "PartNumber" (fun w -> part_number_to_xml w x.part_number);
      element w "UploadId" (fun w -> multipart_upload_id_to_xml w x.upload_id);
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.copy_source_sse_customer_algorithm with
      | None -> null w
      | Some v ->
          element w "CopySourceSSECustomerAlgorithm" (fun w ->
              copy_source_sse_customer_algorithm_to_xml w v));
      (match x.copy_source_sse_customer_key with
      | None -> null w
      | Some v ->
          element w "CopySourceSSECustomerKey" (fun w -> copy_source_sse_customer_key_to_xml w v));
      (match x.copy_source_sse_customer_key_m_d5 with
      | None -> null w
      | Some v ->
          element w "CopySourceSSECustomerKeyMD5" (fun w ->
              copy_source_sse_customer_key_m_d5_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.expected_source_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedSourceBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let upload_part_output_to_xml w (x : upload_part_output) =
  ignore
    [
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let checksum_algorithm_to_xml w (x : checksum_algorithm) =
  text w
    (match x with
    | CRC32 -> "CRC32"
    | CRC32C -> "CRC32C"
    | SHA1 -> "SHA1"
    | SHA256 -> "SHA256"
    | CRC64NVME -> "CRC64NVME"
    | SHA512 -> "SHA512"
    | MD5 -> "MD5"
    | XXHASH64 -> "XXHASH64"
    | XXHASH3 -> "XXHASH3"
    | XXHASH128 -> "XXHASH128")

let content_m_d5_to_xml w v = text w v

let upload_part_request_to_xml w (x : upload_part_request) =
  ignore
    [
      (match x.body with
      | None -> null w
      | Some v -> element w "Body" (fun w -> streaming_blob_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_length with
      | None -> null w
      | Some v -> element w "ContentLength" (fun w -> content_length_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      element w "PartNumber" (fun w -> part_number_to_xml w x.part_number);
      element w "UploadId" (fun w -> multipart_upload_id_to_xml w x.upload_id);
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let no_such_key_to_xml w _x = null w
let invalid_request_to_xml w _x = null w

let update_object_encryption_response_to_xml w (x : update_object_encryption_response) =
  ignore
    [
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let non_empty_kms_key_arn_string_to_xml w v = text w v

let ssekms_encryption_to_xml w (x : ssekms_encryption) =
  ignore
    [
      element w "KMSKeyArn" (fun w -> non_empty_kms_key_arn_string_to_xml w x.kms_key_arn);
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
    ]

let object_encryption_to_xml w (x : object_encryption) =
  match x with SSEKMS v -> element w "SSE-KMS" (fun w -> ssekms_encryption_to_xml w v)

let update_object_encryption_request_to_xml w (x : update_object_encryption_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      element w "ObjectEncryption" (fun w -> object_encryption_to_xml w x.object_encryption);
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
    ]

let record_expiration_days_to_xml w v = text w (string_of_int v)

let expiration_state_to_xml w (x : expiration_state) =
  text w (match x with ENABLED -> "ENABLED" | DISABLED -> "DISABLED")

let record_expiration_to_xml w (x : record_expiration) =
  ignore
    [
      element w "Expiration" (fun w -> expiration_state_to_xml w x.expiration);
      (match x.days with
      | None -> null w
      | Some v -> element w "Days" (fun w -> record_expiration_days_to_xml w v));
    ]

let journal_table_configuration_updates_to_xml w (x : journal_table_configuration_updates) =
  ignore [ element w "RecordExpiration" (fun w -> record_expiration_to_xml w x.record_expiration) ]

let update_bucket_metadata_journal_table_configuration_request_to_xml w
    (x : update_bucket_metadata_journal_table_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "JournalTableConfiguration" (fun w ->
          journal_table_configuration_updates_to_xml w x.journal_table_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let kms_key_arn_to_xml w v = text w v

let table_sse_algorithm_to_xml w (x : table_sse_algorithm) =
  text w (match x with Aws_kms -> "aws:kms" | AES256 -> "AES256")

let metadata_table_encryption_configuration_to_xml w (x : metadata_table_encryption_configuration) =
  ignore
    [
      element w "SseAlgorithm" (fun w -> table_sse_algorithm_to_xml w x.sse_algorithm);
      (match x.kms_key_arn with
      | None -> null w
      | Some v -> element w "KmsKeyArn" (fun w -> kms_key_arn_to_xml w v));
    ]

let inventory_configuration_state_to_xml w (x : inventory_configuration_state) =
  text w (match x with ENABLED -> "ENABLED" | DISABLED -> "DISABLED")

let inventory_table_configuration_updates_to_xml w (x : inventory_table_configuration_updates) =
  ignore
    [
      element w "ConfigurationState" (fun w ->
          inventory_configuration_state_to_xml w x.configuration_state);
      (match x.encryption_configuration with
      | None -> null w
      | Some v ->
          element w "EncryptionConfiguration" (fun w ->
              metadata_table_encryption_configuration_to_xml w v));
    ]

let update_bucket_metadata_inventory_table_configuration_request_to_xml w
    (x : update_bucket_metadata_inventory_table_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "InventoryTableConfiguration" (fun w ->
          inventory_table_configuration_updates_to_xml w x.inventory_table_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let role_to_xml w v = text w v

let annotation_configuration_state_to_xml w (x : annotation_configuration_state) =
  text w (match x with ENABLED -> "ENABLED" | DISABLED -> "DISABLED")

let annotation_table_configuration_updates_to_xml w (x : annotation_table_configuration_updates) =
  ignore
    [
      element w "ConfigurationState" (fun w ->
          annotation_configuration_state_to_xml w x.configuration_state);
      (match x.encryption_configuration with
      | None -> null w
      | Some v ->
          element w "EncryptionConfiguration" (fun w ->
              metadata_table_encryption_configuration_to_xml w v));
      (match x.role with None -> null w | Some v -> element w "Role" (fun w -> role_to_xml w v));
    ]

let update_bucket_metadata_annotation_table_configuration_request_to_xml w
    (x : update_bucket_metadata_annotation_table_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "AnnotationTableConfiguration" (fun w ->
          annotation_table_configuration_updates_to_xml w x.annotation_table_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let end_event_to_xml w _x = null w
let continuation_event_to_xml w _x = null w
let bytes_returned_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)
let bytes_processed_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)
let bytes_scanned_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)

let progress_to_xml w (x : progress) =
  ignore
    [
      (match x.bytes_scanned with
      | None -> null w
      | Some v -> element w "BytesScanned" (fun w -> bytes_scanned_to_xml w v));
      (match x.bytes_processed with
      | None -> null w
      | Some v -> element w "BytesProcessed" (fun w -> bytes_processed_to_xml w v));
      (match x.bytes_returned with
      | None -> null w
      | Some v -> element w "BytesReturned" (fun w -> bytes_returned_to_xml w v));
    ]

let progress_event_to_xml w (x : progress_event) =
  ignore
    [
      (match x.details with
      | None -> null w
      | Some v -> element w "Details" (fun w -> progress_to_xml w v));
    ]

let stats_to_xml w (x : stats) =
  ignore
    [
      (match x.bytes_scanned with
      | None -> null w
      | Some v -> element w "BytesScanned" (fun w -> bytes_scanned_to_xml w v));
      (match x.bytes_processed with
      | None -> null w
      | Some v -> element w "BytesProcessed" (fun w -> bytes_processed_to_xml w v));
      (match x.bytes_returned with
      | None -> null w
      | Some v -> element w "BytesReturned" (fun w -> bytes_returned_to_xml w v));
    ]

let stats_event_to_xml w (x : stats_event) =
  ignore
    [
      (match x.details with
      | None -> null w
      | Some v -> element w "Details" (fun w -> stats_to_xml w v));
    ]

let body_to_xml w v = text w (Base64.encode_exn (Bytes.to_string v))

let records_event_to_xml w (x : records_event) =
  ignore
    [
      (match x.payload with
      | None -> null w
      | Some v -> element w "Payload" (fun w -> body_to_xml w v));
    ]

let select_object_content_event_stream_to_xml w (x : select_object_content_event_stream) =
  match x with
  | Records v -> element w "Records" (fun w -> records_event_to_xml w v)
  | Stats v -> element w "Stats" (fun w -> stats_event_to_xml w v)
  | Progress v -> element w "Progress" (fun w -> progress_event_to_xml w v)
  | Cont v -> element w "Cont" (fun w -> continuation_event_to_xml w v)
  | End v -> element w "End" (fun w -> end_event_to_xml w v)

let select_object_content_output_to_xml w (x : select_object_content_output) =
  ignore
    [
      (match x.payload with
      | None -> null w
      | Some v -> element w "Payload" (fun w -> select_object_content_event_stream_to_xml w v));
    ]

let end__to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)
let start_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)

let scan_range_to_xml w (x : scan_range) =
  ignore
    [
      (match x.start with
      | None -> null w
      | Some v -> element w "Start" (fun w -> start_to_xml w v));
      (match x.end_ with None -> null w | Some v -> element w "End" (fun w -> end__to_xml w v));
    ]

let record_delimiter_to_xml w v = text w v

let json_output_to_xml w (x : json_output) =
  ignore
    [
      (match x.record_delimiter with
      | None -> null w
      | Some v -> element w "RecordDelimiter" (fun w -> record_delimiter_to_xml w v));
    ]

let quote_character_to_xml w v = text w v
let field_delimiter_to_xml w v = text w v
let quote_escape_character_to_xml w v = text w v

let quote_fields_to_xml w (x : quote_fields) =
  text w (match x with ALWAYS -> "ALWAYS" | ASNEEDED -> "ASNEEDED")

let csv_output_to_xml w (x : csv_output) =
  ignore
    [
      (match x.quote_fields with
      | None -> null w
      | Some v -> element w "QuoteFields" (fun w -> quote_fields_to_xml w v));
      (match x.quote_escape_character with
      | None -> null w
      | Some v -> element w "QuoteEscapeCharacter" (fun w -> quote_escape_character_to_xml w v));
      (match x.record_delimiter with
      | None -> null w
      | Some v -> element w "RecordDelimiter" (fun w -> record_delimiter_to_xml w v));
      (match x.field_delimiter with
      | None -> null w
      | Some v -> element w "FieldDelimiter" (fun w -> field_delimiter_to_xml w v));
      (match x.quote_character with
      | None -> null w
      | Some v -> element w "QuoteCharacter" (fun w -> quote_character_to_xml w v));
    ]

let output_serialization_to_xml w (x : output_serialization) =
  ignore
    [
      (match x.cs_v with
      | None -> null w
      | Some v -> element w "CSV" (fun w -> csv_output_to_xml w v));
      (match x.jso_n with
      | None -> null w
      | Some v -> element w "JSON" (fun w -> json_output_to_xml w v));
    ]

let parquet_input_to_xml w _x = null w

let json_type_to_xml w (x : json_type) =
  text w (match x with DOCUMENT -> "DOCUMENT" | LINES -> "LINES")

let json_input_to_xml w (x : json_input) =
  ignore
    [
      (match x.type_ with
      | None -> null w
      | Some v -> element w "Type" (fun w -> json_type_to_xml w v));
    ]

let compression_type_to_xml w (x : compression_type) =
  text w (match x with NONE -> "NONE" | GZIP -> "GZIP" | BZIP2 -> "BZIP2")

let comments_to_xml w v = text w v

let file_header_info_to_xml w (x : file_header_info) =
  text w (match x with USE -> "USE" | IGNORE -> "IGNORE" | NONE -> "NONE")

let csv_input_to_xml w (x : csv_input) =
  ignore
    [
      (match x.file_header_info with
      | None -> null w
      | Some v -> element w "FileHeaderInfo" (fun w -> file_header_info_to_xml w v));
      (match x.comments with
      | None -> null w
      | Some v -> element w "Comments" (fun w -> comments_to_xml w v));
      (match x.quote_escape_character with
      | None -> null w
      | Some v -> element w "QuoteEscapeCharacter" (fun w -> quote_escape_character_to_xml w v));
      (match x.record_delimiter with
      | None -> null w
      | Some v -> element w "RecordDelimiter" (fun w -> record_delimiter_to_xml w v));
      (match x.field_delimiter with
      | None -> null w
      | Some v -> element w "FieldDelimiter" (fun w -> field_delimiter_to_xml w v));
      (match x.quote_character with
      | None -> null w
      | Some v -> element w "QuoteCharacter" (fun w -> quote_character_to_xml w v));
      (match x.allow_quoted_record_delimiter with
      | None -> null w
      | Some v ->
          element w "AllowQuotedRecordDelimiter" (fun w -> allow_quoted_record_delimiter_to_xml w v));
    ]

let input_serialization_to_xml w (x : input_serialization) =
  ignore
    [
      (match x.cs_v with
      | None -> null w
      | Some v -> element w "CSV" (fun w -> csv_input_to_xml w v));
      (match x.compression_type with
      | None -> null w
      | Some v -> element w "CompressionType" (fun w -> compression_type_to_xml w v));
      (match x.jso_n with
      | None -> null w
      | Some v -> element w "JSON" (fun w -> json_input_to_xml w v));
      (match x.parquet with
      | None -> null w
      | Some v -> element w "Parquet" (fun w -> parquet_input_to_xml w v));
    ]

let enable_request_progress_to_xml w v = text w (string_of_bool v)

let request_progress_to_xml w (x : request_progress) =
  ignore
    [
      (match x.enabled with
      | None -> null w
      | Some v -> element w "Enabled" (fun w -> enable_request_progress_to_xml w v));
    ]

let expression_type_to_xml w (x : expression_type) = text w (match x with SQL -> "SQL")
let expression_to_xml w v = text w v

let select_object_content_request_to_xml w (x : select_object_content_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      element w "Expression" (fun w -> expression_to_xml w x.expression);
      element w "ExpressionType" (fun w -> expression_type_to_xml w x.expression_type);
      (match x.request_progress with
      | None -> null w
      | Some v -> element w "RequestProgress" (fun w -> request_progress_to_xml w v));
      element w "InputSerialization" (fun w -> input_serialization_to_xml w x.input_serialization);
      element w "OutputSerialization" (fun w ->
          output_serialization_to_xml w x.output_serialization);
      (match x.scan_range with
      | None -> null w
      | Some v -> element w "ScanRange" (fun w -> scan_range_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let object_already_in_active_tier_error_to_xml w _x = null w
let restore_output_path_to_xml w v = text w v

let restore_object_output_to_xml w (x : restore_object_output) =
  ignore
    [
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.restore_output_path with
      | None -> null w
      | Some v -> element w "RestoreOutputPath" (fun w -> restore_output_path_to_xml w v));
    ]

let metadata_entry_to_xml w (x : metadata_entry) =
  ignore
    [
      (match x.name with
      | None -> null w
      | Some v -> element w "Name" (fun w -> metadata_key_to_xml w v));
      (match x.value with
      | None -> null w
      | Some v -> element w "Value" (fun w -> metadata_value_to_xml w v));
    ]

let user_metadata_to_xml w xs =
  List.iter (fun item -> element w "MetadataEntry" (fun w -> metadata_entry_to_xml w item)) xs

let value_to_xml w v = text w v

let tag_to_xml w (x : tag) =
  ignore
    [
      element w "Key" (fun w -> object_key_to_xml w x.key);
      element w "Value" (fun w -> value_to_xml w x.value);
    ]

let tag_set_to_xml w xs = List.iter (fun item -> element w "Tag" (fun w -> tag_to_xml w item)) xs

let tagging_to_xml w (x : tagging) =
  ignore [ element w "TagSet" (fun w -> tag_set_to_xml w x.tag_set) ]

let object_canned_ac_l_to_xml w (x : object_canned_ac_l) =
  text w
    (match x with
    | Private -> "private"
    | Public_read -> "public-read"
    | Public_read_write -> "public-read-write"
    | Authenticated_read -> "authenticated-read"
    | Aws_exec_read -> "aws-exec-read"
    | Bucket_owner_read -> "bucket-owner-read"
    | Bucket_owner_full_control -> "bucket-owner-full-control")

let kms_context_to_xml w v = text w v

let encryption_to_xml w (x : encryption) =
  ignore
    [
      element w "EncryptionType" (fun w -> server_side_encryption_to_xml w x.encryption_type);
      (match x.kms_key_id with
      | None -> null w
      | Some v -> element w "KMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.kms_context with
      | None -> null w
      | Some v -> element w "KMSContext" (fun w -> kms_context_to_xml w v));
    ]

let location_prefix_to_xml w v = text w v

let s3_location_to_xml w (x : s3_location) =
  ignore
    [
      element w "BucketName" (fun w -> bucket_name_to_xml w x.bucket_name);
      element w "Prefix" (fun w -> location_prefix_to_xml w x.prefix);
      (match x.encryption with
      | None -> null w
      | Some v -> element w "Encryption" (fun w -> encryption_to_xml w v));
      (match x.canned_ac_l with
      | None -> null w
      | Some v -> element w "CannedACL" (fun w -> object_canned_ac_l_to_xml w v));
      (match x.access_control_list with
      | None -> null w
      | Some v -> element w "AccessControlList" (fun w -> grants_to_xml w v));
      (match x.tagging with
      | None -> null w
      | Some v -> element w "Tagging" (fun w -> tagging_to_xml w v));
      (match x.user_metadata with
      | None -> null w
      | Some v -> element w "UserMetadata" (fun w -> user_metadata_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
    ]

let output_location_to_xml w (x : output_location) =
  ignore
    [
      (match x.s3 with
      | None -> null w
      | Some v -> element w "S3" (fun w -> s3_location_to_xml w v));
    ]

let select_parameters_to_xml w (x : select_parameters) =
  ignore
    [
      element w "InputSerialization" (fun w -> input_serialization_to_xml w x.input_serialization);
      element w "ExpressionType" (fun w -> expression_type_to_xml w x.expression_type);
      element w "Expression" (fun w -> expression_to_xml w x.expression);
      element w "OutputSerialization" (fun w ->
          output_serialization_to_xml w x.output_serialization);
    ]

let description_to_xml w v = text w v

let tier_to_xml w (x : tier) =
  text w (match x with Standard -> "Standard" | Bulk -> "Bulk" | Expedited -> "Expedited")

let restore_request_type_to_xml w (x : restore_request_type) =
  text w (match x with SELECT -> "SELECT")

let glacier_job_parameters_to_xml w (x : glacier_job_parameters) =
  ignore [ element w "Tier" (fun w -> tier_to_xml w x.tier) ]

let days_to_xml w v = text w (string_of_int v)

let restore_request_to_xml w (x : restore_request) =
  ignore
    [
      (match x.days with None -> null w | Some v -> element w "Days" (fun w -> days_to_xml w v));
      (match x.glacier_job_parameters with
      | None -> null w
      | Some v -> element w "GlacierJobParameters" (fun w -> glacier_job_parameters_to_xml w v));
      (match x.type_ with
      | None -> null w
      | Some v -> element w "Type" (fun w -> restore_request_type_to_xml w v));
      (match x.tier with None -> null w | Some v -> element w "Tier" (fun w -> tier_to_xml w v));
      (match x.description with
      | None -> null w
      | Some v -> element w "Description" (fun w -> description_to_xml w v));
      (match x.select_parameters with
      | None -> null w
      | Some v -> element w "SelectParameters" (fun w -> select_parameters_to_xml w v));
      (match x.output_location with
      | None -> null w
      | Some v -> element w "OutputLocation" (fun w -> output_location_to_xml w v));
    ]

let restore_object_request_to_xml w (x : restore_object_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.restore_request with
      | None -> null w
      | Some v -> element w "RestoreRequest" (fun w -> restore_request_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let idempotency_parameter_mismatch_to_xml w _x = null w
let rename_object_output_to_xml w _x = null w
let client_token_to_xml w v = text w v

let rename_source_if_unmodified_since_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)

let rename_source_if_modified_since_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)

let rename_source_if_none_match_to_xml w v = text w v
let rename_source_if_match_to_xml w v = text w v

let if_unmodified_since_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let if_modified_since_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let if_none_match_to_xml w v = text w v
let if_match_to_xml w v = text w v
let rename_source_to_xml w v = text w v

let rename_object_request_to_xml w (x : rename_object_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      element w "RenameSource" (fun w -> rename_source_to_xml w x.rename_source);
      (match x.destination_if_match with
      | None -> null w
      | Some v -> element w "DestinationIfMatch" (fun w -> if_match_to_xml w v));
      (match x.destination_if_none_match with
      | None -> null w
      | Some v -> element w "DestinationIfNoneMatch" (fun w -> if_none_match_to_xml w v));
      (match x.destination_if_modified_since with
      | None -> null w
      | Some v -> element w "DestinationIfModifiedSince" (fun w -> if_modified_since_to_xml w v));
      (match x.destination_if_unmodified_since with
      | None -> null w
      | Some v -> element w "DestinationIfUnmodifiedSince" (fun w -> if_unmodified_since_to_xml w v));
      (match x.source_if_match with
      | None -> null w
      | Some v -> element w "SourceIfMatch" (fun w -> rename_source_if_match_to_xml w v));
      (match x.source_if_none_match with
      | None -> null w
      | Some v -> element w "SourceIfNoneMatch" (fun w -> rename_source_if_none_match_to_xml w v));
      (match x.source_if_modified_since with
      | None -> null w
      | Some v ->
          element w "SourceIfModifiedSince" (fun w -> rename_source_if_modified_since_to_xml w v));
      (match x.source_if_unmodified_since with
      | None -> null w
      | Some v ->
          element w "SourceIfUnmodifiedSince" (fun w ->
              rename_source_if_unmodified_since_to_xml w v));
      (match x.client_token with
      | None ->
          element w "ClientToken" (fun w -> client_token_to_xml w (Smaws_Lib.Uuid.generate ()))
      | Some v -> element w "ClientToken" (fun w -> client_token_to_xml w v));
    ]

let setting_to_xml w v = text w (string_of_bool v)

let public_access_block_configuration_to_xml w (x : public_access_block_configuration) =
  ignore
    [
      (match x.block_public_acls with
      | None -> null w
      | Some v -> element w "BlockPublicAcls" (fun w -> setting_to_xml w v));
      (match x.ignore_public_acls with
      | None -> null w
      | Some v -> element w "IgnorePublicAcls" (fun w -> setting_to_xml w v));
      (match x.block_public_policy with
      | None -> null w
      | Some v -> element w "BlockPublicPolicy" (fun w -> setting_to_xml w v));
      (match x.restrict_public_buckets with
      | None -> null w
      | Some v -> element w "RestrictPublicBuckets" (fun w -> setting_to_xml w v));
    ]

let put_public_access_block_request_to_xml w (x : put_public_access_block_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "PublicAccessBlockConfiguration" (fun w ->
          public_access_block_configuration_to_xml w x.public_access_block_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let put_object_tagging_output_to_xml w (x : put_object_tagging_output) =
  ignore
    [
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
    ]

let put_object_tagging_request_to_xml w (x : put_object_tagging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "Tagging" (fun w -> tagging_to_xml w x.tagging);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
    ]

let put_object_retention_output_to_xml w (x : put_object_retention_output) =
  ignore
    [
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let bypass_governance_retention_to_xml w v = text w (string_of_bool v)
let date_to_xml w v = text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let object_lock_retention_mode_to_xml w (x : object_lock_retention_mode) =
  text w (match x with GOVERNANCE -> "GOVERNANCE" | COMPLIANCE -> "COMPLIANCE")

let object_lock_retention_to_xml w (x : object_lock_retention) =
  ignore
    [
      (match x.mode with
      | None -> null w
      | Some v -> element w "Mode" (fun w -> object_lock_retention_mode_to_xml w v));
      (match x.retain_until_date with
      | None -> null w
      | Some v -> element w "RetainUntilDate" (fun w -> date_to_xml w v));
    ]

let put_object_retention_request_to_xml w (x : put_object_retention_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.retention with
      | None -> null w
      | Some v -> element w "Retention" (fun w -> object_lock_retention_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.bypass_governance_retention with
      | None -> null w
      | Some v ->
          element w "BypassGovernanceRetention" (fun w -> bypass_governance_retention_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let put_object_lock_configuration_output_to_xml w (x : put_object_lock_configuration_output) =
  ignore
    [
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let object_lock_token_to_xml w v = text w v
let years_to_xml w v = text w (string_of_int v)

let default_retention_to_xml w (x : default_retention) =
  ignore
    [
      (match x.mode with
      | None -> null w
      | Some v -> element w "Mode" (fun w -> object_lock_retention_mode_to_xml w v));
      (match x.days with None -> null w | Some v -> element w "Days" (fun w -> days_to_xml w v));
      (match x.years with
      | None -> null w
      | Some v -> element w "Years" (fun w -> years_to_xml w v));
    ]

let object_lock_rule_to_xml w (x : object_lock_rule) =
  ignore
    [
      (match x.default_retention with
      | None -> null w
      | Some v -> element w "DefaultRetention" (fun w -> default_retention_to_xml w v));
    ]

let object_lock_enabled_to_xml w (x : object_lock_enabled) =
  text w (match x with Enabled -> "Enabled")

let object_lock_configuration_to_xml w (x : object_lock_configuration) =
  ignore
    [
      (match x.object_lock_enabled with
      | None -> null w
      | Some v -> element w "ObjectLockEnabled" (fun w -> object_lock_enabled_to_xml w v));
      (match x.rule with
      | None -> null w
      | Some v -> element w "Rule" (fun w -> object_lock_rule_to_xml w v));
    ]

let put_object_lock_configuration_request_to_xml w (x : put_object_lock_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.object_lock_configuration with
      | None -> null w
      | Some v ->
          element w "ObjectLockConfiguration" (fun w -> object_lock_configuration_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.token with
      | None -> null w
      | Some v -> element w "Token" (fun w -> object_lock_token_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let put_object_legal_hold_output_to_xml w (x : put_object_legal_hold_output) =
  ignore
    [
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let object_lock_legal_hold_to_xml w (x : object_lock_legal_hold) =
  ignore
    [
      (match x.status with
      | None -> null w
      | Some v -> element w "Status" (fun w -> object_lock_legal_hold_status_to_xml w v));
    ]

let put_object_legal_hold_request_to_xml w (x : put_object_legal_hold_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.legal_hold with
      | None -> null w
      | Some v -> element w "LegalHold" (fun w -> object_lock_legal_hold_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let unsupported_media_type_to_xml w _x = null w
let no_such_bucket_to_xml w _x = null w
let invalid_annotation_name_to_xml w _x = null w
let annotation_name_too_long_to_xml w _x = null w
let annotation_limit_exceeded_to_xml w _x = null w

let checksum_type_to_xml w (x : checksum_type) =
  text w (match x with COMPOSITE -> "COMPOSITE" | FULL_OBJECT -> "FULL_OBJECT")

let annotation_name_to_xml w v = text w v

let put_object_annotation_output_to_xml w (x : put_object_annotation_output) =
  ignore
    [
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.annotation_name with
      | None -> null w
      | Some v -> element w "AnnotationName" (fun w -> annotation_name_to_xml w v));
      (match x.object_version_id with
      | None -> null w
      | Some v -> element w "ObjectVersionId" (fun w -> object_version_id_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let object_if_match_to_xml w v = text w v

let put_object_annotation_request_to_xml w (x : put_object_annotation_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      element w "AnnotationName" (fun w -> annotation_name_to_xml w x.annotation_name);
      element w "AnnotationPayload" (fun w -> streaming_blob_to_xml w x.annotation_payload);
      (match x.object_if_match with
      | None -> null w
      | Some v -> element w "ObjectIfMatch" (fun w -> object_if_match_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let put_object_acl_output_to_xml w (x : put_object_acl_output) =
  ignore
    [
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let grant_write_ac_p_to_xml w v = text w v
let grant_write_to_xml w v = text w v
let grant_read_ac_p_to_xml w v = text w v
let grant_read_to_xml w v = text w v
let grant_full_control_to_xml w v = text w v

let put_object_acl_request_to_xml w (x : put_object_acl_request) =
  ignore
    [
      (match x.ac_l with
      | None -> null w
      | Some v -> element w "ACL" (fun w -> object_canned_ac_l_to_xml w v));
      (match x.access_control_policy with
      | None -> null w
      | Some v -> element w "AccessControlPolicy" (fun w -> access_control_policy_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.grant_full_control with
      | None -> null w
      | Some v -> element w "GrantFullControl" (fun w -> grant_full_control_to_xml w v));
      (match x.grant_read with
      | None -> null w
      | Some v -> element w "GrantRead" (fun w -> grant_read_to_xml w v));
      (match x.grant_read_ac_p with
      | None -> null w
      | Some v -> element w "GrantReadACP" (fun w -> grant_read_ac_p_to_xml w v));
      (match x.grant_write with
      | None -> null w
      | Some v -> element w "GrantWrite" (fun w -> grant_write_to_xml w v));
      (match x.grant_write_ac_p with
      | None -> null w
      | Some v -> element w "GrantWriteACP" (fun w -> grant_write_ac_p_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let too_many_parts_to_xml w _x = null w
let invalid_write_offset_to_xml w _x = null w
let encryption_type_mismatch_to_xml w _x = null w
let size_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)
let ssekms_encryption_context_to_xml w v = text w v

let put_object_output_to_xml w (x : put_object_output) =
  ignore
    [
      (match x.expiration with
      | None -> null w
      | Some v -> element w "Expiration" (fun w -> expiration_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.size with None -> null w | Some v -> element w "Size" (fun w -> size_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let tagging_header_to_xml w v = text w v
let website_redirect_location_to_xml w v = text w v
let write_offset_bytes_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)

let put_object_request_to_xml w (x : put_object_request) =
  ignore
    [
      (match x.ac_l with
      | None -> null w
      | Some v -> element w "ACL" (fun w -> object_canned_ac_l_to_xml w v));
      (match x.body with
      | None -> null w
      | Some v -> element w "Body" (fun w -> streaming_blob_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.cache_control with
      | None -> null w
      | Some v -> element w "CacheControl" (fun w -> cache_control_to_xml w v));
      (match x.content_disposition with
      | None -> null w
      | Some v -> element w "ContentDisposition" (fun w -> content_disposition_to_xml w v));
      (match x.content_encoding with
      | None -> null w
      | Some v -> element w "ContentEncoding" (fun w -> content_encoding_to_xml w v));
      (match x.content_language with
      | None -> null w
      | Some v -> element w "ContentLanguage" (fun w -> content_language_to_xml w v));
      (match x.content_length with
      | None -> null w
      | Some v -> element w "ContentLength" (fun w -> content_length_to_xml w v));
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.content_type with
      | None -> null w
      | Some v -> element w "ContentType" (fun w -> content_type_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.expires with
      | None -> null w
      | Some v -> element w "Expires" (fun w -> expires_to_xml w v));
      (match x.if_match with
      | None -> null w
      | Some v -> element w "IfMatch" (fun w -> if_match_to_xml w v));
      (match x.if_none_match with
      | None -> null w
      | Some v -> element w "IfNoneMatch" (fun w -> if_none_match_to_xml w v));
      (match x.grant_full_control with
      | None -> null w
      | Some v -> element w "GrantFullControl" (fun w -> grant_full_control_to_xml w v));
      (match x.grant_read with
      | None -> null w
      | Some v -> element w "GrantRead" (fun w -> grant_read_to_xml w v));
      (match x.grant_read_ac_p with
      | None -> null w
      | Some v -> element w "GrantReadACP" (fun w -> grant_read_ac_p_to_xml w v));
      (match x.grant_write_ac_p with
      | None -> null w
      | Some v -> element w "GrantWriteACP" (fun w -> grant_write_ac_p_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.write_offset_bytes with
      | None -> null w
      | Some v -> element w "WriteOffsetBytes" (fun w -> write_offset_bytes_to_xml w v));
      (match x.metadata with
      | None -> null w
      | Some v -> element w "Metadata" (fun w -> metadata_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.website_redirect_location with
      | None -> null w
      | Some v ->
          element w "WebsiteRedirectLocation" (fun w -> website_redirect_location_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.tagging with
      | None -> null w
      | Some v -> element w "Tagging" (fun w -> tagging_header_to_xml w v));
      (match x.object_lock_mode with
      | None -> null w
      | Some v -> element w "ObjectLockMode" (fun w -> object_lock_mode_to_xml w v));
      (match x.object_lock_retain_until_date with
      | None -> null w
      | Some v ->
          element w "ObjectLockRetainUntilDate" (fun w -> object_lock_retain_until_date_to_xml w v));
      (match x.object_lock_legal_hold_status with
      | None -> null w
      | Some v ->
          element w "ObjectLockLegalHoldStatus" (fun w -> object_lock_legal_hold_status_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let replace_key_with_to_xml w v = text w v
let replace_key_prefix_with_to_xml w v = text w v
let protocol_to_xml w (x : protocol) = text w (match x with Http -> "http" | Https -> "https")
let http_redirect_code_to_xml w v = text w v
let host_name_to_xml w v = text w v

let redirect_to_xml w (x : redirect) =
  ignore
    [
      (match x.host_name with
      | None -> null w
      | Some v -> element w "HostName" (fun w -> host_name_to_xml w v));
      (match x.http_redirect_code with
      | None -> null w
      | Some v -> element w "HttpRedirectCode" (fun w -> http_redirect_code_to_xml w v));
      (match x.protocol with
      | None -> null w
      | Some v -> element w "Protocol" (fun w -> protocol_to_xml w v));
      (match x.replace_key_prefix_with with
      | None -> null w
      | Some v -> element w "ReplaceKeyPrefixWith" (fun w -> replace_key_prefix_with_to_xml w v));
      (match x.replace_key_with with
      | None -> null w
      | Some v -> element w "ReplaceKeyWith" (fun w -> replace_key_with_to_xml w v));
    ]

let key_prefix_equals_to_xml w v = text w v
let http_error_code_returned_equals_to_xml w v = text w v

let condition_to_xml w (x : condition) =
  ignore
    [
      (match x.http_error_code_returned_equals with
      | None -> null w
      | Some v ->
          element w "HttpErrorCodeReturnedEquals" (fun w ->
              http_error_code_returned_equals_to_xml w v));
      (match x.key_prefix_equals with
      | None -> null w
      | Some v -> element w "KeyPrefixEquals" (fun w -> key_prefix_equals_to_xml w v));
    ]

let routing_rule_to_xml w (x : routing_rule) =
  ignore
    [
      (match x.condition with
      | None -> null w
      | Some v -> element w "Condition" (fun w -> condition_to_xml w v));
      element w "Redirect" (fun w -> redirect_to_xml w x.redirect);
    ]

let routing_rules_to_xml w xs =
  List.iter (fun item -> element w "RoutingRule" (fun w -> routing_rule_to_xml w item)) xs

let redirect_all_requests_to_to_xml w (x : redirect_all_requests_to) =
  ignore
    [
      element w "HostName" (fun w -> host_name_to_xml w x.host_name);
      (match x.protocol with
      | None -> null w
      | Some v -> element w "Protocol" (fun w -> protocol_to_xml w v));
    ]

let suffix_to_xml w v = text w v

let index_document_to_xml w (x : index_document) =
  ignore [ element w "Suffix" (fun w -> suffix_to_xml w x.suffix) ]

let error_document_to_xml w (x : error_document) =
  ignore [ element w "Key" (fun w -> object_key_to_xml w x.key) ]

let website_configuration_to_xml w (x : website_configuration) =
  ignore
    [
      (match x.error_document with
      | None -> null w
      | Some v -> element w "ErrorDocument" (fun w -> error_document_to_xml w v));
      (match x.index_document with
      | None -> null w
      | Some v -> element w "IndexDocument" (fun w -> index_document_to_xml w v));
      (match x.redirect_all_requests_to with
      | None -> null w
      | Some v -> element w "RedirectAllRequestsTo" (fun w -> redirect_all_requests_to_to_xml w v));
      (match x.routing_rules with
      | None -> null w
      | Some v -> element w "RoutingRules" (fun w -> routing_rules_to_xml w v));
    ]

let put_bucket_website_request_to_xml w (x : put_bucket_website_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "WebsiteConfiguration" (fun w ->
          website_configuration_to_xml w x.website_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let bucket_versioning_status_to_xml w (x : bucket_versioning_status) =
  text w (match x with Enabled -> "Enabled" | Suspended -> "Suspended")

let mfa_delete_to_xml w (x : mfa_delete) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let versioning_configuration_to_xml w (x : versioning_configuration) =
  ignore
    [
      (match x.mfa_delete with
      | None -> null w
      | Some v -> element w "MfaDelete" (fun w -> mfa_delete_to_xml w v));
      (match x.status with
      | None -> null w
      | Some v -> element w "Status" (fun w -> bucket_versioning_status_to_xml w v));
    ]

let mf_a_to_xml w v = text w v

let put_bucket_versioning_request_to_xml w (x : put_bucket_versioning_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.mf_a with None -> null w | Some v -> element w "MFA" (fun w -> mf_a_to_xml w v));
      element w "VersioningConfiguration" (fun w ->
          versioning_configuration_to_xml w x.versioning_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let put_bucket_tagging_request_to_xml w (x : put_bucket_tagging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "Tagging" (fun w -> tagging_to_xml w x.tagging);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let payer_to_xml w (x : payer) =
  text w (match x with Requester -> "Requester" | BucketOwner -> "BucketOwner")

let request_payment_configuration_to_xml w (x : request_payment_configuration) =
  ignore [ element w "Payer" (fun w -> payer_to_xml w x.payer) ]

let put_bucket_request_payment_request_to_xml w (x : put_bucket_request_payment_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "RequestPaymentConfiguration" (fun w ->
          request_payment_configuration_to_xml w x.request_payment_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_marker_replication_status_to_xml w (x : delete_marker_replication_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let delete_marker_replication_to_xml w (x : delete_marker_replication) =
  ignore
    [
      (match x.status with
      | None -> null w
      | Some v -> element w "Status" (fun w -> delete_marker_replication_status_to_xml w v));
    ]

let minutes_to_xml w v = text w (string_of_int v)

let replication_time_value_to_xml w (x : replication_time_value) =
  ignore
    [
      (match x.minutes with
      | None -> null w
      | Some v -> element w "Minutes" (fun w -> minutes_to_xml w v));
    ]

let metrics_status_to_xml w (x : metrics_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let metrics_to_xml w (x : metrics) =
  ignore
    [
      element w "Status" (fun w -> metrics_status_to_xml w x.status);
      (match x.event_threshold with
      | None -> null w
      | Some v -> element w "EventThreshold" (fun w -> replication_time_value_to_xml w v));
    ]

let replication_time_status_to_xml w (x : replication_time_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let replication_time_to_xml w (x : replication_time) =
  ignore
    [
      element w "Status" (fun w -> replication_time_status_to_xml w x.status);
      element w "Time" (fun w -> replication_time_value_to_xml w x.time);
    ]

let replica_kms_key_i_d_to_xml w v = text w v

let encryption_configuration_to_xml w (x : encryption_configuration) =
  ignore
    [
      (match x.replica_kms_key_i_d with
      | None -> null w
      | Some v -> element w "ReplicaKmsKeyID" (fun w -> replica_kms_key_i_d_to_xml w v));
    ]

let destination_to_xml w (x : destination) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.account with
      | None -> null w
      | Some v -> element w "Account" (fun w -> account_id_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.access_control_translation with
      | None -> null w
      | Some v ->
          element w "AccessControlTranslation" (fun w -> access_control_translation_to_xml w v));
      (match x.encryption_configuration with
      | None -> null w
      | Some v -> element w "EncryptionConfiguration" (fun w -> encryption_configuration_to_xml w v));
      (match x.replication_time with
      | None -> null w
      | Some v -> element w "ReplicationTime" (fun w -> replication_time_to_xml w v));
      (match x.metrics with
      | None -> null w
      | Some v -> element w "Metrics" (fun w -> metrics_to_xml w v));
    ]

let existing_object_replication_status_to_xml w (x : existing_object_replication_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let existing_object_replication_to_xml w (x : existing_object_replication) =
  ignore [ element w "Status" (fun w -> existing_object_replication_status_to_xml w x.status) ]

let replica_modifications_status_to_xml w (x : replica_modifications_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let replica_modifications_to_xml w (x : replica_modifications) =
  ignore [ element w "Status" (fun w -> replica_modifications_status_to_xml w x.status) ]

let sse_kms_encrypted_objects_status_to_xml w (x : sse_kms_encrypted_objects_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let sse_kms_encrypted_objects_to_xml w (x : sse_kms_encrypted_objects) =
  ignore [ element w "Status" (fun w -> sse_kms_encrypted_objects_status_to_xml w x.status) ]

let source_selection_criteria_to_xml w (x : source_selection_criteria) =
  ignore
    [
      (match x.sse_kms_encrypted_objects with
      | None -> null w
      | Some v -> element w "SseKmsEncryptedObjects" (fun w -> sse_kms_encrypted_objects_to_xml w v));
      (match x.replica_modifications with
      | None -> null w
      | Some v -> element w "ReplicaModifications" (fun w -> replica_modifications_to_xml w v));
    ]

let replication_rule_status_to_xml w (x : replication_rule_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let prefix_to_xml w v = text w v

let replication_rule_and_operator_to_xml w (x : replication_rule_and_operator) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tags with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Tag" (fun w -> tag_to_xml w item)) v);
    ]

let replication_rule_filter_to_xml w (x : replication_rule_filter) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tag with None -> null w | Some v -> element w "Tag" (fun w -> tag_to_xml w v));
      (match x.and_ with
      | None -> null w
      | Some v -> element w "And" (fun w -> replication_rule_and_operator_to_xml w v));
    ]

let priority_to_xml w v = text w (string_of_int v)

let replication_rule_to_xml w (x : replication_rule) =
  ignore
    [
      (match x.i_d with None -> null w | Some v -> element w "ID" (fun w -> i_d_to_xml w v));
      (match x.priority with
      | None -> null w
      | Some v -> element w "Priority" (fun w -> priority_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> replication_rule_filter_to_xml w v));
      element w "Status" (fun w -> replication_rule_status_to_xml w x.status);
      (match x.source_selection_criteria with
      | None -> null w
      | Some v ->
          element w "SourceSelectionCriteria" (fun w -> source_selection_criteria_to_xml w v));
      (match x.existing_object_replication with
      | None -> null w
      | Some v ->
          element w "ExistingObjectReplication" (fun w -> existing_object_replication_to_xml w v));
      element w "Destination" (fun w -> destination_to_xml w x.destination);
      (match x.delete_marker_replication with
      | None -> null w
      | Some v ->
          element w "DeleteMarkerReplication" (fun w -> delete_marker_replication_to_xml w v));
    ]

let replication_rules_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> replication_rule_to_xml w item)) xs

let replication_configuration_to_xml w (x : replication_configuration) =
  ignore
    [
      element w "Role" (fun w -> role_to_xml w x.role);
      List.iter (fun item -> element w "Rule" (fun w -> replication_rule_to_xml w item)) x.rules;
    ]

let put_bucket_replication_request_to_xml w (x : put_bucket_replication_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "ReplicationConfiguration" (fun w ->
          replication_configuration_to_xml w x.replication_configuration);
      (match x.token with
      | None -> null w
      | Some v -> element w "Token" (fun w -> object_lock_token_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let policy_to_xml w v = text w v
let confirm_remove_self_bucket_access_to_xml w v = text w (string_of_bool v)

let put_bucket_policy_request_to_xml w (x : put_bucket_policy_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.confirm_remove_self_bucket_access with
      | None -> null w
      | Some v ->
          element w "ConfirmRemoveSelfBucketAccess" (fun w ->
              confirm_remove_self_bucket_access_to_xml w v));
      element w "Policy" (fun w -> policy_to_xml w x.policy);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let object_ownership_to_xml w (x : object_ownership) =
  text w
    (match x with
    | BucketOwnerPreferred -> "BucketOwnerPreferred"
    | ObjectWriter -> "ObjectWriter"
    | BucketOwnerEnforced -> "BucketOwnerEnforced")

let ownership_controls_rule_to_xml w (x : ownership_controls_rule) =
  ignore [ element w "ObjectOwnership" (fun w -> object_ownership_to_xml w x.object_ownership) ]

let ownership_controls_rules_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> ownership_controls_rule_to_xml w item)) xs

let ownership_controls_to_xml w (x : ownership_controls) =
  ignore
    [
      List.iter
        (fun item -> element w "Rule" (fun w -> ownership_controls_rule_to_xml w item))
        x.rules;
    ]

let put_bucket_ownership_controls_request_to_xml w (x : put_bucket_ownership_controls_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      element w "OwnershipControls" (fun w -> ownership_controls_to_xml w x.ownership_controls);
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
    ]

let skip_validation_to_xml w v = text w (string_of_bool v)
let event_bridge_configuration_to_xml w _x = null w
let filter_rule_value_to_xml w v = text w v

let filter_rule_name_to_xml w (x : filter_rule_name) =
  text w (match x with Prefix -> "prefix" | Suffix -> "suffix")

let filter_rule_to_xml w (x : filter_rule) =
  ignore
    [
      (match x.name with
      | None -> null w
      | Some v -> element w "Name" (fun w -> filter_rule_name_to_xml w v));
      (match x.value with
      | None -> null w
      | Some v -> element w "Value" (fun w -> filter_rule_value_to_xml w v));
    ]

let filter_rule_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> filter_rule_to_xml w item)) xs

let s3_key_filter_to_xml w (x : s3_key_filter) =
  ignore
    [
      (match x.filter_rules with
      | None -> null w
      | Some v ->
          List.iter (fun item -> element w "FilterRule" (fun w -> filter_rule_to_xml w item)) v);
    ]

let notification_configuration_filter_to_xml w (x : notification_configuration_filter) =
  ignore
    [
      (match x.key with
      | None -> null w
      | Some v -> element w "S3Key" (fun w -> s3_key_filter_to_xml w v));
    ]

let event_to_xml w (x : event) =
  text w
    (match x with
    | S3_ReducedRedundancyLostObject -> "s3:ReducedRedundancyLostObject"
    | S3_ObjectCreated_ -> "s3:ObjectCreated:*"
    | S3_ObjectCreated_Put -> "s3:ObjectCreated:Put"
    | S3_ObjectCreated_Post -> "s3:ObjectCreated:Post"
    | S3_ObjectCreated_Copy -> "s3:ObjectCreated:Copy"
    | S3_ObjectCreated_CompleteMultipartUpload -> "s3:ObjectCreated:CompleteMultipartUpload"
    | S3_ObjectRemoved_ -> "s3:ObjectRemoved:*"
    | S3_ObjectRemoved_Delete -> "s3:ObjectRemoved:Delete"
    | S3_ObjectRemoved_DeleteMarkerCreated -> "s3:ObjectRemoved:DeleteMarkerCreated"
    | S3_ObjectRestore_ -> "s3:ObjectRestore:*"
    | S3_ObjectRestore_Post -> "s3:ObjectRestore:Post"
    | S3_ObjectRestore_Completed -> "s3:ObjectRestore:Completed"
    | S3_Replication_ -> "s3:Replication:*"
    | S3_Replication_OperationFailedReplication -> "s3:Replication:OperationFailedReplication"
    | S3_Replication_OperationNotTracked -> "s3:Replication:OperationNotTracked"
    | S3_Replication_OperationMissedThreshold -> "s3:Replication:OperationMissedThreshold"
    | S3_Replication_OperationReplicatedAfterThreshold ->
        "s3:Replication:OperationReplicatedAfterThreshold"
    | S3_ObjectRestore_Delete -> "s3:ObjectRestore:Delete"
    | S3_LifecycleTransition -> "s3:LifecycleTransition"
    | S3_IntelligentTiering -> "s3:IntelligentTiering"
    | S3_ObjectAcl_Put -> "s3:ObjectAcl:Put"
    | S3_LifecycleExpiration_ -> "s3:LifecycleExpiration:*"
    | S3_LifecycleExpiration_Delete -> "s3:LifecycleExpiration:Delete"
    | S3_LifecycleExpiration_DeleteMarkerCreated -> "s3:LifecycleExpiration:DeleteMarkerCreated"
    | S3_ObjectTagging_ -> "s3:ObjectTagging:*"
    | S3_ObjectTagging_Put -> "s3:ObjectTagging:Put"
    | S3_ObjectTagging_Delete -> "s3:ObjectTagging:Delete"
    | S3_ObjectAnnotation_ -> "s3:ObjectAnnotation:*"
    | S3_ObjectAnnotation_Put -> "s3:ObjectAnnotation:Put"
    | S3_ObjectAnnotation_Delete -> "s3:ObjectAnnotation:Delete")

let event_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> event_to_xml w item)) xs

let lambda_function_arn_to_xml w v = text w v
let notification_id_to_xml w v = text w v

let lambda_function_configuration_to_xml w (x : lambda_function_configuration) =
  ignore
    [
      (match x.id with
      | None -> null w
      | Some v -> element w "Id" (fun w -> notification_id_to_xml w v));
      element w "CloudFunction" (fun w -> lambda_function_arn_to_xml w x.lambda_function_arn);
      List.iter (fun item -> element w "Event" (fun w -> event_to_xml w item)) x.events;
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> notification_configuration_filter_to_xml w v));
    ]

let lambda_function_configuration_list_to_xml w xs =
  List.iter
    (fun item -> element w "member" (fun w -> lambda_function_configuration_to_xml w item))
    xs

let queue_arn_to_xml w v = text w v

let queue_configuration_to_xml w (x : queue_configuration) =
  ignore
    [
      (match x.id with
      | None -> null w
      | Some v -> element w "Id" (fun w -> notification_id_to_xml w v));
      element w "Queue" (fun w -> queue_arn_to_xml w x.queue_arn);
      List.iter (fun item -> element w "Event" (fun w -> event_to_xml w item)) x.events;
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> notification_configuration_filter_to_xml w v));
    ]

let queue_configuration_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> queue_configuration_to_xml w item)) xs

let topic_arn_to_xml w v = text w v

let topic_configuration_to_xml w (x : topic_configuration) =
  ignore
    [
      (match x.id with
      | None -> null w
      | Some v -> element w "Id" (fun w -> notification_id_to_xml w v));
      element w "Topic" (fun w -> topic_arn_to_xml w x.topic_arn);
      List.iter (fun item -> element w "Event" (fun w -> event_to_xml w item)) x.events;
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> notification_configuration_filter_to_xml w v));
    ]

let topic_configuration_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> topic_configuration_to_xml w item)) xs

let notification_configuration_to_xml w (x : notification_configuration) =
  ignore
    [
      (match x.topic_configurations with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "TopicConfiguration" (fun w -> topic_configuration_to_xml w item))
            v);
      (match x.queue_configurations with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "QueueConfiguration" (fun w -> queue_configuration_to_xml w item))
            v);
      (match x.lambda_function_configurations with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "CloudFunctionConfiguration" (fun w ->
                  lambda_function_configuration_to_xml w item))
            v);
      (match x.event_bridge_configuration with
      | None -> null w
      | Some v ->
          element w "EventBridgeConfiguration" (fun w -> event_bridge_configuration_to_xml w v));
    ]

let put_bucket_notification_configuration_request_to_xml w
    (x : put_bucket_notification_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "NotificationConfiguration" (fun w ->
          notification_configuration_to_xml w x.notification_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.skip_destination_validation with
      | None -> null w
      | Some v -> element w "SkipDestinationValidation" (fun w -> skip_validation_to_xml w v));
    ]

let metrics_and_operator_to_xml w (x : metrics_and_operator) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tags with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Tag" (fun w -> tag_to_xml w item)) v);
      (match x.access_point_arn with
      | None -> null w
      | Some v -> element w "AccessPointArn" (fun w -> access_point_arn_to_xml w v));
    ]

let metrics_filter_to_xml w (x : metrics_filter) =
  match x with
  | Prefix v -> element w "Prefix" (fun w -> prefix_to_xml w v)
  | Tag v -> element w "Tag" (fun w -> tag_to_xml w v)
  | AccessPointArn v -> element w "AccessPointArn" (fun w -> access_point_arn_to_xml w v)
  | And v -> element w "And" (fun w -> metrics_and_operator_to_xml w v)

let metrics_id_to_xml w v = text w v

let metrics_configuration_to_xml w (x : metrics_configuration) =
  ignore
    [
      element w "Id" (fun w -> metrics_id_to_xml w x.id);
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> metrics_filter_to_xml w v));
    ]

let put_bucket_metrics_configuration_request_to_xml w (x : put_bucket_metrics_configuration_request)
    =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> metrics_id_to_xml w x.id);
      element w "MetricsConfiguration" (fun w ->
          metrics_configuration_to_xml w x.metrics_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let partition_date_source_to_xml w (x : partition_date_source) =
  text w (match x with EventTime -> "EventTime" | DeliveryTime -> "DeliveryTime")

let partitioned_prefix_to_xml w (x : partitioned_prefix) =
  ignore
    [
      (match x.partition_date_source with
      | None -> null w
      | Some v -> element w "PartitionDateSource" (fun w -> partition_date_source_to_xml w v));
    ]

let simple_prefix_to_xml w _x = null w

let target_object_key_format_to_xml w (x : target_object_key_format) =
  ignore
    [
      (match x.simple_prefix with
      | None -> null w
      | Some v -> element w "SimplePrefix" (fun w -> simple_prefix_to_xml w v));
      (match x.partitioned_prefix with
      | None -> null w
      | Some v -> element w "PartitionedPrefix" (fun w -> partitioned_prefix_to_xml w v));
    ]

let target_prefix_to_xml w v = text w v

let bucket_logs_permission_to_xml w (x : bucket_logs_permission) =
  text w (match x with FULL_CONTROL -> "FULL_CONTROL" | READ -> "READ" | WRITE -> "WRITE")

let target_grant_to_xml w (x : target_grant) =
  ignore
    [
      (match x.grantee with
      | None -> null w
      | Some v ->
          element w "Grantee"
            ~attrs:
              (("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance", None)
              :: List.concat
                   [
                     [
                       ( "xsi:type",
                         (fun (v : type_) ->
                           match v with
                           | CanonicalUser -> "CanonicalUser"
                           | AmazonCustomerByEmail -> "AmazonCustomerByEmail"
                           | Group -> "Group")
                           v.type_,
                         None );
                     ];
                   ])
            (fun w -> grantee_to_xml w v));
      (match x.permission with
      | None -> null w
      | Some v -> element w "Permission" (fun w -> bucket_logs_permission_to_xml w v));
    ]

let target_grants_to_xml w xs =
  List.iter (fun item -> element w "Grant" (fun w -> target_grant_to_xml w item)) xs

let target_bucket_to_xml w v = text w v

let logging_enabled_to_xml w (x : logging_enabled) =
  ignore
    [
      element w "TargetBucket" (fun w -> target_bucket_to_xml w x.target_bucket);
      (match x.target_grants with
      | None -> null w
      | Some v -> element w "TargetGrants" (fun w -> target_grants_to_xml w v));
      element w "TargetPrefix" (fun w -> target_prefix_to_xml w x.target_prefix);
      (match x.target_object_key_format with
      | None -> null w
      | Some v -> element w "TargetObjectKeyFormat" (fun w -> target_object_key_format_to_xml w v));
    ]

let bucket_logging_status_to_xml w (x : bucket_logging_status) =
  ignore
    [
      (match x.logging_enabled with
      | None -> null w
      | Some v -> element w "LoggingEnabled" (fun w -> logging_enabled_to_xml w v));
    ]

let put_bucket_logging_request_to_xml w (x : put_bucket_logging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "BucketLoggingStatus" (fun w ->
          bucket_logging_status_to_xml w x.bucket_logging_status);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let transition_default_minimum_object_size_to_xml w (x : transition_default_minimum_object_size) =
  text w
    (match x with
    | Varies_by_storage_class -> "varies_by_storage_class"
    | All_storage_classes_128K -> "all_storage_classes_128K")

let put_bucket_lifecycle_configuration_output_to_xml w
    (x : put_bucket_lifecycle_configuration_output) =
  ignore
    [
      (match x.transition_default_minimum_object_size with
      | None -> null w
      | Some v ->
          element w "TransitionDefaultMinimumObjectSize" (fun w ->
              transition_default_minimum_object_size_to_xml w v));
    ]

let version_count_to_xml w v = text w (string_of_int v)

let noncurrent_version_expiration_to_xml w (x : noncurrent_version_expiration) =
  ignore
    [
      (match x.noncurrent_days with
      | None -> null w
      | Some v -> element w "NoncurrentDays" (fun w -> days_to_xml w v));
      (match x.newer_noncurrent_versions with
      | None -> null w
      | Some v -> element w "NewerNoncurrentVersions" (fun w -> version_count_to_xml w v));
    ]

let transition_storage_class_to_xml w (x : transition_storage_class) =
  text w
    (match x with
    | GLACIER -> "GLACIER"
    | STANDARD_IA -> "STANDARD_IA"
    | ONEZONE_IA -> "ONEZONE_IA"
    | INTELLIGENT_TIERING -> "INTELLIGENT_TIERING"
    | DEEP_ARCHIVE -> "DEEP_ARCHIVE"
    | GLACIER_IR -> "GLACIER_IR")

let noncurrent_version_transition_to_xml w (x : noncurrent_version_transition) =
  ignore
    [
      (match x.noncurrent_days with
      | None -> null w
      | Some v -> element w "NoncurrentDays" (fun w -> days_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> transition_storage_class_to_xml w v));
      (match x.newer_noncurrent_versions with
      | None -> null w
      | Some v -> element w "NewerNoncurrentVersions" (fun w -> version_count_to_xml w v));
    ]

let noncurrent_version_transition_list_to_xml w xs =
  List.iter
    (fun item -> element w "member" (fun w -> noncurrent_version_transition_to_xml w item))
    xs

let transition_to_xml w (x : transition) =
  ignore
    [
      (match x.date with None -> null w | Some v -> element w "Date" (fun w -> date_to_xml w v));
      (match x.days with None -> null w | Some v -> element w "Days" (fun w -> days_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> transition_storage_class_to_xml w v));
    ]

let transition_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> transition_to_xml w item)) xs

let expiration_status_to_xml w (x : expiration_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let object_size_less_than_bytes_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)
let object_size_greater_than_bytes_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)

let lifecycle_rule_and_operator_to_xml w (x : lifecycle_rule_and_operator) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tags with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Tag" (fun w -> tag_to_xml w item)) v);
      (match x.object_size_greater_than with
      | None -> null w
      | Some v ->
          element w "ObjectSizeGreaterThan" (fun w -> object_size_greater_than_bytes_to_xml w v));
      (match x.object_size_less_than with
      | None -> null w
      | Some v -> element w "ObjectSizeLessThan" (fun w -> object_size_less_than_bytes_to_xml w v));
    ]

let lifecycle_rule_filter_to_xml w (x : lifecycle_rule_filter) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tag with None -> null w | Some v -> element w "Tag" (fun w -> tag_to_xml w v));
      (match x.object_size_greater_than with
      | None -> null w
      | Some v ->
          element w "ObjectSizeGreaterThan" (fun w -> object_size_greater_than_bytes_to_xml w v));
      (match x.object_size_less_than with
      | None -> null w
      | Some v -> element w "ObjectSizeLessThan" (fun w -> object_size_less_than_bytes_to_xml w v));
      (match x.and_ with
      | None -> null w
      | Some v -> element w "And" (fun w -> lifecycle_rule_and_operator_to_xml w v));
    ]

let expired_object_delete_marker_to_xml w v = text w (string_of_bool v)

let lifecycle_expiration_to_xml w (x : lifecycle_expiration) =
  ignore
    [
      (match x.date with None -> null w | Some v -> element w "Date" (fun w -> date_to_xml w v));
      (match x.days with None -> null w | Some v -> element w "Days" (fun w -> days_to_xml w v));
      (match x.expired_object_delete_marker with
      | None -> null w
      | Some v ->
          element w "ExpiredObjectDeleteMarker" (fun w -> expired_object_delete_marker_to_xml w v));
    ]

let lifecycle_rule_to_xml w (x : lifecycle_rule) =
  ignore
    [
      (match x.expiration with
      | None -> null w
      | Some v -> element w "Expiration" (fun w -> lifecycle_expiration_to_xml w v));
      (match x.i_d with None -> null w | Some v -> element w "ID" (fun w -> i_d_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> lifecycle_rule_filter_to_xml w v));
      element w "Status" (fun w -> expiration_status_to_xml w x.status);
      (match x.transitions with
      | None -> null w
      | Some v ->
          List.iter (fun item -> element w "Transition" (fun w -> transition_to_xml w item)) v);
      (match x.noncurrent_version_transitions with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "NoncurrentVersionTransition" (fun w ->
                  noncurrent_version_transition_to_xml w item))
            v);
      (match x.noncurrent_version_expiration with
      | None -> null w
      | Some v ->
          element w "NoncurrentVersionExpiration" (fun w ->
              noncurrent_version_expiration_to_xml w v));
      (match x.abort_incomplete_multipart_upload with
      | None -> null w
      | Some v ->
          element w "AbortIncompleteMultipartUpload" (fun w ->
              abort_incomplete_multipart_upload_to_xml w v));
    ]

let lifecycle_rules_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> lifecycle_rule_to_xml w item)) xs

let bucket_lifecycle_configuration_to_xml w (x : bucket_lifecycle_configuration) =
  ignore
    [ List.iter (fun item -> element w "Rule" (fun w -> lifecycle_rule_to_xml w item)) x.rules ]

let put_bucket_lifecycle_configuration_request_to_xml w
    (x : put_bucket_lifecycle_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.lifecycle_configuration with
      | None -> null w
      | Some v ->
          element w "LifecycleConfiguration" (fun w -> bucket_lifecycle_configuration_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.transition_default_minimum_object_size with
      | None -> null w
      | Some v ->
          element w "TransitionDefaultMinimumObjectSize" (fun w ->
              transition_default_minimum_object_size_to_xml w v));
    ]

let inventory_frequency_to_xml w (x : inventory_frequency) =
  text w (match x with Daily -> "Daily" | Weekly -> "Weekly")

let inventory_schedule_to_xml w (x : inventory_schedule) =
  ignore [ element w "Frequency" (fun w -> inventory_frequency_to_xml w x.frequency) ]

let inventory_optional_field_to_xml w (x : inventory_optional_field) =
  text w
    (match x with
    | Size -> "Size"
    | LastModifiedDate -> "LastModifiedDate"
    | StorageClass -> "StorageClass"
    | ETag -> "ETag"
    | IsMultipartUploaded -> "IsMultipartUploaded"
    | ReplicationStatus -> "ReplicationStatus"
    | EncryptionStatus -> "EncryptionStatus"
    | ObjectLockRetainUntilDate -> "ObjectLockRetainUntilDate"
    | ObjectLockMode -> "ObjectLockMode"
    | ObjectLockLegalHoldStatus -> "ObjectLockLegalHoldStatus"
    | IntelligentTieringAccessTier -> "IntelligentTieringAccessTier"
    | BucketKeyStatus -> "BucketKeyStatus"
    | ChecksumAlgorithm -> "ChecksumAlgorithm"
    | ObjectAccessControlList -> "ObjectAccessControlList"
    | ObjectOwner -> "ObjectOwner"
    | LifecycleExpirationDate -> "LifecycleExpirationDate")

let inventory_optional_fields_to_xml w xs =
  List.iter (fun item -> element w "Field" (fun w -> inventory_optional_field_to_xml w item)) xs

let inventory_included_object_versions_to_xml w (x : inventory_included_object_versions) =
  text w (match x with All -> "All" | Current -> "Current")

let inventory_id_to_xml w v = text w v

let inventory_filter_to_xml w (x : inventory_filter) =
  ignore [ element w "Prefix" (fun w -> prefix_to_xml w x.prefix) ]

let is_enabled_to_xml w v = text w (string_of_bool v)

let ssekm_s_to_xml w (x : ssekm_s) =
  ignore [ element w "KeyId" (fun w -> ssekms_key_id_to_xml w x.key_id) ]

let sse_s3_to_xml w _x = null w

let inventory_encryption_to_xml w (x : inventory_encryption) =
  ignore
    [
      (match x.sse_s3 with
      | None -> null w
      | Some v -> element w "SSE-S3" (fun w -> sse_s3_to_xml w v));
      (match x.ssekm_s with
      | None -> null w
      | Some v -> element w "SSE-KMS" (fun w -> ssekm_s_to_xml w v));
    ]

let inventory_format_to_xml w (x : inventory_format) =
  text w (match x with CSV -> "CSV" | ORC -> "ORC" | Parquet -> "Parquet")

let inventory_s3_bucket_destination_to_xml w (x : inventory_s3_bucket_destination) =
  ignore
    [
      (match x.account_id with
      | None -> null w
      | Some v -> element w "AccountId" (fun w -> account_id_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Format" (fun w -> inventory_format_to_xml w x.format);
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.encryption with
      | None -> null w
      | Some v -> element w "Encryption" (fun w -> inventory_encryption_to_xml w v));
    ]

let inventory_destination_to_xml w (x : inventory_destination) =
  ignore
    [
      element w "S3BucketDestination" (fun w ->
          inventory_s3_bucket_destination_to_xml w x.s3_bucket_destination);
    ]

let inventory_configuration_to_xml w (x : inventory_configuration) =
  ignore
    [
      element w "Destination" (fun w -> inventory_destination_to_xml w x.destination);
      element w "IsEnabled" (fun w -> is_enabled_to_xml w x.is_enabled);
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> inventory_filter_to_xml w v));
      element w "Id" (fun w -> inventory_id_to_xml w x.id);
      element w "IncludedObjectVersions" (fun w ->
          inventory_included_object_versions_to_xml w x.included_object_versions);
      (match x.optional_fields with
      | None -> null w
      | Some v -> element w "OptionalFields" (fun w -> inventory_optional_fields_to_xml w v));
      element w "Schedule" (fun w -> inventory_schedule_to_xml w x.schedule);
    ]

let put_bucket_inventory_configuration_request_to_xml w
    (x : put_bucket_inventory_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> inventory_id_to_xml w x.id);
      element w "InventoryConfiguration" (fun w ->
          inventory_configuration_to_xml w x.inventory_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let intelligent_tiering_access_tier_to_xml w (x : intelligent_tiering_access_tier) =
  text w
    (match x with
    | ARCHIVE_ACCESS -> "ARCHIVE_ACCESS"
    | DEEP_ARCHIVE_ACCESS -> "DEEP_ARCHIVE_ACCESS")

let intelligent_tiering_days_to_xml w v = text w (string_of_int v)

let tiering_to_xml w (x : tiering) =
  ignore
    [
      element w "Days" (fun w -> intelligent_tiering_days_to_xml w x.days);
      element w "AccessTier" (fun w -> intelligent_tiering_access_tier_to_xml w x.access_tier);
    ]

let tiering_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> tiering_to_xml w item)) xs

let intelligent_tiering_status_to_xml w (x : intelligent_tiering_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let intelligent_tiering_and_operator_to_xml w (x : intelligent_tiering_and_operator) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tags with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Tag" (fun w -> tag_to_xml w item)) v);
    ]

let intelligent_tiering_filter_to_xml w (x : intelligent_tiering_filter) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tag with None -> null w | Some v -> element w "Tag" (fun w -> tag_to_xml w v));
      (match x.and_ with
      | None -> null w
      | Some v -> element w "And" (fun w -> intelligent_tiering_and_operator_to_xml w v));
    ]

let intelligent_tiering_id_to_xml w v = text w v

let intelligent_tiering_configuration_to_xml w (x : intelligent_tiering_configuration) =
  ignore
    [
      element w "Id" (fun w -> intelligent_tiering_id_to_xml w x.id);
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> intelligent_tiering_filter_to_xml w v));
      element w "Status" (fun w -> intelligent_tiering_status_to_xml w x.status);
      List.iter (fun item -> element w "Tiering" (fun w -> tiering_to_xml w item)) x.tierings;
    ]

let put_bucket_intelligent_tiering_configuration_request_to_xml w
    (x : put_bucket_intelligent_tiering_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> intelligent_tiering_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      element w "IntelligentTieringConfiguration" (fun w ->
          intelligent_tiering_configuration_to_xml w x.intelligent_tiering_configuration);
    ]

let encryption_type_to_xml w (x : encryption_type) =
  text w (match x with NONE -> "NONE" | SSE_C -> "SSE-C")

let encryption_type_list_to_xml w xs =
  List.iter (fun item -> element w "EncryptionType" (fun w -> encryption_type_to_xml w item)) xs

let blocked_encryption_types_to_xml w (x : blocked_encryption_types) =
  ignore
    [
      (match x.encryption_type with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "EncryptionType" (fun w -> encryption_type_to_xml w item))
            v);
    ]

let server_side_encryption_by_default_to_xml w (x : server_side_encryption_by_default) =
  ignore
    [
      element w "SSEAlgorithm" (fun w -> server_side_encryption_to_xml w x.sse_algorithm);
      (match x.kms_master_key_i_d with
      | None -> null w
      | Some v -> element w "KMSMasterKeyID" (fun w -> ssekms_key_id_to_xml w v));
    ]

let server_side_encryption_rule_to_xml w (x : server_side_encryption_rule) =
  ignore
    [
      (match x.apply_server_side_encryption_by_default with
      | None -> null w
      | Some v ->
          element w "ApplyServerSideEncryptionByDefault" (fun w ->
              server_side_encryption_by_default_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.blocked_encryption_types with
      | None -> null w
      | Some v -> element w "BlockedEncryptionTypes" (fun w -> blocked_encryption_types_to_xml w v));
    ]

let server_side_encryption_rules_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> server_side_encryption_rule_to_xml w item)) xs

let server_side_encryption_configuration_to_xml w (x : server_side_encryption_configuration) =
  ignore
    [
      List.iter
        (fun item -> element w "Rule" (fun w -> server_side_encryption_rule_to_xml w item))
        x.rules;
    ]

let put_bucket_encryption_request_to_xml w (x : put_bucket_encryption_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "ServerSideEncryptionConfiguration" (fun w ->
          server_side_encryption_configuration_to_xml w x.server_side_encryption_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let max_age_seconds_to_xml w v = text w (string_of_int v)
let expose_header_to_xml w v = text w v

let expose_headers_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> expose_header_to_xml w item)) xs

let cors_rule_to_xml w (x : cors_rule) =
  ignore
    [
      (match x.i_d with None -> null w | Some v -> element w "ID" (fun w -> i_d_to_xml w v));
      (match x.allowed_headers with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "AllowedHeader" (fun w -> allowed_header_to_xml w item))
            v);
      List.iter
        (fun item -> element w "AllowedMethod" (fun w -> allowed_method_to_xml w item))
        x.allowed_methods;
      List.iter
        (fun item -> element w "AllowedOrigin" (fun w -> allowed_origin_to_xml w item))
        x.allowed_origins;
      (match x.expose_headers with
      | None -> null w
      | Some v ->
          List.iter (fun item -> element w "ExposeHeader" (fun w -> expose_header_to_xml w item)) v);
      (match x.max_age_seconds with
      | None -> null w
      | Some v -> element w "MaxAgeSeconds" (fun w -> max_age_seconds_to_xml w v));
    ]

let cors_rules_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> cors_rule_to_xml w item)) xs

let cors_configuration_to_xml w (x : cors_configuration) =
  ignore
    [ List.iter (fun item -> element w "CORSRule" (fun w -> cors_rule_to_xml w item)) x.cors_rules ]

let put_bucket_cors_request_to_xml w (x : put_bucket_cors_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "CORSConfiguration" (fun w -> cors_configuration_to_xml w x.cors_configuration);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let analytics_s3_export_file_format_to_xml w (x : analytics_s3_export_file_format) =
  text w (match x with CSV -> "CSV")

let analytics_s3_bucket_destination_to_xml w (x : analytics_s3_bucket_destination) =
  ignore
    [
      element w "Format" (fun w -> analytics_s3_export_file_format_to_xml w x.format);
      (match x.bucket_account_id with
      | None -> null w
      | Some v -> element w "BucketAccountId" (fun w -> account_id_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
    ]

let analytics_export_destination_to_xml w (x : analytics_export_destination) =
  ignore
    [
      element w "S3BucketDestination" (fun w ->
          analytics_s3_bucket_destination_to_xml w x.s3_bucket_destination);
    ]

let storage_class_analysis_schema_version_to_xml w (x : storage_class_analysis_schema_version) =
  text w (match x with V_1 -> "V_1")

let storage_class_analysis_data_export_to_xml w (x : storage_class_analysis_data_export) =
  ignore
    [
      element w "OutputSchemaVersion" (fun w ->
          storage_class_analysis_schema_version_to_xml w x.output_schema_version);
      element w "Destination" (fun w -> analytics_export_destination_to_xml w x.destination);
    ]

let storage_class_analysis_to_xml w (x : storage_class_analysis) =
  ignore
    [
      (match x.data_export with
      | None -> null w
      | Some v -> element w "DataExport" (fun w -> storage_class_analysis_data_export_to_xml w v));
    ]

let analytics_and_operator_to_xml w (x : analytics_and_operator) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.tags with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Tag" (fun w -> tag_to_xml w item)) v);
    ]

let analytics_filter_to_xml w (x : analytics_filter) =
  match x with
  | Prefix v -> element w "Prefix" (fun w -> prefix_to_xml w v)
  | Tag v -> element w "Tag" (fun w -> tag_to_xml w v)
  | And v -> element w "And" (fun w -> analytics_and_operator_to_xml w v)

let analytics_id_to_xml w v = text w v

let analytics_configuration_to_xml w (x : analytics_configuration) =
  ignore
    [
      element w "Id" (fun w -> analytics_id_to_xml w x.id);
      (match x.filter with
      | None -> null w
      | Some v -> element w "Filter" (fun w -> analytics_filter_to_xml w v));
      element w "StorageClassAnalysis" (fun w ->
          storage_class_analysis_to_xml w x.storage_class_analysis);
    ]

let put_bucket_analytics_configuration_request_to_xml w
    (x : put_bucket_analytics_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> analytics_id_to_xml w x.id);
      element w "AnalyticsConfiguration" (fun w ->
          analytics_configuration_to_xml w x.analytics_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let bucket_canned_ac_l_to_xml w (x : bucket_canned_ac_l) =
  text w
    (match x with
    | Private -> "private"
    | Public_read -> "public-read"
    | Public_read_write -> "public-read-write"
    | Authenticated_read -> "authenticated-read")

let put_bucket_acl_request_to_xml w (x : put_bucket_acl_request) =
  ignore
    [
      (match x.ac_l with
      | None -> null w
      | Some v -> element w "ACL" (fun w -> bucket_canned_ac_l_to_xml w v));
      (match x.access_control_policy with
      | None -> null w
      | Some v -> element w "AccessControlPolicy" (fun w -> access_control_policy_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.grant_full_control with
      | None -> null w
      | Some v -> element w "GrantFullControl" (fun w -> grant_full_control_to_xml w v));
      (match x.grant_read with
      | None -> null w
      | Some v -> element w "GrantRead" (fun w -> grant_read_to_xml w v));
      (match x.grant_read_ac_p with
      | None -> null w
      | Some v -> element w "GrantReadACP" (fun w -> grant_read_ac_p_to_xml w v));
      (match x.grant_write with
      | None -> null w
      | Some v -> element w "GrantWrite" (fun w -> grant_write_to_xml w v));
      (match x.grant_write_ac_p with
      | None -> null w
      | Some v -> element w "GrantWriteACP" (fun w -> grant_write_ac_p_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let put_bucket_accelerate_configuration_request_to_xml w
    (x : put_bucket_accelerate_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "AccelerateConfiguration" (fun w ->
          accelerate_configuration_to_xml w x.accelerate_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
    ]

let put_bucket_abac_request_to_xml w (x : put_bucket_abac_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      element w "AbacStatus" (fun w -> abac_status_to_xml w x.abac_status);
    ]

let initiator_to_xml w (x : initiator) =
  ignore
    [
      (match x.i_d with None -> null w | Some v -> element w "ID" (fun w -> i_d_to_xml w v));
      (match x.display_name with
      | None -> null w
      | Some v -> element w "DisplayName" (fun w -> display_name_to_xml w v));
    ]

let part_to_xml w (x : part) =
  ignore
    [
      (match x.part_number with
      | None -> null w
      | Some v -> element w "PartNumber" (fun w -> part_number_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.size with None -> null w | Some v -> element w "Size" (fun w -> size_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
    ]

let parts_to_xml w xs = List.iter (fun item -> element w "member" (fun w -> part_to_xml w item)) xs
let is_truncated_to_xml w v = text w (string_of_bool v)
let max_parts_to_xml w v = text w (string_of_int v)
let next_part_number_marker_to_xml w v = text w v
let part_number_marker_to_xml w v = text w v

let list_parts_output_to_xml w (x : list_parts_output) =
  ignore
    [
      (match x.abort_date with
      | None -> null w
      | Some v -> element w "AbortDate" (fun w -> abort_date_to_xml w v));
      (match x.abort_rule_id with
      | None -> null w
      | Some v -> element w "AbortRuleId" (fun w -> abort_rule_id_to_xml w v));
      (match x.bucket with
      | None -> null w
      | Some v -> element w "Bucket" (fun w -> bucket_name_to_xml w v));
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.upload_id with
      | None -> null w
      | Some v -> element w "UploadId" (fun w -> multipart_upload_id_to_xml w v));
      (match x.part_number_marker with
      | None -> null w
      | Some v -> element w "PartNumberMarker" (fun w -> part_number_marker_to_xml w v));
      (match x.next_part_number_marker with
      | None -> null w
      | Some v -> element w "NextPartNumberMarker" (fun w -> next_part_number_marker_to_xml w v));
      (match x.max_parts with
      | None -> null w
      | Some v -> element w "MaxParts" (fun w -> max_parts_to_xml w v));
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.parts with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Part" (fun w -> part_to_xml w item)) v);
      (match x.initiator with
      | None -> null w
      | Some v -> element w "Initiator" (fun w -> initiator_to_xml w v));
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
    ]

let list_parts_request_to_xml w (x : list_parts_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.max_parts with
      | None -> null w
      | Some v -> element w "MaxParts" (fun w -> max_parts_to_xml w v));
      (match x.part_number_marker with
      | None -> null w
      | Some v -> element w "PartNumberMarker" (fun w -> part_number_marker_to_xml w v));
      element w "UploadId" (fun w -> multipart_upload_id_to_xml w x.upload_id);
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
    ]

let encoding_type_to_xml w (x : encoding_type) = text w (match x with Url -> "url")

let common_prefix_to_xml w (x : common_prefix) =
  ignore
    [
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
    ]

let common_prefix_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> common_prefix_to_xml w item)) xs

let max_keys_to_xml w v = text w (string_of_int v)
let delimiter_to_xml w v = text w v
let is_latest_to_xml w v = text w (string_of_bool v)

let delete_marker_entry_to_xml w (x : delete_marker_entry) =
  ignore
    [
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.is_latest with
      | None -> null w
      | Some v -> element w "IsLatest" (fun w -> is_latest_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
    ]

let delete_markers_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> delete_marker_entry_to_xml w item)) xs

let restore_expiry_date_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let is_restore_in_progress_to_xml w v = text w (string_of_bool v)

let restore_status_to_xml w (x : restore_status) =
  ignore
    [
      (match x.is_restore_in_progress with
      | None -> null w
      | Some v -> element w "IsRestoreInProgress" (fun w -> is_restore_in_progress_to_xml w v));
      (match x.restore_expiry_date with
      | None -> null w
      | Some v -> element w "RestoreExpiryDate" (fun w -> restore_expiry_date_to_xml w v));
    ]

let object_version_storage_class_to_xml w (x : object_version_storage_class) =
  text w (match x with STANDARD -> "STANDARD")

let checksum_algorithm_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> checksum_algorithm_to_xml w item)) xs

let object_version_to_xml w (x : object_version) =
  ignore
    [
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w item))
            v);
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.size with None -> null w | Some v -> element w "Size" (fun w -> size_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> object_version_storage_class_to_xml w v));
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.is_latest with
      | None -> null w
      | Some v -> element w "IsLatest" (fun w -> is_latest_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.restore_status with
      | None -> null w
      | Some v -> element w "RestoreStatus" (fun w -> restore_status_to_xml w v));
    ]

let object_version_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> object_version_to_xml w item)) xs

let next_version_id_marker_to_xml w v = text w v
let next_key_marker_to_xml w v = text w v
let version_id_marker_to_xml w v = text w v
let key_marker_to_xml w v = text w v

let list_object_versions_output_to_xml w (x : list_object_versions_output) =
  ignore
    [
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.key_marker with
      | None -> null w
      | Some v -> element w "KeyMarker" (fun w -> key_marker_to_xml w v));
      (match x.version_id_marker with
      | None -> null w
      | Some v -> element w "VersionIdMarker" (fun w -> version_id_marker_to_xml w v));
      (match x.next_key_marker with
      | None -> null w
      | Some v -> element w "NextKeyMarker" (fun w -> next_key_marker_to_xml w v));
      (match x.next_version_id_marker with
      | None -> null w
      | Some v -> element w "NextVersionIdMarker" (fun w -> next_version_id_marker_to_xml w v));
      (match x.versions with
      | None -> null w
      | Some v ->
          List.iter (fun item -> element w "Version" (fun w -> object_version_to_xml w item)) v);
      (match x.delete_markers with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "DeleteMarker" (fun w -> delete_marker_entry_to_xml w item))
            v);
      (match x.name with
      | None -> null w
      | Some v -> element w "Name" (fun w -> bucket_name_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.max_keys with
      | None -> null w
      | Some v -> element w "MaxKeys" (fun w -> max_keys_to_xml w v));
      (match x.common_prefixes with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "CommonPrefixes" (fun w -> common_prefix_to_xml w item))
            v);
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let optional_object_attributes_to_xml w (x : optional_object_attributes) =
  text w (match x with RESTORE_STATUS -> "RestoreStatus")

let optional_object_attributes_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> optional_object_attributes_to_xml w item)) xs

let list_object_versions_request_to_xml w (x : list_object_versions_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.key_marker with
      | None -> null w
      | Some v -> element w "KeyMarker" (fun w -> key_marker_to_xml w v));
      (match x.max_keys with
      | None -> null w
      | Some v -> element w "MaxKeys" (fun w -> max_keys_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.version_id_marker with
      | None -> null w
      | Some v -> element w "VersionIdMarker" (fun w -> version_id_marker_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.optional_object_attributes with
      | None -> null w
      | Some v ->
          element w "OptionalObjectAttributes" (fun w -> optional_object_attributes_list_to_xml w v));
    ]

let start_after_to_xml w v = text w v
let next_token_to_xml w v = text w v
let token_to_xml w v = text w v
let key_count_to_xml w v = text w (string_of_int v)

let object_storage_class_to_xml w (x : object_storage_class) =
  text w
    (match x with
    | STANDARD -> "STANDARD"
    | REDUCED_REDUNDANCY -> "REDUCED_REDUNDANCY"
    | GLACIER -> "GLACIER"
    | STANDARD_IA -> "STANDARD_IA"
    | ONEZONE_IA -> "ONEZONE_IA"
    | INTELLIGENT_TIERING -> "INTELLIGENT_TIERING"
    | DEEP_ARCHIVE -> "DEEP_ARCHIVE"
    | OUTPOSTS -> "OUTPOSTS"
    | GLACIER_IR -> "GLACIER_IR"
    | SNOW -> "SNOW"
    | EXPRESS_ONEZONE -> "EXPRESS_ONEZONE"
    | FSX_OPENZFS -> "FSX_OPENZFS"
    | FSX_ONTAP -> "FSX_ONTAP")

let object__to_xml w (x : object_) =
  ignore
    [
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w item))
            v);
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.size with None -> null w | Some v -> element w "Size" (fun w -> size_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> object_storage_class_to_xml w v));
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.restore_status with
      | None -> null w
      | Some v -> element w "RestoreStatus" (fun w -> restore_status_to_xml w v));
    ]

let object_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> object__to_xml w item)) xs

let list_objects_v2_output_to_xml w (x : list_objects_v2_output) =
  ignore
    [
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.contents with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Contents" (fun w -> object__to_xml w item)) v);
      (match x.name with
      | None -> null w
      | Some v -> element w "Name" (fun w -> bucket_name_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.max_keys with
      | None -> null w
      | Some v -> element w "MaxKeys" (fun w -> max_keys_to_xml w v));
      (match x.common_prefixes with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "CommonPrefixes" (fun w -> common_prefix_to_xml w item))
            v);
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.key_count with
      | None -> null w
      | Some v -> element w "KeyCount" (fun w -> key_count_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.next_continuation_token with
      | None -> null w
      | Some v -> element w "NextContinuationToken" (fun w -> next_token_to_xml w v));
      (match x.start_after with
      | None -> null w
      | Some v -> element w "StartAfter" (fun w -> start_after_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let fetch_owner_to_xml w v = text w (string_of_bool v)

let list_objects_v2_request_to_xml w (x : list_objects_v2_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.max_keys with
      | None -> null w
      | Some v -> element w "MaxKeys" (fun w -> max_keys_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.fetch_owner with
      | None -> null w
      | Some v -> element w "FetchOwner" (fun w -> fetch_owner_to_xml w v));
      (match x.start_after with
      | None -> null w
      | Some v -> element w "StartAfter" (fun w -> start_after_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.optional_object_attributes with
      | None -> null w
      | Some v ->
          element w "OptionalObjectAttributes" (fun w -> optional_object_attributes_list_to_xml w v));
    ]

let next_marker_to_xml w v = text w v
let marker_to_xml w v = text w v

let list_objects_output_to_xml w (x : list_objects_output) =
  ignore
    [
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.marker with
      | None -> null w
      | Some v -> element w "Marker" (fun w -> marker_to_xml w v));
      (match x.next_marker with
      | None -> null w
      | Some v -> element w "NextMarker" (fun w -> next_marker_to_xml w v));
      (match x.contents with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Contents" (fun w -> object__to_xml w item)) v);
      (match x.name with
      | None -> null w
      | Some v -> element w "Name" (fun w -> bucket_name_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.max_keys with
      | None -> null w
      | Some v -> element w "MaxKeys" (fun w -> max_keys_to_xml w v));
      (match x.common_prefixes with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "CommonPrefixes" (fun w -> common_prefix_to_xml w item))
            v);
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let list_objects_request_to_xml w (x : list_objects_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.marker with
      | None -> null w
      | Some v -> element w "Marker" (fun w -> marker_to_xml w v));
      (match x.max_keys with
      | None -> null w
      | Some v -> element w "MaxKeys" (fun w -> max_keys_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.optional_object_attributes with
      | None -> null w
      | Some v ->
          element w "OptionalObjectAttributes" (fun w -> optional_object_attributes_list_to_xml w v));
    ]

let invalid_prefix_to_xml w _x = null w
let annotation_count_to_xml w v = text w (string_of_int v)
let max_annotation_results_to_xml w v = text w (string_of_int v)
let annotation_prefix_to_xml w v = text w v

let annotation_entry_to_xml w (x : annotation_entry) =
  ignore
    [
      element w "AnnotationName" (fun w -> annotation_name_to_xml w x.annotation_name);
      element w "LastModified" (fun w -> last_modified_to_xml w x.last_modified);
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w item))
            v);
      element w "Size" (fun w -> size_to_xml w x.size);
      (match x.replication_status with
      | None -> null w
      | Some v -> element w "ReplicationStatus" (fun w -> replication_status_to_xml w v));
    ]

let annotation_list_to_xml w xs =
  List.iter (fun item -> element w "AnnotationEntry" (fun w -> annotation_entry_to_xml w item)) xs

let list_object_annotations_output_to_xml w (x : list_object_annotations_output) =
  ignore
    [
      (match x.annotations with
      | None -> null w
      | Some v -> element w "Annotations" (fun w -> annotation_list_to_xml w v));
      (match x.bucket with
      | None -> null w
      | Some v -> element w "Bucket" (fun w -> bucket_name_to_xml w v));
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.object_version_id with
      | None -> null w
      | Some v -> element w "ObjectVersionId" (fun w -> object_version_id_to_xml w v));
      (match x.annotation_prefix with
      | None -> null w
      | Some v -> element w "AnnotationPrefix" (fun w -> annotation_prefix_to_xml w v));
      (match x.max_annotation_results with
      | None -> null w
      | Some v -> element w "MaxAnnotationResults" (fun w -> max_annotation_results_to_xml w v));
      (match x.annotation_count with
      | None -> null w
      | Some v -> element w "AnnotationCount" (fun w -> annotation_count_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.next_continuation_token with
      | None -> null w
      | Some v -> element w "NextContinuationToken" (fun w -> next_token_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let list_object_annotations_request_to_xml w (x : list_object_annotations_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.max_annotation_results with
      | None -> null w
      | Some v -> element w "MaxAnnotationResults" (fun w -> max_annotation_results_to_xml w v));
      (match x.annotation_prefix with
      | None -> null w
      | Some v -> element w "AnnotationPrefix" (fun w -> annotation_prefix_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let initiated_to_xml w v = text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let multipart_upload_to_xml w (x : multipart_upload) =
  ignore
    [
      (match x.upload_id with
      | None -> null w
      | Some v -> element w "UploadId" (fun w -> multipart_upload_id_to_xml w v));
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.initiated with
      | None -> null w
      | Some v -> element w "Initiated" (fun w -> initiated_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.initiator with
      | None -> null w
      | Some v -> element w "Initiator" (fun w -> initiator_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
    ]

let multipart_upload_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> multipart_upload_to_xml w item)) xs

let max_uploads_to_xml w v = text w (string_of_int v)
let next_upload_id_marker_to_xml w v = text w v
let upload_id_marker_to_xml w v = text w v

let list_multipart_uploads_output_to_xml w (x : list_multipart_uploads_output) =
  ignore
    [
      (match x.bucket with
      | None -> null w
      | Some v -> element w "Bucket" (fun w -> bucket_name_to_xml w v));
      (match x.key_marker with
      | None -> null w
      | Some v -> element w "KeyMarker" (fun w -> key_marker_to_xml w v));
      (match x.upload_id_marker with
      | None -> null w
      | Some v -> element w "UploadIdMarker" (fun w -> upload_id_marker_to_xml w v));
      (match x.next_key_marker with
      | None -> null w
      | Some v -> element w "NextKeyMarker" (fun w -> next_key_marker_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.next_upload_id_marker with
      | None -> null w
      | Some v -> element w "NextUploadIdMarker" (fun w -> next_upload_id_marker_to_xml w v));
      (match x.max_uploads with
      | None -> null w
      | Some v -> element w "MaxUploads" (fun w -> max_uploads_to_xml w v));
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.uploads with
      | None -> null w
      | Some v ->
          List.iter (fun item -> element w "Upload" (fun w -> multipart_upload_to_xml w item)) v);
      (match x.common_prefixes with
      | None -> null w
      | Some v ->
          List.iter
            (fun item -> element w "CommonPrefixes" (fun w -> common_prefix_to_xml w item))
            v);
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let list_multipart_uploads_request_to_xml w (x : list_multipart_uploads_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.delimiter with
      | None -> null w
      | Some v -> element w "Delimiter" (fun w -> delimiter_to_xml w v));
      (match x.encoding_type with
      | None -> null w
      | Some v -> element w "EncodingType" (fun w -> encoding_type_to_xml w v));
      (match x.key_marker with
      | None -> null w
      | Some v -> element w "KeyMarker" (fun w -> key_marker_to_xml w v));
      (match x.max_uploads with
      | None -> null w
      | Some v -> element w "MaxUploads" (fun w -> max_uploads_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.upload_id_marker with
      | None -> null w
      | Some v -> element w "UploadIdMarker" (fun w -> upload_id_marker_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
    ]

let directory_bucket_token_to_xml w v = text w v
let s3_regional_or_s3_express_bucket_arn_string_to_xml w v = text w v
let bucket_region_to_xml w v = text w v

let creation_date_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let bucket_to_xml w (x : bucket) =
  ignore
    [
      (match x.name with
      | None -> null w
      | Some v -> element w "Name" (fun w -> bucket_name_to_xml w v));
      (match x.creation_date with
      | None -> null w
      | Some v -> element w "CreationDate" (fun w -> creation_date_to_xml w v));
      (match x.bucket_region with
      | None -> null w
      | Some v -> element w "BucketRegion" (fun w -> bucket_region_to_xml w v));
      (match x.bucket_arn with
      | None -> null w
      | Some v ->
          element w "BucketArn" (fun w -> s3_regional_or_s3_express_bucket_arn_string_to_xml w v));
    ]

let buckets_to_xml w xs =
  List.iter (fun item -> element w "Bucket" (fun w -> bucket_to_xml w item)) xs

let list_directory_buckets_output_to_xml w (x : list_directory_buckets_output) =
  ignore
    [
      (match x.buckets with
      | None -> null w
      | Some v -> element w "Buckets" (fun w -> buckets_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> directory_bucket_token_to_xml w v));
    ]

let max_directory_buckets_to_xml w v = text w (string_of_int v)

let list_directory_buckets_request_to_xml w (x : list_directory_buckets_request) =
  ignore
    [
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> directory_bucket_token_to_xml w v));
      (match x.max_directory_buckets with
      | None -> null w
      | Some v -> element w "MaxDirectoryBuckets" (fun w -> max_directory_buckets_to_xml w v));
    ]

let list_buckets_output_to_xml w (x : list_buckets_output) =
  ignore
    [
      (match x.buckets with
      | None -> null w
      | Some v -> element w "Buckets" (fun w -> buckets_to_xml w v));
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> next_token_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
    ]

let max_buckets_to_xml w v = text w (string_of_int v)

let list_buckets_request_to_xml w (x : list_buckets_request) =
  ignore
    [
      (match x.max_buckets with
      | None -> null w
      | Some v -> element w "MaxBuckets" (fun w -> max_buckets_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.prefix with
      | None -> null w
      | Some v -> element w "Prefix" (fun w -> prefix_to_xml w v));
      (match x.bucket_region with
      | None -> null w
      | Some v -> element w "BucketRegion" (fun w -> bucket_region_to_xml w v));
    ]

let metrics_configuration_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> metrics_configuration_to_xml w item)) xs

let list_bucket_metrics_configurations_output_to_xml w
    (x : list_bucket_metrics_configurations_output) =
  ignore
    [
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.next_continuation_token with
      | None -> null w
      | Some v -> element w "NextContinuationToken" (fun w -> next_token_to_xml w v));
      (match x.metrics_configuration_list with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "MetricsConfiguration" (fun w -> metrics_configuration_to_xml w item))
            v);
    ]

let list_bucket_metrics_configurations_request_to_xml w
    (x : list_bucket_metrics_configurations_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let inventory_configuration_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> inventory_configuration_to_xml w item)) xs

let list_bucket_inventory_configurations_output_to_xml w
    (x : list_bucket_inventory_configurations_output) =
  ignore
    [
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.inventory_configuration_list with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "InventoryConfiguration" (fun w -> inventory_configuration_to_xml w item))
            v);
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.next_continuation_token with
      | None -> null w
      | Some v -> element w "NextContinuationToken" (fun w -> next_token_to_xml w v));
    ]

let list_bucket_inventory_configurations_request_to_xml w
    (x : list_bucket_inventory_configurations_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let intelligent_tiering_configuration_list_to_xml w xs =
  List.iter
    (fun item -> element w "member" (fun w -> intelligent_tiering_configuration_to_xml w item))
    xs

let list_bucket_intelligent_tiering_configurations_output_to_xml w
    (x : list_bucket_intelligent_tiering_configurations_output) =
  ignore
    [
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.next_continuation_token with
      | None -> null w
      | Some v -> element w "NextContinuationToken" (fun w -> next_token_to_xml w v));
      (match x.intelligent_tiering_configuration_list with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "IntelligentTieringConfiguration" (fun w ->
                  intelligent_tiering_configuration_to_xml w item))
            v);
    ]

let list_bucket_intelligent_tiering_configurations_request_to_xml w
    (x : list_bucket_intelligent_tiering_configurations_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let analytics_configuration_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> analytics_configuration_to_xml w item)) xs

let list_bucket_analytics_configurations_output_to_xml w
    (x : list_bucket_analytics_configurations_output) =
  ignore
    [
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.next_continuation_token with
      | None -> null w
      | Some v -> element w "NextContinuationToken" (fun w -> next_token_to_xml w v));
      (match x.analytics_configuration_list with
      | None -> null w
      | Some v ->
          List.iter
            (fun item ->
              element w "AnalyticsConfiguration" (fun w -> analytics_configuration_to_xml w item))
            v);
    ]

let list_bucket_analytics_configurations_request_to_xml w
    (x : list_bucket_analytics_configurations_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.continuation_token with
      | None -> null w
      | Some v -> element w "ContinuationToken" (fun w -> token_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let not_found_to_xml w _x = null w

let archive_status_to_xml w (x : archive_status) =
  text w
    (match x with
    | ARCHIVE_ACCESS -> "ARCHIVE_ACCESS"
    | DEEP_ARCHIVE_ACCESS -> "DEEP_ARCHIVE_ACCESS")

let head_object_output_to_xml w (x : head_object_output) =
  ignore
    [
      (match x.delete_marker with
      | None -> null w
      | Some v -> element w "DeleteMarker" (fun w -> delete_marker_to_xml w v));
      (match x.accept_ranges with
      | None -> null w
      | Some v -> element w "AcceptRanges" (fun w -> accept_ranges_to_xml w v));
      (match x.expiration with
      | None -> null w
      | Some v -> element w "Expiration" (fun w -> expiration_to_xml w v));
      (match x.restore with
      | None -> null w
      | Some v -> element w "Restore" (fun w -> restore_to_xml w v));
      (match x.archive_status with
      | None -> null w
      | Some v -> element w "ArchiveStatus" (fun w -> archive_status_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.content_length with
      | None -> null w
      | Some v -> element w "ContentLength" (fun w -> content_length_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.missing_meta with
      | None -> null w
      | Some v -> element w "MissingMeta" (fun w -> missing_meta_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.cache_control with
      | None -> null w
      | Some v -> element w "CacheControl" (fun w -> cache_control_to_xml w v));
      (match x.content_disposition with
      | None -> null w
      | Some v -> element w "ContentDisposition" (fun w -> content_disposition_to_xml w v));
      (match x.content_encoding with
      | None -> null w
      | Some v -> element w "ContentEncoding" (fun w -> content_encoding_to_xml w v));
      (match x.content_language with
      | None -> null w
      | Some v -> element w "ContentLanguage" (fun w -> content_language_to_xml w v));
      (match x.content_type with
      | None -> null w
      | Some v -> element w "ContentType" (fun w -> content_type_to_xml w v));
      (match x.content_range with
      | None -> null w
      | Some v -> element w "ContentRange" (fun w -> content_range_to_xml w v));
      (match x.expires with
      | None -> null w
      | Some v -> element w "Expires" (fun w -> expires_to_xml w v));
      (match x.website_redirect_location with
      | None -> null w
      | Some v ->
          element w "WebsiteRedirectLocation" (fun w -> website_redirect_location_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.metadata with
      | None -> null w
      | Some v -> element w "Metadata" (fun w -> metadata_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.replication_status with
      | None -> null w
      | Some v -> element w "ReplicationStatus" (fun w -> replication_status_to_xml w v));
      (match x.parts_count with
      | None -> null w
      | Some v -> element w "PartsCount" (fun w -> parts_count_to_xml w v));
      (match x.tag_count with
      | None -> null w
      | Some v -> element w "TagCount" (fun w -> tag_count_to_xml w v));
      (match x.object_lock_mode with
      | None -> null w
      | Some v -> element w "ObjectLockMode" (fun w -> object_lock_mode_to_xml w v));
      (match x.object_lock_retain_until_date with
      | None -> null w
      | Some v ->
          element w "ObjectLockRetainUntilDate" (fun w -> object_lock_retain_until_date_to_xml w v));
      (match x.object_lock_legal_hold_status with
      | None -> null w
      | Some v ->
          element w "ObjectLockLegalHoldStatus" (fun w -> object_lock_legal_hold_status_to_xml w v));
    ]

let checksum_mode_to_xml w (x : checksum_mode) = text w (match x with ENABLED -> "ENABLED")

let response_expires_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)

let response_content_type_to_xml w v = text w v
let response_content_language_to_xml w v = text w v
let response_content_encoding_to_xml w v = text w v
let response_content_disposition_to_xml w v = text w v
let response_cache_control_to_xml w v = text w v
let range_to_xml w v = text w v

let head_object_request_to_xml w (x : head_object_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.if_match with
      | None -> null w
      | Some v -> element w "IfMatch" (fun w -> if_match_to_xml w v));
      (match x.if_modified_since with
      | None -> null w
      | Some v -> element w "IfModifiedSince" (fun w -> if_modified_since_to_xml w v));
      (match x.if_none_match with
      | None -> null w
      | Some v -> element w "IfNoneMatch" (fun w -> if_none_match_to_xml w v));
      (match x.if_unmodified_since with
      | None -> null w
      | Some v -> element w "IfUnmodifiedSince" (fun w -> if_unmodified_since_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.range with
      | None -> null w
      | Some v -> element w "Range" (fun w -> range_to_xml w v));
      (match x.response_cache_control with
      | None -> null w
      | Some v -> element w "ResponseCacheControl" (fun w -> response_cache_control_to_xml w v));
      (match x.response_content_disposition with
      | None -> null w
      | Some v ->
          element w "ResponseContentDisposition" (fun w -> response_content_disposition_to_xml w v));
      (match x.response_content_encoding with
      | None -> null w
      | Some v ->
          element w "ResponseContentEncoding" (fun w -> response_content_encoding_to_xml w v));
      (match x.response_content_language with
      | None -> null w
      | Some v ->
          element w "ResponseContentLanguage" (fun w -> response_content_language_to_xml w v));
      (match x.response_content_type with
      | None -> null w
      | Some v -> element w "ResponseContentType" (fun w -> response_content_type_to_xml w v));
      (match x.response_expires with
      | None -> null w
      | Some v -> element w "ResponseExpires" (fun w -> response_expires_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.part_number with
      | None -> null w
      | Some v -> element w "PartNumber" (fun w -> part_number_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.checksum_mode with
      | None -> null w
      | Some v -> element w "ChecksumMode" (fun w -> checksum_mode_to_xml w v));
    ]

let region_to_xml w v = text w v
let bucket_location_name_to_xml w v = text w v

let location_type_to_xml w (x : location_type) =
  text w (match x with AvailabilityZone -> "AvailabilityZone" | LocalZone -> "LocalZone")

let head_bucket_output_to_xml w (x : head_bucket_output) =
  ignore
    [
      (match x.bucket_arn with
      | None -> null w
      | Some v ->
          element w "BucketArn" (fun w -> s3_regional_or_s3_express_bucket_arn_string_to_xml w v));
      (match x.bucket_location_type with
      | None -> null w
      | Some v -> element w "BucketLocationType" (fun w -> location_type_to_xml w v));
      (match x.bucket_location_name with
      | None -> null w
      | Some v -> element w "BucketLocationName" (fun w -> bucket_location_name_to_xml w v));
      (match x.bucket_region with
      | None -> null w
      | Some v -> element w "BucketRegion" (fun w -> region_to_xml w v));
      (match x.access_point_alias with
      | None -> null w
      | Some v -> element w "AccessPointAlias" (fun w -> access_point_alias_to_xml w v));
    ]

let head_bucket_request_to_xml w (x : head_bucket_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_public_access_block_output_to_xml w (x : get_public_access_block_output) =
  ignore
    [
      (match x.public_access_block_configuration with
      | None -> null w
      | Some v ->
          element w "PublicAccessBlockConfiguration" (fun w ->
              public_access_block_configuration_to_xml w v));
    ]

let get_public_access_block_request_to_xml w (x : get_public_access_block_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_object_torrent_output_to_xml w (x : get_object_torrent_output) =
  ignore
    [
      (match x.body with
      | None -> null w
      | Some v -> element w "Body" (fun w -> streaming_blob_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let get_object_torrent_request_to_xml w (x : get_object_torrent_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_object_tagging_output_to_xml w (x : get_object_tagging_output) =
  ignore
    [
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      element w "TagSet" (fun w -> tag_set_to_xml w x.tag_set);
    ]

let get_object_tagging_request_to_xml w (x : get_object_tagging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
    ]

let get_object_retention_output_to_xml w (x : get_object_retention_output) =
  ignore
    [
      (match x.retention with
      | None -> null w
      | Some v -> element w "Retention" (fun w -> object_lock_retention_to_xml w v));
    ]

let get_object_retention_request_to_xml w (x : get_object_retention_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_object_lock_configuration_output_to_xml w (x : get_object_lock_configuration_output) =
  ignore
    [
      (match x.object_lock_configuration with
      | None -> null w
      | Some v ->
          element w "ObjectLockConfiguration" (fun w -> object_lock_configuration_to_xml w v));
    ]

let get_object_lock_configuration_request_to_xml w (x : get_object_lock_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_object_legal_hold_output_to_xml w (x : get_object_legal_hold_output) =
  ignore
    [
      (match x.legal_hold with
      | None -> null w
      | Some v -> element w "LegalHold" (fun w -> object_lock_legal_hold_to_xml w v));
    ]

let get_object_legal_hold_request_to_xml w (x : get_object_legal_hold_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let object_size_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)

let object_part_to_xml w (x : object_part) =
  ignore
    [
      (match x.part_number with
      | None -> null w
      | Some v -> element w "PartNumber" (fun w -> part_number_to_xml w v));
      (match x.size with None -> null w | Some v -> element w "Size" (fun w -> size_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
    ]

let parts_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> object_part_to_xml w item)) xs

let get_object_attributes_parts_to_xml w (x : get_object_attributes_parts) =
  ignore
    [
      (match x.total_parts_count with
      | None -> null w
      | Some v -> element w "PartsCount" (fun w -> parts_count_to_xml w v));
      (match x.part_number_marker with
      | None -> null w
      | Some v -> element w "PartNumberMarker" (fun w -> part_number_marker_to_xml w v));
      (match x.next_part_number_marker with
      | None -> null w
      | Some v -> element w "NextPartNumberMarker" (fun w -> next_part_number_marker_to_xml w v));
      (match x.max_parts with
      | None -> null w
      | Some v -> element w "MaxParts" (fun w -> max_parts_to_xml w v));
      (match x.is_truncated with
      | None -> null w
      | Some v -> element w "IsTruncated" (fun w -> is_truncated_to_xml w v));
      (match x.parts with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Part" (fun w -> object_part_to_xml w item)) v);
    ]

let checksum_to_xml w (x : checksum) =
  ignore
    [
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
    ]

let get_object_attributes_output_to_xml w (x : get_object_attributes_output) =
  ignore
    [
      (match x.delete_marker with
      | None -> null w
      | Some v -> element w "DeleteMarker" (fun w -> delete_marker_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum with
      | None -> null w
      | Some v -> element w "Checksum" (fun w -> checksum_to_xml w v));
      (match x.object_parts with
      | None -> null w
      | Some v -> element w "ObjectParts" (fun w -> get_object_attributes_parts_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.object_size with
      | None -> null w
      | Some v -> element w "ObjectSize" (fun w -> object_size_to_xml w v));
    ]

let object_attributes_to_xml w (x : object_attributes) =
  text w
    (match x with
    | ETAG -> "ETag"
    | CHECKSUM -> "Checksum"
    | OBJECT_PARTS -> "ObjectParts"
    | STORAGE_CLASS -> "StorageClass"
    | OBJECT_SIZE -> "ObjectSize")

let object_attributes_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> object_attributes_to_xml w item)) xs

let get_object_attributes_request_to_xml w (x : get_object_attributes_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.max_parts with
      | None -> null w
      | Some v -> element w "MaxParts" (fun w -> max_parts_to_xml w v));
      (match x.part_number_marker with
      | None -> null w
      | Some v -> element w "PartNumberMarker" (fun w -> part_number_marker_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      element w "ObjectAttributes" (fun w -> object_attributes_list_to_xml w x.object_attributes);
    ]

let no_such_annotation_to_xml w _x = null w

let get_object_annotation_output_to_xml w (x : get_object_annotation_output) =
  ignore
    [
      (match x.annotation_payload with
      | None -> null w
      | Some v -> element w "AnnotationPayload" (fun w -> streaming_blob_to_xml w v));
      (match x.object_version_id with
      | None -> null w
      | Some v -> element w "ObjectVersionId" (fun w -> object_version_id_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.content_length with
      | None -> null w
      | Some v -> element w "ContentLength" (fun w -> content_length_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.replication_status with
      | None -> null w
      | Some v -> element w "ReplicationStatus" (fun w -> replication_status_to_xml w v));
    ]

let get_object_annotation_request_to_xml w (x : get_object_annotation_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      element w "AnnotationName" (fun w -> annotation_name_to_xml w x.annotation_name);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.checksum_mode with
      | None -> null w
      | Some v -> element w "ChecksumMode" (fun w -> checksum_mode_to_xml w v));
    ]

let get_object_acl_output_to_xml w (x : get_object_acl_output) =
  ignore
    [
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.grants with
      | None -> null w
      | Some v -> element w "AccessControlList" (fun w -> grants_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let get_object_acl_request_to_xml w (x : get_object_acl_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let invalid_object_state_to_xml w (x : invalid_object_state) =
  ignore
    [
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.access_tier with
      | None -> null w
      | Some v -> element w "AccessTier" (fun w -> intelligent_tiering_access_tier_to_xml w v));
    ]

let get_object_output_to_xml w (x : get_object_output) =
  ignore
    [
      (match x.body with
      | None -> null w
      | Some v -> element w "Body" (fun w -> streaming_blob_to_xml w v));
      (match x.delete_marker with
      | None -> null w
      | Some v -> element w "DeleteMarker" (fun w -> delete_marker_to_xml w v));
      (match x.accept_ranges with
      | None -> null w
      | Some v -> element w "AcceptRanges" (fun w -> accept_ranges_to_xml w v));
      (match x.expiration with
      | None -> null w
      | Some v -> element w "Expiration" (fun w -> expiration_to_xml w v));
      (match x.restore with
      | None -> null w
      | Some v -> element w "Restore" (fun w -> restore_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.content_length with
      | None -> null w
      | Some v -> element w "ContentLength" (fun w -> content_length_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.missing_meta with
      | None -> null w
      | Some v -> element w "MissingMeta" (fun w -> missing_meta_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.cache_control with
      | None -> null w
      | Some v -> element w "CacheControl" (fun w -> cache_control_to_xml w v));
      (match x.content_disposition with
      | None -> null w
      | Some v -> element w "ContentDisposition" (fun w -> content_disposition_to_xml w v));
      (match x.content_encoding with
      | None -> null w
      | Some v -> element w "ContentEncoding" (fun w -> content_encoding_to_xml w v));
      (match x.content_language with
      | None -> null w
      | Some v -> element w "ContentLanguage" (fun w -> content_language_to_xml w v));
      (match x.content_range with
      | None -> null w
      | Some v -> element w "ContentRange" (fun w -> content_range_to_xml w v));
      (match x.content_type with
      | None -> null w
      | Some v -> element w "ContentType" (fun w -> content_type_to_xml w v));
      (match x.expires with
      | None -> null w
      | Some v -> element w "Expires" (fun w -> expires_to_xml w v));
      (match x.website_redirect_location with
      | None -> null w
      | Some v ->
          element w "WebsiteRedirectLocation" (fun w -> website_redirect_location_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.metadata with
      | None -> null w
      | Some v -> element w "Metadata" (fun w -> metadata_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.replication_status with
      | None -> null w
      | Some v -> element w "ReplicationStatus" (fun w -> replication_status_to_xml w v));
      (match x.parts_count with
      | None -> null w
      | Some v -> element w "PartsCount" (fun w -> parts_count_to_xml w v));
      (match x.tag_count with
      | None -> null w
      | Some v -> element w "TagCount" (fun w -> tag_count_to_xml w v));
      (match x.object_lock_mode with
      | None -> null w
      | Some v -> element w "ObjectLockMode" (fun w -> object_lock_mode_to_xml w v));
      (match x.object_lock_retain_until_date with
      | None -> null w
      | Some v ->
          element w "ObjectLockRetainUntilDate" (fun w -> object_lock_retain_until_date_to_xml w v));
      (match x.object_lock_legal_hold_status with
      | None -> null w
      | Some v ->
          element w "ObjectLockLegalHoldStatus" (fun w -> object_lock_legal_hold_status_to_xml w v));
    ]

let get_object_request_to_xml w (x : get_object_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.if_match with
      | None -> null w
      | Some v -> element w "IfMatch" (fun w -> if_match_to_xml w v));
      (match x.if_modified_since with
      | None -> null w
      | Some v -> element w "IfModifiedSince" (fun w -> if_modified_since_to_xml w v));
      (match x.if_none_match with
      | None -> null w
      | Some v -> element w "IfNoneMatch" (fun w -> if_none_match_to_xml w v));
      (match x.if_unmodified_since with
      | None -> null w
      | Some v -> element w "IfUnmodifiedSince" (fun w -> if_unmodified_since_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.range with
      | None -> null w
      | Some v -> element w "Range" (fun w -> range_to_xml w v));
      (match x.response_cache_control with
      | None -> null w
      | Some v -> element w "ResponseCacheControl" (fun w -> response_cache_control_to_xml w v));
      (match x.response_content_disposition with
      | None -> null w
      | Some v ->
          element w "ResponseContentDisposition" (fun w -> response_content_disposition_to_xml w v));
      (match x.response_content_encoding with
      | None -> null w
      | Some v ->
          element w "ResponseContentEncoding" (fun w -> response_content_encoding_to_xml w v));
      (match x.response_content_language with
      | None -> null w
      | Some v ->
          element w "ResponseContentLanguage" (fun w -> response_content_language_to_xml w v));
      (match x.response_content_type with
      | None -> null w
      | Some v -> element w "ResponseContentType" (fun w -> response_content_type_to_xml w v));
      (match x.response_expires with
      | None -> null w
      | Some v -> element w "ResponseExpires" (fun w -> response_expires_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.part_number with
      | None -> null w
      | Some v -> element w "PartNumber" (fun w -> part_number_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.checksum_mode with
      | None -> null w
      | Some v -> element w "ChecksumMode" (fun w -> checksum_mode_to_xml w v));
    ]

let get_bucket_website_output_to_xml w (x : get_bucket_website_output) =
  ignore
    [
      (match x.redirect_all_requests_to with
      | None -> null w
      | Some v -> element w "RedirectAllRequestsTo" (fun w -> redirect_all_requests_to_to_xml w v));
      (match x.index_document with
      | None -> null w
      | Some v -> element w "IndexDocument" (fun w -> index_document_to_xml w v));
      (match x.error_document with
      | None -> null w
      | Some v -> element w "ErrorDocument" (fun w -> error_document_to_xml w v));
      (match x.routing_rules with
      | None -> null w
      | Some v -> element w "RoutingRules" (fun w -> routing_rules_to_xml w v));
    ]

let get_bucket_website_request_to_xml w (x : get_bucket_website_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let mfa_delete_status_to_xml w (x : mfa_delete_status) =
  text w (match x with Enabled -> "Enabled" | Disabled -> "Disabled")

let get_bucket_versioning_output_to_xml w (x : get_bucket_versioning_output) =
  ignore
    [
      (match x.status with
      | None -> null w
      | Some v -> element w "Status" (fun w -> bucket_versioning_status_to_xml w v));
      (match x.mfa_delete with
      | None -> null w
      | Some v -> element w "MfaDelete" (fun w -> mfa_delete_status_to_xml w v));
    ]

let get_bucket_versioning_request_to_xml w (x : get_bucket_versioning_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_tagging_output_to_xml w (x : get_bucket_tagging_output) =
  ignore [ element w "TagSet" (fun w -> tag_set_to_xml w x.tag_set) ]

let get_bucket_tagging_request_to_xml w (x : get_bucket_tagging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_request_payment_output_to_xml w (x : get_bucket_request_payment_output) =
  ignore
    [
      (match x.payer with
      | None -> null w
      | Some v -> element w "Payer" (fun w -> payer_to_xml w v));
    ]

let get_bucket_request_payment_request_to_xml w (x : get_bucket_request_payment_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_replication_output_to_xml w (x : get_bucket_replication_output) =
  ignore
    [
      (match x.replication_configuration with
      | None -> null w
      | Some v ->
          element w "ReplicationConfiguration" (fun w -> replication_configuration_to_xml w v));
    ]

let get_bucket_replication_request_to_xml w (x : get_bucket_replication_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let is_public_to_xml w v = text w (string_of_bool v)

let policy_status_to_xml w (x : policy_status) =
  ignore
    [
      (match x.is_public with
      | None -> null w
      | Some v -> element w "IsPublic" (fun w -> is_public_to_xml w v));
    ]

let get_bucket_policy_status_output_to_xml w (x : get_bucket_policy_status_output) =
  ignore
    [
      (match x.policy_status with
      | None -> null w
      | Some v -> element w "PolicyStatus" (fun w -> policy_status_to_xml w v));
    ]

let get_bucket_policy_status_request_to_xml w (x : get_bucket_policy_status_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_policy_output_to_xml w (x : get_bucket_policy_output) =
  ignore
    [
      (match x.policy with
      | None -> null w
      | Some v -> element w "Policy" (fun w -> policy_to_xml w v));
    ]

let get_bucket_policy_request_to_xml w (x : get_bucket_policy_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_ownership_controls_output_to_xml w (x : get_bucket_ownership_controls_output) =
  ignore
    [
      (match x.ownership_controls with
      | None -> null w
      | Some v -> element w "OwnershipControls" (fun w -> ownership_controls_to_xml w v));
    ]

let get_bucket_ownership_controls_request_to_xml w (x : get_bucket_ownership_controls_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_notification_configuration_request_to_xml w
    (x : get_bucket_notification_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_metrics_configuration_output_to_xml w (x : get_bucket_metrics_configuration_output) =
  ignore
    [
      (match x.metrics_configuration with
      | None -> null w
      | Some v -> element w "MetricsConfiguration" (fun w -> metrics_configuration_to_xml w v));
    ]

let get_bucket_metrics_configuration_request_to_xml w (x : get_bucket_metrics_configuration_request)
    =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> metrics_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let error_details_to_xml w (x : error_details) =
  ignore
    [
      (match x.error_code with
      | None -> null w
      | Some v -> element w "ErrorCode" (fun w -> error_code_to_xml w v));
      (match x.error_message with
      | None -> null w
      | Some v -> element w "ErrorMessage" (fun w -> error_message_to_xml w v));
    ]

let metadata_table_status_to_xml w v = text w v
let s3_tables_namespace_to_xml w v = text w v
let s3_tables_arn_to_xml w v = text w v
let s3_tables_name_to_xml w v = text w v
let s3_tables_bucket_arn_to_xml w v = text w v

let s3_tables_destination_result_to_xml w (x : s3_tables_destination_result) =
  ignore
    [
      element w "TableBucketArn" (fun w -> s3_tables_bucket_arn_to_xml w x.table_bucket_arn);
      element w "TableName" (fun w -> s3_tables_name_to_xml w x.table_name);
      element w "TableArn" (fun w -> s3_tables_arn_to_xml w x.table_arn);
      element w "TableNamespace" (fun w -> s3_tables_namespace_to_xml w x.table_namespace);
    ]

let metadata_table_configuration_result_to_xml w (x : metadata_table_configuration_result) =
  ignore
    [
      element w "S3TablesDestinationResult" (fun w ->
          s3_tables_destination_result_to_xml w x.s3_tables_destination_result);
    ]

let get_bucket_metadata_table_configuration_result_to_xml w
    (x : get_bucket_metadata_table_configuration_result) =
  ignore
    [
      element w "MetadataTableConfigurationResult" (fun w ->
          metadata_table_configuration_result_to_xml w x.metadata_table_configuration_result);
      element w "Status" (fun w -> metadata_table_status_to_xml w x.status);
      (match x.error with
      | None -> null w
      | Some v -> element w "Error" (fun w -> error_details_to_xml w v));
    ]

let get_bucket_metadata_table_configuration_output_to_xml w
    (x : get_bucket_metadata_table_configuration_output) =
  ignore
    [
      (match x.get_bucket_metadata_table_configuration_result with
      | None -> null w
      | Some v ->
          element w "GetBucketMetadataTableConfigurationResult" (fun w ->
              get_bucket_metadata_table_configuration_result_to_xml w v));
    ]

let get_bucket_metadata_table_configuration_request_to_xml w
    (x : get_bucket_metadata_table_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let annotation_table_configuration_result_to_xml w (x : annotation_table_configuration_result) =
  ignore
    [
      element w "ConfigurationState" (fun w ->
          annotation_configuration_state_to_xml w x.configuration_state);
      (match x.table_status with
      | None -> null w
      | Some v -> element w "TableStatus" (fun w -> metadata_table_status_to_xml w v));
      (match x.error with
      | None -> null w
      | Some v -> element w "Error" (fun w -> error_details_to_xml w v));
      (match x.table_name with
      | None -> null w
      | Some v -> element w "TableName" (fun w -> s3_tables_name_to_xml w v));
      (match x.table_arn with
      | None -> null w
      | Some v -> element w "TableArn" (fun w -> s3_tables_arn_to_xml w v));
      (match x.role with None -> null w | Some v -> element w "Role" (fun w -> role_to_xml w v));
    ]

let inventory_table_configuration_result_to_xml w (x : inventory_table_configuration_result) =
  ignore
    [
      element w "ConfigurationState" (fun w ->
          inventory_configuration_state_to_xml w x.configuration_state);
      (match x.table_status with
      | None -> null w
      | Some v -> element w "TableStatus" (fun w -> metadata_table_status_to_xml w v));
      (match x.error with
      | None -> null w
      | Some v -> element w "Error" (fun w -> error_details_to_xml w v));
      (match x.table_name with
      | None -> null w
      | Some v -> element w "TableName" (fun w -> s3_tables_name_to_xml w v));
      (match x.table_arn with
      | None -> null w
      | Some v -> element w "TableArn" (fun w -> s3_tables_arn_to_xml w v));
    ]

let journal_table_configuration_result_to_xml w (x : journal_table_configuration_result) =
  ignore
    [
      element w "TableStatus" (fun w -> metadata_table_status_to_xml w x.table_status);
      (match x.error with
      | None -> null w
      | Some v -> element w "Error" (fun w -> error_details_to_xml w v));
      element w "TableName" (fun w -> s3_tables_name_to_xml w x.table_name);
      (match x.table_arn with
      | None -> null w
      | Some v -> element w "TableArn" (fun w -> s3_tables_arn_to_xml w v));
      element w "RecordExpiration" (fun w -> record_expiration_to_xml w x.record_expiration);
    ]

let s3_tables_bucket_type_to_xml w (x : s3_tables_bucket_type) =
  text w (match x with Aws -> "aws" | Customer -> "customer")

let destination_result_to_xml w (x : destination_result) =
  ignore
    [
      (match x.table_bucket_type with
      | None -> null w
      | Some v -> element w "TableBucketType" (fun w -> s3_tables_bucket_type_to_xml w v));
      (match x.table_bucket_arn with
      | None -> null w
      | Some v -> element w "TableBucketArn" (fun w -> s3_tables_bucket_arn_to_xml w v));
      (match x.table_namespace with
      | None -> null w
      | Some v -> element w "TableNamespace" (fun w -> s3_tables_namespace_to_xml w v));
    ]

let metadata_configuration_result_to_xml w (x : metadata_configuration_result) =
  ignore
    [
      element w "DestinationResult" (fun w -> destination_result_to_xml w x.destination_result);
      (match x.journal_table_configuration_result with
      | None -> null w
      | Some v ->
          element w "JournalTableConfigurationResult" (fun w ->
              journal_table_configuration_result_to_xml w v));
      (match x.inventory_table_configuration_result with
      | None -> null w
      | Some v ->
          element w "InventoryTableConfigurationResult" (fun w ->
              inventory_table_configuration_result_to_xml w v));
      (match x.annotation_table_configuration_result with
      | None -> null w
      | Some v ->
          element w "AnnotationTableConfigurationResult" (fun w ->
              annotation_table_configuration_result_to_xml w v));
    ]

let get_bucket_metadata_configuration_result_to_xml w (x : get_bucket_metadata_configuration_result)
    =
  ignore
    [
      element w "MetadataConfigurationResult" (fun w ->
          metadata_configuration_result_to_xml w x.metadata_configuration_result);
    ]

let get_bucket_metadata_configuration_output_to_xml w (x : get_bucket_metadata_configuration_output)
    =
  ignore
    [
      (match x.get_bucket_metadata_configuration_result with
      | None -> null w
      | Some v ->
          element w "GetBucketMetadataConfigurationResult" (fun w ->
              get_bucket_metadata_configuration_result_to_xml w v));
    ]

let get_bucket_metadata_configuration_request_to_xml w
    (x : get_bucket_metadata_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_logging_output_to_xml w (x : get_bucket_logging_output) =
  ignore
    [
      (match x.logging_enabled with
      | None -> null w
      | Some v -> element w "LoggingEnabled" (fun w -> logging_enabled_to_xml w v));
    ]

let get_bucket_logging_request_to_xml w (x : get_bucket_logging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let bucket_location_constraint_to_xml w (x : bucket_location_constraint) =
  text w
    (match x with
    | Af_south_1 -> "af-south-1"
    | Ap_east_1 -> "ap-east-1"
    | Ap_east_2 -> "ap-east-2"
    | Ap_northeast_1 -> "ap-northeast-1"
    | Ap_northeast_2 -> "ap-northeast-2"
    | Ap_northeast_3 -> "ap-northeast-3"
    | Ap_south_1 -> "ap-south-1"
    | Ap_south_2 -> "ap-south-2"
    | Ap_southeast_1 -> "ap-southeast-1"
    | Ap_southeast_2 -> "ap-southeast-2"
    | Ap_southeast_3 -> "ap-southeast-3"
    | Ap_southeast_4 -> "ap-southeast-4"
    | Ap_southeast_5 -> "ap-southeast-5"
    | Ap_southeast_6 -> "ap-southeast-6"
    | Ap_southeast_7 -> "ap-southeast-7"
    | Ca_central_1 -> "ca-central-1"
    | Ca_west_1 -> "ca-west-1"
    | Cn_north_1 -> "cn-north-1"
    | Cn_northwest_1 -> "cn-northwest-1"
    | EU -> "EU"
    | Eu_central_1 -> "eu-central-1"
    | Eu_central_2 -> "eu-central-2"
    | Eu_north_1 -> "eu-north-1"
    | Eu_south_1 -> "eu-south-1"
    | Eu_south_2 -> "eu-south-2"
    | Eu_west_1 -> "eu-west-1"
    | Eu_west_2 -> "eu-west-2"
    | Eu_west_3 -> "eu-west-3"
    | Il_central_1 -> "il-central-1"
    | Me_central_1 -> "me-central-1"
    | Me_south_1 -> "me-south-1"
    | Mx_central_1 -> "mx-central-1"
    | Sa_east_1 -> "sa-east-1"
    | Us_east_2 -> "us-east-2"
    | Us_gov_east_1 -> "us-gov-east-1"
    | Us_gov_west_1 -> "us-gov-west-1"
    | Us_west_1 -> "us-west-1"
    | Us_west_2 -> "us-west-2")

let get_bucket_location_output_to_xml w (x : get_bucket_location_output) =
  ignore
    [
      (match x.location_constraint with
      | None -> null w
      | Some v -> element w "LocationConstraint" (fun w -> bucket_location_constraint_to_xml w v));
    ]

let get_bucket_location_request_to_xml w (x : get_bucket_location_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_lifecycle_configuration_output_to_xml w
    (x : get_bucket_lifecycle_configuration_output) =
  ignore
    [
      (match x.rules with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Rule" (fun w -> lifecycle_rule_to_xml w item)) v);
      (match x.transition_default_minimum_object_size with
      | None -> null w
      | Some v ->
          element w "TransitionDefaultMinimumObjectSize" (fun w ->
              transition_default_minimum_object_size_to_xml w v));
    ]

let get_bucket_lifecycle_configuration_request_to_xml w
    (x : get_bucket_lifecycle_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_inventory_configuration_output_to_xml w
    (x : get_bucket_inventory_configuration_output) =
  ignore
    [
      (match x.inventory_configuration with
      | None -> null w
      | Some v -> element w "InventoryConfiguration" (fun w -> inventory_configuration_to_xml w v));
    ]

let get_bucket_inventory_configuration_request_to_xml w
    (x : get_bucket_inventory_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> inventory_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_intelligent_tiering_configuration_output_to_xml w
    (x : get_bucket_intelligent_tiering_configuration_output) =
  ignore
    [
      (match x.intelligent_tiering_configuration with
      | None -> null w
      | Some v ->
          element w "IntelligentTieringConfiguration" (fun w ->
              intelligent_tiering_configuration_to_xml w v));
    ]

let get_bucket_intelligent_tiering_configuration_request_to_xml w
    (x : get_bucket_intelligent_tiering_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> intelligent_tiering_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_encryption_output_to_xml w (x : get_bucket_encryption_output) =
  ignore
    [
      (match x.server_side_encryption_configuration with
      | None -> null w
      | Some v ->
          element w "ServerSideEncryptionConfiguration" (fun w ->
              server_side_encryption_configuration_to_xml w v));
    ]

let get_bucket_encryption_request_to_xml w (x : get_bucket_encryption_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_cors_output_to_xml w (x : get_bucket_cors_output) =
  ignore
    [
      (match x.cors_rules with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "CORSRule" (fun w -> cors_rule_to_xml w item)) v);
    ]

let get_bucket_cors_request_to_xml w (x : get_bucket_cors_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_analytics_configuration_output_to_xml w
    (x : get_bucket_analytics_configuration_output) =
  ignore
    [
      (match x.analytics_configuration with
      | None -> null w
      | Some v -> element w "AnalyticsConfiguration" (fun w -> analytics_configuration_to_xml w v));
    ]

let get_bucket_analytics_configuration_request_to_xml w
    (x : get_bucket_analytics_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> analytics_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_acl_output_to_xml w (x : get_bucket_acl_output) =
  ignore
    [
      (match x.owner with
      | None -> null w
      | Some v -> element w "Owner" (fun w -> owner_to_xml w v));
      (match x.grants with
      | None -> null w
      | Some v -> element w "AccessControlList" (fun w -> grants_to_xml w v));
    ]

let get_bucket_acl_request_to_xml w (x : get_bucket_acl_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let get_bucket_accelerate_configuration_output_to_xml w
    (x : get_bucket_accelerate_configuration_output) =
  ignore
    [
      (match x.status with
      | None -> null w
      | Some v -> element w "Status" (fun w -> bucket_accelerate_status_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let get_bucket_accelerate_configuration_request_to_xml w
    (x : get_bucket_accelerate_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
    ]

let get_bucket_abac_output_to_xml w (x : get_bucket_abac_output) =
  ignore
    [
      (match x.abac_status with
      | None -> null w
      | Some v -> element w "AbacStatus" (fun w -> abac_status_to_xml w v));
    ]

let get_bucket_abac_request_to_xml w (x : get_bucket_abac_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_public_access_block_request_to_xml w (x : delete_public_access_block_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_object_tagging_output_to_xml w (x : delete_object_tagging_output) =
  ignore
    [
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
    ]

let delete_object_tagging_request_to_xml w (x : delete_object_tagging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let message_to_xml w v = text w v
let code_to_xml w v = text w v

let error_to_xml w (x : error) =
  ignore
    [
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.code with None -> null w | Some v -> element w "Code" (fun w -> code_to_xml w v));
      (match x.message with
      | None -> null w
      | Some v -> element w "Message" (fun w -> message_to_xml w v));
    ]

let errors_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> error_to_xml w item)) xs

let delete_marker_version_id_to_xml w v = text w v

let deleted_object_to_xml w (x : deleted_object) =
  ignore
    [
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.delete_marker with
      | None -> null w
      | Some v -> element w "DeleteMarker" (fun w -> delete_marker_to_xml w v));
      (match x.delete_marker_version_id with
      | None -> null w
      | Some v -> element w "DeleteMarkerVersionId" (fun w -> delete_marker_version_id_to_xml w v));
    ]

let deleted_objects_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> deleted_object_to_xml w item)) xs

let delete_objects_output_to_xml w (x : delete_objects_output) =
  ignore
    [
      (match x.deleted with
      | None -> null w
      | Some v ->
          List.iter (fun item -> element w "Deleted" (fun w -> deleted_object_to_xml w item)) v);
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.errors with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Error" (fun w -> error_to_xml w item)) v);
    ]

let quiet_to_xml w v = text w (string_of_bool v)

let last_modified_time_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)

let object_identifier_to_xml w (x : object_identifier) =
  ignore
    [
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.last_modified_time with
      | None -> null w
      | Some v -> element w "LastModifiedTime" (fun w -> last_modified_time_to_xml w v));
      (match x.size with None -> null w | Some v -> element w "Size" (fun w -> size_to_xml w v));
    ]

let object_identifier_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> object_identifier_to_xml w item)) xs

let delete_to_xml w (x : delete) =
  ignore
    [
      List.iter
        (fun item -> element w "Object" (fun w -> object_identifier_to_xml w item))
        x.objects;
      (match x.quiet with
      | None -> null w
      | Some v -> element w "Quiet" (fun w -> quiet_to_xml w v));
    ]

let delete_objects_request_to_xml w (x : delete_objects_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Delete" (fun w -> delete_to_xml w x.delete);
      (match x.mf_a with None -> null w | Some v -> element w "MFA" (fun w -> mf_a_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.bypass_governance_retention with
      | None -> null w
      | Some v ->
          element w "BypassGovernanceRetention" (fun w -> bypass_governance_retention_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
    ]

let delete_object_annotation_output_to_xml w (x : delete_object_annotation_output) =
  ignore
    [
      (match x.object_version_id with
      | None -> null w
      | Some v -> element w "ObjectVersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let delete_object_annotation_request_to_xml w (x : delete_object_annotation_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      element w "AnnotationName" (fun w -> annotation_name_to_xml w x.annotation_name);
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.object_if_match with
      | None -> null w
      | Some v -> element w "ObjectIfMatch" (fun w -> object_if_match_to_xml w v));
    ]

let delete_object_output_to_xml w (x : delete_object_output) =
  ignore
    [
      (match x.delete_marker with
      | None -> null w
      | Some v -> element w "DeleteMarker" (fun w -> delete_marker_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let if_match_size_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)

let if_match_last_modified_time_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)

let delete_object_request_to_xml w (x : delete_object_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.mf_a with None -> null w | Some v -> element w "MFA" (fun w -> mf_a_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.bypass_governance_retention with
      | None -> null w
      | Some v ->
          element w "BypassGovernanceRetention" (fun w -> bypass_governance_retention_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.if_match with
      | None -> null w
      | Some v -> element w "IfMatch" (fun w -> if_match_to_xml w v));
      (match x.if_match_last_modified_time with
      | None -> null w
      | Some v ->
          element w "IfMatchLastModifiedTime" (fun w -> if_match_last_modified_time_to_xml w v));
      (match x.if_match_size with
      | None -> null w
      | Some v -> element w "IfMatchSize" (fun w -> if_match_size_to_xml w v));
    ]

let delete_bucket_website_request_to_xml w (x : delete_bucket_website_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_tagging_request_to_xml w (x : delete_bucket_tagging_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_replication_request_to_xml w (x : delete_bucket_replication_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_policy_request_to_xml w (x : delete_bucket_policy_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_ownership_controls_request_to_xml w (x : delete_bucket_ownership_controls_request)
    =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_metrics_configuration_request_to_xml w
    (x : delete_bucket_metrics_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> metrics_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_metadata_table_configuration_request_to_xml w
    (x : delete_bucket_metadata_table_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_metadata_configuration_request_to_xml w
    (x : delete_bucket_metadata_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_lifecycle_request_to_xml w (x : delete_bucket_lifecycle_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_inventory_configuration_request_to_xml w
    (x : delete_bucket_inventory_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> inventory_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_intelligent_tiering_configuration_request_to_xml w
    (x : delete_bucket_intelligent_tiering_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> intelligent_tiering_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_encryption_request_to_xml w (x : delete_bucket_encryption_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_cors_request_to_xml w (x : delete_bucket_cors_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_analytics_configuration_request_to_xml w
    (x : delete_bucket_analytics_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Id" (fun w -> analytics_id_to_xml w x.id);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let delete_bucket_request_to_xml w (x : delete_bucket_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let session_expiration_to_xml w v =
  text w (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)

let session_credential_value_to_xml w v = text w v

let session_credentials_to_xml w (x : session_credentials) =
  ignore
    [
      element w "AccessKeyId" (fun w -> access_key_id_value_to_xml w x.access_key_id);
      element w "SecretAccessKey" (fun w -> session_credential_value_to_xml w x.secret_access_key);
      element w "SessionToken" (fun w -> session_credential_value_to_xml w x.session_token);
      element w "Expiration" (fun w -> session_expiration_to_xml w x.expiration);
    ]

let create_session_output_to_xml w (x : create_session_output) =
  ignore
    [
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      element w "Credentials" (fun w -> session_credentials_to_xml w x.credentials);
    ]

let session_mode_to_xml w (x : session_mode) =
  text w (match x with ReadOnly -> "ReadOnly" | ReadWrite -> "ReadWrite")

let create_session_request_to_xml w (x : create_session_request) =
  ignore
    [
      (match x.session_mode with
      | None -> null w
      | Some v -> element w "SessionMode" (fun w -> session_mode_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
    ]

let create_multipart_upload_output_to_xml w (x : create_multipart_upload_output) =
  ignore
    [
      (match x.abort_date with
      | None -> null w
      | Some v -> element w "AbortDate" (fun w -> abort_date_to_xml w v));
      (match x.abort_rule_id with
      | None -> null w
      | Some v -> element w "AbortRuleId" (fun w -> abort_rule_id_to_xml w v));
      (match x.bucket with
      | None -> null w
      | Some v -> element w "Bucket" (fun w -> bucket_name_to_xml w v));
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.upload_id with
      | None -> null w
      | Some v -> element w "UploadId" (fun w -> multipart_upload_id_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
    ]

let create_multipart_upload_request_to_xml w (x : create_multipart_upload_request) =
  ignore
    [
      (match x.ac_l with
      | None -> null w
      | Some v -> element w "ACL" (fun w -> object_canned_ac_l_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.cache_control with
      | None -> null w
      | Some v -> element w "CacheControl" (fun w -> cache_control_to_xml w v));
      (match x.content_disposition with
      | None -> null w
      | Some v -> element w "ContentDisposition" (fun w -> content_disposition_to_xml w v));
      (match x.content_encoding with
      | None -> null w
      | Some v -> element w "ContentEncoding" (fun w -> content_encoding_to_xml w v));
      (match x.content_language with
      | None -> null w
      | Some v -> element w "ContentLanguage" (fun w -> content_language_to_xml w v));
      (match x.content_type with
      | None -> null w
      | Some v -> element w "ContentType" (fun w -> content_type_to_xml w v));
      (match x.expires with
      | None -> null w
      | Some v -> element w "Expires" (fun w -> expires_to_xml w v));
      (match x.grant_full_control with
      | None -> null w
      | Some v -> element w "GrantFullControl" (fun w -> grant_full_control_to_xml w v));
      (match x.grant_read with
      | None -> null w
      | Some v -> element w "GrantRead" (fun w -> grant_read_to_xml w v));
      (match x.grant_read_ac_p with
      | None -> null w
      | Some v -> element w "GrantReadACP" (fun w -> grant_read_ac_p_to_xml w v));
      (match x.grant_write_ac_p with
      | None -> null w
      | Some v -> element w "GrantWriteACP" (fun w -> grant_write_ac_p_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.metadata with
      | None -> null w
      | Some v -> element w "Metadata" (fun w -> metadata_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.website_redirect_location with
      | None -> null w
      | Some v ->
          element w "WebsiteRedirectLocation" (fun w -> website_redirect_location_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.tagging with
      | None -> null w
      | Some v -> element w "Tagging" (fun w -> tagging_header_to_xml w v));
      (match x.object_lock_mode with
      | None -> null w
      | Some v -> element w "ObjectLockMode" (fun w -> object_lock_mode_to_xml w v));
      (match x.object_lock_retain_until_date with
      | None -> null w
      | Some v ->
          element w "ObjectLockRetainUntilDate" (fun w -> object_lock_retain_until_date_to_xml w v));
      (match x.object_lock_legal_hold_status with
      | None -> null w
      | Some v ->
          element w "ObjectLockLegalHoldStatus" (fun w -> object_lock_legal_hold_status_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
    ]

let s3_tables_destination_to_xml w (x : s3_tables_destination) =
  ignore
    [
      element w "TableBucketArn" (fun w -> s3_tables_bucket_arn_to_xml w x.table_bucket_arn);
      element w "TableName" (fun w -> s3_tables_name_to_xml w x.table_name);
    ]

let metadata_table_configuration_to_xml w (x : metadata_table_configuration) =
  ignore
    [
      element w "S3TablesDestination" (fun w ->
          s3_tables_destination_to_xml w x.s3_tables_destination);
    ]

let create_bucket_metadata_table_configuration_request_to_xml w
    (x : create_bucket_metadata_table_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "MetadataTableConfiguration" (fun w ->
          metadata_table_configuration_to_xml w x.metadata_table_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let annotation_table_configuration_to_xml w (x : annotation_table_configuration) =
  ignore
    [
      element w "ConfigurationState" (fun w ->
          annotation_configuration_state_to_xml w x.configuration_state);
      (match x.encryption_configuration with
      | None -> null w
      | Some v ->
          element w "EncryptionConfiguration" (fun w ->
              metadata_table_encryption_configuration_to_xml w v));
      (match x.role with None -> null w | Some v -> element w "Role" (fun w -> role_to_xml w v));
    ]

let inventory_table_configuration_to_xml w (x : inventory_table_configuration) =
  ignore
    [
      element w "ConfigurationState" (fun w ->
          inventory_configuration_state_to_xml w x.configuration_state);
      (match x.encryption_configuration with
      | None -> null w
      | Some v ->
          element w "EncryptionConfiguration" (fun w ->
              metadata_table_encryption_configuration_to_xml w v));
    ]

let journal_table_configuration_to_xml w (x : journal_table_configuration) =
  ignore
    [
      element w "RecordExpiration" (fun w -> record_expiration_to_xml w x.record_expiration);
      (match x.encryption_configuration with
      | None -> null w
      | Some v ->
          element w "EncryptionConfiguration" (fun w ->
              metadata_table_encryption_configuration_to_xml w v));
    ]

let metadata_configuration_to_xml w (x : metadata_configuration) =
  ignore
    [
      element w "JournalTableConfiguration" (fun w ->
          journal_table_configuration_to_xml w x.journal_table_configuration);
      (match x.inventory_table_configuration with
      | None -> null w
      | Some v ->
          element w "InventoryTableConfiguration" (fun w ->
              inventory_table_configuration_to_xml w v));
      (match x.annotation_table_configuration with
      | None -> null w
      | Some v ->
          element w "AnnotationTableConfiguration" (fun w ->
              annotation_table_configuration_to_xml w v));
    ]

let create_bucket_metadata_configuration_request_to_xml w
    (x : create_bucket_metadata_configuration_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.content_m_d5 with
      | None -> null w
      | Some v -> element w "ContentMD5" (fun w -> content_m_d5_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      element w "MetadataConfiguration" (fun w ->
          metadata_configuration_to_xml w x.metadata_configuration);
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let bucket_already_owned_by_you_to_xml w _x = null w
let bucket_already_exists_to_xml w _x = null w
let location_to_xml w v = text w v

let create_bucket_output_to_xml w (x : create_bucket_output) =
  ignore
    [
      (match x.location with
      | None -> null w
      | Some v -> element w "Location" (fun w -> location_to_xml w v));
      (match x.bucket_arn with
      | None -> null w
      | Some v ->
          element w "BucketArn" (fun w -> s3_regional_or_s3_express_bucket_arn_string_to_xml w v));
    ]

let bucket_namespace_to_xml w (x : bucket_namespace) =
  text w (match x with ACCOUNT_REGIONAL -> "account-regional" | GLOBAL -> "global")

let object_lock_enabled_for_bucket_to_xml w v = text w (string_of_bool v)
let bucket_type_to_xml w (x : bucket_type) = text w (match x with Directory -> "Directory")

let data_redundancy_to_xml w (x : data_redundancy) =
  text w
    (match x with
    | SingleAvailabilityZone -> "SingleAvailabilityZone"
    | SingleLocalZone -> "SingleLocalZone")

let bucket_info_to_xml w (x : bucket_info) =
  ignore
    [
      (match x.data_redundancy with
      | None -> null w
      | Some v -> element w "DataRedundancy" (fun w -> data_redundancy_to_xml w v));
      (match x.type_ with
      | None -> null w
      | Some v -> element w "Type" (fun w -> bucket_type_to_xml w v));
    ]

let location_name_as_string_to_xml w v = text w v

let location_info_to_xml w (x : location_info) =
  ignore
    [
      (match x.type_ with
      | None -> null w
      | Some v -> element w "Type" (fun w -> location_type_to_xml w v));
      (match x.name with
      | None -> null w
      | Some v -> element w "Name" (fun w -> location_name_as_string_to_xml w v));
    ]

let create_bucket_configuration_to_xml w (x : create_bucket_configuration) =
  ignore
    [
      (match x.location_constraint with
      | None -> null w
      | Some v -> element w "LocationConstraint" (fun w -> bucket_location_constraint_to_xml w v));
      (match x.location with
      | None -> null w
      | Some v -> element w "Location" (fun w -> location_info_to_xml w v));
      (match x.bucket with
      | None -> null w
      | Some v -> element w "Bucket" (fun w -> bucket_info_to_xml w v));
      (match x.tags with
      | None -> null w
      | Some v -> element w "Tags" (fun w -> tag_set_to_xml w v));
    ]

let create_bucket_request_to_xml w (x : create_bucket_request) =
  ignore
    [
      (match x.ac_l with
      | None -> null w
      | Some v -> element w "ACL" (fun w -> bucket_canned_ac_l_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.create_bucket_configuration with
      | None -> null w
      | Some v ->
          element w "CreateBucketConfiguration" (fun w -> create_bucket_configuration_to_xml w v));
      (match x.grant_full_control with
      | None -> null w
      | Some v -> element w "GrantFullControl" (fun w -> grant_full_control_to_xml w v));
      (match x.grant_read with
      | None -> null w
      | Some v -> element w "GrantRead" (fun w -> grant_read_to_xml w v));
      (match x.grant_read_ac_p with
      | None -> null w
      | Some v -> element w "GrantReadACP" (fun w -> grant_read_ac_p_to_xml w v));
      (match x.grant_write with
      | None -> null w
      | Some v -> element w "GrantWrite" (fun w -> grant_write_to_xml w v));
      (match x.grant_write_ac_p with
      | None -> null w
      | Some v -> element w "GrantWriteACP" (fun w -> grant_write_ac_p_to_xml w v));
      (match x.object_lock_enabled_for_bucket with
      | None -> null w
      | Some v ->
          element w "ObjectLockEnabledForBucket" (fun w ->
              object_lock_enabled_for_bucket_to_xml w v));
      (match x.object_ownership with
      | None -> null w
      | Some v -> element w "ObjectOwnership" (fun w -> object_ownership_to_xml w v));
      (match x.bucket_namespace with
      | None -> null w
      | Some v -> element w "BucketNamespace" (fun w -> bucket_namespace_to_xml w v));
    ]

let object_not_in_active_tier_error_to_xml w _x = null w

let copy_object_result_to_xml w (x : copy_object_result) =
  ignore
    [
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.last_modified with
      | None -> null w
      | Some v -> element w "LastModified" (fun w -> last_modified_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
    ]

let copy_object_output_to_xml w (x : copy_object_output) =
  ignore
    [
      (match x.copy_object_result with
      | None -> null w
      | Some v -> element w "CopyObjectResult" (fun w -> copy_object_result_to_xml w v));
      (match x.expiration with
      | None -> null w
      | Some v -> element w "Expiration" (fun w -> expiration_to_xml w v));
      (match x.copy_source_version_id with
      | None -> null w
      | Some v -> element w "CopySourceVersionId" (fun w -> copy_source_version_id_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let annotation_directive_to_xml w (x : annotation_directive) =
  text w (match x with COPY -> "COPY" | EXCLUDE -> "EXCLUDE")

let tagging_directive_to_xml w (x : tagging_directive) =
  text w (match x with COPY -> "COPY" | REPLACE -> "REPLACE")

let metadata_directive_to_xml w (x : metadata_directive) =
  text w (match x with COPY -> "COPY" | REPLACE -> "REPLACE")

let copy_object_request_to_xml w (x : copy_object_request) =
  ignore
    [
      (match x.ac_l with
      | None -> null w
      | Some v -> element w "ACL" (fun w -> object_canned_ac_l_to_xml w v));
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      (match x.cache_control with
      | None -> null w
      | Some v -> element w "CacheControl" (fun w -> cache_control_to_xml w v));
      (match x.checksum_algorithm with
      | None -> null w
      | Some v -> element w "ChecksumAlgorithm" (fun w -> checksum_algorithm_to_xml w v));
      (match x.content_disposition with
      | None -> null w
      | Some v -> element w "ContentDisposition" (fun w -> content_disposition_to_xml w v));
      (match x.content_encoding with
      | None -> null w
      | Some v -> element w "ContentEncoding" (fun w -> content_encoding_to_xml w v));
      (match x.content_language with
      | None -> null w
      | Some v -> element w "ContentLanguage" (fun w -> content_language_to_xml w v));
      (match x.content_type with
      | None -> null w
      | Some v -> element w "ContentType" (fun w -> content_type_to_xml w v));
      element w "CopySource" (fun w -> copy_source_to_xml w x.copy_source);
      (match x.copy_source_if_match with
      | None -> null w
      | Some v -> element w "CopySourceIfMatch" (fun w -> copy_source_if_match_to_xml w v));
      (match x.copy_source_if_modified_since with
      | None -> null w
      | Some v ->
          element w "CopySourceIfModifiedSince" (fun w -> copy_source_if_modified_since_to_xml w v));
      (match x.copy_source_if_none_match with
      | None -> null w
      | Some v -> element w "CopySourceIfNoneMatch" (fun w -> copy_source_if_none_match_to_xml w v));
      (match x.copy_source_if_unmodified_since with
      | None -> null w
      | Some v ->
          element w "CopySourceIfUnmodifiedSince" (fun w ->
              copy_source_if_unmodified_since_to_xml w v));
      (match x.expires with
      | None -> null w
      | Some v -> element w "Expires" (fun w -> expires_to_xml w v));
      (match x.grant_full_control with
      | None -> null w
      | Some v -> element w "GrantFullControl" (fun w -> grant_full_control_to_xml w v));
      (match x.grant_read with
      | None -> null w
      | Some v -> element w "GrantRead" (fun w -> grant_read_to_xml w v));
      (match x.grant_read_ac_p with
      | None -> null w
      | Some v -> element w "GrantReadACP" (fun w -> grant_read_ac_p_to_xml w v));
      (match x.grant_write_ac_p with
      | None -> null w
      | Some v -> element w "GrantWriteACP" (fun w -> grant_write_ac_p_to_xml w v));
      (match x.if_match with
      | None -> null w
      | Some v -> element w "IfMatch" (fun w -> if_match_to_xml w v));
      (match x.if_none_match with
      | None -> null w
      | Some v -> element w "IfNoneMatch" (fun w -> if_none_match_to_xml w v));
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.metadata with
      | None -> null w
      | Some v -> element w "Metadata" (fun w -> metadata_to_xml w v));
      (match x.metadata_directive with
      | None -> null w
      | Some v -> element w "MetadataDirective" (fun w -> metadata_directive_to_xml w v));
      (match x.tagging_directive with
      | None -> null w
      | Some v -> element w "TaggingDirective" (fun w -> tagging_directive_to_xml w v));
      (match x.annotation_directive with
      | None -> null w
      | Some v -> element w "AnnotationDirective" (fun w -> annotation_directive_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.storage_class with
      | None -> null w
      | Some v -> element w "StorageClass" (fun w -> storage_class_to_xml w v));
      (match x.website_redirect_location with
      | None -> null w
      | Some v ->
          element w "WebsiteRedirectLocation" (fun w -> website_redirect_location_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.ssekms_encryption_context with
      | None -> null w
      | Some v ->
          element w "SSEKMSEncryptionContext" (fun w -> ssekms_encryption_context_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.copy_source_sse_customer_algorithm with
      | None -> null w
      | Some v ->
          element w "CopySourceSSECustomerAlgorithm" (fun w ->
              copy_source_sse_customer_algorithm_to_xml w v));
      (match x.copy_source_sse_customer_key with
      | None -> null w
      | Some v ->
          element w "CopySourceSSECustomerKey" (fun w -> copy_source_sse_customer_key_to_xml w v));
      (match x.copy_source_sse_customer_key_m_d5 with
      | None -> null w
      | Some v ->
          element w "CopySourceSSECustomerKeyMD5" (fun w ->
              copy_source_sse_customer_key_m_d5_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.tagging with
      | None -> null w
      | Some v -> element w "Tagging" (fun w -> tagging_header_to_xml w v));
      (match x.object_lock_mode with
      | None -> null w
      | Some v -> element w "ObjectLockMode" (fun w -> object_lock_mode_to_xml w v));
      (match x.object_lock_retain_until_date with
      | None -> null w
      | Some v ->
          element w "ObjectLockRetainUntilDate" (fun w -> object_lock_retain_until_date_to_xml w v));
      (match x.object_lock_legal_hold_status with
      | None -> null w
      | Some v ->
          element w "ObjectLockLegalHoldStatus" (fun w -> object_lock_legal_hold_status_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.expected_source_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedSourceBucketOwner" (fun w -> account_id_to_xml w v));
    ]

let complete_multipart_upload_output_to_xml w (x : complete_multipart_upload_output) =
  ignore
    [
      (match x.location with
      | None -> null w
      | Some v -> element w "Location" (fun w -> location_to_xml w v));
      (match x.bucket with
      | None -> null w
      | Some v -> element w "Bucket" (fun w -> bucket_name_to_xml w v));
      (match x.key with
      | None -> null w
      | Some v -> element w "Key" (fun w -> object_key_to_xml w v));
      (match x.expiration with
      | None -> null w
      | Some v -> element w "Expiration" (fun w -> expiration_to_xml w v));
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.server_side_encryption with
      | None -> null w
      | Some v -> element w "ServerSideEncryption" (fun w -> server_side_encryption_to_xml w v));
      (match x.version_id with
      | None -> null w
      | Some v -> element w "VersionId" (fun w -> object_version_id_to_xml w v));
      (match x.ssekms_key_id with
      | None -> null w
      | Some v -> element w "SSEKMSKeyId" (fun w -> ssekms_key_id_to_xml w v));
      (match x.bucket_key_enabled with
      | None -> null w
      | Some v -> element w "BucketKeyEnabled" (fun w -> bucket_key_enabled_to_xml w v));
      (match x.request_charged with
      | None -> null w
      | Some v -> element w "RequestCharged" (fun w -> request_charged_to_xml w v));
    ]

let mpu_object_size_to_xml w v = text w (Smaws_Lib.CoreTypes.Int64.to_string v)

let completed_part_to_xml w (x : completed_part) =
  ignore
    [
      (match x.e_tag with None -> null w | Some v -> element w "ETag" (fun w -> e_tag_to_xml w v));
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.part_number with
      | None -> null w
      | Some v -> element w "PartNumber" (fun w -> part_number_to_xml w v));
    ]

let completed_part_list_to_xml w xs =
  List.iter (fun item -> element w "member" (fun w -> completed_part_to_xml w item)) xs

let completed_multipart_upload_to_xml w (x : completed_multipart_upload) =
  ignore
    [
      (match x.parts with
      | None -> null w
      | Some v -> List.iter (fun item -> element w "Part" (fun w -> completed_part_to_xml w item)) v);
    ]

let complete_multipart_upload_request_to_xml w (x : complete_multipart_upload_request) =
  ignore
    [
      element w "Bucket" (fun w -> bucket_name_to_xml w x.bucket);
      element w "Key" (fun w -> object_key_to_xml w x.key);
      (match x.multipart_upload with
      | None -> null w
      | Some v ->
          element w "CompleteMultipartUpload" (fun w -> completed_multipart_upload_to_xml w v));
      element w "UploadId" (fun w -> multipart_upload_id_to_xml w x.upload_id);
      (match x.checksum_cr_c32 with
      | None -> null w
      | Some v -> element w "ChecksumCRC32" (fun w -> checksum_cr_c32_to_xml w v));
      (match x.checksum_crc32_c with
      | None -> null w
      | Some v -> element w "ChecksumCRC32C" (fun w -> checksum_crc32_c_to_xml w v));
      (match x.checksum_crc64nvm_e with
      | None -> null w
      | Some v -> element w "ChecksumCRC64NVME" (fun w -> checksum_crc64nvm_e_to_xml w v));
      (match x.checksum_sh_a1 with
      | None -> null w
      | Some v -> element w "ChecksumSHA1" (fun w -> checksum_sh_a1_to_xml w v));
      (match x.checksum_sh_a256 with
      | None -> null w
      | Some v -> element w "ChecksumSHA256" (fun w -> checksum_sh_a256_to_xml w v));
      (match x.checksum_sh_a512 with
      | None -> null w
      | Some v -> element w "ChecksumSHA512" (fun w -> checksum_sh_a512_to_xml w v));
      (match x.checksum_m_d5 with
      | None -> null w
      | Some v -> element w "ChecksumMD5" (fun w -> checksum_m_d5_to_xml w v));
      (match x.checksum_xxhas_h64 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH64" (fun w -> checksum_xxhas_h64_to_xml w v));
      (match x.checksum_xxhas_h3 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH3" (fun w -> checksum_xxhas_h3_to_xml w v));
      (match x.checksum_xxhas_h128 with
      | None -> null w
      | Some v -> element w "ChecksumXXHASH128" (fun w -> checksum_xxhas_h128_to_xml w v));
      (match x.checksum_type with
      | None -> null w
      | Some v -> element w "ChecksumType" (fun w -> checksum_type_to_xml w v));
      (match x.mpu_object_size with
      | None -> null w
      | Some v -> element w "MpuObjectSize" (fun w -> mpu_object_size_to_xml w v));
      (match x.request_payer with
      | None -> null w
      | Some v -> element w "RequestPayer" (fun w -> request_payer_to_xml w v));
      (match x.expected_bucket_owner with
      | None -> null w
      | Some v -> element w "ExpectedBucketOwner" (fun w -> account_id_to_xml w v));
      (match x.if_match with
      | None -> null w
      | Some v -> element w "IfMatch" (fun w -> if_match_to_xml w v));
      (match x.if_none_match with
      | None -> null w
      | Some v -> element w "IfNoneMatch" (fun w -> if_none_match_to_xml w v));
      (match x.sse_customer_algorithm with
      | None -> null w
      | Some v -> element w "SSECustomerAlgorithm" (fun w -> sse_customer_algorithm_to_xml w v));
      (match x.sse_customer_key with
      | None -> null w
      | Some v -> element w "SSECustomerKey" (fun w -> sse_customer_key_to_xml w v));
      (match x.sse_customer_key_m_d5 with
      | None -> null w
      | Some v -> element w "SSECustomerKeyMD5" (fun w -> sse_customer_key_m_d5_to_xml w v));
    ]
