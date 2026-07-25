open Smaws_Lib.Xml.Parse
open Types

let unit_of_xml _ = ()

let bucket_abac_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : bucket_abac_status)

let abac_status_of_xml i attrs =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Read.sequence i "Status" (fun i attrs -> bucket_abac_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ status = ( ! ) r_status } : abac_status)

let abort_date_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let days_after_initiation_of_xml i attrs = Primitive.int_of_string (Read.data i)

let abort_incomplete_multipart_upload_of_xml i attrs =
  let r_days_after_initiation = ref None in
  Structure.scanSequence i [ "DaysAfterInitiation" ] (fun tag _ ->
      match tag with
      | "DaysAfterInitiation" ->
          r_days_after_initiation :=
            Some
              (Read.sequence i "DaysAfterInitiation"
                 (fun i attrs -> days_after_initiation_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ days_after_initiation = ( ! ) r_days_after_initiation } : abort_incomplete_multipart_upload)

let no_such_upload_of_xml i attrs = ()

let request_charged_of_xml i attrs =
  let s = Read.data i in
  (match s with "requester" -> Requester | _ -> failwith "unknown enum value" : request_charged)

let abort_multipart_upload_output_of_xml i attrs =
  let r_request_charged = ref None in
  Structure.scanSequence i [ "RequestCharged" ] (fun tag _ ->
      match tag with
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ request_charged = ( ! ) r_request_charged } : abort_multipart_upload_output)

let if_match_initiated_time_of_xml i attrs = Primitive.timestamp_httpdate_of_string (Read.data i)
let account_id_of_xml i attrs = Read.data i

let request_payer_of_xml i attrs =
  let s = Read.data i in
  (match s with "requester" -> Requester | _ -> failwith "unknown enum value" : request_payer)

let multipart_upload_id_of_xml i attrs = Read.data i
let object_key_of_xml i attrs = Read.data i
let bucket_name_of_xml i attrs = Read.data i

let abort_multipart_upload_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_upload_id = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_if_match_initiated_time = ref None in
  Structure.scanSequence i
    [ "Bucket"; "Key"; "UploadId"; "RequestPayer"; "ExpectedBucketOwner"; "IfMatchInitiatedTime" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "IfMatchInitiatedTime" ->
          r_if_match_initiated_time :=
            Some
              (Read.sequence i "IfMatchInitiatedTime"
                 (fun i attrs -> if_match_initiated_time_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     upload_id = required "UploadId" (( ! ) r_upload_id) i;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     if_match_initiated_time = ( ! ) r_if_match_initiated_time;
   }
    : abort_multipart_upload_request)

let abort_rule_id_of_xml i attrs = Read.data i

let bucket_accelerate_status_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "Enabled" -> Enabled
   | "Suspended" -> Suspended
   | _ -> failwith "unknown enum value"
    : bucket_accelerate_status)

let accelerate_configuration_of_xml i attrs =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status" (fun i attrs -> bucket_accelerate_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ status = ( ! ) r_status } : accelerate_configuration)

let accept_ranges_of_xml i attrs = Read.data i
let i_d_of_xml i attrs = Read.data i
let display_name_of_xml i attrs = Read.data i

let owner_of_xml i attrs =
  let r_display_name = ref None in
  let r_i_d = ref None in
  Structure.scanSequence i [ "DisplayName"; "ID" ] (fun tag _ ->
      match tag with
      | "DisplayName" ->
          r_display_name :=
            Some (Read.sequence i "DisplayName" (fun i attrs -> display_name_of_xml i attrs) ())
      | "ID" -> r_i_d := Some (Read.sequence i "ID" (fun i attrs -> i_d_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ display_name = ( ! ) r_display_name; i_d = ( ! ) r_i_d } : owner)

let permission_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "FULL_CONTROL" -> FULL_CONTROL
   | "WRITE" -> WRITE
   | "WRITE_ACP" -> WRITE_ACP
   | "READ" -> READ
   | "READ_ACP" -> READ_ACP
   | _ -> failwith "unknown enum value"
    : permission)

let type__of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "CanonicalUser" -> CanonicalUser
   | "AmazonCustomerByEmail" -> AmazonCustomerByEmail
   | "Group" -> Group
   | _ -> failwith "unknown enum value"
    : type_)

let ur_i_of_xml i attrs = Read.data i
let email_address_of_xml i attrs = Read.data i

let grantee_of_xml i attrs =
  let r_display_name = ref None in
  let r_email_address = ref None in
  let r_i_d = ref None in
  let r_ur_i = ref None in
  let r_type_ = ref None in
  r_type_ :=
    Option.map
      (fun s ->
        (match s with
         | "CanonicalUser" -> CanonicalUser
         | "AmazonCustomerByEmail" -> AmazonCustomerByEmail
         | "Group" -> Group
         | _ -> failwith "unknown enum value"
          : type_))
      (List.find_map (fun ((_, n), v) -> if String.equal n "type" then Some v else None) attrs);
  Structure.scanSequence i [ "DisplayName"; "EmailAddress"; "ID"; "URI" ] (fun tag _ ->
      match tag with
      | "DisplayName" ->
          r_display_name :=
            Some (Read.sequence i "DisplayName" (fun i attrs -> display_name_of_xml i attrs) ())
      | "EmailAddress" ->
          r_email_address :=
            Some (Read.sequence i "EmailAddress" (fun i attrs -> email_address_of_xml i attrs) ())
      | "ID" -> r_i_d := Some (Read.sequence i "ID" (fun i attrs -> i_d_of_xml i attrs) ())
      | "URI" -> r_ur_i := Some (Read.sequence i "URI" (fun i attrs -> ur_i_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     display_name = ( ! ) r_display_name;
     email_address = ( ! ) r_email_address;
     i_d = ( ! ) r_i_d;
     ur_i = ( ! ) r_ur_i;
     type_ = required "xsi:type" (( ! ) r_type_) i;
   }
    : grantee)

let grant_of_xml i attrs =
  let r_grantee = ref None in
  let r_permission = ref None in
  Structure.scanSequence i [ "Grantee"; "Permission" ] (fun tag _ ->
      match tag with
      | "Grantee" ->
          r_grantee := Some (Read.sequence i "Grantee" (fun i attrs -> grantee_of_xml i attrs) ())
      | "Permission" ->
          r_permission :=
            Some (Read.sequence i "Permission" (fun i attrs -> permission_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ grantee = ( ! ) r_grantee; permission = ( ! ) r_permission } : grant)

let grants_of_xml i attrs = Read.sequences i "Grant" (fun i attrs -> grant_of_xml i attrs) ()

let access_control_policy_of_xml i attrs =
  let r_grants = ref None in
  let r_owner = ref None in
  Structure.scanSequence i [ "AccessControlList"; "Owner" ] (fun tag _ ->
      match tag with
      | "AccessControlList" ->
          r_grants :=
            Some
              (Read.sequence i "AccessControlList"
                 (fun i attrs -> Read.sequences i "Grant" (fun i attrs -> grant_of_xml i attrs) ())
                 ())
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ grants = ( ! ) r_grants; owner = ( ! ) r_owner } : access_control_policy)

let owner_override_of_xml i attrs =
  let s = Read.data i in
  (match s with "Destination" -> Destination | _ -> failwith "unknown enum value"
    : owner_override)

let access_control_translation_of_xml i attrs =
  let r_owner = ref None in
  Structure.scanSequence i [ "Owner" ] (fun tag _ ->
      match tag with
      | "Owner" ->
          r_owner :=
            Some (Read.sequence i "Owner" (fun i attrs -> owner_override_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ owner = required "Owner" (( ! ) r_owner) i } : access_control_translation)

let access_denied_of_xml i attrs = ()
let access_key_id_value_of_xml i attrs = Read.data i
let access_point_alias_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let access_point_arn_of_xml i attrs = Read.data i
let allow_quoted_record_delimiter_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let allowed_header_of_xml i attrs = Read.data i

let allowed_headers_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> allowed_header_of_xml i attrs) ()

let allowed_method_of_xml i attrs = Read.data i

let allowed_methods_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> allowed_method_of_xml i attrs) ()

let allowed_origin_of_xml i attrs = Read.data i

let allowed_origins_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> allowed_origin_of_xml i attrs) ()

let bucket_key_enabled_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let object_version_id_of_xml i attrs = Read.data i
let tag_count_of_xml i attrs = Primitive.int_of_string (Read.data i)

let storage_class_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "STANDARD" -> STANDARD
   | "REDUCED_REDUNDANCY" -> REDUCED_REDUNDANCY
   | "STANDARD_IA" -> STANDARD_IA
   | "ONEZONE_IA" -> ONEZONE_IA
   | "INTELLIGENT_TIERING" -> INTELLIGENT_TIERING
   | "GLACIER" -> GLACIER
   | "DEEP_ARCHIVE" -> DEEP_ARCHIVE
   | "OUTPOSTS" -> OUTPOSTS
   | "GLACIER_IR" -> GLACIER_IR
   | "SNOW" -> SNOW
   | "EXPRESS_ONEZONE" -> EXPRESS_ONEZONE
   | "FSX_OPENZFS" -> FSX_OPENZFS
   | "FSX_ONTAP" -> FSX_ONTAP
   | _ -> failwith "unknown enum value"
    : storage_class)

let sse_customer_key_m_d5_of_xml i attrs = Read.data i
let ssekms_key_id_of_xml i attrs = Read.data i
let sse_customer_algorithm_of_xml i attrs = Read.data i

let server_side_encryption_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "AES256" -> AES256
   | "aws:fsx" -> Aws_fsx
   | "aws:kms" -> Aws_kms
   | "aws:kms:dsse" -> Aws_kms_dsse
   | _ -> failwith "unknown enum value"
    : server_side_encryption)

let restore_of_xml i attrs = Read.data i

let replication_status_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "COMPLETE" -> COMPLETE
   | "PENDING" -> PENDING
   | "FAILED" -> FAILED
   | "REPLICA" -> REPLICA
   | "COMPLETED" -> COMPLETED
   | _ -> failwith "unknown enum value"
    : replication_status)

let parts_count_of_xml i attrs = Primitive.int_of_string (Read.data i)
let object_lock_retain_until_date_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)

let object_lock_legal_hold_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "ON" -> ON | "OFF" -> OFF | _ -> failwith "unknown enum value"
    : object_lock_legal_hold_status)

let object_lock_mode_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "GOVERNANCE" -> GOVERNANCE
   | "COMPLIANCE" -> COMPLIANCE
   | _ -> failwith "unknown enum value"
    : object_lock_mode)

let metadata_value_of_xml i attrs = Read.data i
let metadata_key_of_xml i attrs = Read.data i

let metadata_of_xml i attrs =
  Read.sequences i "entry"
    (fun i attrs ->
      let k = Read.sequence i "key" (fun i attrs -> metadata_key_of_xml i attrs) () in
      let v = Read.sequence i "value" (fun i attrs -> metadata_value_of_xml i attrs) () in
      (k, v))
    ()

let missing_meta_of_xml i attrs = Primitive.int_of_string (Read.data i)
let last_modified_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let expiration_of_xml i attrs = Read.data i
let expires_of_xml i attrs = Read.data i
let e_tag_of_xml i attrs = Read.data i
let delete_marker_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let checksum_xxhas_h128_of_xml i attrs = Read.data i
let checksum_xxhas_h3_of_xml i attrs = Read.data i
let checksum_xxhas_h64_of_xml i attrs = Read.data i
let checksum_m_d5_of_xml i attrs = Read.data i
let checksum_sh_a512_of_xml i attrs = Read.data i
let checksum_sh_a256_of_xml i attrs = Read.data i
let checksum_sh_a1_of_xml i attrs = Read.data i
let checksum_crc64nvm_e_of_xml i attrs = Read.data i
let checksum_crc32_c_of_xml i attrs = Read.data i
let checksum_cr_c32_of_xml i attrs = Read.data i
let content_type_of_xml i attrs = Read.data i
let content_range_of_xml i attrs = Read.data i
let content_length_of_xml i attrs = Primitive.long_of_string (Read.data i)
let content_language_of_xml i attrs = Read.data i
let content_encoding_of_xml i attrs = Read.data i
let content_disposition_of_xml i attrs = Read.data i
let cache_control_of_xml i attrs = Read.data i
let error_message_of_xml i attrs = Read.data i
let error_code_of_xml i attrs = Read.data i
let get_object_response_status_code_of_xml i attrs = Primitive.int_of_string (Read.data i)
let streaming_blob_of_xml i attrs = Primitive.blob_of_string (Read.data i)
let request_token_of_xml i attrs = Read.data i
let request_route_of_xml i attrs = Read.data i

let write_get_object_response_request_of_xml i attrs =
  let r_request_route = ref None in
  let r_request_token = ref None in
  let r_body = ref None in
  let r_status_code = ref None in
  let r_error_code = ref None in
  let r_error_message = ref None in
  let r_accept_ranges = ref None in
  let r_cache_control = ref None in
  let r_content_disposition = ref None in
  let r_content_encoding = ref None in
  let r_content_language = ref None in
  let r_content_length = ref None in
  let r_content_range = ref None in
  let r_content_type = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_delete_marker = ref None in
  let r_e_tag = ref None in
  let r_expires = ref None in
  let r_expiration = ref None in
  let r_last_modified = ref None in
  let r_missing_meta = ref None in
  let r_metadata = ref None in
  let r_object_lock_mode = ref None in
  let r_object_lock_legal_hold_status = ref None in
  let r_object_lock_retain_until_date = ref None in
  let r_parts_count = ref None in
  let r_replication_status = ref None in
  let r_request_charged = ref None in
  let r_restore = ref None in
  let r_server_side_encryption = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_ssekms_key_id = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_storage_class = ref None in
  let r_tag_count = ref None in
  let r_version_id = ref None in
  let r_bucket_key_enabled = ref None in
  Structure.scanSequence i
    [
      "RequestRoute";
      "RequestToken";
      "Body";
      "StatusCode";
      "ErrorCode";
      "ErrorMessage";
      "AcceptRanges";
      "CacheControl";
      "ContentDisposition";
      "ContentEncoding";
      "ContentLanguage";
      "ContentLength";
      "ContentRange";
      "ContentType";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "DeleteMarker";
      "ETag";
      "Expires";
      "Expiration";
      "LastModified";
      "MissingMeta";
      "Metadata";
      "ObjectLockMode";
      "ObjectLockLegalHoldStatus";
      "ObjectLockRetainUntilDate";
      "PartsCount";
      "ReplicationStatus";
      "RequestCharged";
      "Restore";
      "ServerSideEncryption";
      "SSECustomerAlgorithm";
      "SSEKMSKeyId";
      "SSECustomerKeyMD5";
      "StorageClass";
      "TagCount";
      "VersionId";
      "BucketKeyEnabled";
    ] (fun tag _ ->
      match tag with
      | "RequestRoute" ->
          r_request_route :=
            Some (Read.sequence i "RequestRoute" (fun i attrs -> request_route_of_xml i attrs) ())
      | "RequestToken" ->
          r_request_token :=
            Some (Read.sequence i "RequestToken" (fun i attrs -> request_token_of_xml i attrs) ())
      | "Body" ->
          r_body := Some (Read.sequence i "Body" (fun i attrs -> streaming_blob_of_xml i attrs) ())
      | "StatusCode" ->
          r_status_code :=
            Some
              (Read.sequence i "StatusCode"
                 (fun i attrs -> get_object_response_status_code_of_xml i attrs)
                 ())
      | "ErrorCode" ->
          r_error_code :=
            Some (Read.sequence i "ErrorCode" (fun i attrs -> error_code_of_xml i attrs) ())
      | "ErrorMessage" ->
          r_error_message :=
            Some (Read.sequence i "ErrorMessage" (fun i attrs -> error_message_of_xml i attrs) ())
      | "AcceptRanges" ->
          r_accept_ranges :=
            Some (Read.sequence i "AcceptRanges" (fun i attrs -> accept_ranges_of_xml i attrs) ())
      | "CacheControl" ->
          r_cache_control :=
            Some (Read.sequence i "CacheControl" (fun i attrs -> cache_control_of_xml i attrs) ())
      | "ContentDisposition" ->
          r_content_disposition :=
            Some
              (Read.sequence i "ContentDisposition"
                 (fun i attrs -> content_disposition_of_xml i attrs)
                 ())
      | "ContentEncoding" ->
          r_content_encoding :=
            Some
              (Read.sequence i "ContentEncoding"
                 (fun i attrs -> content_encoding_of_xml i attrs)
                 ())
      | "ContentLanguage" ->
          r_content_language :=
            Some
              (Read.sequence i "ContentLanguage"
                 (fun i attrs -> content_language_of_xml i attrs)
                 ())
      | "ContentLength" ->
          r_content_length :=
            Some (Read.sequence i "ContentLength" (fun i attrs -> content_length_of_xml i attrs) ())
      | "ContentRange" ->
          r_content_range :=
            Some (Read.sequence i "ContentRange" (fun i attrs -> content_range_of_xml i attrs) ())
      | "ContentType" ->
          r_content_type :=
            Some (Read.sequence i "ContentType" (fun i attrs -> content_type_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "DeleteMarker" ->
          r_delete_marker :=
            Some (Read.sequence i "DeleteMarker" (fun i attrs -> delete_marker_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "Expires" ->
          r_expires := Some (Read.sequence i "Expires" (fun i attrs -> expires_of_xml i attrs) ())
      | "Expiration" ->
          r_expiration :=
            Some (Read.sequence i "Expiration" (fun i attrs -> expiration_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "MissingMeta" ->
          r_missing_meta :=
            Some (Read.sequence i "MissingMeta" (fun i attrs -> missing_meta_of_xml i attrs) ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Read.sequence i "Metadata"
                 (fun i attrs ->
                   Read.sequences i "entry"
                     (fun i attrs ->
                       let k =
                         Read.sequence i "key" (fun i attrs -> metadata_key_of_xml i attrs) ()
                       in
                       let v =
                         Read.sequence i "value" (fun i attrs -> metadata_value_of_xml i attrs) ()
                       in
                       (k, v))
                     ())
                 ())
      | "ObjectLockMode" ->
          r_object_lock_mode :=
            Some
              (Read.sequence i "ObjectLockMode" (fun i attrs -> object_lock_mode_of_xml i attrs) ())
      | "ObjectLockLegalHoldStatus" ->
          r_object_lock_legal_hold_status :=
            Some
              (Read.sequence i "ObjectLockLegalHoldStatus"
                 (fun i attrs -> object_lock_legal_hold_status_of_xml i attrs)
                 ())
      | "ObjectLockRetainUntilDate" ->
          r_object_lock_retain_until_date :=
            Some
              (Read.sequence i "ObjectLockRetainUntilDate"
                 (fun i attrs -> object_lock_retain_until_date_of_xml i attrs)
                 ())
      | "PartsCount" ->
          r_parts_count :=
            Some (Read.sequence i "PartsCount" (fun i attrs -> parts_count_of_xml i attrs) ())
      | "ReplicationStatus" ->
          r_replication_status :=
            Some
              (Read.sequence i "ReplicationStatus"
                 (fun i attrs -> replication_status_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "Restore" ->
          r_restore := Some (Read.sequence i "Restore" (fun i attrs -> restore_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "TagCount" ->
          r_tag_count :=
            Some (Read.sequence i "TagCount" (fun i attrs -> tag_count_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     request_route = required "RequestRoute" (( ! ) r_request_route) i;
     request_token = required "RequestToken" (( ! ) r_request_token) i;
     body = ( ! ) r_body;
     status_code = ( ! ) r_status_code;
     error_code = ( ! ) r_error_code;
     error_message = ( ! ) r_error_message;
     accept_ranges = ( ! ) r_accept_ranges;
     cache_control = ( ! ) r_cache_control;
     content_disposition = ( ! ) r_content_disposition;
     content_encoding = ( ! ) r_content_encoding;
     content_language = ( ! ) r_content_language;
     content_length = ( ! ) r_content_length;
     content_range = ( ! ) r_content_range;
     content_type = ( ! ) r_content_type;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     delete_marker = ( ! ) r_delete_marker;
     e_tag = ( ! ) r_e_tag;
     expires = ( ! ) r_expires;
     expiration = ( ! ) r_expiration;
     last_modified = ( ! ) r_last_modified;
     missing_meta = ( ! ) r_missing_meta;
     metadata = ( ! ) r_metadata;
     object_lock_mode = ( ! ) r_object_lock_mode;
     object_lock_legal_hold_status = ( ! ) r_object_lock_legal_hold_status;
     object_lock_retain_until_date = ( ! ) r_object_lock_retain_until_date;
     parts_count = ( ! ) r_parts_count;
     replication_status = ( ! ) r_replication_status;
     request_charged = ( ! ) r_request_charged;
     restore = ( ! ) r_restore;
     server_side_encryption = ( ! ) r_server_side_encryption;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     storage_class = ( ! ) r_storage_class;
     tag_count = ( ! ) r_tag_count;
     version_id = ( ! ) r_version_id;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
   }
    : write_get_object_response_request)

let copy_part_result_of_xml i attrs =
  let r_e_tag = ref None in
  let r_last_modified = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  Structure.scanSequence i
    [
      "ETag";
      "LastModified";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
    ] (fun tag _ ->
      match tag with
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     e_tag = ( ! ) r_e_tag;
     last_modified = ( ! ) r_last_modified;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
   }
    : copy_part_result)

let copy_source_version_id_of_xml i attrs = Read.data i

let upload_part_copy_output_of_xml i attrs =
  let r_copy_source_version_id = ref None in
  let r_copy_part_result = ref None in
  let r_server_side_encryption = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_bucket_key_enabled = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "CopySourceVersionId";
      "CopyPartResult";
      "ServerSideEncryption";
      "SSECustomerAlgorithm";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "BucketKeyEnabled";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "CopySourceVersionId" ->
          r_copy_source_version_id :=
            Some
              (Read.sequence i "CopySourceVersionId"
                 (fun i attrs -> copy_source_version_id_of_xml i attrs)
                 ())
      | "CopyPartResult" ->
          r_copy_part_result :=
            Some
              (Read.sequence i "CopyPartResult" (fun i attrs -> copy_part_result_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     copy_source_version_id = ( ! ) r_copy_source_version_id;
     copy_part_result = ( ! ) r_copy_part_result;
     server_side_encryption = ( ! ) r_server_side_encryption;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     request_charged = ( ! ) r_request_charged;
   }
    : upload_part_copy_output)

let copy_source_sse_customer_key_m_d5_of_xml i attrs = Read.data i
let copy_source_sse_customer_key_of_xml i attrs = Read.data i
let copy_source_sse_customer_algorithm_of_xml i attrs = Read.data i
let sse_customer_key_of_xml i attrs = Read.data i
let part_number_of_xml i attrs = Primitive.int_of_string (Read.data i)
let copy_source_range_of_xml i attrs = Read.data i
let copy_source_if_unmodified_since_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let copy_source_if_none_match_of_xml i attrs = Read.data i
let copy_source_if_modified_since_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let copy_source_if_match_of_xml i attrs = Read.data i
let copy_source_of_xml i attrs = Read.data i

let upload_part_copy_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_copy_source = ref None in
  let r_copy_source_if_match = ref None in
  let r_copy_source_if_modified_since = ref None in
  let r_copy_source_if_none_match = ref None in
  let r_copy_source_if_unmodified_since = ref None in
  let r_copy_source_range = ref None in
  let r_key = ref None in
  let r_part_number = ref None in
  let r_upload_id = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_copy_source_sse_customer_algorithm = ref None in
  let r_copy_source_sse_customer_key = ref None in
  let r_copy_source_sse_customer_key_m_d5 = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_expected_source_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "CopySource";
      "CopySourceIfMatch";
      "CopySourceIfModifiedSince";
      "CopySourceIfNoneMatch";
      "CopySourceIfUnmodifiedSince";
      "CopySourceRange";
      "Key";
      "PartNumber";
      "UploadId";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "CopySourceSSECustomerAlgorithm";
      "CopySourceSSECustomerKey";
      "CopySourceSSECustomerKeyMD5";
      "RequestPayer";
      "ExpectedBucketOwner";
      "ExpectedSourceBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "CopySource" ->
          r_copy_source :=
            Some (Read.sequence i "CopySource" (fun i attrs -> copy_source_of_xml i attrs) ())
      | "CopySourceIfMatch" ->
          r_copy_source_if_match :=
            Some
              (Read.sequence i "CopySourceIfMatch"
                 (fun i attrs -> copy_source_if_match_of_xml i attrs)
                 ())
      | "CopySourceIfModifiedSince" ->
          r_copy_source_if_modified_since :=
            Some
              (Read.sequence i "CopySourceIfModifiedSince"
                 (fun i attrs -> copy_source_if_modified_since_of_xml i attrs)
                 ())
      | "CopySourceIfNoneMatch" ->
          r_copy_source_if_none_match :=
            Some
              (Read.sequence i "CopySourceIfNoneMatch"
                 (fun i attrs -> copy_source_if_none_match_of_xml i attrs)
                 ())
      | "CopySourceIfUnmodifiedSince" ->
          r_copy_source_if_unmodified_since :=
            Some
              (Read.sequence i "CopySourceIfUnmodifiedSince"
                 (fun i attrs -> copy_source_if_unmodified_since_of_xml i attrs)
                 ())
      | "CopySourceRange" ->
          r_copy_source_range :=
            Some
              (Read.sequence i "CopySourceRange"
                 (fun i attrs -> copy_source_range_of_xml i attrs)
                 ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "PartNumber" ->
          r_part_number :=
            Some (Read.sequence i "PartNumber" (fun i attrs -> part_number_of_xml i attrs) ())
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "CopySourceSSECustomerAlgorithm" ->
          r_copy_source_sse_customer_algorithm :=
            Some
              (Read.sequence i "CopySourceSSECustomerAlgorithm"
                 (fun i attrs -> copy_source_sse_customer_algorithm_of_xml i attrs)
                 ())
      | "CopySourceSSECustomerKey" ->
          r_copy_source_sse_customer_key :=
            Some
              (Read.sequence i "CopySourceSSECustomerKey"
                 (fun i attrs -> copy_source_sse_customer_key_of_xml i attrs)
                 ())
      | "CopySourceSSECustomerKeyMD5" ->
          r_copy_source_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "CopySourceSSECustomerKeyMD5"
                 (fun i attrs -> copy_source_sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ExpectedSourceBucketOwner" ->
          r_expected_source_bucket_owner :=
            Some
              (Read.sequence i "ExpectedSourceBucketOwner"
                 (fun i attrs -> account_id_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     copy_source = required "CopySource" (( ! ) r_copy_source) i;
     copy_source_if_match = ( ! ) r_copy_source_if_match;
     copy_source_if_modified_since = ( ! ) r_copy_source_if_modified_since;
     copy_source_if_none_match = ( ! ) r_copy_source_if_none_match;
     copy_source_if_unmodified_since = ( ! ) r_copy_source_if_unmodified_since;
     copy_source_range = ( ! ) r_copy_source_range;
     key = required "Key" (( ! ) r_key) i;
     part_number = required "PartNumber" (( ! ) r_part_number) i;
     upload_id = required "UploadId" (( ! ) r_upload_id) i;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     copy_source_sse_customer_algorithm = ( ! ) r_copy_source_sse_customer_algorithm;
     copy_source_sse_customer_key = ( ! ) r_copy_source_sse_customer_key;
     copy_source_sse_customer_key_m_d5 = ( ! ) r_copy_source_sse_customer_key_m_d5;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     expected_source_bucket_owner = ( ! ) r_expected_source_bucket_owner;
   }
    : upload_part_copy_request)

let upload_part_output_of_xml i attrs =
  let r_server_side_encryption = ref None in
  let r_e_tag = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_bucket_key_enabled = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "ServerSideEncryption";
      "ETag";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "SSECustomerAlgorithm";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "BucketKeyEnabled";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     server_side_encryption = ( ! ) r_server_side_encryption;
     e_tag = ( ! ) r_e_tag;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     request_charged = ( ! ) r_request_charged;
   }
    : upload_part_output)

let checksum_algorithm_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "CRC32" -> CRC32
   | "CRC32C" -> CRC32C
   | "SHA1" -> SHA1
   | "SHA256" -> SHA256
   | "CRC64NVME" -> CRC64NVME
   | "SHA512" -> SHA512
   | "MD5" -> MD5
   | "XXHASH64" -> XXHASH64
   | "XXHASH3" -> XXHASH3
   | "XXHASH128" -> XXHASH128
   | _ -> failwith "unknown enum value"
    : checksum_algorithm)

let content_m_d5_of_xml i attrs = Read.data i

let upload_part_request_of_xml i attrs =
  let r_body = ref None in
  let r_bucket = ref None in
  let r_content_length = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_key = ref None in
  let r_part_number = ref None in
  let r_upload_id = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Body";
      "Bucket";
      "ContentLength";
      "ContentMD5";
      "ChecksumAlgorithm";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "Key";
      "PartNumber";
      "UploadId";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "RequestPayer";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Body" ->
          r_body := Some (Read.sequence i "Body" (fun i attrs -> streaming_blob_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentLength" ->
          r_content_length :=
            Some (Read.sequence i "ContentLength" (fun i attrs -> content_length_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "PartNumber" ->
          r_part_number :=
            Some (Read.sequence i "PartNumber" (fun i attrs -> part_number_of_xml i attrs) ())
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     body = ( ! ) r_body;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_length = ( ! ) r_content_length;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     key = required "Key" (( ! ) r_key) i;
     part_number = required "PartNumber" (( ! ) r_part_number) i;
     upload_id = required "UploadId" (( ! ) r_upload_id) i;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : upload_part_request)

let no_such_key_of_xml i attrs = ()
let invalid_request_of_xml i attrs = ()

let update_object_encryption_response_of_xml i attrs =
  let r_request_charged = ref None in
  Structure.scanSequence i [ "RequestCharged" ] (fun tag _ ->
      match tag with
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ request_charged = ( ! ) r_request_charged } : update_object_encryption_response)

let non_empty_kms_key_arn_string_of_xml i attrs = Read.data i

let ssekms_encryption_of_xml i attrs =
  let r_kms_key_arn = ref None in
  let r_bucket_key_enabled = ref None in
  Structure.scanSequence i [ "KMSKeyArn"; "BucketKeyEnabled" ] (fun tag _ ->
      match tag with
      | "KMSKeyArn" ->
          r_kms_key_arn :=
            Some
              (Read.sequence i "KMSKeyArn"
                 (fun i attrs -> non_empty_kms_key_arn_string_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     kms_key_arn = required "KMSKeyArn" (( ! ) r_kms_key_arn) i;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
   }
    : ssekms_encryption)

let object_encryption_of_xml i attrs =
  let r_ssekm_s = ref None in
  Structure.scanSequence i [ "SSE-KMS" ] (fun tag _ ->
      match tag with
      | "SSE-KMS" ->
          r_ssekm_s :=
            Some (Read.sequence i "SSE-KMS" (fun i attrs -> ssekms_encryption_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  (match ( ! ) r_ssekm_s with
   | Some v -> SSEKMS v
   | None -> failwith "no union member present in xml response"
    : object_encryption)

let update_object_encryption_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_object_encryption = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "VersionId";
      "ObjectEncryption";
      "RequestPayer";
      "ExpectedBucketOwner";
      "ContentMD5";
      "ChecksumAlgorithm";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ObjectEncryption" ->
          r_object_encryption :=
            Some
              (Read.sequence i "ObjectEncryption"
                 (fun i attrs -> object_encryption_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     object_encryption = required "ObjectEncryption" (( ! ) r_object_encryption) i;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
   }
    : update_object_encryption_request)

let record_expiration_days_of_xml i attrs = Primitive.int_of_string (Read.data i)

let expiration_state_of_xml i attrs =
  let s = Read.data i in
  (match s with "ENABLED" -> ENABLED | "DISABLED" -> DISABLED | _ -> failwith "unknown enum value"
    : expiration_state)

let record_expiration_of_xml i attrs =
  let r_expiration = ref None in
  let r_days = ref None in
  Structure.scanSequence i [ "Expiration"; "Days" ] (fun tag _ ->
      match tag with
      | "Expiration" ->
          r_expiration :=
            Some (Read.sequence i "Expiration" (fun i attrs -> expiration_state_of_xml i attrs) ())
      | "Days" ->
          r_days :=
            Some (Read.sequence i "Days" (fun i attrs -> record_expiration_days_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ expiration = required "Expiration" (( ! ) r_expiration) i; days = ( ! ) r_days }
    : record_expiration)

let journal_table_configuration_updates_of_xml i attrs =
  let r_record_expiration = ref None in
  Structure.scanSequence i [ "RecordExpiration" ] (fun tag _ ->
      match tag with
      | "RecordExpiration" ->
          r_record_expiration :=
            Some
              (Read.sequence i "RecordExpiration"
                 (fun i attrs -> record_expiration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ record_expiration = required "RecordExpiration" (( ! ) r_record_expiration) i }
    : journal_table_configuration_updates)

let update_bucket_metadata_journal_table_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_journal_table_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "JournalTableConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "JournalTableConfiguration" ->
          r_journal_table_configuration :=
            Some
              (Read.sequence i "JournalTableConfiguration"
                 (fun i attrs -> journal_table_configuration_updates_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     journal_table_configuration =
       required "JournalTableConfiguration" (( ! ) r_journal_table_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : update_bucket_metadata_journal_table_configuration_request)

let kms_key_arn_of_xml i attrs = Read.data i

let table_sse_algorithm_of_xml i attrs =
  let s = Read.data i in
  (match s with "aws:kms" -> Aws_kms | "AES256" -> AES256 | _ -> failwith "unknown enum value"
    : table_sse_algorithm)

let metadata_table_encryption_configuration_of_xml i attrs =
  let r_sse_algorithm = ref None in
  let r_kms_key_arn = ref None in
  Structure.scanSequence i [ "SseAlgorithm"; "KmsKeyArn" ] (fun tag _ ->
      match tag with
      | "SseAlgorithm" ->
          r_sse_algorithm :=
            Some
              (Read.sequence i "SseAlgorithm"
                 (fun i attrs -> table_sse_algorithm_of_xml i attrs)
                 ())
      | "KmsKeyArn" ->
          r_kms_key_arn :=
            Some (Read.sequence i "KmsKeyArn" (fun i attrs -> kms_key_arn_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     sse_algorithm = required "SseAlgorithm" (( ! ) r_sse_algorithm) i;
     kms_key_arn = ( ! ) r_kms_key_arn;
   }
    : metadata_table_encryption_configuration)

let inventory_configuration_state_of_xml i attrs =
  let s = Read.data i in
  (match s with "ENABLED" -> ENABLED | "DISABLED" -> DISABLED | _ -> failwith "unknown enum value"
    : inventory_configuration_state)

let inventory_table_configuration_updates_of_xml i attrs =
  let r_configuration_state = ref None in
  let r_encryption_configuration = ref None in
  Structure.scanSequence i [ "ConfigurationState"; "EncryptionConfiguration" ] (fun tag _ ->
      match tag with
      | "ConfigurationState" ->
          r_configuration_state :=
            Some
              (Read.sequence i "ConfigurationState"
                 (fun i attrs -> inventory_configuration_state_of_xml i attrs)
                 ())
      | "EncryptionConfiguration" ->
          r_encryption_configuration :=
            Some
              (Read.sequence i "EncryptionConfiguration"
                 (fun i attrs -> metadata_table_encryption_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     configuration_state = required "ConfigurationState" (( ! ) r_configuration_state) i;
     encryption_configuration = ( ! ) r_encryption_configuration;
   }
    : inventory_table_configuration_updates)

let update_bucket_metadata_inventory_table_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_inventory_table_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "InventoryTableConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "InventoryTableConfiguration" ->
          r_inventory_table_configuration :=
            Some
              (Read.sequence i "InventoryTableConfiguration"
                 (fun i attrs -> inventory_table_configuration_updates_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     inventory_table_configuration =
       required "InventoryTableConfiguration" (( ! ) r_inventory_table_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : update_bucket_metadata_inventory_table_configuration_request)

let role_of_xml i attrs = Read.data i

let annotation_configuration_state_of_xml i attrs =
  let s = Read.data i in
  (match s with "ENABLED" -> ENABLED | "DISABLED" -> DISABLED | _ -> failwith "unknown enum value"
    : annotation_configuration_state)

let annotation_table_configuration_updates_of_xml i attrs =
  let r_configuration_state = ref None in
  let r_encryption_configuration = ref None in
  let r_role = ref None in
  Structure.scanSequence i [ "ConfigurationState"; "EncryptionConfiguration"; "Role" ] (fun tag _ ->
      match tag with
      | "ConfigurationState" ->
          r_configuration_state :=
            Some
              (Read.sequence i "ConfigurationState"
                 (fun i attrs -> annotation_configuration_state_of_xml i attrs)
                 ())
      | "EncryptionConfiguration" ->
          r_encryption_configuration :=
            Some
              (Read.sequence i "EncryptionConfiguration"
                 (fun i attrs -> metadata_table_encryption_configuration_of_xml i attrs)
                 ())
      | "Role" -> r_role := Some (Read.sequence i "Role" (fun i attrs -> role_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     configuration_state = required "ConfigurationState" (( ! ) r_configuration_state) i;
     encryption_configuration = ( ! ) r_encryption_configuration;
     role = ( ! ) r_role;
   }
    : annotation_table_configuration_updates)

let update_bucket_metadata_annotation_table_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_annotation_table_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "AnnotationTableConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "AnnotationTableConfiguration" ->
          r_annotation_table_configuration :=
            Some
              (Read.sequence i "AnnotationTableConfiguration"
                 (fun i attrs -> annotation_table_configuration_updates_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     annotation_table_configuration =
       required "AnnotationTableConfiguration" (( ! ) r_annotation_table_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : update_bucket_metadata_annotation_table_configuration_request)

let end_event_of_xml i attrs = ()
let continuation_event_of_xml i attrs = ()
let bytes_returned_of_xml i attrs = Primitive.long_of_string (Read.data i)
let bytes_processed_of_xml i attrs = Primitive.long_of_string (Read.data i)
let bytes_scanned_of_xml i attrs = Primitive.long_of_string (Read.data i)

let progress_of_xml i attrs =
  let r_bytes_scanned = ref None in
  let r_bytes_processed = ref None in
  let r_bytes_returned = ref None in
  Structure.scanSequence i [ "BytesScanned"; "BytesProcessed"; "BytesReturned" ] (fun tag _ ->
      match tag with
      | "BytesScanned" ->
          r_bytes_scanned :=
            Some (Read.sequence i "BytesScanned" (fun i attrs -> bytes_scanned_of_xml i attrs) ())
      | "BytesProcessed" ->
          r_bytes_processed :=
            Some
              (Read.sequence i "BytesProcessed" (fun i attrs -> bytes_processed_of_xml i attrs) ())
      | "BytesReturned" ->
          r_bytes_returned :=
            Some (Read.sequence i "BytesReturned" (fun i attrs -> bytes_returned_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bytes_scanned = ( ! ) r_bytes_scanned;
     bytes_processed = ( ! ) r_bytes_processed;
     bytes_returned = ( ! ) r_bytes_returned;
   }
    : progress)

let progress_event_of_xml i attrs =
  let r_details = ref None in
  Structure.scanSequence i [ "Details" ] (fun tag _ ->
      match tag with
      | "Details" ->
          r_details := Some (Read.sequence i "Details" (fun i attrs -> progress_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ details = ( ! ) r_details } : progress_event)

let stats_of_xml i attrs =
  let r_bytes_scanned = ref None in
  let r_bytes_processed = ref None in
  let r_bytes_returned = ref None in
  Structure.scanSequence i [ "BytesScanned"; "BytesProcessed"; "BytesReturned" ] (fun tag _ ->
      match tag with
      | "BytesScanned" ->
          r_bytes_scanned :=
            Some (Read.sequence i "BytesScanned" (fun i attrs -> bytes_scanned_of_xml i attrs) ())
      | "BytesProcessed" ->
          r_bytes_processed :=
            Some
              (Read.sequence i "BytesProcessed" (fun i attrs -> bytes_processed_of_xml i attrs) ())
      | "BytesReturned" ->
          r_bytes_returned :=
            Some (Read.sequence i "BytesReturned" (fun i attrs -> bytes_returned_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bytes_scanned = ( ! ) r_bytes_scanned;
     bytes_processed = ( ! ) r_bytes_processed;
     bytes_returned = ( ! ) r_bytes_returned;
   }
    : stats)

let stats_event_of_xml i attrs =
  let r_details = ref None in
  Structure.scanSequence i [ "Details" ] (fun tag _ ->
      match tag with
      | "Details" ->
          r_details := Some (Read.sequence i "Details" (fun i attrs -> stats_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ details = ( ! ) r_details } : stats_event)

let body_of_xml i attrs = Primitive.blob_of_string (Read.data i)

let records_event_of_xml i attrs =
  let r_payload = ref None in
  Structure.scanSequence i [ "Payload" ] (fun tag _ ->
      match tag with
      | "Payload" ->
          r_payload := Some (Read.sequence i "Payload" (fun i attrs -> body_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : records_event)

let select_object_content_event_stream_of_xml i attrs =
  let r_records = ref None in
  let r_stats = ref None in
  let r_progress = ref None in
  let r_cont = ref None in
  let r_end_ = ref None in
  Structure.scanSequence i [ "Records"; "Stats"; "Progress"; "Cont"; "End" ] (fun tag _ ->
      match tag with
      | "Records" ->
          r_records :=
            Some (Read.sequence i "Records" (fun i attrs -> records_event_of_xml i attrs) ())
      | "Stats" ->
          r_stats := Some (Read.sequence i "Stats" (fun i attrs -> stats_event_of_xml i attrs) ())
      | "Progress" ->
          r_progress :=
            Some (Read.sequence i "Progress" (fun i attrs -> progress_event_of_xml i attrs) ())
      | "Cont" ->
          r_cont :=
            Some (Read.sequence i "Cont" (fun i attrs -> continuation_event_of_xml i attrs) ())
      | "End" -> r_end_ := Some (Read.sequence i "End" (fun i attrs -> end_event_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  (match ( ! ) r_records with
   | Some v -> Records v
   | None -> (
       match ( ! ) r_stats with
       | Some v -> Stats v
       | None -> (
           match ( ! ) r_progress with
           | Some v -> Progress v
           | None -> (
               match ( ! ) r_cont with
               | Some v -> Cont v
               | None -> (
                   match ( ! ) r_end_ with
                   | Some v -> End v
                   | None -> failwith "no union member present in xml response"))))
    : select_object_content_event_stream)

let select_object_content_output_of_xml i attrs =
  let r_payload = ref None in
  Structure.scanSequence i [ "Payload" ] (fun tag _ ->
      match tag with
      | "Payload" ->
          r_payload :=
            Some
              (Read.sequence i "Payload"
                 (fun i attrs -> select_object_content_event_stream_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : select_object_content_output)

let end__of_xml i attrs = Primitive.long_of_string (Read.data i)
let start_of_xml i attrs = Primitive.long_of_string (Read.data i)

let scan_range_of_xml i attrs =
  let r_start = ref None in
  let r_end_ = ref None in
  Structure.scanSequence i [ "Start"; "End" ] (fun tag _ ->
      match tag with
      | "Start" ->
          r_start := Some (Read.sequence i "Start" (fun i attrs -> start_of_xml i attrs) ())
      | "End" -> r_end_ := Some (Read.sequence i "End" (fun i attrs -> end__of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ start = ( ! ) r_start; end_ = ( ! ) r_end_ } : scan_range)

let record_delimiter_of_xml i attrs = Read.data i

let json_output_of_xml i attrs =
  let r_record_delimiter = ref None in
  Structure.scanSequence i [ "RecordDelimiter" ] (fun tag _ ->
      match tag with
      | "RecordDelimiter" ->
          r_record_delimiter :=
            Some
              (Read.sequence i "RecordDelimiter"
                 (fun i attrs -> record_delimiter_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ record_delimiter = ( ! ) r_record_delimiter } : json_output)

let quote_character_of_xml i attrs = Read.data i
let field_delimiter_of_xml i attrs = Read.data i
let quote_escape_character_of_xml i attrs = Read.data i

let quote_fields_of_xml i attrs =
  let s = Read.data i in
  (match s with "ALWAYS" -> ALWAYS | "ASNEEDED" -> ASNEEDED | _ -> failwith "unknown enum value"
    : quote_fields)

let csv_output_of_xml i attrs =
  let r_quote_fields = ref None in
  let r_quote_escape_character = ref None in
  let r_record_delimiter = ref None in
  let r_field_delimiter = ref None in
  let r_quote_character = ref None in
  Structure.scanSequence i
    [ "QuoteFields"; "QuoteEscapeCharacter"; "RecordDelimiter"; "FieldDelimiter"; "QuoteCharacter" ]
    (fun tag _ ->
      match tag with
      | "QuoteFields" ->
          r_quote_fields :=
            Some (Read.sequence i "QuoteFields" (fun i attrs -> quote_fields_of_xml i attrs) ())
      | "QuoteEscapeCharacter" ->
          r_quote_escape_character :=
            Some
              (Read.sequence i "QuoteEscapeCharacter"
                 (fun i attrs -> quote_escape_character_of_xml i attrs)
                 ())
      | "RecordDelimiter" ->
          r_record_delimiter :=
            Some
              (Read.sequence i "RecordDelimiter"
                 (fun i attrs -> record_delimiter_of_xml i attrs)
                 ())
      | "FieldDelimiter" ->
          r_field_delimiter :=
            Some
              (Read.sequence i "FieldDelimiter" (fun i attrs -> field_delimiter_of_xml i attrs) ())
      | "QuoteCharacter" ->
          r_quote_character :=
            Some
              (Read.sequence i "QuoteCharacter" (fun i attrs -> quote_character_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     quote_fields = ( ! ) r_quote_fields;
     quote_escape_character = ( ! ) r_quote_escape_character;
     record_delimiter = ( ! ) r_record_delimiter;
     field_delimiter = ( ! ) r_field_delimiter;
     quote_character = ( ! ) r_quote_character;
   }
    : csv_output)

let output_serialization_of_xml i attrs =
  let r_cs_v = ref None in
  let r_jso_n = ref None in
  Structure.scanSequence i [ "CSV"; "JSON" ] (fun tag _ ->
      match tag with
      | "CSV" ->
          r_cs_v := Some (Read.sequence i "CSV" (fun i attrs -> csv_output_of_xml i attrs) ())
      | "JSON" ->
          r_jso_n := Some (Read.sequence i "JSON" (fun i attrs -> json_output_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ cs_v = ( ! ) r_cs_v; jso_n = ( ! ) r_jso_n } : output_serialization)

let parquet_input_of_xml i attrs = ()

let json_type_of_xml i attrs =
  let s = Read.data i in
  (match s with "DOCUMENT" -> DOCUMENT | "LINES" -> LINES | _ -> failwith "unknown enum value"
    : json_type)

let json_input_of_xml i attrs =
  let r_type_ = ref None in
  Structure.scanSequence i [ "Type" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ := Some (Read.sequence i "Type" (fun i attrs -> json_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ type_ = ( ! ) r_type_ } : json_input)

let compression_type_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "NONE" -> NONE
   | "GZIP" -> GZIP
   | "BZIP2" -> BZIP2
   | _ -> failwith "unknown enum value"
    : compression_type)

let comments_of_xml i attrs = Read.data i

let file_header_info_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "USE" -> USE
   | "IGNORE" -> IGNORE
   | "NONE" -> NONE
   | _ -> failwith "unknown enum value"
    : file_header_info)

let csv_input_of_xml i attrs =
  let r_file_header_info = ref None in
  let r_comments = ref None in
  let r_quote_escape_character = ref None in
  let r_record_delimiter = ref None in
  let r_field_delimiter = ref None in
  let r_quote_character = ref None in
  let r_allow_quoted_record_delimiter = ref None in
  Structure.scanSequence i
    [
      "FileHeaderInfo";
      "Comments";
      "QuoteEscapeCharacter";
      "RecordDelimiter";
      "FieldDelimiter";
      "QuoteCharacter";
      "AllowQuotedRecordDelimiter";
    ] (fun tag _ ->
      match tag with
      | "FileHeaderInfo" ->
          r_file_header_info :=
            Some
              (Read.sequence i "FileHeaderInfo" (fun i attrs -> file_header_info_of_xml i attrs) ())
      | "Comments" ->
          r_comments :=
            Some (Read.sequence i "Comments" (fun i attrs -> comments_of_xml i attrs) ())
      | "QuoteEscapeCharacter" ->
          r_quote_escape_character :=
            Some
              (Read.sequence i "QuoteEscapeCharacter"
                 (fun i attrs -> quote_escape_character_of_xml i attrs)
                 ())
      | "RecordDelimiter" ->
          r_record_delimiter :=
            Some
              (Read.sequence i "RecordDelimiter"
                 (fun i attrs -> record_delimiter_of_xml i attrs)
                 ())
      | "FieldDelimiter" ->
          r_field_delimiter :=
            Some
              (Read.sequence i "FieldDelimiter" (fun i attrs -> field_delimiter_of_xml i attrs) ())
      | "QuoteCharacter" ->
          r_quote_character :=
            Some
              (Read.sequence i "QuoteCharacter" (fun i attrs -> quote_character_of_xml i attrs) ())
      | "AllowQuotedRecordDelimiter" ->
          r_allow_quoted_record_delimiter :=
            Some
              (Read.sequence i "AllowQuotedRecordDelimiter"
                 (fun i attrs -> allow_quoted_record_delimiter_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     file_header_info = ( ! ) r_file_header_info;
     comments = ( ! ) r_comments;
     quote_escape_character = ( ! ) r_quote_escape_character;
     record_delimiter = ( ! ) r_record_delimiter;
     field_delimiter = ( ! ) r_field_delimiter;
     quote_character = ( ! ) r_quote_character;
     allow_quoted_record_delimiter = ( ! ) r_allow_quoted_record_delimiter;
   }
    : csv_input)

let input_serialization_of_xml i attrs =
  let r_cs_v = ref None in
  let r_compression_type = ref None in
  let r_jso_n = ref None in
  let r_parquet = ref None in
  Structure.scanSequence i [ "CSV"; "CompressionType"; "JSON"; "Parquet" ] (fun tag _ ->
      match tag with
      | "CSV" -> r_cs_v := Some (Read.sequence i "CSV" (fun i attrs -> csv_input_of_xml i attrs) ())
      | "CompressionType" ->
          r_compression_type :=
            Some
              (Read.sequence i "CompressionType"
                 (fun i attrs -> compression_type_of_xml i attrs)
                 ())
      | "JSON" ->
          r_jso_n := Some (Read.sequence i "JSON" (fun i attrs -> json_input_of_xml i attrs) ())
      | "Parquet" ->
          r_parquet :=
            Some (Read.sequence i "Parquet" (fun i attrs -> parquet_input_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     cs_v = ( ! ) r_cs_v;
     compression_type = ( ! ) r_compression_type;
     jso_n = ( ! ) r_jso_n;
     parquet = ( ! ) r_parquet;
   }
    : input_serialization)

let enable_request_progress_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let request_progress_of_xml i attrs =
  let r_enabled = ref None in
  Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Read.sequence i "Enabled" (fun i attrs -> enable_request_progress_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ enabled = ( ! ) r_enabled } : request_progress)

let expression_type_of_xml i attrs =
  let s = Read.data i in
  (match s with "SQL" -> SQL | _ -> failwith "unknown enum value" : expression_type)

let expression_of_xml i attrs = Read.data i

let select_object_content_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_expression = ref None in
  let r_expression_type = ref None in
  let r_request_progress = ref None in
  let r_input_serialization = ref None in
  let r_output_serialization = ref None in
  let r_scan_range = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "Expression";
      "ExpressionType";
      "RequestProgress";
      "InputSerialization";
      "OutputSerialization";
      "ScanRange";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "Expression" ->
          r_expression :=
            Some (Read.sequence i "Expression" (fun i attrs -> expression_of_xml i attrs) ())
      | "ExpressionType" ->
          r_expression_type :=
            Some
              (Read.sequence i "ExpressionType" (fun i attrs -> expression_type_of_xml i attrs) ())
      | "RequestProgress" ->
          r_request_progress :=
            Some
              (Read.sequence i "RequestProgress"
                 (fun i attrs -> request_progress_of_xml i attrs)
                 ())
      | "InputSerialization" ->
          r_input_serialization :=
            Some
              (Read.sequence i "InputSerialization"
                 (fun i attrs -> input_serialization_of_xml i attrs)
                 ())
      | "OutputSerialization" ->
          r_output_serialization :=
            Some
              (Read.sequence i "OutputSerialization"
                 (fun i attrs -> output_serialization_of_xml i attrs)
                 ())
      | "ScanRange" ->
          r_scan_range :=
            Some (Read.sequence i "ScanRange" (fun i attrs -> scan_range_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     expression = required "Expression" (( ! ) r_expression) i;
     expression_type = required "ExpressionType" (( ! ) r_expression_type) i;
     request_progress = ( ! ) r_request_progress;
     input_serialization = required "InputSerialization" (( ! ) r_input_serialization) i;
     output_serialization = required "OutputSerialization" (( ! ) r_output_serialization) i;
     scan_range = ( ! ) r_scan_range;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : select_object_content_request)

let object_already_in_active_tier_error_of_xml i attrs = ()
let restore_output_path_of_xml i attrs = Read.data i

let restore_object_output_of_xml i attrs =
  let r_request_charged = ref None in
  let r_restore_output_path = ref None in
  Structure.scanSequence i [ "RequestCharged"; "RestoreOutputPath" ] (fun tag _ ->
      match tag with
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "RestoreOutputPath" ->
          r_restore_output_path :=
            Some
              (Read.sequence i "RestoreOutputPath"
                 (fun i attrs -> restore_output_path_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ request_charged = ( ! ) r_request_charged; restore_output_path = ( ! ) r_restore_output_path }
    : restore_object_output)

let metadata_entry_of_xml i attrs =
  let r_name = ref None in
  let r_value = ref None in
  Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name := Some (Read.sequence i "Name" (fun i attrs -> metadata_key_of_xml i attrs) ())
      | "Value" ->
          r_value :=
            Some (Read.sequence i "Value" (fun i attrs -> metadata_value_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ name = ( ! ) r_name; value = ( ! ) r_value } : metadata_entry)

let user_metadata_of_xml i attrs =
  Read.sequences i "MetadataEntry" (fun i attrs -> metadata_entry_of_xml i attrs) ()

let value_of_xml i attrs = Read.data i

let tag_of_xml i attrs =
  let r_key = ref None in
  let r_value = ref None in
  Structure.scanSequence i [ "Key"; "Value" ] (fun tag _ ->
      match tag with
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Value" ->
          r_value := Some (Read.sequence i "Value" (fun i attrs -> value_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ key = required "Key" (( ! ) r_key) i; value = required "Value" (( ! ) r_value) i } : tag)

let tag_set_of_xml i attrs = Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ()

let tagging_of_xml i attrs =
  let r_tag_set = ref None in
  Structure.scanSequence i [ "TagSet" ] (fun tag _ ->
      match tag with
      | "TagSet" ->
          r_tag_set :=
            Some
              (Read.sequence i "TagSet"
                 (fun i attrs -> Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({ tag_set = required "TagSet" (( ! ) r_tag_set) i } : tagging)

let object_canned_ac_l_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "private" -> Private
   | "public-read" -> Public_read
   | "public-read-write" -> Public_read_write
   | "authenticated-read" -> Authenticated_read
   | "aws-exec-read" -> Aws_exec_read
   | "bucket-owner-read" -> Bucket_owner_read
   | "bucket-owner-full-control" -> Bucket_owner_full_control
   | _ -> failwith "unknown enum value"
    : object_canned_ac_l)

let kms_context_of_xml i attrs = Read.data i

let encryption_of_xml i attrs =
  let r_encryption_type = ref None in
  let r_kms_key_id = ref None in
  let r_kms_context = ref None in
  Structure.scanSequence i [ "EncryptionType"; "KMSKeyId"; "KMSContext" ] (fun tag _ ->
      match tag with
      | "EncryptionType" ->
          r_encryption_type :=
            Some
              (Read.sequence i "EncryptionType"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "KMSKeyId" ->
          r_kms_key_id :=
            Some (Read.sequence i "KMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "KMSContext" ->
          r_kms_context :=
            Some (Read.sequence i "KMSContext" (fun i attrs -> kms_context_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     encryption_type = required "EncryptionType" (( ! ) r_encryption_type) i;
     kms_key_id = ( ! ) r_kms_key_id;
     kms_context = ( ! ) r_kms_context;
   }
    : encryption)

let location_prefix_of_xml i attrs = Read.data i

let s3_location_of_xml i attrs =
  let r_bucket_name = ref None in
  let r_prefix = ref None in
  let r_encryption = ref None in
  let r_canned_ac_l = ref None in
  let r_access_control_list = ref None in
  let r_tagging = ref None in
  let r_user_metadata = ref None in
  let r_storage_class = ref None in
  Structure.scanSequence i
    [
      "BucketName";
      "Prefix";
      "Encryption";
      "CannedACL";
      "AccessControlList";
      "Tagging";
      "UserMetadata";
      "StorageClass";
    ] (fun tag _ ->
      match tag with
      | "BucketName" ->
          r_bucket_name :=
            Some (Read.sequence i "BucketName" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix :=
            Some (Read.sequence i "Prefix" (fun i attrs -> location_prefix_of_xml i attrs) ())
      | "Encryption" ->
          r_encryption :=
            Some (Read.sequence i "Encryption" (fun i attrs -> encryption_of_xml i attrs) ())
      | "CannedACL" ->
          r_canned_ac_l :=
            Some (Read.sequence i "CannedACL" (fun i attrs -> object_canned_ac_l_of_xml i attrs) ())
      | "AccessControlList" ->
          r_access_control_list :=
            Some
              (Read.sequence i "AccessControlList"
                 (fun i attrs -> Read.sequences i "Grant" (fun i attrs -> grant_of_xml i attrs) ())
                 ())
      | "Tagging" ->
          r_tagging := Some (Read.sequence i "Tagging" (fun i attrs -> tagging_of_xml i attrs) ())
      | "UserMetadata" ->
          r_user_metadata :=
            Some
              (Read.sequence i "UserMetadata"
                 (fun i attrs ->
                   Read.sequences i "MetadataEntry"
                     (fun i attrs -> metadata_entry_of_xml i attrs)
                     ())
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket_name = required "BucketName" (( ! ) r_bucket_name) i;
     prefix = required "Prefix" (( ! ) r_prefix) i;
     encryption = ( ! ) r_encryption;
     canned_ac_l = ( ! ) r_canned_ac_l;
     access_control_list = ( ! ) r_access_control_list;
     tagging = ( ! ) r_tagging;
     user_metadata = ( ! ) r_user_metadata;
     storage_class = ( ! ) r_storage_class;
   }
    : s3_location)

let output_location_of_xml i attrs =
  let r_s3 = ref None in
  Structure.scanSequence i [ "S3" ] (fun tag _ ->
      match tag with
      | "S3" -> r_s3 := Some (Read.sequence i "S3" (fun i attrs -> s3_location_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ s3 = ( ! ) r_s3 } : output_location)

let select_parameters_of_xml i attrs =
  let r_input_serialization = ref None in
  let r_expression_type = ref None in
  let r_expression = ref None in
  let r_output_serialization = ref None in
  Structure.scanSequence i
    [ "InputSerialization"; "ExpressionType"; "Expression"; "OutputSerialization" ] (fun tag _ ->
      match tag with
      | "InputSerialization" ->
          r_input_serialization :=
            Some
              (Read.sequence i "InputSerialization"
                 (fun i attrs -> input_serialization_of_xml i attrs)
                 ())
      | "ExpressionType" ->
          r_expression_type :=
            Some
              (Read.sequence i "ExpressionType" (fun i attrs -> expression_type_of_xml i attrs) ())
      | "Expression" ->
          r_expression :=
            Some (Read.sequence i "Expression" (fun i attrs -> expression_of_xml i attrs) ())
      | "OutputSerialization" ->
          r_output_serialization :=
            Some
              (Read.sequence i "OutputSerialization"
                 (fun i attrs -> output_serialization_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     input_serialization = required "InputSerialization" (( ! ) r_input_serialization) i;
     expression_type = required "ExpressionType" (( ! ) r_expression_type) i;
     expression = required "Expression" (( ! ) r_expression) i;
     output_serialization = required "OutputSerialization" (( ! ) r_output_serialization) i;
   }
    : select_parameters)

let description_of_xml i attrs = Read.data i

let tier_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "Standard" -> Standard
   | "Bulk" -> Bulk
   | "Expedited" -> Expedited
   | _ -> failwith "unknown enum value"
    : tier)

let restore_request_type_of_xml i attrs =
  let s = Read.data i in
  (match s with "SELECT" -> SELECT | _ -> failwith "unknown enum value" : restore_request_type)

let glacier_job_parameters_of_xml i attrs =
  let r_tier = ref None in
  Structure.scanSequence i [ "Tier" ] (fun tag _ ->
      match tag with
      | "Tier" -> r_tier := Some (Read.sequence i "Tier" (fun i attrs -> tier_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ tier = required "Tier" (( ! ) r_tier) i } : glacier_job_parameters)

let days_of_xml i attrs = Primitive.int_of_string (Read.data i)

let restore_request_of_xml i attrs =
  let r_days = ref None in
  let r_glacier_job_parameters = ref None in
  let r_type_ = ref None in
  let r_tier = ref None in
  let r_description = ref None in
  let r_select_parameters = ref None in
  let r_output_location = ref None in
  Structure.scanSequence i
    [
      "Days";
      "GlacierJobParameters";
      "Type";
      "Tier";
      "Description";
      "SelectParameters";
      "OutputLocation";
    ] (fun tag _ ->
      match tag with
      | "Days" -> r_days := Some (Read.sequence i "Days" (fun i attrs -> days_of_xml i attrs) ())
      | "GlacierJobParameters" ->
          r_glacier_job_parameters :=
            Some
              (Read.sequence i "GlacierJobParameters"
                 (fun i attrs -> glacier_job_parameters_of_xml i attrs)
                 ())
      | "Type" ->
          r_type_ :=
            Some (Read.sequence i "Type" (fun i attrs -> restore_request_type_of_xml i attrs) ())
      | "Tier" -> r_tier := Some (Read.sequence i "Tier" (fun i attrs -> tier_of_xml i attrs) ())
      | "Description" ->
          r_description :=
            Some (Read.sequence i "Description" (fun i attrs -> description_of_xml i attrs) ())
      | "SelectParameters" ->
          r_select_parameters :=
            Some
              (Read.sequence i "SelectParameters"
                 (fun i attrs -> select_parameters_of_xml i attrs)
                 ())
      | "OutputLocation" ->
          r_output_location :=
            Some
              (Read.sequence i "OutputLocation" (fun i attrs -> output_location_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     days = ( ! ) r_days;
     glacier_job_parameters = ( ! ) r_glacier_job_parameters;
     type_ = ( ! ) r_type_;
     tier = ( ! ) r_tier;
     description = ( ! ) r_description;
     select_parameters = ( ! ) r_select_parameters;
     output_location = ( ! ) r_output_location;
   }
    : restore_request)

let restore_object_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_restore_request = ref None in
  let r_request_payer = ref None in
  let r_checksum_algorithm = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "VersionId";
      "RestoreRequest";
      "RequestPayer";
      "ChecksumAlgorithm";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RestoreRequest" ->
          r_restore_request :=
            Some
              (Read.sequence i "RestoreRequest" (fun i attrs -> restore_request_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     restore_request = ( ! ) r_restore_request;
     request_payer = ( ! ) r_request_payer;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : restore_object_request)

let idempotency_parameter_mismatch_of_xml i attrs = ()
let rename_object_output_of_xml i attrs = ()
let client_token_of_xml i attrs = Read.data i

let rename_source_if_unmodified_since_of_xml i attrs =
  Primitive.timestamp_httpdate_of_string (Read.data i)

let rename_source_if_modified_since_of_xml i attrs =
  Primitive.timestamp_httpdate_of_string (Read.data i)

let rename_source_if_none_match_of_xml i attrs = Read.data i
let rename_source_if_match_of_xml i attrs = Read.data i
let if_unmodified_since_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let if_modified_since_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let if_none_match_of_xml i attrs = Read.data i
let if_match_of_xml i attrs = Read.data i
let rename_source_of_xml i attrs = Read.data i

let rename_object_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_rename_source = ref None in
  let r_destination_if_match = ref None in
  let r_destination_if_none_match = ref None in
  let r_destination_if_modified_since = ref None in
  let r_destination_if_unmodified_since = ref None in
  let r_source_if_match = ref None in
  let r_source_if_none_match = ref None in
  let r_source_if_modified_since = ref None in
  let r_source_if_unmodified_since = ref None in
  let r_client_token = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "RenameSource";
      "DestinationIfMatch";
      "DestinationIfNoneMatch";
      "DestinationIfModifiedSince";
      "DestinationIfUnmodifiedSince";
      "SourceIfMatch";
      "SourceIfNoneMatch";
      "SourceIfModifiedSince";
      "SourceIfUnmodifiedSince";
      "ClientToken";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "RenameSource" ->
          r_rename_source :=
            Some (Read.sequence i "RenameSource" (fun i attrs -> rename_source_of_xml i attrs) ())
      | "DestinationIfMatch" ->
          r_destination_if_match :=
            Some (Read.sequence i "DestinationIfMatch" (fun i attrs -> if_match_of_xml i attrs) ())
      | "DestinationIfNoneMatch" ->
          r_destination_if_none_match :=
            Some
              (Read.sequence i "DestinationIfNoneMatch"
                 (fun i attrs -> if_none_match_of_xml i attrs)
                 ())
      | "DestinationIfModifiedSince" ->
          r_destination_if_modified_since :=
            Some
              (Read.sequence i "DestinationIfModifiedSince"
                 (fun i attrs -> if_modified_since_of_xml i attrs)
                 ())
      | "DestinationIfUnmodifiedSince" ->
          r_destination_if_unmodified_since :=
            Some
              (Read.sequence i "DestinationIfUnmodifiedSince"
                 (fun i attrs -> if_unmodified_since_of_xml i attrs)
                 ())
      | "SourceIfMatch" ->
          r_source_if_match :=
            Some
              (Read.sequence i "SourceIfMatch"
                 (fun i attrs -> rename_source_if_match_of_xml i attrs)
                 ())
      | "SourceIfNoneMatch" ->
          r_source_if_none_match :=
            Some
              (Read.sequence i "SourceIfNoneMatch"
                 (fun i attrs -> rename_source_if_none_match_of_xml i attrs)
                 ())
      | "SourceIfModifiedSince" ->
          r_source_if_modified_since :=
            Some
              (Read.sequence i "SourceIfModifiedSince"
                 (fun i attrs -> rename_source_if_modified_since_of_xml i attrs)
                 ())
      | "SourceIfUnmodifiedSince" ->
          r_source_if_unmodified_since :=
            Some
              (Read.sequence i "SourceIfUnmodifiedSince"
                 (fun i attrs -> rename_source_if_unmodified_since_of_xml i attrs)
                 ())
      | "ClientToken" ->
          r_client_token :=
            Some (Read.sequence i "ClientToken" (fun i attrs -> client_token_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     rename_source = required "RenameSource" (( ! ) r_rename_source) i;
     destination_if_match = ( ! ) r_destination_if_match;
     destination_if_none_match = ( ! ) r_destination_if_none_match;
     destination_if_modified_since = ( ! ) r_destination_if_modified_since;
     destination_if_unmodified_since = ( ! ) r_destination_if_unmodified_since;
     source_if_match = ( ! ) r_source_if_match;
     source_if_none_match = ( ! ) r_source_if_none_match;
     source_if_modified_since = ( ! ) r_source_if_modified_since;
     source_if_unmodified_since = ( ! ) r_source_if_unmodified_since;
     client_token = ( ! ) r_client_token;
   }
    : rename_object_request)

let setting_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let public_access_block_configuration_of_xml i attrs =
  let r_block_public_acls = ref None in
  let r_ignore_public_acls = ref None in
  let r_block_public_policy = ref None in
  let r_restrict_public_buckets = ref None in
  Structure.scanSequence i
    [ "BlockPublicAcls"; "IgnorePublicAcls"; "BlockPublicPolicy"; "RestrictPublicBuckets" ]
    (fun tag _ ->
      match tag with
      | "BlockPublicAcls" ->
          r_block_public_acls :=
            Some (Read.sequence i "BlockPublicAcls" (fun i attrs -> setting_of_xml i attrs) ())
      | "IgnorePublicAcls" ->
          r_ignore_public_acls :=
            Some (Read.sequence i "IgnorePublicAcls" (fun i attrs -> setting_of_xml i attrs) ())
      | "BlockPublicPolicy" ->
          r_block_public_policy :=
            Some (Read.sequence i "BlockPublicPolicy" (fun i attrs -> setting_of_xml i attrs) ())
      | "RestrictPublicBuckets" ->
          r_restrict_public_buckets :=
            Some
              (Read.sequence i "RestrictPublicBuckets" (fun i attrs -> setting_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     block_public_acls = ( ! ) r_block_public_acls;
     ignore_public_acls = ( ! ) r_ignore_public_acls;
     block_public_policy = ( ! ) r_block_public_policy;
     restrict_public_buckets = ( ! ) r_restrict_public_buckets;
   }
    : public_access_block_configuration)

let put_public_access_block_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_public_access_block_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "PublicAccessBlockConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "PublicAccessBlockConfiguration" ->
          r_public_access_block_configuration :=
            Some
              (Read.sequence i "PublicAccessBlockConfiguration"
                 (fun i attrs -> public_access_block_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     public_access_block_configuration =
       required "PublicAccessBlockConfiguration" (( ! ) r_public_access_block_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_public_access_block_request)

let put_object_tagging_output_of_xml i attrs =
  let r_version_id = ref None in
  Structure.scanSequence i [ "VersionId" ] (fun tag _ ->
      match tag with
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ version_id = ( ! ) r_version_id } : put_object_tagging_output)

let put_object_tagging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_tagging = ref None in
  let r_expected_bucket_owner = ref None in
  let r_request_payer = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "VersionId";
      "ContentMD5";
      "ChecksumAlgorithm";
      "Tagging";
      "ExpectedBucketOwner";
      "RequestPayer";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "Tagging" ->
          r_tagging := Some (Read.sequence i "Tagging" (fun i attrs -> tagging_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     tagging = required "Tagging" (( ! ) r_tagging) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     request_payer = ( ! ) r_request_payer;
   }
    : put_object_tagging_request)

let put_object_retention_output_of_xml i attrs =
  let r_request_charged = ref None in
  Structure.scanSequence i [ "RequestCharged" ] (fun tag _ ->
      match tag with
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ request_charged = ( ! ) r_request_charged } : put_object_retention_output)

let bypass_governance_retention_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let date_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)

let object_lock_retention_mode_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "GOVERNANCE" -> GOVERNANCE
   | "COMPLIANCE" -> COMPLIANCE
   | _ -> failwith "unknown enum value"
    : object_lock_retention_mode)

let object_lock_retention_of_xml i attrs =
  let r_mode = ref None in
  let r_retain_until_date = ref None in
  Structure.scanSequence i [ "Mode"; "RetainUntilDate" ] (fun tag _ ->
      match tag with
      | "Mode" ->
          r_mode :=
            Some
              (Read.sequence i "Mode" (fun i attrs -> object_lock_retention_mode_of_xml i attrs) ())
      | "RetainUntilDate" ->
          r_retain_until_date :=
            Some (Read.sequence i "RetainUntilDate" (fun i attrs -> date_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ mode = ( ! ) r_mode; retain_until_date = ( ! ) r_retain_until_date } : object_lock_retention)

let put_object_retention_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_retention = ref None in
  let r_request_payer = ref None in
  let r_version_id = ref None in
  let r_bypass_governance_retention = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "Retention";
      "RequestPayer";
      "VersionId";
      "BypassGovernanceRetention";
      "ContentMD5";
      "ChecksumAlgorithm";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Retention" ->
          r_retention :=
            Some
              (Read.sequence i "Retention" (fun i attrs -> object_lock_retention_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "BypassGovernanceRetention" ->
          r_bypass_governance_retention :=
            Some
              (Read.sequence i "BypassGovernanceRetention"
                 (fun i attrs -> bypass_governance_retention_of_xml i attrs)
                 ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     retention = ( ! ) r_retention;
     request_payer = ( ! ) r_request_payer;
     version_id = ( ! ) r_version_id;
     bypass_governance_retention = ( ! ) r_bypass_governance_retention;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_object_retention_request)

let put_object_lock_configuration_output_of_xml i attrs =
  let r_request_charged = ref None in
  Structure.scanSequence i [ "RequestCharged" ] (fun tag _ ->
      match tag with
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ request_charged = ( ! ) r_request_charged } : put_object_lock_configuration_output)

let object_lock_token_of_xml i attrs = Read.data i
let years_of_xml i attrs = Primitive.int_of_string (Read.data i)

let default_retention_of_xml i attrs =
  let r_mode = ref None in
  let r_days = ref None in
  let r_years = ref None in
  Structure.scanSequence i [ "Mode"; "Days"; "Years" ] (fun tag _ ->
      match tag with
      | "Mode" ->
          r_mode :=
            Some
              (Read.sequence i "Mode" (fun i attrs -> object_lock_retention_mode_of_xml i attrs) ())
      | "Days" -> r_days := Some (Read.sequence i "Days" (fun i attrs -> days_of_xml i attrs) ())
      | "Years" ->
          r_years := Some (Read.sequence i "Years" (fun i attrs -> years_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ mode = ( ! ) r_mode; days = ( ! ) r_days; years = ( ! ) r_years } : default_retention)

let object_lock_rule_of_xml i attrs =
  let r_default_retention = ref None in
  Structure.scanSequence i [ "DefaultRetention" ] (fun tag _ ->
      match tag with
      | "DefaultRetention" ->
          r_default_retention :=
            Some
              (Read.sequence i "DefaultRetention"
                 (fun i attrs -> default_retention_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ default_retention = ( ! ) r_default_retention } : object_lock_rule)

let object_lock_enabled_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | _ -> failwith "unknown enum value" : object_lock_enabled)

let object_lock_configuration_of_xml i attrs =
  let r_object_lock_enabled = ref None in
  let r_rule = ref None in
  Structure.scanSequence i [ "ObjectLockEnabled"; "Rule" ] (fun tag _ ->
      match tag with
      | "ObjectLockEnabled" ->
          r_object_lock_enabled :=
            Some
              (Read.sequence i "ObjectLockEnabled"
                 (fun i attrs -> object_lock_enabled_of_xml i attrs)
                 ())
      | "Rule" ->
          r_rule :=
            Some (Read.sequence i "Rule" (fun i attrs -> object_lock_rule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ object_lock_enabled = ( ! ) r_object_lock_enabled; rule = ( ! ) r_rule }
    : object_lock_configuration)

let put_object_lock_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_object_lock_configuration = ref None in
  let r_request_payer = ref None in
  let r_token = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ObjectLockConfiguration";
      "RequestPayer";
      "Token";
      "ContentMD5";
      "ChecksumAlgorithm";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ObjectLockConfiguration" ->
          r_object_lock_configuration :=
            Some
              (Read.sequence i "ObjectLockConfiguration"
                 (fun i attrs -> object_lock_configuration_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "Token" ->
          r_token :=
            Some (Read.sequence i "Token" (fun i attrs -> object_lock_token_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     object_lock_configuration = ( ! ) r_object_lock_configuration;
     request_payer = ( ! ) r_request_payer;
     token = ( ! ) r_token;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_object_lock_configuration_request)

let put_object_legal_hold_output_of_xml i attrs =
  let r_request_charged = ref None in
  Structure.scanSequence i [ "RequestCharged" ] (fun tag _ ->
      match tag with
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ request_charged = ( ! ) r_request_charged } : put_object_legal_hold_output)

let object_lock_legal_hold_of_xml i attrs =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status"
                 (fun i attrs -> object_lock_legal_hold_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ status = ( ! ) r_status } : object_lock_legal_hold)

let put_object_legal_hold_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_legal_hold = ref None in
  let r_request_payer = ref None in
  let r_version_id = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "LegalHold";
      "RequestPayer";
      "VersionId";
      "ContentMD5";
      "ChecksumAlgorithm";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "LegalHold" ->
          r_legal_hold :=
            Some
              (Read.sequence i "LegalHold"
                 (fun i attrs -> object_lock_legal_hold_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     legal_hold = ( ! ) r_legal_hold;
     request_payer = ( ! ) r_request_payer;
     version_id = ( ! ) r_version_id;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_object_legal_hold_request)

let unsupported_media_type_of_xml i attrs = ()
let no_such_bucket_of_xml i attrs = ()
let invalid_annotation_name_of_xml i attrs = ()
let annotation_name_too_long_of_xml i attrs = ()
let annotation_limit_exceeded_of_xml i attrs = ()

let checksum_type_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "COMPOSITE" -> COMPOSITE
   | "FULL_OBJECT" -> FULL_OBJECT
   | _ -> failwith "unknown enum value"
    : checksum_type)

let annotation_name_of_xml i attrs = Read.data i

let put_object_annotation_output_of_xml i attrs =
  let r_key = ref None in
  let r_annotation_name = ref None in
  let r_object_version_id = ref None in
  let r_e_tag = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  let r_server_side_encryption = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "Key";
      "AnnotationName";
      "ObjectVersionId";
      "ETag";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
      "ServerSideEncryption";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "AnnotationName" ->
          r_annotation_name :=
            Some
              (Read.sequence i "AnnotationName" (fun i attrs -> annotation_name_of_xml i attrs) ())
      | "ObjectVersionId" ->
          r_object_version_id :=
            Some
              (Read.sequence i "ObjectVersionId"
                 (fun i attrs -> object_version_id_of_xml i attrs)
                 ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     key = ( ! ) r_key;
     annotation_name = ( ! ) r_annotation_name;
     object_version_id = ( ! ) r_object_version_id;
     e_tag = ( ! ) r_e_tag;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
     server_side_encryption = ( ! ) r_server_side_encryption;
     request_charged = ( ! ) r_request_charged;
   }
    : put_object_annotation_output)

let object_if_match_of_xml i attrs = Read.data i

let put_object_annotation_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_annotation_name = ref None in
  let r_annotation_payload = ref None in
  let r_object_if_match = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_content_m_d5 = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "VersionId";
      "AnnotationName";
      "AnnotationPayload";
      "ObjectIfMatch";
      "ChecksumAlgorithm";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ContentMD5";
      "RequestPayer";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "AnnotationName" ->
          r_annotation_name :=
            Some
              (Read.sequence i "AnnotationName" (fun i attrs -> annotation_name_of_xml i attrs) ())
      | "AnnotationPayload" ->
          r_annotation_payload :=
            Some
              (Read.sequence i "AnnotationPayload"
                 (fun i attrs -> streaming_blob_of_xml i attrs)
                 ())
      | "ObjectIfMatch" ->
          r_object_if_match :=
            Some
              (Read.sequence i "ObjectIfMatch" (fun i attrs -> object_if_match_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     annotation_name = required "AnnotationName" (( ! ) r_annotation_name) i;
     annotation_payload = required "AnnotationPayload" (( ! ) r_annotation_payload) i;
     object_if_match = ( ! ) r_object_if_match;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     content_m_d5 = ( ! ) r_content_m_d5;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_object_annotation_request)

let put_object_acl_output_of_xml i attrs =
  let r_request_charged = ref None in
  Structure.scanSequence i [ "RequestCharged" ] (fun tag _ ->
      match tag with
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ request_charged = ( ! ) r_request_charged } : put_object_acl_output)

let grant_write_ac_p_of_xml i attrs = Read.data i
let grant_write_of_xml i attrs = Read.data i
let grant_read_ac_p_of_xml i attrs = Read.data i
let grant_read_of_xml i attrs = Read.data i
let grant_full_control_of_xml i attrs = Read.data i

let put_object_acl_request_of_xml i attrs =
  let r_ac_l = ref None in
  let r_access_control_policy = ref None in
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_grant_full_control = ref None in
  let r_grant_read = ref None in
  let r_grant_read_ac_p = ref None in
  let r_grant_write = ref None in
  let r_grant_write_ac_p = ref None in
  let r_key = ref None in
  let r_request_payer = ref None in
  let r_version_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "ACL";
      "AccessControlPolicy";
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "GrantFullControl";
      "GrantRead";
      "GrantReadACP";
      "GrantWrite";
      "GrantWriteACP";
      "Key";
      "RequestPayer";
      "VersionId";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "ACL" ->
          r_ac_l :=
            Some (Read.sequence i "ACL" (fun i attrs -> object_canned_ac_l_of_xml i attrs) ())
      | "AccessControlPolicy" ->
          r_access_control_policy :=
            Some
              (Read.sequence i "AccessControlPolicy"
                 (fun i attrs -> access_control_policy_of_xml i attrs)
                 ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "GrantFullControl" ->
          r_grant_full_control :=
            Some
              (Read.sequence i "GrantFullControl"
                 (fun i attrs -> grant_full_control_of_xml i attrs)
                 ())
      | "GrantRead" ->
          r_grant_read :=
            Some (Read.sequence i "GrantRead" (fun i attrs -> grant_read_of_xml i attrs) ())
      | "GrantReadACP" ->
          r_grant_read_ac_p :=
            Some (Read.sequence i "GrantReadACP" (fun i attrs -> grant_read_ac_p_of_xml i attrs) ())
      | "GrantWrite" ->
          r_grant_write :=
            Some (Read.sequence i "GrantWrite" (fun i attrs -> grant_write_of_xml i attrs) ())
      | "GrantWriteACP" ->
          r_grant_write_ac_p :=
            Some
              (Read.sequence i "GrantWriteACP" (fun i attrs -> grant_write_ac_p_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     ac_l = ( ! ) r_ac_l;
     access_control_policy = ( ! ) r_access_control_policy;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     grant_full_control = ( ! ) r_grant_full_control;
     grant_read = ( ! ) r_grant_read;
     grant_read_ac_p = ( ! ) r_grant_read_ac_p;
     grant_write = ( ! ) r_grant_write;
     grant_write_ac_p = ( ! ) r_grant_write_ac_p;
     key = required "Key" (( ! ) r_key) i;
     request_payer = ( ! ) r_request_payer;
     version_id = ( ! ) r_version_id;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_object_acl_request)

let too_many_parts_of_xml i attrs = ()
let invalid_write_offset_of_xml i attrs = ()
let encryption_type_mismatch_of_xml i attrs = ()
let size_of_xml i attrs = Primitive.long_of_string (Read.data i)
let ssekms_encryption_context_of_xml i attrs = Read.data i

let put_object_output_of_xml i attrs =
  let r_expiration = ref None in
  let r_e_tag = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  let r_server_side_encryption = ref None in
  let r_version_id = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  let r_size = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "Expiration";
      "ETag";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
      "ServerSideEncryption";
      "VersionId";
      "SSECustomerAlgorithm";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
      "Size";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "Expiration" ->
          r_expiration :=
            Some (Read.sequence i "Expiration" (fun i attrs -> expiration_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "Size" -> r_size := Some (Read.sequence i "Size" (fun i attrs -> size_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     expiration = ( ! ) r_expiration;
     e_tag = ( ! ) r_e_tag;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
     server_side_encryption = ( ! ) r_server_side_encryption;
     version_id = ( ! ) r_version_id;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     size = ( ! ) r_size;
     request_charged = ( ! ) r_request_charged;
   }
    : put_object_output)

let tagging_header_of_xml i attrs = Read.data i
let website_redirect_location_of_xml i attrs = Read.data i
let write_offset_bytes_of_xml i attrs = Primitive.long_of_string (Read.data i)

let put_object_request_of_xml i attrs =
  let r_ac_l = ref None in
  let r_body = ref None in
  let r_bucket = ref None in
  let r_cache_control = ref None in
  let r_content_disposition = ref None in
  let r_content_encoding = ref None in
  let r_content_language = ref None in
  let r_content_length = ref None in
  let r_content_m_d5 = ref None in
  let r_content_type = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_expires = ref None in
  let r_if_match = ref None in
  let r_if_none_match = ref None in
  let r_grant_full_control = ref None in
  let r_grant_read = ref None in
  let r_grant_read_ac_p = ref None in
  let r_grant_write_ac_p = ref None in
  let r_key = ref None in
  let r_write_offset_bytes = ref None in
  let r_metadata = ref None in
  let r_server_side_encryption = ref None in
  let r_storage_class = ref None in
  let r_website_redirect_location = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  let r_request_payer = ref None in
  let r_tagging = ref None in
  let r_object_lock_mode = ref None in
  let r_object_lock_retain_until_date = ref None in
  let r_object_lock_legal_hold_status = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "ACL";
      "Body";
      "Bucket";
      "CacheControl";
      "ContentDisposition";
      "ContentEncoding";
      "ContentLanguage";
      "ContentLength";
      "ContentMD5";
      "ContentType";
      "ChecksumAlgorithm";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "Expires";
      "IfMatch";
      "IfNoneMatch";
      "GrantFullControl";
      "GrantRead";
      "GrantReadACP";
      "GrantWriteACP";
      "Key";
      "WriteOffsetBytes";
      "Metadata";
      "ServerSideEncryption";
      "StorageClass";
      "WebsiteRedirectLocation";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
      "RequestPayer";
      "Tagging";
      "ObjectLockMode";
      "ObjectLockRetainUntilDate";
      "ObjectLockLegalHoldStatus";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "ACL" ->
          r_ac_l :=
            Some (Read.sequence i "ACL" (fun i attrs -> object_canned_ac_l_of_xml i attrs) ())
      | "Body" ->
          r_body := Some (Read.sequence i "Body" (fun i attrs -> streaming_blob_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "CacheControl" ->
          r_cache_control :=
            Some (Read.sequence i "CacheControl" (fun i attrs -> cache_control_of_xml i attrs) ())
      | "ContentDisposition" ->
          r_content_disposition :=
            Some
              (Read.sequence i "ContentDisposition"
                 (fun i attrs -> content_disposition_of_xml i attrs)
                 ())
      | "ContentEncoding" ->
          r_content_encoding :=
            Some
              (Read.sequence i "ContentEncoding"
                 (fun i attrs -> content_encoding_of_xml i attrs)
                 ())
      | "ContentLanguage" ->
          r_content_language :=
            Some
              (Read.sequence i "ContentLanguage"
                 (fun i attrs -> content_language_of_xml i attrs)
                 ())
      | "ContentLength" ->
          r_content_length :=
            Some (Read.sequence i "ContentLength" (fun i attrs -> content_length_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ContentType" ->
          r_content_type :=
            Some (Read.sequence i "ContentType" (fun i attrs -> content_type_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "Expires" ->
          r_expires := Some (Read.sequence i "Expires" (fun i attrs -> expires_of_xml i attrs) ())
      | "IfMatch" ->
          r_if_match := Some (Read.sequence i "IfMatch" (fun i attrs -> if_match_of_xml i attrs) ())
      | "IfNoneMatch" ->
          r_if_none_match :=
            Some (Read.sequence i "IfNoneMatch" (fun i attrs -> if_none_match_of_xml i attrs) ())
      | "GrantFullControl" ->
          r_grant_full_control :=
            Some
              (Read.sequence i "GrantFullControl"
                 (fun i attrs -> grant_full_control_of_xml i attrs)
                 ())
      | "GrantRead" ->
          r_grant_read :=
            Some (Read.sequence i "GrantRead" (fun i attrs -> grant_read_of_xml i attrs) ())
      | "GrantReadACP" ->
          r_grant_read_ac_p :=
            Some (Read.sequence i "GrantReadACP" (fun i attrs -> grant_read_ac_p_of_xml i attrs) ())
      | "GrantWriteACP" ->
          r_grant_write_ac_p :=
            Some
              (Read.sequence i "GrantWriteACP" (fun i attrs -> grant_write_ac_p_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "WriteOffsetBytes" ->
          r_write_offset_bytes :=
            Some
              (Read.sequence i "WriteOffsetBytes"
                 (fun i attrs -> write_offset_bytes_of_xml i attrs)
                 ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Read.sequence i "Metadata"
                 (fun i attrs ->
                   Read.sequences i "entry"
                     (fun i attrs ->
                       let k =
                         Read.sequence i "key" (fun i attrs -> metadata_key_of_xml i attrs) ()
                       in
                       let v =
                         Read.sequence i "value" (fun i attrs -> metadata_value_of_xml i attrs) ()
                       in
                       (k, v))
                     ())
                 ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "WebsiteRedirectLocation" ->
          r_website_redirect_location :=
            Some
              (Read.sequence i "WebsiteRedirectLocation"
                 (fun i attrs -> website_redirect_location_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "Tagging" ->
          r_tagging :=
            Some (Read.sequence i "Tagging" (fun i attrs -> tagging_header_of_xml i attrs) ())
      | "ObjectLockMode" ->
          r_object_lock_mode :=
            Some
              (Read.sequence i "ObjectLockMode" (fun i attrs -> object_lock_mode_of_xml i attrs) ())
      | "ObjectLockRetainUntilDate" ->
          r_object_lock_retain_until_date :=
            Some
              (Read.sequence i "ObjectLockRetainUntilDate"
                 (fun i attrs -> object_lock_retain_until_date_of_xml i attrs)
                 ())
      | "ObjectLockLegalHoldStatus" ->
          r_object_lock_legal_hold_status :=
            Some
              (Read.sequence i "ObjectLockLegalHoldStatus"
                 (fun i attrs -> object_lock_legal_hold_status_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     ac_l = ( ! ) r_ac_l;
     body = ( ! ) r_body;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     cache_control = ( ! ) r_cache_control;
     content_disposition = ( ! ) r_content_disposition;
     content_encoding = ( ! ) r_content_encoding;
     content_language = ( ! ) r_content_language;
     content_length = ( ! ) r_content_length;
     content_m_d5 = ( ! ) r_content_m_d5;
     content_type = ( ! ) r_content_type;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     expires = ( ! ) r_expires;
     if_match = ( ! ) r_if_match;
     if_none_match = ( ! ) r_if_none_match;
     grant_full_control = ( ! ) r_grant_full_control;
     grant_read = ( ! ) r_grant_read;
     grant_read_ac_p = ( ! ) r_grant_read_ac_p;
     grant_write_ac_p = ( ! ) r_grant_write_ac_p;
     key = required "Key" (( ! ) r_key) i;
     write_offset_bytes = ( ! ) r_write_offset_bytes;
     metadata = ( ! ) r_metadata;
     server_side_encryption = ( ! ) r_server_side_encryption;
     storage_class = ( ! ) r_storage_class;
     website_redirect_location = ( ! ) r_website_redirect_location;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     request_payer = ( ! ) r_request_payer;
     tagging = ( ! ) r_tagging;
     object_lock_mode = ( ! ) r_object_lock_mode;
     object_lock_retain_until_date = ( ! ) r_object_lock_retain_until_date;
     object_lock_legal_hold_status = ( ! ) r_object_lock_legal_hold_status;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_object_request)

let replace_key_with_of_xml i attrs = Read.data i
let replace_key_prefix_with_of_xml i attrs = Read.data i

let protocol_of_xml i attrs =
  let s = Read.data i in
  (match s with "http" -> Http | "https" -> Https | _ -> failwith "unknown enum value" : protocol)

let http_redirect_code_of_xml i attrs = Read.data i
let host_name_of_xml i attrs = Read.data i

let redirect_of_xml i attrs =
  let r_host_name = ref None in
  let r_http_redirect_code = ref None in
  let r_protocol = ref None in
  let r_replace_key_prefix_with = ref None in
  let r_replace_key_with = ref None in
  Structure.scanSequence i
    [ "HostName"; "HttpRedirectCode"; "Protocol"; "ReplaceKeyPrefixWith"; "ReplaceKeyWith" ]
    (fun tag _ ->
      match tag with
      | "HostName" ->
          r_host_name :=
            Some (Read.sequence i "HostName" (fun i attrs -> host_name_of_xml i attrs) ())
      | "HttpRedirectCode" ->
          r_http_redirect_code :=
            Some
              (Read.sequence i "HttpRedirectCode"
                 (fun i attrs -> http_redirect_code_of_xml i attrs)
                 ())
      | "Protocol" ->
          r_protocol :=
            Some (Read.sequence i "Protocol" (fun i attrs -> protocol_of_xml i attrs) ())
      | "ReplaceKeyPrefixWith" ->
          r_replace_key_prefix_with :=
            Some
              (Read.sequence i "ReplaceKeyPrefixWith"
                 (fun i attrs -> replace_key_prefix_with_of_xml i attrs)
                 ())
      | "ReplaceKeyWith" ->
          r_replace_key_with :=
            Some
              (Read.sequence i "ReplaceKeyWith" (fun i attrs -> replace_key_with_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     host_name = ( ! ) r_host_name;
     http_redirect_code = ( ! ) r_http_redirect_code;
     protocol = ( ! ) r_protocol;
     replace_key_prefix_with = ( ! ) r_replace_key_prefix_with;
     replace_key_with = ( ! ) r_replace_key_with;
   }
    : redirect)

let key_prefix_equals_of_xml i attrs = Read.data i
let http_error_code_returned_equals_of_xml i attrs = Read.data i

let condition_of_xml i attrs =
  let r_http_error_code_returned_equals = ref None in
  let r_key_prefix_equals = ref None in
  Structure.scanSequence i [ "HttpErrorCodeReturnedEquals"; "KeyPrefixEquals" ] (fun tag _ ->
      match tag with
      | "HttpErrorCodeReturnedEquals" ->
          r_http_error_code_returned_equals :=
            Some
              (Read.sequence i "HttpErrorCodeReturnedEquals"
                 (fun i attrs -> http_error_code_returned_equals_of_xml i attrs)
                 ())
      | "KeyPrefixEquals" ->
          r_key_prefix_equals :=
            Some
              (Read.sequence i "KeyPrefixEquals"
                 (fun i attrs -> key_prefix_equals_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     http_error_code_returned_equals = ( ! ) r_http_error_code_returned_equals;
     key_prefix_equals = ( ! ) r_key_prefix_equals;
   }
    : condition)

let routing_rule_of_xml i attrs =
  let r_condition = ref None in
  let r_redirect = ref None in
  Structure.scanSequence i [ "Condition"; "Redirect" ] (fun tag _ ->
      match tag with
      | "Condition" ->
          r_condition :=
            Some (Read.sequence i "Condition" (fun i attrs -> condition_of_xml i attrs) ())
      | "Redirect" ->
          r_redirect :=
            Some (Read.sequence i "Redirect" (fun i attrs -> redirect_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ condition = ( ! ) r_condition; redirect = required "Redirect" (( ! ) r_redirect) i }
    : routing_rule)

let routing_rules_of_xml i attrs =
  Read.sequences i "RoutingRule" (fun i attrs -> routing_rule_of_xml i attrs) ()

let redirect_all_requests_to_of_xml i attrs =
  let r_host_name = ref None in
  let r_protocol = ref None in
  Structure.scanSequence i [ "HostName"; "Protocol" ] (fun tag _ ->
      match tag with
      | "HostName" ->
          r_host_name :=
            Some (Read.sequence i "HostName" (fun i attrs -> host_name_of_xml i attrs) ())
      | "Protocol" ->
          r_protocol :=
            Some (Read.sequence i "Protocol" (fun i attrs -> protocol_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ host_name = required "HostName" (( ! ) r_host_name) i; protocol = ( ! ) r_protocol }
    : redirect_all_requests_to)

let suffix_of_xml i attrs = Read.data i

let index_document_of_xml i attrs =
  let r_suffix = ref None in
  Structure.scanSequence i [ "Suffix" ] (fun tag _ ->
      match tag with
      | "Suffix" ->
          r_suffix := Some (Read.sequence i "Suffix" (fun i attrs -> suffix_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ suffix = required "Suffix" (( ! ) r_suffix) i } : index_document)

let error_document_of_xml i attrs =
  let r_key = ref None in
  Structure.scanSequence i [ "Key" ] (fun tag _ ->
      match tag with
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ key = required "Key" (( ! ) r_key) i } : error_document)

let website_configuration_of_xml i attrs =
  let r_error_document = ref None in
  let r_index_document = ref None in
  let r_redirect_all_requests_to = ref None in
  let r_routing_rules = ref None in
  Structure.scanSequence i
    [ "ErrorDocument"; "IndexDocument"; "RedirectAllRequestsTo"; "RoutingRules" ] (fun tag _ ->
      match tag with
      | "ErrorDocument" ->
          r_error_document :=
            Some (Read.sequence i "ErrorDocument" (fun i attrs -> error_document_of_xml i attrs) ())
      | "IndexDocument" ->
          r_index_document :=
            Some (Read.sequence i "IndexDocument" (fun i attrs -> index_document_of_xml i attrs) ())
      | "RedirectAllRequestsTo" ->
          r_redirect_all_requests_to :=
            Some
              (Read.sequence i "RedirectAllRequestsTo"
                 (fun i attrs -> redirect_all_requests_to_of_xml i attrs)
                 ())
      | "RoutingRules" ->
          r_routing_rules :=
            Some
              (Read.sequence i "RoutingRules"
                 (fun i attrs ->
                   Read.sequences i "RoutingRule" (fun i attrs -> routing_rule_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({
     error_document = ( ! ) r_error_document;
     index_document = ( ! ) r_index_document;
     redirect_all_requests_to = ( ! ) r_redirect_all_requests_to;
     routing_rules = ( ! ) r_routing_rules;
   }
    : website_configuration)

let put_bucket_website_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_website_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [ "Bucket"; "ContentMD5"; "ChecksumAlgorithm"; "WebsiteConfiguration"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "WebsiteConfiguration" ->
          r_website_configuration :=
            Some
              (Read.sequence i "WebsiteConfiguration"
                 (fun i attrs -> website_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     website_configuration = required "WebsiteConfiguration" (( ! ) r_website_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_website_request)

let bucket_versioning_status_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "Enabled" -> Enabled
   | "Suspended" -> Suspended
   | _ -> failwith "unknown enum value"
    : bucket_versioning_status)

let mfa_delete_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : mfa_delete)

let versioning_configuration_of_xml i attrs =
  let r_mfa_delete = ref None in
  let r_status = ref None in
  Structure.scanSequence i [ "MfaDelete"; "Status" ] (fun tag _ ->
      match tag with
      | "MfaDelete" ->
          r_mfa_delete :=
            Some (Read.sequence i "MfaDelete" (fun i attrs -> mfa_delete_of_xml i attrs) ())
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status" (fun i attrs -> bucket_versioning_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ mfa_delete = ( ! ) r_mfa_delete; status = ( ! ) r_status } : versioning_configuration)

let mf_a_of_xml i attrs = Read.data i

let put_bucket_versioning_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_mf_a = ref None in
  let r_versioning_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "MFA";
      "VersioningConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "MFA" -> r_mf_a := Some (Read.sequence i "MFA" (fun i attrs -> mf_a_of_xml i attrs) ())
      | "VersioningConfiguration" ->
          r_versioning_configuration :=
            Some
              (Read.sequence i "VersioningConfiguration"
                 (fun i attrs -> versioning_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     mf_a = ( ! ) r_mf_a;
     versioning_configuration =
       required "VersioningConfiguration" (( ! ) r_versioning_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_versioning_request)

let put_bucket_tagging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_tagging = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [ "Bucket"; "ContentMD5"; "ChecksumAlgorithm"; "Tagging"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "Tagging" ->
          r_tagging := Some (Read.sequence i "Tagging" (fun i attrs -> tagging_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     tagging = required "Tagging" (( ! ) r_tagging) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_tagging_request)

let payer_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "Requester" -> Requester
   | "BucketOwner" -> BucketOwner
   | _ -> failwith "unknown enum value"
    : payer)

let request_payment_configuration_of_xml i attrs =
  let r_payer = ref None in
  Structure.scanSequence i [ "Payer" ] (fun tag _ ->
      match tag with
      | "Payer" ->
          r_payer := Some (Read.sequence i "Payer" (fun i attrs -> payer_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ payer = required "Payer" (( ! ) r_payer) i } : request_payment_configuration)

let put_bucket_request_payment_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_request_payment_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "RequestPaymentConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "RequestPaymentConfiguration" ->
          r_request_payment_configuration :=
            Some
              (Read.sequence i "RequestPaymentConfiguration"
                 (fun i attrs -> request_payment_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     request_payment_configuration =
       required "RequestPaymentConfiguration" (( ! ) r_request_payment_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_request_payment_request)

let delete_marker_replication_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : delete_marker_replication_status)

let delete_marker_replication_of_xml i attrs =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status"
                 (fun i attrs -> delete_marker_replication_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ status = ( ! ) r_status } : delete_marker_replication)

let minutes_of_xml i attrs = Primitive.int_of_string (Read.data i)

let replication_time_value_of_xml i attrs =
  let r_minutes = ref None in
  Structure.scanSequence i [ "Minutes" ] (fun tag _ ->
      match tag with
      | "Minutes" ->
          r_minutes := Some (Read.sequence i "Minutes" (fun i attrs -> minutes_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ minutes = ( ! ) r_minutes } : replication_time_value)

let metrics_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : metrics_status)

let metrics_of_xml i attrs =
  let r_status = ref None in
  let r_event_threshold = ref None in
  Structure.scanSequence i [ "Status"; "EventThreshold" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some (Read.sequence i "Status" (fun i attrs -> metrics_status_of_xml i attrs) ())
      | "EventThreshold" ->
          r_event_threshold :=
            Some
              (Read.sequence i "EventThreshold"
                 (fun i attrs -> replication_time_value_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ status = required "Status" (( ! ) r_status) i; event_threshold = ( ! ) r_event_threshold }
    : metrics)

let replication_time_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : replication_time_status)

let replication_time_of_xml i attrs =
  let r_status = ref None in
  let r_time = ref None in
  Structure.scanSequence i [ "Status"; "Time" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status" (fun i attrs -> replication_time_status_of_xml i attrs) ())
      | "Time" ->
          r_time :=
            Some (Read.sequence i "Time" (fun i attrs -> replication_time_value_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ status = required "Status" (( ! ) r_status) i; time = required "Time" (( ! ) r_time) i }
    : replication_time)

let replica_kms_key_i_d_of_xml i attrs = Read.data i

let encryption_configuration_of_xml i attrs =
  let r_replica_kms_key_i_d = ref None in
  Structure.scanSequence i [ "ReplicaKmsKeyID" ] (fun tag _ ->
      match tag with
      | "ReplicaKmsKeyID" ->
          r_replica_kms_key_i_d :=
            Some
              (Read.sequence i "ReplicaKmsKeyID"
                 (fun i attrs -> replica_kms_key_i_d_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ replica_kms_key_i_d = ( ! ) r_replica_kms_key_i_d } : encryption_configuration)

let destination_of_xml i attrs =
  let r_bucket = ref None in
  let r_account = ref None in
  let r_storage_class = ref None in
  let r_access_control_translation = ref None in
  let r_encryption_configuration = ref None in
  let r_replication_time = ref None in
  let r_metrics = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Account";
      "StorageClass";
      "AccessControlTranslation";
      "EncryptionConfiguration";
      "ReplicationTime";
      "Metrics";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Account" ->
          r_account :=
            Some (Read.sequence i "Account" (fun i attrs -> account_id_of_xml i attrs) ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "AccessControlTranslation" ->
          r_access_control_translation :=
            Some
              (Read.sequence i "AccessControlTranslation"
                 (fun i attrs -> access_control_translation_of_xml i attrs)
                 ())
      | "EncryptionConfiguration" ->
          r_encryption_configuration :=
            Some
              (Read.sequence i "EncryptionConfiguration"
                 (fun i attrs -> encryption_configuration_of_xml i attrs)
                 ())
      | "ReplicationTime" ->
          r_replication_time :=
            Some
              (Read.sequence i "ReplicationTime"
                 (fun i attrs -> replication_time_of_xml i attrs)
                 ())
      | "Metrics" ->
          r_metrics := Some (Read.sequence i "Metrics" (fun i attrs -> metrics_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     account = ( ! ) r_account;
     storage_class = ( ! ) r_storage_class;
     access_control_translation = ( ! ) r_access_control_translation;
     encryption_configuration = ( ! ) r_encryption_configuration;
     replication_time = ( ! ) r_replication_time;
     metrics = ( ! ) r_metrics;
   }
    : destination)

let existing_object_replication_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : existing_object_replication_status)

let existing_object_replication_of_xml i attrs =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status"
                 (fun i attrs -> existing_object_replication_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ status = required "Status" (( ! ) r_status) i } : existing_object_replication)

let replica_modifications_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : replica_modifications_status)

let replica_modifications_of_xml i attrs =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status"
                 (fun i attrs -> replica_modifications_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ status = required "Status" (( ! ) r_status) i } : replica_modifications)

let sse_kms_encrypted_objects_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : sse_kms_encrypted_objects_status)

let sse_kms_encrypted_objects_of_xml i attrs =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status"
                 (fun i attrs -> sse_kms_encrypted_objects_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ status = required "Status" (( ! ) r_status) i } : sse_kms_encrypted_objects)

let source_selection_criteria_of_xml i attrs =
  let r_sse_kms_encrypted_objects = ref None in
  let r_replica_modifications = ref None in
  Structure.scanSequence i [ "SseKmsEncryptedObjects"; "ReplicaModifications" ] (fun tag _ ->
      match tag with
      | "SseKmsEncryptedObjects" ->
          r_sse_kms_encrypted_objects :=
            Some
              (Read.sequence i "SseKmsEncryptedObjects"
                 (fun i attrs -> sse_kms_encrypted_objects_of_xml i attrs)
                 ())
      | "ReplicaModifications" ->
          r_replica_modifications :=
            Some
              (Read.sequence i "ReplicaModifications"
                 (fun i attrs -> replica_modifications_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     sse_kms_encrypted_objects = ( ! ) r_sse_kms_encrypted_objects;
     replica_modifications = ( ! ) r_replica_modifications;
   }
    : source_selection_criteria)

let replication_rule_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : replication_rule_status)

let prefix_of_xml i attrs = Read.data i

let replication_rule_and_operator_of_xml i attrs =
  let r_prefix = ref None in
  let r_tags = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tags := Some (Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ prefix = ( ! ) r_prefix; tags = ( ! ) r_tags } : replication_rule_and_operator)

let replication_rule_filter_of_xml i attrs =
  let r_prefix = ref None in
  let r_tag = ref None in
  let r_and_ = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag"; "And" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tag := Some (Read.sequence i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | "And" ->
          r_and_ :=
            Some
              (Read.sequence i "And"
                 (fun i attrs -> replication_rule_and_operator_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ prefix = ( ! ) r_prefix; tag = ( ! ) r_tag; and_ = ( ! ) r_and_ } : replication_rule_filter)

let priority_of_xml i attrs = Primitive.int_of_string (Read.data i)

let replication_rule_of_xml i attrs =
  let r_i_d = ref None in
  let r_priority = ref None in
  let r_prefix = ref None in
  let r_filter = ref None in
  let r_status = ref None in
  let r_source_selection_criteria = ref None in
  let r_existing_object_replication = ref None in
  let r_destination = ref None in
  let r_delete_marker_replication = ref None in
  Structure.scanSequence i
    [
      "ID";
      "Priority";
      "Prefix";
      "Filter";
      "Status";
      "SourceSelectionCriteria";
      "ExistingObjectReplication";
      "Destination";
      "DeleteMarkerReplication";
    ] (fun tag _ ->
      match tag with
      | "ID" -> r_i_d := Some (Read.sequence i "ID" (fun i attrs -> i_d_of_xml i attrs) ())
      | "Priority" ->
          r_priority :=
            Some (Read.sequence i "Priority" (fun i attrs -> priority_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some
              (Read.sequence i "Filter" (fun i attrs -> replication_rule_filter_of_xml i attrs) ())
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status" (fun i attrs -> replication_rule_status_of_xml i attrs) ())
      | "SourceSelectionCriteria" ->
          r_source_selection_criteria :=
            Some
              (Read.sequence i "SourceSelectionCriteria"
                 (fun i attrs -> source_selection_criteria_of_xml i attrs)
                 ())
      | "ExistingObjectReplication" ->
          r_existing_object_replication :=
            Some
              (Read.sequence i "ExistingObjectReplication"
                 (fun i attrs -> existing_object_replication_of_xml i attrs)
                 ())
      | "Destination" ->
          r_destination :=
            Some (Read.sequence i "Destination" (fun i attrs -> destination_of_xml i attrs) ())
      | "DeleteMarkerReplication" ->
          r_delete_marker_replication :=
            Some
              (Read.sequence i "DeleteMarkerReplication"
                 (fun i attrs -> delete_marker_replication_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     i_d = ( ! ) r_i_d;
     priority = ( ! ) r_priority;
     prefix = ( ! ) r_prefix;
     filter = ( ! ) r_filter;
     status = required "Status" (( ! ) r_status) i;
     source_selection_criteria = ( ! ) r_source_selection_criteria;
     existing_object_replication = ( ! ) r_existing_object_replication;
     destination = required "Destination" (( ! ) r_destination) i;
     delete_marker_replication = ( ! ) r_delete_marker_replication;
   }
    : replication_rule)

let replication_rules_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> replication_rule_of_xml i attrs) ()

let replication_configuration_of_xml i attrs =
  let r_role = ref None in
  let r_rules = ref None in
  Structure.scanSequence i [ "Role"; "Rule" ] (fun tag _ ->
      match tag with
      | "Role" -> r_role := Some (Read.sequence i "Role" (fun i attrs -> role_of_xml i attrs) ())
      | "Rule" ->
          r_rules :=
            Some (Read.sequences i "Rule" (fun i attrs -> replication_rule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ role = required "Role" (( ! ) r_role) i; rules = required "Rule" (( ! ) r_rules) i }
    : replication_configuration)

let put_bucket_replication_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_replication_configuration = ref None in
  let r_token = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "ReplicationConfiguration";
      "Token";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ReplicationConfiguration" ->
          r_replication_configuration :=
            Some
              (Read.sequence i "ReplicationConfiguration"
                 (fun i attrs -> replication_configuration_of_xml i attrs)
                 ())
      | "Token" ->
          r_token :=
            Some (Read.sequence i "Token" (fun i attrs -> object_lock_token_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     replication_configuration =
       required "ReplicationConfiguration" (( ! ) r_replication_configuration) i;
     token = ( ! ) r_token;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_replication_request)

let policy_of_xml i attrs = Read.data i
let confirm_remove_self_bucket_access_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let put_bucket_policy_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_confirm_remove_self_bucket_access = ref None in
  let r_policy = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "ConfirmRemoveSelfBucketAccess";
      "Policy";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ConfirmRemoveSelfBucketAccess" ->
          r_confirm_remove_self_bucket_access :=
            Some
              (Read.sequence i "ConfirmRemoveSelfBucketAccess"
                 (fun i attrs -> confirm_remove_self_bucket_access_of_xml i attrs)
                 ())
      | "Policy" ->
          r_policy := Some (Read.sequence i "Policy" (fun i attrs -> policy_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     confirm_remove_self_bucket_access = ( ! ) r_confirm_remove_self_bucket_access;
     policy = required "Policy" (( ! ) r_policy) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_policy_request)

let object_ownership_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "BucketOwnerPreferred" -> BucketOwnerPreferred
   | "ObjectWriter" -> ObjectWriter
   | "BucketOwnerEnforced" -> BucketOwnerEnforced
   | _ -> failwith "unknown enum value"
    : object_ownership)

let ownership_controls_rule_of_xml i attrs =
  let r_object_ownership = ref None in
  Structure.scanSequence i [ "ObjectOwnership" ] (fun tag _ ->
      match tag with
      | "ObjectOwnership" ->
          r_object_ownership :=
            Some
              (Read.sequence i "ObjectOwnership"
                 (fun i attrs -> object_ownership_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ object_ownership = required "ObjectOwnership" (( ! ) r_object_ownership) i }
    : ownership_controls_rule)

let ownership_controls_rules_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> ownership_controls_rule_of_xml i attrs) ()

let ownership_controls_of_xml i attrs =
  let r_rules = ref None in
  Structure.scanSequence i [ "Rule" ] (fun tag _ ->
      match tag with
      | "Rule" ->
          r_rules :=
            Some
              (Read.sequences i "Rule" (fun i attrs -> ownership_controls_rule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ rules = required "Rule" (( ! ) r_rules) i } : ownership_controls)

let put_bucket_ownership_controls_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_expected_bucket_owner = ref None in
  let r_ownership_controls = ref None in
  let r_checksum_algorithm = ref None in
  Structure.scanSequence i
    [ "Bucket"; "ContentMD5"; "ExpectedBucketOwner"; "OwnershipControls"; "ChecksumAlgorithm" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "OwnershipControls" ->
          r_ownership_controls :=
            Some
              (Read.sequence i "OwnershipControls"
                 (fun i attrs -> ownership_controls_of_xml i attrs)
                 ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     ownership_controls = required "OwnershipControls" (( ! ) r_ownership_controls) i;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
   }
    : put_bucket_ownership_controls_request)

let skip_validation_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let event_bridge_configuration_of_xml i attrs = ()
let filter_rule_value_of_xml i attrs = Read.data i

let filter_rule_name_of_xml i attrs =
  let s = Read.data i in
  (match s with "prefix" -> Prefix | "suffix" -> Suffix | _ -> failwith "unknown enum value"
    : filter_rule_name)

let filter_rule_of_xml i attrs =
  let r_name = ref None in
  let r_value = ref None in
  Structure.scanSequence i [ "Name"; "Value" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name :=
            Some (Read.sequence i "Name" (fun i attrs -> filter_rule_name_of_xml i attrs) ())
      | "Value" ->
          r_value :=
            Some (Read.sequence i "Value" (fun i attrs -> filter_rule_value_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ name = ( ! ) r_name; value = ( ! ) r_value } : filter_rule)

let filter_rule_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> filter_rule_of_xml i attrs) ()

let s3_key_filter_of_xml i attrs =
  let r_filter_rules = ref None in
  Structure.scanSequence i [ "FilterRule" ] (fun tag _ ->
      match tag with
      | "FilterRule" ->
          r_filter_rules :=
            Some (Read.sequences i "FilterRule" (fun i attrs -> filter_rule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ filter_rules = ( ! ) r_filter_rules } : s3_key_filter)

let notification_configuration_filter_of_xml i attrs =
  let r_key = ref None in
  Structure.scanSequence i [ "S3Key" ] (fun tag _ ->
      match tag with
      | "S3Key" ->
          r_key := Some (Read.sequence i "S3Key" (fun i attrs -> s3_key_filter_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ key = ( ! ) r_key } : notification_configuration_filter)

let event_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "s3:ReducedRedundancyLostObject" -> S3_ReducedRedundancyLostObject
   | "s3:ObjectCreated:*" -> S3_ObjectCreated_
   | "s3:ObjectCreated:Put" -> S3_ObjectCreated_Put
   | "s3:ObjectCreated:Post" -> S3_ObjectCreated_Post
   | "s3:ObjectCreated:Copy" -> S3_ObjectCreated_Copy
   | "s3:ObjectCreated:CompleteMultipartUpload" -> S3_ObjectCreated_CompleteMultipartUpload
   | "s3:ObjectRemoved:*" -> S3_ObjectRemoved_
   | "s3:ObjectRemoved:Delete" -> S3_ObjectRemoved_Delete
   | "s3:ObjectRemoved:DeleteMarkerCreated" -> S3_ObjectRemoved_DeleteMarkerCreated
   | "s3:ObjectRestore:*" -> S3_ObjectRestore_
   | "s3:ObjectRestore:Post" -> S3_ObjectRestore_Post
   | "s3:ObjectRestore:Completed" -> S3_ObjectRestore_Completed
   | "s3:Replication:*" -> S3_Replication_
   | "s3:Replication:OperationFailedReplication" -> S3_Replication_OperationFailedReplication
   | "s3:Replication:OperationNotTracked" -> S3_Replication_OperationNotTracked
   | "s3:Replication:OperationMissedThreshold" -> S3_Replication_OperationMissedThreshold
   | "s3:Replication:OperationReplicatedAfterThreshold" ->
       S3_Replication_OperationReplicatedAfterThreshold
   | "s3:ObjectRestore:Delete" -> S3_ObjectRestore_Delete
   | "s3:LifecycleTransition" -> S3_LifecycleTransition
   | "s3:IntelligentTiering" -> S3_IntelligentTiering
   | "s3:ObjectAcl:Put" -> S3_ObjectAcl_Put
   | "s3:LifecycleExpiration:*" -> S3_LifecycleExpiration_
   | "s3:LifecycleExpiration:Delete" -> S3_LifecycleExpiration_Delete
   | "s3:LifecycleExpiration:DeleteMarkerCreated" -> S3_LifecycleExpiration_DeleteMarkerCreated
   | "s3:ObjectTagging:*" -> S3_ObjectTagging_
   | "s3:ObjectTagging:Put" -> S3_ObjectTagging_Put
   | "s3:ObjectTagging:Delete" -> S3_ObjectTagging_Delete
   | "s3:ObjectAnnotation:*" -> S3_ObjectAnnotation_
   | "s3:ObjectAnnotation:Put" -> S3_ObjectAnnotation_Put
   | "s3:ObjectAnnotation:Delete" -> S3_ObjectAnnotation_Delete
   | _ -> failwith "unknown enum value"
    : event)

let event_list_of_xml i attrs = Read.sequences i "member" (fun i attrs -> event_of_xml i attrs) ()
let lambda_function_arn_of_xml i attrs = Read.data i
let notification_id_of_xml i attrs = Read.data i

let lambda_function_configuration_of_xml i attrs =
  let r_id = ref None in
  let r_lambda_function_arn = ref None in
  let r_events = ref None in
  let r_filter = ref None in
  Structure.scanSequence i [ "Id"; "CloudFunction"; "Event"; "Filter" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id := Some (Read.sequence i "Id" (fun i attrs -> notification_id_of_xml i attrs) ())
      | "CloudFunction" ->
          r_lambda_function_arn :=
            Some
              (Read.sequence i "CloudFunction"
                 (fun i attrs -> lambda_function_arn_of_xml i attrs)
                 ())
      | "Event" ->
          r_events := Some (Read.sequences i "Event" (fun i attrs -> event_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some
              (Read.sequence i "Filter"
                 (fun i attrs -> notification_configuration_filter_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     id = ( ! ) r_id;
     lambda_function_arn = required "CloudFunction" (( ! ) r_lambda_function_arn) i;
     events = required "Event" (( ! ) r_events) i;
     filter = ( ! ) r_filter;
   }
    : lambda_function_configuration)

let lambda_function_configuration_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> lambda_function_configuration_of_xml i attrs) ()

let queue_arn_of_xml i attrs = Read.data i

let queue_configuration_of_xml i attrs =
  let r_id = ref None in
  let r_queue_arn = ref None in
  let r_events = ref None in
  let r_filter = ref None in
  Structure.scanSequence i [ "Id"; "Queue"; "Event"; "Filter" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id := Some (Read.sequence i "Id" (fun i attrs -> notification_id_of_xml i attrs) ())
      | "Queue" ->
          r_queue_arn := Some (Read.sequence i "Queue" (fun i attrs -> queue_arn_of_xml i attrs) ())
      | "Event" ->
          r_events := Some (Read.sequences i "Event" (fun i attrs -> event_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some
              (Read.sequence i "Filter"
                 (fun i attrs -> notification_configuration_filter_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     id = ( ! ) r_id;
     queue_arn = required "Queue" (( ! ) r_queue_arn) i;
     events = required "Event" (( ! ) r_events) i;
     filter = ( ! ) r_filter;
   }
    : queue_configuration)

let queue_configuration_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> queue_configuration_of_xml i attrs) ()

let topic_arn_of_xml i attrs = Read.data i

let topic_configuration_of_xml i attrs =
  let r_id = ref None in
  let r_topic_arn = ref None in
  let r_events = ref None in
  let r_filter = ref None in
  Structure.scanSequence i [ "Id"; "Topic"; "Event"; "Filter" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id := Some (Read.sequence i "Id" (fun i attrs -> notification_id_of_xml i attrs) ())
      | "Topic" ->
          r_topic_arn := Some (Read.sequence i "Topic" (fun i attrs -> topic_arn_of_xml i attrs) ())
      | "Event" ->
          r_events := Some (Read.sequences i "Event" (fun i attrs -> event_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some
              (Read.sequence i "Filter"
                 (fun i attrs -> notification_configuration_filter_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     id = ( ! ) r_id;
     topic_arn = required "Topic" (( ! ) r_topic_arn) i;
     events = required "Event" (( ! ) r_events) i;
     filter = ( ! ) r_filter;
   }
    : topic_configuration)

let topic_configuration_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> topic_configuration_of_xml i attrs) ()

let notification_configuration_of_xml i attrs =
  let r_topic_configurations = ref None in
  let r_queue_configurations = ref None in
  let r_lambda_function_configurations = ref None in
  let r_event_bridge_configuration = ref None in
  Structure.scanSequence i
    [
      "TopicConfiguration";
      "QueueConfiguration";
      "CloudFunctionConfiguration";
      "EventBridgeConfiguration";
    ] (fun tag _ ->
      match tag with
      | "TopicConfiguration" ->
          r_topic_configurations :=
            Some
              (Read.sequences i "TopicConfiguration"
                 (fun i attrs -> topic_configuration_of_xml i attrs)
                 ())
      | "QueueConfiguration" ->
          r_queue_configurations :=
            Some
              (Read.sequences i "QueueConfiguration"
                 (fun i attrs -> queue_configuration_of_xml i attrs)
                 ())
      | "CloudFunctionConfiguration" ->
          r_lambda_function_configurations :=
            Some
              (Read.sequences i "CloudFunctionConfiguration"
                 (fun i attrs -> lambda_function_configuration_of_xml i attrs)
                 ())
      | "EventBridgeConfiguration" ->
          r_event_bridge_configuration :=
            Some
              (Read.sequence i "EventBridgeConfiguration"
                 (fun i attrs -> event_bridge_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     topic_configurations = ( ! ) r_topic_configurations;
     queue_configurations = ( ! ) r_queue_configurations;
     lambda_function_configurations = ( ! ) r_lambda_function_configurations;
     event_bridge_configuration = ( ! ) r_event_bridge_configuration;
   }
    : notification_configuration)

let put_bucket_notification_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_notification_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  let r_skip_destination_validation = ref None in
  Structure.scanSequence i
    [ "Bucket"; "NotificationConfiguration"; "ExpectedBucketOwner"; "SkipDestinationValidation" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "NotificationConfiguration" ->
          r_notification_configuration :=
            Some
              (Read.sequence i "NotificationConfiguration"
                 (fun i attrs -> notification_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "SkipDestinationValidation" ->
          r_skip_destination_validation :=
            Some
              (Read.sequence i "SkipDestinationValidation"
                 (fun i attrs -> skip_validation_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     notification_configuration =
       required "NotificationConfiguration" (( ! ) r_notification_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     skip_destination_validation = ( ! ) r_skip_destination_validation;
   }
    : put_bucket_notification_configuration_request)

let metrics_and_operator_of_xml i attrs =
  let r_prefix = ref None in
  let r_tags = ref None in
  let r_access_point_arn = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag"; "AccessPointArn" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tags := Some (Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | "AccessPointArn" ->
          r_access_point_arn :=
            Some
              (Read.sequence i "AccessPointArn" (fun i attrs -> access_point_arn_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ prefix = ( ! ) r_prefix; tags = ( ! ) r_tags; access_point_arn = ( ! ) r_access_point_arn }
    : metrics_and_operator)

let metrics_filter_of_xml i attrs =
  let r_prefix = ref None in
  let r_tag = ref None in
  let r_access_point_arn = ref None in
  let r_and_ = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag"; "AccessPointArn"; "And" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tag := Some (Read.sequence i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | "AccessPointArn" ->
          r_access_point_arn :=
            Some
              (Read.sequence i "AccessPointArn" (fun i attrs -> access_point_arn_of_xml i attrs) ())
      | "And" ->
          r_and_ :=
            Some (Read.sequence i "And" (fun i attrs -> metrics_and_operator_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  (match ( ! ) r_prefix with
   | Some v -> Prefix v
   | None -> (
       match ( ! ) r_tag with
       | Some v -> Tag v
       | None -> (
           match ( ! ) r_access_point_arn with
           | Some v -> AccessPointArn v
           | None -> (
               match ( ! ) r_and_ with
               | Some v -> And v
               | None -> failwith "no union member present in xml response")))
    : metrics_filter)

let metrics_id_of_xml i attrs = Read.data i

let metrics_configuration_of_xml i attrs =
  let r_id = ref None in
  let r_filter = ref None in
  Structure.scanSequence i [ "Id"; "Filter" ] (fun tag _ ->
      match tag with
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> metrics_id_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some (Read.sequence i "Filter" (fun i attrs -> metrics_filter_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ id = required "Id" (( ! ) r_id) i; filter = ( ! ) r_filter } : metrics_configuration)

let put_bucket_metrics_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_metrics_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "MetricsConfiguration"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> metrics_id_of_xml i attrs) ())
      | "MetricsConfiguration" ->
          r_metrics_configuration :=
            Some
              (Read.sequence i "MetricsConfiguration"
                 (fun i attrs -> metrics_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     metrics_configuration = required "MetricsConfiguration" (( ! ) r_metrics_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_metrics_configuration_request)

let partition_date_source_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "EventTime" -> EventTime
   | "DeliveryTime" -> DeliveryTime
   | _ -> failwith "unknown enum value"
    : partition_date_source)

let partitioned_prefix_of_xml i attrs =
  let r_partition_date_source = ref None in
  Structure.scanSequence i [ "PartitionDateSource" ] (fun tag _ ->
      match tag with
      | "PartitionDateSource" ->
          r_partition_date_source :=
            Some
              (Read.sequence i "PartitionDateSource"
                 (fun i attrs -> partition_date_source_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ partition_date_source = ( ! ) r_partition_date_source } : partitioned_prefix)

let simple_prefix_of_xml i attrs = ()

let target_object_key_format_of_xml i attrs =
  let r_simple_prefix = ref None in
  let r_partitioned_prefix = ref None in
  Structure.scanSequence i [ "SimplePrefix"; "PartitionedPrefix" ] (fun tag _ ->
      match tag with
      | "SimplePrefix" ->
          r_simple_prefix :=
            Some (Read.sequence i "SimplePrefix" (fun i attrs -> simple_prefix_of_xml i attrs) ())
      | "PartitionedPrefix" ->
          r_partitioned_prefix :=
            Some
              (Read.sequence i "PartitionedPrefix"
                 (fun i attrs -> partitioned_prefix_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ simple_prefix = ( ! ) r_simple_prefix; partitioned_prefix = ( ! ) r_partitioned_prefix }
    : target_object_key_format)

let target_prefix_of_xml i attrs = Read.data i

let bucket_logs_permission_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "FULL_CONTROL" -> FULL_CONTROL
   | "READ" -> READ
   | "WRITE" -> WRITE
   | _ -> failwith "unknown enum value"
    : bucket_logs_permission)

let target_grant_of_xml i attrs =
  let r_grantee = ref None in
  let r_permission = ref None in
  Structure.scanSequence i [ "Grantee"; "Permission" ] (fun tag _ ->
      match tag with
      | "Grantee" ->
          r_grantee := Some (Read.sequence i "Grantee" (fun i attrs -> grantee_of_xml i attrs) ())
      | "Permission" ->
          r_permission :=
            Some
              (Read.sequence i "Permission"
                 (fun i attrs -> bucket_logs_permission_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ grantee = ( ! ) r_grantee; permission = ( ! ) r_permission } : target_grant)

let target_grants_of_xml i attrs =
  Read.sequences i "Grant" (fun i attrs -> target_grant_of_xml i attrs) ()

let target_bucket_of_xml i attrs = Read.data i

let logging_enabled_of_xml i attrs =
  let r_target_bucket = ref None in
  let r_target_grants = ref None in
  let r_target_prefix = ref None in
  let r_target_object_key_format = ref None in
  Structure.scanSequence i
    [ "TargetBucket"; "TargetGrants"; "TargetPrefix"; "TargetObjectKeyFormat" ] (fun tag _ ->
      match tag with
      | "TargetBucket" ->
          r_target_bucket :=
            Some (Read.sequence i "TargetBucket" (fun i attrs -> target_bucket_of_xml i attrs) ())
      | "TargetGrants" ->
          r_target_grants :=
            Some
              (Read.sequence i "TargetGrants"
                 (fun i attrs ->
                   Read.sequences i "Grant" (fun i attrs -> target_grant_of_xml i attrs) ())
                 ())
      | "TargetPrefix" ->
          r_target_prefix :=
            Some (Read.sequence i "TargetPrefix" (fun i attrs -> target_prefix_of_xml i attrs) ())
      | "TargetObjectKeyFormat" ->
          r_target_object_key_format :=
            Some
              (Read.sequence i "TargetObjectKeyFormat"
                 (fun i attrs -> target_object_key_format_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     target_bucket = required "TargetBucket" (( ! ) r_target_bucket) i;
     target_grants = ( ! ) r_target_grants;
     target_prefix = required "TargetPrefix" (( ! ) r_target_prefix) i;
     target_object_key_format = ( ! ) r_target_object_key_format;
   }
    : logging_enabled)

let bucket_logging_status_of_xml i attrs =
  let r_logging_enabled = ref None in
  Structure.scanSequence i [ "LoggingEnabled" ] (fun tag _ ->
      match tag with
      | "LoggingEnabled" ->
          r_logging_enabled :=
            Some
              (Read.sequence i "LoggingEnabled" (fun i attrs -> logging_enabled_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ logging_enabled = ( ! ) r_logging_enabled } : bucket_logging_status)

let put_bucket_logging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_bucket_logging_status = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [ "Bucket"; "BucketLoggingStatus"; "ContentMD5"; "ChecksumAlgorithm"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "BucketLoggingStatus" ->
          r_bucket_logging_status :=
            Some
              (Read.sequence i "BucketLoggingStatus"
                 (fun i attrs -> bucket_logging_status_of_xml i attrs)
                 ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     bucket_logging_status = required "BucketLoggingStatus" (( ! ) r_bucket_logging_status) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_logging_request)

let transition_default_minimum_object_size_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "varies_by_storage_class" -> Varies_by_storage_class
   | "all_storage_classes_128K" -> All_storage_classes_128K
   | _ -> failwith "unknown enum value"
    : transition_default_minimum_object_size)

let put_bucket_lifecycle_configuration_output_of_xml i attrs =
  let r_transition_default_minimum_object_size = ref None in
  Structure.scanSequence i [ "TransitionDefaultMinimumObjectSize" ] (fun tag _ ->
      match tag with
      | "TransitionDefaultMinimumObjectSize" ->
          r_transition_default_minimum_object_size :=
            Some
              (Read.sequence i "TransitionDefaultMinimumObjectSize"
                 (fun i attrs -> transition_default_minimum_object_size_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ transition_default_minimum_object_size = ( ! ) r_transition_default_minimum_object_size }
    : put_bucket_lifecycle_configuration_output)

let version_count_of_xml i attrs = Primitive.int_of_string (Read.data i)

let noncurrent_version_expiration_of_xml i attrs =
  let r_noncurrent_days = ref None in
  let r_newer_noncurrent_versions = ref None in
  Structure.scanSequence i [ "NoncurrentDays"; "NewerNoncurrentVersions" ] (fun tag _ ->
      match tag with
      | "NoncurrentDays" ->
          r_noncurrent_days :=
            Some (Read.sequence i "NoncurrentDays" (fun i attrs -> days_of_xml i attrs) ())
      | "NewerNoncurrentVersions" ->
          r_newer_noncurrent_versions :=
            Some
              (Read.sequence i "NewerNoncurrentVersions"
                 (fun i attrs -> version_count_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     noncurrent_days = ( ! ) r_noncurrent_days;
     newer_noncurrent_versions = ( ! ) r_newer_noncurrent_versions;
   }
    : noncurrent_version_expiration)

let transition_storage_class_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "GLACIER" -> GLACIER
   | "STANDARD_IA" -> STANDARD_IA
   | "ONEZONE_IA" -> ONEZONE_IA
   | "INTELLIGENT_TIERING" -> INTELLIGENT_TIERING
   | "DEEP_ARCHIVE" -> DEEP_ARCHIVE
   | "GLACIER_IR" -> GLACIER_IR
   | _ -> failwith "unknown enum value"
    : transition_storage_class)

let noncurrent_version_transition_of_xml i attrs =
  let r_noncurrent_days = ref None in
  let r_storage_class = ref None in
  let r_newer_noncurrent_versions = ref None in
  Structure.scanSequence i [ "NoncurrentDays"; "StorageClass"; "NewerNoncurrentVersions" ]
    (fun tag _ ->
      match tag with
      | "NoncurrentDays" ->
          r_noncurrent_days :=
            Some (Read.sequence i "NoncurrentDays" (fun i attrs -> days_of_xml i attrs) ())
      | "StorageClass" ->
          r_storage_class :=
            Some
              (Read.sequence i "StorageClass"
                 (fun i attrs -> transition_storage_class_of_xml i attrs)
                 ())
      | "NewerNoncurrentVersions" ->
          r_newer_noncurrent_versions :=
            Some
              (Read.sequence i "NewerNoncurrentVersions"
                 (fun i attrs -> version_count_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     noncurrent_days = ( ! ) r_noncurrent_days;
     storage_class = ( ! ) r_storage_class;
     newer_noncurrent_versions = ( ! ) r_newer_noncurrent_versions;
   }
    : noncurrent_version_transition)

let noncurrent_version_transition_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> noncurrent_version_transition_of_xml i attrs) ()

let transition_of_xml i attrs =
  let r_date = ref None in
  let r_days = ref None in
  let r_storage_class = ref None in
  Structure.scanSequence i [ "Date"; "Days"; "StorageClass" ] (fun tag _ ->
      match tag with
      | "Date" -> r_date := Some (Read.sequence i "Date" (fun i attrs -> date_of_xml i attrs) ())
      | "Days" -> r_days := Some (Read.sequence i "Days" (fun i attrs -> days_of_xml i attrs) ())
      | "StorageClass" ->
          r_storage_class :=
            Some
              (Read.sequence i "StorageClass"
                 (fun i attrs -> transition_storage_class_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ date = ( ! ) r_date; days = ( ! ) r_days; storage_class = ( ! ) r_storage_class } : transition)

let transition_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> transition_of_xml i attrs) ()

let expiration_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : expiration_status)

let object_size_less_than_bytes_of_xml i attrs = Primitive.long_of_string (Read.data i)
let object_size_greater_than_bytes_of_xml i attrs = Primitive.long_of_string (Read.data i)

let lifecycle_rule_and_operator_of_xml i attrs =
  let r_prefix = ref None in
  let r_tags = ref None in
  let r_object_size_greater_than = ref None in
  let r_object_size_less_than = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag"; "ObjectSizeGreaterThan"; "ObjectSizeLessThan" ]
    (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tags := Some (Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | "ObjectSizeGreaterThan" ->
          r_object_size_greater_than :=
            Some
              (Read.sequence i "ObjectSizeGreaterThan"
                 (fun i attrs -> object_size_greater_than_bytes_of_xml i attrs)
                 ())
      | "ObjectSizeLessThan" ->
          r_object_size_less_than :=
            Some
              (Read.sequence i "ObjectSizeLessThan"
                 (fun i attrs -> object_size_less_than_bytes_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     prefix = ( ! ) r_prefix;
     tags = ( ! ) r_tags;
     object_size_greater_than = ( ! ) r_object_size_greater_than;
     object_size_less_than = ( ! ) r_object_size_less_than;
   }
    : lifecycle_rule_and_operator)

let lifecycle_rule_filter_of_xml i attrs =
  let r_prefix = ref None in
  let r_tag = ref None in
  let r_object_size_greater_than = ref None in
  let r_object_size_less_than = ref None in
  let r_and_ = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag"; "ObjectSizeGreaterThan"; "ObjectSizeLessThan"; "And" ]
    (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tag := Some (Read.sequence i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | "ObjectSizeGreaterThan" ->
          r_object_size_greater_than :=
            Some
              (Read.sequence i "ObjectSizeGreaterThan"
                 (fun i attrs -> object_size_greater_than_bytes_of_xml i attrs)
                 ())
      | "ObjectSizeLessThan" ->
          r_object_size_less_than :=
            Some
              (Read.sequence i "ObjectSizeLessThan"
                 (fun i attrs -> object_size_less_than_bytes_of_xml i attrs)
                 ())
      | "And" ->
          r_and_ :=
            Some
              (Read.sequence i "And" (fun i attrs -> lifecycle_rule_and_operator_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     prefix = ( ! ) r_prefix;
     tag = ( ! ) r_tag;
     object_size_greater_than = ( ! ) r_object_size_greater_than;
     object_size_less_than = ( ! ) r_object_size_less_than;
     and_ = ( ! ) r_and_;
   }
    : lifecycle_rule_filter)

let expired_object_delete_marker_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let lifecycle_expiration_of_xml i attrs =
  let r_date = ref None in
  let r_days = ref None in
  let r_expired_object_delete_marker = ref None in
  Structure.scanSequence i [ "Date"; "Days"; "ExpiredObjectDeleteMarker" ] (fun tag _ ->
      match tag with
      | "Date" -> r_date := Some (Read.sequence i "Date" (fun i attrs -> date_of_xml i attrs) ())
      | "Days" -> r_days := Some (Read.sequence i "Days" (fun i attrs -> days_of_xml i attrs) ())
      | "ExpiredObjectDeleteMarker" ->
          r_expired_object_delete_marker :=
            Some
              (Read.sequence i "ExpiredObjectDeleteMarker"
                 (fun i attrs -> expired_object_delete_marker_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     date = ( ! ) r_date;
     days = ( ! ) r_days;
     expired_object_delete_marker = ( ! ) r_expired_object_delete_marker;
   }
    : lifecycle_expiration)

let lifecycle_rule_of_xml i attrs =
  let r_expiration = ref None in
  let r_i_d = ref None in
  let r_prefix = ref None in
  let r_filter = ref None in
  let r_status = ref None in
  let r_transitions = ref None in
  let r_noncurrent_version_transitions = ref None in
  let r_noncurrent_version_expiration = ref None in
  let r_abort_incomplete_multipart_upload = ref None in
  Structure.scanSequence i
    [
      "Expiration";
      "ID";
      "Prefix";
      "Filter";
      "Status";
      "Transition";
      "NoncurrentVersionTransition";
      "NoncurrentVersionExpiration";
      "AbortIncompleteMultipartUpload";
    ] (fun tag _ ->
      match tag with
      | "Expiration" ->
          r_expiration :=
            Some
              (Read.sequence i "Expiration" (fun i attrs -> lifecycle_expiration_of_xml i attrs) ())
      | "ID" -> r_i_d := Some (Read.sequence i "ID" (fun i attrs -> i_d_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some (Read.sequence i "Filter" (fun i attrs -> lifecycle_rule_filter_of_xml i attrs) ())
      | "Status" ->
          r_status :=
            Some (Read.sequence i "Status" (fun i attrs -> expiration_status_of_xml i attrs) ())
      | "Transition" ->
          r_transitions :=
            Some (Read.sequences i "Transition" (fun i attrs -> transition_of_xml i attrs) ())
      | "NoncurrentVersionTransition" ->
          r_noncurrent_version_transitions :=
            Some
              (Read.sequences i "NoncurrentVersionTransition"
                 (fun i attrs -> noncurrent_version_transition_of_xml i attrs)
                 ())
      | "NoncurrentVersionExpiration" ->
          r_noncurrent_version_expiration :=
            Some
              (Read.sequence i "NoncurrentVersionExpiration"
                 (fun i attrs -> noncurrent_version_expiration_of_xml i attrs)
                 ())
      | "AbortIncompleteMultipartUpload" ->
          r_abort_incomplete_multipart_upload :=
            Some
              (Read.sequence i "AbortIncompleteMultipartUpload"
                 (fun i attrs -> abort_incomplete_multipart_upload_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     expiration = ( ! ) r_expiration;
     i_d = ( ! ) r_i_d;
     prefix = ( ! ) r_prefix;
     filter = ( ! ) r_filter;
     status = required "Status" (( ! ) r_status) i;
     transitions = ( ! ) r_transitions;
     noncurrent_version_transitions = ( ! ) r_noncurrent_version_transitions;
     noncurrent_version_expiration = ( ! ) r_noncurrent_version_expiration;
     abort_incomplete_multipart_upload = ( ! ) r_abort_incomplete_multipart_upload;
   }
    : lifecycle_rule)

let lifecycle_rules_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> lifecycle_rule_of_xml i attrs) ()

let bucket_lifecycle_configuration_of_xml i attrs =
  let r_rules = ref None in
  Structure.scanSequence i [ "Rule" ] (fun tag _ ->
      match tag with
      | "Rule" ->
          r_rules :=
            Some (Read.sequences i "Rule" (fun i attrs -> lifecycle_rule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ rules = required "Rule" (( ! ) r_rules) i } : bucket_lifecycle_configuration)

let put_bucket_lifecycle_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_checksum_algorithm = ref None in
  let r_lifecycle_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  let r_transition_default_minimum_object_size = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ChecksumAlgorithm";
      "LifecycleConfiguration";
      "ExpectedBucketOwner";
      "TransitionDefaultMinimumObjectSize";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "LifecycleConfiguration" ->
          r_lifecycle_configuration :=
            Some
              (Read.sequence i "LifecycleConfiguration"
                 (fun i attrs -> bucket_lifecycle_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "TransitionDefaultMinimumObjectSize" ->
          r_transition_default_minimum_object_size :=
            Some
              (Read.sequence i "TransitionDefaultMinimumObjectSize"
                 (fun i attrs -> transition_default_minimum_object_size_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     lifecycle_configuration = ( ! ) r_lifecycle_configuration;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     transition_default_minimum_object_size = ( ! ) r_transition_default_minimum_object_size;
   }
    : put_bucket_lifecycle_configuration_request)

let inventory_frequency_of_xml i attrs =
  let s = Read.data i in
  (match s with "Daily" -> Daily | "Weekly" -> Weekly | _ -> failwith "unknown enum value"
    : inventory_frequency)

let inventory_schedule_of_xml i attrs =
  let r_frequency = ref None in
  Structure.scanSequence i [ "Frequency" ] (fun tag _ ->
      match tag with
      | "Frequency" ->
          r_frequency :=
            Some
              (Read.sequence i "Frequency" (fun i attrs -> inventory_frequency_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ frequency = required "Frequency" (( ! ) r_frequency) i } : inventory_schedule)

let inventory_optional_field_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "Size" -> Size
   | "LastModifiedDate" -> LastModifiedDate
   | "StorageClass" -> StorageClass
   | "ETag" -> ETag
   | "IsMultipartUploaded" -> IsMultipartUploaded
   | "ReplicationStatus" -> ReplicationStatus
   | "EncryptionStatus" -> EncryptionStatus
   | "ObjectLockRetainUntilDate" -> ObjectLockRetainUntilDate
   | "ObjectLockMode" -> ObjectLockMode
   | "ObjectLockLegalHoldStatus" -> ObjectLockLegalHoldStatus
   | "IntelligentTieringAccessTier" -> IntelligentTieringAccessTier
   | "BucketKeyStatus" -> BucketKeyStatus
   | "ChecksumAlgorithm" -> ChecksumAlgorithm
   | "ObjectAccessControlList" -> ObjectAccessControlList
   | "ObjectOwner" -> ObjectOwner
   | "LifecycleExpirationDate" -> LifecycleExpirationDate
   | _ -> failwith "unknown enum value"
    : inventory_optional_field)

let inventory_optional_fields_of_xml i attrs =
  Read.sequences i "Field" (fun i attrs -> inventory_optional_field_of_xml i attrs) ()

let inventory_included_object_versions_of_xml i attrs =
  let s = Read.data i in
  (match s with "All" -> All | "Current" -> Current | _ -> failwith "unknown enum value"
    : inventory_included_object_versions)

let inventory_id_of_xml i attrs = Read.data i

let inventory_filter_of_xml i attrs =
  let r_prefix = ref None in
  Structure.scanSequence i [ "Prefix" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ prefix = required "Prefix" (( ! ) r_prefix) i } : inventory_filter)

let is_enabled_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let ssekm_s_of_xml i attrs =
  let r_key_id = ref None in
  Structure.scanSequence i [ "KeyId" ] (fun tag _ ->
      match tag with
      | "KeyId" ->
          r_key_id :=
            Some (Read.sequence i "KeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ key_id = required "KeyId" (( ! ) r_key_id) i } : ssekm_s)

let sse_s3_of_xml i attrs = ()

let inventory_encryption_of_xml i attrs =
  let r_sse_s3 = ref None in
  let r_ssekm_s = ref None in
  Structure.scanSequence i [ "SSE-S3"; "SSE-KMS" ] (fun tag _ ->
      match tag with
      | "SSE-S3" ->
          r_sse_s3 := Some (Read.sequence i "SSE-S3" (fun i attrs -> sse_s3_of_xml i attrs) ())
      | "SSE-KMS" ->
          r_ssekm_s := Some (Read.sequence i "SSE-KMS" (fun i attrs -> ssekm_s_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ sse_s3 = ( ! ) r_sse_s3; ssekm_s = ( ! ) r_ssekm_s } : inventory_encryption)

let inventory_format_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "CSV" -> CSV
   | "ORC" -> ORC
   | "Parquet" -> Parquet
   | _ -> failwith "unknown enum value"
    : inventory_format)

let inventory_s3_bucket_destination_of_xml i attrs =
  let r_account_id = ref None in
  let r_bucket = ref None in
  let r_format = ref None in
  let r_prefix = ref None in
  let r_encryption = ref None in
  Structure.scanSequence i [ "AccountId"; "Bucket"; "Format"; "Prefix"; "Encryption" ] (fun tag _ ->
      match tag with
      | "AccountId" ->
          r_account_id :=
            Some (Read.sequence i "AccountId" (fun i attrs -> account_id_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Format" ->
          r_format :=
            Some (Read.sequence i "Format" (fun i attrs -> inventory_format_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Encryption" ->
          r_encryption :=
            Some
              (Read.sequence i "Encryption" (fun i attrs -> inventory_encryption_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     account_id = ( ! ) r_account_id;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     format = required "Format" (( ! ) r_format) i;
     prefix = ( ! ) r_prefix;
     encryption = ( ! ) r_encryption;
   }
    : inventory_s3_bucket_destination)

let inventory_destination_of_xml i attrs =
  let r_s3_bucket_destination = ref None in
  Structure.scanSequence i [ "S3BucketDestination" ] (fun tag _ ->
      match tag with
      | "S3BucketDestination" ->
          r_s3_bucket_destination :=
            Some
              (Read.sequence i "S3BucketDestination"
                 (fun i attrs -> inventory_s3_bucket_destination_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ s3_bucket_destination = required "S3BucketDestination" (( ! ) r_s3_bucket_destination) i }
    : inventory_destination)

let inventory_configuration_of_xml i attrs =
  let r_destination = ref None in
  let r_is_enabled = ref None in
  let r_filter = ref None in
  let r_id = ref None in
  let r_included_object_versions = ref None in
  let r_optional_fields = ref None in
  let r_schedule = ref None in
  Structure.scanSequence i
    [
      "Destination";
      "IsEnabled";
      "Filter";
      "Id";
      "IncludedObjectVersions";
      "OptionalFields";
      "Schedule";
    ] (fun tag _ ->
      match tag with
      | "Destination" ->
          r_destination :=
            Some
              (Read.sequence i "Destination"
                 (fun i attrs -> inventory_destination_of_xml i attrs)
                 ())
      | "IsEnabled" ->
          r_is_enabled :=
            Some (Read.sequence i "IsEnabled" (fun i attrs -> is_enabled_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some (Read.sequence i "Filter" (fun i attrs -> inventory_filter_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> inventory_id_of_xml i attrs) ())
      | "IncludedObjectVersions" ->
          r_included_object_versions :=
            Some
              (Read.sequence i "IncludedObjectVersions"
                 (fun i attrs -> inventory_included_object_versions_of_xml i attrs)
                 ())
      | "OptionalFields" ->
          r_optional_fields :=
            Some
              (Read.sequence i "OptionalFields"
                 (fun i attrs ->
                   Read.sequences i "Field"
                     (fun i attrs -> inventory_optional_field_of_xml i attrs)
                     ())
                 ())
      | "Schedule" ->
          r_schedule :=
            Some (Read.sequence i "Schedule" (fun i attrs -> inventory_schedule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     destination = required "Destination" (( ! ) r_destination) i;
     is_enabled = required "IsEnabled" (( ! ) r_is_enabled) i;
     filter = ( ! ) r_filter;
     id = required "Id" (( ! ) r_id) i;
     included_object_versions =
       required "IncludedObjectVersions" (( ! ) r_included_object_versions) i;
     optional_fields = ( ! ) r_optional_fields;
     schedule = required "Schedule" (( ! ) r_schedule) i;
   }
    : inventory_configuration)

let put_bucket_inventory_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_inventory_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "InventoryConfiguration"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> inventory_id_of_xml i attrs) ())
      | "InventoryConfiguration" ->
          r_inventory_configuration :=
            Some
              (Read.sequence i "InventoryConfiguration"
                 (fun i attrs -> inventory_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     inventory_configuration = required "InventoryConfiguration" (( ! ) r_inventory_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_inventory_configuration_request)

let intelligent_tiering_access_tier_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "ARCHIVE_ACCESS" -> ARCHIVE_ACCESS
   | "DEEP_ARCHIVE_ACCESS" -> DEEP_ARCHIVE_ACCESS
   | _ -> failwith "unknown enum value"
    : intelligent_tiering_access_tier)

let intelligent_tiering_days_of_xml i attrs = Primitive.int_of_string (Read.data i)

let tiering_of_xml i attrs =
  let r_days = ref None in
  let r_access_tier = ref None in
  Structure.scanSequence i [ "Days"; "AccessTier" ] (fun tag _ ->
      match tag with
      | "Days" ->
          r_days :=
            Some
              (Read.sequence i "Days" (fun i attrs -> intelligent_tiering_days_of_xml i attrs) ())
      | "AccessTier" ->
          r_access_tier :=
            Some
              (Read.sequence i "AccessTier"
                 (fun i attrs -> intelligent_tiering_access_tier_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     days = required "Days" (( ! ) r_days) i;
     access_tier = required "AccessTier" (( ! ) r_access_tier) i;
   }
    : tiering)

let tiering_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> tiering_of_xml i attrs) ()

let intelligent_tiering_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : intelligent_tiering_status)

let intelligent_tiering_and_operator_of_xml i attrs =
  let r_prefix = ref None in
  let r_tags = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tags := Some (Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ prefix = ( ! ) r_prefix; tags = ( ! ) r_tags } : intelligent_tiering_and_operator)

let intelligent_tiering_filter_of_xml i attrs =
  let r_prefix = ref None in
  let r_tag = ref None in
  let r_and_ = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag"; "And" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tag := Some (Read.sequence i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | "And" ->
          r_and_ :=
            Some
              (Read.sequence i "And"
                 (fun i attrs -> intelligent_tiering_and_operator_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ prefix = ( ! ) r_prefix; tag = ( ! ) r_tag; and_ = ( ! ) r_and_ } : intelligent_tiering_filter)

let intelligent_tiering_id_of_xml i attrs = Read.data i

let intelligent_tiering_configuration_of_xml i attrs =
  let r_id = ref None in
  let r_filter = ref None in
  let r_status = ref None in
  let r_tierings = ref None in
  Structure.scanSequence i [ "Id"; "Filter"; "Status"; "Tiering" ] (fun tag _ ->
      match tag with
      | "Id" ->
          r_id :=
            Some (Read.sequence i "Id" (fun i attrs -> intelligent_tiering_id_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some
              (Read.sequence i "Filter"
                 (fun i attrs -> intelligent_tiering_filter_of_xml i attrs)
                 ())
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status"
                 (fun i attrs -> intelligent_tiering_status_of_xml i attrs)
                 ())
      | "Tiering" ->
          r_tierings := Some (Read.sequences i "Tiering" (fun i attrs -> tiering_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     id = required "Id" (( ! ) r_id) i;
     filter = ( ! ) r_filter;
     status = required "Status" (( ! ) r_status) i;
     tierings = required "Tiering" (( ! ) r_tierings) i;
   }
    : intelligent_tiering_configuration)

let put_bucket_intelligent_tiering_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  let r_intelligent_tiering_configuration = ref None in
  Structure.scanSequence i
    [ "Bucket"; "Id"; "ExpectedBucketOwner"; "IntelligentTieringConfiguration" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" ->
          r_id :=
            Some (Read.sequence i "Id" (fun i attrs -> intelligent_tiering_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "IntelligentTieringConfiguration" ->
          r_intelligent_tiering_configuration :=
            Some
              (Read.sequence i "IntelligentTieringConfiguration"
                 (fun i attrs -> intelligent_tiering_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     intelligent_tiering_configuration =
       required "IntelligentTieringConfiguration" (( ! ) r_intelligent_tiering_configuration) i;
   }
    : put_bucket_intelligent_tiering_configuration_request)

let encryption_type_of_xml i attrs =
  let s = Read.data i in
  (match s with "NONE" -> NONE | "SSE-C" -> SSE_C | _ -> failwith "unknown enum value"
    : encryption_type)

let encryption_type_list_of_xml i attrs =
  Read.sequences i "EncryptionType" (fun i attrs -> encryption_type_of_xml i attrs) ()

let blocked_encryption_types_of_xml i attrs =
  let r_encryption_type = ref None in
  Structure.scanSequence i [ "EncryptionType" ] (fun tag _ ->
      match tag with
      | "EncryptionType" ->
          r_encryption_type :=
            Some
              (Read.sequences i "EncryptionType" (fun i attrs -> encryption_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ encryption_type = ( ! ) r_encryption_type } : blocked_encryption_types)

let server_side_encryption_by_default_of_xml i attrs =
  let r_sse_algorithm = ref None in
  let r_kms_master_key_i_d = ref None in
  Structure.scanSequence i [ "SSEAlgorithm"; "KMSMasterKeyID" ] (fun tag _ ->
      match tag with
      | "SSEAlgorithm" ->
          r_sse_algorithm :=
            Some
              (Read.sequence i "SSEAlgorithm"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "KMSMasterKeyID" ->
          r_kms_master_key_i_d :=
            Some (Read.sequence i "KMSMasterKeyID" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     sse_algorithm = required "SSEAlgorithm" (( ! ) r_sse_algorithm) i;
     kms_master_key_i_d = ( ! ) r_kms_master_key_i_d;
   }
    : server_side_encryption_by_default)

let server_side_encryption_rule_of_xml i attrs =
  let r_apply_server_side_encryption_by_default = ref None in
  let r_bucket_key_enabled = ref None in
  let r_blocked_encryption_types = ref None in
  Structure.scanSequence i
    [ "ApplyServerSideEncryptionByDefault"; "BucketKeyEnabled"; "BlockedEncryptionTypes" ]
    (fun tag _ ->
      match tag with
      | "ApplyServerSideEncryptionByDefault" ->
          r_apply_server_side_encryption_by_default :=
            Some
              (Read.sequence i "ApplyServerSideEncryptionByDefault"
                 (fun i attrs -> server_side_encryption_by_default_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "BlockedEncryptionTypes" ->
          r_blocked_encryption_types :=
            Some
              (Read.sequence i "BlockedEncryptionTypes"
                 (fun i attrs -> blocked_encryption_types_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     apply_server_side_encryption_by_default = ( ! ) r_apply_server_side_encryption_by_default;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     blocked_encryption_types = ( ! ) r_blocked_encryption_types;
   }
    : server_side_encryption_rule)

let server_side_encryption_rules_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> server_side_encryption_rule_of_xml i attrs) ()

let server_side_encryption_configuration_of_xml i attrs =
  let r_rules = ref None in
  Structure.scanSequence i [ "Rule" ] (fun tag _ ->
      match tag with
      | "Rule" ->
          r_rules :=
            Some
              (Read.sequences i "Rule"
                 (fun i attrs -> server_side_encryption_rule_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ rules = required "Rule" (( ! ) r_rules) i } : server_side_encryption_configuration)

let put_bucket_encryption_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_server_side_encryption_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "ServerSideEncryptionConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ServerSideEncryptionConfiguration" ->
          r_server_side_encryption_configuration :=
            Some
              (Read.sequence i "ServerSideEncryptionConfiguration"
                 (fun i attrs -> server_side_encryption_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     server_side_encryption_configuration =
       required "ServerSideEncryptionConfiguration" (( ! ) r_server_side_encryption_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_encryption_request)

let max_age_seconds_of_xml i attrs = Primitive.int_of_string (Read.data i)
let expose_header_of_xml i attrs = Read.data i

let expose_headers_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> expose_header_of_xml i attrs) ()

let cors_rule_of_xml i attrs =
  let r_i_d = ref None in
  let r_allowed_headers = ref None in
  let r_allowed_methods = ref None in
  let r_allowed_origins = ref None in
  let r_expose_headers = ref None in
  let r_max_age_seconds = ref None in
  Structure.scanSequence i
    [ "ID"; "AllowedHeader"; "AllowedMethod"; "AllowedOrigin"; "ExposeHeader"; "MaxAgeSeconds" ]
    (fun tag _ ->
      match tag with
      | "ID" -> r_i_d := Some (Read.sequence i "ID" (fun i attrs -> i_d_of_xml i attrs) ())
      | "AllowedHeader" ->
          r_allowed_headers :=
            Some
              (Read.sequences i "AllowedHeader" (fun i attrs -> allowed_header_of_xml i attrs) ())
      | "AllowedMethod" ->
          r_allowed_methods :=
            Some
              (Read.sequences i "AllowedMethod" (fun i attrs -> allowed_method_of_xml i attrs) ())
      | "AllowedOrigin" ->
          r_allowed_origins :=
            Some
              (Read.sequences i "AllowedOrigin" (fun i attrs -> allowed_origin_of_xml i attrs) ())
      | "ExposeHeader" ->
          r_expose_headers :=
            Some (Read.sequences i "ExposeHeader" (fun i attrs -> expose_header_of_xml i attrs) ())
      | "MaxAgeSeconds" ->
          r_max_age_seconds :=
            Some
              (Read.sequence i "MaxAgeSeconds" (fun i attrs -> max_age_seconds_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     i_d = ( ! ) r_i_d;
     allowed_headers = ( ! ) r_allowed_headers;
     allowed_methods = required "AllowedMethod" (( ! ) r_allowed_methods) i;
     allowed_origins = required "AllowedOrigin" (( ! ) r_allowed_origins) i;
     expose_headers = ( ! ) r_expose_headers;
     max_age_seconds = ( ! ) r_max_age_seconds;
   }
    : cors_rule)

let cors_rules_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> cors_rule_of_xml i attrs) ()

let cors_configuration_of_xml i attrs =
  let r_cors_rules = ref None in
  Structure.scanSequence i [ "CORSRule" ] (fun tag _ ->
      match tag with
      | "CORSRule" ->
          r_cors_rules :=
            Some (Read.sequences i "CORSRule" (fun i attrs -> cors_rule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ cors_rules = required "CORSRule" (( ! ) r_cors_rules) i } : cors_configuration)

let put_bucket_cors_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_cors_configuration = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [ "Bucket"; "CORSConfiguration"; "ContentMD5"; "ChecksumAlgorithm"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "CORSConfiguration" ->
          r_cors_configuration :=
            Some
              (Read.sequence i "CORSConfiguration"
                 (fun i attrs -> cors_configuration_of_xml i attrs)
                 ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     cors_configuration = required "CORSConfiguration" (( ! ) r_cors_configuration) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_cors_request)

let analytics_s3_export_file_format_of_xml i attrs =
  let s = Read.data i in
  (match s with "CSV" -> CSV | _ -> failwith "unknown enum value"
    : analytics_s3_export_file_format)

let analytics_s3_bucket_destination_of_xml i attrs =
  let r_format = ref None in
  let r_bucket_account_id = ref None in
  let r_bucket = ref None in
  let r_prefix = ref None in
  Structure.scanSequence i [ "Format"; "BucketAccountId"; "Bucket"; "Prefix" ] (fun tag _ ->
      match tag with
      | "Format" ->
          r_format :=
            Some
              (Read.sequence i "Format"
                 (fun i attrs -> analytics_s3_export_file_format_of_xml i attrs)
                 ())
      | "BucketAccountId" ->
          r_bucket_account_id :=
            Some (Read.sequence i "BucketAccountId" (fun i attrs -> account_id_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     format = required "Format" (( ! ) r_format) i;
     bucket_account_id = ( ! ) r_bucket_account_id;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     prefix = ( ! ) r_prefix;
   }
    : analytics_s3_bucket_destination)

let analytics_export_destination_of_xml i attrs =
  let r_s3_bucket_destination = ref None in
  Structure.scanSequence i [ "S3BucketDestination" ] (fun tag _ ->
      match tag with
      | "S3BucketDestination" ->
          r_s3_bucket_destination :=
            Some
              (Read.sequence i "S3BucketDestination"
                 (fun i attrs -> analytics_s3_bucket_destination_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ s3_bucket_destination = required "S3BucketDestination" (( ! ) r_s3_bucket_destination) i }
    : analytics_export_destination)

let storage_class_analysis_schema_version_of_xml i attrs =
  let s = Read.data i in
  (match s with "V_1" -> V_1 | _ -> failwith "unknown enum value"
    : storage_class_analysis_schema_version)

let storage_class_analysis_data_export_of_xml i attrs =
  let r_output_schema_version = ref None in
  let r_destination = ref None in
  Structure.scanSequence i [ "OutputSchemaVersion"; "Destination" ] (fun tag _ ->
      match tag with
      | "OutputSchemaVersion" ->
          r_output_schema_version :=
            Some
              (Read.sequence i "OutputSchemaVersion"
                 (fun i attrs -> storage_class_analysis_schema_version_of_xml i attrs)
                 ())
      | "Destination" ->
          r_destination :=
            Some
              (Read.sequence i "Destination"
                 (fun i attrs -> analytics_export_destination_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     output_schema_version = required "OutputSchemaVersion" (( ! ) r_output_schema_version) i;
     destination = required "Destination" (( ! ) r_destination) i;
   }
    : storage_class_analysis_data_export)

let storage_class_analysis_of_xml i attrs =
  let r_data_export = ref None in
  Structure.scanSequence i [ "DataExport" ] (fun tag _ ->
      match tag with
      | "DataExport" ->
          r_data_export :=
            Some
              (Read.sequence i "DataExport"
                 (fun i attrs -> storage_class_analysis_data_export_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ data_export = ( ! ) r_data_export } : storage_class_analysis)

let analytics_and_operator_of_xml i attrs =
  let r_prefix = ref None in
  let r_tags = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tags := Some (Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ prefix = ( ! ) r_prefix; tags = ( ! ) r_tags } : analytics_and_operator)

let analytics_filter_of_xml i attrs =
  let r_prefix = ref None in
  let r_tag = ref None in
  let r_and_ = ref None in
  Structure.scanSequence i [ "Prefix"; "Tag"; "And" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Tag" -> r_tag := Some (Read.sequence i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
      | "And" ->
          r_and_ :=
            Some (Read.sequence i "And" (fun i attrs -> analytics_and_operator_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  (match ( ! ) r_prefix with
   | Some v -> Prefix v
   | None -> (
       match ( ! ) r_tag with
       | Some v -> Tag v
       | None -> (
           match ( ! ) r_and_ with
           | Some v -> And v
           | None -> failwith "no union member present in xml response"))
    : analytics_filter)

let analytics_id_of_xml i attrs = Read.data i

let analytics_configuration_of_xml i attrs =
  let r_id = ref None in
  let r_filter = ref None in
  let r_storage_class_analysis = ref None in
  Structure.scanSequence i [ "Id"; "Filter"; "StorageClassAnalysis" ] (fun tag _ ->
      match tag with
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> analytics_id_of_xml i attrs) ())
      | "Filter" ->
          r_filter :=
            Some (Read.sequence i "Filter" (fun i attrs -> analytics_filter_of_xml i attrs) ())
      | "StorageClassAnalysis" ->
          r_storage_class_analysis :=
            Some
              (Read.sequence i "StorageClassAnalysis"
                 (fun i attrs -> storage_class_analysis_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     id = required "Id" (( ! ) r_id) i;
     filter = ( ! ) r_filter;
     storage_class_analysis = required "StorageClassAnalysis" (( ! ) r_storage_class_analysis) i;
   }
    : analytics_configuration)

let put_bucket_analytics_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_analytics_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "AnalyticsConfiguration"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> analytics_id_of_xml i attrs) ())
      | "AnalyticsConfiguration" ->
          r_analytics_configuration :=
            Some
              (Read.sequence i "AnalyticsConfiguration"
                 (fun i attrs -> analytics_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     analytics_configuration = required "AnalyticsConfiguration" (( ! ) r_analytics_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_analytics_configuration_request)

let bucket_canned_ac_l_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "private" -> Private
   | "public-read" -> Public_read
   | "public-read-write" -> Public_read_write
   | "authenticated-read" -> Authenticated_read
   | _ -> failwith "unknown enum value"
    : bucket_canned_ac_l)

let put_bucket_acl_request_of_xml i attrs =
  let r_ac_l = ref None in
  let r_access_control_policy = ref None in
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_grant_full_control = ref None in
  let r_grant_read = ref None in
  let r_grant_read_ac_p = ref None in
  let r_grant_write = ref None in
  let r_grant_write_ac_p = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "ACL";
      "AccessControlPolicy";
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "GrantFullControl";
      "GrantRead";
      "GrantReadACP";
      "GrantWrite";
      "GrantWriteACP";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "ACL" ->
          r_ac_l :=
            Some (Read.sequence i "ACL" (fun i attrs -> bucket_canned_ac_l_of_xml i attrs) ())
      | "AccessControlPolicy" ->
          r_access_control_policy :=
            Some
              (Read.sequence i "AccessControlPolicy"
                 (fun i attrs -> access_control_policy_of_xml i attrs)
                 ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "GrantFullControl" ->
          r_grant_full_control :=
            Some
              (Read.sequence i "GrantFullControl"
                 (fun i attrs -> grant_full_control_of_xml i attrs)
                 ())
      | "GrantRead" ->
          r_grant_read :=
            Some (Read.sequence i "GrantRead" (fun i attrs -> grant_read_of_xml i attrs) ())
      | "GrantReadACP" ->
          r_grant_read_ac_p :=
            Some (Read.sequence i "GrantReadACP" (fun i attrs -> grant_read_ac_p_of_xml i attrs) ())
      | "GrantWrite" ->
          r_grant_write :=
            Some (Read.sequence i "GrantWrite" (fun i attrs -> grant_write_of_xml i attrs) ())
      | "GrantWriteACP" ->
          r_grant_write_ac_p :=
            Some
              (Read.sequence i "GrantWriteACP" (fun i attrs -> grant_write_ac_p_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     ac_l = ( ! ) r_ac_l;
     access_control_policy = ( ! ) r_access_control_policy;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     grant_full_control = ( ! ) r_grant_full_control;
     grant_read = ( ! ) r_grant_read;
     grant_read_ac_p = ( ! ) r_grant_read_ac_p;
     grant_write = ( ! ) r_grant_write;
     grant_write_ac_p = ( ! ) r_grant_write_ac_p;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : put_bucket_acl_request)

let put_bucket_accelerate_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_accelerate_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  let r_checksum_algorithm = ref None in
  Structure.scanSequence i
    [ "Bucket"; "AccelerateConfiguration"; "ExpectedBucketOwner"; "ChecksumAlgorithm" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "AccelerateConfiguration" ->
          r_accelerate_configuration :=
            Some
              (Read.sequence i "AccelerateConfiguration"
                 (fun i attrs -> accelerate_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     accelerate_configuration =
       required "AccelerateConfiguration" (( ! ) r_accelerate_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
   }
    : put_bucket_accelerate_configuration_request)

let put_bucket_abac_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_expected_bucket_owner = ref None in
  let r_abac_status = ref None in
  Structure.scanSequence i
    [ "Bucket"; "ContentMD5"; "ChecksumAlgorithm"; "ExpectedBucketOwner"; "AbacStatus" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "AbacStatus" ->
          r_abac_status :=
            Some (Read.sequence i "AbacStatus" (fun i attrs -> abac_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     abac_status = required "AbacStatus" (( ! ) r_abac_status) i;
   }
    : put_bucket_abac_request)

let initiator_of_xml i attrs =
  let r_i_d = ref None in
  let r_display_name = ref None in
  Structure.scanSequence i [ "ID"; "DisplayName" ] (fun tag _ ->
      match tag with
      | "ID" -> r_i_d := Some (Read.sequence i "ID" (fun i attrs -> i_d_of_xml i attrs) ())
      | "DisplayName" ->
          r_display_name :=
            Some (Read.sequence i "DisplayName" (fun i attrs -> display_name_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ i_d = ( ! ) r_i_d; display_name = ( ! ) r_display_name } : initiator)

let part_of_xml i attrs =
  let r_part_number = ref None in
  let r_last_modified = ref None in
  let r_e_tag = ref None in
  let r_size = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  Structure.scanSequence i
    [
      "PartNumber";
      "LastModified";
      "ETag";
      "Size";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
    ] (fun tag _ ->
      match tag with
      | "PartNumber" ->
          r_part_number :=
            Some (Read.sequence i "PartNumber" (fun i attrs -> part_number_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "Size" -> r_size := Some (Read.sequence i "Size" (fun i attrs -> size_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     part_number = ( ! ) r_part_number;
     last_modified = ( ! ) r_last_modified;
     e_tag = ( ! ) r_e_tag;
     size = ( ! ) r_size;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
   }
    : part)

let parts_of_xml i attrs = Read.sequences i "member" (fun i attrs -> part_of_xml i attrs) ()
let is_truncated_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let max_parts_of_xml i attrs = Primitive.int_of_string (Read.data i)
let next_part_number_marker_of_xml i attrs = Read.data i
let part_number_marker_of_xml i attrs = Read.data i

let list_parts_output_of_xml i attrs =
  let r_abort_date = ref None in
  let r_abort_rule_id = ref None in
  let r_bucket = ref None in
  let r_key = ref None in
  let r_upload_id = ref None in
  let r_part_number_marker = ref None in
  let r_next_part_number_marker = ref None in
  let r_max_parts = ref None in
  let r_is_truncated = ref None in
  let r_parts = ref None in
  let r_initiator = ref None in
  let r_owner = ref None in
  let r_storage_class = ref None in
  let r_request_charged = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_type = ref None in
  Structure.scanSequence i
    [
      "AbortDate";
      "AbortRuleId";
      "Bucket";
      "Key";
      "UploadId";
      "PartNumberMarker";
      "NextPartNumberMarker";
      "MaxParts";
      "IsTruncated";
      "Part";
      "Initiator";
      "Owner";
      "StorageClass";
      "RequestCharged";
      "ChecksumAlgorithm";
      "ChecksumType";
    ] (fun tag _ ->
      match tag with
      | "AbortDate" ->
          r_abort_date :=
            Some (Read.sequence i "AbortDate" (fun i attrs -> abort_date_of_xml i attrs) ())
      | "AbortRuleId" ->
          r_abort_rule_id :=
            Some (Read.sequence i "AbortRuleId" (fun i attrs -> abort_rule_id_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "PartNumberMarker" ->
          r_part_number_marker :=
            Some
              (Read.sequence i "PartNumberMarker"
                 (fun i attrs -> part_number_marker_of_xml i attrs)
                 ())
      | "NextPartNumberMarker" ->
          r_next_part_number_marker :=
            Some
              (Read.sequence i "NextPartNumberMarker"
                 (fun i attrs -> next_part_number_marker_of_xml i attrs)
                 ())
      | "MaxParts" ->
          r_max_parts :=
            Some (Read.sequence i "MaxParts" (fun i attrs -> max_parts_of_xml i attrs) ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "Part" -> r_parts := Some (Read.sequences i "Part" (fun i attrs -> part_of_xml i attrs) ())
      | "Initiator" ->
          r_initiator :=
            Some (Read.sequence i "Initiator" (fun i attrs -> initiator_of_xml i attrs) ())
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     abort_date = ( ! ) r_abort_date;
     abort_rule_id = ( ! ) r_abort_rule_id;
     bucket = ( ! ) r_bucket;
     key = ( ! ) r_key;
     upload_id = ( ! ) r_upload_id;
     part_number_marker = ( ! ) r_part_number_marker;
     next_part_number_marker = ( ! ) r_next_part_number_marker;
     max_parts = ( ! ) r_max_parts;
     is_truncated = ( ! ) r_is_truncated;
     parts = ( ! ) r_parts;
     initiator = ( ! ) r_initiator;
     owner = ( ! ) r_owner;
     storage_class = ( ! ) r_storage_class;
     request_charged = ( ! ) r_request_charged;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_type = ( ! ) r_checksum_type;
   }
    : list_parts_output)

let list_parts_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_max_parts = ref None in
  let r_part_number_marker = ref None in
  let r_upload_id = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "MaxParts";
      "PartNumberMarker";
      "UploadId";
      "RequestPayer";
      "ExpectedBucketOwner";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "MaxParts" ->
          r_max_parts :=
            Some (Read.sequence i "MaxParts" (fun i attrs -> max_parts_of_xml i attrs) ())
      | "PartNumberMarker" ->
          r_part_number_marker :=
            Some
              (Read.sequence i "PartNumberMarker"
                 (fun i attrs -> part_number_marker_of_xml i attrs)
                 ())
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     max_parts = ( ! ) r_max_parts;
     part_number_marker = ( ! ) r_part_number_marker;
     upload_id = required "UploadId" (( ! ) r_upload_id) i;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
   }
    : list_parts_request)

let encoding_type_of_xml i attrs =
  let s = Read.data i in
  (match s with "url" -> Url | _ -> failwith "unknown enum value" : encoding_type)

let common_prefix_of_xml i attrs =
  let r_prefix = ref None in
  Structure.scanSequence i [ "Prefix" ] (fun tag _ ->
      match tag with
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ prefix = ( ! ) r_prefix } : common_prefix)

let common_prefix_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> common_prefix_of_xml i attrs) ()

let max_keys_of_xml i attrs = Primitive.int_of_string (Read.data i)
let delimiter_of_xml i attrs = Read.data i
let is_latest_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let delete_marker_entry_of_xml i attrs =
  let r_owner = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_is_latest = ref None in
  let r_last_modified = ref None in
  Structure.scanSequence i [ "Owner"; "Key"; "VersionId"; "IsLatest"; "LastModified" ] (fun tag _ ->
      match tag with
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "IsLatest" ->
          r_is_latest :=
            Some (Read.sequence i "IsLatest" (fun i attrs -> is_latest_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     owner = ( ! ) r_owner;
     key = ( ! ) r_key;
     version_id = ( ! ) r_version_id;
     is_latest = ( ! ) r_is_latest;
     last_modified = ( ! ) r_last_modified;
   }
    : delete_marker_entry)

let delete_markers_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> delete_marker_entry_of_xml i attrs) ()

let restore_expiry_date_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let is_restore_in_progress_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let restore_status_of_xml i attrs =
  let r_is_restore_in_progress = ref None in
  let r_restore_expiry_date = ref None in
  Structure.scanSequence i [ "IsRestoreInProgress"; "RestoreExpiryDate" ] (fun tag _ ->
      match tag with
      | "IsRestoreInProgress" ->
          r_is_restore_in_progress :=
            Some
              (Read.sequence i "IsRestoreInProgress"
                 (fun i attrs -> is_restore_in_progress_of_xml i attrs)
                 ())
      | "RestoreExpiryDate" ->
          r_restore_expiry_date :=
            Some
              (Read.sequence i "RestoreExpiryDate"
                 (fun i attrs -> restore_expiry_date_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     is_restore_in_progress = ( ! ) r_is_restore_in_progress;
     restore_expiry_date = ( ! ) r_restore_expiry_date;
   }
    : restore_status)

let object_version_storage_class_of_xml i attrs =
  let s = Read.data i in
  (match s with "STANDARD" -> STANDARD | _ -> failwith "unknown enum value"
    : object_version_storage_class)

let checksum_algorithm_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> checksum_algorithm_of_xml i attrs) ()

let object_version_of_xml i attrs =
  let r_e_tag = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_type = ref None in
  let r_size = ref None in
  let r_storage_class = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_is_latest = ref None in
  let r_last_modified = ref None in
  let r_owner = ref None in
  let r_restore_status = ref None in
  Structure.scanSequence i
    [
      "ETag";
      "ChecksumAlgorithm";
      "ChecksumType";
      "Size";
      "StorageClass";
      "Key";
      "VersionId";
      "IsLatest";
      "LastModified";
      "Owner";
      "RestoreStatus";
    ] (fun tag _ ->
      match tag with
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequences i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "Size" -> r_size := Some (Read.sequence i "Size" (fun i attrs -> size_of_xml i attrs) ())
      | "StorageClass" ->
          r_storage_class :=
            Some
              (Read.sequence i "StorageClass"
                 (fun i attrs -> object_version_storage_class_of_xml i attrs)
                 ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "IsLatest" ->
          r_is_latest :=
            Some (Read.sequence i "IsLatest" (fun i attrs -> is_latest_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "RestoreStatus" ->
          r_restore_status :=
            Some (Read.sequence i "RestoreStatus" (fun i attrs -> restore_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     e_tag = ( ! ) r_e_tag;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_type = ( ! ) r_checksum_type;
     size = ( ! ) r_size;
     storage_class = ( ! ) r_storage_class;
     key = ( ! ) r_key;
     version_id = ( ! ) r_version_id;
     is_latest = ( ! ) r_is_latest;
     last_modified = ( ! ) r_last_modified;
     owner = ( ! ) r_owner;
     restore_status = ( ! ) r_restore_status;
   }
    : object_version)

let object_version_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> object_version_of_xml i attrs) ()

let next_version_id_marker_of_xml i attrs = Read.data i
let next_key_marker_of_xml i attrs = Read.data i
let version_id_marker_of_xml i attrs = Read.data i
let key_marker_of_xml i attrs = Read.data i

let list_object_versions_output_of_xml i attrs =
  let r_is_truncated = ref None in
  let r_key_marker = ref None in
  let r_version_id_marker = ref None in
  let r_next_key_marker = ref None in
  let r_next_version_id_marker = ref None in
  let r_versions = ref None in
  let r_delete_markers = ref None in
  let r_name = ref None in
  let r_prefix = ref None in
  let r_delimiter = ref None in
  let r_max_keys = ref None in
  let r_common_prefixes = ref None in
  let r_encoding_type = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "IsTruncated";
      "KeyMarker";
      "VersionIdMarker";
      "NextKeyMarker";
      "NextVersionIdMarker";
      "Version";
      "DeleteMarker";
      "Name";
      "Prefix";
      "Delimiter";
      "MaxKeys";
      "CommonPrefixes";
      "EncodingType";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "KeyMarker" ->
          r_key_marker :=
            Some (Read.sequence i "KeyMarker" (fun i attrs -> key_marker_of_xml i attrs) ())
      | "VersionIdMarker" ->
          r_version_id_marker :=
            Some
              (Read.sequence i "VersionIdMarker"
                 (fun i attrs -> version_id_marker_of_xml i attrs)
                 ())
      | "NextKeyMarker" ->
          r_next_key_marker :=
            Some
              (Read.sequence i "NextKeyMarker" (fun i attrs -> next_key_marker_of_xml i attrs) ())
      | "NextVersionIdMarker" ->
          r_next_version_id_marker :=
            Some
              (Read.sequence i "NextVersionIdMarker"
                 (fun i attrs -> next_version_id_marker_of_xml i attrs)
                 ())
      | "Version" ->
          r_versions :=
            Some (Read.sequences i "Version" (fun i attrs -> object_version_of_xml i attrs) ())
      | "DeleteMarker" ->
          r_delete_markers :=
            Some
              (Read.sequences i "DeleteMarker"
                 (fun i attrs -> delete_marker_entry_of_xml i attrs)
                 ())
      | "Name" ->
          r_name := Some (Read.sequence i "Name" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "MaxKeys" ->
          r_max_keys := Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
      | "CommonPrefixes" ->
          r_common_prefixes :=
            Some
              (Read.sequences i "CommonPrefixes" (fun i attrs -> common_prefix_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     is_truncated = ( ! ) r_is_truncated;
     key_marker = ( ! ) r_key_marker;
     version_id_marker = ( ! ) r_version_id_marker;
     next_key_marker = ( ! ) r_next_key_marker;
     next_version_id_marker = ( ! ) r_next_version_id_marker;
     versions = ( ! ) r_versions;
     delete_markers = ( ! ) r_delete_markers;
     name = ( ! ) r_name;
     prefix = ( ! ) r_prefix;
     delimiter = ( ! ) r_delimiter;
     max_keys = ( ! ) r_max_keys;
     common_prefixes = ( ! ) r_common_prefixes;
     encoding_type = ( ! ) r_encoding_type;
     request_charged = ( ! ) r_request_charged;
   }
    : list_object_versions_output)

let optional_object_attributes_of_xml i attrs =
  let s = Read.data i in
  (match s with "RestoreStatus" -> RESTORE_STATUS | _ -> failwith "unknown enum value"
    : optional_object_attributes)

let optional_object_attributes_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> optional_object_attributes_of_xml i attrs) ()

let list_object_versions_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_delimiter = ref None in
  let r_encoding_type = ref None in
  let r_key_marker = ref None in
  let r_max_keys = ref None in
  let r_prefix = ref None in
  let r_version_id_marker = ref None in
  let r_expected_bucket_owner = ref None in
  let r_request_payer = ref None in
  let r_optional_object_attributes = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Delimiter";
      "EncodingType";
      "KeyMarker";
      "MaxKeys";
      "Prefix";
      "VersionIdMarker";
      "ExpectedBucketOwner";
      "RequestPayer";
      "OptionalObjectAttributes";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "KeyMarker" ->
          r_key_marker :=
            Some (Read.sequence i "KeyMarker" (fun i attrs -> key_marker_of_xml i attrs) ())
      | "MaxKeys" ->
          r_max_keys := Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "VersionIdMarker" ->
          r_version_id_marker :=
            Some
              (Read.sequence i "VersionIdMarker"
                 (fun i attrs -> version_id_marker_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "OptionalObjectAttributes" ->
          r_optional_object_attributes :=
            Some
              (Read.sequence i "OptionalObjectAttributes"
                 (fun i attrs ->
                   Read.sequences i "member"
                     (fun i attrs -> optional_object_attributes_of_xml i attrs)
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     delimiter = ( ! ) r_delimiter;
     encoding_type = ( ! ) r_encoding_type;
     key_marker = ( ! ) r_key_marker;
     max_keys = ( ! ) r_max_keys;
     prefix = ( ! ) r_prefix;
     version_id_marker = ( ! ) r_version_id_marker;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     request_payer = ( ! ) r_request_payer;
     optional_object_attributes = ( ! ) r_optional_object_attributes;
   }
    : list_object_versions_request)

let start_after_of_xml i attrs = Read.data i
let next_token_of_xml i attrs = Read.data i
let token_of_xml i attrs = Read.data i
let key_count_of_xml i attrs = Primitive.int_of_string (Read.data i)

let object_storage_class_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "STANDARD" -> STANDARD
   | "REDUCED_REDUNDANCY" -> REDUCED_REDUNDANCY
   | "GLACIER" -> GLACIER
   | "STANDARD_IA" -> STANDARD_IA
   | "ONEZONE_IA" -> ONEZONE_IA
   | "INTELLIGENT_TIERING" -> INTELLIGENT_TIERING
   | "DEEP_ARCHIVE" -> DEEP_ARCHIVE
   | "OUTPOSTS" -> OUTPOSTS
   | "GLACIER_IR" -> GLACIER_IR
   | "SNOW" -> SNOW
   | "EXPRESS_ONEZONE" -> EXPRESS_ONEZONE
   | "FSX_OPENZFS" -> FSX_OPENZFS
   | "FSX_ONTAP" -> FSX_ONTAP
   | _ -> failwith "unknown enum value"
    : object_storage_class)

let object__of_xml i attrs =
  let r_key = ref None in
  let r_last_modified = ref None in
  let r_e_tag = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_type = ref None in
  let r_size = ref None in
  let r_storage_class = ref None in
  let r_owner = ref None in
  let r_restore_status = ref None in
  Structure.scanSequence i
    [
      "Key";
      "LastModified";
      "ETag";
      "ChecksumAlgorithm";
      "ChecksumType";
      "Size";
      "StorageClass";
      "Owner";
      "RestoreStatus";
    ] (fun tag _ ->
      match tag with
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequences i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "Size" -> r_size := Some (Read.sequence i "Size" (fun i attrs -> size_of_xml i attrs) ())
      | "StorageClass" ->
          r_storage_class :=
            Some
              (Read.sequence i "StorageClass"
                 (fun i attrs -> object_storage_class_of_xml i attrs)
                 ())
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "RestoreStatus" ->
          r_restore_status :=
            Some (Read.sequence i "RestoreStatus" (fun i attrs -> restore_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     key = ( ! ) r_key;
     last_modified = ( ! ) r_last_modified;
     e_tag = ( ! ) r_e_tag;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_type = ( ! ) r_checksum_type;
     size = ( ! ) r_size;
     storage_class = ( ! ) r_storage_class;
     owner = ( ! ) r_owner;
     restore_status = ( ! ) r_restore_status;
   }
    : object_)

let object_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> object__of_xml i attrs) ()

let list_objects_v2_output_of_xml i attrs =
  let r_is_truncated = ref None in
  let r_contents = ref None in
  let r_name = ref None in
  let r_prefix = ref None in
  let r_delimiter = ref None in
  let r_max_keys = ref None in
  let r_common_prefixes = ref None in
  let r_encoding_type = ref None in
  let r_key_count = ref None in
  let r_continuation_token = ref None in
  let r_next_continuation_token = ref None in
  let r_start_after = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "IsTruncated";
      "Contents";
      "Name";
      "Prefix";
      "Delimiter";
      "MaxKeys";
      "CommonPrefixes";
      "EncodingType";
      "KeyCount";
      "ContinuationToken";
      "NextContinuationToken";
      "StartAfter";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "Contents" ->
          r_contents :=
            Some (Read.sequences i "Contents" (fun i attrs -> object__of_xml i attrs) ())
      | "Name" ->
          r_name := Some (Read.sequence i "Name" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "MaxKeys" ->
          r_max_keys := Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
      | "CommonPrefixes" ->
          r_common_prefixes :=
            Some
              (Read.sequences i "CommonPrefixes" (fun i attrs -> common_prefix_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "KeyCount" ->
          r_key_count :=
            Some (Read.sequence i "KeyCount" (fun i attrs -> key_count_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "NextContinuationToken" ->
          r_next_continuation_token :=
            Some
              (Read.sequence i "NextContinuationToken"
                 (fun i attrs -> next_token_of_xml i attrs)
                 ())
      | "StartAfter" ->
          r_start_after :=
            Some (Read.sequence i "StartAfter" (fun i attrs -> start_after_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     is_truncated = ( ! ) r_is_truncated;
     contents = ( ! ) r_contents;
     name = ( ! ) r_name;
     prefix = ( ! ) r_prefix;
     delimiter = ( ! ) r_delimiter;
     max_keys = ( ! ) r_max_keys;
     common_prefixes = ( ! ) r_common_prefixes;
     encoding_type = ( ! ) r_encoding_type;
     key_count = ( ! ) r_key_count;
     continuation_token = ( ! ) r_continuation_token;
     next_continuation_token = ( ! ) r_next_continuation_token;
     start_after = ( ! ) r_start_after;
     request_charged = ( ! ) r_request_charged;
   }
    : list_objects_v2_output)

let fetch_owner_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let list_objects_v2_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_delimiter = ref None in
  let r_encoding_type = ref None in
  let r_max_keys = ref None in
  let r_prefix = ref None in
  let r_continuation_token = ref None in
  let r_fetch_owner = ref None in
  let r_start_after = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_optional_object_attributes = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Delimiter";
      "EncodingType";
      "MaxKeys";
      "Prefix";
      "ContinuationToken";
      "FetchOwner";
      "StartAfter";
      "RequestPayer";
      "ExpectedBucketOwner";
      "OptionalObjectAttributes";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "MaxKeys" ->
          r_max_keys := Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "FetchOwner" ->
          r_fetch_owner :=
            Some (Read.sequence i "FetchOwner" (fun i attrs -> fetch_owner_of_xml i attrs) ())
      | "StartAfter" ->
          r_start_after :=
            Some (Read.sequence i "StartAfter" (fun i attrs -> start_after_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "OptionalObjectAttributes" ->
          r_optional_object_attributes :=
            Some
              (Read.sequence i "OptionalObjectAttributes"
                 (fun i attrs ->
                   Read.sequences i "member"
                     (fun i attrs -> optional_object_attributes_of_xml i attrs)
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     delimiter = ( ! ) r_delimiter;
     encoding_type = ( ! ) r_encoding_type;
     max_keys = ( ! ) r_max_keys;
     prefix = ( ! ) r_prefix;
     continuation_token = ( ! ) r_continuation_token;
     fetch_owner = ( ! ) r_fetch_owner;
     start_after = ( ! ) r_start_after;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     optional_object_attributes = ( ! ) r_optional_object_attributes;
   }
    : list_objects_v2_request)

let next_marker_of_xml i attrs = Read.data i
let marker_of_xml i attrs = Read.data i

let list_objects_output_of_xml i attrs =
  let r_is_truncated = ref None in
  let r_marker = ref None in
  let r_next_marker = ref None in
  let r_contents = ref None in
  let r_name = ref None in
  let r_prefix = ref None in
  let r_delimiter = ref None in
  let r_max_keys = ref None in
  let r_common_prefixes = ref None in
  let r_encoding_type = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "IsTruncated";
      "Marker";
      "NextMarker";
      "Contents";
      "Name";
      "Prefix";
      "Delimiter";
      "MaxKeys";
      "CommonPrefixes";
      "EncodingType";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "Marker" ->
          r_marker := Some (Read.sequence i "Marker" (fun i attrs -> marker_of_xml i attrs) ())
      | "NextMarker" ->
          r_next_marker :=
            Some (Read.sequence i "NextMarker" (fun i attrs -> next_marker_of_xml i attrs) ())
      | "Contents" ->
          r_contents :=
            Some (Read.sequences i "Contents" (fun i attrs -> object__of_xml i attrs) ())
      | "Name" ->
          r_name := Some (Read.sequence i "Name" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "MaxKeys" ->
          r_max_keys := Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
      | "CommonPrefixes" ->
          r_common_prefixes :=
            Some
              (Read.sequences i "CommonPrefixes" (fun i attrs -> common_prefix_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     is_truncated = ( ! ) r_is_truncated;
     marker = ( ! ) r_marker;
     next_marker = ( ! ) r_next_marker;
     contents = ( ! ) r_contents;
     name = ( ! ) r_name;
     prefix = ( ! ) r_prefix;
     delimiter = ( ! ) r_delimiter;
     max_keys = ( ! ) r_max_keys;
     common_prefixes = ( ! ) r_common_prefixes;
     encoding_type = ( ! ) r_encoding_type;
     request_charged = ( ! ) r_request_charged;
   }
    : list_objects_output)

let list_objects_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_delimiter = ref None in
  let r_encoding_type = ref None in
  let r_marker = ref None in
  let r_max_keys = ref None in
  let r_prefix = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_optional_object_attributes = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Delimiter";
      "EncodingType";
      "Marker";
      "MaxKeys";
      "Prefix";
      "RequestPayer";
      "ExpectedBucketOwner";
      "OptionalObjectAttributes";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "Marker" ->
          r_marker := Some (Read.sequence i "Marker" (fun i attrs -> marker_of_xml i attrs) ())
      | "MaxKeys" ->
          r_max_keys := Some (Read.sequence i "MaxKeys" (fun i attrs -> max_keys_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "OptionalObjectAttributes" ->
          r_optional_object_attributes :=
            Some
              (Read.sequence i "OptionalObjectAttributes"
                 (fun i attrs ->
                   Read.sequences i "member"
                     (fun i attrs -> optional_object_attributes_of_xml i attrs)
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     delimiter = ( ! ) r_delimiter;
     encoding_type = ( ! ) r_encoding_type;
     marker = ( ! ) r_marker;
     max_keys = ( ! ) r_max_keys;
     prefix = ( ! ) r_prefix;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     optional_object_attributes = ( ! ) r_optional_object_attributes;
   }
    : list_objects_request)

let invalid_prefix_of_xml i attrs = ()
let annotation_count_of_xml i attrs = Primitive.int_of_string (Read.data i)
let max_annotation_results_of_xml i attrs = Primitive.int_of_string (Read.data i)
let annotation_prefix_of_xml i attrs = Read.data i

let annotation_entry_of_xml i attrs =
  let r_annotation_name = ref None in
  let r_last_modified = ref None in
  let r_e_tag = ref None in
  let r_checksum_algorithm = ref None in
  let r_size = ref None in
  let r_replication_status = ref None in
  Structure.scanSequence i
    [ "AnnotationName"; "LastModified"; "ETag"; "ChecksumAlgorithm"; "Size"; "ReplicationStatus" ]
    (fun tag _ ->
      match tag with
      | "AnnotationName" ->
          r_annotation_name :=
            Some
              (Read.sequence i "AnnotationName" (fun i attrs -> annotation_name_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequences i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "Size" -> r_size := Some (Read.sequence i "Size" (fun i attrs -> size_of_xml i attrs) ())
      | "ReplicationStatus" ->
          r_replication_status :=
            Some
              (Read.sequence i "ReplicationStatus"
                 (fun i attrs -> replication_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     annotation_name = required "AnnotationName" (( ! ) r_annotation_name) i;
     last_modified = required "LastModified" (( ! ) r_last_modified) i;
     e_tag = ( ! ) r_e_tag;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     size = required "Size" (( ! ) r_size) i;
     replication_status = ( ! ) r_replication_status;
   }
    : annotation_entry)

let annotation_list_of_xml i attrs =
  Read.sequences i "AnnotationEntry" (fun i attrs -> annotation_entry_of_xml i attrs) ()

let list_object_annotations_output_of_xml i attrs =
  let r_annotations = ref None in
  let r_bucket = ref None in
  let r_key = ref None in
  let r_object_version_id = ref None in
  let r_annotation_prefix = ref None in
  let r_max_annotation_results = ref None in
  let r_annotation_count = ref None in
  let r_continuation_token = ref None in
  let r_next_continuation_token = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "Annotations";
      "Bucket";
      "Key";
      "ObjectVersionId";
      "AnnotationPrefix";
      "MaxAnnotationResults";
      "AnnotationCount";
      "ContinuationToken";
      "NextContinuationToken";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "Annotations" ->
          r_annotations :=
            Some
              (Read.sequence i "Annotations"
                 (fun i attrs ->
                   Read.sequences i "AnnotationEntry"
                     (fun i attrs -> annotation_entry_of_xml i attrs)
                     ())
                 ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "ObjectVersionId" ->
          r_object_version_id :=
            Some
              (Read.sequence i "ObjectVersionId"
                 (fun i attrs -> object_version_id_of_xml i attrs)
                 ())
      | "AnnotationPrefix" ->
          r_annotation_prefix :=
            Some
              (Read.sequence i "AnnotationPrefix"
                 (fun i attrs -> annotation_prefix_of_xml i attrs)
                 ())
      | "MaxAnnotationResults" ->
          r_max_annotation_results :=
            Some
              (Read.sequence i "MaxAnnotationResults"
                 (fun i attrs -> max_annotation_results_of_xml i attrs)
                 ())
      | "AnnotationCount" ->
          r_annotation_count :=
            Some
              (Read.sequence i "AnnotationCount"
                 (fun i attrs -> annotation_count_of_xml i attrs)
                 ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "NextContinuationToken" ->
          r_next_continuation_token :=
            Some
              (Read.sequence i "NextContinuationToken"
                 (fun i attrs -> next_token_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     annotations = ( ! ) r_annotations;
     bucket = ( ! ) r_bucket;
     key = ( ! ) r_key;
     object_version_id = ( ! ) r_object_version_id;
     annotation_prefix = ( ! ) r_annotation_prefix;
     max_annotation_results = ( ! ) r_max_annotation_results;
     annotation_count = ( ! ) r_annotation_count;
     continuation_token = ( ! ) r_continuation_token;
     next_continuation_token = ( ! ) r_next_continuation_token;
     request_charged = ( ! ) r_request_charged;
   }
    : list_object_annotations_output)

let list_object_annotations_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_max_annotation_results = ref None in
  let r_annotation_prefix = ref None in
  let r_continuation_token = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "VersionId";
      "MaxAnnotationResults";
      "AnnotationPrefix";
      "ContinuationToken";
      "RequestPayer";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "MaxAnnotationResults" ->
          r_max_annotation_results :=
            Some
              (Read.sequence i "MaxAnnotationResults"
                 (fun i attrs -> max_annotation_results_of_xml i attrs)
                 ())
      | "AnnotationPrefix" ->
          r_annotation_prefix :=
            Some
              (Read.sequence i "AnnotationPrefix"
                 (fun i attrs -> annotation_prefix_of_xml i attrs)
                 ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     max_annotation_results = ( ! ) r_max_annotation_results;
     annotation_prefix = ( ! ) r_annotation_prefix;
     continuation_token = ( ! ) r_continuation_token;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : list_object_annotations_request)

let initiated_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)

let multipart_upload_of_xml i attrs =
  let r_upload_id = ref None in
  let r_key = ref None in
  let r_initiated = ref None in
  let r_storage_class = ref None in
  let r_owner = ref None in
  let r_initiator = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_type = ref None in
  Structure.scanSequence i
    [
      "UploadId";
      "Key";
      "Initiated";
      "StorageClass";
      "Owner";
      "Initiator";
      "ChecksumAlgorithm";
      "ChecksumType";
    ] (fun tag _ ->
      match tag with
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Initiated" ->
          r_initiated :=
            Some (Read.sequence i "Initiated" (fun i attrs -> initiated_of_xml i attrs) ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "Initiator" ->
          r_initiator :=
            Some (Read.sequence i "Initiator" (fun i attrs -> initiator_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     upload_id = ( ! ) r_upload_id;
     key = ( ! ) r_key;
     initiated = ( ! ) r_initiated;
     storage_class = ( ! ) r_storage_class;
     owner = ( ! ) r_owner;
     initiator = ( ! ) r_initiator;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_type = ( ! ) r_checksum_type;
   }
    : multipart_upload)

let multipart_upload_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> multipart_upload_of_xml i attrs) ()

let max_uploads_of_xml i attrs = Primitive.int_of_string (Read.data i)
let next_upload_id_marker_of_xml i attrs = Read.data i
let upload_id_marker_of_xml i attrs = Read.data i

let list_multipart_uploads_output_of_xml i attrs =
  let r_bucket = ref None in
  let r_key_marker = ref None in
  let r_upload_id_marker = ref None in
  let r_next_key_marker = ref None in
  let r_prefix = ref None in
  let r_delimiter = ref None in
  let r_next_upload_id_marker = ref None in
  let r_max_uploads = ref None in
  let r_is_truncated = ref None in
  let r_uploads = ref None in
  let r_common_prefixes = ref None in
  let r_encoding_type = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "KeyMarker";
      "UploadIdMarker";
      "NextKeyMarker";
      "Prefix";
      "Delimiter";
      "NextUploadIdMarker";
      "MaxUploads";
      "IsTruncated";
      "Upload";
      "CommonPrefixes";
      "EncodingType";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "KeyMarker" ->
          r_key_marker :=
            Some (Read.sequence i "KeyMarker" (fun i attrs -> key_marker_of_xml i attrs) ())
      | "UploadIdMarker" ->
          r_upload_id_marker :=
            Some
              (Read.sequence i "UploadIdMarker" (fun i attrs -> upload_id_marker_of_xml i attrs) ())
      | "NextKeyMarker" ->
          r_next_key_marker :=
            Some
              (Read.sequence i "NextKeyMarker" (fun i attrs -> next_key_marker_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "NextUploadIdMarker" ->
          r_next_upload_id_marker :=
            Some
              (Read.sequence i "NextUploadIdMarker"
                 (fun i attrs -> next_upload_id_marker_of_xml i attrs)
                 ())
      | "MaxUploads" ->
          r_max_uploads :=
            Some (Read.sequence i "MaxUploads" (fun i attrs -> max_uploads_of_xml i attrs) ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "Upload" ->
          r_uploads :=
            Some (Read.sequences i "Upload" (fun i attrs -> multipart_upload_of_xml i attrs) ())
      | "CommonPrefixes" ->
          r_common_prefixes :=
            Some
              (Read.sequences i "CommonPrefixes" (fun i attrs -> common_prefix_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = ( ! ) r_bucket;
     key_marker = ( ! ) r_key_marker;
     upload_id_marker = ( ! ) r_upload_id_marker;
     next_key_marker = ( ! ) r_next_key_marker;
     prefix = ( ! ) r_prefix;
     delimiter = ( ! ) r_delimiter;
     next_upload_id_marker = ( ! ) r_next_upload_id_marker;
     max_uploads = ( ! ) r_max_uploads;
     is_truncated = ( ! ) r_is_truncated;
     uploads = ( ! ) r_uploads;
     common_prefixes = ( ! ) r_common_prefixes;
     encoding_type = ( ! ) r_encoding_type;
     request_charged = ( ! ) r_request_charged;
   }
    : list_multipart_uploads_output)

let list_multipart_uploads_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_delimiter = ref None in
  let r_encoding_type = ref None in
  let r_key_marker = ref None in
  let r_max_uploads = ref None in
  let r_prefix = ref None in
  let r_upload_id_marker = ref None in
  let r_expected_bucket_owner = ref None in
  let r_request_payer = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Delimiter";
      "EncodingType";
      "KeyMarker";
      "MaxUploads";
      "Prefix";
      "UploadIdMarker";
      "ExpectedBucketOwner";
      "RequestPayer";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Delimiter" ->
          r_delimiter :=
            Some (Read.sequence i "Delimiter" (fun i attrs -> delimiter_of_xml i attrs) ())
      | "EncodingType" ->
          r_encoding_type :=
            Some (Read.sequence i "EncodingType" (fun i attrs -> encoding_type_of_xml i attrs) ())
      | "KeyMarker" ->
          r_key_marker :=
            Some (Read.sequence i "KeyMarker" (fun i attrs -> key_marker_of_xml i attrs) ())
      | "MaxUploads" ->
          r_max_uploads :=
            Some (Read.sequence i "MaxUploads" (fun i attrs -> max_uploads_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "UploadIdMarker" ->
          r_upload_id_marker :=
            Some
              (Read.sequence i "UploadIdMarker" (fun i attrs -> upload_id_marker_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     delimiter = ( ! ) r_delimiter;
     encoding_type = ( ! ) r_encoding_type;
     key_marker = ( ! ) r_key_marker;
     max_uploads = ( ! ) r_max_uploads;
     prefix = ( ! ) r_prefix;
     upload_id_marker = ( ! ) r_upload_id_marker;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     request_payer = ( ! ) r_request_payer;
   }
    : list_multipart_uploads_request)

let directory_bucket_token_of_xml i attrs = Read.data i
let s3_regional_or_s3_express_bucket_arn_string_of_xml i attrs = Read.data i
let bucket_region_of_xml i attrs = Read.data i
let creation_date_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)

let bucket_of_xml i attrs =
  let r_name = ref None in
  let r_creation_date = ref None in
  let r_bucket_region = ref None in
  let r_bucket_arn = ref None in
  Structure.scanSequence i [ "Name"; "CreationDate"; "BucketRegion"; "BucketArn" ] (fun tag _ ->
      match tag with
      | "Name" ->
          r_name := Some (Read.sequence i "Name" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "CreationDate" ->
          r_creation_date :=
            Some (Read.sequence i "CreationDate" (fun i attrs -> creation_date_of_xml i attrs) ())
      | "BucketRegion" ->
          r_bucket_region :=
            Some (Read.sequence i "BucketRegion" (fun i attrs -> bucket_region_of_xml i attrs) ())
      | "BucketArn" ->
          r_bucket_arn :=
            Some
              (Read.sequence i "BucketArn"
                 (fun i attrs -> s3_regional_or_s3_express_bucket_arn_string_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     name = ( ! ) r_name;
     creation_date = ( ! ) r_creation_date;
     bucket_region = ( ! ) r_bucket_region;
     bucket_arn = ( ! ) r_bucket_arn;
   }
    : bucket)

let buckets_of_xml i attrs = Read.sequences i "Bucket" (fun i attrs -> bucket_of_xml i attrs) ()

let list_directory_buckets_output_of_xml i attrs =
  let r_buckets = ref None in
  let r_continuation_token = ref None in
  Structure.scanSequence i [ "Buckets"; "ContinuationToken" ] (fun tag _ ->
      match tag with
      | "Buckets" ->
          r_buckets :=
            Some
              (Read.sequence i "Buckets"
                 (fun i attrs ->
                   Read.sequences i "Bucket" (fun i attrs -> bucket_of_xml i attrs) ())
                 ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some
              (Read.sequence i "ContinuationToken"
                 (fun i attrs -> directory_bucket_token_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ buckets = ( ! ) r_buckets; continuation_token = ( ! ) r_continuation_token }
    : list_directory_buckets_output)

let max_directory_buckets_of_xml i attrs = Primitive.int_of_string (Read.data i)

let list_directory_buckets_request_of_xml i attrs =
  let r_continuation_token = ref None in
  let r_max_directory_buckets = ref None in
  Structure.scanSequence i [ "ContinuationToken"; "MaxDirectoryBuckets" ] (fun tag _ ->
      match tag with
      | "ContinuationToken" ->
          r_continuation_token :=
            Some
              (Read.sequence i "ContinuationToken"
                 (fun i attrs -> directory_bucket_token_of_xml i attrs)
                 ())
      | "MaxDirectoryBuckets" ->
          r_max_directory_buckets :=
            Some
              (Read.sequence i "MaxDirectoryBuckets"
                 (fun i attrs -> max_directory_buckets_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     continuation_token = ( ! ) r_continuation_token;
     max_directory_buckets = ( ! ) r_max_directory_buckets;
   }
    : list_directory_buckets_request)

let list_buckets_output_of_xml i attrs =
  let r_buckets = ref None in
  let r_owner = ref None in
  let r_continuation_token = ref None in
  let r_prefix = ref None in
  Structure.scanSequence i [ "Buckets"; "Owner"; "ContinuationToken"; "Prefix" ] (fun tag _ ->
      match tag with
      | "Buckets" ->
          r_buckets :=
            Some
              (Read.sequence i "Buckets"
                 (fun i attrs ->
                   Read.sequences i "Bucket" (fun i attrs -> bucket_of_xml i attrs) ())
                 ())
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> next_token_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     buckets = ( ! ) r_buckets;
     owner = ( ! ) r_owner;
     continuation_token = ( ! ) r_continuation_token;
     prefix = ( ! ) r_prefix;
   }
    : list_buckets_output)

let max_buckets_of_xml i attrs = Primitive.int_of_string (Read.data i)

let list_buckets_request_of_xml i attrs =
  let r_max_buckets = ref None in
  let r_continuation_token = ref None in
  let r_prefix = ref None in
  let r_bucket_region = ref None in
  Structure.scanSequence i [ "MaxBuckets"; "ContinuationToken"; "Prefix"; "BucketRegion" ]
    (fun tag _ ->
      match tag with
      | "MaxBuckets" ->
          r_max_buckets :=
            Some (Read.sequence i "MaxBuckets" (fun i attrs -> max_buckets_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "Prefix" ->
          r_prefix := Some (Read.sequence i "Prefix" (fun i attrs -> prefix_of_xml i attrs) ())
      | "BucketRegion" ->
          r_bucket_region :=
            Some (Read.sequence i "BucketRegion" (fun i attrs -> bucket_region_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     max_buckets = ( ! ) r_max_buckets;
     continuation_token = ( ! ) r_continuation_token;
     prefix = ( ! ) r_prefix;
     bucket_region = ( ! ) r_bucket_region;
   }
    : list_buckets_request)

let metrics_configuration_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> metrics_configuration_of_xml i attrs) ()

let list_bucket_metrics_configurations_output_of_xml i attrs =
  let r_is_truncated = ref None in
  let r_continuation_token = ref None in
  let r_next_continuation_token = ref None in
  let r_metrics_configuration_list = ref None in
  Structure.scanSequence i
    [ "IsTruncated"; "ContinuationToken"; "NextContinuationToken"; "MetricsConfiguration" ]
    (fun tag _ ->
      match tag with
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "NextContinuationToken" ->
          r_next_continuation_token :=
            Some
              (Read.sequence i "NextContinuationToken"
                 (fun i attrs -> next_token_of_xml i attrs)
                 ())
      | "MetricsConfiguration" ->
          r_metrics_configuration_list :=
            Some
              (Read.sequences i "MetricsConfiguration"
                 (fun i attrs -> metrics_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     is_truncated = ( ! ) r_is_truncated;
     continuation_token = ( ! ) r_continuation_token;
     next_continuation_token = ( ! ) r_next_continuation_token;
     metrics_configuration_list = ( ! ) r_metrics_configuration_list;
   }
    : list_bucket_metrics_configurations_output)

let list_bucket_metrics_configurations_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_continuation_token = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ContinuationToken"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     continuation_token = ( ! ) r_continuation_token;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : list_bucket_metrics_configurations_request)

let inventory_configuration_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> inventory_configuration_of_xml i attrs) ()

let list_bucket_inventory_configurations_output_of_xml i attrs =
  let r_continuation_token = ref None in
  let r_inventory_configuration_list = ref None in
  let r_is_truncated = ref None in
  let r_next_continuation_token = ref None in
  Structure.scanSequence i
    [ "ContinuationToken"; "InventoryConfiguration"; "IsTruncated"; "NextContinuationToken" ]
    (fun tag _ ->
      match tag with
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "InventoryConfiguration" ->
          r_inventory_configuration_list :=
            Some
              (Read.sequences i "InventoryConfiguration"
                 (fun i attrs -> inventory_configuration_of_xml i attrs)
                 ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "NextContinuationToken" ->
          r_next_continuation_token :=
            Some
              (Read.sequence i "NextContinuationToken"
                 (fun i attrs -> next_token_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     continuation_token = ( ! ) r_continuation_token;
     inventory_configuration_list = ( ! ) r_inventory_configuration_list;
     is_truncated = ( ! ) r_is_truncated;
     next_continuation_token = ( ! ) r_next_continuation_token;
   }
    : list_bucket_inventory_configurations_output)

let list_bucket_inventory_configurations_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_continuation_token = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ContinuationToken"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     continuation_token = ( ! ) r_continuation_token;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : list_bucket_inventory_configurations_request)

let intelligent_tiering_configuration_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> intelligent_tiering_configuration_of_xml i attrs) ()

let list_bucket_intelligent_tiering_configurations_output_of_xml i attrs =
  let r_is_truncated = ref None in
  let r_continuation_token = ref None in
  let r_next_continuation_token = ref None in
  let r_intelligent_tiering_configuration_list = ref None in
  Structure.scanSequence i
    [
      "IsTruncated"; "ContinuationToken"; "NextContinuationToken"; "IntelligentTieringConfiguration";
    ] (fun tag _ ->
      match tag with
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "NextContinuationToken" ->
          r_next_continuation_token :=
            Some
              (Read.sequence i "NextContinuationToken"
                 (fun i attrs -> next_token_of_xml i attrs)
                 ())
      | "IntelligentTieringConfiguration" ->
          r_intelligent_tiering_configuration_list :=
            Some
              (Read.sequences i "IntelligentTieringConfiguration"
                 (fun i attrs -> intelligent_tiering_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     is_truncated = ( ! ) r_is_truncated;
     continuation_token = ( ! ) r_continuation_token;
     next_continuation_token = ( ! ) r_next_continuation_token;
     intelligent_tiering_configuration_list = ( ! ) r_intelligent_tiering_configuration_list;
   }
    : list_bucket_intelligent_tiering_configurations_output)

let list_bucket_intelligent_tiering_configurations_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_continuation_token = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ContinuationToken"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     continuation_token = ( ! ) r_continuation_token;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : list_bucket_intelligent_tiering_configurations_request)

let analytics_configuration_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> analytics_configuration_of_xml i attrs) ()

let list_bucket_analytics_configurations_output_of_xml i attrs =
  let r_is_truncated = ref None in
  let r_continuation_token = ref None in
  let r_next_continuation_token = ref None in
  let r_analytics_configuration_list = ref None in
  Structure.scanSequence i
    [ "IsTruncated"; "ContinuationToken"; "NextContinuationToken"; "AnalyticsConfiguration" ]
    (fun tag _ ->
      match tag with
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "NextContinuationToken" ->
          r_next_continuation_token :=
            Some
              (Read.sequence i "NextContinuationToken"
                 (fun i attrs -> next_token_of_xml i attrs)
                 ())
      | "AnalyticsConfiguration" ->
          r_analytics_configuration_list :=
            Some
              (Read.sequences i "AnalyticsConfiguration"
                 (fun i attrs -> analytics_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     is_truncated = ( ! ) r_is_truncated;
     continuation_token = ( ! ) r_continuation_token;
     next_continuation_token = ( ! ) r_next_continuation_token;
     analytics_configuration_list = ( ! ) r_analytics_configuration_list;
   }
    : list_bucket_analytics_configurations_output)

let list_bucket_analytics_configurations_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_continuation_token = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ContinuationToken"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContinuationToken" ->
          r_continuation_token :=
            Some (Read.sequence i "ContinuationToken" (fun i attrs -> token_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     continuation_token = ( ! ) r_continuation_token;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : list_bucket_analytics_configurations_request)

let not_found_of_xml i attrs = ()

let archive_status_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "ARCHIVE_ACCESS" -> ARCHIVE_ACCESS
   | "DEEP_ARCHIVE_ACCESS" -> DEEP_ARCHIVE_ACCESS
   | _ -> failwith "unknown enum value"
    : archive_status)

let head_object_output_of_xml i attrs =
  let r_delete_marker = ref None in
  let r_accept_ranges = ref None in
  let r_expiration = ref None in
  let r_restore = ref None in
  let r_archive_status = ref None in
  let r_last_modified = ref None in
  let r_content_length = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  let r_e_tag = ref None in
  let r_missing_meta = ref None in
  let r_version_id = ref None in
  let r_cache_control = ref None in
  let r_content_disposition = ref None in
  let r_content_encoding = ref None in
  let r_content_language = ref None in
  let r_content_type = ref None in
  let r_content_range = ref None in
  let r_expires = ref None in
  let r_website_redirect_location = ref None in
  let r_server_side_encryption = ref None in
  let r_metadata = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_bucket_key_enabled = ref None in
  let r_storage_class = ref None in
  let r_request_charged = ref None in
  let r_replication_status = ref None in
  let r_parts_count = ref None in
  let r_tag_count = ref None in
  let r_object_lock_mode = ref None in
  let r_object_lock_retain_until_date = ref None in
  let r_object_lock_legal_hold_status = ref None in
  Structure.scanSequence i
    [
      "DeleteMarker";
      "AcceptRanges";
      "Expiration";
      "Restore";
      "ArchiveStatus";
      "LastModified";
      "ContentLength";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
      "ETag";
      "MissingMeta";
      "VersionId";
      "CacheControl";
      "ContentDisposition";
      "ContentEncoding";
      "ContentLanguage";
      "ContentType";
      "ContentRange";
      "Expires";
      "WebsiteRedirectLocation";
      "ServerSideEncryption";
      "Metadata";
      "SSECustomerAlgorithm";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "BucketKeyEnabled";
      "StorageClass";
      "RequestCharged";
      "ReplicationStatus";
      "PartsCount";
      "TagCount";
      "ObjectLockMode";
      "ObjectLockRetainUntilDate";
      "ObjectLockLegalHoldStatus";
    ] (fun tag _ ->
      match tag with
      | "DeleteMarker" ->
          r_delete_marker :=
            Some (Read.sequence i "DeleteMarker" (fun i attrs -> delete_marker_of_xml i attrs) ())
      | "AcceptRanges" ->
          r_accept_ranges :=
            Some (Read.sequence i "AcceptRanges" (fun i attrs -> accept_ranges_of_xml i attrs) ())
      | "Expiration" ->
          r_expiration :=
            Some (Read.sequence i "Expiration" (fun i attrs -> expiration_of_xml i attrs) ())
      | "Restore" ->
          r_restore := Some (Read.sequence i "Restore" (fun i attrs -> restore_of_xml i attrs) ())
      | "ArchiveStatus" ->
          r_archive_status :=
            Some (Read.sequence i "ArchiveStatus" (fun i attrs -> archive_status_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ContentLength" ->
          r_content_length :=
            Some (Read.sequence i "ContentLength" (fun i attrs -> content_length_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "MissingMeta" ->
          r_missing_meta :=
            Some (Read.sequence i "MissingMeta" (fun i attrs -> missing_meta_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "CacheControl" ->
          r_cache_control :=
            Some (Read.sequence i "CacheControl" (fun i attrs -> cache_control_of_xml i attrs) ())
      | "ContentDisposition" ->
          r_content_disposition :=
            Some
              (Read.sequence i "ContentDisposition"
                 (fun i attrs -> content_disposition_of_xml i attrs)
                 ())
      | "ContentEncoding" ->
          r_content_encoding :=
            Some
              (Read.sequence i "ContentEncoding"
                 (fun i attrs -> content_encoding_of_xml i attrs)
                 ())
      | "ContentLanguage" ->
          r_content_language :=
            Some
              (Read.sequence i "ContentLanguage"
                 (fun i attrs -> content_language_of_xml i attrs)
                 ())
      | "ContentType" ->
          r_content_type :=
            Some (Read.sequence i "ContentType" (fun i attrs -> content_type_of_xml i attrs) ())
      | "ContentRange" ->
          r_content_range :=
            Some (Read.sequence i "ContentRange" (fun i attrs -> content_range_of_xml i attrs) ())
      | "Expires" ->
          r_expires := Some (Read.sequence i "Expires" (fun i attrs -> expires_of_xml i attrs) ())
      | "WebsiteRedirectLocation" ->
          r_website_redirect_location :=
            Some
              (Read.sequence i "WebsiteRedirectLocation"
                 (fun i attrs -> website_redirect_location_of_xml i attrs)
                 ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Read.sequence i "Metadata"
                 (fun i attrs ->
                   Read.sequences i "entry"
                     (fun i attrs ->
                       let k =
                         Read.sequence i "key" (fun i attrs -> metadata_key_of_xml i attrs) ()
                       in
                       let v =
                         Read.sequence i "value" (fun i attrs -> metadata_value_of_xml i attrs) ()
                       in
                       (k, v))
                     ())
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "ReplicationStatus" ->
          r_replication_status :=
            Some
              (Read.sequence i "ReplicationStatus"
                 (fun i attrs -> replication_status_of_xml i attrs)
                 ())
      | "PartsCount" ->
          r_parts_count :=
            Some (Read.sequence i "PartsCount" (fun i attrs -> parts_count_of_xml i attrs) ())
      | "TagCount" ->
          r_tag_count :=
            Some (Read.sequence i "TagCount" (fun i attrs -> tag_count_of_xml i attrs) ())
      | "ObjectLockMode" ->
          r_object_lock_mode :=
            Some
              (Read.sequence i "ObjectLockMode" (fun i attrs -> object_lock_mode_of_xml i attrs) ())
      | "ObjectLockRetainUntilDate" ->
          r_object_lock_retain_until_date :=
            Some
              (Read.sequence i "ObjectLockRetainUntilDate"
                 (fun i attrs -> object_lock_retain_until_date_of_xml i attrs)
                 ())
      | "ObjectLockLegalHoldStatus" ->
          r_object_lock_legal_hold_status :=
            Some
              (Read.sequence i "ObjectLockLegalHoldStatus"
                 (fun i attrs -> object_lock_legal_hold_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     delete_marker = ( ! ) r_delete_marker;
     accept_ranges = ( ! ) r_accept_ranges;
     expiration = ( ! ) r_expiration;
     restore = ( ! ) r_restore;
     archive_status = ( ! ) r_archive_status;
     last_modified = ( ! ) r_last_modified;
     content_length = ( ! ) r_content_length;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
     e_tag = ( ! ) r_e_tag;
     missing_meta = ( ! ) r_missing_meta;
     version_id = ( ! ) r_version_id;
     cache_control = ( ! ) r_cache_control;
     content_disposition = ( ! ) r_content_disposition;
     content_encoding = ( ! ) r_content_encoding;
     content_language = ( ! ) r_content_language;
     content_type = ( ! ) r_content_type;
     content_range = ( ! ) r_content_range;
     expires = ( ! ) r_expires;
     website_redirect_location = ( ! ) r_website_redirect_location;
     server_side_encryption = ( ! ) r_server_side_encryption;
     metadata = ( ! ) r_metadata;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     storage_class = ( ! ) r_storage_class;
     request_charged = ( ! ) r_request_charged;
     replication_status = ( ! ) r_replication_status;
     parts_count = ( ! ) r_parts_count;
     tag_count = ( ! ) r_tag_count;
     object_lock_mode = ( ! ) r_object_lock_mode;
     object_lock_retain_until_date = ( ! ) r_object_lock_retain_until_date;
     object_lock_legal_hold_status = ( ! ) r_object_lock_legal_hold_status;
   }
    : head_object_output)

let checksum_mode_of_xml i attrs =
  let s = Read.data i in
  (match s with "ENABLED" -> ENABLED | _ -> failwith "unknown enum value" : checksum_mode)

let response_expires_of_xml i attrs = Primitive.timestamp_httpdate_of_string (Read.data i)
let response_content_type_of_xml i attrs = Read.data i
let response_content_language_of_xml i attrs = Read.data i
let response_content_encoding_of_xml i attrs = Read.data i
let response_content_disposition_of_xml i attrs = Read.data i
let response_cache_control_of_xml i attrs = Read.data i
let range_of_xml i attrs = Read.data i

let head_object_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_if_match = ref None in
  let r_if_modified_since = ref None in
  let r_if_none_match = ref None in
  let r_if_unmodified_since = ref None in
  let r_key = ref None in
  let r_range = ref None in
  let r_response_cache_control = ref None in
  let r_response_content_disposition = ref None in
  let r_response_content_encoding = ref None in
  let r_response_content_language = ref None in
  let r_response_content_type = ref None in
  let r_response_expires = ref None in
  let r_version_id = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_request_payer = ref None in
  let r_part_number = ref None in
  let r_expected_bucket_owner = ref None in
  let r_checksum_mode = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "IfMatch";
      "IfModifiedSince";
      "IfNoneMatch";
      "IfUnmodifiedSince";
      "Key";
      "Range";
      "ResponseCacheControl";
      "ResponseContentDisposition";
      "ResponseContentEncoding";
      "ResponseContentLanguage";
      "ResponseContentType";
      "ResponseExpires";
      "VersionId";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "RequestPayer";
      "PartNumber";
      "ExpectedBucketOwner";
      "ChecksumMode";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "IfMatch" ->
          r_if_match := Some (Read.sequence i "IfMatch" (fun i attrs -> if_match_of_xml i attrs) ())
      | "IfModifiedSince" ->
          r_if_modified_since :=
            Some
              (Read.sequence i "IfModifiedSince"
                 (fun i attrs -> if_modified_since_of_xml i attrs)
                 ())
      | "IfNoneMatch" ->
          r_if_none_match :=
            Some (Read.sequence i "IfNoneMatch" (fun i attrs -> if_none_match_of_xml i attrs) ())
      | "IfUnmodifiedSince" ->
          r_if_unmodified_since :=
            Some
              (Read.sequence i "IfUnmodifiedSince"
                 (fun i attrs -> if_unmodified_since_of_xml i attrs)
                 ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Range" ->
          r_range := Some (Read.sequence i "Range" (fun i attrs -> range_of_xml i attrs) ())
      | "ResponseCacheControl" ->
          r_response_cache_control :=
            Some
              (Read.sequence i "ResponseCacheControl"
                 (fun i attrs -> response_cache_control_of_xml i attrs)
                 ())
      | "ResponseContentDisposition" ->
          r_response_content_disposition :=
            Some
              (Read.sequence i "ResponseContentDisposition"
                 (fun i attrs -> response_content_disposition_of_xml i attrs)
                 ())
      | "ResponseContentEncoding" ->
          r_response_content_encoding :=
            Some
              (Read.sequence i "ResponseContentEncoding"
                 (fun i attrs -> response_content_encoding_of_xml i attrs)
                 ())
      | "ResponseContentLanguage" ->
          r_response_content_language :=
            Some
              (Read.sequence i "ResponseContentLanguage"
                 (fun i attrs -> response_content_language_of_xml i attrs)
                 ())
      | "ResponseContentType" ->
          r_response_content_type :=
            Some
              (Read.sequence i "ResponseContentType"
                 (fun i attrs -> response_content_type_of_xml i attrs)
                 ())
      | "ResponseExpires" ->
          r_response_expires :=
            Some
              (Read.sequence i "ResponseExpires"
                 (fun i attrs -> response_expires_of_xml i attrs)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "PartNumber" ->
          r_part_number :=
            Some (Read.sequence i "PartNumber" (fun i attrs -> part_number_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ChecksumMode" ->
          r_checksum_mode :=
            Some (Read.sequence i "ChecksumMode" (fun i attrs -> checksum_mode_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     if_match = ( ! ) r_if_match;
     if_modified_since = ( ! ) r_if_modified_since;
     if_none_match = ( ! ) r_if_none_match;
     if_unmodified_since = ( ! ) r_if_unmodified_since;
     key = required "Key" (( ! ) r_key) i;
     range = ( ! ) r_range;
     response_cache_control = ( ! ) r_response_cache_control;
     response_content_disposition = ( ! ) r_response_content_disposition;
     response_content_encoding = ( ! ) r_response_content_encoding;
     response_content_language = ( ! ) r_response_content_language;
     response_content_type = ( ! ) r_response_content_type;
     response_expires = ( ! ) r_response_expires;
     version_id = ( ! ) r_version_id;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     request_payer = ( ! ) r_request_payer;
     part_number = ( ! ) r_part_number;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     checksum_mode = ( ! ) r_checksum_mode;
   }
    : head_object_request)

let region_of_xml i attrs = Read.data i
let bucket_location_name_of_xml i attrs = Read.data i

let location_type_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "AvailabilityZone" -> AvailabilityZone
   | "LocalZone" -> LocalZone
   | _ -> failwith "unknown enum value"
    : location_type)

let head_bucket_output_of_xml i attrs =
  let r_bucket_arn = ref None in
  let r_bucket_location_type = ref None in
  let r_bucket_location_name = ref None in
  let r_bucket_region = ref None in
  let r_access_point_alias = ref None in
  Structure.scanSequence i
    [ "BucketArn"; "BucketLocationType"; "BucketLocationName"; "BucketRegion"; "AccessPointAlias" ]
    (fun tag _ ->
      match tag with
      | "BucketArn" ->
          r_bucket_arn :=
            Some
              (Read.sequence i "BucketArn"
                 (fun i attrs -> s3_regional_or_s3_express_bucket_arn_string_of_xml i attrs)
                 ())
      | "BucketLocationType" ->
          r_bucket_location_type :=
            Some
              (Read.sequence i "BucketLocationType"
                 (fun i attrs -> location_type_of_xml i attrs)
                 ())
      | "BucketLocationName" ->
          r_bucket_location_name :=
            Some
              (Read.sequence i "BucketLocationName"
                 (fun i attrs -> bucket_location_name_of_xml i attrs)
                 ())
      | "BucketRegion" ->
          r_bucket_region :=
            Some (Read.sequence i "BucketRegion" (fun i attrs -> region_of_xml i attrs) ())
      | "AccessPointAlias" ->
          r_access_point_alias :=
            Some
              (Read.sequence i "AccessPointAlias"
                 (fun i attrs -> access_point_alias_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket_arn = ( ! ) r_bucket_arn;
     bucket_location_type = ( ! ) r_bucket_location_type;
     bucket_location_name = ( ! ) r_bucket_location_name;
     bucket_region = ( ! ) r_bucket_region;
     access_point_alias = ( ! ) r_access_point_alias;
   }
    : head_bucket_output)

let head_bucket_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : head_bucket_request)

let get_public_access_block_output_of_xml i attrs =
  let r_public_access_block_configuration = ref None in
  Structure.scanSequence i [ "PublicAccessBlockConfiguration" ] (fun tag _ ->
      match tag with
      | "PublicAccessBlockConfiguration" ->
          r_public_access_block_configuration :=
            Some
              (Read.sequence i "PublicAccessBlockConfiguration"
                 (fun i attrs -> public_access_block_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ public_access_block_configuration = ( ! ) r_public_access_block_configuration }
    : get_public_access_block_output)

let get_public_access_block_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_public_access_block_request)

let get_object_torrent_output_of_xml i attrs =
  let r_body = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i [ "Body"; "RequestCharged" ] (fun tag _ ->
      match tag with
      | "Body" ->
          r_body := Some (Read.sequence i "Body" (fun i attrs -> streaming_blob_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ body = ( ! ) r_body; request_charged = ( ! ) r_request_charged } : get_object_torrent_output)

let get_object_torrent_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Key"; "RequestPayer"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_object_torrent_request)

let get_object_tagging_output_of_xml i attrs =
  let r_version_id = ref None in
  let r_tag_set = ref None in
  Structure.scanSequence i [ "VersionId"; "TagSet" ] (fun tag _ ->
      match tag with
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "TagSet" ->
          r_tag_set :=
            Some
              (Read.sequence i "TagSet"
                 (fun i attrs -> Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({ version_id = ( ! ) r_version_id; tag_set = required "TagSet" (( ! ) r_tag_set) i }
    : get_object_tagging_output)

let get_object_tagging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_expected_bucket_owner = ref None in
  let r_request_payer = ref None in
  Structure.scanSequence i [ "Bucket"; "Key"; "VersionId"; "ExpectedBucketOwner"; "RequestPayer" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     request_payer = ( ! ) r_request_payer;
   }
    : get_object_tagging_request)

let get_object_retention_output_of_xml i attrs =
  let r_retention = ref None in
  Structure.scanSequence i [ "Retention" ] (fun tag _ ->
      match tag with
      | "Retention" ->
          r_retention :=
            Some
              (Read.sequence i "Retention" (fun i attrs -> object_lock_retention_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ retention = ( ! ) r_retention } : get_object_retention_output)

let get_object_retention_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Key"; "VersionId"; "RequestPayer"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_object_retention_request)

let get_object_lock_configuration_output_of_xml i attrs =
  let r_object_lock_configuration = ref None in
  Structure.scanSequence i [ "ObjectLockConfiguration" ] (fun tag _ ->
      match tag with
      | "ObjectLockConfiguration" ->
          r_object_lock_configuration :=
            Some
              (Read.sequence i "ObjectLockConfiguration"
                 (fun i attrs -> object_lock_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ object_lock_configuration = ( ! ) r_object_lock_configuration }
    : get_object_lock_configuration_output)

let get_object_lock_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_object_lock_configuration_request)

let get_object_legal_hold_output_of_xml i attrs =
  let r_legal_hold = ref None in
  Structure.scanSequence i [ "LegalHold" ] (fun tag _ ->
      match tag with
      | "LegalHold" ->
          r_legal_hold :=
            Some
              (Read.sequence i "LegalHold"
                 (fun i attrs -> object_lock_legal_hold_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ legal_hold = ( ! ) r_legal_hold } : get_object_legal_hold_output)

let get_object_legal_hold_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Key"; "VersionId"; "RequestPayer"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_object_legal_hold_request)

let object_size_of_xml i attrs = Primitive.long_of_string (Read.data i)

let object_part_of_xml i attrs =
  let r_part_number = ref None in
  let r_size = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  Structure.scanSequence i
    [
      "PartNumber";
      "Size";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
    ] (fun tag _ ->
      match tag with
      | "PartNumber" ->
          r_part_number :=
            Some (Read.sequence i "PartNumber" (fun i attrs -> part_number_of_xml i attrs) ())
      | "Size" -> r_size := Some (Read.sequence i "Size" (fun i attrs -> size_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     part_number = ( ! ) r_part_number;
     size = ( ! ) r_size;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
   }
    : object_part)

let parts_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> object_part_of_xml i attrs) ()

let get_object_attributes_parts_of_xml i attrs =
  let r_total_parts_count = ref None in
  let r_part_number_marker = ref None in
  let r_next_part_number_marker = ref None in
  let r_max_parts = ref None in
  let r_is_truncated = ref None in
  let r_parts = ref None in
  Structure.scanSequence i
    [ "PartsCount"; "PartNumberMarker"; "NextPartNumberMarker"; "MaxParts"; "IsTruncated"; "Part" ]
    (fun tag _ ->
      match tag with
      | "PartsCount" ->
          r_total_parts_count :=
            Some (Read.sequence i "PartsCount" (fun i attrs -> parts_count_of_xml i attrs) ())
      | "PartNumberMarker" ->
          r_part_number_marker :=
            Some
              (Read.sequence i "PartNumberMarker"
                 (fun i attrs -> part_number_marker_of_xml i attrs)
                 ())
      | "NextPartNumberMarker" ->
          r_next_part_number_marker :=
            Some
              (Read.sequence i "NextPartNumberMarker"
                 (fun i attrs -> next_part_number_marker_of_xml i attrs)
                 ())
      | "MaxParts" ->
          r_max_parts :=
            Some (Read.sequence i "MaxParts" (fun i attrs -> max_parts_of_xml i attrs) ())
      | "IsTruncated" ->
          r_is_truncated :=
            Some (Read.sequence i "IsTruncated" (fun i attrs -> is_truncated_of_xml i attrs) ())
      | "Part" ->
          r_parts := Some (Read.sequences i "Part" (fun i attrs -> object_part_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     total_parts_count = ( ! ) r_total_parts_count;
     part_number_marker = ( ! ) r_part_number_marker;
     next_part_number_marker = ( ! ) r_next_part_number_marker;
     max_parts = ( ! ) r_max_parts;
     is_truncated = ( ! ) r_is_truncated;
     parts = ( ! ) r_parts;
   }
    : get_object_attributes_parts)

let checksum_of_xml i attrs =
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  Structure.scanSequence i
    [
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
    ] (fun tag _ ->
      match tag with
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
   }
    : checksum)

let get_object_attributes_output_of_xml i attrs =
  let r_delete_marker = ref None in
  let r_last_modified = ref None in
  let r_version_id = ref None in
  let r_request_charged = ref None in
  let r_e_tag = ref None in
  let r_checksum = ref None in
  let r_object_parts = ref None in
  let r_storage_class = ref None in
  let r_object_size = ref None in
  Structure.scanSequence i
    [
      "DeleteMarker";
      "LastModified";
      "VersionId";
      "RequestCharged";
      "ETag";
      "Checksum";
      "ObjectParts";
      "StorageClass";
      "ObjectSize";
    ] (fun tag _ ->
      match tag with
      | "DeleteMarker" ->
          r_delete_marker :=
            Some (Read.sequence i "DeleteMarker" (fun i attrs -> delete_marker_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "Checksum" ->
          r_checksum :=
            Some (Read.sequence i "Checksum" (fun i attrs -> checksum_of_xml i attrs) ())
      | "ObjectParts" ->
          r_object_parts :=
            Some
              (Read.sequence i "ObjectParts"
                 (fun i attrs -> get_object_attributes_parts_of_xml i attrs)
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "ObjectSize" ->
          r_object_size :=
            Some (Read.sequence i "ObjectSize" (fun i attrs -> object_size_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     delete_marker = ( ! ) r_delete_marker;
     last_modified = ( ! ) r_last_modified;
     version_id = ( ! ) r_version_id;
     request_charged = ( ! ) r_request_charged;
     e_tag = ( ! ) r_e_tag;
     checksum = ( ! ) r_checksum;
     object_parts = ( ! ) r_object_parts;
     storage_class = ( ! ) r_storage_class;
     object_size = ( ! ) r_object_size;
   }
    : get_object_attributes_output)

let object_attributes_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "ETag" -> ETAG
   | "Checksum" -> CHECKSUM
   | "ObjectParts" -> OBJECT_PARTS
   | "StorageClass" -> STORAGE_CLASS
   | "ObjectSize" -> OBJECT_SIZE
   | _ -> failwith "unknown enum value"
    : object_attributes)

let object_attributes_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> object_attributes_of_xml i attrs) ()

let get_object_attributes_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_max_parts = ref None in
  let r_part_number_marker = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_object_attributes = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "VersionId";
      "MaxParts";
      "PartNumberMarker";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "RequestPayer";
      "ExpectedBucketOwner";
      "ObjectAttributes";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "MaxParts" ->
          r_max_parts :=
            Some (Read.sequence i "MaxParts" (fun i attrs -> max_parts_of_xml i attrs) ())
      | "PartNumberMarker" ->
          r_part_number_marker :=
            Some
              (Read.sequence i "PartNumberMarker"
                 (fun i attrs -> part_number_marker_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ObjectAttributes" ->
          r_object_attributes :=
            Some
              (Read.sequence i "ObjectAttributes"
                 (fun i attrs ->
                   Read.sequences i "member" (fun i attrs -> object_attributes_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     max_parts = ( ! ) r_max_parts;
     part_number_marker = ( ! ) r_part_number_marker;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     object_attributes = required "ObjectAttributes" (( ! ) r_object_attributes) i;
   }
    : get_object_attributes_request)

let no_such_annotation_of_xml i attrs = ()

let get_object_annotation_output_of_xml i attrs =
  let r_annotation_payload = ref None in
  let r_object_version_id = ref None in
  let r_last_modified = ref None in
  let r_content_length = ref None in
  let r_e_tag = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  let r_server_side_encryption = ref None in
  let r_request_charged = ref None in
  let r_replication_status = ref None in
  Structure.scanSequence i
    [
      "AnnotationPayload";
      "ObjectVersionId";
      "LastModified";
      "ContentLength";
      "ETag";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
      "ServerSideEncryption";
      "RequestCharged";
      "ReplicationStatus";
    ] (fun tag _ ->
      match tag with
      | "AnnotationPayload" ->
          r_annotation_payload :=
            Some
              (Read.sequence i "AnnotationPayload"
                 (fun i attrs -> streaming_blob_of_xml i attrs)
                 ())
      | "ObjectVersionId" ->
          r_object_version_id :=
            Some
              (Read.sequence i "ObjectVersionId"
                 (fun i attrs -> object_version_id_of_xml i attrs)
                 ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ContentLength" ->
          r_content_length :=
            Some (Read.sequence i "ContentLength" (fun i attrs -> content_length_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "ReplicationStatus" ->
          r_replication_status :=
            Some
              (Read.sequence i "ReplicationStatus"
                 (fun i attrs -> replication_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     annotation_payload = ( ! ) r_annotation_payload;
     object_version_id = ( ! ) r_object_version_id;
     last_modified = ( ! ) r_last_modified;
     content_length = ( ! ) r_content_length;
     e_tag = ( ! ) r_e_tag;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
     server_side_encryption = ( ! ) r_server_side_encryption;
     request_charged = ( ! ) r_request_charged;
     replication_status = ( ! ) r_replication_status;
   }
    : get_object_annotation_output)

let get_object_annotation_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_annotation_name = ref None in
  let r_version_id = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_checksum_mode = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "AnnotationName";
      "VersionId";
      "RequestPayer";
      "ExpectedBucketOwner";
      "ChecksumMode";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "AnnotationName" ->
          r_annotation_name :=
            Some
              (Read.sequence i "AnnotationName" (fun i attrs -> annotation_name_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ChecksumMode" ->
          r_checksum_mode :=
            Some (Read.sequence i "ChecksumMode" (fun i attrs -> checksum_mode_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     annotation_name = required "AnnotationName" (( ! ) r_annotation_name) i;
     version_id = ( ! ) r_version_id;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     checksum_mode = ( ! ) r_checksum_mode;
   }
    : get_object_annotation_request)

let get_object_acl_output_of_xml i attrs =
  let r_owner = ref None in
  let r_grants = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i [ "Owner"; "AccessControlList"; "RequestCharged" ] (fun tag _ ->
      match tag with
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "AccessControlList" ->
          r_grants :=
            Some
              (Read.sequence i "AccessControlList"
                 (fun i attrs -> Read.sequences i "Grant" (fun i attrs -> grant_of_xml i attrs) ())
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ owner = ( ! ) r_owner; grants = ( ! ) r_grants; request_charged = ( ! ) r_request_charged }
    : get_object_acl_output)

let get_object_acl_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Key"; "VersionId"; "RequestPayer"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_object_acl_request)

let invalid_object_state_of_xml i attrs =
  let r_storage_class = ref None in
  let r_access_tier = ref None in
  Structure.scanSequence i [ "StorageClass"; "AccessTier" ] (fun tag _ ->
      match tag with
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "AccessTier" ->
          r_access_tier :=
            Some
              (Read.sequence i "AccessTier"
                 (fun i attrs -> intelligent_tiering_access_tier_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ storage_class = ( ! ) r_storage_class; access_tier = ( ! ) r_access_tier }
    : invalid_object_state)

let get_object_output_of_xml i attrs =
  let r_body = ref None in
  let r_delete_marker = ref None in
  let r_accept_ranges = ref None in
  let r_expiration = ref None in
  let r_restore = ref None in
  let r_last_modified = ref None in
  let r_content_length = ref None in
  let r_e_tag = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  let r_missing_meta = ref None in
  let r_version_id = ref None in
  let r_cache_control = ref None in
  let r_content_disposition = ref None in
  let r_content_encoding = ref None in
  let r_content_language = ref None in
  let r_content_range = ref None in
  let r_content_type = ref None in
  let r_expires = ref None in
  let r_website_redirect_location = ref None in
  let r_server_side_encryption = ref None in
  let r_metadata = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_bucket_key_enabled = ref None in
  let r_storage_class = ref None in
  let r_request_charged = ref None in
  let r_replication_status = ref None in
  let r_parts_count = ref None in
  let r_tag_count = ref None in
  let r_object_lock_mode = ref None in
  let r_object_lock_retain_until_date = ref None in
  let r_object_lock_legal_hold_status = ref None in
  Structure.scanSequence i
    [
      "Body";
      "DeleteMarker";
      "AcceptRanges";
      "Expiration";
      "Restore";
      "LastModified";
      "ContentLength";
      "ETag";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
      "MissingMeta";
      "VersionId";
      "CacheControl";
      "ContentDisposition";
      "ContentEncoding";
      "ContentLanguage";
      "ContentRange";
      "ContentType";
      "Expires";
      "WebsiteRedirectLocation";
      "ServerSideEncryption";
      "Metadata";
      "SSECustomerAlgorithm";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "BucketKeyEnabled";
      "StorageClass";
      "RequestCharged";
      "ReplicationStatus";
      "PartsCount";
      "TagCount";
      "ObjectLockMode";
      "ObjectLockRetainUntilDate";
      "ObjectLockLegalHoldStatus";
    ] (fun tag _ ->
      match tag with
      | "Body" ->
          r_body := Some (Read.sequence i "Body" (fun i attrs -> streaming_blob_of_xml i attrs) ())
      | "DeleteMarker" ->
          r_delete_marker :=
            Some (Read.sequence i "DeleteMarker" (fun i attrs -> delete_marker_of_xml i attrs) ())
      | "AcceptRanges" ->
          r_accept_ranges :=
            Some (Read.sequence i "AcceptRanges" (fun i attrs -> accept_ranges_of_xml i attrs) ())
      | "Expiration" ->
          r_expiration :=
            Some (Read.sequence i "Expiration" (fun i attrs -> expiration_of_xml i attrs) ())
      | "Restore" ->
          r_restore := Some (Read.sequence i "Restore" (fun i attrs -> restore_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ContentLength" ->
          r_content_length :=
            Some (Read.sequence i "ContentLength" (fun i attrs -> content_length_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "MissingMeta" ->
          r_missing_meta :=
            Some (Read.sequence i "MissingMeta" (fun i attrs -> missing_meta_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "CacheControl" ->
          r_cache_control :=
            Some (Read.sequence i "CacheControl" (fun i attrs -> cache_control_of_xml i attrs) ())
      | "ContentDisposition" ->
          r_content_disposition :=
            Some
              (Read.sequence i "ContentDisposition"
                 (fun i attrs -> content_disposition_of_xml i attrs)
                 ())
      | "ContentEncoding" ->
          r_content_encoding :=
            Some
              (Read.sequence i "ContentEncoding"
                 (fun i attrs -> content_encoding_of_xml i attrs)
                 ())
      | "ContentLanguage" ->
          r_content_language :=
            Some
              (Read.sequence i "ContentLanguage"
                 (fun i attrs -> content_language_of_xml i attrs)
                 ())
      | "ContentRange" ->
          r_content_range :=
            Some (Read.sequence i "ContentRange" (fun i attrs -> content_range_of_xml i attrs) ())
      | "ContentType" ->
          r_content_type :=
            Some (Read.sequence i "ContentType" (fun i attrs -> content_type_of_xml i attrs) ())
      | "Expires" ->
          r_expires := Some (Read.sequence i "Expires" (fun i attrs -> expires_of_xml i attrs) ())
      | "WebsiteRedirectLocation" ->
          r_website_redirect_location :=
            Some
              (Read.sequence i "WebsiteRedirectLocation"
                 (fun i attrs -> website_redirect_location_of_xml i attrs)
                 ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Read.sequence i "Metadata"
                 (fun i attrs ->
                   Read.sequences i "entry"
                     (fun i attrs ->
                       let k =
                         Read.sequence i "key" (fun i attrs -> metadata_key_of_xml i attrs) ()
                       in
                       let v =
                         Read.sequence i "value" (fun i attrs -> metadata_value_of_xml i attrs) ()
                       in
                       (k, v))
                     ())
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "ReplicationStatus" ->
          r_replication_status :=
            Some
              (Read.sequence i "ReplicationStatus"
                 (fun i attrs -> replication_status_of_xml i attrs)
                 ())
      | "PartsCount" ->
          r_parts_count :=
            Some (Read.sequence i "PartsCount" (fun i attrs -> parts_count_of_xml i attrs) ())
      | "TagCount" ->
          r_tag_count :=
            Some (Read.sequence i "TagCount" (fun i attrs -> tag_count_of_xml i attrs) ())
      | "ObjectLockMode" ->
          r_object_lock_mode :=
            Some
              (Read.sequence i "ObjectLockMode" (fun i attrs -> object_lock_mode_of_xml i attrs) ())
      | "ObjectLockRetainUntilDate" ->
          r_object_lock_retain_until_date :=
            Some
              (Read.sequence i "ObjectLockRetainUntilDate"
                 (fun i attrs -> object_lock_retain_until_date_of_xml i attrs)
                 ())
      | "ObjectLockLegalHoldStatus" ->
          r_object_lock_legal_hold_status :=
            Some
              (Read.sequence i "ObjectLockLegalHoldStatus"
                 (fun i attrs -> object_lock_legal_hold_status_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     body = ( ! ) r_body;
     delete_marker = ( ! ) r_delete_marker;
     accept_ranges = ( ! ) r_accept_ranges;
     expiration = ( ! ) r_expiration;
     restore = ( ! ) r_restore;
     last_modified = ( ! ) r_last_modified;
     content_length = ( ! ) r_content_length;
     e_tag = ( ! ) r_e_tag;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
     missing_meta = ( ! ) r_missing_meta;
     version_id = ( ! ) r_version_id;
     cache_control = ( ! ) r_cache_control;
     content_disposition = ( ! ) r_content_disposition;
     content_encoding = ( ! ) r_content_encoding;
     content_language = ( ! ) r_content_language;
     content_range = ( ! ) r_content_range;
     content_type = ( ! ) r_content_type;
     expires = ( ! ) r_expires;
     website_redirect_location = ( ! ) r_website_redirect_location;
     server_side_encryption = ( ! ) r_server_side_encryption;
     metadata = ( ! ) r_metadata;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     storage_class = ( ! ) r_storage_class;
     request_charged = ( ! ) r_request_charged;
     replication_status = ( ! ) r_replication_status;
     parts_count = ( ! ) r_parts_count;
     tag_count = ( ! ) r_tag_count;
     object_lock_mode = ( ! ) r_object_lock_mode;
     object_lock_retain_until_date = ( ! ) r_object_lock_retain_until_date;
     object_lock_legal_hold_status = ( ! ) r_object_lock_legal_hold_status;
   }
    : get_object_output)

let get_object_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_if_match = ref None in
  let r_if_modified_since = ref None in
  let r_if_none_match = ref None in
  let r_if_unmodified_since = ref None in
  let r_key = ref None in
  let r_range = ref None in
  let r_response_cache_control = ref None in
  let r_response_content_disposition = ref None in
  let r_response_content_encoding = ref None in
  let r_response_content_language = ref None in
  let r_response_content_type = ref None in
  let r_response_expires = ref None in
  let r_version_id = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_request_payer = ref None in
  let r_part_number = ref None in
  let r_expected_bucket_owner = ref None in
  let r_checksum_mode = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "IfMatch";
      "IfModifiedSince";
      "IfNoneMatch";
      "IfUnmodifiedSince";
      "Key";
      "Range";
      "ResponseCacheControl";
      "ResponseContentDisposition";
      "ResponseContentEncoding";
      "ResponseContentLanguage";
      "ResponseContentType";
      "ResponseExpires";
      "VersionId";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "RequestPayer";
      "PartNumber";
      "ExpectedBucketOwner";
      "ChecksumMode";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "IfMatch" ->
          r_if_match := Some (Read.sequence i "IfMatch" (fun i attrs -> if_match_of_xml i attrs) ())
      | "IfModifiedSince" ->
          r_if_modified_since :=
            Some
              (Read.sequence i "IfModifiedSince"
                 (fun i attrs -> if_modified_since_of_xml i attrs)
                 ())
      | "IfNoneMatch" ->
          r_if_none_match :=
            Some (Read.sequence i "IfNoneMatch" (fun i attrs -> if_none_match_of_xml i attrs) ())
      | "IfUnmodifiedSince" ->
          r_if_unmodified_since :=
            Some
              (Read.sequence i "IfUnmodifiedSince"
                 (fun i attrs -> if_unmodified_since_of_xml i attrs)
                 ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Range" ->
          r_range := Some (Read.sequence i "Range" (fun i attrs -> range_of_xml i attrs) ())
      | "ResponseCacheControl" ->
          r_response_cache_control :=
            Some
              (Read.sequence i "ResponseCacheControl"
                 (fun i attrs -> response_cache_control_of_xml i attrs)
                 ())
      | "ResponseContentDisposition" ->
          r_response_content_disposition :=
            Some
              (Read.sequence i "ResponseContentDisposition"
                 (fun i attrs -> response_content_disposition_of_xml i attrs)
                 ())
      | "ResponseContentEncoding" ->
          r_response_content_encoding :=
            Some
              (Read.sequence i "ResponseContentEncoding"
                 (fun i attrs -> response_content_encoding_of_xml i attrs)
                 ())
      | "ResponseContentLanguage" ->
          r_response_content_language :=
            Some
              (Read.sequence i "ResponseContentLanguage"
                 (fun i attrs -> response_content_language_of_xml i attrs)
                 ())
      | "ResponseContentType" ->
          r_response_content_type :=
            Some
              (Read.sequence i "ResponseContentType"
                 (fun i attrs -> response_content_type_of_xml i attrs)
                 ())
      | "ResponseExpires" ->
          r_response_expires :=
            Some
              (Read.sequence i "ResponseExpires"
                 (fun i attrs -> response_expires_of_xml i attrs)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "PartNumber" ->
          r_part_number :=
            Some (Read.sequence i "PartNumber" (fun i attrs -> part_number_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ChecksumMode" ->
          r_checksum_mode :=
            Some (Read.sequence i "ChecksumMode" (fun i attrs -> checksum_mode_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     if_match = ( ! ) r_if_match;
     if_modified_since = ( ! ) r_if_modified_since;
     if_none_match = ( ! ) r_if_none_match;
     if_unmodified_since = ( ! ) r_if_unmodified_since;
     key = required "Key" (( ! ) r_key) i;
     range = ( ! ) r_range;
     response_cache_control = ( ! ) r_response_cache_control;
     response_content_disposition = ( ! ) r_response_content_disposition;
     response_content_encoding = ( ! ) r_response_content_encoding;
     response_content_language = ( ! ) r_response_content_language;
     response_content_type = ( ! ) r_response_content_type;
     response_expires = ( ! ) r_response_expires;
     version_id = ( ! ) r_version_id;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     request_payer = ( ! ) r_request_payer;
     part_number = ( ! ) r_part_number;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     checksum_mode = ( ! ) r_checksum_mode;
   }
    : get_object_request)

let get_bucket_website_output_of_xml i attrs =
  let r_redirect_all_requests_to = ref None in
  let r_index_document = ref None in
  let r_error_document = ref None in
  let r_routing_rules = ref None in
  Structure.scanSequence i
    [ "RedirectAllRequestsTo"; "IndexDocument"; "ErrorDocument"; "RoutingRules" ] (fun tag _ ->
      match tag with
      | "RedirectAllRequestsTo" ->
          r_redirect_all_requests_to :=
            Some
              (Read.sequence i "RedirectAllRequestsTo"
                 (fun i attrs -> redirect_all_requests_to_of_xml i attrs)
                 ())
      | "IndexDocument" ->
          r_index_document :=
            Some (Read.sequence i "IndexDocument" (fun i attrs -> index_document_of_xml i attrs) ())
      | "ErrorDocument" ->
          r_error_document :=
            Some (Read.sequence i "ErrorDocument" (fun i attrs -> error_document_of_xml i attrs) ())
      | "RoutingRules" ->
          r_routing_rules :=
            Some
              (Read.sequence i "RoutingRules"
                 (fun i attrs ->
                   Read.sequences i "RoutingRule" (fun i attrs -> routing_rule_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({
     redirect_all_requests_to = ( ! ) r_redirect_all_requests_to;
     index_document = ( ! ) r_index_document;
     error_document = ( ! ) r_error_document;
     routing_rules = ( ! ) r_routing_rules;
   }
    : get_bucket_website_output)

let get_bucket_website_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_website_request)

let mfa_delete_status_of_xml i attrs =
  let s = Read.data i in
  (match s with "Enabled" -> Enabled | "Disabled" -> Disabled | _ -> failwith "unknown enum value"
    : mfa_delete_status)

let get_bucket_versioning_output_of_xml i attrs =
  let r_status = ref None in
  let r_mfa_delete = ref None in
  Structure.scanSequence i [ "Status"; "MfaDelete" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status" (fun i attrs -> bucket_versioning_status_of_xml i attrs) ())
      | "MfaDelete" ->
          r_mfa_delete :=
            Some (Read.sequence i "MfaDelete" (fun i attrs -> mfa_delete_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ status = ( ! ) r_status; mfa_delete = ( ! ) r_mfa_delete } : get_bucket_versioning_output)

let get_bucket_versioning_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_versioning_request)

let get_bucket_tagging_output_of_xml i attrs =
  let r_tag_set = ref None in
  Structure.scanSequence i [ "TagSet" ] (fun tag _ ->
      match tag with
      | "TagSet" ->
          r_tag_set :=
            Some
              (Read.sequence i "TagSet"
                 (fun i attrs -> Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({ tag_set = required "TagSet" (( ! ) r_tag_set) i } : get_bucket_tagging_output)

let get_bucket_tagging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_tagging_request)

let get_bucket_request_payment_output_of_xml i attrs =
  let r_payer = ref None in
  Structure.scanSequence i [ "Payer" ] (fun tag _ ->
      match tag with
      | "Payer" ->
          r_payer := Some (Read.sequence i "Payer" (fun i attrs -> payer_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ payer = ( ! ) r_payer } : get_bucket_request_payment_output)

let get_bucket_request_payment_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_request_payment_request)

let get_bucket_replication_output_of_xml i attrs =
  let r_replication_configuration = ref None in
  Structure.scanSequence i [ "ReplicationConfiguration" ] (fun tag _ ->
      match tag with
      | "ReplicationConfiguration" ->
          r_replication_configuration :=
            Some
              (Read.sequence i "ReplicationConfiguration"
                 (fun i attrs -> replication_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ replication_configuration = ( ! ) r_replication_configuration }
    : get_bucket_replication_output)

let get_bucket_replication_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_replication_request)

let is_public_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let policy_status_of_xml i attrs =
  let r_is_public = ref None in
  Structure.scanSequence i [ "IsPublic" ] (fun tag _ ->
      match tag with
      | "IsPublic" ->
          r_is_public :=
            Some (Read.sequence i "IsPublic" (fun i attrs -> is_public_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ is_public = ( ! ) r_is_public } : policy_status)

let get_bucket_policy_status_output_of_xml i attrs =
  let r_policy_status = ref None in
  Structure.scanSequence i [ "PolicyStatus" ] (fun tag _ ->
      match tag with
      | "PolicyStatus" ->
          r_policy_status :=
            Some (Read.sequence i "PolicyStatus" (fun i attrs -> policy_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ policy_status = ( ! ) r_policy_status } : get_bucket_policy_status_output)

let get_bucket_policy_status_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_policy_status_request)

let get_bucket_policy_output_of_xml i attrs =
  let r_policy = ref None in
  Structure.scanSequence i [ "Policy" ] (fun tag _ ->
      match tag with
      | "Policy" ->
          r_policy := Some (Read.sequence i "Policy" (fun i attrs -> policy_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ policy = ( ! ) r_policy } : get_bucket_policy_output)

let get_bucket_policy_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_policy_request)

let get_bucket_ownership_controls_output_of_xml i attrs =
  let r_ownership_controls = ref None in
  Structure.scanSequence i [ "OwnershipControls" ] (fun tag _ ->
      match tag with
      | "OwnershipControls" ->
          r_ownership_controls :=
            Some
              (Read.sequence i "OwnershipControls"
                 (fun i attrs -> ownership_controls_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ ownership_controls = ( ! ) r_ownership_controls } : get_bucket_ownership_controls_output)

let get_bucket_ownership_controls_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_ownership_controls_request)

let get_bucket_notification_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_notification_configuration_request)

let get_bucket_metrics_configuration_output_of_xml i attrs =
  let r_metrics_configuration = ref None in
  Structure.scanSequence i [ "MetricsConfiguration" ] (fun tag _ ->
      match tag with
      | "MetricsConfiguration" ->
          r_metrics_configuration :=
            Some
              (Read.sequence i "MetricsConfiguration"
                 (fun i attrs -> metrics_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ metrics_configuration = ( ! ) r_metrics_configuration }
    : get_bucket_metrics_configuration_output)

let get_bucket_metrics_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> metrics_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_metrics_configuration_request)

let error_details_of_xml i attrs =
  let r_error_code = ref None in
  let r_error_message = ref None in
  Structure.scanSequence i [ "ErrorCode"; "ErrorMessage" ] (fun tag _ ->
      match tag with
      | "ErrorCode" ->
          r_error_code :=
            Some (Read.sequence i "ErrorCode" (fun i attrs -> error_code_of_xml i attrs) ())
      | "ErrorMessage" ->
          r_error_message :=
            Some (Read.sequence i "ErrorMessage" (fun i attrs -> error_message_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ error_code = ( ! ) r_error_code; error_message = ( ! ) r_error_message } : error_details)

let metadata_table_status_of_xml i attrs = Read.data i
let s3_tables_namespace_of_xml i attrs = Read.data i
let s3_tables_arn_of_xml i attrs = Read.data i
let s3_tables_name_of_xml i attrs = Read.data i
let s3_tables_bucket_arn_of_xml i attrs = Read.data i

let s3_tables_destination_result_of_xml i attrs =
  let r_table_bucket_arn = ref None in
  let r_table_name = ref None in
  let r_table_arn = ref None in
  let r_table_namespace = ref None in
  Structure.scanSequence i [ "TableBucketArn"; "TableName"; "TableArn"; "TableNamespace" ]
    (fun tag _ ->
      match tag with
      | "TableBucketArn" ->
          r_table_bucket_arn :=
            Some
              (Read.sequence i "TableBucketArn"
                 (fun i attrs -> s3_tables_bucket_arn_of_xml i attrs)
                 ())
      | "TableName" ->
          r_table_name :=
            Some (Read.sequence i "TableName" (fun i attrs -> s3_tables_name_of_xml i attrs) ())
      | "TableArn" ->
          r_table_arn :=
            Some (Read.sequence i "TableArn" (fun i attrs -> s3_tables_arn_of_xml i attrs) ())
      | "TableNamespace" ->
          r_table_namespace :=
            Some
              (Read.sequence i "TableNamespace"
                 (fun i attrs -> s3_tables_namespace_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     table_bucket_arn = required "TableBucketArn" (( ! ) r_table_bucket_arn) i;
     table_name = required "TableName" (( ! ) r_table_name) i;
     table_arn = required "TableArn" (( ! ) r_table_arn) i;
     table_namespace = required "TableNamespace" (( ! ) r_table_namespace) i;
   }
    : s3_tables_destination_result)

let metadata_table_configuration_result_of_xml i attrs =
  let r_s3_tables_destination_result = ref None in
  Structure.scanSequence i [ "S3TablesDestinationResult" ] (fun tag _ ->
      match tag with
      | "S3TablesDestinationResult" ->
          r_s3_tables_destination_result :=
            Some
              (Read.sequence i "S3TablesDestinationResult"
                 (fun i attrs -> s3_tables_destination_result_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     s3_tables_destination_result =
       required "S3TablesDestinationResult" (( ! ) r_s3_tables_destination_result) i;
   }
    : metadata_table_configuration_result)

let get_bucket_metadata_table_configuration_result_of_xml i attrs =
  let r_metadata_table_configuration_result = ref None in
  let r_status = ref None in
  let r_error = ref None in
  Structure.scanSequence i [ "MetadataTableConfigurationResult"; "Status"; "Error" ] (fun tag _ ->
      match tag with
      | "MetadataTableConfigurationResult" ->
          r_metadata_table_configuration_result :=
            Some
              (Read.sequence i "MetadataTableConfigurationResult"
                 (fun i attrs -> metadata_table_configuration_result_of_xml i attrs)
                 ())
      | "Status" ->
          r_status :=
            Some (Read.sequence i "Status" (fun i attrs -> metadata_table_status_of_xml i attrs) ())
      | "Error" ->
          r_error := Some (Read.sequence i "Error" (fun i attrs -> error_details_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     metadata_table_configuration_result =
       required "MetadataTableConfigurationResult" (( ! ) r_metadata_table_configuration_result) i;
     status = required "Status" (( ! ) r_status) i;
     error = ( ! ) r_error;
   }
    : get_bucket_metadata_table_configuration_result)

let get_bucket_metadata_table_configuration_output_of_xml i attrs =
  let r_get_bucket_metadata_table_configuration_result = ref None in
  Structure.scanSequence i [ "GetBucketMetadataTableConfigurationResult" ] (fun tag _ ->
      match tag with
      | "GetBucketMetadataTableConfigurationResult" ->
          r_get_bucket_metadata_table_configuration_result :=
            Some
              (Read.sequence i "GetBucketMetadataTableConfigurationResult"
                 (fun i attrs -> get_bucket_metadata_table_configuration_result_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     get_bucket_metadata_table_configuration_result =
       ( ! ) r_get_bucket_metadata_table_configuration_result;
   }
    : get_bucket_metadata_table_configuration_output)

let get_bucket_metadata_table_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_metadata_table_configuration_request)

let annotation_table_configuration_result_of_xml i attrs =
  let r_configuration_state = ref None in
  let r_table_status = ref None in
  let r_error = ref None in
  let r_table_name = ref None in
  let r_table_arn = ref None in
  let r_role = ref None in
  Structure.scanSequence i
    [ "ConfigurationState"; "TableStatus"; "Error"; "TableName"; "TableArn"; "Role" ] (fun tag _ ->
      match tag with
      | "ConfigurationState" ->
          r_configuration_state :=
            Some
              (Read.sequence i "ConfigurationState"
                 (fun i attrs -> annotation_configuration_state_of_xml i attrs)
                 ())
      | "TableStatus" ->
          r_table_status :=
            Some
              (Read.sequence i "TableStatus"
                 (fun i attrs -> metadata_table_status_of_xml i attrs)
                 ())
      | "Error" ->
          r_error := Some (Read.sequence i "Error" (fun i attrs -> error_details_of_xml i attrs) ())
      | "TableName" ->
          r_table_name :=
            Some (Read.sequence i "TableName" (fun i attrs -> s3_tables_name_of_xml i attrs) ())
      | "TableArn" ->
          r_table_arn :=
            Some (Read.sequence i "TableArn" (fun i attrs -> s3_tables_arn_of_xml i attrs) ())
      | "Role" -> r_role := Some (Read.sequence i "Role" (fun i attrs -> role_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     configuration_state = required "ConfigurationState" (( ! ) r_configuration_state) i;
     table_status = ( ! ) r_table_status;
     error = ( ! ) r_error;
     table_name = ( ! ) r_table_name;
     table_arn = ( ! ) r_table_arn;
     role = ( ! ) r_role;
   }
    : annotation_table_configuration_result)

let inventory_table_configuration_result_of_xml i attrs =
  let r_configuration_state = ref None in
  let r_table_status = ref None in
  let r_error = ref None in
  let r_table_name = ref None in
  let r_table_arn = ref None in
  Structure.scanSequence i [ "ConfigurationState"; "TableStatus"; "Error"; "TableName"; "TableArn" ]
    (fun tag _ ->
      match tag with
      | "ConfigurationState" ->
          r_configuration_state :=
            Some
              (Read.sequence i "ConfigurationState"
                 (fun i attrs -> inventory_configuration_state_of_xml i attrs)
                 ())
      | "TableStatus" ->
          r_table_status :=
            Some
              (Read.sequence i "TableStatus"
                 (fun i attrs -> metadata_table_status_of_xml i attrs)
                 ())
      | "Error" ->
          r_error := Some (Read.sequence i "Error" (fun i attrs -> error_details_of_xml i attrs) ())
      | "TableName" ->
          r_table_name :=
            Some (Read.sequence i "TableName" (fun i attrs -> s3_tables_name_of_xml i attrs) ())
      | "TableArn" ->
          r_table_arn :=
            Some (Read.sequence i "TableArn" (fun i attrs -> s3_tables_arn_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     configuration_state = required "ConfigurationState" (( ! ) r_configuration_state) i;
     table_status = ( ! ) r_table_status;
     error = ( ! ) r_error;
     table_name = ( ! ) r_table_name;
     table_arn = ( ! ) r_table_arn;
   }
    : inventory_table_configuration_result)

let journal_table_configuration_result_of_xml i attrs =
  let r_table_status = ref None in
  let r_error = ref None in
  let r_table_name = ref None in
  let r_table_arn = ref None in
  let r_record_expiration = ref None in
  Structure.scanSequence i [ "TableStatus"; "Error"; "TableName"; "TableArn"; "RecordExpiration" ]
    (fun tag _ ->
      match tag with
      | "TableStatus" ->
          r_table_status :=
            Some
              (Read.sequence i "TableStatus"
                 (fun i attrs -> metadata_table_status_of_xml i attrs)
                 ())
      | "Error" ->
          r_error := Some (Read.sequence i "Error" (fun i attrs -> error_details_of_xml i attrs) ())
      | "TableName" ->
          r_table_name :=
            Some (Read.sequence i "TableName" (fun i attrs -> s3_tables_name_of_xml i attrs) ())
      | "TableArn" ->
          r_table_arn :=
            Some (Read.sequence i "TableArn" (fun i attrs -> s3_tables_arn_of_xml i attrs) ())
      | "RecordExpiration" ->
          r_record_expiration :=
            Some
              (Read.sequence i "RecordExpiration"
                 (fun i attrs -> record_expiration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     table_status = required "TableStatus" (( ! ) r_table_status) i;
     error = ( ! ) r_error;
     table_name = required "TableName" (( ! ) r_table_name) i;
     table_arn = ( ! ) r_table_arn;
     record_expiration = required "RecordExpiration" (( ! ) r_record_expiration) i;
   }
    : journal_table_configuration_result)

let s3_tables_bucket_type_of_xml i attrs =
  let s = Read.data i in
  (match s with "aws" -> Aws | "customer" -> Customer | _ -> failwith "unknown enum value"
    : s3_tables_bucket_type)

let destination_result_of_xml i attrs =
  let r_table_bucket_type = ref None in
  let r_table_bucket_arn = ref None in
  let r_table_namespace = ref None in
  Structure.scanSequence i [ "TableBucketType"; "TableBucketArn"; "TableNamespace" ] (fun tag _ ->
      match tag with
      | "TableBucketType" ->
          r_table_bucket_type :=
            Some
              (Read.sequence i "TableBucketType"
                 (fun i attrs -> s3_tables_bucket_type_of_xml i attrs)
                 ())
      | "TableBucketArn" ->
          r_table_bucket_arn :=
            Some
              (Read.sequence i "TableBucketArn"
                 (fun i attrs -> s3_tables_bucket_arn_of_xml i attrs)
                 ())
      | "TableNamespace" ->
          r_table_namespace :=
            Some
              (Read.sequence i "TableNamespace"
                 (fun i attrs -> s3_tables_namespace_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     table_bucket_type = ( ! ) r_table_bucket_type;
     table_bucket_arn = ( ! ) r_table_bucket_arn;
     table_namespace = ( ! ) r_table_namespace;
   }
    : destination_result)

let metadata_configuration_result_of_xml i attrs =
  let r_destination_result = ref None in
  let r_journal_table_configuration_result = ref None in
  let r_inventory_table_configuration_result = ref None in
  let r_annotation_table_configuration_result = ref None in
  Structure.scanSequence i
    [
      "DestinationResult";
      "JournalTableConfigurationResult";
      "InventoryTableConfigurationResult";
      "AnnotationTableConfigurationResult";
    ] (fun tag _ ->
      match tag with
      | "DestinationResult" ->
          r_destination_result :=
            Some
              (Read.sequence i "DestinationResult"
                 (fun i attrs -> destination_result_of_xml i attrs)
                 ())
      | "JournalTableConfigurationResult" ->
          r_journal_table_configuration_result :=
            Some
              (Read.sequence i "JournalTableConfigurationResult"
                 (fun i attrs -> journal_table_configuration_result_of_xml i attrs)
                 ())
      | "InventoryTableConfigurationResult" ->
          r_inventory_table_configuration_result :=
            Some
              (Read.sequence i "InventoryTableConfigurationResult"
                 (fun i attrs -> inventory_table_configuration_result_of_xml i attrs)
                 ())
      | "AnnotationTableConfigurationResult" ->
          r_annotation_table_configuration_result :=
            Some
              (Read.sequence i "AnnotationTableConfigurationResult"
                 (fun i attrs -> annotation_table_configuration_result_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     destination_result = required "DestinationResult" (( ! ) r_destination_result) i;
     journal_table_configuration_result = ( ! ) r_journal_table_configuration_result;
     inventory_table_configuration_result = ( ! ) r_inventory_table_configuration_result;
     annotation_table_configuration_result = ( ! ) r_annotation_table_configuration_result;
   }
    : metadata_configuration_result)

let get_bucket_metadata_configuration_result_of_xml i attrs =
  let r_metadata_configuration_result = ref None in
  Structure.scanSequence i [ "MetadataConfigurationResult" ] (fun tag _ ->
      match tag with
      | "MetadataConfigurationResult" ->
          r_metadata_configuration_result :=
            Some
              (Read.sequence i "MetadataConfigurationResult"
                 (fun i attrs -> metadata_configuration_result_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     metadata_configuration_result =
       required "MetadataConfigurationResult" (( ! ) r_metadata_configuration_result) i;
   }
    : get_bucket_metadata_configuration_result)

let get_bucket_metadata_configuration_output_of_xml i attrs =
  let r_get_bucket_metadata_configuration_result = ref None in
  Structure.scanSequence i [ "GetBucketMetadataConfigurationResult" ] (fun tag _ ->
      match tag with
      | "GetBucketMetadataConfigurationResult" ->
          r_get_bucket_metadata_configuration_result :=
            Some
              (Read.sequence i "GetBucketMetadataConfigurationResult"
                 (fun i attrs -> get_bucket_metadata_configuration_result_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ get_bucket_metadata_configuration_result = ( ! ) r_get_bucket_metadata_configuration_result }
    : get_bucket_metadata_configuration_output)

let get_bucket_metadata_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_metadata_configuration_request)

let get_bucket_logging_output_of_xml i attrs =
  let r_logging_enabled = ref None in
  Structure.scanSequence i [ "LoggingEnabled" ] (fun tag _ ->
      match tag with
      | "LoggingEnabled" ->
          r_logging_enabled :=
            Some
              (Read.sequence i "LoggingEnabled" (fun i attrs -> logging_enabled_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ logging_enabled = ( ! ) r_logging_enabled } : get_bucket_logging_output)

let get_bucket_logging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_logging_request)

let bucket_location_constraint_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "af-south-1" -> Af_south_1
   | "ap-east-1" -> Ap_east_1
   | "ap-east-2" -> Ap_east_2
   | "ap-northeast-1" -> Ap_northeast_1
   | "ap-northeast-2" -> Ap_northeast_2
   | "ap-northeast-3" -> Ap_northeast_3
   | "ap-south-1" -> Ap_south_1
   | "ap-south-2" -> Ap_south_2
   | "ap-southeast-1" -> Ap_southeast_1
   | "ap-southeast-2" -> Ap_southeast_2
   | "ap-southeast-3" -> Ap_southeast_3
   | "ap-southeast-4" -> Ap_southeast_4
   | "ap-southeast-5" -> Ap_southeast_5
   | "ap-southeast-6" -> Ap_southeast_6
   | "ap-southeast-7" -> Ap_southeast_7
   | "ca-central-1" -> Ca_central_1
   | "ca-west-1" -> Ca_west_1
   | "cn-north-1" -> Cn_north_1
   | "cn-northwest-1" -> Cn_northwest_1
   | "EU" -> EU
   | "eu-central-1" -> Eu_central_1
   | "eu-central-2" -> Eu_central_2
   | "eu-north-1" -> Eu_north_1
   | "eu-south-1" -> Eu_south_1
   | "eu-south-2" -> Eu_south_2
   | "eu-west-1" -> Eu_west_1
   | "eu-west-2" -> Eu_west_2
   | "eu-west-3" -> Eu_west_3
   | "il-central-1" -> Il_central_1
   | "me-central-1" -> Me_central_1
   | "me-south-1" -> Me_south_1
   | "mx-central-1" -> Mx_central_1
   | "sa-east-1" -> Sa_east_1
   | "us-east-2" -> Us_east_2
   | "us-gov-east-1" -> Us_gov_east_1
   | "us-gov-west-1" -> Us_gov_west_1
   | "us-west-1" -> Us_west_1
   | "us-west-2" -> Us_west_2
   | _ -> failwith "unknown enum value"
    : bucket_location_constraint)

let get_bucket_location_output_of_xml i attrs =
  let r_location_constraint = ref None in
  Structure.scanSequence i [ "LocationConstraint" ] (fun tag _ ->
      match tag with
      | "LocationConstraint" ->
          r_location_constraint :=
            Some
              (Read.sequence i "LocationConstraint"
                 (fun i attrs -> bucket_location_constraint_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ location_constraint = ( ! ) r_location_constraint } : get_bucket_location_output)

let get_bucket_location_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_location_request)

let get_bucket_lifecycle_configuration_output_of_xml i attrs =
  let r_rules = ref None in
  let r_transition_default_minimum_object_size = ref None in
  Structure.scanSequence i [ "Rule"; "TransitionDefaultMinimumObjectSize" ] (fun tag _ ->
      match tag with
      | "Rule" ->
          r_rules :=
            Some (Read.sequences i "Rule" (fun i attrs -> lifecycle_rule_of_xml i attrs) ())
      | "TransitionDefaultMinimumObjectSize" ->
          r_transition_default_minimum_object_size :=
            Some
              (Read.sequence i "TransitionDefaultMinimumObjectSize"
                 (fun i attrs -> transition_default_minimum_object_size_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     rules = ( ! ) r_rules;
     transition_default_minimum_object_size = ( ! ) r_transition_default_minimum_object_size;
   }
    : get_bucket_lifecycle_configuration_output)

let get_bucket_lifecycle_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_lifecycle_configuration_request)

let get_bucket_inventory_configuration_output_of_xml i attrs =
  let r_inventory_configuration = ref None in
  Structure.scanSequence i [ "InventoryConfiguration" ] (fun tag _ ->
      match tag with
      | "InventoryConfiguration" ->
          r_inventory_configuration :=
            Some
              (Read.sequence i "InventoryConfiguration"
                 (fun i attrs -> inventory_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ inventory_configuration = ( ! ) r_inventory_configuration }
    : get_bucket_inventory_configuration_output)

let get_bucket_inventory_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> inventory_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_inventory_configuration_request)

let get_bucket_intelligent_tiering_configuration_output_of_xml i attrs =
  let r_intelligent_tiering_configuration = ref None in
  Structure.scanSequence i [ "IntelligentTieringConfiguration" ] (fun tag _ ->
      match tag with
      | "IntelligentTieringConfiguration" ->
          r_intelligent_tiering_configuration :=
            Some
              (Read.sequence i "IntelligentTieringConfiguration"
                 (fun i attrs -> intelligent_tiering_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ intelligent_tiering_configuration = ( ! ) r_intelligent_tiering_configuration }
    : get_bucket_intelligent_tiering_configuration_output)

let get_bucket_intelligent_tiering_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" ->
          r_id :=
            Some (Read.sequence i "Id" (fun i attrs -> intelligent_tiering_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_intelligent_tiering_configuration_request)

let get_bucket_encryption_output_of_xml i attrs =
  let r_server_side_encryption_configuration = ref None in
  Structure.scanSequence i [ "ServerSideEncryptionConfiguration" ] (fun tag _ ->
      match tag with
      | "ServerSideEncryptionConfiguration" ->
          r_server_side_encryption_configuration :=
            Some
              (Read.sequence i "ServerSideEncryptionConfiguration"
                 (fun i attrs -> server_side_encryption_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ server_side_encryption_configuration = ( ! ) r_server_side_encryption_configuration }
    : get_bucket_encryption_output)

let get_bucket_encryption_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_encryption_request)

let get_bucket_cors_output_of_xml i attrs =
  let r_cors_rules = ref None in
  Structure.scanSequence i [ "CORSRule" ] (fun tag _ ->
      match tag with
      | "CORSRule" ->
          r_cors_rules :=
            Some (Read.sequences i "CORSRule" (fun i attrs -> cors_rule_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ cors_rules = ( ! ) r_cors_rules } : get_bucket_cors_output)

let get_bucket_cors_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_cors_request)

let get_bucket_analytics_configuration_output_of_xml i attrs =
  let r_analytics_configuration = ref None in
  Structure.scanSequence i [ "AnalyticsConfiguration" ] (fun tag _ ->
      match tag with
      | "AnalyticsConfiguration" ->
          r_analytics_configuration :=
            Some
              (Read.sequence i "AnalyticsConfiguration"
                 (fun i attrs -> analytics_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ analytics_configuration = ( ! ) r_analytics_configuration }
    : get_bucket_analytics_configuration_output)

let get_bucket_analytics_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> analytics_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_analytics_configuration_request)

let get_bucket_acl_output_of_xml i attrs =
  let r_owner = ref None in
  let r_grants = ref None in
  Structure.scanSequence i [ "Owner"; "AccessControlList" ] (fun tag _ ->
      match tag with
      | "Owner" ->
          r_owner := Some (Read.sequence i "Owner" (fun i attrs -> owner_of_xml i attrs) ())
      | "AccessControlList" ->
          r_grants :=
            Some
              (Read.sequence i "AccessControlList"
                 (fun i attrs -> Read.sequences i "Grant" (fun i attrs -> grant_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({ owner = ( ! ) r_owner; grants = ( ! ) r_grants } : get_bucket_acl_output)

let get_bucket_acl_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_acl_request)

let get_bucket_accelerate_configuration_output_of_xml i attrs =
  let r_status = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i [ "Status"; "RequestCharged" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Read.sequence i "Status" (fun i attrs -> bucket_accelerate_status_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ status = ( ! ) r_status; request_charged = ( ! ) r_request_charged }
    : get_bucket_accelerate_configuration_output)

let get_bucket_accelerate_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  let r_request_payer = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner"; "RequestPayer" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     request_payer = ( ! ) r_request_payer;
   }
    : get_bucket_accelerate_configuration_request)

let get_bucket_abac_output_of_xml i attrs =
  let r_abac_status = ref None in
  Structure.scanSequence i [ "AbacStatus" ] (fun tag _ ->
      match tag with
      | "AbacStatus" ->
          r_abac_status :=
            Some (Read.sequence i "AbacStatus" (fun i attrs -> abac_status_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ abac_status = ( ! ) r_abac_status } : get_bucket_abac_output)

let get_bucket_abac_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : get_bucket_abac_request)

let delete_public_access_block_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_public_access_block_request)

let delete_object_tagging_output_of_xml i attrs =
  let r_version_id = ref None in
  Structure.scanSequence i [ "VersionId" ] (fun tag _ ->
      match tag with
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ version_id = ( ! ) r_version_id } : delete_object_tagging_output)

let delete_object_tagging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_version_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Key"; "VersionId"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_object_tagging_request)

let message_of_xml i attrs = Read.data i
let code_of_xml i attrs = Read.data i

let error_of_xml i attrs =
  let r_key = ref None in
  let r_version_id = ref None in
  let r_code = ref None in
  let r_message = ref None in
  Structure.scanSequence i [ "Key"; "VersionId"; "Code"; "Message" ] (fun tag _ ->
      match tag with
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "Code" -> r_code := Some (Read.sequence i "Code" (fun i attrs -> code_of_xml i attrs) ())
      | "Message" ->
          r_message := Some (Read.sequence i "Message" (fun i attrs -> message_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     key = ( ! ) r_key;
     version_id = ( ! ) r_version_id;
     code = ( ! ) r_code;
     message = ( ! ) r_message;
   }
    : error)

let errors_of_xml i attrs = Read.sequences i "member" (fun i attrs -> error_of_xml i attrs) ()
let delete_marker_version_id_of_xml i attrs = Read.data i

let deleted_object_of_xml i attrs =
  let r_key = ref None in
  let r_version_id = ref None in
  let r_delete_marker = ref None in
  let r_delete_marker_version_id = ref None in
  Structure.scanSequence i [ "Key"; "VersionId"; "DeleteMarker"; "DeleteMarkerVersionId" ]
    (fun tag _ ->
      match tag with
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "DeleteMarker" ->
          r_delete_marker :=
            Some (Read.sequence i "DeleteMarker" (fun i attrs -> delete_marker_of_xml i attrs) ())
      | "DeleteMarkerVersionId" ->
          r_delete_marker_version_id :=
            Some
              (Read.sequence i "DeleteMarkerVersionId"
                 (fun i attrs -> delete_marker_version_id_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     key = ( ! ) r_key;
     version_id = ( ! ) r_version_id;
     delete_marker = ( ! ) r_delete_marker;
     delete_marker_version_id = ( ! ) r_delete_marker_version_id;
   }
    : deleted_object)

let deleted_objects_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> deleted_object_of_xml i attrs) ()

let delete_objects_output_of_xml i attrs =
  let r_deleted = ref None in
  let r_request_charged = ref None in
  let r_errors = ref None in
  Structure.scanSequence i [ "Deleted"; "RequestCharged"; "Error" ] (fun tag _ ->
      match tag with
      | "Deleted" ->
          r_deleted :=
            Some (Read.sequences i "Deleted" (fun i attrs -> deleted_object_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "Error" ->
          r_errors := Some (Read.sequences i "Error" (fun i attrs -> error_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ deleted = ( ! ) r_deleted; request_charged = ( ! ) r_request_charged; errors = ( ! ) r_errors }
    : delete_objects_output)

let quiet_of_xml i attrs = Primitive.bool_of_string (Read.data i)
let last_modified_time_of_xml i attrs = Primitive.timestamp_httpdate_of_string (Read.data i)

let object_identifier_of_xml i attrs =
  let r_key = ref None in
  let r_version_id = ref None in
  let r_e_tag = ref None in
  let r_last_modified_time = ref None in
  let r_size = ref None in
  Structure.scanSequence i [ "Key"; "VersionId"; "ETag"; "LastModifiedTime"; "Size" ] (fun tag _ ->
      match tag with
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "LastModifiedTime" ->
          r_last_modified_time :=
            Some
              (Read.sequence i "LastModifiedTime"
                 (fun i attrs -> last_modified_time_of_xml i attrs)
                 ())
      | "Size" -> r_size := Some (Read.sequence i "Size" (fun i attrs -> size_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     key = required "Key" (( ! ) r_key) i;
     version_id = ( ! ) r_version_id;
     e_tag = ( ! ) r_e_tag;
     last_modified_time = ( ! ) r_last_modified_time;
     size = ( ! ) r_size;
   }
    : object_identifier)

let object_identifier_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> object_identifier_of_xml i attrs) ()

let delete_of_xml i attrs =
  let r_objects = ref None in
  let r_quiet = ref None in
  Structure.scanSequence i [ "Object"; "Quiet" ] (fun tag _ ->
      match tag with
      | "Object" ->
          r_objects :=
            Some (Read.sequences i "Object" (fun i attrs -> object_identifier_of_xml i attrs) ())
      | "Quiet" ->
          r_quiet := Some (Read.sequence i "Quiet" (fun i attrs -> quiet_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ objects = required "Object" (( ! ) r_objects) i; quiet = ( ! ) r_quiet } : delete)

let delete_objects_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_delete = ref None in
  let r_mf_a = ref None in
  let r_request_payer = ref None in
  let r_bypass_governance_retention = ref None in
  let r_expected_bucket_owner = ref None in
  let r_checksum_algorithm = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Delete";
      "MFA";
      "RequestPayer";
      "BypassGovernanceRetention";
      "ExpectedBucketOwner";
      "ChecksumAlgorithm";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Delete" ->
          r_delete := Some (Read.sequence i "Delete" (fun i attrs -> delete_of_xml i attrs) ())
      | "MFA" -> r_mf_a := Some (Read.sequence i "MFA" (fun i attrs -> mf_a_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "BypassGovernanceRetention" ->
          r_bypass_governance_retention :=
            Some
              (Read.sequence i "BypassGovernanceRetention"
                 (fun i attrs -> bypass_governance_retention_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     delete = required "Delete" (( ! ) r_delete) i;
     mf_a = ( ! ) r_mf_a;
     request_payer = ( ! ) r_request_payer;
     bypass_governance_retention = ( ! ) r_bypass_governance_retention;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
   }
    : delete_objects_request)

let delete_object_annotation_output_of_xml i attrs =
  let r_object_version_id = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i [ "ObjectVersionId"; "RequestCharged" ] (fun tag _ ->
      match tag with
      | "ObjectVersionId" ->
          r_object_version_id :=
            Some
              (Read.sequence i "ObjectVersionId"
                 (fun i attrs -> object_version_id_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ object_version_id = ( ! ) r_object_version_id; request_charged = ( ! ) r_request_charged }
    : delete_object_annotation_output)

let delete_object_annotation_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_annotation_name = ref None in
  let r_version_id = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_object_if_match = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "AnnotationName";
      "VersionId";
      "RequestPayer";
      "ExpectedBucketOwner";
      "ObjectIfMatch";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "AnnotationName" ->
          r_annotation_name :=
            Some
              (Read.sequence i "AnnotationName" (fun i attrs -> annotation_name_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ObjectIfMatch" ->
          r_object_if_match :=
            Some
              (Read.sequence i "ObjectIfMatch" (fun i attrs -> object_if_match_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     annotation_name = required "AnnotationName" (( ! ) r_annotation_name) i;
     version_id = ( ! ) r_version_id;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     object_if_match = ( ! ) r_object_if_match;
   }
    : delete_object_annotation_request)

let delete_object_output_of_xml i attrs =
  let r_delete_marker = ref None in
  let r_version_id = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i [ "DeleteMarker"; "VersionId"; "RequestCharged" ] (fun tag _ ->
      match tag with
      | "DeleteMarker" ->
          r_delete_marker :=
            Some (Read.sequence i "DeleteMarker" (fun i attrs -> delete_marker_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     delete_marker = ( ! ) r_delete_marker;
     version_id = ( ! ) r_version_id;
     request_charged = ( ! ) r_request_charged;
   }
    : delete_object_output)

let if_match_size_of_xml i attrs = Primitive.long_of_string (Read.data i)

let if_match_last_modified_time_of_xml i attrs =
  Primitive.timestamp_httpdate_of_string (Read.data i)

let delete_object_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_mf_a = ref None in
  let r_version_id = ref None in
  let r_request_payer = ref None in
  let r_bypass_governance_retention = ref None in
  let r_expected_bucket_owner = ref None in
  let r_if_match = ref None in
  let r_if_match_last_modified_time = ref None in
  let r_if_match_size = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "MFA";
      "VersionId";
      "RequestPayer";
      "BypassGovernanceRetention";
      "ExpectedBucketOwner";
      "IfMatch";
      "IfMatchLastModifiedTime";
      "IfMatchSize";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "MFA" -> r_mf_a := Some (Read.sequence i "MFA" (fun i attrs -> mf_a_of_xml i attrs) ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "BypassGovernanceRetention" ->
          r_bypass_governance_retention :=
            Some
              (Read.sequence i "BypassGovernanceRetention"
                 (fun i attrs -> bypass_governance_retention_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "IfMatch" ->
          r_if_match := Some (Read.sequence i "IfMatch" (fun i attrs -> if_match_of_xml i attrs) ())
      | "IfMatchLastModifiedTime" ->
          r_if_match_last_modified_time :=
            Some
              (Read.sequence i "IfMatchLastModifiedTime"
                 (fun i attrs -> if_match_last_modified_time_of_xml i attrs)
                 ())
      | "IfMatchSize" ->
          r_if_match_size :=
            Some (Read.sequence i "IfMatchSize" (fun i attrs -> if_match_size_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     mf_a = ( ! ) r_mf_a;
     version_id = ( ! ) r_version_id;
     request_payer = ( ! ) r_request_payer;
     bypass_governance_retention = ( ! ) r_bypass_governance_retention;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     if_match = ( ! ) r_if_match;
     if_match_last_modified_time = ( ! ) r_if_match_last_modified_time;
     if_match_size = ( ! ) r_if_match_size;
   }
    : delete_object_request)

let delete_bucket_website_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_website_request)

let delete_bucket_tagging_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_tagging_request)

let delete_bucket_replication_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_replication_request)

let delete_bucket_policy_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_policy_request)

let delete_bucket_ownership_controls_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_ownership_controls_request)

let delete_bucket_metrics_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> metrics_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_metrics_configuration_request)

let delete_bucket_metadata_table_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_metadata_table_configuration_request)

let delete_bucket_metadata_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_metadata_configuration_request)

let delete_bucket_lifecycle_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_lifecycle_request)

let delete_bucket_inventory_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> inventory_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_inventory_configuration_request)

let delete_bucket_intelligent_tiering_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" ->
          r_id :=
            Some (Read.sequence i "Id" (fun i attrs -> intelligent_tiering_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_intelligent_tiering_configuration_request)

let delete_bucket_encryption_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_encryption_request)

let delete_bucket_cors_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_cors_request)

let delete_bucket_analytics_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_id = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "Id"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Id" -> r_id := Some (Read.sequence i "Id" (fun i attrs -> analytics_id_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     id = required "Id" (( ! ) r_id) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_analytics_configuration_request)

let delete_bucket_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i [ "Bucket"; "ExpectedBucketOwner" ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : delete_bucket_request)

let session_expiration_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let session_credential_value_of_xml i attrs = Read.data i

let session_credentials_of_xml i attrs =
  let r_access_key_id = ref None in
  let r_secret_access_key = ref None in
  let r_session_token = ref None in
  let r_expiration = ref None in
  Structure.scanSequence i [ "AccessKeyId"; "SecretAccessKey"; "SessionToken"; "Expiration" ]
    (fun tag _ ->
      match tag with
      | "AccessKeyId" ->
          r_access_key_id :=
            Some
              (Read.sequence i "AccessKeyId" (fun i attrs -> access_key_id_value_of_xml i attrs) ())
      | "SecretAccessKey" ->
          r_secret_access_key :=
            Some
              (Read.sequence i "SecretAccessKey"
                 (fun i attrs -> session_credential_value_of_xml i attrs)
                 ())
      | "SessionToken" ->
          r_session_token :=
            Some
              (Read.sequence i "SessionToken"
                 (fun i attrs -> session_credential_value_of_xml i attrs)
                 ())
      | "Expiration" ->
          r_expiration :=
            Some
              (Read.sequence i "Expiration" (fun i attrs -> session_expiration_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     access_key_id = required "AccessKeyId" (( ! ) r_access_key_id) i;
     secret_access_key = required "SecretAccessKey" (( ! ) r_secret_access_key) i;
     session_token = required "SessionToken" (( ! ) r_session_token) i;
     expiration = required "Expiration" (( ! ) r_expiration) i;
   }
    : session_credentials)

let create_session_output_of_xml i attrs =
  let r_server_side_encryption = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  let r_credentials = ref None in
  Structure.scanSequence i
    [
      "ServerSideEncryption";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
      "Credentials";
    ] (fun tag _ ->
      match tag with
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "Credentials" ->
          r_credentials :=
            Some
              (Read.sequence i "Credentials" (fun i attrs -> session_credentials_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     server_side_encryption = ( ! ) r_server_side_encryption;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     credentials = required "Credentials" (( ! ) r_credentials) i;
   }
    : create_session_output)

let session_mode_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "ReadOnly" -> ReadOnly
   | "ReadWrite" -> ReadWrite
   | _ -> failwith "unknown enum value"
    : session_mode)

let create_session_request_of_xml i attrs =
  let r_session_mode = ref None in
  let r_bucket = ref None in
  let r_server_side_encryption = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  Structure.scanSequence i
    [
      "SessionMode";
      "Bucket";
      "ServerSideEncryption";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
    ] (fun tag _ ->
      match tag with
      | "SessionMode" ->
          r_session_mode :=
            Some (Read.sequence i "SessionMode" (fun i attrs -> session_mode_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     session_mode = ( ! ) r_session_mode;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     server_side_encryption = ( ! ) r_server_side_encryption;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
   }
    : create_session_request)

let create_multipart_upload_output_of_xml i attrs =
  let r_abort_date = ref None in
  let r_abort_rule_id = ref None in
  let r_bucket = ref None in
  let r_key = ref None in
  let r_upload_id = ref None in
  let r_server_side_encryption = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  let r_request_charged = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_type = ref None in
  Structure.scanSequence i
    [
      "AbortDate";
      "AbortRuleId";
      "Bucket";
      "Key";
      "UploadId";
      "ServerSideEncryption";
      "SSECustomerAlgorithm";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
      "RequestCharged";
      "ChecksumAlgorithm";
      "ChecksumType";
    ] (fun tag _ ->
      match tag with
      | "AbortDate" ->
          r_abort_date :=
            Some (Read.sequence i "AbortDate" (fun i attrs -> abort_date_of_xml i attrs) ())
      | "AbortRuleId" ->
          r_abort_rule_id :=
            Some (Read.sequence i "AbortRuleId" (fun i attrs -> abort_rule_id_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     abort_date = ( ! ) r_abort_date;
     abort_rule_id = ( ! ) r_abort_rule_id;
     bucket = ( ! ) r_bucket;
     key = ( ! ) r_key;
     upload_id = ( ! ) r_upload_id;
     server_side_encryption = ( ! ) r_server_side_encryption;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     request_charged = ( ! ) r_request_charged;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_type = ( ! ) r_checksum_type;
   }
    : create_multipart_upload_output)

let create_multipart_upload_request_of_xml i attrs =
  let r_ac_l = ref None in
  let r_bucket = ref None in
  let r_cache_control = ref None in
  let r_content_disposition = ref None in
  let r_content_encoding = ref None in
  let r_content_language = ref None in
  let r_content_type = ref None in
  let r_expires = ref None in
  let r_grant_full_control = ref None in
  let r_grant_read = ref None in
  let r_grant_read_ac_p = ref None in
  let r_grant_write_ac_p = ref None in
  let r_key = ref None in
  let r_metadata = ref None in
  let r_server_side_encryption = ref None in
  let r_storage_class = ref None in
  let r_website_redirect_location = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  let r_request_payer = ref None in
  let r_tagging = ref None in
  let r_object_lock_mode = ref None in
  let r_object_lock_retain_until_date = ref None in
  let r_object_lock_legal_hold_status = ref None in
  let r_expected_bucket_owner = ref None in
  let r_checksum_algorithm = ref None in
  let r_checksum_type = ref None in
  Structure.scanSequence i
    [
      "ACL";
      "Bucket";
      "CacheControl";
      "ContentDisposition";
      "ContentEncoding";
      "ContentLanguage";
      "ContentType";
      "Expires";
      "GrantFullControl";
      "GrantRead";
      "GrantReadACP";
      "GrantWriteACP";
      "Key";
      "Metadata";
      "ServerSideEncryption";
      "StorageClass";
      "WebsiteRedirectLocation";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
      "RequestPayer";
      "Tagging";
      "ObjectLockMode";
      "ObjectLockRetainUntilDate";
      "ObjectLockLegalHoldStatus";
      "ExpectedBucketOwner";
      "ChecksumAlgorithm";
      "ChecksumType";
    ] (fun tag _ ->
      match tag with
      | "ACL" ->
          r_ac_l :=
            Some (Read.sequence i "ACL" (fun i attrs -> object_canned_ac_l_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "CacheControl" ->
          r_cache_control :=
            Some (Read.sequence i "CacheControl" (fun i attrs -> cache_control_of_xml i attrs) ())
      | "ContentDisposition" ->
          r_content_disposition :=
            Some
              (Read.sequence i "ContentDisposition"
                 (fun i attrs -> content_disposition_of_xml i attrs)
                 ())
      | "ContentEncoding" ->
          r_content_encoding :=
            Some
              (Read.sequence i "ContentEncoding"
                 (fun i attrs -> content_encoding_of_xml i attrs)
                 ())
      | "ContentLanguage" ->
          r_content_language :=
            Some
              (Read.sequence i "ContentLanguage"
                 (fun i attrs -> content_language_of_xml i attrs)
                 ())
      | "ContentType" ->
          r_content_type :=
            Some (Read.sequence i "ContentType" (fun i attrs -> content_type_of_xml i attrs) ())
      | "Expires" ->
          r_expires := Some (Read.sequence i "Expires" (fun i attrs -> expires_of_xml i attrs) ())
      | "GrantFullControl" ->
          r_grant_full_control :=
            Some
              (Read.sequence i "GrantFullControl"
                 (fun i attrs -> grant_full_control_of_xml i attrs)
                 ())
      | "GrantRead" ->
          r_grant_read :=
            Some (Read.sequence i "GrantRead" (fun i attrs -> grant_read_of_xml i attrs) ())
      | "GrantReadACP" ->
          r_grant_read_ac_p :=
            Some (Read.sequence i "GrantReadACP" (fun i attrs -> grant_read_ac_p_of_xml i attrs) ())
      | "GrantWriteACP" ->
          r_grant_write_ac_p :=
            Some
              (Read.sequence i "GrantWriteACP" (fun i attrs -> grant_write_ac_p_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Read.sequence i "Metadata"
                 (fun i attrs ->
                   Read.sequences i "entry"
                     (fun i attrs ->
                       let k =
                         Read.sequence i "key" (fun i attrs -> metadata_key_of_xml i attrs) ()
                       in
                       let v =
                         Read.sequence i "value" (fun i attrs -> metadata_value_of_xml i attrs) ()
                       in
                       (k, v))
                     ())
                 ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "WebsiteRedirectLocation" ->
          r_website_redirect_location :=
            Some
              (Read.sequence i "WebsiteRedirectLocation"
                 (fun i attrs -> website_redirect_location_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "Tagging" ->
          r_tagging :=
            Some (Read.sequence i "Tagging" (fun i attrs -> tagging_header_of_xml i attrs) ())
      | "ObjectLockMode" ->
          r_object_lock_mode :=
            Some
              (Read.sequence i "ObjectLockMode" (fun i attrs -> object_lock_mode_of_xml i attrs) ())
      | "ObjectLockRetainUntilDate" ->
          r_object_lock_retain_until_date :=
            Some
              (Read.sequence i "ObjectLockRetainUntilDate"
                 (fun i attrs -> object_lock_retain_until_date_of_xml i attrs)
                 ())
      | "ObjectLockLegalHoldStatus" ->
          r_object_lock_legal_hold_status :=
            Some
              (Read.sequence i "ObjectLockLegalHoldStatus"
                 (fun i attrs -> object_lock_legal_hold_status_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     ac_l = ( ! ) r_ac_l;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     cache_control = ( ! ) r_cache_control;
     content_disposition = ( ! ) r_content_disposition;
     content_encoding = ( ! ) r_content_encoding;
     content_language = ( ! ) r_content_language;
     content_type = ( ! ) r_content_type;
     expires = ( ! ) r_expires;
     grant_full_control = ( ! ) r_grant_full_control;
     grant_read = ( ! ) r_grant_read;
     grant_read_ac_p = ( ! ) r_grant_read_ac_p;
     grant_write_ac_p = ( ! ) r_grant_write_ac_p;
     key = required "Key" (( ! ) r_key) i;
     metadata = ( ! ) r_metadata;
     server_side_encryption = ( ! ) r_server_side_encryption;
     storage_class = ( ! ) r_storage_class;
     website_redirect_location = ( ! ) r_website_redirect_location;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     request_payer = ( ! ) r_request_payer;
     tagging = ( ! ) r_tagging;
     object_lock_mode = ( ! ) r_object_lock_mode;
     object_lock_retain_until_date = ( ! ) r_object_lock_retain_until_date;
     object_lock_legal_hold_status = ( ! ) r_object_lock_legal_hold_status;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     checksum_type = ( ! ) r_checksum_type;
   }
    : create_multipart_upload_request)

let s3_tables_destination_of_xml i attrs =
  let r_table_bucket_arn = ref None in
  let r_table_name = ref None in
  Structure.scanSequence i [ "TableBucketArn"; "TableName" ] (fun tag _ ->
      match tag with
      | "TableBucketArn" ->
          r_table_bucket_arn :=
            Some
              (Read.sequence i "TableBucketArn"
                 (fun i attrs -> s3_tables_bucket_arn_of_xml i attrs)
                 ())
      | "TableName" ->
          r_table_name :=
            Some (Read.sequence i "TableName" (fun i attrs -> s3_tables_name_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     table_bucket_arn = required "TableBucketArn" (( ! ) r_table_bucket_arn) i;
     table_name = required "TableName" (( ! ) r_table_name) i;
   }
    : s3_tables_destination)

let metadata_table_configuration_of_xml i attrs =
  let r_s3_tables_destination = ref None in
  Structure.scanSequence i [ "S3TablesDestination" ] (fun tag _ ->
      match tag with
      | "S3TablesDestination" ->
          r_s3_tables_destination :=
            Some
              (Read.sequence i "S3TablesDestination"
                 (fun i attrs -> s3_tables_destination_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ s3_tables_destination = required "S3TablesDestination" (( ! ) r_s3_tables_destination) i }
    : metadata_table_configuration)

let create_bucket_metadata_table_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_metadata_table_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "ContentMD5";
      "ChecksumAlgorithm";
      "MetadataTableConfiguration";
      "ExpectedBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "MetadataTableConfiguration" ->
          r_metadata_table_configuration :=
            Some
              (Read.sequence i "MetadataTableConfiguration"
                 (fun i attrs -> metadata_table_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     metadata_table_configuration =
       required "MetadataTableConfiguration" (( ! ) r_metadata_table_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : create_bucket_metadata_table_configuration_request)

let annotation_table_configuration_of_xml i attrs =
  let r_configuration_state = ref None in
  let r_encryption_configuration = ref None in
  let r_role = ref None in
  Structure.scanSequence i [ "ConfigurationState"; "EncryptionConfiguration"; "Role" ] (fun tag _ ->
      match tag with
      | "ConfigurationState" ->
          r_configuration_state :=
            Some
              (Read.sequence i "ConfigurationState"
                 (fun i attrs -> annotation_configuration_state_of_xml i attrs)
                 ())
      | "EncryptionConfiguration" ->
          r_encryption_configuration :=
            Some
              (Read.sequence i "EncryptionConfiguration"
                 (fun i attrs -> metadata_table_encryption_configuration_of_xml i attrs)
                 ())
      | "Role" -> r_role := Some (Read.sequence i "Role" (fun i attrs -> role_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     configuration_state = required "ConfigurationState" (( ! ) r_configuration_state) i;
     encryption_configuration = ( ! ) r_encryption_configuration;
     role = ( ! ) r_role;
   }
    : annotation_table_configuration)

let inventory_table_configuration_of_xml i attrs =
  let r_configuration_state = ref None in
  let r_encryption_configuration = ref None in
  Structure.scanSequence i [ "ConfigurationState"; "EncryptionConfiguration" ] (fun tag _ ->
      match tag with
      | "ConfigurationState" ->
          r_configuration_state :=
            Some
              (Read.sequence i "ConfigurationState"
                 (fun i attrs -> inventory_configuration_state_of_xml i attrs)
                 ())
      | "EncryptionConfiguration" ->
          r_encryption_configuration :=
            Some
              (Read.sequence i "EncryptionConfiguration"
                 (fun i attrs -> metadata_table_encryption_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     configuration_state = required "ConfigurationState" (( ! ) r_configuration_state) i;
     encryption_configuration = ( ! ) r_encryption_configuration;
   }
    : inventory_table_configuration)

let journal_table_configuration_of_xml i attrs =
  let r_record_expiration = ref None in
  let r_encryption_configuration = ref None in
  Structure.scanSequence i [ "RecordExpiration"; "EncryptionConfiguration" ] (fun tag _ ->
      match tag with
      | "RecordExpiration" ->
          r_record_expiration :=
            Some
              (Read.sequence i "RecordExpiration"
                 (fun i attrs -> record_expiration_of_xml i attrs)
                 ())
      | "EncryptionConfiguration" ->
          r_encryption_configuration :=
            Some
              (Read.sequence i "EncryptionConfiguration"
                 (fun i attrs -> metadata_table_encryption_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     record_expiration = required "RecordExpiration" (( ! ) r_record_expiration) i;
     encryption_configuration = ( ! ) r_encryption_configuration;
   }
    : journal_table_configuration)

let metadata_configuration_of_xml i attrs =
  let r_journal_table_configuration = ref None in
  let r_inventory_table_configuration = ref None in
  let r_annotation_table_configuration = ref None in
  Structure.scanSequence i
    [ "JournalTableConfiguration"; "InventoryTableConfiguration"; "AnnotationTableConfiguration" ]
    (fun tag _ ->
      match tag with
      | "JournalTableConfiguration" ->
          r_journal_table_configuration :=
            Some
              (Read.sequence i "JournalTableConfiguration"
                 (fun i attrs -> journal_table_configuration_of_xml i attrs)
                 ())
      | "InventoryTableConfiguration" ->
          r_inventory_table_configuration :=
            Some
              (Read.sequence i "InventoryTableConfiguration"
                 (fun i attrs -> inventory_table_configuration_of_xml i attrs)
                 ())
      | "AnnotationTableConfiguration" ->
          r_annotation_table_configuration :=
            Some
              (Read.sequence i "AnnotationTableConfiguration"
                 (fun i attrs -> annotation_table_configuration_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     journal_table_configuration =
       required "JournalTableConfiguration" (( ! ) r_journal_table_configuration) i;
     inventory_table_configuration = ( ! ) r_inventory_table_configuration;
     annotation_table_configuration = ( ! ) r_annotation_table_configuration;
   }
    : metadata_configuration)

let create_bucket_metadata_configuration_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_content_m_d5 = ref None in
  let r_checksum_algorithm = ref None in
  let r_metadata_configuration = ref None in
  let r_expected_bucket_owner = ref None in
  Structure.scanSequence i
    [ "Bucket"; "ContentMD5"; "ChecksumAlgorithm"; "MetadataConfiguration"; "ExpectedBucketOwner" ]
    (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "ContentMD5" ->
          r_content_m_d5 :=
            Some (Read.sequence i "ContentMD5" (fun i attrs -> content_m_d5_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "MetadataConfiguration" ->
          r_metadata_configuration :=
            Some
              (Read.sequence i "MetadataConfiguration"
                 (fun i attrs -> metadata_configuration_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     content_m_d5 = ( ! ) r_content_m_d5;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     metadata_configuration = required "MetadataConfiguration" (( ! ) r_metadata_configuration) i;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
   }
    : create_bucket_metadata_configuration_request)

let bucket_already_owned_by_you_of_xml i attrs = ()
let bucket_already_exists_of_xml i attrs = ()
let location_of_xml i attrs = Read.data i

let create_bucket_output_of_xml i attrs =
  let r_location = ref None in
  let r_bucket_arn = ref None in
  Structure.scanSequence i [ "Location"; "BucketArn" ] (fun tag _ ->
      match tag with
      | "Location" ->
          r_location :=
            Some (Read.sequence i "Location" (fun i attrs -> location_of_xml i attrs) ())
      | "BucketArn" ->
          r_bucket_arn :=
            Some
              (Read.sequence i "BucketArn"
                 (fun i attrs -> s3_regional_or_s3_express_bucket_arn_string_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({ location = ( ! ) r_location; bucket_arn = ( ! ) r_bucket_arn } : create_bucket_output)

let bucket_namespace_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "account-regional" -> ACCOUNT_REGIONAL
   | "global" -> GLOBAL
   | _ -> failwith "unknown enum value"
    : bucket_namespace)

let object_lock_enabled_for_bucket_of_xml i attrs = Primitive.bool_of_string (Read.data i)

let bucket_type_of_xml i attrs =
  let s = Read.data i in
  (match s with "Directory" -> Directory | _ -> failwith "unknown enum value" : bucket_type)

let data_redundancy_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "SingleAvailabilityZone" -> SingleAvailabilityZone
   | "SingleLocalZone" -> SingleLocalZone
   | _ -> failwith "unknown enum value"
    : data_redundancy)

let bucket_info_of_xml i attrs =
  let r_data_redundancy = ref None in
  let r_type_ = ref None in
  Structure.scanSequence i [ "DataRedundancy"; "Type" ] (fun tag _ ->
      match tag with
      | "DataRedundancy" ->
          r_data_redundancy :=
            Some
              (Read.sequence i "DataRedundancy" (fun i attrs -> data_redundancy_of_xml i attrs) ())
      | "Type" ->
          r_type_ := Some (Read.sequence i "Type" (fun i attrs -> bucket_type_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ data_redundancy = ( ! ) r_data_redundancy; type_ = ( ! ) r_type_ } : bucket_info)

let location_name_as_string_of_xml i attrs = Read.data i

let location_info_of_xml i attrs =
  let r_type_ = ref None in
  let r_name = ref None in
  Structure.scanSequence i [ "Type"; "Name" ] (fun tag _ ->
      match tag with
      | "Type" ->
          r_type_ := Some (Read.sequence i "Type" (fun i attrs -> location_type_of_xml i attrs) ())
      | "Name" ->
          r_name :=
            Some (Read.sequence i "Name" (fun i attrs -> location_name_as_string_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ type_ = ( ! ) r_type_; name = ( ! ) r_name } : location_info)

let create_bucket_configuration_of_xml i attrs =
  let r_location_constraint = ref None in
  let r_location = ref None in
  let r_bucket = ref None in
  let r_tags = ref None in
  Structure.scanSequence i [ "LocationConstraint"; "Location"; "Bucket"; "Tags" ] (fun tag _ ->
      match tag with
      | "LocationConstraint" ->
          r_location_constraint :=
            Some
              (Read.sequence i "LocationConstraint"
                 (fun i attrs -> bucket_location_constraint_of_xml i attrs)
                 ())
      | "Location" ->
          r_location :=
            Some (Read.sequence i "Location" (fun i attrs -> location_info_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_info_of_xml i attrs) ())
      | "Tags" ->
          r_tags :=
            Some
              (Read.sequence i "Tags"
                 (fun i attrs -> Read.sequences i "Tag" (fun i attrs -> tag_of_xml i attrs) ())
                 ())
      | _ -> Read.skip_element i);
  ({
     location_constraint = ( ! ) r_location_constraint;
     location = ( ! ) r_location;
     bucket = ( ! ) r_bucket;
     tags = ( ! ) r_tags;
   }
    : create_bucket_configuration)

let create_bucket_request_of_xml i attrs =
  let r_ac_l = ref None in
  let r_bucket = ref None in
  let r_create_bucket_configuration = ref None in
  let r_grant_full_control = ref None in
  let r_grant_read = ref None in
  let r_grant_read_ac_p = ref None in
  let r_grant_write = ref None in
  let r_grant_write_ac_p = ref None in
  let r_object_lock_enabled_for_bucket = ref None in
  let r_object_ownership = ref None in
  let r_bucket_namespace = ref None in
  Structure.scanSequence i
    [
      "ACL";
      "Bucket";
      "CreateBucketConfiguration";
      "GrantFullControl";
      "GrantRead";
      "GrantReadACP";
      "GrantWrite";
      "GrantWriteACP";
      "ObjectLockEnabledForBucket";
      "ObjectOwnership";
      "BucketNamespace";
    ] (fun tag _ ->
      match tag with
      | "ACL" ->
          r_ac_l :=
            Some (Read.sequence i "ACL" (fun i attrs -> bucket_canned_ac_l_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "CreateBucketConfiguration" ->
          r_create_bucket_configuration :=
            Some
              (Read.sequence i "CreateBucketConfiguration"
                 (fun i attrs -> create_bucket_configuration_of_xml i attrs)
                 ())
      | "GrantFullControl" ->
          r_grant_full_control :=
            Some
              (Read.sequence i "GrantFullControl"
                 (fun i attrs -> grant_full_control_of_xml i attrs)
                 ())
      | "GrantRead" ->
          r_grant_read :=
            Some (Read.sequence i "GrantRead" (fun i attrs -> grant_read_of_xml i attrs) ())
      | "GrantReadACP" ->
          r_grant_read_ac_p :=
            Some (Read.sequence i "GrantReadACP" (fun i attrs -> grant_read_ac_p_of_xml i attrs) ())
      | "GrantWrite" ->
          r_grant_write :=
            Some (Read.sequence i "GrantWrite" (fun i attrs -> grant_write_of_xml i attrs) ())
      | "GrantWriteACP" ->
          r_grant_write_ac_p :=
            Some
              (Read.sequence i "GrantWriteACP" (fun i attrs -> grant_write_ac_p_of_xml i attrs) ())
      | "ObjectLockEnabledForBucket" ->
          r_object_lock_enabled_for_bucket :=
            Some
              (Read.sequence i "ObjectLockEnabledForBucket"
                 (fun i attrs -> object_lock_enabled_for_bucket_of_xml i attrs)
                 ())
      | "ObjectOwnership" ->
          r_object_ownership :=
            Some
              (Read.sequence i "ObjectOwnership"
                 (fun i attrs -> object_ownership_of_xml i attrs)
                 ())
      | "BucketNamespace" ->
          r_bucket_namespace :=
            Some
              (Read.sequence i "BucketNamespace"
                 (fun i attrs -> bucket_namespace_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     ac_l = ( ! ) r_ac_l;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     create_bucket_configuration = ( ! ) r_create_bucket_configuration;
     grant_full_control = ( ! ) r_grant_full_control;
     grant_read = ( ! ) r_grant_read;
     grant_read_ac_p = ( ! ) r_grant_read_ac_p;
     grant_write = ( ! ) r_grant_write;
     grant_write_ac_p = ( ! ) r_grant_write_ac_p;
     object_lock_enabled_for_bucket = ( ! ) r_object_lock_enabled_for_bucket;
     object_ownership = ( ! ) r_object_ownership;
     bucket_namespace = ( ! ) r_bucket_namespace;
   }
    : create_bucket_request)

let object_not_in_active_tier_error_of_xml i attrs = ()

let copy_object_result_of_xml i attrs =
  let r_e_tag = ref None in
  let r_last_modified = ref None in
  let r_checksum_type = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  Structure.scanSequence i
    [
      "ETag";
      "LastModified";
      "ChecksumType";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
    ] (fun tag _ ->
      match tag with
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "LastModified" ->
          r_last_modified :=
            Some (Read.sequence i "LastModified" (fun i attrs -> last_modified_of_xml i attrs) ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     e_tag = ( ! ) r_e_tag;
     last_modified = ( ! ) r_last_modified;
     checksum_type = ( ! ) r_checksum_type;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
   }
    : copy_object_result)

let copy_object_output_of_xml i attrs =
  let r_copy_object_result = ref None in
  let r_expiration = ref None in
  let r_copy_source_version_id = ref None in
  let r_version_id = ref None in
  let r_server_side_encryption = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "CopyObjectResult";
      "Expiration";
      "CopySourceVersionId";
      "VersionId";
      "ServerSideEncryption";
      "SSECustomerAlgorithm";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "CopyObjectResult" ->
          r_copy_object_result :=
            Some
              (Read.sequence i "CopyObjectResult"
                 (fun i attrs -> copy_object_result_of_xml i attrs)
                 ())
      | "Expiration" ->
          r_expiration :=
            Some (Read.sequence i "Expiration" (fun i attrs -> expiration_of_xml i attrs) ())
      | "CopySourceVersionId" ->
          r_copy_source_version_id :=
            Some
              (Read.sequence i "CopySourceVersionId"
                 (fun i attrs -> copy_source_version_id_of_xml i attrs)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     copy_object_result = ( ! ) r_copy_object_result;
     expiration = ( ! ) r_expiration;
     copy_source_version_id = ( ! ) r_copy_source_version_id;
     version_id = ( ! ) r_version_id;
     server_side_encryption = ( ! ) r_server_side_encryption;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     request_charged = ( ! ) r_request_charged;
   }
    : copy_object_output)

let annotation_directive_of_xml i attrs =
  let s = Read.data i in
  (match s with "COPY" -> COPY | "EXCLUDE" -> EXCLUDE | _ -> failwith "unknown enum value"
    : annotation_directive)

let tagging_directive_of_xml i attrs =
  let s = Read.data i in
  (match s with "COPY" -> COPY | "REPLACE" -> REPLACE | _ -> failwith "unknown enum value"
    : tagging_directive)

let metadata_directive_of_xml i attrs =
  let s = Read.data i in
  (match s with "COPY" -> COPY | "REPLACE" -> REPLACE | _ -> failwith "unknown enum value"
    : metadata_directive)

let copy_object_request_of_xml i attrs =
  let r_ac_l = ref None in
  let r_bucket = ref None in
  let r_cache_control = ref None in
  let r_checksum_algorithm = ref None in
  let r_content_disposition = ref None in
  let r_content_encoding = ref None in
  let r_content_language = ref None in
  let r_content_type = ref None in
  let r_copy_source = ref None in
  let r_copy_source_if_match = ref None in
  let r_copy_source_if_modified_since = ref None in
  let r_copy_source_if_none_match = ref None in
  let r_copy_source_if_unmodified_since = ref None in
  let r_expires = ref None in
  let r_grant_full_control = ref None in
  let r_grant_read = ref None in
  let r_grant_read_ac_p = ref None in
  let r_grant_write_ac_p = ref None in
  let r_if_match = ref None in
  let r_if_none_match = ref None in
  let r_key = ref None in
  let r_metadata = ref None in
  let r_metadata_directive = ref None in
  let r_tagging_directive = ref None in
  let r_annotation_directive = ref None in
  let r_server_side_encryption = ref None in
  let r_storage_class = ref None in
  let r_website_redirect_location = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  let r_ssekms_key_id = ref None in
  let r_ssekms_encryption_context = ref None in
  let r_bucket_key_enabled = ref None in
  let r_copy_source_sse_customer_algorithm = ref None in
  let r_copy_source_sse_customer_key = ref None in
  let r_copy_source_sse_customer_key_m_d5 = ref None in
  let r_request_payer = ref None in
  let r_tagging = ref None in
  let r_object_lock_mode = ref None in
  let r_object_lock_retain_until_date = ref None in
  let r_object_lock_legal_hold_status = ref None in
  let r_expected_bucket_owner = ref None in
  let r_expected_source_bucket_owner = ref None in
  Structure.scanSequence i
    [
      "ACL";
      "Bucket";
      "CacheControl";
      "ChecksumAlgorithm";
      "ContentDisposition";
      "ContentEncoding";
      "ContentLanguage";
      "ContentType";
      "CopySource";
      "CopySourceIfMatch";
      "CopySourceIfModifiedSince";
      "CopySourceIfNoneMatch";
      "CopySourceIfUnmodifiedSince";
      "Expires";
      "GrantFullControl";
      "GrantRead";
      "GrantReadACP";
      "GrantWriteACP";
      "IfMatch";
      "IfNoneMatch";
      "Key";
      "Metadata";
      "MetadataDirective";
      "TaggingDirective";
      "AnnotationDirective";
      "ServerSideEncryption";
      "StorageClass";
      "WebsiteRedirectLocation";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
      "SSEKMSKeyId";
      "SSEKMSEncryptionContext";
      "BucketKeyEnabled";
      "CopySourceSSECustomerAlgorithm";
      "CopySourceSSECustomerKey";
      "CopySourceSSECustomerKeyMD5";
      "RequestPayer";
      "Tagging";
      "ObjectLockMode";
      "ObjectLockRetainUntilDate";
      "ObjectLockLegalHoldStatus";
      "ExpectedBucketOwner";
      "ExpectedSourceBucketOwner";
    ] (fun tag _ ->
      match tag with
      | "ACL" ->
          r_ac_l :=
            Some (Read.sequence i "ACL" (fun i attrs -> object_canned_ac_l_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "CacheControl" ->
          r_cache_control :=
            Some (Read.sequence i "CacheControl" (fun i attrs -> cache_control_of_xml i attrs) ())
      | "ChecksumAlgorithm" ->
          r_checksum_algorithm :=
            Some
              (Read.sequence i "ChecksumAlgorithm"
                 (fun i attrs -> checksum_algorithm_of_xml i attrs)
                 ())
      | "ContentDisposition" ->
          r_content_disposition :=
            Some
              (Read.sequence i "ContentDisposition"
                 (fun i attrs -> content_disposition_of_xml i attrs)
                 ())
      | "ContentEncoding" ->
          r_content_encoding :=
            Some
              (Read.sequence i "ContentEncoding"
                 (fun i attrs -> content_encoding_of_xml i attrs)
                 ())
      | "ContentLanguage" ->
          r_content_language :=
            Some
              (Read.sequence i "ContentLanguage"
                 (fun i attrs -> content_language_of_xml i attrs)
                 ())
      | "ContentType" ->
          r_content_type :=
            Some (Read.sequence i "ContentType" (fun i attrs -> content_type_of_xml i attrs) ())
      | "CopySource" ->
          r_copy_source :=
            Some (Read.sequence i "CopySource" (fun i attrs -> copy_source_of_xml i attrs) ())
      | "CopySourceIfMatch" ->
          r_copy_source_if_match :=
            Some
              (Read.sequence i "CopySourceIfMatch"
                 (fun i attrs -> copy_source_if_match_of_xml i attrs)
                 ())
      | "CopySourceIfModifiedSince" ->
          r_copy_source_if_modified_since :=
            Some
              (Read.sequence i "CopySourceIfModifiedSince"
                 (fun i attrs -> copy_source_if_modified_since_of_xml i attrs)
                 ())
      | "CopySourceIfNoneMatch" ->
          r_copy_source_if_none_match :=
            Some
              (Read.sequence i "CopySourceIfNoneMatch"
                 (fun i attrs -> copy_source_if_none_match_of_xml i attrs)
                 ())
      | "CopySourceIfUnmodifiedSince" ->
          r_copy_source_if_unmodified_since :=
            Some
              (Read.sequence i "CopySourceIfUnmodifiedSince"
                 (fun i attrs -> copy_source_if_unmodified_since_of_xml i attrs)
                 ())
      | "Expires" ->
          r_expires := Some (Read.sequence i "Expires" (fun i attrs -> expires_of_xml i attrs) ())
      | "GrantFullControl" ->
          r_grant_full_control :=
            Some
              (Read.sequence i "GrantFullControl"
                 (fun i attrs -> grant_full_control_of_xml i attrs)
                 ())
      | "GrantRead" ->
          r_grant_read :=
            Some (Read.sequence i "GrantRead" (fun i attrs -> grant_read_of_xml i attrs) ())
      | "GrantReadACP" ->
          r_grant_read_ac_p :=
            Some (Read.sequence i "GrantReadACP" (fun i attrs -> grant_read_ac_p_of_xml i attrs) ())
      | "GrantWriteACP" ->
          r_grant_write_ac_p :=
            Some
              (Read.sequence i "GrantWriteACP" (fun i attrs -> grant_write_ac_p_of_xml i attrs) ())
      | "IfMatch" ->
          r_if_match := Some (Read.sequence i "IfMatch" (fun i attrs -> if_match_of_xml i attrs) ())
      | "IfNoneMatch" ->
          r_if_none_match :=
            Some (Read.sequence i "IfNoneMatch" (fun i attrs -> if_none_match_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Metadata" ->
          r_metadata :=
            Some
              (Read.sequence i "Metadata"
                 (fun i attrs ->
                   Read.sequences i "entry"
                     (fun i attrs ->
                       let k =
                         Read.sequence i "key" (fun i attrs -> metadata_key_of_xml i attrs) ()
                       in
                       let v =
                         Read.sequence i "value" (fun i attrs -> metadata_value_of_xml i attrs) ()
                       in
                       (k, v))
                     ())
                 ())
      | "MetadataDirective" ->
          r_metadata_directive :=
            Some
              (Read.sequence i "MetadataDirective"
                 (fun i attrs -> metadata_directive_of_xml i attrs)
                 ())
      | "TaggingDirective" ->
          r_tagging_directive :=
            Some
              (Read.sequence i "TaggingDirective"
                 (fun i attrs -> tagging_directive_of_xml i attrs)
                 ())
      | "AnnotationDirective" ->
          r_annotation_directive :=
            Some
              (Read.sequence i "AnnotationDirective"
                 (fun i attrs -> annotation_directive_of_xml i attrs)
                 ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "StorageClass" ->
          r_storage_class :=
            Some (Read.sequence i "StorageClass" (fun i attrs -> storage_class_of_xml i attrs) ())
      | "WebsiteRedirectLocation" ->
          r_website_redirect_location :=
            Some
              (Read.sequence i "WebsiteRedirectLocation"
                 (fun i attrs -> website_redirect_location_of_xml i attrs)
                 ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "SSEKMSEncryptionContext" ->
          r_ssekms_encryption_context :=
            Some
              (Read.sequence i "SSEKMSEncryptionContext"
                 (fun i attrs -> ssekms_encryption_context_of_xml i attrs)
                 ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "CopySourceSSECustomerAlgorithm" ->
          r_copy_source_sse_customer_algorithm :=
            Some
              (Read.sequence i "CopySourceSSECustomerAlgorithm"
                 (fun i attrs -> copy_source_sse_customer_algorithm_of_xml i attrs)
                 ())
      | "CopySourceSSECustomerKey" ->
          r_copy_source_sse_customer_key :=
            Some
              (Read.sequence i "CopySourceSSECustomerKey"
                 (fun i attrs -> copy_source_sse_customer_key_of_xml i attrs)
                 ())
      | "CopySourceSSECustomerKeyMD5" ->
          r_copy_source_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "CopySourceSSECustomerKeyMD5"
                 (fun i attrs -> copy_source_sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "Tagging" ->
          r_tagging :=
            Some (Read.sequence i "Tagging" (fun i attrs -> tagging_header_of_xml i attrs) ())
      | "ObjectLockMode" ->
          r_object_lock_mode :=
            Some
              (Read.sequence i "ObjectLockMode" (fun i attrs -> object_lock_mode_of_xml i attrs) ())
      | "ObjectLockRetainUntilDate" ->
          r_object_lock_retain_until_date :=
            Some
              (Read.sequence i "ObjectLockRetainUntilDate"
                 (fun i attrs -> object_lock_retain_until_date_of_xml i attrs)
                 ())
      | "ObjectLockLegalHoldStatus" ->
          r_object_lock_legal_hold_status :=
            Some
              (Read.sequence i "ObjectLockLegalHoldStatus"
                 (fun i attrs -> object_lock_legal_hold_status_of_xml i attrs)
                 ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "ExpectedSourceBucketOwner" ->
          r_expected_source_bucket_owner :=
            Some
              (Read.sequence i "ExpectedSourceBucketOwner"
                 (fun i attrs -> account_id_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     ac_l = ( ! ) r_ac_l;
     bucket = required "Bucket" (( ! ) r_bucket) i;
     cache_control = ( ! ) r_cache_control;
     checksum_algorithm = ( ! ) r_checksum_algorithm;
     content_disposition = ( ! ) r_content_disposition;
     content_encoding = ( ! ) r_content_encoding;
     content_language = ( ! ) r_content_language;
     content_type = ( ! ) r_content_type;
     copy_source = required "CopySource" (( ! ) r_copy_source) i;
     copy_source_if_match = ( ! ) r_copy_source_if_match;
     copy_source_if_modified_since = ( ! ) r_copy_source_if_modified_since;
     copy_source_if_none_match = ( ! ) r_copy_source_if_none_match;
     copy_source_if_unmodified_since = ( ! ) r_copy_source_if_unmodified_since;
     expires = ( ! ) r_expires;
     grant_full_control = ( ! ) r_grant_full_control;
     grant_read = ( ! ) r_grant_read;
     grant_read_ac_p = ( ! ) r_grant_read_ac_p;
     grant_write_ac_p = ( ! ) r_grant_write_ac_p;
     if_match = ( ! ) r_if_match;
     if_none_match = ( ! ) r_if_none_match;
     key = required "Key" (( ! ) r_key) i;
     metadata = ( ! ) r_metadata;
     metadata_directive = ( ! ) r_metadata_directive;
     tagging_directive = ( ! ) r_tagging_directive;
     annotation_directive = ( ! ) r_annotation_directive;
     server_side_encryption = ( ! ) r_server_side_encryption;
     storage_class = ( ! ) r_storage_class;
     website_redirect_location = ( ! ) r_website_redirect_location;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     ssekms_encryption_context = ( ! ) r_ssekms_encryption_context;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     copy_source_sse_customer_algorithm = ( ! ) r_copy_source_sse_customer_algorithm;
     copy_source_sse_customer_key = ( ! ) r_copy_source_sse_customer_key;
     copy_source_sse_customer_key_m_d5 = ( ! ) r_copy_source_sse_customer_key_m_d5;
     request_payer = ( ! ) r_request_payer;
     tagging = ( ! ) r_tagging;
     object_lock_mode = ( ! ) r_object_lock_mode;
     object_lock_retain_until_date = ( ! ) r_object_lock_retain_until_date;
     object_lock_legal_hold_status = ( ! ) r_object_lock_legal_hold_status;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     expected_source_bucket_owner = ( ! ) r_expected_source_bucket_owner;
   }
    : copy_object_request)

let complete_multipart_upload_output_of_xml i attrs =
  let r_location = ref None in
  let r_bucket = ref None in
  let r_key = ref None in
  let r_expiration = ref None in
  let r_e_tag = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  let r_server_side_encryption = ref None in
  let r_version_id = ref None in
  let r_ssekms_key_id = ref None in
  let r_bucket_key_enabled = ref None in
  let r_request_charged = ref None in
  Structure.scanSequence i
    [
      "Location";
      "Bucket";
      "Key";
      "Expiration";
      "ETag";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
      "ServerSideEncryption";
      "VersionId";
      "SSEKMSKeyId";
      "BucketKeyEnabled";
      "RequestCharged";
    ] (fun tag _ ->
      match tag with
      | "Location" ->
          r_location :=
            Some (Read.sequence i "Location" (fun i attrs -> location_of_xml i attrs) ())
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "Expiration" ->
          r_expiration :=
            Some (Read.sequence i "Expiration" (fun i attrs -> expiration_of_xml i attrs) ())
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "ServerSideEncryption" ->
          r_server_side_encryption :=
            Some
              (Read.sequence i "ServerSideEncryption"
                 (fun i attrs -> server_side_encryption_of_xml i attrs)
                 ())
      | "VersionId" ->
          r_version_id :=
            Some (Read.sequence i "VersionId" (fun i attrs -> object_version_id_of_xml i attrs) ())
      | "SSEKMSKeyId" ->
          r_ssekms_key_id :=
            Some (Read.sequence i "SSEKMSKeyId" (fun i attrs -> ssekms_key_id_of_xml i attrs) ())
      | "BucketKeyEnabled" ->
          r_bucket_key_enabled :=
            Some
              (Read.sequence i "BucketKeyEnabled"
                 (fun i attrs -> bucket_key_enabled_of_xml i attrs)
                 ())
      | "RequestCharged" ->
          r_request_charged :=
            Some
              (Read.sequence i "RequestCharged" (fun i attrs -> request_charged_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     location = ( ! ) r_location;
     bucket = ( ! ) r_bucket;
     key = ( ! ) r_key;
     expiration = ( ! ) r_expiration;
     e_tag = ( ! ) r_e_tag;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
     server_side_encryption = ( ! ) r_server_side_encryption;
     version_id = ( ! ) r_version_id;
     ssekms_key_id = ( ! ) r_ssekms_key_id;
     bucket_key_enabled = ( ! ) r_bucket_key_enabled;
     request_charged = ( ! ) r_request_charged;
   }
    : complete_multipart_upload_output)

let mpu_object_size_of_xml i attrs = Primitive.long_of_string (Read.data i)

let completed_part_of_xml i attrs =
  let r_e_tag = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_part_number = ref None in
  Structure.scanSequence i
    [
      "ETag";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "PartNumber";
    ] (fun tag _ ->
      match tag with
      | "ETag" -> r_e_tag := Some (Read.sequence i "ETag" (fun i attrs -> e_tag_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "PartNumber" ->
          r_part_number :=
            Some (Read.sequence i "PartNumber" (fun i attrs -> part_number_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({
     e_tag = ( ! ) r_e_tag;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     part_number = ( ! ) r_part_number;
   }
    : completed_part)

let completed_part_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> completed_part_of_xml i attrs) ()

let completed_multipart_upload_of_xml i attrs =
  let r_parts = ref None in
  Structure.scanSequence i [ "Part" ] (fun tag _ ->
      match tag with
      | "Part" ->
          r_parts :=
            Some (Read.sequences i "Part" (fun i attrs -> completed_part_of_xml i attrs) ())
      | _ -> Read.skip_element i);
  ({ parts = ( ! ) r_parts } : completed_multipart_upload)

let complete_multipart_upload_request_of_xml i attrs =
  let r_bucket = ref None in
  let r_key = ref None in
  let r_multipart_upload = ref None in
  let r_upload_id = ref None in
  let r_checksum_cr_c32 = ref None in
  let r_checksum_crc32_c = ref None in
  let r_checksum_crc64nvm_e = ref None in
  let r_checksum_sh_a1 = ref None in
  let r_checksum_sh_a256 = ref None in
  let r_checksum_sh_a512 = ref None in
  let r_checksum_m_d5 = ref None in
  let r_checksum_xxhas_h64 = ref None in
  let r_checksum_xxhas_h3 = ref None in
  let r_checksum_xxhas_h128 = ref None in
  let r_checksum_type = ref None in
  let r_mpu_object_size = ref None in
  let r_request_payer = ref None in
  let r_expected_bucket_owner = ref None in
  let r_if_match = ref None in
  let r_if_none_match = ref None in
  let r_sse_customer_algorithm = ref None in
  let r_sse_customer_key = ref None in
  let r_sse_customer_key_m_d5 = ref None in
  Structure.scanSequence i
    [
      "Bucket";
      "Key";
      "CompleteMultipartUpload";
      "UploadId";
      "ChecksumCRC32";
      "ChecksumCRC32C";
      "ChecksumCRC64NVME";
      "ChecksumSHA1";
      "ChecksumSHA256";
      "ChecksumSHA512";
      "ChecksumMD5";
      "ChecksumXXHASH64";
      "ChecksumXXHASH3";
      "ChecksumXXHASH128";
      "ChecksumType";
      "MpuObjectSize";
      "RequestPayer";
      "ExpectedBucketOwner";
      "IfMatch";
      "IfNoneMatch";
      "SSECustomerAlgorithm";
      "SSECustomerKey";
      "SSECustomerKeyMD5";
    ] (fun tag _ ->
      match tag with
      | "Bucket" ->
          r_bucket := Some (Read.sequence i "Bucket" (fun i attrs -> bucket_name_of_xml i attrs) ())
      | "Key" -> r_key := Some (Read.sequence i "Key" (fun i attrs -> object_key_of_xml i attrs) ())
      | "CompleteMultipartUpload" ->
          r_multipart_upload :=
            Some
              (Read.sequence i "CompleteMultipartUpload"
                 (fun i attrs -> completed_multipart_upload_of_xml i attrs)
                 ())
      | "UploadId" ->
          r_upload_id :=
            Some (Read.sequence i "UploadId" (fun i attrs -> multipart_upload_id_of_xml i attrs) ())
      | "ChecksumCRC32" ->
          r_checksum_cr_c32 :=
            Some
              (Read.sequence i "ChecksumCRC32" (fun i attrs -> checksum_cr_c32_of_xml i attrs) ())
      | "ChecksumCRC32C" ->
          r_checksum_crc32_c :=
            Some
              (Read.sequence i "ChecksumCRC32C" (fun i attrs -> checksum_crc32_c_of_xml i attrs) ())
      | "ChecksumCRC64NVME" ->
          r_checksum_crc64nvm_e :=
            Some
              (Read.sequence i "ChecksumCRC64NVME"
                 (fun i attrs -> checksum_crc64nvm_e_of_xml i attrs)
                 ())
      | "ChecksumSHA1" ->
          r_checksum_sh_a1 :=
            Some (Read.sequence i "ChecksumSHA1" (fun i attrs -> checksum_sh_a1_of_xml i attrs) ())
      | "ChecksumSHA256" ->
          r_checksum_sh_a256 :=
            Some
              (Read.sequence i "ChecksumSHA256" (fun i attrs -> checksum_sh_a256_of_xml i attrs) ())
      | "ChecksumSHA512" ->
          r_checksum_sh_a512 :=
            Some
              (Read.sequence i "ChecksumSHA512" (fun i attrs -> checksum_sh_a512_of_xml i attrs) ())
      | "ChecksumMD5" ->
          r_checksum_m_d5 :=
            Some (Read.sequence i "ChecksumMD5" (fun i attrs -> checksum_m_d5_of_xml i attrs) ())
      | "ChecksumXXHASH64" ->
          r_checksum_xxhas_h64 :=
            Some
              (Read.sequence i "ChecksumXXHASH64"
                 (fun i attrs -> checksum_xxhas_h64_of_xml i attrs)
                 ())
      | "ChecksumXXHASH3" ->
          r_checksum_xxhas_h3 :=
            Some
              (Read.sequence i "ChecksumXXHASH3"
                 (fun i attrs -> checksum_xxhas_h3_of_xml i attrs)
                 ())
      | "ChecksumXXHASH128" ->
          r_checksum_xxhas_h128 :=
            Some
              (Read.sequence i "ChecksumXXHASH128"
                 (fun i attrs -> checksum_xxhas_h128_of_xml i attrs)
                 ())
      | "ChecksumType" ->
          r_checksum_type :=
            Some (Read.sequence i "ChecksumType" (fun i attrs -> checksum_type_of_xml i attrs) ())
      | "MpuObjectSize" ->
          r_mpu_object_size :=
            Some
              (Read.sequence i "MpuObjectSize" (fun i attrs -> mpu_object_size_of_xml i attrs) ())
      | "RequestPayer" ->
          r_request_payer :=
            Some (Read.sequence i "RequestPayer" (fun i attrs -> request_payer_of_xml i attrs) ())
      | "ExpectedBucketOwner" ->
          r_expected_bucket_owner :=
            Some
              (Read.sequence i "ExpectedBucketOwner" (fun i attrs -> account_id_of_xml i attrs) ())
      | "IfMatch" ->
          r_if_match := Some (Read.sequence i "IfMatch" (fun i attrs -> if_match_of_xml i attrs) ())
      | "IfNoneMatch" ->
          r_if_none_match :=
            Some (Read.sequence i "IfNoneMatch" (fun i attrs -> if_none_match_of_xml i attrs) ())
      | "SSECustomerAlgorithm" ->
          r_sse_customer_algorithm :=
            Some
              (Read.sequence i "SSECustomerAlgorithm"
                 (fun i attrs -> sse_customer_algorithm_of_xml i attrs)
                 ())
      | "SSECustomerKey" ->
          r_sse_customer_key :=
            Some
              (Read.sequence i "SSECustomerKey" (fun i attrs -> sse_customer_key_of_xml i attrs) ())
      | "SSECustomerKeyMD5" ->
          r_sse_customer_key_m_d5 :=
            Some
              (Read.sequence i "SSECustomerKeyMD5"
                 (fun i attrs -> sse_customer_key_m_d5_of_xml i attrs)
                 ())
      | _ -> Read.skip_element i);
  ({
     bucket = required "Bucket" (( ! ) r_bucket) i;
     key = required "Key" (( ! ) r_key) i;
     multipart_upload = ( ! ) r_multipart_upload;
     upload_id = required "UploadId" (( ! ) r_upload_id) i;
     checksum_cr_c32 = ( ! ) r_checksum_cr_c32;
     checksum_crc32_c = ( ! ) r_checksum_crc32_c;
     checksum_crc64nvm_e = ( ! ) r_checksum_crc64nvm_e;
     checksum_sh_a1 = ( ! ) r_checksum_sh_a1;
     checksum_sh_a256 = ( ! ) r_checksum_sh_a256;
     checksum_sh_a512 = ( ! ) r_checksum_sh_a512;
     checksum_m_d5 = ( ! ) r_checksum_m_d5;
     checksum_xxhas_h64 = ( ! ) r_checksum_xxhas_h64;
     checksum_xxhas_h3 = ( ! ) r_checksum_xxhas_h3;
     checksum_xxhas_h128 = ( ! ) r_checksum_xxhas_h128;
     checksum_type = ( ! ) r_checksum_type;
     mpu_object_size = ( ! ) r_mpu_object_size;
     request_payer = ( ! ) r_request_payer;
     expected_bucket_owner = ( ! ) r_expected_bucket_owner;
     if_match = ( ! ) r_if_match;
     if_none_match = ( ! ) r_if_none_match;
     sse_customer_algorithm = ( ! ) r_sse_customer_algorithm;
     sse_customer_key = ( ! ) r_sse_customer_key;
     sse_customer_key_m_d5 = ( ! ) r_sse_customer_key_m_d5;
   }
    : complete_multipart_upload_request)
