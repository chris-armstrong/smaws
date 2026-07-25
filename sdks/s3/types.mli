type nonrec bucket_abac_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec abac_status = {
  status : bucket_abac_status option;
      [@ocaml.doc "The ABAC status of the general purpose bucket. \n"]
}
[@@ocaml.doc
  "The ABAC status of the general purpose bucket. When ABAC is enabled for the general purpose \
   bucket, you can use tags to manage access to the general purpose buckets as well as for cost \
   tracking purposes. When ABAC is disabled for the general purpose buckets, you can only use tags \
   for cost tracking purposes. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging.html}Using tags with \
   S3 general purpose buckets}. \n"]

type nonrec abort_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec days_after_initiation = int [@@ocaml.doc ""]

type nonrec abort_incomplete_multipart_upload = {
  days_after_initiation : days_after_initiation option;
      [@ocaml.doc
        "Specifies the number of days after which Amazon S3 aborts an incomplete multipart upload.\n"]
}
[@@ocaml.doc
  "Specifies the days since the initiation of an incomplete multipart upload that Amazon S3 will \
   wait before permanently removing all parts of the upload. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config} \
   Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Configuration} in the {i Amazon \
   S3 User Guide}.\n"]

type nonrec no_such_upload = unit [@@ocaml.doc ""]

type nonrec request_charged = Requester [@ocaml.doc ""]
[@@ocaml.doc
  "If present, indicates that the requester was successfully charged for the request. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/RequesterPaysBuckets.html}Using \
   Requester Pays buckets for storage transfers and usage} in the {i Amazon Simple Storage Service \
   user guide}.\n\n\
  \  This functionality is not supported for directory buckets.\n\
  \  \n\
  \   "]

type nonrec abort_multipart_upload_output = {
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec if_match_initiated_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec request_payer = Requester [@ocaml.doc ""]
[@@ocaml.doc
  "Confirms that the requester knows that they will be charged for the request. Bucket owners need \
   not specify this parameter in their requests. If either the source or destination S3 bucket has \
   Requester Pays enabled, the requester will pay for the corresponding charges. For information \
   about downloading objects from Requester Pays buckets, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html}Downloading \
   Objects in Requester Pays Buckets} in the {i Amazon S3 User Guide}.\n\n\
  \  This functionality is not supported for directory buckets.\n\
  \  \n\
  \   "]

type nonrec multipart_upload_id = string [@@ocaml.doc ""]

type nonrec object_key = string [@@ocaml.doc ""]

type nonrec bucket_name = string [@@ocaml.doc ""]

type nonrec abort_multipart_upload_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name to which the upload was taking place. \n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  key : object_key; [@ocaml.doc "Key of the object for which the multipart upload was initiated.\n"]
  upload_id : multipart_upload_id; [@ocaml.doc "Upload ID that identifies the multipart upload.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  if_match_initiated_time : if_match_initiated_time option;
      [@ocaml.doc
        "If present, this header aborts an in progress multipart upload only if it was initiated \
         on the provided timestamp. If the initiated timestamp of the multipart upload does not \
         match the provided value, the operation returns a [412 Precondition Failed] error. If the \
         initiated timestamp matches or if the multipart upload doesn\226\128\153t exist, the \
         operation returns a [204 Success (No\n\
        \        Content)] response. \n\n\
        \  This functionality is only supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec abort_rule_id = string [@@ocaml.doc ""]

type nonrec bucket_accelerate_status = Enabled [@ocaml.doc ""] | Suspended [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerate_configuration = {
  status : bucket_accelerate_status option;
      [@ocaml.doc "Specifies the transfer acceleration status of the bucket.\n"]
}
[@@ocaml.doc
  "Configures the transfer acceleration state for an Amazon S3 bucket. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html}Amazon S3 \
   Transfer Acceleration} in the {i Amazon S3 User Guide}.\n"]

type nonrec accept_ranges = string [@@ocaml.doc ""]

type nonrec i_d = string [@@ocaml.doc ""]

type nonrec display_name = string [@@ocaml.doc ""]

type nonrec owner = {
  display_name : display_name option; [@ocaml.doc "\n"]
  i_d : i_d option; [@ocaml.doc "Container for the ID of the owner.\n"]
}
[@@ocaml.doc "Container for the owner's display name and ID.\n"]

type nonrec permission =
  | FULL_CONTROL [@ocaml.doc ""]
  | WRITE [@ocaml.doc ""]
  | WRITE_ACP [@ocaml.doc ""]
  | READ [@ocaml.doc ""]
  | READ_ACP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec type_ =
  | CanonicalUser [@ocaml.doc ""]
  | AmazonCustomerByEmail [@ocaml.doc ""]
  | Group [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ur_i = string [@@ocaml.doc ""]

type nonrec email_address = string [@@ocaml.doc ""]

type nonrec grantee = {
  display_name : display_name option; [@ocaml.doc "\n"]
  email_address : email_address option; [@ocaml.doc "\n"]
  i_d : i_d option; [@ocaml.doc "The canonical user ID of the grantee.\n"]
  ur_i : ur_i option; [@ocaml.doc "URI of the grantee group.\n"]
  type_ : type_; [@ocaml.doc "Type of grantee\n"]
}
[@@ocaml.doc "Container for the person being granted permissions.\n"]

type nonrec grant = {
  grantee : grantee option; [@ocaml.doc "The person being granted permissions.\n"]
  permission : permission option; [@ocaml.doc "Specifies the permission given to the grantee.\n"]
}
[@@ocaml.doc "Container for grant information.\n"]

type nonrec grants = grant list [@@ocaml.doc ""]

type nonrec access_control_policy = {
  grants : grants option; [@ocaml.doc "A list of grants.\n"]
  owner : owner option; [@ocaml.doc "Container for the bucket owner's display name and ID.\n"]
}
[@@ocaml.doc "Contains the elements that set the ACL permissions for an object per grantee.\n"]

type nonrec owner_override = Destination [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec access_control_translation = {
  owner : owner_override;
      [@ocaml.doc
        "Specifies the replica ownership. For default and valid values, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html}PUT \
         bucket replication} in the {i Amazon S3 API Reference}.\n"]
}
[@@ocaml.doc "A container for information about access control for replicas.\n"]

type nonrec access_denied = unit [@@ocaml.doc ""]

type nonrec access_key_id_value = string [@@ocaml.doc ""]

type nonrec access_point_alias = bool [@@ocaml.doc ""]

type nonrec access_point_arn = string [@@ocaml.doc ""]

type nonrec allow_quoted_record_delimiter = bool [@@ocaml.doc ""]

type nonrec allowed_header = string [@@ocaml.doc ""]

type nonrec allowed_headers = allowed_header list [@@ocaml.doc ""]

type nonrec allowed_method = string [@@ocaml.doc ""]

type nonrec allowed_methods = allowed_method list [@@ocaml.doc ""]

type nonrec allowed_origin = string [@@ocaml.doc ""]

type nonrec allowed_origins = allowed_origin list [@@ocaml.doc ""]

type nonrec bucket_key_enabled = bool [@@ocaml.doc ""]

type nonrec object_version_id = string [@@ocaml.doc ""]

type nonrec tag_count = int [@@ocaml.doc ""]

type nonrec storage_class =
  | STANDARD [@ocaml.doc ""]
  | REDUCED_REDUNDANCY [@ocaml.doc ""]
  | STANDARD_IA [@ocaml.doc ""]
  | ONEZONE_IA [@ocaml.doc ""]
  | INTELLIGENT_TIERING [@ocaml.doc ""]
  | GLACIER [@ocaml.doc ""]
  | DEEP_ARCHIVE [@ocaml.doc ""]
  | OUTPOSTS [@ocaml.doc ""]
  | GLACIER_IR [@ocaml.doc ""]
  | SNOW [@ocaml.doc ""]
  | EXPRESS_ONEZONE [@ocaml.doc ""]
  | FSX_OPENZFS [@ocaml.doc ""]
  | FSX_ONTAP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sse_customer_key_m_d5 = string [@@ocaml.doc ""]

type nonrec ssekms_key_id = string [@@ocaml.doc ""]

type nonrec sse_customer_algorithm = string [@@ocaml.doc ""]

type nonrec server_side_encryption =
  | AES256 [@ocaml.doc ""]
  | Aws_fsx [@ocaml.doc ""]
  | Aws_kms [@ocaml.doc ""]
  | Aws_kms_dsse [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec restore = string [@@ocaml.doc ""]

type nonrec replication_status =
  | COMPLETE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | REPLICA [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parts_count = int [@@ocaml.doc ""]

type nonrec object_lock_retain_until_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec object_lock_legal_hold_status = ON [@ocaml.doc ""] | OFF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_lock_mode = GOVERNANCE [@ocaml.doc ""] | COMPLIANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metadata_value = string [@@ocaml.doc ""]

type nonrec metadata_key = string [@@ocaml.doc ""]

type nonrec metadata = (metadata_key * metadata_value) list [@@ocaml.doc ""]

type nonrec missing_meta = int [@@ocaml.doc ""]

type nonrec last_modified = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec expiration = string [@@ocaml.doc ""]

type nonrec expires = string [@@ocaml.doc ""]

type nonrec e_tag = string [@@ocaml.doc ""]

type nonrec delete_marker = bool [@@ocaml.doc ""]

type nonrec checksum_xxhas_h128 = string [@@ocaml.doc ""]

type nonrec checksum_xxhas_h3 = string [@@ocaml.doc ""]

type nonrec checksum_xxhas_h64 = string [@@ocaml.doc ""]

type nonrec checksum_m_d5 = string [@@ocaml.doc ""]

type nonrec checksum_sh_a512 = string [@@ocaml.doc ""]

type nonrec checksum_sh_a256 = string [@@ocaml.doc ""]

type nonrec checksum_sh_a1 = string [@@ocaml.doc ""]

type nonrec checksum_crc64nvm_e = string [@@ocaml.doc ""]

type nonrec checksum_crc32_c = string [@@ocaml.doc ""]

type nonrec checksum_cr_c32 = string [@@ocaml.doc ""]

type nonrec content_type = string [@@ocaml.doc ""]

type nonrec content_range = string [@@ocaml.doc ""]

type nonrec content_length = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec content_language = string [@@ocaml.doc ""]

type nonrec content_encoding = string [@@ocaml.doc ""]

type nonrec content_disposition = string [@@ocaml.doc ""]

type nonrec cache_control = string [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec get_object_response_status_code = int [@@ocaml.doc ""]

type nonrec streaming_blob = bytes [@@ocaml.doc ""]

type nonrec request_token = string [@@ocaml.doc ""]

type nonrec request_route = string [@@ocaml.doc ""]

type nonrec write_get_object_response_request = {
  request_route : request_route; [@ocaml.doc "Route prefix to the HTTP URL generated.\n"]
  request_token : request_token;
      [@ocaml.doc
        "A single use encrypted token that maps [WriteGetObjectResponse] to the end user \
         [GetObject] request.\n"]
  body : streaming_blob option; [@ocaml.doc "The object data.\n"]
  status_code : get_object_response_status_code option;
      [@ocaml.doc
        "The integer status code for an HTTP response of a corresponding [GetObject] request. The \
         following is a list of status codes.\n\n\
        \ {ul\n\
        \       {-   [200 - OK] \n\
        \           \n\
        \            }\n\
        \       {-   [206 - Partial Content] \n\
        \           \n\
        \            }\n\
        \       {-   [304 - Not Modified] \n\
        \           \n\
        \            }\n\
        \       {-   [400 - Bad Request] \n\
        \           \n\
        \            }\n\
        \       {-   [401 - Unauthorized] \n\
        \           \n\
        \            }\n\
        \       {-   [403 - Forbidden] \n\
        \           \n\
        \            }\n\
        \       {-   [404 - Not Found] \n\
        \           \n\
        \            }\n\
        \       {-   [405 - Method Not Allowed] \n\
        \           \n\
        \            }\n\
        \       {-   [409 - Conflict] \n\
        \           \n\
        \            }\n\
        \       {-   [411 - Length Required] \n\
        \           \n\
        \            }\n\
        \       {-   [412 - Precondition Failed] \n\
        \           \n\
        \            }\n\
        \       {-   [416 - Range Not Satisfiable] \n\
        \           \n\
        \            }\n\
        \       {-   [500 - Internal Server Error] \n\
        \           \n\
        \            }\n\
        \       {-   [503 - Service Unavailable] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  error_code : error_code option;
      [@ocaml.doc
        "A string that uniquely identifies an error condition. Returned in the \n\
         {[\n\
        \ tag of the error XML response for a corresponding [GetObject] call. Cannot be used with \
         a successful [StatusCode] header or when the transformed object is provided in the body. \
         All error codes from S3 are sentence-cased. The regular expression (regex) value is \
         [\"^\\[A-Z\\]\\[a-zA-Z\\]+$\"].\n\
         ]}\n\n"]
  error_message : error_message option;
      [@ocaml.doc
        "Contains a generic description of the error condition. Returned in the  tag of the error \
         XML response for a corresponding [GetObject] call. Cannot be used with a successful \
         [StatusCode] header or when the transformed object is provided in body.\n"]
  accept_ranges : accept_ranges option;
      [@ocaml.doc "Indicates that a range of bytes was specified.\n"]
  cache_control : cache_control option;
      [@ocaml.doc "Specifies caching behavior along the request/reply chain.\n"]
  content_disposition : content_disposition option;
      [@ocaml.doc "Specifies presentational information for the object.\n"]
  content_encoding : content_encoding option;
      [@ocaml.doc
        "Specifies what content encodings have been applied to the object and thus what decoding \
         mechanisms must be applied to obtain the media-type referenced by the Content-Type header \
         field.\n"]
  content_language : content_language option; [@ocaml.doc "The language the content is in.\n"]
  content_length : content_length option; [@ocaml.doc "The size of the content body in bytes.\n"]
  content_range : content_range option;
      [@ocaml.doc "The portion of the object returned in the response.\n"]
  content_type : content_type option;
      [@ocaml.doc "A standard MIME type describing the format of the object data.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This specifies the Base64 encoded, 32-bit [CRC32] \
         checksum of the object returned by the Object Lambda function. This may not match the \
         checksum for the object stored in Amazon S3. Amazon S3 will perform validation of the \
         checksum values only when the original [GetObject] request required checksum validation. \
         For more information about checksums, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ Only one checksum header can be specified at a time. If you supply multiple checksum \
         headers, this request will fail.\n\
        \ \n\
        \  \n\
        \  "]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This specifies the Base64 encoded, 32-bit [CRC32C] \
         checksum of the object returned by the Object Lambda function. This may not match the \
         checksum for the object stored in Amazon S3. Amazon S3 will perform validation of the \
         checksum values only when the original [GetObject] request required checksum validation. \
         For more information about checksums, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ Only one checksum header can be specified at a time. If you supply multiple checksum \
         headers, this request will fail.\n\
        \ "]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [CRC64NVME] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This specifies the Base64 encoded, 160-bit [SHA1] \
         digest of the object returned by the Object Lambda function. This may not match the \
         checksum for the object stored in Amazon S3. Amazon S3 will perform validation of the \
         checksum values only when the original [GetObject] request required checksum validation. \
         For more information about checksums, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ Only one checksum header can be specified at a time. If you supply multiple checksum \
         headers, this request will fail.\n\
        \ "]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This specifies the Base64 encoded, 256-bit [SHA256] \
         digest of the object returned by the Object Lambda function. This may not match the \
         checksum for the object stored in Amazon S3. Amazon S3 will perform validation of the \
         checksum values only when the original [GetObject] request required checksum validation. \
         For more information about checksums, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ Only one checksum header can be specified at a time. If you supply multiple checksum \
         headers, this request will fail.\n\
        \ "]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 512-bit \
         [SHA512] digest of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [MD5] digest of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH64] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH3] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [XXHASH128] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  delete_marker : delete_marker option;
      [@ocaml.doc
        "Specifies whether an object stored in Amazon S3 is ([true]) or is not ([false]) a delete \
         marker. To learn more about delete markers, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html}Working with \
         delete markers}.\n"]
  e_tag : e_tag option;
      [@ocaml.doc
        "An opaque identifier assigned by a web server to a specific version of a resource found \
         at a URL. \n"]
  expires : expires option;
      [@ocaml.doc "The date and time at which the object is no longer cacheable.\n"]
  expiration : expiration option;
      [@ocaml.doc
        "If the object expiration is configured (see PUT Bucket lifecycle), the response includes \
         this header. It includes the [expiry-date] and [rule-id] key-value pairs that provide the \
         object expiration information. The value of the [rule-id] is URL-encoded. \n"]
  last_modified : last_modified option;
      [@ocaml.doc "The date and time that the object was last modified.\n"]
  missing_meta : missing_meta option;
      [@ocaml.doc
        "Set to the number of metadata entries not returned in [x-amz-meta] headers. This can \
         happen if you create metadata using an API like SOAP that supports more flexible metadata \
         than the REST API. For example, using SOAP, you can create metadata whose values are not \
         legal HTTP headers.\n"]
  metadata : metadata option; [@ocaml.doc "A map of metadata to store with the object in S3.\n"]
  object_lock_mode : object_lock_mode option;
      [@ocaml.doc
        "Indicates whether an object stored in Amazon S3 has Object Lock enabled. For more \
         information about S3 Object Lock, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock.html}Object Lock}.\n"]
  object_lock_legal_hold_status : object_lock_legal_hold_status option;
      [@ocaml.doc "Indicates whether an object stored in Amazon S3 has an active legal hold.\n"]
  object_lock_retain_until_date : object_lock_retain_until_date option;
      [@ocaml.doc "The date and time when Object Lock is configured to expire.\n"]
  parts_count : parts_count option; [@ocaml.doc "The count of parts this object has.\n"]
  replication_status : replication_status option;
      [@ocaml.doc
        "Indicates if request involves bucket that is either a source or destination in a \
         Replication rule. For more information about S3 Replication, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication.html}Replication}.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
  restore : restore option;
      [@ocaml.doc
        "Provides information about object restoration operation and expiration time of the \
         restored object copy.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        " The server-side encryption algorithm used when storing requested object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Encryption algorithm used if server-side encryption with a customer-provided encryption \
         key was specified for object stored in Amazon S3.\n"]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        " If present, specifies the ID (Key ID, Key ARN, or Key Alias) of the Amazon Web Services \
         Key Management Service (Amazon Web Services KMS) symmetric encryption customer managed \
         key that was used for stored in Amazon S3 object. \n"]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        " 128-bit MD5 digest of customer-provided encryption key used in Amazon S3 to encrypt data \
         stored in S3. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using server-side encryption with customer-provided encryption keys (SSE-C)}.\n"]
  storage_class : storage_class option;
      [@ocaml.doc
        "Provides storage class information of the object. Amazon S3 returns this header for all \
         objects except for S3 Standard storage class objects.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html}Storage \
         Classes}.\n\
        \ "]
  tag_count : tag_count option; [@ocaml.doc "The number of tags, if any, on the object.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "An ID used to reference a specific version of the object.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        " Indicates whether the object stored in Amazon S3 uses an S3 bucket key for server-side \
         encryption with Amazon Web Services KMS (SSE-KMS).\n"]
}
[@@ocaml.doc ""]

type nonrec copy_part_result = {
  e_tag : e_tag option; [@ocaml.doc "Entity tag of the object.\n"]
  last_modified : last_modified option;
      [@ocaml.doc "Date and time at which the object was uploaded.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [CRC32] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [CRC32C] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [CRC64NVME] checksum algorithm. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] digest of the part. This checksum is present if the \
         multipart upload request was created with the [SHA1] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] digest of the part. This checksum is present if the \
         multipart upload request was created with the [SHA256] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the part. This checksum is present if the \
         multipart upload request was created with the [SHA512] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the part. This checksum is present if the \
         multipart upload request was created with the [MD5] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH64] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH3] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH128] checksum algorithm. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc "Container for all response elements.\n"]

type nonrec copy_source_version_id = string [@@ocaml.doc ""]

type nonrec upload_part_copy_output = {
  copy_source_version_id : copy_source_version_id option;
      [@ocaml.doc
        "The version of the source object that was copied, if you have enabled versioning on the \
         source bucket.\n\n\
        \  This functionality is not supported when the source object is in a directory bucket.\n\
        \  \n\
        \   "]
  copy_part_result : copy_part_result option; [@ocaml.doc "Container for all response elements.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to confirm the encryption algorithm that's used.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to provide the round-trip message integrity \
         verification of the customer-provided encryption key.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption \
         with Key Management Service (KMS) keys (SSE-KMS).\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec copy_source_sse_customer_key_m_d5 = string [@@ocaml.doc ""]

type nonrec copy_source_sse_customer_key = string [@@ocaml.doc ""]

type nonrec copy_source_sse_customer_algorithm = string [@@ocaml.doc ""]

type nonrec sse_customer_key = string [@@ocaml.doc ""]

type nonrec part_number = int [@@ocaml.doc ""]

type nonrec copy_source_range = string [@@ocaml.doc ""]

type nonrec copy_source_if_unmodified_since = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec copy_source_if_none_match = string [@@ocaml.doc ""]

type nonrec copy_source_if_modified_since = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec copy_source_if_match = string [@@ocaml.doc ""]

type nonrec copy_source = string [@@ocaml.doc ""]

type nonrec upload_part_copy_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   Copying objects across different Amazon Web Services Regions isn't supported when the \
         source or destination bucket is in Amazon Web Services Local Zones. The source and \
         destination buckets must have the same parent Amazon Web Services Region. Otherwise, you \
         get an HTTP [400 Bad Request] error with the error code [InvalidRequest].\n\
        \   \n\
        \      {b Access points} - When you use this action with an access point for general \
         purpose buckets, you must provide the alias of the access point in place of the bucket \
         name or specify the access point ARN. When you use this action with an access point for \
         directory buckets, you must provide the access point name in place of the bucket name. \
         When using the access point ARN, you must direct requests to the access point hostname. \
         The access point hostname takes the form {i AccessPointName}-{i \
         AccountId}.s3-accesspoint.{i Region}.amazonaws.com. When using this action with an access \
         point through the Amazon Web Services SDKs, you provide the access point ARN in place of \
         the bucket name. For more information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \     \n\
        \       Object Lambda access points are not supported by directory buckets.\n\
        \       \n\
        \          {b S3 on Outposts} - When you use this action with S3 on Outposts, you must \
         direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the \
         form \n\
        \         {[\n\
        \          {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i \
         Region}.amazonaws.com\n\
        \         ]}\n\
        \         . When you use this action with S3 on Outposts, the destination bucket must be \
         the Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \         "]
  copy_source : copy_source;
      [@ocaml.doc
        "Specifies the source object for the copy operation. You specify the value in one of two \
         formats, depending on whether you want to access the source object through an \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html}access \
         point}:\n\n\
        \ {ul\n\
        \       {-  For objects not accessed through an access point, specify the name of the \
         source bucket and key of the source object, separated by a slash (/). For example, to \
         copy the object [reports/january.pdf] from the bucket [awsexamplebucket], use \
         [awsexamplebucket/reports/january.pdf]. The value must be URL-encoded.\n\
        \           \n\
        \            }\n\
        \       {-  For objects accessed through access points, specify the Amazon Resource Name \
         (ARN) of the object as accessed through the access point, in the format \n\
        \           {[\n\
        \           arn:aws:s3:::accesspoint//object/\n\
        \           ]}\n\
        \           . For example, to copy the object [reports/january.pdf] through access point \
         [my-access-point] owned by account [123456789012] in Region [us-west-2], use the URL \
         encoding of \
         [arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf]. \
         The value must be URL encoded.\n\
        \           \n\
        \             {ul\n\
        \                   {-  Amazon S3 supports copy operations using Access points only when \
         the source and destination buckets are in the same Amazon Web Services Region.\n\
        \                       \n\
        \                        }\n\
        \                   {-  Access points are not supported by directory buckets.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \          Alternatively, for objects accessed through Amazon S3 on Outposts, specify the \
         ARN of the object as accessed in the format \n\
        \          {[\n\
        \          arn:aws:s3-outposts:::outpost//object/\n\
        \          ]}\n\
        \          . For example, to copy the object [reports/january.pdf] through outpost \
         [my-outpost] owned by account [123456789012] in Region [us-west-2], use the URL encoding \
         of \
         [arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf]. \
         The value must be URL-encoded. \n\
        \          \n\
        \           }\n\
        \       }\n\
        \   If your bucket has versioning enabled, you could have multiple versions of the same \
         object. By default, [x-amz-copy-source] identifies the current version of the source \
         object to copy. To copy a specific version of the source object to copy, append \n\
        \   {[\n\
        \   ?versionId=\n\
        \   ]}\n\
        \    to the [x-amz-copy-source] request header (for example, [x-amz-copy-source:\n\
        \        \
         /awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893]). \n\
        \   \n\
        \    If the current version is a delete marker and you don't specify a versionId in the \
         [x-amz-copy-source] request header, Amazon S3 returns a [404 Not Found] error, because \
         the object does not exist. If you specify versionId in the [x-amz-copy-source] and the \
         versionId is a delete marker, Amazon S3 returns an HTTP [400 Bad Request] error, because \
         you are not allowed to specify a delete marker as a version for the [x-amz-copy-source]. \n\
        \    \n\
        \       {b Directory buckets} - S3 Versioning isn't enabled and supported for directory \
         buckets.\n\
        \      \n\
        \       "]
  copy_source_if_match : copy_source_if_match option;
      [@ocaml.doc
        "Copies the object if its entity tag (ETag) matches the specified tag.\n\n\
        \ If both of the [x-amz-copy-source-if-match] and [x-amz-copy-source-if-unmodified-since] \
         headers are present in the request as follows:\n\
        \ \n\
        \   [x-amz-copy-source-if-match] condition evaluates to [true], and;\n\
        \  \n\
        \    [x-amz-copy-source-if-unmodified-since] condition evaluates to [false];\n\
        \   \n\
        \    Amazon S3 returns [200 OK] and copies the data. \n\
        \    "]
  copy_source_if_modified_since : copy_source_if_modified_since option;
      [@ocaml.doc
        "Copies the object if it has been modified since the specified time.\n\n\
        \ If both of the [x-amz-copy-source-if-none-match] and \
         [x-amz-copy-source-if-modified-since] headers are present in the request as follows:\n\
        \ \n\
        \   [x-amz-copy-source-if-none-match] condition evaluates to [false], and;\n\
        \  \n\
        \    [x-amz-copy-source-if-modified-since] condition evaluates to [true];\n\
        \   \n\
        \    Amazon S3 returns [412 Precondition Failed] response code. \n\
        \    "]
  copy_source_if_none_match : copy_source_if_none_match option;
      [@ocaml.doc
        "Copies the object if its entity tag (ETag) is different than the specified ETag.\n\n\
        \ If both of the [x-amz-copy-source-if-none-match] and \
         [x-amz-copy-source-if-modified-since] headers are present in the request as follows:\n\
        \ \n\
        \   [x-amz-copy-source-if-none-match] condition evaluates to [false], and;\n\
        \  \n\
        \    [x-amz-copy-source-if-modified-since] condition evaluates to [true];\n\
        \   \n\
        \    Amazon S3 returns [412 Precondition Failed] response code. \n\
        \    "]
  copy_source_if_unmodified_since : copy_source_if_unmodified_since option;
      [@ocaml.doc
        "Copies the object if it hasn't been modified since the specified time.\n\n\
        \ If both of the [x-amz-copy-source-if-match] and [x-amz-copy-source-if-unmodified-since] \
         headers are present in the request as follows:\n\
        \ \n\
        \   [x-amz-copy-source-if-match] condition evaluates to [true], and;\n\
        \  \n\
        \    [x-amz-copy-source-if-unmodified-since] condition evaluates to [false];\n\
        \   \n\
        \    Amazon S3 returns [200 OK] and copies the data. \n\
        \    "]
  copy_source_range : copy_source_range option;
      [@ocaml.doc
        "The range of bytes to copy from the source object. The range value must use the form \
         bytes=first-last, where the first and last are the zero-based byte offsets to copy. For \
         example, bytes=0-9 indicates that you want to copy the first 10 bytes of the source. You \
         can copy a range only if the source object is greater than 5 MB.\n"]
  key : object_key; [@ocaml.doc "Object key for which the multipart upload was initiated.\n"]
  part_number : part_number;
      [@ocaml.doc
        "Part number of part being copied. This is a positive integer between 1 and 10,000.\n"]
  upload_id : multipart_upload_id;
      [@ocaml.doc "Upload ID identifying the multipart upload whose part is being copied.\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when encrypting the object (for example, AES256).\n\n\
        \  This functionality is not supported when the destination bucket is a directory bucket.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. \
         This value is used to store the object and then it is discarded; Amazon S3 does not store \
         the encryption key. The key must be appropriate for use with the algorithm specified in \
         the [x-amz-server-side-encryption-customer-algorithm] header. This must be the same \
         encryption key specified in the initiate multipart upload request.\n\n\
        \  This functionality is not supported when the destination bucket is a directory bucket.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \  This functionality is not supported when the destination bucket is a directory bucket.\n\
        \  \n\
        \   "]
  copy_source_sse_customer_algorithm : copy_source_sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when decrypting the source object (for example, [AES256]).\n\n\
        \  This functionality is not supported when the source object is in a directory bucket.\n\
        \  \n\
        \   "]
  copy_source_sse_customer_key : copy_source_sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source \
         object. The encryption key provided in this header must be one that was used when the \
         source object was created.\n\n\
        \  This functionality is not supported when the source object is in a directory bucket.\n\
        \  \n\
        \   "]
  copy_source_sse_customer_key_m_d5 : copy_source_sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \  This functionality is not supported when the source object is in a directory bucket.\n\
        \  \n\
        \   "]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected destination bucket owner. If the account ID that you \
         provide does not match the actual owner of the destination bucket, the request fails with \
         the HTTP status code [403 Forbidden] (access denied).\n"]
  expected_source_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected source bucket owner. If the account ID that you provide \
         does not match the actual owner of the source bucket, the request fails with the HTTP \
         status code [403 Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec upload_part_output = {
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  e_tag : e_tag option; [@ocaml.doc "Entity tag for the uploaded object.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32] checksum of the part. This will only be present if the \
         checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the part. This will only be present if \
         the checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the part. This will only be present if \
         the checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] checksum of the part. This will only be present if the \
         checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] checksum of the part. This will only be present if \
         the checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] checksum of the part. This will only be present if \
         the checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] checksum of the part. This will only be present if the \
         checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the part. This will only be present if \
         the checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the part. This will only be present if \
         the checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the part. This will only be present \
         if the checksum was provided in the request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to confirm the encryption algorithm that's used.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to provide the round-trip message integrity \
         verification of the customer-provided encryption key.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption \
         with Key Management Service (KMS) keys (SSE-KMS).\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec checksum_algorithm =
  | CRC32 [@ocaml.doc ""]
  | CRC32C [@ocaml.doc ""]
  | SHA1 [@ocaml.doc ""]
  | SHA256 [@ocaml.doc ""]
  | CRC64NVME [@ocaml.doc ""]
  | SHA512 [@ocaml.doc ""]
  | MD5 [@ocaml.doc ""]
  | XXHASH64 [@ocaml.doc ""]
  | XXHASH3 [@ocaml.doc ""]
  | XXHASH128 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec content_m_d5 = string [@@ocaml.doc ""]

type nonrec upload_part_request = {
  body : streaming_blob option; [@ocaml.doc "Object data.\n"]
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket to which the multipart upload was initiated.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  content_length : content_length option;
      [@ocaml.doc
        "Size of the body in bytes. This parameter is useful when the size of the body cannot be \
         determined automatically.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit MD5 digest of the part data. This parameter is auto-populated \
         when using the command from the CLI. This parameter is required if object lock parameters \
         are specified.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ \n\
        \  This checksum algorithm must be the same for all parts and it match the checksum value \
         supplied in the [CreateMultipartUpload] request.\n\
        \  "]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 32-bit \
         [CRC32] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 32-bit \
         [CRC32C] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [CRC64NVME] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 160-bit \
         [SHA1] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 256-bit \
         [SHA256] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 512-bit \
         [SHA512] digest of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [MD5] digest of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH64] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH3] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [XXHASH128] checksum of the part. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  key : object_key; [@ocaml.doc "Object key for which the multipart upload was initiated.\n"]
  part_number : part_number;
      [@ocaml.doc
        "Part number of part being uploaded. This is a positive integer between 1 and 10,000.\n"]
  upload_id : multipart_upload_id;
      [@ocaml.doc "Upload ID identifying the multipart upload whose part is being uploaded.\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when encrypting the object (for example, AES256).\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. \
         This value is used to store the object and then it is discarded; Amazon S3 does not store \
         the encryption key. The key must be appropriate for use with the algorithm specified in \
         the [x-amz-server-side-encryption-customer-algorithm header]. This must be the same \
         encryption key specified in the initiate multipart upload request.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec no_such_key = unit [@@ocaml.doc ""]

type nonrec invalid_request = unit [@@ocaml.doc ""]

type nonrec update_object_encryption_response = {
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec non_empty_kms_key_arn_string = string [@@ocaml.doc ""]

type nonrec ssekms_encryption = {
  kms_key_arn : non_empty_kms_key_arn_string;
      [@ocaml.doc
        " Specifies the Amazon Web Services KMS key Amazon Resource Name (ARN) to use for the \
         updated server-side encryption type. Required if [ObjectEncryption] specifies [SSEKMS]. \n\n\
        \  You must specify the full Amazon Web Services KMS key ARN. The KMS key ID and KMS key \
         alias aren't supported.\n\
        \  \n\
        \    Pattern: ([arn:aws\\[-a-z0-9\\]*:kms:\\[-a-z0-9\\]*:\\[0-9\\]{12}:key/.+])\n\
        \    "]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        " Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with \
         server-side encryption using Key Management Service (KMS) keys (SSE-KMS). If this value \
         isn't specified, it defaults to [false]. Setting this value to [true] causes Amazon S3 to \
         use an S3 Bucket Key for object encryption with SSE-KMS. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-key.html} Using Amazon S3 \
         Bucket Keys} in the {i Amazon S3 User Guide}. \n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
}
[@@ocaml.doc
  " If [SSEKMS] is specified for [ObjectEncryption], this data type specifies the Amazon Web \
   Services KMS key Amazon Resource Name (ARN) to use and whether to use an S3 Bucket Key for \
   server-side encryption using Key Management Service (KMS) keys (SSE-KMS). \n"]

type nonrec object_encryption =
  | SSEKMS of ssekms_encryption
      [@ocaml.doc
        " Specifies to update the object encryption type to server-side encryption with Key \
         Management Service (KMS) keys (SSE-KMS). \n"]
[@@ocaml.doc
  " The updated server-side encryption type for this object. The [UpdateObjectEncryption] \
   operation supports the SSE-S3 and SSE-KMS encryption types. \n\n\
  \ Valid Values: [SSES3] | [SSEKMS] \n\
  \ "]

type nonrec update_object_encryption_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The name of the general purpose bucket that contains the specified object key name. \n\n\
        \ When you use this operation with an access point attached to a general purpose bucket, \
         you must either provide the alias of the access point in place of the bucket name or you \
         must specify the access point Amazon Resource Name (ARN). When using the access point \
         ARN, you must direct requests to the access point hostname. The access point hostname \
         takes the form \n\
        \ {[\n\
        \  {i AccessPointName}-{i AccountId}.s3-accesspoint.{i Region}.amazonaws.com\n\
        \ ]}\n\
        \ . When using this operation with an access point through the Amazon Web Services SDKs, \
         you provide the access point ARN in place of the bucket name. For more information about \
         access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-naming.html} \
         Referencing access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  key : object_key;
      [@ocaml.doc
        " The key name of the object that you want to update the server-side encryption type for. \n"]
  version_id : object_version_id option;
      [@ocaml.doc
        " The version ID of the object that you want to update the server-side encryption type for. \n"]
  object_encryption : object_encryption;
      [@ocaml.doc
        " The updated server-side encryption type for this object. The [UpdateObjectEncryption] \
         operation supports the SSE-S3 and SSE-KMS encryption types. \n\n\
        \ Valid Values: [SSES3] | [SSEKMS] \n\
        \ "]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The account ID of the expected bucket owner. If the account ID that you provide doesn't \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied). \n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        " The MD5 hash for the request body. For requests made using the Amazon Web Services \
         Command Line Interface (CLI) or Amazon Web Services SDKs, this field is calculated \
         automatically. \n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        " Indicates the algorithm used to create the checksum for the object when you use an \
         Amazon Web Services SDK. This header doesn't provide any additional functionality if you \
         don't use the SDK. When you send this header, there must be a corresponding \
         [x-amz-checksum] or [x-amz-trailer] header sent. Otherwise, Amazon S3 fails the request \
         with the HTTP status code [400 Bad Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity } in the {i Amazon S3 User Guide}. \n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec record_expiration_days = int [@@ocaml.doc ""]

type nonrec expiration_state = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec record_expiration = {
  expiration : expiration_state;
      [@ocaml.doc " Specifies whether journal table record expiration is enabled or disabled. \n"]
  days : record_expiration_days option;
      [@ocaml.doc
        " If you enable journal table record expiration, you can set the number of days to retain \
         your journal table records. Journal table records must be retained for a minimum of 7 \
         days. To set this value, specify any whole number from [7] to [2147483647]. For example, \
         to retain your journal table records for one year, set this value to [365]. \n"]
}
[@@ocaml.doc
  " The journal table record expiration settings for a journal table in an S3 Metadata \
   configuration. \n"]

type nonrec journal_table_configuration_updates = {
  record_expiration : record_expiration;
      [@ocaml.doc " The journal table record expiration settings for the journal table. \n"]
}
[@@ocaml.doc " The specified updates to the S3 Metadata journal table configuration. \n"]

type nonrec update_bucket_metadata_journal_table_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that corresponds to the metadata configuration that you want \
         to enable or disable journal table record expiration for. \n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc " The [Content-MD5] header for the journal table configuration. \n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc " The checksum algorithm to use with your journal table configuration. \n"]
  journal_table_configuration : journal_table_configuration_updates;
      [@ocaml.doc " The contents of your journal table configuration. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected owner of the general purpose bucket that corresponds to the metadata table \
         configuration that you want to enable or disable journal table record expiration for. \n"]
}
[@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec table_sse_algorithm = Aws_kms [@ocaml.doc ""] | AES256 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metadata_table_encryption_configuration = {
  sse_algorithm : table_sse_algorithm;
      [@ocaml.doc
        " The encryption type specified for a metadata table. To specify server-side encryption \
         with Key Management Service (KMS) keys (SSE-KMS), use the [aws:kms] value. To specify \
         server-side encryption with Amazon S3 managed keys (SSE-S3), use the [AES256] value. \n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        " If server-side encryption with Key Management Service (KMS) keys (SSE-KMS) is specified, \
         you must also specify the KMS key Amazon Resource Name (ARN). You must specify a \
         customer-managed KMS key that's located in the same Region as the general purpose bucket \
         that corresponds to the metadata table configuration. \n"]
}
[@@ocaml.doc
  " The encryption settings for an S3 Metadata journal table or inventory table configuration. \n"]

type nonrec inventory_configuration_state = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inventory_table_configuration_updates = {
  configuration_state : inventory_configuration_state;
      [@ocaml.doc
        " The configuration state of the inventory table, indicating whether the inventory table \
         is enabled or disabled. \n"]
  encryption_configuration : metadata_table_encryption_configuration option;
      [@ocaml.doc " The encryption configuration for the inventory table. \n"]
}
[@@ocaml.doc " The specified updates to the S3 Metadata inventory table configuration. \n"]

type nonrec update_bucket_metadata_inventory_table_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that corresponds to the metadata configuration that you want \
         to enable or disable an inventory table for. \n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc " The [Content-MD5] header for the inventory table configuration. \n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc " The checksum algorithm to use with your inventory table configuration. \n"]
  inventory_table_configuration : inventory_table_configuration_updates;
      [@ocaml.doc " The contents of your inventory table configuration. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected owner of the general purpose bucket that corresponds to the metadata table \
         configuration that you want to enable or disable an inventory table for. \n"]
}
[@@ocaml.doc ""]

type nonrec role = string [@@ocaml.doc ""]

type nonrec annotation_configuration_state = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec annotation_table_configuration_updates = {
  configuration_state : annotation_configuration_state;
      [@ocaml.doc "The new configuration state to apply.\n"]
  encryption_configuration : metadata_table_encryption_configuration option; [@ocaml.doc ""]
  role : role option; [@ocaml.doc "The new IAM role ARN to apply.\n"]
}
[@@ocaml.doc
  "Specifies updates to apply to the annotation table configuration. Used as the request body for \
   [UpdateBucketMetadataAnnotationTableConfiguration].\n"]

type nonrec update_bucket_metadata_annotation_table_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket whose annotation table configuration to update.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc "Base64-encoded MD5 digest of the message body.\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc "Checksum algorithm for the request payload.\n"]
  annotation_table_configuration : annotation_table_configuration_updates;
      [@ocaml.doc "The annotation table configuration updates to apply.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc "The account ID of the expected bucket owner.\n"]
}
[@@ocaml.doc ""]

type nonrec end_event = unit [@@ocaml.doc ""]

type nonrec continuation_event = unit [@@ocaml.doc ""]

type nonrec bytes_returned = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec bytes_processed = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec bytes_scanned = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec progress = {
  bytes_scanned : bytes_scanned option; [@ocaml.doc "The current number of object bytes scanned.\n"]
  bytes_processed : bytes_processed option;
      [@ocaml.doc "The current number of uncompressed object bytes processed.\n"]
  bytes_returned : bytes_returned option;
      [@ocaml.doc "The current number of bytes of records payload data returned.\n"]
}
[@@ocaml.doc "This data type contains information about progress of an operation.\n"]

type nonrec progress_event = {
  details : progress option; [@ocaml.doc "The Progress event details.\n"]
}
[@@ocaml.doc "This data type contains information about the progress event of an operation.\n"]

type nonrec stats = {
  bytes_scanned : bytes_scanned option; [@ocaml.doc "The total number of object bytes scanned.\n"]
  bytes_processed : bytes_processed option;
      [@ocaml.doc "The total number of uncompressed object bytes processed.\n"]
  bytes_returned : bytes_returned option;
      [@ocaml.doc "The total number of bytes of records payload data returned.\n"]
}
[@@ocaml.doc "Container for the stats details.\n"]

type nonrec stats_event = { details : stats option [@ocaml.doc "The Stats event details.\n"] }
[@@ocaml.doc "Container for the Stats Event.\n"]

type nonrec body = bytes [@@ocaml.doc ""]

type nonrec records_event = {
  payload : body option;
      [@ocaml.doc
        "The byte array of partial, one or more result records. S3 Select doesn't guarantee that a \
         record will be self-contained in one record frame. To ensure continuous streaming of \
         data, S3 Select might split the same record across multiple record frames instead of \
         aggregating the results in memory. Some S3 clients (for example, the SDK for Java) handle \
         this behavior by creating a [ByteStream] out of the response by default. Other clients \
         might not handle this behavior by default. In those cases, you must aggregate the results \
         on the client side and parse the response.\n"]
}
[@@ocaml.doc "The container for the records event.\n"]

type nonrec select_object_content_event_stream =
  | Records of records_event [@ocaml.doc "The Records Event.\n"]
  | Stats of stats_event [@ocaml.doc "The Stats Event.\n"]
  | Progress of progress_event [@ocaml.doc "The Progress Event.\n"]
  | Cont of continuation_event [@ocaml.doc "The Continuation Event.\n"]
  | End of end_event [@ocaml.doc "The End Event.\n"]
[@@ocaml.doc "The container for selecting objects from a content event stream.\n"]

type nonrec select_object_content_output = {
  payload : select_object_content_event_stream option; [@ocaml.doc "The array of results.\n"]
}
[@@ocaml.doc ""]

type nonrec end_ = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec start = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec scan_range = {
  start : start option;
      [@ocaml.doc
        "Specifies the start of the byte range. This parameter is optional. Valid values: \
         non-negative integers. The default value is 0. If only [start] is supplied, it means scan \
         from that point to the end of the file. For example, \n\
         {[\n\
         50\n\
         ]}\n\
        \ means scan from byte 50 until the end of the file.\n"]
  end_ : end_ option;
      [@ocaml.doc
        "Specifies the end of the byte range. This parameter is optional. Valid values: \
         non-negative integers. The default value is one less than the size of the object being \
         queried. If only the End parameter is supplied, it is interpreted to mean scan the last N \
         bytes of the file. For example, \n\
         {[\n\
         50\n\
         ]}\n\
        \ means scan the last 50 bytes.\n"]
}
[@@ocaml.doc
  "Specifies the byte range of the object to get the records from. A record is processed when its \
   first byte is contained by the range. This parameter is optional, but when specified, it must \
   not be empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range.\n"]

type nonrec record_delimiter = string [@@ocaml.doc ""]

type nonrec json_output = {
  record_delimiter : record_delimiter option;
      [@ocaml.doc
        "The value used to separate individual records in the output. If no value is specified, \
         Amazon S3 uses a newline character ('\\n').\n"]
}
[@@ocaml.doc "Specifies JSON as request's output serialization format.\n"]

type nonrec quote_character = string [@@ocaml.doc ""]

type nonrec field_delimiter = string [@@ocaml.doc ""]

type nonrec quote_escape_character = string [@@ocaml.doc ""]

type nonrec quote_fields = ALWAYS [@ocaml.doc ""] | ASNEEDED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec csv_output = {
  quote_fields : quote_fields option;
      [@ocaml.doc
        "Indicates whether to use quotation marks around output fields. \n\n\
        \ {ul\n\
        \       {-   [ALWAYS]: Always use quotation marks for output fields.\n\
        \           \n\
        \            }\n\
        \       {-   [ASNEEDED]: Use quotation marks for output fields when needed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  quote_escape_character : quote_escape_character option;
      [@ocaml.doc
        "The single character used for escaping the quote character inside an already escaped value.\n"]
  record_delimiter : record_delimiter option;
      [@ocaml.doc
        "A single character used to separate individual records in the output. Instead of the \
         default value, you can specify an arbitrary delimiter.\n"]
  field_delimiter : field_delimiter option;
      [@ocaml.doc
        "The value used to separate individual fields in a record. You can specify an arbitrary \
         delimiter.\n"]
  quote_character : quote_character option;
      [@ocaml.doc
        "A single character used for escaping when the field delimiter is part of the value. For \
         example, if the value is [a, b], Amazon S3 wraps this field value in quotation marks, as \
         follows: [\" a ,\n\
        \        b \"].\n"]
}
[@@ocaml.doc
  "Describes how uncompressed comma-separated values (CSV)-formatted results are formatted.\n"]

type nonrec output_serialization = {
  cs_v : csv_output option;
      [@ocaml.doc "Describes the serialization of CSV-encoded Select results.\n"]
  jso_n : json_output option;
      [@ocaml.doc "Specifies JSON as request's output serialization format.\n"]
}
[@@ocaml.doc "Describes how results of the Select job are serialized.\n"]

type nonrec parquet_input = unit [@@ocaml.doc ""]

type nonrec json_type = DOCUMENT [@ocaml.doc ""] | LINES [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec json_input = {
  type_ : json_type option; [@ocaml.doc "The type of JSON. Valid values: Document, Lines.\n"]
}
[@@ocaml.doc "Specifies JSON as object's input serialization format.\n"]

type nonrec compression_type = NONE [@ocaml.doc ""] | GZIP [@ocaml.doc ""] | BZIP2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec comments = string [@@ocaml.doc ""]

type nonrec file_header_info = USE [@ocaml.doc ""] | IGNORE [@ocaml.doc ""] | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec csv_input = {
  file_header_info : file_header_info option;
      [@ocaml.doc
        "Describes the first line of input. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [NONE]: First line is not a header.\n\
        \           \n\
        \            }\n\
        \       {-   [IGNORE]: First line is a header, but you can't use the header values to \
         indicate the column in an expression. You can use column position (such as _1, _2, \
         \226\128\166) to indicate the column ([SELECT s._1 FROM OBJECT s]).\n\
        \           \n\
        \            }\n\
        \       {-   [Use]: First line is a header, and you can use the header value to identify a \
         column in an expression ([SELECT \"name\" FROM OBJECT]). \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  comments : comments option;
      [@ocaml.doc
        "A single character used to indicate that a row should be ignored when the character is \
         present at the start of that row. You can specify any character to indicate a comment \
         line. The default character is [#].\n\n\
        \ Default: [#] \n\
        \ "]
  quote_escape_character : quote_escape_character option;
      [@ocaml.doc
        "A single character used for escaping the quotation mark character inside an already \
         escaped value. For example, the value [\"\"\" a , b \"\"\"] is parsed as [\" a , b \"].\n"]
  record_delimiter : record_delimiter option;
      [@ocaml.doc
        "A single character used to separate individual records in the input. Instead of the \
         default value, you can specify an arbitrary delimiter.\n"]
  field_delimiter : field_delimiter option;
      [@ocaml.doc
        "A single character used to separate individual fields in a record. You can specify an \
         arbitrary delimiter.\n"]
  quote_character : quote_character option;
      [@ocaml.doc
        "A single character used for escaping when the field delimiter is part of the value. For \
         example, if the value is [a, b], Amazon S3 wraps this field value in quotation marks, as \
         follows: [\" a ,\n\
        \        b \"].\n\n\
        \ Type: String\n\
        \ \n\
        \  Default: [\"] \n\
        \  \n\
        \   Ancestors: [CSV] \n\
        \   "]
  allow_quoted_record_delimiter : allow_quoted_record_delimiter option;
      [@ocaml.doc
        "Specifies that CSV field values may contain quoted record delimiters and such records \
         should be allowed. Default value is FALSE. Setting this value to TRUE may lower \
         performance.\n"]
}
[@@ocaml.doc
  "Describes how an uncompressed comma-separated values (CSV)-formatted input object is formatted.\n"]

type nonrec input_serialization = {
  cs_v : csv_input option; [@ocaml.doc "Describes the serialization of a CSV-encoded object.\n"]
  compression_type : compression_type option;
      [@ocaml.doc
        "Specifies object's compression format. Valid values: NONE, GZIP, BZIP2. Default Value: \
         NONE.\n"]
  jso_n : json_input option; [@ocaml.doc "Specifies JSON as object's input serialization format.\n"]
  parquet : parquet_input option;
      [@ocaml.doc "Specifies Parquet as object's input serialization format.\n"]
}
[@@ocaml.doc "Describes the serialization format of the object.\n"]

type nonrec enable_request_progress = bool [@@ocaml.doc ""]

type nonrec request_progress = {
  enabled : enable_request_progress option;
      [@ocaml.doc
        "Specifies whether periodic QueryProgress frames should be sent. Valid values: TRUE, \
         FALSE. Default value: FALSE.\n"]
}
[@@ocaml.doc "Container for specifying if periodic [QueryProgress] messages should be sent.\n"]

type nonrec expression_type = SQL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec expression = string [@@ocaml.doc ""]

type nonrec select_object_content_request = {
  bucket : bucket_name; [@ocaml.doc "The S3 bucket.\n"]
  key : object_key; [@ocaml.doc "The object key.\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is \
         needed only when the object was created using a checksum algorithm. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n"]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "The server-side encryption (SSE) customer managed key. This parameter is needed only when \
         the object was created using a checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n"]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only \
         when the object was created using a checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n"]
  expression : expression; [@ocaml.doc "The expression that is used to query the object.\n"]
  expression_type : expression_type;
      [@ocaml.doc "The type of the provided expression (for example, SQL).\n"]
  request_progress : request_progress option;
      [@ocaml.doc "Specifies if periodic request progress information should be enabled.\n"]
  input_serialization : input_serialization;
      [@ocaml.doc "Describes the format of the data in the object that is being queried.\n"]
  output_serialization : output_serialization;
      [@ocaml.doc
        "Describes the format of the data that you want Amazon S3 to return in response.\n"]
  scan_range : scan_range option;
      [@ocaml.doc
        "Specifies the byte range of the object to get the records from. A record is processed \
         when its first byte is contained by the range. This parameter is optional, but when \
         specified, it must not be empty. See RFC 2616, Section 14.35.1 about how to specify the \
         start and end of the range.\n\n\
        \  [ScanRange]may be used in the following ways:\n\
        \ \n\
        \  {ul\n\
        \        {-   \n\
        \            {[\n\
        \            50100\n\
        \            ]}\n\
        \             - process only the records starting between the bytes 50 and 100 (inclusive, \
         counting from zero)\n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            50\n\
        \            ]}\n\
        \             - process only the records starting after the byte 50\n\
        \            \n\
        \             }\n\
        \        {-   \n\
        \            {[\n\
        \            50\n\
        \            ]}\n\
        \             - process only the records within the last 50 bytes of the file.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc
  " Learn Amazon S3 Select is no longer available to new customers. Existing customers of Amazon \
   S3 Select can continue to use the feature as usual. \
   {{:http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/}Learn \
   more} \n\
  \ \n\
  \   Request to filter the contents of an Amazon S3 object based on a simple Structured Query \
   Language (SQL) statement. In the request, along with the SQL expression, you must specify a \
   data serialization format (JSON or CSV) of the object. Amazon S3 uses this to parse object data \
   into records. It returns only records that match the specified SQL expression. You must also \
   specify the data serialization format for the response. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectSELECTContent.html}S3Select API \
   Documentation}.\n\
  \   "]

type nonrec object_already_in_active_tier_error = unit [@@ocaml.doc ""]

type nonrec restore_output_path = string [@@ocaml.doc ""]

type nonrec restore_object_output = {
  request_charged : request_charged option; [@ocaml.doc ""]
  restore_output_path : restore_output_path option;
      [@ocaml.doc
        "Indicates the path in the provided S3 output location where Select results will be \
         restored to.\n"]
}
[@@ocaml.doc ""]

type nonrec metadata_entry = {
  name : metadata_key option; [@ocaml.doc "Name of the object.\n"]
  value : metadata_value option; [@ocaml.doc "Value of the object.\n"]
}
[@@ocaml.doc "A metadata key-value pair to store with an object.\n"]

type nonrec user_metadata = metadata_entry list [@@ocaml.doc ""]

type nonrec value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : object_key; [@ocaml.doc "Name of the object key.\n"]
  value : value; [@ocaml.doc "Value of the tag.\n"]
}
[@@ocaml.doc "A container of a key value name pair.\n"]

type nonrec tag_set = tag list [@@ocaml.doc ""]

type nonrec tagging = { tag_set : tag_set [@ocaml.doc "A collection for a set of tags\n"] }
[@@ocaml.doc "Container for [TagSet] elements.\n"]

type nonrec object_canned_ac_l =
  | Private [@ocaml.doc ""]
  | Public_read [@ocaml.doc ""]
  | Public_read_write [@ocaml.doc ""]
  | Authenticated_read [@ocaml.doc ""]
  | Aws_exec_read [@ocaml.doc ""]
  | Bucket_owner_read [@ocaml.doc ""]
  | Bucket_owner_full_control [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kms_context = string [@@ocaml.doc ""]

type nonrec encryption = {
  encryption_type : server_side_encryption;
      [@ocaml.doc
        "The server-side encryption algorithm used when storing job results in Amazon S3 (for \
         example, AES256, [aws:kms]).\n"]
  kms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If the encryption type is [aws:kms], this optional value specifies the ID of the \
         symmetric encryption customer managed key to use for encryption of job results. Amazon S3 \
         only supports symmetric encryption KMS keys. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric \
         keys in KMS} in the {i Amazon Web Services Key Management Service Developer Guide}.\n"]
  kms_context : kms_context option;
      [@ocaml.doc
        "If the encryption type is [aws:kms], this optional value can be used to specify the \
         encryption context for the restore results.\n"]
}
[@@ocaml.doc "Contains the type of server-side encryption used.\n"]

type nonrec location_prefix = string [@@ocaml.doc ""]

type nonrec s3_location = {
  bucket_name : bucket_name;
      [@ocaml.doc "The name of the bucket where the restore results will be placed.\n"]
  prefix : location_prefix;
      [@ocaml.doc "The prefix that is prepended to the restore results for this request.\n"]
  encryption : encryption option; [@ocaml.doc ""]
  canned_ac_l : object_canned_ac_l option;
      [@ocaml.doc "The canned ACL to apply to the restore results.\n"]
  access_control_list : grants option;
      [@ocaml.doc "A list of grants that control access to the staged results.\n"]
  tagging : tagging option; [@ocaml.doc "The tag-set that is applied to the restore results.\n"]
  user_metadata : user_metadata option;
      [@ocaml.doc "A list of metadata to store with the restore results in S3.\n"]
  storage_class : storage_class option;
      [@ocaml.doc "The class of storage used to store the restore results.\n"]
}
[@@ocaml.doc
  "Describes an Amazon S3 location that will receive the results of the restore request.\n"]

type nonrec output_location = {
  s3 : s3_location option;
      [@ocaml.doc
        "Describes an S3 location that will receive the results of the restore request.\n"]
}
[@@ocaml.doc "Describes the location where the restore job's output is stored.\n"]

type nonrec select_parameters = {
  input_serialization : input_serialization;
      [@ocaml.doc "Describes the serialization format of the object.\n"]
  expression_type : expression_type;
      [@ocaml.doc "The type of the provided expression (for example, SQL).\n"]
  expression : expression;
      [@ocaml.doc
        " Amazon S3 Select is no longer available to new customers. Existing customers of Amazon \
         S3 Select can continue to use the feature as usual. \
         {{:http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/}Learn \
         more} \n\
        \ \n\
        \   The expression that is used to query the object.\n\
        \   "]
  output_serialization : output_serialization;
      [@ocaml.doc "Describes how the results of the Select job are serialized.\n"]
}
[@@ocaml.doc
  " Amazon S3 Select is no longer available to new customers. Existing customers of Amazon S3 \
   Select can continue to use the feature as usual. \
   {{:http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/}Learn \
   more} \n\
  \ \n\
  \   Describes the parameters for Select job types.\n\
  \   \n\
  \    Learn \
   {{:http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/}How to \
   optimize querying your data in Amazon S3} using \
   {{:https://docs.aws.amazon.com/athena/latest/ug/what-is.html}Amazon Athena}, \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/transforming-objects.html}S3 Object \
   Lambda}, or client-side filtering.\n\
  \    "]

type nonrec description = string [@@ocaml.doc ""]

type nonrec tier = Standard [@ocaml.doc ""] | Bulk [@ocaml.doc ""] | Expedited [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec restore_request_type = SELECT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec glacier_job_parameters = {
  tier : tier; [@ocaml.doc "Retrieval tier at which the restore will be processed.\n"]
}
[@@ocaml.doc "Container for S3 Glacier job parameters.\n"]

type nonrec days = int [@@ocaml.doc ""]

type nonrec restore_request = {
  days : days option;
      [@ocaml.doc
        "Lifetime of the active copy in days. Do not use with restores that specify \
         [OutputLocation].\n\n\
        \ The Days element is required for regular restores, and must not be provided for select \
         requests.\n\
        \ "]
  glacier_job_parameters : glacier_job_parameters option;
      [@ocaml.doc
        "S3 Glacier related parameters pertaining to this job. Do not use with restores that \
         specify [OutputLocation].\n"]
  type_ : restore_request_type option;
      [@ocaml.doc
        " Amazon S3 Select is no longer available to new customers. Existing customers of Amazon \
         S3 Select can continue to use the feature as usual. \
         {{:http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/}Learn \
         more} \n\
        \ \n\
        \   Type of restore request.\n\
        \   "]
  tier : tier option; [@ocaml.doc "Retrieval tier at which the restore will be processed.\n"]
  description : description option; [@ocaml.doc "The optional description for the job.\n"]
  select_parameters : select_parameters option;
      [@ocaml.doc
        " Amazon S3 Select is no longer available to new customers. Existing customers of Amazon \
         S3 Select can continue to use the feature as usual. \
         {{:http://aws.amazon.com/blogs/storage/how-to-optimize-querying-your-data-in-amazon-s3/}Learn \
         more} \n\
        \ \n\
        \   Describes the parameters for Select job types.\n\
        \   "]
  output_location : output_location option;
      [@ocaml.doc "Describes the location where the restore job's output is stored.\n"]
}
[@@ocaml.doc "Container for restore job parameters.\n"]

type nonrec restore_object_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the object to restore. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \  {[\n\
        \   {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \  ]}\n\
        \  . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \  "]
  key : object_key; [@ocaml.doc "Object key for which the action was initiated.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "VersionId used to reference a specific version of the object.\n"]
  restore_request : restore_request option; [@ocaml.doc ""]
  request_payer : request_payer option; [@ocaml.doc ""]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec idempotency_parameter_mismatch = unit [@@ocaml.doc ""]

type nonrec rename_object_output = unit [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec rename_source_if_unmodified_since = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec rename_source_if_modified_since = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec rename_source_if_none_match = string [@@ocaml.doc ""]

type nonrec rename_source_if_match = string [@@ocaml.doc ""]

type nonrec if_unmodified_since = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec if_modified_since = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec if_none_match = string [@@ocaml.doc ""]

type nonrec if_match = string [@@ocaml.doc ""]

type nonrec rename_source = string [@@ocaml.doc ""]

type nonrec rename_object_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name of the directory bucket containing the object.\n\n\
        \  You must use virtual-hosted-style requests in the format \
         [Bucket-name.s3express-zone-id.region-code.amazonaws.com]. Path-style requests are not \
         supported. Directory bucket names must be unique in the chosen Availability Zone. Bucket \
         names must follow the format [bucket-base-name--zone-id--x-s3 ] (for example, \
         [amzn-s3-demo-bucket--usw2-az1--x-s3]). For information about bucket naming restrictions, \
         see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ "]
  key : object_key; [@ocaml.doc "Key name of the object to rename.\n"]
  rename_source : rename_source;
      [@ocaml.doc "Specifies the source for the rename operation. The value must be URL encoded.\n"]
  destination_if_match : if_match option;
      [@ocaml.doc
        "Renames the object only if the ETag (entity tag) value provided during the operation \
         matches the ETag of the object in S3. The [If-Match] header field makes the request \
         method conditional on ETags. If the ETag values do not match, the operation returns a \
         [412 Precondition Failed] error.\n\n\
        \ Expects the ETag value as a string.\n\
        \ "]
  destination_if_none_match : if_none_match option;
      [@ocaml.doc
        " Renames the object only if the destination does not already exist in the specified \
         directory bucket. If the object does exist when you send a request with \
         [If-None-Match:*], the S3 API will return a [412 Precondition Failed] error, preventing \
         an overwrite. The [If-None-Match] header prevents overwrites of existing data by \
         validating that there's not an object with the same key name already in your directory \
         bucket.\n\n\
        \  Expects the [*] character (asterisk).\n\
        \ "]
  destination_if_modified_since : if_modified_since option;
      [@ocaml.doc
        "Renames the object if the destination exists and if it has been modified since the \
         specified time.\n"]
  destination_if_unmodified_since : if_unmodified_since option;
      [@ocaml.doc "Renames the object if it hasn't been modified since the specified time.\n"]
  source_if_match : rename_source_if_match option;
      [@ocaml.doc
        "Renames the object if the source exists and if its entity tag (ETag) matches the \
         specified ETag. \n"]
  source_if_none_match : rename_source_if_none_match option;
      [@ocaml.doc
        "Renames the object if the source exists and if its entity tag (ETag) is different than \
         the specified ETag. If an asterisk ([*]) character is provided, the operation will fail \
         and return a [412 Precondition Failed] error. \n"]
  source_if_modified_since : rename_source_if_modified_since option;
      [@ocaml.doc
        "Renames the object if the source exists and if it has been modified since the specified \
         time.\n"]
  source_if_unmodified_since : rename_source_if_unmodified_since option;
      [@ocaml.doc
        "Renames the object if the source exists and hasn't been modified since the specified time.\n"]
  client_token : client_token option;
      [@ocaml.doc
        " A unique string with a max of 64 ASCII characters in the ASCII range of 33 - 126.\n\n\
        \   [RenameObject] supports idempotency using a client token. To make an idempotent API \
         request using [RenameObject], specify a client token in the request. You should not reuse \
         the same client token for other API requests. If you retry a request that completed \
         successfully using the same client token and the same parameters, the retry succeeds \
         without performing any further actions. If you retry a successful request using the same \
         client token, but one or more of the parameters are different, the retry fails and an \
         [IdempotentParameterMismatch] error is returned. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec setting = bool [@@ocaml.doc ""]

type nonrec public_access_block_configuration = {
  block_public_acls : setting option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should block public access control lists (ACLs) for this \
         bucket and objects in this bucket. Setting this element to [TRUE] causes the following \
         behavior:\n\n\
        \ {ul\n\
        \       {-  PUT Bucket ACL and PUT Object ACL calls fail if the specified ACL is public.\n\
        \           \n\
        \            }\n\
        \       {-  PUT Object calls fail if the request includes a public ACL.\n\
        \           \n\
        \            }\n\
        \       {-  PUT Bucket calls fail if the request includes a public ACL.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Enabling this setting doesn't affect existing policies or ACLs.\n\
        \   "]
  ignore_public_acls : setting option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should ignore public ACLs for this bucket and objects in this \
         bucket. Setting this element to [TRUE] causes Amazon S3 to ignore all public ACLs on this \
         bucket and objects in this bucket.\n\n\
        \ Enabling this setting doesn't affect the persistence of any existing ACLs and doesn't \
         prevent new public ACLs from being set.\n\
        \ "]
  block_public_policy : setting option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should block public bucket policies for this bucket. Setting \
         this element to [TRUE] causes Amazon S3 to reject calls to PUT Bucket policy if the \
         specified bucket policy allows public access. \n\n\
        \ Enabling this setting doesn't affect existing bucket policies.\n\
        \ "]
  restrict_public_buckets : setting option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should restrict public bucket policies for this bucket. \
         Setting this element to [TRUE] restricts access to this bucket to only Amazon Web \
         Services service principals and authorized users within this account if the bucket has a \
         public policy.\n\n\
        \ Enabling this setting doesn't affect previously stored bucket policies, except that \
         public and cross-account access within any public bucket policy, including non-public \
         delegation to specific accounts, is blocked.\n\
        \ "]
}
[@@ocaml.doc
  "The PublicAccessBlock configuration that you want to apply to this Amazon S3 bucket. You can \
   enable the configuration options in any combination. Bucket-level settings work alongside \
   account-level settings (which may inherit from organization-level policies). For more \
   information about when Amazon S3 considers a bucket or object public, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status}The \
   Meaning of \"Public\"} in the {i Amazon S3 User Guide}. \n"]

type nonrec put_public_access_block_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket whose [PublicAccessBlock] configuration you want to set.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash of the [PutPublicAccessBlock] request body. \n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  public_access_block_configuration : public_access_block_configuration;
      [@ocaml.doc
        "The [PublicAccessBlock] configuration that you want to apply to this Amazon S3 bucket. \
         You can enable the configuration options in any combination. For more information about \
         when Amazon S3 considers a bucket or object public, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html#access-control-block-public-access-policy-status}The \
         Meaning of \"Public\"} in the {i Amazon S3 User Guide}.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec put_object_tagging_output = {
  version_id : object_version_id option;
      [@ocaml.doc "The versionId of the object the tag-set was added to.\n"]
}
[@@ocaml.doc ""]

type nonrec put_object_tagging_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the object. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \  {[\n\
        \   {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \  ]}\n\
        \  . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \  "]
  key : object_key; [@ocaml.doc "Name of the object key.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "The versionId of the object that the tag-set will be added to.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash for the request body.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  tagging : tagging; [@ocaml.doc "Container for the [TagSet] and [Tag] elements\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  request_payer : request_payer option;
      [@ocaml.doc
        "Confirms that the requester knows that she or he will be charged for the tagging object \
         request. Bucket owners need not specify this parameter in their requests.\n"]
}
[@@ocaml.doc ""]

type nonrec put_object_retention_output = {
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec bypass_governance_retention = bool [@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec object_lock_retention_mode = GOVERNANCE [@ocaml.doc ""] | COMPLIANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_lock_retention = {
  mode : object_lock_retention_mode option;
      [@ocaml.doc "Indicates the Retention mode for the specified object.\n"]
  retain_until_date : date option;
      [@ocaml.doc "The date on which this Object Lock Retention will expire.\n"]
}
[@@ocaml.doc "A Retention configuration for an object.\n"]

type nonrec put_object_retention_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name that contains the object you want to apply this Object Retention \
         configuration to. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  key : object_key;
      [@ocaml.doc
        "The key name for the object that you want to apply this Object Retention configuration to.\n"]
  retention : object_lock_retention option;
      [@ocaml.doc "The container element for the Object Retention configuration.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  version_id : object_version_id option;
      [@ocaml.doc
        "The version ID for the object that you want to apply this Object Retention configuration \
         to.\n"]
  bypass_governance_retention : bypass_governance_retention option;
      [@ocaml.doc "Indicates whether this action should bypass Governance-mode restrictions.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash for the request body.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec put_object_lock_configuration_output = {
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec object_lock_token = string [@@ocaml.doc ""]

type nonrec years = int [@@ocaml.doc ""]

type nonrec default_retention = {
  mode : object_lock_retention_mode option;
      [@ocaml.doc
        "The default Object Lock retention mode you want to apply to new objects placed in the \
         specified bucket. Must be used with either [Days] or [Years].\n"]
  days : days option;
      [@ocaml.doc
        "The number of days that you want to specify for the default retention period. Must be \
         used with [Mode].\n"]
  years : years option;
      [@ocaml.doc
        "The number of years that you want to specify for the default retention period. Must be \
         used with [Mode].\n"]
}
[@@ocaml.doc
  "The container element for optionally specifying the default Object Lock retention settings for \
   new objects placed in the specified bucket.\n\n\
  \  {ul\n\
  \        {-  The [DefaultRetention] settings require both a mode and a period.\n\
  \            \n\
  \             }\n\
  \        {-  The [DefaultRetention] period can be either [Days] or [Years] but you must select \
   one. You cannot specify [Days] and [Years] at the same time.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

type nonrec object_lock_rule = {
  default_retention : default_retention option;
      [@ocaml.doc
        "The default Object Lock retention mode and period that you want to apply to new objects \
         placed in the specified bucket. Bucket settings require both a mode and a period. The \
         period can be either [Days] or [Years] but you must select one. You cannot specify [Days] \
         and [Years] at the same time.\n"]
}
[@@ocaml.doc "The container element for an Object Lock rule.\n"]

type nonrec object_lock_enabled = Enabled [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec object_lock_configuration = {
  object_lock_enabled : object_lock_enabled option;
      [@ocaml.doc
        "Indicates whether this bucket has an Object Lock configuration enabled. Enable \
         [ObjectLockEnabled] when you apply [ObjectLockConfiguration] to a bucket. \n"]
  rule : object_lock_rule option;
      [@ocaml.doc
        "Specifies the Object Lock rule for the specified object. Enable the this rule when you \
         apply [ObjectLockConfiguration] to a bucket. Bucket settings require both a mode and a \
         period. The period can be either [Days] or [Years] but you must select one. You cannot \
         specify [Days] and [Years] at the same time.\n"]
}
[@@ocaml.doc "The container element for Object Lock configuration parameters.\n"]

type nonrec put_object_lock_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The bucket whose Object Lock configuration you want to create or replace.\n"]
  object_lock_configuration : object_lock_configuration option;
      [@ocaml.doc "The Object Lock configuration that you want to apply to the specified bucket.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  token : object_lock_token option;
      [@ocaml.doc "A token to allow Object Lock to be enabled for an existing bucket.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash for the request body.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec put_object_legal_hold_output = {
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec object_lock_legal_hold = {
  status : object_lock_legal_hold_status option;
      [@ocaml.doc "Indicates whether the specified object has a legal hold in place.\n"]
}
[@@ocaml.doc "A legal hold configuration for an object.\n"]

type nonrec put_object_legal_hold_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the object that you want to place a legal hold on. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  key : object_key;
      [@ocaml.doc "The key name for the object that you want to place a legal hold on.\n"]
  legal_hold : object_lock_legal_hold option;
      [@ocaml.doc
        "Container element for the legal hold configuration you want to apply to the specified \
         object.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  version_id : object_version_id option;
      [@ocaml.doc "The version ID of the object that you want to place a legal hold on.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash for the request body.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_media_type = unit [@@ocaml.doc ""]

type nonrec no_such_bucket = unit [@@ocaml.doc ""]

type nonrec invalid_annotation_name = unit [@@ocaml.doc ""]

type nonrec annotation_name_too_long = unit [@@ocaml.doc ""]

type nonrec annotation_limit_exceeded = unit [@@ocaml.doc ""]

type nonrec checksum_type = COMPOSITE [@ocaml.doc ""] | FULL_OBJECT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec annotation_name = string [@@ocaml.doc ""]

type nonrec put_object_annotation_output = {
  key : object_key option; [@ocaml.doc "The object key.\n"]
  annotation_name : annotation_name option; [@ocaml.doc "The name of the annotation.\n"]
  object_version_id : object_version_id option;
      [@ocaml.doc "The version ID of the object that the annotation was attached to.\n"]
  e_tag : e_tag option; [@ocaml.doc "The entity tag of the annotation.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc "The CRC32 checksum of the stored annotation.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc "The CRC32C checksum of the stored annotation.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc "The CRC64NVME checksum of the stored annotation.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc "The SHA1 checksum of the stored annotation.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc "The SHA256 checksum of the stored annotation.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc "The SHA512 checksum of the stored annotation.\n"]
  checksum_m_d5 : checksum_m_d5 option; [@ocaml.doc "The MD5 checksum of the stored annotation.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc "The XXHASH64 checksum of the stored annotation.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc "The XXHASH3 checksum of the stored annotation.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc "The XXHASH128 checksum of the stored annotation.\n"]
  checksum_type : checksum_type option; [@ocaml.doc "The type of checksum used.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc "The server-side encryption algorithm used to encrypt the annotation.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec object_if_match = string [@@ocaml.doc ""]

type nonrec put_object_annotation_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the bucket that contains the object.\n"]
  key : object_key; [@ocaml.doc "The object key.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "The version ID of the object to attach the annotation to.\n"]
  annotation_name : annotation_name;
      [@ocaml.doc
        "The name of the annotation.\n\n\
        \ Length Constraints: Minimum length of 1. Maximum length of 512 bytes.\n\
        \ "]
  annotation_payload : streaming_blob;
      [@ocaml.doc
        "The annotation payload. Must be between 1 byte and 1 MiB in size, and must be valid UTF-8 \
         encoded text. If the payload contains invalid UTF-8 bytes, the request fails with HTTP \
         415 (Unsupported Media Type). To store binary data, encode the payload using Base64 \
         before uploading.\n"]
  object_if_match : object_if_match option;
      [@ocaml.doc
        "If specified, the operation only succeeds if the object's ETag matches the provided value.\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "The checksum algorithm to use. Supported values: [CRC32], [CRC32C], [CRC64NVME], [SHA1], \
         [SHA256], [SHA512], [MD5], [XXHASH64], [XXHASH3], [XXHASH128].\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc "Base64-encoded CRC32 checksum of the annotation payload.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc "Base64-encoded CRC32C checksum of the annotation payload.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc "Base64-encoded CRC64NVME checksum of the annotation payload.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc "Base64-encoded SHA1 checksum of the annotation payload.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc "Base64-encoded SHA256 checksum of the annotation payload.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc "Base64-encoded SHA512 checksum of the annotation payload.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc "Base64-encoded MD5 checksum of the annotation payload.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc "Base64-encoded XXHASH64 checksum of the annotation payload.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc "Base64-encoded XXHASH3 checksum of the annotation payload.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc "Base64-encoded XXHASH128 checksum of the annotation payload.\n"]
  content_m_d5 : content_m_d5 option; [@ocaml.doc "Base64-encoded MD5 digest of the message.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the bucket is owned by a different \
         account, the request fails with an HTTP 403 (Access Denied) error.\n"]
}
[@@ocaml.doc ""]

type nonrec put_object_acl_output = { request_charged : request_charged option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec grant_write_ac_p = string [@@ocaml.doc ""]

type nonrec grant_write = string [@@ocaml.doc ""]

type nonrec grant_read_ac_p = string [@@ocaml.doc ""]

type nonrec grant_read = string [@@ocaml.doc ""]

type nonrec grant_full_control = string [@@ocaml.doc ""]

type nonrec put_object_acl_request = {
  ac_l : object_canned_ac_l option;
      [@ocaml.doc
        "The canned ACL to apply to the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL}Canned \
         ACL}.\n"]
  access_control_policy : access_control_policy option;
      [@ocaml.doc "Contains the elements that set the ACL permissions for an object per grantee.\n"]
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name that contains the object to which you want to attach the ACL. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \  {[\n\
        \   {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \  ]}\n\
        \  . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \  "]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the data. This header must be used as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, go to {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864.>} \n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  grant_full_control : grant_full_control option;
      [@ocaml.doc
        "Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.\n\n\
        \ This functionality is not supported for Amazon S3 on Outposts.\n\
        \ "]
  grant_read : grant_read option;
      [@ocaml.doc
        "Allows grantee to list the objects in the bucket.\n\n\
        \ This functionality is not supported for Amazon S3 on Outposts.\n\
        \ "]
  grant_read_ac_p : grant_read_ac_p option;
      [@ocaml.doc
        "Allows grantee to read the bucket ACL.\n\n\
        \ This functionality is not supported for Amazon S3 on Outposts.\n\
        \ "]
  grant_write : grant_write option;
      [@ocaml.doc
        "Allows grantee to create new objects in the bucket.\n\n\
        \ For the bucket and object owners of existing objects, also allows deletions and \
         overwrites of those objects.\n\
        \ "]
  grant_write_ac_p : grant_write_ac_p option;
      [@ocaml.doc
        "Allows grantee to write the ACL for the applicable bucket.\n\n\
        \ This functionality is not supported for Amazon S3 on Outposts.\n\
        \ "]
  key : object_key; [@ocaml.doc "Key for which the PUT action was initiated.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID used to reference a specific version of the object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_parts = unit [@@ocaml.doc ""]

type nonrec invalid_write_offset = unit [@@ocaml.doc ""]

type nonrec encryption_type_mismatch = unit [@@ocaml.doc ""]

type nonrec size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec ssekms_encryption_context = string [@@ocaml.doc ""]

type nonrec put_object_output = {
  expiration : expiration option;
      [@ocaml.doc
        "If the expiration is configured for the object (see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html}PutBucketLifecycleConfiguration}) \
         in the {i Amazon S3 User Guide}, the response includes this header. It includes the \
         [expiry-date] and [rule-id] key-value pairs that provide information about object \
         expiration. The value of the [rule-id] is URL-encoded.\n\n\
        \  Object expiration information is not returned in directory buckets and this header \
         returns the value \"[NotImplemented]\" in all responses for directory buckets.\n\
        \  \n\
        \   "]
  e_tag : e_tag option;
      [@ocaml.doc
        "Entity tag for the uploaded object.\n\n\
        \  {b General purpose buckets } - To ensure that data is not corrupted traversing the \
         network, for objects where the ETag is the MD5 digest of the object, you can calculate \
         the MD5 while putting an object to Amazon S3 and compare the returned ETag to the \
         calculated MD5 value.\n\
        \ \n\
        \   {b Directory buckets } - The ETag for the object in a directory bucket isn't the MD5 \
         digest of the object.\n\
        \  "]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32 checksum] of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the object. This header is present if \
         the object was uploaded with the [CRC64NVME] checksum algorithm, or if it was uploaded \
         without a checksum (and Amazon S3 added the default checksum, [CRC64NVME], to the \
         uploaded object). For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] digest of the object. This checksum is only present if \
         the checksum was uploaded with the object. When you use the API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] digest of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the object. This header is present if the \
         object was uploaded with the [SHA512] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the object. This header is present if the \
         object was uploaded with the [MD5] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the object. This header is present if \
         the object was uploaded with the [XXHASH64] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the object. This header is present if \
         the object was uploaded with the [XXHASH3] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the object. This header is present if \
         the object was uploaded with the [XXHASH128] checksum algorithm. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "This header specifies the checksum type of the object, which determines how part-level \
         checksums are combined to create an object-level checksum for multipart objects. For \
         [PutObject] uploads, the checksum type is always [FULL_OBJECT]. You can use this header \
         as a data integrity check to verify that the checksum type that is received is the same \
         checksum that was specified. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID of the object.\n\n\
        \ If you enable versioning for a bucket, Amazon S3 automatically generates a unique \
         version ID for the object being stored. Amazon S3 returns this ID in the response. When \
         you enable versioning for a bucket, if Amazon S3 receives multiple write requests for the \
         same object simultaneously, it stores all of the objects. For more information about \
         versioning, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/AddingObjectstoVersioningEnabledBuckets.html}Adding \
         Objects to Versioning-Enabled Buckets} in the {i Amazon S3 User Guide}. For information \
         about returning the versioning state of a bucket, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html}GetBucketVersioning}. \n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to confirm the encryption algorithm that's used.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to provide the round-trip message integrity \
         verification of the customer-provided encryption key.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "If present, indicates the Amazon Web Services KMS Encryption Context to use for object \
         encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, \
         which contains the encryption context as key-value pairs. This value is stored as object \
         metadata and automatically gets passed on to Amazon Web Services KMS for future \
         [GetObject] operations on this object.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the uploaded object uses an S3 Bucket Key for server-side encryption \
         with Key Management Service (KMS) keys (SSE-KMS).\n"]
  size : size option;
      [@ocaml.doc
        " The size of the object in bytes. This value is only be present if you append to an \
         object. \n\n\
        \  This functionality is only supported for objects in the Amazon S3 Express One Zone \
         storage class in directory buckets.\n\
        \  \n\
        \   "]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec tagging_header = string [@@ocaml.doc ""]

type nonrec website_redirect_location = string [@@ocaml.doc ""]

type nonrec write_offset_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec put_object_request = {
  ac_l : object_canned_ac_l option;
      [@ocaml.doc
        "The canned ACL to apply to the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL}Canned \
         ACL} in the {i Amazon S3 User Guide}.\n\n\
        \ When adding a new object, you can use headers to grant ACL-based permissions to \
         individual Amazon Web Services accounts or to predefined groups defined by Amazon S3. \
         These permissions are then added to the ACL on the object. By default, all objects are \
         private. Only the owner has full access control. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html}Access Control List \
         (ACL) Overview} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-using-rest-api.html}Managing ACLs \
         Using the REST API} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \  If the bucket that you're uploading objects to uses the bucket owner enforced setting \
         for S3 Object Ownership, ACLs are disabled and no longer affect permissions. Buckets that \
         use this setting only accept PUT requests that don't specify an ACL or PUT requests that \
         specify bucket owner full control ACLs, such as the [bucket-owner-full-control] canned \
         ACL or an equivalent form of this ACL expressed in the XML format. PUT requests that \
         contain other ACLs (for example, custom grants to certain Amazon Web Services accounts) \
         fail and return a [400] error with the error code [AccessControlListNotSupported]. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html} \
         Controlling ownership of objects and disabling ACLs} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    {ul\n\
        \          {-  This functionality is not supported for directory buckets.\n\
        \              \n\
        \               }\n\
        \          {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  body : streaming_blob option; [@ocaml.doc "Object data.\n"]
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name to which the PUT action was initiated. \n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  cache_control : cache_control option;
      [@ocaml.doc
        "Can be used to specify caching behavior along the request/reply chain. For more \
         information, see \
         {{:http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9}http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9}.\n"]
  content_disposition : content_disposition option;
      [@ocaml.doc
        "Specifies presentational information for the object. For more information, see \
         {{:https://www.rfc-editor.org/rfc/rfc6266#section-4}https://www.rfc-editor.org/rfc/rfc6266#section-4}.\n"]
  content_encoding : content_encoding option;
      [@ocaml.doc
        "Specifies what content encodings have been applied to the object and thus what decoding \
         mechanisms must be applied to obtain the media-type referenced by the Content-Type header \
         field. For more information, see \
         {{:https://www.rfc-editor.org/rfc/rfc9110.html#field.content-encoding}https://www.rfc-editor.org/rfc/rfc9110.html#field.content-encoding}.\n"]
  content_language : content_language option; [@ocaml.doc "The language the content is in.\n"]
  content_length : content_length option;
      [@ocaml.doc
        "Size of the body in bytes. This parameter is useful when the size of the body cannot be \
         determined automatically. For more information, see \
         {{:https://www.rfc-editor.org/rfc/rfc9110.html#name-content-length}https://www.rfc-editor.org/rfc/rfc9110.html#name-content-length}.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the message (without the headers) according to \
         RFC 1864. This header can be used as a message integrity check to verify that the data is \
         the same data that was originally sent. Although it is optional, we recommend using the \
         Content-MD5 mechanism as an end-to-end integrity check. For more information about REST \
         request authentication, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html}REST \
         Authentication}.\n\n\
        \  The [Content-MD5] or [x-amz-sdk-checksum-algorithm] header is required for any request \
         to upload an object with a retention period configured using Amazon S3 Object Lock. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock-managing.html#object-lock-put-object}Uploading \
         objects to an Object Lock enabled bucket } in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \     This functionality is not supported for directory buckets.\n\
        \     \n\
        \      "]
  content_type : content_type option;
      [@ocaml.doc
        "A standard MIME type describing the format of the contents. For more information, see \
         {{:https://www.rfc-editor.org/rfc/rfc9110.html#name-content-type}https://www.rfc-editor.org/rfc/rfc9110.html#name-content-type}.\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding \n\
         {[\n\
         x-amz-checksum-{i algorithm} \n\
         ]}\n\
        \ or [x-amz-trailer] header sent. Otherwise, Amazon S3 fails the request with the HTTP \
         status code [400 Bad Request].\n\n\
        \ For the \n\
        \ {[\n\
        \ x-amz-checksum-{i algorithm} \n\
        \ ]}\n\
        \  header, replace \n\
        \ {[\n\
        \  {i algorithm} \n\
        \ ]}\n\
        \  with the supported algorithm from the following list: \n\
        \ \n\
        \  {ul\n\
        \        {-   [CRC32] \n\
        \            \n\
        \             }\n\
        \        {-   [CRC32C] \n\
        \            \n\
        \             }\n\
        \        {-   [CRC64NVME] \n\
        \            \n\
        \             }\n\
        \        {-   [MD5] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA1] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA256] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA512] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH3] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH64] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH128] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\
        \   \n\
        \    If the individual checksum value you provide through \n\
        \    {[\n\
        \    x-amz-checksum-{i algorithm} \n\
        \    ]}\n\
        \     doesn't match the checksum algorithm you set through [x-amz-sdk-checksum-algorithm], \
         Amazon S3 fails the request with a [BadDigest] error.\n\
        \    \n\
        \      The [Content-MD5] or [x-amz-sdk-checksum-algorithm] header is required for any \
         request to upload an object with a retention period configured using Amazon S3 Object \
         Lock. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lock-managing.html#object-lock-put-object}Uploading \
         objects to an Object Lock enabled bucket } in the {i Amazon S3 User Guide}.\n\
        \      \n\
        \        For directory buckets, when you use Amazon Web Services SDKs, [CRC32] is the \
         default checksum algorithm that's used for performance.\n\
        \        "]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 32-bit \
         [CRC32] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 32-bit \
         [CRC32C] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [CRC64NVME] checksum of the object. The [CRC64NVME] checksum is always a full object \
         checksum. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 160-bit \
         [SHA1] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 256-bit \
         [SHA256] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 512-bit \
         [SHA512] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [MD5] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH64] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH3] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [XXHASH128] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  expires : expires option;
      [@ocaml.doc
        "The date and time at which the object is no longer cacheable. For more information, see \
         {{:https://www.rfc-editor.org/rfc/rfc7234#section-5.3}https://www.rfc-editor.org/rfc/rfc7234#section-5.3}.\n"]
  if_match : if_match option;
      [@ocaml.doc
        "Uploads the object only if the ETag (entity tag) value provided during the WRITE \
         operation matches the ETag of the object in S3. If the ETag values do not match, the \
         operation returns a [412\n\
        \        Precondition Failed] error.\n\n\
        \ If a conflicting operation occurs during the upload S3 returns a [409\n\
        \        ConditionalRequestConflict] response. On a 409 failure you should fetch the \
         object's ETag and retry the upload.\n\
        \ \n\
        \  Expects the ETag value as a string.\n\
        \  \n\
        \   For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html}Conditional \
         requests} in the {i Amazon S3 User Guide}.\n\
        \   "]
  if_none_match : if_none_match option;
      [@ocaml.doc
        "Uploads the object only if the object key name does not already exist in the bucket \
         specified. Otherwise, Amazon S3 returns a [412 Precondition Failed] error.\n\n\
        \ If a conflicting operation occurs during the upload S3 returns a [409\n\
        \        ConditionalRequestConflict] response. On a 409 failure you should retry the upload.\n\
        \ \n\
        \  Expects the '*' (asterisk) character.\n\
        \  \n\
        \   For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html}Conditional \
         requests} in the {i Amazon S3 User Guide}.\n\
        \   "]
  grant_full_control : grant_full_control option;
      [@ocaml.doc
        "Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  grant_read : grant_read option;
      [@ocaml.doc
        "Allows grantee to read the object data and its metadata.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  grant_read_ac_p : grant_read_ac_p option;
      [@ocaml.doc
        "Allows grantee to read the object ACL.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  grant_write_ac_p : grant_write_ac_p option;
      [@ocaml.doc
        "Allows grantee to write the ACL for the applicable object.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  key : object_key; [@ocaml.doc "Object key for which the PUT action was initiated.\n"]
  write_offset_bytes : write_offset_bytes option;
      [@ocaml.doc
        " Specifies the offset for appending data to existing objects in bytes. The offset must be \
         equal to the size of the existing object being appended to. If no object exists, setting \
         this header to 0 will create a new object. \n\n\
        \  This functionality is only supported for objects in the Amazon S3 Express One Zone \
         storage class in directory buckets.\n\
        \  \n\
        \   "]
  metadata : metadata option; [@ocaml.doc "A map of metadata to store with the object in S3.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm that was used when you store this object in Amazon \
         S3 or Amazon FSx.\n\n\
        \ {ul\n\
        \       {-   {b General purpose buckets } - You have four mutually exclusive options to \
         protect data using server-side encryption in Amazon S3, depending on how you choose to \
         manage the encryption keys. Specifically, the encryption key options are Amazon S3 \
         managed keys (SSE-S3), Amazon Web Services KMS keys (SSE-KMS or DSSE-KMS), and \
         customer-provided keys (SSE-C). Amazon S3 encrypts data with server-side encryption by \
         using Amazon S3 managed keys (SSE-S3) by default. You can optionally tell Amazon S3 to \
         encrypt data at rest by using server-side encryption with other key options. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html}Using \
         Server-Side Encryption} in the {i Amazon S3 User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-   {b Directory buckets } - For directory buckets, there are only two supported \
         options for server-side encryption: server-side encryption with Amazon S3 managed keys \
         (SSE-S3) ([AES256]) and server-side encryption with KMS keys (SSE-KMS) ([aws:kms]). We \
         recommend that the bucket's default encryption uses the desired encryption configuration \
         and you don't override the bucket default encryption in your [CreateSession] requests or \
         [PUT] object requests. Then, new objects are automatically encrypted with the desired \
         encryption settings. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html}Protecting \
         data with server-side encryption} in the {i Amazon S3 User Guide}. For more information \
         about the encryption overriding behaviors in directory buckets, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html}Specifying \
         server-side encryption with KMS for new object uploads}. \n\
        \           \n\
        \            In the Zonal endpoint API calls (except \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}) \
         using the REST API, the encryption request headers must match the encryption settings \
         that are specified in the [CreateSession] request. You can't override the values of the \
         encryption settings ([x-amz-server-side-encryption], \
         [x-amz-server-side-encryption-aws-kms-key-id], [x-amz-server-side-encryption-context], \
         and [x-amz-server-side-encryption-bucket-key-enabled]) that are specified in the \
         [CreateSession] request. You don't need to explicitly specify these encryption settings \
         values in Zonal endpoint API calls, and Amazon S3 will use the encryption settings values \
         from the [CreateSession] request to protect new objects in the directory bucket. \n\
        \            \n\
        \              When you use the CLI or the Amazon Web Services SDKs, for [CreateSession], \
         the session token refreshes automatically to avoid service interruptions when a session \
         expires. The CLI or the Amazon Web Services SDKs use the bucket's default encryption \
         configuration for the [CreateSession] request. It's not supported to override the \
         encryption settings values in the [CreateSession] request. So in the Zonal endpoint API \
         calls (except \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}), \
         the encryption request headers must match the default encryption configuration of the \
         directory bucket. \n\
        \              \n\
        \                }\n\
        \       {-   {b S3 access points for Amazon FSx } - When accessing data stored in Amazon \
         FSx file systems using S3 access points, the only valid server side encryption option is \
         [aws:fsx]. All Amazon FSx file systems have encryption configured by default and are \
         encrypted at rest. Data is automatically encrypted before being written to the file \
         system, and automatically decrypted as it is read. These processes are handled \
         transparently by Amazon FSx.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  storage_class : storage_class option;
      [@ocaml.doc
        "By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The \
         STANDARD storage class provides high durability and high availability. Depending on \
         performance needs, you can specify a different Storage Class. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html}Storage \
         Classes} in the {i Amazon S3 User Guide}.\n\n\
        \  {ul\n\
        \        {-  Directory buckets only support [EXPRESS_ONEZONE] (the S3 Express One Zone \
         storage class) in Availability Zones and [ONEZONE_IA] (the S3 One Zone-Infrequent Access \
         storage class) in Dedicated Local Zones.\n\
        \            \n\
        \             }\n\
        \        {-  Amazon S3 on Outposts only uses the OUTPOSTS Storage Class.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  website_redirect_location : website_redirect_location option;
      [@ocaml.doc
        "If the bucket is configured as a website, redirects requests for this object to another \
         object in the same bucket or to an external URL. Amazon S3 stores the value of this \
         header in the object metadata. For information about object metadata, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html}Object Key and \
         Metadata} in the {i Amazon S3 User Guide}.\n\n\
        \ In the following example, the request header sets the redirect to an object \
         (anotherPage.html) in the same bucket:\n\
        \ \n\
        \   [x-amz-website-redirect-location: /anotherPage.html] \n\
        \  \n\
        \   In the following example, the request header sets the object redirect to another \
         website:\n\
        \   \n\
        \     [x-amz-website-redirect-location: http://www.example.com/] \n\
        \    \n\
        \     For more information about website hosting in Amazon S3, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html}Hosting Websites \
         on Amazon S3} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html}How to \
         Configure Website Page Redirects} in the {i Amazon S3 User Guide}. \n\
        \     \n\
        \       This functionality is not supported for directory buckets.\n\
        \       \n\
        \        "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when encrypting the object (for example, [AES256]).\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. \
         This value is used to store the object and then it is discarded; Amazon S3 does not store \
         the encryption key. The key must be appropriate for use with the algorithm specified in \
         the [x-amz-server-side-encryption-customer-algorithm] header.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. If \
         the KMS key doesn't exist in the same account that's issuing the command, you must use \
         the full Key ARN not the Key ID.\n\n\
        \  {b General purpose buckets} - If you specify [x-amz-server-side-encryption] with \
         [aws:kms] or [aws:kms:dsse], this header specifies the ID (Key ID, Key ARN, or Key Alias) \
         of the KMS key to use. If you specify [x-amz-server-side-encryption:aws:kms] or \
         [x-amz-server-side-encryption:aws:kms:dsse], but do not provide \
         [x-amz-server-side-encryption-aws-kms-key-id], Amazon S3 uses the Amazon Web Services \
         managed key ([aws/s3]) to protect the data.\n\
        \ \n\
        \   {b Directory buckets} - To encrypt data using SSE-KMS, it's recommended to specify the \
         [x-amz-server-side-encryption] header to [aws:kms]. Then, the \
         [x-amz-server-side-encryption-aws-kms-key-id] header implicitly uses the bucket's default \
         KMS customer managed key ID. If you want to explicitly set the [\n\
        \         x-amz-server-side-encryption-aws-kms-key-id] header, it must match the bucket's \
         default customer managed key (using key ID or ARN, not alias). Your SSE-KMS configuration \
         can only support 1 \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer \
         managed key} per directory bucket's lifetime. The \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
         Web Services managed key} ([aws/s3]) isn't supported. Incorrect key specification results \
         in an HTTP [400 Bad Request] error. \n\
        \  "]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "Specifies the Amazon Web Services KMS Encryption Context as an additional encryption \
         context to use for object encryption. The value of this header is a Base64 encoded string \
         of a UTF-8 encoded JSON, which contains the encryption context as key-value pairs. This \
         value is stored as object metadata and automatically gets passed on to Amazon Web \
         Services KMS for future [GetObject] operations on this object.\n\n\
        \  {b General purpose buckets} - This value must be explicitly added during [CopyObject] \
         operations if you want an additional encryption context for your object. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html#encryption-context}Encryption \
         context} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Directory buckets} - You can optionally provide an explicit encryption context \
         value. The value must match the default encryption context - the bucket Amazon Resource \
         Name (ARN). An additional encryption context value is not supported. \n\
        \  "]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with \
         server-side encryption using Key Management Service (KMS) keys (SSE-KMS).\n\n\
        \  {b General purpose buckets} - Setting this header to [true] causes Amazon S3 to use an \
         S3 Bucket Key for object encryption with SSE-KMS. Also, specifying this header with a PUT \
         action doesn't affect bucket-level settings for S3 Bucket Key.\n\
        \ \n\
        \   {b Directory buckets} - S3 Bucket Keys are always enabled for [GET] and [PUT] \
         operations in a directory bucket and can\226\128\153t be disabled. S3 Bucket Keys aren't \
         supported, when you copy SSE-KMS encrypted objects from general purpose buckets to \
         directory buckets, from directory buckets to general purpose buckets, or between \
         directory buckets, through \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops}the \
         Copy operation in Batch Operations}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job}the import \
         jobs}. In this case, Amazon S3 makes a call to KMS every time a copy request is made for \
         a KMS-encrypted object.\n\
        \  "]
  request_payer : request_payer option; [@ocaml.doc ""]
  tagging : tagging_header option;
      [@ocaml.doc
        "The tag-set for the object. The tag-set must be encoded as URL Query parameters. (For \
         example, \"Key1=Value1\")\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_mode : object_lock_mode option;
      [@ocaml.doc
        "The Object Lock mode that you want to apply to this object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_retain_until_date : object_lock_retain_until_date option;
      [@ocaml.doc
        "The date and time when you want this object's Object Lock to expire. Must be formatted as \
         a timestamp parameter.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_legal_hold_status : object_lock_legal_hold_status option;
      [@ocaml.doc
        "Specifies whether a legal hold will be applied to this object. For more information about \
         S3 Object Lock, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html}Object Lock} in the \
         {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec replace_key_with = string [@@ocaml.doc ""]

type nonrec replace_key_prefix_with = string [@@ocaml.doc ""]

type nonrec protocol = Http [@ocaml.doc ""] | Https [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec http_redirect_code = string [@@ocaml.doc ""]

type nonrec host_name = string [@@ocaml.doc ""]

type nonrec redirect = {
  host_name : host_name option; [@ocaml.doc "The host name to use in the redirect request.\n"]
  http_redirect_code : http_redirect_code option;
      [@ocaml.doc
        "The HTTP redirect code to use on the response. Not required if one of the siblings is \
         present.\n"]
  protocol : protocol option;
      [@ocaml.doc
        "Protocol to use when redirecting requests. The default is the protocol that is used in \
         the original request.\n"]
  replace_key_prefix_with : replace_key_prefix_with option;
      [@ocaml.doc
        "The object key prefix to use in the redirect request. For example, to redirect requests \
         for all pages with prefix [docs/] (objects in the [docs/] folder) to [documents/], you \
         can set a condition block with [KeyPrefixEquals] set to [docs/] and in the Redirect set \
         [ReplaceKeyPrefixWith] to [/documents]. Not required if one of the siblings is present. \
         Can be present only if [ReplaceKeyWith] is not provided.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
  replace_key_with : replace_key_with option;
      [@ocaml.doc
        "The specific object key to use in the redirect request. For example, redirect request to \
         [error.html]. Not required if one of the siblings is present. Can be present only if \
         [ReplaceKeyPrefixWith] is not provided.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Specifies how requests are redirected. In the event of an error, you can specify a different \
   error code to return.\n"]

type nonrec key_prefix_equals = string [@@ocaml.doc ""]

type nonrec http_error_code_returned_equals = string [@@ocaml.doc ""]

type nonrec condition = {
  http_error_code_returned_equals : http_error_code_returned_equals option;
      [@ocaml.doc
        "The HTTP error code when the redirect is applied. In the event of an error, if the error \
         code equals this value, then the specified redirect is applied. Required when parent \
         element [Condition] is specified and sibling [KeyPrefixEquals] is not specified. If both \
         are specified, then both must be true for the redirect to be applied.\n"]
  key_prefix_equals : key_prefix_equals option;
      [@ocaml.doc
        "The object key name prefix when the redirect is applied. For example, to redirect \
         requests for [ExamplePage.html], the key prefix will be [ExamplePage.html]. To redirect \
         request for all pages with the prefix [docs/], the key prefix will be [/docs], which \
         identifies all objects in the [docs/] folder. Required when the parent element \
         [Condition] is specified and sibling [HttpErrorCodeReturnedEquals] is not specified. If \
         both conditions are specified, both must be true for the redirect to be applied.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A container for describing a condition that must be met for the specified redirect to apply. \
   For example, 1. If request is for pages in the [/docs] folder, redirect to the [/documents] \
   folder. 2. If request results in HTTP error 4xx, redirect request to another host where you \
   might process the error.\n"]

type nonrec routing_rule = {
  condition : condition option;
      [@ocaml.doc
        "A container for describing a condition that must be met for the specified redirect to \
         apply. For example, 1. If request is for pages in the [/docs] folder, redirect to the \
         [/documents] folder. 2. If request results in HTTP error 4xx, redirect request to another \
         host where you might process the error.\n"]
  redirect : redirect;
      [@ocaml.doc
        "Container for redirect information. You can redirect requests to another host, to another \
         page, or with another protocol. In the event of an error, you can specify a different \
         error code to return.\n"]
}
[@@ocaml.doc
  "Specifies the redirect behavior and when a redirect is applied. For more information about \
   routing rules, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/how-to-page-redirect.html#advanced-conditional-redirects}Configuring \
   advanced conditional redirects} in the {i Amazon S3 User Guide}.\n"]

type nonrec routing_rules = routing_rule list [@@ocaml.doc ""]

type nonrec redirect_all_requests_to = {
  host_name : host_name; [@ocaml.doc "Name of the host where requests are redirected.\n"]
  protocol : protocol option;
      [@ocaml.doc
        "Protocol to use when redirecting requests. The default is the protocol that is used in \
         the original request.\n"]
}
[@@ocaml.doc
  "Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 bucket.\n"]

type nonrec suffix = string [@@ocaml.doc ""]

type nonrec index_document = {
  suffix : suffix;
      [@ocaml.doc
        "A suffix that is appended to a request that is for a directory on the website endpoint. \
         (For example, if the suffix is [index.html] and you make a request to \
         [samplebucket/images/], the data that is returned will be for the object with the key \
         name [images/index.html].) The suffix must not be empty and must not include a slash \
         character.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Container for the [Suffix] element.\n"]

type nonrec error_document = {
  key : object_key;
      [@ocaml.doc
        "The object key name to use when a 4XX class error occurs.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The error information.\n"]

type nonrec website_configuration = {
  error_document : error_document option;
      [@ocaml.doc "The name of the error document for the website.\n"]
  index_document : index_document option;
      [@ocaml.doc "The name of the index document for the website.\n"]
  redirect_all_requests_to : redirect_all_requests_to option;
      [@ocaml.doc
        "The redirect behavior for every request to this bucket's website endpoint.\n\n\
        \  If you specify this property, you can't specify any other property.\n\
        \  \n\
        \   "]
  routing_rules : routing_rules option;
      [@ocaml.doc "Rules that define when a redirect is applied and the redirect behavior.\n"]
}
[@@ocaml.doc "Specifies website configuration parameters for an Amazon S3 bucket.\n"]

type nonrec put_bucket_website_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the data. You must use this header as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, see {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864}.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  website_configuration : website_configuration; [@ocaml.doc "Container for the request.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec bucket_versioning_status = Enabled [@ocaml.doc ""] | Suspended [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mfa_delete = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec versioning_configuration = {
  mfa_delete : mfa_delete option;
      [@ocaml.doc
        "Specifies whether MFA delete is enabled in the bucket versioning configuration. This \
         element is only returned if the bucket has been configured with MFA delete. If the bucket \
         has never been so configured, this element is not returned.\n"]
  status : bucket_versioning_status option; [@ocaml.doc "The versioning state of the bucket.\n"]
}
[@@ocaml.doc
  "Describes the versioning state of an Amazon S3 bucket. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTVersioningStatus.html}PUT \
   Bucket versioning} in the {i Amazon S3 API Reference}.\n"]

type nonrec mf_a = string [@@ocaml.doc ""]

type nonrec put_bucket_versioning_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        ">The Base64 encoded 128-bit [MD5] digest of the data. You must use this header as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, see {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864}.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  mf_a : mf_a option;
      [@ocaml.doc
        "The concatenation of the authentication device's serial number, a space, and the value \
         that is displayed on your authentication device. The serial number is the number that \
         uniquely identifies the MFA device. For physical MFA devices, this is the unique serial \
         number that's provided with the device. For virtual MFA devices, the serial number is the \
         device ARN. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/manage-versioning-examples.html}Enabling \
         versioning on buckets} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/MultiFactorAuthenticationDelete.html}Configuring \
         MFA delete} in the {i Amazon Simple Storage Service User Guide}.\n"]
  versioning_configuration : versioning_configuration;
      [@ocaml.doc "Container for setting the versioning state.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec put_bucket_tagging_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the data. You must use this header as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, see {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864}.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  tagging : tagging; [@ocaml.doc "Container for the [TagSet] and [Tag] elements.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec payer = Requester [@ocaml.doc ""] | BucketOwner [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec request_payment_configuration = {
  payer : payer; [@ocaml.doc "Specifies who pays for the download and request fees.\n"]
}
[@@ocaml.doc "Container for Payer.\n"]

type nonrec put_bucket_request_payment_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the data. You must use this header as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, see {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864}.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  request_payment_configuration : request_payment_configuration;
      [@ocaml.doc "Container for Payer.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_marker_replication_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delete_marker_replication = {
  status : delete_marker_replication_status option;
      [@ocaml.doc
        "Indicates whether to replicate delete markers.\n\n\
        \  Indicates whether to replicate delete markers.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Specifies whether Amazon S3 replicates delete markers. If you specify a [Filter] in your \
   replication configuration, you must also include a [DeleteMarkerReplication] element. If your \
   [Filter] includes a [Tag] element, the [DeleteMarkerReplication] [Status] must be set to \
   Disabled, because Amazon S3 does not support replicating delete markers for tag-based rules. \
   For an example configuration, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-config-min-rule-config}Basic \
   Rule Configuration}. \n\n\
  \ For more information about delete marker replication, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/delete-marker-replication.html}Basic Rule \
   Configuration}. \n\
  \ \n\
  \   If you are using an earlier version of the replication configuration, Amazon S3 handles \
   replication of delete markers differently. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations}Backward \
   Compatibility}.\n\
  \   \n\
  \    "]

type nonrec minutes = int [@@ocaml.doc ""]

type nonrec replication_time_value = {
  minutes : minutes option;
      [@ocaml.doc " Contains an integer specifying time in minutes. \n\n  Valid value: 15\n "]
}
[@@ocaml.doc
  " A container specifying the time value for S3 Replication Time Control (S3 RTC) and replication \
   metrics [EventThreshold]. \n"]

type nonrec metrics_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec metrics = {
  status : metrics_status; [@ocaml.doc " Specifies whether the replication metrics are enabled. \n"]
  event_threshold : replication_time_value option;
      [@ocaml.doc
        " A container specifying the time threshold for emitting the \
         [s3:Replication:OperationMissedThreshold] event. \n"]
}
[@@ocaml.doc
  " A container specifying replication metrics-related settings enabling replication metrics and \
   events.\n"]

type nonrec replication_time_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replication_time = {
  status : replication_time_status;
      [@ocaml.doc " Specifies whether the replication time is enabled. \n"]
  time : replication_time_value;
      [@ocaml.doc
        " A container specifying the time by which replication should be complete for all objects \
         and operations on objects. \n"]
}
[@@ocaml.doc
  " A container specifying S3 Replication Time Control (S3 RTC) related information, including \
   whether S3 RTC is enabled and the time when all objects and operations on objects must be \
   replicated. Must be specified together with a [Metrics] block. \n"]

type nonrec replica_kms_key_i_d = string [@@ocaml.doc ""]

type nonrec encryption_configuration = {
  replica_kms_key_i_d : replica_kms_key_i_d option;
      [@ocaml.doc
        "Specifies the ID (Key ARN or Alias ARN) of the customer managed Amazon Web Services KMS \
         key stored in Amazon Web Services Key Management Service (KMS) for the destination \
         bucket. Amazon S3 uses this key to encrypt replica objects. Amazon S3 only supports \
         symmetric encryption KMS keys. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric \
         keys in Amazon Web Services KMS} in the {i Amazon Web Services Key Management Service \
         Developer Guide}.\n"]
}
[@@ocaml.doc
  "Specifies encryption-related information for an Amazon S3 bucket that is a destination for \
   replicated objects.\n\n\
  \  If you're specifying a customer managed KMS key, we recommend using a fully qualified KMS key \
   ARN. If you use a KMS key alias instead, then KMS resolves the key within the \
   requester\226\128\153s account. This behavior can result in data that's encrypted with a KMS \
   key that belongs to the requester, and not the bucket owner.\n\
  \  \n\
  \   "]

type nonrec destination = {
  bucket : bucket_name;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the \
         results.\n"]
  account : account_id option;
      [@ocaml.doc
        "Destination bucket owner account ID. In a cross-account scenario, if you direct Amazon S3 \
         to change replica ownership to the Amazon Web Services account that owns the destination \
         bucket by specifying the [AccessControlTranslation] property, this is the account ID of \
         the destination bucket owner. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-change-owner.html}Replication \
         Additional Configuration: Changing the Replica Owner} in the {i Amazon S3 User Guide}.\n"]
  storage_class : storage_class option;
      [@ocaml.doc
        " The storage class to use when replicating objects, such as S3 Standard or reduced \
         redundancy. By default, Amazon S3 uses the storage class of the source object to create \
         the object replica. \n\n\
        \ For valid values, see the [StorageClass] element of the \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html}PUT \
         Bucket replication} action in the {i Amazon S3 API Reference}.\n\
        \ \n\
        \   [FSX_OPENZFS] is not an accepted value when replicating objects.\n\
        \  "]
  access_control_translation : access_control_translation option;
      [@ocaml.doc
        "Specify this only in a cross-account scenario (where source and destination bucket owners \
         are not the same), and you want to change replica ownership to the Amazon Web Services \
         account that owns the destination bucket. If this is not specified in the replication \
         configuration, the replicas are owned by same Amazon Web Services account that owns the \
         source object.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A container that provides information about encryption. If [SourceSelectionCriteria] is \
         specified, you must specify this element.\n"]
  replication_time : replication_time option;
      [@ocaml.doc
        " A container specifying S3 Replication Time Control (S3 RTC), including whether S3 RTC is \
         enabled and the time when all objects and operations on objects must be replicated. Must \
         be specified together with a [Metrics] block. \n"]
  metrics : metrics option;
      [@ocaml.doc
        " A container specifying replication metrics-related settings enabling replication metrics \
         and events. \n"]
}
[@@ocaml.doc
  "Specifies information about where to publish analysis or configuration results for an Amazon S3 \
   bucket and S3 Replication Time Control (S3 RTC).\n"]

type nonrec existing_object_replication_status =
  | Enabled [@ocaml.doc ""]
  | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec existing_object_replication = {
  status : existing_object_replication_status;
      [@ocaml.doc "Specifies whether Amazon S3 replicates existing source bucket objects. \n"]
}
[@@ocaml.doc
  "Optional configuration to replicate existing source bucket objects. \n\n\
  \  This parameter is no longer supported. To replicate existing objects, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-batch-replication-batch.html}Replicating \
   existing objects with S3 Batch Replication} in the {i Amazon S3 User Guide}.\n\
  \  \n\
  \   "]

type nonrec replica_modifications_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replica_modifications = {
  status : replica_modifications_status;
      [@ocaml.doc "Specifies whether Amazon S3 replicates modifications on replicas.\n"]
}
[@@ocaml.doc
  "A filter that you can specify for selection for modifications on replicas. Amazon S3 doesn't \
   replicate replica modifications by default. In the latest version of replication configuration \
   (when [Filter] is specified), you can specify this element and set the status to [Enabled] to \
   replicate modifications on replicas. \n\n\
  \   If you don't specify the [Filter] element, Amazon S3 assumes that the replication \
   configuration is the earlier version, V1. In the earlier version, this element is not allowed.\n\
  \  \n\
  \   "]

type nonrec sse_kms_encrypted_objects_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sse_kms_encrypted_objects = {
  status : sse_kms_encrypted_objects_status;
      [@ocaml.doc
        "Specifies whether Amazon S3 replicates objects created with server-side encryption using \
         an Amazon Web Services KMS key stored in Amazon Web Services Key Management Service.\n"]
}
[@@ocaml.doc
  "A container for filter information for the selection of S3 objects encrypted with Amazon Web \
   Services KMS.\n"]

type nonrec source_selection_criteria = {
  sse_kms_encrypted_objects : sse_kms_encrypted_objects option;
      [@ocaml.doc
        " A container for filter information for the selection of Amazon S3 objects encrypted with \
         Amazon Web Services KMS. If you include [SourceSelectionCriteria] in the replication \
         configuration, this element is required. \n"]
  replica_modifications : replica_modifications option;
      [@ocaml.doc
        "A filter that you can specify for selections for modifications on replicas. Amazon S3 \
         doesn't replicate replica modifications by default. In the latest version of replication \
         configuration (when [Filter] is specified), you can specify this element and set the \
         status to [Enabled] to replicate modifications on replicas. \n\n\
        \   If you don't specify the [Filter] element, Amazon S3 assumes that the replication \
         configuration is the earlier version, V1. In the earlier version, this element is not \
         allowed\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A container that describes additional filters for identifying the source objects that you want \
   to replicate. You can choose to enable or disable the replication of these objects. Currently, \
   Amazon S3 supports only the filter that you can specify for objects created with server-side \
   encryption using a customer managed key stored in Amazon Web Services Key Management Service \
   (SSE-KMS).\n"]

type nonrec replication_rule_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec prefix = string [@@ocaml.doc ""]

type nonrec replication_rule_and_operator = {
  prefix : prefix option;
      [@ocaml.doc
        "An object key name prefix that identifies the subset of objects to which the rule applies.\n"]
  tags : tag_set option; [@ocaml.doc "An array of tags containing key and value pairs.\n"]
}
[@@ocaml.doc
  "A container for specifying rule filters. The filters determine the subset of objects to which \
   the rule applies. This element is required only if you specify more than one filter. \n\n\
  \ For example:\n\
  \ \n\
  \  {ul\n\
  \        {-  If you specify both a [Prefix] and a [Tag] filter, wrap these filters in an [And] \
   tag. \n\
  \            \n\
  \             }\n\
  \        {-  If you specify a filter based on multiple tags, wrap the [Tag] elements in an [And] \
   tag.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec replication_rule_filter = {
  prefix : prefix option;
      [@ocaml.doc
        "An object key name prefix that identifies the subset of objects to which the rule \
         applies.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
  tag : tag option;
      [@ocaml.doc
        "A container for specifying a tag key and value. \n\n\
        \ The rule applies only to objects that have the tag in their tag set.\n\
        \ "]
  and_ : replication_rule_and_operator option;
      [@ocaml.doc
        "A container for specifying rule filters. The filters determine the subset of objects to \
         which the rule applies. This element is required only if you specify more than one \
         filter. For example: \n\n\
        \ {ul\n\
        \       {-  If you specify both a [Prefix] and a [Tag] filter, wrap these filters in an \
         [And] tag.\n\
        \           \n\
        \            }\n\
        \       {-  If you specify a filter based on multiple tags, wrap the [Tag] elements in an \
         [And] tag.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A filter that identifies the subset of objects to which the replication rule applies. A \
   [Filter] must specify exactly one [Prefix], [Tag], or an [And] child element.\n"]

type nonrec priority = int [@@ocaml.doc ""]

type nonrec replication_rule = {
  i_d : i_d option;
      [@ocaml.doc "A unique identifier for the rule. The maximum value is 255 characters.\n"]
  priority : priority option;
      [@ocaml.doc
        "The priority indicates which rule has precedence whenever two or more replication rules \
         conflict. Amazon S3 will attempt to replicate objects according to all replication rules. \
         However, if there are two or more rules with the same destination bucket, then objects \
         will be replicated according to the rule with the highest priority. The higher the \
         number, the higher the priority. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html}Replication} in the \
         {i Amazon S3 User Guide}.\n\
        \ "]
  prefix : prefix option;
      [@ocaml.doc
        "An object key name prefix that identifies the object or objects to which the rule \
         applies. The maximum prefix length is 1,024 characters. To include all objects in a \
         bucket, specify an empty string. \n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
  filter : replication_rule_filter option; [@ocaml.doc ""]
  status : replication_rule_status; [@ocaml.doc "Specifies whether the rule is enabled.\n"]
  source_selection_criteria : source_selection_criteria option;
      [@ocaml.doc
        "A container that describes additional filters for identifying the source objects that you \
         want to replicate. You can choose to enable or disable the replication of these objects. \
         Currently, Amazon S3 supports only the filter that you can specify for objects created \
         with server-side encryption using a customer managed key stored in Amazon Web Services \
         Key Management Service (SSE-KMS).\n"]
  existing_object_replication : existing_object_replication option;
      [@ocaml.doc
        "Optional configuration to replicate existing source bucket objects. \n\n\
        \  This parameter is no longer supported. To replicate existing objects, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-batch-replication-batch.html}Replicating \
         existing objects with S3 Batch Replication} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \   "]
  destination : destination;
      [@ocaml.doc
        "A container for information about the replication destination and its configurations \
         including enabling the S3 Replication Time Control (S3 RTC).\n"]
  delete_marker_replication : delete_marker_replication option; [@ocaml.doc ""]
}
[@@ocaml.doc "Specifies which Amazon S3 objects to replicate and where to store the replicas.\n"]

type nonrec replication_rules = replication_rule list [@@ocaml.doc ""]

type nonrec replication_configuration = {
  role : role;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that \
         Amazon S3 assumes when replicating objects. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-how-setup.html}How to Set \
         Up Replication} in the {i Amazon S3 User Guide}.\n"]
  rules : replication_rules;
      [@ocaml.doc
        "A container for one or more replication rules. A replication configuration must have at \
         least one rule and can contain a maximum of 1,000 rules. \n"]
}
[@@ocaml.doc
  "A container for replication rules. You can add up to 1,000 rules. The maximum size of a \
   replication configuration is 2 MB.\n"]

type nonrec put_bucket_replication_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the bucket\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the data. You must use this header as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, see {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864}.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  replication_configuration : replication_configuration; [@ocaml.doc ""]
  token : object_lock_token option;
      [@ocaml.doc "A token to allow Object Lock to be enabled for an existing bucket.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec policy = string [@@ocaml.doc ""]

type nonrec confirm_remove_self_bucket_access = bool [@@ocaml.doc ""]

type nonrec put_bucket_policy_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash of the request body.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding \n\
         {[\n\
         x-amz-checksum-{i algorithm} \n\
         ]}\n\
        \ or [x-amz-trailer] header sent. Otherwise, Amazon S3 fails the request with the HTTP \
         status code [400 Bad Request].\n\n\
        \ For the \n\
        \ {[\n\
        \ x-amz-checksum-{i algorithm} \n\
        \ ]}\n\
        \  header, replace \n\
        \ {[\n\
        \  {i algorithm} \n\
        \ ]}\n\
        \  with the supported algorithm from the following list: \n\
        \ \n\
        \  {ul\n\
        \        {-   [CRC32] \n\
        \            \n\
        \             }\n\
        \        {-   [CRC32C] \n\
        \            \n\
        \             }\n\
        \        {-   [CRC64NVME] \n\
        \            \n\
        \             }\n\
        \        {-   [MD5] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA1] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA256] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA512] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH3] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH64] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH128] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\
        \   \n\
        \    If the individual checksum value you provide through \n\
        \    {[\n\
        \    x-amz-checksum-{i algorithm} \n\
        \    ]}\n\
        \     doesn't match the checksum algorithm you set through [x-amz-sdk-checksum-algorithm], \
         Amazon S3 fails the request with a [BadDigest] error.\n\
        \    \n\
        \      For directory buckets, when you use Amazon Web Services SDKs, [CRC32] is the \
         default checksum algorithm that's used for performance.\n\
        \      \n\
        \       "]
  confirm_remove_self_bucket_access : confirm_remove_self_bucket_access option;
      [@ocaml.doc
        "Set this parameter to true to confirm that you want to remove your permissions to change \
         this bucket policy in the future.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  policy : policy;
      [@ocaml.doc
        "The bucket policy as a JSON document.\n\n\
        \ For directory buckets, the only IAM action supported in the bucket policy is \
         [s3express:CreateSession].\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec object_ownership =
  | BucketOwnerPreferred [@ocaml.doc ""]
  | ObjectWriter [@ocaml.doc ""]
  | BucketOwnerEnforced [@ocaml.doc ""]
[@@ocaml.doc
  "The container element for object ownership for a bucket's ownership controls.\n\n\
  \  [BucketOwnerPreferred] - Objects uploaded to the bucket change ownership to the bucket owner \
   if the objects are uploaded with the [bucket-owner-full-control] canned ACL.\n\
  \ \n\
  \   [ObjectWriter] - The uploading account will own the object if the object is uploaded with \
   the [bucket-owner-full-control] canned ACL.\n\
  \  \n\
  \    [BucketOwnerEnforced] - Access control lists (ACLs) are disabled and no longer affect \
   permissions. The bucket owner automatically owns and has full control over every object in the \
   bucket. The bucket only accepts PUT requests that don't specify an ACL or specify bucket owner \
   full control ACLs (such as the predefined [bucket-owner-full-control] canned ACL or a custom \
   ACL in XML format that grants the same permissions).\n\
  \   \n\
  \    By default, [ObjectOwnership] is set to [BucketOwnerEnforced] and ACLs are disabled. We \
   recommend keeping ACLs disabled, except in uncommon use cases where you must control access for \
   each object individually. For more information about S3 Object Ownership, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html}Controlling \
   ownership of objects and disabling ACLs for your bucket} in the {i Amazon S3 User Guide}. \n\
  \    \n\
  \      This functionality is not supported for directory buckets. Directory buckets use the \
   bucket owner enforced setting for S3 Object Ownership.\n\
  \      \n\
  \       "]

type nonrec ownership_controls_rule = { object_ownership : object_ownership [@ocaml.doc ""] }
[@@ocaml.doc "The container element for an ownership control rule.\n"]

type nonrec ownership_controls_rules = ownership_controls_rule list [@@ocaml.doc ""]

type nonrec ownership_controls = {
  rules : ownership_controls_rules;
      [@ocaml.doc "The container element for an ownership control rule.\n"]
}
[@@ocaml.doc "The container element for a bucket's ownership controls.\n"]

type nonrec put_bucket_ownership_controls_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the Amazon S3 bucket whose [OwnershipControls] you want to set.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash of the [OwnershipControls] request body. \n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  ownership_controls : ownership_controls;
      [@ocaml.doc
        "The [OwnershipControls] (BucketOwnerEnforced, BucketOwnerPreferred, or ObjectWriter) that \
         you want to apply to this Amazon S3 bucket.\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        " Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding \n\
         {[\n\
         x-amz-checksum-{i algorithm} \n\
         ]}\n\
        \ header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec skip_validation = bool [@@ocaml.doc ""]

type nonrec event_bridge_configuration = unit [@@ocaml.doc ""]

type nonrec filter_rule_value = string [@@ocaml.doc ""]

type nonrec filter_rule_name = Prefix [@ocaml.doc ""] | Suffix [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec filter_rule = {
  name : filter_rule_name option;
      [@ocaml.doc
        "The object key name prefix or suffix identifying one or more objects to which the \
         filtering rule applies. The maximum length is 1,024 characters. Overlapping prefixes and \
         suffixes are not supported. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html}Configuring \
         Event Notifications} in the {i Amazon S3 User Guide}.\n"]
  value : filter_rule_value option;
      [@ocaml.doc "The value that the filter searches for in object key names.\n"]
}
[@@ocaml.doc
  "Specifies the Amazon S3 object key name to filter on. An object key name is the name assigned \
   to an object in your Amazon S3 bucket. You specify whether to filter on the suffix or prefix of \
   the object key name. A prefix is a specific string of characters at the beginning of an object \
   key name, which you can use to organize objects. For example, you can start the key names of \
   related objects with a prefix, such as [2023-] or [engineering/]. Then, you can use \
   [FilterRule] to find objects in a bucket with key names that have the same prefix. A suffix is \
   similar to a prefix, but it is at the end of the object key name instead of at the beginning.\n"]

type nonrec filter_rule_list = filter_rule list [@@ocaml.doc ""]

type nonrec s3_key_filter = { filter_rules : filter_rule_list option [@ocaml.doc ""] }
[@@ocaml.doc "A container for object key name prefix and suffix filtering rules.\n"]

type nonrec notification_configuration_filter = { key : s3_key_filter option [@ocaml.doc ""] }
[@@ocaml.doc
  "Specifies object key name filtering rules. For information about key name filtering, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/notification-how-to-filtering.html}Configuring \
   event notifications using object key name filtering} in the {i Amazon S3 User Guide}.\n"]

type nonrec event =
  | S3_ReducedRedundancyLostObject [@ocaml.doc ""]
  | S3_ObjectCreated_ [@ocaml.doc ""]
  | S3_ObjectCreated_Put [@ocaml.doc ""]
  | S3_ObjectCreated_Post [@ocaml.doc ""]
  | S3_ObjectCreated_Copy [@ocaml.doc ""]
  | S3_ObjectCreated_CompleteMultipartUpload [@ocaml.doc ""]
  | S3_ObjectRemoved_ [@ocaml.doc ""]
  | S3_ObjectRemoved_Delete [@ocaml.doc ""]
  | S3_ObjectRemoved_DeleteMarkerCreated [@ocaml.doc ""]
  | S3_ObjectRestore_ [@ocaml.doc ""]
  | S3_ObjectRestore_Post [@ocaml.doc ""]
  | S3_ObjectRestore_Completed [@ocaml.doc ""]
  | S3_Replication_ [@ocaml.doc ""]
  | S3_Replication_OperationFailedReplication [@ocaml.doc ""]
  | S3_Replication_OperationNotTracked [@ocaml.doc ""]
  | S3_Replication_OperationMissedThreshold [@ocaml.doc ""]
  | S3_Replication_OperationReplicatedAfterThreshold [@ocaml.doc ""]
  | S3_ObjectRestore_Delete [@ocaml.doc ""]
  | S3_LifecycleTransition [@ocaml.doc ""]
  | S3_IntelligentTiering [@ocaml.doc ""]
  | S3_ObjectAcl_Put [@ocaml.doc ""]
  | S3_LifecycleExpiration_ [@ocaml.doc ""]
  | S3_LifecycleExpiration_Delete [@ocaml.doc ""]
  | S3_LifecycleExpiration_DeleteMarkerCreated [@ocaml.doc ""]
  | S3_ObjectTagging_ [@ocaml.doc ""]
  | S3_ObjectTagging_Put [@ocaml.doc ""]
  | S3_ObjectTagging_Delete [@ocaml.doc ""]
  | S3_ObjectAnnotation_ [@ocaml.doc ""]
  | S3_ObjectAnnotation_Put [@ocaml.doc ""]
  | S3_ObjectAnnotation_Delete [@ocaml.doc ""]
[@@ocaml.doc "The bucket event for which to send notifications.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec lambda_function_arn = string [@@ocaml.doc ""]

type nonrec notification_id = string [@@ocaml.doc ""]

type nonrec lambda_function_configuration = {
  id : notification_id option; [@ocaml.doc ""]
  lambda_function_arn : lambda_function_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Lambda function that Amazon S3 invokes when the \
         specified event type occurs.\n"]
  events : event_list;
      [@ocaml.doc
        "The Amazon S3 bucket event for which to invoke the Lambda function. For more information, \
         see {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html}Supported \
         Event Types} in the {i Amazon S3 User Guide}.\n"]
  filter : notification_configuration_filter option; [@ocaml.doc ""]
}
[@@ocaml.doc "A container for specifying the configuration for Lambda notifications.\n"]

type nonrec lambda_function_configuration_list = lambda_function_configuration list [@@ocaml.doc ""]

type nonrec queue_arn = string [@@ocaml.doc ""]

type nonrec queue_configuration = {
  id : notification_id option; [@ocaml.doc ""]
  queue_arn : queue_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SQS queue to which Amazon S3 publishes a \
         message when it detects events of the specified type.\n"]
  events : event_list;
      [@ocaml.doc "A collection of bucket events for which to send notifications\n"]
  filter : notification_configuration_filter option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Specifies the configuration for publishing messages to an Amazon Simple Queue Service (Amazon \
   SQS) queue when Amazon S3 detects specified events.\n"]

type nonrec queue_configuration_list = queue_configuration list [@@ocaml.doc ""]

type nonrec topic_arn = string [@@ocaml.doc ""]

type nonrec topic_configuration = {
  id : notification_id option; [@ocaml.doc ""]
  topic_arn : topic_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic to which Amazon S3 publishes a \
         message when it detects events of the specified type.\n"]
  events : event_list;
      [@ocaml.doc
        "The Amazon S3 bucket event about which to send notifications. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html}Supported Event \
         Types} in the {i Amazon S3 User Guide}.\n"]
  filter : notification_configuration_filter option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A container for specifying the configuration for publication of messages to an Amazon Simple \
   Notification Service (Amazon SNS) topic when Amazon S3 detects specified events.\n"]

type nonrec topic_configuration_list = topic_configuration list [@@ocaml.doc ""]

type nonrec notification_configuration = {
  topic_configurations : topic_configuration_list option;
      [@ocaml.doc
        "The topic to which notifications are sent and the events for which notifications are \
         generated.\n"]
  queue_configurations : queue_configuration_list option;
      [@ocaml.doc
        "The Amazon Simple Queue Service queues to publish messages to and the events for which to \
         publish messages.\n"]
  lambda_function_configurations : lambda_function_configuration_list option;
      [@ocaml.doc
        "Describes the Lambda functions to invoke and the events for which to invoke them.\n"]
  event_bridge_configuration : event_bridge_configuration option;
      [@ocaml.doc "Enables delivery of events to Amazon EventBridge.\n"]
}
[@@ocaml.doc
  "A container for specifying the notification configuration of the bucket. If this element is \
   empty, notifications are turned off for the bucket.\n"]

type nonrec put_bucket_notification_configuration_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the bucket.\n"]
  notification_configuration : notification_configuration; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  skip_destination_validation : skip_validation option;
      [@ocaml.doc
        "Skips validation of Amazon SQS, Amazon SNS, and Lambda destinations. True or false value.\n"]
}
[@@ocaml.doc ""]

type nonrec metrics_and_operator = {
  prefix : prefix option; [@ocaml.doc "The prefix used when evaluating an AND predicate.\n"]
  tags : tag_set option;
      [@ocaml.doc
        "The list of tags used when evaluating an AND predicate.\n\n\
        \   [Tag] filters are not supported for directory buckets.\n\
        \  \n\
        \   "]
  access_point_arn : access_point_arn option;
      [@ocaml.doc "The access point ARN used when evaluating an [AND] predicate.\n"]
}
[@@ocaml.doc
  "A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The \
   operator must have at least two predicates, and an object must match all of the predicates in \
   order for the filter to apply.\n"]

type nonrec metrics_filter =
  | Prefix of prefix [@ocaml.doc "The prefix used when evaluating a metrics filter.\n"]
  | Tag of tag
      [@ocaml.doc
        "The tag used when evaluating a metrics filter.\n\n\
        \   [Tag] filters are not supported for directory buckets.\n\
        \  \n\
        \   "]
  | AccessPointArn of access_point_arn
      [@ocaml.doc "The access point ARN used when evaluating a metrics filter.\n"]
  | And of metrics_and_operator
      [@ocaml.doc
        "A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. \
         The operator must have at least two predicates, and an object must match all of the \
         predicates in order for the filter to apply.\n"]
[@@ocaml.doc
  "Specifies a metrics configuration filter. The metrics configuration only includes objects that \
   meet the filter's criteria. A filter must be a prefix, an object tag, an access point ARN, or a \
   conjunction (MetricsAndOperator). For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html}PutBucketMetricsConfiguration}.\n"]

type nonrec metrics_id = string [@@ocaml.doc ""]

type nonrec metrics_configuration = {
  id : metrics_id;
      [@ocaml.doc
        "The ID used to identify the metrics configuration. The ID has a 64 character limit and \
         can only contain letters, numbers, periods, dashes, and underscores.\n"]
  filter : metrics_filter option;
      [@ocaml.doc
        "Specifies a metrics configuration filter. The metrics configuration will only include \
         objects that meet the filter's criteria. A filter must be a prefix, an object tag, an \
         access point ARN, or a conjunction (MetricsAndOperator).\n\n\
        \  Metrics configurations for directory buckets do not support tag filters.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Specifies a metrics configuration for the CloudWatch request metrics (specified by the metrics \
   configuration ID) from an Amazon S3 bucket. If you're updating an existing metrics \
   configuration, note that this is a full replacement of the existing metrics configuration. If \
   you don't include the elements you want to keep, they are erased. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTMetricConfiguration.html}PutBucketMetricsConfiguration}.\n"]

type nonrec put_bucket_metrics_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket for which the metrics configuration is set.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  id : metrics_id;
      [@ocaml.doc
        "The ID used to identify the metrics configuration. The ID has a 64 character limit and \
         can only contain letters, numbers, periods, dashes, and underscores.\n"]
  metrics_configuration : metrics_configuration;
      [@ocaml.doc "Specifies the metrics configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec partition_date_source = EventTime [@ocaml.doc ""] | DeliveryTime [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec partitioned_prefix = {
  partition_date_source : partition_date_source option;
      [@ocaml.doc
        "Specifies the partition date source for the partitioned prefix. [PartitionDateSource] can \
         be [EventTime] or [DeliveryTime].\n\n\
        \ For [DeliveryTime], the time in the log file names corresponds to the delivery time for \
         the log files. \n\
        \ \n\
        \   For [EventTime], The logs delivered are for a specific day only. The year, month, and \
         day correspond to the day on which the event occurred, and the hour, minutes and seconds \
         are set to 00 in the key.\n\
        \  "]
}
[@@ocaml.doc
  "Amazon S3 keys for log objects are partitioned in the following format:\n\n\
  \  \
   [\\[DestinationPrefix\\]\\[SourceAccountId\\]/\\[SourceRegion\\]/\\[SourceBucket\\]/\\[YYYY\\]/\\[MM\\]/\\[DD\\]/\\[YYYY\\]-\\[MM\\]-\\[DD\\]-\\[hh\\]-\\[mm\\]-\\[ss\\]-\\[UniqueString\\]] \n\
  \ \n\
  \  PartitionedPrefix defaults to EventTime delivery when server access logs are delivered.\n\
  \  "]

type nonrec simple_prefix = unit [@@ocaml.doc ""]

type nonrec target_object_key_format = {
  simple_prefix : simple_prefix option;
      [@ocaml.doc
        "To use the simple format for S3 keys for log objects. To specify SimplePrefix format, set \
         SimplePrefix to \\{\\}.\n"]
  partitioned_prefix : partitioned_prefix option;
      [@ocaml.doc "Partitioned S3 key for log objects.\n"]
}
[@@ocaml.doc
  "Amazon S3 key format for log objects. Only one format, PartitionedPrefix or SimplePrefix, is \
   allowed.\n"]

type nonrec target_prefix = string [@@ocaml.doc ""]

type nonrec bucket_logs_permission =
  | FULL_CONTROL [@ocaml.doc ""]
  | READ [@ocaml.doc ""]
  | WRITE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_grant = {
  grantee : grantee option; [@ocaml.doc "Container for the person being granted permissions.\n"]
  permission : bucket_logs_permission option;
      [@ocaml.doc "Logging permissions assigned to the grantee for the bucket.\n"]
}
[@@ocaml.doc
  "Container for granting information.\n\n\
  \ Buckets that use the bucket owner enforced setting for Object Ownership don't support target \
   grants. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html#grant-log-delivery-permissions-general}Permissions \
   server access log delivery} in the {i Amazon S3 User Guide}.\n\
  \ "]

type nonrec target_grants = target_grant list [@@ocaml.doc ""]

type nonrec target_bucket = string [@@ocaml.doc ""]

type nonrec logging_enabled = {
  target_bucket : target_bucket;
      [@ocaml.doc
        "Specifies the bucket where you want Amazon S3 to store server access logs. You can have \
         your logs delivered to any bucket that you own, including the same bucket that is being \
         logged. You can also configure multiple buckets to deliver their logs to the same target \
         bucket. In this case, you should choose a different [TargetPrefix] for each source bucket \
         so that the delivered log files can be distinguished by key.\n"]
  target_grants : target_grants option;
      [@ocaml.doc
        "Container for granting information.\n\n\
        \ Buckets that use the bucket owner enforced setting for Object Ownership don't support \
         target grants. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html#grant-log-delivery-permissions-general}Permissions \
         for server access log delivery} in the {i Amazon S3 User Guide}.\n\
        \ "]
  target_prefix : target_prefix;
      [@ocaml.doc
        "A prefix for all log object keys. If you store log files from multiple Amazon S3 buckets \
         in a single bucket, you can use a prefix to distinguish which log files came from which \
         bucket.\n"]
  target_object_key_format : target_object_key_format option;
      [@ocaml.doc "Amazon S3 key format for log objects.\n"]
}
[@@ocaml.doc
  "Describes where logs are stored and the prefix that Amazon S3 assigns to all log object keys \
   for a bucket. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTlogging.html}PUT Bucket \
   logging} in the {i Amazon S3 API Reference}.\n"]

type nonrec bucket_logging_status = { logging_enabled : logging_enabled option [@ocaml.doc ""] }
[@@ocaml.doc "Container for logging status information.\n"]

type nonrec put_bucket_logging_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket for which to set the logging parameters.\n"]
  bucket_logging_status : bucket_logging_status;
      [@ocaml.doc "Container for logging status information.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash of the [PutBucketLogging] request body.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec transition_default_minimum_object_size =
  | Varies_by_storage_class [@ocaml.doc ""]
  | All_storage_classes_128K [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec put_bucket_lifecycle_configuration_output = {
  transition_default_minimum_object_size : transition_default_minimum_object_size option;
      [@ocaml.doc
        "Indicates which default minimum object size behavior is applied to the lifecycle \
         configuration.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \    {ul\n\
        \          {-   [all_storage_classes_128K] - Objects smaller than 128 KB will not \
         transition to any storage class by default. \n\
        \              \n\
        \               }\n\
        \          {-   [varies_by_storage_class] - Objects smaller than 128 KB will transition to \
         Glacier Flexible Retrieval or Glacier Deep Archive storage classes. By default, all other \
         storage classes will prevent transitions smaller than 128 KB. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   To customize the minimum object size for any transition you can add a filter that \
         specifies a custom [ObjectSizeGreaterThan] or [ObjectSizeLessThan] in the body of your \
         transition rule. Custom filters always take precedence over the default transition \
         behavior.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec version_count = int [@@ocaml.doc ""]

type nonrec noncurrent_version_expiration = {
  noncurrent_days : days option;
      [@ocaml.doc
        "Specifies the number of days an object is noncurrent before Amazon S3 can perform the \
         associated action. The value must be a non-zero positive integer. For information about \
         the noncurrent days calculations, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations}How \
         Amazon S3 Calculates When an Object Became Noncurrent} in the {i Amazon S3 User Guide}.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
  newer_noncurrent_versions : version_count option;
      [@ocaml.doc
        "Specifies how many noncurrent versions Amazon S3 will retain. You can specify up to 100 \
         noncurrent versions to retain. Amazon S3 will permanently delete any additional \
         noncurrent versions beyond the specified number to retain. For more information about \
         noncurrent versions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/intro-lifecycle-rules.html}Lifecycle \
         configuration elements} in the {i Amazon S3 User Guide}.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Specifies when noncurrent object versions expire. Upon expiration, Amazon S3 permanently \
   deletes the noncurrent object versions. You set this lifecycle configuration action on a bucket \
   that has versioning enabled (or suspended) to request that Amazon S3 delete noncurrent object \
   versions at a specific period in the object's lifetime.\n\n\
  \  This parameter applies to general purpose buckets only. It is not supported for directory \
   bucket lifecycle configurations.\n\
  \  \n\
  \   "]

type nonrec transition_storage_class =
  | GLACIER [@ocaml.doc ""]
  | STANDARD_IA [@ocaml.doc ""]
  | ONEZONE_IA [@ocaml.doc ""]
  | INTELLIGENT_TIERING [@ocaml.doc ""]
  | DEEP_ARCHIVE [@ocaml.doc ""]
  | GLACIER_IR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec noncurrent_version_transition = {
  noncurrent_days : days option;
      [@ocaml.doc
        "Specifies the number of days an object is noncurrent before Amazon S3 can perform the \
         associated action. For information about the noncurrent days calculations, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/intro-lifecycle-rules.html#non-current-days-calculations}How \
         Amazon S3 Calculates How Long an Object Has Been Noncurrent} in the {i Amazon S3 User \
         Guide}.\n"]
  storage_class : transition_storage_class option;
      [@ocaml.doc "The class of storage used to store the object.\n"]
  newer_noncurrent_versions : version_count option;
      [@ocaml.doc
        "Specifies how many noncurrent versions Amazon S3 will retain in the same storage class \
         before transitioning objects. You can specify up to 100 noncurrent versions to retain. \
         Amazon S3 will transition any additional noncurrent versions beyond the specified number \
         to retain. For more information about noncurrent versions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/intro-lifecycle-rules.html}Lifecycle \
         configuration elements} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc
  "Container for the transition rule that describes when noncurrent objects transition to the \
   [STANDARD_IA], [ONEZONE_IA], [INTELLIGENT_TIERING], [GLACIER_IR], [GLACIER], or [DEEP_ARCHIVE] \
   storage class. If your bucket is versioning-enabled (or versioning is suspended), you can set \
   this action to request that Amazon S3 transition noncurrent object versions to the \
   [STANDARD_IA], [ONEZONE_IA], [INTELLIGENT_TIERING], [GLACIER_IR], [GLACIER], or [DEEP_ARCHIVE] \
   storage class at a specific period in the object's lifetime.\n"]

type nonrec noncurrent_version_transition_list = noncurrent_version_transition list [@@ocaml.doc ""]

type nonrec transition = {
  date : date option;
      [@ocaml.doc
        "Indicates when objects are transitioned to the specified storage class. The date value \
         must be in ISO 8601 format. The time is always midnight UTC.\n"]
  days : days option;
      [@ocaml.doc
        "Indicates the number of days after creation when objects are transitioned to the \
         specified storage class. If the specified storage class is [INTELLIGENT_TIERING], \
         [GLACIER_IR], [GLACIER], or [DEEP_ARCHIVE], valid values are [0] or positive integers. If \
         the specified storage class is [STANDARD_IA] or [ONEZONE_IA], valid values are positive \
         integers greater than [30]. Be aware that some storage classes have a minimum storage \
         duration and that you're charged for transitioning objects before their minimum storage \
         duration. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html#lifecycle-configuration-constraints} \
         Constraints and considerations for transitions} in the {i Amazon S3 User Guide}.\n"]
  storage_class : transition_storage_class option;
      [@ocaml.doc "The storage class to which you want the object to transition.\n"]
}
[@@ocaml.doc
  "Specifies when an object transitions to a specified storage class. For more information about \
   Amazon S3 lifecycle configuration rules, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html}Transitioning \
   Objects Using Amazon S3 Lifecycle} in the {i Amazon S3 User Guide}.\n"]

type nonrec transition_list = transition list [@@ocaml.doc ""]

type nonrec expiration_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_size_less_than_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec object_size_greater_than_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec lifecycle_rule_and_operator = {
  prefix : prefix option;
      [@ocaml.doc "Prefix identifying one or more objects to which the rule applies.\n"]
  tags : tag_set option;
      [@ocaml.doc
        "All of these tags must exist in the object's tag set in order for the rule to apply.\n"]
  object_size_greater_than : object_size_greater_than_bytes option;
      [@ocaml.doc "Minimum object size to which the rule applies.\n"]
  object_size_less_than : object_size_less_than_bytes option;
      [@ocaml.doc "Maximum object size to which the rule applies.\n"]
}
[@@ocaml.doc
  "This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The \
   Lifecycle Rule will apply to any object matching all of the predicates configured inside the \
   And operator.\n"]

type nonrec lifecycle_rule_filter = {
  prefix : prefix option;
      [@ocaml.doc
        "Prefix identifying one or more objects to which the rule applies.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
  tag : tag option;
      [@ocaml.doc
        "This tag must exist in the object's tag set in order for the rule to apply.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
  object_size_greater_than : object_size_greater_than_bytes option;
      [@ocaml.doc "Minimum object size to which the rule applies.\n"]
  object_size_less_than : object_size_less_than_bytes option;
      [@ocaml.doc "Maximum object size to which the rule applies.\n"]
  and_ : lifecycle_rule_and_operator option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The [Filter] is used to identify objects that a Lifecycle Rule applies to. A [Filter] can have \
   exactly one of [Prefix], [Tag], [ObjectSizeGreaterThan], [ObjectSizeLessThan], or [And] \
   specified. If the [Filter] element is left empty, the Lifecycle Rule applies to all objects in \
   the bucket.\n"]

type nonrec expired_object_delete_marker = bool [@@ocaml.doc ""]

type nonrec lifecycle_expiration = {
  date : date option;
      [@ocaml.doc
        "Indicates at what date the object is to be moved or deleted. The date value must conform \
         to the ISO 8601 format. The time is always midnight UTC.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
  days : days option;
      [@ocaml.doc
        "Indicates the lifetime, in days, of the objects that are subject to the rule. The value \
         must be a non-zero positive integer.\n"]
  expired_object_delete_marker : expired_object_delete_marker option;
      [@ocaml.doc
        "Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If \
         set to true, the delete marker will be expired; if set to false the policy takes no \
         action. This cannot be specified with Days or Date in a Lifecycle Expiration Policy.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Container for the expiration for the lifecycle of the object.\n\n\
  \ For more information see, \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html}Managing \
   your storage lifecycle} in the {i Amazon S3 User Guide}.\n\
  \ "]

type nonrec lifecycle_rule = {
  expiration : lifecycle_expiration option;
      [@ocaml.doc
        "Specifies the expiration for the lifecycle of the object in the form of date, days and, \
         whether the object has a delete marker.\n"]
  i_d : i_d option;
      [@ocaml.doc
        "Unique identifier for the rule. The value cannot be longer than 255 characters.\n"]
  prefix : prefix option;
      [@ocaml.doc
        " The general purpose bucket prefix that identifies one or more objects to which the rule \
         applies. We recommend using [Filter] instead of [Prefix] for new PUTs. Previous \
         configurations where a prefix is defined will continue to operate as before.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
  filter : lifecycle_rule_filter option;
      [@ocaml.doc
        "The [Filter] is used to identify objects that a Lifecycle Rule applies to. A [Filter] \
         must have exactly one of [Prefix], [Tag], [ObjectSizeGreaterThan], [ObjectSizeLessThan], \
         or [And] specified. [Filter] is required if the [LifecycleRule] does not contain a \
         [Prefix] element.\n\n\
        \ For more information about [Tag] filters, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/intro-lifecycle-filters.html}Adding \
         filters to Lifecycle rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \    [Tag] filters are not supported for directory buckets.\n\
        \   \n\
        \    "]
  status : expiration_status;
      [@ocaml.doc
        "If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not \
         currently being applied.\n"]
  transitions : transition_list option;
      [@ocaml.doc
        "Specifies when an Amazon S3 object transitions to a specified storage class.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
  noncurrent_version_transitions : noncurrent_version_transition_list option;
      [@ocaml.doc
        "Specifies the transition rule for the lifecycle rule that describes when noncurrent \
         objects transition to a specific storage class. If your bucket is versioning-enabled (or \
         versioning is suspended), you can set this action to request that Amazon S3 transition \
         noncurrent object versions to a specific storage class at a set period in the object's \
         lifetime.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
  noncurrent_version_expiration : noncurrent_version_expiration option; [@ocaml.doc ""]
  abort_incomplete_multipart_upload : abort_incomplete_multipart_upload option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A lifecycle rule for individual objects in an Amazon S3 bucket.\n\n\
  \ For more information see, \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html}Managing \
   your storage lifecycle} in the {i Amazon S3 User Guide}.\n\
  \ "]

type nonrec lifecycle_rules = lifecycle_rule list [@@ocaml.doc ""]

type nonrec bucket_lifecycle_configuration = {
  rules : lifecycle_rules;
      [@ocaml.doc "A lifecycle rule for individual objects in an Amazon S3 bucket.\n"]
}
[@@ocaml.doc
  "Specifies the lifecycle configuration for objects in an Amazon S3 bucket. For more information, \
   see {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html}Object \
   Lifecycle Management} in the {i Amazon S3 User Guide}.\n"]

type nonrec put_bucket_lifecycle_configuration_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the bucket for which to set the configuration.\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  lifecycle_configuration : bucket_lifecycle_configuration option;
      [@ocaml.doc "Container for lifecycle rules. You can add as many as 1,000 rules.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
  transition_default_minimum_object_size : transition_default_minimum_object_size option;
      [@ocaml.doc
        "Indicates which default minimum object size behavior is applied to the lifecycle \
         configuration.\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \    {ul\n\
        \          {-   [all_storage_classes_128K] - Objects smaller than 128 KB will not \
         transition to any storage class by default. \n\
        \              \n\
        \               }\n\
        \          {-   [varies_by_storage_class] - Objects smaller than 128 KB will transition to \
         Glacier Flexible Retrieval or Glacier Deep Archive storage classes. By default, all other \
         storage classes will prevent transitions smaller than 128 KB. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   To customize the minimum object size for any transition you can add a filter that \
         specifies a custom [ObjectSizeGreaterThan] or [ObjectSizeLessThan] in the body of your \
         transition rule. Custom filters always take precedence over the default transition \
         behavior.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec inventory_frequency = Daily [@ocaml.doc ""] | Weekly [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec inventory_schedule = {
  frequency : inventory_frequency;
      [@ocaml.doc "Specifies how frequently inventory results are produced.\n"]
}
[@@ocaml.doc "Specifies the schedule for generating S3 Inventory results.\n"]

type nonrec inventory_optional_field =
  | Size [@ocaml.doc ""]
  | LastModifiedDate [@ocaml.doc ""]
  | StorageClass [@ocaml.doc ""]
  | ETag [@ocaml.doc ""]
  | IsMultipartUploaded [@ocaml.doc ""]
  | ReplicationStatus [@ocaml.doc ""]
  | EncryptionStatus [@ocaml.doc ""]
  | ObjectLockRetainUntilDate [@ocaml.doc ""]
  | ObjectLockMode [@ocaml.doc ""]
  | ObjectLockLegalHoldStatus [@ocaml.doc ""]
  | IntelligentTieringAccessTier [@ocaml.doc ""]
  | BucketKeyStatus [@ocaml.doc ""]
  | ChecksumAlgorithm [@ocaml.doc ""]
  | ObjectAccessControlList [@ocaml.doc ""]
  | ObjectOwner [@ocaml.doc ""]
  | LifecycleExpirationDate [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inventory_optional_fields = inventory_optional_field list [@@ocaml.doc ""]

type nonrec inventory_included_object_versions = All [@ocaml.doc ""] | Current [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inventory_id = string [@@ocaml.doc ""]

type nonrec inventory_filter = {
  prefix : prefix;
      [@ocaml.doc "The prefix that an object must have to be included in the inventory results.\n"]
}
[@@ocaml.doc
  "Specifies an S3 Inventory filter. The inventory only includes objects that meet the filter's \
   criteria.\n"]

type nonrec is_enabled = bool [@@ocaml.doc ""]

type nonrec ssekm_s = {
  key_id : ssekms_key_id;
      [@ocaml.doc
        "Specifies the ID of the Key Management Service (KMS) symmetric encryption customer \
         managed key to use for encrypting inventory reports.\n"]
}
[@@ocaml.doc "Specifies the use of SSE-KMS to encrypt delivered inventory reports.\n"]

type nonrec sse_s3 = unit [@@ocaml.doc ""]

type nonrec inventory_encryption = {
  sse_s3 : sse_s3 option;
      [@ocaml.doc "Specifies the use of SSE-S3 to encrypt delivered inventory reports.\n"]
  ssekm_s : ssekm_s option;
      [@ocaml.doc "Specifies the use of SSE-KMS to encrypt delivered inventory reports.\n"]
}
[@@ocaml.doc
  "Contains the type of server-side encryption used to encrypt the S3 Inventory results.\n"]

type nonrec inventory_format = CSV [@ocaml.doc ""] | ORC [@ocaml.doc ""] | Parquet [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inventory_s3_bucket_destination = {
  account_id : account_id option;
      [@ocaml.doc
        "The account ID that owns the destination S3 bucket. If no account ID is provided, the \
         owner is not validated before exporting data. \n\n\
        \   Although this value is optional, we strongly recommend that you set it to help prevent \
         problems if the destination bucket ownership changes. \n\
        \  \n\
        \   "]
  bucket : bucket_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the bucket where inventory results will be published.\n"]
  format : inventory_format; [@ocaml.doc "Specifies the output format of the inventory results.\n"]
  prefix : prefix option; [@ocaml.doc "The prefix that is prepended to all inventory results.\n"]
  encryption : inventory_encryption option;
      [@ocaml.doc
        "Contains the type of server-side encryption used to encrypt the inventory results.\n"]
}
[@@ocaml.doc
  "Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where S3 \
   Inventory results are published.\n"]

type nonrec inventory_destination = {
  s3_bucket_destination : inventory_s3_bucket_destination;
      [@ocaml.doc
        "Contains the bucket name, file format, bucket owner (optional), and prefix (optional) \
         where inventory results are published.\n"]
}
[@@ocaml.doc "Specifies the S3 Inventory configuration for an Amazon S3 bucket.\n"]

type nonrec inventory_configuration = {
  destination : inventory_destination;
      [@ocaml.doc "Contains information about where to publish the inventory results.\n"]
  is_enabled : is_enabled;
      [@ocaml.doc
        "Specifies whether the inventory is enabled or disabled. If set to [True], an inventory \
         list is generated. If set to [False], no inventory list is generated.\n"]
  filter : inventory_filter option;
      [@ocaml.doc
        "Specifies an inventory filter. The inventory only includes objects that meet the filter's \
         criteria.\n"]
  id : inventory_id; [@ocaml.doc "The ID used to identify the inventory configuration.\n"]
  included_object_versions : inventory_included_object_versions;
      [@ocaml.doc
        "Object versions to include in the inventory list. If set to [All], the list includes all \
         the object versions, which adds the version-related fields [VersionId], [IsLatest], and \
         [DeleteMarker] to the list. If set to [Current], the list does not contain these \
         version-related fields.\n"]
  optional_fields : inventory_optional_fields option;
      [@ocaml.doc
        "Contains the optional fields that are included in the inventory results.\n\n\
        \  The following optional fields are supported for directory buckets [Size | \
         LastModifiedDate | StorageClass | ETag | IsMultipartUploaded | \n\
        \      EncryptionStatus | BucketKeyStatus | ChecksumAlgorithm | LifecycleExpirationDate.] \
         Throws MalformedXML error if unsupported optional field is provided. \n\
        \  \n\
        \   "]
  schedule : inventory_schedule;
      [@ocaml.doc "Specifies the schedule for generating inventory results.\n"]
}
[@@ocaml.doc
  "Specifies the S3 Inventory configuration for an Amazon S3 bucket. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGETInventoryConfig.html}GET Bucket \
   inventory} in the {i Amazon S3 API Reference}. \n"]

type nonrec put_bucket_inventory_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket where the inventory configuration will be stored.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  id : inventory_id; [@ocaml.doc "The ID used to identify the inventory configuration.\n"]
  inventory_configuration : inventory_configuration;
      [@ocaml.doc "Specifies the inventory configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec intelligent_tiering_access_tier =
  | ARCHIVE_ACCESS [@ocaml.doc ""]
  | DEEP_ARCHIVE_ACCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec intelligent_tiering_days = int [@@ocaml.doc ""]

type nonrec tiering = {
  days : intelligent_tiering_days;
      [@ocaml.doc
        "The number of consecutive days of no access after which an object will be eligible to be \
         transitioned to the corresponding tier. The minimum number of days specified for Archive \
         Access tier must be at least 90 days and Deep Archive Access tier must be at least 180 \
         days. The maximum can be up to 2 years (730 days).\n"]
  access_tier : intelligent_tiering_access_tier;
      [@ocaml.doc
        "S3 Intelligent-Tiering access tier. See \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access}Storage \
         class for automatically optimizing frequently and infrequently accessed objects} for a \
         list of access tiers in the S3 Intelligent-Tiering storage class.\n"]
}
[@@ocaml.doc
  "The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically \
   moving data to the most cost-effective storage access tier, without additional operational \
   overhead.\n"]

type nonrec tiering_list = tiering list [@@ocaml.doc ""]

type nonrec intelligent_tiering_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec intelligent_tiering_and_operator = {
  prefix : prefix option;
      [@ocaml.doc
        "An object key name prefix that identifies the subset of objects to which the \
         configuration applies.\n"]
  tags : tag_set option;
      [@ocaml.doc
        "All of these tags must exist in the object's tag set in order for the configuration to \
         apply.\n"]
}
[@@ocaml.doc
  "A container for specifying S3 Intelligent-Tiering filters. The filters determine the subset of \
   objects to which the rule applies.\n"]

type nonrec intelligent_tiering_filter = {
  prefix : prefix option;
      [@ocaml.doc
        "An object key name prefix that identifies the subset of objects to which the rule \
         applies.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
  tag : tag option; [@ocaml.doc ""]
  and_ : intelligent_tiering_and_operator option;
      [@ocaml.doc
        "A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. \
         The operator must have at least two predicates, and an object must match all of the \
         predicates in order for the filter to apply.\n"]
}
[@@ocaml.doc
  "The [Filter] is used to identify objects that the S3 Intelligent-Tiering configuration applies \
   to.\n"]

type nonrec intelligent_tiering_id = string [@@ocaml.doc ""]

type nonrec intelligent_tiering_configuration = {
  id : intelligent_tiering_id;
      [@ocaml.doc "The ID used to identify the S3 Intelligent-Tiering configuration.\n"]
  filter : intelligent_tiering_filter option;
      [@ocaml.doc
        "Specifies a bucket filter. The configuration only includes objects that meet the filter's \
         criteria.\n"]
  status : intelligent_tiering_status; [@ocaml.doc "Specifies the status of the configuration.\n"]
  tierings : tiering_list;
      [@ocaml.doc "Specifies the S3 Intelligent-Tiering storage class tier of the configuration.\n"]
}
[@@ocaml.doc
  "Specifies the S3 Intelligent-Tiering configuration for an Amazon S3 bucket.\n\n\
  \ For information about the S3 Intelligent-Tiering storage class, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access}Storage \
   class for automatically optimizing frequently and infrequently accessed objects}.\n\
  \ "]

type nonrec put_bucket_intelligent_tiering_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.\n"]
  id : intelligent_tiering_id;
      [@ocaml.doc "The ID used to identify the S3 Intelligent-Tiering configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  intelligent_tiering_configuration : intelligent_tiering_configuration;
      [@ocaml.doc "Container for S3 Intelligent-Tiering configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec encryption_type = NONE [@ocaml.doc ""] | SSE_C [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec encryption_type_list = encryption_type list [@@ocaml.doc ""]

type nonrec blocked_encryption_types = {
  encryption_type : encryption_type_list option;
      [@ocaml.doc
        "The object encryption type that you want to block or unblock for an Amazon S3 general \
         purpose bucket.\n\n\
        \  Currently, this parameter only supports blocking or unblocking server side encryption \
         with customer-provided keys (SSE-C). For more information about SSE-C, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html}Using \
         server-side encryption with customer-provided keys (SSE-C)}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A bucket-level setting for Amazon S3 general purpose buckets used to prevent the upload of new \
   objects encrypted with the specified server-side encryption type. For example, blocking an \
   encryption type will block [PutObject], [CopyObject], [PostObject], multipart upload, and \
   replication requests to the bucket for objects with the specified encryption type. However, you \
   can continue to read and list any pre-existing objects already encrypted with the specified \
   encryption type. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/blocking-unblocking-s3-c-encryption-gpb.html}Blocking \
   or unblocking SSE-C for a general purpose bucket}.\n\n\
  \ This data type is used with the following actions:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html}PutBucketEncryption} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html}GetBucketEncryption} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html}DeleteBucketEncryption} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \    Permissions  You must have the [s3:PutEncryptionConfiguration] permission to block or \
   unblock an encryption type for a bucket. \n\
  \                 \n\
  \                  You must have the [s3:GetEncryptionConfiguration] permission to view a \
   bucket's encryption type. \n\
  \                  \n\
  \                    "]

type nonrec server_side_encryption_by_default = {
  sse_algorithm : server_side_encryption;
      [@ocaml.doc
        "Server-side encryption algorithm to use for the default encryption.\n\n\
        \  For directory buckets, there are only two supported values for server-side encryption: \
         [AES256] and [aws:kms].\n\
        \  \n\
        \   "]
  kms_master_key_i_d : ssekms_key_id option;
      [@ocaml.doc
        "Amazon Web Services Key Management Service (KMS) customer managed key ID to use for the \
         default encryption. \n\n\
        \  {ul\n\
        \        {-   {b General purpose buckets} - This parameter is allowed if and only if \
         [SSEAlgorithm] is set to [aws:kms] or [aws:kms:dsse].\n\
        \            \n\
        \             }\n\
        \        {-   {b Directory buckets} - This parameter is allowed if and only if \
         [SSEAlgorithm] is set to [aws:kms].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    You can specify the key ID, key alias, or the Amazon Resource Name (ARN) of the KMS \
         key.\n\
        \    \n\
        \     {ul\n\
        \           {-  Key ID: [1234abcd-12ab-34cd-56ef-1234567890ab] \n\
        \               \n\
        \                }\n\
        \           {-  Key ARN: \
         [arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab] \n\
        \               \n\
        \                }\n\
        \           {-  Key Alias: [alias/alias-name] \n\
        \               \n\
        \                }\n\
        \           }\n\
        \   If you are using encryption with cross-account or Amazon Web Services service \
         operations, you must use a fully qualified KMS key ARN. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html#bucket-encryption-update-bucket-policy}Using \
         encryption for cross-account operations}.\n\
        \   \n\
        \     {ul\n\
        \           {-   {b General purpose buckets} - If you're specifying a customer managed KMS \
         key, we recommend using a fully qualified KMS key ARN. If you use a KMS key alias \
         instead, then KMS resolves the key within the requester\226\128\153s account. This \
         behavior can result in data that's encrypted with a KMS key that belongs to the \
         requester, and not the bucket owner. Also, if you use a key ID, you can run into a \
         LogDestination undeliverable error when creating a VPC flow log. \n\
        \               \n\
        \                }\n\
        \           {-   {b Directory buckets} - When you specify an \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}KMS \
         customer managed key} for encryption in your directory bucket, only use the key ID or key \
         ARN. The key alias format of the KMS key isn't supported.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \     Amazon S3 only supports symmetric encryption KMS keys. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html}Asymmetric \
         keys in Amazon Web Services KMS} in the {i Amazon Web Services Key Management Service \
         Developer Guide}.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc
  "Describes the default server-side encryption to apply to new objects in the bucket. If a PUT \
   Object request doesn't specify any server-side encryption, this default encryption will be \
   applied. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTencryption.html}PutBucketEncryption}.\n\n\
  \  {ul\n\
  \        {-   {b General purpose buckets} - If you don't specify a customer managed key at \
   configuration, Amazon S3 automatically creates an Amazon Web Services KMS key ([aws/s3]) in \
   your Amazon Web Services account the first time that you add an object encrypted with SSE-KMS \
   to a bucket. By default, Amazon S3 uses this KMS key for SSE-KMS. \n\
  \            \n\
  \             }\n\
  \        {-   {b Directory buckets} - Your SSE-KMS configuration can only support 1 \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer \
   managed key} per directory bucket's lifetime. The \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
   Web Services managed key} ([aws/s3]) isn't supported. \n\
  \            \n\
  \             }\n\
  \        {-   {b Directory buckets} - For directory buckets, there are only two supported \
   options for server-side encryption: SSE-S3 and SSE-KMS.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

type nonrec server_side_encryption_rule = {
  apply_server_side_encryption_by_default : server_side_encryption_by_default option;
      [@ocaml.doc
        "Specifies the default server-side encryption to apply to new objects in the bucket. If a \
         PUT Object request doesn't specify any server-side encryption, this default encryption \
         will be applied.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should use an S3 Bucket Key with server-side encryption using \
         KMS (SSE-KMS) for new objects in the bucket. Existing objects are not affected. Setting \
         the [BucketKeyEnabled] element to [true] causes Amazon S3 to use an S3 Bucket Key. \n\n\
        \  {ul\n\
        \        {-   {b General purpose buckets} - By default, S3 Bucket Key is not enabled. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html}Amazon S3 Bucket Keys} \
         in the {i Amazon S3 User Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   {b Directory buckets} - S3 Bucket Keys are always enabled for [GET] and \
         [PUT] operations in a directory bucket and can\226\128\153t be disabled. S3 Bucket Keys \
         aren't supported, when you copy SSE-KMS encrypted objects from general purpose buckets to \
         directory buckets, from directory buckets to general purpose buckets, or between \
         directory buckets, through \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops}the \
         Copy operation in Batch Operations}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job}the import \
         jobs}. In this case, Amazon S3 makes a call to KMS every time a copy request is made for \
         a KMS-encrypted object.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  blocked_encryption_types : blocked_encryption_types option;
      [@ocaml.doc
        "A bucket-level setting for Amazon S3 general purpose buckets used to prevent the upload \
         of new objects encrypted with the specified server-side encryption type. For example, \
         blocking an encryption type will block [PutObject], [CopyObject], [PostObject], multipart \
         upload, and replication requests to the bucket for objects with the specified encryption \
         type. However, you can continue to read and list any pre-existing objects already \
         encrypted with the specified encryption type. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/blocking-unblocking-s3-c-encryption-gpb.html}Blocking \
         or unblocking SSE-C for a general purpose bucket}.\n\n\
        \  Currently, this parameter only supports blocking or unblocking server-side encryption \
         with customer-provided keys (SSE-C). For more information about SSE-C, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html}Using \
         server-side encryption with customer-provided keys (SSE-C)}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Specifies the default server-side encryption configuration.\n\n\
  \  {ul\n\
  \        {-   {b General purpose buckets} - If you're specifying a customer managed KMS key, we \
   recommend using a fully qualified KMS key ARN. If you use a KMS key alias instead, then KMS \
   resolves the key within the requester\226\128\153s account. This behavior can result in data \
   that's encrypted with a KMS key that belongs to the requester, and not the bucket owner.\n\
  \            \n\
  \             }\n\
  \        {-   {b Directory buckets} - When you specify an \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}KMS \
   customer managed key} for encryption in your directory bucket, only use the key ID or key ARN. \
   The key alias format of the KMS key isn't supported.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

type nonrec server_side_encryption_rules = server_side_encryption_rule list [@@ocaml.doc ""]

type nonrec server_side_encryption_configuration = {
  rules : server_side_encryption_rules;
      [@ocaml.doc
        "Container for information about a particular server-side encryption configuration rule.\n"]
}
[@@ocaml.doc "Specifies the default server-side-encryption configuration.\n"]

type nonrec put_bucket_encryption_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "Specifies default encryption for a bucket using server-side encryption with different key \
         options.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the server-side encryption configuration.\n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ \n\
        \   For directory buckets, when you use Amazon Web Services SDKs, [CRC32] is the default \
         checksum algorithm that's used for performance.\n\
        \   \n\
        \    "]
  server_side_encryption_configuration : server_side_encryption_configuration; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec max_age_seconds = int [@@ocaml.doc ""]

type nonrec expose_header = string [@@ocaml.doc ""]

type nonrec expose_headers = expose_header list [@@ocaml.doc ""]

type nonrec cors_rule = {
  i_d : i_d option;
      [@ocaml.doc
        "Unique identifier for the rule. The value cannot be longer than 255 characters.\n"]
  allowed_headers : allowed_headers option;
      [@ocaml.doc
        "Headers that are specified in the [Access-Control-Request-Headers] header. These headers \
         are allowed in a preflight OPTIONS request. In response to any preflight OPTIONS request, \
         Amazon S3 returns any requested headers that are allowed.\n"]
  allowed_methods : allowed_methods;
      [@ocaml.doc
        "An HTTP method that you allow the origin to execute. Valid values are [GET], [PUT], \
         [HEAD], [POST], and [DELETE].\n"]
  allowed_origins : allowed_origins;
      [@ocaml.doc "One or more origins you want customers to be able to access the bucket from.\n"]
  expose_headers : expose_headers option;
      [@ocaml.doc
        "One or more headers in the response that you want customers to be able to access from \
         their applications (for example, from a JavaScript [XMLHttpRequest] object).\n"]
  max_age_seconds : max_age_seconds option;
      [@ocaml.doc
        "The time in seconds that your browser is to cache the preflight response for the \
         specified resource.\n"]
}
[@@ocaml.doc "Specifies a cross-origin access rule for an Amazon S3 bucket.\n"]

type nonrec cors_rules = cors_rule list [@@ocaml.doc ""]

type nonrec cors_configuration = {
  cors_rules : cors_rules;
      [@ocaml.doc
        "A set of origins and methods (cross-origin access that you want to allow). You can add up \
         to 100 rules to the configuration.\n"]
}
[@@ocaml.doc
  "Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For more \
   information, see {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html}Enabling \
   Cross-Origin Resource Sharing} in the {i Amazon S3 User Guide}.\n"]

type nonrec put_bucket_cors_request = {
  bucket : bucket_name; [@ocaml.doc "Specifies the bucket impacted by the [cors]configuration.\n"]
  cors_configuration : cors_configuration;
      [@ocaml.doc
        "Describes the cross-origin access configuration for objects in an Amazon S3 bucket. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html}Enabling Cross-Origin \
         Resource Sharing} in the {i Amazon S3 User Guide}.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the data. This header must be used as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, go to {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864.} \n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec analytics_s3_export_file_format = CSV [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec analytics_s3_bucket_destination = {
  format : analytics_s3_export_file_format;
      [@ocaml.doc "Specifies the file format used when exporting data to Amazon S3.\n"]
  bucket_account_id : account_id option;
      [@ocaml.doc
        "The account ID that owns the destination S3 bucket. If no account ID is provided, the \
         owner is not validated before exporting data.\n\n\
        \   Although this value is optional, we strongly recommend that you set it to help prevent \
         problems if the destination bucket ownership changes. \n\
        \  \n\
        \   "]
  bucket : bucket_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the bucket to which data is exported.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The prefix to use when exporting data. The prefix is prepended to all results.\n"]
}
[@@ocaml.doc "Contains information about where to publish the analytics results.\n"]

type nonrec analytics_export_destination = {
  s3_bucket_destination : analytics_s3_bucket_destination;
      [@ocaml.doc "A destination signifying output to an S3 bucket.\n"]
}
[@@ocaml.doc "Where to publish the analytics results.\n"]

type nonrec storage_class_analysis_schema_version = V_1 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec storage_class_analysis_data_export = {
  output_schema_version : storage_class_analysis_schema_version;
      [@ocaml.doc "The version of the output schema to use when exporting data. Must be [V_1].\n"]
  destination : analytics_export_destination;
      [@ocaml.doc "The place to store the data for an analysis.\n"]
}
[@@ocaml.doc
  "Container for data related to the storage class analysis for an Amazon S3 bucket for export.\n"]

type nonrec storage_class_analysis = {
  data_export : storage_class_analysis_data_export option;
      [@ocaml.doc
        "Specifies how data related to the storage class analysis for an Amazon S3 bucket should \
         be exported.\n"]
}
[@@ocaml.doc
  "Specifies data related to access patterns to be collected and made available to analyze the \
   tradeoffs between different storage classes for an Amazon S3 bucket.\n"]

type nonrec analytics_and_operator = {
  prefix : prefix option;
      [@ocaml.doc
        "The prefix to use when evaluating an AND predicate: The prefix that an object must have \
         to be included in the metrics results.\n"]
  tags : tag_set option; [@ocaml.doc "The list of tags to use when evaluating an AND predicate.\n"]
}
[@@ocaml.doc
  "A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The \
   operator must have at least two predicates in any combination, and an object must match all of \
   the predicates for the filter to apply.\n"]

type nonrec analytics_filter =
  | Prefix of prefix [@ocaml.doc "The prefix to use when evaluating an analytics filter.\n"]
  | Tag of tag [@ocaml.doc "The tag to use when evaluating an analytics filter.\n"]
  | And of analytics_and_operator
      [@ocaml.doc
        "A conjunction (logical AND) of predicates, which is used in evaluating an analytics \
         filter. The operator must have at least two predicates.\n"]
[@@ocaml.doc
  "The filter used to describe a set of objects for analyses. A filter must have exactly one \
   prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all \
   objects will be considered in any analysis.\n"]

type nonrec analytics_id = string [@@ocaml.doc ""]

type nonrec analytics_configuration = {
  id : analytics_id; [@ocaml.doc "The ID that identifies the analytics configuration.\n"]
  filter : analytics_filter option;
      [@ocaml.doc
        "The filter used to describe a set of objects for analyses. A filter must have exactly one \
         prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all \
         objects will be considered in any analysis.\n"]
  storage_class_analysis : storage_class_analysis;
      [@ocaml.doc
        " Contains data related to access patterns to be collected and made available to analyze \
         the tradeoffs between different storage classes. \n"]
}
[@@ocaml.doc
  "Specifies the configuration and any analyses for the analytics filter of an Amazon S3 bucket.\n"]

type nonrec put_bucket_analytics_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket to which an analytics configuration is stored.\n"]
  id : analytics_id; [@ocaml.doc "The ID that identifies the analytics configuration.\n"]
  analytics_configuration : analytics_configuration;
      [@ocaml.doc "The configuration and any analyses for the analytics filter.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec bucket_canned_ac_l =
  | Private [@ocaml.doc ""]
  | Public_read [@ocaml.doc ""]
  | Public_read_write [@ocaml.doc ""]
  | Authenticated_read [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec put_bucket_acl_request = {
  ac_l : bucket_canned_ac_l option; [@ocaml.doc "The canned ACL to apply to the bucket.\n"]
  access_control_policy : access_control_policy option;
      [@ocaml.doc "Contains the elements that set the ACL permissions for an object per grantee.\n"]
  bucket : bucket_name; [@ocaml.doc "The bucket to which to apply the ACL.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded 128-bit [MD5] digest of the data. This header must be used as a \
         message integrity check to verify that the request body was not corrupted in transit. For \
         more information, go to {{:http://www.ietf.org/rfc/rfc1864.txt}RFC 1864.} \n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
  grant_full_control : grant_full_control option;
      [@ocaml.doc
        "Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.\n"]
  grant_read : grant_read option; [@ocaml.doc "Allows grantee to list the objects in the bucket.\n"]
  grant_read_ac_p : grant_read_ac_p option; [@ocaml.doc "Allows grantee to read the bucket ACL.\n"]
  grant_write : grant_write option;
      [@ocaml.doc
        "Allows grantee to create new objects in the bucket.\n\n\
        \ For the bucket and object owners of existing objects, also allows deletions and \
         overwrites of those objects.\n\
        \ "]
  grant_write_ac_p : grant_write_ac_p option;
      [@ocaml.doc "Allows grantee to write the ACL for the applicable bucket.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec put_bucket_accelerate_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket for which the accelerate configuration is set.\n"]
  accelerate_configuration : accelerate_configuration;
      [@ocaml.doc "Container for setting the transfer acceleration state.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the request when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding [x-amz-checksum] or [x-amz-trailer] \
         header sent. Otherwise, Amazon S3 fails the request with the HTTP status code [400 Bad \
         Request]. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec put_bucket_abac_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the general purpose bucket.\n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc
        "The MD5 hash of the [PutBucketAbac] request body. \n\n\
        \ For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon \
         Web Services SDKs, this field is calculated automatically.\n\
        \ "]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm that you want Amazon S3 to use to create the checksum. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the general purpose bucket's owner. \n"]
  abac_status : abac_status;
      [@ocaml.doc
        "The ABAC status of the general purpose bucket. When ABAC is enabled for the general \
         purpose bucket, you can use tags to manage access to the general purpose buckets as well \
         as for cost tracking purposes. When ABAC is disabled for the general purpose buckets, you \
         can only use tags for cost tracking purposes. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging.html}Using tags \
         with S3 general purpose buckets}. \n"]
}
[@@ocaml.doc ""]

type nonrec initiator = {
  i_d : i_d option;
      [@ocaml.doc
        "If the principal is an Amazon Web Services account, it provides the Canonical User ID. If \
         the principal is an IAM User, it provides a user ARN value.\n\n\
        \   {b Directory buckets} - If the principal is an Amazon Web Services account, it \
         provides the Amazon Web Services account ID. If the principal is an IAM User, it provides \
         a user ARN value.\n\
        \  \n\
        \   "]
  display_name : display_name option;
      [@ocaml.doc "\n\n  This functionality is not supported for directory buckets.\n  \n   "]
}
[@@ocaml.doc "Container element that identifies who initiated the multipart upload. \n"]

type nonrec part = {
  part_number : part_number option;
      [@ocaml.doc
        "Part number identifying the part. This is a positive integer between 1 and 10,000.\n"]
  last_modified : last_modified option;
      [@ocaml.doc "Date and time at which the part was uploaded.\n"]
  e_tag : e_tag option; [@ocaml.doc "Entity tag returned when the part was uploaded.\n"]
  size : size option; [@ocaml.doc "Size in bytes of the uploaded part data.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32] checksum of the part. This checksum is present if the \
         object was uploaded with the [CRC32] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the part. This checksum is present if the \
         object was uploaded with the [CRC32C] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [CRC64NVME] checksum algorithm, or if \
         the object was uploaded without a checksum (and Amazon S3 added the default checksum, \
         [CRC64NVME], to the uploaded object). For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] checksum of the part. This checksum is present if the \
         object was uploaded with the [SHA1] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] checksum of the part. This checksum is present if \
         the object was uploaded with the [SHA256] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the part. This checksum is present if the \
         multipart upload request was created with the [SHA512] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the part. This checksum is present if the \
         multipart upload request was created with the [MD5] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH64] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH3] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH128] checksum algorithm. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc "Container for elements related to a part.\n"]

type nonrec parts = part list [@@ocaml.doc ""]

type nonrec is_truncated = bool [@@ocaml.doc ""]

type nonrec max_parts = int [@@ocaml.doc ""]

type nonrec next_part_number_marker = string [@@ocaml.doc ""]

type nonrec part_number_marker = string [@@ocaml.doc ""]

type nonrec list_parts_output = {
  abort_date : abort_date option;
      [@ocaml.doc
        "If the bucket has a lifecycle rule configured with an action to abort incomplete \
         multipart uploads and the prefix in the lifecycle rule matches the object name in the \
         request, then the response includes this header indicating when the initiated multipart \
         upload will become eligible for abort operation. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config}Aborting \
         Incomplete Multipart Uploads Using a Bucket Lifecycle Configuration}.\n\n\
        \ The response will also include the [x-amz-abort-rule-id] header that will provide the ID \
         of the lifecycle configuration rule that defines this action.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  abort_rule_id : abort_rule_id option;
      [@ocaml.doc
        "This header is returned along with the [x-amz-abort-date] header. It identifies \
         applicable lifecycle configuration rule that defines the action to abort incomplete \
         multipart uploads.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  bucket : bucket_name option;
      [@ocaml.doc
        "The name of the bucket to which the multipart upload was initiated. Does not return the \
         access point ARN or access point alias if used.\n"]
  key : object_key option; [@ocaml.doc "Object key for which the multipart upload was initiated.\n"]
  upload_id : multipart_upload_id option;
      [@ocaml.doc "Upload ID identifying the multipart upload whose parts are being listed.\n"]
  part_number_marker : part_number_marker option;
      [@ocaml.doc
        "Specifies the part after which listing should begin. Only parts with higher part numbers \
         will be listed.\n"]
  next_part_number_marker : next_part_number_marker option;
      [@ocaml.doc
        "When a list is truncated, this element specifies the last part in the list, as well as \
         the value to use for the [part-number-marker] request parameter in a subsequent request.\n"]
  max_parts : max_parts option;
      [@ocaml.doc "Maximum number of parts that were allowed in the response.\n"]
  is_truncated : is_truncated option;
      [@ocaml.doc
        " Indicates whether the returned list of parts is truncated. A true value indicates that \
         the list was truncated. A list can be truncated if the number of parts exceeds the limit \
         returned in the MaxParts element.\n"]
  parts : parts option;
      [@ocaml.doc
        "Container for elements related to a particular part. A response can contain zero or more \
         [Part] elements.\n"]
  initiator : initiator option;
      [@ocaml.doc
        "Container element that identifies who initiated the multipart upload. If the initiator is \
         an Amazon Web Services account, this element provides the same information as the [Owner] \
         element. If the initiator is an IAM User, this element provides the user ARN.\n"]
  owner : owner option;
      [@ocaml.doc
        "Container element that identifies the object owner, after the object is created. If \
         multipart upload is initiated by an IAM user, this element provides the parent account \
         ID.\n\n\
        \   {b Directory buckets} - The bucket owner is returned as the object owner for all the \
         parts.\n\
        \  \n\
        \   "]
  storage_class : storage_class option;
      [@ocaml.doc
        "The class of storage used to store the uploaded object.\n\n\
        \   {b Directory buckets} - Directory buckets only support [EXPRESS_ONEZONE] (the S3 \
         Express One Zone storage class) in Availability Zones and [ONEZONE_IA] (the S3 One \
         Zone-Infrequent Access storage class) in Dedicated Local Zones.\n\
        \  \n\
        \   "]
  request_charged : request_charged option; [@ocaml.doc ""]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc "The algorithm that was used to create a checksum of the object.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type, which determines how part-level checksums are combined to create an \
         object-level checksum for multipart objects. You can use this header response to verify \
         that the checksum type that is received is the same checksum type that was specified in \
         [CreateMultipartUpload] request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec list_parts_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket to which the parts are being uploaded. \n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  key : object_key; [@ocaml.doc "Object key for which the multipart upload was initiated.\n"]
  max_parts : max_parts option; [@ocaml.doc "Sets the maximum number of parts to return.\n"]
  part_number_marker : part_number_marker option;
      [@ocaml.doc
        "Specifies the part after which listing should begin. Only parts with higher part numbers \
         will be listed.\n"]
  upload_id : multipart_upload_id;
      [@ocaml.doc "Upload ID identifying the multipart upload whose parts are being listed.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is \
         needed only when the object was created using a checksum algorithm. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "The server-side encryption (SSE) customer managed key. This parameter is needed only when \
         the object was created using a checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only \
         when the object was created using a checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec encoding_type = Url [@ocaml.doc ""]
[@@ocaml.doc
  "Encoding type used by Amazon S3 to encode the \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html}object keys} in the \
   response. Responses are encoded only in UTF-8. An object key can contain any Unicode character. \
   However, the XML 1.0 parser can't parse certain characters, such as characters with an ASCII \
   value from 0 to 10. For characters that aren't supported in XML 1.0, you can add this parameter \
   to request that Amazon S3 encode the keys in the response. For more information about \
   characters to avoid in object key names, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-guidelines}Object \
   key naming guidelines}.\n\n\
  \  When using the URL encoding type, non-ASCII characters that are used in an object's key name \
   will be percent-encoded according to UTF-8 code values. For example, the object \
   [test_file(3).png] will appear as [test_file%283%29.png].\n\
  \  \n\
  \   "]

type nonrec common_prefix = {
  prefix : prefix option; [@ocaml.doc "Container for the specified common prefix.\n"]
}
[@@ocaml.doc
  "Container for all (if there are any) keys between Prefix and the next occurrence of the string \
   specified by a delimiter. CommonPrefixes lists keys that act like subdirectories in the \
   directory specified by Prefix. For example, if the prefix is notes/ and the delimiter is a \
   slash (/) as in notes/summer/july, the common prefix is notes/summer/. \n"]

type nonrec common_prefix_list = common_prefix list [@@ocaml.doc ""]

type nonrec max_keys = int [@@ocaml.doc ""]

type nonrec delimiter = string [@@ocaml.doc ""]

type nonrec is_latest = bool [@@ocaml.doc ""]

type nonrec delete_marker_entry = {
  owner : owner option; [@ocaml.doc "The account that created the delete marker. \n"]
  key : object_key option; [@ocaml.doc "The object key.\n"]
  version_id : object_version_id option; [@ocaml.doc "Version ID of an object.\n"]
  is_latest : is_latest option;
      [@ocaml.doc
        "Specifies whether the object is (true) or is not (false) the latest version of an object. \n"]
  last_modified : last_modified option;
      [@ocaml.doc "Date and time when the object was last modified.\n"]
}
[@@ocaml.doc "Information about the delete marker.\n"]

type nonrec delete_markers = delete_marker_entry list [@@ocaml.doc ""]

type nonrec restore_expiry_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec is_restore_in_progress = bool [@@ocaml.doc ""]

type nonrec restore_status = {
  is_restore_in_progress : is_restore_in_progress option;
      [@ocaml.doc
        "Specifies whether the object is currently being restored. If the object restoration is in \
         progress, the header returns the value [TRUE]. For example:\n\n\
        \  [x-amz-optional-object-attributes: IsRestoreInProgress=\"true\"] \n\
        \ \n\
        \  If the object restoration has completed, the header returns the value [FALSE]. For \
         example:\n\
        \  \n\
        \    [x-amz-optional-object-attributes: IsRestoreInProgress=\"false\",\n\
        \        RestoreExpiryDate=\"2012-12-21T00:00:00.000Z\"] \n\
        \   \n\
        \    If the object hasn't been restored, there is no header response.\n\
        \    "]
  restore_expiry_date : restore_expiry_date option;
      [@ocaml.doc
        "Indicates when the restored copy will expire. This value is populated only if the object \
         has already been restored. For example:\n\n\
        \  [x-amz-optional-object-attributes: IsRestoreInProgress=\"false\",\n\
        \        RestoreExpiryDate=\"2012-12-21T00:00:00.000Z\"] \n\
        \ "]
}
[@@ocaml.doc
  "Specifies the restoration status of an object. Objects in certain storage classes must be \
   restored before they can be retrieved. For more information about these storage classes and how \
   to work with archived objects, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/archived-objects.html} Working with \
   archived objects} in the {i Amazon S3 User Guide}.\n\n\
  \  This functionality is not supported for directory buckets. Directory buckets only support \
   [EXPRESS_ONEZONE] (the S3 Express One Zone storage class) in Availability Zones and \
   [ONEZONE_IA] (the S3 One Zone-Infrequent Access storage class) in Dedicated Local Zones.\n\
  \  \n\
  \   "]

type nonrec object_version_storage_class = STANDARD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec checksum_algorithm_list = checksum_algorithm list [@@ocaml.doc ""]

type nonrec object_version = {
  e_tag : e_tag option;
      [@ocaml.doc "The entity tag is an MD5 hash of that version of the object.\n"]
  checksum_algorithm : checksum_algorithm_list option;
      [@ocaml.doc "The algorithm that was used to create a checksum of the object.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type that is used to calculate the object\226\128\153s checksum value. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  size : size option; [@ocaml.doc "Size in bytes of the object.\n"]
  storage_class : object_version_storage_class option;
      [@ocaml.doc "The class of storage used to store the object.\n"]
  key : object_key option; [@ocaml.doc "The object key.\n"]
  version_id : object_version_id option; [@ocaml.doc "Version ID of an object.\n"]
  is_latest : is_latest option;
      [@ocaml.doc
        "Specifies whether the object is (true) or is not (false) the latest version of an object.\n"]
  last_modified : last_modified option;
      [@ocaml.doc "Date and time when the object was last modified.\n"]
  owner : owner option; [@ocaml.doc "Specifies the owner of the object.\n"]
  restore_status : restore_status option;
      [@ocaml.doc
        "Specifies the restoration status of an object. Objects in certain storage classes must be \
         restored before they can be retrieved. For more information about these storage classes \
         and how to work with archived objects, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/archived-objects.html} Working \
         with archived objects} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc "The version of an object.\n"]

type nonrec object_version_list = object_version list [@@ocaml.doc ""]

type nonrec next_version_id_marker = string [@@ocaml.doc ""]

type nonrec next_key_marker = string [@@ocaml.doc ""]

type nonrec version_id_marker = string [@@ocaml.doc ""]

type nonrec key_marker = string [@@ocaml.doc ""]

type nonrec list_object_versions_output = {
  is_truncated : is_truncated option;
      [@ocaml.doc
        "A flag that indicates whether Amazon S3 returned all of the results that satisfied the \
         search criteria. If your results were truncated, you can make a follow-up paginated \
         request by using the [NextKeyMarker] and [NextVersionIdMarker] response parameters as a \
         starting place in another request to return the rest of the results.\n"]
  key_marker : key_marker option;
      [@ocaml.doc "Marks the last key returned in a truncated response.\n"]
  version_id_marker : version_id_marker option;
      [@ocaml.doc "Marks the last version of the key returned in a truncated response.\n"]
  next_key_marker : next_key_marker option;
      [@ocaml.doc
        "When the number of responses exceeds the value of [MaxKeys], [NextKeyMarker] specifies \
         the first key not returned that satisfies the search criteria. Use this value for the \
         key-marker request parameter in a subsequent request.\n"]
  next_version_id_marker : next_version_id_marker option;
      [@ocaml.doc
        "When the number of responses exceeds the value of [MaxKeys], [NextVersionIdMarker] \
         specifies the first object version not returned that satisfies the search criteria. Use \
         this value for the [version-id-marker] request parameter in a subsequent request.\n"]
  versions : object_version_list option; [@ocaml.doc "Container for version information.\n"]
  delete_markers : delete_markers option;
      [@ocaml.doc
        "Container for an object that is a delete marker. To learn more about delete markers, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html}Working with \
         delete markers}.\n"]
  name : bucket_name option; [@ocaml.doc "The bucket name.\n"]
  prefix : prefix option;
      [@ocaml.doc "Selects objects that start with the value supplied by this parameter.\n"]
  delimiter : delimiter option;
      [@ocaml.doc
        "The delimiter grouping the included keys. A delimiter is a character that you specify to \
         group keys. All keys that contain the same string between the prefix and the first \
         occurrence of the delimiter are grouped under a single result element in \
         [CommonPrefixes]. These groups are counted as one result against the [max-keys] \
         limitation. These keys are not returned elsewhere in the response.\n"]
  max_keys : max_keys option; [@ocaml.doc "Specifies the maximum number of objects to return.\n"]
  common_prefixes : common_prefix_list option;
      [@ocaml.doc
        "All of the keys rolled up into a common prefix count as a single return when calculating \
         the number of returns.\n"]
  encoding_type : encoding_type option;
      [@ocaml.doc
        " Encoding type used by Amazon S3 to encode object key names in the XML response.\n\n\
        \ If you specify the [encoding-type] request parameter, Amazon S3 includes this element in \
         the response, and returns encoded key name values in the following response elements:\n\
        \ \n\
        \   [KeyMarker, NextKeyMarker, Prefix, Key], and [Delimiter].\n\
        \  "]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec optional_object_attributes = RESTORE_STATUS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec optional_object_attributes_list = optional_object_attributes list [@@ocaml.doc ""]

type nonrec list_object_versions_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name that contains the objects. \n"]
  delimiter : delimiter option;
      [@ocaml.doc
        "A delimiter is a character that you specify to group keys. All keys that contain the same \
         string between the [prefix] and the first occurrence of the delimiter are grouped under a \
         single result element in [CommonPrefixes]. These groups are counted as one result against \
         the [max-keys] limitation. These keys are not returned elsewhere in the response.\n\n\
        \  [CommonPrefixes] is filtered out from results if it is not lexicographically greater \
         than the key-marker.\n\
        \ "]
  encoding_type : encoding_type option; [@ocaml.doc ""]
  key_marker : key_marker option;
      [@ocaml.doc "Specifies the key to start with when listing objects in a bucket.\n"]
  max_keys : max_keys option;
      [@ocaml.doc
        "Sets the maximum number of keys returned in the response. By default, the action returns \
         up to 1,000 key names. The response might contain fewer keys but will never contain more. \
         If additional keys satisfy the search criteria, but were not returned because [max-keys] \
         was exceeded, the response contains \n\
         {[\n\
         true\n\
         ]}\n\
         . To return the additional keys, see [key-marker] and [version-id-marker].\n"]
  prefix : prefix option;
      [@ocaml.doc
        "Use this parameter to select only those keys that begin with the specified prefix. You \
         can use prefixes to separate a bucket into different groupings of keys. (You can think of \
         using [prefix] to make groups in the same way that you'd use a folder in a file system.) \
         You can use [prefix] with [delimiter] to roll up numerous objects into a single result \
         under [CommonPrefixes]. \n"]
  version_id_marker : version_id_marker option;
      [@ocaml.doc "Specifies the object version you want to start listing from.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  optional_object_attributes : optional_object_attributes_list option;
      [@ocaml.doc
        "Specifies the optional fields that you want returned in the response. Fields that you do \
         not specify are not returned.\n"]
}
[@@ocaml.doc ""]

type nonrec start_after = string [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec token = string [@@ocaml.doc ""]

type nonrec key_count = int [@@ocaml.doc ""]

type nonrec object_storage_class =
  | STANDARD [@ocaml.doc ""]
  | REDUCED_REDUNDANCY [@ocaml.doc ""]
  | GLACIER [@ocaml.doc ""]
  | STANDARD_IA [@ocaml.doc ""]
  | ONEZONE_IA [@ocaml.doc ""]
  | INTELLIGENT_TIERING [@ocaml.doc ""]
  | DEEP_ARCHIVE [@ocaml.doc ""]
  | OUTPOSTS [@ocaml.doc ""]
  | GLACIER_IR [@ocaml.doc ""]
  | SNOW [@ocaml.doc ""]
  | EXPRESS_ONEZONE [@ocaml.doc ""]
  | FSX_OPENZFS [@ocaml.doc ""]
  | FSX_ONTAP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_ = {
  key : object_key option;
      [@ocaml.doc
        "The name that you assign to an object. You use the object key to retrieve the object.\n"]
  last_modified : last_modified option; [@ocaml.doc "Creation date of the object.\n"]
  e_tag : e_tag option;
      [@ocaml.doc
        "The entity tag is a hash of the object. The ETag reflects changes only to the contents of \
         an object, not its metadata. The ETag may or may not be an MD5 digest of the object data. \
         Whether or not it is depends on how the object was created and how it is encrypted as \
         described below:\n\n\
        \ {ul\n\
        \       {-  Objects created by the PUT Object, POST Object, or Copy operation, or through \
         the Amazon Web Services Management Console, and are encrypted by SSE-S3 or plaintext, \
         have ETags that are an MD5 digest of their object data.\n\
        \           \n\
        \            }\n\
        \       {-  Objects created by the PUT Object, POST Object, or Copy operation, or through \
         the Amazon Web Services Management Console, and are encrypted by SSE-C or SSE-KMS, have \
         ETags that are not an MD5 digest of their object data.\n\
        \           \n\
        \            }\n\
        \       {-  If an object is created by either the Multipart Upload or Part Copy operation, \
         the ETag is not an MD5 digest, regardless of the method of encryption. If an object is \
         larger than 16 MB, the Amazon Web Services Management Console will upload or copy that \
         object as a Multipart Upload, and therefore the ETag will not be an MD5 digest.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \     {b Directory buckets} - MD5 is not supported by directory buckets.\n\
        \    \n\
        \     "]
  checksum_algorithm : checksum_algorithm_list option;
      [@ocaml.doc "The algorithm that was used to create a checksum of the object.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type that is used to calculate the object\226\128\153s checksum value. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  size : size option; [@ocaml.doc "Size in bytes of the object\n"]
  storage_class : object_storage_class option;
      [@ocaml.doc
        "The class of storage used to store the object.\n\n\
        \   {b Directory buckets} - Directory buckets only support [EXPRESS_ONEZONE] (the S3 \
         Express One Zone storage class) in Availability Zones and [ONEZONE_IA] (the S3 One \
         Zone-Infrequent Access storage class) in Dedicated Local Zones.\n\
        \  \n\
        \   "]
  owner : owner option;
      [@ocaml.doc
        "The owner of the object\n\n\
        \   {b Directory buckets} - The bucket owner is returned as the object owner.\n\
        \  \n\
        \   "]
  restore_status : restore_status option;
      [@ocaml.doc
        "Specifies the restoration status of an object. Objects in certain storage classes must be \
         restored before they can be retrieved. For more information about these storage classes \
         and how to work with archived objects, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/archived-objects.html} Working \
         with archived objects} in the {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets. Directory buckets only \
         support [EXPRESS_ONEZONE] (the S3 Express One Zone storage class) in Availability Zones \
         and [ONEZONE_IA] (the S3 One Zone-Infrequent Access storage class) in Dedicated Local \
         Zones.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "An object consists of data and its descriptive metadata.\n"]

type nonrec object_list = object_ list [@@ocaml.doc ""]

type nonrec list_objects_v2_output = {
  is_truncated : is_truncated option;
      [@ocaml.doc
        "Set to [false] if all of the results were returned. Set to [true] if more keys are \
         available to return. If the number of results exceeds that specified by [MaxKeys], all of \
         the results might not be returned.\n"]
  contents : object_list option; [@ocaml.doc "Metadata about each object returned.\n"]
  name : bucket_name option; [@ocaml.doc "The bucket name.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "Keys that begin with the indicated prefix.\n\n\
        \   {b Directory buckets} - For directory buckets, only prefixes that end in a delimiter \
         ([/]) are supported.\n\
        \  \n\
        \   "]
  delimiter : delimiter option;
      [@ocaml.doc
        "Causes keys that contain the same string between the [prefix] and the first occurrence of \
         the delimiter to be rolled up into a single result element in the [CommonPrefixes] \
         collection. These rolled-up keys are not returned elsewhere in the response. Each \
         rolled-up result counts as only one return against the [MaxKeys] value.\n\n\
        \   {b Directory buckets} - For directory buckets, [/] is the only supported delimiter.\n\
        \  \n\
        \   "]
  max_keys : max_keys option;
      [@ocaml.doc
        "Sets the maximum number of keys returned in the response. By default, the action returns \
         up to 1,000 key names. The response might contain fewer keys but will never contain more.\n"]
  common_prefixes : common_prefix_list option;
      [@ocaml.doc
        "All of the keys (up to 1,000) that share the same prefix are grouped together. When \
         counting the total numbers of returns by this API operation, this group of keys is \
         considered as one item.\n\n\
        \ A response can contain [CommonPrefixes] only if you specify a delimiter.\n\
        \ \n\
        \   [CommonPrefixes] contains all (if there are any) keys between [Prefix] and the next \
         occurrence of the string specified by a delimiter.\n\
        \  \n\
        \    [CommonPrefixes] lists keys that act like subdirectories in the directory specified \
         by [Prefix].\n\
        \   \n\
        \    For example, if the prefix is [notes/] and the delimiter is a slash ([/]) as in \
         [notes/summer/july], the common prefix is [notes/summer/]. All of the keys that roll up \
         into a common prefix count as a single return when calculating the number of returns. \n\
        \    \n\
        \      {ul\n\
        \            {-   {b Directory buckets} - For directory buckets, only prefixes that end in \
         a delimiter ([/]) are supported.\n\
        \                \n\
        \                 }\n\
        \            {-   {b Directory buckets } - When you query [ListObjectsV2] with a delimiter \
         during in-progress multipart uploads, the [CommonPrefixes] response parameter contains \
         the prefixes that are associated with the in-progress multipart uploads. For more \
         information about multipart uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html}Multipart Upload \
         Overview} in the {i Amazon S3 User Guide}.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   "]
  encoding_type : encoding_type option;
      [@ocaml.doc
        "Encoding type used by Amazon S3 to encode object key names in the XML response.\n\n\
        \ If you specify the [encoding-type] request parameter, Amazon S3 includes this element in \
         the response, and returns encoded key name values in the following response elements:\n\
        \ \n\
        \   [Delimiter, Prefix, Key,] and [StartAfter].\n\
        \  "]
  key_count : key_count option;
      [@ocaml.doc
        " [KeyCount] is the number of keys returned with this request. [KeyCount] will always be \
         less than or equal to the [MaxKeys] field. For example, if you ask for 50 keys, your \
         result will include 50 keys or fewer.\n"]
  continuation_token : token option;
      [@ocaml.doc
        " If [ContinuationToken] was sent with the request, it is included in the response. You \
         can use the returned [ContinuationToken] for pagination of the list response.\n"]
  next_continuation_token : next_token option;
      [@ocaml.doc
        " [NextContinuationToken] is sent when [isTruncated] is true, which means there are more \
         keys in the bucket that can be listed. The next list requests to Amazon S3 can be \
         continued with this [NextContinuationToken]. [NextContinuationToken] is obfuscated and is \
         not a real key\n"]
  start_after : start_after option;
      [@ocaml.doc
        "If StartAfter was sent with the request, it is included in the response.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec fetch_owner = bool [@@ocaml.doc ""]

type nonrec list_objects_v2_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
         {[\n\
        \ {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
         ]}\n\
         . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
         {[\n\
        \ {i bucket-base-name}--{i zone-id}--x-s3\n\
         ]}\n\
        \ (for example, \n\
         {[\n\
        \ {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
         ]}\n\
         ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   Object Lambda access points are not supported by directory buckets.\n\
        \   \n\
        \      {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \     {[\n\
        \      {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \     ]}\n\
        \     . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \     "]
  delimiter : delimiter option;
      [@ocaml.doc
        "A delimiter is a character that you use to group keys.\n\n\
        \  [CommonPrefixes] is filtered out from results if it is not lexicographically greater \
         than the [StartAfter] value.\n\
        \ \n\
        \   {ul\n\
        \         {-   {b Directory buckets} - For directory buckets, [/] is the only supported \
         delimiter.\n\
        \             \n\
        \              }\n\
        \         {-   {b Directory buckets } - When you query [ListObjectsV2] with a delimiter \
         during in-progress multipart uploads, the [CommonPrefixes] response parameter contains \
         the prefixes that are associated with the in-progress multipart uploads. For more \
         information about multipart uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html}Multipart Upload \
         Overview} in the {i Amazon S3 User Guide}.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  encoding_type : encoding_type option;
      [@ocaml.doc
        "Encoding type used by Amazon S3 to encode the \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html}object keys} in \
         the response. Responses are encoded only in UTF-8. An object key can contain any Unicode \
         character. However, the XML 1.0 parser can't parse certain characters, such as characters \
         with an ASCII value from 0 to 10. For characters that aren't supported in XML 1.0, you \
         can add this parameter to request that Amazon S3 encode the keys in the response. For \
         more information about characters to avoid in object key names, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-guidelines}Object \
         key naming guidelines}.\n\n\
        \  When using the URL encoding type, non-ASCII characters that are used in an object's key \
         name will be percent-encoded according to UTF-8 code values. For example, the object \
         [test_file(3).png] will appear as [test_file%283%29.png].\n\
        \  \n\
        \   "]
  max_keys : max_keys option;
      [@ocaml.doc
        "Sets the maximum number of keys returned in the response. By default, the action returns \
         up to 1,000 key names. The response might contain fewer keys but will never contain more.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "Limits the response to keys that begin with the specified prefix.\n\n\
        \   {b Directory buckets} - For directory buckets, only prefixes that end in a delimiter \
         ([/]) are supported.\n\
        \  \n\
        \   "]
  continuation_token : token option;
      [@ocaml.doc
        " [ContinuationToken] indicates to Amazon S3 that the list is being continued on this \
         bucket with a token. [ContinuationToken] is obfuscated and is not a real key. You can use \
         this [ContinuationToken] for pagination of the list results. \n"]
  fetch_owner : fetch_owner option;
      [@ocaml.doc
        "The owner field is not present in [ListObjectsV2] by default. If you want to return the \
         owner field with each key in the result, then set the [FetchOwner] field to [true].\n\n\
        \   {b Directory buckets} - For directory buckets, the bucket owner is returned as the \
         object owner for all objects.\n\
        \  \n\
        \   "]
  start_after : start_after option;
      [@ocaml.doc
        "StartAfter is where you want Amazon S3 to start listing from. Amazon S3 starts listing \
         after this specified key. StartAfter can be any key in the bucket.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_payer : request_payer option;
      [@ocaml.doc
        "Confirms that the requester knows that she or he will be charged for the list objects \
         request in V2 style. Bucket owners need not specify this parameter in their requests.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  optional_object_attributes : optional_object_attributes_list option;
      [@ocaml.doc
        "Specifies the optional fields that you want returned in the response. Fields that you do \
         not specify are not returned.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec next_marker = string [@@ocaml.doc ""]

type nonrec marker = string [@@ocaml.doc ""]

type nonrec list_objects_output = {
  is_truncated : is_truncated option;
      [@ocaml.doc
        "A flag that indicates whether Amazon S3 returned all of the results that satisfied the \
         search criteria.\n"]
  marker : marker option;
      [@ocaml.doc
        "Indicates where in the bucket listing begins. Marker is included in the response if it \
         was sent with the request.\n"]
  next_marker : next_marker option;
      [@ocaml.doc
        "When the response is truncated (the [IsTruncated] element value in the response is \
         [true]), you can use the key name in this field as the [marker] parameter in the \
         subsequent request to get the next set of objects. Amazon S3 lists objects in \
         alphabetical order. \n\n\
        \  This element is returned only if you have the [delimiter] request parameter specified. \
         If the response does not include the [NextMarker] element and it is truncated, you can \
         use the value of the last [Key] element in the response as the [marker] parameter in the \
         subsequent request to get the next set of object keys.\n\
        \  \n\
        \   "]
  contents : object_list option; [@ocaml.doc "Metadata about each object returned.\n"]
  name : bucket_name option; [@ocaml.doc "The bucket name.\n"]
  prefix : prefix option; [@ocaml.doc "Keys that begin with the indicated prefix.\n"]
  delimiter : delimiter option;
      [@ocaml.doc
        "Causes keys that contain the same string between the prefix and the first occurrence of \
         the delimiter to be rolled up into a single result element in the [CommonPrefixes] \
         collection. These rolled-up keys are not returned elsewhere in the response. Each \
         rolled-up result counts as only one return against the [MaxKeys] value.\n"]
  max_keys : max_keys option;
      [@ocaml.doc "The maximum number of keys returned in the response body.\n"]
  common_prefixes : common_prefix_list option;
      [@ocaml.doc
        "All of the keys (up to 1,000) rolled up in a common prefix count as a single return when \
         calculating the number of returns. \n\n\
        \ A response can contain [CommonPrefixes] only if you specify a delimiter.\n\
        \ \n\
        \   [CommonPrefixes] contains all (if there are any) keys between [Prefix] and the next \
         occurrence of the string specified by the delimiter.\n\
        \  \n\
        \    [CommonPrefixes] lists keys that act like subdirectories in the directory specified \
         by [Prefix].\n\
        \   \n\
        \    For example, if the prefix is [notes/] and the delimiter is a slash ([/]), as in \
         [notes/summer/july], the common prefix is [notes/summer/]. All of the keys that roll up \
         into a common prefix count as a single return when calculating the number of returns.\n\
        \    "]
  encoding_type : encoding_type option;
      [@ocaml.doc
        "Encoding type used by Amazon S3 to encode the \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html}object keys} in \
         the response. Responses are encoded only in UTF-8. An object key can contain any Unicode \
         character. However, the XML 1.0 parser can't parse certain characters, such as characters \
         with an ASCII value from 0 to 10. For characters that aren't supported in XML 1.0, you \
         can add this parameter to request that Amazon S3 encode the keys in the response. For \
         more information about characters to avoid in object key names, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-guidelines}Object \
         key naming guidelines}.\n\n\
        \  When using the URL encoding type, non-ASCII characters that are used in an object's key \
         name will be percent-encoded according to UTF-8 code values. For example, the object \
         [test_file(3).png] will appear as [test_file%283%29.png].\n\
        \  \n\
        \   "]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_objects_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the objects.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  delimiter : delimiter option;
      [@ocaml.doc
        "A delimiter is a character that you use to group keys.\n\n\
        \  [CommonPrefixes] is filtered out from results if it is not lexicographically greater \
         than the key-marker.\n\
        \ "]
  encoding_type : encoding_type option; [@ocaml.doc ""]
  marker : marker option;
      [@ocaml.doc
        "Marker is where you want Amazon S3 to start listing from. Amazon S3 starts listing after \
         this specified key. Marker can be any key in the bucket.\n"]
  max_keys : max_keys option;
      [@ocaml.doc
        "Sets the maximum number of keys returned in the response. By default, the action returns \
         up to 1,000 key names. The response might contain fewer keys but will never contain more. \n"]
  prefix : prefix option;
      [@ocaml.doc "Limits the response to keys that begin with the specified prefix.\n"]
  request_payer : request_payer option;
      [@ocaml.doc
        "Confirms that the requester knows that she or he will be charged for the list objects \
         request. Bucket owners need not specify this parameter in their requests.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  optional_object_attributes : optional_object_attributes_list option;
      [@ocaml.doc
        "Specifies the optional fields that you want returned in the response. Fields that you do \
         not specify are not returned.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_prefix = unit [@@ocaml.doc ""]

type nonrec annotation_count = int [@@ocaml.doc ""]

type nonrec max_annotation_results = int [@@ocaml.doc ""]

type nonrec annotation_prefix = string [@@ocaml.doc ""]

type nonrec annotation_entry = {
  annotation_name : annotation_name; [@ocaml.doc "The name of the annotation.\n"]
  last_modified : last_modified;
      [@ocaml.doc "The date and time the annotation was last modified.\n"]
  e_tag : e_tag option; [@ocaml.doc "The entity tag of the annotation.\n"]
  checksum_algorithm : checksum_algorithm_list option;
      [@ocaml.doc "The checksum algorithm used for the annotation.\n"]
  size : size; [@ocaml.doc "The size of the annotation payload, in bytes.\n"]
  replication_status : replication_status option;
      [@ocaml.doc "The replication status of the annotation.\n"]
}
[@@ocaml.doc
  "Describes a single annotation attached to an object, including its name, last modified time, \
   size, ETag, checksum algorithm, and replication status. Returned in the response from \
   [ListObjectAnnotations].\n"]

type nonrec annotation_list = annotation_entry list [@@ocaml.doc ""]

type nonrec list_object_annotations_output = {
  annotations : annotation_list option;
      [@ocaml.doc "The list of annotations attached to the object.\n"]
  bucket : bucket_name option; [@ocaml.doc "The bucket name.\n"]
  key : object_key option; [@ocaml.doc "The object key.\n"]
  object_version_id : object_version_id option; [@ocaml.doc "The version ID of the object.\n"]
  annotation_prefix : annotation_prefix option;
      [@ocaml.doc "The prefix used to filter the response.\n"]
  max_annotation_results : max_annotation_results option;
      [@ocaml.doc "The maximum number of annotations returned in the response.\n"]
  annotation_count : annotation_count option; [@ocaml.doc "The number of annotations returned.\n"]
  continuation_token : token option; [@ocaml.doc "The continuation token used in this request.\n"]
  next_continuation_token : next_token option;
      [@ocaml.doc "The continuation token to use to retrieve the next page of results.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_object_annotations_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the bucket that contains the object.\n"]
  key : object_key; [@ocaml.doc "The object key.\n"]
  version_id : object_version_id option; [@ocaml.doc "The version ID of the object.\n"]
  max_annotation_results : max_annotation_results option;
      [@ocaml.doc
        "The maximum number of annotations to return in the response. Maximum is 1,000.\n"]
  annotation_prefix : annotation_prefix option;
      [@ocaml.doc "Filter results to annotations whose name begins with the specified prefix.\n"]
  continuation_token : token option;
      [@ocaml.doc "Continuation token returned by a previous request to retrieve the next page.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc "The account ID of the expected bucket owner.\n"]
}
[@@ocaml.doc ""]

type nonrec initiated = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec multipart_upload = {
  upload_id : multipart_upload_id option;
      [@ocaml.doc "Upload ID that identifies the multipart upload.\n"]
  key : object_key option;
      [@ocaml.doc "Key of the object for which the multipart upload was initiated.\n"]
  initiated : initiated option;
      [@ocaml.doc "Date and time at which the multipart upload was initiated.\n"]
  storage_class : storage_class option;
      [@ocaml.doc
        "The class of storage used to store the object.\n\n\
        \   {b Directory buckets} - Directory buckets only support [EXPRESS_ONEZONE] (the S3 \
         Express One Zone storage class) in Availability Zones and [ONEZONE_IA] (the S3 One \
         Zone-Infrequent Access storage class) in Dedicated Local Zones.\n\
        \  \n\
        \   "]
  owner : owner option;
      [@ocaml.doc
        "Specifies the owner of the object that is part of the multipart upload. \n\n\
        \   {b Directory buckets} - The bucket owner is returned as the object owner for all the \
         objects.\n\
        \  \n\
        \   "]
  initiator : initiator option; [@ocaml.doc "Identifies who initiated the multipart upload.\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc "The algorithm that was used to create a checksum of the object.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type that is used to calculate the object\226\128\153s checksum value. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc "Container for the [MultipartUpload] for the Amazon S3 object.\n"]

type nonrec multipart_upload_list = multipart_upload list [@@ocaml.doc ""]

type nonrec max_uploads = int [@@ocaml.doc ""]

type nonrec next_upload_id_marker = string [@@ocaml.doc ""]

type nonrec upload_id_marker = string [@@ocaml.doc ""]

type nonrec list_multipart_uploads_output = {
  bucket : bucket_name option;
      [@ocaml.doc
        "The name of the bucket to which the multipart upload was initiated. Does not return the \
         access point ARN or access point alias if used.\n"]
  key_marker : key_marker option; [@ocaml.doc "The key at or after which the listing began.\n"]
  upload_id_marker : upload_id_marker option;
      [@ocaml.doc
        "Together with key-marker, specifies the multipart upload after which listing should \
         begin. If key-marker is not specified, the upload-id-marker parameter is ignored. \
         Otherwise, any multipart uploads for a key equal to the key-marker might be included in \
         the list only if they have an upload ID lexicographically greater than the specified \
         [upload-id-marker].\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  next_key_marker : next_key_marker option;
      [@ocaml.doc
        "When a list is truncated, this element specifies the value that should be used for the \
         key-marker request parameter in a subsequent request.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "When a prefix is provided in the request, this field contains the specified prefix. The \
         result contains only keys starting with the specified prefix.\n\n\
        \   {b Directory buckets} - For directory buckets, only prefixes that end in a delimiter \
         ([/]) are supported.\n\
        \  \n\
        \   "]
  delimiter : delimiter option;
      [@ocaml.doc
        "Contains the delimiter you specified in the request. If you don't specify a delimiter in \
         your request, this element is absent from the response.\n\n\
        \   {b Directory buckets} - For directory buckets, [/] is the only supported delimiter.\n\
        \  \n\
        \   "]
  next_upload_id_marker : next_upload_id_marker option;
      [@ocaml.doc
        "When a list is truncated, this element specifies the value that should be used for the \
         [upload-id-marker] request parameter in a subsequent request.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  max_uploads : max_uploads option;
      [@ocaml.doc
        "Maximum number of multipart uploads that could have been included in the response.\n"]
  is_truncated : is_truncated option;
      [@ocaml.doc
        "Indicates whether the returned list of multipart uploads is truncated. A value of true \
         indicates that the list was truncated. The list can be truncated if the number of \
         multipart uploads exceeds the limit allowed or specified by max uploads.\n"]
  uploads : multipart_upload_list option;
      [@ocaml.doc
        "Container for elements related to a particular multipart upload. A response can contain \
         zero or more [Upload] elements.\n"]
  common_prefixes : common_prefix_list option;
      [@ocaml.doc
        "If you specify a delimiter in the request, then the result returns each distinct key \
         prefix containing the delimiter in a [CommonPrefixes] element. The distinct key prefixes \
         are returned in the [Prefix] child element.\n\n\
        \   {b Directory buckets} - For directory buckets, only prefixes that end in a delimiter \
         ([/]) are supported.\n\
        \  \n\
        \   "]
  encoding_type : encoding_type option;
      [@ocaml.doc
        "Encoding type used by Amazon S3 to encode object keys in the response.\n\n\
        \ If you specify the [encoding-type] request parameter, Amazon S3 includes this element in \
         the response, and returns encoded key name values in the following response elements:\n\
        \ \n\
        \   [Delimiter], [KeyMarker], [Prefix], [NextKeyMarker], [Key].\n\
        \  "]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_multipart_uploads_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket to which the multipart upload was initiated. \n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  delimiter : delimiter option;
      [@ocaml.doc
        "Character you use to group keys.\n\n\
        \ All keys that contain the same string between the prefix, if specified, and the first \
         occurrence of the delimiter after the prefix are grouped under a single result element, \
         [CommonPrefixes]. If you don't specify the prefix parameter, then the substring starts at \
         the beginning of the key. The keys that are grouped under [CommonPrefixes] result element \
         are not returned elsewhere in the response.\n\
        \ \n\
        \   [CommonPrefixes] is filtered out from results if it is not lexicographically greater \
         than the key-marker.\n\
        \  \n\
        \     {b Directory buckets} - For directory buckets, [/] is the only supported delimiter.\n\
        \    \n\
        \     "]
  encoding_type : encoding_type option; [@ocaml.doc ""]
  key_marker : key_marker option;
      [@ocaml.doc
        "Specifies the multipart upload after which listing should begin.\n\n\
        \  {ul\n\
        \        {-   {b General purpose buckets} - For general purpose buckets, [key-marker] is \
         an object key. Together with [upload-id-marker], this parameter specifies the multipart \
         upload after which listing should begin.\n\
        \            \n\
        \             If [upload-id-marker] is not specified, only the keys lexicographically \
         greater than the specified [key-marker] will be included in the list.\n\
        \             \n\
        \              If [upload-id-marker] is specified, any multipart uploads for a key equal \
         to the [key-marker] might also be included, provided those multipart uploads have upload \
         IDs lexicographically greater than the specified [upload-id-marker].\n\
        \              \n\
        \               }\n\
        \        {-   {b Directory buckets} - For directory buckets, [key-marker] is obfuscated \
         and isn't a real object key. The [upload-id-marker] parameter isn't supported by \
         directory buckets. To list the additional multipart uploads, you only need to set the \
         value of [key-marker] to the [NextKeyMarker] value from the previous response. \n\
        \            \n\
        \             In the [ListMultipartUploads] response, the multipart uploads aren't sorted \
         lexicographically based on the object keys. \n\
        \             \n\
        \              }\n\
        \        }\n\
        \   "]
  max_uploads : max_uploads option;
      [@ocaml.doc
        "Sets the maximum number of multipart uploads, from 1 to 1,000, to return in the response \
         body. 1,000 is the maximum number of uploads that can be returned in a response.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "Lists in-progress uploads only for those keys that begin with the specified prefix. You \
         can use prefixes to separate a bucket into different grouping of keys. (You can think of \
         using [prefix] to make groups in the same way that you'd use a folder in a file system.)\n\n\
        \   {b Directory buckets} - For directory buckets, only prefixes that end in a delimiter \
         ([/]) are supported.\n\
        \  \n\
        \   "]
  upload_id_marker : upload_id_marker option;
      [@ocaml.doc
        "Together with key-marker, specifies the multipart upload after which listing should \
         begin. If key-marker is not specified, the upload-id-marker parameter is ignored. \
         Otherwise, any multipart uploads for a key equal to the key-marker might be included in \
         the list only if they have an upload ID lexicographically greater than the specified \
         [upload-id-marker].\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec directory_bucket_token = string [@@ocaml.doc ""]

type nonrec s3_regional_or_s3_express_bucket_arn_string = string [@@ocaml.doc ""]

type nonrec bucket_region = string [@@ocaml.doc ""]

type nonrec creation_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec bucket = {
  name : bucket_name option; [@ocaml.doc "The name of the bucket.\n"]
  creation_date : creation_date option;
      [@ocaml.doc
        "Date the bucket was created. This date can change when making changes to your bucket, \
         such as editing its bucket policy.\n"]
  bucket_region : bucket_region option;
      [@ocaml.doc
        " [BucketRegion] indicates the Amazon Web Services region where the bucket is located. If \
         the request contains at least one valid parameter, it is included in the response.\n"]
  bucket_arn : s3_regional_or_s3_express_bucket_arn_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web \
         Services resources across all of Amazon Web Services.\n\n\
        \  This parameter is only supported for S3 directory buckets. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-tagging.html}Using \
         tags with directory buckets}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc " In terms of implementation, a Bucket is a resource. \n"]

type nonrec buckets = bucket list [@@ocaml.doc ""]

type nonrec list_directory_buckets_output = {
  buckets : buckets option; [@ocaml.doc "The list of buckets owned by the requester. \n"]
  continuation_token : directory_bucket_token option;
      [@ocaml.doc
        "If [ContinuationToken] was sent with the request, it is included in the response. You can \
         use the returned [ContinuationToken] for pagination of the list response.\n"]
}
[@@ocaml.doc ""]

type nonrec max_directory_buckets = int [@@ocaml.doc ""]

type nonrec list_directory_buckets_request = {
  continuation_token : directory_bucket_token option;
      [@ocaml.doc
        " [ContinuationToken] indicates to Amazon S3 that the list is being continued on buckets \
         in this account with a token. [ContinuationToken] is obfuscated and is not a real bucket \
         name. You can use this [ContinuationToken] for the pagination of the list results. \n"]
  max_directory_buckets : max_directory_buckets option;
      [@ocaml.doc
        "Maximum number of buckets to be returned in response. When the number is more than the \
         count of buckets that are owned by an Amazon Web Services account, return all the buckets \
         in response.\n"]
}
[@@ocaml.doc ""]

type nonrec list_buckets_output = {
  buckets : buckets option; [@ocaml.doc "The list of buckets owned by the requester.\n"]
  owner : owner option; [@ocaml.doc "The owner of the buckets listed.\n"]
  continuation_token : next_token option;
      [@ocaml.doc
        " [ContinuationToken] is included in the response when there are more buckets that can be \
         listed with pagination. The next [ListBuckets] request to Amazon S3 can be continued with \
         this [ContinuationToken]. [ContinuationToken] is obfuscated and is not a real bucket.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "If [Prefix] was sent with the request, it is included in the response.\n\n\
        \ All bucket names in the response begin with the specified bucket name prefix.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec max_buckets = int [@@ocaml.doc ""]

type nonrec list_buckets_request = {
  max_buckets : max_buckets option;
      [@ocaml.doc
        "Maximum number of buckets to be returned in response. When the number is more than the \
         count of buckets that are owned by an Amazon Web Services account, return all the buckets \
         in response.\n"]
  continuation_token : token option;
      [@ocaml.doc
        " [ContinuationToken] indicates to Amazon S3 that the list is being continued on this \
         bucket with a token. [ContinuationToken] is obfuscated and is not a real key. You can use \
         this [ContinuationToken] for pagination of the list results. \n\n\
        \ Length Constraints: Minimum length of 0. Maximum length of 1024.\n\
        \ \n\
        \  Required: No.\n\
        \  \n\
        \    If you specify the [bucket-region], [prefix], or [continuation-token] query \
         parameters without using [max-buckets] to set the maximum number of buckets returned in \
         the response, Amazon S3 applies a default page size of 10,000 and provides a continuation \
         token if there are more buckets.\n\
        \    \n\
        \     "]
  prefix : prefix option;
      [@ocaml.doc
        "Limits the response to bucket names that begin with the specified bucket name prefix.\n"]
  bucket_region : bucket_region option;
      [@ocaml.doc
        "Limits the response to buckets that are located in the specified Amazon Web Services \
         Region. The Amazon Web Services Region must be expressed according to the Amazon Web \
         Services Region code, such as [us-west-2] for the US West (Oregon) Region. For a list of \
         the valid values for all of the Amazon Web Services Regions, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region}Regions and \
         Endpoints}.\n\n\
        \  Requests made to a Regional endpoint that is different from the [bucket-region] \
         parameter are not supported. For example, if you want to limit the response to your \
         buckets in Region [us-west-2], the request must be made to an endpoint in Region \
         [us-west-2].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec metrics_configuration_list = metrics_configuration list [@@ocaml.doc ""]

type nonrec list_bucket_metrics_configurations_output = {
  is_truncated : is_truncated option;
      [@ocaml.doc
        "Indicates whether the returned list of metrics configurations is complete. A value of \
         true indicates that the list is not complete and the NextContinuationToken will be \
         provided for a subsequent request.\n"]
  continuation_token : token option;
      [@ocaml.doc
        "The marker that is used as a starting point for this metrics configuration list response. \
         This value is present if it was sent in the request.\n"]
  next_continuation_token : next_token option;
      [@ocaml.doc
        "The marker used to continue a metrics configuration listing that has been truncated. Use \
         the [NextContinuationToken] from a previously truncated list response to continue the \
         listing. The continuation token is an opaque value that Amazon S3 understands.\n"]
  metrics_configuration_list : metrics_configuration_list option;
      [@ocaml.doc "The list of metrics configurations for a bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec list_bucket_metrics_configurations_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the metrics configurations to retrieve.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  continuation_token : token option;
      [@ocaml.doc
        "The marker that is used to continue a metrics configuration listing that has been \
         truncated. Use the [NextContinuationToken] from a previously truncated list response to \
         continue the listing. The continuation token is an opaque value that Amazon S3 \
         understands.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec inventory_configuration_list = inventory_configuration list [@@ocaml.doc ""]

type nonrec list_bucket_inventory_configurations_output = {
  continuation_token : token option;
      [@ocaml.doc
        "If sent in the request, the marker that is used as a starting point for this inventory \
         configuration list response.\n"]
  inventory_configuration_list : inventory_configuration_list option;
      [@ocaml.doc "The list of inventory configurations for a bucket.\n"]
  is_truncated : is_truncated option;
      [@ocaml.doc
        "Tells whether the returned list of inventory configurations is complete. A value of true \
         indicates that the list is not complete and the NextContinuationToken is provided for a \
         subsequent request.\n"]
  next_continuation_token : next_token option;
      [@ocaml.doc
        "The marker used to continue this inventory configuration listing. Use the \
         [NextContinuationToken] from this response to continue the listing in a subsequent \
         request. The continuation token is an opaque value that Amazon S3 understands.\n"]
}
[@@ocaml.doc ""]

type nonrec list_bucket_inventory_configurations_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the inventory configurations to retrieve.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  continuation_token : token option;
      [@ocaml.doc
        "The marker used to continue an inventory configuration listing that has been truncated. \
         Use the [NextContinuationToken] from a previously truncated list response to continue the \
         listing. The continuation token is an opaque value that Amazon S3 understands.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec intelligent_tiering_configuration_list = intelligent_tiering_configuration list
[@@ocaml.doc ""]

type nonrec list_bucket_intelligent_tiering_configurations_output = {
  is_truncated : is_truncated option;
      [@ocaml.doc
        "Indicates whether the returned list of analytics configurations is complete. A value of \
         [true] indicates that the list is not complete and the [NextContinuationToken] will be \
         provided for a subsequent request.\n"]
  continuation_token : token option;
      [@ocaml.doc
        "The [ContinuationToken] that represents a placeholder from where this request should begin.\n"]
  next_continuation_token : next_token option;
      [@ocaml.doc
        "The marker used to continue this inventory configuration listing. Use the \
         [NextContinuationToken] from this response to continue the listing in a subsequent \
         request. The continuation token is an opaque value that Amazon S3 understands.\n"]
  intelligent_tiering_configuration_list : intelligent_tiering_configuration_list option;
      [@ocaml.doc "The list of S3 Intelligent-Tiering configurations for a bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec list_bucket_intelligent_tiering_configurations_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.\n"]
  continuation_token : token option;
      [@ocaml.doc
        "The [ContinuationToken] that represents a placeholder from where this request should begin.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec analytics_configuration_list = analytics_configuration list [@@ocaml.doc ""]

type nonrec list_bucket_analytics_configurations_output = {
  is_truncated : is_truncated option;
      [@ocaml.doc
        "Indicates whether the returned list of analytics configurations is complete. A value of \
         true indicates that the list is not complete and the NextContinuationToken will be \
         provided for a subsequent request.\n"]
  continuation_token : token option;
      [@ocaml.doc
        "The marker that is used as a starting point for this analytics configuration list \
         response. This value is present if it was sent in the request.\n"]
  next_continuation_token : next_token option;
      [@ocaml.doc
        " [NextContinuationToken] is sent when [isTruncated] is true, which indicates that there \
         are more analytics configurations to list. The next request must include this \
         [NextContinuationToken]. The token is obfuscated and is not a usable value.\n"]
  analytics_configuration_list : analytics_configuration_list option;
      [@ocaml.doc "The list of analytics configurations for a bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec list_bucket_analytics_configurations_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket from which analytics configurations are retrieved.\n"]
  continuation_token : token option;
      [@ocaml.doc
        "The [ContinuationToken] that represents a placeholder from where this request should begin.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec not_found = unit [@@ocaml.doc ""]

type nonrec archive_status = ARCHIVE_ACCESS [@ocaml.doc ""] | DEEP_ARCHIVE_ACCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec head_object_output = {
  delete_marker : delete_marker option;
      [@ocaml.doc
        "Specifies whether the object retrieved was (true) or was not (false) a Delete Marker. If \
         false, this response header does not appear in the response.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  accept_ranges : accept_ranges option;
      [@ocaml.doc "Indicates that a range of bytes was specified.\n"]
  expiration : expiration option;
      [@ocaml.doc
        "If the object expiration is configured (see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html} \
         [PutBucketLifecycleConfiguration] }), the response includes this header. It includes the \
         [expiry-date] and [rule-id] key-value pairs providing object expiration information. The \
         value of the [rule-id] is URL-encoded.\n\n\
        \  Object expiration information is not returned in directory buckets and this header \
         returns the value \"[NotImplemented]\" in all responses for directory buckets.\n\
        \  \n\
        \   "]
  restore : restore option;
      [@ocaml.doc
        "If the object is an archived object (an object whose storage class is GLACIER), the \
         response includes this header if either the archive restoration is in progress (see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html}RestoreObject} \
         or an archive copy is already restored.\n\n\
        \  If an archive copy is already restored, the header value indicates when Amazon S3 is \
         scheduled to delete the object copy. For example:\n\
        \ \n\
        \   [x-amz-restore: ongoing-request=\"false\", expiry-date=\"Fri, 21 Dec 2012 00:00:00\n\
        \      GMT\"] \n\
        \  \n\
        \   If the object restoration is in progress, the header returns the value \
         [ongoing-request=\"true\"].\n\
        \   \n\
        \    For more information about archiving objects, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html#lifecycle-transition-general-considerations}Transitioning \
         Objects: General Considerations}.\n\
        \    \n\
        \      This functionality is not supported for directory buckets. Directory buckets only \
         support [EXPRESS_ONEZONE] (the S3 Express One Zone storage class) in Availability Zones \
         and [ONEZONE_IA] (the S3 One Zone-Infrequent Access storage class) in Dedicated Local \
         Zones.\n\
        \      \n\
        \       "]
  archive_status : archive_status option;
      [@ocaml.doc
        "The archive state of the head object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  last_modified : last_modified option;
      [@ocaml.doc "Date and time when the object was last modified.\n"]
  content_length : content_length option; [@ocaml.doc "Size of the body in bytes.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32 checksum] of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] digest of the object. This checksum is only present if \
         the checksum was uploaded with the object. When you use the API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] digest of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type, which determines how part-level checksums are combined to create an \
         object-level checksum for multipart objects. You can use this header response to verify \
         that the checksum type that is received is the same checksum type that was specified in \
         [CreateMultipartUpload] request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  e_tag : e_tag option;
      [@ocaml.doc
        "An entity tag (ETag) is an opaque identifier assigned by a web server to a specific \
         version of a resource found at a URL.\n"]
  missing_meta : missing_meta option;
      [@ocaml.doc
        "This is set to the number of metadata entries not returned in [x-amz-meta] headers. This \
         can happen if you create metadata using an API like SOAP that supports more flexible \
         metadata than the REST API. For example, using SOAP, you can create metadata whose values \
         are not legal HTTP headers.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID of the object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  cache_control : cache_control option;
      [@ocaml.doc "Specifies caching behavior along the request/reply chain.\n"]
  content_disposition : content_disposition option;
      [@ocaml.doc "Specifies presentational information for the object.\n"]
  content_encoding : content_encoding option;
      [@ocaml.doc
        "Indicates what content encodings have been applied to the object and thus what decoding \
         mechanisms must be applied to obtain the media-type referenced by the Content-Type header \
         field.\n"]
  content_language : content_language option; [@ocaml.doc "The language the content is in.\n"]
  content_type : content_type option;
      [@ocaml.doc "A standard MIME type describing the format of the object data.\n"]
  content_range : content_range option;
      [@ocaml.doc "The portion of the object returned in the response for a [GET] request.\n"]
  expires : expires option;
      [@ocaml.doc "The date and time at which the object is no longer cacheable.\n"]
  website_redirect_location : website_redirect_location option;
      [@ocaml.doc
        "If the bucket is configured as a website, redirects requests for this object to another \
         object in the same bucket or to an external URL. Amazon S3 stores the value of this \
         header in the object metadata.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  metadata : metadata option; [@ocaml.doc "A map of metadata to store with the object in S3.\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to confirm the encryption algorithm that's used.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to provide the round-trip message integrity \
         verification of the customer-provided encryption key.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the object uses an S3 Bucket Key for server-side encryption with Key \
         Management Service (KMS) keys (SSE-KMS).\n"]
  storage_class : storage_class option;
      [@ocaml.doc
        "Provides storage class information of the object. Amazon S3 returns this header for all \
         objects except for S3 Standard storage class objects.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html}Storage \
         Classes}.\n\
        \ \n\
        \    {b Directory buckets } - Directory buckets only support [EXPRESS_ONEZONE] (the S3 \
         Express One Zone storage class) in Availability Zones and [ONEZONE_IA] (the S3 One \
         Zone-Infrequent Access storage class) in Dedicated Local Zones.\n\
        \   \n\
        \    "]
  request_charged : request_charged option; [@ocaml.doc ""]
  replication_status : replication_status option;
      [@ocaml.doc
        "Amazon S3 can return this header if your request involves a bucket that is either a \
         source or a destination in a replication rule.\n\n\
        \ In replication, you have a source bucket on which you configure replication and \
         destination bucket or buckets where Amazon S3 stores object replicas. When you request an \
         object ([GetObject]) or object metadata ([HeadObject]) from these buckets, Amazon S3 will \
         return the [x-amz-replication-status] header in the response as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b If requesting an object from the source bucket}, Amazon S3 will return \
         the [x-amz-replication-status] header if the object in your request is eligible for \
         replication.\n\
        \            \n\
        \              For example, suppose that in your replication configuration, you specify \
         object prefix [TaxDocs] requesting Amazon S3 to replicate objects with key prefix \
         [TaxDocs]. Any objects you upload with this key name prefix, for example \
         [TaxDocs/document1.pdf], are eligible for replication. For any object request with this \
         key name prefix, Amazon S3 will return the [x-amz-replication-status] header with value \
         PENDING, COMPLETED or FAILED indicating object replication status.\n\
        \             \n\
        \              }\n\
        \        {-   {b If requesting an object from a destination bucket}, Amazon S3 will return \
         the [x-amz-replication-status] header with value REPLICA if the object in your request is \
         a replica that Amazon S3 created and there is no replica modification replication in \
         progress.\n\
        \            \n\
        \             }\n\
        \        {-   {b When replicating objects to multiple destination buckets}, the \
         [x-amz-replication-status] header acts differently. The header of the source object will \
         only return a value of COMPLETED when replication is successful to all destinations. The \
         header will remain at value PENDING until replication has completed for all destinations. \
         If one or more destinations fails replication the header will return FAILED. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html}Replication}.\n\
        \   \n\
        \     This functionality is not supported for directory buckets.\n\
        \     \n\
        \      "]
  parts_count : parts_count option;
      [@ocaml.doc
        "The count of parts this object has. This value is only returned if you specify \
         [partNumber] in your request and the object was uploaded as a multipart upload.\n"]
  tag_count : tag_count option;
      [@ocaml.doc
        "The number of tags, if any, on the object, when you have the relevant permission to read \
         object tags.\n\n\
        \ You can use \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html}GetObjectTagging} \
         to retrieve the tag set associated with an object.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  object_lock_mode : object_lock_mode option;
      [@ocaml.doc
        "The Object Lock mode, if any, that's in effect for this object. This header is only \
         returned if the requester has the [s3:GetObjectRetention] permission. For more \
         information about S3 Object Lock, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html}Object Lock}. \n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_retain_until_date : object_lock_retain_until_date option;
      [@ocaml.doc
        "The date and time when the Object Lock retention period expires. This header is only \
         returned if the requester has the [s3:GetObjectRetention] permission.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_legal_hold_status : object_lock_legal_hold_status option;
      [@ocaml.doc
        "Specifies whether a legal hold is in effect for this object. This header is only returned \
         if the requester has the [s3:GetObjectLegalHold] permission. This header is not returned \
         if the specified version of this object has never had a legal hold applied. For more \
         information about S3 Object Lock, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lock.html}Object Lock}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec checksum_mode = ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec response_expires = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec response_content_type = string [@@ocaml.doc ""]

type nonrec response_content_language = string [@@ocaml.doc ""]

type nonrec response_content_encoding = string [@@ocaml.doc ""]

type nonrec response_content_disposition = string [@@ocaml.doc ""]

type nonrec response_cache_control = string [@@ocaml.doc ""]

type nonrec range = string [@@ocaml.doc ""]

type nonrec head_object_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket that contains the object.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  if_match : if_match option;
      [@ocaml.doc
        "Return the object only if its entity tag (ETag) is the same as the one specified; \
         otherwise, return a 412 (precondition failed) error.\n\n\
        \ If both of the [If-Match] and [If-Unmodified-Since] headers are present in the request \
         as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   [If-Match] condition evaluates to [true], and;\n\
        \            \n\
        \             }\n\
        \        {-   [If-Unmodified-Since] condition evaluates to [false];\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Then Amazon S3 returns [200 OK] and the data requested.\n\
        \   \n\
        \    For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \    "]
  if_modified_since : if_modified_since option;
      [@ocaml.doc
        "Return the object only if it has been modified since the specified time; otherwise, \
         return a 304 (not modified) error.\n\n\
        \ If both of the [If-None-Match] and [If-Modified-Since] headers are present in the \
         request as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   [If-None-Match] condition evaluates to [false], and;\n\
        \            \n\
        \             }\n\
        \        {-   [If-Modified-Since] condition evaluates to [true];\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Then Amazon S3 returns the [304 Not Modified] response code.\n\
        \   \n\
        \    For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \    "]
  if_none_match : if_none_match option;
      [@ocaml.doc
        "Return the object only if its entity tag (ETag) is different from the one specified; \
         otherwise, return a 304 (not modified) error.\n\n\
        \ If both of the [If-None-Match] and [If-Modified-Since] headers are present in the \
         request as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   [If-None-Match] condition evaluates to [false], and;\n\
        \            \n\
        \             }\n\
        \        {-   [If-Modified-Since] condition evaluates to [true];\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Then Amazon S3 returns the [304 Not Modified] response code.\n\
        \   \n\
        \    For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \    "]
  if_unmodified_since : if_unmodified_since option;
      [@ocaml.doc
        "Return the object only if it has not been modified since the specified time; otherwise, \
         return a 412 (precondition failed) error.\n\n\
        \ If both of the [If-Match] and [If-Unmodified-Since] headers are present in the request \
         as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   [If-Match] condition evaluates to [true], and;\n\
        \            \n\
        \             }\n\
        \        {-   [If-Unmodified-Since] condition evaluates to [false];\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Then Amazon S3 returns [200 OK] and the data requested.\n\
        \   \n\
        \    For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \    "]
  key : object_key; [@ocaml.doc "The object key.\n"]
  range : range option;
      [@ocaml.doc
        "HeadObject returns only the metadata for an object. If the Range is satisfiable, only the \
         [ContentLength] is affected in the response. If the Range is not satisfiable, S3 returns \
         a [416 - Requested Range Not Satisfiable] error.\n"]
  response_cache_control : response_cache_control option;
      [@ocaml.doc "Sets the [Cache-Control] header of the response.\n"]
  response_content_disposition : response_content_disposition option;
      [@ocaml.doc "Sets the [Content-Disposition] header of the response.\n"]
  response_content_encoding : response_content_encoding option;
      [@ocaml.doc "Sets the [Content-Encoding] header of the response.\n"]
  response_content_language : response_content_language option;
      [@ocaml.doc "Sets the [Content-Language] header of the response.\n"]
  response_content_type : response_content_type option;
      [@ocaml.doc "Sets the [Content-Type] header of the response.\n"]
  response_expires : response_expires option;
      [@ocaml.doc "Sets the [Expires] header of the response.\n"]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID used to reference a specific version of the object.\n\n\
        \  For directory buckets in this API operation, only the [null] value of the version ID is \
         supported.\n\
        \  \n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when encrypting the object (for example, AES256).\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. \
         This value is used to store the object and then it is discarded; Amazon S3 does not store \
         the encryption key. The key must be appropriate for use with the algorithm specified in \
         the [x-amz-server-side-encryption-customer-algorithm] header.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_payer : request_payer option; [@ocaml.doc ""]
  part_number : part_number option;
      [@ocaml.doc
        "Part number of the object being read. This is a positive integer between 1 and 10,000. \
         Effectively performs a 'ranged' HEAD request for the part specified. Useful querying \
         about the size of the part and the number of parts in this object.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  checksum_mode : checksum_mode option;
      [@ocaml.doc
        "To retrieve the checksum, this parameter must be enabled.\n\n\
        \  {b General purpose buckets} - If you enable checksum mode and the object is uploaded \
         with a {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_Checksum.html}checksum} and \
         encrypted with an Key Management Service (KMS) key, you must have permission to use the \
         [kms:Decrypt] action to retrieve the checksum.\n\
        \ \n\
        \   {b Directory buckets} - If you enable [ChecksumMode] and the object is encrypted with \
         Amazon Web Services Key Management Service (Amazon Web Services KMS), you must also have \
         the [kms:GenerateDataKey] and [kms:Decrypt] permissions in IAM identity-based policies \
         and KMS key policies for the KMS key to retrieve the checksum of the object.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec bucket_location_name = string [@@ocaml.doc ""]

type nonrec location_type = AvailabilityZone [@ocaml.doc ""] | LocalZone [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec head_bucket_output = {
  bucket_arn : s3_regional_or_s3_express_bucket_arn_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web \
         Services resources across all of Amazon Web Services.\n\n\
        \  This parameter is only supported for S3 directory buckets. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-tagging.html}Using \
         tags with directory buckets}.\n\
        \  \n\
        \   "]
  bucket_location_type : location_type option;
      [@ocaml.doc
        "The type of location where the bucket is created.\n\n\
        \  This functionality is only supported by directory buckets.\n\
        \  \n\
        \   "]
  bucket_location_name : bucket_location_name option;
      [@ocaml.doc
        "The name of the location where the bucket will be created.\n\n\
        \ For directory buckets, the Zone ID of the Availability Zone or the Local Zone where the \
         bucket is created. An example Zone ID value for an Availability Zone is [usw2-az1].\n\
        \ \n\
        \   This functionality is only supported by directory buckets.\n\
        \   \n\
        \    "]
  bucket_region : region option; [@ocaml.doc "The Region that the bucket is located.\n"]
  access_point_alias : access_point_alias option;
      [@ocaml.doc
        "Indicates whether the bucket name used in the request is an access point alias.\n\n\
        \  For directory buckets, the value of this field is [false].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec head_bucket_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    {b Object Lambda access points} - When you use this API operation with an Object \
         Lambda access point, provide the alias of the Object Lambda access point in place of the \
         bucket name. If the Object Lambda access point alias in a request is not valid, the error \
         code [InvalidAccessPointAliasError] is returned. For more information about \
         [InvalidAccessPointAliasError], see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList}List \
         of Error Codes}.\n\
        \   \n\
        \     Object Lambda access points are not supported by directory buckets.\n\
        \     \n\
        \        {b S3 on Outposts} - When you use this action with S3 on Outposts, you must \
         direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the \
         form \n\
        \       {[\n\
        \        {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i \
         Region}.amazonaws.com\n\
        \       ]}\n\
        \       . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \       "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_public_access_block_output = {
  public_access_block_configuration : public_access_block_configuration option;
      [@ocaml.doc
        "The [PublicAccessBlock] configuration currently in effect for this Amazon S3 bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec get_public_access_block_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket whose [PublicAccessBlock] configuration you want to \
         retrieve. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_torrent_output = {
  body : streaming_blob option;
      [@ocaml.doc "A Bencoded dictionary as defined by the BitTorrent specification\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_object_torrent_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the object for which to get the torrent files.\n"]
  key : object_key; [@ocaml.doc "The object key for which to get the information.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_tagging_output = {
  version_id : object_version_id option;
      [@ocaml.doc "The versionId of the object for which you got the tagging information.\n"]
  tag_set : tag_set; [@ocaml.doc "Contains the tag set.\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_tagging_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the object for which to get the tagging information. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \  {[\n\
        \   {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \  ]}\n\
        \  . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \  "]
  key : object_key; [@ocaml.doc "Object key for which to get the tagging information.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "The versionId of the object for which to get the tagging information.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_object_retention_output = {
  retention : object_lock_retention option;
      [@ocaml.doc "The container element for an object's retention settings.\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_retention_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the object whose retention settings you want to retrieve. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  key : object_key;
      [@ocaml.doc "The key name for the object whose retention settings you want to retrieve.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "The version ID for the object whose retention settings you want to retrieve.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_lock_configuration_output = {
  object_lock_configuration : object_lock_configuration option;
      [@ocaml.doc "The specified bucket's Object Lock configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_lock_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket whose Object Lock configuration you want to retrieve.\n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_legal_hold_output = {
  legal_hold : object_lock_legal_hold option;
      [@ocaml.doc "The current legal hold status for the specified object.\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_legal_hold_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the object whose legal hold status you want to retrieve. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  key : object_key;
      [@ocaml.doc "The key name for the object whose legal hold status you want to retrieve.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "The version ID of the object whose legal hold status you want to retrieve.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec object_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec object_part = {
  part_number : part_number option;
      [@ocaml.doc
        "The part number identifying the part. This value is a positive integer between 1 and \
         10,000.\n"]
  size : size option; [@ocaml.doc "The size of the uploaded part in bytes.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [CRC32] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [CRC32C] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [CRC64NVME] checksum algorithm, or if \
         the object was uploaded without a checksum (and Amazon S3 added the default checksum, \
         [CRC64NVME], to the uploaded object). For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [SHA1] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [SHA256] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the part. This checksum is present if the \
         multipart upload request was created with the [SHA512] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the part. This checksum is present if the \
         multipart upload request was created with the [MD5] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH64] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH3] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH128] checksum algorithm. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc "A container for elements related to an individual part.\n"]

type nonrec parts_list = object_part list [@@ocaml.doc ""]

type nonrec get_object_attributes_parts = {
  total_parts_count : parts_count option; [@ocaml.doc "The total number of parts.\n"]
  part_number_marker : part_number_marker option; [@ocaml.doc "The marker for the current part.\n"]
  next_part_number_marker : next_part_number_marker option;
      [@ocaml.doc
        "When a list is truncated, this element specifies the last part in the list, as well as \
         the value to use for the [PartNumberMarker] request parameter in a subsequent request.\n"]
  max_parts : max_parts option;
      [@ocaml.doc "The maximum number of parts allowed in the response.\n"]
  is_truncated : is_truncated option;
      [@ocaml.doc
        "Indicates whether the returned list of parts is truncated. A value of [true] indicates \
         that the list was truncated. A list can be truncated if the number of parts exceeds the \
         limit returned in the [MaxParts] element.\n"]
  parts : parts_list option;
      [@ocaml.doc
        "A container for elements related to a particular part. A response can contain zero or \
         more [Parts] elements.\n\n\
        \  {ul\n\
        \        {-   {b General purpose buckets} - For [GetObjectAttributes], if an additional \
         checksum (including [x-amz-checksum-crc32], [x-amz-checksum-crc32c], \
         [x-amz-checksum-sha1], or [x-amz-checksum-sha256]) isn't applied to the object specified \
         in the request, the response doesn't return the [Part] element.\n\
        \            \n\
        \             }\n\
        \        {-   {b Directory buckets} - For [GetObjectAttributes], regardless of whether an \
         additional checksum is applied to the object specified in the request, the response \
         returns the [Part] element.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
}
[@@ocaml.doc "A collection of parts associated with a multipart upload.\n"]

type nonrec checksum = {
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32 checksum] of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the object. This checksum is present \
         if the object was uploaded with the [CRC64NVME] checksum algorithm, or if the object was \
         uploaded without a checksum (and Amazon S3 added the default checksum, [CRC64NVME], to \
         the uploaded object). For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] digest of the object. This checksum is only present if \
         the checksum was uploaded with the object. When you use the API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] digest of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the object. This checksum is present if \
         the object was uploaded with the [SHA512] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the object. This checksum is present if the \
         object was uploaded with the [MD5] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the object. This checksum is present if \
         the object was uploaded with the [XXHASH64] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the object. This checksum is present if \
         the object was uploaded with the [XXHASH3] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the object. This checksum is present \
         if the object was uploaded with the [XXHASH128] checksum algorithm. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type that is used to calculate the object\226\128\153s checksum value. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc "Contains all the possible checksum or digest values for an object.\n"]

type nonrec get_object_attributes_output = {
  delete_marker : delete_marker option;
      [@ocaml.doc
        "Specifies whether the object retrieved was ([true]) or was not ([false]) a delete marker. \
         If [false], this response header does not appear in the response. To learn more about \
         delete markers, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html}Working with \
         delete markers}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  last_modified : last_modified option;
      [@ocaml.doc "Date and time when the object was last modified.\n"]
  version_id : object_version_id option;
      [@ocaml.doc
        "The version ID of the object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_charged : request_charged option; [@ocaml.doc ""]
  e_tag : e_tag option;
      [@ocaml.doc
        "An ETag is an opaque identifier assigned by a web server to a specific version of a \
         resource found at a URL.\n"]
  checksum : checksum option; [@ocaml.doc "The checksum or digest of the object.\n"]
  object_parts : get_object_attributes_parts option;
      [@ocaml.doc "A collection of parts associated with a multipart upload.\n"]
  storage_class : storage_class option;
      [@ocaml.doc
        "Provides the storage class information of the object. Amazon S3 returns this header for \
         all objects except for S3 Standard storage class objects.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html}Storage \
         Classes}.\n\
        \ \n\
        \    {b Directory buckets} - Directory buckets only support [EXPRESS_ONEZONE] (the S3 \
         Express One Zone storage class) in Availability Zones and [ONEZONE_IA] (the S3 One \
         Zone-Infrequent Access storage class) in Dedicated Local Zones.\n\
        \   \n\
        \    "]
  object_size : object_size option; [@ocaml.doc "The size of the object in bytes.\n"]
}
[@@ocaml.doc ""]

type nonrec object_attributes =
  | ETAG [@ocaml.doc ""]
  | CHECKSUM [@ocaml.doc ""]
  | OBJECT_PARTS [@ocaml.doc ""]
  | STORAGE_CLASS [@ocaml.doc ""]
  | OBJECT_SIZE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_attributes_list = object_attributes list [@@ocaml.doc ""]

type nonrec get_object_attributes_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket that contains the object.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  key : object_key; [@ocaml.doc "The object key.\n"]
  version_id : object_version_id option;
      [@ocaml.doc
        "The version ID used to reference a specific version of the object.\n\n\
        \  S3 Versioning isn't enabled and supported for directory buckets. For this API \
         operation, only the [null] value of the version ID is supported by directory buckets. You \
         can only specify [null] to the [versionId] query parameter in the request.\n\
        \  \n\
        \   "]
  max_parts : max_parts option;
      [@ocaml.doc
        "Sets the maximum number of parts to return. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html}Uploading and \
         copying objects using multipart upload in Amazon S3 } in the {i Amazon Simple Storage \
         Service user guide}.\n"]
  part_number_marker : part_number_marker option;
      [@ocaml.doc
        "Specifies the part after which listing should begin. Only parts with higher part numbers \
         will be listed. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html}Uploading and \
         copying objects using multipart upload in Amazon S3 } in the {i Amazon Simple Storage \
         Service user guide}.\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when encrypting the object (for example, AES256).\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. \
         This value is used to store the object and then it is discarded; Amazon S3 does not store \
         the encryption key. The key must be appropriate for use with the algorithm specified in \
         the [x-amz-server-side-encryption-customer-algorithm] header.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  object_attributes : object_attributes_list;
      [@ocaml.doc
        "Specifies the fields at the root level that you want returned in the response. Fields \
         that you do not specify are not returned.\n"]
}
[@@ocaml.doc ""]

type nonrec no_such_annotation = unit [@@ocaml.doc ""]

type nonrec get_object_annotation_output = {
  annotation_payload : streaming_blob option; [@ocaml.doc "The annotation payload.\n"]
  object_version_id : object_version_id option;
      [@ocaml.doc "The version ID of the object that the annotation is attached to.\n"]
  last_modified : last_modified option;
      [@ocaml.doc "The date and time the annotation was last modified.\n"]
  content_length : content_length option;
      [@ocaml.doc "The size of the annotation payload, in bytes.\n"]
  e_tag : e_tag option; [@ocaml.doc "The entity tag of the annotation.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc "The CRC32 checksum of the annotation payload.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc "The CRC32C checksum of the annotation payload.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc "The CRC64NVME checksum of the annotation payload.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc "The SHA1 checksum of the annotation payload.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc "The SHA256 checksum of the annotation payload.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc "The SHA512 checksum of the annotation payload.\n"]
  checksum_m_d5 : checksum_m_d5 option; [@ocaml.doc "The MD5 checksum of the annotation payload.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc "The XXHASH64 checksum of the annotation payload.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc "The XXHASH3 checksum of the annotation payload.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc "The XXHASH128 checksum of the annotation payload.\n"]
  checksum_type : checksum_type option; [@ocaml.doc "The type of checksum used.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc "The server-side encryption algorithm used.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
  replication_status : replication_status option;
      [@ocaml.doc
        "The replication status of the annotation. Possible values include [PENDING], [COMPLETED], \
         [FAILED], and [REPLICA].\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_annotation_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the bucket that contains the object.\n"]
  key : object_key; [@ocaml.doc "The object key.\n"]
  annotation_name : annotation_name;
      [@ocaml.doc
        "The name of the annotation to retrieve.\n\n\
        \ Length Constraints: Minimum length of 1. Maximum length of 512 bytes.\n\
        \ "]
  version_id : object_version_id option; [@ocaml.doc "The version ID of the object.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the bucket is owned by a different \
         account, the request fails with an HTTP 403 (Access Denied) error.\n"]
  checksum_mode : checksum_mode option;
      [@ocaml.doc
        "Set to [ENABLED] to validate the checksum of the annotation payload on retrieval.\n"]
}
[@@ocaml.doc ""]

type nonrec get_object_acl_output = {
  owner : owner option; [@ocaml.doc " Container for the bucket owner's ID.\n"]
  grants : grants option; [@ocaml.doc "A list of grants.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_object_acl_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name that contains the object for which to get the ACL information. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ "]
  key : object_key; [@ocaml.doc "The key of the object for which to get the ACL information.\n"]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID used to reference a specific version of the object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_object_state = {
  storage_class : storage_class option; [@ocaml.doc ""]
  access_tier : intelligent_tiering_access_tier option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Object is archived and inaccessible until restored.\n\n\
  \ If the object you are retrieving is stored in the S3 Glacier Flexible Retrieval storage class, \
   the S3 Glacier Deep Archive storage class, the S3 Intelligent-Tiering Archive Access tier, or \
   the S3 Intelligent-Tiering Deep Archive Access tier, before you can retrieve the object you \
   must first restore a copy using \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html}RestoreObject}. \
   Otherwise, this operation returns an [InvalidObjectState] error. For information about \
   restoring archived objects, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/restoring-objects.html}Restoring Archived \
   Objects} in the {i Amazon S3 User Guide}.\n\
  \ "]

type nonrec get_object_output = {
  body : streaming_blob option; [@ocaml.doc "Object data.\n"]
  delete_marker : delete_marker option;
      [@ocaml.doc
        "Indicates whether the object retrieved was (true) or was not (false) a Delete Marker. If \
         false, this response header does not appear in the response.\n\n\
        \  {ul\n\
        \        {-  If the current version of the object is a delete marker, Amazon S3 behaves as \
         if the object was deleted and includes [x-amz-delete-marker: true] in the response.\n\
        \            \n\
        \             }\n\
        \        {-  If the specified version in the request is a delete marker, the response \
         returns a [405\n\
        \              Method Not Allowed] error and the [Last-Modified: timestamp] response header.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  accept_ranges : accept_ranges option;
      [@ocaml.doc "Indicates that a range of bytes was specified in the request.\n"]
  expiration : expiration option;
      [@ocaml.doc
        "If the object expiration is configured (see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html} \
         [PutBucketLifecycleConfiguration] }), the response includes this header. It includes the \
         [expiry-date] and [rule-id] key-value pairs providing object expiration information. The \
         value of the [rule-id] is URL-encoded.\n\n\
        \  Object expiration information is not returned in directory buckets and this header \
         returns the value \"[NotImplemented]\" in all responses for directory buckets.\n\
        \  \n\
        \   "]
  restore : restore option;
      [@ocaml.doc
        "Provides information about object restoration action and expiration time of the restored \
         object copy.\n\n\
        \  This functionality is not supported for directory buckets. Directory buckets only \
         support [EXPRESS_ONEZONE] (the S3 Express One Zone storage class) in Availability Zones \
         and [ONEZONE_IA] (the S3 One Zone-Infrequent Access storage class) in Dedicated Local \
         Zones.\n\
        \  \n\
        \   "]
  last_modified : last_modified option;
      [@ocaml.doc
        "Date and time when the object was last modified.\n\n\
        \  {b General purpose buckets } - When you specify a [versionId] of the object in your \
         request, if the specified version in the request is a delete marker, the response returns \
         a [405 Method Not Allowed] error and the [Last-Modified: timestamp] response header.\n\
        \ "]
  content_length : content_length option; [@ocaml.doc "Size of the body in bytes.\n"]
  e_tag : e_tag option;
      [@ocaml.doc
        "An entity tag (ETag) is an opaque identifier assigned by a web server to a specific \
         version of a resource found at a URL.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32] checksum of the object. This checksum is only present \
         if the object was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the object. This checksum is only present \
         if the checksum was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] digest of the object. This checksum is only present if \
         the checksum was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] digest of the object. This checksum is only present \
         if the checksum was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type, which determines how part-level checksums are combined to create an \
         object-level checksum for multipart objects. You can use this header response to verify \
         that the checksum type that is received is the same checksum type that was specified in \
         the [CreateMultipartUpload] request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  missing_meta : missing_meta option;
      [@ocaml.doc
        "This is set to the number of metadata entries not returned in the headers that are \
         prefixed with [x-amz-meta-]. This can happen if you create metadata using an API like \
         SOAP that supports more flexible metadata than the REST API. For example, using SOAP, you \
         can create metadata whose values are not legal HTTP headers.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID of the object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  cache_control : cache_control option;
      [@ocaml.doc "Specifies caching behavior along the request/reply chain.\n"]
  content_disposition : content_disposition option;
      [@ocaml.doc "Specifies presentational information for the object.\n"]
  content_encoding : content_encoding option;
      [@ocaml.doc
        "Indicates what content encodings have been applied to the object and thus what decoding \
         mechanisms must be applied to obtain the media-type referenced by the Content-Type header \
         field.\n"]
  content_language : content_language option; [@ocaml.doc "The language the content is in.\n"]
  content_range : content_range option;
      [@ocaml.doc "The portion of the object returned in the response.\n"]
  content_type : content_type option;
      [@ocaml.doc "A standard MIME type describing the format of the object data.\n"]
  expires : expires option;
      [@ocaml.doc "The date and time at which the object is no longer cacheable.\n"]
  website_redirect_location : website_redirect_location option;
      [@ocaml.doc
        "If the bucket is configured as a website, redirects requests for this object to another \
         object in the same bucket or to an external URL. Amazon S3 stores the value of this \
         header in the object metadata.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  metadata : metadata option; [@ocaml.doc "A map of metadata to store with the object in S3.\n"]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to confirm the encryption algorithm that's used.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to provide the round-trip message integrity \
         verification of the customer-provided encryption key.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the object uses an S3 Bucket Key for server-side encryption with Key \
         Management Service (KMS) keys (SSE-KMS).\n"]
  storage_class : storage_class option;
      [@ocaml.doc
        "Provides storage class information of the object. Amazon S3 returns this header for all \
         objects except for S3 Standard storage class objects.\n\n\
        \   {b Directory buckets } - Directory buckets only support [EXPRESS_ONEZONE] (the S3 \
         Express One Zone storage class) in Availability Zones and [ONEZONE_IA] (the S3 One \
         Zone-Infrequent Access storage class) in Dedicated Local Zones.\n\
        \  \n\
        \   "]
  request_charged : request_charged option; [@ocaml.doc ""]
  replication_status : replication_status option;
      [@ocaml.doc
        "Amazon S3 can return this if your request involves a bucket that is either a source or \
         destination in a replication rule.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  parts_count : parts_count option;
      [@ocaml.doc
        "The count of parts this object has. This value is only returned if you specify \
         [partNumber] in your request and the object was uploaded as a multipart upload.\n"]
  tag_count : tag_count option;
      [@ocaml.doc
        "The number of tags, if any, on the object, when you have the relevant permission to read \
         object tags.\n\n\
        \ You can use \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html}GetObjectTagging} \
         to retrieve the tag set associated with an object.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  object_lock_mode : object_lock_mode option;
      [@ocaml.doc
        "The Object Lock mode that's currently in place for this object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_retain_until_date : object_lock_retain_until_date option;
      [@ocaml.doc
        "The date and time when this object's Object Lock will expire.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_legal_hold_status : object_lock_legal_hold_status option;
      [@ocaml.doc
        "Indicates whether this object has an active legal hold. This field is only returned if \
         you have permission to view an object's legal hold status. \n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_object_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the object. \n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    {b Object Lambda access points} - When you use this action with an Object Lambda \
         access point, you must direct requests to the Object Lambda access point hostname. The \
         Object Lambda access point hostname takes the form {i AccessPointName}-{i \
         AccountId}.s3-object-lambda.{i Region}.amazonaws.com.\n\
        \   \n\
        \     Object Lambda access points are not supported by directory buckets.\n\
        \     \n\
        \        {b S3 on Outposts} - When you use this action with S3 on Outposts, you must \
         direct requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the \
         form \n\
        \       {[\n\
        \        {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i \
         Region}.amazonaws.com\n\
        \       ]}\n\
        \       . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \       "]
  if_match : if_match option;
      [@ocaml.doc
        "Return the object only if its entity tag (ETag) is the same as the one specified in this \
         header; otherwise, return a [412 Precondition Failed] error.\n\n\
        \ If both of the [If-Match] and [If-Unmodified-Since] headers are present in the request \
         as follows: [If-Match] condition evaluates to [true], and; [If-Unmodified-Since] \
         condition evaluates to [false]; then, S3 returns [200\n\
        \        OK] and the data requested. \n\
        \ \n\
        \  For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \  "]
  if_modified_since : if_modified_since option;
      [@ocaml.doc
        "Return the object only if it has been modified since the specified time; otherwise, \
         return a [304 Not Modified] error.\n\n\
        \ If both of the [If-None-Match] and [If-Modified-Since] headers are present in the \
         request as follows:[ If-None-Match] condition evaluates to [false], and; \
         [If-Modified-Since] condition evaluates to [true]; then, S3 returns [304\n\
        \        Not Modified] status code.\n\
        \ \n\
        \  For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \  "]
  if_none_match : if_none_match option;
      [@ocaml.doc
        "Return the object only if its entity tag (ETag) is different from the one specified in \
         this header; otherwise, return a [304 Not Modified] error.\n\n\
        \ If both of the [If-None-Match] and [If-Modified-Since] headers are present in the \
         request as follows:[ If-None-Match] condition evaluates to [false], and; \
         [If-Modified-Since] condition evaluates to [true]; then, S3 returns [304\n\
        \        Not Modified] HTTP status code.\n\
        \ \n\
        \  For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \  "]
  if_unmodified_since : if_unmodified_since option;
      [@ocaml.doc
        "Return the object only if it has not been modified since the specified time; otherwise, \
         return a [412 Precondition Failed] error.\n\n\
        \ If both of the [If-Match] and [If-Unmodified-Since] headers are present in the request \
         as follows: [If-Match] condition evaluates to [true], and; [If-Unmodified-Since] \
         condition evaluates to [false]; then, S3 returns [200\n\
        \        OK] and the data requested. \n\
        \ \n\
        \  For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \  "]
  key : object_key; [@ocaml.doc "Key of the object to get.\n"]
  range : range option;
      [@ocaml.doc
        "Downloads the specified byte range of an object. For more information about the HTTP \
         Range header, see \
         {{:https://www.rfc-editor.org/rfc/rfc9110.html#name-range}https://www.rfc-editor.org/rfc/rfc9110.html#name-range}.\n\n\
        \  Amazon S3 doesn't support retrieving multiple ranges of data per [GET] request.\n\
        \  \n\
        \   "]
  response_cache_control : response_cache_control option;
      [@ocaml.doc "Sets the [Cache-Control] header of the response.\n"]
  response_content_disposition : response_content_disposition option;
      [@ocaml.doc "Sets the [Content-Disposition] header of the response.\n"]
  response_content_encoding : response_content_encoding option;
      [@ocaml.doc "Sets the [Content-Encoding] header of the response.\n"]
  response_content_language : response_content_language option;
      [@ocaml.doc "Sets the [Content-Language] header of the response.\n"]
  response_content_type : response_content_type option;
      [@ocaml.doc "Sets the [Content-Type] header of the response.\n"]
  response_expires : response_expires option;
      [@ocaml.doc "Sets the [Expires] header of the response.\n"]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID used to reference a specific version of the object.\n\n\
        \ By default, the [GetObject] operation returns the current version of an object. To \
         return a different version, use the [versionId] subresource.\n\
        \ \n\
        \   {ul\n\
        \         {-  If you include a [versionId] in your request header, you must have the \
         [s3:GetObjectVersion] permission to access a specific version of an object. The \
         [s3:GetObject] permission is not required in this scenario.\n\
        \             \n\
        \              }\n\
        \         {-  If you request the current version of an object without a specific \
         [versionId] in the request header, only the [s3:GetObject] permission is required. The \
         [s3:GetObjectVersion] permission is not required in this scenario.\n\
        \             \n\
        \              }\n\
        \         {-   {b Directory buckets} - S3 Versioning isn't enabled and supported for \
         directory buckets. For this API operation, only the [null] value of the version ID is \
         supported by directory buckets. You can only specify [null] to the [versionId] query \
         parameter in the request.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \    For more information about versioning, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html}PutBucketVersioning}.\n\
        \    "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when decrypting the object (for example, [AES256]).\n\n\
        \ If you encrypt an object by using server-side encryption with customer-provided \
         encryption keys (SSE-C) when you store the object in Amazon S3, then when you GET the \
         object, you must use the following headers:\n\
        \ \n\
        \  {ul\n\
        \        {-   [x-amz-server-side-encryption-customer-algorithm] \n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-server-side-encryption-customer-key] \n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-server-side-encryption-customer-key-MD5] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about SSE-C, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Server-Side \
         Encryption (Using Customer-Provided Encryption Keys)} in the {i Amazon S3 User Guide}.\n\
        \   \n\
        \     This functionality is not supported for directory buckets.\n\
        \     \n\
        \      "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key that you originally provided for Amazon S3 \
         to encrypt the data before storing it. This value is used to decrypt the object when \
         recovering it and must match the one used when storing the data. The key must be \
         appropriate for use with the algorithm specified in the \
         [x-amz-server-side-encryption-customer-algorithm] header.\n\n\
        \ If you encrypt an object by using server-side encryption with customer-provided \
         encryption keys (SSE-C) when you store the object in Amazon S3, then when you GET the \
         object, you must use the following headers:\n\
        \ \n\
        \  {ul\n\
        \        {-   [x-amz-server-side-encryption-customer-algorithm] \n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-server-side-encryption-customer-key] \n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-server-side-encryption-customer-key-MD5] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about SSE-C, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Server-Side \
         Encryption (Using Customer-Provided Encryption Keys)} in the {i Amazon S3 User Guide}.\n\
        \   \n\
        \     This functionality is not supported for directory buckets.\n\
        \     \n\
        \      "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the customer-provided encryption key according to RFC \
         1321. Amazon S3 uses this header for a message integrity check to ensure that the \
         encryption key was transmitted without error.\n\n\
        \ If you encrypt an object by using server-side encryption with customer-provided \
         encryption keys (SSE-C) when you store the object in Amazon S3, then when you GET the \
         object, you must use the following headers:\n\
        \ \n\
        \  {ul\n\
        \        {-   [x-amz-server-side-encryption-customer-algorithm] \n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-server-side-encryption-customer-key] \n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-server-side-encryption-customer-key-MD5] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about SSE-C, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Server-Side \
         Encryption (Using Customer-Provided Encryption Keys)} in the {i Amazon S3 User Guide}.\n\
        \   \n\
        \     This functionality is not supported for directory buckets.\n\
        \     \n\
        \      "]
  request_payer : request_payer option; [@ocaml.doc ""]
  part_number : part_number option;
      [@ocaml.doc
        "Part number of the object being read. This is a positive integer between 1 and 10,000. \
         Effectively performs a 'ranged' GET request for the part specified. Useful for \
         downloading just a part of an object.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  checksum_mode : checksum_mode option;
      [@ocaml.doc "To retrieve the checksum, this mode must be enabled.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_website_output = {
  redirect_all_requests_to : redirect_all_requests_to option;
      [@ocaml.doc
        "Specifies the redirect behavior of all requests to a website endpoint of an Amazon S3 \
         bucket.\n"]
  index_document : index_document option;
      [@ocaml.doc "The name of the index document for the website (for example [index.html]).\n"]
  error_document : error_document option;
      [@ocaml.doc
        "The object key name of the website error document to use for 4XX class errors.\n"]
  routing_rules : routing_rules option;
      [@ocaml.doc "Rules that define when a redirect is applied and the redirect behavior.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_website_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name for which to get the website configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec mfa_delete_status = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_bucket_versioning_output = {
  status : bucket_versioning_status option; [@ocaml.doc "The versioning state of the bucket.\n"]
  mfa_delete : mfa_delete_status option;
      [@ocaml.doc
        "Specifies whether MFA delete is enabled in the bucket versioning configuration. This \
         element is only returned if the bucket has been configured with MFA delete. If the bucket \
         has never been so configured, this element is not returned.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_versioning_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket for which to get the versioning information.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_tagging_output = { tag_set : tag_set [@ocaml.doc "Contains the tag set.\n"] }
[@@ocaml.doc ""]

type nonrec get_bucket_tagging_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket for which to get the tagging information.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_request_payment_output = {
  payer : payer option; [@ocaml.doc "Specifies who pays for the download and request fees.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_request_payment_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket for which to get the payment request configuration\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_replication_output = {
  replication_configuration : replication_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_bucket_replication_request = {
  bucket : bucket_name;
      [@ocaml.doc "The bucket name for which to get the replication information.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec is_public = bool [@@ocaml.doc ""]

type nonrec policy_status = {
  is_public : is_public option;
      [@ocaml.doc
        "The policy status for this bucket. [TRUE] indicates that this bucket is public. [FALSE] \
         indicates that the bucket is not public.\n"]
}
[@@ocaml.doc "The container element for a bucket's policy status.\n"]

type nonrec get_bucket_policy_status_output = {
  policy_status : policy_status option; [@ocaml.doc "The policy status for the specified bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_policy_status_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the Amazon S3 bucket whose policy status you want to retrieve.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_policy_output = {
  policy : policy option; [@ocaml.doc "The bucket policy as a JSON document.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_policy_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name to get the bucket policy for.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ \n\
        \   {b Access points} - When you use this API operation with an access point, provide the \
         alias of the access point in place of the bucket name.\n\
        \  \n\
        \    {b Object Lambda access points} - When you use this API operation with an Object \
         Lambda access point, provide the alias of the Object Lambda access point in place of the \
         bucket name. If the Object Lambda access point alias in a request is not valid, the error \
         code [InvalidAccessPointAliasError] is returned. For more information about \
         [InvalidAccessPointAliasError], see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList}List \
         of Error Codes}.\n\
        \   \n\
        \     Object Lambda access points are not supported by directory buckets.\n\
        \     \n\
        \      "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_bucket_ownership_controls_output = {
  ownership_controls : ownership_controls option;
      [@ocaml.doc
        "The [OwnershipControls] (BucketOwnerEnforced, BucketOwnerPreferred, or ObjectWriter) \
         currently in effect for this Amazon S3 bucket.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_ownership_controls_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket whose [OwnershipControls] you want to retrieve. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_notification_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket for which to get the notification configuration.\n\n\
        \ When you use this API operation with an access point, provide the alias of the access \
         point in place of the bucket name.\n\
        \ \n\
        \  When you use this API operation with an Object Lambda access point, provide the alias \
         of the Object Lambda access point in place of the bucket name. If the Object Lambda \
         access point alias in a request is not valid, the error code \
         [InvalidAccessPointAliasError] is returned. For more information about \
         [InvalidAccessPointAliasError], see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList}List \
         of Error Codes}.\n\
        \  "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_metrics_configuration_output = {
  metrics_configuration : metrics_configuration option;
      [@ocaml.doc "Specifies the metrics configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_metrics_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the metrics configuration to retrieve.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  id : metrics_id;
      [@ocaml.doc
        "The ID used to identify the metrics configuration. The ID has a 64 character limit and \
         can only contain letters, numbers, periods, dashes, and underscores.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec error_details = {
  error_code : error_code option;
      [@ocaml.doc
        " If the V1 [CreateBucketMetadataTableConfiguration] request succeeds, but S3 Metadata was \
         unable to create the table, this structure contains the error code. The possible error \
         codes and error messages are as follows: \n\n\
        \ {ul\n\
        \       {-   [AccessDeniedCreatingResources] - You don't have sufficient permissions to \
         create the required resources. Make sure that you have [s3tables:CreateNamespace], \
         [s3tables:CreateTable], [s3tables:GetTable] and [s3tables:PutTablePolicy] permissions, \
         and then try again. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration. \n\
        \           \n\
        \            }\n\
        \       {-   [AccessDeniedWritingToTable] - Unable to write to the metadata table because \
         of missing resource permissions. To fix the resource policy, Amazon S3 needs to create a \
         new metadata table. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [DestinationTableNotFound] - The destination table doesn't exist. To create a \
         new metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [ServerInternalError] - An internal error has occurred. To create a new \
         metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [TableAlreadyExists] - The table that you specified already exists in the \
         table bucket's namespace. Specify a different table name. To create a new metadata table, \
         you must delete the metadata configuration for this bucket, and then create a new \
         metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [TableBucketNotFound] - The table bucket that you specified doesn't exist in \
         this Amazon Web Services Region and account. Create or choose a different table bucket. \
         To create a new metadata table, you must delete the metadata configuration for this \
         bucket, and then create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If the V2 [CreateBucketMetadataConfiguration] request succeeds, but S3 Metadata was \
         unable to create the table, this structure contains the error code. The possible error \
         codes and error messages are as follows: \n\
        \   \n\
        \    {ul\n\
        \          {-   [AccessDeniedCreatingResources] - You don't have sufficient permissions to \
         create the required resources. Make sure that you have [s3tables:CreateTableBucket], \
         [s3tables:CreateNamespace], [s3tables:CreateTable], [s3tables:GetTable], \
         [s3tables:PutTablePolicy], [kms:DescribeKey], and [s3tables:PutTableEncryption] \
         permissions. Additionally, ensure that the KMS key used to encrypt the table still \
         exists, is active and has a resource policy granting access to the S3 service principals \
         '[maintenance.s3tables.amazonaws.com]' and '[metadata.s3.amazonaws.com]'. To create a new \
         metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration. \n\
        \              \n\
        \               }\n\
        \          {-   [AccessDeniedWritingToTable] - Unable to write to the metadata table \
         because of missing resource permissions. To fix the resource policy, Amazon S3 needs to \
         create a new metadata table. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [DestinationTableNotFound] - The destination table doesn't exist. To \
         create a new metadata table, you must delete the metadata configuration for this bucket, \
         and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [ServerInternalError] - An internal error has occurred. To create a new \
         metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [JournalTableAlreadyExists] - A journal table already exists in the Amazon \
         Web Services managed table bucket's namespace. Delete the journal table, and then try \
         again. To create a new metadata table, you must delete the metadata configuration for \
         this bucket, and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [InventoryTableAlreadyExists] - An inventory table already exists in the \
         Amazon Web Services managed table bucket's namespace. Delete the inventory table, and \
         then try again. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [JournalTableNotAvailable] - The journal table that the inventory table \
         relies on has a [FAILED] status. An inventory table requires a journal table with an \
         [ACTIVE] status. To create a new journal or inventory table, you must delete the metadata \
         configuration for this bucket, along with any journal or inventory tables, and then \
         create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [NoSuchBucket] - The specified general purpose bucket does not exist.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  error_message : error_message option;
      [@ocaml.doc
        " If the V1 [CreateBucketMetadataTableConfiguration] request succeeds, but S3 Metadata was \
         unable to create the table, this structure contains the error message. The possible error \
         codes and error messages are as follows: \n\n\
        \ {ul\n\
        \       {-   [AccessDeniedCreatingResources] - You don't have sufficient permissions to \
         create the required resources. Make sure that you have [s3tables:CreateNamespace], \
         [s3tables:CreateTable], [s3tables:GetTable] and [s3tables:PutTablePolicy] permissions, \
         and then try again. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration. \n\
        \           \n\
        \            }\n\
        \       {-   [AccessDeniedWritingToTable] - Unable to write to the metadata table because \
         of missing resource permissions. To fix the resource policy, Amazon S3 needs to create a \
         new metadata table. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [DestinationTableNotFound] - The destination table doesn't exist. To create a \
         new metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [ServerInternalError] - An internal error has occurred. To create a new \
         metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [TableAlreadyExists] - The table that you specified already exists in the \
         table bucket's namespace. Specify a different table name. To create a new metadata table, \
         you must delete the metadata configuration for this bucket, and then create a new \
         metadata configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [TableBucketNotFound] - The table bucket that you specified doesn't exist in \
         this Amazon Web Services Region and account. Create or choose a different table bucket. \
         To create a new metadata table, you must delete the metadata configuration for this \
         bucket, and then create a new metadata configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If the V2 [CreateBucketMetadataConfiguration] request succeeds, but S3 Metadata was \
         unable to create the table, this structure contains the error code. The possible error \
         codes and error messages are as follows: \n\
        \   \n\
        \    {ul\n\
        \          {-   [AccessDeniedCreatingResources] - You don't have sufficient permissions to \
         create the required resources. Make sure that you have [s3tables:CreateTableBucket], \
         [s3tables:CreateNamespace], [s3tables:CreateTable], [s3tables:GetTable], \
         [s3tables:PutTablePolicy], [kms:DescribeKey], and [s3tables:PutTableEncryption] \
         permissions. Additionally, ensure that the KMS key used to encrypt the table still \
         exists, is active and has a resource policy granting access to the S3 service principals \
         '[maintenance.s3tables.amazonaws.com]' and '[metadata.s3.amazonaws.com]'. To create a new \
         metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration. \n\
        \              \n\
        \               }\n\
        \          {-   [AccessDeniedWritingToTable] - Unable to write to the metadata table \
         because of missing resource permissions. To fix the resource policy, Amazon S3 needs to \
         create a new metadata table. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [DestinationTableNotFound] - The destination table doesn't exist. To \
         create a new metadata table, you must delete the metadata configuration for this bucket, \
         and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [ServerInternalError] - An internal error has occurred. To create a new \
         metadata table, you must delete the metadata configuration for this bucket, and then \
         create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [JournalTableAlreadyExists] - A journal table already exists in the Amazon \
         Web Services managed table bucket's namespace. Delete the journal table, and then try \
         again. To create a new metadata table, you must delete the metadata configuration for \
         this bucket, and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [InventoryTableAlreadyExists] - An inventory table already exists in the \
         Amazon Web Services managed table bucket's namespace. Delete the inventory table, and \
         then try again. To create a new metadata table, you must delete the metadata \
         configuration for this bucket, and then create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [JournalTableNotAvailable] - The journal table that the inventory table \
         relies on has a [FAILED] status. An inventory table requires a journal table with an \
         [ACTIVE] status. To create a new journal or inventory table, you must delete the metadata \
         configuration for this bucket, along with any journal or inventory tables, and then \
         create a new metadata configuration.\n\
        \              \n\
        \               }\n\
        \          {-   [NoSuchBucket] - The specified general purpose bucket does not exist.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc
  " If an S3 Metadata V1 [CreateBucketMetadataTableConfiguration] or V2 \
   [CreateBucketMetadataConfiguration] request succeeds, but S3 Metadata was unable to create the \
   table, this structure contains the error code and error message. \n\n\
  \  If you created your S3 Metadata configuration before July 15, 2025, we recommend that you \
   delete and re-create your configuration by using \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html}CreateBucketMetadataConfiguration} \
   so that you can expire journal table records and create a live inventory table.\n\
  \  \n\
  \   "]

type nonrec metadata_table_status = string [@@ocaml.doc ""]

type nonrec s3_tables_namespace = string [@@ocaml.doc ""]

type nonrec s3_tables_arn = string [@@ocaml.doc ""]

type nonrec s3_tables_name = string [@@ocaml.doc ""]

type nonrec s3_tables_bucket_arn = string [@@ocaml.doc ""]

type nonrec s3_tables_destination_result = {
  table_bucket_arn : s3_tables_bucket_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for the table bucket that's specified as the destination \
         in the metadata table configuration. The destination table bucket must be in the same \
         Region and Amazon Web Services account as the general purpose bucket. \n"]
  table_name : s3_tables_name;
      [@ocaml.doc
        " The name for the metadata table in your metadata table configuration. The specified \
         metadata table name must be unique within the [aws_s3_metadata] namespace in the \
         destination table bucket. \n"]
  table_arn : s3_tables_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for the metadata table in the metadata table \
         configuration. The specified metadata table name must be unique within the \
         [aws_s3_metadata] namespace in the destination table bucket. \n"]
  table_namespace : s3_tables_namespace;
      [@ocaml.doc
        " The table bucket namespace for the metadata table in your metadata table configuration. \
         This value is always [aws_s3_metadata]. \n"]
}
[@@ocaml.doc
  " The destination information for a V1 S3 Metadata configuration. The destination table bucket \
   must be in the same Region and Amazon Web Services account as the general purpose bucket. The \
   specified metadata table name must be unique within the [aws_s3_metadata] namespace in the \
   destination table bucket. \n\n\
  \  If you created your S3 Metadata configuration before July 15, 2025, we recommend that you \
   delete and re-create your configuration by using \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html}CreateBucketMetadataConfiguration} \
   so that you can expire journal table records and create a live inventory table.\n\
  \  \n\
  \   "]

type nonrec metadata_table_configuration_result = {
  s3_tables_destination_result : s3_tables_destination_result;
      [@ocaml.doc
        " The destination information for the metadata table configuration. The destination table \
         bucket must be in the same Region and Amazon Web Services account as the general purpose \
         bucket. The specified metadata table name must be unique within the [aws_s3_metadata] \
         namespace in the destination table bucket. \n"]
}
[@@ocaml.doc
  " The V1 S3 Metadata configuration for a general purpose bucket. The destination table bucket \
   must be in the same Region and Amazon Web Services account as the general purpose bucket. The \
   specified metadata table name must be unique within the [aws_s3_metadata] namespace in the \
   destination table bucket. \n\n\
  \  If you created your S3 Metadata configuration before July 15, 2025, we recommend that you \
   delete and re-create your configuration by using \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html}CreateBucketMetadataConfiguration} \
   so that you can expire journal table records and create a live inventory table.\n\
  \  \n\
  \   "]

type nonrec get_bucket_metadata_table_configuration_result = {
  metadata_table_configuration_result : metadata_table_configuration_result;
      [@ocaml.doc " The V1 S3 Metadata configuration for a general purpose bucket. \n"]
  status : metadata_table_status;
      [@ocaml.doc
        " The status of the metadata table. The status values are: \n\n\
        \ {ul\n\
        \       {-   [CREATING] - The metadata table is in the process of being created in the \
         specified table bucket.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] - The metadata table has been created successfully, and records are \
         being delivered to the table. \n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Amazon S3 is unable to create the metadata table, or Amazon S3 is \
         unable to deliver records. See [ErrorDetails] for details.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  error : error_details option;
      [@ocaml.doc
        " If the [CreateBucketMetadataTableConfiguration] request succeeds, but S3 Metadata was \
         unable to create the table, this structure contains the error code and error message. \n"]
}
[@@ocaml.doc
  " The V1 S3 Metadata configuration for a general purpose bucket. \n\n\
  \  If you created your S3 Metadata configuration before July 15, 2025, we recommend that you \
   delete and re-create your configuration by using \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html}CreateBucketMetadataConfiguration} \
   so that you can expire journal table records and create a live inventory table.\n\
  \  \n\
  \   "]

type nonrec get_bucket_metadata_table_configuration_output = {
  get_bucket_metadata_table_configuration_result :
    get_bucket_metadata_table_configuration_result option;
      [@ocaml.doc " The metadata table configuration for the general purpose bucket. \n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_metadata_table_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that corresponds to the metadata table configuration that you \
         want to retrieve. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected owner of the general purpose bucket that you want to retrieve the metadata \
         table configuration for. \n"]
}
[@@ocaml.doc ""]

type nonrec annotation_table_configuration_result = {
  configuration_state : annotation_configuration_state;
      [@ocaml.doc "The current configuration state of the annotation table.\n"]
  table_status : metadata_table_status option;
      [@ocaml.doc
        "The provisioning status of the annotation table. Possible values: [CREATING], \
         [BACKFILLING], [ACTIVE], [FAILED].\n"]
  error : error_details option; [@ocaml.doc ""]
  table_name : s3_tables_name option; [@ocaml.doc "The name of the annotation table.\n"]
  table_arn : s3_tables_arn option; [@ocaml.doc "The ARN of the annotation table.\n"]
  role : role option; [@ocaml.doc "The ARN of the IAM role associated with the annotation table.\n"]
}
[@@ocaml.doc
  "Contains the current state of the annotation table associated with a bucket's Amazon S3 \
   Metadata configuration, including its provisioning status and identifiers.\n"]

type nonrec inventory_table_configuration_result = {
  configuration_state : inventory_configuration_state;
      [@ocaml.doc
        " The configuration state of the inventory table, indicating whether the inventory table \
         is enabled or disabled. \n"]
  table_status : metadata_table_status option;
      [@ocaml.doc
        " The status of the inventory table. The status values are: \n\n\
        \ {ul\n\
        \       {-   [CREATING] - The inventory table is in the process of being created in the \
         specified Amazon Web Services managed table bucket.\n\
        \           \n\
        \            }\n\
        \       {-   [BACKFILLING] - The inventory table is in the process of being backfilled. \
         When you enable the inventory table for your metadata configuration, the table goes \
         through a process known as backfilling, during which Amazon S3 scans your general purpose \
         bucket to retrieve the initial metadata for all objects in the bucket. Depending on the \
         number of objects in your bucket, this process can take several hours. When the \
         backfilling process is finished, the status of your inventory table changes from \
         [BACKFILLING] to [ACTIVE]. After backfilling is completed, updates to your objects are \
         reflected in the inventory table within one hour.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] - The inventory table has been created successfully, and records are \
         being delivered to the table. \n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Amazon S3 is unable to create the inventory table, or Amazon S3 is \
         unable to deliver records.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  error : error_details option; [@ocaml.doc ""]
  table_name : s3_tables_name option; [@ocaml.doc " The name of the inventory table. \n"]
  table_arn : s3_tables_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) for the inventory table. \n"]
}
[@@ocaml.doc " The inventory table configuration for an S3 Metadata configuration. \n"]

type nonrec journal_table_configuration_result = {
  table_status : metadata_table_status;
      [@ocaml.doc
        " The status of the journal table. The status values are: \n\n\
        \ {ul\n\
        \       {-   [CREATING] - The journal table is in the process of being created in the \
         specified table bucket.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] - The journal table has been created successfully, and records are \
         being delivered to the table. \n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Amazon S3 is unable to create the journal table, or Amazon S3 is \
         unable to deliver records.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  error : error_details option; [@ocaml.doc ""]
  table_name : s3_tables_name; [@ocaml.doc " The name of the journal table. \n"]
  table_arn : s3_tables_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) for the journal table. \n"]
  record_expiration : record_expiration;
      [@ocaml.doc " The journal table record expiration settings for the journal table. \n"]
}
[@@ocaml.doc " The journal table configuration for the S3 Metadata configuration. \n"]

type nonrec s3_tables_bucket_type = Aws [@ocaml.doc ""] | Customer [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec destination_result = {
  table_bucket_type : s3_tables_bucket_type option;
      [@ocaml.doc
        " The type of the table bucket where the metadata configuration is stored. The [aws] value \
         indicates an Amazon Web Services managed table bucket, and the [customer] value indicates \
         a customer-managed table bucket. V2 metadata configurations are stored in Amazon Web \
         Services managed table buckets, and V1 metadata configurations are stored in \
         customer-managed table buckets. \n"]
  table_bucket_arn : s3_tables_bucket_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the table bucket where the metadata configuration is \
         stored. \n"]
  table_namespace : s3_tables_namespace option;
      [@ocaml.doc
        " The namespace in the table bucket where the metadata tables for a metadata configuration \
         are stored. \n"]
}
[@@ocaml.doc " The destination information for the S3 Metadata configuration. \n"]

type nonrec metadata_configuration_result = {
  destination_result : destination_result;
      [@ocaml.doc " The destination settings for a metadata configuration. \n"]
  journal_table_configuration_result : journal_table_configuration_result option;
      [@ocaml.doc " The journal table configuration for a metadata configuration. \n"]
  inventory_table_configuration_result : inventory_table_configuration_result option;
      [@ocaml.doc " The inventory table configuration for a metadata configuration. \n"]
  annotation_table_configuration_result : annotation_table_configuration_result option;
      [@ocaml.doc
        "The annotation table configuration result, if an annotation table is configured.\n"]
}
[@@ocaml.doc " The S3 Metadata configuration for a general purpose bucket. \n"]

type nonrec get_bucket_metadata_configuration_result = {
  metadata_configuration_result : metadata_configuration_result;
      [@ocaml.doc " The metadata configuration for a general purpose bucket. \n"]
}
[@@ocaml.doc " The S3 Metadata configuration for a general purpose bucket. \n"]

type nonrec get_bucket_metadata_configuration_output = {
  get_bucket_metadata_configuration_result : get_bucket_metadata_configuration_result option;
      [@ocaml.doc " The metadata configuration for the general purpose bucket. \n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_metadata_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that corresponds to the metadata configuration that you want \
         to retrieve. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected owner of the general purpose bucket that you want to retrieve the metadata \
         table configuration for. \n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_logging_output = { logging_enabled : logging_enabled option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec get_bucket_logging_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name for which to get the logging information.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec bucket_location_constraint =
  | Af_south_1 [@ocaml.doc ""]
  | Ap_east_1 [@ocaml.doc ""]
  | Ap_east_2 [@ocaml.doc ""]
  | Ap_northeast_1 [@ocaml.doc ""]
  | Ap_northeast_2 [@ocaml.doc ""]
  | Ap_northeast_3 [@ocaml.doc ""]
  | Ap_south_1 [@ocaml.doc ""]
  | Ap_south_2 [@ocaml.doc ""]
  | Ap_southeast_1 [@ocaml.doc ""]
  | Ap_southeast_2 [@ocaml.doc ""]
  | Ap_southeast_3 [@ocaml.doc ""]
  | Ap_southeast_4 [@ocaml.doc ""]
  | Ap_southeast_5 [@ocaml.doc ""]
  | Ap_southeast_6 [@ocaml.doc ""]
  | Ap_southeast_7 [@ocaml.doc ""]
  | Ca_central_1 [@ocaml.doc ""]
  | Ca_west_1 [@ocaml.doc ""]
  | Cn_north_1 [@ocaml.doc ""]
  | Cn_northwest_1 [@ocaml.doc ""]
  | EU [@ocaml.doc ""]
  | Eu_central_1 [@ocaml.doc ""]
  | Eu_central_2 [@ocaml.doc ""]
  | Eu_north_1 [@ocaml.doc ""]
  | Eu_south_1 [@ocaml.doc ""]
  | Eu_south_2 [@ocaml.doc ""]
  | Eu_west_1 [@ocaml.doc ""]
  | Eu_west_2 [@ocaml.doc ""]
  | Eu_west_3 [@ocaml.doc ""]
  | Il_central_1 [@ocaml.doc ""]
  | Me_central_1 [@ocaml.doc ""]
  | Me_south_1 [@ocaml.doc ""]
  | Mx_central_1 [@ocaml.doc ""]
  | Sa_east_1 [@ocaml.doc ""]
  | Us_east_2 [@ocaml.doc ""]
  | Us_gov_east_1 [@ocaml.doc ""]
  | Us_gov_west_1 [@ocaml.doc ""]
  | Us_west_1 [@ocaml.doc ""]
  | Us_west_2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_bucket_location_output = {
  location_constraint : bucket_location_constraint option;
      [@ocaml.doc
        "Specifies the Region where the bucket resides. For a list of all the Amazon S3 supported \
         location constraints by Region, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region}Regions and \
         Endpoints}.\n\n\
        \ Buckets in Region [us-east-1] have a LocationConstraint of [null]. Buckets with a \
         LocationConstraint of [EU] reside in [eu-west-1].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_bucket_location_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket for which to get the location.\n\n\
        \ When you use this API operation with an access point, provide the alias of the access \
         point in place of the bucket name.\n\
        \ \n\
        \  When you use this API operation with an Object Lambda access point, provide the alias \
         of the Object Lambda access point in place of the bucket name. If the Object Lambda \
         access point alias in a request is not valid, the error code \
         [InvalidAccessPointAliasError] is returned. For more information about \
         [InvalidAccessPointAliasError], see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList}List \
         of Error Codes}.\n\
        \  "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_lifecycle_configuration_output = {
  rules : lifecycle_rules option; [@ocaml.doc "Container for a lifecycle rule.\n"]
  transition_default_minimum_object_size : transition_default_minimum_object_size option;
      [@ocaml.doc
        "Indicates which default minimum object size behavior is applied to the lifecycle \
         configuration.\n\n\
        \  This parameter applies to general purpose buckets only. It isn't supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \    {ul\n\
        \          {-   [all_storage_classes_128K] - Objects smaller than 128 KB will not \
         transition to any storage class by default.\n\
        \              \n\
        \               }\n\
        \          {-   [varies_by_storage_class] - Objects smaller than 128 KB will transition to \
         Glacier Flexible Retrieval or Glacier Deep Archive storage classes. By default, all other \
         storage classes will prevent transitions smaller than 128 KB. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   To customize the minimum object size for any transition you can add a filter that \
         specifies a custom [ObjectSizeGreaterThan] or [ObjectSizeLessThan] in the body of your \
         transition rule. Custom filters always take precedence over the default transition \
         behavior.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_bucket_lifecycle_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket for which to get the lifecycle information.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_bucket_inventory_configuration_output = {
  inventory_configuration : inventory_configuration option;
      [@ocaml.doc "Specifies the inventory configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_inventory_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the inventory configuration to retrieve.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  id : inventory_id; [@ocaml.doc "The ID used to identify the inventory configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_bucket_intelligent_tiering_configuration_output = {
  intelligent_tiering_configuration : intelligent_tiering_configuration option;
      [@ocaml.doc "Container for S3 Intelligent-Tiering configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_intelligent_tiering_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.\n"]
  id : intelligent_tiering_id;
      [@ocaml.doc "The ID used to identify the S3 Intelligent-Tiering configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_encryption_output = {
  server_side_encryption_configuration : server_side_encryption_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_bucket_encryption_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket from which the server-side encryption configuration is retrieved.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_bucket_cors_output = {
  cors_rules : cors_rules option;
      [@ocaml.doc
        "A set of origins and methods (cross-origin access that you want to allow). You can add up \
         to 100 rules to the configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_cors_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name for which to get the cors configuration.\n\n\
        \ When you use this API operation with an access point, provide the alias of the access \
         point in place of the bucket name.\n\
        \ \n\
        \  When you use this API operation with an Object Lambda access point, provide the alias \
         of the Object Lambda access point in place of the bucket name. If the Object Lambda \
         access point alias in a request is not valid, the error code \
         [InvalidAccessPointAliasError] is returned. For more information about \
         [InvalidAccessPointAliasError], see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList}List \
         of Error Codes}.\n\
        \  "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_analytics_configuration_output = {
  analytics_configuration : analytics_configuration option;
      [@ocaml.doc "The configuration and any analyses for the analytics filter.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_analytics_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket from which an analytics configuration is retrieved.\n"]
  id : analytics_id; [@ocaml.doc "The ID that identifies the analytics configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_acl_output = {
  owner : owner option; [@ocaml.doc "Container for the bucket owner's ID.\n"]
  grants : grants option; [@ocaml.doc "A list of grants.\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_acl_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "Specifies the S3 bucket whose ACL is being requested.\n\n\
        \ When you use this API operation with an access point, provide the alias of the access \
         point in place of the bucket name.\n\
        \ \n\
        \  When you use this API operation with an Object Lambda access point, provide the alias \
         of the Object Lambda access point in place of the bucket name. If the Object Lambda \
         access point alias in a request is not valid, the error code \
         [InvalidAccessPointAliasError] is returned. For more information about \
         [InvalidAccessPointAliasError], see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList}List \
         of Error Codes}.\n\
        \  "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_accelerate_configuration_output = {
  status : bucket_accelerate_status option;
      [@ocaml.doc "The accelerate configuration of the bucket.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_bucket_accelerate_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket for which the accelerate configuration is retrieved.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_bucket_abac_output = {
  abac_status : abac_status option; [@ocaml.doc "The ABAC status of the general purpose bucket. \n"]
}
[@@ocaml.doc ""]

type nonrec get_bucket_abac_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the general purpose bucket.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the general purpose bucket's owner. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_public_access_block_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The Amazon S3 bucket whose [PublicAccessBlock] configuration you want to delete. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_object_tagging_output = {
  version_id : object_version_id option;
      [@ocaml.doc "The versionId of the object the tag-set was removed from.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_object_tagging_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the objects from which to remove the tags. \n\n\
        \  {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \  {[\n\
        \   {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \  ]}\n\
        \  . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \  "]
  key : object_key;
      [@ocaml.doc
        "The key that identifies the object in the bucket from which to remove all tags.\n"]
  version_id : object_version_id option;
      [@ocaml.doc "The versionId of the object that the tag-set will be removed from.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec code = string [@@ocaml.doc ""]

type nonrec error = {
  key : object_key option; [@ocaml.doc "The error key.\n"]
  version_id : object_version_id option;
      [@ocaml.doc
        "The version ID of the error.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  code : code option;
      [@ocaml.doc
        "The error code is a string that uniquely identifies an error condition. It is meant to be \
         read and understood by programs that detect and handle errors by type. The following is a \
         list of Amazon S3 error codes. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html}Error responses}.\n\n\
        \ {ul\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} AccessDenied \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Access Denied\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} AccountProblem\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} There is a problem with your Amazon Web Services \
         account that prevents the action from completing successfully. Contact Amazon Web \
         Services Support for further assistance.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} AllAccessDisabled\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} All access to this Amazon S3 resource has been \
         disabled. Contact Amazon Web Services Support for further assistance.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} AmbiguousGrantByEmailAddress\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The email address you provided is associated with \
         more than one account.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} AuthorizationHeaderMalformed\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The authorization header you provided is invalid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} BadDigest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The Content-MD5 you specified did not match what \
         we received.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} BucketAlreadyExists\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The requested bucket name is not available. The \
         bucket namespace is shared by all users of the system. Please select a different name and \
         try again.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 409 Conflict\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} BucketAlreadyOwnedByYou\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The bucket you tried to create already exists, and \
         you own it. Amazon S3 returns this error in all Amazon Web Services Regions except in the \
         North Virginia Region. For legacy compatibility, if you re-create an existing bucket that \
         you already own in the North Virginia Region, Amazon S3 returns 200 OK and resets the \
         bucket access control lists (ACLs).\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} 409 Conflict (in all Regions except the North Virginia \
         Region) \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} BucketNotEmpty\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The bucket you tried to delete is not empty.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 409 Conflict\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} CredentialsNotSupported\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} This request does not support credentials.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} CrossLocationLoggingProhibited\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Cross-location logging not allowed. Buckets in one \
         geographic location cannot log information to a bucket in another location.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} EntityTooSmall\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your proposed upload is smaller than the minimum \
         allowed object size.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} EntityTooLarge\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your proposed upload exceeds the maximum allowed \
         object size.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} ExpiredToken\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The provided token has expired.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} IllegalVersioningConfigurationException \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Indicates that the versioning configuration \
         specified in the request is invalid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} IncompleteBody\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} You did not provide the number of bytes specified \
         by the Content-Length HTTP header\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} IncorrectNumberOfFilesInPostRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} POST requires exactly one file upload per request.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InlineDataTooLarge\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Inline data exceeds the maximum allowed size.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InternalError\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} We encountered an internal error. Please try again.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 500 Internal Server Error\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Server\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidAccessKeyId\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The Amazon Web Services access key ID you provided \
         does not exist in our records.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidAddressingHeader\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} You must specify the Anonymous role.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidArgument\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Invalid Argument\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidBucketName\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The specified bucket is not valid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidBucketState\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The request is not valid with the current state of \
         the bucket.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 409 Conflict\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidDigest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The Content-MD5 you specified is not valid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidEncryptionAlgorithmError\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The encryption request you specified is not valid. \
         The valid value is AES256.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidLocationConstraint\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The specified location constraint is not valid. \
         For more information about Regions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingBucket.html#access-bucket-intro}How \
         to Select a Region for Your Buckets}. \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidObjectState\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The action is not valid for the current state of \
         the object.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidPart\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} One or more of the specified parts could not be \
         found. The part might not have been uploaded, or the specified entity tag might not have \
         matched the part's entity tag.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidPartOrder\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The list of parts was not in ascending order. \
         Parts list must be specified in order by part number.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidPayer\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} All access to this object has been disabled. \
         Please contact Amazon Web Services Support for further assistance.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidPolicyDocument\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The content of the form does not meet the \
         conditions specified in the policy document.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRange\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The requested range cannot be satisfied.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 416 Requested Range Not Satisfiable\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Please use [AWS4-HMAC-SHA256].\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} SOAP requests must be made over an HTTPS connection.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Amazon S3 Transfer Acceleration is not supported \
         for buckets with non-DNS compliant names.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Amazon S3 Transfer Acceleration is not supported \
         for buckets with periods (.) in their names.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Amazon S3 Transfer Accelerate endpoint only \
         supports virtual style requests.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Amazon S3 Transfer Accelerate is not configured on \
         this bucket.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Amazon S3 Transfer Accelerate is disabled on this \
         bucket.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Amazon S3 Transfer Acceleration is not supported \
         on this bucket. Contact Amazon Web Services Support for more information.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Amazon S3 Transfer Acceleration cannot be enabled \
         on this bucket. Contact Amazon Web Services Support for more information.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidSecurity\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The provided security credentials are not valid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidSOAPRequest\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The SOAP request body is invalid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidStorageClass\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The storage class you specified is not valid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidTargetBucketForLogging\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The target bucket for logging does not exist, is \
         not owned by you, or does not have the appropriate grants for the log-delivery group. \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidToken\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The provided token is malformed or otherwise \
         invalid.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} InvalidURI\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Couldn't parse the specified URI.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} KeyTooLongError\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your key is too long.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MalformedACLError\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The XML you provided was not well-formed or did \
         not validate against our published schema.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MalformedPOSTRequest \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The body of your POST request is not well-formed \
         multipart/form-data.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MalformedXML\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} This happens when the user sends malformed XML \
         (XML that doesn't conform to the published XSD) for the configuration. The error message \
         is, \"The XML you provided was not well-formed or did not validate against our published \
         schema.\" \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MaxMessageLengthExceeded\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your request was too big.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MaxPostPreDataLengthExceededError\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your POST request fields preceding the upload file \
         were too large.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MetadataTooLarge\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your metadata headers exceed the maximum allowed \
         metadata size.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MethodNotAllowed\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The specified method is not allowed against this \
         resource.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 405 Method Not Allowed\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MissingAttachment\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} A SOAP attachment was expected, but none were found.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} N/A\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MissingContentLength\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} You must provide the Content-Length HTTP header.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 411 Length Required\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MissingRequestBodyError\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} This happens when the user sends an empty XML \
         document as a request. The error message is, \"Request body is empty.\" \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MissingSecurityElement\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The SOAP 1.1 request is missing a security element.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} MissingSecurityHeader\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your request is missing a required header.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NoLoggingStatusForKey\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} There is no such thing as a logging status \
         subresource for a key.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NoSuchBucket\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The specified bucket does not exist.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 404 Not Found\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NoSuchBucketPolicy\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The specified bucket does not have a bucket policy.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 404 Not Found\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NoSuchKey\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The specified key does not exist.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 404 Not Found\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NoSuchLifecycleConfiguration\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The lifecycle configuration does not exist. \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 404 Not Found\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NoSuchUpload\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The specified multipart upload does not exist. The \
         upload ID might be invalid, or the multipart upload might have been aborted or completed.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 404 Not Found\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NoSuchVersion \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Indicates that the version ID specified in the \
         request does not match an existing version.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 404 Not Found\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NotImplemented\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} A header you provided implies functionality that \
         is not implemented.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 501 Not Implemented\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Server\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} NotSignedUp\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your account is not signed up for the Amazon S3 \
         service. You must sign up before you can use Amazon S3. You can sign up at the following \
         URL: {{:http://aws.amazon.com/s3}Amazon S3} \n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} OperationAborted\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} A conflicting conditional action is currently in \
         progress against this resource. Try again.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 409 Conflict\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} PermanentRedirect\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The bucket you are attempting to access must be \
         addressed using the specified endpoint. Send all future requests to this endpoint.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 301 Moved Permanently\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} PreconditionFailed\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} At least one of the preconditions you specified \
         did not hold.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 412 Precondition Failed\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} Redirect\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Temporary redirect.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 307 Moved Temporarily\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} RestoreAlreadyInProgress\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Object restore is already in progress.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 409 Conflict\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} RequestIsNotMultiPartContent\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Bucket POST must be of the enclosure-type \
         multipart/form-data.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} RequestTimeout\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Your socket connection to the server was not read \
         from or written to within the timeout period.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} RequestTimeTooSkewed\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The difference between the request time and the \
         server's time is too large.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} RequestTorrentOfBucketError\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Requesting the torrent file of a bucket is not \
         permitted.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} SignatureDoesNotMatch\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The request signature we calculated does not match \
         the signature you provided. Check your Amazon Web Services secret access key and signing \
         method. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html}REST \
         Authentication} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/SOAPAuthentication.html}SOAP \
         Authentication} for details.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 403 Forbidden\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} ServiceUnavailable\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Service is unable to handle request.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 503 Service Unavailable\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Server\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} SlowDown\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} Reduce your request rate.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 503 Slow Down\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Server\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} TemporaryRedirect\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} You are being redirected to the bucket while DNS \
         updates.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 307 Moved Temporarily\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} TokenRefreshRequired\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The provided token must be refreshed.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} TooManyBuckets\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} You have attempted to create more buckets than \
         allowed.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} UnexpectedContent\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} This request does not support content.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} UnresolvableGrantByEmailAddress\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The email address you provided does not match any \
         account on record.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       {-  {ul\n\
        \                 {-   {i Code:} UserKeyMustBeSpecified\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i Description:} The bucket POST must contain the specified field \
         name. If it is specified, check the order of the fields.\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i HTTP Status Code:} 400 Bad Request\n\
        \                     \n\
        \                      }\n\
        \                 {-   {i SOAP Fault Code Prefix:} Client\n\
        \                     \n\
        \                      }\n\
        \                 \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \   \n\
        \   "]
  message : message option;
      [@ocaml.doc
        "The error message contains a generic description of the error condition in English. It is \
         intended for a human audience. Simple programs display the message directly to the end \
         user if they encounter an error condition they don't know how or don't care to handle. \
         Sophisticated programs with more exhaustive error handling and proper \
         internationalization are more likely to ignore the error message.\n"]
}
[@@ocaml.doc "Container for all error elements.\n"]

type nonrec errors = error list [@@ocaml.doc ""]

type nonrec delete_marker_version_id = string [@@ocaml.doc ""]

type nonrec deleted_object = {
  key : object_key option; [@ocaml.doc "The name of the deleted object.\n"]
  version_id : object_version_id option;
      [@ocaml.doc
        "The version ID of the deleted object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  delete_marker : delete_marker option;
      [@ocaml.doc
        "Indicates whether the specified object version that was permanently deleted was (true) or \
         was not (false) a delete marker before deletion. In a simple DELETE, this header \
         indicates whether (true) or not (false) the current version of the object is a delete \
         marker. To learn more about delete markers, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html}Working with \
         delete markers}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  delete_marker_version_id : delete_marker_version_id option;
      [@ocaml.doc
        "The version ID of the delete marker created as a result of the DELETE operation. If you \
         delete a specific object version, the value returned by this header is the version ID of \
         the object version deleted.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Information about the deleted object.\n"]

type nonrec deleted_objects = deleted_object list [@@ocaml.doc ""]

type nonrec delete_objects_output = {
  deleted : deleted_objects option;
      [@ocaml.doc
        "Container element for a successful delete. It identifies the object that was successfully \
         deleted.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
  errors : errors option;
      [@ocaml.doc
        "Container for a failed delete action that describes the object that Amazon S3 attempted \
         to delete and the error it encountered.\n"]
}
[@@ocaml.doc ""]

type nonrec quiet = bool [@@ocaml.doc ""]

type nonrec last_modified_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec object_identifier = {
  key : object_key;
      [@ocaml.doc
        "Key name of the object.\n\n\
        \  Replacement must be made for object keys containing special characters (such as \
         carriage returns) when using XML requests. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints} \
         XML related object key constraints}.\n\
        \  \n\
        \   "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID for the specific version of the object to delete.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  e_tag : e_tag option;
      [@ocaml.doc
        "An entity tag (ETag) is an identifier assigned by a web server to a specific version of a \
         resource found at a URL. This header field makes the request method conditional on \
         [ETags]. \n\n\
        \  Entity tags (ETags) for S3 Express One Zone are random alphanumeric strings unique to \
         the object. \n\
        \  \n\
        \   "]
  last_modified_time : last_modified_time option;
      [@ocaml.doc
        "If present, the objects are deleted only if its modification times matches the provided \
         [Timestamp]. \n\n\
        \  This functionality is only supported for directory buckets.\n\
        \  \n\
        \   "]
  size : size option;
      [@ocaml.doc
        "If present, the objects are deleted only if its size matches the provided size in bytes. \n\n\
        \  This functionality is only supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Object Identifier is unique value to identify objects.\n"]

type nonrec object_identifier_list = object_identifier list [@@ocaml.doc ""]

type nonrec delete = {
  objects : object_identifier_list;
      [@ocaml.doc
        "The object to delete.\n\n\
        \   {b Directory buckets} - For directory buckets, an object that's composed entirely of \
         whitespace characters is not supported by the [DeleteObjects] API operation. The request \
         will receive a [400 Bad Request] error and none of the objects in the request will be \
         deleted.\n\
        \  \n\
        \   "]
  quiet : quiet option;
      [@ocaml.doc
        "Element to enable quiet mode for the request. When you add this element, you must set its \
         value to [true].\n"]
}
[@@ocaml.doc "Container for the objects to delete.\n"]

type nonrec delete_objects_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name containing the objects to delete. \n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  delete : delete; [@ocaml.doc "Container for the request.\n"]
  mf_a : mf_a option;
      [@ocaml.doc
        "The concatenation of the authentication device's serial number, a space, and the value \
         that is displayed on your authentication device. Required to permanently delete a \
         versioned object if versioning is configured with MFA delete enabled.\n\n\
        \ When performing the [DeleteObjects] operation on an MFA delete enabled bucket, which \
         attempts to delete the specified versioned objects, you must include an MFA token. If you \
         don't provide an MFA token, the entire request will fail, even if there are non-versioned \
         objects that you are trying to delete. If you provide an invalid token, whether there are \
         versioned object keys in the request or not, the entire Multi-Object Delete request will \
         fail. For information about MFA Delete, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html#MultiFactorAuthenticationDelete} \
         MFA Delete} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  request_payer : request_payer option; [@ocaml.doc ""]
  bypass_governance_retention : bypass_governance_retention option;
      [@ocaml.doc
        "Specifies whether you want to delete this object even if it has a Governance-type Object \
         Lock in place. To use this header, you must have the [s3:BypassGovernanceRetention] \
         permission.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm used to create the checksum for the object when you use the SDK. \
         This header will not provide any additional functionality if you don't use the SDK. When \
         you send this header, there must be a corresponding \n\
         {[\n\
         x-amz-checksum-{i algorithm} \n\
         ]}\n\
        \ or [x-amz-trailer] header sent. Otherwise, Amazon S3 fails the request with the HTTP \
         status code [400 Bad Request].\n\n\
        \ For the \n\
        \ {[\n\
        \ x-amz-checksum-{i algorithm} \n\
        \ ]}\n\
        \  header, replace \n\
        \ {[\n\
        \  {i algorithm} \n\
        \ ]}\n\
        \  with the supported algorithm from the following list: \n\
        \ \n\
        \  {ul\n\
        \        {-   [CRC32] \n\
        \            \n\
        \             }\n\
        \        {-   [CRC32C] \n\
        \            \n\
        \             }\n\
        \        {-   [CRC64NVME] \n\
        \            \n\
        \             }\n\
        \        {-   [MD5] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA1] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA256] \n\
        \            \n\
        \             }\n\
        \        {-   [SHA512] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH3] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH64] \n\
        \            \n\
        \             }\n\
        \        {-   [XXHASH128] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\
        \   \n\
        \    If the individual checksum value you provide through \n\
        \    {[\n\
        \    x-amz-checksum-{i algorithm} \n\
        \    ]}\n\
        \     doesn't match the checksum algorithm you set through [x-amz-sdk-checksum-algorithm], \
         Amazon S3 fails the request with a [BadDigest] error.\n\
        \    \n\
        \     If you provide an individual checksum, Amazon S3 ignores any provided \
         [ChecksumAlgorithm] parameter.\n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec delete_object_annotation_output = {
  object_version_id : object_version_id option;
      [@ocaml.doc "The version ID of the object that the annotation was deleted from.\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_object_annotation_request = {
  bucket : bucket_name; [@ocaml.doc "The name of the bucket that contains the object.\n"]
  key : object_key; [@ocaml.doc "The object key.\n"]
  annotation_name : annotation_name;
      [@ocaml.doc
        "The name of the annotation to delete. Annotation names are UTF-8 encoded and cannot start \
         with [aws] or [s3] (case-insensitive).\n\n\
        \ Length Constraints: Minimum length of 1. Maximum length of 512 bytes.\n\
        \ "]
  version_id : object_version_id option; [@ocaml.doc "The version ID of the object.\n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc "The account ID of the expected bucket owner.\n"]
  object_if_match : object_if_match option;
      [@ocaml.doc
        "If specified, the operation only succeeds if the object's ETag matches the provided value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_object_output = {
  delete_marker : delete_marker option;
      [@ocaml.doc
        "Indicates whether the specified object version that was permanently deleted was (true) or \
         was not (false) a delete marker before deletion. In a simple DELETE, this header \
         indicates whether (true) or not (false) the current version of the object is a delete \
         marker. To learn more about delete markers, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html}Working with \
         delete markers}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Returns the version ID of the delete marker created as a result of the DELETE operation.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec if_match_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec if_match_last_modified_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec delete_object_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name of the bucket containing the object. \n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  key : object_key; [@ocaml.doc "Key name of the object to delete.\n"]
  mf_a : mf_a option;
      [@ocaml.doc
        "The concatenation of the authentication device's serial number, a space, and the value \
         that is displayed on your authentication device. Required to permanently delete a \
         versioned object if versioning is configured with MFA delete enabled.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID used to reference a specific version of the object.\n\n\
        \  For directory buckets in this API operation, only the [null] value of the version ID is \
         supported.\n\
        \  \n\
        \   "]
  request_payer : request_payer option; [@ocaml.doc ""]
  bypass_governance_retention : bypass_governance_retention option;
      [@ocaml.doc
        "Indicates whether S3 Object Lock should bypass Governance-mode restrictions to process \
         this operation. To use this header, you must have the [s3:BypassGovernanceRetention] \
         permission.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  if_match : if_match option;
      [@ocaml.doc
        "Deletes the object if the ETag (entity tag) value provided during the delete operation \
         matches the ETag of the object in S3. If the ETag values do not match, the operation \
         returns a [412 Precondition Failed] error.\n\n\
        \ Expects the ETag value as a string. [If-Match] does accept a string value of an '*' \
         (asterisk) character to denote a match of any ETag.\n\
        \ \n\
        \  For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \  "]
  if_match_last_modified_time : if_match_last_modified_time option;
      [@ocaml.doc
        "If present, the object is deleted only if its modification times matches the provided \
         [Timestamp]. If the [Timestamp] values do not match, the operation returns a [412 \
         Precondition Failed] error. If the [Timestamp] matches or if the object \
         doesn\226\128\153t exist, the operation returns a [204 Success (No Content)] response.\n\n\
        \  This functionality is only supported for directory buckets.\n\
        \  \n\
        \   "]
  if_match_size : if_match_size option;
      [@ocaml.doc
        "If present, the object is deleted only if its size matches the provided size in bytes. If \
         the [Size] value does not match, the operation returns a [412 Precondition Failed] error. \
         If the [Size] matches or if the object doesn\226\128\153t exist, the operation returns a \
         [204 Success (No Content)] response.\n\n\
        \  This functionality is only supported for directory buckets.\n\
        \  \n\
        \     You can use the [If-Match], [x-amz-if-match-last-modified-time] and \
         [x-amz-if-match-size] conditional headers in conjunction with each-other or individually.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_website_request = {
  bucket : bucket_name;
      [@ocaml.doc "The bucket name for which you want to remove the website configuration. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_tagging_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket that has the tag set to be removed.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_replication_request = {
  bucket : bucket_name; [@ocaml.doc " The bucket name. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_policy_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The bucket name.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_ownership_controls_request = {
  bucket : bucket_name;
      [@ocaml.doc "The Amazon S3 bucket whose [OwnershipControls] you want to delete. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_metrics_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the metrics configuration to delete.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  id : metrics_id;
      [@ocaml.doc
        "The ID used to identify the metrics configuration. The ID has a 64 character limit and \
         can only contain letters, numbers, periods, dashes, and underscores.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_metadata_table_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that you want to remove the metadata table configuration from. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected bucket owner of the general purpose bucket that you want to remove the \
         metadata table configuration from. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_metadata_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that you want to remove the metadata configuration from. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected bucket owner of the general purpose bucket that you want to remove the \
         metadata table configuration from. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_lifecycle_request = {
  bucket : bucket_name; [@ocaml.doc "The bucket name of the lifecycle to delete.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  This parameter applies to general purpose buckets only. It is not supported for \
         directory bucket lifecycle configurations.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_inventory_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the inventory configuration to delete.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  id : inventory_id; [@ocaml.doc "The ID used to identify the inventory configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_intelligent_tiering_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the Amazon S3 bucket whose configuration you want to modify or retrieve.\n"]
  id : intelligent_tiering_id;
      [@ocaml.doc "The ID used to identify the S3 Intelligent-Tiering configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_encryption_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket containing the server-side encryption configuration to delete.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_cors_request = {
  bucket : bucket_name;
      [@ocaml.doc "Specifies the bucket whose [cors] configuration is being deleted.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_analytics_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc "The name of the bucket from which an analytics configuration is deleted.\n"]
  id : analytics_id; [@ocaml.doc "The ID that identifies the analytics configuration.\n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_bucket_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "Specifies the bucket being deleted.\n\n\
        \  {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \ {[\n\
        \ https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \ ]}\n\
        \ . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \ "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n\n\
        \  For directory buckets, this header is not supported in this API operation. If you \
         specify this header, the request fails with the HTTP status code [501 Not Implemented].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec session_expiration = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec session_credential_value = string [@@ocaml.doc ""]

type nonrec session_credentials = {
  access_key_id : access_key_id_value;
      [@ocaml.doc
        "A unique identifier that's associated with a secret access key. The access key ID and the \
         secret access key are used together to sign programmatic Amazon Web Services requests \
         cryptographically. \n"]
  secret_access_key : session_credential_value;
      [@ocaml.doc
        "A key that's used with the access key ID to cryptographically sign programmatic Amazon \
         Web Services requests. Signing a request identifies the sender and prevents the request \
         from being altered. \n"]
  session_token : session_credential_value;
      [@ocaml.doc
        "A part of the temporary security credentials. The session token is used to validate the \
         temporary security credentials. \n"]
  expiration : session_expiration;
      [@ocaml.doc
        "Temporary security credentials expire after a specified interval. After temporary \
         credentials expire, any calls that you make with those credentials will fail. So you must \
         generate a new set of temporary credentials. Temporary credentials cannot be extended or \
         refreshed beyond the original specified interval.\n"]
}
[@@ocaml.doc
  "The established temporary security credentials of the session.\n\n\
  \   {b Directory buckets} - These session credentials are only supported for the authentication \
   and authorization of Zonal endpoint API operations on directory buckets.\n\
  \  \n\
  \   "]

type nonrec create_session_output = {
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store objects in the directory bucket.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If you specify [x-amz-server-side-encryption] with [aws:kms], this header indicates the \
         ID of the KMS symmetric encryption customer managed key that was used for object \
         encryption.\n"]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "If present, indicates the Amazon Web Services KMS Encryption Context to use for object \
         encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, \
         which contains the encryption context as key-value pairs. This value is stored as object \
         metadata and automatically gets passed on to Amazon Web Services KMS for future \
         [GetObject] operations on this object.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether to use an S3 Bucket Key for server-side encryption with KMS keys \
         (SSE-KMS).\n"]
  credentials : session_credentials;
      [@ocaml.doc "The established temporary security credentials for the created session.\n"]
}
[@@ocaml.doc ""]

type nonrec session_mode = ReadOnly [@ocaml.doc ""] | ReadWrite [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec create_session_request = {
  session_mode : session_mode option;
      [@ocaml.doc
        "Specifies the mode of the session that will be created, either [ReadWrite] or [ReadOnly]. \
         If no session mode is specified, the default behavior attempts to create a session with \
         the maximum allowable privilege. It will first attempt to create a [ReadWrite] session, \
         and if that is not allowed by permissions, it will attempt to create a [ReadOnly] \
         session. If neither session type is allowed, the request will return an Access Denied \
         error. A [ReadWrite] session is capable of executing all the Zonal endpoint API \
         operations on a directory bucket. A [ReadOnly] session is constrained to execute the \
         following Zonal endpoint API operations: [GetObject], [HeadObject], [ListObjectsV2], \
         [GetObjectAttributes], [ListParts], and [ListMultipartUploads].\n"]
  bucket : bucket_name; [@ocaml.doc "The name of the bucket that you create a session for.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm to use when you store objects in the directory \
         bucket.\n\n\
        \ For directory buckets, there are only two supported options for server-side encryption: \
         server-side encryption with Amazon S3 managed keys (SSE-S3) ([AES256]) and server-side \
         encryption with KMS keys (SSE-KMS) ([aws:kms]). By default, Amazon S3 encrypts data with \
         SSE-S3. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/serv-side-encryption.html}Protecting \
         data with server-side encryption} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b S3 access points for Amazon FSx } - When accessing data stored in Amazon FSx file \
         systems using S3 access points, the only valid server side encryption option is \
         [aws:fsx]. All Amazon FSx file systems have encryption configured by default and are \
         encrypted at rest. Data is automatically encrypted before being written to the file \
         system, and automatically decrypted as it is read. These processes are handled \
         transparently by Amazon FSx.\n\
        \  "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If you specify [x-amz-server-side-encryption] with [aws:kms], you must specify the [\n\
        \         x-amz-server-side-encryption-aws-kms-key-id] header with the ID (Key ID or Key \
         ARN) of the KMS symmetric encryption customer managed key to use. Otherwise, you get an \
         HTTP [400 Bad Request] error. Only use the key ID or key ARN. The key alias format of the \
         KMS key isn't supported. Also, if the KMS key doesn't exist in the same account that't \
         issuing the command, you must use the full Key ARN not the Key ID. \n\n\
        \ Your SSE-KMS configuration can only support 1 \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer \
         managed key} per directory bucket's lifetime. The \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
         Web Services managed key} ([aws/s3]) isn't supported. \n\
        \ "]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "Specifies the Amazon Web Services KMS Encryption Context as an additional encryption \
         context to use for object encryption. The value of this header is a Base64 encoded string \
         of a UTF-8 encoded JSON, which contains the encryption context as key-value pairs. This \
         value is stored as object metadata and automatically gets passed on to Amazon Web \
         Services KMS for future [GetObject] operations on this object.\n\n\
        \  {b General purpose buckets} - This value must be explicitly added during [CopyObject] \
         operations if you want an additional encryption context for your object. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html#encryption-context}Encryption \
         context} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Directory buckets} - You can optionally provide an explicit encryption context \
         value. The value must match the default encryption context - the bucket Amazon Resource \
         Name (ARN). An additional encryption context value is not supported. \n\
        \  "]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with \
         server-side encryption using KMS keys (SSE-KMS).\n\n\
        \ S3 Bucket Keys are always enabled for [GET] and [PUT] operations in a directory bucket \
         and can\226\128\153t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS \
         encrypted objects from general purpose buckets to directory buckets, from directory \
         buckets to general purpose buckets, or between directory buckets, through \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops}the \
         Copy operation in Batch Operations}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job}the import \
         jobs}. In this case, Amazon S3 makes a call to KMS every time a copy request is made for \
         a KMS-encrypted object.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_multipart_upload_output = {
  abort_date : abort_date option;
      [@ocaml.doc
        "If the bucket has a lifecycle rule configured with an action to abort incomplete \
         multipart uploads and the prefix in the lifecycle rule matches the object name in the \
         request, the response includes this header. The header indicates when the initiated \
         multipart upload becomes eligible for an abort operation. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config} \
         Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Configuration} in the {i \
         Amazon S3 User Guide}.\n\n\
        \ The response also includes the [x-amz-abort-rule-id] header that provides the ID of the \
         lifecycle configuration rule that defines the abort action.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  abort_rule_id : abort_rule_id option;
      [@ocaml.doc
        "This header is returned along with the [x-amz-abort-date] header. It identifies the \
         applicable lifecycle configuration rule that defines the action to abort incomplete \
         multipart uploads.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  bucket : bucket_name option;
      [@ocaml.doc
        "The name of the bucket to which the multipart upload was initiated. Does not return the \
         access point ARN or access point alias if used.\n\n\
        \  Access points are not supported by directory buckets.\n\
        \  \n\
        \   "]
  key : object_key option; [@ocaml.doc "Object key for which the multipart upload was initiated.\n"]
  upload_id : multipart_upload_id option; [@ocaml.doc "ID for the initiated multipart upload.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to confirm the encryption algorithm that's used.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to provide the round-trip message integrity \
         verification of the customer-provided encryption key.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "If present, indicates the Amazon Web Services KMS Encryption Context to use for object \
         encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, \
         which contains the encryption context as key-value pairs.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption \
         with Key Management Service (KMS) keys (SSE-KMS).\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc "The algorithm that was used to create a checksum of the object.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        " Indicates the checksum type that you want Amazon S3 to use to calculate the \
         object\226\128\153s checksum value. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_multipart_upload_request = {
  ac_l : object_canned_ac_l option;
      [@ocaml.doc
        "The canned ACL to apply to the object. Amazon S3 supports a set of predefined ACLs, known \
         as {i canned ACLs}. Each canned ACL has a predefined set of grantees and permissions. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#CannedACL}Canned \
         ACL} in the {i Amazon S3 User Guide}.\n\n\
        \ By default, all objects are private. Only the owner has full access control. When \
         uploading an object, you can grant access permissions to individual Amazon Web Services \
         accounts or to predefined groups defined by Amazon S3. These permissions are then added \
         to the access control list (ACL) on the new object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html}Using ACLs}. \
         One way to grant the permissions using the request headers is to specify a canned ACL \
         with the [x-amz-acl] request header.\n\
        \ \n\
        \   {ul\n\
        \         {-  This functionality is not supported for directory buckets.\n\
        \             \n\
        \              }\n\
        \         {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket where the multipart upload is initiated and where the object is \
         uploaded.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  cache_control : cache_control option;
      [@ocaml.doc "Specifies caching behavior along the request/reply chain.\n"]
  content_disposition : content_disposition option;
      [@ocaml.doc "Specifies presentational information for the object.\n"]
  content_encoding : content_encoding option;
      [@ocaml.doc
        "Specifies what content encodings have been applied to the object and thus what decoding \
         mechanisms must be applied to obtain the media-type referenced by the Content-Type header \
         field.\n\n\
        \  For directory buckets, only the [aws-chunked] value is supported in this header field.\n\
        \  \n\
        \   "]
  content_language : content_language option; [@ocaml.doc "The language that the content is in.\n"]
  content_type : content_type option;
      [@ocaml.doc "A standard MIME type describing the format of the object data.\n"]
  expires : expires option;
      [@ocaml.doc "The date and time at which the object is no longer cacheable.\n"]
  grant_full_control : grant_full_control option;
      [@ocaml.doc
        "Specify access permissions explicitly to give the grantee READ, READ_ACP, and WRITE_ACP \
         permissions on the object.\n\n\
        \ By default, all objects are private. Only the owner has full access control. When \
         uploading an object, you can use this header to explicitly grant access permissions to \
         specific Amazon Web Services accounts or groups. This header maps to specific permissions \
         that Amazon S3 supports in an ACL. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html}Access Control List \
         (ACL) Overview} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \  You specify each grantee as a type=value pair, where the type is one of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-   [id] \226\128\147 if the value specified is the canonical user ID of an \
         Amazon Web Services account\n\
        \             \n\
        \              }\n\
        \         {-   [uri] \226\128\147 if you are granting permissions to a predefined group\n\
        \             \n\
        \              }\n\
        \         {-   [emailAddress] \226\128\147 if the value specified is the email address of \
         an Amazon Web Services account\n\
        \             \n\
        \               Using email addresses to specify a grantee is only supported in the \
         following Amazon Web Services Regions: \n\
        \               \n\
        \                {ul\n\
        \                      {-  US East (N. Virginia)\n\
        \                          \n\
        \                           }\n\
        \                      {-  US West (N. California)\n\
        \                          \n\
        \                           }\n\
        \                      {-   US West (Oregon)\n\
        \                          \n\
        \                           }\n\
        \                      {-   Asia Pacific (Singapore)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Sydney)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Tokyo)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Europe (Ireland)\n\
        \                          \n\
        \                           }\n\
        \                      {-  South America (S\195\163o Paulo)\n\
        \                          \n\
        \                           }\n\
        \                      \n\
        \          }\n\
        \           For a list of all the Amazon S3 supported Regions and endpoints, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region}Regions and \
         Endpoints} in the Amazon Web Services General Reference.\n\
        \           \n\
        \             }\n\
        \         }\n\
        \   For example, the following [x-amz-grant-read] header grants the Amazon Web Services \
         accounts identified by account IDs permissions to read object data and its metadata:\n\
        \   \n\
        \     [x-amz-grant-read: id=\"11112222333\", id=\"444455556666\" ] \n\
        \    \n\
        \      {ul\n\
        \            {-  This functionality is not supported for directory buckets.\n\
        \                \n\
        \                 }\n\
        \            {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   "]
  grant_read : grant_read option;
      [@ocaml.doc
        "Specify access permissions explicitly to allow grantee to read the object data and its \
         metadata.\n\n\
        \ By default, all objects are private. Only the owner has full access control. When \
         uploading an object, you can use this header to explicitly grant access permissions to \
         specific Amazon Web Services accounts or groups. This header maps to specific permissions \
         that Amazon S3 supports in an ACL. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html}Access Control List \
         (ACL) Overview} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \  You specify each grantee as a type=value pair, where the type is one of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-   [id] \226\128\147 if the value specified is the canonical user ID of an \
         Amazon Web Services account\n\
        \             \n\
        \              }\n\
        \         {-   [uri] \226\128\147 if you are granting permissions to a predefined group\n\
        \             \n\
        \              }\n\
        \         {-   [emailAddress] \226\128\147 if the value specified is the email address of \
         an Amazon Web Services account\n\
        \             \n\
        \               Using email addresses to specify a grantee is only supported in the \
         following Amazon Web Services Regions: \n\
        \               \n\
        \                {ul\n\
        \                      {-  US East (N. Virginia)\n\
        \                          \n\
        \                           }\n\
        \                      {-  US West (N. California)\n\
        \                          \n\
        \                           }\n\
        \                      {-   US West (Oregon)\n\
        \                          \n\
        \                           }\n\
        \                      {-   Asia Pacific (Singapore)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Sydney)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Tokyo)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Europe (Ireland)\n\
        \                          \n\
        \                           }\n\
        \                      {-  South America (S\195\163o Paulo)\n\
        \                          \n\
        \                           }\n\
        \                      \n\
        \          }\n\
        \           For a list of all the Amazon S3 supported Regions and endpoints, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region}Regions and \
         Endpoints} in the Amazon Web Services General Reference.\n\
        \           \n\
        \             }\n\
        \         }\n\
        \   For example, the following [x-amz-grant-read] header grants the Amazon Web Services \
         accounts identified by account IDs permissions to read object data and its metadata:\n\
        \   \n\
        \     [x-amz-grant-read: id=\"11112222333\", id=\"444455556666\" ] \n\
        \    \n\
        \      {ul\n\
        \            {-  This functionality is not supported for directory buckets.\n\
        \                \n\
        \                 }\n\
        \            {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   "]
  grant_read_ac_p : grant_read_ac_p option;
      [@ocaml.doc
        "Specify access permissions explicitly to allows grantee to read the object ACL.\n\n\
        \ By default, all objects are private. Only the owner has full access control. When \
         uploading an object, you can use this header to explicitly grant access permissions to \
         specific Amazon Web Services accounts or groups. This header maps to specific permissions \
         that Amazon S3 supports in an ACL. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html}Access Control List \
         (ACL) Overview} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \  You specify each grantee as a type=value pair, where the type is one of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-   [id] \226\128\147 if the value specified is the canonical user ID of an \
         Amazon Web Services account\n\
        \             \n\
        \              }\n\
        \         {-   [uri] \226\128\147 if you are granting permissions to a predefined group\n\
        \             \n\
        \              }\n\
        \         {-   [emailAddress] \226\128\147 if the value specified is the email address of \
         an Amazon Web Services account\n\
        \             \n\
        \               Using email addresses to specify a grantee is only supported in the \
         following Amazon Web Services Regions: \n\
        \               \n\
        \                {ul\n\
        \                      {-  US East (N. Virginia)\n\
        \                          \n\
        \                           }\n\
        \                      {-  US West (N. California)\n\
        \                          \n\
        \                           }\n\
        \                      {-   US West (Oregon)\n\
        \                          \n\
        \                           }\n\
        \                      {-   Asia Pacific (Singapore)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Sydney)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Tokyo)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Europe (Ireland)\n\
        \                          \n\
        \                           }\n\
        \                      {-  South America (S\195\163o Paulo)\n\
        \                          \n\
        \                           }\n\
        \                      \n\
        \          }\n\
        \           For a list of all the Amazon S3 supported Regions and endpoints, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region}Regions and \
         Endpoints} in the Amazon Web Services General Reference.\n\
        \           \n\
        \             }\n\
        \         }\n\
        \   For example, the following [x-amz-grant-read] header grants the Amazon Web Services \
         accounts identified by account IDs permissions to read object data and its metadata:\n\
        \   \n\
        \     [x-amz-grant-read: id=\"11112222333\", id=\"444455556666\" ] \n\
        \    \n\
        \      {ul\n\
        \            {-  This functionality is not supported for directory buckets.\n\
        \                \n\
        \                 }\n\
        \            {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   "]
  grant_write_ac_p : grant_write_ac_p option;
      [@ocaml.doc
        "Specify access permissions explicitly to allows grantee to allow grantee to write the ACL \
         for the applicable object.\n\n\
        \ By default, all objects are private. Only the owner has full access control. When \
         uploading an object, you can use this header to explicitly grant access permissions to \
         specific Amazon Web Services accounts or groups. This header maps to specific permissions \
         that Amazon S3 supports in an ACL. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html}Access Control List \
         (ACL) Overview} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \  You specify each grantee as a type=value pair, where the type is one of the following:\n\
        \  \n\
        \   {ul\n\
        \         {-   [id] \226\128\147 if the value specified is the canonical user ID of an \
         Amazon Web Services account\n\
        \             \n\
        \              }\n\
        \         {-   [uri] \226\128\147 if you are granting permissions to a predefined group\n\
        \             \n\
        \              }\n\
        \         {-   [emailAddress] \226\128\147 if the value specified is the email address of \
         an Amazon Web Services account\n\
        \             \n\
        \               Using email addresses to specify a grantee is only supported in the \
         following Amazon Web Services Regions: \n\
        \               \n\
        \                {ul\n\
        \                      {-  US East (N. Virginia)\n\
        \                          \n\
        \                           }\n\
        \                      {-  US West (N. California)\n\
        \                          \n\
        \                           }\n\
        \                      {-   US West (Oregon)\n\
        \                          \n\
        \                           }\n\
        \                      {-   Asia Pacific (Singapore)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Sydney)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Asia Pacific (Tokyo)\n\
        \                          \n\
        \                           }\n\
        \                      {-  Europe (Ireland)\n\
        \                          \n\
        \                           }\n\
        \                      {-  South America (S\195\163o Paulo)\n\
        \                          \n\
        \                           }\n\
        \                      \n\
        \          }\n\
        \           For a list of all the Amazon S3 supported Regions and endpoints, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region}Regions and \
         Endpoints} in the Amazon Web Services General Reference.\n\
        \           \n\
        \             }\n\
        \         }\n\
        \   For example, the following [x-amz-grant-read] header grants the Amazon Web Services \
         accounts identified by account IDs permissions to read object data and its metadata:\n\
        \   \n\
        \     [x-amz-grant-read: id=\"11112222333\", id=\"444455556666\" ] \n\
        \    \n\
        \      {ul\n\
        \            {-  This functionality is not supported for directory buckets.\n\
        \                \n\
        \                 }\n\
        \            {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   "]
  key : object_key; [@ocaml.doc "Object key for which the multipart upload is to be initiated.\n"]
  metadata : metadata option; [@ocaml.doc "A map of metadata to store with the object in S3.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \ {ul\n\
        \       {-   {b Directory buckets } - For directory buckets, there are only two supported \
         options for server-side encryption: server-side encryption with Amazon S3 managed keys \
         (SSE-S3) ([AES256]) and server-side encryption with KMS keys (SSE-KMS) ([aws:kms]). We \
         recommend that the bucket's default encryption uses the desired encryption configuration \
         and you don't override the bucket default encryption in your [CreateSession] requests or \
         [PUT] object requests. Then, new objects are automatically encrypted with the desired \
         encryption settings. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html}Protecting \
         data with server-side encryption} in the {i Amazon S3 User Guide}. For more information \
         about the encryption overriding behaviors in directory buckets, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html}Specifying \
         server-side encryption with KMS for new object uploads}. \n\
        \           \n\
        \            In the Zonal endpoint API calls (except \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}) \
         using the REST API, the encryption request headers must match the encryption settings \
         that are specified in the [CreateSession] request. You can't override the values of the \
         encryption settings ([x-amz-server-side-encryption], \
         [x-amz-server-side-encryption-aws-kms-key-id], [x-amz-server-side-encryption-context], \
         and [x-amz-server-side-encryption-bucket-key-enabled]) that are specified in the \
         [CreateSession] request. You don't need to explicitly specify these encryption settings \
         values in Zonal endpoint API calls, and Amazon S3 will use the encryption settings values \
         from the [CreateSession] request to protect new objects in the directory bucket. \n\
        \            \n\
        \              When you use the CLI or the Amazon Web Services SDKs, for [CreateSession], \
         the session token refreshes automatically to avoid service interruptions when a session \
         expires. The CLI or the Amazon Web Services SDKs use the bucket's default encryption \
         configuration for the [CreateSession] request. It's not supported to override the \
         encryption settings values in the [CreateSession] request. So in the Zonal endpoint API \
         calls (except \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject} and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}), \
         the encryption request headers must match the default encryption configuration of the \
         directory bucket. \n\
        \              \n\
        \                }\n\
        \       {-   {b S3 access points for Amazon FSx } - When accessing data stored in Amazon \
         FSx file systems using S3 access points, the only valid server side encryption option is \
         [aws:fsx]. All Amazon FSx file systems have encryption configured by default and are \
         encrypted at rest. Data is automatically encrypted before being written to the file \
         system, and automatically decrypted as it is read. These processes are handled \
         transparently by Amazon FSx.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  storage_class : storage_class option;
      [@ocaml.doc
        "By default, Amazon S3 uses the STANDARD Storage Class to store newly created objects. The \
         STANDARD storage class provides high durability and high availability. Depending on \
         performance needs, you can specify a different Storage Class. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html}Storage \
         Classes} in the {i Amazon S3 User Guide}.\n\n\
        \  {ul\n\
        \        {-  Directory buckets only support [EXPRESS_ONEZONE] (the S3 Express One Zone \
         storage class) in Availability Zones and [ONEZONE_IA] (the S3 One Zone-Infrequent Access \
         storage class) in Dedicated Local Zones.\n\
        \            \n\
        \             }\n\
        \        {-  Amazon S3 on Outposts only uses the OUTPOSTS Storage Class.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  website_redirect_location : website_redirect_location option;
      [@ocaml.doc
        "If the bucket is configured as a website, redirects requests for this object to another \
         object in the same bucket or to an external URL. Amazon S3 stores the value of this \
         header in the object metadata.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when encrypting the object (for example, AES256).\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. \
         This value is used to store the object and then it is discarded; Amazon S3 does not store \
         the encryption key. The key must be appropriate for use with the algorithm specified in \
         the [x-amz-server-side-encryption-customer-algorithm] header.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the customer-provided encryption key according to RFC \
         1321. Amazon S3 uses this header for a message integrity check to ensure that the \
         encryption key was transmitted without error.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. If \
         the KMS key doesn't exist in the same account that's issuing the command, you must use \
         the full Key ARN not the Key ID.\n\n\
        \  {b General purpose buckets} - If you specify [x-amz-server-side-encryption] with \
         [aws:kms] or [aws:kms:dsse], this header specifies the ID (Key ID, Key ARN, or Key Alias) \
         of the KMS key to use. If you specify [x-amz-server-side-encryption:aws:kms] or \
         [x-amz-server-side-encryption:aws:kms:dsse], but do not provide \
         [x-amz-server-side-encryption-aws-kms-key-id], Amazon S3 uses the Amazon Web Services \
         managed key ([aws/s3]) to protect the data.\n\
        \ \n\
        \   {b Directory buckets} - To encrypt data using SSE-KMS, it's recommended to specify the \
         [x-amz-server-side-encryption] header to [aws:kms]. Then, the \
         [x-amz-server-side-encryption-aws-kms-key-id] header implicitly uses the bucket's default \
         KMS customer managed key ID. If you want to explicitly set the [\n\
        \         x-amz-server-side-encryption-aws-kms-key-id] header, it must match the bucket's \
         default customer managed key (using key ID or ARN, not alias). Your SSE-KMS configuration \
         can only support 1 \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer \
         managed key} per directory bucket's lifetime. The \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
         Web Services managed key} ([aws/s3]) isn't supported. Incorrect key specification results \
         in an HTTP [400 Bad Request] error. \n\
        \  "]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "Specifies the Amazon Web Services KMS Encryption Context to use for object encryption. \
         The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, which \
         contains the encryption context as key-value pairs.\n\n\
        \  {b Directory buckets} - You can optionally provide an explicit encryption context \
         value. The value must match the default encryption context - the bucket Amazon Resource \
         Name (ARN). An additional encryption context value is not supported. \n\
        \ "]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with \
         server-side encryption using Key Management Service (KMS) keys (SSE-KMS).\n\n\
        \  {b General purpose buckets} - Setting this header to [true] causes Amazon S3 to use an \
         S3 Bucket Key for object encryption with SSE-KMS. Also, specifying this header with a PUT \
         action doesn't affect bucket-level settings for S3 Bucket Key.\n\
        \ \n\
        \   {b Directory buckets} - S3 Bucket Keys are always enabled for [GET] and [PUT] \
         operations in a directory bucket and can\226\128\153t be disabled. S3 Bucket Keys aren't \
         supported, when you copy SSE-KMS encrypted objects from general purpose buckets to \
         directory buckets, from directory buckets to general purpose buckets, or between \
         directory buckets, through \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html}UploadPartCopy}, \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops}the \
         Copy operation in Batch Operations}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job}the import \
         jobs}. In this case, Amazon S3 makes a call to KMS every time a copy request is made for \
         a KMS-encrypted object.\n\
        \  "]
  request_payer : request_payer option; [@ocaml.doc ""]
  tagging : tagging_header option;
      [@ocaml.doc
        "The tag-set for the object. The tag-set must be encoded as URL Query parameters.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_mode : object_lock_mode option;
      [@ocaml.doc
        "Specifies the Object Lock mode that you want to apply to the uploaded object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_retain_until_date : object_lock_retain_until_date option;
      [@ocaml.doc
        "Specifies the date and time when you want the Object Lock to expire.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_legal_hold_status : object_lock_legal_hold_status option;
      [@ocaml.doc
        "Specifies whether you want to apply a legal hold to the uploaded object.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm that you want Amazon S3 to use to create the checksum for the \
         object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "Indicates the checksum type that you want Amazon S3 to use to calculate the \
         object\226\128\153s checksum value. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec s3_tables_destination = {
  table_bucket_arn : s3_tables_bucket_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) for the table bucket that's specified as the destination \
         in the metadata table configuration. The destination table bucket must be in the same \
         Region and Amazon Web Services account as the general purpose bucket. \n"]
  table_name : s3_tables_name;
      [@ocaml.doc
        " The name for the metadata table in your metadata table configuration. The specified \
         metadata table name must be unique within the [aws_s3_metadata] namespace in the \
         destination table bucket. \n"]
}
[@@ocaml.doc
  " The destination information for a V1 S3 Metadata configuration. The destination table bucket \
   must be in the same Region and Amazon Web Services account as the general purpose bucket. The \
   specified metadata table name must be unique within the [aws_s3_metadata] namespace in the \
   destination table bucket. \n\n\
  \  If you created your S3 Metadata configuration before July 15, 2025, we recommend that you \
   delete and re-create your configuration by using \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html}CreateBucketMetadataConfiguration} \
   so that you can expire journal table records and create a live inventory table.\n\
  \  \n\
  \   "]

type nonrec metadata_table_configuration = {
  s3_tables_destination : s3_tables_destination;
      [@ocaml.doc
        " The destination information for the metadata table configuration. The destination table \
         bucket must be in the same Region and Amazon Web Services account as the general purpose \
         bucket. The specified metadata table name must be unique within the [aws_s3_metadata] \
         namespace in the destination table bucket. \n"]
}
[@@ocaml.doc
  " The V1 S3 Metadata configuration for a general purpose bucket. \n\n\
  \  If you created your S3 Metadata configuration before July 15, 2025, we recommend that you \
   delete and re-create your configuration by using \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html}CreateBucketMetadataConfiguration} \
   so that you can expire journal table records and create a live inventory table.\n\
  \  \n\
  \   "]

type nonrec create_bucket_metadata_table_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that you want to create the metadata table configuration for. \n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc " The [Content-MD5] header for the metadata table configuration. \n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc " The checksum algorithm to use with your metadata table configuration. \n"]
  metadata_table_configuration : metadata_table_configuration;
      [@ocaml.doc " The contents of your metadata table configuration. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected owner of the general purpose bucket that corresponds to your metadata table \
         configuration. \n"]
}
[@@ocaml.doc ""]

type nonrec annotation_table_configuration = {
  configuration_state : annotation_configuration_state;
      [@ocaml.doc "The state of the annotation table. Valid values are [ENABLED] and [DISABLED].\n"]
  encryption_configuration : metadata_table_encryption_configuration option; [@ocaml.doc ""]
  role : role option; [@ocaml.doc "The ARN of the IAM role used to manage the annotation table.\n"]
}
[@@ocaml.doc
  "Specifies the configuration for the annotation table associated with a bucket's Amazon S3 \
   Metadata configuration. The annotation table is an Iceberg table that records annotation events \
   for objects in the bucket.\n"]

type nonrec inventory_table_configuration = {
  configuration_state : inventory_configuration_state;
      [@ocaml.doc
        " The configuration state of the inventory table, indicating whether the inventory table \
         is enabled or disabled. \n"]
  encryption_configuration : metadata_table_encryption_configuration option;
      [@ocaml.doc " The encryption configuration for the inventory table. \n"]
}
[@@ocaml.doc " The inventory table configuration for an S3 Metadata configuration. \n"]

type nonrec journal_table_configuration = {
  record_expiration : record_expiration;
      [@ocaml.doc " The journal table record expiration settings for the journal table. \n"]
  encryption_configuration : metadata_table_encryption_configuration option;
      [@ocaml.doc " The encryption configuration for the journal table. \n"]
}
[@@ocaml.doc " The journal table configuration for an S3 Metadata configuration. \n"]

type nonrec metadata_configuration = {
  journal_table_configuration : journal_table_configuration;
      [@ocaml.doc " The journal table configuration for a metadata configuration. \n"]
  inventory_table_configuration : inventory_table_configuration option;
      [@ocaml.doc " The inventory table configuration for a metadata configuration. \n"]
  annotation_table_configuration : annotation_table_configuration option;
      [@ocaml.doc
        "Optional annotation table configuration to include with the metadata configuration.\n"]
}
[@@ocaml.doc " The S3 Metadata configuration for a general purpose bucket. \n"]

type nonrec create_bucket_metadata_configuration_request = {
  bucket : bucket_name;
      [@ocaml.doc
        " The general purpose bucket that you want to create the metadata configuration for. \n"]
  content_m_d5 : content_m_d5 option;
      [@ocaml.doc " The [Content-MD5] header for the metadata configuration. \n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc " The checksum algorithm to use with your metadata configuration. \n"]
  metadata_configuration : metadata_configuration;
      [@ocaml.doc " The contents of your metadata configuration. \n"]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        " The expected owner of the general purpose bucket that corresponds to your metadata \
         configuration. \n"]
}
[@@ocaml.doc ""]

type nonrec bucket_already_owned_by_you = unit [@@ocaml.doc ""]

type nonrec bucket_already_exists = unit [@@ocaml.doc ""]

type nonrec location = string [@@ocaml.doc ""]

type nonrec create_bucket_output = {
  location : location option; [@ocaml.doc "A forward slash followed by the name of the bucket.\n"]
  bucket_arn : s3_regional_or_s3_express_bucket_arn_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web \
         Services resources across all of Amazon Web Services.\n\n\
        \  This parameter is only supported for S3 directory buckets. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-tagging.html}Using \
         tags with directory buckets}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec bucket_namespace = ACCOUNT_REGIONAL [@ocaml.doc ""] | GLOBAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_lock_enabled_for_bucket = bool [@@ocaml.doc ""]

type nonrec bucket_type = Directory [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec data_redundancy =
  | SingleAvailabilityZone [@ocaml.doc ""]
  | SingleLocalZone [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec bucket_info = {
  data_redundancy : data_redundancy option;
      [@ocaml.doc
        "The number of Zone (Availability Zone or Local Zone) that's used for redundancy for the \
         bucket.\n"]
  type_ : bucket_type option; [@ocaml.doc "The type of bucket.\n"]
}
[@@ocaml.doc
  "Specifies the information about the bucket that will be created. For more information about \
   directory buckets, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html}Directory \
   buckets} in the {i Amazon S3 User Guide}.\n\n\
  \  This functionality is only supported by directory buckets.\n\
  \  \n\
  \   "]

type nonrec location_name_as_string = string [@@ocaml.doc ""]

type nonrec location_info = {
  type_ : location_type option;
      [@ocaml.doc "The type of location where the bucket will be created.\n"]
  name : location_name_as_string option;
      [@ocaml.doc
        "The name of the location where the bucket will be created.\n\n\
        \ For directory buckets, the name of the location is the Zone ID of the Availability Zone \
         (AZ) or Local Zone (LZ) where the bucket will be created. An example AZ ID value is \
         [usw2-az1].\n\
        \ "]
}
[@@ocaml.doc
  "Specifies the location where the bucket will be created.\n\n\
  \ For directory buckets, the location type is Availability Zone or Local Zone. For more \
   information about directory buckets, see \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html}Working \
   with directory buckets} in the {i Amazon S3 User Guide}.\n\
  \ \n\
  \   This functionality is only supported by directory buckets.\n\
  \   \n\
  \    "]

type nonrec create_bucket_configuration = {
  location_constraint : bucket_location_constraint option;
      [@ocaml.doc
        "Specifies the Region where the bucket will be created. You might choose a Region to \
         optimize latency, minimize costs, or address regulatory requirements. For example, if you \
         reside in Europe, you will probably find it advantageous to create buckets in the Europe \
         (Ireland) Region.\n\n\
        \ If you don't specify a Region, the bucket is created in the US East (N. Virginia) Region \
         (us-east-1) by default. Configurations using the value [EU] will create a bucket in \
         [eu-west-1].\n\
        \ \n\
        \  For a list of the valid values for all of the Amazon Web Services Regions, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region}Regions and \
         Endpoints}.\n\
        \  \n\
        \    This functionality is not supported for directory buckets.\n\
        \    \n\
        \     "]
  location : location_info option;
      [@ocaml.doc
        "Specifies the location where the bucket will be created.\n\n\
        \  {b Directory buckets } - The location type is Availability Zone or Local Zone. To use \
         the Local Zone location type, your account must be enabled for Local Zones. Otherwise, \
         you get an HTTP [403 Forbidden] error with the error code [AccessDenied]. To learn more, \
         see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/opt-in-directory-bucket-lz.html}Enable \
         accounts for Local Zones} in the {i Amazon S3 User Guide}. \n\
        \ \n\
        \   This functionality is only supported by directory buckets.\n\
        \   \n\
        \    "]
  bucket : bucket_info option;
      [@ocaml.doc
        "Specifies the information about the bucket that will be created.\n\n\
        \  This functionality is only supported by directory buckets.\n\
        \  \n\
        \   "]
  tags : tag_set option;
      [@ocaml.doc
        "An array of tags that you can apply to the bucket that you're creating. Tags are \
         key-value pairs of metadata used to categorize and organize your buckets, track costs, \
         and control access. \n\n\
        \ You must have the [s3:TagResource] permission to create a general purpose bucket with \
         tags or the [s3express:TagResource] permission to create a directory bucket with tags.\n\
        \ \n\
        \  When creating buckets with tags, note that tag-based conditions using [aws:ResourceTag] \
         and [s3:BucketTag] condition keys are applicable only after ABAC is enabled on the \
         bucket. To learn more, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging-enable-abac.html}Enabling \
         ABAC in general purpose buckets}.\n\
        \  "]
}
[@@ocaml.doc "The configuration information for the bucket.\n"]

type nonrec create_bucket_request = {
  ac_l : bucket_canned_ac_l option;
      [@ocaml.doc
        "The canned ACL to apply to the bucket.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the bucket to create.\n\n\
        \  {b General purpose buckets} - For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Bucket \
         naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Directory buckets } - When you use this operation with a directory bucket, you must \
         use path-style requests in the format \n\
        \  {[\n\
        \  https://s3express-control.{i region-code}.amazonaws.com/{i bucket-name} \n\
        \  ]}\n\
        \  . Virtual-hosted-style requests aren't supported. Directory bucket names must be unique \
         in the chosen Zone (Availability Zone or Local Zone). Bucket names must also follow the \
         format \n\
        \  {[\n\
        \   {i bucket-base-name}--{i zone-id}--x-s3\n\
        \  ]}\n\
        \   (for example, \n\
        \  {[\n\
        \   {i DOC-EXAMPLE-BUCKET}--{i usw2-az1}--x-s3\n\
        \  ]}\n\
        \  ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide} \n\
        \  "]
  create_bucket_configuration : create_bucket_configuration option;
      [@ocaml.doc "The configuration information for the bucket.\n"]
  grant_full_control : grant_full_control option;
      [@ocaml.doc
        "Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  grant_read : grant_read option;
      [@ocaml.doc
        "Allows grantee to list the objects in the bucket.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  grant_read_ac_p : grant_read_ac_p option;
      [@ocaml.doc
        "Allows grantee to read the bucket ACL.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  grant_write : grant_write option;
      [@ocaml.doc
        "Allows grantee to create new objects in the bucket.\n\n\
        \ For the bucket and object owners of existing objects, also allows deletions and \
         overwrites of those objects.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
  grant_write_ac_p : grant_write_ac_p option;
      [@ocaml.doc
        "Allows grantee to write the ACL for the applicable bucket.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_enabled_for_bucket : object_lock_enabled_for_bucket option;
      [@ocaml.doc
        "Specifies whether you want S3 Object Lock to be enabled for the new bucket.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_ownership : object_ownership option; [@ocaml.doc ""]
  bucket_namespace : bucket_namespace option;
      [@ocaml.doc
        "Specifies the namespace where you want to create your general purpose bucket. When you \
         create a general purpose bucket, you can choose to create a bucket in the shared global \
         namespace or you can choose to create a bucket in your account regional namespace. Your \
         account regional namespace is a subdivision of the global namespace that only your \
         account can create buckets in. For more information on bucket namespaces, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/gpbucketnamespaces.html}Namespaces \
         for general purpose buckets}.\n\n\
        \ General purpose buckets in your account regional namespace must follow a specific naming \
         convention. These buckets consist of a bucket name prefix that you create, and a suffix \
         that contains your 12-digit Amazon Web Services Account ID, the Amazon Web Services \
         Region code, and ends with [-an]. Bucket names must follow the format \
         [bucket-name-prefix-accountId-region-an] (for example, \
         [amzn-s3-demo-bucket-111122223333-us-west-2-an]). For information about bucket naming \
         restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html#account-regional-naming-rules}Account \
         regional namespace naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   This functionality is not supported for directory buckets.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec object_not_in_active_tier_error = unit [@@ocaml.doc ""]

type nonrec copy_object_result = {
  e_tag : e_tag option;
      [@ocaml.doc
        "Returns the ETag of the new object. The ETag reflects only changes to the contents of an \
         object, not its metadata.\n"]
  last_modified : last_modified option; [@ocaml.doc "Creation date of the object.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type that is used to calculate the object\226\128\153s checksum value. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32] checksum of the object. This checksum is only present \
         if the object was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the object. This checksum is only present \
         if the checksum was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the object. This checksum is present \
         if the object being copied was uploaded with the [CRC64NVME] checksum algorithm, or if \
         the object was uploaded without a checksum (and Amazon S3 added the default checksum, \
         [CRC64NVME], to the uploaded object). For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] digest of the object. This checksum is only present if \
         the checksum was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] digest of the object. This checksum is only present \
         if the checksum was uploaded with the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the object. This checksum is only present \
         if the object was uploaded with the [SHA512] checksum algorithm. For more information, \
         see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the object. This checksum is only present if \
         the object was uploaded with the [MD5] checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the object. This checksum is only \
         present if the object was uploaded with the [XXHASH64] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the object. This checksum is only \
         present if the object was uploaded with the [XXHASH3] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the object. This checksum is only \
         present if the object was uploaded with the [XXHASH128] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
}
[@@ocaml.doc "Container for all response elements.\n"]

type nonrec copy_object_output = {
  copy_object_result : copy_object_result option;
      [@ocaml.doc "Container for all response elements.\n"]
  expiration : expiration option;
      [@ocaml.doc
        "If the object expiration is configured, the response includes this header.\n\n\
        \  Object expiration information is not returned in directory buckets and this header \
         returns the value \"[NotImplemented]\" in all responses for directory buckets.\n\
        \  \n\
        \   "]
  copy_source_version_id : copy_source_version_id option;
      [@ocaml.doc
        "Version ID of the source object that was copied.\n\n\
        \  This functionality is not supported when the source object is in a directory bucket.\n\
        \  \n\
        \   "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID of the newly created copy.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when you store this object in Amazon S3 or \
         Amazon FSx.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to confirm the encryption algorithm that's used.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "If server-side encryption with a customer-provided encryption key was requested, the \
         response will include this header to provide the round-trip message integrity \
         verification of the customer-provided encryption key.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "If present, indicates the Amazon Web Services KMS Encryption Context to use for object \
         encryption. The value of this header is a Base64 encoded UTF-8 string holding JSON with \
         the encryption context key-value pairs.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the copied object uses an S3 Bucket Key for server-side encryption with \
         Key Management Service (KMS) keys (SSE-KMS).\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec annotation_directive = COPY [@ocaml.doc ""] | EXCLUDE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec tagging_directive = COPY [@ocaml.doc ""] | REPLACE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec metadata_directive = COPY [@ocaml.doc ""] | REPLACE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec copy_object_request = {
  ac_l : object_canned_ac_l option;
      [@ocaml.doc
        "The canned access control list (ACL) to apply to the object.\n\n\
        \ When you copy an object, the ACL metadata is not preserved and is set to [private] by \
         default. Only the owner has full access control. To override the default ACL setting, \
         specify a new ACL when you generate a copy request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/S3_ACLs_UsingACLs.html}Using ACLs}. \n\
        \ \n\
        \  If the destination bucket that you're copying objects to uses the bucket owner enforced \
         setting for S3 Object Ownership, ACLs are disabled and no longer affect permissions. \
         Buckets that use this setting only accept [PUT] requests that don't specify an ACL or \
         [PUT] requests that specify bucket owner full control ACLs, such as the \
         [bucket-owner-full-control] canned ACL or an equivalent form of this ACL expressed in the \
         XML format. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html}Controlling \
         ownership of objects and disabling ACLs} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    {ul\n\
        \          {-  If your destination bucket uses the bucket owner enforced setting for \
         Object Ownership, all objects written to the bucket by any account will be owned by the \
         bucket owner.\n\
        \              \n\
        \               }\n\
        \          {-  This functionality is not supported for directory buckets.\n\
        \              \n\
        \               }\n\
        \          {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  bucket : bucket_name;
      [@ocaml.doc
        "The name of the destination bucket.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   Copying objects across different Amazon Web Services Regions isn't supported when the \
         source or destination bucket is in Amazon Web Services Local Zones. The source and \
         destination buckets must have the same parent Amazon Web Services Region. Otherwise, you \
         get an HTTP [400 Bad Request] error with the error code [InvalidRequest].\n\
        \   \n\
        \      {b Access points} - When you use this action with an access point for general \
         purpose buckets, you must provide the alias of the access point in place of the bucket \
         name or specify the access point ARN. When you use this action with an access point for \
         directory buckets, you must provide the access point name in place of the bucket name. \
         When using the access point ARN, you must direct requests to the access point hostname. \
         The access point hostname takes the form {i AccessPointName}-{i \
         AccountId}.s3-accesspoint.{i Region}.amazonaws.com. When using this action with an access \
         point through the Amazon Web Services SDKs, you provide the access point ARN in place of \
         the bucket name. For more information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \     \n\
        \       Object Lambda access points are not supported by directory buckets.\n\
        \       \n\
        \          {b S3 on Outposts} - When you use this action with S3 on Outposts, you must use \
         the Outpost bucket access point ARN or the access point alias for the destination bucket. \
         You can only copy objects within the same Outpost bucket. It's not supported to copy \
         objects across different Amazon Web Services Outposts, between buckets on the same \
         Outposts, or between Outposts buckets and any other bucket types. For more information \
         about S3 on Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i S3 on Outposts guide}. When you use this action with S3 on Outposts \
         through the REST API, you must direct requests to the S3 on Outposts hostname, in the \
         format \n\
        \         {[\n\
        \          {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i \
         Region}.amazonaws.com\n\
        \         ]}\n\
        \         . The hostname isn't required when you use the Amazon Web Services CLI or SDKs. \n\
        \         "]
  cache_control : cache_control option;
      [@ocaml.doc "Specifies the caching behavior along the request/reply chain.\n"]
  checksum_algorithm : checksum_algorithm option;
      [@ocaml.doc
        "Indicates the algorithm that you want Amazon S3 to use to create the checksum for the \
         object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n\n\
        \ When you copy an object, if the source object has a checksum, that checksum value will \
         be copied to the new object by default. If the [CopyObject] request does not include this \
         [x-amz-checksum-algorithm] header, the checksum algorithm will be copied from the source \
         object to the destination object (if it's present on the source object). You can \
         optionally specify a different checksum algorithm to use with the \
         [x-amz-checksum-algorithm] header. Unrecognized or unsupported values will respond with \
         the HTTP status code [400 Bad Request].\n\
        \ \n\
        \   For directory buckets, when you use Amazon Web Services SDKs, [CRC32] is the default \
         checksum algorithm that's used for performance.\n\
        \   \n\
        \    "]
  content_disposition : content_disposition option;
      [@ocaml.doc
        "Specifies presentational information for the object. Indicates whether an object should \
         be displayed in a web browser or downloaded as a file. It allows specifying the desired \
         filename for the downloaded file.\n"]
  content_encoding : content_encoding option;
      [@ocaml.doc
        "Specifies what content encodings have been applied to the object and thus what decoding \
         mechanisms must be applied to obtain the media-type referenced by the Content-Type header \
         field.\n\n\
        \  For directory buckets, only the [aws-chunked] value is supported in this header field.\n\
        \  \n\
        \   "]
  content_language : content_language option; [@ocaml.doc "The language the content is in.\n"]
  content_type : content_type option;
      [@ocaml.doc "A standard MIME type that describes the format of the object data.\n"]
  copy_source : copy_source;
      [@ocaml.doc
        "Specifies the source object for the copy operation. The source object can be up to 5 GB. \
         If the source object is an object that was uploaded by using a multipart upload, the \
         object copy will be a single part object after the source object is copied to the \
         destination bucket.\n\n\
        \ You specify the value of the copy source in one of two formats, depending on whether you \
         want to access the source object through an \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html}access point}:\n\
        \ \n\
        \  {ul\n\
        \        {-  For objects not accessed through an access point, specify the name of the \
         source bucket and the key of the source object, separated by a slash (/). For example, to \
         copy the object [reports/january.pdf] from the general purpose bucket [awsexamplebucket], \
         use [awsexamplebucket/reports/january.pdf]. The value must be URL-encoded. To copy the \
         object [reports/january.pdf] from the directory bucket \
         [awsexamplebucket--use1-az5--x-s3], use \
         [awsexamplebucket--use1-az5--x-s3/reports/january.pdf]. The value must be URL-encoded.\n\
        \            \n\
        \             }\n\
        \        {-  For objects accessed through access points, specify the Amazon Resource Name \
         (ARN) of the object as accessed through the access point, in the format \n\
        \            {[\n\
        \            arn:aws:s3:::accesspoint//object/\n\
        \            ]}\n\
        \            . For example, to copy the object [reports/january.pdf] through access point \
         [my-access-point] owned by account [123456789012] in Region [us-west-2], use the URL \
         encoding of \
         [arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf]. \
         The value must be URL encoded.\n\
        \            \n\
        \              {ul\n\
        \                    {-  Amazon S3 supports copy operations using Access points only when \
         the source and destination buckets are in the same Amazon Web Services Region.\n\
        \                        \n\
        \                         }\n\
        \                    {-  Access points are not supported by directory buckets.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \         }\n\
        \           Alternatively, for objects accessed through Amazon S3 on Outposts, specify the \
         ARN of the object as accessed in the format \n\
        \           {[\n\
        \           arn:aws:s3-outposts:::outpost//object/\n\
        \           ]}\n\
        \           . For example, to copy the object [reports/january.pdf] through outpost \
         [my-outpost] owned by account [123456789012] in Region [us-west-2], use the URL encoding \
         of \
         [arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf]. \
         The value must be URL-encoded. \n\
        \           \n\
        \            }\n\
        \        }\n\
        \   If your source bucket versioning is enabled, the [x-amz-copy-source] header by default \
         identifies the current version of an object to copy. If the current version is a delete \
         marker, Amazon S3 behaves as if the object was deleted. To copy a different version, use \
         the [versionId] query parameter. Specifically, append \n\
        \   {[\n\
        \   ?versionId=\n\
        \   ]}\n\
        \    to the value (for example, \
         [awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893]). If \
         you don't specify a version ID, Amazon S3 copies the latest version of the source object.\n\
        \   \n\
        \    If you enable versioning on the destination bucket, Amazon S3 generates a unique \
         version ID for the copied object. This version ID is different from the version ID of the \
         source object. Amazon S3 returns the version ID of the copied object in the \
         [x-amz-version-id] response header in the response.\n\
        \    \n\
        \     If you do not enable versioning or suspend it on the destination bucket, the version \
         ID that Amazon S3 generates in the [x-amz-version-id] response header is always null.\n\
        \     \n\
        \        {b Directory buckets} - S3 Versioning isn't enabled and supported for directory \
         buckets.\n\
        \       \n\
        \        "]
  copy_source_if_match : copy_source_if_match option;
      [@ocaml.doc
        "Copies the object if its entity tag (ETag) matches the specified tag.\n\n\
        \  If both the [x-amz-copy-source-if-match] and [x-amz-copy-source-if-unmodified-since] \
         headers are present in the request and evaluate as follows, Amazon S3 returns [200 OK] \
         and copies the data:\n\
        \ \n\
        \  {ul\n\
        \        {-   [x-amz-copy-source-if-match] condition evaluates to true\n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-copy-source-if-unmodified-since] condition evaluates to false\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  copy_source_if_modified_since : copy_source_if_modified_since option;
      [@ocaml.doc
        "Copies the object if it has been modified since the specified time.\n\n\
        \ If both the [x-amz-copy-source-if-none-match] and [x-amz-copy-source-if-modified-since] \
         headers are present in the request and evaluate as follows, Amazon S3 returns the [412 \
         Precondition Failed] response code:\n\
        \ \n\
        \  {ul\n\
        \        {-   [x-amz-copy-source-if-none-match] condition evaluates to false\n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-copy-source-if-modified-since] condition evaluates to true\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  copy_source_if_none_match : copy_source_if_none_match option;
      [@ocaml.doc
        "Copies the object if its entity tag (ETag) is different than the specified ETag.\n\n\
        \ If both the [x-amz-copy-source-if-none-match] and [x-amz-copy-source-if-modified-since] \
         headers are present in the request and evaluate as follows, Amazon S3 returns the [412 \
         Precondition Failed] response code:\n\
        \ \n\
        \  {ul\n\
        \        {-   [x-amz-copy-source-if-none-match] condition evaluates to false\n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-copy-source-if-modified-since] condition evaluates to true\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  copy_source_if_unmodified_since : copy_source_if_unmodified_since option;
      [@ocaml.doc
        "Copies the object if it hasn't been modified since the specified time.\n\n\
        \  If both the [x-amz-copy-source-if-match] and [x-amz-copy-source-if-unmodified-since] \
         headers are present in the request and evaluate as follows, Amazon S3 returns [200 OK] \
         and copies the data:\n\
        \ \n\
        \  {ul\n\
        \        {-   [x-amz-copy-source-if-match] condition evaluates to true\n\
        \            \n\
        \             }\n\
        \        {-   [x-amz-copy-source-if-unmodified-since] condition evaluates to false\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  expires : expires option;
      [@ocaml.doc "The date and time at which the object is no longer cacheable.\n"]
  grant_full_control : grant_full_control option;
      [@ocaml.doc
        "Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the object.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  grant_read : grant_read option;
      [@ocaml.doc
        "Allows grantee to read the object data and its metadata.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  grant_read_ac_p : grant_read_ac_p option;
      [@ocaml.doc
        "Allows grantee to read the object ACL.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  grant_write_ac_p : grant_write_ac_p option;
      [@ocaml.doc
        "Allows grantee to write the ACL for the applicable object.\n\n\
        \  {ul\n\
        \        {-  This functionality is not supported for directory buckets.\n\
        \            \n\
        \             }\n\
        \        {-  This functionality is not supported for Amazon S3 on Outposts.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  if_match : if_match option;
      [@ocaml.doc
        "Copies the object if the entity tag (ETag) of the destination object matches the \
         specified tag. If the ETag values do not match, the operation returns a [412 Precondition\n\
        \        Failed] error. If a concurrent operation occurs during the upload S3 returns a \
         [409 ConditionalRequestConflict] response. On a 409 failure you should fetch the object's \
         ETag and retry the upload.\n\n\
        \ Expects the ETag value as a string.\n\
        \ \n\
        \  For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \  "]
  if_none_match : if_none_match option;
      [@ocaml.doc
        "Copies the object only if the object key name at the destination does not already exist \
         in the bucket specified. Otherwise, Amazon S3 returns a [412 Precondition Failed] error. \
         If a concurrent operation occurs during the upload S3 returns a [409 \
         ConditionalRequestConflict] response. On a 409 failure you should retry the upload.\n\n\
        \ Expects the '*' (asterisk) character.\n\
        \ \n\
        \  For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}.\n\
        \  "]
  key : object_key; [@ocaml.doc "The key of the destination object.\n"]
  metadata : metadata option; [@ocaml.doc "A map of metadata to store with the object in S3.\n"]
  metadata_directive : metadata_directive option;
      [@ocaml.doc
        "Specifies whether the metadata is copied from the source object or replaced with metadata \
         that's provided in the request. When copying an object, you can preserve all metadata \
         (the default) or specify new metadata. If this header isn\226\128\153t specified, [COPY] \
         is the default behavior. \n\n\
        \  {b General purpose bucket} - For general purpose buckets, when you grant permissions, \
         you can use the [s3:x-amz-metadata-directive] condition key to enforce certain metadata \
         behavior when objects are uploaded. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/amazon-s3-policy-keys.html}Amazon S3 \
         condition key examples} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \    [x-amz-website-redirect-location] is unique to each object and is not copied when \
         using the [x-amz-metadata-directive] header. To copy the value, you must specify \
         [x-amz-website-redirect-location] in the request header.\n\
        \   \n\
        \    "]
  tagging_directive : tagging_directive option;
      [@ocaml.doc
        "Specifies whether the object tag-set is copied from the source object or replaced with \
         the tag-set that's provided in the request.\n\n\
        \ The default value is [COPY].\n\
        \ \n\
        \    {b Directory buckets} - For directory buckets in a [CopyObject] operation, only the \
         empty tag-set is supported. Any requests that attempt to write non-empty tags into \
         directory buckets will receive a [501 Not Implemented] status code. When the destination \
         bucket is a directory bucket, you will receive a [501 Not Implemented] response in any of \
         the following situations:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you attempt to [COPY] the tag-set from an S3 source object that has \
         non-empty tags.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a source object and set a \
         non-empty value to [x-amz-tagging].\n\
        \              \n\
        \               }\n\
        \          {-  When you don't set the [x-amz-tagging-directive] header and the source \
         object has non-empty tags. This is because the default value of [x-amz-tagging-directive] \
         is [COPY].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   Because only the empty tag-set is supported for directory buckets in a [CopyObject] \
         operation, the following situations are allowed:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you attempt to [COPY] the tag-set from a directory bucket source \
         object that has no tags to a general purpose bucket. It copies an empty tag-set to the \
         destination object.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a directory bucket source \
         object and set the [x-amz-tagging] value of the directory bucket destination object to \
         empty.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a general purpose bucket \
         source object that has non-empty tags and set the [x-amz-tagging] value of the directory \
         bucket destination object to empty.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a directory bucket source \
         object and don't set the [x-amz-tagging] value of the directory bucket destination \
         object. This is because the default value of [x-amz-tagging] is the empty value.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  annotation_directive : annotation_directive option;
      [@ocaml.doc
        "Specifies whether you want to copy annotations from the source object or exclude them. If \
         this header isn't specified, [COPY] is the default behavior.\n\n\
        \ Valid Values: [COPY | EXCLUDE] \n\
        \ \n\
        \  You can specify this directive as either an HTTP header \
         ([x-amz-object-annotation-directive]) or as a query string parameter. Use the query \
         string form when generating presigned URLs that need to control annotation copy behavior.\n\
        \  \n\
        \   When set to [COPY], you must have [s3:GetObjectAnnotation] permission on the source \
         object and [s3:PutObjectAnnotation] permission on the destination. Each annotation copied \
         is billed as a separate PUT request. If annotations on the source are modified during the \
         copy, Amazon S3 returns a retryable error.\n\
        \   \n\
        \     For directory buckets, annotations are not supported. Use [EXCLUDE] to copy objects \
         to directory buckets without errors. If you specify [COPY] for a directory bucket, the \
         request returns HTTP 501 (Not Implemented).\n\
        \     \n\
        \        When you copy objects using multipart upload (for example, when the Amazon Web \
         Services CLI or Amazon Web Services SDKs use Transfer Manager for objects larger than \
         approximately 8 MB), annotations are not copied by default. To include annotations, \
         specify [--copy-props default] in the Amazon Web Services CLI or the equivalent SDK \
         configuration. With this opt-in, the SDK reads source annotations, completes the \
         multipart upload, and then writes each annotation to the destination. Between the upload \
         completion and the last annotation write, the destination object exists without all its \
         annotations.\n\
        \        \n\
        \         "]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when storing this object in Amazon S3. \
         Unrecognized or unsupported values won\226\128\153t write a destination object and will \
         receive a [400 Bad Request] response. \n\n\
        \ Amazon S3 automatically encrypts all new objects that are copied to an S3 bucket. When \
         copying an object, if you don't specify encryption information in your copy request, the \
         encryption setting of the target object is set to the default encryption configuration of \
         the destination bucket. By default, all buckets have a base level of encryption \
         configuration that uses server-side encryption with Amazon S3 managed keys (SSE-S3). If \
         the destination bucket has a different default encryption configuration, Amazon S3 uses \
         the corresponding encryption key to encrypt the target object copy.\n\
        \ \n\
        \  With server-side encryption, Amazon S3 encrypts your data as it writes your data to \
         disks in its data centers and decrypts the data when you access it. For more information \
         about server-side encryption, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html}Using \
         Server-Side Encryption} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    {b General purpose buckets } \n\
        \   \n\
        \    {ul\n\
        \          {-  For general purpose buckets, there are the following supported options for \
         server-side encryption: server-side encryption with Key Management Service (KMS) keys \
         (SSE-KMS), dual-layer server-side encryption with Amazon Web Services KMS keys \
         (DSSE-KMS), and server-side encryption with customer-provided encryption keys (SSE-C). \
         Amazon S3 uses the corresponding KMS key, or a customer-provided key to encrypt the \
         target object copy.\n\
        \              \n\
        \               }\n\
        \          {-  When you perform a [CopyObject] operation, if you want to use a different \
         type of encryption setting for the target object, you can specify appropriate \
         encryption-related headers to encrypt the target object with an Amazon S3 managed key, a \
         KMS key, or a customer-provided key. If the encryption setting in your request is \
         different from the default encryption configuration of the destination bucket, the \
         encryption setting in your request takes precedence. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Directory buckets } \n\
        \   \n\
        \    {ul\n\
        \          {-  For directory buckets, there are only two supported options for server-side \
         encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) ([AES256]) and \
         server-side encryption with KMS keys (SSE-KMS) ([aws:kms]). We recommend that the \
         bucket's default encryption uses the desired encryption configuration and you don't \
         override the bucket default encryption in your [CreateSession] requests or [PUT] object \
         requests. Then, new objects are automatically encrypted with the desired encryption \
         settings. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-serv-side-encryption.html}Protecting \
         data with server-side encryption} in the {i Amazon S3 User Guide}. For more information \
         about the encryption overriding behaviors in directory buckets, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-specifying-kms-encryption.html}Specifying \
         server-side encryption with KMS for new object uploads}.\n\
        \              \n\
        \               }\n\
        \          {-  To encrypt new object copies to a directory bucket with SSE-KMS, we \
         recommend you specify SSE-KMS as the directory bucket's default encryption configuration \
         with a KMS key (specifically, a \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer \
         managed key}). The \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
         Web Services managed key} ([aws/s3]) isn't supported. Your SSE-KMS configuration can only \
         support 1 \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer \
         managed key} per directory bucket for the lifetime of the bucket. After you specify a \
         customer managed key for SSE-KMS, you can't override the customer managed key for the \
         bucket's SSE-KMS configuration. Then, when you perform a [CopyObject] operation and want \
         to specify server-side encryption settings for new object copies with SSE-KMS in the \
         encryption-related request headers, you must ensure the encryption key is the same \
         customer managed key that you specified for the directory bucket's default encryption \
         configuration. \n\
        \              \n\
        \               }\n\
        \          {-   {b S3 access points for Amazon FSx } - When accessing data stored in \
         Amazon FSx file systems using S3 access points, the only valid server side encryption \
         option is [aws:fsx]. All Amazon FSx file systems have encryption configured by default \
         and are encrypted at rest. Data is automatically encrypted before being written to the \
         file system, and automatically decrypted as it is read. These processes are handled \
         transparently by Amazon FSx.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  storage_class : storage_class option;
      [@ocaml.doc
        "If the [x-amz-storage-class] header is not used, the copied object will be stored in the \
         [STANDARD] Storage Class by default. The [STANDARD] storage class provides high \
         durability and high availability. Depending on performance needs, you can specify a \
         different Storage Class. \n\n\
        \  {ul\n\
        \        {-   {b Directory buckets } - Directory buckets only support [EXPRESS_ONEZONE] \
         (the S3 Express One Zone storage class) in Availability Zones and [ONEZONE_IA] (the S3 \
         One Zone-Infrequent Access storage class) in Dedicated Local Zones. Unsupported storage \
         class values won't write a destination object and will respond with the HTTP status code \
         [400 Bad Request].\n\
        \            \n\
        \             }\n\
        \        {-   {b Amazon S3 on Outposts } - S3 on Outposts only uses the [OUTPOSTS] Storage \
         Class.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    You can use the [CopyObject] action to change the storage class of an object that is \
         already stored in Amazon S3 by using the [x-amz-storage-class] header. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html}Storage \
         Classes} in the {i Amazon S3 User Guide}.\n\
        \    \n\
        \     Before using an object as a source object for the copy operation, you must restore a \
         copy of it if it meets any of the following conditions:\n\
        \     \n\
        \      {ul\n\
        \            {-  The storage class of the source object is [GLACIER] or [DEEP_ARCHIVE].\n\
        \                \n\
        \                 }\n\
        \            {-  The storage class of the source object is [INTELLIGENT_TIERING] and it's \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/intelligent-tiering-overview.html#intel-tiering-tier-definition}S3 \
         Intelligent-Tiering access tier} is [Archive Access] or [Deep Archive\n\
        \            Access].\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_RestoreObject.html}RestoreObject} \
         and \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/CopyingObjectsExamples.html}Copying \
         Objects} in the {i Amazon S3 User Guide}.\n\
        \   "]
  website_redirect_location : website_redirect_location option;
      [@ocaml.doc
        "If the destination bucket is configured as a website, redirects requests for this object \
         copy to another object in the same bucket or to an external URL. Amazon S3 stores the \
         value of this header in the object metadata. This value is unique to each object and is \
         not copied when using the [x-amz-metadata-directive] header. Instead, you may opt to \
         provide this header in combination with the [x-amz-metadata-directive] header.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when encrypting the object (for example, [AES256]).\n\n\
        \ When you perform a [CopyObject] operation, if you want to use a different type of \
         encryption setting for the target object, you can specify appropriate encryption-related \
         headers to encrypt the target object with an Amazon S3 managed key, a KMS key, or a \
         customer-provided key. If the encryption setting in your request is different from the \
         default encryption configuration of the destination bucket, the encryption setting in \
         your request takes precedence. \n\
        \ \n\
        \   This functionality is not supported when the destination bucket is a directory bucket.\n\
        \   \n\
        \    "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. \
         This value is used to store the object and then it is discarded. Amazon S3 does not store \
         the encryption key. The key must be appropriate for use with the algorithm specified in \
         the [x-amz-server-side-encryption-customer-algorithm] header.\n\n\
        \  This functionality is not supported when the destination bucket is a directory bucket.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \  This functionality is not supported when the destination bucket is a directory bucket.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "Specifies the KMS key ID (Key ID, Key ARN, or Key Alias) to use for object encryption. \
         All GET and PUT requests for an object protected by KMS will fail if they're not made via \
         SSL or using SigV4. For information about configuring any of the officially supported \
         Amazon Web Services SDKs and Amazon Web Services CLI, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingAWSSDK.html#specify-signature-version}Specifying \
         the Signature Version in Request Authentication} in the {i Amazon S3 User Guide}.\n\n\
        \  {b Directory buckets} - To encrypt data using SSE-KMS, it's recommended to specify the \
         [x-amz-server-side-encryption] header to [aws:kms]. Then, the \
         [x-amz-server-side-encryption-aws-kms-key-id] header implicitly uses the bucket's default \
         KMS customer managed key ID. If you want to explicitly set the [\n\
        \         x-amz-server-side-encryption-aws-kms-key-id] header, it must match the bucket's \
         default customer managed key (using key ID or ARN, not alias). Your SSE-KMS configuration \
         can only support 1 \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk}customer \
         managed key} per directory bucket's lifetime. The \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
         Web Services managed key} ([aws/s3]) isn't supported. Incorrect key specification results \
         in an HTTP [400 Bad Request] error. \n\
        \ "]
  ssekms_encryption_context : ssekms_encryption_context option;
      [@ocaml.doc
        "Specifies the Amazon Web Services KMS Encryption Context as an additional encryption \
         context to use for the destination object encryption. The value of this header is a \
         base64-encoded UTF-8 string holding JSON with the encryption context key-value pairs.\n\n\
        \  {b General purpose buckets} - This value must be explicitly added to specify encryption \
         context for [CopyObject] requests if you want an additional encryption context for your \
         destination object. The additional encryption context of the source object won't be \
         copied to the destination object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html#encryption-context}Encryption \
         context} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Directory buckets} - You can optionally provide an explicit encryption context \
         value. The value must match the default encryption context - the bucket Amazon Resource \
         Name (ARN). An additional encryption context value is not supported. \n\
        \  "]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with \
         server-side encryption using Key Management Service (KMS) keys (SSE-KMS). If a target \
         object uses SSE-KMS, you can enable an S3 Bucket Key for the object.\n\n\
        \ Setting this header to [true] causes Amazon S3 to use an S3 Bucket Key for object \
         encryption with SSE-KMS. Specifying this header with a COPY action doesn\226\128\153t \
         affect bucket-level settings for S3 Bucket Key.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html}Amazon S3 Bucket Keys} \
         in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \     {b Directory buckets} - S3 Bucket Keys aren't supported, when you copy SSE-KMS \
         encrypted objects from general purpose buckets to directory buckets, from directory \
         buckets to general purpose buckets, or between directory buckets, through \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html}CopyObject}. In \
         this case, Amazon S3 makes a call to KMS every time a copy request is made for a \
         KMS-encrypted object.\n\
        \    \n\
        \     "]
  copy_source_sse_customer_algorithm : copy_source_sse_customer_algorithm option;
      [@ocaml.doc
        "Specifies the algorithm to use when decrypting the source object (for example, [AES256]).\n\n\
        \ If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide \
         the necessary encryption information in your request so that Amazon S3 can decrypt the \
         object for copying.\n\
        \ \n\
        \   This functionality is not supported when the source object is in a directory bucket.\n\
        \   \n\
        \    "]
  copy_source_sse_customer_key : copy_source_sse_customer_key option;
      [@ocaml.doc
        "Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source \
         object. The encryption key provided in this header must be the same one that was used \
         when the source object was created.\n\n\
        \ If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide \
         the necessary encryption information in your request so that Amazon S3 can decrypt the \
         object for copying.\n\
        \ \n\
        \   This functionality is not supported when the source object is in a directory bucket.\n\
        \   \n\
        \    "]
  copy_source_sse_customer_key_m_d5 : copy_source_sse_customer_key_m_d5 option;
      [@ocaml.doc
        "Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 \
         uses this header for a message integrity check to ensure that the encryption key was \
         transmitted without error.\n\n\
        \ If the source object for the copy is stored in Amazon S3 using SSE-C, you must provide \
         the necessary encryption information in your request so that Amazon S3 can decrypt the \
         object for copying.\n\
        \ \n\
        \   This functionality is not supported when the source object is in a directory bucket.\n\
        \   \n\
        \    "]
  request_payer : request_payer option; [@ocaml.doc ""]
  tagging : tagging_header option;
      [@ocaml.doc
        "The tag-set for the object copy in the destination bucket. This value must be used in \
         conjunction with the [x-amz-tagging-directive] if you choose [REPLACE] for the \
         [x-amz-tagging-directive]. If you choose [COPY] for the [x-amz-tagging-directive], you \
         don't need to set the [x-amz-tagging] header, because the tag-set will be copied from the \
         source object directly. The tag-set must be encoded as URL Query parameters.\n\n\
        \ The default value is the empty value.\n\
        \ \n\
        \    {b Directory buckets} - For directory buckets in a [CopyObject] operation, only the \
         empty tag-set is supported. Any requests that attempt to write non-empty tags into \
         directory buckets will receive a [501 Not Implemented] status code. When the destination \
         bucket is a directory bucket, you will receive a [501 Not Implemented] response in any of \
         the following situations:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you attempt to [COPY] the tag-set from an S3 source object that has \
         non-empty tags.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a source object and set a \
         non-empty value to [x-amz-tagging].\n\
        \              \n\
        \               }\n\
        \          {-  When you don't set the [x-amz-tagging-directive] header and the source \
         object has non-empty tags. This is because the default value of [x-amz-tagging-directive] \
         is [COPY].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   Because only the empty tag-set is supported for directory buckets in a [CopyObject] \
         operation, the following situations are allowed:\n\
        \   \n\
        \    {ul\n\
        \          {-  When you attempt to [COPY] the tag-set from a directory bucket source \
         object that has no tags to a general purpose bucket. It copies an empty tag-set to the \
         destination object.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a directory bucket source \
         object and set the [x-amz-tagging] value of the directory bucket destination object to \
         empty.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a general purpose bucket \
         source object that has non-empty tags and set the [x-amz-tagging] value of the directory \
         bucket destination object to empty.\n\
        \              \n\
        \               }\n\
        \          {-  When you attempt to [REPLACE] the tag-set of a directory bucket source \
         object and don't set the [x-amz-tagging] value of the directory bucket destination \
         object. This is because the default value of [x-amz-tagging] is the empty value.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  object_lock_mode : object_lock_mode option;
      [@ocaml.doc
        "The Object Lock mode that you want to apply to the object copy.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_retain_until_date : object_lock_retain_until_date option;
      [@ocaml.doc
        "The date and time when you want the Object Lock of the object copy to expire.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  object_lock_legal_hold_status : object_lock_legal_hold_status option;
      [@ocaml.doc
        "Specifies whether you want to apply a legal hold to the object copy.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected destination bucket owner. If the account ID that you \
         provide does not match the actual owner of the destination bucket, the request fails with \
         the HTTP status code [403 Forbidden] (access denied).\n"]
  expected_source_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected source bucket owner. If the account ID that you provide \
         does not match the actual owner of the source bucket, the request fails with the HTTP \
         status code [403 Forbidden] (access denied).\n"]
}
[@@ocaml.doc ""]

type nonrec complete_multipart_upload_output = {
  location : location option; [@ocaml.doc "The URI that identifies the newly created object.\n"]
  bucket : bucket_name option;
      [@ocaml.doc
        "The name of the bucket that contains the newly created object. Does not return the access \
         point ARN or access point alias if used.\n\n\
        \  Access points are not supported by directory buckets.\n\
        \  \n\
        \   "]
  key : object_key option; [@ocaml.doc "The object key of the newly created object.\n"]
  expiration : expiration option;
      [@ocaml.doc
        "If the object expiration is configured, this will contain the expiration date \
         ([expiry-date]) and rule ID ([rule-id]). The value of [rule-id] is URL-encoded.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  e_tag : e_tag option;
      [@ocaml.doc
        "Entity tag that identifies the newly created object's data. Objects with different object \
         data will have different entity tags. The entity tag is an opaque string. The entity tag \
         may or may not be an MD5 digest of the object data. If the entity tag is not an MD5 \
         digest of the object data, it will contain one or more nonhexadecimal characters and/or \
         will consist of less than 32 or more than 32 hexadecimal digits. For more information \
         about how the entity tag is calculated, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32 checksum] of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [CRC64NVME] checksum of the object. The [CRC64NVME] checksum is always a full object \
         checksum. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}. \n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] digest of the object. This checksum is only present if \
         the checksum was uploaded with the object. When you use the API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] digest of the object. This checksum is only present \
         if the checksum was uploaded with the object. When you use an API operation on an object \
         that was uploaded using multipart uploads, this value may not be a direct checksum value \
         of the full object. Instead, it's a calculation based on the checksum values of each \
         individual part. For more information about how checksums are calculated with multipart \
         uploads, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums} \
         Checking object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "The checksum type, which determines how part-level checksums are combined to create an \
         object-level checksum for multipart objects. You can use this header as a data integrity \
         check to verify that the checksum type that is received is the same checksum type that \
         was specified during the [CreateMultipartUpload] request. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  server_side_encryption : server_side_encryption option;
      [@ocaml.doc
        "The server-side encryption algorithm used when storing this object in Amazon S3.\n\n\
        \  When accessing data stored in Amazon FSx file systems using S3 access points, the only \
         valid server side encryption option is [aws:fsx].\n\
        \  \n\
        \    \n\
        \    "]
  version_id : object_version_id option;
      [@ocaml.doc
        "Version ID of the newly created object, in case the bucket has versioning turned on.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  ssekms_key_id : ssekms_key_id option;
      [@ocaml.doc
        "If present, indicates the ID of the KMS key that was used for object encryption.\n"]
  bucket_key_enabled : bucket_key_enabled option;
      [@ocaml.doc
        "Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption \
         with Key Management Service (KMS) keys (SSE-KMS).\n"]
  request_charged : request_charged option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec mpu_object_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec completed_part = {
  e_tag : e_tag option; [@ocaml.doc "Entity tag returned when the part was uploaded.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [CRC32] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "The Base64 encoded, 32-bit [CRC32C] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [CRC32C] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [CRC64NVME] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [CRC64NVME] checksum algorithm. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "The Base64 encoded, 160-bit [SHA1] checksum of the part. This checksum is present if the \
         multipart upload request was created with the [SHA1] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "The Base64 encoded, 256-bit [SHA256] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [SHA256] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "The Base64 encoded, 512-bit [SHA512] digest of the part. This checksum is present if the \
         multipart upload request was created with the [SHA512] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [MD5] digest of the part. This checksum is present if the \
         multipart upload request was created with the [MD5] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH64] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH64] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "The Base64 encoded, 64-bit [XXHASH3] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH3] checksum algorithm. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "The Base64 encoded, 128-bit [XXHASH128] checksum of the part. This checksum is present if \
         the multipart upload request was created with the [XXHASH128] checksum algorithm. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  part_number : part_number option;
      [@ocaml.doc
        "Part number that identifies the part. This is a positive integer between 1 and 10,000.\n\n\
        \  {ul\n\
        \        {-   {b General purpose buckets} - In [CompleteMultipartUpload], when a \
         additional checksum (including [x-amz-checksum-crc32], [x-amz-checksum-crc32c], \
         [x-amz-checksum-sha1], or [x-amz-checksum-sha256]) is applied to each part, the \
         [PartNumber] must start at 1 and the part numbers must be consecutive. Otherwise, Amazon \
         S3 generates an HTTP [400 Bad Request] status code and an [InvalidPartOrder] error code.\n\
        \            \n\
        \             }\n\
        \        {-   {b Directory buckets} - In [CompleteMultipartUpload], the [PartNumber] must \
         start at 1 and the part numbers must be consecutive.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
}
[@@ocaml.doc "Details of the parts that were uploaded.\n"]

type nonrec completed_part_list = completed_part list [@@ocaml.doc ""]

type nonrec completed_multipart_upload = {
  parts : completed_part_list option;
      [@ocaml.doc
        "Array of CompletedPart data types.\n\n\
        \ If you do not supply a valid [Part] with your request, the service sends back an HTTP \
         400 response.\n\
        \ "]
}
[@@ocaml.doc "The container for the completed multipart upload details.\n"]

type nonrec complete_multipart_upload_request = {
  bucket : bucket_name;
      [@ocaml.doc
        "Name of the bucket to which the multipart upload was initiated.\n\n\
        \  {b Directory buckets} - When you use this operation with a directory bucket, you must \
         use virtual-hosted-style requests in the format \n\
        \ {[\n\
        \  {i Bucket-name}.s3express-{i zone-id}.{i region-code}.amazonaws.com\n\
        \ ]}\n\
        \ . Path-style requests are not supported. Directory bucket names must be unique in the \
         chosen Zone (Availability Zone or Local Zone). Bucket names must follow the format \n\
        \ {[\n\
        \  {i bucket-base-name}--{i zone-id}--x-s3\n\
        \ ]}\n\
        \  (for example, \n\
        \ {[\n\
        \  {i amzn-s3-demo-bucket}--{i usw2-az1}--x-s3\n\
        \ ]}\n\
        \ ). For information about bucket naming restrictions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html}Directory \
         bucket naming rules} in the {i Amazon S3 User Guide}.\n\
        \ \n\
        \   {b Access points} - When you use this action with an access point for general purpose \
         buckets, you must provide the alias of the access point in place of the bucket name or \
         specify the access point ARN. When you use this action with an access point for directory \
         buckets, you must provide the access point name in place of the bucket name. When using \
         the access point ARN, you must direct requests to the access point hostname. The access \
         point hostname takes the form {i AccessPointName}-{i AccountId}.s3-accesspoint.{i \
         Region}.amazonaws.com. When using this action with an access point through the Amazon Web \
         Services SDKs, you provide the access point ARN in place of the bucket name. For more \
         information about access point ARNs, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html}Using \
         access points} in the {i Amazon S3 User Guide}.\n\
        \  \n\
        \    Object Lambda access points are not supported by directory buckets.\n\
        \    \n\
        \       {b S3 on Outposts} - When you use this action with S3 on Outposts, you must direct \
         requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form \n\
        \      {[\n\
        \       {i AccessPointName}-{i AccountId}.{i outpostID}.s3-outposts.{i Region}.amazonaws.com\n\
        \      ]}\n\
        \      . When you use this action with S3 on Outposts, the destination bucket must be the \
         Outposts access point ARN or the access point alias. For more information about S3 on \
         Outposts, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html}What is S3 on \
         Outposts?} in the {i Amazon S3 User Guide}.\n\
        \      "]
  key : object_key; [@ocaml.doc "Object key for which the multipart upload was initiated.\n"]
  multipart_upload : completed_multipart_upload option;
      [@ocaml.doc "The container for the multipart upload request information.\n"]
  upload_id : multipart_upload_id; [@ocaml.doc "ID for the initiated multipart upload.\n"]
  checksum_cr_c32 : checksum_cr_c32 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 32-bit \
         [CRC32] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc32_c : checksum_crc32_c option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 32-bit \
         [CRC32C] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_crc64nvm_e : checksum_crc64nvm_e option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [CRC64NVME] checksum of the object. The [CRC64NVME] checksum is always a full object \
         checksum. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_sh_a1 : checksum_sh_a1 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 160-bit \
         [SHA1] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a256 : checksum_sh_a256 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 256-bit \
         [SHA256] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity} in the {i Amazon S3 User Guide}.\n"]
  checksum_sh_a512 : checksum_sh_a512 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 512-bit \
         [SHA512] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_m_d5 : checksum_m_d5 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [MD5] digest of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h64 : checksum_xxhas_h64 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH64] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h3 : checksum_xxhas_h3 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 64-bit \
         [XXHASH3] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_xxhas_h128 : checksum_xxhas_h128 option;
      [@ocaml.doc
        "This header can be used as a data integrity check to verify that the data received is the \
         same data that was originally sent. This header specifies the Base64 encoded, 128-bit \
         [XXHASH128] checksum of the object. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html}Checking \
         object integrity in the Amazon S3 User Guide}.\n"]
  checksum_type : checksum_type option;
      [@ocaml.doc
        "This header specifies the checksum type of the object, which determines how part-level \
         checksums are combined to create an object-level checksum for multipart objects. You can \
         use this header as a data integrity check to verify that the checksum type that is \
         received is the same checksum that was specified. If the checksum type doesn\226\128\153t \
         match the checksum type that was specified for the object during the \
         [CreateMultipartUpload] request, it\226\128\153ll result in a [BadDigest] error. For more \
         information, see Checking object integrity in the Amazon S3 User Guide. \n"]
  mpu_object_size : mpu_object_size option;
      [@ocaml.doc
        " The expected total object size of the multipart upload request. If there\226\128\153s a \
         mismatch between the specified object size value and the actual object size value, it \
         results in an [HTTP 400\n\
        \        InvalidRequest] error. \n"]
  request_payer : request_payer option; [@ocaml.doc ""]
  expected_bucket_owner : account_id option;
      [@ocaml.doc
        "The account ID of the expected bucket owner. If the account ID that you provide does not \
         match the actual owner of the bucket, the request fails with the HTTP status code [403 \
         Forbidden] (access denied).\n"]
  if_match : if_match option;
      [@ocaml.doc
        "Uploads the object only if the ETag (entity tag) value provided during the WRITE \
         operation matches the ETag of the object in S3. If the ETag values do not match, the \
         operation returns a [412\n\
        \        Precondition Failed] error.\n\n\
        \ If a conflicting operation occurs during the upload S3 returns a [409\n\
        \        ConditionalRequestConflict] response. On a 409 failure you should fetch the \
         object's ETag, re-initiate the multipart upload with [CreateMultipartUpload], and \
         re-upload each part.\n\
        \ \n\
        \  Expects the ETag value as a string.\n\
        \  \n\
        \   For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html}Conditional \
         requests} in the {i Amazon S3 User Guide}.\n\
        \   "]
  if_none_match : if_none_match option;
      [@ocaml.doc
        "Uploads the object only if the object key name does not already exist in the bucket \
         specified. Otherwise, Amazon S3 returns a [412 Precondition Failed] error.\n\n\
        \ If a conflicting operation occurs during the upload S3 returns a [409\n\
        \        ConditionalRequestConflict] response. On a 409 failure you should re-initiate the \
         multipart upload with [CreateMultipartUpload] and re-upload each part.\n\
        \ \n\
        \  Expects the '*' (asterisk) character.\n\
        \  \n\
        \   For more information about conditional requests, see \
         {{:https://tools.ietf.org/html/rfc7232}RFC 7232}, or \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html}Conditional \
         requests} in the {i Amazon S3 User Guide}.\n\
        \   "]
  sse_customer_algorithm : sse_customer_algorithm option;
      [@ocaml.doc
        "The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is \
         required only when the object was created using a checksum algorithm or if your bucket \
         policy requires the use of SSE-C. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html#ssec-require-condition-key}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key : sse_customer_key option;
      [@ocaml.doc
        "The server-side encryption (SSE) customer managed key. This parameter is needed only when \
         the object was created using a checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
  sse_customer_key_m_d5 : sse_customer_key_m_d5 option;
      [@ocaml.doc
        "The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only \
         when the object was created using a checksum algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html}Protecting \
         data using SSE-C keys} in the {i Amazon S3 User Guide}.\n\n\
        \  This functionality is not supported for directory buckets.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]
